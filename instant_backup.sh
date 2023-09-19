#!/usr/bin/env bash
set -euo pipefail
NOW=$(date +%Y%m%d-%H%M%S)
directory=$(dirname -- $(readlink -fn -- "$0"))
mkdir -p ${directory}/dumps/
docker exec -it vikunja-api sh -c "rm -f /app/vikunja/*.zip"
docker exec -it vikunja-api /app/vikunja/vikunja dump
docker exec -it vikunja-api sh -c "ln -sf /app/vikunja/vikunja-dump_*.zip /app/vikunja/dump.zip"
docker cp -L vikunja-api:/app/vikunja/dump.zip ${directory}/dumps/${NOW}.zip
