#!/bin/sh

GIT_URL=$1
BASE_PATH=$2

LOCAL_DIR=$(pwd)

echo Changing directory to $BASE_PATH
cd $BASE_PATH

echo Cloninng repo $GIT_URL
git clone $1

cd $LOCAL_DIR

source ./GitService.sh

CRON_STRING="*/10       *       *       *       *  $BASE_PATH/GitService.sh $1 $2"

echo $CRON_STRING > /etc/cron.d/GitServiceSchedule.cron
