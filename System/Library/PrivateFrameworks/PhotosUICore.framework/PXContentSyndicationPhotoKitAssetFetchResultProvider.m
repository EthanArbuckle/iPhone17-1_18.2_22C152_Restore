@interface PXContentSyndicationPhotoKitAssetFetchResultProvider
- (PXContentSyndicationPhotoKitAssetFetchResultProvider)init;
- (PXContentSyndicationPhotoKitAssetFetchResultProvider)initWithPhotoLibrary:(id)a3 fetchResultBlock:(id)a4;
- (id)_serialQueue_fetchResultAssetCollection:(id)a3 fetchResultBlock:(id)a4;
- (id)assetFetchResultForAssetCollection:(id)a3;
- (void)_didChangeFetchResult:(id)a3 forAssetCollection:(id)a4 withChangeObservers:(id)a5;
- (void)_serialQueue_invalidateAllAssetFetchResults;
- (void)_serialQueue_invalidateAssetFetchResultsInAssetCollections:(id)a3;
- (void)_serialQueue_registerChangeObserver:(id)a3 forAssetCollection:(id)a4 fetchResultBlock:(id)a5;
- (void)_serialQueue_unregisterChangeObserver:(id)a3 forAssetCollection:(id)a4;
- (void)invalidateAllAssetFetchResults;
- (void)invalidateAssetFetchResultsInAssetCollections:(id)a3;
- (void)photoLibraryDidChange:(id)a3;
- (void)registerChangeObserver:(id)a3 forAssetCollection:(id)a4;
- (void)unregisterChangeObserver:(id)a3 forAssetCollection:(id)a4;
@end

@implementation PXContentSyndicationPhotoKitAssetFetchResultProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResults, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong(&self->_fetchResultBlock, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__PXContentSyndicationPhotoKitAssetFetchResultProvider_photoLibraryDidChange___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __78__PXContentSyndicationPhotoKitAssetFetchResultProvider_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__168284;
  v24 = __Block_byref_object_dispose__168285;
  id v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__168284;
  v18[4] = __Block_byref_object_dispose__168285;
  id v19 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__168284;
  v16 = __Block_byref_object_dispose__168285;
  id v17 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__PXContentSyndicationPhotoKitAssetFetchResultProvider_photoLibraryDidChange___block_invoke_2;
  v7[3] = &unk_1E5DC17D8;
  v7[4] = v2;
  id v8 = *(id *)(a1 + 40);
  v9 = &v20;
  v10 = v18;
  v11 = &v12;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];
  if ([(id)v13[5] count]) {
    [*(id *)(*(void *)(a1 + 32) + 40) removeObjectsForKeys:v13[5]];
  }
  if ([(id)v21[5] count])
  {
    [*(id *)(*(void *)(a1 + 32) + 40) addEntriesFromDictionary:v21[5]];
    objc_initWeak(&location, *(id *)(a1 + 32));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__PXContentSyndicationPhotoKitAssetFetchResultProvider_photoLibraryDidChange___block_invoke_229;
    block[3] = &unk_1E5DC1828;
    block[4] = &v20;
    block[5] = v18;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v18, 8);

  _Block_object_dispose(&v20, 8);
}

void __78__PXContentSyndicationPhotoKitAssetFetchResultProvider_photoLibraryDidChange___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v5];
  id v8 = [v7 allObjects];

  if ([v8 count])
  {
    v9 = [*(id *)(a1 + 40) changeDetailsForFetchResult:v6];
    if (v9)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;
      }
      v13 = [v9 fetchResultAfterChanges];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v13 forKeyedSubscript:v5];
      uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if (!v14)
      {
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
        id v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;

        uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      }
      [v14 setObject:v8 forKeyedSubscript:v5];
    }
  }
  else
  {
    v18 = PLAssetFetchResultProviderGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 138412546;
      uint64_t v24 = objc_opt_class();
      __int16 v25 = 2048;
      id v26 = v5;
      _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEBUG, "Found orphaned asset collection: <%@:%p>", (uint8_t *)&v23, 0x16u);
    }

    id v19 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (!v19)
    {
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v20;

      id v19 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    }
    [v19 addObject:v5];
  }
}

void __78__PXContentSyndicationPhotoKitAssetFetchResultProvider_photoLibraryDidChange___block_invoke_229(uint64_t a1)
{
  v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __78__PXContentSyndicationPhotoKitAssetFetchResultProvider_photoLibraryDidChange___block_invoke_2_230;
  v2[3] = &unk_1E5DC1800;
  v2[4] = *(void *)(a1 + 40);
  objc_copyWeak(&v3, (id *)(a1 + 48));
  [v1 enumerateKeysAndObjectsUsingBlock:v2];
  objc_destroyWeak(&v3);
}

void __78__PXContentSyndicationPhotoKitAssetFetchResultProvider_photoLibraryDidChange___block_invoke_2_230(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 objectForKeyedSubscript:v7];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didChangeFetchResult:v6 forAssetCollection:v7 withChangeObservers:v9];
}

- (void)_didChangeFetchResult:(id)a3 forAssetCollection:(id)a4 withChangeObservers:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v11 = PLAssetFetchResultProviderGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [v8 count];
    uint64_t v14 = objc_opt_class();
    id v15 = [v10 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138413570;
    uint64_t v22 = v12;
    __int16 v23 = 2048;
    id v24 = v8;
    __int16 v25 = 2048;
    uint64_t v26 = v13;
    __int16 v27 = 2112;
    uint64_t v28 = v14;
    __int16 v29 = 2048;
    id v30 = v9;
    __int16 v31 = 2112;
    v32 = v15;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEBUG, "Did change fetch result: <%@:%p, count:%lu> for asset collection: <%@:%p> with change observers: (%@)", buf, 0x3Eu);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __117__PXContentSyndicationPhotoKitAssetFetchResultProvider__didChangeFetchResult_forAssetCollection_withChangeObservers___block_invoke;
  v18[3] = &unk_1E5DC17B0;
  v18[4] = self;
  id v19 = v8;
  id v20 = v9;
  id v16 = v9;
  id v17 = v8;
  [v10 enumerateObjectsUsingBlock:v18];
}

uint64_t __117__PXContentSyndicationPhotoKitAssetFetchResultProvider__didChangeFetchResult_forAssetCollection_withChangeObservers___block_invoke(void *a1, void *a2)
{
  return [a2 assetFetchResultProvider:a1[4] didChangeAssetFetchResult:a1[5] forAssetCollection:a1[6]];
}

- (void)_serialQueue_unregisterChangeObserver:(id)a3 forAssetCollection:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  serialQueue = self->_serialQueue;
  id v8 = a3;
  dispatch_assert_queue_V2(serialQueue);
  id v9 = [(NSMutableDictionary *)self->_observers objectForKeyedSubscript:v6];
  [v9 removeObject:v8];

  if (![v9 count])
  {
    id v10 = PLAssetFetchResultProviderGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412546;
      uint64_t v12 = objc_opt_class();
      __int16 v13 = 2048;
      id v14 = v6;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEBUG, "No observers for asset collection: <%@:%p>", (uint8_t *)&v11, 0x16u);
    }

    [(NSMutableDictionary *)self->_fetchResults setObject:0 forKeyedSubscript:v6];
  }
}

- (void)_serialQueue_registerChangeObserver:(id)a3 forAssetCollection:(id)a4 fetchResultBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  int v11 = [(NSMutableDictionary *)self->_observers objectForKeyedSubscript:v9];
  if (!v11)
  {
    int v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(NSMutableDictionary *)self->_observers setObject:v11 forKeyedSubscript:v9];
  }
  [v11 addObject:v8];
  objc_initWeak(&location, self);
  uint64_t v12 = [(PXContentSyndicationPhotoKitAssetFetchResultProvider *)self _serialQueue_fetchResultAssetCollection:v9 fetchResultBlock:v10];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __128__PXContentSyndicationPhotoKitAssetFetchResultProvider__serialQueue_registerChangeObserver_forAssetCollection_fetchResultBlock___block_invoke;
  block[3] = &unk_1E5DCEA88;
  objc_copyWeak(&v20, &location);
  id v17 = v12;
  id v18 = v9;
  id v19 = v8;
  id v13 = v8;
  id v14 = v9;
  id v15 = v12;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __128__PXContentSyndicationPhotoKitAssetFetchResultProvider__serialQueue_registerChangeObserver_forAssetCollection_fetchResultBlock___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = *(void *)(a1 + 48);
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [WeakRetained _didChangeFetchResult:v3 forAssetCollection:v4 withChangeObservers:v5];
}

- (void)_serialQueue_invalidateAssetFetchResultsInAssetCollections:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NSMutableDictionary removeObjectForKey:](self->_fetchResults, "removeObjectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_serialQueue_invalidateAllAssetFetchResults
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  fetchResults = self->_fetchResults;
  [(NSMutableDictionary *)fetchResults removeAllObjects];
}

- (id)_serialQueue_fetchResultAssetCollection:(id)a3 fetchResultBlock:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v9 = [(NSMutableDictionary *)self->_fetchResults objectForKeyedSubscript:v7];
  if (!v9)
  {
    long long v10 = PLAssetFetchResultProviderGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = objc_opt_class();
      __int16 v17 = 2048;
      id v18 = v7;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEBUG, "Add asset collection: <%@:%p>", buf, 0x16u);
    }

    uint64_t v9 = v8[2](v8, v7);
    if (!v9)
    {
      long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitAssetFetchResultProvider.m", 124, @"Invalid parameter not satisfying: %@", @"fetchResult" object file lineNumber description];
    }
    long long v11 = [v9 photoLibrary];
    if (v11 != self->_photoLibrary)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitAssetFetchResultProvider.m", 126, @"Invalid parameter not satisfying: %@", @"photoLibrary == _photoLibrary" object file lineNumber description];
    }
    [(NSMutableDictionary *)self->_fetchResults setObject:v9 forKeyedSubscript:v7];
  }
  return v9;
}

- (void)invalidateAssetFetchResultsInAssetCollections:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __102__PXContentSyndicationPhotoKitAssetFetchResultProvider_invalidateAssetFetchResultsInAssetCollections___block_invoke;
  v8[3] = &unk_1E5DD32A8;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  dispatch_sync(serialQueue, v8);
  id v7 = PLAssetFetchResultProviderGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "Invalidated cache for asset collections: %@", buf, 0xCu);
  }
}

uint64_t __102__PXContentSyndicationPhotoKitAssetFetchResultProvider_invalidateAssetFetchResultsInAssetCollections___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serialQueue_invalidateAssetFetchResultsInAssetCollections:", *(void *)(a1 + 40));
}

- (void)invalidateAllAssetFetchResults
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__PXContentSyndicationPhotoKitAssetFetchResultProvider_invalidateAllAssetFetchResults__block_invoke;
  block[3] = &unk_1E5DD36F8;
  void block[4] = self;
  dispatch_sync(serialQueue, block);
  uint64_t v3 = PLAssetFetchResultProviderGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "Invalidated cache", v4, 2u);
  }
}

uint64_t __86__PXContentSyndicationPhotoKitAssetFetchResultProvider_invalidateAllAssetFetchResults__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serialQueue_invalidateAllAssetFetchResults");
}

- (id)assetFetchResultForAssetCollection:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitAssetFetchResultProvider.m", 88, @"Invalid parameter not satisfying: %@", @"assetCollection" object file lineNumber description];
  }
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__168284;
  __int16 v23 = __Block_byref_object_dispose__168285;
  id v24 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__PXContentSyndicationPhotoKitAssetFetchResultProvider_assetFetchResultForAssetCollection___block_invoke;
  block[3] = &unk_1E5DCCA20;
  id v18 = &v19;
  void block[4] = self;
  id v7 = v5;
  id v17 = v7;
  dispatch_sync(serialQueue, block);
  uint64_t v8 = PLAssetFetchResultProviderGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = objc_opt_class();
    long long v10 = (void *)v20[5];
    uint64_t v11 = [v10 count];
    uint64_t v12 = objc_opt_class();
    *(_DWORD *)buf = 138413314;
    uint64_t v26 = v9;
    __int16 v27 = 2048;
    uint64_t v28 = v10;
    __int16 v29 = 2048;
    uint64_t v30 = v11;
    __int16 v31 = 2112;
    uint64_t v32 = v12;
    __int16 v33 = 2048;
    id v34 = v7;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "Get fetch result: <%@:%p, count:%lu> for asset collection: <%@:%p>", buf, 0x34u);
  }

  id v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
}

void __91__PXContentSyndicationPhotoKitAssetFetchResultProvider_assetFetchResultForAssetCollection___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_serialQueue_fetchResultAssetCollection:fetchResultBlock:", *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)unregisterChangeObserver:(id)a3 forAssetCollection:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitAssetFetchResultProvider.m", 76, @"Invalid parameter not satisfying: %@", @"changeObserver" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitAssetFetchResultProvider.m", 77, @"Invalid parameter not satisfying: %@", @"assetCollection" object file lineNumber description];

LABEL_3:
  long long v10 = PLAssetFetchResultProviderGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v21 = objc_opt_class();
    __int16 v22 = 2048;
    id v23 = v7;
    __int16 v24 = 2112;
    uint64_t v25 = objc_opt_class();
    __int16 v26 = 2048;
    __int16 v27 = v9;
    _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEBUG, "Un-register change observer: <%@:%p> for asset collection: <%@:%p>", buf, 0x2Au);
  }

  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PXContentSyndicationPhotoKitAssetFetchResultProvider_unregisterChangeObserver_forAssetCollection___block_invoke;
  block[3] = &unk_1E5DD2548;
  objc_copyWeak(&v19, (id *)buf);
  id v17 = v7;
  id v18 = v9;
  id v12 = v9;
  id v13 = v7;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __100__PXContentSyndicationPhotoKitAssetFetchResultProvider_unregisterChangeObserver_forAssetCollection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_serialQueue_unregisterChangeObserver:forAssetCollection:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)registerChangeObserver:(id)a3 forAssetCollection:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitAssetFetchResultProvider.m", 63, @"Invalid parameter not satisfying: %@", @"changeObserver" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitAssetFetchResultProvider.m", 64, @"Invalid parameter not satisfying: %@", @"assetCollection" object file lineNumber description];

LABEL_3:
  long long v10 = PLAssetFetchResultProviderGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v24 = objc_opt_class();
    __int16 v25 = 2048;
    id v26 = v7;
    __int16 v27 = 2112;
    uint64_t v28 = objc_opt_class();
    __int16 v29 = 2048;
    uint64_t v30 = v9;
    _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEBUG, "Register change observer: <%@:%p> for asset collection: <%@:%p>", buf, 0x2Au);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v11 = _Block_copy(self->_fetchResultBlock);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__PXContentSyndicationPhotoKitAssetFetchResultProvider_registerChangeObserver_forAssetCollection___block_invoke;
  block[3] = &unk_1E5DD2078;
  objc_copyWeak(&v22, (id *)buf);
  id v19 = v7;
  id v20 = v9;
  id v21 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v7;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

void __98__PXContentSyndicationPhotoKitAssetFetchResultProvider_registerChangeObserver_forAssetCollection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_serialQueue_registerChangeObserver:forAssetCollection:fetchResultBlock:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (PXContentSyndicationPhotoKitAssetFetchResultProvider)initWithPhotoLibrary:(id)a3 fetchResultBlock:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  long long v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitAssetFetchResultProvider.m", 42, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  id v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitAssetFetchResultProvider.m", 43, @"Invalid parameter not satisfying: %@", @"fetchResultBlock" object file lineNumber description];

LABEL_3:
  v24.receiver = self;
  v24.super_class = (Class)PXContentSyndicationPhotoKitAssetFetchResultProvider;
  uint64_t v11 = [(PXContentSyndicationPhotoKitAssetFetchResultProvider *)&v24 init];
  if (v11)
  {
    id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.PXContentSyndicationPhotoKitAssetFetchResultProvider", v12);
    serialQueue = v11->_serialQueue;
    v11->_serialQueue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v11->_photoLibrary, a3);
    [(PHPhotoLibrary *)v11->_photoLibrary registerChangeObserver:v11];
    id v15 = _Block_copy(v10);
    id fetchResultBlock = v11->_fetchResultBlock;
    v11->_id fetchResultBlock = v15;

    id v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observers = v11->_observers;
    v11->_observers = v17;

    id v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    fetchResults = v11->_fetchResults;
    v11->_fetchResults = v19;
  }
  return v11;
}

- (PXContentSyndicationPhotoKitAssetFetchResultProvider)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXContentSyndicationPhotoKitAssetFetchResultProvider.m", 38, @"%s is not available as initializer", "-[PXContentSyndicationPhotoKitAssetFetchResultProvider init]");

  abort();
}

@end