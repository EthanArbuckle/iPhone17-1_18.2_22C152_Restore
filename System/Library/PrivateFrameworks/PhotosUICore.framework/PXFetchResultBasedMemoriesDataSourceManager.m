@interface PXFetchResultBasedMemoriesDataSourceManager
- (BOOL)loadFromEnd;
- (NSMutableOrderedSet)_remainingMemoriesToFetch;
- (PHFetchResult)memories;
- (PXFetchResultBasedMemoriesDataSourceManager)initWithMemoriesFetchResult:(id)a3;
- (PXMemoriesDataSourceState)_state;
- (id)_createMemoriesDataSourceFromCurrentState;
- (id)createInitialDataSource;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (void)_handleFinishedFetchingBatch:(id)a3 preparedChangeDetails:(id)a4 forFetchResult:(id)a5;
- (void)_setRemainingMemoriesToFetch:(id)a3;
- (void)_setState:(id)a3;
- (void)_workerQueue_fetchRemainingMemoriesInBatchesFromTheEnd:(BOOL)a3;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4;
- (void)setLoadFromEnd:(BOOL)a3;
- (void)startLoadingIfNeeded;
@end

@implementation PXFetchResultBasedMemoriesDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__remainingMemoriesToFetch, 0);
  objc_storeStrong((id *)&self->__state, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
}

- (void)_setRemainingMemoriesToFetch:(id)a3
{
}

- (NSMutableOrderedSet)_remainingMemoriesToFetch
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 144, 1);
}

- (void)_setState:(id)a3
{
}

- (PXMemoriesDataSourceState)_state
{
  return self->__state;
}

- (void)setLoadFromEnd:(BOOL)a3
{
  self->_loadFromEnd = a3;
}

- (BOOL)loadFromEnd
{
  return self->_loadFromEnd;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PXFetchResultBasedMemoriesDataSourceManager *)self _state];
  v9 = [v7 objectForKeyedSubscript:@"preparedForCurrentState"];

  if (v9 == v8)
  {
    v10 = [v7 objectForKeyedSubscript:@"preparedState"];
    id v11 = [v7 objectForKeyedSubscript:@"preparedChangeDetails"];
  }
  else
  {
    id v23 = 0;
    v10 = [v8 stateUpdatedWithChange:v6 outMemoriesChangeDetails:&v23];
    id v11 = v23;
  }
  v12 = v11;
  if (v10 != v8)
  {
    [(PXFetchResultBasedMemoriesDataSourceManager *)self _setState:v10];
    v21 = [(PXSectionedDataSourceManager *)self dataSource];
    v13 = [(PXFetchResultBasedMemoriesDataSourceManager *)self _createMemoriesDataSourceFromCurrentState];
    id v20 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v14 = [v21 identifier];
    id v22 = v6;
    uint64_t v15 = [v13 identifier];
    v16 = [off_1E5DA5568 changeDetailsWithNoChanges];
    v24 = &unk_1F02D9B50;
    v25[0] = v12;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v18 = id v17 = v7;
    v19 = (void *)[v20 initWithFromDataSourceIdentifier:v14 toDataSourceIdentifier:v15 sectionChanges:v16 itemChangeDetailsBySection:v18 subitemChangeDetailsByItemBySection:0];

    id v7 = v17;
    [(PXSectionedDataSourceManager *)self setDataSource:v13 changeDetails:v19];

    id v6 = v22;
  }
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__243087;
  id v17 = __Block_byref_object_dispose__243088;
  id v18 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PXFetchResultBasedMemoriesDataSourceManager_prepareForPhotoLibraryChange___block_invoke;
  block[3] = &unk_1E5DD0588;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  v5 = (void *)v14[5];
  id v11 = 0;
  id v6 = [v5 stateUpdatedWithChange:v4 outMemoriesChangeDetails:&v11];
  id v7 = v11;
  uint64_t v8 = v14[5];
  v19[0] = @"preparedForCurrentState";
  v19[1] = @"preparedState";
  v20[0] = v8;
  v20[1] = v6;
  v19[2] = @"preparedChangeDetails";
  v20[2] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  _Block_object_dispose(&v13, 8);
  return v9;
}

void __76__PXFetchResultBasedMemoriesDataSourceManager_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _state];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_createMemoriesDataSourceFromCurrentState
{
  uint64_t v3 = [PXStateBasedMemoriesDataSource alloc];
  id v4 = [(PXFetchResultBasedMemoriesDataSourceManager *)self _state];
  v5 = [(PXStateBasedMemoriesDataSource *)v3 initWithState:v4];

  return v5;
}

- (void)_handleFinishedFetchingBatch:(id)a3 preparedChangeDetails:(id)a4 forFetchResult:(id)a5
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PXFetchResultBasedMemoriesDataSourceManager *)self _state];
  v12 = [v11 infosByMemory];
  uint64_t v13 = (void *)[v12 mutableCopy];

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __113__PXFetchResultBasedMemoriesDataSourceManager__handleFinishedFetchingBatch_preparedChangeDetails_forFetchResult___block_invoke;
  v41[3] = &unk_1E5DC9E90;
  id v14 = v13;
  id v42 = v14;
  [v8 enumerateKeysAndObjectsUsingBlock:v41];
  uint64_t v15 = [PXMemoriesDataSourceState alloc];
  v16 = [v11 memories];
  id v17 = [(PXMemoriesDataSourceState *)v15 initWithMemories:v16 infosByMemory:v14];

  [(PXFetchResultBasedMemoriesDataSourceManager *)self _setState:v17];
  if (self->_hasCreatedInitialDataSource)
  {
    v36 = v17;
    v37 = v11;
    id v18 = [(PXSectionedDataSourceManager *)self dataSource];
    v19 = [(PXFetchResultBasedMemoriesDataSourceManager *)self _createMemoriesDataSourceFromCurrentState];
    id v20 = [(PXFetchResultBasedMemoriesDataSourceManager *)self memories];

    id v38 = v10;
    id v39 = v9;
    id v40 = v8;
    if (v20 == v10)
    {
      id v28 = v9;
    }
    else
    {
      v35 = [v8 allKeys];
      v21 = (void *)MEMORY[0x1E4F390B8];
      id v22 = [v18 _state];
      id v23 = [v22 memories];
      [v19 _state];
      v25 = v24 = v18;
      v26 = [v25 memories];
      v27 = [v21 changeDetailsFromFetchResult:v23 toFetchResult:v26 changedObjects:v35];

      id v18 = v24;
      id v28 = [off_1E5DA5568 changeDetailsFromFetchResultChangeDetails:v27];
    }
    id v29 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v30 = [v18 identifier];
    uint64_t v31 = [v19 identifier];
    v32 = [off_1E5DA5568 changeDetailsWithNoChanges];
    v43 = &unk_1F02D9B50;
    v44[0] = v28;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
    v34 = (void *)[v29 initWithFromDataSourceIdentifier:v30 toDataSourceIdentifier:v31 sectionChanges:v32 itemChangeDetailsBySection:v33 subitemChangeDetailsByItemBySection:0];

    [(PXSectionedDataSourceManager *)self setDataSource:v19 changeDetails:v34];
    id v9 = v39;
    id v8 = v40;
    id v11 = v37;
    id v10 = v38;
    id v17 = v36;
  }
  self->_isWorking = 0;
  [(PXFetchResultBasedMemoriesDataSourceManager *)self startLoadingIfNeeded];
}

void __113__PXFetchResultBasedMemoriesDataSourceManager__handleFinishedFetchingBatch_preparedChangeDetails_forFetchResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

  if (!v6) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

- (void)_workerQueue_fetchRemainingMemoriesInBatchesFromTheEnd:(BOOL)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [(PXFetchResultBasedMemoriesDataSourceManager *)self _remainingMemoriesToFetch];
  v32 = v6;
  if (a3) {
    [v6 reverseObjectEnumerator];
  }
  else {
  id v7 = [v6 objectEnumerator];
  }
  objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", v32);
  double v9 = v8;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v45;
LABEL_6:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v45 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void *)(*((void *)&v44 + 1) + 8 * v14);
      v16 = +[PXMemoryInfo memoryInfoWithMemory:v15];
      [v5 setObject:v16 forKeyedSubscript:v15];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v18 = v17 - v9;

      if (v18 > 0.25 || v18 < 0.0) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v44 objects:v49 count:16];
        if (v12) {
          goto LABEL_6;
        }
        break;
      }
    }
  }

  if ([v5 count])
  {
    v19 = [v5 allKeys];
    [v33 removeObjectsInArray:v19];
  }
  if (![v33 count]) {
    [(PXFetchResultBasedMemoriesDataSourceManager *)self _setRemainingMemoriesToFetch:0];
  }
  id v20 = [MEMORY[0x1E4F28E60] indexSet];
  v21 = [(PXFetchResultBasedMemoriesDataSourceManager *)self memories];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v22 = v5;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v41 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = [v21 indexOfObject:*(void *)(*((void *)&v40 + 1) + 8 * i)];
        if (v27 != 0x7FFFFFFFFFFFFFFFLL) {
          [v20 addIndex:v27];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v24);
  }

  id v28 = (void *)[objc_alloc((Class)off_1E5DA5568) initWithIncrementalChangeDetailsRemovedIndexes:0 insertedIndexes:0 movesToIndexes:0 movesFromIndexes:0 changedIndexes:v20];
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__PXFetchResultBasedMemoriesDataSourceManager__workerQueue_fetchRemainingMemoriesInBatchesFromTheEnd___block_invoke;
  block[3] = &unk_1E5DCEA88;
  objc_copyWeak(&v38, &location);
  id v35 = v22;
  id v36 = v28;
  id v37 = v21;
  id v29 = v21;
  id v30 = v28;
  id v31 = v22;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

void __102__PXFetchResultBasedMemoriesDataSourceManager__workerQueue_fetchRemainingMemoriesInBatchesFromTheEnd___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleFinishedFetchingBatch:*(void *)(a1 + 32) preparedChangeDetails:*(void *)(a1 + 40) forFetchResult:*(void *)(a1 + 48)];
}

- (void)startLoadingIfNeeded
{
  if (!self->_isWorking)
  {
    uint64_t v3 = [(PXFetchResultBasedMemoriesDataSourceManager *)self _remainingMemoriesToFetch];

    if (v3)
    {
      self->_isWorking = 1;
      BOOL v4 = [(PXFetchResultBasedMemoriesDataSourceManager *)self loadFromEnd];
      objc_initWeak(&location, self);
      workerQueue = self->_workerQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__PXFetchResultBasedMemoriesDataSourceManager_startLoadingIfNeeded__block_invoke;
      block[3] = &unk_1E5DD0EE8;
      objc_copyWeak(&v7, &location);
      BOOL v8 = v4;
      dispatch_async(workerQueue, block);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

void __67__PXFetchResultBasedMemoriesDataSourceManager_startLoadingIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_workerQueue_fetchRemainingMemoriesInBatchesFromTheEnd:", *(unsigned __int8 *)(a1 + 40));
}

- (id)createInitialDataSource
{
  uint64_t v3 = [(PXFetchResultBasedMemoriesDataSourceManager *)self _createMemoriesDataSourceFromCurrentState];
  self->_hasCreatedInitialDataSource = 1;
  [(PXFetchResultBasedMemoriesDataSourceManager *)self startLoadingIfNeeded];
  return v3;
}

- (PHFetchResult)memories
{
  uint64_t v2 = [(PXFetchResultBasedMemoriesDataSourceManager *)self _state];
  uint64_t v3 = [v2 memories];

  return (PHFetchResult *)v3;
}

- (PXFetchResultBasedMemoriesDataSourceManager)initWithMemoriesFetchResult:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PXFetchResultBasedMemoriesDataSourceManager;
  id v6 = [(PXSectionedDataSourceManager *)&v19 init];
  if (v6)
  {
    if (!v5)
    {
      double v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, v6, @"PXMemoriesDataSourceManager.m", 51, @"Invalid parameter not satisfying: %@", @"memories != nil" object file lineNumber description];
    }
    id v7 = [PXMemoriesDataSourceState alloc];
    uint64_t v8 = [(PXMemoriesDataSourceState *)v7 initWithMemories:v5 infosByMemory:MEMORY[0x1E4F1CC08]];
    state = v6->__state;
    v6->__state = (PXMemoriesDataSourceState *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA70] orderedSet];
    remainingMemoriesToFetch = v6->__remainingMemoriesToFetch;
    v6->__remainingMemoriesToFetch = (NSMutableOrderedSet *)v10;

    uint64_t v12 = v6->__remainingMemoriesToFetch;
    uint64_t v13 = [v5 fetchedObjects];
    [(NSMutableOrderedSet *)v12 addObjectsFromArray:v13];

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.photos.memoriesDataSource-workerQueue", 0);
    workerQueue = v6->_workerQueue;
    v6->_workerQueue = (OS_dispatch_queue *)v14;

    v16 = [v5 photoLibrary];
    objc_msgSend(v16, "px_registerChangeObserver:", v6);
  }
  return v6;
}

@end