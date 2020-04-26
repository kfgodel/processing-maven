#!/bin/bash

SCRIPT_DIR="`dirname "$0"`"
source "${SCRIPT_DIR}/latest-version.sh"

echo "Downloading latest version: ${VERSION}"
wget https://download.processing.org/processing-${VERSION}-windows64.zip -O tmp/windows64.zip

echo "Extracting libraries"
unzip -j tmp/windows64.zip "processing-${VERSION}/core/library/*" -d tmp/libraries
