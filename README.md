# Mongo-DB-backups


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

php
Copy code
mongosh "mongodb://<username>:<password>@<hostname>:<port>/<database>"
Replace <username>, <password>, <hostname>, <port>, and <database> with the appropriate values for your MongoDB database.

Create a new backup script file using nano:

Copy code
nano backup_script.sh
Add the following lines to the backup script file:

bash
Copy code
#!/bin/bash
# Define the directory where you want to store the backups
BACKUP_DIR=/path/to/backups/
# Define the name for the backup file (use the date and time)
BACKUP_FILE="$BACKUP_DIR/$(date +%Y%m%d-%H%M%S).bson"
# Use mongodump to create a backup of your database
mongodump --out $BACKUP_FILE
echo "$(date) - Backup completed" >> /path/to/backup.log
Replace /path/to/backups/ with the actual path to the directory where you want to store your backups.

Save the backup script file and exit nano.

Make the backup script file executable with the following command:

bash
Copy code
chmod +x backup_script.sh
Test the backup script by running it manually with the following command:

bash
Copy code
./backup_script.sh
Create a new backup deletion script file using nano:

Copy code
nano delete_old_backups.sh
Add the following lines to the backup deletion script file:

bash
Copy code
#!/bin/bash
# Define the directory where your backups are stored
BACKUP_DIR=/path/to/backups/
# Delete backups older than 6 days
find $BACKUP_DIR -type f -name "*.bson" -mtime +6 -delete
echo "$(date) - Backup deletion completed" >> /path/to/backup-deletion.log
Replace /path/to/backups/ with the actual path to the directory where your backups are stored.

Save the backup deletion script file and exit nano.

Make the backup deletion script file executable with the following command:

bash
Copy code
chmod +x delete_old_backups.sh
Test the backup deletion script by running it manually with the following command:

bash
Copy code
./delete_old_backups.sh
This should delete all backups in the specified directory that are older than 6 days.

Open the crontab file with the following command:

Copy code
crontab -e
Add the following lines to the crontab file:

javascript
Copy code
0 20 * * * /path/to/backup_script.sh
0 22 * * * /path/to/backup_script.sh
0 2 * * * /path/to/backup_script.sh
0 4 * * * /path/to/backup_script.sh
0 0 */6 * * /path/to/delete_old_backups.sh
Replace /path/to/backup_script.sh and `/path/to/delete