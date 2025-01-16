#!/usr/bin/env bash

SCRIPTPATH=$(realpath -s "$0")
SCRIPTPATH=${SCRIPTPATH%/*}
for file in $@; do
	latexindent -wd  -s -r -l="$SCRIPTPATH/source.yaml" "$file"
	latexindent -r -s -wd -l="$SCRIPTPATH/doc.yaml" "$file"
	#git diff --quiet tex/tuda-ci.dtx || echo "file $file was changed"
done

git diff --quiet $@ || exit 1