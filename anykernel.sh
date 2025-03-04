# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=DeltaKernel
do.devicecheck=1
device.name1=earth
device.name2=aether
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0

supported.versions=
supported.patchlevels=
'; }
# end properties

# shell variables
is_slot_device=1;
block=/dev/block/by-name/boot;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;

## AnyKernel boot install
dump_boot;

write_boot;
## end boot install
