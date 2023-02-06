#!/bin/bash

docker build -t github-tag-action:test .

docker run -it --rm -v /Users/brandonevans/repos:/github/workspace \
 -e GITHUB_WORKSPACE=/github/workspace \
 -e SOURCE=tf-modules \
 -e RELEASE_BRANCHES='main,master' \
 -e DEFAULT_BUMP='patch' \
 -e TAG_CONTEXT='branch' \
 -e WITH_V=false \
 -e DRY_RUN=true \
 -e VERBOSE=false \
 --name github-tag-action \
 --entrypoint=/bin/bash github-tag-action:test