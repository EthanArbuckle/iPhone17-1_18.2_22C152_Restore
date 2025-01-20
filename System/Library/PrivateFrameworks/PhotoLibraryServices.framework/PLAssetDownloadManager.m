@interface PLAssetDownloadManager
+ (id)defaultManager;
- (PLAssetDownloadManager)init;
- (PLAssetDownloadManagerDelegate)delegate;
- (int)requestRequiredResourcesForManagedAssetObjectUUID:(id)a3 library:(id)a4 completionHandler:(id)a5;
- (void)_onQueueAsync:(id)a3;
- (void)cancelRequest:(int)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PLAssetDownloadManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_progressById, 0);
  objc_storeStrong((id *)&self->_requestsById, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PLAssetDownloadManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLAssetDownloadManagerDelegate *)WeakRetained;
}

- (void)cancelRequest:(int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__PLAssetDownloadManager_cancelRequest___block_invoke;
  v3[3] = &unk_1E5863058;
  v3[4] = self;
  int v4 = a3;
  [(PLAssetDownloadManager *)self _onQueueAsync:v3];
}

void __40__PLAssetDownloadManager_cancelRequest___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v2 = objc_msgSend(NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40), 0);
  v3 = [v1 objectForKeyedSubscript:v2];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        v9 = +[PLAssetResourceDownloadManager defaultManager];
        objc_msgSend(v9, "cancelRequest:", objc_msgSend(v8, "intValue"));

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (int)requestRequiredResourcesForManagedAssetObjectUUID:(id)a3 library:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = atomic_fetch_add(&self->_currentRequestId, 1u) + 1;
  long long v12 = [NSNumber numberWithInt:v11];
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__3628;
  v38[4] = __Block_byref_object_dispose__3629;
  id v39 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__3628;
  v36 = __Block_byref_object_dispose__3629;
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke;
  v27[3] = &unk_1E5874900;
  id v13 = v8;
  id v28 = v13;
  id v14 = v9;
  id v29 = v14;
  v30 = v38;
  v31 = &v32;
  [v14 performBlockAndWait:v27];
  if ([(id)v33[5] count])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_4;
    v17[3] = &unk_1E5875AE0;
    v17[4] = self;
    id v18 = v12;
    v22 = &v32;
    id v19 = v13;
    v23 = v38;
    id v20 = v14;
    id v21 = v10;
    [(PLAssetDownloadManager *)self _onQueueAsync:v17];

    uint64_t v15 = v18;
  }
  else
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_3;
    v24[3] = &unk_1E5862F90;
    id v25 = v10;
    int v26 = v11;
    [(PLAssetDownloadManager *)self _onQueueAsync:v24];
    uint64_t v15 = v25;
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(v38, 8);

  return v11;
}

void __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = +[PLManagedAsset assetWithUUID:a1[4] inLibrary:a1[5]];
  uint64_t v3 = [v2 objectID];
  uint64_t v4 = *(void *)(a1[6] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = [v2 persistedResourcesMatching:&__block_literal_global_33];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [v11 cplType];
        if (v12)
        {
          uint64_t v13 = v12;
          if ((int)[v11 remoteAvailability] >= 1)
          {
            id v14 = [v11 cplFileURL];
            char v15 = [v14 checkResourceIsReachableAndReturnError:0];

            if ((v15 & 1) == 0)
            {
              v16 = *(void **)(*(void *)(a1[7] + 8) + 40);
              v17 = [NSNumber numberWithUnsignedInteger:v13];
              [v16 addObject:v17];
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
}

uint64_t __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), 0);
}

void __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setObject:forKey:");
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  long long v27 = 0u;
  id obj = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v2 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v28;
    *(void *)&long long v3 = 138412546;
    long long v17 = v3;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v28 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v6), "unsignedIntegerValue", v17);
        uint64_t v8 = PLBackendGetLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = *(void *)(a1 + 48);
          id v10 = [MEMORY[0x1E4F59940] descriptionForResourceType:v7];
          *(_DWORD *)buf = v17;
          uint64_t v32 = v9;
          __int16 v33 = 2112;
          uint64_t v34 = v10;
          _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Starting download for asset: %@ cloudResourceType: %@", buf, 0x16u);
        }
        uint64_t v11 = +[PLAssetResourceDownloadManager defaultManager];
        uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        uint64_t v13 = *(void *)(a1 + 56);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_36;
        v25[3] = &unk_1E5863008;
        id v14 = *(void **)(a1 + 40);
        v25[4] = *(void *)(a1 + 32);
        id v26 = v14;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_4_43;
        v20[3] = &unk_1E5863030;
        v20[4] = *(void *)(a1 + 32);
        id v21 = *(id *)(a1 + 48);
        uint64_t v24 = v7;
        id v22 = *(id *)(a1 + 40);
        id v23 = *(id *)(a1 + 64);
        uint64_t v15 = [v11 requestCloudResourceType:v7 assetObjectID:v12 library:v13 progressHandler:v25 completionHandler:v20];

        v16 = [NSNumber numberWithInt:v15];
        [v19 addObject:v16];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v4);
  }
}

void __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_36(uint64_t a1, int a2, double a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_2_37;
  v6[3] = &unk_1E5862FE0;
  v6[4] = v5;
  id v7 = *(id *)(a1 + 40);
  double v8 = a3;
  int v9 = a2;
  [v5 _onQueueAsync:v6];
}

void __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_4_43(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_5;
  v11[3] = &unk_1E5872278;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 64);
  id v12 = v7;
  id v13 = v5;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v17 = v8;
  uint64_t v14 = v9;
  id v15 = *(id *)(a1 + 48);
  int v18 = a2;
  id v16 = *(id *)(a1 + 56);
  id v10 = v5;
  [v6 _onQueueAsync:v11];
}

void __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [MEMORY[0x1E4F59940] descriptionForResourceType:*(void *)(a1 + 72)];
    uint64_t v5 = *(void *)(a1 + 40);
    int v11 = 138412802;
    uint64_t v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Finished download for asset: %@ cloudResourceType: %@ error:%@", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v6 = [*(id *)(*(void *)(a1 + 48) + 16) objectForKeyedSubscript:*(void *)(a1 + 56)];
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
    uint64_t v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
    [v6 removeObject:v9];

    if (![v6 count])
    {
      [*(id *)(*(void *)(a1 + 48) + 16) removeObjectForKey:*(void *)(a1 + 56)];
      uint64_t v10 = *(void *)(a1 + 64);
      if (v10) {
        (*(void (**)(uint64_t, void, void))(v10 + 16))(v10, *(unsigned int *)(a1 + 80), *(void *)(a1 + 40));
      }
    }
  }
}

void __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_2_37(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v2)
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  uint64_t v3 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  uint64_t v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  [v2 setObject:v3 forKey:v4];

  uint64_t v10 = 0;
  int v11 = (double *)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_3_38;
  v9[3] = &unk_1E5862FB8;
  v9[4] = &v10;
  [v2 enumerateKeysAndObjectsUsingBlock:v9];
  double v5 = v11[3];
  unint64_t v6 = [v2 count];
  v11[3] = v5 / (double)v6;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if (v4)
  {
    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [v8 progressForRequestId:*(unsigned int *)(a1 + 56) progress:v11[3]];
  }
  _Block_object_dispose(&v10, 8);
}

double __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_3_38(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 floatValue];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = *(double *)(v5 + 24) + v4;
  *(double *)(v5 + 24) = result;
  return result;
}

BOOL __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = ([v2 isDerivative] & 1) == 0
    && [v2 resourceType] != 13
    && [v2 resourceType] != 9;

  return v3;
}

- (PLAssetDownloadManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)PLAssetDownloadManager;
  id v2 = [(PLAssetDownloadManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    requestsById = v2->_requestsById;
    v2->_requestsById = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    progressById = v2->_progressById;
    v2->_progressById = (NSMutableDictionary *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mobileslideshow.plassetdownloadrequest", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)_onQueueAsync:(id)a3
{
}

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_3647);
  }
  id v2 = (void *)defaultManager_manager;
  return v2;
}

void __40__PLAssetDownloadManager_defaultManager__block_invoke()
{
  v0 = objc_alloc_init(PLAssetDownloadManager);
  v1 = (void *)defaultManager_manager;
  defaultManager_manager = (uint64_t)v0;
}

@end