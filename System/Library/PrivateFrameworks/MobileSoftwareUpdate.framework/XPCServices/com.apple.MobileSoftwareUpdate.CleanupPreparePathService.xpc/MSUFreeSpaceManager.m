@interface MSUFreeSpaceManager
+ (id)sharedInstance;
- (BOOL)requestFreeSpace:(unint64_t)a3 allowSpecialCaseUrgency:(id)a4 disableMobileAssetPurge:(id)a5 disableSpecialCaseUrgency:(id)a6 disableAPFSReserve:(id)a7 error:(id *)a8;
- (BOOL)resetAPFSFreeBlocksThreshold:(id *)a3;
- (BOOL)setAPFSFreeBlocksThreshold:(unsigned int)a3 error:(id *)a4;
- (MSUFreeSpaceManager)initWithMountedDataVolume:(id)a3;
- (NSString)dataMountPoint;
- (id)description;
- (id)metricInfo:(BOOL)a3;
- (unint64_t)availableSpace:(id *)a3;
- (unint64_t)purgeableSpace:(id *)a3;
- (unsigned)getAPFSFreeBlocksThreshold:(id *)a3;
- (void)dealloc;
- (void)discardOldCacheDeletePaths;
- (void)setDataMountPoint:(id)a3;
@end

@implementation MSUFreeSpaceManager

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1) {
    dispatch_once(&sharedInstance_pred, &__block_literal_global_2);
  }
  return (id)sharedInstance___instance;
}

void __37__MSUFreeSpaceManager_sharedInstance__block_invoke(id a1)
{
  sharedInstance___instance = [[MSUFreeSpaceManager alloc] initWithMountedDataVolume:@"/private/var"];
}

- (MSUFreeSpaceManager)initWithMountedDataVolume:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MSUFreeSpaceManager;
  v4 = [(MSUFreeSpaceManager *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(MSUFreeSpaceManager *)v4 setDataMountPoint:a3];
    *(_OWORD *)&v5->_purgeableRequested = 0u;
    *(_OWORD *)&v5->_manuallyPurged = 0u;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MSUFreeSpaceManager;
  [(MSUFreeSpaceManager *)&v3 dealloc];
}

- (BOOL)requestFreeSpace:(unint64_t)a3 allowSpecialCaseUrgency:(id)a4 disableMobileAssetPurge:(id)a5 disableSpecialCaseUrgency:(id)a6 disableAPFSReserve:(id)a7 error:(id *)a8
{
  if (a8) {
    *a8 = 0;
  }
  return 1;
}

- (void)discardOldCacheDeletePaths
{
  objc_sync_enter(self);
  v2 = +[NSFileManager defaultManager];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = 0;
  id v4 = [&off_1000650C8 countByEnumeratingWithState:&v14 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(&off_1000650C8);
        }
        objc_super v7 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v6);
        memset(&v22, 0, sizeof(v22));
        if (!lstat((const char *)[v7 UTF8String], &v22))
        {
          uint64_t v13 = 0;
          uint64_t v8 = size_directory((char *)[v7 UTF8String]);
          if (([v7 hasSuffix:@"/"] & 1) == 0
            && [(NSFileManager *)v2 removeItemAtPath:v7 error:&v13]
            || [v7 hasSuffix:@"/"]
            && [(NSFileManager *)v2 removeItemsUnderPath:v7 error:&v13])
          {
            v9 = msuSharedLogger();
            v3 += v8;
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v19 = v7;
              _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully removed old CacheDelete path %@", buf, 0xCu);
            }
          }
          else
          {
            v10 = msuSharedLogger();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v19 = v7;
              __int16 v20 = 2112;
              uint64_t v21 = v13;
              _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to remove old CacheDelete path %@: %@", buf, 0x16u);
            }
          }
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [&off_1000650C8 countByEnumeratingWithState:&v14 objects:v23 count:16];
    }
    while (v4);
  }
  v11 = msuSharedLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v22.st_dev = 134218240;
    *(void *)&v22.st_mode = v3;
    WORD2(v22.st_ino) = 2048;
    *(__darwin_ino64_t *)((char *)&v22.st_ino + 6) = v3 / 0x100000;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Manually purged %lld bytes (%lld MB) from old CacheDelete paths.", (uint8_t *)&v22, 0x16u);
  }
  self->_manuallyPurged += v3;
  objc_sync_exit(self);
}

- (unsigned)getAPFSFreeBlocksThreshold:(id *)a3
{
  objc_sync_enter(self);
  unsigned int v14 = 0;
  size_t v13 = 4;
  if (sysctlbyname("vfs.generic.apfs.proc_free_blocks_threshold", &v14, &v13, 0, 0))
  {
    uint64_t v5 = *__error();
    NSErrorUserInfoKey v17 = NSDebugDescriptionErrorKey;
    v6 = __error();
    v18 = +[NSString stringWithFormat:@"sysctlbyname(%s) failed: %s", "vfs.generic.apfs.proc_free_blocks_threshold", strerror(*v6)];
    objc_super v7 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v5, +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1]);
    v15[0] = NSDebugDescriptionErrorKey;
    v15[1] = NSUnderlyingErrorKey;
    v16[0] = @"failed to get APFS free blocks threshold";
    v16[1] = v7;
    uint64_t v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"MobileSoftwareUpdateErrorDomain", 71, +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2]);
  }
  else
  {
    uint64_t v9 = v14;
    unint64_t blockSize = self->_blockSize;
    v11 = msuSharedLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      unsigned int v20 = v14;
      __int16 v21 = 2048;
      unint64_t v22 = (blockSize * v9) >> 20;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Successfully got APFS free blocks threshold: %d blocks (%lld MB)", buf, 0x12u);
    }
    uint64_t v8 = 0;
  }
  objc_sync_exit(self);
  if (a3) {
    *a3 = v8;
  }
  return 0;
}

- (BOOL)setAPFSFreeBlocksThreshold:(unsigned int)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)resetAPFSFreeBlocksThreshold:(id *)a3
{
  return [(MSUFreeSpaceManager *)self setAPFSFreeBlocksThreshold:8096 error:a3];
}

- (unint64_t)availableSpace:(id *)a3
{
  objc_sync_enter(self);
  uint64_t v5 = (__CFString *)[(NSString *)self->_dataMountPoint copy];
  objc_sync_exit(self);
  if (v5) {
    v6 = v5;
  }
  else {
    v6 = @"/private/var";
  }
  bzero(&v15, 0x878uLL);
  objc_super v7 = (const char *)[(__CFString *)v6 UTF8String];
  if (!statfs(v7, &v15))
  {
    v10 = 0;
    unint64_t v11 = v15.f_bavail * v15.f_bsize;
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v8 = *__error();
  NSErrorUserInfoKey v13 = NSDebugDescriptionErrorKey;
  uint64_t v9 = __error();
  unsigned int v14 = +[NSString stringWithFormat:@"statfs(\"%s\") failed : %s", v7, strerror(*v9), NSDebugDescriptionErrorKey];
  v10 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v8, +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  unint64_t v11 = 0;
  if (a3) {
LABEL_6:
  }
    *a3 = v10;
LABEL_7:

  return v11;
}

- (unint64_t)purgeableSpace:(id *)a3
{
  return 0;
}

- (id)metricInfo:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSMutableDictionary dictionary];
  unint64_t manuallyPurged = self->_manuallyPurged;
  if (manuallyPurged) {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", manuallyPurged >> 20), @"purgedManually");
  }
  unint64_t purgeableRequested = self->_purgeableRequested;
  if (purgeableRequested)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", purgeableRequested >> 20), @"purgeableRequested");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_purgeableRequested >> 20), @"purgeableReceived");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_netPurgedBytes / 0x100000), @"purgedMeasured");
  }
  if (v3)
  {
    *(_OWORD *)&self->_unint64_t manuallyPurged = 0u;
    *(_OWORD *)&self->_unint64_t purgeableRequested = 0u;
  }
  return +[NSDictionary dictionaryWithDictionary:v5];
}

- (NSString)dataMountPoint
{
  objc_sync_enter(self);
  dataMountPoint = self->_dataMountPoint;
  objc_sync_exit(self);
  return dataMountPoint;
}

- (void)setDataMountPoint:(id)a3
{
  objc_sync_enter(self);
  self->_dataMountPoint = (NSString *)[a3 copy];
  bzero(&v11, 0x878uLL);
  id v5 = (const char *)[a3 UTF8String];
  if (statfs(v5, &v11))
  {
    v6 = msuSharedLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_super v7 = __error();
      uint64_t v8 = strerror(*v7);
      -[MSUFreeSpaceManager setDataMountPoint:]((uint64_t)v8, v10, (uint64_t)v5, v6);
    }
    unint64_t f_bsize = 4096;
  }
  else
  {
    unint64_t f_bsize = v11.f_bsize;
  }
  self->_unint64_t blockSize = f_bsize;
  objc_sync_exit(self);
}

- (id)description
{
  objc_sync_enter(self);
  BOOL v3 = (objc_class *)objc_opt_class();
  id v4 = +[NSString stringWithFormat:@"\n<%@>\n\tdataMountPoint = %@\n\t_blockSize=%llu\n\tmetrics = %@", NSStringFromClass(v3), self->_dataMountPoint, self->_blockSize, [(MSUFreeSpaceManager *)self metricInfo:0]];
  objc_sync_exit(self);
  if (!v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)MSUFreeSpaceManager;
    return [(MSUFreeSpaceManager *)&v6 description];
  }
  return v4;
}

- (void)setDataMountPoint:(uint64_t)a3 .cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Assuming default 4K block size because statfs(\"%s\") failed : %s", buf, 0x16u);
}

@end