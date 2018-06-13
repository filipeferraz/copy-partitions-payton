# Partitions ignored
IGNORED=" oem_a oem_b system_a system_b boot_a boot_b vendor_a vendor_b "

suffix_active=$(getprop ro.boot.slot_suffix)

if [[ "$suffix_active" == "_a" ]]; then 
  suffix_swap="_b"
else
  suffix_swap="_a"
fi


for active in /dev/block/bootdevice/by-name/*$suffix_active; do
	partition=$(basename $active)
    if [[ "${IGNORED/$partition}" = "$IGNORED" ]]; then
        echo "Partition $partition"
  	    inactive=$(echo $active | sed "s/${suffix_active}\$/${suffix_swap}/");
        part_active=$(readlink -fn $active);
        part_inactive=$(readlink -fn $inactive);
        if [[ -n "$part_active" && -n "$part_active" && "$active" != "$part_active" && "$inactive" != "$part_inactive" ]]; then
          dd if=$part_active of=$part_inactive
        fi  
    fi
done
