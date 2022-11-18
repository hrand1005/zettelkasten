#!/bin/bash

readonly outfile='TITLE.md'
rm $outfile

parse_title () {
  line=$(sed -n '/|---|---|/{ n; p }' $1)
  IFS='|'
  read -ra arr <<< "$line"
  parsed=${arr[1]}
  echo ${parsed:1:-1}
}

echo $'## By Title\n' >> $outfile
for FILE in zettels/*; do
  title=$(parse_title $FILE)
  line='- ['$title']('$FILE')'
  echo "$line" >> $outfile
done
