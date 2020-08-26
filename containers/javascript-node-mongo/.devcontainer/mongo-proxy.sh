#!/bin/bash

cat << EOF

Running this **optional** command makes MongoDB available at localhost:27017.

Good news! Unless you want to forward the MongoDB port to your local machine using
VS Code, you do not need to run it! Once connected to this container, you'll find
MongoDB is already running at:

    Host: mongo
    Port: 27017

Add this host/port to your application or when calling a MongoDB tool. e.g.:

    mongotop --host=mongo --port=27017

You can edit **.devcontainer/docker-compose.yaml** to change startup options.
More info available at MongoDB's DockerHub page: https://hub.docker.com/_/mongo

EOF

if ! pidof socat > /dev/null 2>&1; then
    (socat TCP-LISTEN:27017,fork,reuseaddr TCP:mongo:27017 > /tmp/socat.log 2>&1) &
fi

exec "$@"
