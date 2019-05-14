#!/bin/sh

# check to see if needed env vars have been passed
if [ -z "${OWNCLOUD_URL}" ]
then
  echo "Missing OWNCLOUD_URL"
  exit 1
fi

if [ -z "${USERNAME}" ]
then
  echo "Missing USERNAME"
  exit 1
fi

if [ -z "${PASSWORD}" ]
then
  echo "Missing PASSWORDL"
  exit 1
fi

# make sure we have a bind mounted directory to sync to
if [ ! -d "/data" ]
then
  echo "/data directory not found; make sure you bind mount the destination"
  exit 1
fi

# execute owncloud sync
exec owncloudcmd -u "${USERNAME}" -p "${PASSWORD}" --non-interactive /data "${OWNCLOUD_URL}"