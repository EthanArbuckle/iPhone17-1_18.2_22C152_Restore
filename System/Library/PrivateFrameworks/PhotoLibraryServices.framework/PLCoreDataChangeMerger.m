@interface PLCoreDataChangeMerger
- (BOOL)isMergingCoalescedSaveNotification;
- (NSDictionary)allDidSaveObjectIDsUserInfo;
- (PLCoreDataChangeMerger)init;
- (id)allContexts;
- (id)allContextsNotIdenticalTo:(id)a3;
- (void)dealloc;
- (void)handleUnknownMergeEvent;
- (void)invalidate;
- (void)mergeChangesFromRemoteContextSave:(id)a3 intoAllContextsNotIdenticalTo:(id)a4 completionHandler:(id)a5;
- (void)mergeIntoAllContextsChangesFromRemoteContextSave:(id)a3 completionHandler:(id)a4;
- (void)refreshAllObjects;
- (void)registerToReceiveCoreDataChanges:(id)a3;
- (void)setAllDidSaveObjectIDsUserInfo:(id)a3;
- (void)setIsMergingCoalescedSaveNotification:(BOOL)a3;
@end

@implementation PLCoreDataChangeMerger

- (PLCoreDataChangeMerger)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)PLCoreDataChangeMerger;
  v2 = [(PLCoreDataChangeMerger *)&v11 init];
  if (v2)
  {
    v3 = objc_alloc_init(PLManagedObjectContextList);
    contextsToReceiveNotifications = v2->_contextsToReceiveNotifications;
    v2->_contextsToReceiveNotifications = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.PLManagedObjectContext.mergeChanges", 0);
    mergeChangesQueue = v2->_mergeChangesQueue;
    v2->_mergeChangesQueue = (OS_dispatch_queue *)v5;

    v7 = PLPhotosObjectLifecycleGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v8;
      __int16 v14 = 2048;
      v15 = v2;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "%@ %p init", buf, 0x16u);
    }

    v9 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allDidSaveObjectIDsUserInfo, 0);
  objc_storeStrong((id *)&self->_mergeChangesQueue, 0);
  objc_storeStrong((id *)&self->_contextsToReceiveNotifications, 0);
}

- (void)setAllDidSaveObjectIDsUserInfo:(id)a3
{
}

- (NSDictionary)allDidSaveObjectIDsUserInfo
{
  return self->_allDidSaveObjectIDsUserInfo;
}

- (void)setIsMergingCoalescedSaveNotification:(BOOL)a3
{
  self->_isMergingCoalescedSaveNotification = a3;
}

- (BOOL)isMergingCoalescedSaveNotification
{
  return self->_isMergingCoalescedSaveNotification;
}

- (id)allContexts
{
  return [(PLCoreDataChangeMerger *)self allContextsNotIdenticalTo:0];
}

- (id)allContextsNotIdenticalTo:(id)a3
{
  return [(PLManagedObjectContextList *)self->_contextsToReceiveNotifications allContextsNotIdenticalTo:a3];
}

- (void)refreshAllObjects
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [(PLCoreDataChangeMerger *)self allContexts];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __43__PLCoreDataChangeMerger_refreshAllObjects__block_invoke;
        v8[3] = &unk_1E5875CE0;
        v8[4] = v7;
        [v7 performBlock:v8];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

uint64_t __43__PLCoreDataChangeMerger_refreshAllObjects__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshAllObjects];
}

- (void)handleUnknownMergeEvent
{
}

void __49__PLCoreDataChangeMerger_handleUnknownMergeEvent__block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 25) = 1;
    uint64_t v3 = [*(id *)(a1 + 32) allContexts];
    if ([v3 count])
    {
      uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v25 = v3;
      id v5 = v3;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v38;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v38 != v8) {
              objc_enumerationMutation(v5);
            }
            long long v10 = *(void **)(*((void *)&v37 + 1) + 8 * v9);
            v35[0] = MEMORY[0x1E4F143A8];
            v35[1] = 3221225472;
            v35[2] = __49__PLCoreDataChangeMerger_handleUnknownMergeEvent__block_invoke_2;
            v35[3] = &unk_1E5875E18;
            v35[4] = v10;
            id v36 = v4;
            [v10 performBlockAndWait:v35];

            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
        }
        while (v7);
      }

      long long v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
      long long v12 = [v5 objectAtIndex:0];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __49__PLCoreDataChangeMerger_handleUnknownMergeEvent__block_invoke_3;
      v31[3] = &unk_1E5873A50;
      id v13 = v4;
      id v32 = v13;
      id v14 = v5;
      id v33 = v14;
      id v15 = v11;
      id v34 = v15;
      [v12 performBlockAndWait:v31];

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v16 = v14;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v43 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v28;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v28 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v27 + 1) + 8 * v20);
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __49__PLCoreDataChangeMerger_handleUnknownMergeEvent__block_invoke_5;
            v26[3] = &unk_1E5875E18;
            uint64_t v22 = *(void *)(a1 + 32);
            v26[4] = v21;
            v26[5] = v22;
            [v21 performBlockAndWait:v26];
            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v43 count:16];
        }
        while (v18);
      }

      uint64_t v3 = v25;
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 25) = 0;
    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v41 = @"PLUnknownMergeEvent";
    uint64_t v42 = MEMORY[0x1E4F1CC38];
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    [v23 postNotificationName:@"PLManagedObjectContextsPhotoKitNotification" object:0 userInfo:v24];
  }
}

void __49__PLCoreDataChangeMerger_handleUnknownMergeEvent__block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "registeredObjects", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v7 isDeleted] & 1) == 0)
        {
          uint64_t v8 = [v7 entity];
          uint64_t v9 = [v8 name];

          long long v10 = [*(id *)(a1 + 40) objectForKey:v9];
          if (!v10)
          {
            long long v10 = [MEMORY[0x1E4F1CA80] set];
            [*(id *)(a1 + 40) setObject:v10 forKey:v9];
          }
          long long v11 = [v7 objectID];
          [v10 addObject:v11];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

void __49__PLCoreDataChangeMerger_handleUnknownMergeEvent__block_invoke_3(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__PLCoreDataChangeMerger_handleUnknownMergeEvent__block_invoke_4;
  v3[3] = &unk_1E586B4A0;
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void __49__PLCoreDataChangeMerger_handleUnknownMergeEvent__block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) stalenessInterval];
  double v3 = v2;
  [*(id *)(a1 + 32) setStalenessInterval:0.1];
  objc_msgSend(*(id *)(a1 + 32), "pl_refresh");
  id v10 = [*(id *)(a1 + 32) photoLibrary];
  if ([*(id *)(a1 + 32) isBackingALAssetsLibrary]) {
    BOOL v4 = v10 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    [*(id *)(a1 + 32) resetAllFetchingAlbums];
    if (+[PLManagedObjectContext assetsLibraryLoggingEnabled])
    {
      NSLog(&cfstr_Plgenericchang_2.isa, *(void *)(a1 + 40));
    }
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = (void *)MEMORY[0x1E4F28EA0];
    uint64_t v7 = [*(id *)(a1 + 32) photoLibrary];
    uint64_t v8 = [v6 notificationWithName:@"PLGenericChangeNotification" object:v7 userInfo:0];
    [v5 postNotification:v8];
  }
  if ([*(id *)(a1 + 32) isUserInterfaceContext])
  {
    uint64_t v9 = +[PLChangeNotificationCenter defaultCenter];
    [v9 postShouldReloadNotificationWithPhotoLibrary:v10];
  }
  [*(id *)(a1 + 32) setStalenessInterval:v3];
}

void __49__PLCoreDataChangeMerger_handleUnknownMergeEvent__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (void *)MEMORY[0x1E4F1C0D0];
  id v6 = a3;
  id v10 = [v5 fetchRequestWithEntityName:a2];
  [v10 setIncludesSubentities:1];
  [v10 setIncludesPendingChanges:0];
  uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v6];

  [v10 setPredicate:v7];
  uint64_t v8 = [*(id *)(a1 + 32) objectAtIndex:0];
  uint64_t v9 = [v8 executeFetchRequest:v10 error:0];

  if (v9) {
    [*(id *)(a1 + 40) addObject:v9];
  }
}

- (void)mergeChangesFromRemoteContextSave:(id)a3 intoAllContextsNotIdenticalTo:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  long long v11 = PLBackendGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "mergeChangesFromRemoteContextSave", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, v10);
  mergeChangesQueue = self->_mergeChangesQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __108__PLCoreDataChangeMerger_mergeChangesFromRemoteContextSave_intoAllContextsNotIdenticalTo_completionHandler___block_invoke;
  v15[3] = &unk_1E5870668;
  v15[4] = self;
  id v17 = v9;
  id v13 = v9;
  objc_copyWeak(&v18, buf);
  id v16 = v8;
  id v14 = v8;
  dispatch_async(mergeChangesQueue, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(buf);
}

void __108__PLCoreDataChangeMerger_mergeChangesFromRemoteContextSave_intoAllContextsNotIdenticalTo_completionHandler___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    double v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
  else
  {
    double v3 = (void *)MEMORY[0x19F38D3B0]();
    BOOL v4 = *(void **)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v6 = [v4 allContextsNotIdenticalTo:WeakRetained];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __108__PLCoreDataChangeMerger_mergeChangesFromRemoteContextSave_intoAllContextsNotIdenticalTo_completionHandler___block_invoke_2;
    v19[3] = &unk_1E5868F90;
    id v20 = *(id *)(a1 + 40);
    uint64_t v7 = objc_msgSend(v6, "_pl_filter:", v19);
    id v8 = [*(id *)(a1 + 40) objectForKey:@"coalescedEvent"];
    *(unsigned char *)(*(void *)(a1 + 32) + 25) = [v8 BOOLValue];

    uint64_t v9 = [*(id *)(a1 + 40) copy];
    uint64_t v10 = *(void *)(a1 + 32);
    long long v11 = *(void **)(v10 + 32);
    *(void *)(v10 + 32) = v9;

    if ([v7 count])
    {
      long long v12 = +[PLConcurrencyLimiter sharedLimiter];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __108__PLCoreDataChangeMerger_mergeChangesFromRemoteContextSave_intoAllContextsNotIdenticalTo_completionHandler___block_invoke_3;
      v16[3] = &unk_1E5875E18;
      id v17 = *(id *)(a1 + 40);
      id v18 = v7;
      [v12 sync:v16 identifyingBlock:0 library:0];
    }
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(v13 + 32);
    *(void *)(v13 + 32) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 25) = 0;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    long long v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 postNotificationName:@"PLManagedObjectContextsPhotoKitNotification" object:0 userInfo:*(void *)(a1 + 40)];
  }
}

uint64_t __108__PLCoreDataChangeMerger_mergeChangesFromRemoteContextSave_intoAllContextsNotIdenticalTo_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 shouldMergeFromRemoteContextWithChanges:*(void *)(a1 + 32)];
}

uint64_t __108__PLCoreDataChangeMerger_mergeChangesFromRemoteContextSave_intoAllContextsNotIdenticalTo_completionHandler___block_invoke_3(uint64_t a1)
{
  return [MEMORY[0x1E4F1C110] mergeChangesFromRemoteContextSave:*(void *)(a1 + 32) intoContexts:*(void *)(a1 + 40)];
}

- (void)mergeIntoAllContextsChangesFromRemoteContextSave:(id)a3 completionHandler:(id)a4
{
}

- (void)registerToReceiveCoreDataChanges:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412802;
    uint64_t v7 = objc_opt_class();
    __int16 v8 = 2048;
    uint64_t v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "%@ %p registerToReceiveCoreDataChanges:%@", (uint8_t *)&v6, 0x20u);
  }

  [(PLManagedObjectContextList *)self->_contextsToReceiveNotifications addContext:v4];
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v6 = objc_opt_class();
    __int16 v7 = 2048;
    __int16 v8 = self;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)PLCoreDataChangeMerger;
  [(PLCoreDataChangeMerger *)&v4 dealloc];
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v5 = objc_opt_class();
    __int16 v6 = 2048;
    __int16 v7 = self;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p invalidate BEGIN", buf, 0x16u);
  }

  pl_dispatch_sync();
}

void __36__PLCoreDataChangeMerger_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  double v2 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2048;
    uint64_t v8 = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "%@ %p invalidate END", (uint8_t *)&v5, 0x16u);
  }
}

@end