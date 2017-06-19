#!/bin/sh
#
# Automatically adds branch name for commit message
# to the beginning of the line. Result is:
# <branch_name>: <commit_msg>#

BRANCH_NAME=$(git symbolic-ref --short HEAD)

if [ -n "$BRANCH_NAME" ] &&
    [ "$BRANCH_NAME" != "master" ] &&
    [ "$BRANCH_NAME" != "dev" ];
then
    sed -i.bak -e "1s/^/$BRANCH_NAME: /" $1
fi