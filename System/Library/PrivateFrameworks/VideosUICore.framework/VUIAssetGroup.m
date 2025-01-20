@interface VUIAssetGroup
+ (id)_humanReadableStringForGroupType:(int64_t)a3;
- (BOOL)isManifestDirty;
- (NSMutableDictionary)assetKeysByTag;
- (NSMutableDictionary)cacheRecords;
- (NSMutableDictionary)manifest;
- (NSString)cachePath;
- (VUIAssetGroup)initWithGroupType:(int64_t)a3 baseCachePath:(id)a4 folderName:(id)a5 maxCacheSize:(unint64_t)a6 purgeOnLoad:(BOOL)a7;
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

@implementation VUIAssetGroup

void __39__VUIAssetGroup_assetInfoForKey_queue___block_invoke_3(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v3 = [WeakRetained[7] objectForKey:*(void *)(a1 + 32)];

    WeakRetained = v8;
    if (v3)
    {
      v4 = (void *)MEMORY[0x1E4F1CA60];
      v5 = [v8[7] objectForKey:*(void *)(a1 + 32)];
      v6 = [v4 dictionaryWithDictionary:v5];

      v7 = [MEMORY[0x1E4F1C9C8] date];
      [v6 setObject:v7 forKey:@"VUIAssetLastAccessedDate"];

      [v8[7] setObject:v6 forKey:*(void *)(a1 + 32)];
      WeakRetained = v8;
    }
  }
}

- (void)updateAssetsFromFiles
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E29E1000, v0, v1, "Couldn't remove bad manifest: %{public}@, %{public}@");
}

id __38__VUIAssetGroup_updateAssetsFromFiles__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (v6)
  {
    v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
    v8 = (void *)[v7 mutableCopy];

    v9 = [NSNumber numberWithUnsignedLongLong:a3];
    [v8 setObject:v9 forKeyedSubscript:@"VUIAssetSize"];

    v10 = [MEMORY[0x1E4F1C9C8] date];
    [v8 setObject:v10 forKeyedSubscript:@"VUIAssetLastAccessedDate"];

    v11 = [v8 objectForKeyedSubscript:@"VUIAssetTags"];

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E4F1CAD0];
      v13 = [v8 objectForKeyedSubscript:@"VUIAssetTags"];
      v14 = [v12 setWithArray:v13];
      [v8 setObject:v14 forKeyedSubscript:@"VUIAssetTags"];
    }
    v15 = (void *)[v8 copy];
  }
  else
  {
    v18[0] = @"VUIAssetSize";
    v8 = [NSNumber numberWithUnsignedLongLong:a3];
    v19[0] = v8;
    v19[1] = v5;
    v18[1] = @"VUIAssetPath";
    v18[2] = @"VUIAssetLastAccessedDate";
    v16 = [MEMORY[0x1E4F1C9C8] date];
    v19[2] = v16;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  }
  return v15;
}

- (id)_manifestFilePath
{
  v2 = [(VUIAssetGroup *)self cachePath];
  v3 = [v2 stringByAppendingPathComponent:@"manifest"];

  return v3;
}

- (NSString)cachePath
{
  return self->_cachePath;
}

+ (id)_humanReadableStringForGroupType:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E6DDD7D0[a3];
  }
}

- (int64_t)groupType
{
  return self->_groupType;
}

- (id)assetInfoForKey:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v7 = a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  id v32 = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__VUIAssetGroup_assetInfoForKey_queue___block_invoke;
  block[3] = &unk_1E6DDD710;
  objc_copyWeak(&v25, &location);
  v24 = &v27;
  id v8 = v6;
  id v23 = v8;
  dispatch_sync(v7, block);
  v9 = [(id)v28[5] objectForKey:@"VUIVAssetExpiryDate"];
  if (v9)
  {
    v10 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v11 = [v9 compare:v10];

    if (v11 == -1)
    {
      v12 = (void *)v28[5];
      v28[5] = 0;

      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __39__VUIAssetGroup_assetInfoForKey_queue___block_invoke_2;
      v19[3] = &unk_1E6DDD738;
      objc_copyWeak(&v21, &location);
      id v20 = v8;
      dispatch_barrier_async(v7, v19);

      objc_destroyWeak(&v21);
    }
  }
  v13 = (void *)v28[5];
  if (v13)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __39__VUIAssetGroup_assetInfoForKey_queue___block_invoke_3;
    v16[3] = &unk_1E6DDD738;
    objc_copyWeak(&v18, &location);
    id v17 = v8;
    dispatch_barrier_async(v7, v16);

    objc_destroyWeak(&v18);
    v13 = (void *)v28[5];
  }
  id v14 = v13;

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v27, 8);

  return v14;
}

void __39__VUIAssetGroup_assetInfoForKey_queue___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    uint64_t v3 = [WeakRetained[7] objectForKey:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    WeakRetained = v6;
  }
}

- (VUIAssetGroup)initWithGroupType:(int64_t)a3 baseCachePath:(id)a4 folderName:(id)a5 maxCacheSize:(unint64_t)a6 purgeOnLoad:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  v38.receiver = self;
  v38.super_class = (Class)VUIAssetGroup;
  id v14 = [(VUIAssetGroup *)&v38 init];
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
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cacheRecords = v15->_cacheRecords;
    v15->_cacheRecords = v19;

    v15->_currentCacheSize = 0;
    id v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    assetKeysByTag = v15->_assetKeysByTag;
    v15->_assetKeysByTag = v21;

    id v23 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v37 = 0;
    [v23 fileExistsAtPath:v15->_cachePath isDirectory:&v37];
    if (v37) {
      int v24 = v7;
    }
    else {
      int v24 = 1;
    }
    if (v24 == 1)
    {
      id v25 = v15->_cachePath;
      id v36 = 0;
      [v23 removeItemAtPath:v25 error:&v36];
      id v26 = v36;
      if (v26)
      {
        uint64_t v27 = objc_msgSend((id)objc_opt_class(), "_humanReadableStringForGroupType:", -[VUIAssetGroup groupType](v15, "groupType"));
        v28 = VUICImageLogObject();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[VUIAssetGroup initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:]();
        }
      }
    }
    uint64_t v29 = v15->_cachePath;
    id v35 = 0;
    [v23 createDirectoryAtPath:v29 withIntermediateDirectories:1 attributes:0 error:&v35];
    id v30 = v35;
    if (v30)
    {
      v31 = objc_msgSend((id)objc_opt_class(), "_humanReadableStringForGroupType:", -[VUIAssetGroup groupType](v15, "groupType"));
      id v32 = VUICImageLogObject();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[VUIAssetGroup initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:]();
      }
    }
    if ((v24 & 1) == 0) {
      [(VUIAssetGroup *)v15 updateAssetsFromFiles];
    }
    v33 = VUICImageLogObject();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v15;
      _os_log_impl(&dword_1E29E1000, v33, OS_LOG_TYPE_DEFAULT, "Created a VUIAssetGroup : %@", buf, 0xCu);
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
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__VUIAssetGroup_setAssetInfo_forKey_queue___block_invoke;
  block[3] = &unk_1E6DDD6E8;
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

void __43__VUIAssetGroup_setAssetInfo_forKey_queue___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v29 = [WeakRetained[7] objectForKeyedSubscript:*(void *)(a1 + 32)];
    if (v29) {
      [*(id *)(a1 + 40) _removeAssetInfoForKey:*(void *)(a1 + 32) removeFile:0];
    }
    uint64_t v4 = [*(id *)(a1 + 48) objectForKey:@"VUIAssetSize"];

    if (v4)
    {
      id v5 = [*(id *)(a1 + 48) objectForKey:@"VUIAssetSize"];
      v3[6] = (char *)v3[6] + [v5 unsignedLongLongValue];
    }
    [v3[7] setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 32)];
    id v6 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"VUIAssetTags"];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v39 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          id v12 = [v3[8] objectForKeyedSubscript:v11];
          if (!v12)
          {
            id v12 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
            [v3[8] setObject:v12 forKeyedSubscript:v11];
          }
          [v12 addObject:*(void *)(a1 + 32)];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
      }
      while (v8);
    }

    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __43__VUIAssetGroup_setAssetInfo_forKey_queue___block_invoke_2;
    v35[3] = &unk_1E6DDD510;
    id v36 = *(id *)(a1 + 48);
    int8x16_t v27 = *(int8x16_t *)(a1 + 32);
    id v13 = (id)v27.i64[0];
    int8x16_t v37 = vextq_s8(v27, v27, 8uLL);
    [v3 _updateManifestWithChange:v35];
    if (v3[6] > v3[4])
    {
      id v14 = VUICImageLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E29E1000, v14, OS_LOG_TYPE_DEFAULT, "Current cache size exceeds maximum cache size.  Starting to prune.", buf, 2u);
      }

      v15 = [v3[7] allKeys];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __43__VUIAssetGroup_setAssetInfo_forKey_queue___block_invoke_19;
      v34[3] = &unk_1E6DDD040;
      v34[4] = v3;
      v28 = v15;
      [v15 sortedArrayUsingComparator:v34];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v44 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v31;
        while (2)
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v31 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * j);
            v22 = [v3[7] objectForKeyedSubscript:v21];
            id v23 = v22;
            if ((double)(unint64_t)v3[4] * 0.95 > (double)(unint64_t)v3[6])
            {

              goto LABEL_30;
            }
            int v24 = [v22 objectForKey:@"VUIAssetPath"];
            if ([v24 length]) {
              [*(id *)(a1 + 40) _removeAssetInfoForKey:v21];
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v44 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }
LABEL_30:

      id v25 = VUICImageLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v43 = v26;
        _os_log_impl(&dword_1E29E1000, v25, OS_LOG_TYPE_DEFAULT, "Done freeing up cache space. %@", buf, 0xCu);
      }
    }
  }
}

void __43__VUIAssetGroup_setAssetInfo_forKey_queue___block_invoke_2(uint64_t a1)
{
  id v7 = (id)[*(id *)(a1 + 32) mutableCopy];
  [v7 removeObjectForKey:@"VUIAsset"];
  [v7 removeObjectForKey:@"VUIAssetLastAccessedDate"];
  v2 = [v7 objectForKeyedSubscript:@"VUIAssetTags"];

  if (v2)
  {
    uint64_t v3 = [v7 objectForKeyedSubscript:@"VUIAssetTags"];
    uint64_t v4 = [v3 allObjects];
    [v7 setObject:v4 forKeyedSubscript:@"VUIAssetTags"];
  }
  id v5 = (void *)[v7 copy];
  id v6 = [*(id *)(a1 + 40) manifest];
  [v6 setObject:v5 forKeyedSubscript:*(void *)(a1 + 48)];
}

uint64_t __43__VUIAssetGroup_setAssetInfo_forKey_queue___block_invoke_19(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 56);
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:a2];
  uint64_t v8 = [v7 valueForKeyPath:@"VUIAssetLastAccessedDate"];

  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:v6];

  v10 = [v9 valueForKeyPath:@"VUIAssetLastAccessedDate"];

  uint64_t v11 = [v8 compare:v10];
  return v11;
}

void __39__VUIAssetGroup_assetInfoForKey_queue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeAssetInfoForKey:*(void *)(a1 + 32)];
}

- (void)removeAssetInfoForKey:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__VUIAssetGroup_removeAssetInfoForKey_queue___block_invoke;
  block[3] = &unk_1E6DDD738;
  objc_copyWeak(&v11, &location);
  id v10 = v6;
  id v8 = v6;
  dispatch_barrier_sync(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __45__VUIAssetGroup_removeAssetInfoForKey_queue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeAssetInfoForKey:*(void *)(a1 + 32)];
}

- (void)removeAllAssetsWithQueue:(id)a3
{
  uint64_t v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__VUIAssetGroup_removeAllAssetsWithQueue___block_invoke;
  v5[3] = &unk_1E6DDD350;
  objc_copyWeak(&v6, &location);
  dispatch_barrier_sync(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __42__VUIAssetGroup_removeAllAssetsWithQueue___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained[7] allKeys];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [v2 _removeAssetInfoForKey:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (id)infoForAllAssetsWithQueue:(id)a3
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__1;
  id v14 = __Block_byref_object_dispose__1;
  id v15 = 0;
  uint64_t v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__VUIAssetGroup_infoForAllAssetsWithQueue___block_invoke;
  block[3] = &unk_1E6DDD760;
  objc_copyWeak(&v8, &location);
  void block[4] = &v10;
  dispatch_sync(v4, block);

  id v5 = (id)v11[5];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __43__VUIAssetGroup_infoForAllAssetsWithQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    uint64_t v3 = [WeakRetained[7] copy];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id WeakRetained = v6;
  }
}

- (id)infoForAllAssetsWithTags:(id)a3 queue:(id)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__1;
  id v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  uint64_t v7 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__VUIAssetGroup_infoForAllAssetsWithTags_queue___block_invoke;
  v11[3] = &unk_1E6DDD788;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  uint64_t v13 = &v16;
  id v8 = v6;
  dispatch_sync(v7, v11);

  id v9 = (id)v17[5];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __48__VUIAssetGroup_infoForAllAssetsWithTags_queue___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      id v6 = 0;
      uint64_t v7 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v27 != v7) {
            objc_enumerationMutation(v3);
          }
          id v9 = [WeakRetained[8] objectForKeyedSubscript:*(void *)(*((void *)&v26 + 1) + 8 * i)];
          uint64_t v10 = v9;
          if (!v9)
          {

            id v6 = 0;
LABEL_16:

            goto LABEL_18;
          }
          if (v6)
          {
            [v6 intersectSet:v9];
            if (![v6 count]) {
              goto LABEL_16;
            }
          }
          else
          {
            id v6 = (void *)[v9 mutableCopy];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v6 = 0;
    }
LABEL_18:

    if ([v6 count])
    {
      long long v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v12 = v6;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v23;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * j);
            uint64_t v18 = objc_msgSend(WeakRetained[7], "objectForKeyedSubscript:", v17, (void)v22);
            [v11 setObject:v18 forKeyedSubscript:v17];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
        }
        while (v14);
      }

      uint64_t v19 = [v11 copy];
      uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
      id v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;
    }
  }
}

- (void)_removeAssetInfoForKey:(id)a3
{
}

- (void)_removeAssetInfoForKey:(id)a3 removeFile:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(NSMutableDictionary *)self->_cacheRecords objectForKey:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 objectForKey:@"VUIAssetPath"];
    uint64_t v10 = [v8 objectForKey:@"VUIAssetSize"];

    if (v10)
    {
      long long v11 = [v8 objectForKey:@"VUIAssetSize"];
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
      uint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v31 = 0;
      char v15 = [v14 removeItemAtPath:v9 error:&v31];
      id v16 = v31;

      if ((v15 & 1) == 0)
      {
        uint64_t v17 = VUICImageLogObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[VUIAssetGroup _removeAssetInfoForKey:removeFile:]();
        }
      }
    }
    [(NSMutableDictionary *)self->_cacheRecords removeObjectForKey:v6];
    uint64_t v18 = [v8 objectForKeyedSubscript:@"VUIAssetTags"];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          long long v24 = [(NSMutableDictionary *)self->_assetKeysByTag objectForKeyedSubscript:v23];
          [v24 removeObject:v6];
          if (![v24 count]) {
            [(NSMutableDictionary *)self->_assetKeysByTag removeObjectForKey:v23];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v20);
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __51__VUIAssetGroup__removeAssetInfoForKey_removeFile___block_invoke;
    v25[3] = &unk_1E6DDD458;
    v25[4] = self;
    id v26 = v6;
    [(VUIAssetGroup *)self _updateManifestWithChange:v25];
  }
}

void __51__VUIAssetGroup__removeAssetInfoForKey_removeFile___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manifest];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VUIAssetGroup;
  BOOL v4 = [(VUIAssetGroup *)&v8 description];
  uint64_t v5 = [(id)objc_opt_class() _humanReadableStringForGroupType:self->_groupType];
  id v6 = [v3 stringWithFormat:@"%@ [Type: %@ MaxCacheSize: %lu Current Cache Size: %lu Current Free Space: %lu CachePath: %@]", v4, v5, self->_maxCacheSize, self->_currentCacheSize, self->_maxCacheSize - self->_currentCacheSize, self->_cachePath];

  return v6;
}

- (void)_updateManifestWithChange:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(VUIAssetGroup *)v5 manifest];

  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    [(VUIAssetGroup *)v5 setManifest:v7];
  }
  v4[2](v4);
  BOOL v8 = [(VUIAssetGroup *)v5 isManifestDirty];
  [(VUIAssetGroup *)v5 setManifestDirty:1];
  objc_sync_exit(v5);

  if (!v8)
  {
    objc_initWeak(&location, v5);
    dispatch_time_t v9 = dispatch_time(0, 60000000000);
    uint64_t v10 = dispatch_get_global_queue(-32768, 0);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43__VUIAssetGroup__updateManifestWithChange___block_invoke;
    v11[3] = &unk_1E6DDD350;
    objc_copyWeak(&v12, &location);
    dispatch_after(v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __43__VUIAssetGroup__updateManifestWithChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _saveManifest];
    id WeakRetained = v2;
  }
}

- (void)_saveManifest
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E29E1000, a2, OS_LOG_TYPE_ERROR, "Couldn't save manifest: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)setGroupType:(int64_t)a3
{
  self->_groupType = a3;
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
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E29E1000, v0, v1, "VUIAssetGroup failed to create cache path: %{public}@, %{public}@");
}

- (void)initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E29E1000, v0, v1, "VUIAssetGroup failed to purge cache path: %{public}@, %{public}@");
}

- (void)_removeAssetInfoForKey:removeFile:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E29E1000, v0, v1, "Error removing asset info: %{public}@, %{public}@");
}

@end