@interface REDonatedActionStore
- (BOOL)_shouldLimitQueries;
- (id)_init;
- (id)callbackQueue;
- (void)_beginLoadingData;
- (void)_finishLoadingData:(unint64_t)a3;
- (void)_notified_addDonatedActionsForInstalledApps:(id)a3;
- (void)_notified_distributeRecentDeletedActions:(id)a3;
- (void)_notified_distributeRecentDonatedActions:(id)a3;
- (void)_notified_removeDonatedActionsForUninstalledApps:(id)a3;
- (void)_notified_removeThenDistributeAllActions:(id)a3;
- (void)_queue_distributeAllDonatedActions;
- (void)_queue_distributeAllDonatedActionsWithIdentifier:(id)a3;
- (void)_queue_distributeRecentDeletedActions;
- (void)_queue_distributeRecentDonatedActions;
- (void)_subscribeToNotifications;
- (void)dealloc;
- (void)fetchDonationWithIdentifier:(id)a3 completion:(id)a4;
- (void)start;
- (void)synchronizeDonationsIfNecessary;
- (void)triggerDistributeAllDonatedActions:(BOOL)a3;
@end

@implementation REDonatedActionStore

- (id)_init
{
  v20.receiver = self;
  v20.super_class = (Class)REDonatedActionStore;
  v2 = [(REObservableSingleton *)&v20 _init];
  if (v2)
  {
    if (!CoreDuetLibraryCore())
    {
      v13 = 0;
      goto LABEL_9;
    }
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.RelevanceEngine.REDonationActionStore", v3);
    v5 = (void *)v2[3];
    v2[3] = v4;

    objc_initWeak(&location, v2);
    uint64_t v6 = v2[3];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __29__REDonatedActionStore__init__block_invoke;
    v17[3] = &unk_2644BC638;
    objc_copyWeak(&v18, &location);
    uint64_t v7 = +[REUpNextScheduler schedulerWithQueue:v6 delay:v17 updateBlock:0.1];
    v8 = (void *)v2[4];
    v2[4] = v7;

    uint64_t v9 = v2[3];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __29__REDonatedActionStore__init__block_invoke_2;
    v15[3] = &unk_2644BC638;
    objc_copyWeak(&v16, &location);
    uint64_t v10 = +[REUpNextScheduler schedulerWithQueue:v9 delay:v15 updateBlock:0.1];
    v11 = (void *)v2[5];
    v2[5] = v10;

    v12 = (void *)CFPreferencesCopyAppValue(@"REQueryVersionKey", @"com.apple.RelevanceEngine");
    if (!v12 || ([&unk_26CFCD200 isEqual:v12] & 1) == 0)
    {
      CFPreferencesSetAppValue(@"LastDonateQueryEndDate", 0, @"com.apple.RelevanceEngine");
      CFPreferencesSetAppValue(@"LastDeleteQueryEndDate", 0, @"com.apple.RelevanceEngine");
      CFPreferencesSetAppValue(@"REQueryVersionKey", &unk_26CFCD200, @"com.apple.RelevanceEngine");
    }
    *((unsigned char *)v2 + 17) = 0;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  v13 = v2;
LABEL_9:

  return v13;
}

void __29__REDonatedActionStore__init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_distributeRecentDonatedActions");
}

void __29__REDonatedActionStore__init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_distributeRecentDeletedActions");
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 removeObserver:self];

  dispatch_queue_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)REDonatedActionStore;
  [(REDonatedActionStore *)&v5 dealloc];
}

- (id)callbackQueue
{
  return self->_queue;
}

- (void)start
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = RELogForDomain(14);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = (id)objc_opt_class();
    id v4 = v8;
    _os_log_impl(&dword_21E6E6000, v3, OS_LOG_TYPE_DEFAULT, "Starting %{public}@.", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__REDonatedActionStore_start__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(queue, block);
  [(REDonatedActionStore *)self _subscribeToNotifications];
}

uint64_t __29__REDonatedActionStore_start__block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (!v2[17] || (uint64_t result = [v2 _shouldLimitQueries], (result & 1) == 0))
  {
    id v4 = RELogForDomain(14);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v5 = 0;
      _os_log_impl(&dword_21E6E6000, v4, OS_LOG_TYPE_DEFAULT, "Synchronize all donated actions.", v5, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_queue_distributeAllDonatedActions");
  }
  return result;
}

- (void)fetchDonationWithIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = a3;
    uint64_t v7 = +[RESingleton sharedInstance];
    id v8 = [v7 queryForDuetEventWithIdentifier:v6];

    uint64_t v9 = +[RESingleton sharedInstance];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __63__REDonatedActionStore_fetchDonationWithIdentifier_completion___block_invoke;
    v10[3] = &unk_2644BE5A8;
    id v11 = v5;
    [v9 executeQuery:v8 responseQueue:MEMORY[0x263EF83A0] completion:v10];
  }
}

void __63__REDonatedActionStore_fetchDonationWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2050000000;
  id v4 = (void *)get_DKEventClass_softClass;
  uint64_t v12 = get_DKEventClass_softClass;
  if (!get_DKEventClass_softClass)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __get_DKEventClass_block_invoke;
    v8[3] = &unk_2644BC768;
    v8[4] = &v9;
    __get_DKEventClass_block_invoke((uint64_t)v8);
    id v4 = (void *)v10[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  if (objc_opt_isKindOfClass())
  {
    id v6 = v3;
    uint64_t v7 = [[REDonatedAction alloc] initWithEvent:v6 filtered:1];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_26);
}

- (void)synchronizeDonationsIfNecessary
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__REDonatedActionStore_synchronizeDonationsIfNecessary__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __55__REDonatedActionStore_synchronizeDonationsIfNecessary__block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 17))
  {
    uint64_t v1 = result;
    v2 = RELogForDomain(14);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_21E6E6000, v2, OS_LOG_TYPE_DEFAULT, "Asked by model to synchronize all donated actions.", v3, 2u);
    }

    return objc_msgSend(*(id *)(v1 + 32), "_queue_distributeAllDonatedActions");
  }
  return result;
}

- (void)triggerDistributeAllDonatedActions:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__REDonatedActionStore_triggerDistributeAllDonatedActions___block_invoke;
  v4[3] = &unk_2644BCFC8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

uint64_t __59__REDonatedActionStore_triggerDistributeAllDonatedActions___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40) || (uint64_t result = [*(id *)(a1 + 32) _shouldLimitQueries], (result & 1) == 0))
  {
    id v3 = RELogForDomain(14);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_21E6E6000, v3, OS_LOG_TYPE_DEFAULT, "Trigger distribution all donated actions.", v4, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_queue_distributeAllDonatedActions");
  }
  return result;
}

- (void)_subscribeToNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__notified_addDonatedActionsForInstalledApps_ name:@"REApplicationStateDidInstall" object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__notified_removeDonatedActionsForUninstalledApps_ name:@"REApplicationStateDidUninstall" object:0];

  if (!REDeviceUnlockedSinceBoot())
  {
    self->_isMonitoringLockState = 1;
    BOOL v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:self selector:sel__notified_removeThenDistributeAllActions_ name:@"REDeviceLockStateChangedNotification" object:0];
  }
  id v6 = [get_DKSystemEventStreamsClass() appIntentsStream];
  uint64_t v7 = [v6 name];

  id v8 = [MEMORY[0x263F087C8] defaultCenter];
  uint64_t v9 = get_DKKnowledgeStorageDidInsertEventsNotification();
  [v8 addObserver:self selector:sel__notified_distributeRecentDonatedActions_ name:v9 object:v7];

  uint64_t v10 = [MEMORY[0x263F087C8] defaultCenter];
  uint64_t v11 = get_DKKnowledgeStorageDidTombstoneEventsNotification();
  [v10 addObserver:self selector:sel__notified_distributeRecentDeletedActions_ name:v11 object:v7];

  uint64_t v12 = [get_DKSystemEventStreamsClass() appActivityStream];
  v13 = [v12 name];

  v14 = [MEMORY[0x263F087C8] defaultCenter];
  v15 = get_DKKnowledgeStorageDidInsertEventsNotification();
  [v14 addObserver:self selector:sel__notified_distributeRecentDonatedActions_ name:v15 object:v13];

  id v16 = [MEMORY[0x263F087C8] defaultCenter];
  v17 = get_DKKnowledgeStorageDidTombstoneEventsNotification();
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  id v18 = (void *)get_DKTombstoneEligibleForPredictionIdentifierSymbolLoc_ptr;
  uint64_t v33 = get_DKTombstoneEligibleForPredictionIdentifierSymbolLoc_ptr;
  if (!get_DKTombstoneEligibleForPredictionIdentifierSymbolLoc_ptr)
  {
    v19 = (void *)CoreDuetLibrary();
    v31[3] = (uint64_t)dlsym(v19, "_DKTombstoneEligibleForPredictionIdentifier");
    get_DKTombstoneEligibleForPredictionIdentifierSymbolLoc_ptr = v31[3];
    id v18 = (void *)v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v18)
  {
    -[RELemmaEnumerator init]();
    goto LABEL_11;
  }
  [v16 addObserver:self selector:sel__notified_distributeRecentDeletedActions_ name:v17 object:*v18];

  objc_super v20 = [get_DKSystemEventStreamsClass() appRelevantShortcutsStream];
  v21 = [v20 name];

  v22 = [MEMORY[0x263F087C8] defaultCenter];
  v23 = get_DKKnowledgeStorageDidInsertEventsNotification();
  [v22 addObserver:self selector:sel__notified_distributeRecentDonatedActions_ name:v23 object:v21];

  v24 = [MEMORY[0x263F087C8] defaultCenter];
  v25 = get_DKKnowledgeStorageDidTombstoneEventsNotification();
  [v24 addObserver:self selector:sel__notified_distributeRecentDeletedActions_ name:v25 object:v21];

  v26 = [MEMORY[0x263F087C8] defaultCenter];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  v27 = (void *)get_DKKnowledgeStorageDidAgeOutEventsNotificationSymbolLoc_ptr;
  uint64_t v33 = get_DKKnowledgeStorageDidAgeOutEventsNotificationSymbolLoc_ptr;
  if (!get_DKKnowledgeStorageDidAgeOutEventsNotificationSymbolLoc_ptr)
  {
    v28 = (void *)CoreDuetLibrary();
    v31[3] = (uint64_t)dlsym(v28, "_DKKnowledgeStorageDidAgeOutEventsNotification");
    get_DKKnowledgeStorageDidAgeOutEventsNotificationSymbolLoc_ptr = v31[3];
    v27 = (void *)v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v27)
  {
LABEL_11:
    v29 = (_Unwind_Exception *)-[RELemmaEnumerator init]();
    _Block_object_dispose(&v30, 8);
    _Unwind_Resume(v29);
  }
  [v26 addObserver:self selector:sel__notified_removeThenDistributeAllActions_ name:*v27 object:0];

  xpc_set_event_stream_handler("com.apple.distnoted.matching", 0, &__block_literal_global_24);
}

void __49__REDonatedActionStore__subscribeToNotifications__block_invoke(int a1, xpc_object_t xdict)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86C8]);
  id v3 = RELogForDomain(14);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    BOOL v5 = string;
    _os_log_impl(&dword_21E6E6000, v3, OS_LOG_TYPE_INFO, "coreduet notification received: %s", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)_shouldLimitQueries
{
  if (REIsSupergreenUsedInLastSevenDays())
  {
    v2 = (void *)CFPreferencesCopyAppValue(@"LastAttemptedQueryDate", @"com.apple.RelevanceEngine");
    if (v2)
    {
      id v3 = [MEMORY[0x263EFF910] date];
      [v3 timeIntervalSinceDate:v2];
      double v5 = v4;

      BOOL v6 = v5 < 3600.0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    uint64_t v7 = RELogForDomain(14);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_21E6E6000, v7, OS_LOG_TYPE_DEFAULT, "Siri Face has not been used in past seven days; restrict queries.",
        v9,
        2u);
    }

    return 1;
  }
  return v6;
}

- (void)_beginLoadingData
{
}

void __41__REDonatedActionStore__beginLoadingData__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 donationActionStoreWillBeginLoadingData];
  }
}

- (void)_finishLoadingData:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  double v5 = RELogForDomain(14);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    unint64_t v7 = a3;
    _os_log_impl(&dword_21E6E6000, v5, OS_LOG_TYPE_DEFAULT, "Finished loading data: %lu items.", (uint8_t *)&v6, 0xCu);
  }

  [(REObservableSingleton *)self enumerateObservers:&__block_literal_global_32];
}

void __43__REDonatedActionStore__finishLoadingData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 donationActionStoreDidFinishLoadingData];
  }
}

- (void)_queue_distributeAllDonatedActions
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "LastDonateQueryEndDate is in the future (%@). isNewDonation may be inaccurate.", (uint8_t *)&v2, 0xCu);
}

void __58__REDonatedActionStore__queue_distributeAllDonatedActions__block_invoke(void *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x263EFFA68];
  id v19 = v3;
  if (v3) {
    uint64_t v4 = v3;
  }
  id v5 = v4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", v19) == 2)
        {
          uint64_t v11 = RELogForDomain(14);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            __58__REDonatedActionStore__queue_distributeAllDonatedActions__block_invoke_cold_1((uint64_t)v27, (uint64_t)v10);
          }
        }
        v13 = (void *)a1[4];
        uint64_t v12 = (void *)a1[5];
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __58__REDonatedActionStore__queue_distributeAllDonatedActions__block_invoke_35;
        v21[3] = &unk_2644BE610;
        v21[4] = v10;
        id v22 = v12;
        [v13 enumerateObservers:v21];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }
  *(void *)(*(void *)(a1[6] + 8) + 24) += objc_msgSend(v5, "count", v19);
  v14 = [v5 lastObject];
  uint64_t v15 = [v14 localSaveDate];
  uint64_t v16 = *(void *)(a1[7] + 8);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  id v18 = *(void **)(*(void *)(a1[7] + 8) + 40);
  if (v18 && ([v18 compare:a1[5]] == 1 || !a1[5])) {
    CFPreferencesSetAppValue(@"LastDonateQueryEndDate", *(CFPropertyListRef *)(*(void *)(a1[7] + 8) + 40), @"com.apple.RelevanceEngine");
  }
  dispatch_sync(MEMORY[0x263EF83A0], &__block_literal_global_26);
}

void __58__REDonatedActionStore__queue_distributeAllDonatedActions__block_invoke_35(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 localSaveDate];
  BOOL v5 = [v6 compare:*(void *)(a1 + 40)] == 1 || *(void *)(a1 + 40) == 0;
  [v4 donationActionStoreReceivedDonation:*(void *)(a1 + 32) isNewDonation:v5];
}

- (void)_queue_distributeAllDonatedActionsWithIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = RELogForDomain(14);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_21E6E6000, v5, OS_LOG_TYPE_DEFAULT, "Distributing all donated actions with identifier %{public}@.", (uint8_t *)&buf, 0xCu);
  }

  id v6 = (void *)CFPreferencesCopyAppValue(@"LastDonateQueryEndDate", @"com.apple.RelevanceEngine");
  [(REDonatedActionStore *)self _beginLoadingData];
  uint64_t v7 = +[RESingleton sharedInstance];
  uint64_t v8 = [v7 queryForAllDonatedActionsWithIdentifier:v4];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy__11;
  long long v26 = __Block_byref_object_dispose__11;
  id v27 = 0;
  uint64_t v19 = 0;
  objc_super v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v9 = +[RESingleton sharedInstance];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __73__REDonatedActionStore__queue_distributeAllDonatedActionsWithIdentifier___block_invoke;
  v14 = &unk_2644BE688;
  uint64_t v15 = self;
  v17 = &v19;
  p_long long buf = &buf;
  id v10 = v6;
  id v16 = v10;
  [v9 executeQuerySynchronouslyWithBatching:v8 completion:&v11];

  -[REDonatedActionStore _finishLoadingData:](self, "_finishLoadingData:", v20[3], v11, v12, v13, v14, v15);
  CFPreferencesSetAppValue(@"LastAttemptedQueryDate", (CFPropertyListRef)[MEMORY[0x263EFF910] date], @"com.apple.RelevanceEngine");
  self->_synchronized = 1;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&buf, 8);
}

void __73__REDonatedActionStore__queue_distributeAllDonatedActionsWithIdentifier___block_invoke(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263EFFA68];
  id v18 = v3;
  if (v3) {
    id v4 = v3;
  }
  id v5 = v4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v10 type] == 2)
        {
          uint64_t v11 = RELogForDomain(14);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            __58__REDonatedActionStore__queue_distributeAllDonatedActions__block_invoke_cold_1((uint64_t)v24, (uint64_t)v10);
          }
        }
        uint64_t v12 = (void *)a1[4];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __73__REDonatedActionStore__queue_distributeAllDonatedActionsWithIdentifier___block_invoke_36;
        v19[3] = &unk_2644BE660;
        v19[4] = v10;
        [v12 enumerateObservers:v19];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }
  *(void *)(*(void *)(a1[6] + 8) + 24) += [v5 count];
  v13 = [v5 lastObject];
  uint64_t v14 = [v13 localSaveDate];
  uint64_t v15 = *(void *)(a1[7] + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  v17 = *(void **)(*(void *)(a1[7] + 8) + 40);
  if (v17 && ([v17 compare:a1[5]] == 1 || !a1[5])) {
    CFPreferencesSetAppValue(@"LastDonateQueryEndDate", *(CFPropertyListRef *)(*(void *)(a1[7] + 8) + 40), @"com.apple.RelevanceEngine");
  }
  dispatch_sync(MEMORY[0x263EF83A0], &__block_literal_global_26);
}

uint64_t __73__REDonatedActionStore__queue_distributeAllDonatedActionsWithIdentifier___block_invoke_36(uint64_t a1, void *a2)
{
  return [a2 donationActionStoreReceivedDonation:*(void *)(a1 + 32) isNewDonation:1];
}

- (void)_queue_distributeRecentDonatedActions
{
  if (self->_synchronized)
  {
    id v3 = RELogForDomain(14);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21E6E6000, v3, OS_LOG_TYPE_DEFAULT, "Distributing recently donated actions.", buf, 2u);
    }

    id v4 = (void *)CFPreferencesCopyAppValue(@"LastDonateQueryEndDate", @"com.apple.RelevanceEngine");
    if (isFutureDate(v4))
    {
      [(REDonatedActionStore *)self _queue_distributeAllDonatedActions];
    }
    else
    {
      [(REDonatedActionStore *)self _beginLoadingData];
      id v5 = +[RESingleton sharedInstance];
      uint64_t v6 = [v5 queryForDonatedActionsAfterDate:v4];

      *(void *)long long buf = 0;
      uint64_t v15 = buf;
      uint64_t v16 = 0x3032000000;
      v17 = __Block_byref_object_copy__11;
      id v18 = __Block_byref_object_dispose__11;
      id v19 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = &v10;
      uint64_t v12 = 0x2020000000;
      uint64_t v13 = 0;
      uint64_t v7 = +[RESingleton sharedInstance];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __61__REDonatedActionStore__queue_distributeRecentDonatedActions__block_invoke;
      v9[3] = &unk_2644BE6B0;
      v9[4] = self;
      v9[5] = &v10;
      v9[6] = buf;
      [v7 executeQuerySynchronouslyWithBatching:v6 completion:v9];

      uint64_t v8 = (void *)*((void *)v15 + 5);
      if (v8)
      {
        if (([v8 isEqualToDate:v4] & 1) == 0) {
          CFPreferencesSetAppValue(@"LastDonateQueryEndDate", *((CFPropertyListRef *)v15 + 5), @"com.apple.RelevanceEngine");
        }
      }
      [(REDonatedActionStore *)self _finishLoadingData:v11[3]];
      _Block_object_dispose(&v10, 8);
      _Block_object_dispose(buf, 8);
    }
  }
}

void __61__REDonatedActionStore__queue_distributeRecentDonatedActions__block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x263EFFA68];
  if (v3) {
    id v5 = v3;
  }
  id v6 = v5;
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
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * v10);
        uint64_t v12 = (void *)a1[4];
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __61__REDonatedActionStore__queue_distributeRecentDonatedActions__block_invoke_2;
        v17[3] = &unk_2644BE660;
        void v17[4] = v11;
        [v12 enumerateObservers:v17];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
  *(void *)(*(void *)(a1[5] + 8) + 24) += [v6 count];
  uint64_t v13 = [v6 lastObject];
  uint64_t v14 = [v13 localSaveDate];
  uint64_t v15 = *(void *)(a1[6] + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  dispatch_sync(MEMORY[0x263EF83A0], &__block_literal_global_26);
}

uint64_t __61__REDonatedActionStore__queue_distributeRecentDonatedActions__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 donationActionStoreReceivedDonation:*(void *)(a1 + 32) isNewDonation:1];
}

- (void)_queue_distributeRecentDeletedActions
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "LastDeleteQueryEndDate is in the future (%@). Ignoring date.", (uint8_t *)&v2, 0xCu);
}

void __61__REDonatedActionStore__queue_distributeRecentDeletedActions__block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  id v5 = (void *)MEMORY[0x263EFFA68];
  if (v3) {
    id v5 = v3;
  }
  id v6 = v5;
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
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * v10);
        uint64_t v12 = (void *)a1[4];
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __61__REDonatedActionStore__queue_distributeRecentDeletedActions__block_invoke_2;
        v17[3] = &unk_2644BE660;
        void v17[4] = v11;
        [v12 enumerateObservers:v17];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
  *(void *)(*(void *)(a1[5] + 8) + 24) += [v6 count];
  uint64_t v13 = [v6 lastObject];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"localSaveDate"];
  uint64_t v15 = *(void *)(a1[6] + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  dispatch_sync(MEMORY[0x263EF83A0], &__block_literal_global_26);
}

void __61__REDonatedActionStore__queue_distributeRecentDeletedActions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 donationActionStoreRemovedDonation:*(void *)(a1 + 32)];
  }
}

- (void)_notified_distributeRecentDeletedActions:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = RELogForDomain(14);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_21E6E6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received; distribute recently deleted actions.",
      (uint8_t *)&v7,
      0xCu);
  }
  [(REUpNextScheduler *)self->_deletionsScheduler schedule];
}

- (void)_notified_distributeRecentDonatedActions:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = RELogForDomain(14);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_21E6E6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received; distribute recently donated actions.",
      (uint8_t *)&v7,
      0xCu);
  }
  [(REUpNextScheduler *)self->_donationsScheduler schedule];
}

- (void)_notified_addDonatedActionsForInstalledApps:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"REApplicationStateBundleIdentifiers"];

  id v6 = RELogForDomain(14);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5 componentsJoinedByString:@", "];
    *(_DWORD *)long long buf = 138543362;
    uint64_t v14 = v7;
    _os_log_impl(&dword_21E6E6000, v6, OS_LOG_TYPE_DEFAULT, "Add actions for installed bundle identifiers: %{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__REDonatedActionStore__notified_addDonatedActionsForInstalledApps___block_invoke;
  v10[3] = &unk_2644BC688;
  id v11 = v5;
  uint64_t v12 = self;
  id v9 = v5;
  dispatch_async(queue, v10);
}

void __68__REDonatedActionStore__notified_addDonatedActionsForInstalledApps___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_queue_distributeAllDonatedActionsWithIdentifier:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_notified_removeDonatedActionsForUninstalledApps:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"REApplicationStateBundleIdentifiers"];

  uint64_t v6 = RELogForDomain(14);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    long long v7 = [v5 componentsJoinedByString:@", "];
    *(_DWORD *)long long buf = 138543362;
    uint64_t v14 = v7;
    _os_log_impl(&dword_21E6E6000, v6, OS_LOG_TYPE_DEFAULT, "Remove actions for uninstalled bundle identifiers: %{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__REDonatedActionStore__notified_removeDonatedActionsForUninstalledApps___block_invoke;
  v10[3] = &unk_2644BC688;
  id v11 = v5;
  uint64_t v12 = self;
  id v9 = v5;
  dispatch_async(queue, v10);
}

void __73__REDonatedActionStore__notified_removeDonatedActionsForUninstalledApps___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
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
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        long long v8 = *(void **)(a1 + 40);
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __73__REDonatedActionStore__notified_removeDonatedActionsForUninstalledApps___block_invoke_2;
        v9[3] = &unk_2644BE660;
        v9[4] = v7;
        [v8 enumerateObservers:v9];
        objc_msgSend(*(id *)(a1 + 40), "_queue_distributeAllDonatedActionsWithIdentifier:", v7);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void __73__REDonatedActionStore__notified_removeDonatedActionsForUninstalledApps___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 donationActionStoreRemovedDonationsFor:*(void *)(a1 + 32)];
  }
}

- (void)_notified_removeThenDistributeAllActions:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 name];
  int v6 = [@"REDeviceLockStateChangedNotification" isEqualToString:v5];

  if (v6 && self->_isMonitoringLockState)
  {
    self->_isMonitoringLockState = 0;
    uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 removeObserver:self name:@"REDeviceLockStateChangedNotification" object:0];
  }
  long long v8 = RELogForDomain(14);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v4 name];
    *(_DWORD *)long long buf = 138543362;
    long long v13 = v9;
    _os_log_impl(&dword_21E6E6000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ received; remove then distribute all actions.",
      buf,
      0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__REDonatedActionStore__notified_removeThenDistributeAllActions___block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __65__REDonatedActionStore__notified_removeThenDistributeAllActions___block_invoke(uint64_t a1)
{
  uint64_t result = REDeviceUnlockedSinceBoot();
  if (result)
  {
    [*(id *)(a1 + 32) enumerateObservers:&__block_literal_global_45];
    id v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_queue_distributeAllDonatedActions");
  }
  return result;
}

void __65__REDonatedActionStore__notified_removeThenDistributeAllActions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 donationActionStoreRemoveAllDonations];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletionsScheduler, 0);
  objc_storeStrong((id *)&self->_donationsScheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __58__REDonatedActionStore__queue_distributeAllDonatedActions__block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1, a2), "bundleIdentifier");
  _DWORD *v3 = 138543362;
  void *v2 = v4;
  OUTLINED_FUNCTION_0_2(&dword_21E6E6000, v5, v6, "Received relevant shortcut for %{public}@.");
}

@end