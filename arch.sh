!# /bin/bash

echo Arch install from Carlos Andrade

# Keyboard language UK
loadkeys uk

# Format partitions
 mkfs.vfat -F 32 /dev/sda1 '# Partition FAT'
 mkfs.ext4 /dev/sda3

 # Swap
 mkswap /dev/sda2
 swapon

# Mount partitions
mount /dev/sda3 /mnt
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot
# Install requirements
pacstrap /mnt linux linux-firmware networkmanager grub wpa_supplicant base base-devel --noconfirm

# Create fstab
genfstab -U /mnt > /mnt/etc/fstab

arch-chroot
