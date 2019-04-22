#!/usr/bin/env bash

set -euo pipefail

# Builds to trigger
builds="beets_docker home-assistant_docker"

# Commit Message
body='{
"request": {
"message": "Push from stlouisn/python",
"branch": "master"
}}'

for build in $builds; do

  # Trigger build
  curl -s -X POST \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -H "Travis-API-Version: 3" \
    -H "Authorization: token ${TRAVIS_API_TOKEN}" \
    -d "$body" \
    https://api.travis-ci.org/repo/${DOCKER_MAINTAINER}%2F$build/requests

done
