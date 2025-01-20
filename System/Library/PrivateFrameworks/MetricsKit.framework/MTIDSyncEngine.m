@interface MTIDSyncEngine
+ (double)transactionTimeout;
+ (void)setTransactionTimeout:(double)a3;
- (CKContainer)container;
- (CKRecordZoneID)zoneID;
- (MTIDSyncEngine)initWithContainerIdentifier:(id)a3 zoneID:(id)a4 queue:(id)a5 delegate:(id)a6;
- (MTIDSyncEngineDelegate)delegate;
- (NSMutableArray)transactions;
- (NSMutableSet)pendingRecordIDs;
- (NSMutableSet)queuedRecordIDs;
- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution;
- (OS_dispatch_queue)queue;
- (id)fetchRecordWithIDs:(id)a3;
- (int64_t)qualityOfService;
- (int64_t)state;
- (void)_beginTransaction;
- (void)_endTransaction;
- (void)accountDidChange:(id)a3;
- (void)addPendingRecordID:(id)a3;
- (void)addRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4 qualityOfService:(int64_t)a5;
- (void)commit;
- (void)deleteRecordsWithIDs:(id)a3;
- (void)fetchAllRecords;
- (void)fetchRecordWithID:(id)a3;
- (void)handleDeletedRecordID:(id)a3 error:(id)a4;
- (void)handleEngineStartedWithError:(id)a3;
- (void)handleFetchedRecords:(id)a3 error:(id)a4;
- (void)handleSavedRecord:(id)a3 error:(id)a4;
- (void)handleUserRecordID:(id)a3;
- (void)removePendingRecordID:(id)a3;
- (void)saveRecordsWithIDs:(id)a3 qualityOfService:(int64_t)a4;
- (void)setApplicationBundleIdentifierOverrideForNetworkAttribution:(id)a3;
- (void)setContainer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPendingRecordIDs:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setQueue:(id)a3;
- (void)setQueuedRecordIDs:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTransactions:(id)a3;
- (void)setZoneID:(id)a3;
- (void)setupContainerWithIdentifier:(id)a3;
- (void)startEngine;
@end

@implementation MTIDSyncEngine

- (MTIDSyncEngine)initWithContainerIdentifier:(id)a3 zoneID:(id)a4 queue:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MTIDSyncEngine;
  v14 = [(MTIDSyncEngine *)&v19 init];
  v15 = v14;
  if (v14)
  {
    [(MTIDSyncEngine *)v14 setQueue:v12];
    [(MTIDSyncEngine *)v15 setDelegate:v13];
    [(MTIDSyncEngine *)v15 setZoneID:v11];
    v16 = [MEMORY[0x263EFF9C0] set];
    [(MTIDSyncEngine *)v15 setQueuedRecordIDs:v16];

    v17 = [MEMORY[0x263EFF9C0] set];
    [(MTIDSyncEngine *)v15 setPendingRecordIDs:v17];

    [(MTIDSyncEngine *)v15 setupContainerWithIdentifier:v10];
    [(MTIDSyncEngine *)v15 setQualityOfService:17];
  }

  return v15;
}

- (void)setupContainerWithIdentifier:(id)a3
{
  v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  v6 = [v4 defaultCenter];
  [v6 addObserver:self selector:sel_accountDidChange_ name:*MEMORY[0x263EFD478] object:0];

  v7 = +[MTFrameworkEnvironment sharedEnvironment];
  if ([v7 useCloudKitSandbox]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }

  v9 = (void *)[objc_alloc(MEMORY[0x263EFD620]) initWithContainerIdentifier:v5 environment:v8];
  id v10 = (void *)[objc_alloc(MEMORY[0x263EFD610]) initWithContainerID:v9];
  [(MTIDSyncEngine *)self setContainer:v10];

  id v11 = [(MTIDSyncEngine *)self container];
  id v12 = [v11 containerID];
  uint64_t v13 = [v12 environment];

  if (v13 == 2)
  {
    v14 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_218211000, v14, OS_LOG_TYPE_DEBUG, "MetricsKit: AMPIDService is using iCloud container in the sandbox environment", v15, 2u);
    }
  }
}

- (void)accountDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if ([(MTIDSyncEngine *)v5 state] == 2)
  {
    v6 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_218211000, v6, OS_LOG_TYPE_DEBUG, "MetricsKit: Restarting ID sync engine because account has changed", v7, 2u);
    }

    [(MTIDSyncEngine *)v5 setState:0];
    [(MTIDSyncEngine *)v5 startEngine];
  }
  objc_sync_exit(v5);
}

- (void)setState:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_state = a3;
  if (!a3)
  {
    id v4 = [(MTIDSyncEngine *)obj pendingRecordIDs];
    [v4 removeAllObjects];

    id v5 = [(MTIDSyncEngine *)obj queuedRecordIDs];
    [v5 removeAllObjects];

    [(MTIDSyncEngine *)obj _endTransaction];
  }
  objc_sync_exit(obj);
}

- (void)startEngine
{
  obj = self;
  objc_sync_enter(obj);
  if ([(MTIDSyncEngine *)obj state])
  {
    objc_sync_exit(obj);
  }
  else
  {
    [(MTIDSyncEngine *)obj setState:1];
    objc_sync_exit(obj);

    objc_initWeak(&location, obj);
    v2 = [(MTIDSyncEngine *)obj container];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __29__MTIDSyncEngine_startEngine__block_invoke;
    v4[3] = &unk_264310D00;
    objc_copyWeak(&v5, &location);
    [v2 fetchUserRecordIDWithCompletionHandler:v4];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __29__MTIDSyncEngine_startEngine__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v6)
  {
    id v11 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained handleUserRecordID:v5];

    id v13 = objc_loadWeakRetained(v11);
    v14 = [v13 container];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __29__MTIDSyncEngine_startEngine__block_invoke_2;
    v15[3] = &unk_264310CD8;
    objc_copyWeak(&v16, v11);
    [v14 accountInfoWithCompletionHandler:v15];

    objc_destroyWeak(&v16);
    goto LABEL_8;
  }
  uint64_t v8 = [v6 domain];
  if (![v8 isEqual:*MEMORY[0x263EFD498]]) {
    goto LABEL_5;
  }
  uint64_t v9 = [v7 code];

  if (v9 == 9)
  {
    uint64_t v8 = objc_loadWeakRetained((id *)(a1 + 32));
    [v8 handleUserRecordID:0];
LABEL_5:
  }
  id v10 = objc_loadWeakRetained((id *)(a1 + 32));
  [v10 handleEngineStartedWithError:v7];

LABEL_8:
}

void __29__MTIDSyncEngine_startEngine__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
LABEL_8:
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained handleEngineStartedWithError:v8];

    goto LABEL_9;
  }
  if ([v5 accountStatus] == 1)
  {
    if (([v5 supportsDeviceToDeviceEncryption] & 1) == 0)
    {
      id v9 = objc_loadWeakRetained((id *)(a1 + 32));
      id v10 = [v9 container];
      id v11 = [v10 containerIdentifier];
      MTError(702, @"iCloud account for container %@ doesn't support device to device encryption", v12, v13, v14, v15, v16, v17, (uint64_t)v11);
      id v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8) {
        goto LABEL_8;
      }
    }
  }
  else
  {
    uint64_t v24 = [v5 accountStatus];
    MTError(701, @"iCloud account is not available. Account status: %ld", v25, v26, v27, v28, v29, v30, v24);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8) {
      goto LABEL_8;
    }
  }
  v18 = (id *)(a1 + 32);
  id v19 = objc_loadWeakRetained((id *)(a1 + 32));
  v20 = [v19 zoneID];

  id v21 = objc_loadWeakRetained(v18);
  v22 = [v21 container];
  v23 = [v22 privateCloudDatabase];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __29__MTIDSyncEngine_startEngine__block_invoke_3;
  v32[3] = &unk_264310CB0;
  id v8 = v20;
  id v33 = v8;
  objc_copyWeak(&v34, v18);
  [v23 fetchRecordZoneWithID:v8 completionHandler:v32];

  objc_destroyWeak(&v34);
LABEL_9:
}

void __29__MTIDSyncEngine_startEngine__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = [v6 domain];
  if (![v7 isEqual:*MEMORY[0x263EFD498]])
  {

    goto LABEL_7;
  }
  uint64_t v8 = [v6 code];

  if (v8 != 26)
  {
LABEL_7:
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained handleEngineStartedWithError:v6];

    goto LABEL_8;
  }
  id v9 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v10;
    _os_log_impl(&dword_218211000, v9, OS_LOG_TYPE_DEBUG, "MetricsKit: Creating new zone with ID %@", buf, 0xCu);
  }

  id v11 = (void *)[objc_alloc(MEMORY[0x263EFD7F8]) initWithZoneID:*(void *)(a1 + 32)];
  uint64_t v12 = (id *)(a1 + 40);
  id v13 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v14 = [v13 container];
  uint64_t v15 = [v14 privateCloudDatabase];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __29__MTIDSyncEngine_startEngine__block_invoke_11;
  v17[3] = &unk_264310C88;
  objc_copyWeak(&v18, v12);
  [v15 saveRecordZone:v11 completionHandler:v17];

  objc_destroyWeak(&v18);
LABEL_8:
}

void __29__MTIDSyncEngine_startEngine__block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained handleEngineStartedWithError:v4];
}

- (id)fetchRecordWithIDs:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MTPromise);
  id v6 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218211000, v6, OS_LOG_TYPE_DEBUG, "MetricsKit: Started fetching record with IDs", buf, 2u);
  }

  v7 = (void *)[objc_alloc(MEMORY[0x263EFD6D8]) initWithRecordIDs:v4];
  uint64_t v8 = [(MTIDSyncEngine *)self applicationBundleIdentifierOverrideForNetworkAttribution];
  id v9 = [v7 configuration];
  [v9 setApplicationBundleIdentifierOverrideForNetworkAttribution:v8];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __37__MTIDSyncEngine_fetchRecordWithIDs___block_invoke;
  v14[3] = &unk_264310270;
  uint64_t v10 = v5;
  uint64_t v15 = v10;
  [v7 setFetchRecordsCompletionBlock:v14];
  id v11 = [(MTIDSyncEngine *)self container];
  uint64_t v12 = [v11 privateCloudDatabase];
  [v12 addOperation:v7];

  return v10;
}

void __37__MTIDSyncEngine_fetchRecordWithIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (v6)
  {
    uint64_t v8 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_218211000, v8, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to fetch records with ID. error %@", (uint8_t *)&v9, 0xCu);
    }

    id v7 = 0;
  }
  [*(id *)(a1 + 32) finishWithResult:v7 error:v6];
}

- (void)fetchRecordWithID:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if ([(MTIDSyncEngine *)v5 state] == 2)
  {
    objc_sync_exit(v5);

    id v6 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = [v4 recordName];
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v7;
      _os_log_impl(&dword_218211000, v6, OS_LOG_TYPE_DEBUG, "MetricsKit: Started fetching record with ID %@", buf, 0xCu);
    }
    [(MTIDSyncEngine *)v5 addPendingRecordID:v4];
    id v8 = objc_alloc(MEMORY[0x263EFD6D8]);
    id v18 = v4;
    int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    id v10 = (void *)[v8 initWithRecordIDs:v9];

    uint64_t v11 = [(MTIDSyncEngine *)v5 applicationBundleIdentifierOverrideForNetworkAttribution];
    uint64_t v12 = [v10 configuration];
    [v12 setApplicationBundleIdentifierOverrideForNetworkAttribution:v11];

    objc_initWeak((id *)buf, v5);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __36__MTIDSyncEngine_fetchRecordWithID___block_invoke;
    v15[3] = &unk_264310D28;
    id v16 = v4;
    objc_copyWeak(&v17, (id *)buf);
    [v10 setFetchRecordsCompletionBlock:v15];
    id v13 = [(MTIDSyncEngine *)v5 container];
    uint64_t v14 = [v13 privateCloudDatabase];
    [v14 addOperation:v10];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(MTIDSyncEngine *)v5 startEngine];
    objc_sync_exit(v5);
  }
}

void __36__MTIDSyncEngine_fetchRecordWithID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = [a2 objectForKeyedSubscript:v5];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v9 = WeakRetained;
  if (v7)
  {
    v12[0] = v7;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    [v9 handleFetchedRecords:v10 error:v6];
  }
  else
  {
    [WeakRetained handleFetchedRecords:0 error:v6];
  }
  id v11 = objc_loadWeakRetained((id *)(a1 + 40));
  [v11 removePendingRecordID:*(void *)(a1 + 32)];
}

- (void)fetchAllRecords
{
  v24[1] = *MEMORY[0x263EF8340];
  obj = self;
  objc_sync_enter(obj);
  if ([(MTIDSyncEngine *)obj state] == 2)
  {
    objc_sync_exit(obj);

    v2 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_218211000, v2, OS_LOG_TYPE_DEBUG, "MetricsKit: Started fetching all record changes", (uint8_t *)buf, 2u);
    }

    id v3 = objc_alloc_init(MEMORY[0x263EFD6B0]);
    id v4 = [(MTIDSyncEngine *)obj zoneID];
    v23 = v4;
    v24[0] = v3;
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];

    id v6 = objc_alloc(MEMORY[0x263EFD6B8]);
    id v7 = [(MTIDSyncEngine *)obj zoneID];
    v22 = v7;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
    int v9 = (void *)[v6 initWithRecordZoneIDs:v8 configurationsByRecordZoneID:v5];

    id v10 = [(MTIDSyncEngine *)obj applicationBundleIdentifierOverrideForNetworkAttribution];
    id v11 = [v9 configuration];
    [v11 setApplicationBundleIdentifierOverrideForNetworkAttribution:v10];

    objc_initWeak(buf, obj);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __33__MTIDSyncEngine_fetchAllRecords__block_invoke;
    v19[3] = &unk_264310D50;
    objc_copyWeak(&v20, buf);
    [v9 setRecordChangedBlock:v19];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __33__MTIDSyncEngine_fetchAllRecords__block_invoke_2;
    v17[3] = &unk_264310D78;
    objc_copyWeak(&v18, buf);
    [v9 setRecordWithIDWasDeletedBlock:v17];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __33__MTIDSyncEngine_fetchAllRecords__block_invoke_3;
    v15[3] = &unk_264310DA0;
    objc_copyWeak(&v16, buf);
    [v9 setRecordZoneFetchCompletionBlock:v15];
    [(MTIDSyncEngine *)obj _beginTransaction];
    uint64_t v12 = [(MTIDSyncEngine *)obj container];
    id v13 = [v12 privateCloudDatabase];
    [v13 addOperation:v9];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(buf);
  }
  else
  {
    [(MTIDSyncEngine *)obj startEngine];
    objc_sync_exit(obj);
  }
}

void __33__MTIDSyncEngine_fetchAllRecords__block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v6[0] = v3;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  [WeakRetained handleFetchedRecords:v5 error:0];
}

void __33__MTIDSyncEngine_fetchAllRecords__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleDeletedRecordID:v3 error:0];
}

void __33__MTIDSyncEngine_fetchAllRecords__block_invoke_3(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained pendingRecordIDs];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    id v5 = objc_loadWeakRetained(v1);
    [v5 _endTransaction];
  }
}

- (void)saveRecordsWithIDs:(id)a3 qualityOfService:(int64_t)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = self;
    objc_sync_enter(v7);
    if ([(MTIDSyncEngine *)v7 qualityOfService] < a4) {
      [(MTIDSyncEngine *)v7 setQualityOfService:a4];
    }
    if ([(MTIDSyncEngine *)v7 state] == 2)
    {
      id v8 = [(MTIDSyncEngine *)v7 queuedRecordIDs];
      uint64_t v9 = [v8 count];

      id v10 = [(MTIDSyncEngine *)v7 queuedRecordIDs];
      [v10 addObjectsFromArray:v6];

      if (!v9)
      {
        id v11 = [(MTIDSyncEngine *)v7 queuedRecordIDs];
        uint64_t v12 = [v11 count];

        if (v12)
        {
          dispatch_time_t v13 = dispatch_time(0, 1000000000);
          uint64_t v14 = [(MTIDSyncEngine *)v7 queue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __54__MTIDSyncEngine_saveRecordsWithIDs_qualityOfService___block_invoke;
          block[3] = &unk_26430FB90;
          block[4] = v7;
          dispatch_after(v13, v14, block);
        }
      }
    }
    else
    {
      [(MTIDSyncEngine *)v7 startEngine];
    }
    objc_sync_exit(v7);
  }
}

uint64_t __54__MTIDSyncEngine_saveRecordsWithIDs_qualityOfService___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) commit];
}

- (void)commit
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(MTIDSyncEngine *)v2 queuedRecordIDs];
  uint64_t v4 = [v3 allObjects];

  uint64_t v5 = [(MTIDSyncEngine *)v2 qualityOfService];
  id v6 = [(MTIDSyncEngine *)v2 queuedRecordIDs];
  [v6 removeAllObjects];

  [(MTIDSyncEngine *)v2 setQualityOfService:17];
  objc_sync_exit(v2);

  if ([v4 count])
  {
    id v7 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 134218240;
      uint64_t v9 = [v4 count];
      __int16 v10 = 2048;
      uint64_t v11 = v5;
      _os_log_impl(&dword_218211000, v7, OS_LOG_TYPE_DEBUG, "MetricsKit: Started saving %ld records with qos %ld", (uint8_t *)&v8, 0x16u);
    }

    [(MTIDSyncEngine *)v2 addRecordIDsToSave:v4 recordIDsToDelete:0 qualityOfService:v5];
  }
}

- (void)deleteRecordsWithIDs:(id)a3
{
}

- (void)addRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4 qualityOfService:(int64_t)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v26 = a4;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  if ([(MTIDSyncEngine *)v9 state] == 2)
  {
    int64_t v25 = a5;
    __int16 v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v34;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * v14);
          id v16 = [(MTIDSyncEngine *)v9 delegate];
          id v17 = [v16 recordWithID:v15];

          if (v17)
          {
            [(MTIDSyncEngine *)v9 addPendingRecordID:v15];
            [v10 addObject:v17];
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v12);
    }

    objc_initWeak(&location, v9);
    id v18 = (void *)[objc_alloc(MEMORY[0x263EFD748]) initWithRecordsToSave:v10 recordIDsToDelete:v26];
    id v19 = [v18 configuration];
    [v19 setQualityOfService:v25];

    id v20 = [(MTIDSyncEngine *)v9 applicationBundleIdentifierOverrideForNetworkAttribution];
    uint64_t v21 = [v18 configuration];
    [v21 setApplicationBundleIdentifierOverrideForNetworkAttribution:v20];

    [v18 setSavePolicy:0];
    [v18 setAtomic:0];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __72__MTIDSyncEngine_addRecordIDsToSave_recordIDsToDelete_qualityOfService___block_invoke;
    v30[3] = &unk_264310DC8;
    objc_copyWeak(&v31, &location);
    [v18 setPerRecordCompletionBlock:v30];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __72__MTIDSyncEngine_addRecordIDsToSave_recordIDsToDelete_qualityOfService___block_invoke_2;
    v27[3] = &unk_264310DF0;
    id v22 = v10;
    id v28 = v22;
    objc_copyWeak(&v29, &location);
    [v18 setCompletionBlock:v27];
    v23 = [(MTIDSyncEngine *)v9 container];
    uint64_t v24 = [v23 privateCloudDatabase];
    [v24 addOperation:v18];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);

    objc_destroyWeak(&location);
  }
  else
  {
    [(MTIDSyncEngine *)v9 startEngine];
  }
  objc_sync_exit(v9);
}

void __72__MTIDSyncEngine_addRecordIDsToSave_recordIDsToDelete_qualityOfService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained handleSavedRecord:v6 error:v5];
}

void __72__MTIDSyncEngine_addRecordIDsToSave_recordIDsToDelete_qualityOfService___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    id v6 = (id *)(a1 + 40);
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        id WeakRetained = objc_loadWeakRetained(v6);
        __int16 v10 = objc_msgSend(v8, "recordID", (void)v11);
        [WeakRetained removePendingRecordID:v10];

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)addPendingRecordID:(id)a3
{
  id v6 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(MTIDSyncEngine *)v4 pendingRecordIDs];
  [v5 addObject:v6];

  [(MTIDSyncEngine *)v4 _beginTransaction];
  objc_sync_exit(v4);
}

- (void)removePendingRecordID:(id)a3
{
  id v8 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(MTIDSyncEngine *)v4 pendingRecordIDs];
  [v5 removeObject:v8];

  id v6 = [(MTIDSyncEngine *)v4 pendingRecordIDs];
  uint64_t v7 = [v6 count];

  if (!v7) {
    [(MTIDSyncEngine *)v4 _endTransaction];
  }
  objc_sync_exit(v4);
}

+ (double)transactionTimeout
{
  return *(double *)&_transactionTimeout;
}

+ (void)setTransactionTimeout:(double)a3
{
  _transactionTimeout = *(void *)&a3;
}

- (void)_beginTransaction
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__1;
  uint64_t v15 = __Block_byref_object_dispose__1;
  id v16 = [(MTIDSyncEngine *)self transactions];
  uint64_t v3 = (void *)v12[5];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
    uint64_t v5 = (void *)v12[5];
    v12[5] = v4;

    [(MTIDSyncEngine *)self setTransactions:v12[5]];
    uint64_t v3 = (void *)v12[5];
  }
  if (![v3 count])
  {
    id v6 = (void *)v12[5];
    uint64_t v7 = (void *)os_transaction_create();
    [v6 addObject:v7];
  }
  +[MTIDSyncEngine transactionTimeout];
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__MTIDSyncEngine__beginTransaction__block_invoke;
  block[3] = &unk_264310E18;
  block[4] = &v11;
  dispatch_after(v9, MEMORY[0x263EF83A0], block);
  _Block_object_dispose(&v11, 8);
}

void __35__MTIDSyncEngine__beginTransaction__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)_endTransaction
{
  id v2 = [(MTIDSyncEngine *)self transactions];
  [v2 removeAllObjects];
}

- (void)handleUserRecordID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTIDSyncEngine *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__MTIDSyncEngine_handleUserRecordID___block_invoke;
  v7[3] = &unk_264310378;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __37__MTIDSyncEngine_handleUserRecordID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accountDidChangeWithUserRecordID:*(void *)(a1 + 40)];
}

- (void)handleEngineStartedWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  [(MTIDSyncEngine *)v5 setState:2 * (v4 == 0)];
  objc_sync_exit(v5);

  id v6 = [(MTIDSyncEngine *)v5 queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__MTIDSyncEngine_handleEngineStartedWithError___block_invoke;
  v8[3] = &unk_264310378;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __47__MTIDSyncEngine_handleEngineStartedWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 syncEngineDidStartWithError:*(void *)(a1 + 40)];
}

- (void)handleSavedRecord:(id)a3 error:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 domain];
  uint64_t v9 = *MEMORY[0x263EFD498];
  if ([v8 isEqual:*MEMORY[0x263EFD498]])
  {
    uint64_t v10 = [v7 code];

    if (v10 == 14)
    {
      uint64_t v11 = [v7 userInfo];
      long long v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263EFD4F8]];

      if (v12)
      {
        uint64_t v13 = MTMetricsKitOSLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          long long v14 = [v6 recordID];
          uint64_t v15 = [v14 recordName];
          *(_DWORD *)buf = 138412290;
          id v28 = v15;
          _os_log_impl(&dword_218211000, v13, OS_LOG_TYPE_DEBUG, "MetricsKit: Server has a newer version of record with ID %@, use server record instead", buf, 0xCu);
        }
        id v16 = v12;

        id v7 = 0;
        id v6 = v16;
      }
      goto LABEL_11;
    }
  }
  else
  {
  }
  id v17 = [v7 domain];
  if (![v17 isEqual:v9])
  {

    goto LABEL_13;
  }
  uint64_t v18 = [v7 code];

  if (v18 == 11)
  {
    long long v12 = [(MTIDSyncEngine *)self delegate];
    id v19 = [v6 recordID];
    [v12 recordWasDeleted:v19];

LABEL_11:
  }
LABEL_13:
  id v20 = [(MTIDSyncEngine *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__MTIDSyncEngine_handleSavedRecord_error___block_invoke;
  block[3] = &unk_26430FD40;
  id v24 = v7;
  int64_t v25 = self;
  id v26 = v6;
  id v21 = v6;
  id v22 = v7;
  dispatch_async(v20, block);
}

void __42__MTIDSyncEngine_handleSavedRecord_error___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    id v2 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = [*(id *)(a1 + 48) recordID];
      id v4 = [v3 recordName];
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v9 = v4;
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      _os_log_impl(&dword_218211000, v2, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to save record with ID %@ error %@", buf, 0x16u);
    }
    id v6 = [*(id *)(a1 + 40) delegate];
    [v6 recordWasFailedToSave:*(void *)(a1 + 48)];
  }
  else
  {
    id v7 = [*(id *)(a1 + 40) delegate];
    [v7 recordWasSaved:*(void *)(a1 + 48)];
  }
}

- (void)handleFetchedRecords:(id)a3 error:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_218211000, v8, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to fetch records with error %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v9 = [(MTIDSyncEngine *)self queue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __45__MTIDSyncEngine_handleFetchedRecords_error___block_invoke;
    v10[3] = &unk_264310378;
    uint64_t v11 = v6;
    uint64_t v12 = self;
    dispatch_async(v9, v10);

    id v8 = v11;
  }
}

void __45__MTIDSyncEngine_handleFetchedRecords_error___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
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
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        id v8 = objc_msgSend(*(id *)(a1 + 40), "delegate", (void)v9);
        [v8 recordWasFetched:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)handleDeletedRecordID:(id)a3 error:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      long long v9 = [v6 recordName];
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_218211000, v8, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to delete record with ID %@ error %@", buf, 0x16u);
    }
  }
  else
  {
    long long v10 = [(MTIDSyncEngine *)self queue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __46__MTIDSyncEngine_handleDeletedRecordID_error___block_invoke;
    v11[3] = &unk_264310378;
    v11[4] = self;
    id v12 = v6;
    dispatch_async(v10, v11);
  }
}

void __46__MTIDSyncEngine_handleDeletedRecordID_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 recordWasDeleted:*(void *)(a1 + 40)];
}

- (int64_t)state
{
  return self->_state;
}

- (MTIDSyncEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTIDSyncEngineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setApplicationBundleIdentifierOverrideForNetworkAttribution:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (NSMutableSet)queuedRecordIDs
{
  return self->_queuedRecordIDs;
}

- (void)setQueuedRecordIDs:(id)a3
{
}

- (NSMutableSet)pendingRecordIDs
{
  return self->_pendingRecordIDs;
}

- (void)setPendingRecordIDs:(id)a3
{
}

- (NSMutableArray)transactions
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transactions);

  return (NSMutableArray *)WeakRetained;
}

- (void)setTransactions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transactions);
  objc_storeStrong((id *)&self->_pendingRecordIDs, 0);
  objc_storeStrong((id *)&self->_queuedRecordIDs, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForNetworkAttribution, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end