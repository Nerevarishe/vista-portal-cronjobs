#!/bin/ash

#vars
DATETIME=$(date +%d-%m-%Y.%H-%M-%S)

# Create backup dir
mkdir -p ./backups/$DATETIME
