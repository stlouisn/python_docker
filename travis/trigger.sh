#!/usr/bin/env bash

set -euo pipefail

# Builds to trigger for python 2
if [[ ${DOCKER_TAG} == "2" ]] then
  exit 0
fi

# Builds to trigger for python 3
if [[ ${DOCKER_TAG} == "3" ]] then
  builds="beets_docker home-assistant_docker"
fi

body='{
"request": {
"message": "Push from stlouisn/ubuntu",
"branch": "master"
}}'

for build in $builds
do

  # Trigger build
  curl -s -X POST \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -H "Travis-API-Version: 3" \
    -H "Authorization: token ${TRAVIS_API_TOKEN}" \
    -d "$body" \
    https://api.travis-ci.org/repo/${DOCKER_MAINTAINER}%2F$build/requests

done
