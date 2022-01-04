# lightsail-compose.sh
Launch script to install Docker and Docker Compose on AWS Lightsail adopted from https://github.com/mikegcoleman/todo#docker-containers-with-docker-compose

## Lightsail launch script:
```
curl -o lightsail-compose.sh https://raw.githubusercontent.com/dgerstel/lightsail-compose.sh/main/lightsail-compose.sh

chmod +x ./lightsail-compose.sh

./lightsail-compose.sh
```
## Set up Docker Compose on reboot
```
# copy in systemd unit file and register it so our compose file runs 
# on system restart
curl -o /etc/systemd/system/docker-compose-app.service https://raw.githubusercontent.com/mikegcoleman/todo/master/docker-compose-app.service
systemctl enable docker-compose-app
```

Where the latter script is:
```
# /etc/systemd/system/docker-compose-app.service
# thanks to oleg belostotsky on stack overflow for this 

[Unit]
Description=Docker Compose Application Service
Requires=docker.service
After=docker.service

[Service]
Type=oneshot
RemainAfterExit=yes
# match the below to wherever you copied your docker-compose.yml
WorkingDirectory=/srv/docker
ExecStart=/usr/local/bin/docker-compose up -d
ExecStop=/usr/local/bin/docker-compose down
TimeoutStartSec=0

[Install]
WantedBy=multi-user.target
```
