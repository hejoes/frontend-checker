#!/bin/bash

SITES=(
  "delfi.ee"
  "postimees.ee"
)

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # no color

check_site() {
  local site=$1
  local response

  # get status code for current site
  response=$(curl -s -L -o /dev/null -w "%{http_code}" "https://$site")

  # get current time
  timestamp=$(date '+%Y-%m-%d %H:%M:%S')

  if [ "$response" -lt "400" ]; then
    echo -e "$timestamp - [INFO] - response_code: ${GREEN}$response${NC} - $site"
    echo "$timestamp - [INFO] - response_code: $response - $site" >>"frontend-checker-$(date '+%Y%m%d').log"
  else
    echo -e "$timestamp - [ERROR] - response_code: ${RED}$response${NC} - $site"
    echo "$timestamp - [ERROR] - response_code: $response - $site" >>"frontend-checker-$(date '+%Y%m%d').log"
  fi
}

while true; do
  for site in "${SITES[@]}"; do
    check_site "$site" &
  done
  wait
  sleep 1
done
