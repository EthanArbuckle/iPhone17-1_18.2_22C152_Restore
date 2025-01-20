@interface FCAssetManager
- (FCAssetManager)init;
- (FCAssetManager)initWithName:(id)a3 directory:(id)a4 keyManager:(id)a5 avAssetFactory:(id)a6 resourceURLGenerator:(id)a7 networkBehaviorMonitor:(id)a8 networkReachability:(id)a9;
- (id)_assetHandleForCKAssetURLComponents:(uint64_t)a3 lifetimeHint:;
- (id)_assetKeyForRemoteURL:(uint64_t)a1;
- (id)_importFileAtPath:(uint64_t)a3 method:(void *)a4 key:(void *)a5 mimeType:(void *)a6 importedMetadata:(uint64_t)a7 lifetimeHint:;
- (id)assetHandleForCKAssetURL:(id)a3 lifetimeHint:(int64_t)a4;
- (id)assetHandleForCKAssetURLString:(id)a3 lifetimeHint:(int64_t)a4;
- (id)assetHandleForCKAssetURLString:(id)a3 prefetchedData:(id)a4 unzipIfNeeded:(BOOL)a5 lifetimeHint:(int64_t)a6;
- (id)assetHandleForRecordID:(id)a3 field:(int64_t)a4 lifetimeHint:(int64_t)a5 contentDatabase:(id)a6;
- (id)assetHandleForResourceID:(id)a3 contentContext:(id)a4;
- (id)assetHandleForResourceID:(id)a3 lifetimeHint:(int64_t)a4 contentContext:(id)a5;
- (id)assetHandleForURL:(id)a3 lifetimeHint:(int64_t)a4;
- (id)assetHandleForURL:(id)a3 prefetchedFileURL:(id)a4 importMethod:(int64_t)a5 lifetimeHint:(int64_t)a6;
- (id)contentArchiveForAssetHandle:(id)a3;
- (id)importAsset:(id)a3 remoteURL:(id)a4 fileURL:(id)a5;
- (id)interestTokenForAssetURLs:(id)a3;
- (id)operationToFetchDataProviderForAssetHandle:(id)a3 completion:(id)a4;
- (int64_t)storageSize;
- (unint64_t)cacheCoordinatorCurrentSizeWithReadLock:(id)a3;
- (void)_prepareForUseIfNeeded;
- (void)assetStore;
- (void)cacheCoordinator:(id)a3 flushKeysWithWriteLock:(id)a4;
- (void)d_resetAssetHandle:(id)a3;
- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3;
- (void)keyValueStore;
- (void)save;
- (void)saveWithCompletionHandler:(id)a3;
- (void)t_save;
@end

@implementation FCAssetManager

- (id)assetHandleForCKAssetURLString:(id)a3 lifetimeHint:(int64_t)a4
{
  if (a3)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F29088], "componentsWithString:");
    v7 = -[FCAssetManager _assetHandleForCKAssetURLComponents:lifetimeHint:](self, v6, a4);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_assetHandleForCKAssetURLComponents:(uint64_t)a3 lifetimeHint:
{
  if (a1)
  {
    id v5 = a2;
    FCUpdateAssetURLHostIfNeeded(v5);
    v6 = [v5 URL];

    v7 = [a1 assetHandleForURL:v6 lifetimeHint:a3];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)assetHandleForURL:(id)a3 lifetimeHint:(int64_t)a4
{
  id v6 = a3;
  -[FCAssetManager _prepareForUseIfNeeded]((uint64_t)self);
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__75;
  v72 = __Block_byref_object_dispose__75;
  id v73 = 0;
  v7 = -[FCAssetManager _assetKeyForRemoteURL:]((uint64_t)self, v6);
  if (self) {
    assetHandlesLock = self->_assetHandlesLock;
  }
  else {
    assetHandlesLock = 0;
  }
  v9 = assetHandlesLock;
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __49__FCAssetManager_assetHandleForURL_lifetimeHint___block_invoke;
  v65[3] = &unk_1E5B4C230;
  v67 = &v68;
  v65[4] = self;
  id v10 = v7;
  id v66 = v10;
  [(NFUnfairLock *)v9 performWithLockSync:v65];

  v11 = (void *)v69[5];
  if (!v11)
  {
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x3032000000;
    v62 = __Block_byref_object_copy__75;
    v63 = __Block_byref_object_dispose__75;
    id v64 = 0;
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__75;
    v57 = __Block_byref_object_dispose__75;
    id v58 = 0;
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__75;
    v51 = __Block_byref_object_dispose__75;
    id v52 = 0;
    if (self) {
      cacheCoordinator = self->_cacheCoordinator;
    }
    else {
      cacheCoordinator = 0;
    }
    v13 = cacheCoordinator;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __49__FCAssetManager_assetHandleForURL_lifetimeHint___block_invoke_2;
    v40[3] = &unk_1E5B5AA20;
    v44 = &v59;
    v14 = v13;
    v41 = v14;
    id v15 = v10;
    id v42 = v15;
    v43 = self;
    v45 = &v53;
    v46 = &v47;
    [(FCCacheCoordinator *)v14 performCacheRead:v40];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __49__FCAssetManager_assetHandleForURL_lifetimeHint___block_invoke_3;
    v39[3] = &unk_1E5B5AA48;
    v39[6] = &v53;
    v39[7] = &v59;
    v39[4] = self;
    v39[5] = &v47;
    v16 = __49__FCAssetManager_assetHandleForURL_lifetimeHint___block_invoke_3(v39);
    v17 = -[FCAssetHandle initWithDataProvider:]([FCAssetHandle alloc], v16);
    v18 = (void *)v69[5];
    v69[5] = (uint64_t)v17;

    uint64_t v19 = v69[5];
    if (v19)
    {
      objc_storeWeak((id *)(v19 + 80), self);
      uint64_t v20 = v69[5];
    }
    else
    {
      uint64_t v20 = 0;
    }
    -[FCAssetHandle setRemoteURL:](v20, v6);
    -[FCAssetHandle setHoldToken:](v69[5], (void *)v60[5]);
    v22 = (void *)v69[5];
    if (v22)
    {
      objc_setProperty_atomic_copy(v22, v21, (id)v54[5], 112);
      v24 = (void *)v69[5];
      if (v24)
      {
        objc_setProperty_atomic(v24, v23, (id)v48[5], 120);
        v26 = (void *)v69[5];
        if (v26)
        {
          objc_setProperty_nonatomic_copy(v26, v25, v15, 96);
          uint64_t v27 = v69[5];
          if (v27) {
            *(void *)(v27 + 104) = a4;
          }
        }
      }
    }
    if (!v16)
    {
      v32 = (void *)v48[5];
      if (v32)
      {
        if ([v32 error] && objc_msgSend((id)v48[5], "error") == 1)
        {
          v34 = objc_msgSend(MEMORY[0x1E4F28C58], "fc_HTTPErrorWithURL:statusCode:requestUUID:additionalUserInfo:", v6, 404, 0, 0);
          v35 = (void *)v69[5];
          if (v35) {
            objc_setProperty_atomic(v35, v33, v34, 16);
          }
        }
      }
    }
    if (self) {
      v28 = self->_assetHandlesLock;
    }
    else {
      v28 = 0;
    }
    v29 = v28;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __49__FCAssetManager_assetHandleForURL_lifetimeHint___block_invoke_6;
    v36[3] = &unk_1E5B4C4D0;
    v36[4] = self;
    id v37 = v15;
    v38 = &v68;
    [(NFUnfairLock *)v29 performWithLockSync:v36];

    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(&v53, 8);

    _Block_object_dispose(&v59, 8);
    v11 = (void *)v69[5];
  }
  id v30 = v11;

  _Block_object_dispose(&v68, 8);
  return v30;
}

- (void)_prepareForUseIfNeeded
{
  if (a1)
  {
    v1 = *(NSObject **)(a1 + 96);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__FCAssetManager__prepareForUseIfNeeded__block_invoke;
    block[3] = &unk_1E5B4C018;
    block[4] = a1;
    dispatch_sync(v1, block);
  }
}

- (id)_assetKeyForRemoteURL:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = (void *)MEMORY[0x1A6260FD0]();
    id v5 = [v3 scheme];
    if (([v5 isEqualToString:@"http"] & 1) != 0
      || [v5 isEqualToString:@"https"])
    {
      id v6 = [v3 path];
      v7 = [v6 stringByReplacingOccurrencesOfString:@"/" withString:@":"];
      v8 = (void *)[v7 copy];
    }
    else
    {
      v9 = NSString;
      id v6 = [v3 absoluteString];
      v8 = objc_msgSend(v9, "stringWithFormat:", @"%lu", objc_msgSend(v6, "hash"));
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

FCANEFFileDataProvider *__49__FCAssetManager_assetHandleForURL_lifetimeHint___block_invoke_3(void *a1)
{
  v2 = *(void **)(*(void *)(a1[5] + 8) + 40);
  if (v2 && *(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id v3 = [v2 wrappingKeyID];

    if (v3)
    {
      v4 = (void *)a1[4];
      if (v4) {
        v4 = (void *)v4[11];
      }
      id v5 = *(void **)(*(void *)(a1[5] + 8) + 40);
      id v6 = v4;
      v7 = [v5 wrappingKeyID];
      v8 = [v6 cachedWrappingKeyWithID:v7];

      if (v8)
      {
        id v9 = v8;
        id v10 = [[FCANEFFileDataProvider alloc] initWithFilePath:*(void *)(*(void *)(a1[6] + 8) + 40) wrappingKey:v9 options:a1[4] != 0 holdToken:*(void *)(*(void *)(a1[7] + 8) + 40)];
      }
      else
      {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = [[FCRawFileDataProvider alloc] initWithFilePath:*(void *)(*(void *)(a1[6] + 8) + 40) holdToken:*(void *)(*(void *)(a1[7] + 8) + 40)];
    }
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

void __49__FCAssetManager_assetHandleForURL_lifetimeHint___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) holdTokenForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = -[FCAssetManager assetStore](*(void **)(a1 + 48));
  uint64_t v6 = [v5 filePathForKey:*(void *)(a1 + 40)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  -[FCAssetManager keyValueStore](*(void **)(a1 + 48));
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v12 objectForKey:*(void *)(a1 + 40)];
  uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

void __49__FCAssetManager_assetHandleForURL_lifetimeHint___block_invoke_6(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[7];
  }
  uint64_t v3 = a1[5];
  v4 = v2;
  id obj = [v4 objectForKey:v3];

  if (obj)
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
  }
  else
  {
    uint64_t v5 = a1[4];
    if (v5) {
      uint64_t v6 = *(void **)(v5 + 56);
    }
    else {
      uint64_t v6 = 0;
    }
    [v6 setObject:*(void *)(*(void *)(a1[6] + 8) + 40) forKey:a1[5]];
  }
}

void __49__FCAssetManager_assetHandleForURL_lifetimeHint___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[7];
  }
  uint64_t v3 = a1[5];
  uint64_t v7 = v2;
  uint64_t v4 = [v7 objectForKey:v3];
  uint64_t v5 = *(void *)(a1[6] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)keyValueStore
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = a1;
    uint64_t v2 = (void *)a1[4];
    if (!v2)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_keyValueStore");
        *(_DWORD *)buf = 136315906;
        uint64_t v6 = "-[FCAssetManager keyValueStore]";
        __int16 v7 = 2080;
        v8 = "FCAssetManager.m";
        __int16 v9 = 1024;
        int v10 = 876;
        __int16 v11 = 2114;
        id v12 = v4;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        uint64_t v2 = (void *)v1[4];
      }
      else
      {
        uint64_t v2 = 0;
      }
    }
    a1 = v2;
  }
  return a1;
}

- (void)assetStore
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = a1;
    uint64_t v2 = (void *)a1[5];
    if (!v2)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_assetStore");
        *(_DWORD *)buf = 136315906;
        uint64_t v6 = "-[FCAssetManager assetStore]";
        __int16 v7 = 2080;
        v8 = "FCAssetManager.m";
        __int16 v9 = 1024;
        int v10 = 882;
        __int16 v11 = 2114;
        id v12 = v4;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        uint64_t v2 = (void *)v1[5];
      }
      else
      {
        uint64_t v2 = 0;
      }
    }
    a1 = v2;
  }
  return a1;
}

- (FCAssetManager)initWithName:(id)a3 directory:(id)a4 keyManager:(id)a5 avAssetFactory:(id)a6 resourceURLGenerator:(id)a7 networkBehaviorMonitor:(id)a8 networkReachability:(id)a9
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v51 = a8;
  id v19 = a9;
  if (!v14 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v45 = a8;
    v41 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "name != nil");
    *(_DWORD *)buf = 136315906;
    v54 = "-[FCAssetManager initWithName:directory:keyManager:avAssetFactory:resourceURLGenerator:networkBehaviorMonitor:"
          "networkReachability:]";
    __int16 v55 = 2080;
    v56 = "FCAssetManager.m";
    __int16 v57 = 1024;
    int v58 = 110;
    __int16 v59 = 2114;
    v60 = v41;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    a8 = v45;
    if (v15) {
      goto LABEL_6;
    }
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v46 = a8;
    id v42 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "directory != nil");
    *(_DWORD *)buf = 136315906;
    v54 = "-[FCAssetManager initWithName:directory:keyManager:avAssetFactory:resourceURLGenerator:networkBehaviorMonitor:"
          "networkReachability:]";
    __int16 v55 = 2080;
    v56 = "FCAssetManager.m";
    __int16 v57 = 1024;
    int v58 = 111;
    __int16 v59 = 2114;
    v60 = v42;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    a8 = v46;
  }
LABEL_6:
  v50 = v19;
  if (!v19 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v47 = a8;
    v43 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "networkReachability != nil");
    *(_DWORD *)buf = 136315906;
    v54 = "-[FCAssetManager initWithName:directory:keyManager:avAssetFactory:resourceURLGenerator:networkBehaviorMonitor:"
          "networkReachability:]";
    __int16 v55 = 2080;
    v56 = "FCAssetManager.m";
    __int16 v57 = 1024;
    int v58 = 112;
    __int16 v59 = 2114;
    v60 = v43;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    a8 = v47;
  }
  v52.receiver = self;
  v52.super_class = (Class)FCAssetManager;
  uint64_t v20 = [(FCAssetManager *)&v52 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    name = v20->_name;
    v20->_name = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    parentDirectory = v20->_parentDirectory;
    v20->_parentDirectory = (NSString *)v23;

    [v14 stringByAppendingString:@"-assetstore"];
    id v49 = v17;
    id v44 = a7;
    v26 = id v25 = v16;
    [v15 stringByAppendingPathComponent:v26];
    v28 = id v27 = a8;

    uint64_t v29 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v28 isDirectory:0];
    directoryURLForCachedAssets = v20->_directoryURLForCachedAssets;
    v20->_directoryURLForCachedAssets = (NSURL *)v29;

    v31 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v32 = dispatch_queue_create("com.apple.news.assetmanager.init", v31);
    initQueue = v20->_initQueue;
    v20->_initQueue = (OS_dispatch_queue *)v32;

    id v16 = v25;
    v34 = objc_alloc_init(FCCacheCoordinator);
    cacheCoordinator = v20->_cacheCoordinator;
    v20->_cacheCoordinator = v34;

    [(FCCacheCoordinator *)v20->_cacheCoordinator setDelegate:v20];
    uint64_t v36 = +[FCMapTable strongToWeakObjectsMapTable];
    assetHandles = v20->_assetHandles;
    v20->_assetHandles = (FCMapTable *)v36;

    uint64_t v38 = [objc_alloc(MEMORY[0x1E4F81C18]) initWithOptions:1];
    assetHandlesLock = v20->_assetHandlesLock;
    v20->_assetHandlesLock = (NFUnfairLock *)v38;

    objc_storeStrong((id *)&v20->_networkBehaviorMonitor, v27);
    objc_storeStrong((id *)&v20->_networkReachability, a9);
    objc_storeStrong((id *)&v20->_keyManager, a5);
    objc_storeStrong((id *)&v20->_avAssetFactory, a6);
    id v17 = v49;
    objc_storeStrong((id *)&v20->_resourceURLGenerator, v44);
  }
  return v20;
}

void __29__FCAssetManager__initStores__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = v7;
    if (([v8 hasSize] & 1) == 0 && (objc_msgSend(v8, "hasError") & 1) == 0) {
      objc_msgSend(v8, "setSize:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "sizeOfFileForKey:", v9));
    }
  }
}

- (id)assetHandleForRecordID:(id)a3 field:(int64_t)a4 lifetimeHint:(int64_t)a5 contentDatabase:(id)a6
{
  id v8 = [a6 permanentURLForRecordID:a3 field:a4];
  if (v8)
  {
    id v9 = [(FCAssetManager *)self assetHandleForURL:v8 lifetimeHint:a5];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __40__FCAssetManager__prepareForUseIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 32))
  {
    if (!NSClassFromString(&cfstr_Xctest.isa)
      && [MEMORY[0x1E4F29060] isMainThread]
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = (void *)[[NSString alloc] initWithFormat:@"This operation must not be performed on the main thread."];
      *(_DWORD *)uint64_t v21 = 136315906;
      *(void *)&v21[4] = "-[FCAssetManager _initStores]";
      *(_WORD *)&v21[12] = 2080;
      *(void *)&v21[14] = "FCAssetManager.m";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 731;
      WORD2(v22) = 2114;
      *(void *)((char *)&v22 + 6) = v20;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v21, 0x26u);
    }
    uint64_t v2 = objc_alloc_init(FCKeyValueStoreClassRegistry);
    [(FCKeyValueStoreClassRegistry *)v2 registerClass:objc_opt_class()];
    uint64_t v3 = [(FCKeyValueStoreClassRegistry *)v2 registerClass:objc_opt_class()];
    uint64_t v4 = (void *)MEMORY[0x1A6260FD0](v3);
    id v5 = [FCKeyValueStore alloc];
    uint64_t v6 = [*(id *)(v1 + 16) stringByAppendingString:@"-keyvaluestore"];
    uint64_t v7 = [(FCKeyValueStore *)v5 initWithName:v6 directory:*(void *)(v1 + 24) version:6 options:0 classRegistry:v2];
    id v8 = *(void **)(v1 + 32);
    *(void *)(v1 + 32) = v7;

    id v9 = (void *)MEMORY[0x1A6260FD0]();
    int v10 = [FCAssetStore alloc];
    __int16 v11 = [*(id *)(v1 + 104) path];
    id v12 = [*(id *)(v1 + 32) allKeys];
    uint64_t v13 = [(FCAssetStore *)v10 initWithDirectoryAtPath:v11 preferredAssetPathExtension:0 knownKeys:v12];
    id v14 = *(void **)(v1 + 40);
    *(void *)(v1 + 40) = v13;

    id v15 = (void *)MEMORY[0x1A6260FD0]();
    id v16 = *(void **)(v1 + 32);
    *(void *)uint64_t v21 = MEMORY[0x1E4F143A8];
    *(void *)&v21[8] = 3221225472;
    *(void *)&v21[16] = __29__FCAssetManager__initStores__block_invoke;
    *(void *)&long long v22 = &unk_1E5B5AC50;
    *((void *)&v22 + 1) = v1;
    [v16 enumerateKeysAndObjectsUsingBlock:v21];
    id v17 = [*(id *)(v1 + 40) allKeys];
    id v18 = *(void **)(v1 + 48);
    id v19 = [*(id *)(v1 + 32) objectForKeyedSubscript:@"cacheHints"];
    [v18 setupWithInitialKeys:v17 persistedHints:v19];
  }
}

- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3
{
  uint64_t v4 = 10000000;
  uint64_t v5 = 5000000;
  BOOL v6 = a3 == 0;
  if (a3 == 1) {
    BOOL v6 = 0;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a3 != 1) {
    uint64_t v4 = 0;
  }
  if (a3 == 2) {
    uint64_t v7 = 200000000;
  }
  else {
    uint64_t v7 = v5;
  }
  BOOL v8 = a3 != 2 && v6;
  if (a3 == 2) {
    uint64_t v9 = 300000000;
  }
  else {
    uint64_t v9 = v4;
  }
  int v10 = [[FCCacheCoordinatorFlushPolicy alloc] initWithLowWaterMark:v7 highWaterMark:v9 alwaysFlushKeysWithZeroInterest:v8];
  if (self) {
    cacheCoordinator = self->_cacheCoordinator;
  }
  else {
    cacheCoordinator = 0;
  }
  id v12 = v10;
  [(FCCacheCoordinator *)cacheCoordinator enableFlushingWithPolicy:v10];
}

- (FCAssetManager)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    BOOL v8 = "-[FCAssetManager init]";
    __int16 v9 = 2080;
    int v10 = "FCAssetManager.m";
    __int16 v11 = 1024;
    int v12 = 99;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCAssetManager init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)assetHandleForCKAssetURL:(id)a3 lifetimeHint:(int64_t)a4
{
  id v6 = [MEMORY[0x1E4F29088] componentsWithURL:a3 resolvingAgainstBaseURL:0];
  uint64_t v7 = -[FCAssetManager _assetHandleForCKAssetURLComponents:lifetimeHint:](self, v6, a4);

  return v7;
}

- (id)assetHandleForCKAssetURLString:(id)a3 prefetchedData:(id)a4 unzipIfNeeded:(BOOL)a5 lifetimeHint:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  -[FCAssetManager _prepareForUseIfNeeded]((uint64_t)self);
  int v12 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__75;
  v29[4] = __Block_byref_object_dispose__75;
  id v30 = 0;
  if (v11)
  {
    __int16 v13 = -[FCAssetManager _assetKeyForRemoteURL:]((uint64_t)self, v12);
    if (self) {
      cacheCoordinator = self->_cacheCoordinator;
    }
    else {
      cacheCoordinator = 0;
    }
    uint64_t v15 = cacheCoordinator;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __91__FCAssetManager_assetHandleForCKAssetURLString_prefetchedData_unzipIfNeeded_lifetimeHint___block_invoke;
    long long v22 = &unk_1E5B5AA70;
    uint64_t v23 = self;
    id v16 = v13;
    id v24 = v16;
    BOOL v28 = a5;
    id v25 = v11;
    v26 = v29;
    int64_t v27 = a6;
    [(FCCacheCoordinator *)v15 performCacheWrite:&v19];
  }
  id v17 = -[FCAssetManager assetHandleForCKAssetURLString:lifetimeHint:](self, "assetHandleForCKAssetURLString:lifetimeHint:", v10, a6, v19, v20, v21, v22, v23);
  _Block_object_dispose(v29, 8);

  return v17;
}

void __91__FCAssetManager_assetHandleForCKAssetURLString_prefetchedData_unzipIfNeeded_lifetimeHint___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 48);
  }
  else {
    uint64_t v3 = 0;
  }
  if (([v3 cacheContainsKey:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v19 = *(id *)(a1 + 48);
    if (*(unsigned char *)(a1 + 72) && objc_msgSend(*(id *)(a1 + 48), "fc_isGzipped"))
    {
      uint64_t v4 = objc_msgSend(*(id *)(a1 + 48), "fc_gzipInflate");

      id v19 = (id)v4;
    }
    uint64_t v5 = -[FCAssetManager assetStore](*(void **)(a1 + 32));
    id v6 = (void *)[v5 copyData:v19 withKey:*(void *)(a1 + 40)];

    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7) {
        BOOL v8 = *(void **)(v7 + 48);
      }
      else {
        BOOL v8 = 0;
      }
      [v8 didInsertKeyIntoCache:*(void *)(a1 + 40) withLifetimeHint:*(void *)(a1 + 64)];
      __int16 v9 = *(void **)(a1 + 32);
      if (v9) {
        __int16 v9 = (void *)v9[6];
      }
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = v9;
      uint64_t v12 = [v11 holdTokenForKey:v10];
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      uint64_t v15 = *(void *)(a1 + 32);
      if (v15) {
        id v16 = *(void **)(v15 + 48);
      }
      else {
        id v16 = 0;
      }
      id v17 = [v16 persistableHints];
      if (v17)
      {
        id v18 = -[FCAssetManager keyValueStore](*(void **)(a1 + 32));
        [v18 setObject:v17 forKey:@"cacheHints"];
      }
    }
  }
}

- (id)assetHandleForURL:(id)a3 prefetchedFileURL:(id)a4 importMethod:(int64_t)a5 lifetimeHint:(int64_t)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "remoteURL");
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[FCAssetManager assetHandleForURL:prefetchedFileURL:importMethod:lifetimeHint:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "FCAssetManager.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v37) = 308;
    WORD2(v37) = 2114;
    *(void *)((char *)&v37 + 6) = v21;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (!v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "prefetchedFileURL");
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[FCAssetManager assetHandleForURL:prefetchedFileURL:importMethod:lifetimeHint:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "FCAssetManager.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v37) = 309;
    WORD2(v37) = 2114;
    *(void *)((char *)&v37 + 6) = v22;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  -[FCAssetManager _prepareForUseIfNeeded]((uint64_t)self);
  uint64_t v12 = -[FCAssetManager _assetKeyForRemoteURL:]((uint64_t)self, v10);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&long long v37 = __Block_byref_object_copy__75;
  *((void *)&v37 + 1) = __Block_byref_object_dispose__75;
  id v38 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__75;
  v34 = __Block_byref_object_dispose__75;
  id v35 = 0;
  if (self) {
    cacheCoordinator = self->_cacheCoordinator;
  }
  else {
    cacheCoordinator = 0;
  }
  id v14 = cacheCoordinator;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __80__FCAssetManager_assetHandleForURL_prefetchedFileURL_importMethod_lifetimeHint___block_invoke;
  v23[3] = &unk_1E5B5AA98;
  v23[4] = self;
  id v15 = v11;
  id v24 = v15;
  int64_t v28 = a5;
  id v16 = v12;
  id v25 = v16;
  v26 = buf;
  int64_t v29 = a6;
  int64_t v27 = &v30;
  [(FCCacheCoordinator *)v14 performCacheWrite:v23];

  id v17 = [(FCAssetManager *)self assetHandleForURL:v10 lifetimeHint:a6];
  id v19 = v17;
  if (v17) {
    objc_setProperty_atomic_copy(v17, v18, (id)v31[5], 112);
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(buf, 8);

  return v19;
}

void __80__FCAssetManager_assetHandleForURL_prefetchedFileURL_importMethod_lifetimeHint___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) path];
  uint64_t v4 = -[FCAssetManager _importFileAtPath:method:key:mimeType:importedMetadata:lifetimeHint:](v2, v3, *(void *)(a1 + 72), *(void **)(a1 + 48), 0, 0, *(void *)(a1 + 80));

  uint64_t v5 = *(void **)(a1 + 32);
  if (v5) {
    uint64_t v5 = (void *)v5[6];
  }
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = v5;
  uint64_t v8 = [v7 holdTokenForKey:v6];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v4;
}

- (id)_importFileAtPath:(uint64_t)a3 method:(void *)a4 key:(void *)a5 mimeType:(void *)a6 importedMetadata:(uint64_t)a7 lifetimeHint:
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (a1)
  {
    id v17 = -[FCAssetManager assetStore](a1);
    id v18 = [v17 filePathForKey:v14];

    if (v18)
    {
      uint64_t v56 = MEMORY[0x1E4F143A8];
      uint64_t v57 = 3221225472;
      int v58 = __86__FCAssetManager__importFileAtPath_method_key_mimeType_importedMetadata_lifetimeHint___block_invoke;
      __int16 v59 = &unk_1E5B4C840;
      id v60 = v18;
      a1 = (id *)v60;
    }
    else
    {
      v54[0] = 0;
      v54[1] = v54;
      v54[2] = 0x3032000000;
      v54[3] = __Block_byref_object_copy__75;
      v54[4] = __Block_byref_object_dispose__75;
      id v55 = 0;
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __86__FCAssetManager__importFileAtPath_method_key_mimeType_importedMetadata_lifetimeHint___block_invoke_2;
      v49[3] = &unk_1E5B5AC78;
      uint64_t v53 = a3;
      v49[4] = a1;
      id v19 = v13;
      id v20 = v13;
      id v50 = v20;
      id v21 = v14;
      id v51 = v21;
      objc_super v52 = v54;
      uint64_t v22 = __86__FCAssetManager__importFileAtPath_method_key_mimeType_importedMetadata_lifetimeHint___block_invoke_2((uint64_t)v49);
      id v35 = (void *)v22;
      if (v22)
      {
        uint64_t v23 = (void *)v22;
        uint64_t v36 = MEMORY[0x1E4F143A8];
        uint64_t v37 = 3221225472;
        id v38 = __86__FCAssetManager__importFileAtPath_method_key_mimeType_importedMetadata_lifetimeHint___block_invoke_102;
        uint64_t v39 = &unk_1E5B5ACC8;
        id v40 = v16;
        v41 = a1;
        id v24 = v21;
        id v42 = v24;
        id v43 = v15;
        id v34 = v23;
        id v44 = v34;
        __86__FCAssetManager__importFileAtPath_method_key_mimeType_importedMetadata_lifetimeHint___block_invoke_102((uint64_t)&v36);
        v25 = id v13 = v19;
        v26 = -[FCAssetManager keyValueStore](a1);
        [v26 setObject:v25 forKey:v24];

        id v27 = a1[6];
        [v27 didInsertKeyIntoCache:v24 withLifetimeHint:a7];

        id v28 = a1[6];
        int64_t v29 = [v28 persistableHints];

        if (v29)
        {
          uint64_t v30 = -[FCAssetManager keyValueStore](a1);
          objc_msgSend(v30, "setObject:forKey:", v29, @"cacheHints", v34, v35, v36, v37, v38, v39, v40, v41, v42, v43);
        }
        v31 = FCDefaultLog;
        if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v62 = v24;
          _os_log_error_impl(&dword_1A460D000, v31, OS_LOG_TYPE_ERROR, "asset manager successfully imported %{public}@", buf, 0xCu);
        }
        a1 = (id *)v34;

        uint64_t v32 = &v40;
      }
      else
      {
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __86__FCAssetManager__importFileAtPath_method_key_mimeType_importedMetadata_lifetimeHint___block_invoke_3;
        v45[3] = &unk_1E5B5ACA0;
        id v46 = v21;
        id v47 = v20;
        v48 = v54;
        __86__FCAssetManager__importFileAtPath_method_key_mimeType_importedMetadata_lifetimeHint___block_invoke_3(v45);
        a1 = (id *)objc_claimAutoreleasedReturnValue();

        uint64_t v32 = &v46;
      }

      _Block_object_dispose(v54, 8);
    }
  }
  return a1;
}

- (id)importAsset:(id)a3 remoteURL:(id)a4 fileURL:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "assetMetadata");
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[FCAssetManager importAsset:remoteURL:fileURL:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "FCAssetManager.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v35) = 345;
    WORD2(v35) = 2114;
    *(void *)((char *)&v35 + 6) = v23;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v24 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "remoteURL");
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[FCAssetManager importAsset:remoteURL:fileURL:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "FCAssetManager.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v35) = 346;
    WORD2(v35) = 2114;
    *(void *)((char *)&v35 + 6) = v24;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v25 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "fileURL");
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[FCAssetManager importAsset:remoteURL:fileURL:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "FCAssetManager.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v35) = 347;
    WORD2(v35) = 2114;
    *(void *)((char *)&v35 + 6) = v25;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  -[FCAssetManager _prepareForUseIfNeeded]((uint64_t)self);
  uint64_t v11 = -[FCAssetManager _assetKeyForRemoteURL:]((uint64_t)self, v9);
  if (self) {
    cacheCoordinator = self->_cacheCoordinator;
  }
  else {
    cacheCoordinator = 0;
  }
  id v13 = [(FCCacheCoordinator *)cacheCoordinator holdTokenForKey:v11];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&long long v35 = __Block_byref_object_copy__75;
  *((void *)&v35 + 1) = __Block_byref_object_dispose__75;
  id v36 = 0;
  if (self) {
    assetHandlesLock = self->_assetHandlesLock;
  }
  else {
    assetHandlesLock = 0;
  }
  id v15 = assetHandlesLock;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __48__FCAssetManager_importAsset_remoteURL_fileURL___block_invoke;
  v31[3] = &unk_1E5B4C230;
  v33 = buf;
  v31[4] = self;
  id v16 = v11;
  id v32 = v16;
  [(NFUnfairLock *)v15 performWithLockSync:v31];

  if (self) {
    id v17 = self->_cacheCoordinator;
  }
  else {
    id v17 = 0;
  }
  id v18 = v17;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __48__FCAssetManager_importAsset_remoteURL_fileURL___block_invoke_2;
  v26[3] = &unk_1E5B5AAC0;
  v26[4] = self;
  id v19 = v10;
  id v27 = v19;
  id v20 = v16;
  id v28 = v20;
  id v21 = v8;
  id v29 = v21;
  uint64_t v30 = buf;
  [(FCCacheCoordinator *)v18 performCacheWrite:v26];

  _Block_object_dispose(buf, 8);
  return v13;
}

void __48__FCAssetManager_importAsset_remoteURL_fileURL___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[7];
  }
  uint64_t v3 = a1[5];
  uint64_t v7 = v2;
  uint64_t v4 = [v7 objectForKey:v3];
  uint64_t v5 = *(void *)(a1[6] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __48__FCAssetManager_importAsset_remoteURL_fileURL___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) path];
  -[FCAssetManager _importFileAtPath:method:key:mimeType:importedMetadata:lifetimeHint:](v2, v3, 0, *(void **)(a1 + 48), 0, *(void **)(a1 + 56), 0);
  id newValue = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v5) {
    objc_setProperty_atomic_copy(v5, v4, newValue, 112);
  }
  uint64_t v6 = -[FCAssetManager keyValueStore](*(void **)(a1 + 32));
  id v8 = [v6 objectForKey:*(void *)(a1 + 48)];
  id v9 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v9) {
    objc_setProperty_atomic(v9, v7, v8, 120);
  }
}

- (id)interestTokenForAssetURLs:(id)a3
{
  id v4 = a3;
  -[FCAssetManager _prepareForUseIfNeeded]((uint64_t)self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__FCAssetManager_interestTokenForAssetURLs___block_invoke;
  v9[3] = &unk_1E5B5AAE8;
  v9[4] = self;
  uint64_t v5 = objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", v9);

  if (self) {
    cacheCoordinator = self->_cacheCoordinator;
  }
  else {
    cacheCoordinator = 0;
  }
  uint64_t v7 = [(FCCacheCoordinator *)cacheCoordinator holdTokenForKeys:v5];

  return v7;
}

id __44__FCAssetManager_interestTokenForAssetURLs___block_invoke(uint64_t a1, void *a2)
{
  return -[FCAssetManager _assetKeyForRemoteURL:](*(void *)(a1 + 32), a2);
}

- (id)operationToFetchDataProviderForAssetHandle:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, v6);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __72__FCAssetManager_operationToFetchDataProviderForAssetHandle_completion___block_invoke;
  v26[3] = &unk_1E5B5AB10;
  id v8 = v7;
  id v27 = v8;
  objc_copyWeak(&v28, &location);
  v26[4] = self;
  id v9 = v6;
  uint64_t v11 = v26;
  if (self)
  {
    if (v9) {
      id Property = objc_getProperty(v9, v10, 112, 1);
    }
    else {
      id Property = 0;
    }
    id v13 = Property;

    if (v13)
    {
      uint64_t v30 = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      id v32 = __64__FCAssetManager__populateRawFilePathForAssetHandle_completion___block_invoke;
      v33 = &unk_1E5B5AB38;
      id v34 = v11;
      __64__FCAssetManager__populateRawFilePathForAssetHandle_completion___block_invoke((uint64_t)&v30);
      id v14 = (FCAssetDownloadOperation *)objc_claimAutoreleasedReturnValue();
      id v15 = v34;
LABEL_15:

      goto LABEL_16;
    }
    if (v9) {
      id v16 = (void *)v9[12];
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;
    id v18 = [v9 remoteURL];
    id v19 = [v18 host];
    char v20 = [v19 isEqualToString:@"news-record"];

    if (v20) {
      goto LABEL_9;
    }
    uint64_t v22 = [v18 scheme];
    if ([v22 isEqualToString:@"http"])
    {
    }
    else
    {
      uint64_t v23 = [v18 scheme];
      int v24 = [v23 isEqualToString:@"https"];

      if (!v24)
      {
LABEL_9:
        uint64_t v21 = 0;
LABEL_14:
        id v14 = [[FCAssetDownloadOperation alloc] initWithNetworkReachability:self->_networkReachability];
        [(FCAssetDownloadOperation *)v14 setURL:v18];
        [(FCAssetDownloadOperation *)v14 setLoggingKey:v17];
        [(FCAssetDownloadOperation *)v14 setNetworkEventType:v21];
        [(FCAssetDownloadOperation *)v14 setNetworkBehaviorMonitor:self->_networkBehaviorMonitor];
        objc_initWeak(from, v9);
        uint64_t v30 = MEMORY[0x1E4F143A8];
        uint64_t v31 = 3221225472;
        id v32 = __64__FCAssetManager__populateRawFilePathForAssetHandle_completion___block_invoke_3;
        v33 = &unk_1E5B5AB88;
        id v34 = self;
        id v15 = (FCAssetManager *)v17;
        long long v35 = v15;
        objc_copyWeak(&v38, from);
        id v36 = v9;
        uint64_t v37 = v11;
        [(FCAssetDownloadOperation *)v14 setFileDownloadCompletionHandler:&v30];

        objc_destroyWeak(&v38);
        objc_destroyWeak(from);

        goto LABEL_15;
      }
    }
    uint64_t v21 = 15;
    goto LABEL_14;
  }
  id v14 = 0;
LABEL_16:

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

  return v14;
}

void __72__FCAssetManager_operationToFetchDataProviderForAssetHandle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = (void (**)(id, void, id))*(id *)(a1 + 40);
    id v5 = v3;
    id v31 = v5;
    if (v4)
    {
      v4[2](v4, 0, v5);
      id v5 = v31;
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      id v8 = *(id **)(a1 + 32);
      id v7 = *(void **)(a1 + 40);
      id v4 = (void (**)(id, void, id))WeakRetained;
      id v10 = v7;
      if (v8)
      {
        id v11 = objc_getProperty(v4, v9, 112, 1);

        if (v11)
        {
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_63;
          aBlock[3] = &unk_1E5B4CC80;
          uint64_t v12 = &v45;
          id v13 = v4;
          id v45 = v13;
          id v14 = v10;
          id v46 = v14;
          id v15 = _Block_copy(aBlock);
          uint64_t v38 = MEMORY[0x1E4F143A8];
          uint64_t v39 = 3221225472;
          id v40 = __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_2;
          v41 = &unk_1E5B5ABB0;
          id v16 = v13;
          v42[0] = v16;
          v42[1] = v8;
          id v17 = v14;
          id v43 = v17;
          id v18 = (void (**)(void *, void *))_Block_copy(&v38);
          id v19 = v8[11];
          char v20 = v19;
          if (v19)
          {
            id v29 = v15;
            id v21 = v19;
            id v23 = objc_getProperty(v16, v22, 120, 1);
            int v24 = [v23 wrappingKeyID];

            if (v24)
            {
              id v25 = v24;
              v26 = [v21 cachedWrappingKeyWithID:v25];
              if (v26)
              {
                v18[2](v18, v26);
              }
              else
              {
                uint64_t v32 = MEMORY[0x1E4F143A8];
                uint64_t v33 = 3221225472;
                id v34 = __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_5;
                long long v35 = &unk_1E5B5ABD8;
                id v36 = v17;
                uint64_t v37 = v18;
                [v21 fetchWrappingKeyWithID:v25 completionHandler:&v32];
              }
            }
            else
            {
              uint64_t v32 = MEMORY[0x1E4F143A8];
              uint64_t v33 = 3221225472;
              id v34 = __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_4;
              long long v35 = &unk_1E5B4CA88;
              id v36 = v29;
              (*((void (**)(void))v36 + 2))();
              id v25 = v36;
            }

            uint64_t v12 = &v45;
            id v15 = v29;
          }
          else
          {
            uint64_t v32 = MEMORY[0x1E4F143A8];
            uint64_t v33 = 3221225472;
            id v34 = __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_3;
            long long v35 = &unk_1E5B4CA88;
            id v36 = v15;
            (*((void (**)(void))v36 + 2))();
            id v21 = v36;
          }
        }
        else
        {
          uint64_t v38 = MEMORY[0x1E4F143A8];
          uint64_t v39 = 3221225472;
          id v40 = __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke;
          v41 = &unk_1E5B4CA88;
          uint64_t v12 = v42;
          v42[0] = v10;
          __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke((uint64_t)&v38);
        }
      }
    }
    else
    {
      id v27 = *(id *)(a1 + 40);
      id v30 = v27;
      if (v27)
      {
        (*((void (**)(id, void, void))v27 + 2))(v27, 0, 0);
        id v28 = v30;
      }
      else
      {
        id v28 = 0;
      }

      id v4 = 0;
    }
  }
}

uint64_t __72__FCAssetManager_operationToFetchDataProviderForAssetHandle_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __72__FCAssetManager_operationToFetchDataProviderForAssetHandle_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

- (id)contentArchiveForAssetHandle:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __47__FCAssetManager_contentArchiveForAssetHandle___block_invoke;
  id v13 = &unk_1E5B501A0;
  id v14 = v4;
  id v15 = self;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "fc_array:", &v10);
  id v8 = +[FCContentArchive archiveWithChildArchives:](FCContentArchive, "archiveWithChildArchives:", v7, v10, v11, v12, v13);

  return v8;
}

void __47__FCAssetManager_contentArchiveForAssetHandle___block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v3, 120, 1);
  }
  id v5 = Property;
  id v7 = [*(id *)(a1 + 32) remoteURL];
  id v8 = *(id *)(a1 + 32);
  if (v8) {
    id v8 = objc_getProperty(v8, v6, 112, 1);
  }
  id v9 = v8;
  uint64_t v10 = +[FCContentArchive archiveWithAsset:v5 remoteURL:v7 filePath:v9];
  objc_msgSend(v19, "fc_safelyAddObject:", v10);

  id v12 = *(id *)(a1 + 32);
  if (v12) {
    id v12 = objc_getProperty(v12, v11, 120, 1);
  }
  id v13 = v12;
  id v14 = [v13 wrappingKeyID];

  if (v14)
  {
    uint64_t v15 = *(void *)(a1 + 40);
    if (v15) {
      id v16 = *(void **)(v15 + 88);
    }
    else {
      id v16 = 0;
    }
    id v17 = [v16 cachedWrappingKeyWithID:v14];
    if (v17)
    {
      id v18 = +[FCContentArchive archiveWithAssetWrappingKey:v17 wrappingKeyID:v14];
      objc_msgSend(v19, "fc_safelyAddObject:", v18);
    }
  }
}

uint64_t __64__FCAssetManager__populateRawFilePathForAssetHandle_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__FCAssetManager__populateRawFilePathForAssetHandle_completion___block_invoke_2;
    block[3] = &unk_1E5B4CA88;
    id v5 = v1;
    dispatch_async(v2, block);
  }
  return 0;
}

uint64_t __64__FCAssetManager__populateRawFilePathForAssetHandle_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__FCAssetManager__populateRawFilePathForAssetHandle_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v37 = a4;
  id v9 = [v8 responseMIMEType];
  uint64_t v10 = [v7 path];
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = [v8 URL];
  id v13 = v10;
  id v14 = v9;
  uint64_t v15 = 0;
  if (v11 && v13)
  {
    id v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13];
    if (objc_msgSend(v16, "fc_isGzippedWithMIMETypeHint:", v14))
    {
      uint64_t v15 = +[FCGzipAssetTransformer sharedInstance];
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  if (v13 && v15)
  {
    id v17 = NSTemporaryDirectory();
    id v18 = [MEMORY[0x1E4F29128] UUID];
    id v19 = [v18 UUIDString];
    char v20 = [v17 stringByAppendingString:v19];

    id v46 = 0;
    LODWORD(v19) = [v15 transformAssetDataFromFilePath:v13 toFilePath:v20 error:&v46];
    id v21 = (char *)v46;
    if (v19)
    {
      id v22 = v20;

      id v23 = @"application/octet-stream";
      id v13 = v22;
      id v14 = v23;
    }
    else
    {

      int v24 = FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
      {
        id v36 = *(const char **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v48 = v36;
        __int16 v49 = 2114;
        id v50 = v21;
        _os_log_error_impl(&dword_1A460D000, v24, OS_LOG_TYPE_ERROR, "failed to transform asset %{public}@ with error: %{public}@", buf, 0x16u);
      }
      id v13 = 0;
    }
  }
  if (v13)
  {
    id v25 = [MEMORY[0x1E4F28F08] currentQueue];
    v26 = +[FCAssetDownloadOperation sharedURLSession];
    id v27 = [v26 delegateQueue];
    BOOL v28 = v25 == v27;

    if (!v28 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      long long v35 = (void *)[[NSString alloc] initWithFormat:@"successful asset downloads must be handled on URL session queue"];
      *(_DWORD *)buf = 136315906;
      v48 = "-[FCAssetManager _populateRawFilePathForAssetHandle:completion:]_block_invoke";
      __int16 v49 = 2080;
      id v50 = "FCAssetManager.m";
      __int16 v51 = 1024;
      int v52 = 488;
      __int16 v53 = 2114;
      v54 = v35;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    id v29 = *(void **)(a1 + 32);
    if (v29) {
      id v29 = (void *)v29[6];
    }
    id v30 = v29;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __64__FCAssetManager__populateRawFilePathForAssetHandle_completion___block_invoke_56;
    v40[3] = &unk_1E5B5AB60;
    void v40[4] = *(void *)(a1 + 32);
    id v41 = v13;
    id v42 = *(id *)(a1 + 40);
    id v43 = v14;
    objc_copyWeak(&v45, (id *)(a1 + 64));
    id v44 = *(id *)(a1 + 48);
    [v30 performCacheWrite:v40];

    uint64_t v31 = *(void *)(a1 + 56);
    if (v31) {
      (*(void (**)(uint64_t, void))(v31 + 16))(v31, 0);
    }

    objc_destroyWeak(&v45);
  }
  else
  {
    if (v37 && objc_msgSend(v37, "fc_isHTTPNotFoundError"))
    {
      uint64_t v32 = *(void *)(a1 + 32);
      if (v32) {
        uint64_t v33 = *(void **)(v32 + 48);
      }
      else {
        uint64_t v33 = 0;
      }
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __64__FCAssetManager__populateRawFilePathForAssetHandle_completion___block_invoke_2_57;
      v38[3] = &unk_1E5B4BE70;
      v38[4] = v32;
      id v39 = *(id *)(a1 + 40);
      [v33 performCacheWrite:v38];
    }
    uint64_t v34 = *(void *)(a1 + 56);
    if (v34) {
      (*(void (**)(uint64_t, id))(v34 + 16))(v34, v37);
    }
  }
}

void __64__FCAssetManager__populateRawFilePathForAssetHandle_completion___block_invoke_56(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(a1 + 48);
  id v5 = *(void **)(a1 + 56);
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 72));
  id v7 = WeakRetained;
  if (WeakRetained) {
    uint64_t v8 = WeakRetained[13];
  }
  else {
    uint64_t v8 = 0;
  }
  -[FCAssetManager _importFileAtPath:method:key:mimeType:importedMetadata:lifetimeHint:](v2, v3, 1, v4, v5, 0, v8);
  id newValue = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = *(void **)(a1 + 64);
  if (v10) {
    objc_setProperty_atomic_copy(v10, v9, newValue, 112);
  }
  uint64_t v11 = -[FCAssetManager keyValueStore](*(void **)(a1 + 32));
  id v13 = [v11 objectForKey:*(void *)(a1 + 48)];
  id v14 = *(void **)(a1 + 64);
  if (v14) {
    objc_setProperty_atomic(v14, v12, v13, 120);
  }
}

void __64__FCAssetManager__populateRawFilePathForAssetHandle_completion___block_invoke_2_57(uint64_t a1)
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F829C0]);
  [v3 setError:1];
  uint64_t v2 = -[FCAssetManager keyValueStore](*(void **)(a1 + 32));
  [v2 setObject:v3 forKey:*(void *)(a1 + 40)];
}

uint64_t __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v3 = (void *)[[NSString alloc] initWithFormat:@"must fetch asset's raw file before fetching the data provider"];
    int v4 = 136315906;
    id v5 = "-[FCAssetManager _fetchDataProviderForAssetHandle:completion:]_block_invoke";
    __int16 v6 = 2080;
    id v7 = "FCAssetManager.m";
    __int16 v8 = 1024;
    int v9 = 529;
    __int16 v10 = 2114;
    uint64_t v11 = v3;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v4, 0x26u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_63(uint64_t a1)
{
  id v3 = [FCRawFileDataProvider alloc];
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 112, 1);
  }
  id v5 = Property;
  __int16 v6 = *(void **)(a1 + 32);
  if (v6) {
    __int16 v6 = (void *)v6[11];
  }
  id v7 = v6;
  int v9 = [(FCRawFileDataProvider *)v3 initWithFilePath:v5 holdToken:v7];

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, FCRawFileDataProvider *, void))(v8 + 16))(v8, v9, 0);
  }
}

void __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v5 = [FCANEFFileDataProvider alloc];
  id Property = (id)a1[4];
  if (Property) {
    id Property = objc_getProperty(Property, v4, 112, 1);
  }
  id v7 = Property;
  uint64_t v8 = (void *)a1[4];
  BOOL v9 = a1[5] != 0;
  if (v8) {
    uint64_t v8 = (void *)v8[11];
  }
  __int16 v10 = v8;
  uint64_t v12 = [(FCANEFFileDataProvider *)v5 initWithFilePath:v7 wrappingKey:v3 options:v9 holdToken:v10];

  uint64_t v11 = a1[6];
  if (v11) {
    (*(void (**)(uint64_t, FCANEFFileDataProvider *, void))(v11 + 16))(v11, v12, 0);
  }
}

uint64_t __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_6;
    uint64_t v15 = &unk_1E5B4C7C0;
    id v7 = (void (**)(id, void, id))*(id *)(a1 + 32);
    id v17 = v7;
    id v8 = v6;
    id v16 = v8;
    if (v7)
    {
      v7[2](v7, 0, v8);
      id v8 = v16;
    }

    BOOL v9 = v17;
  }
  else
  {
    if (v5)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_8;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_7;
    v10[3] = &unk_1E5B4CA88;
    id v11 = *(id *)(a1 + 32);
    __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_7((uint64_t)v10);
    BOOL v9 = v11;
  }

LABEL_8:
}

uint64_t __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

void __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "fc_missingAssetKeyError");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

- (unint64_t)cacheCoordinatorCurrentSizeWithReadLock:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__FCAssetManager_cacheCoordinatorCurrentSizeWithReadLock___block_invoke;
  aBlock[3] = &unk_1E5B5AC28;
  void aBlock[4] = self;
  id v3 = a3;
  int v4 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
  id v5 = [v3 keysWithZeroInterest];
  unint64_t v6 = v4[2](v4, v5);
  id v7 = [v3 keysWithNonZeroInterest];

  uint64_t v8 = v4[2](v4, v7);
  BOOL v9 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = v9;
    uint64_t v11 = [v7 count];
    uint64_t v12 = [MEMORY[0x1E4F28B68] stringFromByteCount:v8 countStyle:0];
    uint64_t v13 = [v5 count];
    id v14 = [MEMORY[0x1E4F28B68] stringFromByteCount:v6 countStyle:0];
    *(_DWORD *)buf = 134218754;
    uint64_t v18 = v11;
    __int16 v19 = 2114;
    char v20 = v12;
    __int16 v21 = 2048;
    uint64_t v22 = v13;
    __int16 v23 = 2114;
    int v24 = v14;
    _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "asset manager contains %lu held assets (size=%{public}@) and %lu non-held assets (size=%{public}@)", buf, 0x2Au);
  }
  return v6;
}

uint64_t __58__FCAssetManager_cacheCoordinatorCurrentSizeWithReadLock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  int v4 = -[FCAssetManager keyValueStore](*(void **)(a1 + 32));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__FCAssetManager_cacheCoordinatorCurrentSizeWithReadLock___block_invoke_2;
  v7[3] = &unk_1E5B5AC00;
  v7[4] = &v8;
  [v4 enumerateKeysAndObjectsForKeys:v3 usingBlock:v7];

  uint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __58__FCAssetManager_cacheCoordinatorCurrentSizeWithReadLock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 size];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (void)cacheCoordinator:(id)a3 flushKeysWithWriteLock:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = v8;
    *(_DWORD *)buf = 134218242;
    uint64_t v26 = [v7 count];
    __int16 v27 = 2112;
    id v28 = v7;
    _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "asset manager is flushing %lu files with keys: %@", buf, 0x16u);
  }
  uint64_t v10 = -[FCAssetManager keyValueStore](self);
  uint64_t v11 = [v7 allObjects];
  [v10 removeObjectsForKeys:v11];

  uint64_t v12 = [v6 persistableHints];
  [v10 setObject:v12 forKey:@"cacheHints"];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v20 + 1) + 8 * v17);
        __int16 v19 = -[FCAssetManager assetStore](self);
        objc_msgSend(v19, "removeFileWithKey:", v18, (void)v20);

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }
}

- (void)saveWithCompletionHandler:(id)a3
{
  int v4 = (void (**)(void))a3;
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__75;
  uint64_t v12 = __Block_byref_object_dispose__75;
  id v13 = 0;
  initQueue = self->_initQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__FCAssetManager_saveWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5B4C258;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(initQueue, v7);
  if (v9[5])
  {
    id v6 = -[FCAssetManager keyValueStore](self);
    [v6 saveWithCompletionHandler:v4];
  }
  else
  {
    v4[2](v4);
  }
  _Block_object_dispose(&v8, 8);
}

void __44__FCAssetManager_saveWithCompletionHandler___block_invoke(uint64_t a1)
{
}

- (void)save
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__75;
  uint64_t v8 = __Block_byref_object_dispose__75;
  id v9 = 0;
  initQueue = self->_initQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __22__FCAssetManager_save__block_invoke;
  v3[3] = &unk_1E5B4C258;
  v3[4] = self;
  v3[5] = &v4;
  dispatch_sync(initQueue, v3);
  [(id)v5[5] save];
  _Block_object_dispose(&v4, 8);
}

void __22__FCAssetManager_save__block_invoke(uint64_t a1)
{
}

- (int64_t)storageSize
{
  -[FCAssetManager _prepareForUseIfNeeded]((uint64_t)self);
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  id v3 = -[FCAssetManager keyValueStore](self);
  uint64_t v4 = [v3 storeSize];

  uint64_t v13 = v4;
  if (self) {
    cacheCoordinator = self->_cacheCoordinator;
  }
  else {
    cacheCoordinator = 0;
  }
  uint64_t v6 = cacheCoordinator;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __29__FCAssetManager_storageSize__block_invoke;
  v9[3] = &unk_1E5B4F3B0;
  v9[4] = self;
  void v9[5] = &v10;
  [(FCCacheCoordinator *)v6 performCacheRead:v9];

  int64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __29__FCAssetManager_storageSize__block_invoke(uint64_t a1)
{
  id v2 = -[FCAssetManager keyValueStore](*(void **)(a1 + 32));
  id v3 = *(void **)(a1 + 32);
  if (v3) {
    id v3 = (void *)v3[6];
  }
  uint64_t v4 = v3;
  uint64_t v5 = [v4 allKeys];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__FCAssetManager_storageSize__block_invoke_2;
  v7[3] = &unk_1E5B5AC00;
  uint64_t v6 = *(void *)(a1 + 40);

  v7[4] = v6;
  [v2 enumerateKeysAndObjectsForKeys:v5 usingBlock:v7];
}

uint64_t __29__FCAssetManager_storageSize__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 size];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (void)d_resetAssetHandle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 remoteURL];
  uint64_t v6 = -[FCAssetManager _assetKeyForRemoteURL:]((uint64_t)self, v5);

  if (self) {
    cacheCoordinator = self->_cacheCoordinator;
  }
  else {
    cacheCoordinator = 0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__FCAssetManager_d_resetAssetHandle___block_invoke;
  v10[3] = &unk_1E5B4C738;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  [(FCCacheCoordinator *)cacheCoordinator performCacheWrite:v10];
}

void __37__FCAssetManager_d_resetAssetHandle___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = -[FCAssetManager assetStore](*(void **)(a1 + 32));
  [v2 removeFileWithKey:*(void *)(a1 + 40)];

  id v3 = *(void **)(a1 + 32);
  if (v3) {
    id v3 = (void *)v3[6];
  }
  uint64_t v10 = *(void *)(a1 + 40);
  id v4 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v5 = v3;
  uint64_t v6 = [v4 arrayWithObjects:&v10 count:1];
  objc_msgSend(v5, "didRemoveKeysFromCache:", v6, v10, v11);

  int64_t v7 = -[FCAssetManager keyValueStore](*(void **)(a1 + 32));
  [v7 removeObjectForKey:*(void *)(a1 + 40)];

  id v9 = *(void **)(a1 + 48);
  if (v9) {
    objc_setProperty_atomic_copy(v9, v8, 0, 112);
  }
}

id __86__FCAssetManager__importFileAtPath_method_key_mimeType_importedMetadata_lifetimeHint___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __86__FCAssetManager__importFileAtPath_method_key_mimeType_importedMetadata_lifetimeHint___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3 == 1)
  {
    id v4 = -[FCAssetManager assetStore](*(void **)(a1 + 32));
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    id v8 = (void **)(v13 + 40);
    uint64_t v18 = v14;
    uint64_t v1 = [v4 moveFileAtPath:v11 withKey:v12 error:&v18];
    uint64_t v10 = v18;
  }
  else
  {
    if (v3) {
      goto LABEL_6;
    }
    id v4 = -[FCAssetManager assetStore](*(void **)(a1 + 32));
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = *(void **)(v7 + 40);
    id v8 = (void **)(v7 + 40);
    __int16 v19 = v9;
    uint64_t v1 = (void *)[v4 copyFileAtPath:v5 withKey:v6 error:&v19];
    uint64_t v10 = v19;
  }
  id v15 = v10;
  uint64_t v16 = *v8;
  const char *v8 = v15;

LABEL_6:
  return v1;
}

uint64_t __86__FCAssetManager__importFileAtPath_method_key_mimeType_importedMetadata_lifetimeHint___block_invoke_3(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 40);
    int v7 = 138543874;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "asset manager failed to import %{public}@ from %{public}@, error=%{public}@", (uint8_t *)&v7, 0x20u);
  }
  return 0;
}

id __86__FCAssetManager__importFileAtPath_method_key_mimeType_importedMetadata_lifetimeHint___block_invoke_102(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    id v2 = v1;
  }
  else
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F829C0]);
    uint64_t v4 = -[FCAssetManager assetStore](*(void **)(a1 + 40));
    objc_msgSend(v2, "setSize:", objc_msgSend(v4, "sizeOfFileForKey:", *(void *)(a1 + 48)));

    uint64_t v6 = *(void **)(a1 + 56);
    if (!v6 || FCMIMETypeIsANEF(v6, v5))
    {
      int v7 = -[FCANEFHeader initWithFilePath:]([FCANEFHeader alloc], *(void *)(a1 + 64));
      uint64_t v8 = v7;
      if (v7)
      {
        id v9 = (id)v7[1];
        [v2 setWrappingKeyID:v9];
      }
    }
  }
  return v2;
}

id __86__FCAssetManager__importFileAtPath_method_key_mimeType_importedMetadata_lifetimeHint___block_invoke_2_103(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceURLGenerator, 0);
  objc_storeStrong((id *)&self->_avAssetFactory, 0);
  objc_storeStrong((id *)&self->_directoryURLForCachedAssets, 0);
  objc_storeStrong((id *)&self->_initQueue, 0);
  objc_storeStrong((id *)&self->_keyManager, 0);
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_assetHandlesLock, 0);
  objc_storeStrong((id *)&self->_assetHandles, 0);
  objc_storeStrong((id *)&self->_cacheCoordinator, 0);
  objc_storeStrong((id *)&self->_assetStore, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_parentDirectory, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)t_save
{
  -[FCAssetManager keyValueStore](self);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 save];
}

- (id)assetHandleForResourceID:(id)a3 contentContext:(id)a4
{
  return [(FCAssetManager *)self assetHandleForResourceID:a3 lifetimeHint:0 contentContext:a4];
}

- (id)assetHandleForResourceID:(id)a3 lifetimeHint:(int64_t)a4 contentContext:(id)a5
{
  id v8 = a3;
  id v9 = [a5 internalContentContext];
  uint64_t v10 = [v9 contentDatabase];
  __int16 v11 = [(FCAssetManager *)self assetHandleForRecordID:v8 field:3 lifetimeHint:a4 contentDatabase:v10];

  return v11;
}

@end