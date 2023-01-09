# !/bin/bash
dpkg-scanpackages --multiversion . > Packages
gzip -k -f Packages
apt-ftparchive release . > Release
gpg --default-key "hamilton@mbari.org" -abs -o - Release > Release.gpg
gpg --default-key "hamilton@mbari.org" --clearsign -o - Release > InRelease
echo "deb [signed-by=/etc/apt/trusted.gpg.d/ppa.gpg] https://hamilton8415.github.io/ppa ./" > my_list_file.list
#
# See https://assafmo.github.io/2019/05/02/ppa-repo-hosted-on-github.html for more details
