[Unit]
Description=Auto Lock VMess Accounts Service
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash -c '/path/to/your/script.sh'
Restart=always
RestartSec=10
StartLimitInterval=0

[Install]
WantedBy=multi-user.target

# */ */ */ */ */ */ */ */ */
# */ Service Limit Quota \*

[Unit]
Description=Check and Manage Vmess Quota Service
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash -c '/usr/local/sbin/quotavme'
Restart=always
RestartSec=1 # akan di jalankan setiap 5 menit

[Install]
WantedBy=multi-user.target


# // service Delete trial ssh
[Unit]
Description=Deferred execution scheduler
Documentation=man:atd(8)
After=remote-fs.target nss-user-lookup.target
[Service]
ExecStartPre=-find /var/spool/cron/atjobs -type f -name "=*" -not -newercc /run/systemd -delete
ExecStart=/usr/sbin/atd -f
IgnoreSIGPIPE=false
KillMode=process
Restart=on-failure
[Install]
WantedBy=multi-user.target
