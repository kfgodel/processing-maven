#!/bin/bash

SCRIPT_DIR="`dirname "$0"`"
source "${SCRIPT_DIR}/latest-version.sh"

installArtifact () {
  local JAR_FILE="tmp/libraries/$1.jar"
  local POM_FILE="tmp/libraries/$1.xml"
  if [ -z "$2" ]; then
      local CLASSIFIER=""
  else
      local CLASSIFIER="$2"
      local JAR_FILE="tmp/libraries/$1-$2.jar"
  fi

  echo "Installing artifact ${JAR_FILE}"
  mvn install:install-file -Dfile=${JAR_FILE} -DpomFile=${POM_FILE} -Dclassifier=${CLASSIFIER}
}

installNative() {
    installArtifact "gluegen-rt" "natives-$1-$2"
    installArtifact "jogl-all" "natives-$1-$2"
}


installNative "macosx" "universal"

for ARCH in aarch64 amd64 armv6hf i586
do
  installNative "linux" "${ARCH}"
done

for ARCH in amd64 i586
do
  installNative "windows" "${ARCH}"
done

installArtifact "core"
installArtifact "gluegen-rt"
installArtifact "jogl-all"
