#!/bin/bash

set -e

sudo rm -rf node_modules/
sudo rm -rf build/
docker-compose pull
docker-compose down --volumes
export COMPOSE_INTERACTIVE_NO_CLI=1
docker-compose run --entrypoint /dev-ui/build.sh eswatini-ui
docker-compose build image
docker-compose down --volumes
sudo rm -rf node_modules/
