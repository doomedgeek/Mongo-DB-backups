#!/bin/bash

# Define the directory where you want to store the backups
BACKUP_DIR=/path/to/backups/
# Define the name for the backup file (use the date and time)
BACKUP_FILE="$BACKUP_DIR/$(date +%Y%m%d-%H%M%S).bson"
# Use mongodump to create a backup of your database
mongodump --out $BACKUP_FILE
echo "$(date) - Backup completed" >> /path/to/backup.log