@interface FCAVAssetCache
- (BOOL)containsAssetWithIdentifier:(id)a3;
- (FCAVAssetCache)init;
- (id)cachedFileURLForAssetIdentifier:(id)a3;
- (id)contentArchiveForAssetIdentifier:(id)a3;
- (id)contentKeyIdentifiersForAllAssets;
- (id)contentKeyIdentifiersForAssetIdentifier:(id)a3;
- (id)importAVAsset:(id)a3;
- (id)interestTokenForAssetIdentifier:(id)a3;
- (id)interestTokenForAssetIdentifiers:(id)a3;
- (int64_t)storageSize;
- (uint64_t)_prepareForUse;
- (unint64_t)cacheCoordinatorCurrentSizeWithReadLock:(id)a3;
- (void)adoptFileAtURL:(id)a3 forAssetIdentifier:(id)a4 remoteURL:(id)a5 contentKeyIdentifiers:(id)a6 extension:(id)a7;
- (void)cacheCoordinator:(id)a3 flushKeysWithWriteLock:(id)a4;
- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3;
- (void)initWithCacheDirectory:(void *)a1;
@end

@implementation FCAVAssetCache

- (id)contentKeyIdentifiersForAllAssets
{
  -[FCAVAssetCache _prepareForUse]((uint64_t)self);
  v3 = [MEMORY[0x1E4F1CA80] set];
  if (self) {
    cacheCoordinator = self->_cacheCoordinator;
  }
  else {
    cacheCoordinator = 0;
  }
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __51__FCAVAssetCache_contentKeyIdentifiersForAllAssets__block_invoke;
  v11 = &unk_1E5B4BE70;
  v12 = self;
  id v13 = v3;
  id v5 = v3;
  [(FCCacheCoordinator *)cacheCoordinator performCacheRead:&v8];
  v6 = objc_msgSend(v5, "allObjects", v8, v9, v10, v11, v12);

  return v6;
}

- (uint64_t)_prepareForUse
{
  if (result)
  {
    v1 = *(void **)(result + 16);
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __32__FCAVAssetCache__prepareForUse__block_invoke;
    v2[3] = &unk_1E5B4C018;
    v2[4] = result;
    return [v1 performWithLockSync:v2];
  }
  return result;
}

void __32__FCAVAssetCache__prepareForUse__block_invoke(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v1 = *(id **)(a1 + 32);
  if (!v1[3])
  {
    v2 = objc_alloc_init(FCKeyValueStoreClassRegistry);
    [(FCKeyValueStoreClassRegistry *)v2 registerClass:objc_opt_class()];
    v3 = [FCKeyValueStore alloc];
    id v4 = v1[1];
    v40 = v2;
    uint64_t v5 = [(FCKeyValueStore *)v3 initWithName:@"metadata" directory:v4 version:4 options:0 classRegistry:v2];
    id v6 = v1[3];
    v1[3] = (id)v5;

    v7 = (void *)MEMORY[0x1E4F1CB10];
    id v8 = v1[1];
    uint64_t v9 = [v8 stringByAppendingPathComponent:@"content"];
    uint64_t v10 = [v7 fileURLWithPath:v9 isDirectory:1];
    id v11 = v1[4];
    v1[4] = (id)v10;

    v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v12 createDirectoryAtURL:v1[4] withIntermediateDirectories:1 attributes:0 error:0];

    id v13 = objc_alloc_init(FCCacheCoordinator);
    id v14 = v1[5];
    v1[5] = v13;

    [v1[5] setDelegate:v1];
    v15 = [v1[3] allKeys];
    [v1[5] setupWithInitialKeys:v15];
    v16 = FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v62 = v15;
      _os_log_impl(&dword_1A460D000, v16, OS_LOG_TYPE_DEFAULT, "AV asset cache loaded with cached assets: %{public}@", buf, 0xCu);
    }
    v17 = [MEMORY[0x1E4F1CA80] set];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    obuint64_t j = v15;
    uint64_t v18 = [obj countByEnumeratingWithState:&v47 objects:buf count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v48 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          v23 = [v1[3] objectForKey:v22];
          v24 = -[NTPBAVAsset resolvedCacheURL](v23);
          if (v24)
          {
            [v17 addObject:v24];
          }
          else
          {
            v25 = FCAVAssetLog;
            if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v59 = 138543362;
              uint64_t v60 = v22;
              _os_log_error_impl(&dword_1A460D000, v25, OS_LOG_TYPE_ERROR, "AV asset cache will remove missing asset from metadata store: %{public}@", v59, 0xCu);
            }
            [v1[3] removeObjectForKey:v22];
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v47 objects:buf count:16];
      }
      while (v19);
    }

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v26 = [MEMORY[0x1E4F28CB8] defaultManager];
    v27 = [v1[4] path];
    v28 = [v26 subpathsOfDirectoryAtPath:v27 error:0];

    uint64_t v29 = [v28 countByEnumeratingWithState:&v43 objects:v59 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v44 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = *(const char **)(*((void *)&v43 + 1) + 8 * j);
          v34 = [v1[4] URLByAppendingPathComponent:v33];
          if (([v17 containsObject:v34] & 1) == 0)
          {
            v35 = FCAVAssetLog;
            if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v51 = 138543362;
              v52 = v33;
              _os_log_error_impl(&dword_1A460D000, v35, OS_LOG_TYPE_ERROR, "AV asset cache will remove unknown file from asset store: %{public}@", v51, 0xCu);
            }
            v36 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v42 = 0;
            char v37 = [v36 removeItemAtURL:v34 error:&v42];
            id v38 = v42;

            if ((v37 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
            {
              v39 = (void *)[[NSString alloc] initWithFormat:@"AV asset cache failed to remove unknown file with error: %@", v38];
              *(_DWORD *)v51 = 136315906;
              v52 = "-[FCAVAssetCache _initStores]";
              __int16 v53 = 2080;
              v54 = "FCAVAssetCache.m";
              __int16 v55 = 1024;
              int v56 = 388;
              __int16 v57 = 2114;
              v58 = v39;
              _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: AVAssetCleanupFailed) : %s %s:%d %{public}@", v51, 0x26u);
            }
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v43 objects:v59 count:16];
      }
      while (v30);
    }
  }
}

- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3
{
  id v4 = [[FCCacheCoordinatorFlushPolicy alloc] initWithLowWaterMark:0 highWaterMark:0 alwaysFlushKeysWithZeroInterest:1];
  if (self) {
    cacheCoordinator = self->_cacheCoordinator;
  }
  else {
    cacheCoordinator = 0;
  }
  id v6 = v4;
  [(FCCacheCoordinator *)cacheCoordinator enableFlushingWithPolicy:v4];
}

- (void)initWithCacheDirectory:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)FCAVAssetCache;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      uint64_t v5 = (void *)a1[1];
      a1[1] = v4;

      id v6 = objc_alloc_init(MEMORY[0x1E4F81C18]);
      v7 = (void *)a1[2];
      a1[2] = v6;
    }
  }

  return a1;
}

void __51__FCAVAssetCache_contentKeyIdentifiersForAllAssets__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 24);
  }
  else {
    id v3 = 0;
  }
  uint64_t v4 = objc_msgSend(v3, "allKeys", (void)v18);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * v8);
        objc_opt_class();
        uint64_t v10 = *(void *)(a1 + 32);
        if (v10) {
          id v11 = *(void **)(v10 + 24);
        }
        else {
          id v11 = 0;
        }
        v12 = [v11 objectForKeyedSubscript:v9];
        if (v12)
        {
          if (objc_opt_isKindOfClass()) {
            id v13 = v12;
          }
          else {
            id v13 = 0;
          }
        }
        else
        {
          id v13 = 0;
        }
        id v14 = v13;

        v15 = *(void **)(a1 + 40);
        v16 = [v14 contentKeyIdentifiers];
        objc_msgSend(v15, "fc_safelyAddObjects:", v16);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v17 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v6 = v17;
    }
    while (v17);
  }
}

- (id)interestTokenForAssetIdentifiers:(id)a3
{
  id v4 = a3;
  -[FCAVAssetCache _prepareForUse]((uint64_t)self);
  if (self) {
    cacheCoordinator = self->_cacheCoordinator;
  }
  else {
    cacheCoordinator = 0;
  }
  uint64_t v6 = [(FCCacheCoordinator *)cacheCoordinator holdTokenForKeys:v4];

  return v6;
}

- (FCAVAssetCache)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCAVAssetCache init]";
    __int16 v9 = 2080;
    uint64_t v10 = "FCAVAssetCache.m";
    __int16 v11 = 1024;
    int v12 = 46;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCAVAssetCache init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)interestTokenForAssetIdentifier:(id)a3
{
  id v4 = a3;
  -[FCAVAssetCache _prepareForUse]((uint64_t)self);
  if (self) {
    cacheCoordinator = self->_cacheCoordinator;
  }
  else {
    cacheCoordinator = 0;
  }
  id v6 = [(FCCacheCoordinator *)cacheCoordinator holdTokenForKey:v4];

  return v6;
}

- (BOOL)containsAssetWithIdentifier:(id)a3
{
  id v4 = a3;
  -[FCAVAssetCache _prepareForUse]((uint64_t)self);
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  if (self) {
    cacheCoordinator = self->_cacheCoordinator;
  }
  else {
    cacheCoordinator = 0;
  }
  id v6 = cacheCoordinator;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__FCAVAssetCache_containsAssetWithIdentifier___block_invoke;
  v10[3] = &unk_1E5B4C230;
  int v12 = &v13;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  [(FCCacheCoordinator *)v6 performCacheRead:v10];

  char v8 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __46__FCAVAssetCache_containsAssetWithIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[3];
  }
  uint64_t v3 = a1[5];
  id v4 = v2;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v4 containsObjectForKey:v3];
}

- (id)cachedFileURLForAssetIdentifier:(id)a3
{
  id v4 = a3;
  -[FCAVAssetCache _prepareForUse]((uint64_t)self);
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  char v16 = __Block_byref_object_copy__84;
  uint64_t v17 = __Block_byref_object_dispose__84;
  id v18 = 0;
  if (self) {
    cacheCoordinator = self->_cacheCoordinator;
  }
  else {
    cacheCoordinator = 0;
  }
  id v6 = cacheCoordinator;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__FCAVAssetCache_cachedFileURLForAssetIdentifier___block_invoke;
  v10[3] = &unk_1E5B4C4D0;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  int v12 = &v13;
  [(FCCacheCoordinator *)v6 performCacheRead:v10];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __50__FCAVAssetCache_cachedFileURLForAssetIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = [v3 objectForKey:a1[5]];
  if (v4)
  {
    id v8 = v4;
    uint64_t v5 = -[NTPBAVAsset resolvedCacheURL](v4);
    uint64_t v6 = *(void *)(a1[6] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v4 = v8;
  }
}

- (void)adoptFileAtURL:(id)a3 forAssetIdentifier:(id)a4 remoteURL:(id)a5 contentKeyIdentifiers:(id)a6 extension:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v29 = 0;
  uint64_t v15 = [v11 bookmarkDataWithOptions:0 includingResourceValuesForKeys:0 relativeToURL:0 error:&v29];
  id v16 = v29;
  if (v15)
  {
    id v17 = v15;
    -[FCAVAssetCache _prepareForUse]((uint64_t)self);
    if (self) {
      cacheCoordinator = self->_cacheCoordinator;
    }
    else {
      cacheCoordinator = 0;
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __94__FCAVAssetCache_adoptFileAtURL_forAssetIdentifier_remoteURL_contentKeyIdentifiers_extension___block_invoke_16;
    v20[3] = &unk_1E5B51418;
    v20[4] = self;
    id v21 = v12;
    id v22 = v13;
    id v23 = v14;
    id v24 = v17;
    id v25 = v11;
    id v19 = v17;
    [(FCCacheCoordinator *)cacheCoordinator performCacheWrite:v20];
  }
  else
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __94__FCAVAssetCache_adoptFileAtURL_forAssetIdentifier_remoteURL_contentKeyIdentifiers_extension___block_invoke;
    v26[3] = &unk_1E5B4BE70;
    id v27 = v12;
    id v28 = v16;
    __94__FCAVAssetCache_adoptFileAtURL_forAssetIdentifier_remoteURL_contentKeyIdentifiers_extension___block_invoke((uint64_t)v26);

    id v19 = v27;
  }
}

void __94__FCAVAssetCache_adoptFileAtURL_forAssetIdentifier_remoteURL_contentKeyIdentifiers_extension___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "AV asset cache failed to generate bookmark for asset %{public}@ with error: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

void __94__FCAVAssetCache_adoptFileAtURL_forAssetIdentifier_remoteURL_contentKeyIdentifiers_extension___block_invoke_16(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [v3 objectForKey:*(void *)(a1 + 40)];
  int v5 = (void *)[v4 copy];
  uint64_t v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x1E4F82988]);
  }
  id v15 = v7;

  [v15 setIdentifier:*(void *)(a1 + 40)];
  uint64_t v8 = [*(id *)(a1 + 48) absoluteString];
  [v15 setRemoteURL:v8];

  uint64_t v9 = (void *)[*(id *)(a1 + 56) mutableCopy];
  [v15 setContentKeyIdentifiers:v9];

  [v15 setBookmark:*(void *)(a1 + 64)];
  uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_msgSend(v15, "setSize:", objc_msgSend(v10, "fc_sizeOfItemAtURL:error:", *(void *)(a1 + 72), 0));

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    id v12 = *(void **)(v11 + 24);
  }
  else {
    id v12 = 0;
  }
  [v12 setObject:v15 forKey:*(void *)(a1 + 40)];
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    id v14 = *(void **)(v13 + 40);
  }
  else {
    id v14 = 0;
  }
  [v14 didInsertKeyIntoCache:*(void *)(a1 + 40) withLifetimeHint:0];
}

- (id)contentKeyIdentifiersForAssetIdentifier:(id)a3
{
  id v4 = a3;
  -[FCAVAssetCache _prepareForUse]((uint64_t)self);
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__84;
  id v18 = __Block_byref_object_dispose__84;
  id v19 = 0;
  if (self) {
    cacheCoordinator = self->_cacheCoordinator;
  }
  else {
    cacheCoordinator = 0;
  }
  uint64_t v6 = cacheCoordinator;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__FCAVAssetCache_contentKeyIdentifiersForAssetIdentifier___block_invoke;
  v11[3] = &unk_1E5B4C4D0;
  v11[4] = self;
  id v7 = v4;
  id v12 = v7;
  uint64_t v13 = &v14;
  [(FCCacheCoordinator *)v6 performCacheRead:v11];

  uint64_t v8 = (void *)v15[5];
  if (!v8) {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v9 = v8;

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __58__FCAVAssetCache_contentKeyIdentifiersForAssetIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = [v3 objectForKey:a1[5]];
  if (v4)
  {
    id v9 = v4;
    int v5 = [v4 contentKeyIdentifiers];
    uint64_t v6 = [v5 copy];
    uint64_t v7 = *(void *)(a1[6] + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v4 = v9;
  }
}

- (id)contentArchiveForAssetIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__84;
  id v17 = __Block_byref_object_dispose__84;
  id v18 = 0;
  if (self) {
    cacheCoordinator = self->_cacheCoordinator;
  }
  else {
    cacheCoordinator = 0;
  }
  uint64_t v6 = cacheCoordinator;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__FCAVAssetCache_contentArchiveForAssetIdentifier___block_invoke;
  v10[3] = &unk_1E5B4C230;
  id v12 = &v13;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  [(FCCacheCoordinator *)v6 performCacheRead:v10];

  uint64_t v8 = +[FCContentArchive archiveWithAVAsset:v14[5]];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __51__FCAVAssetCache_contentArchiveForAssetIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[3];
  }
  uint64_t v3 = a1[5];
  id v7 = v2;
  uint64_t v4 = [v7 objectForKey:v3];
  uint64_t v5 = *(void *)(a1[6] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)importAVAsset:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__84;
  id v17 = __Block_byref_object_dispose__84;
  id v18 = 0;
  -[FCAVAssetCache _prepareForUse]((uint64_t)self);
  if (self) {
    cacheCoordinator = self->_cacheCoordinator;
  }
  else {
    cacheCoordinator = 0;
  }
  uint64_t v6 = cacheCoordinator;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__FCAVAssetCache_importAVAsset___block_invoke;
  v10[3] = &unk_1E5B4C230;
  id v12 = &v13;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  [(FCCacheCoordinator *)v6 performCacheWrite:v10];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __32__FCAVAssetCache_importAVAsset___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[5];
  }
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = v2;
  uint64_t v5 = [v3 identifier];
  uint64_t v6 = [v4 holdTokenForKey:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = *(void **)(a1 + 32);
  if (v9) {
    id v9 = (void *)v9[3];
  }
  uint64_t v10 = *(void **)(a1 + 40);
  id v11 = v9;
  id v12 = [v10 identifier];
  int v13 = [v11 containsObjectForKey:v12];

  if (v13)
  {
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __32__FCAVAssetCache_importAVAsset___block_invoke_2;
    v49[3] = &unk_1E5B4C018;
    id v50 = *(id *)(a1 + 40);
    __32__FCAVAssetCache_importAVAsset___block_invoke_2((uint64_t)v49);
    id v14 = v50;
  }
  else
  {
    uint64_t v15 = -[NTPBAVAsset resolvedCacheURL](*(id *)(a1 + 40));
    if (v15)
    {
      id v14 = v15;
      uint64_t v16 = (void *)FCAVAssetLog;
      if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = *(void **)(a1 + 40);
        id v18 = v16;
        id v19 = [v17 identifier];
        long long v20 = [v14 path];
        *(_DWORD *)buf = 138543618;
        v52 = v19;
        __int16 v53 = 2114;
        v54 = v20;
        _os_log_impl(&dword_1A460D000, v18, OS_LOG_TYPE_DEFAULT, "AV asset cache will copy external AV asset %{public}@, path=%{public}@", buf, 0x16u);
      }
      id v21 = *(void **)(a1 + 32);
      if (v21) {
        id v21 = (void *)v21[4];
      }
      id v22 = v21;
      id v23 = [v14 lastPathComponent];
      id v24 = [v22 URLByAppendingPathComponent:v23];

      id v25 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v46 = 0;
      char v26 = [v25 copyItemAtURL:v14 toURL:v24 error:&v46];
      id v27 = v46;

      if (v26)
      {
        id v43 = 0;
        id v28 = [v24 bookmarkDataWithOptions:0 includingResourceValuesForKeys:0 relativeToURL:0 error:&v43];
        id v29 = v43;
        if (v28)
        {
          id v30 = v28;
          uint64_t v31 = (void *)[*(id *)(a1 + 40) copy];
          [v31 setBookmark:v30];
          v32 = *(void **)(a1 + 32);
          if (v32) {
            v32 = (void *)v32[3];
          }
          v33 = *(void **)(a1 + 40);
          v34 = v32;
          v35 = [v33 identifier];
          [v34 setObject:v31 forKey:v35];

          v36 = *(void **)(a1 + 32);
          if (v36) {
            v36 = (void *)v36[5];
          }
          char v37 = *(void **)(a1 + 40);
          id v38 = v36;
          v39 = [v37 identifier];
          [v38 didInsertKeyIntoCache:v39 withLifetimeHint:0];
        }
        else
        {
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __32__FCAVAssetCache_importAVAsset___block_invoke_23;
          v40[3] = &unk_1E5B4BE70;
          id v41 = *(id *)(a1 + 40);
          id v42 = v29;
          __32__FCAVAssetCache_importAVAsset___block_invoke_23((uint64_t)v40);

          id v30 = v41;
        }
      }
      else
      {
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __32__FCAVAssetCache_importAVAsset___block_invoke_22;
        v44[3] = &unk_1E5B4C018;
        id v45 = v27;
        __32__FCAVAssetCache_importAVAsset___block_invoke_22((uint64_t)v44);
        id v29 = v45;
      }
    }
    else
    {
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __32__FCAVAssetCache_importAVAsset___block_invoke_21;
      v47[3] = &unk_1E5B4C018;
      id v48 = *(id *)(a1 + 40);
      __32__FCAVAssetCache_importAVAsset___block_invoke_21((uint64_t)v47);

      id v14 = 0;
    }
  }
}

void __32__FCAVAssetCache_importAVAsset___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = [v3 identifier];
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "skipping AV asset import because the asset already lives in the cache, identifier=%{public}@", (uint8_t *)&v6, 0xCu);
  }
}

void __32__FCAVAssetCache_importAVAsset___block_invoke_21(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = [v3 identifier];
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_error_impl(&dword_1A460D000, v4, OS_LOG_TYPE_ERROR, "skipping AV asset import because the asset URL could not be resolved, identifier=%{public}@", (uint8_t *)&v6, 0xCu);
  }
}

void __32__FCAVAssetCache_importAVAsset___block_invoke_22(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "AV asset cache failed to copy external AV asset with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __32__FCAVAssetCache_importAVAsset___block_invoke_23(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    int v4 = v2;
    uint64_t v5 = [v3 identifier];
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    _os_log_error_impl(&dword_1A460D000, v4, OS_LOG_TYPE_ERROR, "AV asset cache failed to generate bookmark for copied asset %{public}@ with error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (int64_t)storageSize
{
  -[FCAVAssetCache _prepareForUse]((uint64_t)self);
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  if (self)
  {
    uint64_t v3 = [(FCKeyValueStore *)self->_metadataStore storeSize];
    cacheCoordinator = self->_cacheCoordinator;
  }
  else
  {
    uint64_t v3 = [0 storeSize];
    cacheCoordinator = 0;
  }
  uint64_t v12 = v3;
  uint64_t v5 = cacheCoordinator;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__FCAVAssetCache_storageSize__block_invoke;
  v8[3] = &unk_1E5B4F3B0;
  v8[4] = self;
  v8[5] = &v9;
  [(FCCacheCoordinator *)v5 performCacheRead:v8];

  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __29__FCAVAssetCache_storageSize__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    v1 = (void *)v1[3];
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __29__FCAVAssetCache_storageSize__block_invoke_2;
  v3[3] = &unk_1E5B5BF10;
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __29__FCAVAssetCache_storageSize__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 size];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (unint64_t)cacheCoordinatorCurrentSizeWithReadLock:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  int v4 = [a3 keysWithZeroInterest];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  if (self) {
    metadataStore = self->_metadataStore;
  }
  else {
    metadataStore = 0;
  }
  int64_t v6 = [(FCKeyValueStore *)metadataStore allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v28;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * v12);
        if (self) {
          id v14 = self->_metadataStore;
        }
        else {
          id v14 = 0;
        }
        uint64_t v15 = [(FCKeyValueStore *)v14 objectForKey:*(void *)(*((void *)&v27 + 1) + 8 * v12)];
        int v16 = [v4 containsObject:v13];
        uint64_t v17 = [v15 size];
        if (v16) {
          uint64_t v18 = 0;
        }
        else {
          uint64_t v18 = v17;
        }
        v9 += v18;
        if (v16) {
          uint64_t v19 = v17;
        }
        else {
          uint64_t v19 = 0;
        }
        v10 += v19;

        ++v12;
      }
      while (v8 != v12);
      uint64_t v20 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
      uint64_t v8 = v20;
    }
    while (v20);
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0;
  }

  id v21 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = (void *)MEMORY[0x1E4F28B68];
    id v23 = v21;
    id v24 = [v22 stringFromByteCount:v9 countStyle:0];
    id v25 = [MEMORY[0x1E4F28B68] stringFromByteCount:v10 countStyle:0];
    *(_DWORD *)buf = 138543618;
    v32 = v24;
    __int16 v33 = 2114;
    v34 = v25;
    _os_log_impl(&dword_1A460D000, v23, OS_LOG_TYPE_DEFAULT, "AV asset cache contains %{public}@ of held assets and %{public}@ of non-held assets", buf, 0x16u);
  }
  return v10;
}

- (void)cacheCoordinator:(id)a3 flushKeysWithWriteLock:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    *(_DWORD *)buf = 134218242;
    uint64_t v31 = (const char *)[v6 count];
    __int16 v32 = 2114;
    __int16 v33 = (char *)v6;
    _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "AV asset cache is flushing %lu assets, identifiers=%{public}@", buf, 0x16u);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8 * v12);
        if (self) {
          metadataStore = self->_metadataStore;
        }
        else {
          metadataStore = 0;
        }
        uint64_t v15 = [(FCKeyValueStore *)metadataStore objectForKey:*(void *)(*((void *)&v26 + 1) + 8 * v12)];
        int v16 = -[NTPBAVAsset resolvedCacheURL](v15);
        if (v16)
        {
          uint64_t v17 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v25 = 0;
          char v18 = [v17 removeItemAtURL:v16 error:&v25];
          id v19 = v25;

          if ((v18 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            id v21 = (void *)[[NSString alloc] initWithFormat:@"AV asset cache failed to remove asset %@ with error: %@", v13, v19];
            *(_DWORD *)buf = 136315906;
            uint64_t v31 = "-[FCAVAssetCache cacheCoordinator:flushKeysWithWriteLock:]";
            __int16 v32 = 2080;
            __int16 v33 = "FCAVAssetCache.m";
            __int16 v34 = 1024;
            int v35 = 318;
            __int16 v36 = 2114;
            id v37 = v21;
            _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: AVAssetFlushFailed) : %s %s:%d %{public}@", buf, 0x26u);
          }
          goto LABEL_14;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          id v19 = (id)[[NSString alloc] initWithFormat:@"AV asset cache failed to resolve cache URL for asset %@", v13];
          *(_DWORD *)buf = 136315906;
          uint64_t v31 = "-[FCAVAssetCache cacheCoordinator:flushKeysWithWriteLock:]";
          __int16 v32 = 2080;
          __int16 v33 = "FCAVAssetCache.m";
          __int16 v34 = 1024;
          int v35 = 311;
          __int16 v36 = 2114;
          id v37 = v19;
          _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: AVAssetFlushNoURL) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_14:
        }
        if (self) {
          uint64_t v20 = self->_metadataStore;
        }
        else {
          uint64_t v20 = 0;
        }
        [(FCKeyValueStore *)v20 removeObjectForKey:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v22 = [obj countByEnumeratingWithState:&v26 objects:v38 count:16];
      uint64_t v10 = v22;
    }
    while (v22);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheCoordinator, 0);
  objc_storeStrong((id *)&self->_contentDirectoryURL, 0);
  objc_storeStrong((id *)&self->_metadataStore, 0);
  objc_storeStrong((id *)&self->_initializationLock, 0);
  objc_storeStrong((id *)&self->_cacheDirectory, 0);
}

@end