@interface ICSearchIndexer
+ (id)sharedIndexer;
- (BOOL)isDisabled;
- (BOOL)isObservingChanges;
- (BOOL)retryOnErrors;
- (ICSearchIndex)searchableIndex;
- (ICSearchIndexer)initWithSearchIndex:(id)a3;
- (ICSelectorDelayer)changeProcessingDelayer;
- (NSArray)_dataSources;
- (NSArray)dataSources;
- (NSDictionary)dataSourcesByIdentifier;
- (NSMutableDictionary)retryTimers;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)indexingQueue;
- (id)dataSourceWithIdentifier:(id)a3;
- (id)newContextsForAllDataSources;
- (id)objectForManagedObjectIDURI:(id)a3 inContexts:(id)a4;
- (id)objectForSearchableItem:(id)a3 context:(id)a4;
- (id)objectsDictionaryForSearchableItems:(id)a3 inContexts:(id)a4;
- (id)objectsForSearchableItems:(id)a3 inContexts:(id)a4;
- (id)pendingReindexingOperation;
- (void)addDataSource:(id)a3;
- (void)cancelIndexingOperationsWithCompletionHandler:(id)a3;
- (void)clearObjectIDsToProcess;
- (void)clearRetryForSelector:(SEL)a3;
- (void)dataSourceDidChange:(id)a3;
- (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3;
- (void)finishRemainingOperationsWithCompletionHandler:(id)a3;
- (void)pendingReindexingOperation;
- (void)processChanges;
- (void)reindexAllSearchableItemsInIndex;
- (void)reindexAllSearchableItemsInIndex:(id)a3 completionHandler:(id)a4;
- (void)reindexAllSearchableItemsWithCompletionHandler:(id)a3;
- (void)reindexSearchableItemsWithObjectIDURIs:(id)a3 completionHandler:(id)a4;
- (void)reindexSearchableItemsWithObjectIDURIs:(id)a3 inIndex:(id)a4 completionHandler:(id)a5;
- (void)removeDataSource:(id)a3;
- (void)retrySelector:(SEL)a3;
- (void)setChangeProcessingDelayer:(id)a3;
- (void)setDataSourcesByIdentifier:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setIndexingQueue:(id)a3;
- (void)setObservingChanges:(BOOL)a3;
- (void)setOperationQueue:(id)a3;
- (void)setRetryOnErrors:(BOOL)a3;
- (void)setRetryTimers:(id)a3;
- (void)setSearchableIndex:(id)a3;
- (void)startObservingChanges;
- (void)stopObservingChanges;
@end

@implementation ICSearchIndexer

- (void)startObservingChanges
{
  v3 = [(ICSearchIndexer *)self indexingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__ICSearchIndexer_startObservingChanges__block_invoke;
  block[3] = &unk_2640CD3A8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)stopObservingChanges
{
  v3 = [(ICSearchIndexer *)self indexingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__ICSearchIndexer_stopObservingChanges__block_invoke;
  block[3] = &unk_2640CD3A8;
  block[4] = self;
  dispatch_async(v3, block);
}

+ (id)sharedIndexer
{
  if (sharedIndexer_onceToken != -1) {
    dispatch_once(&sharedIndexer_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)sharedIndexer_sSharedIndexer;
  return v2;
}

void __40__ICSearchIndexer_startObservingChanges__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) isObservingChanges];
  v3 = os_log_create("com.apple.notes", "SearchIndexer");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4) {
      __40__ICSearchIndexer_startObservingChanges__block_invoke_cold_1();
    }
  }
  else
  {
    if (v4) {
      __40__ICSearchIndexer_startObservingChanges__block_invoke_cold_2();
    }

    [*(id *)(a1 + 32) setObservingChanges:1];
    if ((ICUseCoreDataCoreSpotlightIntegration() & 1) == 0)
    {
      v5 = [MEMORY[0x263F08A00] defaultCenter];
      [v5 addObserver:*(void *)(a1 + 32) selector:sel_dataSourceDidChange_ name:@"ICSearchIndexerDataSourceDidChangeNotification" object:0];
    }
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v3 = objc_msgSend(*(id *)(a1 + 32), "_dataSources", 0);
    uint64_t v6 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) startObservingChanges];
        }
        while (v7 != v9);
        uint64_t v7 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

void __40__ICSearchIndexer_startObservingChanges__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "Starting to listen to changes in the search indexer", v2, v3, v4, v5, v6);
}

void __39__ICSearchIndexer_stopObservingChanges__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char v2 = [*(id *)(a1 + 32) isObservingChanges];
  uint64_t v3 = os_log_create("com.apple.notes", "SearchIndexer");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4) {
      __39__ICSearchIndexer_stopObservingChanges__block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) setObservingChanges:0];
    if ((ICUseCoreDataCoreSpotlightIntegration() & 1) == 0)
    {
      uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
      [v5 removeObserver:*(void *)(a1 + 32) name:@"ICSearchIndexerDataSourceDidChangeNotification" object:0];
    }
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_dataSources", 0);
    uint64_t v6 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * i) stopObservingChanges];
        }
        uint64_t v7 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
  else if (v4)
  {
    __39__ICSearchIndexer_stopObservingChanges__block_invoke_cold_2();
  }
}

- (NSArray)_dataSources
{
  char v2 = [(ICSearchIndexer *)self dataSourcesByIdentifier];
  uint64_t v3 = [v2 allValues];

  return (NSArray *)v3;
}

void __33__ICSearchIndexer_addDataSource___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) dataSourcesByIdentifier];
  uint64_t v3 = (id *)(a1 + 40);
  BOOL v4 = [*(id *)(a1 + 40) dataSourceIdentifier];
  id v5 = [v2 objectForKeyedSubscript:v4];

  if (!v5)
  {
    uint64_t v7 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __33__ICSearchIndexer_addDataSource___block_invoke_cold_1();
    }

    uint64_t v8 = [*(id *)(a1 + 32) dataSourcesByIdentifier];
    os_log_t v6 = (os_log_t)[v8 mutableCopy];

    uint64_t v9 = *(void **)(a1 + 40);
    long long v10 = [v9 dataSourceIdentifier];
    [v6 setObject:v9 forKeyedSubscript:v10];

    [*(id *)(a1 + 32) setDataSourcesByIdentifier:v6];
    if ([*(id *)(a1 + 32) isObservingChanges]) {
      [*v3 startObservingChanges];
    }
    goto LABEL_9;
  }
  if (v5 != *v3)
  {
    os_log_t v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v11 = 0;
      _os_log_impl(&dword_20C263000, v6, OS_LOG_TYPE_INFO, "Trying to add a second data source with the same identifier. Doing nothing.", v11, 2u);
    }
LABEL_9:
  }
}

- (NSDictionary)dataSourcesByIdentifier
{
  return self->_dataSourcesByIdentifier;
}

- (BOOL)isObservingChanges
{
  return self->_observingChanges;
}

- (void)setDataSourcesByIdentifier:(id)a3
{
}

void __33__ICSearchIndexer_addDataSource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Adding indexer data source: %@", v2, v3, v4, v5, v6);
}

void __39__ICSearchIndexer_stopObservingChanges__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "Stopping listening to changes in the search indexer", v2, v3, v4, v5, v6);
}

- (ICSearchIndexer)initWithSearchIndex:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICSearchIndexer;
  uint64_t v5 = [(ICSearchIndexer *)&v18 init];
  uint8_t v6 = v5;
  if (v5)
  {
    [(ICSearchIndexer *)v5 setSearchableIndex:v4];
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.notes.indexer", 0);
    [(ICSearchIndexer *)v6 setIndexingQueue:v7];

    uint64_t v8 = [(ICSearchIndexer *)v6 indexingQueue];
    uint64_t v9 = dispatch_get_global_queue(-32768, 0);
    dispatch_set_target_queue(v8, v9);

    id v10 = objc_alloc_init(MEMORY[0x263F08A48]);
    [(ICSearchIndexer *)v6 setOperationQueue:v10];

    if (ICVerboseSearchLogging())
    {
      long long v11 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[ICSearchIndexer initWithSearchIndex:](v6, v11);
      }
    }
    long long v12 = [(ICSearchIndexer *)v6 operationQueue];
    [v12 setQualityOfService:9];

    long long v13 = [(ICSearchIndexer *)v6 operationQueue];
    [v13 setMaxConcurrentOperationCount:1];

    v14 = [NSDictionary dictionary];
    [(ICSearchIndexer *)v6 setDataSourcesByIdentifier:v14];

    if ((ICUseCoreDataCoreSpotlightIntegration() & 1) == 0)
    {
      uint64_t v15 = [[ICSelectorDelayer alloc] initWithTarget:v6 selector:sel_processChanges delay:1 waitToFireUntilRequestsStop:1 callOnMainThread:1.0];
      [(ICSearchIndexer *)v6 setChangeProcessingDelayer:v15];
    }
    [(ICSearchIndexer *)v6 setObservingChanges:0];
    v16 = [MEMORY[0x263EFF9A0] dictionary];
    [(ICSearchIndexer *)v6 setRetryTimers:v16];

    [(ICSearchIndexer *)v6 setRetryOnErrors:1];
    [(ICSearchIndexer *)v6 setDisabled:1];
  }

  return v6;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setObservingChanges:(BOOL)a3
{
  self->_observingChanges = a3;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (void)addDataSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICSearchIndexer *)self indexingQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__ICSearchIndexer_addDataSource___block_invoke;
  v7[3] = &unk_2640CD448;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (OS_dispatch_queue)indexingQueue
{
  return self->_indexingQueue;
}

- (void)setSearchableIndex:(id)a3
{
}

- (void)setRetryTimers:(id)a3
{
}

- (void)setRetryOnErrors:(BOOL)a3
{
  self->_retryOnErrors = a3;
}

- (void)setOperationQueue:(id)a3
{
}

- (void)setIndexingQueue:(id)a3
{
}

- (void)setChangeProcessingDelayer:(id)a3
{
}

void __32__ICSearchIndexer_sharedIndexer__block_invoke()
{
  uint64_t v2 = objc_alloc_init(ICSearchIndexImplementation);
  v0 = [[ICSearchIndexer alloc] initWithSearchIndex:v2];
  uint64_t v1 = (void *)sharedIndexer_sSharedIndexer;
  sharedIndexer_sSharedIndexer = (uint64_t)v0;
}

- (ICSearchIndex)searchableIndex
{
  searchableIndex = self->_searchableIndex;
  if (!searchableIndex)
  {
    id v4 = objc_alloc_init(ICSearchIndexImplementation);
    uint64_t v5 = self->_searchableIndex;
    self->_searchableIndex = (ICSearchIndex *)v4;

    searchableIndex = self->_searchableIndex;
  }
  return searchableIndex;
}

- (void)dataSourceDidChange:(id)a3
{
  id v4 = a3;
  if ((ICUseCoreDataCoreSpotlightIntegration() & 1) == 0
    && [(ICSearchIndexer *)self isObservingChanges])
  {
    uint64_t v5 = [v4 object];
    objc_initWeak(&location, v5);

    id v6 = [(ICSearchIndexer *)self indexingQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__ICSearchIndexer_dataSourceDidChange___block_invoke;
    block[3] = &unk_2640CDC48;
    objc_copyWeak(&v8, &location);
    block[4] = self;
    dispatch_async(v6, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __39__ICSearchIndexer_dataSourceDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    uint64_t v3 = [*(id *)(a1 + 32) dataSourcesByIdentifier];
    id v4 = [v7 dataSourceIdentifier];
    id v5 = [v3 objectForKeyedSubscript:v4];

    id WeakRetained = v7;
    if (v5 == v7)
    {
      id v6 = [*(id *)(a1 + 32) changeProcessingDelayer];
      [v6 requestFire];

      id WeakRetained = v7;
    }
  }
}

- (void)processChanges
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "Search indexing disabled. Bailing early from processChanges.", v2, v3, v4, v5, v6);
}

void __33__ICSearchIndexer_processChanges__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) _dataSources];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v22;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v22 != v4) {
        objc_enumerationMutation(v2);
      }
      if ([*(id *)(*((void *)&v21 + 1) + 8 * v5) needsReindexing]) {
        break;
      }
      if (v3 == ++v5)
      {
        uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v3) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v10 = [*(id *)(a1 + 32) pendingReindexingOperation];

    long long v11 = os_log_create("com.apple.notes", "SearchIndexer");
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (v12) {
        __33__ICSearchIndexer_processChanges__block_invoke_cold_4();
      }
      goto LABEL_24;
    }
    if (v12) {
      __33__ICSearchIndexer_processChanges__block_invoke_cold_3();
    }

    long long v13 = [ICReindexAllItemsOperation alloc];
    id v7 = [*(id *)(a1 + 32) searchableIndex];
    id v8 = [*(id *)(a1 + 32) _dataSources];
    uint64_t v9 = [(ICIndexItemsOperation *)v13 initWithSearchableIndex:v7 dataSources:v8];
  }
  else
  {
LABEL_9:

    uint8_t v6 = [ICIndexItemsOperation alloc];
    id v7 = [*(id *)(a1 + 32) searchableIndex];
    id v8 = [*(id *)(a1 + 32) _dataSources];
    uint64_t v9 = [(ICIndexItemsOperation *)v6 initWithSearchableIndex:v7 dataSources:v8];
  }
  long long v11 = v9;

  if (v11)
  {
    v14 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __33__ICSearchIndexer_processChanges__block_invoke_cold_2();
    }

    objc_initWeak(&location, v11);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __33__ICSearchIndexer_processChanges__block_invoke_16;
    v18[3] = &unk_2640CDC48;
    objc_copyWeak(&v19, &location);
    v18[4] = *(void *)(a1 + 32);
    [v11 setCompletionBlock:v18];
    uint64_t v15 = [*(id *)(a1 + 32) operationQueue];
    [v15 addOperation:v11];

    if (ICVerboseSearchLogging())
    {
      v16 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = [*(id *)(a1 + 32) operationQueue];
        __33__ICSearchIndexer_processChanges__block_invoke_cold_1((uint64_t)v11, v17, (uint64_t)v25);
      }
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
LABEL_24:
  }
}

void __33__ICSearchIndexer_processChanges__block_invoke_16(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([*(id *)(a1 + 32) retryOnErrors]
    && ([WeakRetained error], uint64_t v2 = objc_claimAutoreleasedReturnValue(), v2, v2))
  {
    [*(id *)(a1 + 32) retrySelector:sel_processChanges];
  }
  else
  {
    [*(id *)(a1 + 32) clearRetryForSelector:sel_processChanges];
  }
}

- (NSArray)dataSources
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  long long v11 = __Block_byref_object_copy__5;
  BOOL v12 = __Block_byref_object_dispose__5;
  id v13 = 0;
  uint64_t v3 = [(ICSearchIndexer *)self indexingQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__ICSearchIndexer_dataSources__block_invoke;
  v7[3] = &unk_2640CD2F8;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v3, v7);

  uint64_t v4 = (void *)v9[5];
  if (!v4) {
    uint64_t v4 = (void *)MEMORY[0x263EFFA68];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

void __30__ICSearchIndexer_dataSources__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _dataSources];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removeDataSource:(id)a3
{
  id v4 = a3;
  id v5 = [(ICSearchIndexer *)self indexingQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__ICSearchIndexer_removeDataSource___block_invoke;
  v7[3] = &unk_2640CD448;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __36__ICSearchIndexer_removeDataSource___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataSourcesByIdentifier];
  uint64_t v3 = [*(id *)(a1 + 40) dataSourceIdentifier];
  id v4 = [v2 objectForKeyedSubscript:v3];
  id v5 = *(void **)(a1 + 40);

  if (v4 == v5)
  {
    id v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __36__ICSearchIndexer_removeDataSource___block_invoke_cold_1();
    }

    id v7 = [*(id *)(a1 + 32) dataSourcesByIdentifier];
    id v8 = (void *)[v7 mutableCopy];

    uint64_t v9 = [*(id *)(a1 + 40) dataSourceIdentifier];
    [v8 removeObjectForKey:v9];

    [*(id *)(a1 + 32) setDataSourcesByIdentifier:v8];
    if ([*(id *)(a1 + 40) isObservingChanges]) {
      [*(id *)(a1 + 40) stopObservingChanges];
    }
  }
}

- (id)dataSourceWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  id v5 = [(ICSearchIndexer *)self indexingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__ICSearchIndexer_dataSourceWithIdentifier___block_invoke;
  block[3] = &unk_2640CD3D0;
  id v10 = v4;
  long long v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __44__ICSearchIndexer_dataSourceWithIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) dataSourcesByIdentifier];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)newContextsForAllDataSources
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(ICSearchIndexer *)self dataSources];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = (void *)[v9 newManagedObjectContext];
        if (!v10) {
          +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "context", "-[ICSearchIndexer newContextsForAllDataSources]", 1, 0, @"Expected non-nil context for dataSource %@", v9);
        }
        objc_msgSend(v3, "ic_addNonNilObject:", v10);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)reindexAllSearchableItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ICSearchIndexer *)self searchableIndex];
  [(ICSearchIndexer *)self reindexAllSearchableItemsInIndex:v5 completionHandler:v4];
}

- (void)cancelIndexingOperationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__ICSearchIndexer_cancelIndexingOperationsWithCompletionHandler___block_invoke;
  v7[3] = &unk_2640CD610;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__ICSearchIndexer_cancelIndexingOperationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __65__ICSearchIndexer_cancelIndexingOperationsWithCompletionHandler___block_invoke_cold_2();
  }

  uint64_t v3 = [*(id *)(a1 + 32) operationQueue];
  [v3 cancelAllOperations];

  if (ICVerboseSearchLogging())
  {
    id v4 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __65__ICSearchIndexer_cancelIndexingOperationsWithCompletionHandler___block_invoke_cold_1((id *)(a1 + 32), v4);
    }
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__ICSearchIndexer_cancelIndexingOperationsWithCompletionHandler___block_invoke_21;
  v6[3] = &unk_2640CDC70;
  id v5 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [v5 finishRemainingOperationsWithCompletionHandler:v6];
}

uint64_t __65__ICSearchIndexer_cancelIndexingOperationsWithCompletionHandler___block_invoke_21(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __65__ICSearchIndexer_cancelIndexingOperationsWithCompletionHandler___block_invoke_21_cold_1();
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)finishRemainingOperationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke;
  v7[3] = &unk_2640CD610;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_cold_5();
  }

  uint64_t v3 = (id *)(a1 + 32);
  id v4 = [*(id *)(a1 + 32) changeProcessingDelayer];
  int v5 = [v4 isScheduledToFire];

  if (v5)
  {
    id v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_cold_4();
    }

    id v7 = [*v3 changeProcessingDelayer];
    [v7 fireImmediately];
  }
  id v8 = [*v3 retryTimers];
  objc_sync_enter(v8);
  uint64_t v9 = [*v3 retryTimers];
  [v9 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_25];

  objc_sync_exit(v8);
  if (ICVerboseSearchLogging())
  {
    id v10 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_cold_3((id *)(a1 + 32), v10);
    }
  }
  long long v11 = [*v3 indexingQueue];
  dispatch_sync(v11, &__block_literal_global_28_1);

  if (ICVerboseSearchLogging())
  {
    long long v12 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_cold_2((id *)(a1 + 32), v12);
    }
  }
  long long v13 = [*v3 operationQueue];
  [v13 waitUntilAllOperationsAreFinished];

  long long v14 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_cold_1();
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v5 isScheduled])
  {
    id v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_22_cold_1();
    }

    [v5 fire];
  }
}

- (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICSearchIndexer deleteAllSearchableItemsWithCompletionHandler:]();
  }

  if (ICReindexAlertEnabled()) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:alertMessage:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:alertMessage:format:", "NO", "-[ICSearchIndexer deleteAllSearchableItemsWithCompletionHandler:]", 0, 1, @"An unintended indexing deletion may have happened. Do you want to file a radar?", @"Possible unintended indexing deletion");
  }
  +[ICIndexerStateHandler logMethodCall:0];
  id v6 = [(ICSearchIndexer *)self searchableIndex];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__ICSearchIndexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke;
  v8[3] = &unk_2640CDCB8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 deleteAllSearchableItemsWithCompletionHandler:v8];
}

void __65__ICSearchIndexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.notes", "SearchIndexer");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __65__ICSearchIndexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __65__ICSearchIndexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) clearObjectIDsToProcess];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (id)pendingReindexingOperation
{
  uint64_t v2 = [(ICSearchIndexer *)self operationQueue];
  id v3 = [v2 operations];
  id v4 = objc_msgSend(v3, "ic_objectPassingTest:", &__block_literal_global_40_0);

  if (!v4 && ICVerboseSearchLogging())
  {
    id v5 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ICSearchIndexer pendingReindexingOperation]();
    }
  }
  return v4;
}

uint64_t __45__ICSearchIndexer_pendingReindexingOperation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = ICDynamicCast(v3, (uint64_t)v2);

  if (!v4
    || ([v4 isCancelled] & 1) != 0
    || ([v4 isExecuting] & 1) != 0
    || ([v4 isFinished] & 1) != 0)
  {
    uint64_t v5 = 0;
  }
  else
  {
    if (ICVerboseSearchLogging())
    {
      id v7 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __45__ICSearchIndexer_pendingReindexingOperation__block_invoke_cold_1();
      }
    }
    uint64_t v5 = 1;
  }

  return v5;
}

- (void)reindexAllSearchableItemsInIndex
{
  id v3 = [(ICSearchIndexer *)self searchableIndex];
  [(ICSearchIndexer *)self reindexAllSearchableItemsInIndex:v3 completionHandler:0];
}

- (void)reindexAllSearchableItemsInIndex:(id)a3 completionHandler:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if ((ICUseCoreDataCoreSpotlightIntegration() & 1) == 0)
  {
    if ([(ICSearchIndexer *)self isDisabled])
    {
      id v8 = (void *)MEMORY[0x263F087E8];
      long long v15 = @"FailureReason";
      v16[0] = @"Indexing is disabled";
      id v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      id v10 = [v8 errorWithDomain:@"NotesErrorDomain" code:300 userInfo:v9];

      if (v7) {
        v7[2](v7, v10);
      }
    }
    else
    {
      +[ICIndexerStateHandler logMethodCall:1];
      long long v11 = [(ICSearchIndexer *)self indexingQueue];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke;
      v12[3] = &unk_2640CDD50;
      v12[4] = self;
      long long v14 = v7;
      id v13 = v6;
      dispatch_async(v11, v12);
    }
  }
}

void __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke(id *a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v2 = a1 + 4;
  id v3 = [a1[4] pendingReindexingOperation];
  id v4 = os_log_create("com.apple.notes", "SearchIndexer");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (!v3)
  {
    if (v5) {
      __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_cold_3();
    }

    id v13 = [ICReindexAllItemsOperation alloc];
    id v14 = a1[5];
    long long v15 = [a1[4] _dataSources];
    long long v12 = [(ICIndexItemsOperation *)v13 initWithSearchableIndex:v14 dataSources:v15];

    if (ICVerboseSearchLogging())
    {
      v16 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_cold_2();
      }
    }
    objc_initWeak(&location, v12);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_47;
    v21[3] = &unk_2640CDD28;
    objc_copyWeak(&v25, &location);
    id v22 = a1[5];
    id v17 = a1[6];
    id v23 = a1[4];
    id v24 = v17;
    [(ICReindexAllItemsOperation *)v12 setCompletionBlock:v21];
    objc_super v18 = [*v2 operationQueue];
    [v18 addOperation:v12];

    if (ICVerboseSearchLogging())
    {
      id v19 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v20 = [*v2 operationQueue];
        __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_cold_1((uint64_t)v12, v20, (uint64_t)v30);
      }
    }
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
    goto LABEL_23;
  }
  if (v5) {
    __33__ICSearchIndexer_processChanges__block_invoke_cold_4();
  }

  if (a1[6])
  {
    id v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_cold_5();
    }

    id v7 = (void *)MEMORY[0x263F086D0];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_46;
    v27[3] = &unk_2640CDD00;
    v29 = (ICReindexAllItemsOperation *)a1[6];
    id v8 = v3;
    id v28 = v8;
    id v9 = [v7 blockOperationWithBlock:v27];
    [v9 addDependency:v8];
    id v10 = [a1[4] operationQueue];
    [v10 addOperation:v9];

    if (ICVerboseSearchLogging())
    {
      long long v11 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_cold_4((uint64_t)v9, v2, v11);
      }
    }
    long long v12 = v29;
LABEL_23:
  }
}

void __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_46(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_47(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_47_cold_1();
  }

  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    BOOL v5 = [WeakRetained error];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  if ([*(id *)(a1 + 40) retryOnErrors]
    && ([WeakRetained error], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    [*(id *)(a1 + 40) retrySelector:sel_reindexAllSearchableItemsInIndex];
  }
  else
  {
    [*(id *)(a1 + 40) clearRetryForSelector:sel_reindexAllSearchableItemsInIndex];
  }
}

- (void)reindexSearchableItemsWithObjectIDURIs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICSearchIndexer *)self searchableIndex];
  [(ICSearchIndexer *)self reindexSearchableItemsWithObjectIDURIs:v7 inIndex:v8 completionHandler:v6];
}

- (void)reindexSearchableItemsWithObjectIDURIs:(id)a3 inIndex:(id)a4 completionHandler:(id)a5
{
  v21[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if ((ICUseCoreDataCoreSpotlightIntegration() & 1) == 0)
  {
    if ([(ICSearchIndexer *)self isDisabled])
    {
      long long v11 = (void *)MEMORY[0x263F087E8];
      v20 = @"FailureReason";
      v21[0] = @"Indexing is disabled";
      long long v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
      id v13 = [v11 errorWithDomain:@"NotesErrorDomain" code:300 userInfo:v12];

      if (v10) {
        v10[2](v10, v13);
      }
    }
    else
    {
      +[ICIndexerStateHandler logMethodCall:2];
      id v14 = [(ICSearchIndexer *)self indexingQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __84__ICSearchIndexer_reindexSearchableItemsWithObjectIDURIs_inIndex_completionHandler___block_invoke;
      block[3] = &unk_2640CDDA0;
      id v16 = v9;
      id v17 = self;
      id v18 = v8;
      id v19 = v10;
      dispatch_async(v14, block);

      id v13 = v16;
    }
  }
}

void __84__ICSearchIndexer_reindexSearchableItemsWithObjectIDURIs_inIndex_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = [ICIndexItemsByIdentifiersOperation alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) _dataSources];
  BOOL v5 = (uint64_t *)(a1 + 48);
  id v6 = [(ICIndexItemsByIdentifiersOperation *)v2 initWithSearchableIndex:v3 dataSources:v4 objectIDURIsToIndex:*(void *)(a1 + 48)];

  id v7 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __84__ICSearchIndexer_reindexSearchableItemsWithObjectIDURIs_inIndex_completionHandler___block_invoke_cold_1();
  }

  objc_initWeak(&location, v6);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __84__ICSearchIndexer_reindexSearchableItemsWithObjectIDURIs_inIndex_completionHandler___block_invoke_51;
  v12[3] = &unk_2640CDD78;
  objc_copyWeak(&v14, &location);
  id v13 = *(id *)(a1 + 56);
  [(ICIndexItemsByIdentifiersOperation *)v6 setCompletionBlock:v12];
  id v8 = [*(id *)(a1 + 40) operationQueue];
  [v8 addOperation:v6];

  if (ICVerboseSearchLogging())
  {
    id v9 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [*(id *)(a1 + 40) operationQueue];
      uint64_t v11 = *v5;
      *(_DWORD *)buf = 138412802;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_debug_impl(&dword_20C263000, v9, OS_LOG_TYPE_DEBUG, "reindexSearchableItemsWithObjectIDURIs: Added operation %@ to operation queue %@ for object ID URIs: %@", buf, 0x20u);
    }
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __84__ICSearchIndexer_reindexSearchableItemsWithObjectIDURIs_inIndex_completionHandler___block_invoke_51(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __84__ICSearchIndexer_reindexSearchableItemsWithObjectIDURIs_inIndex_completionHandler___block_invoke_51_cold_1();
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    BOOL v5 = [WeakRetained error];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

- (id)objectsForSearchableItems:(id)a3 inContexts:(id)a4
{
  id v6 = a3;
  id v7 = [(ICSearchIndexer *)self objectsDictionaryForSearchableItems:v6 inContexts:a4];
  id v8 = [MEMORY[0x263EFF980] array];
  if ([v6 count])
  {
    unint64_t v9 = 0;
    do
    {
      id v10 = [v6 objectAtIndexedSubscript:v9];
      uint64_t v11 = [v10 uniqueIdentifier];
      long long v12 = [v7 objectForKeyedSubscript:v11];

      if (v12) {
        [v8 addObject:v12];
      }

      ++v9;
    }
    while ([v6 count] > v9);
  }
  id v13 = (void *)[v8 copy];

  return v13;
}

- (id)objectForSearchableItem:(id)a3 context:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  v15[0] = a3;
  id v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  id v8 = a3;
  unint64_t v9 = [v6 arrayWithObjects:v15 count:1];
  id v14 = v7;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];

  uint64_t v11 = [(ICSearchIndexer *)self objectsForSearchableItems:v9 inContexts:v10];

  long long v12 = [v11 firstObject];

  return v12;
}

- (id)objectsDictionaryForSearchableItems:(id)a3 inContexts:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v29 = a4;
  id v25 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v5;
  uint64_t v31 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v31)
  {
    uint64_t v27 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v37 != v27) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v8 = [v7 attributeSet];
        unint64_t v9 = objc_msgSend(v8, "ic_dataSourceIdentifier");
        id v10 = [(ICSearchIndexer *)self dataSourceWithIdentifier:v9];

        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v11 = v29;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          v30 = v7;
          uint64_t v14 = *(void *)v33;
LABEL_8:
          uint64_t v15 = 0;
          while (1)
          {
            if (*(void *)v33 != v14) {
              objc_enumerationMutation(v11);
            }
            id v16 = *(void **)(*((void *)&v32 + 1) + 8 * v15);
            id v17 = [v16 persistentStoreCoordinator];
            __int16 v18 = [v10 persistentStoreCoordinator];
            char v19 = [v17 isEqual:v18];

            if (v19) {
              break;
            }
            if (v13 == ++v15)
            {
              uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
              if (v13) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
          id v20 = v16;

          if (!v20) {
            goto LABEL_20;
          }
          uint64_t v21 = [v10 objectForSearchableItem:v30 context:v20];
          if (v21)
          {
            uint64_t v22 = [v30 uniqueIdentifier];
            [v25 setObject:v21 forKey:v22];
          }
        }
        else
        {
LABEL_14:
          id v20 = v11;
        }

LABEL_20:
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v31);
  }

  id v23 = (void *)[v25 copy];
  return v23;
}

- (id)objectForManagedObjectIDURI:(id)a3 inContexts:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v31 = a3;
  id v30 = a4;
  id v6 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ICSearchIndexer objectForManagedObjectIDURI:inContexts:]();
  }

  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__5;
  v48 = __Block_byref_object_dispose__5;
  id v49 = 0;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = [(ICSearchIndexer *)self dataSources];
  uint64_t v29 = [obj countByEnumeratingWithState:&v40 objects:v55 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v41;
    *(void *)&long long v7 = 138412546;
    long long v26 = v7;
LABEL_5:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v41 != v28) {
        objc_enumerationMutation(obj);
      }
      unint64_t v9 = *(void **)(*((void *)&v40 + 1) + 8 * v8);
      id v10 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = [v9 dataSourceIdentifier];
        *(_DWORD *)buf = v26;
        v52 = v21;
        __int16 v53 = 2112;
        id v54 = v31;
        _os_log_debug_impl(&dword_20C263000, v10, OS_LOG_TYPE_DEBUG, "Checking data source (%@) for item %@", buf, 0x16u);
      }
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v11 = v30;
      id v12 = (id)[v11 countByEnumeratingWithState:&v36 objects:v50 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v37;
        while (2)
        {
          for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v37 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            id v16 = objc_msgSend(v15, "persistentStoreCoordinator", v26);
            id v17 = [v9 persistentStoreCoordinator];
            int v18 = [v16 isEqual:v17];

            if (v18)
            {
              id v12 = v15;
              goto LABEL_20;
            }
          }
          id v12 = (id)[v11 countByEnumeratingWithState:&v36 objects:v50 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_20:

      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __58__ICSearchIndexer_objectForManagedObjectIDURI_inContexts___block_invoke;
      v32[3] = &unk_2640CDDC8;
      long long v35 = &v44;
      v32[4] = v9;
      id v33 = v31;
      id v19 = v12;
      id v34 = v19;
      [v19 performBlockAndWait:v32];
      BOOL v20 = v45[5] == 0;

      if (!v20) {
        break;
      }
      if (++v8 == v29)
      {
        uint64_t v29 = [obj countByEnumeratingWithState:&v40 objects:v55 count:16];
        if (v29) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  uint64_t v22 = (void *)v45[5];
  if (!v22)
  {
    id v23 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[ICSearchIndexer objectForManagedObjectIDURI:inContexts:]();
    }

    uint64_t v22 = (void *)v45[5];
  }
  id v24 = v22;
  _Block_object_dispose(&v44, 8);

  return v24;
}

void __58__ICSearchIndexer_objectForManagedObjectIDURI_inContexts___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  uint64_t v3 = [*(id *)(a1 + 32) objectForManagedObjectIDURI:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v4 = a1 + 56;
  uint64_t v6 = *(void *)(v5 + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;

  uint64_t v8 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __58__ICSearchIndexer_objectForManagedObjectIDURI_inContexts___block_invoke_cold_1(v4, v2, v8);
  }
}

- (void)retrySelector:(SEL)a3
{
  v13[3] = *MEMORY[0x263EF8340];
  uint64_t v5 = [(ICSearchIndexer *)self retryTimers];
  objc_sync_enter(v5);
  uint64_t v6 = NSStringFromSelector(a3);
  long long v7 = [(ICSearchIndexer *)self retryTimers];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    if ([(ICBackoffTimer *)v8 isScheduled])
    {
      unint64_t v9 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[ICSearchIndexer retrySelector:]();
      }

      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v8 = [[ICBackoffTimer alloc] initWithInitialInterval:self maxInterval:a3 target:v6 selector:1.0 userInfo:300.0];
    id v10 = [(ICSearchIndexer *)self retryTimers];
    [v10 setObject:v8 forKeyedSubscript:v6];
  }
  id v11 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    [(ICBackoffTimer *)v8 nextTimeInterval];
    -[ICSearchIndexer retrySelector:]((uint64_t)v6, (uint64_t)v13, v11, v12);
  }

  [(ICBackoffTimer *)v8 scheduleToFire];
LABEL_10:

  objc_sync_exit(v5);
}

- (void)clearRetryForSelector:(SEL)a3
{
  uint64_t v5 = [(ICSearchIndexer *)self retryTimers];
  objc_sync_enter(v5);
  uint64_t v6 = NSStringFromSelector(a3);
  long long v7 = [(ICSearchIndexer *)self retryTimers];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    unint64_t v9 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ICSearchIndexer clearRetryForSelector:]();
    }

    [v8 invalidate];
    id v10 = [(ICSearchIndexer *)self retryTimers];
    [v10 removeObjectForKey:v6];
  }
  objc_sync_exit(v5);
}

- (void)clearObjectIDsToProcess
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [(ICSearchIndexer *)self dataSources];
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) clearObjectIDsToProcess];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (BOOL)retryOnErrors
{
  return self->_retryOnErrors;
}

- (ICSelectorDelayer)changeProcessingDelayer
{
  return self->_changeProcessingDelayer;
}

- (NSMutableDictionary)retryTimers
{
  return self->_retryTimers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimers, 0);
  objc_storeStrong((id *)&self->_changeProcessingDelayer, 0);
  objc_storeStrong((id *)&self->_dataSourcesByIdentifier, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_indexingQueue, 0);
  objc_storeStrong((id *)&self->_searchableIndex, 0);
}

- (void)initWithSearchIndex:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 operationQueue];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_20C263000, a2, v4, "ICSearchIndexer created operation queue %@", v5);
}

void __40__ICSearchIndexer_startObservingChanges__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "Trying to listen for changes, but we are already", v2, v3, v4, v5, v6);
}

void __39__ICSearchIndexer_stopObservingChanges__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "Trying to stop listening for changes, but we're not listening", v2, v3, v4, v5, v6);
}

void __33__ICSearchIndexer_processChanges__block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_7_0(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_5_1(&dword_20C263000, v6, v4, "processChanges: Added operation %@ to operation queue %@", v5);
}

void __33__ICSearchIndexer_processChanges__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Processing changes with indexing operation %@", v2, v3, v4, v5, v6);
}

void __33__ICSearchIndexer_processChanges__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "No pending reindexing operation observed, creating new reindexing operation", v2, v3, v4, v5, v6);
}

void __33__ICSearchIndexer_processChanges__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "Pending reindexing operation observed, Not creating new reindexing operation", v2, v3, v4, v5, v6);
}

void __36__ICSearchIndexer_removeDataSource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Removing indexer data source: %@", v2, v3, v4, v5, v6);
}

void __65__ICSearchIndexer_cancelIndexingOperationsWithCompletionHandler___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*a1 operationQueue];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_20C263000, a2, v4, "cancelIndexingOperationsWithCompletionHandler: canceled all operations for operation queue %@", v5);
}

void __65__ICSearchIndexer_cancelIndexingOperationsWithCompletionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "Cancelling indexing operations", v2, v3, v4, v5, v6);
}

void __65__ICSearchIndexer_cancelIndexingOperationsWithCompletionHandler___block_invoke_21_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "Finished cancelling indexing operations", v2, v3, v4, v5, v6);
}

void __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "Finished remaining indexing operations", v2, v3, v4, v5, v6);
}

void __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_cold_2(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*a1 operationQueue];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_20C263000, a2, v4, "Starting to wait on indexer operation queue %@", v5);
}

void __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_cold_3(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*a1 indexingQueue];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_20C263000, a2, v4, "Starting to wait on indexing queue %@", v5);
}

void __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "Index processing was scheduled, firing now", v2, v3, v4, v5, v6);
}

void __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "Finishing remaining indexing operations", v2, v3, v4, v5, v6);
}

void __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_22_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Retry timer %@ was scheduled. Firing now.", v2, v3, v4, v5, v6);
}

- (void)deleteAllSearchableItemsWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "Deleting all searchable items", v2, v3, v4, v5, v6);
}

void __65__ICSearchIndexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "Finished deleting all searchable items", v2, v3, v4, v5, v6);
}

void __65__ICSearchIndexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_20C263000, v0, OS_LOG_TYPE_ERROR, "Error deleting all searchable items: %@", v1, 0xCu);
}

- (void)pendingReindexingOperation
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "Did not find pending reindxing operations", v2, v3, v4, v5, v6);
}

void __45__ICSearchIndexer_pendingReindexingOperation__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Found pending reindexing operation %@", v2, v3, v4, v5, v6);
}

void __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_7_0(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_5_1(&dword_20C263000, v6, v4, "reindexAllSearchableItemsInIndex: Added operation %@ to operation queue %@", v5);
}

void __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Created Reindexing Operation: %@", v2, v3, v4, v5, v6);
}

void __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Reindexing all searchable items in searchable index: %@", v2, v3, v4, v5, v6);
}

void __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_cold_4(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*a2 operationQueue];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  long long v10 = v5;
  OUTLINED_FUNCTION_5_1(&dword_20C263000, a3, v6, "Added completion handler operation %@ to operation queue: %@", (uint8_t *)&v7);
}

void __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "attaching completion handler to the pending reindexing operation", v2, v3, v4, v5, v6);
}

void __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_47_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Finished reindexing all searchable items in index: %@", v2, v3, v4, v5, v6);
}

void __84__ICSearchIndexer_reindexSearchableItemsWithObjectIDURIs_inIndex_completionHandler___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5_1(&dword_20C263000, v0, (uint64_t)v0, "Adding indexing operation %@ with objectIDURIs: %@", v1);
}

void __84__ICSearchIndexer_reindexSearchableItemsWithObjectIDURIs_inIndex_completionHandler___block_invoke_51_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Finished indexing operation %@", v2, v3, v4, v5, v6);
}

- (void)objectForManagedObjectIDURI:inContexts:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Couldn't find object for %@", v2, v3, v4, v5, v6);
}

- (void)objectForManagedObjectIDURI:inContexts:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Fetching object for objectIDURI %@", v2, v3, v4, v5, v6);
}

void __58__ICSearchIndexer_objectForManagedObjectIDURI_inContexts___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  objc_opt_class();
  OUTLINED_FUNCTION_6();
  id v5 = v4;
  OUTLINED_FUNCTION_5_1(&dword_20C263000, a3, v6, "Found %@ for %@", v7);
}

- (void)retrySelector:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3, double a4)
{
  *(_DWORD *)a2 = 138412546;
  *(void *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2048;
  *(double *)(a2 + 14) = a4;
  OUTLINED_FUNCTION_5_1(&dword_20C263000, a3, (uint64_t)a3, "Scheduling selector %@ to retry in %.0fs", (uint8_t *)a2);
}

- (void)retrySelector:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Trying to retry %@, but it's already scheduled to be retried", v2, v3, v4, v5, v6);
}

- (void)clearRetryForSelector:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Clearing retry timer for selector: %@", v2, v3, v4, v5, v6);
}

@end