# !/bin/bash
echo "fs.file-max=65535" >/etc/sysctl.conf
cp /etc/systemd/user.conf /etc/systemd/user.conf.bckup
cp /etc/systemd/system.conf /etc/systemd/system.conf.bckup
sed -i 's/^#DefaultLimitNOFILE=/DefaultLimitNOFILE=65535/' /etc/systemd/user.conf
sed -i 's/^#DefaultLimitNOFILE=/DefaultLimitNOFILE=65535/' /etc/systemd/system.conf
echo "*               soft    nproc           65535" >> /etc/security/limits.conf
echo "*               hard    nproc           65535" >> /etc/security/limits.conf
echo "*               soft    nofile          65535" >> /etc/security/limits.conf
echo "*               hard    nofile          65535" >> /etc/security/limits.conf
