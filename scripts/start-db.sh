#!/bin/bash

# script to start a development postgres container with the correct volume

# Exit on error
set -e

SCRIPT_PATH="$(realpath "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
APP_DIR="$(dirname "$SCRIPT_DIR")"
CONTAINER_NAME="$(basename "$APP_DIR")-db"

echo "Starting PostgreSQL container: $CONTAINER_NAME"

PODMAN=$(which podman)
DOCKER=$(which docker)

if [ -z "$PODMAN" ];
then
    # No podman, try docker
    if [ -z "$DOCKER" ];
    then
        # No docker or podman, exit
        printf "No container manager found, please install podman or docker\n"
        exit 1
    fi
    MANAGER="${DOCKER}"
    PARAMS=""
else
    MANAGER="${PODMAN}"
    PARAMS="--replace --userns keep-id"
fi

mkdir -p "$APP_DIR/database"

exec $MANAGER run ${PARAMS} --rm --name "$CONTAINER_NAME" -p 26099:5432 --env POSTGRES_USER=postgres --env POSTGRES_PASSWORD=devpostgres -e POSTGRES_DB=db --volume "$APP_DIR/database:/var/lib/postgresql/data:Z" postgres:17.6-trixie
