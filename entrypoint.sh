#!/bin/sh
CONTENT_TYPE="application/vnd.docker.distribution.manifest.list.v2+json"
TOKEN="$(curl -s -u ${INPUT_USERNAME}:${INPUT_PASSWORD} "https://auth.docker.io/token?service=registry.docker.io&scope=repository:${INPUT_REPO}:pull,push" | jq --raw-output .token)"
curl -s -H "Accept: ${CONTENT_TYPE}" -H "Authorization: Bearer ${TOKEN}" "https://index.docker.io/v2/${INPUT_REPO}/manifests/${INPUT_OLD_TAG}" > manifest.json
curl -X PUT -H "Content-Type: $CONTENT_TYPE" -H "Authorization: Bearer $TOKEN" -d @manifest.json "https://index.docker.io/v2/${INPUT_REPO}/manifests/${INPUT_NEW_TAG}"
