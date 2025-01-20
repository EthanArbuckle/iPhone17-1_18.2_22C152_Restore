@interface _TVAssetGroup
+ (id)_humanReadableStringForGroupType:(int64_t)a3;
- (BOOL)isManifestDirty;
- (NSMutableDictionary)assetKeysByTag;
- (NSMutableDictionary)cacheRecords;
- (NSMutableDictionary)manifest;
- (NSString)cachePath;
- (_TVAssetGroup)initWithGroupType:(int64_t)a3 baseCachePath:(id)a4 folderName:(id)a5 maxCacheSize:(unint64_t)a6 purgeOnLoad:(BOOL)a7;
- (id)_manifestFilePath;
- (id)assetInfoForKey:(id)a3 queue:(id)a4;
- (id)description;
- (id)infoForAllAssetsWithQueue:(id)a3;
- (id)infoForAllAssetsWithTags:(id)a3 queue:(id)a4;
- (int64_t)groupType;
- (unint64_t)currentCacheSize;
- (unint64_t)maxCacheSize;
- (unint64_t)pruneCount;
- (void)_removeAssetInfoForKey:(id)a3;
- (void)_removeAssetInfoForKey:(id)a3 removeFile:(BOOL)a4;
- (void)_saveManifest;
- (void)_updateManifestWithChange:(id)a3;
- (void)removeAllAssetsWithQueue:(id)a3;
- (void)removeAssetInfoForKey:(id)a3 queue:(id)a4;
- (void)setAssetInfo:(id)a3 forKey:(id)a4 queue:(id)a5;
- (void)setAssetKeysByTag:(id)a3;
- (void)setCachePath:(id)a3;
- (void)setCacheRecords:(id)a3;
- (void)setCurrentCacheSize:(unint64_t)a3;
- (void)setGroupType:(int64_t)a3;
- (void)setManifest:(id)a3;
- (void)setManifestDirty:(BOOL)a3;
- (void)setMaxCacheSize:(unint64_t)a3;
- (void)setPruneCount:(unint64_t)a3;
- (void)updateAssetsFromFiles;
@end

@implementation _TVAssetGroup

- (_TVAssetGroup)initWithGroupType:(int64_t)a3 baseCachePath:(id)a4 folderName:(id)a5 maxCacheSize:(unint64_t)a6 purgeOnLoad:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  v36.receiver = self;
  v36.super_class = (Class)_TVAssetGroup;
  v14 = [(_TVAssetGroup *)&v36 init];
  v15 = v14;
  if (v14)
  {
    v14->_groupType = a3;
    uint64_t v16 = [v12 stringByAppendingPathComponent:v13];
    cachePath = v15->_cachePath;
    v15->_cachePath = (NSString *)v16;

    unint64_t v18 = a6 << 20;
    if (!a6) {
      unint64_t v18 = 10485760;
    }
    v15->_maxCacheSize = v18;
    v15->_pruneCount = 10;
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cacheRecords = v15->_cacheRecords;
    v15->_cacheRecords = v19;

    v15->_currentCacheSize = 0;
    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assetKeysByTag = v15->_assetKeysByTag;
    v15->_assetKeysByTag = v21;

    v23 = [MEMORY[0x263F08850] defaultManager];
    char v35 = 0;
    [v23 fileExistsAtPath:v15->_cachePath isDirectory:&v35];
    if (v35) {
      int v24 = v7;
    }
    else {
      int v24 = 1;
    }
    if (v24 == 1)
    {
      v25 = v15->_cachePath;
      id v34 = 0;
      [v23 removeItemAtPath:v25 error:&v34];
      id v26 = v34;
      if (v26)
      {
        v27 = objc_msgSend((id)objc_opt_class(), "_humanReadableStringForGroupType:", -[_TVAssetGroup groupType](v15, "groupType"));
        if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_ERROR)) {
          -[_TVAssetGroup initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:]();
        }
      }
    }
    v28 = v15->_cachePath;
    id v33 = 0;
    [v23 createDirectoryAtPath:v28 withIntermediateDirectories:1 attributes:0 error:&v33];
    id v29 = v33;
    if (v29)
    {
      v30 = objc_msgSend((id)objc_opt_class(), "_humanReadableStringForGroupType:", -[_TVAssetGroup groupType](v15, "groupType"));
      if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_ERROR)) {
        -[_TVAssetGroup initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:]();
      }
    }
    if ((v24 & 1) == 0) {
      [(_TVAssetGroup *)v15 updateAssetsFromFiles];
    }
    v31 = TVMLKitImageLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v15;
      _os_log_impl(&dword_230B4C000, v31, OS_LOG_TYPE_DEFAULT, "Created a _TVAssetGroup : %@", buf, 0xCu);
    }
  }
  return v15;
}

- (void)setAssetInfo:(id)a3 forKey:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43___TVAssetGroup_setAssetInfo_forKey_queue___block_invoke;
  block[3] = &unk_264BA8DB8;
  objc_copyWeak(&v17, &location);
  id v14 = v9;
  v15 = self;
  id v16 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_barrier_sync(v10, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (id)assetInfoForKey:(id)a3 queue:(id)a4
{
  id v6 = a3;
  BOOL v7 = a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__7;
  v31 = __Block_byref_object_dispose__7;
  id v32 = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39___TVAssetGroup_assetInfoForKey_queue___block_invoke;
  block[3] = &unk_264BA8DE0;
  objc_copyWeak(&v25, &location);
  int v24 = &v27;
  id v8 = v6;
  id v23 = v8;
  dispatch_sync(v7, block);
  id v9 = [(id)v28[5] objectForKey:@"ATVAssetExpiryDate"];
  if (v9)
  {
    v10 = [MEMORY[0x263EFF910] date];
    uint64_t v11 = [v9 compare:v10];

    if (v11 == -1)
    {
      id v12 = (void *)v28[5];
      v28[5] = 0;

      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __39___TVAssetGroup_assetInfoForKey_queue___block_invoke_2;
      v19[3] = &unk_264BA6918;
      objc_copyWeak(&v21, &location);
      id v20 = v8;
      dispatch_barrier_async(v7, v19);

      objc_destroyWeak(&v21);
    }
  }
  id v13 = (void *)v28[5];
  if (v13)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __39___TVAssetGroup_assetInfoForKey_queue___block_invoke_3;
    v16[3] = &unk_264BA6918;
    objc_copyWeak(&v18, &location);
    id v17 = v8;
    dispatch_barrier_async(v7, v16);

    objc_destroyWeak(&v18);
    id v13 = (void *)v28[5];
  }
  id v14 = v13;

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (void)removeAssetInfoForKey:(id)a3 queue:(id)a4
{
  id v6 = a3;
  BOOL v7 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45___TVAssetGroup_removeAssetInfoForKey_queue___block_invoke;
  block[3] = &unk_264BA6918;
  objc_copyWeak(&v11, &location);
  id v10 = v6;
  id v8 = v6;
  dispatch_barrier_sync(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)removeAllAssetsWithQueue:(id)a3
{
  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42___TVAssetGroup_removeAllAssetsWithQueue___block_invoke;
  v5[3] = &unk_264BA6A38;
  objc_copyWeak(&v6, &location);
  dispatch_barrier_sync(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (id)infoForAllAssetsWithQueue:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__7;
  id v14 = __Block_byref_object_dispose__7;
  id v15 = 0;
  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43___TVAssetGroup_infoForAllAssetsWithQueue___block_invoke;
  block[3] = &unk_264BA8E08;
  objc_copyWeak(&v8, &location);
  void block[4] = &v10;
  dispatch_sync(v4, block);

  id v5 = (id)v11[5];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v10, 8);

  return v5;
}

- (id)infoForAllAssetsWithTags:(id)a3 queue:(id)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  id v20 = __Block_byref_object_dispose__7;
  id v21 = 0;
  BOOL v7 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48___TVAssetGroup_infoForAllAssetsWithTags_queue___block_invoke;
  v11[3] = &unk_264BA8E30;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = &v16;
  id v8 = v6;
  dispatch_sync(v7, v11);

  id v9 = (id)v17[5];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v16, 8);

  return v9;
}

- (void)_removeAssetInfoForKey:(id)a3
{
}

- (void)_removeAssetInfoForKey:(id)a3 removeFile:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = [(NSMutableDictionary *)self->_cacheRecords objectForKey:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 objectForKey:@"ATVAssetPath"];
    uint64_t v10 = [v8 objectForKey:@"ATVAssetSize"];

    if (v10)
    {
      id v11 = [v8 objectForKey:@"ATVAssetSize"];
      uint64_t v12 = [v11 unsignedLongLongValue];

      self->_currentCacheSize -= v12;
    }
    if ([v9 length]) {
      BOOL v13 = !v4;
    }
    else {
      BOOL v13 = 1;
    }
    if (!v13)
    {
      id v14 = [MEMORY[0x263F08850] defaultManager];
      id v30 = 0;
      char v15 = [v14 removeItemAtPath:v9 error:&v30];
      id v16 = v30;

      if ((v15 & 1) == 0 && os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_ERROR)) {
        -[_TVAssetGroup _removeAssetInfoForKey:removeFile:]();
      }
    }
    [(NSMutableDictionary *)self->_cacheRecords removeObjectForKey:v6];
    id v17 = [v8 objectForKeyedSubscript:@"ATVAssetTags"];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          id v23 = [(NSMutableDictionary *)self->_assetKeysByTag objectForKeyedSubscript:v22];
          [v23 removeObject:v6];
          if (![v23 count]) {
            [(NSMutableDictionary *)self->_assetKeysByTag removeObjectForKey:v22];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v19);
    }
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __51___TVAssetGroup__removeAssetInfoForKey_removeFile___block_invoke;
    v24[3] = &unk_264BA64A0;
    v24[4] = self;
    id v25 = v6;
    [(_TVAssetGroup *)self _updateManifestWithChange:v24];
  }
}

- (void)updateAssetsFromFiles
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_230B4C000, a2, OS_LOG_TYPE_ERROR, "Couldn't read manifest: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_TVAssetGroup;
  uint64_t v4 = [(_TVAssetGroup *)&v8 description];
  id v5 = [(id)objc_opt_class() _humanReadableStringForGroupType:self->_groupType];
  id v6 = [v3 stringWithFormat:@"%@ [Type: %@ MaxCacheSize: %lu Current Cache Size: %lu Current Free Space: %lu CachePath: %@]", v4, v5, self->_maxCacheSize, self->_currentCacheSize, self->_maxCacheSize - self->_currentCacheSize, self->_cachePath];

  return v6;
}

- (void)_updateManifestWithChange:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(_TVAssetGroup *)v5 manifest];

  if (!v6)
  {
    BOOL v7 = [MEMORY[0x263EFF9A0] dictionary];
    [(_TVAssetGroup *)v5 setManifest:v7];
  }
  v4[2](v4);
  BOOL v8 = [(_TVAssetGroup *)v5 isManifestDirty];
  [(_TVAssetGroup *)v5 setManifestDirty:1];
  objc_sync_exit(v5);

  if (!v8)
  {
    objc_initWeak(&location, v5);
    dispatch_time_t v9 = dispatch_time(0, 60000000000);
    uint64_t v10 = dispatch_get_global_queue(-32768, 0);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __43___TVAssetGroup__updateManifestWithChange___block_invoke;
    v11[3] = &unk_264BA6A38;
    objc_copyWeak(&v12, &location);
    dispatch_after(v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)_saveManifest
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_230B4C000, a2, OS_LOG_TYPE_ERROR, "Couldn't save manifest: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (id)_humanReadableStringForGroupType:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return @"Unknown";
  }
  else {
    return off_264BA8E78[a3];
  }
}

- (id)_manifestFilePath
{
  int v2 = [(_TVAssetGroup *)self cachePath];
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"manifest"];

  return v3;
}

- (int64_t)groupType
{
  return self->_groupType;
}

- (void)setGroupType:(int64_t)a3
{
  self->_groupType = a3;
}

- (NSString)cachePath
{
  return self->_cachePath;
}

- (void)setCachePath:(id)a3
{
}

- (unint64_t)maxCacheSize
{
  return self->_maxCacheSize;
}

- (void)setMaxCacheSize:(unint64_t)a3
{
  self->_maxCacheSize = a3;
}

- (unint64_t)pruneCount
{
  return self->_pruneCount;
}

- (void)setPruneCount:(unint64_t)a3
{
  self->_pruneCount = a3;
}

- (unint64_t)currentCacheSize
{
  return self->_currentCacheSize;
}

- (void)setCurrentCacheSize:(unint64_t)a3
{
  self->_currentCacheSize = a3;
}

- (NSMutableDictionary)cacheRecords
{
  return self->_cacheRecords;
}

- (void)setCacheRecords:(id)a3
{
}

- (NSMutableDictionary)assetKeysByTag
{
  return self->_assetKeysByTag;
}

- (void)setAssetKeysByTag:(id)a3
{
}

- (NSMutableDictionary)manifest
{
  return self->_manifest;
}

- (void)setManifest:(id)a3
{
}

- (BOOL)isManifestDirty
{
  return self->_manifestDirty;
}

- (void)setManifestDirty:(BOOL)a3
{
  self->_manifestDirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_assetKeysByTag, 0);
  objc_storeStrong((id *)&self->_cacheRecords, 0);
  objc_storeStrong((id *)&self->_cachePath, 0);
}

- (void)initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_230B4C000, v0, v1, "_TVAssetGroup failed to create cache path: %{public}@, %{public}@");
}

- (void)initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_230B4C000, v0, v1, "_TVAssetGroup failed to purge cache path: %{public}@, %{public}@");
}

- (void)_removeAssetInfoForKey:removeFile:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_230B4C000, v0, v1, "Error removing asset info: %{public}@, %{public}@");
}

@end