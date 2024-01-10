#!/bin/bash

readonly outfile='TITLE.md'
rm $outfile

echo $'## By Title\n' >> $outfile
for FILE in zettels/*; do
    title=$(cat $FILE | head -n3 | tail -n1 | cut -d "|" -f 2 | xargs)
    echo "- [$title]($FILE)" >> $outfile
done
