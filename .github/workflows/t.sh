

REGISTRY="docker.io"
TAGS_JSON="docker.io/jpsevigny/jptest:5.180.0"


TAGS_JSON=$(echo $TAGS_JSON | tr '\n' ' ' |  awk -F':' '{print $2}')
echo $TAGS_JSON
