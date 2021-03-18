# A ajouter dans /etc/crontab

#00 09 * * * /path/to/docker-compose

---

#!/bin/sh

set -e

/usr/local/bin/docker-compose -f /path/to/docker-compose pull --no-parallel >> /var/log/containers/docker-compose-update.log 2>&1
/usr/local/bin/docker-compose -f /path/to/docker-compose up -d >> /var/log/containers/docker-compose-update.log 2>&1
sleep 10
/usr/local/bin/docker-compose -f /path/to/docker-compose restart >> /var/log/containers/docker-compose-update.log 2>&1

---

# A faire sur le répertoire qui contient le docker-compose
#$ sudo chmod 755 folder
#$ sudo chown root:root folder
