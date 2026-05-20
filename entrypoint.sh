#!/bin/bash
set -e

echo "=== Checking files ==="
ls /staging/ || echo "No files in /staging"

LISTEN_PORT=${PORT:-3030}
echo "=== Starting Fuseki on port $LISTEN_PORT ==="

exec java ${JVM_ARGS:--Xmx512m} \
    -jar /fuseki/fuseki-server.jar \
    --config=/fuseki/configuration/dataset_hadits.ttl \
    --port=$LISTEN_PORT
