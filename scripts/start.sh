#!/bin/ash

# Set cron works
echo 'Adding cron jobs'

# Backup:
echo '0	22	*	*	*	/opt/scripts/backup.sh' >> /etc/crontabs/root
chmod +x backup.sh
crontab -l

crond -f -l 8