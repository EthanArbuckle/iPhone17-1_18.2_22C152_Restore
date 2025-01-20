@interface PLPhotoKitVariationCache
- (BOOL)_performChangesForAssetIdentifier:(id)a3 sourceType:(int64_t)a4 changesBlock:(id)a5;
- (BOOL)_removeCachesForURL:(id)a3;
- (BOOL)_writeInfo:(id)a3 atURL:(id)a4;
- (BOOL)deleteCacheForAssetIdentifier:(id)a3;
- (BOOL)deleteCacheForAssetIdentifier:(id)a3 sourceType:(int64_t)a4;
- (NSURL)cacheURL;
- (PLPhotoKitVariationCache)initWithCacheURL:(id)a3;
- (PLPhotoKitVariationCache)initWithPathManager:(id)a3;
- (id)_fileURLWithIdentifier:(id)a3 sourceType:(int64_t)a4 pathExtension:(id)a5;
- (id)_readInfoForURL:(id)a3;
- (id)analysisResultForAssetIdentifier:(id)a3;
- (id)analysisResultForAssetIdentifier:(id)a3 sourceType:(int64_t)a4;
- (id)gatingResultForVariationType:(int64_t)a3 assetIdentifier:(id)a4;
- (id)gatingResultForVariationType:(int64_t)a3 assetIdentifier:(id)a4 sourceType:(int64_t)a5;
- (id)portraitEffectSettingsForAssetIdentifier:(id)a3;
- (id)portraitEffectSettingsForAssetIdentifier:(id)a3 sourceType:(int64_t)a4;
- (unint64_t)evictIfNeeded;
- (unint64_t)purgeAll;
- (void)_saveToMemoryCache:(id)a3 forFileURL:(id)a4 fileSize:(unint64_t)a5;
- (void)saveAnalysisResult:(id)a3 assetIdentifier:(id)a4;
- (void)saveAnalysisResult:(id)a3 assetIdentifier:(id)a4 sourceType:(int64_t)a5;
- (void)saveGatingResult:(id)a3 forVariationType:(int64_t)a4 assetIdentifier:(id)a5;
- (void)saveGatingResult:(id)a3 forVariationType:(int64_t)a4 assetIdentifier:(id)a5 sourceType:(int64_t)a6;
- (void)savePortraitEffectSettings:(id)a3 assetIdentifier:(id)a4;
- (void)savePortraitEffectSettings:(id)a3 sourceType:(int64_t)a4 assetIdentifier:(id)a5;
@end

@implementation PLPhotoKitVariationCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_memoryCache, 0);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
}

- (NSURL)cacheURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)_removeCachesForURL:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSCache *)self->_memoryCache removeObjectForKey:v4];
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v10 = 0;
  char v6 = [v5 removeItemAtURL:v4 error:&v10];
  id v7 = v10;

  if ((v6 & 1) == 0)
  {
    v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v12 = self;
      __int16 v13 = 2112;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "%@: could not delete file at %@ (%@)", buf, 0x20u);
    }
  }
  return v6;
}

- (void)_saveToMemoryCache:(id)a3 forFileURL:(id)a4 fileSize:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [[_PHVariationInMemoryCachedValue alloc] initWithInfo:v9 fileURL:v8];

  [(NSCache *)self->_memoryCache setObject:v10 forKey:v8 cost:a5];
}

- (id)_readInfoForURL:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSCache *)self->_memoryCache objectForKey:v4];
  char v6 = v5;
  if (v5)
  {
    if ([v5 isValid])
    {
      id v7 = [v6 info];
      if (v7) {
        goto LABEL_14;
      }
    }
    else
    {
      [(NSCache *)self->_memoryCache removeObjectForKey:v4];
    }
  }
  id v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4];
  if (!v8)
  {
    id v9 = 0;
    goto LABEL_10;
  }
  id v12 = 0;
  id v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v8 options:0 format:0 error:&v12];
  id v9 = v12;
  if (!v7)
  {
LABEL_10:
    id v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v14 = self;
      __int16 v15 = 2112;
      id v16 = v4;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "%@: could not read file at %@ (%@)", buf, 0x20u);
    }

    id v7 = 0;
    goto LABEL_13;
  }
  -[PLPhotoKitVariationCache _saveToMemoryCache:forFileURL:fileSize:](self, "_saveToMemoryCache:forFileURL:fileSize:", v7, v4, [v8 length]);
LABEL_13:

LABEL_14:
  return v7;
}

- (BOOL)_writeInfo:(id)a3 atURL:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v17 = 0;
  id v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:200 options:0 error:&v17];
  id v9 = v17;
  id v10 = v9;
  if (v8)
  {
    id v16 = v9;
    int v11 = [v8 writeToURL:v7 options:1073741825 error:&v16];
    id v12 = v16;

    if (v11)
    {
      -[PLPhotoKitVariationCache _saveToMemoryCache:forFileURL:fileSize:](self, "_saveToMemoryCache:forFileURL:fileSize:", v6, v7, [v8 length]);
      BOOL v13 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    id v12 = v9;
  }
  id v14 = PLBackendGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v19 = self;
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "%@: could not write file at %@ (%@)", buf, 0x20u);
  }

  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (id)_fileURLWithIdentifier:(id)a3 sourceType:(int64_t)a4 pathExtension:(id)a5
{
  v20[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v8 = self->_cacheURL;
    id v9 = a5;
    uint64_t v10 = [a3 stringByReplacingOccurrencesOfString:@"/" withString:@"-"];
    int v11 = (void *)v10;
    id v12 = @"SpatialOverCapture";
    if (a4 != 1) {
      id v12 = 0;
    }
    if (!a4) {
      id v12 = @"Primary";
    }
    v20[0] = v10;
    v20[1] = v12;
    BOOL v13 = (void *)MEMORY[0x1E4F1C978];
    id v14 = v12;
    __int16 v15 = [v13 arrayWithObjects:v20 count:2];

    id v16 = [v15 componentsJoinedByString:@"-"];

    id v17 = [v16 stringByAppendingPathExtension:v9];

    id v18 = [(NSURL *)v8 URLByAppendingPathComponent:v17 isDirectory:0];
  }
  else
  {
    id v18 = 0;
  }
  return v18;
}

- (BOOL)deleteCacheForAssetIdentifier:(id)a3
{
  return [(PLPhotoKitVariationCache *)self deleteCacheForAssetIdentifier:a3 sourceType:0];
}

- (BOOL)deleteCacheForAssetIdentifier:(id)a3 sourceType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  __int16 v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  cacheQueue = self->_cacheQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__PLPhotoKitVariationCache_deleteCacheForAssetIdentifier_sourceType___block_invoke;
  v10[3] = &unk_1E5873DC0;
  v10[4] = self;
  id v11 = v6;
  id v12 = &v14;
  int64_t v13 = a4;
  id v8 = v6;
  dispatch_barrier_sync(cacheQueue, v10);
  LOBYTE(self) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

void __69__PLPhotoKitVariationCache_deleteCacheForAssetIdentifier_sourceType___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _fileURLWithIdentifier:*(void *)(a1 + 40) sourceType:*(void *)(a1 + 56) pathExtension:@"plist"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _removeCachesForURL:v2];
}

- (unint64_t)purgeAll
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  cacheQueue = self->_cacheQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__PLPhotoKitVariationCache_purgeAll__block_invoke;
  v5[3] = &unk_1E5875E68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cacheQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __36__PLPhotoKitVariationCache_purgeAll__block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = *MEMORY[0x1E4F1C5F8];
  v18[0] = *MEMORY[0x1E4F1C5F8];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v5 = [v2 contentsOfDirectoryAtURL:*(void *)(*(void *)(a1 + 32) + 24) includingPropertiesForKeys:v4 options:4 error:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        id v12 = 0;
        [v10 getResourceValue:&v12 forKey:v3 error:0];
        id v11 = v12;
        if ([*(id *)(a1 + 32) _removeCachesForURL:v10]) {
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v11 integerValue];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (unint64_t)evictIfNeeded
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  cacheQueue = self->_cacheQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PLPhotoKitVariationCache_evictIfNeeded__block_invoke;
  v5[3] = &unk_1E5875E68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_sync(cacheQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __41__PLPhotoKitVariationCache_evictIfNeeded__block_invoke(uint64_t a1)
{
  v50[3] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = *MEMORY[0x1E4F1C6E8];
  uint64_t v7 = *MEMORY[0x1E4F1C540];
  v50[0] = *MEMORY[0x1E4F1C6E8];
  v50[1] = v7;
  uint64_t v35 = v7;
  uint64_t v34 = *MEMORY[0x1E4F1C5F8];
  v50[2] = *MEMORY[0x1E4F1C5F8];
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:3];
  uint64_t v8 = objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", *(void *)(*(void *)(a1 + 32) + 24));
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v49 count:16];
  obuint64_t j = v10;
  if (!v11)
  {
LABEL_31:

    goto LABEL_32;
  }
  uint64_t v12 = v11;
  v32 = v5;
  uint64_t v33 = a1;
  unint64_t v36 = 0;
  uint64_t v13 = *(void *)v45;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v45 != v13) {
        objc_enumerationMutation(obj);
      }
      long long v15 = *(void **)(*((void *)&v44 + 1) + 8 * i);
      long long v16 = objc_msgSend(v15, "resourceValuesForKeys:error:", v38, 0, v32);
      char v17 = [v16 objectForKeyedSubscript:v6];
      id v18 = [v17 pathExtension];
      int v19 = [v18 isEqualToString:@"plist"];

      if (v19)
      {
        __int16 v20 = [v16 objectForKeyedSubscript:v35];
        id v21 = v20;
        if (!v20
          || ([v20 timeIntervalSinceReferenceDate], v4 - v22 < 1296000.0)
          || ([*(id *)(v33 + 32) _removeCachesForURL:v15] & 1) == 0)
        {
          id v23 = [v16 objectForKeyedSubscript:v34];
          uint64_t v24 = v23;
          if (v23) {
            v36 += [v23 integerValue];
          }
          if ([v9 count]) {
            objc_msgSend(v9, "insertObject:atIndex:", v15, objc_msgSend(v9, "indexOfObject:inSortedRange:options:usingComparator:", v15, 0, objc_msgSend(v9, "count"), 1024, &__block_literal_global_9853));
          }
          else {
            [v9 addObject:v15];
          }
        }
      }
    }
    uint64_t v12 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  }
  while (v12);

  unint64_t v25 = v36;
  v5 = v32;
  if (v36 >= 0xA00000)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v10 = v9;
    uint64_t v26 = [v10 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v41 != v28) {
            objc_enumerationMutation(v10);
          }
          v30 = *(void **)(*((void *)&v40 + 1) + 8 * j);
          id v39 = 0;
          [v30 getResourceValue:&v39 forKey:v34 error:0];
          id v31 = v39;
          if ([*(id *)(v33 + 32) _removeCachesForURL:v30])
          {
            v25 -= [v31 integerValue];
            *(void *)(*(void *)(*(void *)(v33 + 40) + 8) + 24) += [v31 integerValue];

            if (v25 <= 0x500000) {
              goto LABEL_31;
            }
          }
          else
          {
          }
        }
        uint64_t v27 = [v10 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v27);
    }
    goto LABEL_31;
  }
LABEL_32:
}

uint64_t __41__PLPhotoKitVariationCache_evictIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = 0;
  uint64_t v4 = *MEMORY[0x1E4F1C540];
  id v5 = a3;
  [a2 getResourceValue:&v10 forKey:v4 error:0];
  uint64_t v9 = 0;
  id v6 = v10;
  [v5 getResourceValue:&v9 forKey:v4 error:0];

  uint64_t v7 = [v6 compare:v9];
  return v7;
}

- (BOOL)_performChangesForAssetIdentifier:(id)a3 sourceType:(int64_t)a4 changesBlock:(id)a5
{
  uint64_t v8 = (void (**)(id, void *))a5;
  if (v8)
  {
    uint64_t v9 = [(PLPhotoKitVariationCache *)self _fileURLWithIdentifier:a3 sourceType:a4 pathExtension:@"plist"];
    id v10 = [(PLPhotoKitVariationCache *)self _readInfoForURL:v9];
    uint64_t v11 = (void *)[v10 mutableCopy];

    if (!v11)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v8[2](v8, v11);
    BOOL v12 = [(PLPhotoKitVariationCache *)self _writeInfo:v11 atURL:v9];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)gatingResultForVariationType:(int64_t)a3 assetIdentifier:(id)a4
{
  return [(PLPhotoKitVariationCache *)self gatingResultForVariationType:a3 assetIdentifier:a4 sourceType:0];
}

- (id)gatingResultForVariationType:(int64_t)a3 assetIdentifier:(id)a4 sourceType:(int64_t)a5
{
  id v8 = a4;
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__9856;
  double v22 = __Block_byref_object_dispose__9857;
  id v23 = 0;
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PLPhotoKitVariationCache_gatingResultForVariationType_assetIdentifier_sourceType___block_invoke;
  block[3] = &unk_1E5873D70;
  block[4] = self;
  id v14 = v8;
  int64_t v16 = a5;
  int64_t v17 = a3;
  long long v15 = &v18;
  id v10 = v8;
  dispatch_sync(cacheQueue, block);
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __84__PLPhotoKitVariationCache_gatingResultForVariationType_assetIdentifier_sourceType___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) _fileURLWithIdentifier:*(void *)(a1 + 40) sourceType:*(void *)(a1 + 56) pathExtension:@"plist"];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_readInfoForURL:");
  double v3 = _gatingKeyForVariationType(*(void *)(a1 + 64));
  if (v3)
  {
    uint64_t v4 = [v2 objectForKeyedSubscript:v3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (void)saveGatingResult:(id)a3 forVariationType:(int64_t)a4 assetIdentifier:(id)a5
{
}

- (void)saveGatingResult:(id)a3 forVariationType:(int64_t)a4 assetIdentifier:(id)a5 sourceType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PLPhotoKitVariationCache_saveGatingResult_forVariationType_assetIdentifier_sourceType___block_invoke;
  block[3] = &unk_1E5873AC8;
  id v16 = v10;
  int64_t v17 = self;
  id v18 = v11;
  int64_t v19 = a6;
  int64_t v20 = a4;
  id v12 = v11;
  id v13 = v10;
  dispatch_block_t v14 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_UTILITY, -8, block);
  dispatch_barrier_async((dispatch_queue_t)self->_cacheQueue, v14);
}

void __89__PLPhotoKitVariationCache_saveGatingResult_forVariationType_assetIdentifier_sourceType___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = *(void **)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __89__PLPhotoKitVariationCache_saveGatingResult_forVariationType_assetIdentifier_sourceType___block_invoke_2;
    v5[3] = &unk_1E5864328;
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    id v6 = *(id *)(a1 + 32);
    [v2 _performChangesForAssetIdentifier:v3 sourceType:v4 changesBlock:v5];
  }
}

void __89__PLPhotoKitVariationCache_saveGatingResult_forVariationType_assetIdentifier_sourceType___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = _gatingKeyForVariationType(*(void *)(a1 + 40));
  if (v3) {
    [v4 setObject:*(void *)(a1 + 32) forKeyedSubscript:v3];
  }
}

- (id)portraitEffectSettingsForAssetIdentifier:(id)a3
{
  return [(PLPhotoKitVariationCache *)self portraitEffectSettingsForAssetIdentifier:a3 sourceType:0];
}

- (id)portraitEffectSettingsForAssetIdentifier:(id)a3 sourceType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__9856;
  int64_t v19 = __Block_byref_object_dispose__9857;
  id v20 = 0;
  cacheQueue = self->_cacheQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__PLPhotoKitVariationCache_portraitEffectSettingsForAssetIdentifier_sourceType___block_invoke;
  v11[3] = &unk_1E5873DC0;
  v11[4] = self;
  id v12 = v6;
  id v13 = &v15;
  int64_t v14 = a4;
  id v8 = v6;
  dispatch_sync(cacheQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __80__PLPhotoKitVariationCache_portraitEffectSettingsForAssetIdentifier_sourceType___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _fileURLWithIdentifier:*(void *)(a1 + 40) sourceType:*(void *)(a1 + 56) pathExtension:@"plist"];
  id v2 = [*(id *)(a1 + 32) _readInfoForURL:v6];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"PortraitEffectSettings"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)savePortraitEffectSettings:(id)a3 assetIdentifier:(id)a4
{
}

- (void)savePortraitEffectSettings:(id)a3 sourceType:(int64_t)a4 assetIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__PLPhotoKitVariationCache_savePortraitEffectSettings_sourceType_assetIdentifier___block_invoke;
  v13[3] = &unk_1E58735D8;
  id v14 = v8;
  uint64_t v15 = self;
  id v16 = v9;
  int64_t v17 = a4;
  id v10 = v9;
  id v11 = v8;
  dispatch_block_t v12 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_UTILITY, -8, v13);
  dispatch_barrier_async((dispatch_queue_t)self->_cacheQueue, v12);
}

void __82__PLPhotoKitVariationCache_savePortraitEffectSettings_sourceType_assetIdentifier___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = *(void **)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __82__PLPhotoKitVariationCache_savePortraitEffectSettings_sourceType_assetIdentifier___block_invoke_2;
    v5[3] = &unk_1E5864300;
    id v6 = *(id *)(a1 + 32);
    [v2 _performChangesForAssetIdentifier:v3 sourceType:v4 changesBlock:v5];
  }
}

uint64_t __82__PLPhotoKitVariationCache_savePortraitEffectSettings_sourceType_assetIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"PortraitEffectSettings"];
}

- (id)analysisResultForAssetIdentifier:(id)a3 sourceType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__9856;
  int64_t v19 = __Block_byref_object_dispose__9857;
  id v20 = 0;
  cacheQueue = self->_cacheQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__PLPhotoKitVariationCache_analysisResultForAssetIdentifier_sourceType___block_invoke;
  v11[3] = &unk_1E5873DC0;
  v11[4] = self;
  id v12 = v6;
  id v13 = &v15;
  int64_t v14 = a4;
  id v8 = v6;
  dispatch_sync(cacheQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __72__PLPhotoKitVariationCache_analysisResultForAssetIdentifier_sourceType___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _fileURLWithIdentifier:*(void *)(a1 + 40) sourceType:*(void *)(a1 + 56) pathExtension:@"plist"];
  id v2 = [*(id *)(a1 + 32) _readInfoForURL:v6];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"AnalysisResult"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)analysisResultForAssetIdentifier:(id)a3
{
  return [(PLPhotoKitVariationCache *)self analysisResultForAssetIdentifier:a3 sourceType:0];
}

- (void)saveAnalysisResult:(id)a3 assetIdentifier:(id)a4 sourceType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__PLPhotoKitVariationCache_saveAnalysisResult_assetIdentifier_sourceType___block_invoke;
  v13[3] = &unk_1E58735D8;
  id v14 = v8;
  uint64_t v15 = self;
  id v16 = v9;
  int64_t v17 = a5;
  id v10 = v9;
  id v11 = v8;
  dispatch_block_t v12 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_UTILITY, -8, v13);
  dispatch_barrier_async((dispatch_queue_t)self->_cacheQueue, v12);
}

void __74__PLPhotoKitVariationCache_saveAnalysisResult_assetIdentifier_sourceType___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = *(void **)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __74__PLPhotoKitVariationCache_saveAnalysisResult_assetIdentifier_sourceType___block_invoke_2;
    v5[3] = &unk_1E5864300;
    id v6 = *(id *)(a1 + 32);
    [v2 _performChangesForAssetIdentifier:v3 sourceType:v4 changesBlock:v5];
  }
}

uint64_t __74__PLPhotoKitVariationCache_saveAnalysisResult_assetIdentifier_sourceType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"AnalysisResult"];
}

- (void)saveAnalysisResult:(id)a3 assetIdentifier:(id)a4
{
}

- (PLPhotoKitVariationCache)initWithCacheURL:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PLPhotoKitVariationCache.m", 84, @"Invalid parameter not satisfying: %@", @"cacheURL" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PLPhotoKitVariationCache;
  uint64_t v7 = [(PLPhotoKitVariationCache *)&v15 init];
  if (v7)
  {
    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.PLPhotoKitVariationCache.cacheQueue", v8);
    cacheQueue = v7->_cacheQueue;
    v7->_cacheQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v7->_cacheURL, a3);
    id v11 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    memoryCache = v7->_memoryCache;
    v7->_memoryCache = v11;

    [(NSCache *)v7->_memoryCache setTotalCostLimit:0x200000];
  }

  return v7;
}

- (PLPhotoKitVariationCache)initWithPathManager:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v5 = [a3 privateCacheDirectoryWithSubType:7 createIfNeeded:1 error:0];
  id v6 = [v4 fileURLWithPath:v5 isDirectory:1];

  uint64_t v7 = [(PLPhotoKitVariationCache *)self initWithCacheURL:v6];
  return v7;
}

@end