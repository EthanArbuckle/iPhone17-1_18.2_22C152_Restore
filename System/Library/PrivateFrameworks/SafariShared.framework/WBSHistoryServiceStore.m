@interface WBSHistoryServiceStore
- (BOOL)_ensureItemHasID:(id)a3;
- (BOOL)_ensureVisitHasID:(id)a3;
- (BOOL)isUsingInMemoryDatabase;
- (NSString)databaseID;
- (NSURL)databaseURL;
- (WBSHistoryCrypto)crypto;
- (WBSHistoryServiceDatabaseProtocol)databaseProxy;
- (WBSHistoryServiceStore)initWithDatabaseID:(id)a3 itemCountLimit:(unint64_t)a4 historyAgeLimit:(double)a5 historyItemClass:(Class)a6;
- (WBSHistoryServiceStore)initWithDatabaseID:(id)a3 itemCountLimit:(unint64_t)a4 historyAgeLimit:(double)a5 historyItemClass:(Class)a6 connectionProxy:(id)a7;
- (WBSHistoryStoreDelegate)delegate;
- (double)_ageLimitSinceReferenceDate;
- (double)historyAgeLimit;
- (id).cxx_construct;
- (id)_connectOptions;
- (id)_fetchVisitsOnDatabaseQueue:(unint64_t)a3 predicate:(id)a4 error:(id *)a5;
- (id)_loadOnDatabaseQueue:(unint64_t)a3 readHandle:(id)a4;
- (int64_t)_generateTemporaryDatabaseID;
- (void)_connectWithOptions:(id)a3 completionHandler:(id)a4;
- (void)_createTagsForIdentifiers:(id)a3 withTitles:(id)a4 type:(unint64_t)a5 level:(int64_t)a6 completionHandler:(id)a7;
- (void)_databaseFetchWithOptions:(unint64_t)a3 predicate:(id)a4 completionHandler:(id)a5;
- (void)_expireOldVisits;
- (void)_fetchHistoryItemsForTopics:(id)a3 fromStartDate:(id)a4 toEndDate:(id)a5 completionHandler:(id)a6;
- (void)_fetchTags:(unint64_t)a3 fromStartDate:(id)a4 toEndDate:(id)a5 withIdentifiers:(id)a6 limit:(unint64_t)a7 minimumItemCount:(unint64_t)a8 sortOrder:(int64_t)a9 completionHandler:(id)a10;
- (void)_load:(id)a3;
- (void)_performMaintenance:(id)a3;
- (void)_scheduleMaintenance;
- (void)_setMetadataValue:(id)a3 forKey:(id)a4 group:(id)a5;
- (void)_updateLastMaintenanceDate;
- (void)_waitForDatabase:(id)a3;
- (void)addAutocompleteTrigger:(id)a3 forItem:(id)a4;
- (void)assignHistoryItem:(id)a3 toTopicTags:(id)a4 completionHandler:(id)a5;
- (void)checkIfLocalVisitExistsInAnyOfItems:(id)a3 withCompletion:(id)a4;
- (void)clearHistoryVisitsAddedAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5;
- (void)clearHistoryWithCompletionHandler:(id)a3;
- (void)closeWithCompletionHandler:(id)a3;
- (void)computeFrequentlyVisitedSites:(unint64_t)a3 minimalVisitCountScore:(unint64_t)a4 blockList:(id)a5 allowList:(id)a6 options:(unint64_t)a7 currentTime:(double)a8 completionHandler:(id)a9;
- (void)connectionProxyConnectionWasInterrupted:(id)a3;
- (void)exportHistory:(id)a3 completionHandler:(id)a4;
- (void)fetchTopicsFromStartDate:(id)a3 toEndDate:(id)a4 completionHandler:(id)a5;
- (void)fetchTopicsFromStartDate:(id)a3 toEndDate:(id)a4 limit:(unint64_t)a5 minimumItemCount:(unint64_t)a6 sortOrder:(int64_t)a7 completionHandler:(id)a8;
- (void)getAutocompleteTriggersForItem:(id)a3 completionHandler:(id)a4;
- (void)getHighLevelHTTPFamilyDomainsVisitedAfterDate:(id)a3 beforeDate:(id)a4 onlyFromThisDevice:(BOOL)a5 completionHandler:(id)a6;
- (void)getItemCountBeforeDate:(id)a3 completionHandler:(id)a4;
- (void)getVisitsCreatedAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5;
- (void)handleEvent:(id)a3 completionHandler:(id)a4;
- (void)initializeCloudHistoryWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)loadWithCompletionHandler:(id)a3;
- (void)performMaintenance:(id)a3;
- (void)releaseCloudHistory:(id)a3;
- (void)removePastHistoryVisitsForItem:(id)a3 completionHandler:(id)a4;
- (void)reportPermanentIDsForItems:(id)a3 completionHandler:(id)a4;
- (void)reportPermanentIDsForVisits:(id)a3 completionHandler:(id)a4;
- (void)reportSevereError:(id)a3 completionHandler:(id)a4;
- (void)searchForUserTypedString:(id)a3 options:(unint64_t)a4 currentTime:(double)a5 enumerationBlock:(id)a6 completionHandler:(id)a7;
- (void)setDatabaseProxy:(id)a3;
- (void)setDatabaseURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHistoryAgeLimit:(double)a3;
- (void)setTitle:(id)a3 ofTag:(id)a4 completionHandler:(id)a5;
- (void)tagsWithIdentifiers:(id)a3 type:(unint64_t)a4 level:(int64_t)a5 creatingIfNecessary:(BOOL)a6 withTitles:(id)a7 completionHandler:(id)a8;
- (void)vacuumHistoryWithCompletionHandler:(id)a3;
- (void)visitAttributeWasUpdated:(id)a3 removeAttributes:(unint64_t)a4 addAttributes:(unint64_t)a5;
- (void)visitTitleWasUpdated:(id)a3;
- (void)visitsWereAdded:(id)a3;
- (void)waitForLoadingToComplete;
@end

@implementation WBSHistoryServiceStore

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

uint64_t __52__WBSHistoryServiceStore_loadWithCompletionHandler___block_invoke_18(uint64_t a1)
{
  return [*(id *)(a1 + 32) _load:*(void *)(a1 + 40)];
}

- (void)setDelegate:(id)a3
{
}

void __32__WBSHistoryServiceStore__load___block_invoke_48(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 72);
  *(void *)(v1 + 72) = 0;
}

- (void)loadWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(WBSHistoryServiceStore *)self _connectOptions];
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__WBSHistoryServiceStore_loadWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5C8D730;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(databaseQueue, block);
}

- (id)_connectOptions
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  [v3 setObject:@"Safari" forKeyedSubscript:@"WBSHistoryConnectionOptionEventListenerName"];
  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-self->_historyAgeLimit];
  [v3 setObject:v4 forKeyedSubscript:@"WBSHistoryConnectionOptionLegacyDatabaseImportAfterDate"];

  databaseID = self->_databaseID;
  if (databaseID) {
    [v3 setObject:databaseID forKeyedSubscript:@"WBSHistoryConnectionOptionDatabaseID"];
  }
  return v3;
}

void __32__WBSHistoryServiceStore__load___block_invoke_41(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  v5 = objc_msgSend(v3, "safari_numberForKey:", @"last_maintenance_date");
  [v5 doubleValue];
  uint64_t v6 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  id v8 = (id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 32);
  v9 = *(void **)(v7 + 80);
  *(void *)(v7 + 80) = v6;

  [*(id *)(*(void *)(a1 + 32) + 80) timeIntervalSinceReferenceDate];
  double v11 = v10;
  v12 = [MEMORY[0x1E4F1C9C8] now];
  [v12 timeIntervalSinceReferenceDate];
  double v14 = v13;

  if (v11 > v14)
  {
    v15 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __32__WBSHistoryServiceStore__load___block_invoke_41_cold_1(a1 + 32, v15);
    }
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] now];
    v17 = (void *)*((void *)*v8 + 10);
    *((void *)*v8 + 10) = v16;

    [*v8 _updateLastMaintenanceDate];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __32__WBSHistoryServiceStore__load___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(void *)(a1 + 56) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
    if (WeakRetained)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __32__WBSHistoryServiceStore__load___block_invoke_48;
      v14[3] = &unk_1E5C8CA70;
      v14[4] = WeakRetained;
      [v4 setHandler:v14];
      id v5 = objc_loadWeakRetained(WeakRetained + 14);
      if (v5)
      {
        uint64_t v6 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) timeIntervalSinceNow];
          __32__WBSHistoryServiceStore__load___block_invoke_2_cold_3(v7);
        }

        id v8 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) timeIntervalSinceNow];
          *(_DWORD *)buf = 136446466;
          uint64_t v16 = "load";
          __int16 v17 = 2048;
          double v18 = -v9;
          _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_INFO, "#perf - %{public}s: %f", buf, 0x16u);
        }

        double v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          uint64_t v11 = [*(id *)(a1 + 32) count];
          *(_DWORD *)buf = 134217984;
          uint64_t v16 = (const char *)v11;
          _os_log_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_INFO, "Finished loading history. Total item count: <%zi>", buf, 0xCu);
        }

        [v5 historyLoader:WeakRetained didLoadItems:*(void *)(a1 + 32) stringsForUserTypeDomainExpansion:*(void *)(a1 + 40)];
        [v5 historyLoaderDidFinishLoading:WeakRetained];
      }
      else
      {
        double v13 = WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          __32__WBSHistoryServiceStore__load___block_invoke_2_cold_2();
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      v12 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __32__WBSHistoryServiceStore__load___block_invoke_2_cold_1();
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void __64__WBSHistoryServiceStore__connectWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a5;
  if (objc_msgSend(v8, "safari_isSQLiteCorruptionError"))
  {
    double v9 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __64__WBSHistoryServiceStore__connectWithOptions_completionHandler___block_invoke_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
    [WeakRetained historyStoreDidFailDatabaseIntegrityCheck:*(void *)(a1 + 32)];

    uint64_t v11 = *(void *)(a1 + 40);
    v12 = *(void **)(*(void *)(a1 + 32) + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64__WBSHistoryServiceStore__connectWithOptions_completionHandler___block_invoke_11;
    v16[3] = &unk_1E5C9CE70;
    uint64_t v13 = *(void *)(a1 + 48);
    id v20 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 32);
    id v17 = v14;
    uint64_t v18 = v15;
    id v19 = *(id *)(a1 + 48);
    [v12 connectWithOptions:v11 delegate:v13 completionHandler:v16];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __52__WBSHistoryServiceStore_loadWithCompletionHandler___block_invoke_13(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a5;
  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a5);
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 56) = a3;
    *(void *)(*(void *)(a1 + 32) + 64) = a4;
    [*(id *)(a1 + 32) setDatabaseProxy:v9];
  }
  uint64_t v11 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) timeIntervalSinceNow];
    int v13 = 136446466;
    id v14 = "connect_with_options_call";
    __int16 v15 = 2048;
    double v16 = -v12;
    _os_log_impl(&dword_1A6B5F000, v11, OS_LOG_TYPE_INFO, "#perf - %{public}s: %f", (uint8_t *)&v13, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)setDatabaseProxy:(id)a3
{
}

- (void)_scheduleMaintenance
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([WeakRetained historyStoreShouldScheduleMaintenance:self] & 1) != 0)
  {
    objc_initWeak(&location, self);
    id v4 = [WBSPeriodicActivityScheduler alloc];
    lastMaintenanceDate = self->_lastMaintenanceDate;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke;
    v10[3] = &unk_1E5C8E340;
    objc_copyWeak(&v11, &location);
    uint64_t v6 = [(WBSPeriodicActivityScheduler *)v4 initWithInterval:lastMaintenanceDate minimumDelay:v10 lastFireDate:86400.0 block:30.0];
    maintenanceScheduler = self->_maintenanceScheduler;
    self->_maintenanceScheduler = v6;

    id v8 = [(WBSHistoryServiceStore *)self databaseProxy];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_4;
    v9[3] = &unk_1E5C9D1D8;
    v9[4] = self;
    [v8 fetchEventsForListener:@"Safari" completionHandler:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (BOOL)isUsingInMemoryDatabase
{
  databaseURL = self->_databaseURL;
  id v3 = WBSHistoryInMemoryDatabaseURL();
  LOBYTE(databaseURL) = [(NSURL *)databaseURL isEqual:v3];

  return (char)databaseURL;
}

void __32__WBSHistoryServiceStore__load___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8 = a3;
  id v9 = a4;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a4);
  if (v9)
  {
    id v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __32__WBSHistoryServiceStore__load___block_invoke_cold_2();
    }
  }
  id v11 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) timeIntervalSinceNow];
    __32__WBSHistoryServiceStore__load___block_invoke_cold_1(v12);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (WBSHistoryServiceStore)initWithDatabaseID:(id)a3 itemCountLimit:(unint64_t)a4 historyAgeLimit:(double)a5 historyItemClass:(Class)a6
{
  id v10 = a3;
  id v11 = objc_alloc_init(WBSHistoryConnectionProxy);
  double v12 = [(WBSHistoryServiceStore *)self initWithDatabaseID:v10 itemCountLimit:a4 historyAgeLimit:a6 historyItemClass:v11 connectionProxy:a5];

  return v12;
}

- (WBSHistoryServiceStore)initWithDatabaseID:(id)a3 itemCountLimit:(unint64_t)a4 historyAgeLimit:(double)a5 historyItemClass:(Class)a6 connectionProxy:(id)a7
{
  id v13 = a3;
  id v14 = a7;
  v28.receiver = self;
  v28.super_class = (Class)WBSHistoryServiceStore;
  __int16 v15 = [(WBSHistoryServiceStore *)&v28 init];
  double v16 = v15;
  if (v15)
  {
    v15->_historyAgeLimit = a5;
    v15->_historyItemClass = a6;
    v15->_itemCountLimit = a4;
    atomic_store(0, (unint64_t *)&v15->_state);
    objc_storeStrong((id *)&v15->_connection, a7);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryServiceStore", 0);
    databaseQueue = v16->_databaseQueue;
    v16->_databaseQueue = (OS_dispatch_queue *)v17;

    id v19 = v16->_databaseQueue;
    id v20 = +[WBSHistoryItem synchronizationQueue];
    dispatch_set_target_queue(v19, v20);

    objc_storeStrong((id *)&v16->_databaseID, a3);
    uint64_t v21 = objc_alloc_init(WBSHistoryObjectCache);
    cache = v16->_cache;
    v16->_cache = v21;

    v23 = objc_alloc_init(WBSHistoryCrypto);
    crypto = v16->_crypto;
    v16->_crypto = v23;

    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v16 selector:sel_connectionProxyConnectionWasInterrupted_ name:@"WBSHistoryConnectionWasInterrupted" object:v14];

    v26 = v16;
  }

  return v16;
}

- (void)_databaseFetchWithOptions:(unint64_t)a3 predicate:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(WBSHistoryServiceStore *)self databaseProxy];

  if (v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v12 = [(WBSHistoryServiceStore *)self databaseProxy];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __80__WBSHistoryServiceStore__databaseFetchWithOptions_predicate_completionHandler___block_invoke;
    v15[3] = &unk_1E5C9D028;
    id v17 = v9;
    v15[4] = self;
    id v13 = WeakRetained;
    id v16 = v13;
    [v12 fetchWithOptions:a3 predicate:v8 completionHandler:v15];
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSHistoryErrorDomain" code:4 userInfo:0];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v14);
  }
}

- (void)_load:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  id v5 = dispatch_group_create();
  group = dispatch_group_create();
  id v30 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x2020000000;
  uint64_t v82 = 0;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__24;
  v77 = __Block_byref_object_dispose__24;
  id v78 = 0;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__24;
  v71 = __Block_byref_object_dispose__24;
  id v72 = 0;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x3032000000;
  v65[3] = __Block_byref_object_copy__24;
  v65[4] = __Block_byref_object_dispose__24;
  id v66 = [MEMORY[0x1E4F1C9C8] date];
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = __Block_byref_object_copy__24;
  v63[4] = __Block_byref_object_dispose__24;
  id v64 = [MEMORY[0x1E4F1C9C8] date];
  dispatch_group_enter(v5);
  uint64_t v6 = [(WBSHistoryServiceStore *)self databaseProxy];
  id v7 = objc_opt_new();
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __32__WBSHistoryServiceStore__load___block_invoke;
  v57[3] = &unk_1E5C9CF10;
  v59 = &v79;
  v60 = &v73;
  v61 = &v67;
  v62 = v63;
  id v8 = v5;
  v58 = v8;
  [v6 fetchWithOptions:27 predicate:v7 completionHandler:v57];

  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__24;
  v55[4] = __Block_byref_object_dispose__24;
  id v56 = [MEMORY[0x1E4F1C9C8] date];
  dispatch_group_enter(group);
  id v9 = [(WBSHistoryServiceStore *)self databaseProxy];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __32__WBSHistoryServiceStore__load___block_invoke_32;
  v51[3] = &unk_1E5C9CF60;
  id v10 = v30;
  id v52 = v10;
  v54 = v55;
  id v11 = group;
  v53 = v11;
  [v9 fetchDomainExpansions:v51];

  dispatch_group_enter(v11);
  double v12 = [(WBSHistoryServiceStore *)self databaseProxy];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __32__WBSHistoryServiceStore__load___block_invoke_38;
  v49[3] = &unk_1E5C9CF88;
  v49[4] = self;
  id v13 = v11;
  v50 = v13;
  [v12 fetchDatabaseURL:v49];

  id v14 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"last_maintenance_date", 0);
  __int16 v15 = [MEMORY[0x1E4F1C9C8] date];
  dispatch_group_enter(v13);
  id v16 = [(WBSHistoryServiceStore *)self databaseProxy];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __32__WBSHistoryServiceStore__load___block_invoke_41;
  v47[3] = &unk_1E5C9CFB0;
  v47[4] = self;
  id v17 = v13;
  v48 = v17;
  [v16 fetchMetadataForKeys:v14 completionHandler:v47];

  uint64_t v18 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    [v15 timeIntervalSinceNow];
    -[WBSHistoryServiceStore _load:](v19);
  }

  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __32__WBSHistoryServiceStore__load___block_invoke_44;
  v46[3] = &unk_1E5C9B080;
  v46[4] = self;
  if (waitForGroupOrStopCondition(v8, (uint64_t)v46))
  {
    if (v68[5])
    {
      v4[2](v4);
    }
    else
    {
      objc_super v28 = [MEMORY[0x1E4F1C9C8] date];
      v29 = [(WBSHistoryServiceStore *)self _loadOnDatabaseQueue:v80[3] readHandle:v74[5]];
      uint64_t v21 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        [v28 timeIntervalSinceNow];
        -[WBSHistoryServiceStore _load:](v22);
      }

      v23 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[WBSHistoryServiceStore _load:](buf, [v29 count], v23);
      }

      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __32__WBSHistoryServiceStore__load___block_invoke_46;
      v45[3] = &unk_1E5C9B080;
      v45[4] = self;
      if (waitForGroupOrStopCondition(v17, (uint64_t)v45))
      {
        objc_initWeak(&location, self);
        v42[0] = 0;
        v42[1] = v42;
        v42[2] = 0x2020000000;
        char v43 = 0;
        v40[0] = 0;
        v40[1] = v40;
        v40[2] = 0x3032000000;
        v40[3] = __Block_byref_object_copy__24;
        v40[4] = __Block_byref_object_dispose__24;
        id v41 = [MEMORY[0x1E4F1C9C8] date];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __32__WBSHistoryServiceStore__load___block_invoke_2;
        v32[3] = &unk_1E5C9CFD8;
        v36 = v42;
        objc_copyWeak(&v39, &location);
        v35 = v4;
        v37 = v40;
        v38 = v65;
        id v33 = v29;
        id v34 = v10;
        v24 = (void *)MEMORY[0x1AD0C4F80](v32);
        id loadCompletionBlock = self->_loadCompletionBlock;
        self->_id loadCompletionBlock = v24;

        [(WBSHistoryServiceStore *)self _scheduleMaintenance];
        uint64_t v26 = 0;
        atomic_compare_exchange_strong(&self->_state.__a_.__a_value, (unint64_t *)&v26, 1uLL);
        dispatch_async(MEMORY[0x1E4F14428], self->_loadCompletionBlock);

        objc_destroyWeak(&v39);
        _Block_object_dispose(v40, 8);

        _Block_object_dispose(v42, 8);
        objc_destroyWeak(&location);
      }
      else
      {
        v27 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:89 userInfo:0];
        ((void (*)(void (**)(void), void *))v4[2])(v4, v27);
      }
    }
  }
  else
  {
    id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:89 userInfo:0];
    ((void (*)(void (**)(void), void *))v4[2])(v4, v20);
  }
  _Block_object_dispose(v55, 8);

  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v65, 8);

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v73, 8);

  _Block_object_dispose(&v79, 8);
}

- (WBSHistoryServiceDatabaseProtocol)databaseProxy
{
  return (WBSHistoryServiceDatabaseProtocol *)objc_getProperty(self, a2, 136, 1);
}

BOOL __32__WBSHistoryServiceStore__load___block_invoke_44(uint64_t a1)
{
  unint64_t v1 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 24));
  return v1 == 2;
}

BOOL __52__WBSHistoryServiceStore_loadWithCompletionHandler___block_invoke_15(uint64_t a1)
{
  unint64_t v1 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 24));
  return v1 == 2;
}

BOOL __32__WBSHistoryServiceStore__load___block_invoke_46(uint64_t a1)
{
  unint64_t v1 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 24));
  return v1 == 2;
}

- (id)_loadOnDatabaseQueue:(unint64_t)a3 readHandle:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  [(WBSHistoryObjectCache *)self->_cache reserveItemCapacity:a3];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x5812000000;
  v23 = __Block_byref_object_copy__21;
  memset(v25, 0, sizeof(v25));
  v24 = __Block_byref_object_dispose__22;
  uint64_t v26 = 0;
  int v27 = 1065353216;
  uint64_t v8 = [v6 fileDescriptor];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __58__WBSHistoryServiceStore__loadOnDatabaseQueue_readHandle___block_invoke;
  v18[3] = &unk_1E5C9CEC0;
  v18[4] = self;
  id v9 = v7;
  id v19 = v9;
  void v16[4] = self;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__WBSHistoryServiceStore__loadOnDatabaseQueue_readHandle___block_invoke_24;
  v17[3] = &unk_1E5C9CEE8;
  v17[4] = self;
  v17[5] = &v20;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__WBSHistoryServiceStore__loadOnDatabaseQueue_readHandle___block_invoke_27;
  v16[3] = &unk_1E5C9B080;
  SafariShared::ReadStreamedObjects(v8, v18, v17, v16);
  [v6 closeFile];
  for (i = (uint64_t **)v21[8]; i; i = (uint64_t **)*i)
  {
    id v11 = i[3];
    uint64_t v12 = [v11 redirectSourceDatabaseID];
    if (v12)
    {
      uint64_t v15 = v12;
      objc_super v28 = (unint64_t *)&v15;
      objc_msgSend(v11, "setRedirectSource:", std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t)(v21 + 6), (unint64_t *)&v15, (uint64_t)&std::piecewise_construct, &v28)[3]);
    }
    uint64_t v13 = [v11 redirectDestinationDatabaseID];
    if (v13)
    {
      uint64_t v15 = v13;
      objc_super v28 = (unint64_t *)&v15;
      objc_msgSend(v11, "setRedirectDestination:", std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t)(v21 + 6), (unint64_t *)&v15, (uint64_t)&std::piecewise_construct, &v28)[3]);
    }
  }
  _Block_object_dispose(&v20, 8);
  std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::~__hash_table((uint64_t)&v25[8]);

  return v9;
}

void __80__WBSHistoryServiceStore__databaseFetchWithOptions_predicate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v3 = [*(id *)(a1 + 32) fileDescriptor];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __80__WBSHistoryServiceStore__databaseFetchWithOptions_predicate_completionHandler___block_invoke_3;
  v21[3] = &unk_1E5C9CEC0;
  id v4 = *(void **)(a1 + 48);
  v21[4] = *(void *)(a1 + 40);
  id v22 = v4;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __80__WBSHistoryServiceStore__databaseFetchWithOptions_predicate_completionHandler___block_invoke_4;
  v19[3] = &unk_1E5C9D000;
  v19[4] = *(void *)(a1 + 40);
  id v5 = v2;
  id v20 = v5;
  SafariShared::ReadStreamedObjects(v3, v21, v19, 0);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "redirectSourceDatabaseID", (void)v15);
        if (v11)
        {
          uint64_t v12 = [*(id *)(*(void *)(a1 + 40) + 48) visitForID:v11];
          [v10 setRedirectSource:v12];
        }
        uint64_t v13 = objc_msgSend(v10, "redirectDestinationDatabaseID", v11);
        if (v13)
        {
          id v14 = [*(id *)(*(void *)(a1 + 40) + 48) visitForID:v13];
          [v10 setRedirectDestination:v14];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v7);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)releaseCloudHistory:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__WBSHistoryServiceStore_releaseCloudHistory___block_invoke;
  v6[3] = &unk_1E5C9D5A0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WBSHistoryServiceStore *)self _waitForDatabase:v6];
}

- (void)_waitForDatabase:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(WBSHistoryServiceStore *)self databaseProxy];
  if (v5)
  {
    v4[2](v4, v5);
  }
  else
  {
    databaseQueue = self->_databaseQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__WBSHistoryServiceStore__waitForDatabase___block_invoke;
    v7[3] = &unk_1E5C8C660;
    v7[4] = self;
    uint64_t v8 = v4;
    dispatch_async(databaseQueue, v7);
  }
}

void __46__WBSHistoryServiceStore_releaseCloudHistory___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) releaseCloudHistory:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:14 userInfo:0];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
}

void __52__WBSHistoryServiceStore_loadWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = dispatch_group_create();
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__24;
  v23 = __Block_byref_object_dispose__24;
  id v24 = 0;
  dispatch_group_enter(v2);
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__24;
  v17[4] = __Block_byref_object_dispose__24;
  id v18 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__WBSHistoryServiceStore_loadWithCompletionHandler___block_invoke_13;
  v13[3] = &unk_1E5C9CE98;
  v13[4] = v3;
  long long v15 = &v19;
  long long v16 = v17;
  id v5 = v2;
  id v14 = v5;
  [v3 _connectWithOptions:v4 completionHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__WBSHistoryServiceStore_loadWithCompletionHandler___block_invoke_15;
  v12[3] = &unk_1E5C9B080;
  v12[4] = *(void *)(a1 + 32);
  if ((waitForGroupOrStopCondition(v5, (uint64_t)v12) & 1) == 0)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:89 userInfo:0];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
LABEL_8:

    goto LABEL_9;
  }
  if (!v20[5])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__WBSHistoryServiceStore_loadWithCompletionHandler___block_invoke_18;
    block[3] = &unk_1E5C8C9F8;
    block[4] = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    dispatch_block_t v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
    _os_activity_initiate(&dword_1A6B5F000, "Load history", OS_ACTIVITY_FLAG_DETACHED, v9);

    uint64_t v8 = v11;
    goto LABEL_8;
  }
  id v6 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend((id)v20[5], "safari_privacyPreservingDescription");
    objc_claimAutoreleasedReturnValue();
    __52__WBSHistoryServiceStore_loadWithCompletionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_9:

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);
}

- (void)_connectWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [[WBSHistoryServiceDatabaseDelegateWeakProxy alloc] initWithDelegate:self];
  connection = self->_connection;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__WBSHistoryServiceStore__connectWithOptions_completionHandler___block_invoke;
  v13[3] = &unk_1E5C9CE70;
  id v10 = v7;
  id v16 = v10;
  v13[4] = self;
  id v11 = v6;
  id v14 = v11;
  long long v15 = v8;
  uint64_t v12 = v8;
  [(WBSHistoryConnectionProxy *)connection connectWithOptions:v11 delegate:v12 completionHandler:v13];
}

void __32__WBSHistoryServiceStore__load___block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __32__WBSHistoryServiceStore__load___block_invoke_38_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), a2);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __80__WBSHistoryServiceStore__databaseFetchWithOptions_predicate_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __80__WBSHistoryServiceStore__databaseFetchWithOptions_predicate_completionHandler___block_invoke_2;
    v12[3] = &unk_1E5C9B058;
    id v9 = v6;
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(a1 + 40);
    id v13 = v9;
    uint64_t v14 = v10;
    id v15 = v11;
    id v16 = *(id *)(a1 + 48);
    dispatch_async(v8, v12);
  }
}

void __32__WBSHistoryServiceStore__load___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __32__WBSHistoryServiceStore__load___block_invoke_32_cold_2();
    }
  }
  else
  {
    uint64_t v8 = [v5 fileDescriptor];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __32__WBSHistoryServiceStore__load___block_invoke_33;
    v11[3] = &unk_1E5C9CF38;
    id v12 = *(id *)(a1 + 32);
    SafariShared::ReadStreamedDomainExpansions(v8, v11);
  }
  id v9 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) timeIntervalSinceNow];
    __32__WBSHistoryServiceStore__load___block_invoke_32_cold_1(v10);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_4_cold_1();
    }
LABEL_12:

    goto LABEL_13;
  }
  if ([v5 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(a1 + 32), "handleEvent:completionHandler:", MEMORY[0x1E4F143A8], 3221225472, __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_78, &unk_1E5C9D1B0, *(void *)(a1 + 32), *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
    goto LABEL_12;
  }
LABEL_13:
}

void __64__WBSHistoryServiceStore__connectWithOptions_completionHandler___block_invoke_11(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  if (objc_msgSend(v8, "safari_isSQLiteCorruptionError"))
  {
    uint64_t v9 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __64__WBSHistoryServiceStore__connectWithOptions_completionHandler___block_invoke_11_cold_1();
    }

    double v10 = (void *)a1[4];
    if (v10)
    {
      uint64_t v11 = [v10 mutableCopy];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    }
    long long v12 = (void *)v11;
    long long v13 = WBSHistoryInMemoryDatabaseURL();
    [v12 setObject:v13 forKeyedSubscript:@"WBSHistoryConnectionOptionDatabaseURL"];

    [*(id *)(a1[5] + 32) connectWithOptions:v12 delegate:a1[6] completionHandler:a1[7]];
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

void __58__WBSHistoryServiceStore__loadOnDatabaseQueue_readHandle___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 48))
  {
    uint64_t v4 = (void *)[objc_alloc(*(Class *)(*(void *)(a1 + 32) + 8)) initWithHistoryStreamedItem:a2];
    if (v4)
    {
      [*(id *)(*(void *)(a1 + 32) + 48) setItem:v4 forID:*(void *)(a2 + 8)];
      [*(id *)(a1 + 40) addObject:v4];
    }
    else
    {
      id v6 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_INFO, "Failed to create WBSHistoryItem", v7, 2u);
      }
    }
  }
  else
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __58__WBSHistoryServiceStore__loadOnDatabaseQueue_readHandle___block_invoke_cold_1();
    }
  }
}

void __58__WBSHistoryServiceStore__loadOnDatabaseQueue_readHandle___block_invoke_24(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 48) itemForID:*(void *)(a2 + 16)];
  if (v4)
  {
    id v5 = [[WBSHistoryVisit alloc] initWithHistoryItem:v4 streamedVisit:a2];
    if (v5)
    {
      [v4 updateLastVisitIfNil:v5];
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8) + 48;
      *(void *)&long long v11 = *(void *)(a2 + 8);
      id v7 = v5;
      *((void *)&v11 + 1) = v7;
      std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::__emplace_unique_key_args<long long,std::pair<long long,WBSHistoryItem * {__strong}>>(v6, (unint64_t *)&v11, (uint64_t *)&v11);

      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "setVisit:forID:", v7, *(void *)(a2 + 8), (void)v11);
    }
    else
    {
      double v10 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_INFO, "Failed to create WBSHistoryVisit", (uint8_t *)&v11, 2u);
      }
    }
  }
  else
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a2 + 16);
      LODWORD(v11) = 134217984;
      *(void *)((char *)&v11 + 4) = v9;
      _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_INFO, "Failed to retrieve item %lli", (uint8_t *)&v11, 0xCu);
    }
  }
}

BOOL __58__WBSHistoryServiceStore__loadOnDatabaseQueue_readHandle___block_invoke_27(uint64_t a1)
{
  unint64_t v1 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 24));
  return v1 == 2;
}

void __32__WBSHistoryServiceStore__load___block_invoke_33(uint64_t a1, uint64_t a2)
{
  id v5 = [NSString stringWithUTF8String:*(void *)(a2 + 8)];
  if (*(uint64_t *)(a2 + 16) >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      [*(id *)(a1 + 32) addObject:v5];
      ++v4;
    }
    while (v4 < *(void *)(a2 + 16));
  }
}

- (void)waitForLoadingToComplete
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__51;
  uint64_t v9 = __Block_byref_object_dispose__52;
  id v10 = 0;
  databaseQueue = self->_databaseQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__WBSHistoryServiceStore_waitForLoadingToComplete__block_invoke;
  v4[3] = &unk_1E5C8E190;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(databaseQueue, v4);
  uint64_t v3 = v6[5];
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  _Block_object_dispose(&v5, 8);
}

void __50__WBSHistoryServiceStore_waitForLoadingToComplete__block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1AD0C4F80](*(void *)(*(void *)(a1 + 32) + 72));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __80__WBSHistoryServiceStore__databaseFetchWithOptions_predicate_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 48) itemForID:*(void *)(a2 + 8)];
  if (v4)
  {
    id v8 = v4;
    [v4 updateWithStreamedItem:a2];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v7 = [NSString stringWithUTF8String:*(void *)(a2 + 48)];
    id v8 = [v5 historyStore:v6 itemForURLString:v7 createIfNeeded:1];

    if (v8)
    {
      [v8 updateWithStreamedItem:a2];
      [*(id *)(*(void *)(a1 + 32) + 48) setItem:v8 forID:*(void *)(a2 + 8)];
    }
    else
    {
      id v8 = 0;
    }
  }
}

void __80__WBSHistoryServiceStore__databaseFetchWithOptions_predicate_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 48) visitForID:*(void *)(a2 + 8)];
  if (!v4)
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 48) itemForID:*(void *)(a2 + 16)];
    if (v6)
    {
      uint64_t v5 = [[WBSHistoryVisit alloc] initWithHistoryItem:v6 streamedVisit:a2];
      if (v5)
      {
        [*(id *)(a1 + 40) addObject:v5];
        [*(id *)(*(void *)(a1 + 32) + 48) setVisit:v5 forID:*(void *)(a2 + 8)];
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v12 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        uint64_t v9 = "Failed to create WBSHistoryVisit";
        id v10 = v12;
        uint32_t v11 = 2;
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v7 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void *)(a2 + 16);
        int v13 = 134217984;
        uint64_t v14 = v8;
        uint64_t v9 = "Failed to retrieve item %lli";
        id v10 = v7;
        uint32_t v11 = 12;
LABEL_10:
        _os_log_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v13, v11);
      }
    }
    uint64_t v5 = 0;
    goto LABEL_12;
  }
  [*(id *)(a1 + 40) addObject:v4];
  uint64_t v5 = (WBSHistoryVisit *)v4;
LABEL_13:
}

- (id)_fetchVisitsOnDatabaseQueue:(unint64_t)a3 predicate:(id)a4 error:(id *)a5
{
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__24;
  int v27 = __Block_byref_object_dispose__24;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__24;
  uint64_t v21 = __Block_byref_object_dispose__24;
  id v22 = 0;
  unint64_t v7 = a3 & 0xB;
  id v8 = a4;
  uint64_t v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__WBSHistoryServiceStore__fetchVisitsOnDatabaseQueue_predicate_error___block_invoke;
  v13[3] = &unk_1E5C9D050;
  uint64_t v15 = &v17;
  uint64_t v16 = &v23;
  uint64_t v14 = v9;
  id v10 = v9;
  [(WBSHistoryServiceStore *)self _databaseFetchWithOptions:v7 predicate:v8 completionHandler:v13];

  dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (a5) {
    *a5 = (id) v18[5];
  }
  id v11 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __70__WBSHistoryServiceStore__fetchVisitsOnDatabaseQueue_predicate_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)getVisitsCreatedAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[WBSHistoryVisitsInTimeRangePredicate alloc] initWithStartDate:v8 endDate:v9 urlString:0 urlHash:0 urlSalt:0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__WBSHistoryServiceStore_getVisitsCreatedAfterDate_beforeDate_completionHandler___block_invoke;
  v13[3] = &unk_1E5C9D078;
  id v12 = v10;
  id v14 = v12;
  [(WBSHistoryServiceStore *)self _databaseFetchWithOptions:2 predicate:v11 completionHandler:v13];
}

void __81__WBSHistoryServiceStore_getVisitsCreatedAfterDate_beforeDate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    unint64_t v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __81__WBSHistoryServiceStore_getVisitsCreatedAfterDate_beforeDate_completionHandler___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkIfLocalVisitExistsInAnyOfItems:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "safari_arrayByMappingObjectsUsingBlock:", &__block_literal_global_68);
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__WBSHistoryServiceStore_checkIfLocalVisitExistsInAnyOfItems_withCompletion___block_invoke_2;
  block[3] = &unk_1E5C8D730;
  block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(databaseQueue, block);
}

id __77__WBSHistoryServiceStore_checkIfLocalVisitExistsInAnyOfItems_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "databaseID"));

  return v3;
}

void __77__WBSHistoryServiceStore_checkIfLocalVisitExistsInAnyOfItems_withCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) databaseProxy];
  [v2 checkIfLocalVisitExistsForDatabaseIDs:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
}

- (void)getHighLevelHTTPFamilyDomainsVisitedAfterDate:(id)a3 beforeDate:(id)a4 onlyFromThisDevice:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __120__WBSHistoryServiceStore_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke;
  v16[3] = &unk_1E5C9D0C0;
  id v18 = v11;
  id v19 = v12;
  id v17 = v10;
  BOOL v20 = a5;
  id v13 = v11;
  id v14 = v10;
  id v15 = v12;
  [(WBSHistoryServiceStore *)self _waitForDatabase:v16];
}

void __120__WBSHistoryServiceStore_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __120__WBSHistoryServiceStore_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke_2;
    v7[3] = &unk_1E5C9D078;
    id v8 = *(id *)(a1 + 48);
    [v3 getHighLevelHTTPFamilyDomainsVisitedAfterDate:v4 beforeDate:v5 onlyFromThisDevice:v6 completionHandler:v7];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __120__WBSHistoryServiceStore_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __120__WBSHistoryServiceStore_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke_2_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removePastHistoryVisitsForItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke;
  block[3] = &unk_1E5C8CA20;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(databaseQueue, block);
}

void __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke(id *a1)
{
  id v2 = [a1[4] urlString];
  if (v2)
  {
    id v3 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v4 = [[WBSHistoryServiceURLRepresentation alloc] initWithURLString:v2];
    id v5 = [v3 setWithObject:v4];

    id v6 = [MEMORY[0x1E4F1C9C8] distantPast];
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    id v8 = (void *)MEMORY[0x1E4F1C9C8];
    id v9 = [a1[4] lastVisitOnSynchronizationQueue];
    [v9 visitTime];
    id v10 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");

    uint64_t v11 = [v7 compare:v10];
    id v12 = [a1[5] databaseProxy];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke_60;
    v20[3] = &unk_1E5C9D0E8;
    id v13 = v2;
    id v21 = v13;
    id v22 = a1[6];
    [v12 clearHistoryItems:v5 afterDate:v6 beforeDate:v7 tombstoneMode:1 completionHandler:v20];

    if (v11 == -1)
    {
      id v14 = [a1[5] databaseProxy];
      id v15 = [MEMORY[0x1E4F1C9C8] distantFuture];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke_62;
      v18[3] = &unk_1E5C8D348;
      id v19 = v13;
      [v14 clearHistoryItems:v5 afterDate:v6 beforeDate:v15 tombstoneMode:0 completionHandler:v18];
    }
  }
  else
  {
    uint64_t v16 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke_cold_1();
    }
    id v17 = (void (**)(void))a1[6];
    if (v17) {
      v17[2]();
    }
  }
}

void __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke_60(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke_60_cold_1();
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

void __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke_62(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke_62_cold_1();
    }
  }
}

- (void)visitsWereAdded:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  uint64_t v5 = WBSHistoryItemSynchronizationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__WBSHistoryServiceStore_visitsWereAdded___block_invoke;
  v7[3] = &unk_1E5C8D980;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __42__WBSHistoryServiceStore_visitsWereAdded___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42__WBSHistoryServiceStore_visitsWereAdded___block_invoke_2;
  v2[3] = &unk_1E5C9D110;
  unint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _waitForDatabase:v2];
}

void __42__WBSHistoryServiceStore_visitsWereAdded___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v18 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v3)
  {
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v6 = [v5 item];
        id v7 = [WBSHistoryVisitIdentifier alloc];
        id v8 = [v6 urlString];
        [v5 visitTime];
        id v9 = -[WBSHistoryVisitIdentifier initWithURLString:visitTime:](v7, "initWithURLString:visitTime:", v8);

        id v10 = [v5 redirectSource];
        if (v10)
        {
          uint64_t v11 = [WBSHistoryVisitIdentifier alloc];
          id v12 = [v10 item];
          id v13 = [v12 urlString];
          [v10 visitTime];
          id v14 = -[WBSHistoryVisitIdentifier initWithURLString:visitTime:](v11, "initWithURLString:visitTime:", v13);
        }
        else
        {
          id v14 = 0;
        }

        id v15 = [v5 title];
        objc_msgSend(v18, "recordVisitWithIdentifier:sourceVisit:title:wasHTTPNonGet:loadSuccessful:origin:attributes:statusCode:completionHandler:", v9, v14, v15, objc_msgSend(v5, "wasHTTPNonGet"), objc_msgSend(v5, "loadWasSuccessful"), objc_msgSend(v5, "origin"), objc_msgSend(v5, "attributes"), objc_msgSend(v6, "statusCode"), &__block_literal_global_65);
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v3);
  }
}

void __42__WBSHistoryServiceStore_visitsWereAdded___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __42__WBSHistoryServiceStore_visitsWereAdded___block_invoke_3_cold_1();
    }
  }
}

- (void)visitTitleWasUpdated:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [(WBSHistoryServiceStore *)self visitsWereModified:v5];

  id v6 = [WBSHistoryVisitIdentifier alloc];
  id v7 = [v4 item];
  id v8 = [v7 urlString];
  [v4 visitTime];
  id v9 = -[WBSHistoryVisitIdentifier initWithURLString:visitTime:](v6, "initWithURLString:visitTime:", v8);

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__WBSHistoryServiceStore_visitTitleWasUpdated___block_invoke;
  v12[3] = &unk_1E5C9D138;
  id v13 = v9;
  id v10 = v4;
  id v14 = v10;
  uint64_t v11 = v9;
  [(WBSHistoryServiceStore *)self _waitForDatabase:v12];
}

void __47__WBSHistoryServiceStore_visitTitleWasUpdated___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) title];
  [v5 updateVisitWithIdentifier:v3 title:v4 completionHandler:&__block_literal_global_68];
}

void __47__WBSHistoryServiceStore_visitTitleWasUpdated___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __47__WBSHistoryServiceStore_visitTitleWasUpdated___block_invoke_2_cold_1();
    }
  }
}

- (void)visitAttributeWasUpdated:(id)a3 removeAttributes:(unint64_t)a4 addAttributes:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [WBSHistoryVisitIdentifier alloc];
  id v10 = [v8 item];
  uint64_t v11 = [v10 urlString];
  [v8 visitTime];
  id v12 = -[WBSHistoryVisitIdentifier initWithURLString:visitTime:](v9, "initWithURLString:visitTime:", v11);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__WBSHistoryServiceStore_visitAttributeWasUpdated_removeAttributes_addAttributes___block_invoke;
  v14[3] = &unk_1E5C9D160;
  id v15 = v12;
  unint64_t v16 = a4;
  unint64_t v17 = a5;
  id v13 = v12;
  [(WBSHistoryServiceStore *)self _waitForDatabase:v14];
}

uint64_t __82__WBSHistoryServiceStore_visitAttributeWasUpdated_removeAttributes_addAttributes___block_invoke(void *a1, void *a2)
{
  return [a2 updateVisitWithIdentifier:a1[4] removeAttributes:a1[5] addAttributes:a1[6] completionHandler:&__block_literal_global_70_0];
}

void __82__WBSHistoryServiceStore_visitAttributeWasUpdated_removeAttributes_addAttributes___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __82__WBSHistoryServiceStore_visitAttributeWasUpdated_removeAttributes_addAttributes___block_invoke_2_cold_1();
    }
  }
}

- (void)clearHistoryWithCompletionHandler:(id)a3
{
  id v3 = a3;
  operator new();
}

void __60__WBSHistoryServiceStore_clearHistoryWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(id **)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) databaseProxy];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [v3 clearAllHistoryInsertingTombstoneUpToDate:v4 clearAllSpotlightHistoryForProfile:1 completionHandler:&__block_literal_global_72_0];

  [*(id *)(*(void *)(a1 + 32) + 48) clear];
  if (*(void *)(a1 + 40)) {
    dispatch_async(MEMORY[0x1E4F14428], *(dispatch_block_t *)(a1 + 40));
  }
  if (v2)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v2);
    JUMPOUT(0x1AD0C4750);
  }
}

void __60__WBSHistoryServiceStore_clearHistoryWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __60__WBSHistoryServiceStore_clearHistoryWithCompletionHandler___block_invoke_2_cold_1();
    }
  }
}

- (void)vacuumHistoryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__WBSHistoryServiceStore_vacuumHistoryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

void __61__WBSHistoryServiceStore_vacuumHistoryWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) databaseProxy];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__WBSHistoryServiceStore_vacuumHistoryWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E5C8D8B8;
  id v4 = *(id *)(a1 + 40);
  [v2 vacuumHistoryWithCompletionHandler:v3];
}

void __61__WBSHistoryServiceStore_vacuumHistoryWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __61__WBSHistoryServiceStore_vacuumHistoryWithCompletionHandler___block_invoke_2_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearHistoryVisitsAddedAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  databaseQueue = self->_databaseQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __88__WBSHistoryServiceStore_clearHistoryVisitsAddedAfterDate_beforeDate_completionHandler___block_invoke;
  v15[3] = &unk_1E5C9CD98;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(databaseQueue, v15);
}

void __88__WBSHistoryServiceStore_clearHistoryVisitsAddedAfterDate_beforeDate_completionHandler___block_invoke(uint64_t a1)
{
  id v3 = (uint64_t *)(a1 + 32);
  id v2 = *(void **)(a1 + 32);
  if (v2 && *(void *)(a1 + 40) && objc_msgSend(v2, "compare:") == -1)
  {
    id v5 = [*(id *)(a1 + 48) databaseProxy];
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __88__WBSHistoryServiceStore_clearHistoryVisitsAddedAfterDate_beforeDate_completionHandler___block_invoke_73;
    v15[3] = &unk_1E5C9D188;
    id v16 = v6;
    id v17 = *(id *)(a1 + 40);
    id v18 = *(id *)(a1 + 56);
    [v5 clearHistoryVisitsAddedAfterDate:v16 beforeDate:v7 tombstoneMode:1 clearAllSpotlightHistoryForProfile:0 completionHandler:v15];

    id v8 = [MEMORY[0x1E4F1C9C8] distantFuture];
    id v9 = [*(id *)(a1 + 48) databaseProxy];
    id v10 = (void *)*v3;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __88__WBSHistoryServiceStore_clearHistoryVisitsAddedAfterDate_beforeDate_completionHandler___block_invoke_74;
    v12[3] = &unk_1E5C9D1B0;
    id v13 = v10;
    id v11 = v8;
    id v14 = v11;
    [v9 clearHistoryVisitsAddedAfterDate:v13 beforeDate:v11 tombstoneMode:0 clearAllSpotlightHistoryForProfile:0 completionHandler:v12];
  }
  else
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __88__WBSHistoryServiceStore_clearHistoryVisitsAddedAfterDate_beforeDate_completionHandler___block_invoke_cold_1(v3, a1, v4);
    }
    if (*(void *)(a1 + 56)) {
      dispatch_async(MEMORY[0x1E4F14428], *(dispatch_block_t *)(a1 + 56));
    }
  }
}

void __88__WBSHistoryServiceStore_clearHistoryVisitsAddedAfterDate_beforeDate_completionHandler___block_invoke_73(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v7 = objc_msgSend(v3, "safari_privacyPreservingDescription");
      int v8 = 138412802;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      __int16 v12 = 2114;
      id v13 = v7;
      _os_log_fault_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_FAULT, "Failed to perform history maintenance between %@ - %@: %{public}@", (uint8_t *)&v8, 0x20u);
    }
  }
  if (*(void *)(a1 + 48)) {
    dispatch_async(MEMORY[0x1E4F14428], *(dispatch_block_t *)(a1 + 48));
  }
}

void __88__WBSHistoryServiceStore_clearHistoryVisitsAddedAfterDate_beforeDate_completionHandler___block_invoke_74(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v7 = objc_msgSend(v3, "safari_privacyPreservingDescription");
      int v8 = 138412802;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      __int16 v12 = 2114;
      id v13 = v7;
      _os_log_error_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_ERROR, "Failed to perform history maintenance between %@ - %@: %{public}@", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (void)exportHistory:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__WBSHistoryServiceStore_exportHistory_completionHandler___block_invoke;
  block[3] = &unk_1E5C8D730;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(databaseQueue, block);
}

void __58__WBSHistoryServiceStore_exportHistory_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) databaseProxy];
  [v2 exportHistory:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

void __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke(uint64_t a1)
{
  if (objc_loadWeakRetained((id *)(a1 + 32))) {
    operator new();
  }
}

uint64_t __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_3;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  unint64_t v1 = *(void **)(a1 + 32);
  void v3[4] = *(void *)(a1 + 40);
  return [v1 _performMaintenance:v3];
}

id *__46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_3(uint64_t a1)
{
  result = *(id **)(a1 + 32);
  if (result)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(result);
    JUMPOUT(0x1AD0C4750);
  }
  return result;
}

void __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_78(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v4 = [*(id *)(a1 + 32) databaseProxy];
    uint64_t v5 = -[WBSSetInt64 initWithInt64:]([WBSSetInt64 alloc], "initWithInt64:", [*(id *)(a1 + 40) eventID]);
    [v4 markEventsAsReceivedByListener:@"Safari" eventIDs:v5 completionHandler:&__block_literal_global_82];

    id v3 = 0;
  }
}

void __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_2_80(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_2_80_cold_1();
    }
  }
}

- (void)_expireOldVisits
{
  id v3 = [(WBSHistoryServiceStore *)self databaseProxy];
  +[WBSHistoryItem timeIntervalForDailyAndWeeklyVisitCountScores];
  [v3 expireOldVisits:&__block_literal_global_85 completionHandler:v2 + v2];
}

void __42__WBSHistoryServiceStore__expireOldVisits__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __42__WBSHistoryServiceStore__expireOldVisits__block_invoke_cold_1();
    }
  }
}

- (double)_ageLimitSinceReferenceDate
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return v3 - self->_historyAgeLimit;
}

- (void)_updateLastMaintenanceDate
{
  id v5 = [(WBSHistoryServiceStore *)self databaseProxy];
  double v3 = NSNumber;
  [(NSDate *)self->_lastMaintenanceDate timeIntervalSinceReferenceDate];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  [v5 setMetadataValue:v4 forKey:@"last_maintenance_date" completionHandler:&__block_literal_global_87];
}

void __52__WBSHistoryServiceStore__updateLastMaintenanceDate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    double v3 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __52__WBSHistoryServiceStore__updateLastMaintenanceDate__block_invoke_cold_1();
    }
  }
}

- (void)_performMaintenance:(id)a3
{
  id v4 = a3;
  unint64_t v5 = atomic_load((unint64_t *)&self->_state);
  if (v5 != 2)
  {
    id v6 = [(WBSHistoryServiceStore *)self databaseProxy];
    [(WBSHistoryServiceStore *)self _ageLimitSinceReferenceDate];
    double v8 = v7;
    unint64_t itemCountLimit = self->_itemCountLimit;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__WBSHistoryServiceStore__performMaintenance___block_invoke;
    v10[3] = &unk_1E5C9D200;
    void v10[4] = self;
    id v11 = v4;
    [v6 performMaintenanceWithAgeLimit:itemCountLimit itemCountLimit:v10 completionHandler:v8];
  }
}

void __46__WBSHistoryServiceStore__performMaintenance___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__WBSHistoryServiceStore__performMaintenance___block_invoke_2;
  v3[3] = &unk_1E5C8C9F8;
  void v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __46__WBSHistoryServiceStore__performMaintenance___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;

  [*(id *)(a1 + 32) _updateLastMaintenanceDate];
  if (*(void *)(a1 + 40))
  {
    unint64_t v5 = *(void **)(a1 + 40);
    id v6 = MEMORY[0x1E4F14428];
    dispatch_async(v6, v5);
  }
}

- (void)performMaintenance:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__WBSHistoryServiceStore_performMaintenance___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

void __45__WBSHistoryServiceStore_performMaintenance___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) databaseProxy];

  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 _performMaintenance:v4];
  }
  else if (*(void *)(a1 + 40))
  {
    unint64_t v5 = *(void **)(a1 + 40);
    id v6 = MEMORY[0x1E4F14428];
    dispatch_async(v6, v5);
  }
}

- (void)closeWithCompletionHandler:(id)a3
{
  unint64_t v5 = (void (**)(void))a3;
  atomic_store(2uLL, (unint64_t *)&self->_state);
  [(WBSPeriodicActivityScheduler *)self->_maintenanceScheduler invalidate];
  maintenanceScheduler = self->_maintenanceScheduler;
  self->_maintenanceScheduler = 0;

  if (v5) {
    v5[2]();
  }
}

- (void)addAutocompleteTrigger:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBSHistoryServiceStore *)self databaseProxy];
  id v9 = [v7 urlString];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__WBSHistoryServiceStore_addAutocompleteTrigger_forItem___block_invoke;
  v12[3] = &unk_1E5C9D1B0;
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [v8 addAutocompleteTrigger:v10 forURL:v9 completionHandler:v12];
}

void __57__WBSHistoryServiceStore_addAutocompleteTrigger_forItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __57__WBSHistoryServiceStore_addAutocompleteTrigger_forItem___block_invoke_cold_1();
    }

    unint64_t v5 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = [*(id *)(a1 + 40) urlString];
      id v8 = objc_msgSend(v3, "safari_privacyPreservingDescription");
      int v9 = 138478339;
      uint64_t v10 = v6;
      __int16 v11 = 2113;
      id v12 = v7;
      __int16 v13 = 2114;
      id v14 = v8;
      _os_log_debug_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_DEBUG, "Failed to add autocomplete trigger %{private}@ for %{private}@: %{public}@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)getAutocompleteTriggersForItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(WBSHistoryServiceStore *)self databaseProxy];
    int v9 = [v6 urlString];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75__WBSHistoryServiceStore_getAutocompleteTriggersForItem_completionHandler___block_invoke;
    v10[3] = &unk_1E5C9D228;
    id v11 = v6;
    id v12 = v7;
    [v8 fetchAutocompleteTriggersForURLString:v9 completionHandler:v10];
  }
}

void __75__WBSHistoryServiceStore_getAutocompleteTriggersForItem_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __75__WBSHistoryServiceStore_getAutocompleteTriggersForItem_completionHandler___block_invoke_cold_2();
    }

    id v8 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      [*(id *)(a1 + 32) urlString];
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __75__WBSHistoryServiceStore_getAutocompleteTriggersForItem_completionHandler___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getItemCountBeforeDate:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(WBSHistoryServiceStore *)self databaseProxy];
  [v7 getItemCountBeforeDate:v8 completionHandler:v6];
}

- (void)_fetchTags:(unint64_t)a3 fromStartDate:(id)a4 toEndDate:(id)a5 withIdentifiers:(id)a6 limit:(unint64_t)a7 minimumItemCount:(unint64_t)a8 sortOrder:(int64_t)a9 completionHandler:(id)a10
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a10;
  long long v20 = [(WBSHistoryServiceStore *)self databaseProxy];

  if (v20)
  {
    long long v21 = [[WBSHistoryTagsPredicate alloc] initWithStartDate:v16 endDate:v17 tagType:a3];
    [(WBSHistoryTagsPredicate *)v21 setLimit:a7];
    [(WBSHistoryTagsPredicate *)v21 setMinimumItemCount:a8];
    [(WBSHistoryTagsPredicate *)v21 setSortOrder:a9];
    if ([v18 count]) {
      [(WBSHistoryTagsPredicate *)v21 setIdentifiers:v18];
    }
    long long v22 = [(WBSHistoryServiceStore *)self databaseProxy];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __128__WBSHistoryServiceStore__fetchTags_fromStartDate_toEndDate_withIdentifiers_limit_minimumItemCount_sortOrder_completionHandler___block_invoke;
    v23[3] = &unk_1E5C9D2D8;
    id v24 = v19;
    [v22 fetchWithOptions:32 predicate:v21 completionHandler:v23];
  }
  else
  {
    long long v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSHistoryErrorDomain" code:4 userInfo:0];
    (*((void (**)(id, void, WBSHistoryTagsPredicate *))v19 + 2))(v19, 0, v21);
  }
}

void __128__WBSHistoryServiceStore__fetchTags_fromStartDate_toEndDate_withIdentifiers_limit_minimumItemCount_sortOrder_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v9 = [v6 fileDescriptor];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __128__WBSHistoryServiceStore__fetchTags_fromStartDate_toEndDate_withIdentifiers_limit_minimumItemCount_sortOrder_completionHandler___block_invoke_4;
    v11[3] = &unk_1E5C9D290;
    id v10 = v8;
    id v12 = v10;
    SafariShared::ReadStreamedObjects(v9, &__block_literal_global_92_0, &__block_literal_global_94_1, v11, &__block_literal_global_99, 0);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __128__WBSHistoryServiceStore__fetchTags_fromStartDate_toEndDate_withIdentifiers_limit_minimumItemCount_sortOrder_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v7 = [NSString stringWithUTF8String:*(void *)(a2 + 40)];
  uint64_t v4 = [NSString stringWithUTF8String:*(void *)(a2 + 32)];
  if (*(void *)(a2 + 16) == 1)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [[WBSHistoryTopicTag alloc] initWithTitle:v7 identifier:v4 databaseID:*(void *)(a2 + 8) modificationTimestamp:*(void *)(a2 + 24) level:*(double *)(a2 + 48)];
    [v5 addObject:v6];
  }
}

- (void)_createTagsForIdentifiers:(id)a3 withTitles:(id)a4 type:(unint64_t)a5 level:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v15 = [(WBSHistoryServiceStore *)self databaseProxy];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92__WBSHistoryServiceStore__createTagsForIdentifiers_withTitles_type_level_completionHandler___block_invoke;
  v19[3] = &unk_1E5C9D300;
  id v16 = v14;
  id v22 = v16;
  id v17 = v12;
  id v20 = v17;
  id v18 = v13;
  id v21 = v18;
  unint64_t v23 = a5;
  int64_t v24 = a6;
  [v15 createTagsForIdentifiers:v17 withTitles:v18 type:a5 level:a6 completionHandler:v19];
}

void __92__WBSHistoryServiceStore__createTagsForIdentifiers_withTitles_type_level_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if (v15)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v8 = v7;
    for (unint64_t i = 0; i < [v15 count]; ++i)
    {
      id v10 = [v15 objectAtIndexedSubscript:i];
      uint64_t v11 = [v10 longLongValue];

      id v12 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
      id v13 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
      if (*(void *)(a1 + 56) == 1)
      {
        id v14 = [[WBSHistoryTopicTag alloc] initWithTitle:v13 identifier:v12 databaseID:v11 modificationTimestamp:*(void *)(a1 + 64) level:v8];
        [v6 addObject:v14];
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)tagsWithIdentifiers:(id)a3 type:(unint64_t)a4 level:(int64_t)a5 creatingIfNecessary:(BOOL)a6 withTitles:(id)a7 completionHandler:(id)a8
{
  id v13 = a3;
  id v21 = a7;
  id v20 = a8;
  id v14 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v15 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v13];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __106__WBSHistoryServiceStore_tagsWithIdentifiers_type_level_creatingIfNecessary_withTitles_completionHandler___block_invoke;
  v22[3] = &unk_1E5C9D350;
  id v17 = v13;
  id v23 = v17;
  id v18 = v21;
  id v24 = v18;
  uint64_t v25 = self;
  unint64_t v27 = a4;
  int64_t v28 = a5;
  id v19 = v20;
  id v26 = v19;
  [(WBSHistoryServiceStore *)self _fetchTags:a4 fromStartDate:v14 toEndDate:v15 withIdentifiers:v16 limit:0 minimumItemCount:0 sortOrder:0 completionHandler:v22];
}

void __106__WBSHistoryServiceStore_tagsWithIdentifiers_type_level_creatingIfNecessary_withTitles_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v17 = a2;
  id v3 = (void *)[*(id *)(a1 + 32) mutableCopy];
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4) {
    id v5 = (void *)[v4 mutableCopy];
  }
  else {
    id v5 = 0;
  }
  if (*(void *)(a1 + 64) == 1) {
    id v6 = v17;
  }
  else {
    id v6 = 0;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = [*(id *)(*((void *)&v21 + 1) + 8 * v10) identifier];
        uint64_t v12 = [v3 indexOfObject:v11];

        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          [v3 removeObjectAtIndex:v12];
          [v5 removeObjectAtIndex:v12];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 72);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __106__WBSHistoryServiceStore_tagsWithIdentifiers_type_level_creatingIfNecessary_withTitles_completionHandler___block_invoke_2;
  v18[3] = &unk_1E5C9D328;
  id v15 = *(void **)(a1 + 48);
  id v20 = *(id *)(a1 + 56);
  id v16 = v7;
  id v19 = v16;
  [v15 _createTagsForIdentifiers:v3 withTitles:v5 type:v13 level:v14 completionHandler:v18];
}

uint64_t __106__WBSHistoryServiceStore_tagsWithIdentifiers_type_level_creatingIfNecessary_withTitles_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32), a3);
}

- (void)assignHistoryItem:(id)a3 toTopicTags:(id)a4 completionHandler:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void, void *))a5;
  uint64_t v10 = [(WBSHistoryServiceStore *)self databaseProxy];

  if (v10)
  {
    uint64_t v11 = [(WBSHistoryServiceStore *)self databaseProxy];
    uint64_t v12 = [v14 urlString];
    uint64_t v13 = WBSSetOfIdentifiersFromTags(v8);
    [v11 assignURLString:v12 toTopicTagsWithIDs:v13 completionHandler:v9];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSHistoryErrorDomain" code:4 userInfo:0];
    v9[2](v9, 0, v11);
  }
}

- (void)_fetchHistoryItemsForTopics:(id)a3 fromStartDate:(id)a4 toEndDate:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(WBSHistoryServiceStore *)self databaseProxy];

  if (v14)
  {
    id v15 = [[WBSHistoryItemToTagPairsPredicate alloc] initWithStartDate:v11 endDate:v12];
    id v16 = [(WBSHistoryServiceStore *)self databaseProxy];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __96__WBSHistoryServiceStore__fetchHistoryItemsForTopics_fromStartDate_toEndDate_completionHandler___block_invoke;
    v17[3] = &unk_1E5C9D028;
    id v19 = v13;
    v17[4] = self;
    id v18 = v10;
    [v16 fetchWithOptions:64 predicate:v15 completionHandler:v17];
  }
  else
  {
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSHistoryErrorDomain" code:4 userInfo:0];
    (*((void (**)(id, void, WBSHistoryItemToTagPairsPredicate *))v13 + 2))(v13, 0, v15);
  }
}

void __96__WBSHistoryServiceStore__fetchHistoryItemsForTopics_fromStartDate_toEndDate_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __96__WBSHistoryServiceStore__fetchHistoryItemsForTopics_fromStartDate_toEndDate_completionHandler___block_invoke_2;
    v11[3] = &unk_1E5C9B058;
    id v12 = *(id *)(a1 + 40);
    id v9 = v6;
    uint64_t v10 = *(void *)(a1 + 32);
    id v13 = v9;
    uint64_t v14 = v10;
    id v15 = *(id *)(a1 + 48);
    dispatch_async(v8, v11);
  }
}

uint64_t __96__WBSHistoryServiceStore__fetchHistoryItemsForTopics_fromStartDate_toEndDate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x5812000000;
  long long v24 = __Block_byref_object_copy__101_0;
  memset(v26, 0, sizeof(v26));
  uint64_t v25 = __Block_byref_object_dispose__102_0;
  uint64_t v27 = 0;
  int v28 = 1065353216;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v18 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v7 = v22;
        uint64_t v16 = [v6 databaseID];
        v29 = &v16;
        id v8 = (id *)std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t)(v7 + 6), (unint64_t *)&v16, (uint64_t)&std::piecewise_construct, &v29);
        objc_storeStrong(v8 + 3, v6);
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v30 count:16];
    }
    while (v3);
  }

  uint64_t v9 = [*(id *)(a1 + 40) fileDescriptor];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __96__WBSHistoryServiceStore__fetchHistoryItemsForTopics_fromStartDate_toEndDate_completionHandler___block_invoke_4;
  v15[3] = &unk_1E5C9D398;
  void v15[4] = *(void *)(a1 + 48);
  void v15[5] = &v21;
  SafariShared::ReadStreamedObjects(v9, &__block_literal_global_105, &__block_literal_global_108, &__block_literal_global_110, v15, 0);
  qos_class_t v10 = qos_class_self();
  id v11 = dispatch_get_global_queue(v10, 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__WBSHistoryServiceStore__fetchHistoryItemsForTopics_fromStartDate_toEndDate_completionHandler___block_invoke_5;
  v13[3] = &unk_1E5C8D5F0;
  id v14 = *(id *)(a1 + 56);
  dispatch_async(v11, v13);

  _Block_object_dispose(&v21, 8);
  return std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::~__hash_table((uint64_t)&v26[8]);
}

void __96__WBSHistoryServiceStore__fetchHistoryItemsForTopics_fromStartDate_toEndDate_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 48) itemForID:*(void *)(a2 + 8)];
  if (v4)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8) + 48;
    id v6 = (void *)(a2 + 16);
    objc_msgSend((id)std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>(v5, (unint64_t *)(a2 + 16), (uint64_t)&std::piecewise_construct, &v6)[3], "tagHistoryItem:", v4);
  }
}

uint64_t __96__WBSHistoryServiceStore__fetchHistoryItemsForTopics_fromStartDate_toEndDate_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchTopicsFromStartDate:(id)a3 toEndDate:(id)a4 completionHandler:(id)a5
{
}

- (void)fetchTopicsFromStartDate:(id)a3 toEndDate:(id)a4 limit:(unint64_t)a5 minimumItemCount:(unint64_t)a6 sortOrder:(int64_t)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __112__WBSHistoryServiceStore_fetchTopicsFromStartDate_toEndDate_limit_minimumItemCount_sortOrder_completionHandler___block_invoke;
  v20[3] = &unk_1E5C9D3E8;
  void v20[4] = self;
  id v21 = v14;
  id v22 = v15;
  id v23 = v16;
  id v17 = v15;
  id v18 = v14;
  id v19 = v16;
  [(WBSHistoryServiceStore *)self _fetchTags:1 fromStartDate:v18 toEndDate:v17 withIdentifiers:0 limit:a5 minimumItemCount:a6 sortOrder:a7 completionHandler:v20];
}

void __112__WBSHistoryServiceStore_fetchTopicsFromStartDate_toEndDate_limit_minimumItemCount_sortOrder_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __112__WBSHistoryServiceStore_fetchTopicsFromStartDate_toEndDate_limit_minimumItemCount_sortOrder_completionHandler___block_invoke_2;
    v10[3] = &unk_1E5C9D3C0;
    uint64_t v9 = *(void *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    id v11 = v5;
    [v7 _fetchHistoryItemsForTopics:v11 fromStartDate:v8 toEndDate:v9 completionHandler:v10];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __112__WBSHistoryServiceStore_fetchTopicsFromStartDate_toEndDate_limit_minimumItemCount_sortOrder_completionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v7 = v5;
  if (a2)
  {
    id v5 = 0;
    uint64_t v6 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v6 = 0;
  }
  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v6, v5);
}

- (void)setTitle:(id)a3 ofTag:(id)a4 completionHandler:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void, void *))a5;
  qos_class_t v10 = [(WBSHistoryServiceStore *)self databaseProxy];

  if (v10)
  {
    id v11 = [(WBSHistoryServiceStore *)self databaseProxy];
    objc_msgSend(v11, "setTitle:ofTagWithID:completionHandler:", v12, objc_msgSend(v8, "databaseID"), v9);
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSHistoryErrorDomain" code:4 userInfo:0];
    v9[2](v9, 0, v11);
  }
}

- (void)_setMetadataValue:(id)a3 forKey:(id)a4 group:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  qos_class_t v10 = a5;
  dispatch_group_enter(v10);
  id v11 = [(WBSHistoryServiceStore *)self databaseProxy];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __57__WBSHistoryServiceStore__setMetadataValue_forKey_group___block_invoke;
  v15[3] = &unk_1E5C9D410;
  id v12 = v9;
  id v16 = v12;
  id v13 = v8;
  id v17 = v13;
  id v14 = v10;
  id v18 = v14;
  [v11 setMetadataValue:v13 forKey:v12 completionHandler:v15];
}

void __57__WBSHistoryServiceStore__setMetadataValue_forKey_group___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      id v7 = objc_msgSend(v3, "safari_privacyPreservingDescription");
      int v8 = 138543874;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      __int16 v12 = 2114;
      id v13 = v7;
      _os_log_error_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_ERROR, "failed to update metadata %{public}@ to %@: %{public}@", (uint8_t *)&v8, 0x20u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (int64_t)_generateTemporaryDatabaseID
{
  int64_t nextTemporaryDatabaseID = self->_nextTemporaryDatabaseID;
  self->_int64_t nextTemporaryDatabaseID = nextTemporaryDatabaseID + 1;
  return nextTemporaryDatabaseID;
}

- (BOOL)_ensureItemHasID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && ![v4 databaseID])
  {
    objc_msgSend(v5, "setDatabaseID:", -[WBSHistoryServiceStore _generateTemporaryDatabaseID](self, "_generateTemporaryDatabaseID"));
    -[WBSHistoryObjectCache setItem:forID:](self->_cache, "setItem:forID:", v5, [v5 databaseID]);
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_ensureVisitHasID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && ![v4 databaseID])
  {
    objc_msgSend(v5, "setDatabaseID:", -[WBSHistoryServiceStore _generateTemporaryDatabaseID](self, "_generateTemporaryDatabaseID"));
    -[WBSHistoryObjectCache setVisit:forID:](self->_cache, "setVisit:forID:", v5, [v5 databaseID]);
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)reportPermanentIDsForItems:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__WBSHistoryServiceStore_reportPermanentIDsForItems_completionHandler___block_invoke;
  block[3] = &unk_1E5C8D730;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(databaseQueue, block);
}

uint64_t __71__WBSHistoryServiceStore_reportPermanentIDsForItems_completionHandler___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 48) changeItemIDs:a1[5]];
  id v2 = *(uint64_t (**)(void))(a1[6] + 16);
  return v2();
}

- (void)reportPermanentIDsForVisits:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__WBSHistoryServiceStore_reportPermanentIDsForVisits_completionHandler___block_invoke;
  block[3] = &unk_1E5C8D730;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(databaseQueue, block);
}

uint64_t __72__WBSHistoryServiceStore_reportPermanentIDsForVisits_completionHandler___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 48) changeVisitIDs:a1[5]];
  id v2 = *(uint64_t (**)(void))(a1[6] + 16);
  return v2();
}

- (void)reportSevereError:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained historyStoreDidFailDatabaseIntegrityCheck:self];

  v6[2]();
}

- (void)handleEvent:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_group_t v8 = dispatch_group_create();
  id v9 = [v6 value];
  id v10 = objc_msgSend(v9, "safari_dictionaryForKey:", @"disposedURLs");

  v35 = v10;
  if ([v10 count])
  {
    databaseQueue = self->_databaseQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke;
    block[3] = &unk_1E5C8D840;
    id v51 = v10;
    id v52 = self;
    v53 = v8;
    dispatch_group_async(v53, databaseQueue, block);
  }
  id v12 = [v6 value];
  id v13 = objc_msgSend(v12, "safari_arrayForKey:", @"disposedHostnames");

  id v34 = v13;
  if ([v13 count])
  {
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_4;
    v48[3] = &unk_1E5C8D980;
    v48[4] = self;
    id v49 = v13;
    dispatch_group_async(v8, MEMORY[0x1E4F14428], v48);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v15 = [v6 value];
  id v16 = objc_msgSend(v15, "safari_arrayForKey:", @"disposedHighLevelDomains");

  if ([v16 count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_5;
    v44[3] = &unk_1E5C8D840;
    id v45 = WeakRetained;
    v46 = self;
    id v47 = v16;
    dispatch_group_async(v8, MEMORY[0x1E4F14428], v44);
  }
  id v17 = [v6 value];
  id v18 = objc_msgSend(v17, "safari_arrayForKey:", @"disposedVisits");

  id v19 = [v6 value];
  long long v20 = objc_msgSend(v19, "safari_dictionaryForKey:", @"updateLatestVisits");

  if ([v18 count] || objc_msgSend(v20, "count"))
  {
    id v21 = self->_databaseQueue;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_6;
    v38[3] = &unk_1E5C9D460;
    id v39 = v18;
    v40 = self;
    id v41 = v6;
    id v42 = WeakRetained;
    id v43 = v20;
    dispatch_group_async(v8, v21, v38);
  }
  id v22 = [v6 eventType];
  int v23 = [v22 isEqualToString:@"clear"];

  if (v23)
  {
    id v33 = v7;
    long long v24 = [v6 value];
    uint64_t v25 = objc_msgSend(v24, "safari_dateForKey:", @"endDate");

    uint64_t v26 = [v6 value];
    uint64_t v27 = objc_msgSend(v26, "safari_dateForKey:", @"startDate");

    int v28 = [MEMORY[0x1E4F5CBA8] sharedInstance];
    v29 = v28;
    if (v27 && v25)
    {
      [v28 clearCompletionsFromDate:v27 toDate:v25];
    }
    else if (v25)
    {
      id v30 = [MEMORY[0x1E4F1C9C8] distantPast];
      [v29 clearCompletionsFromDate:v30 toDate:v25];
    }
    else
    {
      [v28 clearAllCompletions];
      [WeakRetained historyStoreWasCleared:self];
    }

    id v7 = v33;
  }
  uint64_t v31 = dispatch_get_global_queue(9, 0);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_7;
  v36[3] = &unk_1E5C8D5F0;
  id v37 = v7;
  id v32 = v7;
  dispatch_group_notify(v8, v31, v36);
}

void __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5C9D438;
  id v3 = *(void **)(a1 + 32);
  void v13[4] = *(void *)(a1 + 40);
  id v4 = v2;
  id v14 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v13];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 112));

  if (WeakRetained) {
    id v6 = [[WBSHistoryDeletionPlan alloc] initWithSQLiteStore:*(void *)(a1 + 40) discoveredItemsToDelete:v4];
  }
  else {
    id v6 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_3;
  block[3] = &unk_1E5C8D840;
  id v7 = *(NSObject **)(a1 + 48);
  void block[4] = *(void *)(a1 + 40);
  id v11 = v4;
  id v12 = v6;
  dispatch_group_t v8 = v6;
  id v9 = v4;
  dispatch_group_async(v7, MEMORY[0x1E4F14428], block);
}

void __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "itemForID:", objc_msgSend(v5, "longLongValue"));
  id v7 = *(void **)(a1 + 40);
  if (v6)
  {
    [*(id *)(a1 + 40) addObject:v6];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "removeItemWithID:", objc_msgSend(v5, "longLongValue"));
  }
  else
  {
    dispatch_group_t v8 = (void *)[objc_alloc(*(Class *)(*(void *)(a1 + 32) + 8)) initWithURLString:v9];
    [v7 addObject:v8];
  }
}

void __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
  if (WeakRetained)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) allObjects];
    [WeakRetained historyStore:v2 didRemoveItems:v3];

    if (*(void *)(a1 + 48)) {
      objc_msgSend(WeakRetained, "historyStore:didPrepareToDeleteWithDeletionPlan:", *(void *)(a1 + 32));
    }
  }
}

void __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
  [WeakRetained historyStore:*(void *)(a1 + 32) didRemoveHostnames:*(void *)(a1 + 40)];
}

uint64_t __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) historyStore:*(void *)(a1 + 40) didRemoveHighLevelDomains:*(void *)(a1 + 48)];
}

void __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  v55 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v54 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v72 objects:v80 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v73 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "visitForID:", objc_msgSend(*(id *)(*((void *)&v72 + 1) + 8 * i), "longLongValue"));
        if (v6) {
          [v55 addObject:v6];
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v72 objects:v80 count:16];
    }
    while (v3);
  }

  id v7 = [*(id *)(a1 + 48) value];
  dispatch_group_t v8 = objc_msgSend(v7, "safari_dictionaryForKey:", @"updateItems");

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v68 objects:v79 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v69;
    while (2)
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        if (*(void *)v69 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v68 + 1) + 8 * j);
        id v13 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "itemForID:", objc_msgSend(v12, "longLongValue"));
        if (!v13)
        {
          id v14 = [obj objectForKeyedSubscript:v12];
          id v15 = *(void **)(a1 + 56);
          uint64_t v16 = *(void *)(a1 + 40);
          id v17 = [v14 url];
          id v13 = [v15 historyStore:v16 itemForURLString:v17 createIfNeeded:1];

          if (!v13)
          {
            id v19 = obj;
            goto LABEL_69;
          }
          [v13 updateWithServiceItem:v14];
          objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "setItem:forID:", v13, objc_msgSend(v12, "longLongValue"));
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v68 objects:v79 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v18 = [*(id *)(a1 + 48) value];
  id v51 = objc_msgSend(v18, "safari_dictionaryForKey:", @"updateVisits");

  id v52 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v51, "count"));
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v19 = v51;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v64 objects:v78 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v65;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v65 != v21) {
          objc_enumerationMutation(v19);
        }
        int v23 = *(void **)(*((void *)&v64 + 1) + 8 * k);
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "visitForID:", objc_msgSend(v23, "longLongValue"));
        long long v24 = (WBSHistoryVisit *)objc_claimAutoreleasedReturnValue();
        if (!v24)
        {
          uint64_t v25 = [v19 objectForKeyedSubscript:v23];
          uint64_t v26 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "itemForID:", objc_msgSend(v25, "itemID"));
          if (v26)
          {
            [v25 visitTime];
            objc_msgSend(v26, "visitForTimeOnSynchronizationQueue:");
            uint64_t v27 = (WBSHistoryVisit *)objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              long long v24 = v27;
              -[WBSHistoryVisit setDatabaseID:](v27, "setDatabaseID:", [v25 databaseID]);
            }
            else
            {
              long long v24 = [[WBSHistoryVisit alloc] initWithHistoryItem:v26 serviceVisit:v25];
              [v52 addObject:v24];
            }
            objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "setVisit:forID:", v24, objc_msgSend(v23, "longLongValue"));
          }
          else
          {
            long long v24 = 0;
          }
        }
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v64 objects:v78 count:16];
    }
    while (v20);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v14 = v52;
  uint64_t v28 = [v14 countByEnumeratingWithState:&v60 objects:v77 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v61;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v61 != v29) {
          objc_enumerationMutation(v14);
        }
        uint64_t v31 = *(void **)(*((void *)&v60 + 1) + 8 * m);
        uint64_t v32 = [v31 redirectSourceDatabaseID];
        if (v32)
        {
          id v33 = [*(id *)(*(void *)(a1 + 40) + 48) visitForID:v32];
          [v31 setRedirectSource:v33];
        }
        uint64_t v34 = objc_msgSend(v31, "redirectDestinationDatabaseID", v32);
        if (v34)
        {
          v35 = [*(id *)(*(void *)(a1 + 40) + 48) visitForID:v34];
          [v31 setRedirectDestination:v35];
        }
      }
      uint64_t v28 = [v14 countByEnumeratingWithState:&v60 objects:v77 count:16];
    }
    while (v28);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v36 = *(id *)(a1 + 64);
  uint64_t v37 = [v36 countByEnumeratingWithState:&v56 objects:v76 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v57;
    do
    {
      for (uint64_t n = 0; n != v37; ++n)
      {
        if (*(void *)v57 != v38) {
          objc_enumerationMutation(v36);
        }
        v40 = *(void **)(*((void *)&v56 + 1) + 8 * n);
        id v41 = objc_msgSend(*(id *)(a1 + 64), "safari_numberForKey:", v40);
        if (v41)
        {
          id v42 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "itemForID:", objc_msgSend(v40, "longLongValue"));
          id v43 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "visitForID:", objc_msgSend(v41, "longLongValue"));
          if (v43) {
            BOOL v44 = v42 == 0;
          }
          else {
            BOOL v44 = 1;
          }
          if (!v44) {
            [v54 setObject:v43 forKey:v42];
          }
        }
      }
      uint64_t v37 = [v36 countByEnumeratingWithState:&v56 objects:v76 count:16];
    }
    while (v37);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 112));
  if (WeakRetained)
  {
    if ([v55 count])
    {
      uint64_t v46 = *(void *)(a1 + 40);
      id v47 = [v55 allObjects];
      [WeakRetained historyStore:v46 didRemoveVisits:v47];

      v48 = [[WBSHistoryDeletionPlan alloc] initWithSQLiteStore:*(void *)(a1 + 40) triggeringVisits:v55 updatedLastVisitsByItem:v54];
      if (v48) {
        [WeakRetained historyStore:*(void *)(a1 + 40) didPrepareToDeleteWithDeletionPlan:v48];
      }
    }
    if ([v14 count])
    {
      uint64_t v49 = *(void *)(a1 + 40);
      v50 = [v14 allObjects];
      [WeakRetained historyStore:v49 didAddVisits:v50];
    }
  }

LABEL_69:
}

uint64_t __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __43__WBSHistoryServiceStore__waitForDatabase___block_invoke(uint64_t a1)
{
  qos_class_t v2 = qos_class_self();
  uint64_t v3 = dispatch_get_global_queue(v2, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__WBSHistoryServiceStore__waitForDatabase___block_invoke_2;
  v5[3] = &unk_1E5C8C660;
  id v4 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_async(v3, v5);
}

void __43__WBSHistoryServiceStore__waitForDatabase___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) databaseProxy];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (void)searchForUserTypedString:(id)a3 options:(unint64_t)a4 currentTime:(double)a5 enumerationBlock:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke;
  v18[3] = &unk_1E5C9D500;
  id v19 = v12;
  id v20 = v14;
  double v23 = a5;
  id v21 = v13;
  unint64_t v22 = a4;
  id v15 = v13;
  id v16 = v12;
  id v17 = v14;
  [(WBSHistoryServiceStore *)self _waitForDatabase:v18];
}

void __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v29 = 0;
    id v30 = 0;
    id v4 = SafariShared::HistoryObjectStreamWriter::createPipeHandles(&v30, &v29);
    id v5 = v30;
    id v6 = v29;
    if (v4)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      v27[0] = 0;
      v27[1] = v27;
      v27[2] = 0x3032000000;
      v27[3] = __Block_byref_object_copy__24;
      v27[4] = __Block_byref_object_dispose__24;
      id v28 = 0;
      uint64_t v9 = dispatch_group_create();
      dispatch_group_enter(v9);
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 56);
      double v12 = *(double *)(a1 + 64);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke_2;
      v24[3] = &unk_1E5C9D488;
      uint64_t v26 = v27;
      id v13 = v9;
      uint64_t v25 = v13;
      [v3 searchForUserTypedString:v10 options:v11 currentTime:v6 writeHandle:v24 completionHandler:v12];
      [v6 closeFile];
      qos_class_t v14 = qos_class_self();
      id v15 = dispatch_get_global_queue(v14, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke_3;
      block[3] = &unk_1E5C8C9F8;
      id v22 = v5;
      id v23 = *(id *)(a1 + 48);
      dispatch_group_async(v13, v15, block);

      qos_class_t v16 = qos_class_self();
      id v17 = dispatch_get_global_queue(v16, 0);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke_6;
      v18[3] = &unk_1E5C9C9B0;
      id v19 = *(id *)(a1 + 40);
      id v20 = v27;
      dispatch_group_notify(v13, v17, v18);

      _Block_object_dispose(v27, 8);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    dispatch_group_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:14 userInfo:0];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

void __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [*(id *)(a1 + 32) fileDescriptor];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke_4;
  v7[3] = &unk_1E5C9D4B0;
  id v9 = *(id *)(a1 + 40);
  id v8 = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke_5;
  v5[3] = &unk_1E5C9D4D8;
  id v4 = v8;
  id v6 = v4;
  SafariShared::ReadStreamedMatches(v3, v7, v5);
  [*(id *)(a1 + 32) closeFile];
}

uint64_t __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [WBSHistoryServiceURLCompletionMatchData alloc];
  id v6 = (void *)[*(id *)(a1 + 32) copy];
  uint64_t v7 = [(WBSHistoryServiceURLCompletionMatchData *)v5 initWithStreamData:a2 entries:v6];
  (*(void (**)(uint64_t, WBSHistoryServiceURLCompletionMatchData *))(v4 + 16))(v4, v7);

  id v8 = *(void **)(a1 + 32);
  return [v8 removeAllObjects];
}

void __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [[WBSHistoryServiceURLCompletionMatchEntry alloc] initWithStreamData:a2];
  objc_msgSend(v2, "addObject:");
}

uint64_t __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)computeFrequentlyVisitedSites:(unint64_t)a3 minimalVisitCountScore:(unint64_t)a4 blockList:(id)a5 allowList:(id)a6 options:(unint64_t)a7 currentTime:(double)a8 completionHandler:(id)a9
{
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __137__WBSHistoryServiceStore_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler___block_invoke;
  v22[3] = &unk_1E5C9D528;
  id v25 = v18;
  unint64_t v26 = a3;
  id v23 = v16;
  id v24 = v17;
  unint64_t v27 = a4;
  unint64_t v28 = a7;
  double v29 = a8;
  id v19 = v17;
  id v20 = v16;
  id v21 = v18;
  [(WBSHistoryServiceStore *)self _waitForDatabase:v22];
}

void __137__WBSHistoryServiceStore_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    [v3 computeFrequentlyVisitedSites:*(void *)(a1 + 56) minimalVisitCountScore:*(void *)(a1 + 64) blockList:*(void *)(a1 + 32) allowList:*(void *)(a1 + 40) options:*(void *)(a1 + 72) currentTime:*(void *)(a1 + 48) completionHandler:*(double *)(a1 + 80)];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:14 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
}

- (void)connectionProxyConnectionWasInterrupted:(id)a3
{
  unint64_t v3 = atomic_load((unint64_t *)&self->_state);
  if (v3 != 2)
  {
    dispatch_suspend((dispatch_object_t)self->_databaseQueue);
    id v5 = [(WBSHistoryServiceStore *)self _connectOptions];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__WBSHistoryServiceStore_connectionProxyConnectionWasInterrupted___block_invoke;
    v6[3] = &unk_1E5C9D550;
    v6[4] = self;
    [(WBSHistoryServiceStore *)self _connectWithOptions:v5 completionHandler:v6];
  }
}

void __66__WBSHistoryServiceStore_connectionProxyConnectionWasInterrupted___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __66__WBSHistoryServiceStore_connectionProxyConnectionWasInterrupted___block_invoke_cold_1();
    }
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 56) = a3;
    *(void *)(*(void *)(a1 + 32) + 64) = a4;
    [*(id *)(a1 + 32) setDatabaseProxy:v9];
  }
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 40));
}

- (void)initializeCloudHistoryWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__WBSHistoryServiceStore_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke;
  v10[3] = &unk_1E5C9D578;
  id v11 = v6;
  id v12 = v7;
  void v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(WBSHistoryServiceStore *)self _waitForDatabase:v10];
}

void __84__WBSHistoryServiceStore_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke(void *a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    [*(id *)(a1[4] + 32) initializeCloudHistoryWithConfiguration:a1[5] completionHandler:a1[6]];
  }
  else
  {
    uint64_t v3 = a1[6];
    uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:14 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
  }
}

- (NSString)databaseID
{
  return self->_databaseID;
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (void)setDatabaseURL:(id)a3
{
}

- (WBSHistoryStoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSHistoryStoreDelegate *)WeakRetained;
}

- (double)historyAgeLimit
{
  return self->_historyAgeLimit;
}

- (void)setHistoryAgeLimit:(double)a3
{
  self->_historyAgeLimit = a3;
}

- (WBSHistoryCrypto)crypto
{
  return self->_crypto;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseProxy, 0);
  objc_storeStrong((id *)&self->_crypto, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_databaseID, 0);
  objc_storeStrong((id *)&self->_maintenanceScheduler, 0);
  objc_storeStrong((id *)&self->_lastMaintenanceDate, 0);
  objc_storeStrong(&self->_loadCompletionBlock, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __64__WBSHistoryServiceStore__connectWithOptions_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to open History database because corruption was detected: %{public}@", v5);
}

void __64__WBSHistoryServiceStore__connectWithOptions_completionHandler___block_invoke_11_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to reset History database. It is still corrupted: %{public}@", v5);
}

void __52__WBSHistoryServiceStore_loadWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to connect to history database: %{public}@", v5);
}

void __58__WBSHistoryServiceStore__loadOnDatabaseQueue_readHandle___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_ERROR, "Null URL received from service", v1, 2u);
}

- (void)_load:(os_log_t)log .cold.1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_DEBUG, "Finished to load items (%zi)", buf, 0xCu);
}

- (void)_load:(double)a1 .cold.2(double a1)
{
  double v1 = OUTLINED_FUNCTION_13(a1);
  _DWORD *v2 = 136446466;
  OUTLINED_FUNCTION_7_1((uint64_t)v2, (uint64_t)"load_load_on_database_queue", v1);
  OUTLINED_FUNCTION_1_1(&dword_1A6B5F000, v3, v4, "#perf - %{public}s: %f", v5);
}

- (void)_load:(double)a1 .cold.3(double a1)
{
  double v1 = OUTLINED_FUNCTION_13(a1);
  _DWORD *v2 = 136446466;
  OUTLINED_FUNCTION_7_1((uint64_t)v2, (uint64_t)"load_fetch_metadata_for_keys", v1);
  OUTLINED_FUNCTION_1_1(&dword_1A6B5F000, v3, v4, "#perf - %{public}s: %f", v5);
}

void __32__WBSHistoryServiceStore__load___block_invoke_cold_1(double a1)
{
  double v1 = OUTLINED_FUNCTION_13(a1);
  _DWORD *v2 = 136446466;
  OUTLINED_FUNCTION_7_1((uint64_t)v2, (uint64_t)"load_fetch", v1);
  OUTLINED_FUNCTION_1_1(&dword_1A6B5F000, v3, v4, "#perf - %{public}s: %f", v5);
}

void __32__WBSHistoryServiceStore__load___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to load items and visits from history database: %{public}@", v5);
}

void __32__WBSHistoryServiceStore__load___block_invoke_32_cold_1(double a1)
{
  double v1 = OUTLINED_FUNCTION_13(a1);
  _DWORD *v2 = 136446466;
  OUTLINED_FUNCTION_7_1((uint64_t)v2, (uint64_t)"load_fetch_domain_expansions", v1);
  OUTLINED_FUNCTION_1_1(&dword_1A6B5F000, v3, v4, "#perf - %{public}s: %f", v5);
}

void __32__WBSHistoryServiceStore__load___block_invoke_32_cold_2()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to load domain expansions from history database: %{public}@", v5);
}

void __32__WBSHistoryServiceStore__load___block_invoke_38_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to fetch database's URL: %{public}@", v5);
}

void __32__WBSHistoryServiceStore__load___block_invoke_41_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 80);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Last maintenance date is invalid. Future date was stored in metadata: %@. Updating last maintenance date to right now", (uint8_t *)&v3, 0xCu);
}

void __32__WBSHistoryServiceStore__load___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_DEBUG, "No more reference to WBSHistoryServiceStore", v1, 2u);
}

void __32__WBSHistoryServiceStore__load___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_DEBUG, "No delegate to notify of load completion", v1, 2u);
}

void __32__WBSHistoryServiceStore__load___block_invoke_2_cold_3(double a1)
{
  double v1 = OUTLINED_FUNCTION_13(a1);
  _DWORD *v2 = 136446466;
  OUTLINED_FUNCTION_7_1((uint64_t)v2, (uint64_t)"load_load_completion_block", v1);
  OUTLINED_FUNCTION_1_1(&dword_1A6B5F000, v3, v4, "#perf - %{public}s: %f", v5);
}

void __81__WBSHistoryServiceStore_getVisitsCreatedAfterDate_beforeDate_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to get visits created after date: %{public}@", v5);
}

void __120__WBSHistoryServiceStore_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to retrieve high level domains: %{public}@", v5);
}

void __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_ERROR, "Told to delete item with nil URL, which would have destroyed all history. Bailing.", v1, 2u);
}

void __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke_60_cold_1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(v1, v2, v3, 5.8081e-34);
  _os_log_error_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_ERROR, "Failed to delete url %{private}@: %{public}@", v4, 0x16u);
}

void __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke_62_cold_1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(v1, v2, v3, 5.8081e-34);
  _os_log_error_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_ERROR, "Failed to delete future url %{private}@: %{public}@", v4, 0x16u);
}

void __42__WBSHistoryServiceStore_visitsWereAdded___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to record visit: %{public}@", v5);
}

void __47__WBSHistoryServiceStore_visitTitleWasUpdated___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to update title: %{public}@", v5);
}

void __82__WBSHistoryServiceStore_visitAttributeWasUpdated_removeAttributes_addAttributes___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to update attributes: %{public}@", v5);
}

void __60__WBSHistoryServiceStore_clearHistoryWithCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  _os_log_fault_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_FAULT, "Failed to perform history maintenance: %{public}@", v4, 0xCu);
}

void __61__WBSHistoryServiceStore_vacuumHistoryWithCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to vacuum history database: %{public}@", v5);
}

void __88__WBSHistoryServiceStore_clearHistoryVisitsAddedAfterDate_beforeDate_completionHandler___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(a2 + 40);
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Told to clear history between %{public}@ and %{public}@, which is not valid. Bailing.", (uint8_t *)&v5, 0x16u);
}

void __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Error fetching events from service: %{public}@", v5);
}

void __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_2_80_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Error marking events as received by listener: %{public}@", v5);
}

void __42__WBSHistoryServiceStore__expireOldVisits__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Error while expiring old visits: %{public}@", v5);
}

void __52__WBSHistoryServiceStore__updateLastMaintenanceDate__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to update last maintenance date: %{public}@", v5);
}

void __57__WBSHistoryServiceStore_addAutocompleteTrigger_forItem___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to add autocomplete trigger: %{public}@", v5);
}

void __75__WBSHistoryServiceStore_getAutocompleteTriggersForItem_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11();
  uint64_t v2 = (void *)v1;
  OUTLINED_FUNCTION_0_1(v1, v3, v4, 5.8081e-34);
  OUTLINED_FUNCTION_1_1(&dword_1A6B5F000, v7, v5, "Failed to fetch autocomplete triggers for %{private}@: %{public}@", v6);
}

void __75__WBSHistoryServiceStore_getAutocompleteTriggersForItem_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to fetch autocomplete triggers: %{public}@", v5);
}

void __66__WBSHistoryServiceStore_connectionProxyConnectionWasInterrupted___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to reconnect to database service after interruption with error: %{public}@", v5);
}

@end