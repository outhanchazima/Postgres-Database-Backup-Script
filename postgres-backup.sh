#!/bin/bash
#
# Author: Outhan Chazima 
# Date : 26-May-2022
# Description : The backup script will complete the backup and send the backup to a remote server.-
#

## In below given variables - require information to be feed by system admin##.

_BACKUP_DIR=/home/DBbackup/postgres
_DATABASE_NAME=postgres

# This requires you to have configyres the remote server ssh keys to be able to connect to remote server
_REMOTE_BACKUP_SERVER_ADDRESS=user@remote_server_ip


## Do not edit below given variable ##

_DATE_SCHEMA=$(date +%F-%H%M-%S)
_BACKUP_FILE=postgres-backup-$_DATE_SCHEMA.tar.gz
_BACKUP_PATH=$_BACKUP_DIR

###### Create / check backup Directory ####

if [ -d  "$_BACKUP_PATH" ]
then
echo "$_BACKUP_PATH already exist"
else
mkdir -p "$_BACKUP_PATH"
fi


##################### SECTION 1 : SCHEMA BACKUP ############################################ 
pg_dump $_DATABASE_NAME | gzip > $_BACKUP_PATH/$_BACKUP_FILE

##################### END OF LINE ---- SECTION 1 : SCHEMA BACKUP #####################

scp $_BACKUP_PATH/$_BACKUP_FILE $_REMOTE_BACKUP_SERVER_ADDRESS:$_BACKUP_DIR;

done%           
