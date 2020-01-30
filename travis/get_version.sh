#!/usr/bin/env bash

set -euo pipefail

# Output python version from ubuntu:rolling repository
echo "$(curl -fsSL --retry 5 --retry-delay 2 https://packages.ubuntu.com/${OS_CODENAME}/python3 | grep 'Package:' | awk -F '(' {'print $2'} | cut -d \- -f 1)"
