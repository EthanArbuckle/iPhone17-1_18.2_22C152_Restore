@interface BRCSharedDatabaseSyncOperation
+ (id)queue;
- (BOOL)shouldRetryForError:(id)a3;
- (BRCSharedDatabaseSyncOperation)initWithSyncContext:(id)a3 sessionContext:(id)a4 changeState:(id)a5;
- (id)createActivity;
- (id)shareDBSyncCompletionBlock;
- (void)_performAfterAddingOwnerKeysForZoneIDs:(id)a3 block:(id)a4;
- (void)_performAfterRegisteringForPushes:(id)a3;
- (void)_performFetchChangedZones;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setShareDBSyncCompletionBlock:(id)a3;
@end

@implementation BRCSharedDatabaseSyncOperation

+ (id)queue
{
  if (queue_once != -1) {
    dispatch_once(&queue_once, &__block_literal_global_2);
  }
  v2 = (void *)queue_queue;
  return v2;
}

void __39__BRCSharedDatabaseSyncOperation_queue__block_invoke()
{
  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.sharedb", v0);

  v2 = (void *)queue_queue;
  queue_queue = (uint64_t)v1;
}

- (BRCSharedDatabaseSyncOperation)initWithSyncContext:(id)a3 sessionContext:(id)a4 changeState:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BRCSharedDatabaseSyncOperation;
  v10 = [(_BRCOperation *)&v13 initWithName:@"sync/sharedb" syncContext:a3 sessionContext:a4];
  v11 = v10;
  if (v10)
  {
    [(BRCSharedDatabaseSyncOperation *)v10 setQueuePriority:4];
    objc_storeStrong((id *)&v11->_changeState, a5);
  }

  return v11;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "sync/sharedb", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(BRCSharedDatabaseSyncOperation *)self hash];
  kdebug_trace();
  v8 = [(BRCSharedDatabaseSyncOperation *)self shareDBSyncCompletionBlock];
  if (v8)
  {
    ((void (**)(void, uint64_t, id))v8)[2](v8, [v6 BOOLValue], v7);
    [(BRCSharedDatabaseSyncOperation *)self setShareDBSyncCompletionBlock:0];
  }

  v9.receiver = self;
  v9.super_class = (Class)BRCSharedDatabaseSyncOperation;
  [(_BRCOperation *)&v9 finishWithResult:v6 error:v7];
}

- (void)_performAfterAddingOwnerKeysForZoneIDs:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BRCSyncContext *)self->super._syncContext session];
  objc_super v9 = [v8 serverDB];

  v10 = [v9 serialQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__BRCSharedDatabaseSyncOperation__performAfterAddingOwnerKeysForZoneIDs_block___block_invoke;
  v14[3] = &unk_26507EEB0;
  id v15 = v9;
  id v16 = v6;
  v17 = self;
  id v18 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v9;
  dispatch_async_with_logs_0(v10, v14);
}

void __79__BRCSharedDatabaseSyncOperation__performAfterAddingOwnerKeysForZoneIDs_block___block_invoke(uint64_t a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__BRCSharedDatabaseSyncOperation__performAfterAddingOwnerKeysForZoneIDs_block___block_invoke_2;
  v6[3] = &unk_26507EE88;
  os_activity_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = v5;
  [v2 groupInTransaction:v6];
}

uint64_t __79__BRCSharedDatabaseSyncOperation__performAfterAddingOwnerKeysForZoneIDs_block___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v19;
    *(void *)&long long v6 = 138412802;
    long long v17 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v9), "ownerName", v17, (void)v18);
        id v11 = [*(id *)(*(void *)(a1 + 40) + 248) session];
        id v12 = [v11 userKeyForOwnerName:v10 db:v3];

        if (!v12)
        {
          id v13 = [*(id *)(*(void *)(a1 + 40) + 248) session];
          id v12 = [v13 createUserKeyForOwnerName:v10];

          v14 = brc_bread_crumbs();
          id v15 = brc_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v17;
            v23 = v12;
            __int16 v24 = 2112;
            v25 = v10;
            __int16 v26 = 2112;
            v27 = v14;
            _os_log_debug_impl(&dword_23FA42000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] inserted new ownerKey %@ for %@%@", buf, 0x20u);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v7);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  return 1;
}

- (void)_performAfterRegisteringForPushes:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFD650]) initWithSubscriptionID:@"sharedZoneSubscription"];
  id v6 = objc_alloc_init(MEMORY[0x263EFD768]);
  [v6 setShouldSendContentAvailable:1];
  [v5 setNotificationInfo:v6];
  id v7 = objc_alloc(MEMORY[0x263EFD750]);
  v16[0] = v5;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  uint64_t v9 = (void *)[v7 initWithSubscriptionsToSave:v8 subscriptionIDsToDelete:0];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__BRCSharedDatabaseSyncOperation__performAfterRegisteringForPushes___block_invoke;
  v12[3] = &unk_26507EED8;
  id v14 = v4;
  id v15 = v9;
  id v13 = v5;
  id v10 = v4;
  id v11 = v5;
  [v9 setModifySubscriptionsCompletionBlock:v12];
  [(_BRCOperation *)self addSubOperation:v9];
}

void __68__BRCSharedDatabaseSyncOperation__performAfterRegisteringForPushes___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_msgSend(v9, "brc_cloudKitErrorForSubscriptionID:", @"sharedZoneSubscription");
  id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v10 brc_containsCloudKitInternalErrorCode:2032])
  {

    id v10 = 0;
  }
  memset(v18, 0, sizeof(v18));
  __brc_create_section(0, (uint64_t)"-[BRCSharedDatabaseSyncOperation _performAfterRegisteringForPushes:]_block_invoke", 119, v18);
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = v18[0];
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = [*(id *)(a1 + 48) operationID];
    id v16 = (void *)v15;
    long long v17 = @"success";
    *(_DWORD *)buf = 134219010;
    if (v10) {
      long long v17 = v10;
    }
    uint64_t v20 = v13;
    __int16 v21 = 2112;
    uint64_t v22 = v14;
    __int16 v23 = 2112;
    uint64_t v24 = v15;
    __int16 v25 = 2112;
    __int16 v26 = v17;
    __int16 v27 = 2112;
    v28 = v11;
    _os_log_debug_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Handling result of creating %@ (operationID=%@): %@%@", buf, 0x34u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __brc_leave_section(v18);
}

- (void)_performFetchChangedZones
{
  id v3 = [(BRCServerChangeState *)self->_changeState changeToken];
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFD698]) initWithPreviousServerChangeToken:v3];
  [v4 setFetchAllChanges:0];
  uint64_t v5 = +[BRCSharedDatabaseSyncOperation queue];
  [v4 setCallbackQueue:v5];

  id v6 = +[BRCUserDefaults defaultsForMangledID:0];
  objc_msgSend(v4, "setResultsLimit:", objc_msgSend(v6, "sharedDBSyncDownBatchRecordsCount"));

  objc_initWeak(&location, v4);
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__0;
  v15[4] = __Block_byref_object_dispose__0;
  id v16 = [MEMORY[0x263EFF980] array];
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__0;
  v13[4] = __Block_byref_object_dispose__0;
  id v14 = [MEMORY[0x263EFF980] array];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke;
  v11[3] = &unk_26507EF00;
  objc_copyWeak(&v12, &location);
  v11[4] = v15;
  [v4 setRecordZoneWithIDChangedBlock:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_21;
  v9[3] = &unk_26507EF00;
  objc_copyWeak(&v10, &location);
  v9[4] = v13;
  [v4 setRecordZoneWithIDWasDeletedBlock:v9];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_22;
  v7[3] = &unk_26507EF78;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  v7[5] = v15;
  v7[6] = v13;
  [v4 setFetchDatabaseChangesCompletionBlock:v7];
  [(_BRCOperation *)self addSubOperation:v4];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(v15, 8);
  objc_destroyWeak(&location);
}

void __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412802;
    id v8 = WeakRetained;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_debug_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ zone %@ changed%@", (uint8_t *)&v7, 0x20u);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
}

void __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412802;
    id v8 = WeakRetained;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_debug_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ zone %@ changed%@", (uint8_t *)&v7, 0x20u);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
}

void __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_22(uint64_t a1, void *a2, char a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v8)
  {
    id v10 = brc_bread_crumbs();
    __int16 v11 = brc_default_log();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v26 = (uint64_t)WeakRetained;
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 2112;
      *(void *)v30 = v10;
      _os_log_error_impl(&dword_23FA42000, v11, (os_log_type_t)0x90u, "[ERROR] %@ failed: %@%@", buf, 0x20u);
    }

    [*(id *)(a1 + 32) completedWithResult:0 error:v8];
  }
  else
  {
    memset(v24, 0, sizeof(v24));
    __brc_create_section(0, (uint64_t)"-[BRCSharedDatabaseSyncOperation _performFetchChangedZones]_block_invoke", 155, v24);
    id v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = v24[0];
      int v18 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
      int v19 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
      *(_DWORD *)buf = 134219010;
      uint64_t v26 = v17;
      __int16 v27 = 2112;
      id v28 = WeakRetained;
      __int16 v29 = 1024;
      *(_DWORD *)v30 = v18;
      *(_WORD *)&v30[4] = 1024;
      *(_DWORD *)&v30[6] = v19;
      __int16 v31 = 2112;
      v32 = v12;
      _os_log_debug_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@ done: %u zones were changed and %u deleted%@", buf, 0x2Cu);
    }

    uint64_t v15 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v16 = *(void *)(*(void *)(v14 + 8) + 40);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_23;
    v20[3] = &unk_26507EF50;
    uint64_t v22 = v14;
    v20[4] = v15;
    id v21 = v7;
    char v23 = a3;
    [v15 _performAfterAddingOwnerKeysForZoneIDs:v16 block:v20];

    __brc_leave_section(v24);
  }
}

void __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_23(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[BRCSharedDatabaseSyncOperation queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_2;
  v9[3] = &unk_26507EF28;
  uint64_t v5 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v5;
  long long v8 = *(_OWORD *)(a1 + 40);
  id v6 = (id)v8;
  long long v12 = v8;
  char v13 = *(unsigned char *)(a1 + 56);
  id v7 = v3;
  dispatch_async_with_logs_0(v4, v9);
}

void __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_2(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = 0;
    id v3 = *(void **)(a1 + 40);
    id v4 = NSNumber;
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v27;
      *(void *)&long long v6 = 138412290;
      long long v22 = v6;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithRecordZoneID:*(void *)(*((void *)&v26 + 1) + 8 * v9)];
          uint64_t v11 = [*(id *)(*(void *)(a1 + 40) + 248) session];
          long long v12 = [v11 getOrCreateSharedZones:v10];

          char v13 = brc_bread_crumbs();
          uint64_t v14 = brc_default_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            __int16 v31 = v12;
            __int16 v32 = 2112;
            uint64_t v33 = v13;
            _os_log_debug_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] scheduling sync for %@%@", buf, 0x16u);
          }

          if (v12)
          {
            uint64_t v15 = [v12 db];
            uint64_t v16 = [v15 serialQueue];
            v24[0] = MEMORY[0x263EF8330];
            v24[1] = 3221225472;
            v24[2] = __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_25;
            uint64_t v24[3] = &unk_26507ED70;
            id v25 = v12;
            dispatch_async_with_logs_0(v16, v24);

            uint64_t v17 = v25;
          }
          else
          {
            uint64_t v17 = brc_bread_crumbs();
            int v18 = brc_default_log();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v22;
              __int16 v31 = v17;
              _os_log_fault_impl(&dword_23FA42000, v18, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: there should be a container%@", buf, 0xCu);
            }
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v7);
    }

    int v19 = brc_bread_crumbs();
    uint64_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_2_cold_1(a1, (uint64_t)v19, v20);
    }

    [*(id *)(*(void *)(a1 + 40) + 504) updateWithServerChangeToken:*(void *)(a1 + 48) clientRequestID:0 caughtUp:*(unsigned char *)(a1 + 64) == 0];
    id v3 = *(void **)(a1 + 40);
    id v4 = NSNumber;
    if (*(void *)(a1 + 32)) {
      uint64_t v2 = 0;
    }
    else {
      uint64_t v2 = *(unsigned __int8 *)(a1 + 64);
    }
  }
  id v21 = objc_msgSend(v4, "numberWithInt:", v2, v22);
  [v3 completedWithResult:v21 error:*(void *)(a1 + 32)];
}

uint64_t __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_25(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleSyncDown];
}

- (void)main
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_23FA42000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Sync: fetching changed zones in the shared-database%@", (uint8_t *)&v4, 0x16u);
}

uint64_t __38__BRCSharedDatabaseSyncOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 completedWithResult:0 error:a2];
  }
  else {
    return [v2 _performFetchChangedZones];
  }
}

- (id)shareDBSyncCompletionBlock
{
  return self->_shareDBSyncCompletionBlock;
}

- (void)setShareDBSyncCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shareDBSyncCompletionBlock, 0);
  objc_storeStrong((id *)&self->_changeState, 0);
}

void __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 504);
  uint64_t v7 = prettyPrintServerChangeToken(*(void **)(a1 + 48), 0);
  uint64_t v8 = (void *)v7;
  int v9 = *(unsigned __int8 *)(a1 + 64);
  int v11 = 138413058;
  uint64_t v12 = v6;
  if (v9) {
    id v10 = "NO";
  }
  else {
    id v10 = "YES";
  }
  __int16 v13 = 2112;
  uint64_t v14 = v7;
  __int16 v15 = 2080;
  uint64_t v16 = v10;
  __int16 v17 = 2112;
  uint64_t v18 = a2;
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] updating shared-database from %@ with token:%@ caught-up:%s%@", (uint8_t *)&v11, 0x2Au);
}

@end