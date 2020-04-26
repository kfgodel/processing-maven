#!/bin/bash

SCRIPT_DIR="`dirname "$0"`"
source "${SCRIPT_DIR}/latest-version.sh"

createPom () {
  local POM_FILE="tmp/libraries/$1.xml"

  echo "Creating pom on ${POM_FILE}"

  \cp poms/template.xml "${POM_FILE}"
  sed -i "s/artifactid-placeholder/$1/g" "${POM_FILE}"
  sed -i "s/versionid-placeholder/${VERSION}/g" "${POM_FILE}"
}


createPom "core"
createPom "gluegen-rt"
createPom "jogl-all"