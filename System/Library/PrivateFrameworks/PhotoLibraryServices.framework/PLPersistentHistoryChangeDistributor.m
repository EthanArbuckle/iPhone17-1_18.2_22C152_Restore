@interface PLPersistentHistoryChangeDistributor
- (PLPersistentHistoryChangeDistributor)initWithPersistentStoreCoordinator:(id)a3 bundle:(id)a4 changeMerger:(id)a5;
- (id)fetchTransactionsSinceLastToken;
- (id)localEventFromTransactions:(id)a3;
- (id)makeManagedObjectContext;
- (void)_advanceTokenToCurrent;
- (void)_inq_distributeNewTransactionsSinceLastTokenWithReason:(id)a3 xpcTransaction:(id)a4;
- (void)_inq_setLastToken:(id)a3;
- (void)_inq_startObservingRemoteNotifications;
- (void)beginObservingChanges;
- (void)dealloc;
- (void)distributeNewTransactionsSinceLastToken;
- (void)distributeTransactions:(id)a3 withXPCTransaction:(id)a4;
- (void)endObservingChanges;
- (void)forceUserInterfaceReload;
- (void)handleRemoteNotificationOfType:(int64_t)a3 withTransaction:(id)a4;
- (void)invalidate;
- (void)startObservingRemoteNotifications;
- (void)stopObservingRemoteNotifications;
@end

@implementation PLPersistentHistoryChangeDistributor

uint64_t __73__PLPersistentHistoryChangeDistributor_startObservingRemoteNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_inq_startObservingRemoteNotifications");

  v3 = *(void **)(a1 + 32);
  return [v3 stillAlive];
}

void __62__PLPersistentHistoryChangeDistributor__advanceTokenToCurrent__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[1];
  if (v3)
  {
    v4 = [v3 currentPersistentHistoryTokenFromStores:0];
    objc_msgSend(v2, "_inq_setLastToken:", v4);

    v5 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 32);
      int v11 = 138412290;
      uint64_t v12 = v6;
      v7 = "Change distributor advanced _lastToken to: %@";
      v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      uint32_t v10 = 12;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else
  {
    v5 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      v7 = "Change distributor _inq_advanceTokenToCurrent PSC is nil";
      v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 2;
      goto LABEL_6;
    }
  }
}

- (void)_inq_startObservingRemoteNotifications
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  if (persistentStoreCoordinator)
  {
    v4 = [(NSPersistentStoreCoordinator *)persistentStoreCoordinator currentPersistentHistoryTokenFromStores:0];
    [(PLPersistentHistoryChangeDistributor *)self _inq_setLastToken:v4];

    v5 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      lastToken = self->_lastToken;
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = lastToken;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Setting initial _lastToken to: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    notificationObserver = self->_notificationObserver;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __78__PLPersistentHistoryChangeDistributor__inq_startObservingRemoteNotifications__block_invoke;
    v9[3] = &unk_1E5872AF8;
    objc_copyWeak(&v10, (id *)buf);
    [(PLChangeHandlingNotificationObserver *)notificationObserver startObservingRemoteNotificationsWithBlock:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v8 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Change distributor _inq_startObservingRemoteNotifications PSC is nil", buf, 2u);
    }
  }
}

- (void)_inq_setLastToken:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v5 = (NSPersistentHistoryToken *)[v4 copy];
  lastToken = self->_lastToken;
  self->_lastToken = v5;

  id v7 = v4;
  PLRunWithUnfairLock();
}

void __58__PLPersistentHistoryChangeDistributor__inq_setLastToken___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 40) description];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;
}

- (void)beginObservingChanges
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  uint64_t v3 = MEMORY[0x1E4F143A8];
  PLRunWithUnfairLock();
  if (*((unsigned char *)v6 + 24)) {
    [(PLPersistentHistoryChangeDistributor *)self _advanceTokenToCurrent];
  }
  _Block_object_dispose(&v5, 8);
}

- (void)_advanceTokenToCurrent
{
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PLPersistentHistoryChangeDistributor__advanceTokenToCurrent__block_invoke;
  block[3] = &unk_1E5875CE0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

- (void)startObservingRemoteNotifications
{
  uint64_t v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLPersistentHistoryChangeDistributor startObservingRemoteNotifications]"];
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PLPersistentHistoryChangeDistributor_startObservingRemoteNotifications__block_invoke;
  block[3] = &unk_1E5875DA0;
  objc_copyWeak(&v8, &location);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (PLPersistentHistoryChangeDistributor)initWithPersistentStoreCoordinator:(id)a3 bundle:(id)a4 changeMerger:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = v12;
  if (v10)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_10:
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PLPersistentHistoryChangeDistributor.m", 44, @"Invalid parameter not satisfying: %@", @"changeMerger != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"PLPersistentHistoryChangeDistributor.m", 43, @"Invalid parameter not satisfying: %@", @"persistentStoreCoordinator != nil" object file lineNumber description];

  if (!v13) {
    goto LABEL_10;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_11:
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"PLPersistentHistoryChangeDistributor.m", 45, @"Invalid parameter not satisfying: %@", @"bundle != nil" object file lineNumber description];

LABEL_4:
  v28.receiver = self;
  v28.super_class = (Class)PLPersistentHistoryChangeDistributor;
  v14 = [(PLPersistentHistoryChangeDistributor *)&v28 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_persistentStoreCoordinator, a3);
    objc_storeStrong((id *)&v15->_changeMerger, a5);
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("PLPersistentHistoryChangeDistributor.isolationQueue", v16);
    isolationQueue = v15->_isolationQueue;
    v15->_isolationQueue = (OS_dispatch_queue *)v17;

    uint64_t v19 = [v11 makeChangeHandlingNotificationObserverWithLowPriorityThrottleInterval:4.0];
    notificationObserver = v15->_notificationObserver;
    v15->_notificationObserver = (PLChangeHandlingNotificationObserver *)v19;

    v15->_observerCountLock._os_unfair_lock_opaque = 0;
    v15->_observerCount = 0;
    v21 = PLPhotosObjectLifecycleGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      uint64_t v30 = v22;
      __int16 v31 = 2048;
      v32 = v15;
      __int16 v33 = 2112;
      id v34 = v10;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEBUG, "%@ %p initWithPersistentStoreCoordinator:%@", buf, 0x20u);
    }

    v23 = v15;
  }

  return v15;
}

void __61__PLPersistentHistoryChangeDistributor_beginObservingChanges__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (++*(void *)(*(void *)(a1 + 32) + 56) == 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    uint64_t v2 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 64);
      int v4 = 138543362;
      uint64_t v5 = v3;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "beginObservingChanges: _observerCount became 1 (resuming), _lastToken = %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerCountLastTokenDescription, 0);
  objc_storeStrong((id *)&self->_notificationObserver, 0);
  objc_storeStrong((id *)&self->_lastToken, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_changeMerger, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
}

- (id)localEventFromTransactions:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__PLPersistentHistoryChangeDistributor_localEventFromTransactions___block_invoke;
  v7[3] = &unk_1E586D758;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = +[PLLocalChangeEventBuilder localEventWithBuilderBlock:v7];

  return v5;
}

void __67__PLPersistentHistoryChangeDistributor_localEventFromTransactions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setUpdatedPropertyFilter:&__block_literal_global_12129];
  [v3 recordAllTransactionsFromIterator:*(void *)(a1 + 32)];
}

- (void)distributeTransactions:(id)a3 withXPCTransaction:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if ([v6 count])
  {
    id v8 = [(PLPersistentHistoryChangeDistributor *)self localEventFromTransactions:v6];
    if ([v8 count])
    {
      os_log_type_t v9 = [v8 objectForKeyedSubscript:@"PLUnknownMergeEvent"];
      int v10 = [v9 BOOLValue];

      if (v10)
      {
        id v11 = PLPersistentHistoryGetLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Handling unknown merge event", buf, 2u);
        }

        [(PLPersistentHistoryChangeDistributor *)self forceUserInterfaceReload];
      }
      else
      {
        PLChangeHandlingGetLog();
        uint64_t v13 = (id)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v14 = os_signpost_id_generate(v13);

        v15 = v13;
        v16 = v15;
        unint64_t v17 = v14 - 1;
        if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v34 = [v6 count];
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "DistributeTransactions", "transaction count: %lu", buf, 0xCu);
        }
        os_signpost_id_t spid = v14;

        v18 = PLPersistentHistoryGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v19 = [v8 _pl_prettyDescription];
          *(_DWORD *)buf = 138412290;
          uint64_t v34 = (uint64_t)v19;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, "Distributing local event: %@", buf, 0xCu);
        }
        v20 = v16;
        v21 = v20;
        if (v17 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v20))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v21, OS_SIGNPOST_EVENT, spid, "DistributeLocalEvent", "", buf, 2u);
        }

        changeMerger = self->_changeMerger;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __82__PLPersistentHistoryChangeDistributor_distributeTransactions_withXPCTransaction___block_invoke;
        v31[3] = &unk_1E5875CE0;
        id v23 = v7;
        id v32 = v23;
        [(PLCoreDataChangeMerger *)changeMerger mergeIntoAllContextsChangesFromRemoteContextSave:v8 completionHandler:v31];
        v24 = [v6 lastIteratedToken];
        if (v24)
        {
          [(PLPersistentHistoryChangeDistributor *)self _inq_setLastToken:v24];
          v25 = PLPersistentHistoryGetLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            lastToken = self->_lastToken;
            *(_DWORD *)buf = 138412290;
            uint64_t v34 = (uint64_t)lastToken;
            _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEBUG, "Distributing transactions set _lastToken to: %@", buf, 0xCu);
          }
        }
        v27 = v21;
        objc_super v28 = v27;
        if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
        {
          v29 = self->_lastToken;
          *(_DWORD *)buf = 138412290;
          uint64_t v34 = (uint64_t)v29;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v28, OS_SIGNPOST_INTERVAL_END, spid, "DistributeTransactions", "_lastToken: %@", buf, 0xCu);
        }

        [v23 stillAlive];
      }
    }
    else
    {
      id v12 = PLPersistentHistoryGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "Not distributing empty local event", buf, 2u);
      }
    }
  }
  else
  {
    id v8 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "Not distributing empty transaction iterator", buf, 2u);
    }
  }
}

uint64_t __82__PLPersistentHistoryChangeDistributor_distributeTransactions_withXPCTransaction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stillAlive];
}

- (void)forceUserInterfaceReload
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  if (persistentStoreCoordinator)
  {
    id v4 = [(NSPersistentStoreCoordinator *)persistentStoreCoordinator currentPersistentHistoryTokenFromStores:0];
    [(PLPersistentHistoryChangeDistributor *)self _inq_setLastToken:v4];

    uint64_t v5 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      lastToken = self->_lastToken;
      int v8 = 138412290;
      os_log_type_t v9 = lastToken;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Forcing user interface reload set _lastToken to: %@", (uint8_t *)&v8, 0xCu);
    }

    [(PLCoreDataChangeMerger *)self->_changeMerger handleUnknownMergeEvent];
  }
  else
  {
    id v7 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "forceUserInterfaceReload: PSC is nil", (uint8_t *)&v8, 2u);
    }
  }
}

- (id)makeManagedObjectContext
{
  if (self->_persistentStoreCoordinator)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
    [v3 setPersistentStoreCoordinator:self->_persistentStoreCoordinator];
    [v3 setName:@"com.apple.photos.persistentHistoryChangeDistributor.managedObjectContext"];
  }
  else
  {
    id v4 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "makeManagedObjectContext failure: PSC is nil", v6, 2u);
    }

    id v3 = 0;
  }
  return v3;
}

- (id)fetchTransactionsSinceLastToken
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v3 = PLPersistentHistoryGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    lastToken = self->_lastToken;
    *(_DWORD *)buf = 138412290;
    os_signpost_id_t v14 = lastToken;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Fetching transactions since _lastToken: %@", buf, 0xCu);
  }

  if (self->_lastToken)
  {
    uint64_t v5 = [(PLPersistentHistoryChangeDistributor *)self makeManagedObjectContext];
    id v6 = self->_lastToken;
    id v12 = 0;
    id v7 = +[PLPersistentHistoryTransactionIterator iteratorSinceToken:v6 withManagedObjectObjectContext:v5 error:&v12];
    int v8 = (NSPersistentHistoryToken *)v12;
    if (!v7)
    {
      if (PLIsErrorEqualToCode())
      {
        [(PLPersistentHistoryChangeDistributor *)self forceUserInterfaceReload];
      }
      else
      {
        os_log_type_t v9 = PLPersistentHistoryGetLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = self->_lastToken;
          *(_DWORD *)buf = 138412546;
          os_signpost_id_t v14 = v8;
          __int16 v15 = 2112;
          v16 = v10;
          _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Error fetching transactions: %@, since token: %@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    uint64_t v5 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "_lastKnownToken is unexpectedly nil, not fetching all history", buf, 2u);
    }
    id v7 = 0;
  }

  return v7;
}

- (void)_inq_distributeNewTransactionsSinceLastTokenWithReason:(id)a3 xpcTransaction:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  id v8 = v6;
  PLRunWithUnfairLock();
  if (*((unsigned char *)v12 + 24))
  {
    os_log_type_t v9 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Distributing new transactions since last token [Reason: %{public}@]", buf, 0xCu);
    }

    uint64_t v10 = [(PLPersistentHistoryChangeDistributor *)self fetchTransactionsSinceLastToken];
    if (v10) {
      [(PLPersistentHistoryChangeDistributor *)self distributeTransactions:v10 withXPCTransaction:v7];
    }
  }
  _Block_object_dispose(&v11, 8);
}

void __110__PLPersistentHistoryChangeDistributor__inq_distributeNewTransactionsSinceLastTokenWithReason_xpcTransaction___block_invoke(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1[4] + 56))
  {
    uint64_t v2 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = a1[5];
      int v4 = 138543362;
      uint64_t v5 = v3;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "Change distribution is paused (no observers), not distributing change (reason: %{public}@)", (uint8_t *)&v4, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

- (void)distributeNewTransactionsSinceLastToken
{
  uint64_t v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLPersistentHistoryChangeDistributor distributeNewTransactionsSinceLastToken]"];
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PLPersistentHistoryChangeDistributor_distributeNewTransactionsSinceLastToken__block_invoke;
  block[3] = &unk_1E5875DA0;
  objc_copyWeak(&v8, &location);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __79__PLPersistentHistoryChangeDistributor_distributeNewTransactionsSinceLastToken__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_inq_distributeNewTransactionsSinceLastTokenWithReason:xpcTransaction:", @"requested", *(void *)(a1 + 32));
}

- (void)invalidate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v7 = objc_opt_class();
    __int16 v8 = 2048;
    os_log_type_t v9 = self;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p invalidate", buf, 0x16u);
  }

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PLPersistentHistoryChangeDistributor_invalidate__block_invoke;
  block[3] = &unk_1E5875CE0;
  void block[4] = self;
  dispatch_sync(isolationQueue, block);
}

void __50__PLPersistentHistoryChangeDistributor_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

- (void)endObservingChanges
{
}

void __59__PLPersistentHistoryChangeDistributor_endObservingChanges__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 56);
  if (v2)
  {
    *(void *)(v1 + 56) = v2 - 1;
    if (*(void *)(*(void *)(a1 + 32) + 56)) {
      return;
    }
    int v4 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 64);
      int v10 = 138543362;
      uint64_t v11 = v5;
      uint64_t v6 = "endObservingChanges: _observerCount became 0 (pausing), _lastToken = %{public}@";
      uint64_t v7 = v4;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
      uint32_t v9 = 12;
LABEL_7:
      _os_log_impl(&dword_19B3C7000, v7, v8, v6, (uint8_t *)&v10, v9);
    }
  }
  else
  {
    int v4 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      uint64_t v6 = "endObservingChanges: observerCount is already 0";
      uint64_t v7 = v4;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      uint32_t v9 = 2;
      goto LABEL_7;
    }
  }
}

- (void)handleRemoteNotificationOfType:(int64_t)a3 withTransaction:(id)a4
{
  id v6 = a4;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PLPersistentHistoryChangeDistributor_handleRemoteNotificationOfType_withTransaction___block_invoke;
  block[3] = &unk_1E5875E40;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_sync(isolationQueue, block);
}

uint64_t __87__PLPersistentHistoryChangeDistributor_handleRemoteNotificationOfType_withTransaction___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48) == 1) {
    uint64_t v1 = @"notification-high";
  }
  else {
    uint64_t v1 = @"notification-low";
  }
  return objc_msgSend(*(id *)(a1 + 32), "_inq_distributeNewTransactionsSinceLastTokenWithReason:xpcTransaction:", v1, *(void *)(a1 + 40));
}

- (void)stopObservingRemoteNotifications
{
  [(PLChangeHandlingNotificationObserver *)self->_notificationObserver stopObservingRemoteNotifications];
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PLPersistentHistoryChangeDistributor_stopObservingRemoteNotifications__block_invoke;
  block[3] = &unk_1E5875CE0;
  void block[4] = self;
  dispatch_sync(isolationQueue, block);
}

uint64_t __72__PLPersistentHistoryChangeDistributor_stopObservingRemoteNotifications__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inq_setLastToken:", 0);
}

void __78__PLPersistentHistoryChangeDistributor__inq_startObservingRemoteNotifications__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained handleRemoteNotificationOfType:a2 withTransaction:v5];
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v6 = objc_opt_class();
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)PLPersistentHistoryChangeDistributor;
  [(PLPersistentHistoryChangeDistributor *)&v4 dealloc];
}

@end