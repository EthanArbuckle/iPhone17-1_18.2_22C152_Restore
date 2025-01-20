@interface WBSLPLinkMetadataCache
- (BOOL)_isMetadataExpiredWithInfo:(id)a3;
- (BOOL)evictionEnabled;
- (NSURL)databaseURL;
- (NSURL)diskCacheURL;
- (WBSLPLinkMetadataCache)initWithCacheDirectoryURL:(id)a3 expirationInterval:(double)a4;
- (WBSLPLinkMetadataCache)initWithCacheDirectoryURL:(id)a3 expirationInterval:(double)a4 maximumNumberOfEntries:(unint64_t)a5;
- (double)expirationInterval;
- (id)_storedMetadataInfoForURLString:(id)a3;
- (int64_t)_internalStatusFromWBSSQLStoreStatus:(int64_t)a3;
- (unint64_t)maximumNumberOfEntries;
- (void)_didFailDiskCacheWriteForMetadataInfo:(id)a3 completionHandler:(id)a4;
- (void)_didFinishDiskCacheWriteWithCompletionHandler:(id)a3;
- (void)_discardAllMetadataInfo;
- (void)_discardMetadataInfoForURLString:(id)a3;
- (void)_evictCacheItemsIfNecessaryWithCompletionHandler:(id)a3;
- (void)_finishSetUpWithStatus:(int64_t)a3;
- (void)_purgeMetadataForURLStrings:(id)a3 completionHandler:(id)a4;
- (void)_storeMetadataInfo:(id)a3 forURLString:(id)a4;
- (void)closeAfterPendingChangesWithCompletionHandler:(id)a3;
- (void)dataCacheDidSetUp:(id)a3;
- (void)getMetadataInfoForURLString:(id)a3 completionHandler:(id)a4;
- (void)getMetadataWithInfo:(id)a3 completionHandler:(id)a4;
- (void)openWithCompletionHandler:(id)a3;
- (void)prewarmInMemoryStoreWithCompletionHandler:(id)a3;
- (void)removeAllMetadataWithCompletionHandler:(id)a3;
- (void)removeMetadataWithURLString:(id)a3 completionHandler:(id)a4;
- (void)reuseMetadataOfURLString:(id)a3 forURLString:(id)a4 completionHandler:(id)a5;
- (void)savePendingChangesBeforeTermination;
- (void)setMetadata:(id)a3 forURLString:(id)a4 lastFetchDate:(id)a5 lastFetchDidSucceed:(BOOL)a6 metadataHasImage:(BOOL)a7 completionHandler:(id)a8;
- (void)sqliteStoreDidFailDatabaseIntegrityCheck:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSLPLinkMetadataCache

void __68__WBSLPLinkMetadataCache_prewarmInMemoryStoreWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[3];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__WBSLPLinkMetadataCache_prewarmInMemoryStoreWithCompletionHandler___block_invoke_3;
    v7[3] = &unk_1E5E444B0;
    v7[4] = WeakRetained;
    id v8 = v3;
    id v9 = *(id *)(a1 + 32);
    objc_copyWeak(&v10, (id *)(a1 + 40));
    dispatch_async(v6, v7);
    objc_destroyWeak(&v10);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)dataCacheDidSetUp:(id)a3
{
  if (self->_cacheState == 1) {
    [(WBSLPLinkMetadataCache *)self _finishSetUpWithStatus:0];
  }
}

- (void)_finishSetUpWithStatus:(int64_t)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__WBSLPLinkMetadataCache__finishSetUpWithStatus___block_invoke;
  v4[3] = &unk_1E5E420F0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(internalQueue, v4);
}

- (WBSLPLinkMetadataCache)initWithCacheDirectoryURL:(id)a3 expirationInterval:(double)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WBSLPLinkMetadataCache;
  v7 = [(WBSLPLinkMetadataCache *)&v19 init];
  if (v7)
  {
    id v8 = [@"LPLinkMetadata" stringByAppendingPathExtension:@"db"];
    uint64_t v9 = [v6 URLByAppendingPathComponent:v8 isDirectory:0];
    databaseURL = v7->_databaseURL;
    v7->_databaseURL = (NSURL *)v9;

    uint64_t v11 = [v6 URLByAppendingPathComponent:@"LPLinkMetadata" isDirectory:1];
    diskCacheURL = v7->_diskCacheURL;
    v7->_diskCacheURL = (NSURL *)v11;

    v7->_expirationInterval = a4;
    v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    id v14 = [NSString stringWithFormat:@"com.apple.SafariShared.WBSLPLinkMetadataCache.%@.%p._internalQueue", objc_opt_class(), v7];
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], v13);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v15;

    v17 = v7;
  }

  return v7;
}

void __52__WBSLPLinkMetadataCache_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) = 1;
  uint64_t v2 = MEMORY[0x1AD115160](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 72) && *(void *)(v5 + 64))
  {
    id v6 = [[WBSOnDiskDataCache alloc] initWithCacheDirectoryURL:*(void *)(*(void *)(a1 + 32) + 72)];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 8);
    *(void *)(v7 + 8) = v6;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setDataCacheDelegate:");
    [*(id *)(*(void *)(a1 + 32) + 8) setIsInMemoryCacheEnabled:0];
    uint64_t v9 = [(WBSSQLiteStore *)[WBSLPLinkMetadataSQLiteStore alloc] initWithURL:*(void *)(*(void *)(a1 + 32) + 64)];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 16);
    *(void *)(v10 + 16) = v9;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setDelegate:");
    v12 = *(void **)(*(void *)(a1 + 32) + 16);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__WBSLPLinkMetadataCache_openWithCompletionHandler___block_invoke_9;
    v14[3] = &unk_1E5E442F8;
    objc_copyWeak(&v15, (id *)(a1 + 48));
    [v12 openAndCheckIntegrity:1 createIfNeeded:1 fallBackToMemoryStoreIfError:0 lockingPolicy:1 completionHandler:v14];
    objc_destroyWeak(&v15);
  }
  else
  {
    v13 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __127__WBSFaviconProviderPersistenceController_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_completionHandler___block_invoke_cold_1(v13);
    }
    [*(id *)(a1 + 32) _finishSetUpWithStatus:3];
  }
}

uint64_t __52__WBSLPLinkMetadataCache_openWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_internalStatusFromWBSSQLStoreStatus:");
    return [v1 _finishSetUpWithStatus:v2];
  }
  else
  {
    v4 = (void *)v1[1];
    return [v4 setUp];
  }
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__WBSLPLinkMetadataCache_openWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E44320;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(internalQueue, v7);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __68__WBSLPLinkMetadataCache_prewarmInMemoryStoreWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 56))
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id v4 = *(void **)(v2 + 16);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __68__WBSLPLinkMetadataCache_prewarmInMemoryStoreWithCompletionHandler___block_invoke_2;
    v5[3] = &unk_1E5E42D70;
    objc_copyWeak(&v7, (id *)(a1 + 48));
    id v6 = *(id *)(a1 + 40);
    [v4 getAllMetadataInfoWithCompletionHandler:v5];

    objc_destroyWeak(&v7);
  }
}

void __52__WBSLPLinkMetadataCache_openWithCompletionHandler___block_invoke_9(uint64_t a1, uint64_t a2)
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained[3];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__WBSLPLinkMetadataCache_openWithCompletionHandler___block_invoke_2;
    v6[3] = &unk_1E5E420F0;
    v6[4] = v4;
    v6[5] = a2;
    dispatch_async(v5, v6);
  }
}

void __49__WBSLPLinkMetadataCache__finishSetUpWithStatus___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    uint64_t v3 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = 0;

    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = 0;

    uint64_t v6 = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v6 = 2;
  }
  *(void *)(v2 + 40) = v6;
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = 0;
}

- (void)prewarmInMemoryStoreWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__WBSLPLinkMetadataCache_prewarmInMemoryStoreWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E44320;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(internalQueue, v7);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __68__WBSLPLinkMetadataCache_prewarmInMemoryStoreWithCompletionHandler___block_invoke_3(id *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = a1[4];
  id v4 = (void *)v3[6];
  v3[6] = v2;

  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = a1[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        if (v10)
        {
          if ([a1[4] _isMetadataExpiredWithInfo:*(void *)(*((void *)&v19 + 1) + 8 * v9)])
          {
            uint64_t v11 = [v10 urlString];
            [v5 addObject:v11];
          }
          else
          {
            id v12 = a1[4];
            uint64_t v11 = [v10 urlString];
            [v12 _storeMetadataInfo:v10 forURLString:v11];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  uint64_t v13 = [v5 count];
  id v14 = a1[4];
  if (v13)
  {
    id v15 = (void *)[v5 copy];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __68__WBSLPLinkMetadataCache_prewarmInMemoryStoreWithCompletionHandler___block_invoke_4;
    v16[3] = &unk_1E5E444D8;
    objc_copyWeak(&v18, a1 + 7);
    id v17 = a1[6];
    [v14 _purgeMetadataForURLStrings:v15 completionHandler:v16];

    objc_destroyWeak(&v18);
  }
  else
  {
    v14[56] = 1;
    (*((void (**)(void))a1[6] + 2))();
  }
}

- (WBSLPLinkMetadataCache)initWithCacheDirectoryURL:(id)a3 expirationInterval:(double)a4 maximumNumberOfEntries:(unint64_t)a5
{
  id v6 = [(WBSLPLinkMetadataCache *)self initWithCacheDirectoryURL:a3 expirationInterval:a4];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_evictionEnabled = 1;
    v6->_maximumNumberOfEntries = a5;
    uint64_t v8 = v6;
  }

  return v7;
}

- (void)closeAfterPendingChangesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__WBSLPLinkMetadataCache_closeAfterPendingChangesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E44370;
  v7[4] = self;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __72__WBSLPLinkMetadataCache_closeAfterPendingChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) = 3;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__WBSLPLinkMetadataCache_closeAfterPendingChangesWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E5E44348;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  [v2 closeWithCompletionHandler:v3];

  objc_destroyWeak(&v5);
}

void __72__WBSLPLinkMetadataCache_closeAfterPendingChangesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __72__WBSLPLinkMetadataCache_closeAfterPendingChangesWithCompletionHandler___block_invoke_3;
  v2[3] = &unk_1E5E44348;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

void __72__WBSLPLinkMetadataCache_closeAfterPendingChangesWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 1) savePendingChangesBeforeTearDown];
    id v4 = v3[3];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __72__WBSLPLinkMetadataCache_closeAfterPendingChangesWithCompletionHandler___block_invoke_4;
    v5[3] = &unk_1E5E420C8;
    void v5[4] = v3;
    id v6 = *(id *)(a1 + 32);
    dispatch_async(v4, v5);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __72__WBSLPLinkMetadataCache_closeAfterPendingChangesWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;

  *(void *)(*(void *)(a1 + 32) + 40) = 0;
  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v6();
}

- (void)savePendingChangesBeforeTermination
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__WBSLPLinkMetadataCache_savePendingChangesBeforeTermination__block_invoke;
  block[3] = &unk_1E5E44398;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(internalQueue, block);
  if (!*((unsigned char *)v9 + 24))
  {
    [(WBSOnDiskDataCache *)self->_metadataDiskCache savePendingChangesBeforeTearDown];
    metadataDiskCache = self->_metadataDiskCache;
    self->_metadataDiskCache = 0;

    id v5 = self->_internalQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__WBSLPLinkMetadataCache_savePendingChangesBeforeTermination__block_invoke_2;
    v6[3] = &unk_1E5E40968;
    v6[4] = self;
    dispatch_sync(v5, v6);
  }
  _Block_object_dispose(&v8, 8);
}

void __61__WBSLPLinkMetadataCache_savePendingChangesBeforeTermination__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 40);
  if (v3 == 3 || v3 == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    *(void *)(v2 + 40) = 3;
    [*(id *)(*(void *)(a1 + 32) + 16) savePendingChangesBeforeTermination];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = 0;
  }
}

uint64_t __61__WBSLPLinkMetadataCache_savePendingChangesBeforeTermination__block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 40) = 0;
  return result;
}

- (void)setMetadata:(id)a3 forURLString:(id)a4 lastFetchDate:(id)a5 lastFetchDidSucceed:(BOOL)a6 metadataHasImage:(BOOL)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __120__WBSLPLinkMetadataCache_setMetadata_forURLString_lastFetchDate_lastFetchDidSucceed_metadataHasImage_completionHandler___block_invoke;
  v23[3] = &unk_1E5E44438;
  id v24 = v15;
  v25 = self;
  id v26 = v16;
  BOOL v30 = a6;
  BOOL v31 = a7;
  id v19 = v16;
  id v20 = v15;
  objc_copyWeak(&v29, &location);
  id v27 = v14;
  id v28 = v17;
  id v21 = v14;
  id v22 = v17;
  dispatch_async(internalQueue, v23);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __120__WBSLPLinkMetadataCache_setMetadata_forURLString_lastFetchDate_lastFetchDidSucceed_metadataHasImage_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "safari_stringByFormattingForFaviconDatabase");
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 16);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 81);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __120__WBSLPLinkMetadataCache_setMetadata_forURLString_lastFetchDate_lastFetchDidSucceed_metadataHasImage_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5E44410;
  objc_copyWeak(&v12, (id *)(a1 + 72));
  id v11 = *(id *)(a1 + 64);
  id v7 = v2;
  id v9 = v7;
  id v10 = *(id *)(a1 + 56);
  [v4 linkAndUpdateMetadataInfoForURLString:v7 lastFetchDate:v3 lastFetchDidSucceed:v5 metadataHasImage:v6 completionHandler:v8];

  objc_destroyWeak(&v12);
}

void __120__WBSLPLinkMetadataCache_setMetadata_forURLString_lastFetchDate_lastFetchDidSucceed_metadataHasImage_completionHandler___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 7);
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[3];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __120__WBSLPLinkMetadataCache_setMetadata_forURLString_lastFetchDate_lastFetchDidSucceed_metadataHasImage_completionHandler___block_invoke_3;
    v9[3] = &unk_1E5E443E8;
    id v10 = v3;
    id v11 = v5;
    id v12 = a1[4];
    id v14 = a1[6];
    id v13 = a1[5];
    objc_copyWeak(&v15, a1 + 7);
    dispatch_async(v6, v9);
    objc_destroyWeak(&v15);
  }
  else
  {
    id v7 = (void (**)(id, void *))a1[6];
    uint64_t v8 = (void *)[v3 copyWithoutUUID];
    v7[2](v7, v8);
  }
}

void __120__WBSLPLinkMetadataCache_setMetadata_forURLString_lastFetchDate_lastFetchDidSucceed_metadataHasImage_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v3) {
    [v2 _storeMetadataInfo:v3 forURLString:*(void *)(a1 + 48)];
  }
  else {
    [v2 _discardMetadataInfoForURLString:*(void *)(a1 + 48)];
  }
  if ([*(id *)(a1 + 32) lastFetchDidSucceed])
  {
    uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = [*(id *)(a1 + 32) uuidString];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __120__WBSLPLinkMetadataCache_setMetadata_forURLString_lastFetchDate_lastFetchDidSucceed_metadataHasImage_completionHandler___block_invoke_4;
    v8[3] = &unk_1E5E443C0;
    objc_copyWeak(&v11, (id *)(a1 + 72));
    id v10 = *(id *)(a1 + 64);
    id v9 = *(id *)(a1 + 32);
    [v4 setEntry:v5 forKeyString:v6 completionHandler:v8];

    objc_destroyWeak(&v11);
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v7();
  }
}

void __120__WBSLPLinkMetadataCache_setMetadata_forURLString_lastFetchDate_lastFetchDidSucceed_metadataHasImage_completionHandler___block_invoke_4(id *a1, int a2)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[3];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __120__WBSLPLinkMetadataCache_setMetadata_forURLString_lastFetchDate_lastFetchDidSucceed_metadataHasImage_completionHandler___block_invoke_5;
    v9[3] = &unk_1E5E40CF0;
    char v12 = a2;
    void v9[4] = WeakRetained;
    id v11 = a1[5];
    id v10 = a1[4];
    dispatch_async(v6, v9);
  }
  else
  {
    id v7 = (void (**)(id, id))a1[5];
    if (a2)
    {
      v7[2](a1[5], a1[4]);
    }
    else
    {
      uint64_t v8 = (void *)[a1[4] copyWithoutUUID];
      v7[2](v7, v8);
    }
  }
}

void __120__WBSLPLinkMetadataCache_setMetadata_forURLString_lastFetchDate_lastFetchDidSucceed_metadataHasImage_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 56))
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __120__WBSLPLinkMetadataCache_setMetadata_forURLString_lastFetchDate_lastFetchDidSucceed_metadataHasImage_completionHandler___block_invoke_6;
    v7[3] = &unk_1E5E423E8;
    uint64_t v3 = &v9;
    id v9 = *(id *)(a1 + 48);
    id v8 = *(id *)(a1 + 40);
    [v2 _didFinishDiskCacheWriteWithCompletionHandler:v7];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __120__WBSLPLinkMetadataCache_setMetadata_forURLString_lastFetchDate_lastFetchDidSucceed_metadataHasImage_completionHandler___block_invoke_7;
    v5[3] = &unk_1E5E41548;
    uint64_t v3 = &v6;
    uint64_t v4 = *(void *)(a1 + 40);
    id v6 = *(id *)(a1 + 48);
    [v2 _didFailDiskCacheWriteForMetadataInfo:v4 completionHandler:v5];
  }
}

uint64_t __120__WBSLPLinkMetadataCache_setMetadata_forURLString_lastFetchDate_lastFetchDidSucceed_metadataHasImage_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __120__WBSLPLinkMetadataCache_setMetadata_forURLString_lastFetchDate_lastFetchDidSucceed_metadataHasImage_completionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reuseMetadataOfURLString:(id)a3 forURLString:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__WBSLPLinkMetadataCache_reuseMetadataOfURLString_forURLString_completionHandler___block_invoke;
  v15[3] = &unk_1E5E44488;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  objc_copyWeak(&v20, &location);
  dispatch_async(internalQueue, v15);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&location);
}

void __82__WBSLPLinkMetadataCache_reuseMetadataOfURLString_forURLString_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "safari_stringByFormattingForFaviconDatabase");
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "safari_stringByFormattingForFaviconDatabase");
  uint64_t v4 = *(void **)(*(void *)(a1 + 48) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__WBSLPLinkMetadataCache_reuseMetadataOfURLString_forURLString_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5E44460;
  id v8 = *(id *)(a1 + 56);
  objc_copyWeak(&v9, (id *)(a1 + 64));
  id v5 = v3;
  id v7 = v5;
  [v4 linkURLString:v5 withMetadataInfoForURLString:v2 completionHandler:v6];

  objc_destroyWeak(&v9);
}

void __82__WBSLPLinkMetadataCache_reuseMetadataOfURLString_forURLString_completionHandler___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      id v6 = WeakRetained[3];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __82__WBSLPLinkMetadataCache_reuseMetadataOfURLString_forURLString_completionHandler___block_invoke_3;
      v7[3] = &unk_1E5E40990;
      void v7[4] = WeakRetained;
      id v8 = v3;
      id v9 = a1[4];
      id v10 = a1[5];
      dispatch_async(v6, v7);
    }
    else
    {
      (*((void (**)(void))a1[5] + 2))();
    }
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }
}

uint64_t __82__WBSLPLinkMetadataCache_reuseMetadataOfURLString_forURLString_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _storeMetadataInfo:*(void *)(a1 + 40) forURLString:*(void *)(a1 + 48)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v2();
}

- (void)getMetadataInfoForURLString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__WBSLPLinkMetadataCache_getMetadataInfoForURLString_completionHandler___block_invoke;
  block[3] = &unk_1E5E444B0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  objc_copyWeak(&v15, &location);
  dispatch_async(internalQueue, block);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __72__WBSLPLinkMetadataCache_getMetadataInfoForURLString_completionHandler___block_invoke(id *a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(a1[4], "safari_stringByFormattingForFaviconDatabase");
  id v3 = [a1[5] _storedMetadataInfoForURLString:v2];
  id v4 = a1[5];
  if (v3 || *((unsigned char *)v4 + 56))
  {
    if ([v4 _isMetadataExpiredWithInfo:v3])
    {
      id v5 = a1[5];
      v14[0] = v2;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __72__WBSLPLinkMetadataCache_getMetadataInfoForURLString_completionHandler___block_invoke_2;
      v12[3] = &unk_1E5E412A0;
      id v13 = a1[6];
      [v5 _purgeMetadataForURLStrings:v6 completionHandler:v12];
    }
    else
    {
      (*((void (**)(void))a1[6] + 2))();
    }
  }
  else
  {
    id v7 = (void *)*((void *)v4 + 2);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__WBSLPLinkMetadataCache_getMetadataInfoForURLString_completionHandler___block_invoke_3;
    v8[3] = &unk_1E5E44460;
    id v10 = a1[6];
    objc_copyWeak(&v11, a1 + 7);
    id v9 = v2;
    [v7 getMetadataInfoForURLString:v9 completionHandler:v8];

    objc_destroyWeak(&v11);
  }
}

uint64_t __72__WBSLPLinkMetadataCache_getMetadataInfoForURLString_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__WBSLPLinkMetadataCache_getMetadataInfoForURLString_completionHandler___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      id v6 = WeakRetained[3];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __72__WBSLPLinkMetadataCache_getMetadataInfoForURLString_completionHandler___block_invoke_4;
      v7[3] = &unk_1E5E40990;
      void v7[4] = WeakRetained;
      id v8 = v3;
      id v9 = a1[4];
      id v10 = a1[5];
      dispatch_async(v6, v7);
    }
    else
    {
      (*((void (**)(void))a1[5] + 2))();
    }
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }
}

void __72__WBSLPLinkMetadataCache_getMetadataInfoForURLString_completionHandler___block_invoke_4(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) _isMetadataExpiredWithInfo:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v8[0] = *(void *)(a1 + 48);
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__WBSLPLinkMetadataCache_getMetadataInfoForURLString_completionHandler___block_invoke_5;
    v6[3] = &unk_1E5E412A0;
    id v7 = *(id *)(a1 + 56);
    [v3 _purgeMetadataForURLStrings:v4 completionHandler:v6];
  }
  else
  {
    [*(id *)(a1 + 32) _storeMetadataInfo:*(void *)(a1 + 40) forURLString:*(void *)(a1 + 48)];
    id v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v5();
  }
}

uint64_t __72__WBSLPLinkMetadataCache_getMetadataInfoForURLString_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeMetadataWithURLString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__WBSLPLinkMetadataCache_removeMetadataWithURLString_completionHandler___block_invoke;
  block[3] = &unk_1E5E40940;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __72__WBSLPLinkMetadataCache_removeMetadataWithURLString_completionHandler___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(*(id *)(a1 + 32), "safari_stringByFormattingForFaviconDatabase");
  id v3 = *(void **)(a1 + 40);
  v5[0] = v2;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v3 _purgeMetadataForURLStrings:v4 completionHandler:*(void *)(a1 + 48)];
}

- (void)removeAllMetadataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__WBSLPLinkMetadataCache_removeAllMetadataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E44370;
  void v7[4] = self;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __65__WBSLPLinkMetadataCache_removeAllMetadataWithCompletionHandler___block_invoke(id *a1)
{
  [a1[4] _discardAllMetadataInfo];
  int v2 = (void *)*((void *)a1[4] + 2);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__WBSLPLinkMetadataCache_removeAllMetadataWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E5E444D8;
  objc_copyWeak(&v5, a1 + 6);
  id v4 = a1[5];
  [v2 removeAllMetadataInfoWithCompletionHandler:v3];

  objc_destroyWeak(&v5);
}

void __65__WBSLPLinkMetadataCache_removeAllMetadataWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[3];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __65__WBSLPLinkMetadataCache_removeAllMetadataWithCompletionHandler___block_invoke_3;
    v5[3] = &unk_1E5E420C8;
    void v5[4] = WeakRetained;
    id v6 = *(id *)(a1 + 32);
    dispatch_async(v4, v5);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __65__WBSLPLinkMetadataCache_removeAllMetadataWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) reset];
  int v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)getMetadataWithInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isMetadataCached])
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__WBSLPLinkMetadataCache_getMetadataWithInfo_completionHandler___block_invoke;
    block[3] = &unk_1E5E40940;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(internalQueue, block);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __64__WBSLPLinkMetadataCache_getMetadataWithInfo_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = [*(id *)(a1 + 40) uuidString];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__WBSLPLinkMetadataCache_getMetadataWithInfo_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5E44500;
  id v5 = *(id *)(a1 + 48);
  [v2 getEntryURLForKeyString:v3 completionHandler:v4];
}

void __64__WBSLPLinkMetadataCache_getMetadataWithInfo_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    a2 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a2];
  }
  id v3 = (id)a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__WBSLPLinkMetadataCache_prewarmInMemoryStoreWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[3];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __68__WBSLPLinkMetadataCache_prewarmInMemoryStoreWithCompletionHandler___block_invoke_5;
    v5[3] = &unk_1E5E420C8;
    void v5[4] = WeakRetained;
    id v6 = *(id *)(a1 + 32);
    dispatch_async(v4, v5);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __68__WBSLPLinkMetadataCache_prewarmInMemoryStoreWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)sqliteStoreDidFailDatabaseIntegrityCheck:(id)a3 completionHandler:(id)a4
{
  id v5 = (void (**)(void))a4;
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  databaseURL = self->_databaseURL;
  p_databaseURL = (void **)&self->_databaseURL;
  id v9 = [(NSURL *)databaseURL path];
  id v13 = 0;
  char v10 = [v6 removeItemAtPath:v9 error:&v13];
  id v11 = v13;

  if ((v10 & 1) == 0)
  {
    id v12 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[WBSLPLinkMetadataCache sqliteStoreDidFailDatabaseIntegrityCheck:completionHandler:](p_databaseURL, v12, v11);
    }
  }
  v5[2](v5);
}

- (void)_evictCacheItemsIfNecessaryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  metadataDatabase = self->_metadataDatabase;
  unint64_t maximumNumberOfEntries = self->_maximumNumberOfEntries;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __75__WBSLPLinkMetadataCache__evictCacheItemsIfNecessaryWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5E44528;
  id v7 = v4;
  id v9 = v7;
  objc_copyWeak(&v10, &location);
  [(WBSLPLinkMetadataSQLiteStore *)metadataDatabase performLRUEvictionIfNecessaryWithMaximumNumberOfEntries:maximumNumberOfEntries completionHandler:v8];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __75__WBSLPLinkMetadataCache__evictCacheItemsIfNecessaryWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count]
    && ([v3 objectAtIndexedSubscript:0],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 uuidString],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
    id v7 = WeakRetained;
    if (WeakRetained)
    {
      id v8 = WeakRetained[3];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __75__WBSLPLinkMetadataCache__evictCacheItemsIfNecessaryWithCompletionHandler___block_invoke_2;
      v9[3] = &unk_1E5E40990;
      id v10 = v3;
      id v11 = v7;
      id v12 = v5;
      id v13 = *(id *)(a1 + 32);
      dispatch_async(v8, v9);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __75__WBSLPLinkMetadataCache__evictCacheItemsIfNecessaryWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        id v8 = [*(id *)(*((void *)&v13 + 1) + 8 * v6) urlString];
        [v7 _discardMetadataInfoForURLString:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v4);
  }

  id v9 = *(void **)(*(void *)(a1 + 40) + 8);
  uint64_t v17 = *(void *)(a1 + 48);
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__WBSLPLinkMetadataCache__evictCacheItemsIfNecessaryWithCompletionHandler___block_invoke_3;
  v11[3] = &unk_1E5E41548;
  id v12 = *(id *)(a1 + 56);
  [v9 removeEntriesForKeyStrings:v10 completionHandler:v11];
}

uint64_t __75__WBSLPLinkMetadataCache__evictCacheItemsIfNecessaryWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_didFinishDiskCacheWriteWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_evictionEnabled)
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__WBSLPLinkMetadataCache__didFinishDiskCacheWriteWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E5E444D8;
    objc_copyWeak(&v8, &location);
    id v7 = v5;
    [(WBSLPLinkMetadataCache *)self _evictCacheItemsIfNecessaryWithCompletionHandler:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
}

void __72__WBSLPLinkMetadataCache__didFinishDiskCacheWriteWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[3];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__WBSLPLinkMetadataCache__didFinishDiskCacheWriteWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5E411D8;
    char v9 = a2;
    void block[4] = WeakRetained;
    id v8 = *(id *)(a1 + 32);
    dispatch_async(v6, block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __72__WBSLPLinkMetadataCache__didFinishDiskCacheWriteWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    return [*(id *)(a1 + 32) _didFinishDiskCacheWriteWithCompletionHandler:*(void *)(a1 + 40)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_didFailDiskCacheWriteForMetadataInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = [v6 uuidString];

  if (v8)
  {
    objc_initWeak(&location, self);
    metadataDatabase = self->_metadataDatabase;
    id v10 = [v6 uuidString];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __82__WBSLPLinkMetadataCache__didFailDiskCacheWriteForMetadataInfo_completionHandler___block_invoke;
    v11[3] = &unk_1E5E42D70;
    objc_copyWeak(&v13, &location);
    id v12 = v7;
    [(WBSLPLinkMetadataSQLiteStore *)metadataDatabase removeAllMetadataInfoWithUUID:v10 completionHandler:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    v7[2](v7);
  }
}

void __82__WBSLPLinkMetadataCache__didFailDiskCacheWriteForMetadataInfo_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[3];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__WBSLPLinkMetadataCache__didFailDiskCacheWriteForMetadataInfo_completionHandler___block_invoke_2;
    block[3] = &unk_1E5E40940;
    id v8 = v3;
    char v9 = v5;
    id v10 = *(id *)(a1 + 32);
    dispatch_async(v6, block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __82__WBSLPLinkMetadataCache__didFailDiskCacheWriteForMetadataInfo_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        id v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v6), "urlString", (void)v10);
        [v7 _discardMetadataInfoForURLString:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_purgeMetadataForURLStrings:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          [(WBSLPLinkMetadataCache *)self _discardMetadataInfoForURLString:*(void *)(*((void *)&v17 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    objc_initWeak(&location, self);
    metadataDatabase = self->_metadataDatabase;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__WBSLPLinkMetadataCache__purgeMetadataForURLStrings_completionHandler___block_invoke;
    v13[3] = &unk_1E5E44528;
    id v14 = v7;
    objc_copyWeak(&v15, &location);
    [(WBSLPLinkMetadataSQLiteStore *)metadataDatabase removeMetadataInfoForURLStrings:v8 completionHandler:v13];
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
}

void __72__WBSLPLinkMetadataCache__purgeMetadataForURLStrings_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v5 = WeakRetained;
    if (WeakRetained)
    {
      id v6 = WeakRetained[3];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __72__WBSLPLinkMetadataCache__purgeMetadataForURLStrings_completionHandler___block_invoke_2;
      block[3] = &unk_1E5E40940;
      void block[4] = WeakRetained;
      id v8 = v3;
      id v9 = *(id *)(a1 + 32);
      dispatch_async(v6, block);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __72__WBSLPLinkMetadataCache__purgeMetadataForURLStrings_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__WBSLPLinkMetadataCache__purgeMetadataForURLStrings_completionHandler___block_invoke_3;
  v3[3] = &unk_1E5E41548;
  id v4 = *(id *)(a1 + 48);
  [v2 removeEntriesForKeyStrings:v1 completionHandler:v3];
}

uint64_t __72__WBSLPLinkMetadataCache__purgeMetadataForURLStrings_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)_internalStatusFromWBSSQLStoreStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

- (BOOL)_isMetadataExpiredWithInfo:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = [a3 lastFetchDate];
  [v4 timeIntervalSinceNow];
  double v6 = v5;
  double v7 = -v5;

  return self->_expirationInterval < v7 || v6 > 0.0;
}

- (void)_storeMetadataInfo:(id)a3 forURLString:(id)a4
{
}

- (id)_storedMetadataInfoForURLString:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_urlStringsToMetadataInfo objectForKeyedSubscript:a3];
}

- (void)_discardMetadataInfoForURLString:(id)a3
{
}

- (void)_discardAllMetadataInfo
{
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (NSURL)diskCacheURL
{
  return self->_diskCacheURL;
}

- (BOOL)evictionEnabled
{
  return self->_evictionEnabled;
}

- (unint64_t)maximumNumberOfEntries
{
  return self->_maximumNumberOfEntries;
}

- (double)expirationInterval
{
  return self->_expirationInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskCacheURL, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_urlStringsToMetadataInfo, 0);
  objc_storeStrong(&self->_setUpCompletionHandler, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_metadataDatabase, 0);
  objc_storeStrong((id *)&self->_metadataDiskCache, 0);
}

- (void)sqliteStoreDidFailDatabaseIntegrityCheck:(void *)a3 completionHandler:.cold.1(void **a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = *a1;
  double v5 = a2;
  double v6 = [v4 path];
  double v7 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  int v8 = 138543618;
  id v9 = v6;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_1ABB70000, v5, OS_LOG_TYPE_ERROR, "Failed to remove corrupted database at %{public}@, error: %{public}@", (uint8_t *)&v8, 0x16u);
}

@end