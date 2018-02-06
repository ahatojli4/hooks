#!/bin/sh
#
# Automatically adds last part of branch name for commit message
# to the beginning of the line. Result is:
# <branch_name>: <commit_msg>#

#BRANCH_NAME=$(git symbolic-ref --short HEAD)
BRANCH_NAME=$(git symbolic-ref --short HEAD | rev | cut -d'_' -f1 | rev)
COMMIT_MSG=$(head -n 1 $1)

if [ -n "$BRANCH_NAME" ] &&
    [ "$BRANCH_NAME" != "master" ] &&
    [ "$BRANCH_NAME" != "dev" ] &&
    [[ ${COMMIT_MSG} != ${BRANCH_NAME}* ]] &&
    [[ ${COMMIT_MSG} != "Revert \"${BRANCH_NAME}: "* ]];
then
    sed -i.bak -e "1s/^/$BRANCH_NAME: /" $1
fi