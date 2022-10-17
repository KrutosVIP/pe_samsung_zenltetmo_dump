#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/15570000.ufs/by-name/RECOVERY:31739920:9c27c0a7bee9519b00d53288c3a49697c29844f8; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/15570000.ufs/by-name/BOOT:22018064:190316944c8ca9bdf9d5f4b83755b55295837249 \
          --target EMMC:/dev/block/platform/15570000.ufs/by-name/RECOVERY:31739920:9c27c0a7bee9519b00d53288c3a49697c29844f8 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
