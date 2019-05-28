#!/usr/bin/env bash

# Read input variables
ENV=$1
SET_NAME=$2

# Execute tests via apimation
./apimation run set -ae "$ENV" "$SET_NAME"
echo $? > .test_status
# echo $(cat .test_status)

# Send notification based on status
echo "Sending notification to discord.."
bash send_notification.sh "$ENV" "$SET_NAME" $(cat .test_status)
exit $(cat .test_status)
