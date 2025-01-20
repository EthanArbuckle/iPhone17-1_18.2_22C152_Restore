@interface SKDisk
+ (id)copySortedChildrenWithDADisk:(id)a3 ioMedia:(id)a4;
+ (id)newSortedChildrenWithIOMedia:(id)a3;
- (BOOL)_cacheInfo;
- (BOOL)_cacheInfoForDADisk:(id)a3;
- (BOOL)_cacheInfoWithDiskDescription:(id)a3;
- (BOOL)_cacheInfoWithIOMedia:(id)a3;
- (BOOL)_cacheSpacesWithPurgeable:(BOOL)a3;
- (BOOL)_supportsRecaching;
- (BOOL)canUpdateDiskIdentifierWithDiskInfo:(id)a3;
- (BOOL)isRealEFIPartition;
- (BOOL)reProbeWithError:(id *)a3;
- (SKDisk)init;
- (SKDisk)initWithDADisk:(id)a3;
- (SKMountState)previousMount;
- (id)_getFilesystem;
- (id)filesystemWithType:(id)a3;
- (id)liveDiskIdentifierWithDiskDescription:(id)a3;
- (id)volumeNameWithDiskDescription:(id)a3;
- (unsigned)_getOwnerUsingStat;
- (void)_cacheFilesystem;
- (void)_cacheIsWholeDiskWithDiskDescription:(id)a3;
- (void)_cacheNoFilesystem;
- (void)setPreviousMount:(id)a3;
@end

@implementation SKDisk

- (SKDisk)init
{
  v10.receiver = self;
  v10.super_class = (Class)SKDisk;
  v2 = [(SKDisk *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)NSNumber);
    v4 = +[SKDaemonManager sharedManager];
    id v5 = [v3 initWithUnsignedLongLong:[v4 nextDiskObjectID]];
    [(SKDisk *)v2 setDiskObjectID:v5];

    v6 = sub_10000DD48();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(SKDisk *)v2 diskObjectID];
      *(_DWORD *)buf = 136315394;
      v12 = "-[SKDisk(DaemonAdditions) init]";
      __int16 v13 = 2114;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Initializing new disk with ID %{public}@", buf, 0x16u);
    }
    v8 = objc_alloc_init(SKDiskPrivateCache);
    [(SKDisk *)v2 setPrivateCache:v8];
  }
  return v2;
}

- (SKDisk)initWithDADisk:(id)a3
{
  id v4 = a3;
  id v5 = [(SKDisk *)self init];
  v6 = v5;
  if (v5)
  {
    if (!v4 || ([(SKDisk *)v5 setDaDisk:v4], ![(SKDisk *)v6 _cacheInfo]))
    {
      v7 = 0;
      goto LABEL_7;
    }
    [(SKDisk *)v6 setIsValid:1];
  }
  v7 = v6;
LABEL_7:

  return v7;
}

- (BOOL)canUpdateDiskIdentifierWithDiskInfo:(id)a3
{
  return 0;
}

- (BOOL)_cacheInfo
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(SKDisk *)v2 daDisk];
  unsigned __int8 v4 = [(SKDisk *)v2 _cacheInfoForDADisk:v3];

  objc_sync_exit(v2);
  return v4;
}

- (BOOL)_cacheInfoForDADisk:(id)a3
{
  unsigned __int8 v4 = (__DADisk *)a3;
  CFDictionaryRef v5 = DADiskCopyDescription(v4);
  if (!v5)
  {
    p_super = sub_10000DD48();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      int v30 = 136315138;
      v31 = "-[SKDisk(DaemonAdditions) _cacheInfoForDADisk:]";
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "%s: DADiskCopyDescription failed", (uint8_t *)&v30, 0xCu);
    }
    goto LABEL_28;
  }
  if ([(SKDisk *)self _cacheInfoWithDiskDescription:v5])
  {
    if (![(SKDisk *)self isIOMediaDisk])
    {
      p_super = 0;
LABEL_16:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || [(SKDisk *)self _cacheSpacesWithPurgeable:1])
      {
        if ([(SKDisk *)self isWholeDisk])
        {
          [(SKDisk *)self setCanPartitionDisk:[(SKDisk *)self isVirtualDiskType] ^ 1];
          if ([(SKDisk *)self canPartitionDisk]) {
            uint64_t v16 = [(SKDisk *)self isDiskImage] ^ 1;
          }
          else {
            uint64_t v16 = 0;
          }
          [(SKDisk *)self setIsPhysicalDisk:v16];
        }
        else
        {
          [(SKDisk *)self setIsPhysicalDisk:1];
          [(SKDisk *)self setCanPartitionDisk:0];
        }
        if ([(SKDisk *)self isMemberOfClass:objc_opt_class()])
        {
          if ([(SKDisk *)self isWholeDisk])
          {
            v20 = [(SKDisk *)self daDisk];
            id v21 = +[SKDisk copySortedChildrenWithDADisk:v20 ioMedia:p_super];
            v22 = [(SKDisk *)self privateCache];
            [v22 setSortedChildren:v21];

            v23 = [(SKDisk *)self privateCache];
            v24 = [v23 sortedChildren];
            -[SKDisk setChildCount:](self, "setChildCount:", [v24 count]);
          }
          else
          {
            [(SKDisk *)self setChildCount:0];
          }
          [(SKDisk *)self setSupportsJournaling:0];
          [(SKDisk *)self setIsJournaled:0];
          [(SKDisk *)self setSupportsVerify:0];
          [(SKDisk *)self setSupportsRepair:0];
          v25 = [(SKDisk *)self _getFilesystem];
          [(SKDisk *)self setFilesystem:v25];

          v26 = [(SKDisk *)self filesystem];

          if (v26) {
            [(SKDisk *)self _cacheFilesystem];
          }
          else {
            [(SKDisk *)self _cacheNoFilesystem];
          }
          v27 = [(SKDisk *)self privateCache];
          v28 = [v27 wholeDADisk];
          [(SKDisk *)self _cacheCanSupportRecoveryPartitionWithWholeDisk:v28];
        }
        BOOL v15 = 1;
        goto LABEL_40;
      }
LABEL_28:
      BOOL v15 = 0;
LABEL_40:

      goto LABEL_41;
    }
    unsigned __int8 v6 = [(SKDisk *)self isWholeDisk];
    v7 = [(SKDisk *)self daDisk];
    v8 = v7;
    DADiskRef v9 = v7;
    if ((v6 & 1) == 0) {
      DADiskRef v9 = DADiskCopyWholeDisk(v7);
    }
    objc_super v10 = [(SKDisk *)self privateCache];
    [v10 setWholeDADisk:v9];

    if ((v6 & 1) == 0) {
    v11 = [(SKDisk *)self privateCache];
    }
    v12 = [v11 wholeDADisk];

    if (v12)
    {
      __int16 v13 = [[SKIOMedia alloc] initWithDADisk:v4];
      if (v13)
      {
        p_super = &v13->super.super;
        if (![(SKDisk *)self _cacheInfoWithIOMedia:v13]) {
          goto LABEL_28;
        }
        goto LABEL_16;
      }
      v17 = sub_10000DD48();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = [(SKDisk *)self diskIdentifier];
        int v30 = 136315394;
        v31 = "-[SKDisk(DaemonAdditions) _cacheInfoForDADisk:]";
        __int16 v32 = 2114;
        v33 = v18;
        v19 = "%s: Failed to find IO media of %{public}@";
        goto LABEL_26;
      }
    }
    else
    {
      v17 = sub_10000DD48();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = [(SKDisk *)self diskIdentifier];
        int v30 = 136315394;
        v31 = "-[SKDisk(DaemonAdditions) _cacheInfoForDADisk:]";
        __int16 v32 = 2114;
        v33 = v18;
        v19 = "%s: Failed to find whole disk for %{public}@";
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v30, 0x16u);
      }
    }

    p_super = 0;
    goto LABEL_28;
  }
  BOOL v15 = 0;
LABEL_41:

  return v15;
}

- (void)_cacheIsWholeDiskWithDiskDescription:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:kDADiskDescriptionMediaWholeKey];
  [(SKDisk *)self setIsWholeDisk:sub_100012340(v4)];
}

- (id)volumeNameWithDiskDescription:(id)a3
{
  return [a3 objectForKeyedSubscript:kDADiskDescriptionVolumeNameKey];
}

- (id)liveDiskIdentifierWithDiskDescription:(id)a3
{
  return [a3 objectForKeyedSubscript:kDADiskDescriptionMediaBSDNameKey];
}

- (BOOL)_cacheInfoWithDiskDescription:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = [(SKDisk *)self liveDiskIdentifierWithDiskDescription:v4];
  unsigned __int8 v6 = [(SKDisk *)self privateCache];
  [v6 setLiveDiskIdentifier:v5];

  v7 = [(SKDisk *)self diskIdentifier];
  if (!v7 && ![(SKDisk *)self isValid]
    || (unsigned int v8 = [(SKDisk *)self canUpdateDiskIdentifierWithDiskInfo:v4],
        v7,
        v8))
  {
    DADiskRef v9 = [(SKDisk *)self privateCache];
    objc_super v10 = [v9 liveDiskIdentifier];
    [(SKDisk *)self setDiskIdentifier:v10];
  }
  v11 = sub_10000DD48();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [(SKDisk *)self diskIdentifier];
    *(_DWORD *)buf = 136315650;
    v37 = "-[SKDisk(DaemonAdditions) _cacheInfoWithDiskDescription:]";
    __int16 v38 = 2114;
    v39 = v12;
    __int16 v40 = 1024;
    unsigned int v41 = [(SKDisk *)self isValid];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Caching %{public}@, isValid=%d", buf, 0x1Cu);
  }
  __int16 v13 = [(SKDisk *)self diskIdentifier];

  if (v13)
  {
    [(SKDisk *)self _cacheIsWholeDiskWithDiskDescription:v4];
    v14 = [v4 objectForKeyedSubscript:kDADiskDescriptionVolumePathKey];
    v35 = v14;
    if (v14)
    {
      BOOL v15 = [v14 path];
      [(SKDisk *)self setMountPoint:v15];
    }
    else
    {
      [(SKDisk *)self setMountPoint:0];
    }
    uint64_t v16 = [(SKDisk *)self mountPoint];

    if (!v16) {
      [(SKDisk *)self setOwnerUID:[(SKDisk *)self _getOwnerUsingStat]];
    }
    v17 = [(SKDisk *)self volumeNameWithDiskDescription:v4];
    [(SKDisk *)self setVolumeName:v17];

    v18 = [v4 objectForKeyedSubscript:kDADiskDescriptionVolumeUUIDKey];

    if (v18)
    {
      v19 = (__CFString *)CFUUIDCreateString(0, (CFUUIDRef)v18);
      [(SKDisk *)self setVolumeUUID:v19];
    }
    else
    {
      [(SKDisk *)self setVolumeUUID:0];
    }
    v20 = [v4 objectForKeyedSubscript:kDADiskDescriptionMediaSizeKey];
    [(SKDisk *)self setUnformattedSize:sub_100012388(v20)];
    id v21 = [v4 objectForKeyedSubscript:kDADiskDescriptionDeviceInternalKey];
    [(SKDisk *)self setIsInternal:sub_100012340(v21)];
    v22 = [v4 objectForKeyedSubscript:kDADiskDescriptionMediaRemovableKey];
    [(SKDisk *)self setIsRemovable:sub_100012340(v22)];
    v23 = [v4 objectForKeyedSubscript:kDADiskDescriptionMediaWritableKey];
    v24 = v23;
    if (v23) {
      uint64_t v25 = (uint64_t)sub_100012340(v23);
    }
    else {
      uint64_t v25 = 1;
    }
    [(SKDisk *)self setIsMediaWritable:v25];
    v26 = [v4 objectForKeyedSubscript:kDADiskDescriptionDeviceProtocolKey];
    if (sub_1000121D4(v26)) {
      id v27 = [v26 isEqual:@"Virtual Interface"];
    }
    else {
      id v27 = 0;
    }
    [(SKDisk *)self setIsDiskImage:v27];
    v28 = [v4 objectForKeyedSubscript:kDADiskDescriptionVolumeKindKey];
    v29 = [(SKDisk *)self privateCache];
    [v29 setVolumeKind:v28];

    int v30 = [v4 objectForKeyedSubscript:kDADiskDescriptionVolumeTypeKey];
    v31 = [(SKDisk *)self privateCache];
    [v31 setVolumeType:v30];

    __int16 v32 = [v4 objectForKeyedSubscript:kDADiskDescriptionMediaContentKey];
    v33 = [(SKDisk *)self privateCache];
    [v33 setRawIOContent:v32];
  }
  return v13 != 0;
}

- (unsigned)_getOwnerUsingStat
{
  memset(&v10, 0, sizeof(v10));
  id v3 = [(SKDisk *)self _getIdentifierForStat];
  if (([(SKDisk *)self isIOMediaDisk] & 1) == 0)
  {
    id v4 = sub_10000DD48();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ is not an IO media disk, assuming owner is root", buf, 0xCu);
    }
    goto LABEL_8;
  }
  id v4 = +[NSString stringWithFormat:@"/dev/%@", v3];
  int v5 = stat((const char *)[v4 UTF8String], &v10);
  unsigned __int8 v6 = sub_10000DD48();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "stat failed on %@, assuming owner is root", buf, 0xCu);
    }

LABEL_8:
    uid_t v8 = 0;
    goto LABEL_9;
  }
  if (v7)
  {
    *(_DWORD *)buf = 138412546;
    v12 = v4;
    __int16 v13 = 1024;
    uid_t st_uid = v10.st_uid;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "stat on %@, returned UID %d", buf, 0x12u);
  }

  uid_t v8 = v10.st_uid;
LABEL_9:

  return v8;
}

- (BOOL)_cacheInfoWithIOMedia:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copyProperties];
  if (v5)
  {
    unsigned __int8 v6 = [(SKDisk *)self privateCache];
    id v7 = [v6 copyHumanIOContentWithMediaDict:v5 isWholeDisk:-[SKDisk isWholeDisk](self, "isWholeDisk")];
    [(SKDisk *)self setIoContent:v7];

    if (([(SKDisk *)self isValid] & 1) == 0)
    {
      id v8 = [v4 copyPropertyWithClass:objc_opt_class() key:@"UUID"];
      [(SKDisk *)self setMediaUUID:v8];
    }
    v14[0] = 0;
    if ([(SKDisk *)self isWholeDisk])
    {
      [(SKDisk *)self setStartLocation:0];
      BOOL v9 = 0;
    }
    else
    {
      v12 = sub_100007CD4(v5, v14);
      -[SKDisk setStartLocation:](self, "setStartLocation:", [v12 unsignedLongLongValue]);

      BOOL v9 = v14[0] != 0;
    }
    [(SKDisk *)self setIsPartitionDisk:v9];
    stat v10 = [v4 copyParentPropertyWithClass:objc_opt_class() key:@"OSInternal"];
    [(SKDisk *)self setIsOSInternal:sub_100012340(v10)];
  }
  else
  {
    stat v10 = sub_10000DD48();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [(SKDisk *)self diskIdentifier];
      *(_DWORD *)v14 = 136315394;
      *(void *)&v14[4] = "-[SKDisk(DaemonAdditions) _cacheInfoWithIOMedia:]";
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s: Failed to get IO media properties for %{public}@", v14, 0x16u);
    }
  }

  return v5 != 0;
}

- (void)_cacheFilesystem
{
  id v3 = [(SKDisk *)self filesystem];
  id v29 = [v3 majorType];

  if ([v29 isEqualToString:@"hfs"])
  {
    [(SKDisk *)self setSupportsVerify:1];
    [(SKDisk *)self setSupportsRepair:1];
    id v4 = [(SKDisk *)self filesystem];
    -[SKDisk setSupportsJournaling:](self, "setSupportsJournaling:", [v4 supportsJournaling]);

    id v5 = [(SKDisk *)self privateCache];
    -[SKDisk setIsJournaled:](self, "setIsJournaled:", ((unint64_t)[v5 mountFlags] >> 23) & 1);

    unsigned __int8 v6 = [(SKDisk *)self filesystem];
    -[SKDisk setIsCaseSensitive:](self, "setIsCaseSensitive:", [v6 isCaseSensitive]);

    id v7 = [(SKDisk *)self ioContent];
    unsigned __int8 v8 = [v7 isEqualToString:@"Apple_Boot"];

    if (v8)
    {
      [(SKDisk *)self setRole:kSKDiskRoleBooter];
      BOOL v9 = &kSKDiskTypeAppleBoot;
    }
    else
    {
      v14 = [(SKDisk *)self mountPoint];

      if (v14)
      {
        __int16 v15 = +[NSFileManager defaultManager];
        uint64_t v16 = [(SKDisk *)self mountPoint];
        v17 = [v16 stringByAppendingPathComponent:@"/System/Library/CoreServices/Finder.app"];
        unsigned int v18 = [v15 fileExistsAtPath:v17];

        v19 = &kSKDiskRoleLegacyMacSystem;
        if (!v18) {
          v19 = &kSKDiskRoleLegacyMacData;
        }
        [(SKDisk *)self setRole:*v19];
      }
      else
      {
        [(SKDisk *)self setRole:kSKDiskRoleLegacyMacData];
      }
      BOOL v9 = &kSKDiskTypeHFS;
    }
    [(SKDisk *)self setType:*v9];
    __int16 v13 = &kSKDiskFileSystemHFS;
    goto LABEL_23;
  }
  if ([v29 isEqualToString:@"msdos"])
  {
    [(SKDisk *)self setSupportsVerify:1];
    [(SKDisk *)self setSupportsRepair:1];
    unsigned int v10 = [(SKDisk *)self isRealEFIPartition];
    v11 = &kSKDiskRoleBooter;
    if (v10)
    {
      v12 = &kSKDiskTypeEFI;
    }
    else
    {
      v11 = &kSKDiskRoleWindowsData;
      v12 = &kSKDiskTypeFAT;
    }
    [(SKDisk *)self setRole:*v11];
    [(SKDisk *)self setType:*v12];
    __int16 v13 = &kSKDiskFileSystemFAT;
    goto LABEL_23;
  }
  if ([v29 isEqualToString:@"exfat"])
  {
    [(SKDisk *)self setSupportsVerify:1];
    [(SKDisk *)self setSupportsRepair:1];
    [(SKDisk *)self setRole:kSKDiskRoleWindowsData];
    [(SKDisk *)self setType:kSKDiskTypeExFAT];
    __int16 v13 = &kSKDiskFileSystemExFAT;
LABEL_23:
    [(SKDisk *)self setFilesystemType:*v13];
    goto LABEL_24;
  }
  if ([v29 isEqualToString:@"ntfs"])
  {
    v20 = [(SKDisk *)self mountPoint];
    id v21 = [v20 stringByAppendingPathComponent:@"/Windows/System32/ntdll.dll"];

    uint64_t v22 = [(SKDisk *)self mountPoint];
    if (v22)
    {
      v23 = (void *)v22;
      v24 = +[NSFileManager defaultManager];
      unsigned int v25 = [v24 fileExistsAtPath:v21];

      v26 = &kSKDiskRoleWindowsSystem;
      if (!v25) {
        v26 = &kSKDiskRoleWindowsData;
      }
    }
    else
    {
      v26 = &kSKDiskRoleWindowsData;
    }
    [(SKDisk *)self setRole:*v26];
    [(SKDisk *)self setType:kSKDiskTypeNTFS];
    v28 = (void *)kSKDiskFileSystemNTFS;
    id v27 = self;
  }
  else
  {
    if ([v29 isEqualToString:@"acfs"])
    {
      [(SKDisk *)self setRole:kSKDiskRoleXSanData];
      [(SKDisk *)self setType:kSKDiskTypeXSanLV];
      __int16 v13 = &kSKDiskFileSystemACFS;
      goto LABEL_23;
    }
    [(SKDisk *)self setRole:kSKDiskRoleUnknown];
    [(SKDisk *)self setType:kSKDiskType3rdPartyFilesystem];
    id v21 = +[NSString stringWithFormat:@"kSKDiskFileSystem_%@", v29];
    id v27 = self;
    v28 = v21;
  }
  [(SKDisk *)v27 setFilesystemType:v28];

LABEL_24:
}

- (BOOL)isRealEFIPartition
{
  id v3 = [(SKDisk *)self ioContent];
  unsigned int v4 = [v3 isEqualToString:@"EFI"];

  if (v4)
  {
    id v5 = [(SKDisk *)self privateCache];
    unsigned __int8 v6 = [v5 wholeDADisk];
    id v7 = +[SKDisk copySortedChildrenWithDADisk:v6 ioMedia:0];

    unsigned __int8 v8 = [(SKDisk *)self daDisk];
    id v9 = [v7 indexOfObject:v8];

    if (v9) {
      BOOL v10 = v9 == (id)0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      BOOL v10 = 1;
    }
    LOBYTE(v4) = v10;
    if (v9 && v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = sub_10000DD48();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [(SKDisk *)self diskIdentifier];
        int v14 = 136315650;
        __int16 v15 = "-[SKDisk(DaemonAdditions) isRealEFIPartition]";
        __int16 v16 = 2114;
        v17 = v12;
        __int16 v18 = 1024;
        int v19 = (int)v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: %{public}@ is an EFI partition in the middle of the disk (child #%d), treating as a regular FAT", (uint8_t *)&v14, 0x1Cu);
      }
    }
  }
  return v4;
}

- (void)_cacheNoFilesystem
{
  unsigned int v3 = [(SKDisk *)self isWholeDisk];
  unsigned int v4 = [(SKDisk *)self privateCache];
  unsigned int v5 = [v4 schemeID];
  if (v3)
  {

    unsigned __int8 v6 = &kSKDiskTypeAPMWholeDisk;
    id v7 = &kSKDiskTypeMBRWholeDisk;
    unsigned __int8 v8 = &kSKDiskTypeUninitalized;
    if (v5 == 16) {
      unsigned __int8 v8 = &kSKDiskTypeGPTWholeDisk;
    }
    if (v5 != 8) {
      id v7 = v8;
    }
    if (v5 != 1) {
      unsigned __int8 v6 = v7;
    }
    [(SKDisk *)self setType:*v6];
    id v9 = &kSKDiskRolePhysicalDisk;
    goto LABEL_9;
  }

  if (v5 == 512
    || ([(SKDisk *)self ioContent],
        BOOL v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v10))
  {
    int v14 = &kSKDiskRoleNoRole;
    goto LABEL_15;
  }
  v11 = [(SKDisk *)self ioContent];
  unsigned int v12 = [v11 isEqualToString:@"Apple_Boot"];

  if (!v12)
  {
    if ([(SKDisk *)self isRealEFIPartition])
    {
      [(SKDisk *)self setRole:kSKDiskRoleBooter];
      [(SKDisk *)self setType:kSKDiskTypeEFI];
      __int16 v16 = (uint64_t *)&kSKDiskFileSystemFAT;
      goto LABEL_18;
    }
    __int16 v18 = [(SKDisk *)self ioContent];
    if ([v18 isEqualToString:@"Apple_HFS"])
    {

LABEL_26:
      [(SKDisk *)self setRole:kSKDiskRoleMacData];
      __int16 v13 = &kSKDiskTypeHFS;
      goto LABEL_27;
    }
    int v19 = [(SKDisk *)self ioContent];
    unsigned int v20 = [v19 isEqualToString:@"Apple_RAID"];

    if (v20) {
      goto LABEL_26;
    }
    id v21 = [(SKDisk *)self ioContent];
    unsigned int v22 = [v21 isEqualToString:@"Apple_APFS"];

    if (v22)
    {
      unsigned int v23 = [(SKDisk *)self isMemberOfClass:objc_opt_class()];
      [(SKDisk *)self setRole:kSKDiskRoleStorageImplementation];
      if (v23) {
        __int16 v15 = &kSKDiskTypeAPFSPS;
      }
      else {
        __int16 v15 = &kSKDiskTypeDamaged;
      }
      goto LABEL_16;
    }
    v24 = [(SKDisk *)self ioContent];
    unsigned int v25 = [v24 isEqualToString:@"Apple_RAID_Offline"];

    if (!v25)
    {
      v26 = [(SKDisk *)self ioContent];
      if ([v26 isEqualToString:@"Apple_KernelCoreDump"])
      {
      }
      else
      {
        id v27 = [(SKDisk *)self ioContent];
        unsigned int v28 = [v27 isEqualToString:@"Apple_SadMac"];

        if (!v28)
        {
          id v29 = [(SKDisk *)self privateCache];
          int v30 = [v29 rawIOContent];
          v31 = [(SKDisk *)self ioContent];
          unsigned __int8 v32 = [v30 isEqualToString:v31];

          if (v32)
          {
            uint64_t v33 = kSKDiskTypeOtherUnrecognized;
            v34 = [(SKDisk *)self privateCache];
            v35 = [v34 rawIOContent];
            v36 = +[NSString stringWithFormat:@"%@%@", v33, v35];
            [(SKDisk *)self setType:v36];
          }
          else
          {
            uint64_t v37 = kSKDiskTypeOtherRecognizable;
            v34 = [(SKDisk *)self ioContent];
            v35 = +[NSString stringWithFormat:@"%@%@", v37, v34];
            [(SKDisk *)self setType:v35];
          }

          id v9 = &kSKDiskRoleNoRole;
LABEL_9:
          [(SKDisk *)self setRole:*v9];
LABEL_17:
          __int16 v16 = (uint64_t *)&kSKDiskFileSystemUndefined;
          goto LABEL_18;
        }
      }
      [(SKDisk *)self setRole:kSKDiskRoleStorageImplementation];
      __int16 v13 = &kSKDiskTypeAppleCoreDump;
      goto LABEL_27;
    }
    int v14 = &kSKDiskRoleStorageImplementation;
LABEL_15:
    [(SKDisk *)self setRole:*v14];
    __int16 v15 = &kSKDiskTypeUninitalized;
LABEL_16:
    [(SKDisk *)self setType:*v15];
    goto LABEL_17;
  }
  [(SKDisk *)self setRole:kSKDiskRoleBooter];
  __int16 v13 = &kSKDiskTypeAppleBoot;
LABEL_27:
  [(SKDisk *)self setType:*v13];
  __int16 v16 = (uint64_t *)&kSKDiskFileSystemHFS;
LABEL_18:
  uint64_t v17 = *v16;

  [(SKDisk *)self setFilesystemType:v17];
}

- (id)_getFilesystem
{
  unsigned int v3 = [(SKDisk *)self privateCache];
  unsigned int v4 = [v3 volumeKind];

  if (sub_1000121D4(v4)) {
    goto LABEL_5;
  }
  unsigned int v5 = [(SKDisk *)self privateCache];
  unsigned __int8 v6 = [v5 rawIOContent];
  unsigned __int8 v7 = [v6 isEqualToString:@"41504653-0000-11AA-AA11-00306543ECAC"];

  if (v7)
  {
    CFStringRef v8 = @"apfs";
LABEL_4:

    unsigned int v4 = (void *)v8;
    goto LABEL_5;
  }
  __int16 v18 = [(SKDisk *)self ioContent];
  unsigned __int8 v19 = [v18 isEqualToString:@"Apple_APFS"];

  if (v19) {
    goto LABEL_12;
  }
  unsigned int v22 = [(SKDisk *)self ioContent];
  unsigned __int8 v23 = [v22 isEqualToString:@"Apple_HFS"];

  if (v23)
  {
    CFStringRef v8 = @"hfs";
    goto LABEL_4;
  }
  v24 = [(SKDisk *)self ioContent];
  unsigned int v25 = [v24 isEqualToString:@"MS-DOS"];

  if (v25)
  {
    CFStringRef v8 = @"msdos";
    goto LABEL_4;
  }
LABEL_5:
  if (sub_1000121D4(v4))
  {
    uint64_t v9 = [(SKDisk *)self filesystemWithType:v4];
    if (v9)
    {
      BOOL v10 = (void *)v9;
      goto LABEL_16;
    }
  }
  v11 = [(SKDisk *)self ioContent];
  BOOL v12 = sub_1000121D4(v11);

  if (!v12) {
    goto LABEL_12;
  }
  __int16 v13 = [(SKDisk *)self ioContent];
  unsigned int v14 = [v13 isEqualToString:@"EFI"];

  __int16 v15 = +[SKDaemonManager sharedManager];
  __int16 v16 = v15;
  if (v14)
  {
    BOOL v10 = [v15 _filesystemForDMFilesystemType:@"MS-DOS FAT32" isEncrypted:0];
    id v17 = v16;
LABEL_15:

    goto LABEL_16;
  }
  unsigned int v20 = [(SKDisk *)self ioContent];
  id v17 = [v16 _filesystemForIOContent:v20];

  if (v17)
  {
    id v17 = v17;
    BOOL v10 = v17;
    goto LABEL_15;
  }
  v26 = [(SKDisk *)self ioContent];
  id v27 = [(SKDisk *)self privateCache];
  unsigned int v28 = [v27 rawIOContent];
  unsigned __int8 v29 = [v26 isEqual:v28];

  if (v29)
  {
LABEL_12:
    BOOL v10 = 0;
    goto LABEL_16;
  }
  int v30 = +[SKDaemonManager sharedManager];
  v31 = [(SKDisk *)self privateCache];
  unsigned __int8 v32 = [v31 rawIOContent];
  BOOL v10 = [v30 _filesystemForIOContent:v32];

  if (v10) {
    goto LABEL_15;
  }
LABEL_16:

  return v10;
}

- (id)filesystemWithType:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"apfs"] & 1) != 0
    || ([v4 isEqualToString:@"hfs"] & 1) != 0
    || ([v4 isEqualToString:@"msdos"] & 1) != 0
    || [v4 isEqualToString:@"cd9660"])
  {
    unsigned int v5 = [(SKDisk *)self privateCache];
    unsigned __int8 v6 = [v5 volumeType];
    BOOL v7 = sub_1000121D4(v6);

    if (v7)
    {
      CFStringRef v8 = [(SKDisk *)self privateCache];
      uint64_t v9 = [v8 volumeType];

      if (v9)
      {
        CFStringRef v10 = 0;
LABEL_8:
        v11 = +[SKDaemonManager sharedManager];
        BOOL v12 = [v11 _filesystemForUnlocalizedName:v9 dmPersonality:v10];

        goto LABEL_11;
      }
    }
    else
    {
      __int16 v13 = [(SKDisk *)self mountPoint];
      sub_1000121D4(v13);
    }
  }
  else if ([v4 isEqualToString:@"zfs"])
  {
    uint64_t v9 = 0;
    CFStringRef v10 = @"ZFS";
    goto LABEL_8;
  }
  uint64_t v9 = +[SKDaemonManager sharedManager];
  BOOL v12 = [v9 _firstFilesystemForMajorType:v4];
LABEL_11:

  return v12;
}

- (BOOL)_cacheSpacesWithPurgeable:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  bzero(&v20, 0x878uLL);
  unsigned int v5 = [(SKDisk *)v4 mountPoint];
  if (v5
    && ([(SKDisk *)v4 mountPoint],
        id v6 = objc_claimAutoreleasedReturnValue(),
        BOOL v7 = statfs((const char *)[v6 fileSystemRepresentation], &v20) == 0,
        v6,
        v5,
        v7))
  {
    [(SKDisk *)v4 setIsWritable:(v20.f_flags & 1) == 0];
    [(SKDisk *)v4 setTotalSpace:v20.f_blocks * v20.f_bsize];
    [(SKDisk *)v4 setFreeSpace:v20.f_bavail * v20.f_bsize];
    uint64_t f_flags = v20.f_flags;
    __int16 v16 = [(SKDisk *)v4 privateCache];
    [v16 setMountFlags:f_flags];

    [(SKDisk *)v4 setOwnerUID:v20.f_owner];
    if (([(SKDisk *)v4 isIOMediaDisk] & 1) == 0) {
      [(SKDisk *)v4 setUnformattedSize:[(SKDisk *)v4 totalSpace]];
    }
  }
  else
  {
    [(SKDisk *)v4 setIsWritable:0];
    [(SKDisk *)v4 setTotalSpace:[(SKDisk *)v4 unformattedSize]];
    [(SKDisk *)v4 setFreeSpace:0];
    CFStringRef v8 = [(SKDisk *)v4 privateCache];
    [v8 setMountFlags:0];
  }
  if (v3)
  {
    uint64_t v9 = [(SKDisk *)v4 mountPoint];

    id v10 = 0;
    if (v9 && &_CacheDeleteCopyPurgeableSpaceWithInfo)
    {
      v11 = [(SKDisk *)v4 mountPoint];
      unsigned __int8 v19 = v11;
      +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      BOOL v12 = (void *)CacheDeleteCopyPurgeableSpaceWithInfo();

      if (v12)
      {
        __int16 v13 = [v12 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
        unsigned int v14 = v13;
        if (v13) {
          id v10 = [v13 unsignedLongLongValue];
        }
        else {
          id v10 = 0;
        }
      }
      else
      {
        id v10 = 0;
      }
    }
    [(SKDisk *)v4 setPurgeableSpace:v10];
  }
  [(SKDisk *)v4 setAvailableSpace:(char *)[(SKDisk *)v4 freeSpace] + (void)[(SKDisk *)v4 purgeableSpace]];
  objc_sync_exit(v4);

  return 1;
}

+ (id)copySortedChildrenWithDADisk:(id)a3 ioMedia:(id)a4
{
  id v6 = (__DADisk *)a3;
  BOOL v7 = (SKIOMedia *)a4;
  if (v6)
  {
    BSDName = DADiskGetBSDName(v6);
    if (BSDName)
    {
      uint64_t v9 = +[NSString stringWithUTF8String:BSDName];
      id v10 = +[SKDaemonManager sharedManager];
      id v11 = [v10 copyExtendedDiskInfoWithDiskIdentifier:v9];

      if (v11
        && ([v11 objectForKeyedSubscript:@"kSKSortedChildren"],
            BOOL v12 = objc_claimAutoreleasedReturnValue(),
            v12,
            v12))
      {
        id v13 = [v11 objectForKeyedSubscript:@"kSKSortedChildren"];
      }
      else
      {
        if (!v7) {
          BOOL v7 = [[SKIOMedia alloc] initWithDADisk:v6];
        }
        id v13 = [a1 newSortedChildrenWithIOMedia:v7];
        unsigned int v14 = +[SKDaemonManager sharedManager];
        id v19 = v13;
        statfs v20 = v9;
        CFStringRef v18 = @"kSKSortedChildren";
        __int16 v15 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
        id v21 = v15;
        __int16 v16 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        [v14 _addToExtendedDiskInfoCacheWithDictionary:v16];
      }
    }
    else
    {
      uint64_t v9 = sub_10000DD48();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        unsigned __int8 v23 = "+[SKDisk(DaemonAdditions) copySortedChildrenWithDADisk:ioMedia:]";
        __int16 v24 = 2112;
        unsigned int v25 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: Invalid DADiskRef %@", buf, 0x16u);
      }
      id v13 = &__NSArray0__struct;
    }
  }
  else
  {
    id v13 = &__NSArray0__struct;
  }

  return v13;
}

+ (id)newSortedChildrenWithIOMedia:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = &APFSCancelContainerResize_ptr;
    id v5 = [v3 copyPropertyWithClass:objc_opt_class() key:@"BSD Unit"];
    v31 = +[NSMutableArray array];
    id v6 = +[SKDaemonManager sharedManager];
    int v30 = (__DASession *)[v6 diskArbSession];

    id v29 = v3;
    id v7 = [v3 newIteratorWithOptions:1];
    CFStringRef v8 = &selRef_setSectorSize_;
    uint64_t v9 = [(SKIOObject *)[SKIOMedia alloc] initWithIteratorNext:v7];
    if (v9)
    {
      id v11 = v9;
      *(void *)&long long v10 = 136315394;
      long long v28 = v10;
      do
      {
        if (objc_msgSend(v7, "invalidated", v28)) {
          [v31 removeAllObjects];
        }
        if (IOObjectConformsTo([(SKIOObject *)v11 ioObj], "IOMedia"))
        {
          id v12 = [(SKIOObject *)v11 copyPropertyWithClass:objc_opt_class() key:@"BSD Unit"];
          if ([v12 isEqual:v5])
          {
            id v13 = DADiskCreateFromIOMedia(kCFAllocatorDefault, v30, [(SKIOObject *)v11 ioObj]);
            if (v13)
            {
              unsigned int v14 = [(SKIOObject *)v11 copyProperties];
              v43[0] = v13;
              __int16 v15 = sub_100007CD4(v14, 0);
              v43[1] = v15;
              +[NSArray arrayWithObjects:v43 count:2];
              v17 = __int16 v16 = v4;
              [v31 addObject:v17];

              id v4 = v16;
              CFStringRef v8 = &selRef_setSectorSize_;
            }
            else
            {
              unsigned int v14 = sub_10000DD48();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v28;
                __int16 v38 = "+[SKDisk(DaemonAdditions) newSortedChildrenWithIOMedia:]";
                __int16 v39 = 2114;
                id v40 = v12;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Failed to create DADisk for child disk %{public}@", buf, 0x16u);
              }
            }
          }
          else
          {
            id v13 = sub_10000DD48();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              __int16 v38 = "+[SKDisk(DaemonAdditions) newSortedChildrenWithIOMedia:]";
              __int16 v39 = 2114;
              id v40 = v12;
              __int16 v41 = 2114;
              id v42 = v5;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Found IO media with BSD unit %{public}@ as a child of disk with BSD unit %{public}@, ignoring", buf, 0x20u);
            }
          }

          IORegistryIteratorExitEntry((io_iterator_t)[v7 ioObj]);
        }
        CFStringRef v18 = (SKIOMedia *)[objc_alloc((Class)(v8 + 404)) initWithIteratorNext:v7];

        id v11 = v18;
      }
      while (v18);
    }
    id v19 = [v31 sortedArrayUsingComparator:&stru_100048C28];
    statfs v20 = +[NSMutableArray array];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v21 = v19;
    id v22 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v33;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v33 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v32 + 1) + 8 * i) objectAtIndexedSubscript:0];
          [v20 addObject:v26];
        }
        id v23 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v23);
    }

    id v3 = v29;
  }
  else
  {
    statfs v20 = &__NSArray0__struct;
  }

  return v20;
}

- (BOOL)_supportsRecaching
{
  v2 = [(SKDisk *)self diskIdentifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)reProbeWithError:(id *)a3
{
  v9[0] = kSKDiskMountOptionRecursive;
  id v5 = &__kCFBooleanFalse;
  if ([(SKDisk *)self isWholeDisk]
    && ![(SKDisk *)self isLiveFSAPFSDisk])
  {
    id v5 = &__kCFBooleanTrue;
  }
  v9[1] = kSKDiskMountOptionToolOptions;
  v10[0] = v5;
  v10[1] = &off_10004BEF0;
  id v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  BOOL v7 = +[SKMountOperation mountWithDisk:self options:v6 error:a3];

  return v7;
}

- (SKMountState)previousMount
{
  return (SKMountState *)objc_getAssociatedObject(self, "previousMount");
}

- (void)setPreviousMount:(id)a3
{
}

@end