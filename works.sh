tag=$1
docker buildx build . --platform linux/arm64 --tag docker.io/jpsevigny/jptest:$tag-arm64 --push
docker buildx build . --platform linux/amd64 --tag docker.io/jpsevigny/jptest:$tag-amd64 --push
DOCKER_CLI_EXPERIMENTAL=enabled  docker manifest create jpsevigny/jptest:$tag --amend jpsevigny/jptest:$tag-arm64 --amend jpsevigny/jptest:$tag-amd64

echo "skipping rest"
exit 0
docker manifest push jpsevigny/jptest:$tag
export DOCKER_CONTENT_TRUST=0
docker pull  jpsevigny/jptest:$tag
docker trust sign jpsevigny/jptest:$tag
docker manifest push jpsevigny/jptest:$tag
docker pull  jpsevigny/jptest:$tag
docker trust inspect --pretty jpsevigny/jptest:$tag
