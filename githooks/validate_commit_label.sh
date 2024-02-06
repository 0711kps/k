#!/bin/bash

START_LINE_MSG="$1"

for allowLabel in $(cat githooks/commit_labels)
do
  [[ $START_LINE_MSG =~ "${allowLabel}: " ]] && exit 0
done

echo 'a legal commit should be like "feature: made a hamburger"'
echo 'see `githooks/commit_labels` for all allowed commit labels'
echo
exit 1
