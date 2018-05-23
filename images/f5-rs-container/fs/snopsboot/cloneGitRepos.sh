#!/bin/bash

cp /snopsboot/.gitconfig /home/snops/.gitconfig
cp /snopsboot/.gitconfig /var/jenkins_home/.gitconfig
cp /snopsboot/.gitconfig /root/.gitconfig

if [ $SNOPS_AUTOCLONE == "0" ]; then
	echo "[cloneGitRepos] Skipping..."
	exit 0
fi

CWD=`pwd`

cd /home/snops
mkdir -p /home/snops/log

python /snopsboot/updateRepos.py /etc/snopsrepo.d/$SNOPS_IMAGE.json
python /snopsboot/cloneGitRepos.py

chmod -R a+rwx /home/snops
