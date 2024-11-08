#!/bin/bash
clear
DIR="https://raw.githubusercontent.com/lunatixmyscript/fodder/main/"
wget -q -O /etc/systemd/system/kill-vme.service "${DIR}kill-vme.service" && chmod +x kill-vme.service >/dev/null 2>&1
wget -q -O /etc/systemd/system/kill-vle.service "${DIR}kill-vle.service" && chmod +x kill-vle.service >/dev/null 2>&1
wget -q -O /etc/systemd/system/kill-tro.service "${DIR}kill-tro.service" && chmod +x kill-tro.service >/dev/null 2>&1
wget -q -O /etc/systemd/system/kill-ssr.service "${DIR}kill-ssr.service" && chmod +x kill-ssr.service >/dev/null 2>&1

# // service Kuota Xray
cat >/etc/systemd/system/quota-ssr.service << EOF
[Unit]
Description=Limit Quota Shadowsocks Accounts Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/sbin/quotassr
Restart=always

[Install]
WantedBy=multi-user.target
EOF

cat >/etc/systemd/system/quota-tro.service << EOF
[Unit]
Description=Limit Quota Trojan Accounts Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/sbin/quotatro
Restart=always

[Install]
WantedBy=multi-user.target
EOF

cat >/etc/systemd/system/quota-vme.service << EOF
[Unit]
Description=Limit Quota Vmess Accounts Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/sbin/quotavle
Restart=always

[Install]
WantedBy=multi-user.target
EOF

cat >/etc/systemd/system/quota-vle.service << EOF
[Unit]
Description=Limit Quota Vless Accounts Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/sbin/quotavme
Restart=always

[Install]
WantedBy=multi-user.target
EOF

chmod +x /etc/systemd/system/kill-vme.service
chmod +x /etc/systemd/system/kill-vle.service
chmod +x /etc/systemd/system/kill-tro.service
chmod +x /etc/systemd/system/kill-ssr.service
chmod +x /etc/systemd/system/quota-tro.service
chmod +x /etc/systemd/system/quota-ssr.service
chmod +x /etc/systemd/system/quota-vle.service
chmod +x /etc/systemd/system/quota-vme.service

clear
echo -e "\e[92;1m RESTART TROJAN QUOTA\e[0m"
systemctl restart quota-tro
sleep 1
echo -e "\e[92;1m RESTART SDWSK QUOTA \e[0m"
systemctl restart quota-ssr
sleep 1
echo -e "\e[92;1m RESTART VMESS QUOTA \e[0m"
systemctl restart quota-vme
sleep 1
echo -e "\e[92;1m RESTART VLESS QUOTA \e[0m"
systemctl restart quota-vle
sleep 1
echo -e "\e[92;1m RESTART VLESS KILL \e[0m"
systemctl restart kill-vle
sleep 1
echo -e "\e[92;1m RESTART VMESS KILL \e[0m"
systemctl restart kill-vme
sleep 1
echo -e "\e[92;1m RESTART TROJAN KILL \e[0m"
systemctl restart kill-tro
sleep 1
echo -e "\e[92;1m RESTART SDWSK KILL \e[0m"
systemctl restart kill-ssr
sleep 1
echo -e "\e[92;1m MENJALANKAN SERVICE TROJAN QUOTA \e[0m"
systemctl enable quota-tro
sleep 1
echo -e "\e[92;1m MENJALANKAN SERVICE SDWSK QUOTA \e[0m"
systemctl enable quota-ssr
sleep 1
echo -e "\e[92;1m MENJALANKAN SERVICE VLESS QUOTA \e[0m"
systemctl enable quota-vle
sleep 1
echo -e "\e[92;1m MENJALANKAN SERVICE VMESS QUOTA \e[0m"
systemctl enable quota-vme
sleep 1
echo -e "\e[92;1m MENJALANKAN SERVICE VMESS KILL \e[0m"
systemctl enable kill-vme
sleep 1
echo -e "\e[92;1m MENJALANKAN SERVICE VLESS KILL \e[0m"
systemctl enable kill-vle
sleep 1
echo -e "\e[92;1m MENJALANKAN SERVICE TRJAN KILL \e[0m"
systemctl enable kill-tro
sleep 1
echo -e "\e[92;1m MENJALANKAN SERVICE SDWSK KILL \e[0m"
systemctl enable kill-ssr
sleep 2
clear
