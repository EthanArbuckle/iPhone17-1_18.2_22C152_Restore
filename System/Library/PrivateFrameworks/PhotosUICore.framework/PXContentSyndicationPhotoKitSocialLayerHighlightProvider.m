@interface PXContentSyndicationPhotoKitSocialLayerHighlightProvider
+ (PXContentSyndicationPhotoKitSocialLayerHighlightProvider)sharedInstance;
- (BOOL)isSocialLayerHighlightCachedForAsset:(id)a3;
- (PXContentSyndicationPhotoKitSocialLayerHighlightProvider)init;
- (PXContentSyndicationPhotoKitSocialLayerHighlightProvider)initWithHighlightFetchBlock:(id)a3;
- (id)_serialQueue_fetchSocialLayerHighlightForAsset:(id)a3 usingHighlightResultBlock:(id)a4;
- (id)cachedSocialLayerHighlightForAsset:(id)a3;
- (id)socialLayerHighlightForAsset:(id)a3;
- (void)_didChangeHighlight:(id)a3 forAsset:(id)a4 withChangeObservers:(id)a5;
- (void)_serialQueue_registerChangeObserver:(id)a3 forAsset:(id)a4;
- (void)_serialQueue_unregisterChangeObserver:(id)a3 forAsset:(id)a4;
- (void)fetchSocialLayerHighlightForAsset:(id)a3 completion:(id)a4;
- (void)registerChangeObserver:(id)a3 forAsset:(id)a4;
- (void)unregisterChangeObserver:(id)a3 forAsset:(id)a4;
@end

@implementation PXContentSyndicationPhotoKitSocialLayerHighlightProvider

id __74__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_sharedInstance__block_invoke_2(uint64_t a1, void *a2)
{
  return PXContentSyndicationSocialLayerHighlightForAsset(a2);
}

uint64_t __105__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_fetchSocialLayerHighlightForAsset_completion___block_invoke_2(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = PLSocialLayerHighlightProviderGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = a1[4];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = a1[5];
    int v8 = 138413058;
    uint64_t v9 = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEBUG, "Get highlight: <%@:%p> for asset: <%@:%p>", (uint8_t *)&v8, 0x2Au);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __105__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_fetchSocialLayerHighlightForAsset_completion___block_invoke(id *a1)
{
  v2 = objc_msgSend(a1[4], "_serialQueue_fetchSocialLayerHighlightForAsset:usingHighlightResultBlock:", a1[5], *((void *)a1[4] + 5));
  uint64_t v3 = v2;
  if (a1[6])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __105__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_fetchSocialLayerHighlightForAsset_completion___block_invoke_2;
    block[3] = &unk_1E5DD0E78;
    id v5 = v2;
    id v6 = a1[5];
    id v7 = a1[6];
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (id)_serialQueue_fetchSocialLayerHighlightForAsset:(id)a3 usingHighlightResultBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v8 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m", 142, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m", 143, @"Invalid parameter not satisfying: %@", @"highlightFetchBlock" object file lineNumber description];

LABEL_3:
  uint64_t v9 = [(PXLRUMemoryCache *)self->_highlightsCache objectForKey:v7];
  if (v9) {
    goto LABEL_13;
  }
  if (![(NSHashTable *)self->_assetsWithNilHighlightsCache containsObject:v7])
  {
    __int16 v10 = PLSocialLayerHighlightProviderGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = objc_opt_class();
      __int16 v19 = 2048;
      id v20 = v7;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEBUG, "Fetching highlight for asset: <%@:%p>", buf, 0x16u);
    }

    uint64_t v11 = v8[2](v8, v7);
    if (v11)
    {
      uint64_t v9 = (void *)v11;
      [(PXLRUMemoryCache *)self->_highlightsCache setObject:v11 forKey:v7];
      [(NSHashTable *)self->_assetsWithNilHighlightsCache removeObject:v7];
      goto LABEL_13;
    }
    if ([(NSHashTable *)self->_assetsWithNilHighlightsCache count] == 128)
    {
      assetsWithNilHighlightsCache = self->_assetsWithNilHighlightsCache;
      uint64_t v13 = [(NSHashTable *)assetsWithNilHighlightsCache anyObject];
      [(NSHashTable *)assetsWithNilHighlightsCache removeObject:v13];
    }
    [(NSHashTable *)self->_assetsWithNilHighlightsCache addObject:v7];
  }
  uint64_t v9 = 0;
LABEL_13:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_highlightFetchBlock, 0);
  objc_storeStrong((id *)&self->_assetsWithNilHighlightsCache, 0);
  objc_storeStrong((id *)&self->_highlightsCache, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)_didChangeHighlight:(id)a3 forAsset:(id)a4 withChangeObservers:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v11 = PLSocialLayerHighlightProviderGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    __int16 v14 = [v10 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138413314;
    uint64_t v21 = v12;
    __int16 v22 = 2048;
    id v23 = v8;
    __int16 v24 = 2112;
    uint64_t v25 = v13;
    __int16 v26 = 2048;
    id v27 = v9;
    __int16 v28 = 2112;
    v29 = v14;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEBUG, "Did change SLHighlight: <%@:%p> for asset: <%@:%p> with change observers: (%@)", buf, 0x34u);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __109__PXContentSyndicationPhotoKitSocialLayerHighlightProvider__didChangeHighlight_forAsset_withChangeObservers___block_invoke;
  v17[3] = &unk_1E5DC70F8;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v15 = v9;
  id v16 = v8;
  [v10 enumerateObjectsUsingBlock:v17];
}

uint64_t __109__PXContentSyndicationPhotoKitSocialLayerHighlightProvider__didChangeHighlight_forAsset_withChangeObservers___block_invoke(void *a1, void *a2)
{
  return [a2 socialLayerHighlightProvider:a1[4] didChangeSocialLayerHighlight:a1[5] forAsset:a1[6]];
}

- (void)_serialQueue_unregisterChangeObserver:(id)a3 forAsset:(id)a4
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
    id v10 = PLSocialLayerHighlightProviderGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412546;
      uint64_t v12 = objc_opt_class();
      __int16 v13 = 2048;
      id v14 = v6;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEBUG, "No observers for asset: <%@:%p>", (uint8_t *)&v11, 0x16u);
    }

    [(PXLRUMemoryCache *)self->_highlightsCache removeObjectForKey:v6];
  }
}

- (void)_serialQueue_registerChangeObserver:(id)a3 forAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v8 = [(NSMutableDictionary *)self->_observers objectForKeyedSubscript:v7];
  if (!v8)
  {
    id v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(NSMutableDictionary *)self->_observers setObject:v8 forKeyedSubscript:v7];
  }
  [v8 addObject:v6];
  objc_initWeak(&location, self);
  id v9 = [(PXContentSyndicationPhotoKitSocialLayerHighlightProvider *)self _serialQueue_fetchSocialLayerHighlightForAsset:v7 usingHighlightResultBlock:self->_highlightFetchBlock];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__PXContentSyndicationPhotoKitSocialLayerHighlightProvider__serialQueue_registerChangeObserver_forAsset___block_invoke;
  block[3] = &unk_1E5DCEA88;
  objc_copyWeak(&v17, &location);
  id v14 = v9;
  id v15 = v7;
  id v16 = v6;
  id v10 = v6;
  id v11 = v7;
  id v12 = v9;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __105__PXContentSyndicationPhotoKitSocialLayerHighlightProvider__serialQueue_registerChangeObserver_forAsset___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = *(void *)(a1 + 48);
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [WeakRetained _didChangeHighlight:v3 forAsset:v4 withChangeObservers:v5];
}

- (id)socialLayerHighlightForAsset:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    id v20 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v20);
    uint64_t v21 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v17 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m", 126, @"%@ should be an instance inheriting from %@, but it is %@", @"asset", v19, v21 object file lineNumber description];
  }
  else
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m", 124, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    id v18 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v18);
    [v17 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m", 126, @"%@ should be an instance inheriting from %@, but it is nil", @"asset", v19 object file lineNumber description];
  }

LABEL_3:
  uint64_t v25 = 0;
  __int16 v26 = &v25;
  uint64_t v27 = 0x3032000000;
  __int16 v28 = __Block_byref_object_copy__226146;
  v29 = __Block_byref_object_dispose__226147;
  id v30 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_socialLayerHighlightForAsset___block_invoke;
  block[3] = &unk_1E5DCCA20;
  __int16 v24 = &v25;
  void block[4] = self;
  id v9 = v6;
  id v23 = v9;
  dispatch_sync(serialQueue, block);
  id v10 = PLSocialLayerHighlightProviderGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = v26[5];
    uint64_t v13 = objc_opt_class();
    *(_DWORD *)buf = 138413058;
    uint64_t v32 = v11;
    __int16 v33 = 2048;
    uint64_t v34 = v12;
    __int16 v35 = 2112;
    uint64_t v36 = v13;
    __int16 v37 = 2048;
    id v38 = v9;
    _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEBUG, "Get highlight: <%@:%p> for asset: <%@:%p>", buf, 0x2Au);
  }

  id v14 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v14;
}

void __89__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_socialLayerHighlightForAsset___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_serialQueue_fetchSocialLayerHighlightForAsset:usingHighlightResultBlock:", *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)cachedSocialLayerHighlightForAsset:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m", 118, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  id v6 = [(PXLRUMemoryCache *)self->_highlightsCache objectForKey:v5];

  return v6;
}

- (BOOL)isSocialLayerHighlightCachedForAsset:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m", 109, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  id v6 = [(PXLRUMemoryCache *)self->_highlightsCache allKeys];
  char v7 = [v6 containsObject:v5];

  BOOL v8 = (v7 & 1) != 0 || [(NSHashTable *)self->_assetsWithNilHighlightsCache containsObject:v5];
  return v8;
}

- (void)fetchSocialLayerHighlightForAsset:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m", 93, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    id v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    [v14 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m", 95, @"%@ should be an instance inheriting from %@, but it is nil", @"asset", v16 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  id v9 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    id v17 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v17);
    id v18 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
    [v14 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m", 95, @"%@ should be an instance inheriting from %@, but it is %@", @"asset", v16, v18 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_fetchSocialLayerHighlightForAsset_completion___block_invoke;
  block[3] = &unk_1E5DD0E78;
  void block[4] = self;
  id v20 = v7;
  id v21 = v8;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(serialQueue, block);
}

- (void)unregisterChangeObserver:(id)a3 forAsset:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m", 79, @"Invalid parameter not satisfying: %@", @"changeObserver" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m", 80, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

LABEL_3:
  id v10 = PLSocialLayerHighlightProviderGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v27 = objc_opt_class();
    __int16 v28 = 2048;
    id v29 = v7;
    __int16 v30 = 2112;
    uint64_t v31 = objc_opt_class();
    __int16 v32 = 2048;
    __int16 v33 = v9;
    _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEBUG, "Un-register change observer: <%@:%p> for asset: <%@:%p>", buf, 0x2Au);
  }

  id v11 = v9;
  if (!v9)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    id v18 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v18);
    [v17 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m", 84, @"%@ should be an instance inheriting from %@, but it is nil", @"asset", v19 object file lineNumber description];
LABEL_12:

    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    id v20 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v20);
    id v21 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
    [v17 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m", 84, @"%@ should be an instance inheriting from %@, but it is %@", @"asset", v19, v21 object file lineNumber description];

    goto LABEL_12;
  }
LABEL_7:
  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_unregisterChangeObserver_forAsset___block_invoke;
  block[3] = &unk_1E5DD2548;
  objc_copyWeak(&v25, (id *)buf);
  id v23 = v7;
  id v24 = v11;
  id v13 = v11;
  id v14 = v7;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

void __94__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_unregisterChangeObserver_forAsset___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_serialQueue_unregisterChangeObserver:forAsset:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)registerChangeObserver:(id)a3 forAsset:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m", 65, @"Invalid parameter not satisfying: %@", @"changeObserver" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m", 66, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

LABEL_3:
  id v10 = PLSocialLayerHighlightProviderGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v27 = objc_opt_class();
    __int16 v28 = 2048;
    id v29 = v7;
    __int16 v30 = 2112;
    uint64_t v31 = objc_opt_class();
    __int16 v32 = 2048;
    __int16 v33 = v9;
    _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEBUG, "Register change observer: <%@:%p> for asset: <%@:%p>", buf, 0x2Au);
  }

  id v11 = v9;
  if (!v9)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    id v18 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v18);
    [v17 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m", 70, @"%@ should be an instance inheriting from %@, but it is nil", @"asset", v19 object file lineNumber description];
LABEL_12:

    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    id v20 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v20);
    id v21 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
    [v17 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m", 70, @"%@ should be an instance inheriting from %@, but it is %@", @"asset", v19, v21 object file lineNumber description];

    goto LABEL_12;
  }
LABEL_7:
  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_registerChangeObserver_forAsset___block_invoke;
  block[3] = &unk_1E5DD2548;
  objc_copyWeak(&v25, (id *)buf);
  id v23 = v7;
  id v24 = v11;
  id v13 = v11;
  id v14 = v7;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

void __92__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_registerChangeObserver_forAsset___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_serialQueue_registerChangeObserver:forAsset:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (PXContentSyndicationPhotoKitSocialLayerHighlightProvider)initWithHighlightFetchBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m", 40, @"Invalid parameter not satisfying: %@", @"highlightFetchBlock" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)PXContentSyndicationPhotoKitSocialLayerHighlightProvider;
  id v6 = [(PXContentSyndicationPhotoKitSocialLayerHighlightProvider *)&v20 init];
  if (v6)
  {
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.PXContentSyndicationPhotoKitSocialLayerHighlightProvider", v7);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v8;

    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observers = v6->_observers;
    v6->_observers = v10;

    id v12 = objc_alloc_init(PXLRUMemoryCache);
    highlightsCache = v6->_highlightsCache;
    v6->_highlightsCache = v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:0 capacity:128];
    assetsWithNilHighlightsCache = v6->_assetsWithNilHighlightsCache;
    v6->_assetsWithNilHighlightsCache = (NSHashTable *)v14;

    uint64_t v16 = [v5 copy];
    id highlightFetchBlock = v6->_highlightFetchBlock;
    v6->_id highlightFetchBlock = (id)v16;
  }
  return v6;
}

- (PXContentSyndicationPhotoKitSocialLayerHighlightProvider)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m", 36, @"%s is not available as initializer", "-[PXContentSyndicationPhotoKitSocialLayerHighlightProvider init]");

  abort();
}

+ (PXContentSyndicationPhotoKitSocialLayerHighlightProvider)sharedInstance
{
  if (sharedInstance_onceToken_226170 != -1) {
    dispatch_once(&sharedInstance_onceToken_226170, &__block_literal_global_209_226171);
  }
  uint64_t v2 = (void *)sharedInstance_sharedInstance_226172;
  return (PXContentSyndicationPhotoKitSocialLayerHighlightProvider *)v2;
}

void __74__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_sharedInstance__block_invoke()
{
  v0 = [[PXContentSyndicationPhotoKitSocialLayerHighlightProvider alloc] initWithHighlightFetchBlock:&__block_literal_global_213_226175];
  v1 = (void *)sharedInstance_sharedInstance_226172;
  sharedInstance_sharedInstance_226172 = (uint64_t)v0;
}

@end