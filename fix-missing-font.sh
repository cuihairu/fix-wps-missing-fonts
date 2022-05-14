#!/bin/sh

Ver=v0.1.0
DownloadUrl=https://github.com/cuihairu/fix-wps-missing-fonts/releases/download/${Ver}/fonts.tar.xz
FontHome=/usr/share/fonts/wps-office
TempFile=/tmp/wps-fonts.tar.xz

if [ ! -d "${FontHome}" ];then
	sudo mkdir ${FontHome}
fi 	

wget -O ${TempFile} ${DownloadUrl} 

if [ ! -f "${TempFile}" ];then
	echo "download fail"
	exit 1
fi

sudo tar -xvf ${TempFile} -C ${FontHome} --strip-components 1
sudo chown root:root -R ${FontHome}
sudo chmod 644 ${FontHome}/* 

# build cache
cd ${FontHome}
sudo mkfontscale && mkfontdir && fc-cache -fv
echo "fix success"
