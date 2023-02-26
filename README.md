nano backup_script.sh
MongoDB Backup and Deletion Scripts with Cron
Introduction
This guide provides instructions on how to create MongoDB backup and deletion scripts and schedule them to run automatically using Cron. These scripts will help you regularly backup your MongoDB database and delete older backups, freeing up disk space.

Prerequisites
Before starting, you should have the following:

A MongoDB database set up and running
The mongosh shell installed on your machine
Basic knowledge of the Linux command line
Steps
Connect to your MongoDB database using the mongosh shell:

mongosh "mongodb://<username>:<password>@<hostname>:<port>/<database>"


eplace <username>, <password>, <hostname>, <port>, and <database> with the appropriate values for your MongoDB database.

Create a new backup script file using nano:
nano backup_script.sh


Add the following lines to the backup script file:
#!/bin/bash
# Define the directory where you want to store the backups
BACKUP_DIR=/path/to/backups/
# Define the name for the backup file (use the date and time)
BACKUP_FILE="$BACKUP_DIR/$(date +%Y%m%d-%H%M%S).bson"
# Use mongodump to create a backup of your database
mongodump --out $BACKUP_FILE
echo "$(date) - Backup completed" >> /path/to/backup.log

Replace /path/to/backups/ with the actual path to the directory where your backups are stored.

Save the backup deletion script file and exit nano.

Make the backup deletion script file executable with the following command:

chmod +x delete_old_backups.sh

Test the backup deletion script by running it manually with the following command:
./delete_old_backups.sh

crontab -e

Add the following lines to the crontab file:
0 20 * * * /path/to/backup_script.sh
0 22 * * * /path/to/backup_script.sh
0 2 * * * /path/to/backup_script.sh
0 4 * * * /path/to/backup_script.sh
0 0 */6 * * /path/to/delete_old_backups.sh

Replace /path/to/backup_script.sh and `/path/to/delete










