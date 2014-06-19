#!/bin/bash

cd ./ramdisk
find . | cpio -o -H newc | gzip > ../ramdisk-slatekit.cpio.gz
cd ..
mkbootimg --base 0 --pagesize 2048 --kernel_offset 0x80208000 --ramdisk_offset 0x82200000 --second_offset 0x81100000 --tags_offset 0x80200100 --cmdline 'console=ttyHSL0,115200,n8 androidboot.hardware=flo user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3' --kernel kernel --ramdisk ramdisk-slatekit.cpio.gz -o ./boot-slatekit.img
