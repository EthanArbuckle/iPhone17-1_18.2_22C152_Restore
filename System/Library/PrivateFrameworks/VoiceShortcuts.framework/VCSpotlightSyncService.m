@interface VCSpotlightSyncService
- (BOOL)isFetchingClientState;
- (CSSearchableIndex)index;
- (NSMutableSet)queuedInserted;
- (NSMutableSet)queuedModified;
- (NSMutableSet)queuedRemoved;
- (OS_dispatch_queue)queue;
- (SwiftVCDaemonXPCEventHandler)eventHandler;
- (VCSpotlightSyncOperation)syncOperation;
- (VCSpotlightSyncService)initWithDatabaseProvider:(id)a3 eventHandler:(id)a4;
- (WFDatabaseProvider)databaseProvider;
- (WFDebouncer)debouncer;
- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6;
- (void)dealloc;
- (void)requestSync;
- (void)setIsFetchingClientState:(BOOL)a3;
- (void)setQueuedInserted:(id)a3;
- (void)setQueuedModified:(id)a3;
- (void)setQueuedRemoved:(id)a3;
- (void)setSyncOperation:(id)a3;
- (void)start;
- (void)sync;
- (void)syncOperationFinishedWithRequestToRelaunch:(BOOL)a3;
- (void)syncWithChangeset:(id)a3;
@end

@implementation VCSpotlightSyncService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedRemoved, 0);
  objc_storeStrong((id *)&self->_queuedInserted, 0);
  objc_storeStrong((id *)&self->_queuedModified, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_syncOperation, 0);
  objc_storeStrong((id *)&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_debouncer, 0);
}

- (void)setIsFetchingClientState:(BOOL)a3
{
  self->_isFetchingClientState = a3;
}

- (BOOL)isFetchingClientState
{
  return self->_isFetchingClientState;
}

- (void)setQueuedRemoved:(id)a3
{
}

- (NSMutableSet)queuedRemoved
{
  return self->_queuedRemoved;
}

- (void)setQueuedInserted:(id)a3
{
}

- (NSMutableSet)queuedInserted
{
  return self->_queuedInserted;
}

- (void)setQueuedModified:(id)a3
{
}

- (NSMutableSet)queuedModified
{
  return self->_queuedModified;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSSearchableIndex)index
{
  return self->_index;
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (void)setSyncOperation:(id)a3
{
}

- (VCSpotlightSyncOperation)syncOperation
{
  return self->_syncOperation;
}

- (SwiftVCDaemonXPCEventHandler)eventHandler
{
  return self->_eventHandler;
}

- (WFDebouncer)debouncer
{
  return self->_debouncer;
}

- (void)syncOperationFinishedWithRequestToRelaunch:(BOOL)a3
{
  v5 = [(VCSpotlightSyncService *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__VCSpotlightSyncService_syncOperationFinishedWithRequestToRelaunch___block_invoke;
  v6[3] = &unk_1E6541358;
  BOOL v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

void __69__VCSpotlightSyncService_syncOperationFinishedWithRequestToRelaunch___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = @"YES";
    if (!*(unsigned char *)(a1 + 40)) {
      v3 = @"NO";
    }
    int v9 = 136315394;
    v10 = "-[VCSpotlightSyncService syncOperationFinishedWithRequestToRelaunch:]_block_invoke";
    __int16 v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_INFO, "%s Sync operation finished with changes: (%@)", (uint8_t *)&v9, 0x16u);
  }

  [MEMORY[0x1E4F30688] _resetCache];
  [*(id *)(a1 + 32) setSyncOperation:0];
  if ([*(id *)(*(void *)(a1 + 32) + 64) count]
    || [*(id *)(*(void *)(a1 + 32) + 72) count]
    || [*(id *)(*(void *)(a1 + 32) + 80) count])
  {
    v4 = [WFWorkflowChangeset alloc];
    v5 = (void *)[*(id *)(*(void *)(a1 + 32) + 64) copy];
    v6 = (void *)[*(id *)(*(void *)(a1 + 32) + 72) copy];
    BOOL v7 = (void *)[*(id *)(*(void *)(a1 + 32) + 80) copy];
    v8 = [(WFWorkflowChangeset *)v4 initWithModifiedWorkflows:v5 insertedWorkflows:v6 removedWorkflows:v7];

    [*(id *)(a1 + 32) syncWithChangeset:v8];
    [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
    [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
    [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
  }
  else if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) sync];
  }
}

- (void)syncWithChangeset:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[VCSpotlightSyncService syncWithChangeset:]";
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Starting a spotlight index sync", buf, 0xCu);
  }

  v6 = [(VCSpotlightSyncService *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__VCSpotlightSyncService_syncWithChangeset___block_invoke;
  block[3] = &unk_1E6541330;
  block[4] = self;
  id v9 = v4;
  BOOL v10 = v4 != 0;
  id v7 = v4;
  dispatch_async(v6, block);
}

void __44__VCSpotlightSyncService_syncWithChangeset___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) syncOperation];
  if (v2)
  {

LABEL_4:
    v3 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[VCSpotlightSyncService syncWithChangeset:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_INFO, "%s Sync in progress, dropping request.", buf, 0xCu);
    }

    id v4 = [*(id *)(a1 + 32) queuedModified];
    v5 = [*(id *)(a1 + 40) modified];
    [v4 unionSet:v5];

    v6 = [*(id *)(a1 + 32) queuedInserted];
    id v7 = [*(id *)(a1 + 40) inserted];
    [v6 unionSet:v7];

    id v8 = [*(id *)(a1 + 32) queuedRemoved];
    id v9 = [*(id *)(a1 + 40) removed];
    [v8 unionSet:v9];

    goto LABEL_7;
  }
  if ([*(id *)(a1 + 32) isFetchingClientState]) {
    goto LABEL_4;
  }
  BOOL v10 = VCOSTransactionWithName(@"VCSpotlightSyncService");
  __int16 v11 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[VCSpotlightSyncService syncWithChangeset:]_block_invoke";
    _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_INFO, "%s Fetching last client state.", buf, 0xCu);
  }

  [*(id *)(a1 + 32) setIsFetchingClientState:1];
  v12 = [*(id *)(a1 + 32) index];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __44__VCSpotlightSyncService_syncWithChangeset___block_invoke_182;
  v14[3] = &unk_1E6541308;
  uint64_t v13 = *(void **)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  char v17 = *(unsigned char *)(a1 + 48);
  id v15 = v13;
  id v16 = v10;
  id v8 = v10;
  [v12 fetchLastClientStateWithCompletionHandler:v14];

LABEL_7:
}

void __44__VCSpotlightSyncService_syncWithChangeset___block_invoke_182(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__VCSpotlightSyncService_syncWithChangeset___block_invoke_2;
  v12[3] = &unk_1E65412E0;
  id v13 = v6;
  id v14 = v5;
  char v18 = *(unsigned char *)(a1 + 56);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v8;
  uint64_t v16 = v9;
  id v17 = *(id *)(a1 + 48);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

void __44__VCSpotlightSyncService_syncWithChangeset___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  if (*(void *)(a1 + 32))
  {
    v2 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[VCSpotlightSyncService syncWithChangeset:]_block_invoke_2";
      v3 = "%s Error fetching last client state.";
      id v4 = v2;
      uint32_t v5 = 12;
LABEL_6:
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_DEBUG, v3, buf, v5);
    }
  }
  else
  {
    [*(id *)(a1 + 40) getBytes:&v23 length:8];
    v2 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[VCSpotlightSyncService syncWithChangeset:]_block_invoke";
      __int16 v26 = 2048;
      uint64_t v27 = v23;
      v3 = "%s Fetched last client state = (%llu)";
      id v4 = v2;
      uint32_t v5 = 22;
      goto LABEL_6;
    }
  }

  id v6 = VCGetLocalSpotlightState();
  int v7 = [v6 isConsistentWithClientState:v23];
  int v8 = v7;
  if (*(unsigned char *)(a1 + 72) && v7)
  {
    uint64_t v9 = [VCSpotlightSyncOperation alloc];
    id v10 = [*(id *)(a1 + 48) modified];
    id v11 = [*(id *)(a1 + 48) inserted];
    v12 = [*(id *)(a1 + 48) removed];
    id v13 = [*(id *)(a1 + 56) index];
    id v14 = [(VCSpotlightSyncOperation *)v9 initWithModifiedReferences:v10 inserted:v11 removed:v12 spotlightIndex:v13 localState:v6 transaction:*(void *)(a1 + 64)];
  }
  else
  {
    id v15 = [*(id *)(a1 + 56) databaseProvider];
    id v22 = 0;
    id v11 = [v15 databaseWithError:&v22];
    id v10 = v22;

    if (v11)
    {
      v12 = [v11 sortedVisibleWorkflowsByName];
      uint64_t v16 = [VCSpotlightSyncOperation alloc];
      id v17 = [v12 descriptors];
      char v18 = [*(id *)(a1 + 56) index];
      if (v8) {
        v19 = v6;
      }
      else {
        v19 = 0;
      }
      id v14 = [(VCSpotlightSyncOperation *)v16 initWithReferences:v17 forceFullResync:v8 ^ 1u spotlightIndex:v18 localState:v19 transaction:*(void *)(a1 + 64)];
    }
    else
    {
      v12 = getWFSpotlightSyncLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        v25 = "-[VCSpotlightSyncService syncWithChangeset:]_block_invoke";
        __int16 v26 = 2114;
        uint64_t v27 = v20;
        _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_DEFAULT, "%s Failed to load database, not creating sync operation, error = %{public}@", buf, 0x16u);
      }
      id v11 = 0;
      id v14 = 0;
    }
  }

  [(VCSpotlightSyncOperation *)v14 setDelegate:*(void *)(a1 + 56)];
  [*(id *)(a1 + 56) setSyncOperation:v14];
  v21 = [*(id *)(a1 + 56) syncOperation];
  [v21 start];

  [*(id *)(a1 + 56) setIsFetchingClientState:0];
}

- (void)sync
{
}

- (void)requestSync
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[VCSpotlightSyncService requestSync]";
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_DEBUG, "%s Poking the debouncer to manually request a sync", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(VCSpotlightSyncService *)self debouncer];
  [v4 poke];
}

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v14 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v33 = "-[VCSpotlightSyncService databaseDidChange:modified:inserted:removed:]";
    __int16 v34 = 2050;
    uint64_t v35 = [v10 count];
    __int16 v36 = 2050;
    uint64_t v37 = [v11 count];
    __int16 v38 = 2050;
    uint64_t v39 = [v12 count];
    _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_INFO, "%s Database results updated: %{public}lu modified, %{public}lu inserted, %{public}lu removed records", buf, 0x2Au);
  }

  id v15 = VCWorkflowReferencesFromDescriptors(v13, v11);
  uint64_t v16 = VCWorkflowReferencesFromDescriptors(v13, v10);
  id v17 = (void *)[v16 mutableCopy];

  char v18 = VCWorkflowReferencesFromDescriptors(v13, v12);

  v19 = (void *)[v18 mutableCopy];
  uint64_t v20 = [[WFWorkflowChangeset alloc] initWithModifiedWorkflows:v17 insertedWorkflows:v15 removedWorkflows:v19];
  v21 = [(WFWorkflowChangeset *)v20 changesetForVisibleWorkflows];
  if ([v21 isEmpty])
  {
    id v22 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[VCSpotlightSyncService databaseDidChange:modified:inserted:removed:]";
      _os_log_impl(&dword_1C7D7E000, v22, OS_LOG_TYPE_INFO, "%s Received db change notification, but no shortcuts were changed. Skipping sync.", buf, 0xCu);
    }
  }
  else
  {
    v30 = self;
    id v31 = v10;
    uint64_t v23 = [v21 inserted];
    uint64_t v24 = [v23 count];
    v25 = [v21 modified];
    unint64_t v26 = [v25 count] + v24;

    if (v26 < 0xB)
    {
      uint64_t v28 = v30;
      v29 = v21;
    }
    else
    {
      uint64_t v27 = getWFSpotlightSyncLogObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v33 = "-[VCSpotlightSyncService databaseDidChange:modified:inserted:removed:]";
        __int16 v34 = 2048;
        uint64_t v35 = v26;
        __int16 v36 = 2048;
        uint64_t v37 = 10;
        _os_log_impl(&dword_1C7D7E000, v27, OS_LOG_TYPE_DEFAULT, "%s We have delta update information, but the # of changed records larger than our batch size. Dropping down to regular indexing to stay within batch size (totalToIndex=%lu, batchSize=%lu)", buf, 0x20u);
      }

      uint64_t v28 = v30;
      v29 = 0;
    }
    [(VCSpotlightSyncService *)v28 syncWithChangeset:v29];
    id v10 = v31;
  }
}

- (void)start
{
  v3 = [(VCSpotlightSyncService *)self databaseProvider];
  id v5 = [v3 databaseWithError:0];

  if (v5)
  {
    [v5 addObjectObserver:self];
    [(VCSpotlightSyncService *)self requestSync];
  }
  else
  {
    id v4 = [(VCSpotlightSyncService *)self eventHandler];
    [v4 addObserver:self selector:sel_start name:@"com.apple.mobile.keybagd.first_unlock"];
  }
}

- (void)dealloc
{
  v3 = [(VCSpotlightSyncService *)self eventHandler];
  [v3 removeObserver:self name:@"com.apple.mobile.keybagd.first_unlock"];

  v4.receiver = self;
  v4.super_class = (Class)VCSpotlightSyncService;
  [(VCSpotlightSyncService *)&v4 dealloc];
}

- (VCSpotlightSyncService)initWithDatabaseProvider:(id)a3 eventHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([MEMORY[0x1E4F23838] isIndexingAvailable])
  {
    v28.receiver = self;
    v28.super_class = (Class)VCSpotlightSyncService;
    uint64_t v9 = [(VCSpotlightSyncService *)&v28 init];
    if (!v9)
    {
      unint64_t v26 = 0;
      goto LABEL_8;
    }
    id v10 = v9;
    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.VoiceShortcuts.SpotlightSyncService", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v10->_databaseProvider, a3);
    objc_storeStrong((id *)&v10->_eventHandler, a4);
    id v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    queuedModified = v10->_queuedModified;
    v10->_queuedModified = v15;

    id v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    queuedInserted = v10->_queuedInserted;
    v10->_queuedInserted = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    queuedRemoved = v10->_queuedRemoved;
    v10->_queuedRemoved = v19;

    id v21 = objc_alloc(MEMORY[0x1E4F23838]);
    uint64_t v22 = [v21 initWithName:@"voiceshortcuts-spotlight-index-name" bundleIdentifier:*MEMORY[0x1E4FB4BE8]];
    index = v10->_index;
    v10->_index = (CSSearchableIndex *)v22;

    v10->_isFetchingClientState = 0;
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4FB71B8]) initWithDelay:v10->_queue queue:3.0];
    debouncer = v10->_debouncer;
    v10->_debouncer = (WFDebouncer *)v24;

    [(WFDebouncer *)v10->_debouncer addTarget:v10 action:sel_sync];
    self = v10;
    unint64_t v26 = self;
  }
  else
  {
    id v12 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[VCSpotlightSyncService initWithDatabaseProvider:eventHandler:]";
      _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_DEBUG, "%s Spotlight indexing is not available.", buf, 0xCu);
    }
    unint64_t v26 = 0;
  }

LABEL_8:
  return v26;
}

@end