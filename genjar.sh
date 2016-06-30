#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Versieht die Apache-Commons-Codec mit einem "android" Prefix
#
# Das generierte JAR wird immer im libs-Folder abgespeichert
#

# give you the full directory name of the script no matter where it is being called from.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

REPO="/Volumes/programming/Maven/private.flat.repository"

# Lokal zu testen
# REPO="${DIR}/../libs"

VERSION="1.10"
ARTIFACT="commons-codec"
GROUP="repackaged.for.android"

JAR_FILE="commons-codec-${VERSION}"
METADATA="metadata/maven-metadata.xml"
POMFILE="metadata/commons-codec-${VERSION}.pom"

GROUP_FOLDER="${REPO}/repackaged/for/android/${ARTIFACT}"

mkdir -p "${GROUP_FOLDER}"
mkdir -p "${GROUP_FOLDER}/${VERSION}"

cp -f "${DIR}/${METADATA}" "${GROUP_FOLDER}"
cp -f "${DIR}/${POMFILE}" "${GROUP_FOLDER}/${VERSION}"

java -jar "${DIR}/jarjar-1.4.jar" process "${DIR}/commons-codec.rules" "${DIR}/baselibs/${JAR_FILE}.jar" "${GROUP_FOLDER}/${VERSION}/${JAR_FILE}.jar"