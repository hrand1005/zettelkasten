#!/bin/bash

USAGE=$(cat <<-END
Incorrect number of args. 

  Usage:
    ./new.sh <title>
END
)

if [ "$#" -ne 1 ]; then
  echo "$USAGE"
  exit 64
fi

TITLE=$1
NEW_ZETTLE=zettels/$(date +%s).md

TIMESTAMP=$(cat <<-END
| title | date |
|---|---|
| $TITLE | $(date +%m/%d/%Y) $(date +%H:%M) |
END
)

echo "$TIMESTAMP" >> $NEW_ZETTLE

echo "${NEW_ZETTLE} created."
