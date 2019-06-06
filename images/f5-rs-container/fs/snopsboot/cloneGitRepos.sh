#!/bin/bash

cp /snopsboot/.gitconfig /home/snops/.gitconfig
cp /snopsboot/.gitconfig /var/jenkins_home/.gitconfig
cp /snopsboot/.gitconfig /root/.gitconfig

CWD=`pwd`

cd /home/snops
mkdir -p /home/snops/log

echo "[cloneGitRepos] Retrieving repository list from https://github.com/F5-use-cases/f5-rs-container.git"

rm -rf /tmp/snops-repo/
git clone https://github.com/F5-use-cases/f5-rs-container.git /tmp/snops-repo >> /home/snops/log/cloneGitRepos.log 2>&1

python /snopsboot/updateRepos.py /tmp/snops-repo/images/f5-rs-container/fs/etc/snopsrepo.d/f5-rs-container.json
python /snopsboot/cloneGitRepos.py

chmod -R 755 /home/snops
