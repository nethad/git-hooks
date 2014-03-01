#!/usr/bin/env sh

# A pre-commit hook which checks all staged files for occurances of
# a specific keyword. All matches will be printed to STDOUT with line numbers.

MATCH_LINE_COUNT=`git diff-index --cached --name-only HEAD | xargs grep -c "$1"`

if [ $MATCH_LINE_COUNT -gt 0 ]
then
	git diff-index --cached --name-only HEAD | xargs grep -Hn "$1"
	echo "[pre-commit] You have at least 1 file with '$1' in it. Please remove it."
	exit 1
fi