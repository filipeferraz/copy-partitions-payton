# Partitions ignored
IGNORED=" oem_a system_a boot_a "

for a in /dev/block/platform/soc/c0c4000.sdhci/by-name/*_a; do
	partition=$(basename $a)
    if [[ "$IGNORED" != *" $partition "* ]]; then
        echo "Partition $partition"
  	    b=$(echo $a | sed 's/_a$/_b/');
        part_a=$(readlink -fn $a);
        part_b=$(readlink -fn $b);
        if [[ -n "$part_a" && -n "$part_b" && "$a" != "$part_a" && "$b" != "$part_b" ]]; then
          echo "dd if=$part_a of=$part_b"
          #dd if=$part_a of=$part_b
        fi  
    fi
done
