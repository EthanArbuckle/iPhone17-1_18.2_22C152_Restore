@interface PPXPCNamedEntityStore
- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4;
- (BOOL)cloudSyncWithError:(id *)a3;
- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5;
- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThan:(id)a5 deletedCount:(unint64_t *)a6 error:(id *)a7;
- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)donateLocationNamedEntities:(id)a3 bundleId:(id)a4 groupId:(id)a5 error:(id *)a6;
- (BOOL)donateMapItem:(id)a3 forPlaceName:(id)a4 error:(id *)a5;
- (BOOL)donateNamedEntities:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 error:(id *)a8;
- (BOOL)flushDonationsWithError:(id *)a3;
- (BOOL)iterNamedEntityRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)iterRankedNamedEntitiesWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)loadNamedEntityRecordsAndMonitorChangesWithDelegate:(id)a3 error:(id *)a4;
- (BOOL)loadNamedEntityRecordsAndMonitorChangesWithDelegate:(id)a3 query:(id)a4 error:(id *)a5;
- (BOOL)removeMapItemForPlaceName:(id)a3 error:(id *)a4;
- (BOOL)removeMapItemsBeforeCutoffDate:(id)a3 error:(id *)a4;
- (id)_init;
- (id)_lastCallDateForQuery:(id)a3;
- (id)_monitoringHelperForQuery:(id)a3 createIfNeeded:(BOOL)a4;
- (id)_recordGeneratorForQuery:(id)a3;
- (id)clientIdentifier;
- (id)mapItemForPlaceName:(id)a3 error:(id *)a4;
- (id)namedEntityRecordsWithQuery:(id)a3 error:(id *)a4;
- (id)rankedNamedEntitiesWithQuery:(id)a3 error:(id *)a4;
- (void)_loadNamedEntityRecordsForQuery:(id)a3 withDelegate:(id)a4;
- (void)_sendChangesToDelegatesForQuery:(id)a3;
- (void)_sendResetToAllDelegatesForQuery:(id)a3;
- (void)_setLastCallDateForQuery:(id)a3;
- (void)registerFeedback:(id)a3 completion:(id)a4;
- (void)setClientIdentifier:(id)a3;
- (void)unloadMonitoringDelegate:(id)a3;
@end

@implementation PPXPCNamedEntityStore

- (void)setClientIdentifier:(id)a3
{
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)PPXPCNamedEntityStore;
  v2 = [(PPNamedEntityStore *)&v10 _initFromSubclass];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93B70]);
    v4 = objc_opt_new();
    uint64_t v5 = [v3 initWithGuardedData:v4];
    v6 = (void *)v2[2];
    v2[2] = v5;

    v7 = [[PPClientFeedbackHelper alloc] initWithParentObject:v2];
    v8 = (void *)v2[1];
    v2[1] = v7;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoringSessionsLock, 0);
  objc_storeStrong((id *)&self->_clientFeedbackHelper, 0);
}

- (id)clientIdentifier
{
  return [(PPClientFeedbackHelper *)self->_clientFeedbackHelper clientIdentifier];
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if ([v8 isMapped])
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PPXPCNamedEntityStore.m" lineNumber:435 description:@"You cannot send mapped feedback on named entities. Please use PPFeedback to create the feedback for named entities."];
  }
  v9 = [(PPXPCNamedEntityStore *)self clientIdentifier];
  uint64_t v10 = [v9 length];

  if (!v10)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PPXPCNamedEntityStore.m" lineNumber:436 description:@"The clientIdentifier property must be set on the PPNamedEntityStore in order to send feedback."];
  }
  v11 = [(PPXPCNamedEntityStore *)self clientIdentifier];
  [v8 setClientIdentifier:v11];

  v12 = +[PPNamedEntityReadOnlyClient sharedInstance];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__PPXPCNamedEntityStore_registerFeedback_completion___block_invoke;
  v16[3] = &unk_1E550F8A8;
  v16[4] = self;
  id v17 = v7;
  id v13 = v7;
  [v12 registerFeedback:v8 completion:v16];
}

uint64_t __53__PPXPCNamedEntityStore_registerFeedback_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, a3);
  }
  return MEMORY[0x1F41817F8]();
}

- (void)unloadMonitoringDelegate:(id)a3
{
  id v4 = a3;
  monitoringSessionsLock = self->_monitoringSessionsLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__PPXPCNamedEntityStore_unloadMonitoringDelegate___block_invoke;
  v7[3] = &unk_1E550E2D0;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)monitoringSessionsLock runWithLockAcquired:v7];
}

void __50__PPXPCNamedEntityStore_unloadMonitoringDelegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_msgSend(a2, "objectEnumerator", 0);
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
        id v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) monitoringHelper];
        [v8 unloadDelegate:*(void *)(a1 + 32)];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (BOOL)loadNamedEntityRecordsAndMonitorChangesWithDelegate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  LOBYTE(a4) = [(PPXPCNamedEntityStore *)self loadNamedEntityRecordsAndMonitorChangesWithDelegate:v6 query:v7 error:a4];

  return (char)a4;
}

- (BOOL)loadNamedEntityRecordsAndMonitorChangesWithDelegate:(id)a3 query:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id location = 0;
  objc_initWeak(&location, self);
  long long v9 = [(PPXPCNamedEntityStore *)self _monitoringHelperForQuery:v8 createIfNeeded:1];
  long long v10 = [(PPXPCNamedEntityStore *)self _recordGeneratorForQuery:v8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__PPXPCNamedEntityStore_loadNamedEntityRecordsAndMonitorChangesWithDelegate_query_error___block_invoke;
  v14[3] = &unk_1E550E030;
  objc_copyWeak(&v16, &location);
  id v11 = v8;
  id v15 = v11;
  char v12 = [v9 loadRecordsAndMonitorChangesWithDelegate:v7 recordGenerator:v10 notificationRegistrationBlock:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v12;
}

void __89__PPXPCNamedEntityStore_loadNamedEntityRecordsAndMonitorChangesWithDelegate_query_error___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __89__PPXPCNamedEntityStore_loadNamedEntityRecordsAndMonitorChangesWithDelegate_query_error___block_invoke_2;
    v7[3] = &unk_1E550E030;
    objc_copyWeak(&v9, v2);
    id v8 = *(id *)(a1 + 32);
    +[PPNotificationManager addPortraitChangeObserverForLifetimeOfObject:WeakRetained block:v7];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __89__PPXPCNamedEntityStore_loadNamedEntityRecordsAndMonitorChangesWithDelegate_query_error___block_invoke_46;
    v4[3] = &unk_1E550E030;
    objc_copyWeak(&v6, v2);
    id v5 = *(id *)(a1 + 32);
    +[PPNotificationManager addPortraitInvalidationObserverForLifetimeOfObject:WeakRetained block:v4];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&v9);
  }
}

void __89__PPXPCNamedEntityStore_loadNamedEntityRecordsAndMonitorChangesWithDelegate_query_error___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = pp_entities_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_18CAA6000, v3, OS_LOG_TYPE_DEFAULT, "loadNamedEntityRecordsAndMonitorChanges change block being called for query %@", (uint8_t *)&v5, 0xCu);
  }

  [WeakRetained _sendChangesToDelegatesForQuery:*(void *)(a1 + 32)];
}

void __89__PPXPCNamedEntityStore_loadNamedEntityRecordsAndMonitorChangesWithDelegate_query_error___block_invoke_46(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = pp_entities_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_18CAA6000, v3, OS_LOG_TYPE_DEFAULT, "loadNamedEntityRecordsAndMonitorChanges invalidation block being called for query %@", (uint8_t *)&v5, 0xCu);
  }

  [WeakRetained _sendResetToAllDelegatesForQuery:*(void *)(a1 + 32)];
}

- (void)_loadNamedEntityRecordsForQuery:(id)a3 withDelegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(PPXPCNamedEntityStore *)self _monitoringHelperForQuery:v7 createIfNeeded:1];
  id v8 = [(PPXPCNamedEntityStore *)self _recordGeneratorForQuery:v7];

  [v9 loadRecordsWithDelegate:v6 recordGenerator:v8];
}

- (void)_sendChangesToDelegatesForQuery:(id)a3
{
  id v4 = a3;
  int v5 = [(PPXPCNamedEntityStore *)self _monitoringHelperForQuery:v4 createIfNeeded:0];
  if (v5)
  {
    id location = 0;
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__PPXPCNamedEntityStore__sendChangesToDelegatesForQuery___block_invoke;
    v7[3] = &unk_1E550E008;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    id v6 = [(PPXPCNamedEntityStore *)self _recordGeneratorForQuery:v8];
    [v5 sendChangesToDelegatesWithChangeGenerator:v7 recordGenerator:v6];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

id __57__PPXPCNamedEntityStore__sendChangesToDelegatesForQuery___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_opt_new();
  id v4 = +[PPNamedEntityReadOnlyClient sharedInstance];
  int v5 = (void *)[*(id *)(a1 + 32) copyForMonitoring];
  unint64_t v6 = [v5 limit];
  if (v6 >= 0x1F4) {
    uint64_t v7 = 500;
  }
  else {
    uint64_t v7 = v6;
  }
  [v5 setLimit:v7];
  id v8 = [WeakRetained _lastCallDateForQuery:*(void *)(a1 + 32)];
  [v5 setFromDate:v8];

  id v22 = 0;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __57__PPXPCNamedEntityStore__sendChangesToDelegatesForQuery___block_invoke_2;
  v20 = &unk_1E550E8E0;
  id v9 = v3;
  id v21 = v9;
  int v10 = [v4 namedEntityRecordsWithQuery:v5 error:&v22 handleBatch:&v17];
  id v11 = v22;

  if (v10)
  {
    objc_msgSend(WeakRetained, "_setLastCallDateForQuery:", *(void *)(a1 + 32), v17, v18, v19, v20);
  }
  else
  {
    char v12 = pp_entities_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      id v26 = v11;
      _os_log_error_impl(&dword_18CAA6000, v12, OS_LOG_TYPE_ERROR, "namedEntityRecordsWithQuery query: %@, returned error: %@", buf, 0x16u);
    }
  }
  id v13 = v21;
  id v14 = v9;

  return v14;
}

uint64_t __57__PPXPCNamedEntityStore__sendChangesToDelegatesForQuery___block_invoke_2(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (!*a3) {
    return [*(id *)(result + 32) addObjectsFromArray:a2];
  }
  return result;
}

- (void)_sendResetToAllDelegatesForQuery:(id)a3
{
  id v6 = a3;
  id v4 = -[PPXPCNamedEntityStore _monitoringHelperForQuery:createIfNeeded:](self, "_monitoringHelperForQuery:createIfNeeded:");
  if (v4)
  {
    int v5 = [(PPXPCNamedEntityStore *)self _recordGeneratorForQuery:v6];
    [v4 sendResetToAllDelegatesWithRecordGenerator:v5];
  }
}

- (id)_recordGeneratorForQuery:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__PPXPCNamedEntityStore__recordGeneratorForQuery___block_invoke;
  v8[3] = &unk_1E550DFE0;
  id v9 = v4;
  id v5 = v4;
  objc_copyWeak(&v10, &location);
  id v6 = (void *)MEMORY[0x192F975A0](v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v6;
}

id __50__PPXPCNamedEntityStore__recordGeneratorForQuery___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  id v5 = pp_entities_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v13 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    id v22 = v3;
    __int16 v23 = 2112;
    id v24 = v13;
    _os_log_debug_impl(&dword_18CAA6000, v5, OS_LOG_TYPE_DEBUG, "calling rankedNamedEntitiesWithQuery for delegate %@ and query %@", buf, 0x16u);
  }

  id v6 = +[PPNamedEntityReadOnlyClient sharedInstance];
  uint64_t v7 = (void *)[*(id *)(a1 + 32) copyForMonitoring];
  id v20 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __50__PPXPCNamedEntityStore__recordGeneratorForQuery___block_invoke_41;
  uint64_t v18 = &unk_1E550E8E0;
  id v8 = v4;
  id v19 = v8;
  int v9 = [v6 rankedNamedEntitiesWithQuery:v7 error:&v20 handleBatch:&v15];
  id v10 = v20;

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[NSObject _setLastCallDateForQuery:](WeakRetained, "_setLastCallDateForQuery:", *(void *)(a1 + 32), v15, v16, v17, v18);
  }
  else
  {
    id WeakRetained = pp_entities_log_handle();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      id v22 = v10;
      __int16 v23 = 2112;
      id v24 = v3;
      __int16 v25 = 2112;
      uint64_t v26 = v14;
      _os_log_error_impl(&dword_18CAA6000, WeakRetained, OS_LOG_TYPE_ERROR, "error %@ during rankedNamedEntitiesWithQuery for delegate %@ and query %@", buf, 0x20u);
    }
  }

  return v8;
}

void __50__PPXPCNamedEntityStore__recordGeneratorForQuery___block_invoke_41(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (!*a3)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          char v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
          id v13 = (void *)MEMORY[0x192F97350](v8);
          uint64_t v14 = *(void **)(a1 + 32);
          uint64_t v15 = objc_msgSend(v12, "item", (void)v17);
          uint64_t v16 = [v15 mostRelevantRecord];
          [v14 addObject:v16];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        uint64_t v9 = v8;
      }
      while (v8);
    }
  }
}

- (id)_monitoringHelperForQuery:(id)a3 createIfNeeded:(BOOL)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__1192;
  long long v19 = __Block_byref_object_dispose__1193;
  id v20 = 0;
  monitoringSessionsLock = self->_monitoringSessionsLock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__PPXPCNamedEntityStore__monitoringHelperForQuery_createIfNeeded___block_invoke;
  v11[3] = &unk_1E550DFB8;
  id v8 = v6;
  BOOL v14 = a4;
  id v12 = v8;
  id v13 = &v15;
  [(_PASLock *)monitoringSessionsLock runWithLockAcquired:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __66__PPXPCNamedEntityStore__monitoringHelperForQuery_createIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [v14 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v4 = v3;
  if (*(unsigned char *)(a1 + 48)) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v9 = [PPRecordMonitoringHelper alloc];
    uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"NamedEntityStore:%@", *(void *)(a1 + 32)];
    uint64_t v11 = [(PPRecordMonitoringHelper *)v9 initWithName:v10];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    id v8 = [[PPXPCNamedEntityStoreQueryMonitorSession alloc] initWithMonitoringHelper:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    [v14 setObject:v8 forKeyedSubscript:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v6 = [v3 monitoringHelper];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(PPXPCNamedEntityStoreQueryMonitorSession **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (void)_setLastCallDateForQuery:(id)a3
{
  id v4 = a3;
  monitoringSessionsLock = self->_monitoringSessionsLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__PPXPCNamedEntityStore__setLastCallDateForQuery___block_invoke;
  v7[3] = &unk_1E550E2D0;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)monitoringSessionsLock runWithLockAcquired:v7];
}

void __50__PPXPCNamedEntityStore__setLastCallDateForQuery___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  [v2 setLastCallDate];
}

- (id)_lastCallDateForQuery:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__1192;
  uint64_t v16 = __Block_byref_object_dispose__1193;
  id v17 = 0;
  monitoringSessionsLock = self->_monitoringSessionsLock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__PPXPCNamedEntityStore__lastCallDateForQuery___block_invoke;
  v9[3] = &unk_1E550DF90;
  uint64_t v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [(_PASLock *)monitoringSessionsLock runWithLockAcquired:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __47__PPXPCNamedEntityStore__lastCallDateForQuery___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v3 = [v6 lastCallDate];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)donateLocationNamedEntities:(id)a3 bundleId:(id)a4 groupId:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = +[PPNamedEntityReadWriteClient sharedInstance];
  LOBYTE(a6) = [v12 donateLocationNamedEntities:v11 bundleId:v10 groupId:v9 error:a6];

  return (char)a6;
}

- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4
{
  id v6 = +[PPNamedEntityReadWriteClient sharedInstance];
  LOBYTE(a4) = [v6 clearWithError:a3 deletedCount:a4];

  return (char)a4;
}

- (BOOL)cloudSyncWithError:(id *)a3
{
  uint64_t v4 = +[PPNamedEntityReadWriteClient sharedInstance];
  LOBYTE(a3) = [v4 cloudSyncWithError:a3];

  return (char)a3;
}

- (BOOL)removeMapItemsBeforeCutoffDate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[PPNamedEntityReadWriteClient sharedInstance];
  LOBYTE(a4) = [v6 removeMapItemsBeforeDate:v5 error:a4];

  return (char)a4;
}

- (BOOL)removeMapItemForPlaceName:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[PPNamedEntityReadWriteClient sharedInstance];
  LOBYTE(a4) = [v6 removeMapItemForPlaceName:v5 error:a4];

  return (char)a4;
}

- (id)mapItemForPlaceName:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[PPNamedEntityReadOnlyClient sharedInstance];
  id v7 = [v6 mapItemForPlaceName:v5 error:a4];

  return v7;
}

- (BOOL)donateMapItem:(id)a3 forPlaceName:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[PPNamedEntityReadWriteClient sharedInstance];
  LOBYTE(a5) = [v9 donateMapItem:v8 forPlaceName:v7 error:a5];

  return (char)a5;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThan:(id)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = +[PPNamedEntityReadWriteClient sharedInstance];
  LOBYTE(a7) = [v14 deleteAllNamedEntitiesFromSourcesWithBundleId:v13 groupId:v12 olderThanDate:v11 deletedCount:a6 error:a7];

  return (char)a7;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a3;
  id v11 = +[PPNamedEntityReadWriteClient sharedInstance];
  LOBYTE(a6) = [v11 deleteAllNamedEntitiesFromSourcesWithBundleId:v10 groupIds:v9 deletedCount:a5 error:a6];

  return (char)a6;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a3;
  id v11 = +[PPNamedEntityReadWriteClient sharedInstance];
  LOBYTE(a6) = [v11 deleteAllNamedEntitiesFromSourcesWithBundleId:v10 documentIds:v9 deletedCount:a5 error:a6];

  return (char)a6;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = +[PPNamedEntityReadWriteClient sharedInstance];
  LOBYTE(a5) = [v8 deleteAllNamedEntitiesFromSourcesWithBundleId:v7 deletedCount:a4 error:a5];

  return (char)a5;
}

- (BOOL)flushDonationsWithError:(id *)a3
{
  uint64_t v4 = +[PPNamedEntityReadWriteClient sharedInstance];
  LOBYTE(a3) = [v4 flushDonationsWithError:a3];

  return (char)a3;
}

- (BOOL)donateNamedEntities:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 error:(id *)a8
{
  BOOL v10 = a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = v16;
  if (!v15)
  {
    uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PPXPCNamedEntityStore.m", 173, @"Invalid parameter not satisfying: %@", @"entities" object file lineNumber description];

    if (v17) {
      goto LABEL_3;
    }
LABEL_11:
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PPXPCNamedEntityStore.m", 174, @"Invalid parameter not satisfying: %@", @"source" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v16) {
    goto LABEL_11;
  }
LABEL_3:
  long long v18 = pp_entities_signpost_handle();
  os_signpost_id_t v19 = os_signpost_id_generate(v18);

  id v20 = pp_entities_signpost_handle();
  id v21 = v20;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "PPXPCNamedEntityStore.donateNamedEntities", (const char *)&unk_18CB1211E, buf, 2u);
  }

  uint64_t v22 = +[PPNamedEntityReadWriteClient sharedInstance];
  char v23 = [v22 donateNamedEntities:v15 source:v17 algorithm:a5 cloudSync:v10 sentimentScore:a8 error:a7];

  id v24 = pp_entities_signpost_handle();
  __int16 v25 = v24;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)v29 = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v25, OS_SIGNPOST_INTERVAL_END, v19, "PPXPCNamedEntityStore.donateNamedEntities", (const char *)&unk_18CB1211E, v29, 2u);
  }

  return v23;
}

- (id)namedEntityRecordsWithQuery:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_opt_new();
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  id v7 = pp_entities_signpost_handle();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = pp_entities_signpost_handle();
  BOOL v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PPXPCNamedEntityStore.namedEntityRecordsWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  id v11 = +[PPNamedEntityReadOnlyClient sharedInstance];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __59__PPXPCNamedEntityStore_namedEntityRecordsWithQuery_error___block_invoke;
  v27[3] = &unk_1E550E260;
  id v12 = v6;
  id v28 = v12;
  v29 = &v31;
  int v13 = [v11 namedEntityRecordsWithQuery:v5 error:a4 handleBatch:v27];

  uint64_t v14 = pp_entities_signpost_handle();
  id v15 = v14;
  if (v8 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PPXPCNamedEntityStore.namedEntityRecordsWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  if (v13)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v17 = (void *)[v16 initWithCapacity:v32[3]];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v18 = v12;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(v17, "addObjectsFromArray:", *(void *)(*((void *)&v23 + 1) + 8 * i), (void)v23);
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
      }
      while (v19);
    }
  }
  else
  {
    id v17 = 0;
  }

  _Block_object_dispose(&v31, 8);
  return v17;
}

void __59__PPXPCNamedEntityStore_namedEntityRecordsWithQuery_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 addObject:v4];
  uint64_t v5 = [v4 count];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v5;
}

- (BOOL)iterNamedEntityRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = pp_entities_signpost_handle();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  id v11 = pp_entities_signpost_handle();
  id v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PPXPCNamedEntityStore.iterNamedEntityRecordsWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  int v13 = +[PPNamedEntityReadOnlyClient sharedInstance];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__PPXPCNamedEntityStore_iterNamedEntityRecordsWithQuery_error_block___block_invoke;
  v19[3] = &unk_1E550F880;
  id v20 = v7;
  id v14 = v7;
  char v15 = [v13 namedEntityRecordsWithQuery:v8 error:a4 handleBatch:v19];

  id v16 = pp_entities_signpost_handle();
  id v17 = v16;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v17, OS_SIGNPOST_INTERVAL_END, v10, "PPXPCNamedEntityStore.iterNamedEntityRecordsWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  return v15;
}

void __69__PPXPCNamedEntityStore_iterNamedEntityRecordsWithQuery_error_block___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (!*a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        if (*a3) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (id)rankedNamedEntitiesWithQuery:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_opt_new();
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  id v7 = pp_entities_signpost_handle();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  uint64_t v9 = pp_entities_signpost_handle();
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PPXPCNamedEntityStore.rankedNamedEntitiesWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  uint64_t v11 = +[PPNamedEntityReadOnlyClient sharedInstance];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __60__PPXPCNamedEntityStore_rankedNamedEntitiesWithQuery_error___block_invoke;
  v27[3] = &unk_1E550E260;
  id v12 = v6;
  id v28 = v12;
  v29 = &v31;
  int v13 = [v11 rankedNamedEntitiesWithQuery:v5 error:a4 handleBatch:v27];

  long long v14 = pp_entities_signpost_handle();
  long long v15 = v14;
  if (v8 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PPXPCNamedEntityStore.rankedNamedEntitiesWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  if (v13)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v17 = (void *)[v16 initWithCapacity:v32[3]];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v18 = v12;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(v17, "addObjectsFromArray:", *(void *)(*((void *)&v23 + 1) + 8 * i), (void)v23);
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
      }
      while (v19);
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  _Block_object_dispose(&v31, 8);
  return v17;
}

void __60__PPXPCNamedEntityStore_rankedNamedEntitiesWithQuery_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 addObject:v4];
  uint64_t v5 = [v4 count];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v5;
}

- (BOOL)iterRankedNamedEntitiesWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = pp_entities_signpost_handle();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  uint64_t v11 = pp_entities_signpost_handle();
  id v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PPXPCNamedEntityStore.iterRankedNamedEntitiesWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  int v13 = +[PPNamedEntityReadOnlyClient sharedInstance];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__PPXPCNamedEntityStore_iterRankedNamedEntitiesWithQuery_error_block___block_invoke;
  v19[3] = &unk_1E550F880;
  id v20 = v7;
  id v14 = v7;
  char v15 = [v13 rankedNamedEntitiesWithQuery:v8 error:a4 handleBatch:v19];

  id v16 = pp_entities_signpost_handle();
  uint64_t v17 = v16;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v17, OS_SIGNPOST_INTERVAL_END, v10, "PPXPCNamedEntityStore.iterRankedNamedEntitiesWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  return v15;
}

void __70__PPXPCNamedEntityStore_iterRankedNamedEntitiesWithQuery_error_block___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (!*a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        if (*a3) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

@end