@interface SKAPFSContainerDisk
+ (id)copyExtendedSpaceInfoWithDiskIdentifier:(id)a3 containerBSDName:(id)a4;
+ (id)copyPhysicalStoresMediaWithDADisk:(id)a3;
- (BOOL)_cacheInfo;
- (BOOL)_cacheSpacesWithPurgeable:(BOOL)a3;
- (BOOL)_supportsRecaching;
- (BOOL)cleanupWithError:(id *)a3;
- (SKAPFSContainerDisk)initWithPhysicalStoreDisk:(id)a3;
- (id)copyDesignatedPhysicalStoreUUID;
- (id)copyPhysicalStoresIOMedia;
- (id)copyPhysicalStoresUUIDs;
- (void)_cacheIsWholeDiskWithDiskDescription:(id)a3;
@end

@implementation SKAPFSContainerDisk

- (BOOL)_cacheInfo
{
  v2 = self;
  objc_sync_enter(v2);
  v10.receiver = v2;
  v10.super_class = (Class)SKAPFSContainerDisk;
  if (![(SKAPFSContainerDisk *)&v10 _cacheInfo])
  {
LABEL_8:
    BOOL v6 = 0;
    goto LABEL_9;
  }
  if (([(SKAPFSContainerDisk *)v2 isLiveFSAPFSDisk] & 1) == 0)
  {
    v3 = [(SKAPFSContainerDisk *)v2 mediaUUID];
    BOOL v4 = v3 == 0;

    if (v4)
    {
      v7 = sub_10000DD48();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = [(SKAPFSContainerDisk *)v2 diskIdentifier];
        *(_DWORD *)buf = 136315394;
        v12 = "-[SKAPFSContainerDisk(Daemon) _cacheInfo]";
        __int16 v13 = 2114;
        v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s: APFS container %{public}@ has no UUID", buf, 0x16u);
      }
      goto LABEL_8;
    }
  }
  id v5 = [(SKAPFSContainerDisk *)v2 copyDesignatedPhysicalStoreUUID];
  [(SKAPFSContainerDisk *)v2 setDesignatedPSUUID:v5];

  [(SKAPFSContainerDisk *)v2 setRole:kSKDiskRoleStorageImplementation];
  [(SKAPFSContainerDisk *)v2 setType:kSKDiskTypeAPFSContainer];
  [(SKAPFSContainerDisk *)v2 setSupportsVerify:1];
  [(SKAPFSContainerDisk *)v2 setSupportsRepair:1];
  [(SKAPFSContainerDisk *)v2 setFilesystem:0];
  [(SKAPFSContainerDisk *)v2 setFilesystemType:kSKDiskFileSystemUndefined];
  BOOL v6 = 1;
LABEL_9:
  objc_sync_exit(v2);

  return v6;
}

- (BOOL)_cacheSpacesWithPurgeable:(BOOL)a3
{
  v3 = self;
  objc_sync_enter(v3);
  if (([(SKAPFSContainerDisk *)v3 isLiveFSAPFSDisk] & 1) == 0)
  {
    BOOL v4 = [(SKAPFSContainerDisk *)v3 diskIdentifier];
    id v5 = [(SKAPFSContainerDisk *)v3 diskIdentifier];
    id v6 = +[SKAPFSContainerDisk copyExtendedSpaceInfoWithDiskIdentifier:v4 containerBSDName:v5];

    v7 = [v6 objectForKeyedSubscript:@"size"];
    [(SKAPFSContainerDisk *)v3 setTotalSpace:sub_100012388(v7)];

    v8 = [v6 objectForKeyedSubscript:@"used"];
    id v9 = sub_100012388(v8);

    objc_super v10 = [v6 objectForKeyedSubscript:@"reserve"];
    id v11 = sub_100012388(v10);

    unint64_t v12 = (unint64_t)v9 + (void)v11;
    if ((unint64_t)[(SKAPFSContainerDisk *)v3 totalSpace] <= v12) {
      __int16 v13 = 0;
    }
    else {
      __int16 v13 = (char *)[(SKAPFSContainerDisk *)v3 totalSpace] - v12;
    }
    [(SKAPFSContainerDisk *)v3 setAvailableSpace:v13];
    [(SKAPFSContainerDisk *)v3 setFreeSpace:v13];
  }
  objc_sync_exit(v3);

  return 1;
}

- (void)_cacheIsWholeDiskWithDiskDescription:(id)a3
{
}

+ (id)copyPhysicalStoresMediaWithDADisk:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSMutableArray array];
  id v5 = [[SKIOMedia alloc] initWithDADisk:v3];
  id v6 = v5;
  if (v5)
  {
    id v7 = [(SKIOObject *)v5 copyParent];
    v8 = v7;
    if (v7)
    {
      id v9 = [v7 newIteratorWithOptions:2];
      objc_super v10 = [(SKIOObject *)[SKIOMedia alloc] initWithIteratorNext:v9];
      if (v10)
      {
        id v11 = v10;
        do
        {
          if ([v9 invalidated]) {
            [v4 removeAllObjects];
          }
          if (IOObjectConformsTo([(SKIOObject *)v11 ioObj], "IOMedia")) {
            [v4 addObject:v11];
          }
          unint64_t v12 = [(SKIOObject *)[SKIOMedia alloc] initWithIteratorNext:v9];

          id v11 = v12;
        }
        while (v12);
      }
      id v13 = v4;
    }
    else
    {
      id v15 = v4;
    }
  }
  else
  {
    id v14 = v4;
  }

  return v4;
}

- (id)copyPhysicalStoresIOMedia
{
  if ([(SKAPFSContainerDisk *)self isLiveFSAPFSDisk])
  {
    id v3 = [SKIOMedia alloc];
    BOOL v4 = [(SKAPFSContainerDisk *)self daDisk];
    id v5 = [(SKIOMedia *)v3 initWithDADisk:v4];

    if (v5)
    {
      objc_super v10 = v5;
      id v6 = +[NSArray arrayWithObjects:&v10 count:1];
    }
    else
    {
      id v6 = &__NSArray0__struct;
    }

    return v6;
  }
  else
  {
    id v7 = [(SKAPFSContainerDisk *)self daDisk];
    id v8 = +[SKAPFSContainerDisk copyPhysicalStoresMediaWithDADisk:v7];

    return v8;
  }
}

- (id)copyPhysicalStoresUUIDs
{
  id v2 = [(SKAPFSContainerDisk *)self copyPhysicalStoresIOMedia];
  id v3 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) copyPropertyWithClass:objc_opt_class() key:@"UUID" (void)v11];
        if (v9) {
          [v3 addObject:v9];
        }

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)copyDesignatedPhysicalStoreUUID
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = [(SKAPFSContainerDisk *)self copyPhysicalStoresIOMedia];
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = [v8 copyPropertyWithClass:objc_opt_class() key:@"UUID" v14];
        objc_super v10 = v9;
        if (v9)
        {
          if (v5)
          {
            id v11 = [v8 copyPropertyWithClass:objc_opt_class() key:@"TierType"];
            long long v12 = v11;
            if (v11 && ([v11 isEqualToString:@"Secondary"] & 1) != 0)
            {

              goto LABEL_18;
            }
          }
          else
          {
            id v5 = v9;
          }
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v5 = 0;
  }

  id v5 = v5;
  objc_super v10 = v5;
LABEL_18:

  return v10;
}

+ (id)copyExtendedSpaceInfoWithDiskIdentifier:(id)a3 containerBSDName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[SKDaemonManager sharedManager];
  id v8 = [v7 copyExtendedDiskInfoWithDiskIdentifier:v5];

  if (!v8)
  {
    if (v6)
    {
      id v9 = sub_10000DD48();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        long long v15 = "+[SKAPFSContainerDisk(Daemon) copyExtendedSpaceInfoWithDiskIdentifier:containerBSDName:]";
        __int16 v16 = 2114;
        id v17 = v6;
        __int16 v18 = 2114;
        id v19 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Caching APFS extended info for %{public}@, asked by %{public}@", buf, 0x20u);
      }

      id v10 = v6;
      [v10 fileSystemRepresentation];
      int v11 = APFSExtendedSpaceInfo();
      long long v12 = sub_10000DD48();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        long long v15 = "+[SKAPFSContainerDisk(Daemon) copyExtendedSpaceInfoWithDiskIdentifier:containerBSDName:]";
        __int16 v16 = 2114;
        id v17 = v10;
        __int16 v18 = 1024;
        LODWORD(v19) = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: APFSExtendedSpaceInfo failed for %{public}@ with error %d", buf, 0x1Cu);
      }
      id v8 = 0;
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (BOOL)_supportsRecaching
{
  return [(SKAPFSContainerDisk *)self isLiveFSAPFSDisk] ^ 1;
}

- (SKAPFSContainerDisk)initWithPhysicalStoreDisk:(id)a3
{
  id v4 = (__DADisk *)a3;
  id v5 = [(SKAPFSContainerDisk *)self init];
  id v6 = v5;
  if (!v5) {
    goto LABEL_6;
  }
  if (!v4) {
    goto LABEL_10;
  }
  [(SKAPFSContainerDisk *)v5 setDaDisk:v4];
  BSDName = DADiskGetBSDName(v4);
  if (!BSDName)
  {
    long long v15 = sub_10000DD48();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v18 = "-[SKAPFSContainerDisk(Daemon) initWithPhysicalStoreDisk:]";
      __int16 v19 = 2112;
      v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: Failed to get BSD name of %@", buf, 0x16u);
    }

    goto LABEL_10;
  }
  id v8 = [objc_alloc((Class)NSString) initWithUTF8String:BSDName];
  id v9 = [(SKAPFSContainerDisk *)v6 privateCache];
  [v9 setLiveDiskIdentifier:v8];

  id v10 = objc_alloc((Class)NSString);
  int v11 = [(SKAPFSContainerDisk *)v6 privateCache];
  long long v12 = [v11 liveDiskIdentifier];
  id v13 = [v10 initWithFormat:@"apfs://%@", v12];
  [(SKAPFSContainerDisk *)v6 setDiskIdentifier:v13];

  if (![(SKAPFSContainerDisk *)v6 _cacheInfo])
  {
LABEL_10:
    long long v14 = 0;
    goto LABEL_11;
  }
  [(SKAPFSContainerDisk *)v6 setIsValid:1];
LABEL_6:
  long long v14 = v6;
LABEL_11:

  return v14;
}

- (BOOL)cleanupWithError:(id *)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(SKAPFSContainerDisk *)self volumes];
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        if (![*(id *)(*((void *)&v17 + 1) + 8 * i) cleanupWithError:a3])
        {
          BOOL v15 = 0;
          goto LABEL_12;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (![(SKAPFSContainerDisk *)self isIOMediaDisk]) {
    return 1;
  }
  id v10 = [(SKAPFSContainerDisk *)self diskIdentifier];
  int v11 = +[NSString stringWithFormat:@"/dev/%@", v10];

  id v5 = v11;
  [v5 UTF8String];
  APFSContainerWipeVolumeKeys();
  long long v12 = [SKIOMedia alloc];
  id v13 = [(SKAPFSContainerDisk *)self diskIdentifier];
  long long v14 = [(SKIOMedia *)v12 initWithDevName:v13];

  [(SKIOObject *)v14 waitIOKitQuiet];
  BOOL v15 = 1;
LABEL_12:

  return v15;
}

@end