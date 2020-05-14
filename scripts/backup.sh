#!/bin/ash

#vars
DATETIME=$(date +%d-%m-%Y.%H-%M-%S)
PATH=$(pwd)/backups/${DATETIME}
# Create backup dir
mkdir -p ${PATH}

# Add db dump to backup dir
mongodump --host db -u ${MONGO_INITDB_ROOT_USERNAME} -p ${MONGO_INITDB_ROOT_PASSWORD} -o ${PATH}/db-backup-${DATETIME}


# Add uploads data to backup dir
mkdir -p ${PATH}/uploads-backup-${DATETIME}
cp /mnt/backend-uploads/* ${PATH}/uploads-backup-${DATETIME}/


# Archivate backup dir and delete original dir
tar -zcvf $(pwd)/backups/backup-${DATETIME}.tar.gz ${PATH}
rm -r ${PATH}

# Send archive to backups
