@interface VUIAssetLibrary
+ (id)sharedInstance;
+ (void)_initializeAssetLibraryWithCachePath:(id)a3 purgeCacheOnLoad:(BOOL)a4;
+ (void)initializeAssetLibraryWithCachePath:(id)a3 purgeCacheOnLoad:(BOOL)a4;
- (NSMutableArray)registeredGroups;
- (NSString)cachePath;
- (VUIAssetLibrary)initWithCachePath:(id)a3 purgeCacheOnLoad:(BOOL)a4;
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

@implementation VUIAssetLibrary

- (id)assetPathForKey:(id)a3 inGroupOfType:(int64_t)a4
{
  id v6 = a3;
  v7 = [(VUIAssetLibrary *)self groupWithGroupType:a4];
  v8 = [v7 assetInfoForKey:v6 queue:self->assetAccessQueue];

  v9 = [v8 objectForKey:@"VUIAssetPath"];

  return v9;
}

- (id)groupWithGroupType:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_registeredGroups;
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
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
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

+ (id)sharedInstance
{
  return (id)sSharedInstance;
}

uint64_t __73__VUIAssetLibrary__initializeAssetLibraryWithCachePath_purgeCacheOnLoad___block_invoke(uint64_t a1)
{
  v1 = [[VUIAssetLibrary alloc] initWithCachePath:*(void *)(a1 + 32) purgeCacheOnLoad:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v2 = sSharedInstance;
  sSharedInstance = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (VUIAssetLibrary)initWithCachePath:(id)a3 purgeCacheOnLoad:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)VUIAssetLibrary;
  uint64_t v7 = [(VUIAssetLibrary *)&v26 init];
  if (v7)
  {
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.VUIAssetLibrary.writeQueue", 0);
    assetWriteQueue = v7->assetWriteQueue;
    v7->assetWriteQueue = (OS_dispatch_queue *)v8;

    id v10 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.VUIAssetLibrary.accessQueue", v10);
    assetAccessQueue = v7->assetAccessQueue;
    v7->assetAccessQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = [v6 copy];
    cachePath = v7->_cachePath;
    v7->_cachePath = (NSString *)v13;

    long long v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    registeredGroups = v7->_registeredGroups;
    v7->_registeredGroups = v15;

    Boolean keyExistsAndHasValidFormat = 0;
    uint64_t v17 = [MEMORY[0x1E4F28B50] mainBundle];
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"PurgeImageCache", (CFStringRef)[v17 bundleIdentifier], &keyExistsAndHasValidFormat);

    if (keyExistsAndHasValidFormat) {
      uint64_t v19 = AppBooleanValue != 0;
    }
    else {
      uint64_t v19 = v4;
    }
    v20 = [[VUIAssetGroup alloc] initWithGroupType:0 baseCachePath:v7->_cachePath folderName:@"SharedImageCache" maxCacheSize:512 purgeOnLoad:v19];
    [(VUIAssetLibrary *)v7 registerGroup:v20];
    v21 = [[VUIAssetGroup alloc] initWithGroupType:1 baseCachePath:v7->_cachePath folderName:@"LSMImageCache" maxCacheSize:512 purgeOnLoad:v19];
    [(VUIAssetLibrary *)v7 registerGroup:v21];
    v22 = [[VUIAssetGroup alloc] initWithGroupType:2 baseCachePath:v7->_cachePath folderName:@"TrickPlay" maxCacheSize:50 purgeOnLoad:1];
    [(VUIAssetLibrary *)v7 registerGroup:v22];
    v23 = [[VUIAssetGroup alloc] initWithGroupType:3 baseCachePath:v7->_cachePath folderName:@"ARFileCache" maxCacheSize:256 purgeOnLoad:v19];
    [(VUIAssetLibrary *)v7 registerGroup:v23];
  }
  return v7;
}

- (void)registerGroup:(id)a3
{
}

+ (void)initializeAssetLibraryWithCachePath:(id)a3 purgeCacheOnLoad:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  [(id)objc_opt_class() _initializeAssetLibraryWithCachePath:v5 purgeCacheOnLoad:v4];
}

+ (void)_initializeAssetLibraryWithCachePath:(id)a3 purgeCacheOnLoad:(BOOL)a4
{
  id v5 = a3;
  if ([v5 length])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73__VUIAssetLibrary__initializeAssetLibraryWithCachePath_purgeCacheOnLoad___block_invoke;
    v6[3] = &unk_1E6DDDB08;
    id v7 = v5;
    BOOL v8 = a4;
    if (_initializeAssetLibraryWithCachePath_purgeCacheOnLoad__onceToken != -1) {
      dispatch_once(&_initializeAssetLibraryWithCachePath_purgeCacheOnLoad__onceToken, v6);
    }
  }
}

- (id)assetForKey:(id)a3 inGroupOfType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(VUIAssetLibrary *)self groupWithGroupType:a4];
  BOOL v8 = [v7 assetInfoForKey:v6 queue:self->assetAccessQueue];
  v9 = [v8 objectForKey:@"VUIAssetPath"];
  if (v9)
  {
    id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v11 = [v10 fileExistsAtPath:v9];

    if (v11)
    {
      uint64_t v12 = +[VUIImage imageWithPath:v9];
LABEL_6:
      long long v14 = (void *)v12;
      goto LABEL_9;
    }
    [(VUIAssetLibrary *)self removeAssetForKey:v6 inGroupOfType:a4];
  }
  else
  {
    uint64_t v13 = [v8 objectForKey:@"VUIAsset"];

    if (v13)
    {
      uint64_t v12 = [v8 objectForKey:@"VUIAsset"];
      goto LABEL_6;
    }
  }
  long long v14 = 0;
LABEL_9:

  return v14;
}

- (id)assetExpiryDateForKey:(id)a3 inGroupOfType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(VUIAssetLibrary *)self groupWithGroupType:a4];
  BOOL v8 = [v7 assetInfoForKey:v6 queue:self->assetAccessQueue];

  v9 = [v8 objectForKey:@"VUIVAssetExpiryDate"];

  return v9;
}

- (id)keyForAssetWithTags:(id)a3 inGroupOfType:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(VUIAssetLibrary *)self groupWithGroupType:a4];
  BOOL v8 = [v7 infoForAllAssetsWithTags:v6 queue:self->assetAccessQueue];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v9 = [v8 allKeys];
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
        long long v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v15 = [v8 objectForKeyedSubscript:v14];
        v16 = [v15 objectForKeyedSubscript:@"VUIAssetPath"];

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
  id v7 = [(VUIAssetLibrary *)self groupWithGroupType:a4];
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
  v42[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if ([v13 length])
  {
    id v33 = v14;
    id v16 = v13;
    id v17 = [(VUIAssetLibrary *)self groupWithGroupType:a5];
    v18 = [v17 cachePath];
    id v19 = [v18 stringByAppendingPathComponent:v16];

    char v40 = 0;
    long long v20 = [MEMORY[0x1E4F28CB8] defaultManager];
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
        v30 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v22 = objc_msgSend(v30, "vui_onDiskSizeOfFileAtPath:status:", v19, &v39);

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
      v24 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v24 moveItemAtPath:v12 toPath:v19 error:0];

      uint64_t v25 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v26 = [v25 fileExistsAtPath:v19 isDirectory:&v40];

      uint64_t v22 = 0;
      if (v26 && !v40)
      {
        int v39 = 0;
        v27 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v28 = objc_msgSend(v27, "vui_onDiskSizeOfFileAtPath:status:", v19, &v39);

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
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __78__VUIAssetLibrary_setImageAssetFromPath_forKey_inGroupOfType_expiryDate_tags___block_invoke_2;
      block[3] = &unk_1E6DDD328;
      id v35 = v16;
      dispatch_async(MEMORY[0x1E4F14428], block);
      v29 = v35;
      id v14 = v33;
LABEL_24:

      goto LABEL_25;
    }
LABEL_19:
    v29 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    [v29 setObject:v19 forKeyedSubscript:@"VUIAssetPath"];
    v31 = [NSNumber numberWithUnsignedLongLong:v22];
    [v29 setObject:v31 forKeyedSubscript:@"VUIAssetSize"];

    v32 = [MEMORY[0x1E4F1C9C8] date];
    [v29 setObject:v32 forKeyedSubscript:@"VUIAssetLastAccessedDate"];

    id v14 = v33;
    if (v33) {
      [v29 setObject:v33 forKeyedSubscript:@"VUIVAssetExpiryDate"];
    }
    if (v15) {
      [v29 setObject:v15 forKeyedSubscript:@"VUIAssetTags"];
    }
    [v17 setAssetInfo:v29 forKey:v16 queue:self->assetAccessQueue];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __78__VUIAssetLibrary_setImageAssetFromPath_forKey_inGroupOfType_expiryDate_tags___block_invoke;
    v36[3] = &unk_1E6DDD458;
    id v37 = v16;
    id v38 = v12;
    dispatch_async(MEMORY[0x1E4F14428], v36);

    goto LABEL_24;
  }
  long long v23 = VUICImageLogObject();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    -[VUIAssetLibrary setImageAssetFromPath:forKey:inGroupOfType:expiryDate:tags:](v23);
  }

  id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v41 = @"VUIAssetDidWriteNotificationErrorKey";
  id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VideosUICoreErrorDomain" code:104 userInfo:0];
  v42[0] = v17;
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
  [v16 postNotificationName:@"VUIAssetDidWriteNotification" object:v13 userInfo:v19];
LABEL_25:
}

void __78__VUIAssetLibrary_setImageAssetFromPath_forKey_inGroupOfType_expiryDate_tags___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = @"VUIAssetDidWriteNotificationAssetPathKey";
  v7[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"VUIAssetDidWriteNotification" object:v4 userInfo:v5];
}

void __78__VUIAssetLibrary_setImageAssetFromPath_forKey_inGroupOfType_expiryDate_tags___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = @"VUIAssetDidWriteNotificationErrorKey";
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-36 userInfo:0];
  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"VUIAssetDidWriteNotification" object:v3 userInfo:v5];
}

- (void)purgeAssetsInGroupOfType:(int64_t)a3
{
  id v4 = [(VUIAssetLibrary *)self groupWithGroupType:a3];
  [v4 removeAllAssetsWithQueue:self->assetAccessQueue];
}

- (void)updateAssetsInGroupOfType:(int64_t)a3
{
  id v3 = [(VUIAssetLibrary *)self groupWithGroupType:a3];
  [v3 updateAssetsFromFiles];
}

- (id)assetPathsForGroupOfType:(int64_t)a3
{
  id v4 = [(VUIAssetLibrary *)self groupWithGroupType:a3];
  id v5 = [v4 infoForAllAssetsWithQueue:self->assetAccessQueue];
  id v6 = [v5 allValues];
  id v7 = objc_msgSend(v6, "vui_arrayByMappingObjectsUsingBlock:", &__block_literal_global_20);

  return v7;
}

uint64_t __44__VUIAssetLibrary_assetPathsForGroupOfType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"VUIAssetPath"];
}

- (id)cachePathForGroupOfType:(int64_t)a3
{
  id v3 = [(VUIAssetLibrary *)self groupWithGroupType:a3];
  id v4 = [v3 cachePath];

  return v4;
}

- (void)unRegisterGroup:(int64_t)a3
{
  id v4 = [(VUIAssetLibrary *)self groupWithGroupType:a3];
  [(NSMutableArray *)self->_registeredGroups removeObject:v4];
}

- (void)_setImageAsset:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6 overWrite:(BOOL)a7 tags:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  v18 = [(VUIAssetLibrary *)self groupWithGroupType:a5];
  id v19 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  [v19 setObject:v14 forKeyedSubscript:@"VUIAsset"];
  long long v20 = [MEMORY[0x1E4F1C9C8] date];
  [v19 setObject:v20 forKeyedSubscript:@"VUIAssetLastAccessedDate"];

  if (v16) {
    [v19 setObject:v16 forKeyedSubscript:@"VUIVAssetExpiryDate"];
  }
  [v18 setAssetInfo:v19 forKey:v15 queue:self->assetAccessQueue];
  objc_initWeak(&location, self);
  assetWriteQueue = self->assetWriteQueue;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __81__VUIAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke;
  v27[3] = &unk_1E6DDDB50;
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

void __81__VUIAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) cachePath];
  id v4 = [v3 stringByAppendingPathComponent:v2];

  if (!*(unsigned char *)(a1 + 80))
  {
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v6 = [v5 fileExistsAtPath:v4];

    if (v6)
    {
      *(_DWORD *)buf = 0;
      id v7 = (void *)MEMORY[0x1E4F28CB8];
      goto LABEL_6;
    }
  }
  if ([0 length])
  {
    [0 writeToFile:v4 atomically:0];
    *(_DWORD *)buf = 0;
    id v7 = (void *)MEMORY[0x1E4F28CB8];
LABEL_6:
    BOOL v8 = [v7 defaultManager];
    uint64_t v9 = objc_msgSend(v8, "vui_onDiskSizeOfFileAtPath:status:", v4, buf);

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
    id v13 = [*(id *)(a1 + 48) imageType];
    id v14 = CGImageDestinationCreateWithURL(v12, v13, 1uLL, 0);
    if (v14)
    {
      id v15 = v14;
      CGImageDestinationAddImage(v14, (CGImageRef)[*(id *)(a1 + 48) image], 0);
      if (CGImageDestinationFinalize(v15))
      {
        *(_DWORD *)buf = 0;
        id v16 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v17 = objc_msgSend(v16, "vui_onDiskSizeOfFileAtPath:status:", v4, buf);

        if (*(_DWORD *)buf) {
          uint64_t v10 = 0;
        }
        else {
          uint64_t v10 = v17;
        }
      }
      else
      {
        v18 = VUICImageLogObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFURLRef v34 = v12;
          _os_log_impl(&dword_1E29E1000, v18, OS_LOG_TYPE_DEFAULT, "CGImageDestinationFinalize failed to save image to: %@", buf, 0xCu);
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
    id v23 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    [v23 setObject:v4 forKeyedSubscript:@"VUIAssetPath"];
    id v24 = [NSNumber numberWithUnsignedLongLong:v10];
    [v23 setObject:v24 forKeyedSubscript:@"VUIAssetSize"];

    id v25 = [MEMORY[0x1E4F1C9C8] date];
    [v23 setObject:v25 forKeyedSubscript:@"VUIAssetLastAccessedDate"];

    uint64_t v26 = *(void *)(a1 + 56);
    if (v26) {
      [v23 setObject:v26 forKeyedSubscript:@"VUIVAssetExpiryDate"];
    }
    uint64_t v27 = *(void *)(a1 + 64);
    if (v27) {
      [v23 setObject:v27 forKeyedSubscript:@"VUIAssetTags"];
    }
    [*(id *)(a1 + 40) setAssetInfo:v23 forKey:*(void *)(a1 + 32) queue:v22];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__VUIAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke_40;
    block[3] = &unk_1E6DDD458;
    id v31 = *(id *)(a1 + 32);
    id v32 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    [*(id *)(a1 + 40) removeAssetInfoForKey:*(void *)(a1 + 32) queue:v22];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __81__VUIAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke_2;
    v28[3] = &unk_1E6DDD328;
    id v29 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v28);
    id v23 = v29;
  }
}

void __81__VUIAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke_40(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v6 = @"VUIAssetDidWriteNotificationAssetPathKey";
  v7[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"VUIAssetDidWriteNotification" object:v4 userInfo:v5];
}

void __81__VUIAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  int v6 = @"VUIAssetDidWriteNotificationErrorKey";
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-36 userInfo:0];
  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"VUIAssetDidWriteNotification" object:v3 userInfo:v5];
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
  _os_log_error_impl(&dword_1E29E1000, log, OS_LOG_TYPE_ERROR, "Attempted to save image asset with nil key", v1, 2u);
}

@end