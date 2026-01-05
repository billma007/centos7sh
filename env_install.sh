#!/bin/bash

echo "========================================"
echo " Linux Kernel Build Environment Installer"
echo " Target OS: CentOS 7"
echo "========================================"

# 1. 必须使用 root
if [ "$EUID" -ne 0 ]; then
    echo "[ERROR] 请使用 root 用户运行该脚本"
    echo "        请先执行: su"
    exit 1
fi

echo "[INFO] 正在更新 yum 源缓存..."
yum clean all
yum makecache -y

echo "[INFO] 安装基础编译工具..."
yum install -y \
gcc \
gcc-c++ \
make \
gdb

echo "[INFO] 安装词法/语法分析工具（内核编译需要）..."
yum install -y \
bison \
flex

echo "[INFO] 安装内核 menuconfig 依赖..."
yum install -y \
ncurses-devel

echo "[INFO] 安装内核编译核心依赖..."
yum install -y \
elfutils-libelf-devel \
openssl-devel

echo "[INFO] 安装 Software Collections（SCL）..."
yum install -y \
centos-release-scl

echo "[INFO] 安装 devtoolset-7（较新 gcc 工具链）..."
yum install -y \
devtoolset-7-gcc*


echo "========================================"
echo "[SUCCESS] 内核编译与驱动开发环境安装完成"
echo ""
echo "如需使用 devtoolset-7 gcc，请执行："
echo "  scl enable devtoolset-7 bash"
echo "========================================"
