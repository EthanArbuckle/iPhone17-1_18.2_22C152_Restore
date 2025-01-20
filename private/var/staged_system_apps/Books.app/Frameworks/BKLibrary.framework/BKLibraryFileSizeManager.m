@interface BKLibraryFileSizeManager
+ (id)sharedInstance;
- (BKLibraryFileSizeManager)init;
- (BKLibraryFileSizeManager)initWithLibraryManager:(id)a3;
- (BKLibraryManager)libraryManager;
- (NSMutableDictionary)assetPathToCacheItemDict;
- (OS_dispatch_queue)dispatchQueue;
- (id)_documentsURLWithFilename:(id)a3;
- (id)_persistedInfoURL;
- (id)cachedFileSizeForAssetWithAssetID:(id)a3;
- (id)dq_filesSizeForCacheItemRequest:(id)a3;
- (id)synchronousFileSizeForCacheItemRequest:(id)a3;
- (int64_t)_fileSizeForAssetAtURL:(id)a3;
- (void)_installedUnzippedAssetDiskSpaceMetrics:(id *)a3 directory:(id)a4;
- (void)_removeObsoletePersistedInfo;
- (void)clearCacheEntryForAssetID:(id)a3;
- (void)dq_persistInfoToDisk;
- (void)dq_readPersistedInfoFromDisk;
- (void)filesSizeForCacheItemRequest:(id)a3 completion:(id)a4;
- (void)filesSizesForCacheItemRequests:(id)a3 completion:(id)a4;
- (void)purgeUnusedCacheEntries;
- (void)setAssetPathToCacheItemDict:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setLibraryManager:(id)a3;
@end

@implementation BKLibraryFileSizeManager

+ (id)sharedInstance
{
  if (qword_EE6A8 != -1) {
    dispatch_once(&qword_EE6A8, &stru_D30F8);
  }
  v2 = (void *)qword_EE6B0;

  return v2;
}

- (BKLibraryFileSizeManager)init
{
  v3 = +[BKLibraryManager defaultManager];
  v4 = [(BKLibraryFileSizeManager *)self initWithLibraryManager:v3];

  return v4;
}

- (BKLibraryFileSizeManager)initWithLibraryManager:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BKLibraryFileSizeManager;
  v5 = [(BKLibraryFileSizeManager *)&v15 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.ibooks.BKLibraryFileSizeManager", v6);
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_opt_new();
    assetPathToCacheItemDict = v5->_assetPathToCacheItemDict;
    v5->_assetPathToCacheItemDict = (NSMutableDictionary *)v9;

    objc_storeWeak((id *)&v5->_libraryManager, v4);
    [(BKLibraryFileSizeManager *)v5 _removeObsoletePersistedInfo];
    v11 = v5->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5AE6C;
    block[3] = &unk_D1520;
    v14 = v5;
    dispatch_sync(v11, block);
  }
  return v5;
}

- (id)cachedFileSizeForAssetWithAssetID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  objc_super v15 = sub_5AFC4;
  v16 = sub_5AFD4;
  id v17 = 0;
  if (v4)
  {
    v5 = [(BKLibraryFileSizeManager *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5AFDC;
    block[3] = &unk_D22A0;
    void block[4] = self;
    id v10 = v4;
    v11 = &v12;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)synchronousFileSizeForCacheItemRequest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  objc_super v15 = sub_5AFC4;
  v16 = sub_5AFD4;
  id v17 = 0;
  if (v4)
  {
    v5 = [(BKLibraryFileSizeManager *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5B1C4;
    block[3] = &unk_D22C8;
    v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)clearCacheEntryForAssetID:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [(BKLibraryFileSizeManager *)self dispatchQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_5B2E4;
    v6[3] = &unk_D1418;
    id v7 = v4;
    v8 = self;
    dispatch_async(v5, v6);
  }
}

- (void)filesSizeForCacheItemRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    uint64_t v9 = [(BKLibraryFileSizeManager *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5B560;
    block[3] = &unk_D22F0;
    void block[4] = self;
    id v13 = v6;
    id v14 = v8;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = (void (**)(id, void, void *))objc_retainBlock(v7);
    if (v10)
    {
      v11 = +[NSError errorWithDomain:@"BKLibraryFileSizeManagerDomain" code:-1001 userInfo:0];
      v10[2](v10, 0, v11);
    }
  }
}

- (void)filesSizesForCacheItemRequests:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    uint64_t v9 = [(BKLibraryFileSizeManager *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5B714;
    block[3] = &unk_D22F0;
    id v13 = v6;
    id v14 = self;
    id v15 = v8;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = (void (**)(id, void, void *))objc_retainBlock(v7);
    if (v10)
    {
      v11 = +[NSError errorWithDomain:@"BKLibraryFileSizeManagerDomain" code:-1001 userInfo:0];
      v10[2](v10, 0, v11);
    }
  }
}

- (void)purgeUnusedCacheEntries
{
  v3 = [(BKLibraryFileSizeManager *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5B9E4;
  block[3] = &unk_D1520;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (id)dq_filesSizeForCacheItemRequest:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v16 = 0;
    goto LABEL_20;
  }
  v5 = [(BKLibraryFileSizeManager *)self assetPathToCacheItemDict];
  id v6 = [v4 assetID];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v17 = 0;
    goto LABEL_13;
  }
  v8 = [v7 fileOnDiskLastTouchDate];
  uint64_t v9 = +[NSFileManager defaultManager];
  id v10 = [v4 assetURL];
  v11 = [v10 path];
  id v27 = 0;
  uint64_t v12 = [v9 attributesOfItemAtPath:v11 error:&v27];
  id v13 = v27;

  id v14 = [v13 domain];
  if (![v14 isEqualToString:NSCocoaErrorDomain])
  {

LABEL_9:
    v18 = [v12 fileModificationDate];
    id v17 = v18;
    if (v8)
    {
      if ([v18 compare:v8] != (char *)&dword_0 + 1
        || ([v8 timeIntervalSinceNow], fabs(v19) <= 1.0))
      {

        v16 = [v7 fileSizeNumber];
        goto LABEL_19;
      }
    }

LABEL_13:
    v20 = [v4 assetURL];
    if (v20)
    {
      v16 = [v4 assetID];

      if (v16)
      {
        v16 = +[NSNumber numberWithLongLong:[(BKLibraryFileSizeManager *)self _fileSizeForAssetAtURL:v20]];
        v21 = objc_opt_new();

        [v21 setFileURL:v20];
        [v21 setFileSizeNumber:v16];
        [v21 setFileOnDiskLastTouchDate:v17];
        v22 = [(BKLibraryFileSizeManager *)self assetPathToCacheItemDict];
        v23 = [v4 assetID];
        [v22 setObject:v21 forKeyedSubscript:v23];

        v24 = [(BKLibraryFileSizeManager *)self dispatchQueue];
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_5BF4C;
        v26[3] = &unk_D1520;
        v26[4] = self;
        dispatch_async(v24, v26);

        id v7 = v21;
      }
    }
    else
    {
      v16 = 0;
    }

    goto LABEL_19;
  }
  id v15 = (uint32_t *)[v13 code];

  if (v15 != &stru_B8.reserved3) {
    goto LABEL_9;
  }

  v16 = &off_D9FF8;
  id v17 = v8;
LABEL_19:

LABEL_20:

  return v16;
}

- (int64_t)_fileSizeForAssetAtURL:(id)a3
{
  id v4 = a3;
  char v18 = 0;
  v5 = +[NSFileManager defaultManager];
  id v6 = [v4 path];
  unsigned int v7 = [v5 fileExistsAtPath:v6 isDirectory:&v18];

  if (v7)
  {
    if (v18)
    {
      v17[0] = 0;
      v17[1] = 0;
      v8 = [v4 path];
      [(BKLibraryFileSizeManager *)self _installedUnzippedAssetDiskSpaceMetrics:v17 directory:v8];

      id v9 = (id)v17[0];
    }
    else
    {
      id v10 = [v4 path];
      uint64_t v16 = 0;
      v11 = [v5 attributesOfItemAtPath:v10 error:&v16];
      uint64_t v12 = v16;

      id v9 = 0;
      if (!v12)
      {
        objc_opt_class();
        id v13 = [v11 objectForKeyedSubscript:NSFileSize];
        id v14 = BUDynamicCast();

        id v9 = [v14 longLongValue];
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return (int64_t)v9;
}

- (void)_installedUnzippedAssetDiskSpaceMetrics:(id *)a3 directory:(id)a4
{
  id v4 = a4;
  v5 = +[NSFileManager defaultManager];
  v24 = v4;
  uint64_t v6 = +[NSURL fileURLWithPath:v4 isDirectory:1];
  v28[0] = NSURLTotalFileAllocatedSizeKey;
  v28[1] = NSURLIsDirectoryKey;
  v20 = +[NSArray arrayWithObjects:v28 count:2];
  v21 = (void *)v6;
  unsigned int v7 = [v5 enumeratorAtURL:v6];
  uint64_t v8 = [v7 nextObject];
  if (v8)
  {
    id v9 = (void *)v8;
    uint64_t v10 = 0;
    uint64_t v25 = 0;
    do
    {
      id v27 = 0;
      [v9 getResourceValue:&v27 forKey:NSURLIsDirectoryKey error:0];
      id v12 = v27;
      if (([v12 BOOLValue] & 1) == 0)
      {
        id v13 = [v9 path];
        uint64_t v26 = 0;
        id v14 = [v5 attributesOfItemAtPath:v13 error:&v26];
        uint64_t v15 = v26;

        if (!v15)
        {
          objc_opt_class();
          uint64_t v16 = [v14 objectForKeyedSubscript:NSFileSize];
          id v17 = BUDynamicCast();

          v25 += (uint64_t)[v17 longLongValue];
          ++v10;
        }
      }

      uint64_t v18 = [v7 nextObject];

      id v9 = (void *)v18;
    }
    while (v18);
  }
  else
  {
    uint64_t v25 = 0;
    uint64_t v10 = 0;
  }
  unint64_t v19 = a3->var1 + v10;
  a3->var0 += v25;
  a3->var1 = v19;
}

- (id)_persistedInfoURL
{
  return [(BKLibraryFileSizeManager *)self _documentsURLWithFilename:@"BKLibraryFileSizeManager2"];
}

- (id)_documentsURLWithFilename:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  v5 = [v4 URLForDirectory:9 inDomain:1 appropriateForURL:0 create:1 error:0];

  uint64_t v6 = [v5 URLByAppendingPathComponent:v3 isDirectory:0];

  return v6;
}

- (void)dq_persistInfoToDisk
{
  v9[0] = @"version";
  v9[1] = @"assetPathToFileSize";
  v10[0] = &off_DA010;
  id v3 = [(BKLibraryFileSizeManager *)self assetPathToCacheItemDict];
  id v4 = [v3 copy];
  v10[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v6 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v6 encodeObject:v5 forKey:@"root"];
  [v6 finishEncoding];
  unsigned int v7 = [v6 encodedData];
  uint64_t v8 = [(BKLibraryFileSizeManager *)self _persistedInfoURL];
  [v7 writeToURL:v8 atomically:1];
}

- (void)dq_readPersistedInfoFromDisk
{
  id v3 = [(BKLibraryFileSizeManager *)self _persistedInfoURL];
  id v4 = +[NSData dataWithContentsOfURL:v3];

  if (v4)
  {
    id v19 = 0;
    id v5 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v4 error:&v19];
    id v6 = v19;
    if (v6)
    {
      unsigned int v7 = BKLibraryLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = [(BKLibraryFileSizeManager *)self _persistedInfoURL];
        sub_92ED8(v8, (uint64_t)v6, buf, v7);
      }
    }
    else
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      id v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
      objc_opt_class();
      id v13 = [v5 decodeObjectOfClasses:v12 forKey:@"root"];
      unsigned int v7 = BUDynamicCast();

      id v14 = [v7 objectForKeyedSubscript:@"version"];
      if ([v14 unsignedIntegerValue] == (char *)&dword_0 + 2)
      {
        uint64_t v15 = [v7 objectForKeyedSubscript:@"assetPathToFileSize"];
        if (v15)
        {
          uint64_t v16 = +[NSMutableDictionary dictionaryWithDictionary:v15];
          [(BKLibraryFileSizeManager *)self setAssetPathToCacheItemDict:v16];
        }
      }
      else
      {
        id v17 = BCIMLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v21 = "-[BKLibraryFileSizeManager dq_readPersistedInfoFromDisk]";
          __int16 v22 = 2080;
          v23 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryFileSizeManager.m";
          __int16 v24 = 1024;
          int v25 = 527;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
        }

        uint64_t v15 = BCIMLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          uint64_t v18 = [(BKLibraryFileSizeManager *)self _persistedInfoURL];
          *(_DWORD *)buf = 138543362;
          v21 = v18;
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "@\"Corrupt ubiquity cache or unrecongnized version at %{public}@\"", buf, 0xCu);
        }
      }
    }
  }
}

- (void)_removeObsoletePersistedInfo
{
  id v3 = +[NSFileManager defaultManager];
  id v4 = [(BKLibraryFileSizeManager *)self _documentsURLWithFilename:@"BKLibraryFileSizeManager"];
  uint64_t v5 = 0;
  [v3 removeItemAtURL:v4 error:&v5];
}

- (BKLibraryManager)libraryManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryManager);

  return (BKLibraryManager *)WeakRetained;
}

- (void)setLibraryManager:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSMutableDictionary)assetPathToCacheItemDict
{
  return self->_assetPathToCacheItemDict;
}

- (void)setAssetPathToCacheItemDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetPathToCacheItemDict, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_destroyWeak((id *)&self->_libraryManager);
}

@end