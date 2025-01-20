@interface SBHLibraryCategoryMapProvider
+ (NSString)cacheDirectory;
+ (id)baseFilePath;
+ (id)categoryMapCacheFilePathForVersion:(id)a3 source:(id)a4;
+ (id)categoryMapFromURL:(id)a3 error:(id *)a4;
+ (unint64_t)derivedOptionsFromArrayOfRequests:(id)a3;
+ (void)clearCachesForReason:(id)a3;
- (BOOL)_workQueue_updateLibraryCategoryMap:(id)a3 withSessionId:(unint64_t)a4 shouldPersist:(BOOL)a5 reason:(id)a6;
- (BOOL)forbidApplicationIdentifier:(id)a3;
- (BOOL)hasCachedLibraryCategoryMapOnFileSystem;
- (BOOL)unforbidApplicationIdentifier:(id)a3;
- (OS_dispatch_queue)workQueue;
- (SBHLibraryCategoryMap)libraryCategoryMap;
- (SBHLibraryCategoryMapProvider)initWithSource:(id)a3;
- (double)workQueueCoalescingInterval;
- (id)_copyOfObservers;
- (id)requestLibraryCategoryMapRefreshWithOptions:(unint64_t)a3 reason:(id)a4;
- (unint64_t)_nextSessionIdentifier;
- (void)_callbackQueue_notifyObserverCategoryMapWasRefreshedWithOptions:(unint64_t)a3 refreshedCategoryMap:(id)a4;
- (void)_callbackQueue_notifyObserversBeginningRefreshSession:(int64_t)a3 requests:(id)a4;
- (void)_callbackQueue_notifyObserversCategoryMapDidntNeedRefresh;
- (void)_callbackQueue_notifyObserversCategoryMapRefreshFailedWithError:(id)a3;
- (void)_callbackQueue_notifyObserversFinishedRefreshSession:(int64_t)a3 requests:(id)a4;
- (void)_callbackQueue_notifyObserversWillReEnqueueFailedRequests:(id)a3;
- (void)_callbackQueue_notifyObserversWillRefresh:(int64_t)a3 options:(unint64_t)a4;
- (void)_callbackQueue_notifyObserversWillSunsetFailedRequests:(id)a3;
- (void)_kickoffInitialHydration;
- (void)_setupClearCacheNotification;
- (void)_setupLocaleNotification;
- (void)_workQueue_cancelAnyScheduledRefresh;
- (void)_workQueue_performNextRequest;
- (void)_workQueue_queueUpNextRequests:(id)a3 runNow:(BOOL)a4;
- (void)_workQueue_scheduleRefreshIfNotScheduled;
- (void)addObserver:(id)a3;
- (void)clearOverride;
- (void)overrideCategoryMapForTesting:(id)a3;
- (void)overrideCategoryMapForTestingAtURL:(id)a3 error:(id *)a4;
- (void)removeObserver:(id)a3;
- (void)requestLibraryCategoryMapUpdateWithRefreshOptions:(unint64_t)a3 source:(id)a4;
- (void)resetForbiddenApplicationIdentifiers;
@end

@implementation SBHLibraryCategoryMapProvider

uint64_t __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_153(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_notifyObserversCategoryMapDidntNeedRefresh");
}

uint64_t __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_notifyObserversFinishedRefreshSession:requests:", *(void *)(a1 + 48), *(void *)(a1 + 40));
}

- (id)requestLibraryCategoryMapRefreshWithOptions:(unint64_t)a3 reason:(id)a4
{
  id v6 = a4;
  v7 = [[SBHLibraryCategoryMapProviderRefreshRequest alloc] initWithOptions:a3 reason:v6];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__SBHLibraryCategoryMapProvider_requestLibraryCategoryMapRefreshWithOptions_reason___block_invoke;
  block[3] = &unk_1E6AADF50;
  unint64_t v15 = a3;
  block[4] = self;
  v9 = v7;
  v14 = v9;
  dispatch_async(workQueue, block);
  v10 = v14;
  v11 = v9;

  return v11;
}

void __73__SBHLibraryCategoryMapProvider__workQueue_scheduleRefreshIfNotScheduled__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 80))
    {
      *((unsigned char *)WeakRetained + 80) = 0;
      v4 = WeakRetained;
      uint64_t v3 = [WeakRetained[9] count];
      v2 = v4;
      if (!v3)
      {
        objc_msgSend(v4, "_workQueue_performNextRequest");
        v2 = v4;
      }
    }
  }
}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_160(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BSDispatchQueueAssert();
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    v7 = v11;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v8 = __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_2_161;
    v9 = v6;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    v7 = v10;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v8 = __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_3_162;
    v9 = v5;
  }
  v7[2] = v8;
  v7[3] = &unk_1E6AADF50;
  v7[4] = *(id *)(a1 + 40);
  v7[6] = *(void *)(a1 + 64);
  v7[5] = v9;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

- (void)_callbackQueue_notifyObserversFinishedRefreshSession:(int64_t)a3 requests:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BSDispatchQueueAssert();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(SBHLibraryCategoryMapProvider *)self _copyOfObservers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "libraryCategoryMapProvider:finishedRefreshWithSessionID:requests:", self, a3, v6, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_callbackQueue_notifyObserversCategoryMapDidntNeedRefresh
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssert();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(SBHLibraryCategoryMapProvider *)self _copyOfObservers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "libraryCategoryMapProviderRefreshedButFoundNoChanges:", self, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

void __84__SBHLibraryCategoryMapProvider_requestLibraryCategoryMapRefreshWithOptions_reason___block_invoke(void *a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (a1[6] >> 3) & 1;
  v2 = (void *)a1[4];
  v4[0] = a1[5];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  objc_msgSend(v2, "_workQueue_queueUpNextRequests:runNow:", v3, v1);
}

- (void)_workQueue_queueUpNextRequests:(id)a3 runNow:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BSDispatchQueueAssert();
  if ([v6 count])
  {
    uint64_t v7 = SBLogProactiveAppLibrary();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      pendingRefreshRequests = self->_pendingRefreshRequests;
      int v10 = 138412546;
      id v11 = v6;
      __int16 v12 = 2112;
      long long v13 = pendingRefreshRequests;
      _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_DEFAULT, "Accumulating pending requests: %@ / Current Request Queue: %@", (uint8_t *)&v10, 0x16u);
    }

    [(NSMutableArray *)self->_pendingRefreshRequests addObjectsFromArray:v6];
  }
  if ([(NSArray *)self->_inflightRefreshRequests count])
  {
    long long v9 = SBLogProactiveAppLibrary();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_DEFAULT, "Requests are inflight; deferring pending requests until after current requests are finished.",
        (uint8_t *)&v10,
        2u);
    }
  }
  else if (v4)
  {
    [(SBHLibraryCategoryMapProvider *)self _workQueue_cancelAnyScheduledRefresh];
    [(SBHLibraryCategoryMapProvider *)self _workQueue_performNextRequest];
  }
  else
  {
    [(SBHLibraryCategoryMapProvider *)self _workQueue_scheduleRefreshIfNotScheduled];
  }
}

- (void)_workQueue_performNextRequest
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "Discarding performing queued up requests (%@)... running PPTs right now", v2, v3, v4, v5, v6);
}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_2_159(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_callbackQueue_notifyObserversBeginningRefreshSession:requests:", *(void *)(a1 + 48), *(void *)(a1 + 32));
    uint64_t v4 = SBLogProactiveAppLibrary();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 48);
      uint8_t v6 = *(void **)(a1 + 32);
      int v10 = 134218242;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      long long v13 = v6;
      _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "(%ld) Starting Library Category Map refresh from requests '%@'", (uint8_t *)&v10, 0x16u);
    }

    uint64_t v7 = SBLogProactiveAppLibrary();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      long long v9 = NSDictionaryFromSBHLibraryCategoryMapRefreshOptions(*(void *)(a1 + 56));
      int v10 = 134218242;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      long long v13 = v9;
      _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_DEFAULT, "(%ld) Refresh options: %@", (uint8_t *)&v10, 0x16u);
    }
    objc_msgSend(v3, "_callbackQueue_notifyObserversWillRefresh:options:", *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BSDispatchQueueAssert();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v5 = SBLogProactiveAppLibrary();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 134217984;
      uint64_t v30 = v6;
      _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "(%ld) Finished Library Category Map refresh", buf, 0xCu);
    }

    if ([v3 isEqualToCategoryMap:*(void *)(a1 + 40)])
    {
      uint64_t v7 = SBLogProactiveAppLibrary();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 72);
        *(_DWORD *)buf = 134217984;
        uint64_t v30 = v8;
        _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_DEFAULT, "(%ld) Library category map refresh yielded no changes to map; bailing.",
          buf,
          0xCu);
      }

      long long v9 = *(NSObject **)(a1 + 48);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_153;
      block[3] = &unk_1E6AAC810;
      block[4] = WeakRetained;
      dispatch_async(v9, block);
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = SBLogProactiveAppLibrary();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v3 && v10)
      {
        if (v12)
        {
          uint64_t v13 = *(void *)(a1 + 72);
          uint64_t v14 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 134218240;
          uint64_t v30 = v13;
          __int16 v31 = 2048;
          id v32 = v14;
          _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "(%ld) Existing Library category map: %p", buf, 0x16u);
        }

        long long v15 = SBLogProactiveAppLibrary();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = *(void *)(a1 + 72);
          *(_DWORD *)buf = 134218240;
          uint64_t v30 = v16;
          __int16 v31 = 2048;
          id v32 = v3;
          _os_log_impl(&dword_1D7F0A000, v15, OS_LOG_TYPE_DEFAULT, "(%ld) Refreshed Library category map: %p", buf, 0x16u);
        }

        uint64_t v11 = SBLogProactiveAppLibrary();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = *(void *)(a1 + 72);
          uint64_t v18 = +[SBHLibraryCategoryMap diffMap:v3 withMap:*(void *)(a1 + 40)];
          *(_DWORD *)buf = 134218242;
          uint64_t v30 = v17;
          __int16 v31 = 2112;
          id v32 = v18;
          _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "(%ld) Library category map changes: %@", buf, 0x16u);
        }
      }
      else if (v12)
      {
        uint64_t v19 = *(void *)(a1 + 72);
        *(_DWORD *)buf = 134218242;
        uint64_t v30 = v19;
        __int16 v31 = 2112;
        id v32 = v3;
        _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "(%ld) Library category map was freshly generated: %@", buf, 0x16u);
      }

      objc_msgSend(WeakRetained, "_workQueue_updateLibraryCategoryMap:withSessionId:shouldPersist:reason:", v3, *(void *)(a1 + 72), 1, @"_performNextRequest");
      v20 = *(NSObject **)(a1 + 48);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_157;
      v25[3] = &unk_1E6AADF50;
      uint64_t v21 = *(void *)(a1 + 80);
      v25[4] = WeakRetained;
      uint64_t v27 = v21;
      id v26 = v3;
      dispatch_async(v20, v25);
      (*(void (**)(void, void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 0, v22, v23, v24);
    }
  }
}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BSDispatchQueueAssert();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_2;
    block[3] = &unk_1E6AADF50;
    uint64_t v6 = *(void *)(a1 + 64);
    block[4] = WeakRetained;
    uint64_t v16 = v6;
    uint64_t v7 = *(NSObject **)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    dispatch_async(v7, block);
    uint64_t v8 = (void *)v5[9];
    v5[9] = 0;

    long long v9 = SBLogProactiveAppLibrary();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 64);
      if (v3) {
        uint64_t v11 = @"UNSUCCESSFULLY";
      }
      else {
        uint64_t v11 = @"SUCCESSFULLY";
      }
      CFAbsoluteTime v12 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 72);
      uint64_t v13 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218754;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      v20 = v11;
      __int16 v21 = 2048;
      CFAbsoluteTime v22 = v12;
      __int16 v23 = 2112;
      uint64_t v24 = v13;
      _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_DEFAULT, "(%ld) Session completed '%@'; Request fulfillment time: %f -- Requests fulfilled: %@",
        buf,
        0x2Au);
    }

    objc_msgSend(v5, "_workQueue_scheduleRefreshIfNotScheduled");
  }
}

- (SBHLibraryCategoryMap)libraryCategoryMap
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_libraryCategoryMap;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)hasCachedLibraryCategoryMapOnFileSystem
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(self) = [v3 fileExistsAtPath:self->_cacheFilePath];

  return (char)self;
}

- (void)_workQueue_scheduleRefreshIfNotScheduled
{
  if (!self->_refreshIsScheduled)
  {
    objc_initWeak(&location, self);
    [(SBHLibraryCategoryMapProvider *)self workQueueCoalescingInterval];
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    workQueue = self->_workQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73__SBHLibraryCategoryMapProvider__workQueue_scheduleRefreshIfNotScheduled__block_invoke;
    v6[3] = &unk_1E6AB0278;
    objc_copyWeak(&v7, &location);
    dispatch_after(v4, workQueue, v6);
    self->_refreshIsScheduled = 1;
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (double)workQueueCoalescingInterval
{
  return self->_workQueueCoalescingInterval;
}

- (void)_workQueue_cancelAnyScheduledRefresh
{
  self->_refreshIsScheduled = 0;
}

- (unint64_t)_nextSessionIdentifier
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_sessionIdentifier + 1;
  v2->_sessionIdentifier = v3;
  objc_sync_exit(v2);

  return v3;
}

- (void)_callbackQueue_notifyObserversWillRefresh:(int64_t)a3 options:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssert();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(SBHLibraryCategoryMapProvider *)self _copyOfObservers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "libraryCategoryMapProvider:willRefreshWithOptions:", self, a4, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_callbackQueue_notifyObserversBeginningRefreshSession:(int64_t)a3 requests:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BSDispatchQueueAssert();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(SBHLibraryCategoryMapProvider *)self _copyOfObservers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "libraryCategoryMapProvider:beginningRefreshWithSessionID:requests:", self, a3, v6, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (id)_copyOfObservers
{
  unint64_t v3 = self->_observers;
  objc_sync_enter(v3);
  dispatch_time_t v4 = (void *)[(NSHashTable *)self->_observers copy];
  objc_sync_exit(v3);

  return v4;
}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_3_162(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v7, "options", (void)v11) & 0x20) != 0)
        {
          uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
          v15[0] = @"sbh_categoryMapRefreshSessionIDKey";
          uint64_t v9 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
          v15[1] = @"sbh_categoryMapKey";
          v16[0] = v9;
          v16[1] = *(void *)(a1 + 40);
          uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
          [v8 postNotificationName:@"com.apple.springboardhome.categoryMapProviderRefreshCompleted" object:v7 userInfo:v10];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v4);
  }
}

+ (unint64_t)derivedOptionsFromArrayOfRequests:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((unint64_t)[v3 count] > 1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = v3;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      unint64_t v5 = 0;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v4);
          }
          v5 |= objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "options", (void)v11) & 0xF;
        }
        uint64_t v7 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    else
    {
      unint64_t v5 = 0;
    }
  }
  else
  {
    id v4 = [v3 firstObject];
    unint64_t v5 = [v4 options];
  }

  return v5;
}

+ (void)clearCachesForReason:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&__lock);
  unint64_t v5 = SBLogProactiveAppLibrary();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Marking SBHLibraryCategoryMapProvider caches are needing to be wiped for reason: %@", buf, 0xCu);
  }

  uint64_t v6 = [a1 cacheDirectory];
  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v13 = 0;
  [v7 removeItemAtPath:v6 error:&v13];
  id v8 = v13;

  uint64_t v9 = SBLogProactiveAppLibrary();
  uint64_t v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[SBHLibraryCategoryMapProvider clearCachesForReason:]();
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "Success in deleting app library cache.", buf, 2u);
  }

  long long v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotificationName:@"SBHLibraryCategoryMapProviderCachesWereClearedNotification" object:0];

  long long v12 = SBLogProactiveAppLibrary();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7F0A000, v12, OS_LOG_TYPE_DEFAULT, "SBHLibraryCategoryMapProvider caches have been cleaned.  Hopefully successfully.", buf, 2u);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&__lock);
}

+ (id)categoryMapFromURL:(id)a3 error:(id *)a4
{
  unint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v5, "setWithObjects:", objc_opt_class(), 0);
  id v13 = 0;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v6 options:1 error:&v13];

  id v9 = v13;
  uint64_t v10 = v9;
  if (v9)
  {
    long long v11 = 0;
    if (a4) {
      *a4 = v9;
    }
  }
  else
  {
    long long v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v7 fromData:v8 error:a4];
  }

  return v11;
}

- (SBHLibraryCategoryMapProvider)initWithSource:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBHLibraryCategoryMapProvider;
  id v6 = [(SBHLibraryCategoryMapProvider *)&v21 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryCategoryMapProviderSource, a3);
    [(SBHLibraryCategoryMapProviderSource *)v7->_libraryCategoryMapProviderSource setDelegate:v7];
    v7->_workQueueCoalescingInterval = 1.0;
    uint64_t SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)SerialWithQoS;

    uint64_t v10 = BSDispatchQueueCreateSerialWithQoS();
    serializationQueue = v7->_serializationQueue;
    v7->_serializationQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v7->_callbackQueue, MEMORY[0x1E4F14428]);
    long long v12 = objc_opt_class();
    id v13 = [v5 sourceName];
    uint64_t v14 = [v12 categoryMapCacheFilePathForVersion:@"6" source:v13];
    cacheFilePath = v7->_cacheFilePath;
    v7->_cacheFilePath = (NSString *)v14;

    uint64_t v16 = objc_opt_new();
    pendingRefreshRequests = v7->_pendingRefreshRequests;
    v7->_pendingRefreshRequests = (NSMutableArray *)v16;

    uint64_t v18 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v18;

    [(SBHLibraryCategoryMapProvider *)v7 _setupLocaleNotification];
    [(SBHLibraryCategoryMapProvider *)v7 _setupClearCacheNotification];
    [(SBHLibraryCategoryMapProvider *)v7 _kickoffInitialHydration];
  }

  return v7;
}

+ (NSString)cacheDirectory
{
  id v2 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  id v3 = [v2 objectAtIndex:0];

  id v4 = [v3 stringByAppendingPathComponent:@"com.apple.springboard.appLibrary"];

  return (NSString *)v4;
}

+ (id)baseFilePath
{
  id v2 = [a1 cacheDirectory];
  id v3 = [NSString stringWithFormat:@"com.apple.springboardhome.categorymapcache."];
  id v4 = [v2 stringByAppendingPathComponent:v3];

  return v4;
}

+ (id)categoryMapCacheFilePathForVersion:(id)a3 source:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 baseFilePath];
  id v9 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  uint64_t v10 = [v9 localeIdentifier];

  long long v11 = [v8 stringByAppendingFormat:@"%@.%@.%@", v10, v6, v7];

  long long v12 = [v11 stringByAppendingPathExtension:@"plist"];

  return v12;
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  id v4 = self->_observers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_observers addObject:v5];
  objc_sync_exit(v4);
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  id v4 = self->_observers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_observers removeObject:v5];
  objc_sync_exit(v4);
}

- (void)_callbackQueue_notifyObserverCategoryMapWasRefreshedWithOptions:(unint64_t)a3 refreshedCategoryMap:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BSDispatchQueueAssert();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(SBHLibraryCategoryMapProvider *)self _copyOfObservers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "libraryCategoryMapProvider:categoryMapWasRefreshed:libraryCategoryMap:", self, a3, v6, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_callbackQueue_notifyObserversCategoryMapRefreshFailedWithError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssert();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(SBHLibraryCategoryMapProvider *)self _copyOfObservers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "libraryCategoryMapProvider:failedToRefreshWithError:", self, v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_callbackQueue_notifyObserversWillReEnqueueFailedRequests:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssert();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(SBHLibraryCategoryMapProvider *)self _copyOfObservers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "libraryCategoryMapProvider:willReEnqueueFailedRequests:", self, v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_callbackQueue_notifyObserversWillSunsetFailedRequests:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssert();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(SBHLibraryCategoryMapProvider *)self _copyOfObservers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "libraryCategoryMapProvider:willSunsetFailedRequests:", self, v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)overrideCategoryMapForTestingAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(id)objc_opt_class() categoryMapFromURL:v6 error:a4];

  [(SBHLibraryCategoryMapProvider *)self overrideCategoryMapForTesting:v7];
}

- (void)overrideCategoryMapForTesting:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v5->_isCategoryMapOverriddenForTesting = v4 != 0;
  objc_sync_exit(v5);

  if (v4)
  {
    id v6 = v5->_callbackQueue;
    workQueue = v5->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__SBHLibraryCategoryMapProvider_overrideCategoryMapForTesting___block_invoke;
    block[3] = &unk_1E6AACDE0;
    block[4] = v5;
    id v11 = v4;
    long long v12 = v6;
    uint64_t v8 = v6;
    uint64_t v9 = workQueue;
    dispatch_async(v9, block);
  }
}

void __63__SBHLibraryCategoryMapProvider_overrideCategoryMapForTesting___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_workQueue_updateLibraryCategoryMap:withSessionId:shouldPersist:reason:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_nextSessionIdentifier"), 0, @"Category map overidden for testing");
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __63__SBHLibraryCategoryMapProvider_overrideCategoryMapForTesting___block_invoke_2;
  v4[3] = &unk_1E6AACA90;
  id v2 = *(void **)(a1 + 40);
  id v3 = *(NSObject **)(a1 + 48);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v2;
  dispatch_async(v3, v4);
}

uint64_t __63__SBHLibraryCategoryMapProvider_overrideCategoryMapForTesting___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_notifyObserverCategoryMapWasRefreshedWithOptions:refreshedCategoryMap:", 6, *(void *)(a1 + 40));
}

- (void)clearOverride
{
}

- (void)resetForbiddenApplicationIdentifiers
{
  forbiddenApplicationIdentifiers = self->_forbiddenApplicationIdentifiers;
  if (forbiddenApplicationIdentifiers)
  {
    self->_forbiddenApplicationIdentifiers = 0;

    id v4 = -[SBHLibraryCategoryMapProvider requestLibraryCategoryMapRefreshWithOptions:reason:](self, "requestLibraryCategoryMapRefreshWithOptions:reason:", 7, @"-[SBHLibraryCategoryMapProvider resetForbiddenApplicationIdentifiers]");
  }
}

- (BOOL)forbidApplicationIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_4;
  }
  forbiddenApplicationIdentifiers = self->_forbiddenApplicationIdentifiers;
  if (!forbiddenApplicationIdentifiers)
  {
    id v7 = (NSMutableSet *)objc_opt_new();
    uint64_t v8 = self->_forbiddenApplicationIdentifiers;
    self->_forbiddenApplicationIdentifiers = v7;

    goto LABEL_6;
  }
  if (([(NSMutableSet *)forbiddenApplicationIdentifiers containsObject:v4] & 1) == 0)
  {
LABEL_6:
    [(NSMutableSet *)self->_forbiddenApplicationIdentifiers bs_safeAddObject:v4];
    id v9 = -[SBHLibraryCategoryMapProvider requestLibraryCategoryMapRefreshWithOptions:reason:](self, "requestLibraryCategoryMapRefreshWithOptions:reason:", 14, @"-[SBHLibraryCategoryMapProvider forbidApplicationIdentifier]");
    BOOL v6 = 1;
    goto LABEL_7;
  }
LABEL_4:
  BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)unforbidApplicationIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(NSMutableSet *)self->_forbiddenApplicationIdentifiers containsObject:v4];
  if (v5)
  {
    [(NSMutableSet *)self->_forbiddenApplicationIdentifiers removeObject:v4];
    if (![(NSMutableSet *)self->_forbiddenApplicationIdentifiers count])
    {
      forbiddenApplicationIdentifiers = self->_forbiddenApplicationIdentifiers;
      self->_forbiddenApplicationIdentifiers = 0;
    }
    id v7 = -[SBHLibraryCategoryMapProvider requestLibraryCategoryMapRefreshWithOptions:reason:](self, "requestLibraryCategoryMapRefreshWithOptions:reason:", 14, @"-[SBHLibraryCategoryMapProvider unforbidApplicationIdentifier]");
  }

  return v5;
}

- (void)requestLibraryCategoryMapUpdateWithRefreshOptions:(unint64_t)a3 source:(id)a4
{
  BOOL v6 = NSString;
  id v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v6 stringWithFormat:@"-[SBHLibraryCategoryMapProvider requestLibraryCategoryMapUpdateWithRefreshOptions:source:%@]", v10];
  id v9 = [(SBHLibraryCategoryMapProvider *)self requestLibraryCategoryMapRefreshWithOptions:a3 reason:v8];
}

- (BOOL)_workQueue_updateLibraryCategoryMap:(id)a3 withSessionId:(unint64_t)a4 shouldPersist:(BOOL)a5 reason:(id)a6
{
  BOOL v7 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  BSDispatchQueueAssert();
  long long v13 = self->_serializationQueue;
  long long v14 = self;
  objc_sync_enter(v14);
  long long v15 = SBLogProactiveAppLibrary();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v32 = a4;
    _os_log_impl(&dword_1D7F0A000, v15, OS_LOG_TYPE_DEFAULT, "(%ld) Will update library category map", buf, 0xCu);
  }

  objc_storeStrong((id *)&v14->_libraryCategoryMap, a3);
  BOOL isCategoryMapOverriddenForTesting = v14->_isCategoryMapOverriddenForTesting;
  uint64_t v17 = SBLogProactiveAppLibrary();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v32 = a4;
    _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_DEFAULT, "(%ld) Did update library category map", buf, 0xCu);
  }

  objc_sync_exit(v14);
  uint64_t v18 = v14->_cacheFilePath;
  __int16 v19 = v18;
  if (!v7)
  {
    v20 = SBLogProactiveAppLibrary();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v32 = a4;
      __int16 v33 = 2112;
      id v34 = v12;
      _os_log_impl(&dword_1D7F0A000, v20, OS_LOG_TYPE_DEFAULT, "(%ld) Skipping library category map persistence; reason '%@' didn't want it",
        buf,
        0x16u);
    }
    goto LABEL_17;
  }
  if (!isCategoryMapOverriddenForTesting)
  {
    BOOL v23 = [(NSString *)v18 length] == 0;
    v20 = SBLogProactiveAppLibrary();
    BOOL v24 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (!v24) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 134217984;
      unint64_t v32 = a4;
      objc_super v21 = "(%ld) Skipping library category map persistence; no path specified";
      goto LABEL_9;
    }
    if (v24)
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v32 = a4;
      __int16 v33 = 2112;
      id v34 = v12;
      _os_log_impl(&dword_1D7F0A000, v20, OS_LOG_TYPE_DEFAULT, "(%ld) Attempting to persist library category map, updated for reason: %@", buf, 0x16u);
    }

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __104__SBHLibraryCategoryMapProvider__workQueue_updateLibraryCategoryMap_withSessionId_shouldPersist_reason___block_invoke;
    v26[3] = &unk_1E6AAEDA8;
    uint64_t v27 = v11;
    v28 = v19;
    v29 = v14;
    unint64_t v30 = a4;
    dispatch_async((dispatch_queue_t)v13, v26);

    v20 = v27;
LABEL_17:
    BOOL v22 = 1;
    goto LABEL_18;
  }
  v20 = SBLogProactiveAppLibrary();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v32 = a4;
    objc_super v21 = "(%ld) Skipping library category map persistence; testing is running and so the data there is bupkis";
LABEL_9:
    _os_log_impl(&dword_1D7F0A000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
  }
LABEL_10:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

void __104__SBHLibraryCategoryMapProvider__workQueue_updateLibraryCategoryMap_withSessionId_shouldPersist_reason___block_invoke(uint64_t a1)
{
  v62[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = (void *)MEMORY[0x1E4F1CB10];
    id v3 = [*(id *)(a1 + 40) stringByDeletingLastPathComponent];
    id v4 = [v2 fileURLWithPath:v3];

    char v54 = 0;
    int v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    BOOL v6 = [v4 path];
    int v7 = [v5 fileExistsAtPath:v6 isDirectory:&v54];

    int v8 = [*(id *)(a1 + 48) hasCachedLibraryCategoryMapOnFileSystem];
    if (v7) {
      BOOL v9 = v54 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9 && v8 != 0)
    {
      id v26 = SBLogProactiveAppLibrary();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = *(void *)(a1 + 56);
        uint64_t v29 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        uint64_t v56 = v28;
        __int16 v57 = 2112;
        uint64_t v58 = v29;
        _os_log_impl(&dword_1D7F0A000, v26, OS_LOG_TYPE_DEFAULT, "(%ld) Library category map caches directory exists @ '%@'; skipping creation...",
          buf,
          0x16u);
      }

LABEL_28:
      uint64_t v36 = *(void *)(a1 + 32);
      id v51 = 0;
      v37 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v36 requiringSecureCoding:1 error:&v51];
      id v22 = v51;
      v38 = SBLogProactiveAppLibrary();
      v39 = v38;
      if (v22)
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          __104__SBHLibraryCategoryMapProvider__workQueue_updateLibraryCategoryMap_withSessionId_shouldPersist_reason___block_invoke_cold_3();
        }
      }
      else if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v40 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 134217984;
        uint64_t v56 = v40;
        _os_log_impl(&dword_1D7F0A000, v39, OS_LOG_TYPE_DEFAULT, "(%ld) Library category map update persisted; contacting observers about successful refresh.",
          buf,
          0xCu);
      }

      uint64_t v41 = *(void *)(a1 + 40);
      id v50 = 0;
      [v37 writeToFile:v41 options:268435457 error:&v50];
      id v42 = v50;
      v43 = SBLogProactiveAppLibrary();
      v44 = v43;
      if (v42)
      {
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          __104__SBHLibraryCategoryMapProvider__workQueue_updateLibraryCategoryMap_withSessionId_shouldPersist_reason___block_invoke_cold_2();
        }
      }
      else if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 134217984;
        uint64_t v56 = v45;
        _os_log_impl(&dword_1D7F0A000, v44, OS_LOG_TYPE_DEFAULT, "(%ld) Library category map successfully written to file.", buf, 0xCu);
      }

      goto LABEL_39;
    }
    id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v12 = (void *)MEMORY[0x1E4F1CB10];
    long long v13 = [(id)objc_opt_class() cacheDirectory];
    long long v14 = [v12 fileURLWithPath:v13];
    [v11 removeItemAtURL:v14 error:0];

    long long v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v61 = *MEMORY[0x1E4F28370];
    v62[0] = *MEMORY[0x1E4F28378];
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:&v61 count:1];
    id v53 = 0;
    char v17 = [v15 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:v16 error:&v53];
    id v18 = v53;

    if (v17)
    {
      __int16 v19 = SBLogProactiveAppLibrary();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(a1 + 56);
        uint64_t v21 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        uint64_t v56 = v20;
        __int16 v57 = 2112;
        uint64_t v58 = v21;
        _os_log_impl(&dword_1D7F0A000, v19, OS_LOG_TYPE_DEFAULT, "(%ld) Library category map caches directory was created at URL '%@'", buf, 0x16u);
      }
      id v22 = 0;
    }
    else
    {
      id v22 = v18;
      __int16 v19 = SBLogProactiveAppLibrary();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v47 = *(void *)(a1 + 56);
        uint64_t v48 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134218498;
        uint64_t v56 = v47;
        __int16 v57 = 2112;
        uint64_t v58 = v48;
        __int16 v59 = 2112;
        id v60 = v22;
        _os_log_error_impl(&dword_1D7F0A000, v19, OS_LOG_TYPE_ERROR, "(%ld) Error creating directory path '%@'  with error: %@", buf, 0x20u);
      }
    }

    uint64_t v30 = *MEMORY[0x1E4F1C630];
    id v52 = 0;
    char v31 = [v4 setResourceValue:MEMORY[0x1E4F1CC38] forKey:v30 error:&v52];
    id v32 = v52;
    __int16 v33 = SBLogProactiveAppLibrary();
    id v34 = v33;
    if (v31)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 134217984;
        uint64_t v56 = v35;
        _os_log_impl(&dword_1D7F0A000, v34, OS_LOG_TYPE_DEFAULT, "(%ld) Library category map cache directory path tagged excluded from backup successfully.", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      __104__SBHLibraryCategoryMapProvider__workQueue_updateLibraryCategoryMap_withSessionId_shouldPersist_reason___block_invoke_cold_4();
    }

    if (!v22) {
      goto LABEL_28;
    }
  }
  else
  {
    BOOL v23 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v24 = *(void *)(a1 + 40);
    id v49 = 0;
    [v23 removeItemAtPath:v24 error:&v49];
    id v22 = v49;

    uint64_t v25 = SBLogProactiveAppLibrary();
    id v4 = v25;
    if (v22)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        __104__SBHLibraryCategoryMapProvider__workQueue_updateLibraryCategoryMap_withSessionId_shouldPersist_reason___block_invoke_cold_1();
      }
    }
    else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v46 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 134217984;
      uint64_t v56 = v46;
      _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "(%ld) Library category map update persisted; requested deletion of internal cache. Contacting observers about su"
        "ccessful refresh.",
        buf,
        0xCu);
    }
  }
LABEL_39:
}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_139(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BSDispatchQueueAssert();
  from = (id *)(a1 + 72);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    id v32 = WeakRetained;
    int v5 = [v3 userInfo];
    BOOL v6 = v5;
    if (!v5) {
      int v5 = (void *)MEMORY[0x1E4F1CC08];
    }
    int v7 = (void *)[v5 mutableCopy];

    if (*(void *)(a1 + 40)) {
      int v8 = *(__CFString **)(a1 + 40);
    }
    else {
      int v8 = @"No reason?";
    }
    id v34 = v7;
    [v7 setObject:v8 forKeyedSubscript:@"SBHLibraryCategoryMapProviderUpdateReason"];
    BOOL v9 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 80)];
    [v7 setObject:v9 forKeyedSubscript:@"SBHLibraryCategoryMapProviderUpdateSessionId"];

    id v10 = (void *)MEMORY[0x1E4F28C58];
    id v11 = [v3 domain];
    id v12 = objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, objc_msgSend(v3, "code"), v7);

    long long v13 = SBLogProactiveAppLibrary();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_139_cold_4();
    }

    long long v14 = SBLogProactiveAppLibrary();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_139_cold_3();
    }

    long long v15 = objc_opt_new();
    uint64_t v16 = objc_opt_new();
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v17 = *(id *)(a1 + 48);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v45 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          [v21 accumulateFailure:v12 forSession:*(void *)(a1 + 80)];
          if ([v21 hasFailedSeveralTimes]) {
            id v22 = v16;
          }
          else {
            id v22 = v15;
          }
          [v22 addObject:v21];
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v18);
    }

    if ([v15 count])
    {
      BOOL v23 = SBLogProactiveAppLibrary();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_139_cold_2();
      }

      [v32[8] addObjectsFromArray:v15];
      uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v15 copyItems:1];
      uint64_t v25 = *(NSObject **)(a1 + 56);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_150;
      block[3] = &unk_1E6AB0610;
      objc_copyWeak(&v43, from);
      id v42 = v24;
      id v26 = v24;
      dispatch_async(v25, block);

      objc_destroyWeak(&v43);
    }
    if ([v16 count])
    {
      uint64_t v27 = SBLogProactiveAppLibrary();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_139_cold_1();
      }

      uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v16 copyItems:1];
      uint64_t v29 = *(NSObject **)(a1 + 56);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_151;
      v38[3] = &unk_1E6AB0610;
      objc_copyWeak(&v40, from);
      id v39 = v28;
      id v30 = v28;
      dispatch_async(v29, v38);

      objc_destroyWeak(&v40);
    }
    char v31 = *(NSObject **)(a1 + 56);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_2_152;
    v35[3] = &unk_1E6AB0610;
    objc_copyWeak(&v37, from);
    id v3 = v12;
    id v36 = v3;
    dispatch_async(v31, v35);
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

    objc_destroyWeak(&v37);
    id WeakRetained = v32;
  }
}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_150(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_callbackQueue_notifyObserversWillReEnqueueFailedRequests:", *(void *)(a1 + 32));
}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_151(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_callbackQueue_notifyObserversWillSunsetFailedRequests:", *(void *)(a1 + 32));
}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_2_152(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_callbackQueue_notifyObserversCategoryMapRefreshFailedWithError:", *(void *)(a1 + 32));
}

uint64_t __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_157(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_notifyObserverCategoryMapWasRefreshedWithOptions:refreshedCategoryMap:", *(void *)(a1 + 48), *(void *)(a1 + 40));
}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_2_161(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v7, "options", (void)v11) & 0x20) != 0)
        {
          int v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
          v15[0] = @"sbh_categoryMapRefreshSessionIDKey";
          BOOL v9 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
          v15[1] = @"sbh_categoryMapRefreshErrorKey";
          v16[0] = v9;
          v16[1] = *(void *)(a1 + 40);
          id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
          [v8 postNotificationName:@"com.apple.springboardhome.categoryMapProviderRefreshCompleted" object:v7 userInfo:v10];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v4);
  }
}

- (void)_kickoffInitialHydration
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "Error trying to open category map: %@", v2, v3, v4, v5, v6);
}

- (void)_setupClearCacheNotification
{
  objc_initWeak(&location, self);
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SBHLibraryCategoryMapProvider__setupClearCacheNotification__block_invoke;
  v6[3] = &unk_1E6AB06D8;
  objc_copyWeak(&v7, &location);
  uint64_t v4 = [v3 addObserverForName:@"SBHLibraryCategoryMapProviderCachesWereClearedNotification" object:0 queue:0 usingBlock:v6];
  id clearCacheNotificationHandle = self->_clearCacheNotificationHandle;
  self->_id clearCacheNotificationHandle = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __61__SBHLibraryCategoryMapProvider__setupClearCacheNotification__block_invoke(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[4];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__SBHLibraryCategoryMapProvider__setupClearCacheNotification__block_invoke_2;
    block[3] = &unk_1E6AAC810;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __61__SBHLibraryCategoryMapProvider__setupClearCacheNotification__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 _nextSessionIdentifier];
  return objc_msgSend(v1, "_workQueue_updateLibraryCategoryMap:withSessionId:shouldPersist:reason:", 0, v2, 0, @"Caches Were Cleared Notification");
}

- (void)_setupLocaleNotification
{
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = [v5 addObserverForName:*MEMORY[0x1E4F1C370] object:0 queue:0 usingBlock:&__block_literal_global_35];
  id localeNotificationHandle = self->_localeNotificationHandle;
  self->_id localeNotificationHandle = v3;
}

void __57__SBHLibraryCategoryMapProvider__setupLocaleNotification__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [NSString stringWithFormat:@"LOCALE WAS CHANGED: %@", a2];
  +[SBHLibraryCategoryMapProvider clearCachesForReason:v2];
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryCategoryMap, 0);
  objc_storeStrong(&self->_clearCacheNotificationHandle, 0);
  objc_storeStrong(&self->_localeNotificationHandle, 0);
  objc_storeStrong((id *)&self->_inflightRefreshRequests, 0);
  objc_storeStrong((id *)&self->_pendingRefreshRequests, 0);
  objc_storeStrong((id *)&self->_forbiddenApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_cacheFilePath, 0);
  objc_storeStrong((id *)&self->_libraryCategoryMapProviderSource, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_serializationQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

+ (void)clearCachesForReason:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "Error deleting app library cache: %@", v2, v3, v4, v5, v6);
}

void __104__SBHLibraryCategoryMapProvider__workQueue_updateLibraryCategoryMap_withSessionId_shouldPersist_reason___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_1D7F0A000, v0, v1, "(%ld) Error deleting category map: %@");
}

void __104__SBHLibraryCategoryMapProvider__workQueue_updateLibraryCategoryMap_withSessionId_shouldPersist_reason___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "(%ld) Error writing library category map to file.", v2, v3, v4, v5, 0);
}

void __104__SBHLibraryCategoryMapProvider__workQueue_updateLibraryCategoryMap_withSessionId_shouldPersist_reason___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_1D7F0A000, v0, v1, "(%ld) Error persisting library category map: %@");
}

void __104__SBHLibraryCategoryMapProvider__workQueue_updateLibraryCategoryMap_withSessionId_shouldPersist_reason___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_1D7F0A000, v0, v1, "(%ld) Failed to tag library category map cache directory as excluded from backup:%@");
}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_139_cold_1()
{
  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_1D7F0A000, v0, v1, "(%ld) Several failed requests are now invalid; letting these sunset: %@");
}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_139_cold_2()
{
  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_1D7F0A000, v0, v1, "(%ld) Several failed requests are still valid; re-enqueing %@");
}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_139_cold_3()
{
  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "(%ld) Updating requests w/ failure...", v2, v3, v4, v5, 0);
}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_139_cold_4()
{
  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_1D7F0A000, v0, v1, "(%ld) Finished Library Category Map refresh WITH ERROR: %@");
}

@end