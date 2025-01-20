@interface SKAPFSStoreDisk
+ (BOOL)isIOMediaStoreWithDisk:(id)a3;
+ (BOOL)isLiveFSStoreWithRawIOContent:(id)a3 diskDesc:(id)a4;
- (BOOL)_cacheContainerInfo;
- (BOOL)_cacheInfo;
- (BOOL)cleanupWithError:(id *)a3;
- (SKAPFSStoreDisk)initWithDADisk:(id)a3;
- (SKAPFSStoreDisk)initWithDADisk:(id)a3 isLiveFSContainer:(BOOL)a4;
@end

@implementation SKAPFSStoreDisk

- (SKAPFSStoreDisk)initWithDADisk:(id)a3 isLiveFSContainer:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(SKAPFSStoreDisk *)self init];
  v8 = v7;
  if (v7)
  {
    if (!v6) {
      goto LABEL_10;
    }
    [(SKAPFSStoreDisk *)v7 setDaDisk:v6];
    v9 = [(SKAPFSStoreDisk *)v8 privateCache];
    [v9 setIsLiveFSContainer:v4];

    v10 = sub_10000DD48();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v11 = @"kernel";
      int v14 = 136315650;
      v15 = "-[SKAPFSStoreDisk(Daemon) initWithDADisk:isLiveFSContainer:]";
      __int16 v16 = 2112;
      if (v4) {
        CFStringRef v11 = @"liveFS";
      }
      CFStringRef v17 = v11;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Initializing %@ APFS physical store %@", (uint8_t *)&v14, 0x20u);
    }

    if (![(SKAPFSStoreDisk *)v8 _cacheInfo])
    {
LABEL_10:
      v12 = 0;
      goto LABEL_11;
    }
    [(SKAPFSStoreDisk *)v8 setIsValid:1];
  }
  v12 = v8;
LABEL_11:

  return v12;
}

- (SKAPFSStoreDisk)initWithDADisk:(id)a3
{
  return [(SKAPFSStoreDisk *)self initWithDADisk:a3 isLiveFSContainer:0];
}

- (BOOL)_cacheInfo
{
  v2 = self;
  objc_sync_enter(v2);
  v7.receiver = v2;
  v7.super_class = (Class)SKAPFSStoreDisk;
  if ([(SKAPFSStoreDisk *)&v7 _cacheInfo]
    && [(SKAPFSStoreDisk *)v2 _cacheContainerInfo])
  {
    v3 = [(SKAPFSStoreDisk *)v2 mediaUUID];

    if (!v3)
    {
      BOOL v4 = [(SKAPFSStoreDisk *)v2 apfsContainerUUID];
      [(SKAPFSStoreDisk *)v2 setMediaUUID:v4];
    }
    [(SKAPFSStoreDisk *)v2 setSupportsRepair:1];
    [(SKAPFSStoreDisk *)v2 setSupportsVerify:1];
    [(SKAPFSStoreDisk *)v2 setRole:kSKDiskRoleStorageImplementation];
    [(SKAPFSStoreDisk *)v2 setType:kSKDiskTypeAPFSPS];
    [(SKAPFSStoreDisk *)v2 setFilesystem:0];
    [(SKAPFSStoreDisk *)v2 setFilesystemType:kSKDiskFileSystemUndefined];
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }
  objc_sync_exit(v2);

  return v5;
}

- (BOOL)_cacheContainerInfo
{
  v3 = [(SKAPFSStoreDisk *)self privateCache];
  unsigned int v4 = [v3 isLiveFSContainer];

  if (!v4)
  {
    v9 = [SKIOMedia alloc];
    v10 = [(SKAPFSStoreDisk *)self daDisk];
    CFStringRef v11 = [(SKIOMedia *)v9 initWithDADisk:v10];

    if (v11)
    {
      v12 = [(SKIOObject *)v11 newIteratorWithOptions:1];
      v13 = [(SKIOObject *)[SKIOMedia alloc] initWithIteratorNext:v12];
      if (v13)
      {
        int v14 = v13;
        do
        {
          if (IOObjectConformsTo([(SKIOObject *)v14 ioObj], "AppleAPFSMedia"))
          {
            id v15 = [(SKIOObject *)v14 copyPropertyWithClass:objc_opt_class() key:@"BSD Name"];
            [(SKAPFSStoreDisk *)self setApfsContainerIdentifier:v15];
          }
          else if (IOObjectConformsTo([(SKIOObject *)v14 ioObj], "AppleAPFSContainer"))
          {
            id v18 = [(SKIOObject *)v14 copyPropertyWithClass:objc_opt_class() key:@"UUID"];
            [(SKAPFSStoreDisk *)self setApfsContainerUUID:v18];

            break;
          }
          __int16 v16 = [(SKIOObject *)[SKIOMedia alloc] initWithIteratorNext:v12];

          int v14 = v16;
        }
        while (v16);
      }
      uint64_t v19 = [(SKAPFSStoreDisk *)self apfsContainerUUID];
      if (v19)
      {
        v20 = (void *)v19;
        v21 = [(SKAPFSStoreDisk *)self apfsContainerIdentifier];

        if (v21)
        {
          BOOL v8 = 1;
LABEL_21:

          return v8;
        }
      }
      v22 = sub_10000DD48();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = [(SKAPFSStoreDisk *)self diskIdentifier];
        *(_DWORD *)buf = 136315394;
        v26 = "-[SKAPFSStoreDisk(Daemon) _cacheContainerInfo]";
        __int16 v27 = 2114;
        v28 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: Failed to get APFS container info for %{public}@", buf, 0x16u);
      }
    }
    else
    {
      v12 = sub_10000DD48();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        CFStringRef v17 = [(SKAPFSStoreDisk *)self diskIdentifier];
        *(_DWORD *)buf = 136315394;
        v26 = "-[SKAPFSStoreDisk(Daemon) _cacheContainerInfo]";
        __int16 v27 = 2114;
        v28 = v17;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Failed to get physical store IO media of %{public}@", buf, 0x16u);
      }
    }
    BOOL v8 = 0;
    goto LABEL_21;
  }
  id v5 = objc_alloc((Class)NSString);
  id v6 = [(SKAPFSStoreDisk *)self diskIdentifier];
  id v7 = [v5 initWithFormat:@"apfs://%@", v6];
  [(SKAPFSStoreDisk *)self setApfsContainerIdentifier:v7];

  return 1;
}

+ (BOOL)isIOMediaStoreWithDisk:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [[SKIOMedia alloc] initWithDADisk:v3];
  id v5 = v4;
  if (v4)
  {
    id v6 = [(SKIOObject *)v4 newIteratorWithOptions:0];
    id v7 = 0;
    do
    {
      BOOL v8 = v7;
      id v7 = [(SKIOObject *)[SKIOMedia alloc] initWithIteratorNext:v6];

      BOOL v9 = v7 != 0;
    }
    while (v7 && !IOObjectConformsTo([(SKIOObject *)v7 ioObj], "AppleAPFSContainerScheme"));
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)isLiveFSStoreWithRawIOContent:(id)a3 diskDesc:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"7C3457EF-0000-11AA-AA11-00306543ECAC"])
  {
    id v6 = [v5 objectForKeyedSubscript:kDADiskDescriptionDeviceInternalKey];
    if (sub_10001217C(v6)) {
      unsigned int v7 = [v6 BOOLValue] ^ 1;
    }
    else {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)cleanupWithError:(id *)a3
{
  unsigned int v4 = [(SKAPFSStoreDisk *)self container];
  LOBYTE(a3) = [v4 cleanupWithError:a3];

  return (char)a3;
}

@end