#!/bin/bash

# for a branded version you should pass the following env variables:
# DOCKERHUB_ORGANISATION - your dockerhub organisation
# OCELOT_VERSION - specify the specific tag to build upon e.g. 2.4.0-300
# DOCKERHUB_USERNAME - your dockerhub username
# DOCKERHUB_TOKEN - your dockerhub access token

# base setup
SCRIPT_PATH=$(realpath $0)
SCRIPT_DIR=$(dirname $SCRIPT_PATH)

# check DOCKERHUB_BRAND_VARRIANT
if [ -z ${DOCKERHUB_BRAND_VARRIANT} ]; then
  echo "You must provide a `DOCKERHUB_BRAND_VARRIANT` via environment variable"
  exit 1
fi
echo "Using DOCKERHUB_BRAND_VARRIANT=${DOCKERHUB_BRAND_VARRIANT}"

# configuration
DOCKERHUB_ORGANISATION=${DOCKERHUB_ORGANISATION:-"blatiena"}
OCELOT_VERSION=${OCELOT_VERSION:-$(node -p -e "require('${SCRIPT_DIR}/../../package.json').version")}
OCELOT_GITHUB_RUN_NUMBER=${OCELOT_GITHUB_RUN_NUMBER:-master}
OCELOT_VERSION_BUILD=${OCELOT_VERSION_BUILD:-${OCELOT_VERSION}-${OCELOT_GITHUB_RUN_NUMBER}}
BRANDED_VERSION=${BRANDED_VERSION:-${GITHUB_RUN_NUMBER:-"local"}}
BUILD_VERSION_BASE=${BRANDED_VERSION}-ocelot.social${OCELOT_VERSION}
BUILD_VERSION=${BRANDED_VERSION}-ocelot.social${OCELOT_VERSION_BUILD}

# login to dockerhub
echo "${DOCKERHUB_TOKEN}" | docker login -u "${DOCKERHUB_USERNAME}" --password-stdin

# push backend images
docker push ${DOCKERHUB_ORGANISATION}/backend-${DOCKERHUB_BRAND_VARRIANT}:latest
docker push ${DOCKERHUB_ORGANISATION}/backend-${DOCKERHUB_BRAND_VARRIANT}:${OCELOT_VERSION}
docker push ${DOCKERHUB_ORGANISATION}/backend-${DOCKERHUB_BRAND_VARRIANT}:${OCELOT_VERSION_BUILD}
docker push ${DOCKERHUB_ORGANISATION}/backend-${DOCKERHUB_BRAND_VARRIANT}:${BUILD_VERSION_BASE}
docker push ${DOCKERHUB_ORGANISATION}/backend-${DOCKERHUB_BRAND_VARRIANT}:${BUILD_VERSION}

# push webapp images
docker push ${DOCKERHUB_ORGANISATION}/webapp-${DOCKERHUB_BRAND_VARRIANT}:latest
docker push ${DOCKERHUB_ORGANISATION}/webapp-${DOCKERHUB_BRAND_VARRIANT}:${OCELOT_VERSION}
docker push ${DOCKERHUB_ORGANISATION}/webapp-${DOCKERHUB_BRAND_VARRIANT}:${OCELOT_VERSION_BUILD}
docker push ${DOCKERHUB_ORGANISATION}/webapp-${DOCKERHUB_BRAND_VARRIANT}:${BUILD_VERSION_BASE}
docker push ${DOCKERHUB_ORGANISATION}/webapp-${DOCKERHUB_BRAND_VARRIANT}:${BUILD_VERSION}

# push maintenance images
docker push ${DOCKERHUB_ORGANISATION}/maintenance-${DOCKERHUB_BRAND_VARRIANT}:latest
docker push ${DOCKERHUB_ORGANISATION}/maintenance-${DOCKERHUB_BRAND_VARRIANT}:${OCELOT_VERSION}
docker push ${DOCKERHUB_ORGANISATION}/maintenance-${DOCKERHUB_BRAND_VARRIANT}:${OCELOT_VERSION_BUILD}
docker push ${DOCKERHUB_ORGANISATION}/maintenance-${DOCKERHUB_BRAND_VARRIANT}:${BUILD_VERSION_BASE}
docker push ${DOCKERHUB_ORGANISATION}/maintenance-${DOCKERHUB_BRAND_VARRIANT}:${BUILD_VERSION}