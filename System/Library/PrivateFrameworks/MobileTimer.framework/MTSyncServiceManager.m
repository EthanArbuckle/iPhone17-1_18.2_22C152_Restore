@interface MTSyncServiceManager
- (BOOL)started;
- (MTMetrics)syncMetrics;
- (MTSyncChangeQueue)syncChangeQueue;
- (MTSyncDataModel)syncDataModel;
- (MTSyncService)syncService;
- (MTSyncServiceManager)initWithSyncService:(id)a3 syncStatusProvider:(id)a4 syncDataModel:(id)a5 syncMetrics:(id)a6;
- (MTSyncServiceManager)initWithSyncService:(id)a3 syncStatusProvider:(id)a4 syncDataModel:(id)a5 syncMetrics:(id)a6 syncChangeStore:(id)a7;
- (MTSyncStatusProvider)syncStatusProvider;
- (NAScheduler)serializer;
- (id)gatherDiagnostics;
- (id)pendingChanges;
- (id)requestSync:(unint64_t)a3;
- (void)applyChange:(id)a3;
- (void)checkForPendingChanges;
- (void)pendingChangesSent:(id)a3;
- (void)printDiagnostics;
- (void)resetDataStore;
- (void)setSerializer:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setSyncChangeQueue:(id)a3;
- (void)setSyncDataModel:(id)a3;
- (void)setSyncMetrics:(id)a3;
- (void)setSyncService:(id)a3;
- (void)setSyncStatusProvider:(id)a3;
- (void)startSyncService;
- (void)stopSyncService;
- (void)syncChange:(id)a3;
- (void)syncStatusProvider:(id)a3 didChangeSyncStatus:(unint64_t)a4;
@end

@implementation MTSyncServiceManager

- (MTSyncServiceManager)initWithSyncService:(id)a3 syncStatusProvider:(id)a4 syncDataModel:(id)a5 syncMetrics:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = +[MTSyncChangeStore persistentStoreForDataModel:v11];
  v15 = [(MTSyncServiceManager *)self initWithSyncService:v13 syncStatusProvider:v12 syncDataModel:v11 syncMetrics:v10 syncChangeStore:v14];

  return v15;
}

- (MTSyncServiceManager)initWithSyncService:(id)a3 syncStatusProvider:(id)a4 syncDataModel:(id)a5 syncMetrics:(id)a6 syncChangeStore:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)MTSyncServiceManager;
  v18 = [(MTSyncServiceManager *)&v24 init];
  if (v18)
  {
    uint64_t v19 = +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", @"com.apple.MTSyncServiceManager.serialqueue", +[MTScheduler defaultPriority]);
    serializer = v18->_serializer;
    v18->_serializer = (NAScheduler *)v19;

    objc_storeStrong((id *)&v18->_syncService, a3);
    [v13 setDelegate:v18];
    objc_storeStrong((id *)&v18->_syncStatusProvider, a4);
    [(MTSyncStatusProvider *)v18->_syncStatusProvider setSyncStatusProviderDelegate:v18];
    objc_storeWeak((id *)&v18->_syncDataModel, v15);
    v21 = [[MTSyncChangeQueue alloc] initWithChangeStore:v17];
    syncChangeQueue = v18->_syncChangeQueue;
    v18->_syncChangeQueue = v21;

    [(MTSyncChangeQueue *)v18->_syncChangeQueue loadChanges];
    objc_storeStrong((id *)&v18->_syncMetrics, a6);
  }

  return v18;
}

- (void)startSyncService
{
  serializer = self->_serializer;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__MTSyncServiceManager_startSyncService__block_invoke;
  v3[3] = &unk_1E59150A8;
  v3[4] = self;
  [(NAScheduler *)serializer performBlock:v3];
}

uint64_t __40__MTSyncServiceManager_startSyncService__block_invoke(uint64_t result)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    uint64_t v2 = result;
    if ([*(id *)(v1 + 24) syncStatus] == 3)
    {
      v3 = MTLogForCategory(6);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(v2 + 32);
        int v7 = 138543362;
        uint64_t v8 = v4;
        _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ sync currently disabled, not starting, and removing any pending changes.", (uint8_t *)&v7, 0xCu);
      }

      return [*(id *)(*(void *)(v2 + 32) + 40) removePendingChanges];
    }
    else
    {
      *(unsigned char *)(*(void *)(v2 + 32) + 8) = 1;
      v5 = MTLogForCategory(6);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(v2 + 32);
        int v7 = 138543362;
        uint64_t v8 = v6;
        _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ resuming sync service", (uint8_t *)&v7, 0xCu);
      }

      [*(id *)(*(void *)(v2 + 32) + 16) resume:0];
      return [*(id *)(v2 + 32) checkForPendingChanges];
    }
  }
  return result;
}

- (void)stopSyncService
{
  serializer = self->_serializer;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__MTSyncServiceManager_stopSyncService__block_invoke;
  v3[3] = &unk_1E59150A8;
  v3[4] = self;
  [(NAScheduler *)serializer performBlock:v3];
}

uint64_t __39__MTSyncServiceManager_stopSyncService__block_invoke(uint64_t result)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    uint64_t v2 = MTLogForCategory(6);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(v1 + 32);
      int v6 = 138543362;
      uint64_t v7 = v3;
      _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping sync service", (uint8_t *)&v6, 0xCu);
    }

    [*(id *)(*(void *)(v1 + 32) + 16) suspend];
    uint64_t v4 = MTLogForCategory(6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(v1 + 32);
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ removing pending changes", (uint8_t *)&v6, 0xCu);
    }

    result = [*(id *)(*(void *)(v1 + 32) + 40) removePendingChanges];
    *(unsigned char *)(*(void *)(v1 + 32) + 8) = 0;
  }
  return result;
}

- (void)checkForPendingChanges
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MTSyncChangeQueue *)self->_syncChangeQueue hasPendingChanges];
  uint64_t v4 = MTLogForCategory(6);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v7 = 138543362;
      uint64_t v8 = self;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ still has changes", (uint8_t *)&v7, 0xCu);
    }

    id v6 = [(MTSyncServiceManager *)self requestSync:0];
  }
  else
  {
    if (v5)
    {
      int v7 = 138543362;
      uint64_t v8 = self;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ no pending changes", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)syncChange:(id)a3
{
  id v4 = a3;
  serializer = self->_serializer;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__MTSyncServiceManager_syncChange___block_invoke;
  v7[3] = &unk_1E5915000;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NAScheduler *)serializer performBlock:v7];
}

void __35__MTSyncServiceManager_syncChange___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
  BOOL v3 = MTLogForCategory(6);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v9 = 138543618;
      uint64_t v10 = v5;
      __int16 v11 = 2114;
      uint64_t v12 = v6;
      _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ syncing %{public}@", (uint8_t *)&v9, 0x16u);
    }

    [*(id *)(*(void *)(a1 + 32) + 40) enqueueChange:*(void *)(a1 + 40)];
    id v7 = (id)[*(id *)(a1 + 32) requestSync:0];
  }
  else
  {
    if (v4)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ ignoring sync because we're not started", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (id)pendingChanges
{
  return [(MTSyncChangeQueue *)self->_syncChangeQueue pendingChanges];
}

- (void)applyChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(MTSyncChangeQueue *)self->_syncChangeQueue resolveChange:a3];
  uint64_t v5 = MTLogForCategory(6);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v7 = 138543618;
      uint64_t v8 = self;
      __int16 v9 = 2114;
      uint64_t v10 = v4;
      _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ applying change %{public}@", (uint8_t *)&v7, 0x16u);
    }

    uint64_t v5 = [(MTSyncServiceManager *)self syncDataModel];
    [v5 applyChange:v4];
  }
  else if (v6)
  {
    int v7 = 138543362;
    uint64_t v8 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ nothing to apply", (uint8_t *)&v7, 0xCu);
  }
}

- (void)resetDataStore
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = MTLogForCategory(6);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    BOOL v6 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ resetting data store", (uint8_t *)&v5, 0xCu);
  }

  [(MTSyncChangeQueue *)self->_syncChangeQueue removePendingChanges];
  BOOL v4 = [(MTSyncServiceManager *)self syncDataModel];
  [v4 resetDataStore];
}

- (void)pendingChangesSent:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = MTLogForCategory(6);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    uint64_t v7 = self;
    __int16 v8 = 2048;
    uint64_t v9 = [v4 count];
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully sent %lu changes", (uint8_t *)&v6, 0x16u);
  }

  [(MTSyncChangeQueue *)self->_syncChangeQueue dequeueChanges:v4];
  [(MTSyncServiceManager *)self checkForPendingChanges];
}

- (id)requestSync:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    int v5 = MTLogForCategory(6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v10 = self;
      _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ incremental sync requested", buf, 0xCu);
    }
  }
  int v6 = [(MTSyncService *)self->_syncService requestSync:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__MTSyncServiceManager_requestSync___block_invoke;
  v8[3] = &unk_1E5915AA8;
  v8[4] = self;
  [v6 addCompletionBlock:v8];
  return v6;
}

uint64_t __36__MTSyncServiceManager_requestSync___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (a2) {
    return [v2 logSyncFailedWithError:a2];
  }
  else {
    return [v2 logSyncCompleted];
  }
}

- (void)syncStatusProvider:(id)a3 didChangeSyncStatus:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v6 = MTLogForCategory(6);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a4 == 3)
  {
    if (v7)
    {
      int v8 = 138543362;
      uint64_t v9 = self;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ sync is disabled.", (uint8_t *)&v8, 0xCu);
    }

    [(MTSyncServiceManager *)self stopSyncService];
  }
  else
  {
    if (v7)
    {
      int v8 = 138543362;
      uint64_t v9 = self;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ sync isn't disabled.", (uint8_t *)&v8, 0xCu);
    }

    [(MTSyncServiceManager *)self startSyncService];
  }
}

- (void)printDiagnostics
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = MTLogForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(MTSyncServiceManager *)self syncService];
    int v5 = (objc_class *)objc_opt_class();
    int v6 = NSStringFromClass(v5);
    int v14 = 138412290;
    uint64_t v15 = (uint64_t)v6;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "Sync Service: %@", (uint8_t *)&v14, 0xCu);
  }
  BOOL v7 = MTLogForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [(MTSyncServiceManager *)self syncStatusProvider];
    uint64_t v9 = [v8 syncStatus];
    int v14 = 134217984;
    uint64_t v15 = v9;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "Sync Status: %lu", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v10 = MTLogForCategory(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [(MTSyncServiceManager *)self syncChangeQueue];
    uint64_t v12 = [v11 pendingChanges];
    uint64_t v13 = [v12 count];
    int v14 = 134217984;
    uint64_t v15 = v13;
    _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "Pending Changes: %lu", (uint8_t *)&v14, 0xCu);
  }
}

- (id)gatherDiagnostics
{
  v16[3] = *MEMORY[0x1E4F143B8];
  v15[0] = @"Sync Service";
  BOOL v3 = [(MTSyncServiceManager *)self syncService];
  id v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  v16[0] = v5;
  v15[1] = @"Sync Status";
  int v6 = (void *)MEMORY[0x1E4F28ED0];
  BOOL v7 = [(MTSyncServiceManager *)self syncStatusProvider];
  int v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "syncStatus"));
  v16[1] = v8;
  v15[2] = @"Pending Changes";
  uint64_t v9 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v10 = [(MTSyncServiceManager *)self syncChangeQueue];
  uint64_t v11 = [v10 pendingChanges];
  uint64_t v12 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v16[2] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  return v13;
}

- (MTSyncService)syncService
{
  return self->_syncService;
}

- (void)setSyncService:(id)a3
{
}

- (MTSyncStatusProvider)syncStatusProvider
{
  return self->_syncStatusProvider;
}

- (void)setSyncStatusProvider:(id)a3
{
}

- (MTSyncDataModel)syncDataModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_syncDataModel);
  return (MTSyncDataModel *)WeakRetained;
}

- (void)setSyncDataModel:(id)a3
{
}

- (MTSyncChangeQueue)syncChangeQueue
{
  return self->_syncChangeQueue;
}

- (void)setSyncChangeQueue:(id)a3
{
}

- (MTMetrics)syncMetrics
{
  return self->_syncMetrics;
}

- (void)setSyncMetrics:(id)a3
{
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_syncMetrics, 0);
  objc_storeStrong((id *)&self->_syncChangeQueue, 0);
  objc_destroyWeak((id *)&self->_syncDataModel);
  objc_storeStrong((id *)&self->_syncStatusProvider, 0);
  objc_storeStrong((id *)&self->_syncService, 0);
}

@end