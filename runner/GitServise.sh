#!/bin/sh

#GIT_URL="https://github.com/damintsew/health.git"
#BASE_PATH="/home/ec2-user/health"

GIT_URL=$1
BASE_PATH=$2

source ./ProgrammRestartService.sh

echo Configured GIT_URL=$GIT_URL
echo Configured BASE_PATH=$BASE_PATH

cd $BASE_PATH

git remote update

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
    #todo remove
	RestartApplication
	

elif [ $LOCAL = $BASE ]; then
    echo "Need to pull"
    git pull
    RestartApplication

elif [ $REMOTE = $BASE ]; then
    echo "Need to push"
else
    echo "Diverged"
fi
