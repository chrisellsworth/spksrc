#!/bin/bash

make setup-synocommunity
sed -i -e "s|#PARALLEL_MAKE=.*|PARALLEL_MAKE=4|" \
    -e "s|PUBLISH_API_KEY=.*|PUBLISH_API_KEY=$API_KEY|" \
    local.mk

# PACKAGE=$(echo "refs/tags/dnscrypt-proxy-2.0.42" | grep -oE "([0-9a-zA-Z]*-)*")
GH_PACKAGE=$(echo "$GITHUB_REF" | grep -oE "([0-9a-zA-Z]*-)*")
GH_PACKAGE="${GH_PACKAGE:0:-1}"
echo "$GH_PACKAGE"

cd spk/"$GH_PACKAGE" && make "$GH_ARCH"
