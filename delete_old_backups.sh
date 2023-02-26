#!/bin/bash
#Define the directory where your backups are stored
BACKUP_DIR=/path/to/backups/
#Delete backups older than 6 days
find $BACKUP_DIR -type f -name "*.bson" -mtime +6 -delete
echo "$(date) - Backup deletion completed" >> /path/to/backup-deletion.log