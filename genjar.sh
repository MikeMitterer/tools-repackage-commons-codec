#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Versieht die Apache-Commons-Codec mit einem "android" Prefix
#
# Das generierte JAR wird immer im libs-Folder abgespeichert
#

# give you the full directory name of the script no matter where it is being called from.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#REPO="/Volumes/programming/Maven/private.flat.repository"
#REPO="/srv/repo/Maven/private.flat.repository"

#
# Ab 3.1.2018
# Die generierten Files müssen einzeln bei Artifactory deploeyd werden
# Siehe screenshot: artifactory.png
#
REPO="/tmp/private.flat.repository"

# Lokal zu testen
# REPO="${DIR}/../libs"

BASEVERSION="1.10"
VERSION="${BASEVERSION}-repa"

ARTIFACT="commons-codec"
GROUP="repackaged.for.android"

JAR_FILE_TARGET="${ARTIFACT}-${VERSION}"
JAR_FILE_SRC="${ARTIFACT}-${BASEVERSION}"

METADATA="metadata/maven-metadata.xml"
POMFILE="metadata/${ARTIFACT}-${VERSION}.pom"

GROUP_FOLDER="${REPO}/repackaged/for/android/${ARTIFACT}"

mkdir -p "${GROUP_FOLDER}"
mkdir -p "${GROUP_FOLDER}/${VERSION}"

cp -f "${DIR}/${METADATA}" "${GROUP_FOLDER}"
cp -f "${DIR}/${POMFILE}" "${GROUP_FOLDER}/${VERSION}"

java -jar "${DIR}/jarjar-1.4.jar" process "${DIR}/${ARTIFACT}.rules" "${DIR}/baselibs/${JAR_FILE_SRC}.jar" "${GROUP_FOLDER}/${VERSION}/${JAR_FILE_TARGET}.jar"