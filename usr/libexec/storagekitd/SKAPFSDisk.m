@interface SKAPFSDisk
+ (BOOL)isLIFSAPFSWithDiskDescription:(id)a3;
- (BOOL)_cacheInfoForDADisk:(id)a3;
- (BOOL)_cacheSpacesWithPurgeable:(BOOL)a3;
- (BOOL)canResize;
- (BOOL)canUpdateDiskIdentifierWithDiskInfo:(id)a3;
- (BOOL)cleanupWithError:(id *)a3;
- (NSString)containerBSDName;
- (id)getDataVolumeBSD;
- (id)liveDiskIdentifierWithDiskDescription:(id)a3;
- (id)volumeNameWithDiskDescription:(id)a3;
- (void)_cacheVolumeGroup;
- (void)cacheEncryptionInfo;
@end

@implementation SKAPFSDisk

- (BOOL)_cacheInfoForDADisk:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v24.receiver = v5;
  v24.super_class = (Class)SKAPFSDisk;
  if (![(SKAPFSDisk *)&v24 _cacheInfoForDADisk:v4]) {
    goto LABEL_12;
  }
  [(SKAPFSDisk *)v5 setType:kSKDiskTypeAPFSLV];
  [(SKAPFSDisk *)v5 setFilesystemType:kSKDiskFileSystemAPFS];
  if ([(SKAPFSDisk *)v5 isIOMediaDisk])
  {
    v6 = [(SKAPFSDisk *)v5 mediaUUID];
    BOOL v7 = v6 == 0;

    if (!v7)
    {
      [(SKAPFSDisk *)v5 setSupportsVerify:1];
      [(SKAPFSDisk *)v5 setSupportsRepair:1];
      __int16 v23 = 0;
      id v8 = [(SKAPFSDisk *)v5 diskIdentifier];
      [v8 fileSystemRepresentation];
      APFSVolumeRole();

      [(SKAPFSDisk *)v5 setApfsRole:SKAPFSVolumeRoleNone];
      [(SKAPFSDisk *)v5 setRole:kSKDiskRoleMacData];
      v15 = [(SKAPFSDisk *)v5 _getFilesystem];
      [(SKAPFSDisk *)v5 setFilesystem:v15];

      [(SKAPFSDisk *)v5 _cacheVolumeGroup];
      [(SKAPFSDisk *)v5 cacheEncryptionInfo];
      goto LABEL_13;
    }
    v12 = sub_10000DD48();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [(SKAPFSDisk *)v5 diskIdentifier];
      *(_DWORD *)buf = 136315394;
      v26 = "-[SKAPFSDisk(Daemon) _cacheInfoForDADisk:]";
      __int16 v27 = 2114;
      v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: APFS volume %{public}@ has no UUID", buf, 0x16u);
    }
LABEL_12:
    BOOL v14 = 0;
    goto LABEL_16;
  }
  if ([(SKAPFSDisk *)v5 isIOSRootSnapshot])
  {
    v9 = [(SKAPFSDisk *)v5 _getFilesystem];
    [(SKAPFSDisk *)v5 setFilesystem:v9];

    [(SKAPFSDisk *)v5 setApfsRole:SKAPFSVolumeRoleNone];
    v10 = &kSKDiskRoleSnapshot;
  }
  else
  {
    v11 = +[SKFilesystem filesystemFor:@"apfs" caseSensitive:0 encrypted:0 isExtension:1];
    [(SKAPFSDisk *)v5 setFilesystem:v11];

    [(SKAPFSDisk *)v5 setApfsRole:SKAPFSVolumeRoleNone];
    v10 = &kSKDiskRoleMacData;
  }
  [(SKAPFSDisk *)v5 setRole:*v10];
LABEL_13:
  v16 = [(SKAPFSDisk *)v5 filesystem];
  -[SKAPFSDisk setIsCaseSensitive:](v5, "setIsCaseSensitive:", [v16 isCaseSensitive]);

  v17 = [(SKAPFSDisk *)v5 filesystem];
  unsigned int v18 = [v17 isEncrypted];
  unsigned int v19 = [(SKAPFSDisk *)v5 isEncrypted];

  if (v18 != v19)
  {
    v20 = +[SKDaemonManager sharedManager];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100012F50;
    v22[3] = &unk_1000490C8;
    v22[4] = v5;
    [v20 filesystemsWithCallbackBlock:v22];
  }
  BOOL v14 = 1;
LABEL_16:
  objc_sync_exit(v5);

  return v14;
}

- (id)liveDiskIdentifierWithDiskDescription:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[SKAPFSDisk isLIFSAPFSWithDiskDescription:v3];
  v5 = (const CFStringRef *)&kDADiskDescriptionVolumeLifsURLKey;
  if (!v4) {
    v5 = &kDADiskDescriptionMediaBSDNameKey;
  }
  v6 = [v3 objectForKeyedSubscript:*v5];

  return v6;
}

- (id)volumeNameWithDiskDescription:(id)a3
{
  id v4 = a3;
  if ([(SKAPFSDisk *)self isLiveFSAPFSDisk])
  {
    v5 = [kSKDiskIdentifierLiveFSAPFSPrefix length];
    v6 = [(SKAPFSDisk *)self diskIdentifier];
    BOOL v7 = [(SKAPFSDisk *)self diskIdentifier];
    id v8 = (char *)[v6 rangeOfString:@"/" options:0 range:NSMakeRange(v5, [v7 length] - v5)];

    if (v8 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = sub_10000DD48();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = [(SKAPFSDisk *)self diskIdentifier];
        *(_DWORD *)buf = 136315394;
        v16 = "-[SKAPFSDisk(Daemon) volumeNameWithDiskDescription:]";
        __int16 v17 = 2112;
        unsigned int v18 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: Invalid volume name in LiveFS URL %@", buf, 0x16u);
      }
      v11 = 0;
    }
    else
    {
      v12 = [(SKAPFSDisk *)self diskIdentifier];
      v11 = [v12 substringFromIndex:v8 + 1];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SKAPFSDisk;
    v11 = [(SKAPFSDisk *)&v14 volumeNameWithDiskDescription:v4];
  }

  return v11;
}

- (BOOL)_cacheSpacesWithPurgeable:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v22.receiver = v4;
  v22.super_class = (Class)SKAPFSDisk;
  if (![(SKAPFSDisk *)&v22 _cacheSpacesWithPurgeable:v3])
  {
LABEL_13:
    LOBYTE(v8) = 0;
    goto LABEL_16;
  }
  if (![(SKAPFSDisk *)v4 isIOMediaDisk])
  {
    v12 = [(SKAPFSDisk *)v4 mountPoint];
    BOOL v13 = [v12 length] == 0;

    if (v13)
    {
      unsigned int v18 = sub_10000DD48();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        objc_super v24 = "-[SKAPFSDisk(Daemon) _cacheSpacesWithPurgeable:]";
        __int16 v25 = 2112;
        v26[0] = v4;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s: LiveFS disk is not mounted: %@", buf, 0x16u);
      }
    }
    else
    {
      v21[2] = 0;
      memset(v20, 0, 12);
      v21[0] = 5;
      v21[1] = 2155872256;
      id v14 = [(SKAPFSDisk *)v4 mountPoint];
      BOOL v15 = getattrlist((const char *)[v14 fileSystemRepresentation], v21, v20, 0xCuLL, 1u) == 0;

      if (v15)
      {
        [(SKAPFSDisk *)v4 setUsedSpace:*(void *)((char *)v20 + 4)];
        goto LABEL_15;
      }
      v16 = sub_10000DD48();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v17 = *__error();
        *(_DWORD *)buf = 136315650;
        objc_super v24 = "-[SKAPFSDisk(Daemon) _cacheSpacesWithPurgeable:]";
        __int16 v25 = 1024;
        LODWORD(v26[0]) = v17;
        WORD2(v26[0]) = 2112;
        *(void *)((char *)v26 + 6) = v4;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: getattrlist failed with errno %d for %@", buf, 0x1Cu);
      }
    }
    goto LABEL_13;
  }
  v5 = [(SKAPFSDisk *)v4 privateCache];
  v6 = [v5 liveDiskIdentifier];
  BOOL v7 = [(SKAPFSDisk *)v4 containerBSDName];
  id v8 = +[SKAPFSContainerDisk copyExtendedSpaceInfoWithDiskIdentifier:v6 containerBSDName:v7];

  if (v8)
  {
    v9 = [v8 objectForKeyedSubscript:@"fs_used"];
    [(SKAPFSDisk *)v4 setUsedSpace:sub_100012388(v9)];

    v10 = [v8 objectForKeyedSubscript:@"fs_reserve"];
    [(SKAPFSDisk *)v4 setReserveSpace:sub_100012388(v10)];

    v11 = [v8 objectForKeyedSubscript:@"fs_quota"];
    [(SKAPFSDisk *)v4 setQuotaSpace:sub_100012388(v11)];

LABEL_15:
    LOBYTE(v8) = 1;
  }
LABEL_16:
  objc_sync_exit(v4);

  return (char)v8;
}

- (void)cacheEncryptionInfo
{
  BOOL v3 = [(SKAPFSDisk *)self privateCache];
  id v4 = [v3 liveDiskIdentifier];

  v5 = [(SKAPFSDisk *)self apfsRole];
  if (v5 == (void *)SKAPFSVolumeRoleSystem)
  {
    v6 = [(SKAPFSDisk *)self apfsVolumeGroupUUID];

    if (!v6) {
      goto LABEL_5;
    }
    [(SKAPFSDisk *)self getDataVolumeBSD];
    id v4 = v5 = v4;
  }

LABEL_5:
  if (v4)
  {
    BOOL v7 = +[SKDaemonManager sharedManager];
    id v8 = (__DASession *)[v7 diskArbSession];

    id v9 = v4;
    DADiskRef v10 = DADiskCreateFromBSDName(kCFAllocatorDefault, v8, (const char *)[v9 fileSystemRepresentation]);
    if (v10)
    {
      v11 = [[SKIOMedia alloc] initWithDADisk:v10];
      p_super = &v11->super.super;
      if (v11)
      {
        id v13 = [(SKIOObject *)v11 copyProperties];
        id v14 = [v13 objectForKeyedSubscript:@"Encrypted"];
        unsigned int v15 = sub_100012340(v14);

        v16 = [v13 objectForKeyedSubscript:@"Effaceable"];
        unsigned int v17 = sub_100012340(v16);

        unsigned int v18 = [v13 objectForKeyedSubscript:@"Locked"];
        sub_100012340(v18);

        [(SKAPFSDisk *)self setIsEncrypted:v15 | v17];
        buf[0] = 0;
        if ([(SKAPFSDisk *)self isEncrypted])
        {
          [v9 fileSystemRepresentation];
          APFSVolumeGetVEKState();
        }
        [(SKAPFSDisk *)self setDefaultEffaceable:1];
        if ([(SKAPFSDisk *)self isEncrypted])
        {
          id v19 = [p_super copyParentPropertyWithClass:objc_opt_class() key:@"AppleTDMLocked"];
          [(SKAPFSDisk *)self setIsLocked:sub_100012340(v19)];
        }
      }
    }
    else
    {
      p_super = sub_10000DD48();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "-[SKAPFSDisk(Daemon) cacheEncryptionInfo]";
        __int16 v22 = 2114;
        id v23 = v9;
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "%s: Cannot create DADisk for data volume %{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)_cacheVolumeGroup
{
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  BOOL v3 = [(SKAPFSDisk *)self diskIdentifier];
  id v4 = [v3 substringFromIndex:4];
  v5 = [v4 componentsSeparatedByString:@"s"];

  if ((unint64_t)[v5 count] > 1)
  {
    id v8 = [v5 objectAtIndex:0];
    id v9 = +[NSString stringWithFormat:@"/dev/disk%@", v8];

    DADiskRef v10 = [v5 objectAtIndex:1];
    [v10 intValue];

    v6 = v9;
    [v6 fileSystemRepresentation];
    if (APFSContainerVolumeGroupGet())
    {
      v11 = sub_10000DD48();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to read volume group UUID", buf, 2u);
      }
    }
    [(SKAPFSDisk *)self setApfsVolumeGroupUUID:0];
  }
  else
  {
    v6 = sub_10000DD48();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = [(SKAPFSDisk *)self diskIdentifier];
      *(_DWORD *)buf = 136315394;
      id v13 = "-[SKAPFSDisk(Daemon) _cacheVolumeGroup]";
      __int16 v14 = 2114;
      unsigned int v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s: Invalid BSD name for APFS volume: %{public}@", buf, 0x16u);
    }
  }
}

- (BOOL)canResize
{
  v2 = [(SKAPFSDisk *)self container];
  BOOL v3 = [v2 designatedPhysicalStore];
  unsigned __int8 v4 = [v3 canResize];

  return v4;
}

- (NSString)containerBSDName
{
  BOOL v3 = [(SKAPFSDisk *)self privateCache];
  unsigned __int8 v4 = [v3 wholeDADisk];
  BSDName = DADiskGetBSDName(v4);

  if (BSDName)
  {
    v6 = +[NSString stringWithUTF8String:BSDName];
  }
  else
  {
    BOOL v7 = sub_10000DD48();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [(SKAPFSDisk *)self diskIdentifier];
      int v10 = 136315394;
      v11 = "-[SKAPFSDisk(Daemon) containerBSDName]";
      __int16 v12 = 2114;
      id v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s: Failed getting container BSD name for %{public}@", (uint8_t *)&v10, 0x16u);
    }
    v6 = 0;
  }

  return (NSString *)v6;
}

- (id)getDataVolumeBSD
{
  BOOL v3 = [(SKAPFSDisk *)self containerBSDName];
  if (v3)
  {
    id v4 = objc_alloc((Class)NSUUID);
    v5 = [(SKAPFSDisk *)self apfsVolumeGroupUUID];
    id v6 = [v4 initWithUUIDString:v5];

    v37[0] = 0;
    v37[1] = 0;
    [v6 getUUIDBytes:v37];
    id v29 = 0;
    id v7 = v3;
    [v7 UTF8String];
    int Volumes = APFSContainerVolumeGroupGetVolumes();
    if (Volumes)
    {
      int v9 = Volumes;
      int v10 = sub_10000DD48();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = [(SKAPFSDisk *)self apfsVolumeGroupUUID];
        int buf = 136315650;
        v32 = "-[SKAPFSDisk(Daemon) getDataVolumeBSD]";
        __int16 v33 = 2114;
        id v34 = v11;
        __int16 v35 = 1024;
        int v36 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s: Failed to get volumes in APFS group %{public}@, err %d", (uint8_t *)&buf, 0x1Cu);
      }
    }
    else
    {
      id v24 = v6;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      int v10 = v29;
      id v12 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v26;
        id v23 = v3;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(v10);
            }
            id v16 = +[NSString stringWithFormat:@"%@s%@", v7, *(void *)(*((void *)&v25 + 1) + 8 * i)];
            [v16 fileSystemRepresentation];
            int v17 = APFSVolumeRole();
            if (v17)
            {
              int v20 = v17;
              v21 = sub_10000DD48();
              BOOL v3 = v23;
              id v6 = v24;
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                int buf = 136315650;
                v32 = "-[SKAPFSDisk(Daemon) getDataVolumeBSD]";
                __int16 v33 = 2114;
                id v34 = v16;
                __int16 v35 = 1024;
                int v36 = v20;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s: Failed to get volume role for %{public}@, err %d", (uint8_t *)&buf, 0x1Cu);
              }

              uint64_t v18 = v10;
              goto LABEL_21;
            }
          }
          id v13 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
          BOOL v3 = v23;
          if (v13) {
            continue;
          }
          break;
        }
      }

      uint64_t v18 = sub_10000DD48();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = [(SKAPFSDisk *)self apfsVolumeGroupUUID];
        int buf = 136315394;
        v32 = "-[SKAPFSDisk(Daemon) getDataVolumeBSD]";
        __int16 v33 = 2114;
        id v34 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s: Failed to find data volume in APFS group %{public}@", (uint8_t *)&buf, 0x16u);
      }
      id v6 = v24;
LABEL_21:
    }
  }

  return 0;
}

+ (BOOL)isLIFSAPFSWithDiskDescription:(id)a3
{
  BOOL v3 = [a3 objectForKeyedSubscript:kDADiskDescriptionVolumeLifsURLKey];
  id v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 hasPrefix:@"apfs://"];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)canUpdateDiskIdentifierWithDiskInfo:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [(id)objc_opt_class() isLIFSAPFSWithDiskDescription:v3];

  return v4;
}

- (BOOL)cleanupWithError:(id *)a3
{
  if (![(SKAPFSDisk *)self isIOMediaDisk]) {
    return 1;
  }
  unsigned __int8 v5 = [(SKAPFSDisk *)self diskIdentifier];
  uint64_t v6 = SK_DM_APFSUtils_deleteVolume(v5);

  if (a3)
  {
    if (v6)
    {
      *a3 = +[SKError errorWithOSStatus:v6 error:a3];
    }
  }
  return v6 == 0;
}

@end