#!/bin/bash
#
# This script is executed whenever your appliance boots.  Here you can add
# commands to be executed before the system enters the first runlevel.  This
# could include loading kernel modules, starting daemons that aren't managed
# by init files, asking questions at the console, etc.
#
# The 'kiwi_type' variable will contain the format of the appliance (oem =
# disk image, vmx = VMware, iso = CD/DVD, xen = Xen).
#

# read in some variables
. /studio/profile


if [ -f /etc/init.d/suse_studio_firstboot ]
then

  # Put commands to be run on the first boot of your appliance here
  echo "Running SUSE Studio first boot script..."
  echo test2 > /test2
  insserv -r autoprotect
  insserv -r reporterd
  insserv -r rtvscand
  insserv -r symcfgd
  mkdir /download/cdimage
  insserv install_rpms &> /dev/null
  chkconfig install_rpms on &> /dev/null
  insserv -r install_rpms &> /dev/null

fi
