#!/bin/bash
mv /etc/yum.repos.d /etc/yum.repos.d.bak
mkdir /etc/yum.repos.d
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.cloud.tencent.com/repo/centos7_base.repo
yum clean all
yum makecache
wget -O /etc/yum.repos.d/epel.repo http://mirrors.cloud.tencent.com/repo/epel-7.repo
yum clean all
yum makecache
echo -e "[centos-sclo-sclo]\nname=CentOS-\$releasever - SCLo sclo\nbaseurl=https://mirrors.cloud.tencent.com/centos/\$releasever/sclo/x86_64/sclo/\ngpgcheck=1\nenabled=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7" | sudo tee /etc/yum.repos.d/CentOS-SCLo-scl.repo
echo -e "[centos-sclo-rh]\nname=CentOS-\$releasever - SCLo rh\nbaseurl=https://mirrors.cloud.tencent.com/centos/\$releasever/sclo/x86_64/rh/\ngpgcheck=1\nenabled=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7" | sudo tee /etc/yum.repos.d/CentOS-SCLo-scl-rh.repo
yum clean all
yum makecache
cd /etc/yum.repos.d
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-SCLo
rpm -qi gpg-pubkey-f2ee9d55
yum clean all
yum makecache


echo "done!"
