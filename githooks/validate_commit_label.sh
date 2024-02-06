#!/bin/bash

START_LINE_MSG="$1"

for allowLabel in $(cat githooks/commit_labels)
do
  [[ $START_LINE_MSG =~ "${allowLabel}: " ]] && exit 0
done

echo 'a legal commit should be like "feature: made a hamburger"'
echo 'available labels:'
echo "  $(cat githooks/commit_labels | tr "\n" ' ')"

exit 1
