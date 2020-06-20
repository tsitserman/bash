#!/bin/bash

echo "Script initiating"

#condition for script to run after reboot, created later on
if [ ! -f /var/run/bootflag ]; then
        echo "First run"
        script="bash ~/srv_init_setup.sh"
        #this will add the script in the bash file so it will be ran on next boot
        echo "$script" >> ~/.bashrc
        echo "bash entry added"
        #creating flag file to check if this is a second run
        sudo touch /var/run/bootflag
        echo "Flag created"
        echo "Rebooting..."
        #sudo reboot
else
        echo "resuming script..."
        #remove the bashrc entry 
        sed -i '/bash/d' ~/.bashrc
        echo "bash entry removed"
        #remove the boot flag
        sudo rm -f /var/run/bootflag
        echo "bootflag removed"
        echo "running commands post-reboot"
        #commands here
        echo "script exiting"
fi
