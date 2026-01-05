
#!/bin/bash

# 备份原 yum 源
mv /etc/yum.repos.d /etc/yum.repos.d.bak
mkdir /etc/yum.repos.d

# 下载 CentOS 官方基础源
curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.cloud.tencent.com/repo/centos7_base.repo
yum clean all
yum makecache

# 下载 EPEL 源
curl -o /etc/yum.repos.d/epel.repo http://mirrors.cloud.tencent.com/repo/epel-7.repo
yum clean all
yum makecache

# 添加 SCLo sclo 源
cat <<EOF | tee /etc/yum.repos.d/CentOS-SCLo-scl.repo
[centos-sclo-sclo]
name=CentOS-\$releasever - SCLo sclo
baseurl=https://mirrors.cloud.tencent.com/centos/\$releasever/sclo/x86_64/sclo/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
EOF

# 添加 SCLo rh 源
cat <<EOF | tee /etc/yum.repos.d/CentOS-SCLo-scl-rh.repo
[centos-sclo-rh]
name=CentOS-\$releasever - SCLo rh
baseurl=https://mirrors.cloud.tencent.com/centos/\$releasever/sclo/x86_64/rh/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
EOF

yum clean all
yum makecache

# 导入 SCLo GPG key
cd /etc/yum.repos.d
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-SCLo

# 验证公钥是否已安装
rpm -qi gpg-pubkey-f2ee9d55

yum clean all
yum makecache

echo "done!"
