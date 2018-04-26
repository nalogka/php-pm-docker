#!/usr/bin/env bash

PPM_VERSION=1.0.2
docker build --pull -f Dockerfile.prod -t "docker.nalogka.com/php-pm:prod" \
        --build-arg "version=$PPM_VERSION" \
        --build-arg "NALOGKA_OWNER=${NALOGKA_OWNER:-1000}" \
        --build-arg "NALOGKA_PPM_PORT=${NALOGKA_PPM_PORT:-8080}" \
        --build-arg "NALOGKA_STATIC_DIR=${NALOGKA_STATIC_DIR:-public}" \
    .

docker push "docker.nalogka.com/php-pm:prod"

docker build -f Dockerfile.dev -t "docker.nalogka.com/php-pm:dev" \
    .

docker push  "docker.nalogka.com/php-pm:dev"
