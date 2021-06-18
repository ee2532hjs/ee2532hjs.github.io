#!/usr/bin/env bash

# # http://stackoverflow.com/a/750191
# # After that, it might be necessary to `git push --force`.

git filter-branch -f --env-filter "
    GIT_AUTHOR_NAME='Hsuan-Jung Su'
    GIT_AUTHOR_EMAIL='d.corydaline@gmail.com'
    GIT_COMMITTER_NAME='Hsuan-Jung Su'
    GIT_COMMITTER_EMAIL='d.corydaline@gmail.com'
  " HEAD
