#!/usr/bin/env bash

# Read input variables
ENV=$1
COMPONENT=$2
STATUS=$3

# Default message
MESSAGE=""$COMPONENT" (api-tests) failed on "$ENV" :no_entry:"
if [ $STATUS = 0 ]; then
    MESSAGE=""$COMPONENT" (api-tests) passed on "$ENV" :white_check_mark:"
fi

# Send notification
curl -X POST \
  https://discordapp.com/api/webhooks/*/* \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  -d '{
	"content":"'"$MESSAGE"'"
}'
