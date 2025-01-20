@interface TVAssetLibrary
+ (id)sharedInstance;
+ (void)_initializeAssetLibraryWithCachePath:(id)a3 screensaverCache:(BOOL)a4 purgeCacheOnLoad:(BOOL)a5;
+ (void)initializeAssetLibraryWithCachePath:(id)a3;
+ (void)initializeAssetLibraryWithCachePath:(id)a3 purgeCacheOnLoad:(BOOL)a4;
+ (void)intializeScreensaverSharedAssetLibrary;
- (NSMutableArray)registeredGroups;
- (NSString)cachePath;
- (TVAssetLibrary)initWithCachePath:(id)a3 screensaverCache:(BOOL)a4 purgeCacheOnLoad:(BOOL)a5;
- (id)assetExpiryDateForKey:(id)a3 inGroupOfType:(int64_t)a4;
- (id)assetForKey:(id)a3 inGroupOfType:(int64_t)a4;
- (id)assetPathForKey:(id)a3 inGroupOfType:(int64_t)a4;
- (id)assetPathsForGroupOfType:(int64_t)a3;
- (id)cachePathForGroupOfType:(int64_t)a3;
- (id)groupWithGroupType:(int64_t)a3;
- (id)keyForAssetWithTags:(id)a3 inGroupOfType:(int64_t)a4;
- (void)_setImageAsset:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6 overWrite:(BOOL)a7 tags:(id)a8;
- (void)purgeAssetsInGroupOfType:(int64_t)a3;
- (void)registerGroup:(id)a3;
- (void)removeAssetForKey:(id)a3 inGroupOfType:(int64_t)a4;
- (void)setCachePath:(id)a3;
- (void)setImageAsset:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6;
- (void)setImageAsset:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6 overWrite:(BOOL)a7;
- (void)setImageAsset:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6 tags:(id)a7;
- (void)setImageAssetFromPath:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6;
- (void)setImageAssetFromPath:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6 tags:(id)a7;
- (void)setRegisteredGroups:(id)a3;
- (void)unRegisterGroup:(int64_t)a3;
- (void)updateAssetsInGroupOfType:(int64_t)a3;
@end

@implementation TVAssetLibrary

+ (id)sharedInstance
{
  return (id)sSharedInstance;
}

+ (void)initializeAssetLibraryWithCachePath:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() initializeAssetLibraryWithCachePath:v3 purgeCacheOnLoad:0];
}

+ (void)initializeAssetLibraryWithCachePath:(id)a3 purgeCacheOnLoad:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  [(id)objc_opt_class() _initializeAssetLibraryWithCachePath:v5 screensaverCache:0 purgeCacheOnLoad:v4];
}

+ (void)intializeScreensaverSharedAssetLibrary
{
  id v2 = [@"/var/mobile/Library/Caches" stringByAppendingPathComponent:@"com.apple.AppleTV"];
  [(id)objc_opt_class() _initializeAssetLibraryWithCachePath:v2 screensaverCache:1 purgeCacheOnLoad:0];
}

+ (void)_initializeAssetLibraryWithCachePath:(id)a3 screensaverCache:(BOOL)a4 purgeCacheOnLoad:(BOOL)a5
{
  id v7 = a3;
  if ([v7 length])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __89__TVAssetLibrary__initializeAssetLibraryWithCachePath_screensaverCache_purgeCacheOnLoad___block_invoke;
    v8[3] = &unk_264BA6B48;
    id v9 = v7;
    BOOL v10 = a4;
    BOOL v11 = a5;
    if (_initializeAssetLibraryWithCachePath_screensaverCache_purgeCacheOnLoad__onceToken != -1) {
      dispatch_once(&_initializeAssetLibraryWithCachePath_screensaverCache_purgeCacheOnLoad__onceToken, v8);
    }
  }
}

uint64_t __89__TVAssetLibrary__initializeAssetLibraryWithCachePath_screensaverCache_purgeCacheOnLoad___block_invoke(uint64_t a1)
{
  v1 = [[TVAssetLibrary alloc] initWithCachePath:*(void *)(a1 + 32) screensaverCache:*(unsigned __int8 *)(a1 + 40) purgeCacheOnLoad:*(unsigned __int8 *)(a1 + 41)];
  uint64_t v2 = sSharedInstance;
  sSharedInstance = (uint64_t)v1;
  return MEMORY[0x270F9A758](v1, v2);
}

- (TVAssetLibrary)initWithCachePath:(id)a3 screensaverCache:(BOOL)a4 purgeCacheOnLoad:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v28.receiver = self;
  v28.super_class = (Class)TVAssetLibrary;
  id v9 = [(TVAssetLibrary *)&v28 init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.ATVAssetLibrary.writeQueue", 0);
    assetWriteQueue = v9->assetWriteQueue;
    v9->assetWriteQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.ATVAssetLibrary.accessQueue", MEMORY[0x263EF83A8]);
    assetAccessQueue = v9->assetAccessQueue;
    v9->assetAccessQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [v8 copy];
    cachePath = v9->_cachePath;
    v9->_cachePath = (NSString *)v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    registeredGroups = v9->_registeredGroups;
    v9->_registeredGroups = v16;

    Boolean keyExistsAndHasValidFormat = 0;
    BOOL v18 = CFPreferencesGetAppBooleanValue(@"PurgeImageCache", @"com.apple.TVMLKit", &keyExistsAndHasValidFormat) != 0;
    if (keyExistsAndHasValidFormat) {
      BOOL v19 = v18;
    }
    else {
      BOOL v19 = v5;
    }
    v20 = [[_TVAssetGroup alloc] initWithGroupType:0 baseCachePath:v9->_cachePath folderName:@"SharedImageCache" maxCacheSize:512 purgeOnLoad:v19];
    [(TVAssetLibrary *)v9 registerGroup:v20];
    v21 = [[_TVAssetGroup alloc] initWithGroupType:1 baseCachePath:v9->_cachePath folderName:@"LSMImageCache" maxCacheSize:512 purgeOnLoad:v19];
    [(TVAssetLibrary *)v9 registerGroup:v21];
    v22 = [[_TVAssetGroup alloc] initWithGroupType:3 baseCachePath:v9->_cachePath folderName:@"TrickPlay" maxCacheSize:50 purgeOnLoad:1];
    [(TVAssetLibrary *)v9 registerGroup:v22];
    v23 = [[_TVAssetGroup alloc] initWithGroupType:4 baseCachePath:v9->_cachePath folderName:@"PhotostreamImages" maxCacheSize:280 purgeOnLoad:0];
    [(TVAssetLibrary *)v9 registerGroup:v23];
    v24 = [[_TVAssetGroup alloc] initWithGroupType:5 baseCachePath:v9->_cachePath folderName:@"ARFileCache" maxCacheSize:256 purgeOnLoad:v19];
    [(TVAssetLibrary *)v9 registerGroup:v24];
    if (v6)
    {
      v25 = [[_TVAssetGroup alloc] initWithGroupType:2 baseCachePath:v9->_cachePath folderName:@"ScreenSaverImages" maxCacheSize:250 purgeOnLoad:0];
      [(TVAssetLibrary *)v9 registerGroup:v25];
    }
  }

  return v9;
}

- (id)assetForKey:(id)a3 inGroupOfType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(TVAssetLibrary *)self groupWithGroupType:a4];
  id v8 = [v7 assetInfoForKey:v6 queue:self->assetAccessQueue];
  id v9 = [v8 objectForKey:@"ATVAssetPath"];
  if (v9)
  {
    dispatch_queue_t v10 = [MEMORY[0x263F08850] defaultManager];
    int v11 = [v10 fileExistsAtPath:v9];

    if (v11)
    {
      uint64_t v12 = +[TVImage imageWithPath:v9];
LABEL_6:
      uint64_t v14 = (void *)v12;
      goto LABEL_9;
    }
    [(TVAssetLibrary *)self removeAssetForKey:v6 inGroupOfType:a4];
  }
  else
  {
    v13 = [v8 objectForKey:@"ATVAsset"];

    if (v13)
    {
      uint64_t v12 = [v8 objectForKey:@"ATVAsset"];
      goto LABEL_6;
    }
  }
  uint64_t v14 = 0;
LABEL_9:

  return v14;
}

- (id)assetPathForKey:(id)a3 inGroupOfType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(TVAssetLibrary *)self groupWithGroupType:a4];
  id v8 = [v7 assetInfoForKey:v6 queue:self->assetAccessQueue];

  id v9 = [v8 objectForKey:@"ATVAssetPath"];

  return v9;
}

- (id)assetExpiryDateForKey:(id)a3 inGroupOfType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(TVAssetLibrary *)self groupWithGroupType:a4];
  id v8 = [v7 assetInfoForKey:v6 queue:self->assetAccessQueue];

  id v9 = [v8 objectForKey:@"ATVAssetExpiryDate"];

  return v9;
}

- (id)keyForAssetWithTags:(id)a3 inGroupOfType:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(TVAssetLibrary *)self groupWithGroupType:a4];
  id v8 = [v7 infoForAllAssetsWithTags:v6 queue:self->assetAccessQueue];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = [v8 allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v19 = v6;
    uint64_t v12 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v15 = [v8 objectForKeyedSubscript:v14];
        v16 = [v15 objectForKeyedSubscript:@"ATVAssetPath"];

        if (v16)
        {
          id v17 = v14;

          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    id v17 = 0;
LABEL_11:
    id v6 = v19;
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)removeAssetForKey:(id)a3 inGroupOfType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(TVAssetLibrary *)self groupWithGroupType:a4];
  [v7 removeAssetInfoForKey:v6 queue:self->assetAccessQueue];
}

- (void)setImageAsset:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6
{
}

- (void)setImageAsset:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6 overWrite:(BOOL)a7
{
}

- (void)setImageAsset:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6 tags:(id)a7
{
}

- (void)setImageAssetFromPath:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6
{
}

- (void)setImageAssetFromPath:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6 tags:(id)a7
{
  v42[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if ([v13 length])
  {
    id v33 = v14;
    id v16 = v13;
    id v17 = [(TVAssetLibrary *)self groupWithGroupType:a5];
    BOOL v18 = [v17 cachePath];
    id v19 = [v18 stringByAppendingPathComponent:v16];

    char v40 = 0;
    long long v20 = [MEMORY[0x263F08850] defaultManager];
    int v21 = [v20 fileExistsAtPath:v19 isDirectory:&v40];

    if (v21)
    {
      if (v40)
      {
        uint64_t v22 = 0;
      }
      else
      {
        int v39 = 0;
        v30 = [MEMORY[0x263F08850] defaultManager];
        uint64_t v22 = objc_msgSend(v30, "tv_onDiskSizeOfFileAtPath:status:", v19, &v39);

        if (v39) {
          uint64_t v22 = 0;
        }
        if (v22) {
          goto LABEL_19;
        }
      }
    }
    else
    {
      v24 = [MEMORY[0x263F08850] defaultManager];
      [v24 moveItemAtPath:v12 toPath:v19 error:0];

      uint64_t v25 = [MEMORY[0x263F08850] defaultManager];
      int v26 = [v25 fileExistsAtPath:v19 isDirectory:&v40];

      uint64_t v22 = 0;
      if (v26 && !v40)
      {
        int v39 = 0;
        v27 = [MEMORY[0x263F08850] defaultManager];
        uint64_t v28 = objc_msgSend(v27, "tv_onDiskSizeOfFileAtPath:status:", v19, &v39);

        if (v39) {
          uint64_t v22 = 0;
        }
        else {
          uint64_t v22 = v28;
        }
      }
      if (v22) {
        goto LABEL_19;
      }
    }
    if (!v40)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __77__TVAssetLibrary_setImageAssetFromPath_forKey_inGroupOfType_expiryDate_tags___block_invoke_2;
      block[3] = &unk_264BA69A0;
      id v35 = v16;
      dispatch_async(MEMORY[0x263EF83A0], block);
      v29 = v35;
      id v14 = v33;
LABEL_24:

      goto LABEL_25;
    }
LABEL_19:
    v29 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
    [v29 setObject:v19 forKeyedSubscript:@"ATVAssetPath"];
    v31 = [NSNumber numberWithUnsignedLongLong:v22];
    [v29 setObject:v31 forKeyedSubscript:@"ATVAssetSize"];

    v32 = [MEMORY[0x263EFF910] date];
    [v29 setObject:v32 forKeyedSubscript:@"ATVAssetLastAccessedDate"];

    id v14 = v33;
    if (v33) {
      [v29 setObject:v33 forKeyedSubscript:@"ATVAssetExpiryDate"];
    }
    if (v15) {
      [v29 setObject:v15 forKeyedSubscript:@"ATVAssetTags"];
    }
    [v17 setAssetInfo:v29 forKey:v16 queue:self->assetAccessQueue];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __77__TVAssetLibrary_setImageAssetFromPath_forKey_inGroupOfType_expiryDate_tags___block_invoke;
    v36[3] = &unk_264BA64A0;
    id v37 = v16;
    id v38 = v12;
    dispatch_async(MEMORY[0x263EF83A0], v36);

    goto LABEL_24;
  }
  long long v23 = TVMLKitImageLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_ERROR)) {
    -[TVAssetLibrary setImageAssetFromPath:forKey:inGroupOfType:expiryDate:tags:](v23);
  }
  id v16 = [MEMORY[0x263F08A00] defaultCenter];
  v41 = @"ATVAssetDidWriteNotificationErrorKey";
  id v17 = [MEMORY[0x263F087E8] errorWithDomain:@"TVMLKitErrorDomain" code:6 userInfo:0];
  v42[0] = v17;
  id v19 = [NSDictionary dictionaryWithObjects:v42 forKeys:&v41 count:1];
  [v16 postNotificationName:@"ATVAssetDidWriteNotification" object:v13 userInfo:v19];
LABEL_25:
}

void __77__TVAssetLibrary_setImageAssetFromPath_forKey_inGroupOfType_expiryDate_tags___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = @"ATVAssetDidWriteNotificationAssetPathKey";
  v7[0] = v3;
  BOOL v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"ATVAssetDidWriteNotification" object:v4 userInfo:v5];
}

void __77__TVAssetLibrary_setImageAssetFromPath_forKey_inGroupOfType_expiryDate_tags___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = @"ATVAssetDidWriteNotificationErrorKey";
  uint64_t v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-36 userInfo:0];
  v7[0] = v4;
  BOOL v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"ATVAssetDidWriteNotification" object:v3 userInfo:v5];
}

- (void)purgeAssetsInGroupOfType:(int64_t)a3
{
  id v4 = [(TVAssetLibrary *)self groupWithGroupType:a3];
  [v4 removeAllAssetsWithQueue:self->assetAccessQueue];
}

- (void)updateAssetsInGroupOfType:(int64_t)a3
{
  id v3 = [(TVAssetLibrary *)self groupWithGroupType:a3];
  [v3 updateAssetsFromFiles];
}

- (id)assetPathsForGroupOfType:(int64_t)a3
{
  id v4 = [(TVAssetLibrary *)self groupWithGroupType:a3];
  BOOL v5 = [v4 infoForAllAssetsWithQueue:self->assetAccessQueue];
  id v6 = [v5 allValues];
  id v7 = objc_msgSend(v6, "tv_arrayByMappingObjectsUsingBlock:", &__block_literal_global_12);

  return v7;
}

uint64_t __43__TVAssetLibrary_assetPathsForGroupOfType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"ATVAssetPath"];
}

- (id)cachePathForGroupOfType:(int64_t)a3
{
  id v3 = [(TVAssetLibrary *)self groupWithGroupType:a3];
  id v4 = [v3 cachePath];

  return v4;
}

- (void)registerGroup:(id)a3
{
}

- (void)unRegisterGroup:(int64_t)a3
{
  id v4 = [(TVAssetLibrary *)self groupWithGroupType:a3];
  [(NSMutableArray *)self->_registeredGroups removeObject:v4];
}

- (id)groupWithGroupType:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_registeredGroups;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "groupType", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)_setImageAsset:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6 overWrite:(BOOL)a7 tags:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  BOOL v18 = [(TVAssetLibrary *)self groupWithGroupType:a5];
  id v19 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  [v19 setObject:v14 forKeyedSubscript:@"ATVAsset"];
  long long v20 = [MEMORY[0x263EFF910] date];
  [v19 setObject:v20 forKeyedSubscript:@"ATVAssetLastAccessedDate"];

  if (v16) {
    [v19 setObject:v16 forKeyedSubscript:@"ATVAssetExpiryDate"];
  }
  [v18 setAssetInfo:v19 forKey:v15 queue:self->assetAccessQueue];
  objc_initWeak(&location, self);
  assetWriteQueue = self->assetWriteQueue;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __80__TVAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke;
  v27[3] = &unk_264BA6F20;
  id v28 = v15;
  id v29 = v18;
  BOOL v34 = a7;
  id v30 = v14;
  id v22 = v14;
  id v23 = v18;
  id v24 = v15;
  objc_copyWeak(&v33, &location);
  id v31 = v16;
  id v32 = v17;
  id v25 = v17;
  id v26 = v16;
  dispatch_async(assetWriteQueue, v27);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

void __80__TVAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) cachePath];
  id v4 = [v3 stringByAppendingPathComponent:v2];

  if (!*(unsigned char *)(a1 + 80))
  {
    uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
    int v6 = [v5 fileExistsAtPath:v4];

    if (v6)
    {
      *(_DWORD *)buf = 0;
      uint64_t v7 = (void *)MEMORY[0x263F08850];
      goto LABEL_6;
    }
  }
  if ([0 length])
  {
    [0 writeToFile:v4 atomically:0];
    *(_DWORD *)buf = 0;
    uint64_t v7 = (void *)MEMORY[0x263F08850];
LABEL_6:
    id v8 = [v7 defaultManager];
    uint64_t v9 = objc_msgSend(v8, "tv_onDiskSizeOfFileAtPath:status:", v4, buf);

    if (*(_DWORD *)buf) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = v9;
    }
    goto LABEL_22;
  }
  CFURLRef v11 = CFURLCreateWithFileSystemPath(0, v4, kCFURLPOSIXPathStyle, 0);
  if (v11)
  {
    CFURLRef v12 = v11;
    long long v13 = [*(id *)(a1 + 48) imageType];
    id v14 = CGImageDestinationCreateWithURL(v12, v13, 1uLL, 0);
    if (v14)
    {
      id v15 = v14;
      CGImageDestinationAddImage(v14, (CGImageRef)[*(id *)(a1 + 48) image], 0);
      if (CGImageDestinationFinalize(v15))
      {
        *(_DWORD *)buf = 0;
        id v16 = [MEMORY[0x263F08850] defaultManager];
        uint64_t v17 = objc_msgSend(v16, "tv_onDiskSizeOfFileAtPath:status:", v4, buf);

        if (*(_DWORD *)buf) {
          uint64_t v10 = 0;
        }
        else {
          uint64_t v10 = v17;
        }
      }
      else
      {
        BOOL v18 = TVMLKitImageLogObject;
        if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFURLRef v34 = v12;
          _os_log_impl(&dword_230B4C000, v18, OS_LOG_TYPE_DEFAULT, "CGImageDestinationFinalize failed to save image to: %@", buf, 0xCu);
        }
        uint64_t v10 = 0;
      }
      CFRelease(v15);
    }
    else
    {
      uint64_t v10 = 0;
    }
    CFRelease(v12);
  }
  else
  {
    uint64_t v10 = 0;
  }
LABEL_22:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  long long v20 = WeakRetained;
  if (WeakRetained) {
    int v21 = (void *)*((void *)WeakRetained + 2);
  }
  else {
    int v21 = 0;
  }
  id v22 = v21;
  if (v10)
  {
    id v23 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
    [v23 setObject:v4 forKeyedSubscript:@"ATVAssetPath"];
    id v24 = [NSNumber numberWithUnsignedLongLong:v10];
    [v23 setObject:v24 forKeyedSubscript:@"ATVAssetSize"];

    id v25 = [MEMORY[0x263EFF910] date];
    [v23 setObject:v25 forKeyedSubscript:@"ATVAssetLastAccessedDate"];

    uint64_t v26 = *(void *)(a1 + 56);
    if (v26) {
      [v23 setObject:v26 forKeyedSubscript:@"ATVAssetExpiryDate"];
    }
    uint64_t v27 = *(void *)(a1 + 64);
    if (v27) {
      [v23 setObject:v27 forKeyedSubscript:@"ATVAssetTags"];
    }
    [*(id *)(a1 + 40) setAssetInfo:v23 forKey:*(void *)(a1 + 32) queue:v22];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__TVAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke_51;
    block[3] = &unk_264BA64A0;
    id v31 = *(id *)(a1 + 32);
    id v32 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    [*(id *)(a1 + 40) removeAssetInfoForKey:*(void *)(a1 + 32) queue:v22];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __80__TVAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke_2;
    v28[3] = &unk_264BA69A0;
    id v29 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v28);
    id v23 = v29;
  }
}

void __80__TVAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke_51(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v6 = @"ATVAssetDidWriteNotificationAssetPathKey";
  v7[0] = v3;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"ATVAssetDidWriteNotification" object:v4 userInfo:v5];
}

void __80__TVAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  int v6 = @"ATVAssetDidWriteNotificationErrorKey";
  uint64_t v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-36 userInfo:0];
  v7[0] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"ATVAssetDidWriteNotification" object:v3 userInfo:v5];
}

- (NSString)cachePath
{
  return self->_cachePath;
}

- (void)setCachePath:(id)a3
{
}

- (NSMutableArray)registeredGroups
{
  return self->_registeredGroups;
}

- (void)setRegisteredGroups:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredGroups, 0);
  objc_storeStrong((id *)&self->_cachePath, 0);
  objc_storeStrong((id *)&self->assetAccessQueue, 0);
  objc_storeStrong((id *)&self->assetWriteQueue, 0);
}

- (void)setImageAssetFromPath:(os_log_t)log forKey:inGroupOfType:expiryDate:tags:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_230B4C000, log, OS_LOG_TYPE_ERROR, "Attempted to save image asset with nil key", v1, 2u);
}

@end