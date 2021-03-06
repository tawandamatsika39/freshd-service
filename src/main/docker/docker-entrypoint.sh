#!/bin/sh
set -e
java $JAVA_OPTS -DDB_HOST=$DB_HOST -DDB_PORT=$DB_PORT -jar /freshd-service.jar db migrate application.yml

if [ ! $? -ne 0 ]; then
  exec java $JAVA_OPTS -DDB_HOST=$DB_HOST -DDB_PORT=$DB_PORT -jar /freshd-service.jar server application.yml
fi

exec "$@"