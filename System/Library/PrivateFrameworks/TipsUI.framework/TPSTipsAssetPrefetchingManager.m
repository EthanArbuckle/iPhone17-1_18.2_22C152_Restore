@interface TPSTipsAssetPrefetchingManager
- (NSMutableArray)sessionItems;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)serialQueue;
- (TPSTip)currentTip;
- (TPSTipsAssetPrefetchingManager)init;
- (int64_t)assetUserInterface;
- (void)addFetchOperationWithAssetConfiguration:(id)a3 type:(int64_t)a4 operationName:(id)a5;
- (void)appendAssetsOperationsForTip:(id)a3;
- (void)cancel;
- (void)cancelFetch;
- (void)dealloc;
- (void)prefetchAssetsFromTip:(id)a3 tips:(id)a4 assetUserInterfaceStyle:(int64_t)a5;
- (void)setAssetUserInterface:(int64_t)a3;
- (void)setCurrentTip:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSessionItems:(id)a3;
@end

@implementation TPSTipsAssetPrefetchingManager

- (TPSTipsAssetPrefetchingManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)TPSTipsAssetPrefetchingManager;
  v2 = [(TPSTipsAssetPrefetchingManager *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.tips.AssetPrefetchingManager", v3);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x263EFF980] array];
    sessionItems = v2->_sessionItems;
    v2->_sessionItems = (NSMutableArray *)v6;

    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v8;

    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:2];
    [(NSOperationQueue *)v2->_operationQueue setQualityOfService:9];
  }
  return v2;
}

- (void)dealloc
{
  [(TPSTipsAssetPrefetchingManager *)self cancelFetch];
  v3.receiver = self;
  v3.super_class = (Class)TPSTipsAssetPrefetchingManager;
  [(TPSTipsAssetPrefetchingManager *)&v3 dealloc];
}

- (void)cancel
{
  objc_initWeak(&location, self);
  objc_super v3 = [(TPSTipsAssetPrefetchingManager *)self serialQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__TPSTipsAssetPrefetchingManager_cancel__block_invoke;
  v4[3] = &unk_2642B2140;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __40__TPSTipsAssetPrefetchingManager_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancelFetch];
}

- (void)cancelFetch
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  objc_super v3 = [(TPSTipsAssetPrefetchingManager *)self sessionItems];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [MEMORY[0x263F7F5F8] data];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217984000, v5, OS_LOG_TYPE_INFO, "Prefetching cancelled", buf, 2u);
    }
  }
  uint64_t v6 = [(TPSTipsAssetPrefetchingManager *)self operationQueue];
  [v6 cancelAllOperations];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v7 = [(TPSTipsAssetPrefetchingManager *)self sessionItems];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
        v13 = [MEMORY[0x263F7F638] defaultManager];
        [v13 cancelSessionItem:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)prefetchAssetsFromTip:(id)a3 tips:(id)a4 assetUserInterfaceStyle:(int64_t)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 identifier];
  uint64_t v11 = [(TPSTipsAssetPrefetchingManager *)self currentTip];
  uint64_t v12 = [v11 identifier];
  int v13 = [v10 isEqualToString:v12];

  if (!v13 || [(TPSTipsAssetPrefetchingManager *)self assetUserInterface] != a5)
  {
    [(TPSTipsAssetPrefetchingManager *)self cancel];
    [(TPSTipsAssetPrefetchingManager *)self setCurrentTip:v8];
    [(TPSTipsAssetPrefetchingManager *)self setAssetUserInterface:a5];
    uint64_t v14 = [v9 count];
    uint64_t v15 = [v9 indexOfObject:v8];
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v16 = v15;
      long long v17 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
      if (v16 < v14 - 1)
      {
        v18 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:");
        v19 = [v9 objectsAtIndexes:v18];

        [v17 addObjectsFromArray:v19];
      }
      if (v16)
      {
        uint64_t v20 = objc_msgSend(v9, "subarrayWithRange:", 0, v16);
        v21 = [v20 reverseObjectEnumerator];
        v22 = [v21 allObjects];

        v23 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v22, "count") != 0);
        v24 = [v22 objectsAtIndexes:v23];

        [v17 addObjectsFromArray:v24];
      }
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v25 = v17;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v31 != v28) {
              objc_enumerationMutation(v25);
            }
            -[TPSTipsAssetPrefetchingManager appendAssetsOperationsForTip:](self, "appendAssetsOperationsForTip:", *(void *)(*((void *)&v30 + 1) + 8 * i), (void)v30);
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v27);
      }
    }
  }
}

- (void)appendAssetsOperationsForTip:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F7F598];
  id v5 = a3;
  uint64_t v6 = [v4 sharedInstance];
  v7 = [v5 fullContentAssets];
  id v8 = [v5 language];
  int64_t v9 = [(TPSTipsAssetPrefetchingManager *)self assetUserInterface];
  uint64_t v10 = [v5 assetFileInfoManager];

  id v11 = [v6 assetConfigurationForAssets:v7 language:v8 userInterfaceStyle:v9 assetFileInfoManager:v10];

  [(TPSTipsAssetPrefetchingManager *)self addFetchOperationWithAssetConfiguration:v11 type:0 operationName:@"image-prefetch"];
  [(TPSTipsAssetPrefetchingManager *)self addFetchOperationWithAssetConfiguration:v11 type:1 operationName:@"video-prefetch"];
}

- (void)addFetchOperationWithAssetConfiguration:(id)a3 type:(int64_t)a4 operationName:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 cacheIdentifierForType:a4];
  uint64_t v11 = [MEMORY[0x263F7F5D8] assetPathFromAssetConfiguration:v8 type:a4];
  uint64_t v12 = (void *)v11;
  if (v10)
  {
    if (v11)
    {
      if (!a4
        || ([MEMORY[0x263F7F5A0] sharedInstance],
            int v13 = objc_claimAutoreleasedReturnValue(),
            [v13 dataCacheForIdentifier:v10],
            uint64_t v14 = objc_claimAutoreleasedReturnValue(),
            v14,
            v13,
            v14))
      {
        uint64_t v15 = [MEMORY[0x263F7F5F8] data];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v28 = v10;
          __int16 v29 = 2112;
          long long v30 = v12;
          _os_log_impl(&dword_217984000, v15, OS_LOG_TYPE_INFO, "Prefetching needed for video with identifier: %@ path %@", buf, 0x16u);
        }

        objc_initWeak((id *)buf, self);
        id v16 = objc_alloc(MEMORY[0x263F7F5B8]);
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke;
        v23[3] = &unk_2642B21E0;
        objc_copyWeak(v26, (id *)buf);
        id v24 = v10;
        id v25 = v12;
        v26[1] = (id)a4;
        long long v17 = (void *)[v16 initWithAsyncBlock:v23];
        [v17 setName:v9];
        v18 = [(TPSTipsAssetPrefetchingManager *)self serialQueue];
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_5;
        v20[3] = &unk_2642B1ED0;
        objc_copyWeak(&v22, (id *)buf);
        id v21 = v17;
        id v19 = v17;
        dispatch_async(v18, v20);

        objc_destroyWeak(&v22);
        objc_destroyWeak(v26);
        objc_destroyWeak((id *)buf);
      }
    }
  }
}

void __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__0;
  v41 = __Block_byref_object_dispose__0;
  id v42 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_16;
  aBlock[3] = &unk_2642B2190;
  id v32 = *(id *)(a1 + 32);
  id v33 = *(id *)(a1 + 40);
  id v34 = WeakRetained;
  v36 = &v37;
  id v5 = v3;
  id v35 = v5;
  uint64_t v6 = _Block_copy(aBlock);
  v7 = v6;
  if (*(void *)(a1 + 56))
  {
    id v8 = [MEMORY[0x263F7F5A0] sharedInstance];
    uint64_t v11 = a1 + 32;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(v11 + 8);
    int v12 = *MEMORY[0x263F085B8];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_3;
    v27[3] = &unk_2642B21B8;
    id v28 = v7;
    LODWORD(v13) = v12;
    uint64_t v14 = [v8 formattedDataForPath:v10 identifier:v9 attributionIdentifier:0 priority:v27 completionHandler:v13];
    uint64_t v15 = (void *)v38[5];
    v38[5] = v14;

    int v16 = *MEMORY[0x263F085C8];
  }
  else
  {
    uint64_t v19 = a1 + 32;
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(void *)(v19 + 8);
    int v16 = *MEMORY[0x263F085C8];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_2;
    v29[3] = &unk_2642B21B8;
    id v30 = v6;
    LODWORD(v20) = v16;
    uint64_t v21 = +[TPSImageAssetController formattedDataForPath:v18 identifier:v17 priority:v29 completionHandler:v20];
    id v22 = (void *)v38[5];
    v38[5] = v21;
  }
  v23 = [(id)v38[5] sessionTask];
  LODWORD(v24) = v16;
  [v23 setPriority:v24];

  if (v38[5])
  {
    id v25 = [WeakRetained serialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_4;
    block[3] = &unk_2642B2168;
    block[4] = WeakRetained;
    block[5] = &v37;
    dispatch_async(v25, block);
  }
  _Block_object_dispose(&v37, 8);
}

void __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x263F7F5F8] data];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_16_cold_2(a1, v4);
  }

  if (v3)
  {
    id v5 = [MEMORY[0x263F7F5F8] data];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_16_cold_1((uint64_t)v3, v5);
    }
  }
  uint64_t v6 = [*(id *)(a1 + 48) serialQueue];

  if (v6)
  {
    v7 = [*(id *)(a1 + 48) serialQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_17;
    v9[3] = &unk_2642B2168;
    uint64_t v8 = *(void *)(a1 + 64);
    v9[4] = *(void *)(a1 + 48);
    v9[5] = v8;
    dispatch_async(v7, v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_17(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionItems];
  [v2 removeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

uint64_t __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionItems];
  [v2 addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained operationQueue];
  [v2 addOperation:*(void *)(a1 + 32)];
}

- (int64_t)assetUserInterface
{
  return self->_assetUserInterface;
}

- (void)setAssetUserInterface:(int64_t)a3
{
  self->_assetUserInterface = a3;
}

- (TPSTip)currentTip
{
  return self->_currentTip;
}

- (void)setCurrentTip:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSMutableArray)sessionItems
{
  return self->_sessionItems;
}

- (void)setSessionItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionItems, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_currentTip, 0);
}

void __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_16_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_217984000, a2, OS_LOG_TYPE_DEBUG, "error %@", (uint8_t *)&v2, 0xCu);
}

void __93__TPSTipsAssetPrefetchingManager_addFetchOperationWithAssetConfiguration_type_operationName___block_invoke_16_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_217984000, a2, OS_LOG_TYPE_DEBUG, "Prefetched image with identifier: %@ path %@", (uint8_t *)&v4, 0x16u);
}

@end