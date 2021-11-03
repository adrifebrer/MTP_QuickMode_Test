# Definitions
usb_dir=/media/usb
working_dir=~/working-directory


device=$(sudo fdisk -l | grep -o '^/dev/sd[a-z][0-9]') # identify /dev/sda1 or so as the USB device
echo -e "USB device: ${device} \n"

echo -e "Mount USB device"
sudo mkdir ${usb_dir} # prepare mounting directory
sudo chmod 777 ${usb_dir} # assign full permissions
sudo mount ${device} ${usb_dir} # mount the device to the dedicated folder

echo -e "\n Copy files working directory -> USB device"
mkdir ${working_dir}
ls ${working_dir}
cp ${working_dir}/* ${usb_dir}/  # copy present files 

echo -e "\n Current USB device files:"
ls ${usb_dir} # check files
