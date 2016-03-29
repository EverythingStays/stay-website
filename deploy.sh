#! /bin/sh
set -e

PUBLIC_FOLDER=.
DOMAIN=everythingstays.com
RECORD=@

if git diff-index --quiet HEAD --; then
  HASH=$(ipfs add -r $PUBLIC_FOLDER | tail -n 1 | cut -d ' ' -f 2)
  ADDRESS=/ipfs/$HASH

  echo "Deploying $ADDRESS"
  dnslink-deploy -d $DOMAIN -r $RECORD -p $ADDRESS

  echo ""
  echo "## Deployed $ADDRESS to $DOMAIN"
  echo ""
else
  echo "GIT Repository is dirty, please commit any changed files"
fi
