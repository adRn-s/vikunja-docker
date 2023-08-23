#!/usr/bin/env bash
set -euo pipefail
directory=$(dirname -- $(readlink -fn -- "$0"))
NOW=$(date +%Y%m%d-%H%M%S)
find $directory -name '*.sqldump' -ctime +7 -delete
docker exec vikunja-db pg_dump -Fc postgres -U vikunja -f sqldump
docker cp vikunja-db:/sqldump $directory/$NOW.sqldump
ln -sf $directory/$NOW.sqldump $directory/latest.sqldump
