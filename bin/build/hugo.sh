#!/usr/bin/env bash

REQUIRED_TOOLS=(
    hugo
    npm
)

for TOOL in "${REQUIRED_TOOLS[@]}"; do
    if ! command -v "${TOOL}" >/dev/null; then
        echo "${TOOL} is required... "
        exit 1
    fi
done

FILE=.env
if [ -f "$FILE" ]; then
    set -a
    # shellcheck source=/dev/null
    source "${FILE}"
    set +a
fi

BASE_URL_PARAM=""
if [ -n "${1}" ]; then
    BASE_URL_PARAM="-b=${1}"
fi

# cleanup hugo logging
npm run clean:hugo

# update modules
hugo mod get -u ./...

# starting hugo server
hugo \
    --minify \
    --printI18nWarnings \
    --templateMetrics \
    --templateMetricsHints \
    --printPathWarnings \
    --cleanDestinationDir \
    --enableGitInfo \
    --log=true \
    --logFile hugo.log \
    --verbose \
    --verboseLog \
    "${BASE_URL_PARAM}"
