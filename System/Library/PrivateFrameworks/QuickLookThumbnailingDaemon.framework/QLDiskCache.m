@interface QLDiskCache
+ (id)defaultLocation;
+ (void)defaultLocation;
+ (void)setCacheLocationForTesting:(id)a3;
+ (void)setupCacheAtLocationIfNecessary:(id)a3;
- (BOOL)_open;
- (BOOL)_setThumbnailData:(id)a3;
- (BOOL)discardReservedBuffer:(id)a3;
- (BOOL)doReading:(id)a3;
- (BOOL)doWriting:(id)a3;
- (BOOL)hasDirtyLock;
- (BOOL)isOpened;
- (BOOL)itemIsMissingRemoteThumbnail:(id)a3;
- (BOOL)metaDataDirty;
- (BOOL)open;
- (BOOL)removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:(id)a3;
- (BOOL)removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:(id)a3;
- (BOOL)setLastHitDateOfAllCachedThumbnailsToDate:(id)a3;
- (BOOL)validateReservedBuffer:(id)a3;
- (NSMutableDictionary)metaData;
- (NSString)metaDataFilePath;
- (NSString)path;
- (QLDiskCache)initWithPathLocation:(id)a3 cacheSize:(int64_t)a4 cacheThread:(id)a5;
- (QLDiskCacheDelegate)delegate;
- (float)fragmentation;
- (id)_checkConsistency;
- (id)blobDatabase;
- (id)checkConsistency;
- (id)enumeratorForAllFilesUbiquitousFiles:(BOOL)a3 withExtraInfo:(BOOL)a4;
- (id)enumeratorForAllThumbnailsWithFileIdentifier:(id)a3;
- (id)enumeratorForThumbnailRequests:(id)a3;
- (id)indexDatabase;
- (id)itemsAfterFilteringOutItemsWithMissingThumbnails:(id)a3;
- (id)lastCrapWithDate:(id *)a3;
- (id)lastResetWithDate:(id *)a3;
- (id)metaDataForKey:(id)a3;
- (id)reserveBufferForData:(id)a3;
- (id)reserveBufferWithLength:(unint64_t)a3;
- (int64_t)writingCount;
- (unint64_t)_deleteBlobArrayFromDatabase:(id)a3;
- (unint64_t)cleanup;
- (unint64_t)cleanupDeletedFiles;
- (unint64_t)fileEntryCount;
- (unint64_t)freeDiskSpaceForNewThumbnails;
- (unint64_t)maxSize;
- (unint64_t)maxThumbnailLifeTime;
- (unint64_t)removeThumbnailsOlderThanDate:(id)a3;
- (unint64_t)reserveBufferCount;
- (unint64_t)reserveBufferSize;
- (unint64_t)size;
- (unint64_t)sizeSumOfThumbnailsOlderThanDate:(id)a3;
- (unint64_t)thumbnailCount;
- (void)_cleanupForceResetAtNextLaunch;
- (void)_close;
- (void)_closeWhatIsOpen;
- (void)_createDirtyLockInformDelegate:(BOOL)a3;
- (void)_discardThumbnailDataForReset:(id)a3;
- (void)_open;
- (void)_removeDirtyLock;
- (void)_resetWithReason:(id)a3;
- (void)checkpoint;
- (void)close;
- (void)discardThumbnailDataBatchForReset:(id)a3;
- (void)do:(id)a3;
- (void)forceResetAtNextLaunch;
- (void)freeDiskSpaceForNewThumbnails;
- (void)logCacheSizeBeforeCleanup;
- (void)noteRemoteThumbnailMissingForItems:(id)a3;
- (void)noteRemoteThumbnailPresentForItems:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeFilesWithFileInfo:(id)a3;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setMetaData:(id)a3;
- (void)setMetaData:(id)a3 forKey:(id)a4;
- (void)setMetaDataDirty:(BOOL)a3;
- (void)setMetaDataFilePath:(id)a3;
- (void)updateHitCount:(id)a3 forFileIdentifier:(id)a4;
- (void)writeThumbnailDataBatch:(id)a3;
@end

@implementation QLDiskCache

- (id)blobDatabase
{
  return self->_blobDatabase;
}

- (unint64_t)cleanup
{
  [(QLDiskCache *)self logCacheSizeBeforeCleanup];
  v3 = [(QLCacheIndexDatabase *)self->_indexDatabase removeOldThumbnails];
  unint64_t v4 = [(QLDiskCache *)self _deleteBlobArrayFromDatabase:v3];

  return v4;
}

- (void)logCacheSizeBeforeCleanup
{
  v10[1] = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  unint64_t v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v9 = @"QLMTCacheSizeLastCheckAbsoluteTime";
  v10[0] = &unk_1F39BD650;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v4 registerDefaults:v5];

  [v4 doubleForKey:@"QLMTCacheSizeLastCheckAbsoluteTime"];
  if (Current - v6 > 86400.0)
  {
    [v4 setDouble:@"QLMTCacheSizeLastCheckAbsoluteTime" forKey:Current];
    unint64_t v7 = [(QLCacheMMAPBlobDatabase *)self->_blobDatabase size] >> 20;
    v8 = +[QLTAnalyticsManager sharedManager];
    [v8 sendCacheSizeEventWithCacheSize:v7];
  }
}

- (unint64_t)_deleteBlobArrayFromDatabase:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([(QLCacheMMAPBlobDatabase *)self->_blobDatabase deleteBlobWithInfo:v10]) {
          v7 += [v10 length];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void)updateHitCount:(id)a3 forFileIdentifier:(id)a4
{
}

uint64_t __25__QLDiskCache_doWriting___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4F3A768];
  v3 = *(NSObject **)(MEMORY[0x1E4F3A768] + 32);
  if (!v3)
  {
    QLTInitLogging();
    v3 = *(NSObject **)(v2 + 32);
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __25__QLDiskCache_doWriting___block_invoke_cold_1();
  }
  uint64_t result = [*(id *)(a1 + 32) isOpened];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    [*(id *)(a1 + 32) _createDirtyLockInformDelegate:1];
    uint64_t v5 = [*(id *)(a1 + 32) indexDatabase];
    int v6 = [v5 beginTransaction];

    if (v6)
    {
      int v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
      if ([*(id *)(a1 + 32) metaDataDirty])
      {
        uint64_t v8 = [*(id *)(a1 + 32) metaData];
        v9 = [*(id *)(a1 + 32) metaDataFilePath];
        [v8 writeToFile:v9 atomically:1];

        [*(id *)(a1 + 32) setMetaDataDirty:0];
      }
      v10 = [*(id *)(a1 + 32) indexDatabase];
      [v10 endTransaction];

      if (v7)
      {
        v11 = [*(id *)(a1 + 32) indexDatabase];
        [v11 save];

        long long v12 = [*(id *)(a1 + 32) blobDatabase];
        [v12 save];
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
    return [*(id *)(a1 + 32) _removeDirtyLock];
  }
  return result;
}

- (id)indexDatabase
{
  return self->_indexDatabase;
}

- (BOOL)isOpened
{
  return self->_opened;
}

- (BOOL)metaDataDirty
{
  return self->_metaDataDirty;
}

- (void)_removeDirtyLock
{
  id v1 = a1;
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_3(&dword_1DDC5E000, v3, v4, "error removing dirty file: %s", v5, v6, v7, v8, v9);
}

- (void)_createDirtyLockInformDelegate:(BOOL)a3
{
  self->_hasDirtyLock = 1;
  if (a3)
  {
    self->_dirtyForDelegate = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained startWriting];
  }
  ++self->_writingCount;
  int v5 = open([(NSString *)self->_dirtyFilePath fileSystemRepresentation], 521, 384);
  if (v5 < 0)
  {
    uint64_t v6 = MEMORY[0x1E4F3A768];
    uint64_t v7 = *(NSObject **)(MEMORY[0x1E4F3A768] + 32);
    if (!v7)
    {
      QLTInitLogging();
      uint64_t v7 = *(NSObject **)(v6 + 32);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[QLDiskCache _createDirtyLockInformDelegate:](v7);
    }
  }
  else
  {
    close(v5);
  }
}

uint64_t __25__QLDiskCache_doReading___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isOpened];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (id)enumeratorForThumbnailRequests:(id)a3
{
  id v4 = a3;
  int v5 = [[QLDiskCacheQueryEnumerator alloc] initWithDiskCache:self thumbnailRequests:v4];

  return v5;
}

- (BOOL)doReading:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__QLDiskCache_doReading___block_invoke;
  v7[3] = &unk_1E6D0D078;
  uint8_t v9 = &v10;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  [(QLDiskCache *)self do:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (BOOL)doWriting:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v5 = MEMORY[0x1E4F3A768];
  uint64_t v6 = *(NSObject **)(MEMORY[0x1E4F3A768] + 32);
  if (!v6)
  {
    QLTInitLogging();
    uint64_t v6 = *(NSObject **)(v5 + 32);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[QLDiskCache doWriting:]();
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __25__QLDiskCache_doWriting___block_invoke;
  v10[3] = &unk_1E6D0D078;
  uint64_t v12 = &v13;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  [(QLDiskCache *)self do:v10];
  char v8 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)do:(id)a3
{
}

+ (void)setCacheLocationForTesting:(id)a3
{
}

+ (id)defaultLocation
{
  if (!defaultLocation_location)
  {
    uint64_t v5 = QLGetValidCacheLocation();
    uint64_t v6 = (void *)defaultLocation_location;
    defaultLocation_location = v5;

    uint64_t v7 = MEMORY[0x1E4F3A768];
    if (!defaultLocation_location)
    {
      char v8 = *(NSObject **)(MEMORY[0x1E4F3A768] + 32);
      if (!v8)
      {
        QLTInitLogging();
        char v8 = *(NSObject **)(v7 + 32);
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[QLDiskCache defaultLocation](v8);
      }
    }
    uint8_t v9 = *(NSObject **)(v7 + 32);
    if (!v9)
    {
      QLTInitLogging();
      uint8_t v9 = *(NSObject **)(v7 + 32);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      +[QLDiskCache defaultLocation];
    }
    [a1 setupCacheAtLocationIfNecessary:defaultLocation_location];
    [(id)defaultLocation_location fileSystemRepresentation];
    if ((int)rootless_check_datavault_flag() >= 1)
    {
      [(id)defaultLocation_location fileSystemRepresentation];
      if (rootless_convert_to_datavault())
      {
        uint64_t v17 = *(NSObject **)(v7 + 32);
        if (!v17)
        {
          QLTInitLogging();
          uint64_t v17 = *(NSObject **)(v7 + 32);
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          +[QLDiskCache defaultLocation](v17);
        }
      }
    }
  }
  uint64_t v2 = (void *)defaultLocation_location;
  return v2;
}

+ (void)setupCacheAtLocationIfNecessary:(id)a3
{
  id v3 = a3;
  char v14 = 0;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v5 = [v4 fileExistsAtPath:v3 isDirectory:&v14];

    if (!v5)
    {
      uint64_t v8 = MEMORY[0x1E4F3A768];
      uint8_t v9 = *(NSObject **)(MEMORY[0x1E4F3A768] + 32);
      if (!v9)
      {
        QLTInitLogging();
        uint8_t v9 = *(NSObject **)(v8 + 32);
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        +[QLDiskCache setupCacheAtLocationIfNecessary:]();
      }
      uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v13 = 0;
      char v11 = [v10 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v13];
      id v7 = v13;

      uint64_t v12 = *(NSObject **)(v8 + 32);
      if (v11)
      {
        if (!v12)
        {
          QLTInitLogging();
          uint64_t v12 = *(NSObject **)(v8 + 32);
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          +[QLDiskCache setupCacheAtLocationIfNecessary:]();
        }
      }
      else
      {
        if (!v12)
        {
          QLTInitLogging();
          uint64_t v12 = *(NSObject **)(v8 + 32);
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          +[QLDiskCache setupCacheAtLocationIfNecessary:]();
        }
      }
      goto LABEL_18;
    }
    if (!v14)
    {
      uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v6 removeItemAtPath:v3 error:0];

      id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v7 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];
LABEL_18:
    }
  }
}

- (QLDiskCache)initWithPathLocation:(id)a3 cacheSize:(int64_t)a4 cacheThread:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  char v11 = [(QLDiskCache *)self init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_path, a3);
    uint64_t v13 = [v9 stringByAppendingPathComponent:@"metadata"];
    metaDataFilePath = v12->_metaDataFilePath;
    v12->_metaDataFilePath = (NSString *)v13;

    uint64_t v15 = [v9 stringByAppendingPathComponent:@"dirty"];
    dirtyFilePath = v12->_dirtyFilePath;
    v12->_dirtyFilePath = (NSString *)v15;

    uint64_t v17 = [v9 stringByAppendingPathComponent:@"exclusive"];
    exclusivePath = v12->_exclusivePath;
    v12->_exclusivePath = (NSString *)v17;

    uint64_t v19 = [v9 stringByAppendingPathComponent:@"forcereset"];
    resetFilePath = v12->_resetFilePath;
    v12->_resetFilePath = (NSString *)v19;

    uint64_t v21 = [v9 stringByAppendingPathComponent:@"resetreason"];
    resetReasonPath = v12->_resetReasonPath;
    v12->_resetReasonPath = (NSString *)v21;

    v23 = [[QLCacheIndexDatabase alloc] initWithPath:v9];
    indexDatabase = v12->_indexDatabase;
    v12->_indexDatabase = v23;

    v25 = [QLCacheMMAPBlobDatabase alloc];
    v26 = [v9 stringByAppendingPathComponent:@"thumbnails"];
    uint64_t v27 = [(QLCacheMMAPBlobDatabase *)v25 initWithPath:v26 cacheSize:a4 cacheThread:v10];
    blobDatabase = v12->_blobDatabase;
    v12->_blobDatabase = (QLCacheMMAPBlobDatabase *)v27;

    [(QLCacheIndexDatabase *)v12->_indexDatabase addObserver:v12 forKeyPath:@"database.isCorrupted" options:3 context:0];
    uint64_t v29 = MEMORY[0x1E4F3A768];
    v30 = *(NSObject **)(MEMORY[0x1E4F3A768] + 32);
    if (!v30)
    {
      QLTInitLogging();
      v30 = *(NSObject **)(v29 + 32);
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[QLDiskCache initWithPathLocation:cacheSize:cacheThread:]((uint64_t)&v12->_exclusivePath, v30, v31, v32, v33, v34, v35, v36);
    }
  }

  return v12;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  char v11 = (QLCacheIndexDatabase *)a4;
  id v12 = a5;
  if (self->_indexDatabase == v11 && [v10 isEqualToString:@"database.isCorrupted"])
  {
    uint64_t v13 = [v12 objectForKey:*MEMORY[0x1E4F284C8]];
    if ([v13 BOOLValue])
    {
      char v14 = [v12 objectForKey:*MEMORY[0x1E4F284E0]];
      char v15 = [v14 BOOLValue];

      if ((v15 & 1) == 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained databaseCorruptionDetected];
      }
    }
    else
    {
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)QLDiskCache;
    [(QLDiskCache *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (id)enumeratorForAllFilesUbiquitousFiles:(BOOL)a3 withExtraInfo:(BOOL)a4
{
  id v4 = [[QLDiskCacheFileInfoEnumerator alloc] initWithDiskCache:self forUbiquitousFiles:a3 extraInfo:a4];
  return v4;
}

- (id)enumeratorForAllThumbnailsWithFileIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [[QLDiskCacheAllThumbnailPerFileEnumerator alloc] initWithDiskCache:self fileIdentifier:v4];

  return v5;
}

- (BOOL)_setThumbnailData:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 v72 = 0;
  if ([v4 setState:1])
  {
    int v5 = [v4 fileIdentifier];
    id v6 = objc_alloc((Class)[(id)objc_opt_class() versionedFileIdentifierClass]);
    id v7 = [v4 fileIdentifier];
    uint64_t v8 = [v4 version];
    uint64_t v9 = [v6 initWithFileIdentifier:v7 version:v8];

    v65 = (void *)v9;
    unint64_t v10 = [(QLCacheIndexDatabase *)self->_indexDatabase insertOrUpdateThumbnailWithVersionedFileIdentifier:v9 shouldInvalidAllThumbnailSizes:(char *)&v72 + 1 added:&v72];
    unint64_t v11 = v10;
    if (HIBYTE(v72))
    {
      id v12 = [(QLCacheIndexDatabase *)self->_indexDatabase removeAllThumbnailsForCacheId:v10];
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v68 objects:v73 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v69 != v15) {
              objc_enumerationMutation(v12);
            }
            [(QLCacheMMAPBlobDatabase *)self->_blobDatabase deleteBlobWithInfo:*(void *)(*((void *)&v68 + 1) + 8 * i)];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v68 objects:v73 count:16];
        }
        while (v14);
      }
    }
    else
    {
      if (!v10) {
        goto LABEL_23;
      }
      indexDatabase = self->_indexDatabase;
      [v4 size];
      int v22 = v21;
      uint64_t v23 = [v4 iconMode];
      uint64_t v24 = [v4 badgeType];
      uint64_t v25 = [v4 iconVariant];
      uint64_t v26 = [v4 interpolationQuality];
      uint64_t v27 = [v4 externalGeneratorDataHash];
      id v66 = 0;
      id v67 = 0;
      LODWORD(v28) = v22;
      [(QLCacheIndexDatabase *)indexDatabase getBlobInfoForCacheId:v11 size:v23 iconMode:v24 badgeType:v25 iconVariant:v26 interpolationQuality:v27 externalGeneratorDataHash:v28 bitmapDataBlobInfo:&v67 plistBufferBlobInfo:&v66];
      id v12 = v67;
      id v29 = v66;
      if (v12) {
        [(QLCacheMMAPBlobDatabase *)self->_blobDatabase deleteBlobWithInfo:v12];
      }
      if (v29) {
        [(QLCacheMMAPBlobDatabase *)self->_blobDatabase deleteBlobWithInfo:v29];
      }
    }
LABEL_23:
    uint64_t v30 = MEMORY[0x1E4F3A768];
    uint64_t v31 = *(NSObject **)(MEMORY[0x1E4F3A768] + 32);
    if (!v31)
    {
      QLTInitLogging();
      uint64_t v31 = *(NSObject **)(v30 + 32);
    }
    unint64_t v64 = v11;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      -[QLDiskCache _setThumbnailData:](v31, v4);
    }
    v63 = self->_indexDatabase;
    [v4 size];
    int v33 = v32;
    uint64_t v34 = [v4 iconMode];
    uint64_t v35 = [v4 badgeType];
    uint64_t v36 = [v4 iconVariant];
    uint64_t v37 = [v4 interpolationQuality];
    v38 = [v4 bitmapFormat];
    v39 = [v4 bitmapDataToValidate];
    v40 = [v4 metadataToValidate];
    int v41 = [v4 flavor];
    [v4 contentRect];
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;
    uint64_t v50 = [v4 externalGeneratorDataHash];
    LODWORD(v62) = v41;
    LODWORD(v51) = v33;
    BOOL v19 = -[QLCacheIndexDatabase insertOrUpdateImageDataForCacheId:size:iconMode:badgeType:iconVariant:interpolationQuality:bitmapFormat:bitmapDataBlobInfo:metadataBlobInfo:flavor:contentRect:externalGeneratorDataHash:lastHitDate:](v63, "insertOrUpdateImageDataForCacheId:size:iconMode:badgeType:iconVariant:interpolationQuality:bitmapFormat:bitmapDataBlobInfo:metadataBlobInfo:flavor:contentRect:externalGeneratorDataHash:lastHitDate:", v64, v34, v35, v36, v37, v38, v51, v43, v45, v47, v49, v39, v40, v62, v50, 0);

    if (v19)
    {
      v52 = [v4 bitmapDataToValidate];

      if (v52)
      {
        v53 = [v4 bitmapDataToValidate];
        [(QLDiskCache *)self validateReservedBuffer:v53];

        [v4 setBitmapDataToValidate:0];
      }
      v54 = [v4 metadataToValidate];

      if (!v54) {
        goto LABEL_41;
      }
      v55 = [v4 metadataToValidate];
      [(QLDiskCache *)self validateReservedBuffer:v55];
    }
    else
    {
      uint64_t v56 = MEMORY[0x1E4F3A768];
      v57 = *(NSObject **)(MEMORY[0x1E4F3A768] + 32);
      if (!v57)
      {
        QLTInitLogging();
        v57 = *(NSObject **)(v56 + 32);
      }
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
        -[QLDiskCache _setThumbnailData:]();
      }
      v58 = [v4 bitmapDataToValidate];

      if (v58)
      {
        v59 = [v4 bitmapDataToValidate];
        [(QLDiskCache *)self discardReservedBuffer:v59];

        [v4 setBitmapDataToValidate:0];
      }
      v60 = [v4 metadataToValidate];

      if (!v60) {
        goto LABEL_41;
      }
      v55 = [v4 metadataToValidate];
      [(QLDiskCache *)self discardReservedBuffer:v55];
    }

    [v4 setMetadataToValidate:0];
LABEL_41:

    goto LABEL_42;
  }
  uint64_t v17 = MEMORY[0x1E4F3A768];
  v18 = *(NSObject **)(MEMORY[0x1E4F3A768] + 32);
  if (!v18)
  {
    QLTInitLogging();
    v18 = *(NSObject **)(v17 + 32);
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[QLDiskCache _setThumbnailData:](v18, v4);
  }
  LOBYTE(v19) = 0;
LABEL_42:

  return v19;
}

- (void)_discardThumbnailDataForReset:(id)a3
{
  id v4 = a3;
  if ([v4 setState:1])
  {
    int v5 = [v4 bitmapDataToValidate];

    if (v5)
    {
      id v6 = [v4 bitmapDataToValidate];
      [(QLDiskCache *)self discardReservedBuffer:v6];

      [v4 setBitmapDataToValidate:0];
    }
    id v7 = [v4 metadataToValidate];

    if (v7)
    {
      uint64_t v8 = [v4 metadataToValidate];
      [(QLDiskCache *)self discardReservedBuffer:v8];

      [v4 setMetadataToValidate:0];
    }
  }
  else
  {
    uint64_t v9 = MEMORY[0x1E4F3A768];
    unint64_t v10 = *(NSObject **)(MEMORY[0x1E4F3A768] + 32);
    if (!v10)
    {
      QLTInitLogging();
      unint64_t v10 = *(NSObject **)(v9 + 32);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[QLDiskCache _setThumbnailData:](v10, v4);
    }
  }
}

- (void)forceResetAtNextLaunch
{
  uint64_t v2 = fopen([(NSString *)self->_resetFilePath fileSystemRepresentation], "a+");
  if (v2)
  {
    fclose(v2);
  }
}

- (void)_cleanupForceResetAtNextLaunch
{
  uint64_t v2 = [(NSString *)self->_resetFilePath fileSystemRepresentation];
  unlink(v2);
}

- (void)writeThumbnailDataBatch:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(QLDiskCache *)self _setThumbnailData:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)discardThumbnailDataBatchForReset:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(QLDiskCache *)self _discardThumbnailDataForReset:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (unint64_t)removeThumbnailsOlderThanDate:(id)a3
{
  id v4 = [(QLCacheIndexDatabase *)self->_indexDatabase removeThumbnailsOlderThanDate:a3];
  unint64_t v5 = [(QLDiskCache *)self _deleteBlobArrayFromDatabase:v4];

  return v5;
}

- (unint64_t)freeDiskSpaceForNewThumbnails
{
  uint64_t v3 = MEMORY[0x1E4F3A768];
  id v4 = *(NSObject **)(MEMORY[0x1E4F3A768] + 32);
  if (!v4)
  {
    QLTInitLogging();
    id v4 = *(NSObject **)(v3 + 32);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[QLDiskCache freeDiskSpaceForNewThumbnails]();
  }
  unint64_t v5 = [(QLCacheIndexDatabase *)self->_indexDatabase removePercentageOldestThumbnails:25];
  unint64_t v6 = [(QLDiskCache *)self _deleteBlobArrayFromDatabase:v5];
  [(QLCacheMMAPBlobDatabase *)self->_blobDatabase compactFragmentation];

  return v6;
}

- (unint64_t)cleanupDeletedFiles
{
  uint64_t v3 = [(QLCacheIndexDatabase *)self->_indexDatabase removeThumbnailsForDeletedFiles];
  unint64_t v4 = [(QLDiskCache *)self _deleteBlobArrayFromDatabase:v3];

  return v4;
}

- (void)checkpoint
{
}

- (void)removeFilesWithFileInfo:(id)a3
{
  id v4 = [(QLCacheIndexDatabase *)self->_indexDatabase removeFilesWithFileInfo:a3];
  [(QLDiskCache *)self _deleteBlobArrayFromDatabase:v4];
}

- (float)fragmentation
{
  [(QLCacheMMAPBlobDatabase *)self->_blobDatabase fragmentation];
  return result;
}

- (unint64_t)reserveBufferCount
{
  return [(QLCacheIndexDatabase *)self->_indexDatabase reserveBufferCount];
}

- (unint64_t)reserveBufferSize
{
  return [(QLCacheIndexDatabase *)self->_indexDatabase reserveBufferSize];
}

- (unint64_t)size
{
  return [(QLCacheMMAPBlobDatabase *)self->_blobDatabase size];
}

- (unint64_t)maxSize
{
  return [(QLCacheMMAPBlobDatabase *)self->_blobDatabase maxSize];
}

- (BOOL)_open
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MEMORY[0x1E4F3A768];
  id v4 = *(NSObject **)(MEMORY[0x1E4F3A768] + 32);
  if (!v4)
  {
    QLTInitLogging();
    id v4 = *(NSObject **)(v3 + 32);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[QLDiskCache _open]0();
  }
  int v5 = open([(NSString *)self->_exclusivePath fileSystemRepresentation], 545, 384);
  self->_exclusiveFD = v5;
  p_exclusiveFD = &self->_exclusiveFD;
  if (v5 > 0)
  {
    uint64_t v7 = *(NSObject **)(v3 + 32);
    if (!v7)
    {
      QLTInitLogging();
      uint64_t v7 = *(NSObject **)(v3 + 32);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      [(QLDiskCache *)(uint64_t *)&self->_exclusivePath _open];
    }
    fcntl(self->_exclusiveFD, 2, 1);
    unint64_t v8 = 0x1E4F1C000uLL;
    long long v9 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:self->_metaDataFilePath];
    metaData = self->_metaData;
    self->_metaData = v9;

    long long v11 = [(NSMutableDictionary *)self->_metaData objectForKeyedSubscript:@"QLCacheDebugModeMetadataKey"];
    int v12 = [v11 BOOLValue];
    int v13 = QLCacheInDebugMode();

    uint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    if ([v14 fileExistsAtPath:self->_dirtyFilePath])
    {
      uint64_t v15 = *(NSObject **)(v3 + 32);
      if (!v15)
      {
        QLTInitLogging();
        uint64_t v15 = *(NSObject **)(v3 + 32);
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DDC5E000, v15, OS_LOG_TYPE_INFO, "dirty lock is on disk, resetting cache", buf, 2u);
      }
      uint64_t v16 = @"dirty atomic write";
    }
    else
    {
      int v31 = [v14 fileExistsAtPath:self->_resetFilePath];
      if ((v31 & 1) == 0 && ((v12 ^ v13) & 1) == 0)
      {
        int v32 = [(QLCacheIndexDatabase *)self->_indexDatabase doesExist];
        int v33 = [(QLCacheMMAPBlobDatabase *)self->_blobDatabase doesExist];
        if (v32 == v33)
        {
          if (((v32 | v33) & 1) == 0)
          {
            double v47 = *(NSObject **)(v3 + 32);
            if (!v47)
            {
              QLTInitLogging();
              double v47 = *(NSObject **)(v3 + 32);
            }
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
              -[QLDiskCache _open].cold.8();
            }
          }
        }
        else
        {
          uint64_t v34 = *(NSObject **)(v3 + 32);
          if (!v34)
          {
            QLTInitLogging();
            uint64_t v34 = *(NSObject **)(v3 + 32);
          }
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            [(QLDiskCache *)(void **)&self->_indexDatabase _open];
          }
          [(QLDiskCache *)self _createDirtyLockInformDelegate:0];
          [(QLDiskCache *)self _closeWhatIsOpen];
          if (v32) {
            uint64_t v35 = @"blob not found";
          }
          else {
            uint64_t v35 = @"index not found";
          }
          [(QLDiskCache *)self _resetWithReason:v35];
          [(QLDiskCache *)self _removeDirtyLock];
        }
        goto LABEL_17;
      }
      double v44 = *(NSObject **)(v3 + 32);
      if (v31)
      {
        if (!v44)
        {
          QLTInitLogging();
          double v44 = *(NSObject **)(v3 + 32);
        }
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DDC5E000, v44, OS_LOG_TYPE_INFO, "marked as needing reset on previous session", buf, 2u);
        }
        uint64_t v16 = @"marked as needing reset on previous session";
      }
      else
      {
        if (!v44)
        {
          QLTInitLogging();
          double v44 = *(NSObject **)(v3 + 32);
        }
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          double v46 = v44;
          *(_DWORD *)buf = 67109120;
          int v54 = QLCacheInDebugMode();
          _os_log_impl(&dword_1DDC5E000, v46, OS_LOG_TYPE_INFO, "changed debug mode to %d", buf, 8u);
        }
        uint64_t v16 = @"cache debug mode changed";
      }
    }
    [(QLDiskCache *)self _closeWhatIsOpen];
    [(QLDiskCache *)self _resetWithReason:v16];
    [(QLDiskCache *)self _removeDirtyLock];
    [(QLDiskCache *)self _cleanupForceResetAtNextLaunch];
LABEL_17:
    [(QLDiskCache *)self _createDirtyLockInformDelegate:1];
    p_indexDatabase = &self->_indexDatabase;
    [(QLCacheIndexDatabase *)self->_indexDatabase open];
    p_blobDatabase = &self->_blobDatabase;
    [(QLCacheMMAPBlobDatabase *)self->_blobDatabase open];
    self->_BOOL opened = 1;
    if (![(QLCacheIndexDatabase *)self->_indexDatabase isValid]
      || ![(QLCacheMMAPBlobDatabase *)*p_blobDatabase isValid])
    {
      if ([(QLCacheIndexDatabase *)*p_indexDatabase isValid]) {
        BOOL v19 = @"valid";
      }
      else {
        BOOL v19 = @"invalid";
      }
      if ([(QLCacheMMAPBlobDatabase *)*p_blobDatabase isValid]) {
        v20 = @"valid";
      }
      else {
        v20 = @"invalid";
      }
      NSLog(&cfstr_SomethingIsWro.isa, v19, v20);
      int v21 = *(NSObject **)(v3 + 32);
      if (!v21)
      {
        QLTInitLogging();
        int v21 = *(NSObject **)(v3 + 32);
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        [(QLDiskCache *)(void **)&self->_indexDatabase _open];
      }
      [(QLDiskCache *)self _closeWhatIsOpen];
      [(QLDiskCache *)self _resetWithReason:@"index or blob is invalid"];
      [(QLCacheIndexDatabase *)self->_indexDatabase open];
      [(QLCacheMMAPBlobDatabase *)self->_blobDatabase open];
      self->_BOOL opened = 1;
      if (![(QLCacheIndexDatabase *)self->_indexDatabase isValid]
        || ![(QLCacheMMAPBlobDatabase *)*p_blobDatabase isValid])
      {
        int v22 = *(NSObject **)(v3 + 32);
        if (!v22)
        {
          QLTInitLogging();
          int v22 = *(NSObject **)(v3 + 32);
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[QLDiskCache _open]();
        }
        [(QLDiskCache *)self _closeWhatIsOpen];
      }
    }
    if (!self->_opened) {
      goto LABEL_79;
    }
    uint64_t v23 = [(QLCacheIndexDatabase *)*p_indexDatabase allReservedBuffers];
    if ([(QLCacheMMAPBlobDatabase *)*p_blobDatabase deleteBlobsWithArray:v23])
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v24 = v23;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v49 != v27) {
              objc_enumerationMutation(v24);
            }
            [(QLCacheIndexDatabase *)*p_indexDatabase removeReservedBufferWithBlobInfo:*(void *)(*((void *)&v48 + 1) + 8 * i)];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v48 objects:v52 count:16];
        }
        while (v26);
      }

      unint64_t v8 = 0x1E4F1C000;
    }
    else
    {
      NSLog(&cfstr_ProblemToFreeA.isa);
      uint64_t v36 = *(NSObject **)(v3 + 32);
      if (!v36)
      {
        QLTInitLogging();
        uint64_t v36 = *(NSObject **)(v3 + 32);
      }
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        -[QLDiskCache _open].cold.4();
      }
      [(QLDiskCache *)self _close];
      [(QLDiskCache *)self _resetWithReason:@"unable to clean-up reserved buffer"];
      [(QLCacheIndexDatabase *)self->_indexDatabase open];
      [(QLCacheMMAPBlobDatabase *)self->_blobDatabase open];
      self->_BOOL opened = 1;
      if (![(QLCacheIndexDatabase *)self->_indexDatabase isValid]
        || ![(QLCacheMMAPBlobDatabase *)*p_blobDatabase isValid])
      {
        uint64_t v37 = *(NSObject **)(v3 + 32);
        if (!v37)
        {
          QLTInitLogging();
          uint64_t v37 = *(NSObject **)(v3 + 32);
        }
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          -[QLDiskCache _open]();
        }
        [(QLDiskCache *)self _closeWhatIsOpen];
      }
    }
    if (self->_opened)
    {
      if (!self->_metaData)
      {
        v38 = [*(id *)(v8 + 2656) dictionaryWithContentsOfFile:self->_metaDataFilePath];
        v39 = self->_metaData;
        self->_metaData = v38;

        if (!self->_metaData)
        {
          v40 = (NSMutableDictionary *)objc_alloc_init(*(Class *)(v8 + 2656));
          int v41 = self->_metaData;
          self->_metaData = v40;
        }
      }
      double v42 = [NSNumber numberWithBool:QLCacheInDebugMode()];
      [(QLDiskCache *)self setMetaData:v42 forKey:@"QLCacheDebugModeMetadataKey"];
    }
    if (!self->_opened)
    {
LABEL_79:
      if (*p_exclusiveFD >= 1)
      {
        if (close(*p_exclusiveFD))
        {
          double v43 = *(NSObject **)(v3 + 32);
          if (!v43)
          {
            QLTInitLogging();
            double v43 = *(NSObject **)(v3 + 32);
          }
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
            -[QLDiskCache _open]();
          }
        }
        else
        {
          int *p_exclusiveFD = 0;
        }
      }
    }
    [(QLDiskCache *)self _removeDirtyLock];
    BOOL opened = self->_opened;

    return opened;
  }
  int *p_exclusiveFD = 0;
  id v29 = *(NSObject **)(v3 + 32);
  if (!v29)
  {
    QLTInitLogging();
    id v29 = *(NSObject **)(v3 + 32);
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    -[QLDiskCache _open](v29);
  }
  return 0;
}

- (void)_closeWhatIsOpen
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "closing what is already open", v2, v3, v4, v5, v6);
}

- (void)_close
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "close the cache", v2, v3, v4, v5, v6);
}

- (void)_resetWithReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MEMORY[0x1E4F3A768];
  uint8_t v6 = *(NSObject **)(MEMORY[0x1E4F3A768] + 32);
  if (!v6)
  {
    QLTInitLogging();
    uint8_t v6 = *(NSObject **)(v5 + 32);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unint64_t v8 = 0;
    _os_log_impl(&dword_1DDC5E000, v6, OS_LOG_TYPE_INFO, "reset of the cache", v8, 2u);
  }
  if (v4)
  {
    [v4 writeToFile:self->_resetReasonPath atomically:1 encoding:4 error:0];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v7 removeItemAtPath:self->_resetReasonPath error:0];
  }
  unlink([(NSString *)self->_metaDataFilePath fileSystemRepresentation]);
  [(QLCacheIndexDatabase *)self->_indexDatabase reset];
  [(QLCacheMMAPBlobDatabase *)self->_blobDatabase reset];
}

- (id)_checkConsistency
{
  uint64_t v3 = [(QLCacheIndexDatabase *)self->_indexDatabase allBuffersIncludingReserved:1];
  id v4 = [(QLCacheMMAPBlobDatabase *)self->_blobDatabase checkConsistency:v3];
  uint64_t v5 = v4;
  if (v4) {
    uint8_t v6 = v4;
  }
  else {
    uint8_t v6 = @"OK";
  }

  return v6;
}

- (BOOL)open
{
  uint64_t v5 = 0;
  uint8_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __19__QLDiskCache_open__block_invoke;
  v4[3] = &unk_1E6D0CAC0;
  v4[4] = self;
  v4[5] = &v5;
  [(QLDiskCache *)self do:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __19__QLDiskCache_open__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _open];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)close
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __20__QLDiskCache_close__block_invoke;
  v2[3] = &unk_1E6D0C648;
  v2[4] = self;
  [(QLDiskCache *)self do:v2];
}

uint64_t __20__QLDiskCache_close__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createDirtyLockInformDelegate:1];
  [*(id *)(a1 + 32) _close];
  char v2 = *(void **)(a1 + 32);
  return [v2 _removeDirtyLock];
}

- (void)reset
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __20__QLDiskCache_reset__block_invoke;
  v2[3] = &unk_1E6D0C648;
  v2[4] = self;
  [(QLDiskCache *)self do:v2];
}

uint64_t __20__QLDiskCache_reset__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createDirtyLockInformDelegate:0];
  [*(id *)(a1 + 32) _resetWithReason:@"forced"];
  char v2 = *(void **)(a1 + 32);
  return [v2 _removeDirtyLock];
}

- (id)checkConsistency
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy__2;
  long long v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__QLDiskCache_checkConsistency__block_invoke;
  v5[3] = &unk_1E6D0D0A0;
  v5[4] = self;
  v5[5] = &v6;
  [(QLDiskCache *)self doWriting:v5];
  char v2 = (void *)v7[5];
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = @"cache is closed";
  }
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __31__QLDiskCache_checkConsistency__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _checkConsistency];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 1;
}

- (id)metaDataForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_metaData objectForKey:a3];
}

- (void)setMetaData:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMutableDictionary *)self->_metaData objectForKey:v6];
  if (v8)
  {
    if (!v7 || ([v7 isEqual:v8] & 1) == 0)
    {
      [(NSMutableDictionary *)self->_metaData setObject:v8 forKey:v6];
      self->_metaDataDirty = 1;
    }
  }
  else
  {

    if (v7)
    {
      [(NSMutableDictionary *)self->_metaData removeObjectForKey:v6];
      self->_metaDataDirty = 1;
    }
  }
}

- (unint64_t)sizeSumOfThumbnailsOlderThanDate:(id)a3
{
  return [(QLCacheIndexDatabase *)self->_indexDatabase sizeSumOfThumbnailsOlderThanDate:a3];
}

- (id)reserveBufferWithLength:(unint64_t)a3
{
  if (a3)
  {
    p_blobDatabase = &self->_blobDatabase;
    uint64_t v5 = -[QLCacheMMAPBlobDatabase reserveBufferWithLength:](self->_blobDatabase, "reserveBufferWithLength:");
    if (v5)
    {
      [(QLCacheIndexDatabase *)self->_indexDatabase addReservedBufferWithBlobInfo:v5];
      uint64_t v6 = MEMORY[0x1E4F3A768];
      uint64_t v7 = *(NSObject **)(MEMORY[0x1E4F3A768] + 32);
      if (!v7)
      {
        QLTInitLogging();
        uint64_t v7 = *(NSObject **)(v6 + 32);
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        [(QLDiskCache *)(uint64_t)p_blobDatabase reserveBufferWithLength:v5];
      }
    }
    else
    {
      uint64_t v8 = MEMORY[0x1E4F3A768];
      long long v9 = *(NSObject **)(MEMORY[0x1E4F3A768] + 32);
      if (!v9)
      {
        QLTInitLogging();
        long long v9 = *(NSObject **)(v8 + 32);
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[QLDiskCache reserveBufferWithLength:]();
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)reserveBufferForData:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = -[QLDiskCache reserveBufferWithLength:](self, "reserveBufferWithLength:", [v4 length]);
    if (v5)
    {
      uint64_t v6 = [(QLCacheMMAPBlobDatabase *)self->_blobDatabase bufferPointedToByBlobInfo:v5];
      id v7 = v4;
      memcpy(v6, (const void *)[v7 bytes], objc_msgSend(v7, "length"));
    }
    else
    {
      uint64_t v8 = MEMORY[0x1E4F3A768];
      long long v9 = *(NSObject **)(MEMORY[0x1E4F3A768] + 32);
      if (!v9)
      {
        QLTInitLogging();
        long long v9 = *(NSObject **)(v8 + 32);
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        long long v10 = v9;
        int v12 = 134217984;
        uint64_t v13 = [v4 length];
        _os_log_impl(&dword_1DDC5E000, v10, OS_LOG_TYPE_INFO, "cannot reserve buffer %llu", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)validateReservedBuffer:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
LABEL_7:
    BOOL v9 = 1;
    goto LABEL_13;
  }
  if ([(QLCacheIndexDatabase *)self->_indexDatabase removeReservedBufferWithBlobInfo:v4])
  {
    blobDatabase = self->_blobDatabase;
    p_blobDatabase = &self->_blobDatabase;
    [(QLCacheMMAPBlobDatabase *)blobDatabase validateReservedBufferWithBlobInfo:v4];
    uint64_t v7 = MEMORY[0x1E4F3A768];
    uint64_t v8 = *(NSObject **)(MEMORY[0x1E4F3A768] + 32);
    if (!v8)
    {
      QLTInitLogging();
      uint64_t v8 = *(NSObject **)(v7 + 32);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(QLDiskCache *)(uint64_t)p_blobDatabase validateReservedBuffer:v4];
    }
    goto LABEL_7;
  }
  uint64_t v10 = MEMORY[0x1E4F3A768];
  id v11 = *(NSObject **)(MEMORY[0x1E4F3A768] + 32);
  if (!v11)
  {
    QLTInitLogging();
    id v11 = *(NSObject **)(v10 + 32);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[QLDiskCache validateReservedBuffer:]();
  }
  BOOL v9 = 0;
LABEL_13:

  return v9;
}

- (BOOL)discardReservedBuffer:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
LABEL_7:
    BOOL v9 = 1;
    goto LABEL_13;
  }
  if ([(QLCacheIndexDatabase *)self->_indexDatabase removeReservedBufferWithBlobInfo:v4])
  {
    blobDatabase = self->_blobDatabase;
    p_blobDatabase = &self->_blobDatabase;
    [(QLCacheMMAPBlobDatabase *)blobDatabase discardReservedBufferWithBlobInfo:v4];
    uint64_t v7 = MEMORY[0x1E4F3A768];
    uint64_t v8 = *(NSObject **)(MEMORY[0x1E4F3A768] + 32);
    if (!v8)
    {
      QLTInitLogging();
      uint64_t v8 = *(NSObject **)(v7 + 32);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(QLDiskCache *)(uint64_t)p_blobDatabase discardReservedBuffer:v4];
    }
    goto LABEL_7;
  }
  uint64_t v10 = MEMORY[0x1E4F3A768];
  id v11 = *(NSObject **)(MEMORY[0x1E4F3A768] + 32);
  if (!v11)
  {
    QLTInitLogging();
    id v11 = *(NSObject **)(v10 + 32);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[QLDiskCache discardReservedBuffer:]();
  }
  BOOL v9 = 0;
LABEL_13:

  return v9;
}

- (unint64_t)maxThumbnailLifeTime
{
  return [(QLCacheIndexDatabase *)self->_indexDatabase maxThumbnailLifeTime];
}

- (unint64_t)fileEntryCount
{
  return [(QLCacheIndexDatabase *)self->_indexDatabase fileEntryCount];
}

- (unint64_t)thumbnailCount
{
  return [(QLCacheIndexDatabase *)self->_indexDatabase thumbnailCount];
}

- (id)lastCrapWithDate:(id *)a3
{
  return [(QLCacheIndexDatabase *)self->_indexDatabase lastCrapWithDate:a3];
}

- (id)lastResetWithDate:(id *)a3
{
  uint64_t v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_resetReasonPath isDirectory:0];
  int v6 = [v5 getResourceValue:a3 forKey:*MEMORY[0x1E4F1C530] error:0];
  uint64_t v7 = 0;
  if (v6)
  {
    uint64_t v7 = [NSString stringWithContentsOfFile:self->_resetReasonPath encoding:4 error:0];
  }

  return v7;
}

- (BOOL)setLastHitDateOfAllCachedThumbnailsToDate:(id)a3
{
  return [(QLCacheIndexDatabase *)self->_indexDatabase setLastHitDateOfAllCachedThumbnailsToDate:a3];
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (QLDiskCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (QLDiskCacheDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasDirtyLock
{
  return self->_hasDirtyLock;
}

- (int64_t)writingCount
{
  return self->_writingCount;
}

- (void)setMetaDataDirty:(BOOL)a3
{
  self->_metaDataDirty = a3;
}

- (NSMutableDictionary)metaData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMetaData:(id)a3
{
}

- (NSString)metaDataFilePath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMetaDataFilePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_databaseLock, 0);
  objc_storeStrong((id *)&self->_resetReasonPath, 0);
  objc_storeStrong((id *)&self->_resetFilePath, 0);
  objc_storeStrong((id *)&self->_exclusivePath, 0);
  objc_storeStrong((id *)&self->_dirtyFilePath, 0);
  objc_storeStrong((id *)&self->_metaDataFilePath, 0);
  objc_storeStrong((id *)&self->_blobDatabase, 0);
  objc_storeStrong((id *)&self->_indexDatabase, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)noteRemoteThumbnailMissingForItems:(id)a3
{
}

- (void)noteRemoteThumbnailPresentForItems:(id)a3
{
}

- (id)itemsAfterFilteringOutItemsWithMissingThumbnails:(id)a3
{
  return [(QLCacheIndexDatabase *)self->_indexDatabase itemsAfterFilteringOutItemsWithMissingThumbnails:a3];
}

- (BOOL)itemIsMissingRemoteThumbnail:(id)a3
{
  return [(QLCacheIndexDatabase *)self->_indexDatabase itemIsMissingRemoteThumbnail:a3];
}

- (BOOL)removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:(id)a3
{
  uint64_t v3 = self;
  id v4 = [(QLCacheIndexDatabase *)self->_indexDatabase removeFilesFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:a3];
  LOBYTE(v3) = [(QLDiskCache *)v3 _deleteBlobArrayFromDatabase:v4] != 0;

  return (char)v3;
}

- (BOOL)removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:(id)a3
{
  uint64_t v3 = self;
  id v4 = [(QLCacheIndexDatabase *)self->_indexDatabase removeFilesFromUninstalledFileProvidersWithIdentifiers:a3];
  LOBYTE(v3) = [(QLDiskCache *)v3 _deleteBlobArrayFromDatabase:v4] != 0;

  return (char)v3;
}

+ (void)defaultLocation
{
  id v1 = a1;
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_3(&dword_1DDC5E000, v3, v4, "Can not get the user cache directory '%s'", v5, v6, v7, v8, v9);
}

+ (void)setupCacheAtLocationIfNecessary:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "Did create %@", v2, v3, v4, v5, v6);
}

+ (void)setupCacheAtLocationIfNecessary:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_fault_impl(&dword_1DDC5E000, v0, OS_LOG_TYPE_FAULT, "Could not create %@", v1, 0xCu);
}

+ (void)setupCacheAtLocationIfNecessary:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "Creating directory '%@'", v2, v3, v4, v5, v6);
}

- (void)initWithPathLocation:(uint64_t)a3 cacheSize:(uint64_t)a4 cacheThread:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, a2, a3, "init cache, _exclusivePath = %@", a5, a6, a7, a8, 2u);
}

- (void)_setThumbnailData:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "insertOrUpdateImageDataForCacheId failed, discarding buffers", v2, v3, v4, v5, v6);
}

- (void)_setThumbnailData:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  log = a1;
  uint64_t v3 = [a2 fileIdentifier];
  uint64_t v15 = [a2 bitmapFormat];
  uint64_t v13 = [v15 width];
  uint64_t v4 = [a2 bitmapFormat];
  uint64_t v5 = [v4 height];
  uint8_t v6 = [a2 bitmapDataToValidate];
  uint64_t v7 = [v6 location];
  uint64_t v8 = [a2 bitmapDataToValidate];
  uint64_t v9 = [v8 length];
  uint64_t v10 = [a2 metadataToValidate];
  uint64_t v11 = [v10 location];
  int v12 = [a2 metadataToValidate];
  *(_DWORD *)buf = 138413826;
  uint64_t v17 = v3;
  __int16 v18 = 2048;
  uint64_t v19 = v13;
  __int16 v20 = 2048;
  uint64_t v21 = v5;
  __int16 v22 = 2048;
  uint64_t v23 = v7;
  __int16 v24 = 2048;
  uint64_t v25 = v9;
  __int16 v26 = 2048;
  uint64_t v27 = v11;
  __int16 v28 = 2048;
  uint64_t v29 = [v12 length];
  _os_log_debug_impl(&dword_1DDC5E000, log, OS_LOG_TYPE_DEBUG, "insert data %@ {%zu, %zu} thumbnail location : %llu length : %llu content rect location : %llu length : %llu", buf, 0x48u);
}

- (void)_setThumbnailData:(void *)a1 .cold.3(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 fileIdentifier];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_12_0(&dword_1DDC5E000, v5, v6, "pending thumbnail data has been invalidated, so we don't save it to the disk cache %@", v7, v8, v9, v10, v11);
}

- (void)_createDirtyLockInformDelegate:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_3(&dword_1DDC5E000, v3, v4, "error opening dirty file: %s", v5, v6, v7, v8, v9);
}

- (void)doWriting:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "-_doWriting", v2, v3, v4, v5, v6);
}

void __25__QLDiskCache_doWriting___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "-_doWriting is on queue", v2, v3, v4, v5, v6);
}

- (void)freeDiskSpaceForNewThumbnails
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "Freeing space for new thumbnails.", v2, v3, v4, v5, v6);
}

- (void)_open
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "opening the cache", v2, v3, v4, v5, v6);
}

- (void)reserveBufferWithLength:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "Can't reserve buffer", v2, v3, v4, v5, v6);
}

- (void)reserveBufferWithLength:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  OUTLINED_FUNCTION_8_2();
  [a3 location];
  [a3 length];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_5_1(&dword_1DDC5E000, v6, v7, "buffer reserved, pointer: %p location: %lld length: %lld", v8, v9, v10, v11, v12);
}

- (void)validateReservedBuffer:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  OUTLINED_FUNCTION_8_2();
  [a3 location];
  [a3 length];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_5_1(&dword_1DDC5E000, v6, v7, "buffer validated, pointer: %p location: %lld length: %lld", v8, v9, v10, v11, v12);
}

- (void)validateReservedBuffer:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "failed to remove buffer from reserved table while validating %@", v2, v3, v4, v5, v6);
}

- (void)discardReservedBuffer:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  OUTLINED_FUNCTION_8_2();
  [a3 location];
  [a3 length];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_5_1(&dword_1DDC5E000, v6, v7, "buffer discarded, pointer: %p location: %lld length: %lld", v8, v9, v10, v11, v12);
}

- (void)discardReservedBuffer:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "failed to remove buffer from reserved table while discarding reserved buffer for %@", v2, v3, v4, v5, v6);
}

@end