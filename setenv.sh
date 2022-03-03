#!/usr/bin/env bash

values=$(cat $1)

while read -rd $'' line
do
    echo "$line" >> $GITHUB_ENV
done < <(jq -r <<<"$values" \
         'to_entries|map("\(.key)=\(.value)\u0000")[]')