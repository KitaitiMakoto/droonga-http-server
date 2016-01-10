# Copyright (C) 2014-2015 Droonga Project
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License version 2.1 as published by the Free Software Foundation.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

register_service() {
  local NAME=$1
  local USER=$2
  local GROUP=$3

  curl -s -o /usr/lib/systemd/system/$NAME.service $(download_url "install/centos/$NAME.service")
  if [ $? -ne 0 ]; then
    echo "ERROR: Failed to download service script!"
    exit 1
  fi

  /usr/bin/systemctl enable $NAME.service
}
