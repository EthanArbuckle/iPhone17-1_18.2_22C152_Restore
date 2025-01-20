@interface PXSharedLibrarySharingSuggestionsDataSourceManager
+ (id)sharedQueue;
+ (void)loadAsyncDataSourcesImmediately;
- (BOOL)hasLoadedInitially;
- (BOOL)isPerformingInitialLoad;
- (NSDate)aggregateBeforeDate;
- (NSDate)considerNewAfterDate;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)sharedQueue;
- (PHPhotoLibrary)photoLibrary;
- (PXSharedLibrarySharingSuggestionsCountsManager)countsManager;
- (PXSharedLibrarySharingSuggestionsDataSourceManager)init;
- (PXSharedLibrarySharingSuggestionsDataSourceManager)initWithPhotoLibrary:(id)a3;
- (PXUpdater)updater;
- (id)_createDataSourceWithSharingSuggestions:(id)a3;
- (id)_fetchInitialDataSource;
- (id)_promiseForContainer:(id)a3;
- (id)createInitialDataSource;
- (id)dataSource:(id)a3 promiseForContainer:(id)a4;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (void)_handleInitialDataSourceLoaded:(id)a3;
- (void)_invalidatePromisesUnreadState;
- (void)_publishChangesForForContainers:(id)a3;
- (void)_queue_fulfillRemainingPromises;
- (void)_scheduleFulfillRemainingPromises;
- (void)_setNeedsUpdate;
- (void)_setPromise:(id)a3 forContainer:(id)a4;
- (void)_updatePromisesUnreadState;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4;
- (void)setAggregateBeforeDate:(id)a3;
- (void)setConsiderNewAfterDate:(id)a3;
- (void)setDataSource:(id)a3 changeDetails:(id)a4;
- (void)setSharedQueue:(id)a3;
@end

@implementation PXSharedLibrarySharingSuggestionsDataSourceManager

void __65__PXSharedLibrarySharingSuggestionsDataSourceManager_sharedQueue__block_invoke_2()
{
}

- (PXSharedLibrarySharingSuggestionsDataSourceManager)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PXSharedLibrarySharingSuggestionsDataSourceManager;
  v6 = [(PXSectionedDataSourceManager *)&v21 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lock_promiseByContainer = v7->_lock_promiseByContainer;
    v7->_lock_promiseByContainer = v8;

    uint64_t v10 = +[PXSharedLibrarySharingSuggestionsDataSourceManager sharedQueue];
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-15552000.0];
    aggregateBeforeDate = v7->_aggregateBeforeDate;
    v7->_aggregateBeforeDate = (NSDate *)v12;

    uint64_t v14 = objc_msgSend(v5, "px_sharedLibrarySharingSuggestionsCountsManager");
    countsManager = v7->_countsManager;
    v7->_countsManager = (PXSharedLibrarySharingSuggestionsCountsManager *)v14;

    [(PXSharedLibrarySharingSuggestionsCountsManager *)v7->_countsManager registerChangeObserver:v7 context:PXSharedLibrarySharingSuggestionsCountsManagerObserverContext];
    uint64_t v16 = [(PXSharedLibrarySharingSuggestionsCountsManager *)v7->_countsManager mostRecentUserSeenAddedDate];
    considerNewAfterDate = v7->_considerNewAfterDate;
    v7->_considerNewAfterDate = (NSDate *)v16;

    uint64_t v18 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v7 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v7->_updater;
    v7->_updater = (PXUpdater *)v18;

    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updatePromisesUnreadState];
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
    objc_msgSend(v5, "px_registerChangeObserver:", v7);
  }

  return v7;
}

+ (id)sharedQueue
{
  if (sharedQueue_onceToken_112606 != -1) {
    dispatch_once(&sharedQueue_onceToken_112606, &__block_literal_global_112607);
  }
  v2 = (void *)sharedQueue_sharedQueue_112608;
  return v2;
}

void __65__PXSharedLibrarySharingSuggestionsDataSourceManager_sharedQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  attr = dispatch_queue_attr_make_initially_inactive(v1);

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.photos.sharedLibrary.sharing-suggestions-fetch-queue", attr);
  v3 = (void *)sharedQueue_sharedQueue_112608;
  sharedQueue_sharedQueue_112608 = (uint64_t)v2;

  v4 = +[PXPreloadScheduler sharedScheduler];
  [v4 scheduleMainQueueTask:&__block_literal_global_202_112612];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateBeforeDate, 0);
  objc_storeStrong((id *)&self->_considerNewAfterDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_countsManager, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_sharedQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_lock_promiseByContainer, 0);
}

- (void)setAggregateBeforeDate:(id)a3
{
}

- (NSDate)aggregateBeforeDate
{
  return self->_aggregateBeforeDate;
}

- (NSDate)considerNewAfterDate
{
  return self->_considerNewAfterDate;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PXSharedLibrarySharingSuggestionsCountsManager)countsManager
{
  return self->_countsManager;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void)setSharedQueue:(id)a3
{
}

- (OS_dispatch_queue)sharedQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 152, 1);
}

- (BOOL)hasLoadedInitially
{
  return self->_hasLoadedInitially;
}

- (BOOL)isPerformingInitialLoad
{
  return self->_isPerformingInitialLoad;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self currentDataSource];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 sharingSuggestions];
    v9 = [v5 changeDetailsForFetchResult:v8];

    if (v9)
    {
      uint64_t v10 = [v9 fetchResultAfterChanges];
      v11 = [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self _createDataSourceWithSharingSuggestions:v10];

      uint64_t v12 = [v7 containers];
      v13 = [v11 containers];
      uint64_t v14 = [v9 changedObjects];
      objc_super v21 = [off_1E5DA5568 changeDetailsFromArray:v12 toArray:v13 changedObjects:v14 objectComparator:&__block_literal_global_244_112397];

      id v15 = objc_alloc((Class)off_1E5DA8488);
      uint64_t v16 = [v7 identifier];
      uint64_t v17 = [v11 identifier];
      uint64_t v18 = [off_1E5DA5568 changeDetailsWithNoChanges];
      v22 = &unk_1F02D7ED0;
      v23[0] = v21;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      v20 = (void *)[v15 initWithFromDataSourceIdentifier:v16 toDataSourceIdentifier:v17 sectionChanges:v18 itemChangeDetailsBySection:v19 subitemChangeDetailsByItemBySection:0];

      [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self setDataSource:v11 changeDetails:v20];
    }
  }
}

uint64_t __104__PXSharedLibrarySharingSuggestionsDataSourceManager_photoLibraryDidChangeOnMainQueue_withPreparedInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_msgSend(v4, "px_sl_identifier");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_sl_identifier");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {

    uint64_t v10 = 0;
  }
  else
  {
    char v8 = [v6 isEqualToString:v7];

    if ((unsigned char *)v4 - (unsigned char *)v5 >= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = ((unsigned char *)v4 - (unsigned char *)v5) >> 63;
    }
    if (v8) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = v9;
    }
  }

  return v10;
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__112405;
  uint64_t v18 = __Block_byref_object_dispose__112406;
  id v19 = 0;
  lock_promiseByContainer = self->_lock_promiseByContainer;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __83__PXSharedLibrarySharingSuggestionsDataSourceManager_prepareForPhotoLibraryChange___block_invoke;
  v11 = &unk_1E5DBAE28;
  id v6 = v4;
  id v12 = v6;
  v13 = &v14;
  [(NSMutableDictionary *)lock_promiseByContainer enumerateKeysAndObjectsUsingBlock:&v8];
  if (v15[5]) {
    -[NSMutableDictionary removeObjectsForKeys:](self->_lock_promiseByContainer, "removeObjectsForKeys:", v8, v9, v10, v11);
  }
  os_unfair_lock_unlock(&self->_lock);

  _Block_object_dispose(&v14, 8);
  return 0;
}

void __83__PXSharedLibrarySharingSuggestionsDataSourceManager_prepareForPhotoLibraryChange___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  v3 = objc_msgSend(v10, "px_sl_containedSharingSuggestionObjectIDs");
  id v4 = [*(id *)(a1 + 32) updatedObjectIDs];
  int v5 = [v3 intersectsSet:v4];

  if (v5)
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v6 addObject:v10];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXSharedLibrarySharingSuggestionsCountsManagerObserverContext != a5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXSharedLibrarySharingSuggestionsDataSourceManager.m", 378, @"%@ got unexpected observer context:%p", self, a5 object file lineNumber description];

    abort();
  }
  id v10 = v9;
  if ((v6 & 4) != 0)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __83__PXSharedLibrarySharingSuggestionsDataSourceManager_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E5DBAE00;
    v12[4] = self;
    [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self performChanges:v12];
  }
}

void __83__PXSharedLibrarySharingSuggestionsDataSourceManager_observable_didChange_context___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) countsManager];
  dispatch_queue_t v2 = [v3 mostRecentUserSeenAddedDate];
  [*(id *)(a1 + 32) setConsiderNewAfterDate:v2];
}

- (id)dataSource:(id)a3 promiseForContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self currentDataSource];
  if (v8 == v6)
  {
  }
  else
  {
    BOOL hasLoadedInitially = self->_hasLoadedInitially;

    if (hasLoadedInitially)
    {
      id v10 = 0;
      goto LABEL_6;
    }
  }
  id v10 = [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self _promiseForContainer:v7];
LABEL_6:

  return v10;
}

- (void)_updatePromisesUnreadState
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self considerNewAfterDate];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_promiseByContainer = self->_lock_promiseByContainer;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __80__PXSharedLibrarySharingSuggestionsDataSourceManager__updatePromisesUnreadState__block_invoke;
  v23[3] = &unk_1E5DBADD8;
  id v18 = v3;
  id v24 = v18;
  id v7 = v4;
  id v25 = v7;
  id v8 = v5;
  id v26 = v8;
  [(NSMutableDictionary *)lock_promiseByContainer enumerateKeysAndObjectsUsingBlock:v23];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v15 = self->_lock_promiseByContainer;
        uint64_t v16 = objc_msgSend(v14, "container", lock, v18, (void)v19);
        [(NSMutableDictionary *)v15 setObject:v14 forKeyedSubscript:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v11);
  }

  os_unfair_lock_unlock(lock);
  if ([v8 count]) {
    [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self _publishChangesForForContainers:v8];
  }
}

void __80__PXSharedLibrarySharingSuggestionsDataSourceManager__updatePromisesUnreadState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = (void *)[a3 copyIfNeededWithUpdatedConsiderNewAfterDate:*(void *)(a1 + 32)];
  if (v5)
  {
    [*(id *)(a1 + 40) addObject:v5];
    [*(id *)(a1 + 48) addObject:v6];
  }
}

- (void)_invalidatePromisesUnreadState
{
  id v2 = [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePromisesUnreadState];
}

- (void)_setNeedsUpdate
{
}

- (void)_publishChangesForForContainers:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  id v6 = [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self currentDataSource];
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v4;
  uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * v11);
        v13 = [v6 containers];
        uint64_t v14 = [v13 indexOfObject:v12];

        if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
          [(PXSharedLibrarySharingSuggestionsDataSourceManager *)v5 _setPromise:0 forContainer:v12];
        }
        else {
          [v7 addIndex:v14];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v9);
  }

  id v15 = v7;
  if ([v7 count])
  {
    uint64_t v16 = [v6 sharingSuggestions];
    uint64_t v17 = [(PXSharedLibrarySharingSuggestionsDataSourceManager *)v5 _createDataSourceWithSharingSuggestions:v16];

    id v24 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v18 = [v6 identifier];
    uint64_t v19 = [v17 identifier];
    long long v20 = [off_1E5DA5568 changeDetailsWithNoChanges];
    v30 = &unk_1F02D7ED0;
    id v15 = v7;
    long long v21 = [off_1E5DA5568 changeDetailsWithChangedIndexes:v7];
    v31 = v21;
    long long v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    v23 = (void *)[v24 initWithFromDataSourceIdentifier:v18 toDataSourceIdentifier:v19 sectionChanges:v20 itemChangeDetailsBySection:v22 subitemChangeDetailsByItemBySection:0];

    [(PXSharedLibrarySharingSuggestionsDataSourceManager *)v5 setDataSource:v17 changeDetails:v23];
  }
}

- (void)_queue_fulfillRemainingPromises
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSMutableDictionary *)self->_lock_promiseByContainer copy];
  os_unfair_lock_unlock(p_lock);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PXSharedLibrarySharingSuggestionsDataSourceManager__queue_fulfillRemainingPromises__block_invoke;
  aBlock[3] = &unk_1E5DD20C8;
  id v6 = v5;
  id v14 = v6;
  objc_copyWeak(&v15, &location);
  id v7 = _Block_copy(aBlock);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__PXSharedLibrarySharingSuggestionsDataSourceManager__queue_fulfillRemainingPromises__block_invoke_3;
  v10[3] = &unk_1E5DBADB0;
  v10[4] = self;
  id v8 = v6;
  id v11 = v8;
  uint64_t v9 = v7;
  id v12 = v9;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];
  v9[2](v9);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __85__PXSharedLibrarySharingSuggestionsDataSourceManager__queue_fulfillRemainingPromises__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = (void *)[*(id *)(a1 + 32) copy];
    [*(id *)(a1 + 32) removeAllObjects];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __85__PXSharedLibrarySharingSuggestionsDataSourceManager__queue_fulfillRemainingPromises__block_invoke_2;
    v4[3] = &unk_1E5DD20C8;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    id v5 = v2;
    id v3 = v2;
    dispatch_async(MEMORY[0x1E4F14428], v4);

    objc_destroyWeak(&v6);
  }
}

void __85__PXSharedLibrarySharingSuggestionsDataSourceManager__queue_fulfillRemainingPromises__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  if ([a3 isPlaceholder])
  {
    id v5 = [PXSharedLibrarySharingSuggestionPromise alloc];
    id v6 = [*(id *)(a1 + 32) considerNewAfterDate];
    id v7 = [(PXSharedLibrarySharingSuggestionPromise *)v5 initWithContainer:v8 considerNewAfterDate:v6 lightweightPlaceholder:0];

    [*(id *)(a1 + 32) _setPromise:v7 forContainer:v8];
    [*(id *)(a1 + 40) addObject:v8];
    if ((unint64_t)[*(id *)(a1 + 40) count] >= 2) {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void __85__PXSharedLibrarySharingSuggestionsDataSourceManager__queue_fulfillRemainingPromises__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _publishChangesForForContainers:*(void *)(a1 + 32)];
}

- (void)_scheduleFulfillRemainingPromises
{
  objc_initWeak(&location, self);
  id v3 = [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __87__PXSharedLibrarySharingSuggestionsDataSourceManager__scheduleFulfillRemainingPromises__block_invoke;
  v4[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __87__PXSharedLibrarySharingSuggestionsDataSourceManager__scheduleFulfillRemainingPromises__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_fulfillRemainingPromises");
}

- (void)_setPromise:(id)a3 forContainer:(id)a4
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableDictionary *)self->_lock_promiseByContainer setObject:v8 forKeyedSubscript:v7];

  os_unfair_lock_unlock(p_lock);
}

- (id)_promiseForContainer:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(NSMutableDictionary *)self->_lock_promiseByContainer objectForKeyedSubscript:v4];
  id v6 = v5;
  if (!v5)
  {
LABEL_4:
    id v12 = [PXSharedLibrarySharingSuggestionPromise alloc];
    v13 = [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self considerNewAfterDate];
    uint64_t v14 = [(PXSharedLibrarySharingSuggestionPromise *)v12 initWithContainer:v4 considerNewAfterDate:v13 lightweightPlaceholder:1];

    [(NSMutableDictionary *)self->_lock_promiseByContainer setObject:v14 forKeyedSubscript:v4];
    [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self _scheduleFulfillRemainingPromises];
    id v6 = (void *)v14;
    goto LABEL_6;
  }
  id v7 = [v5 container];
  objc_msgSend(v7, "px_sl_containedSharingSuggestionObjectIDs");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_sl_containedSharingSuggestionObjectIDs");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v9)
  {
    uint64_t v10 = v9;
    char v11 = [v8 isEqual:v9];

    if (v11) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }

LABEL_6:
  os_unfair_lock_unlock(&self->_lock);

  return v6;
}

- (id)_createDataSourceWithSharingSuggestions:(id)a3
{
  id v4 = a3;
  id v5 = [PXSharedLibrarySharingSuggestionsDataSource alloc];
  id v6 = [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self aggregateBeforeDate];
  id v7 = [(PXSharedLibrarySharingSuggestionsDataSource *)v5 initWithSharingSuggestions:v4 aggregateBeforeDate:v6];

  [(PXSharedLibrarySharingSuggestionsDataSource *)v7 setDelegate:self];
  return v7;
}

- (void)setDataSource:(id)a3 changeDetails:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__PXSharedLibrarySharingSuggestionsDataSourceManager_setDataSource_changeDetails___block_invoke;
  v10[3] = &unk_1E5DBAD88;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self performChanges:v10];
}

id __82__PXSharedLibrarySharingSuggestionsDataSourceManager_setDataSource_changeDetails___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataSourceIfExists];
  if (v2)
  {
    id v3 = (void *)v2;
    id v4 = [*(id *)(a1 + 32) dataSourceIfExists];
    int v5 = [v4 containsAnyItems];
    int v6 = [*(id *)(a1 + 40) containsAnyItems];

    if (v5 != v6) {
      [*(id *)(a1 + 32) signalChange:2];
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)PXSharedLibrarySharingSuggestionsDataSourceManager;
  return objc_msgSendSuper2(&v10, sel_setDataSource_changeDetails_, v7, v8);
}

- (void)_handleInitialDataSourceLoaded:(id)a3
{
  self->_isPerformingInitialLoad = 0;
  self->_BOOL hasLoadedInitially = 1;
  [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self setDataSource:a3 changeDetails:0];
}

- (id)createInitialDataSource
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![(PXSharedLibrarySharingSuggestionsDataSourceManager *)self isPerformingInitialLoad])
  {
    id v3 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = objc_opt_class();
      __int16 v18 = 2048;
      uint64_t v19 = self;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "<%{public}@:%p>: Creating initial data source asynchronously", buf, 0x16u);
    }

    id v4 = [MEMORY[0x1E4F1C9C8] now];
    self->_isPerformingInitialLoad = 1;
    objc_initWeak((id *)buf, self);
    int v5 = [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__PXSharedLibrarySharingSuggestionsDataSourceManager_createInitialDataSource__block_invoke;
    block[3] = &unk_1E5DD2548;
    objc_copyWeak(&v15, (id *)buf);
    block[4] = self;
    id v14 = v4;
    id v6 = v4;
    dispatch_async(v5, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  id v7 = objc_alloc(MEMORY[0x1E4F39150]);
  uint64_t v8 = [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self photoLibrary];
  id v9 = [MEMORY[0x1E4F39238] fetchType];
  objc_super v10 = (void *)[v7 initWithOids:MEMORY[0x1E4F1CBF0] photoLibrary:v8 fetchType:v9 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

  id v11 = [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self _createDataSourceWithSharingSuggestions:v10];

  return v11;
}

void __77__PXSharedLibrarySharingSuggestionsDataSourceManager_createInitialDataSource__block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(v2);
    int v5 = [v4 _fetchInitialDataSource];

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __77__PXSharedLibrarySharingSuggestionsDataSourceManager_createInitialDataSource__block_invoke_2;
    v8[3] = &unk_1E5DCEA88;
    id v6 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v5;
    id v10 = v6;
    id v7 = v5;
    objc_copyWeak(&v11, v2);
    dispatch_async(MEMORY[0x1E4F14428], v8);
    objc_destroyWeak(&v11);
  }
}

void __77__PXSharedLibrarySharingSuggestionsDataSourceManager_createInitialDataSource__block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) totalNumberOfItems];
    id v6 = [MEMORY[0x1E4F1C9C8] now];
    [v6 timeIntervalSinceDate:*(void *)(a1 + 48)];
    int v9 = 138544130;
    uint64_t v10 = v3;
    __int16 v11 = 2048;
    uint64_t v12 = v4;
    __int16 v13 = 2048;
    uint64_t v14 = v5;
    __int16 v15 = 2048;
    uint64_t v16 = v7;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p>: Initial data source created async with %lu items. Took %.1fs", (uint8_t *)&v9, 0x2Au);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleInitialDataSourceLoaded:*(void *)(a1 + 40)];
}

- (id)_fetchInitialDataSource
{
  uint64_t v3 = [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self photoLibrary];
  uint64_t v4 = [v3 librarySpecificFetchOptions];

  uint64_t v5 = [MEMORY[0x1E4F39238] fetchSharedLibrarySharingSuggestionsWithOptions:v4];
  id v6 = [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self _createDataSourceWithSharingSuggestions:v5];

  return v6;
}

- (void)setConsiderNewAfterDate:(id)a3
{
  uint64_t v8 = (NSDate *)a3;
  uint64_t v5 = self->_considerNewAfterDate;
  if (v5 == v8)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [(NSDate *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_considerNewAfterDate, a3);
      [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self _invalidatePromisesUnreadState];
    }
  }
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXSharedLibrarySharingSuggestionsDataSourceManager;
  [(PXSharedLibrarySharingSuggestionsDataSourceManager *)&v4 didPerformChanges];
  uint64_t v3 = [(PXSharedLibrarySharingSuggestionsDataSourceManager *)self updater];
  [v3 updateIfNeeded];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibrarySharingSuggestionsDataSourceManager;
  [(PXSharedLibrarySharingSuggestionsDataSourceManager *)&v3 performChanges:a3];
}

- (PXSharedLibrarySharingSuggestionsDataSourceManager)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibrarySharingSuggestionsDataSourceManager.m", 147, @"%s is not available as initializer", "-[PXSharedLibrarySharingSuggestionsDataSourceManager init]");

  abort();
}

+ (void)loadAsyncDataSourcesImmediately
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_super v3 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = a1;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@>: Loading Async Data Sources immediately", (uint8_t *)&v7, 0xCu);
  }

  objc_super v4 = [a1 sharedQueue];
  dispatch_activate(v4);

  uint64_t v5 = [a1 sharedQueue];
  dispatch_block_t v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, &__block_literal_global_204_112604);
  dispatch_async(v5, v6);
}

@end