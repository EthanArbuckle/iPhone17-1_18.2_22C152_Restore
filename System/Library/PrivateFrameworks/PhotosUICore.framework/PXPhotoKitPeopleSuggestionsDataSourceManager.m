@interface PXPhotoKitPeopleSuggestionsDataSourceManager
+ (OS_dispatch_queue)sharedWorkerQueue;
+ (id)mockDataSourceManagerFromPeopleInPhotosInAssetCollection:(id)a3;
+ (id)personsForClient:(unint64_t)a3 fetchOptions:(id)a4;
+ (id)photosGraphPeopleSuggestionsDataSourceManagerWithAssetCollection:(id)a3;
+ (id)sharedLibraryPeopleSuggestionsDataSourceManager;
- (BOOL)hasFinishedLoadingFinalDataSource;
- (BOOL)hasStartedLoadingFinalDataSource;
- (BOOL)isLoading;
- (NSMutableOrderedSet)_remainingPeopleToFetch;
- (PHAssetCollection)assetCollection;
- (PXPhotoKitPeopleSuggestionsDataSourceManager)initWithPeopleFetchResult:(id)a3;
- (PXPhotoKitPeopleSuggestionsDataSourceState)_state;
- (PXUpdater)updater;
- (id)_createSuggestionsDataSourceFromCurrentState;
- (id)_initWithAssetCollection:(id)a3;
- (id)createInitialDataSource;
- (id)mediaProvider;
- (id)people;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (void)_handleFinishedFetchingBatch:(id)a3 preparedChangeDetails:(id)a4 forFetchResult:(id)a5;
- (void)_handleFinishedLoadingFinalDataSourceFetchResult:(id)a3;
- (void)_loadFinalDataSource;
- (void)_workerQueue_fetchRemainingPeopleInBatches;
- (void)boostLoading;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4;
- (void)setAssetCollection:(id)a3;
- (void)setHasFinishedLoadingFinalDataSource:(BOOL)a3;
- (void)setHasStartedLoadingFinalDataSource:(BOOL)a3;
- (void)setUpdater:(id)a3;
- (void)set_remainingPeopleToFetch:(id)a3;
- (void)set_state:(id)a3;
- (void)startLoading;
- (void)startPrefetchingIfNeeded;
@end

@implementation PXPhotoKitPeopleSuggestionsDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->__remainingPeopleToFetch, 0);
  objc_storeStrong((id *)&self->__state, 0);
}

- (void)setHasFinishedLoadingFinalDataSource:(BOOL)a3
{
  self->_hasFinishedLoadingFinalDataSource = a3;
}

- (BOOL)hasFinishedLoadingFinalDataSource
{
  return self->_hasFinishedLoadingFinalDataSource;
}

- (void)setHasStartedLoadingFinalDataSource:(BOOL)a3
{
  self->_hasStartedLoadingFinalDataSource = a3;
}

- (BOOL)hasStartedLoadingFinalDataSource
{
  return self->_hasStartedLoadingFinalDataSource;
}

- (void)setUpdater:(id)a3
{
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void)setAssetCollection:(id)a3
{
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)set_remainingPeopleToFetch:(id)a3
{
}

- (NSMutableOrderedSet)_remainingPeopleToFetch
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 136, 1);
}

- (void)set_state:(id)a3
{
}

- (PXPhotoKitPeopleSuggestionsDataSourceState)_state
{
  return self->__state;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self _state];
  v9 = [v7 objectForKeyedSubscript:@"preparedForCurrentState"];

  if (v9 == v8)
  {
    v10 = [v7 objectForKeyedSubscript:@"preparedState"];
    id v11 = [v7 objectForKeyedSubscript:@"preparedChangeDetails"];
  }
  else
  {
    id v23 = 0;
    v10 = [v8 stateUpdatedWithChange:v6 changeDetails:&v23];
    id v11 = v23;
  }
  v12 = v11;
  if (v10 != v8)
  {
    [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self set_state:v10];
    v21 = [(PXSectionedDataSourceManager *)self dataSource];
    v13 = [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self _createSuggestionsDataSourceFromCurrentState];
    id v20 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v14 = [v21 identifier];
    id v22 = v6;
    uint64_t v15 = [v13 identifier];
    v16 = [off_1E5DA5568 changeDetailsWithNoChanges];
    v24 = &unk_1F02D8410;
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
  v16 = __Block_byref_object_copy__137619;
  id v17 = __Block_byref_object_dispose__137620;
  id v18 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PXPhotoKitPeopleSuggestionsDataSourceManager_prepareForPhotoLibraryChange___block_invoke;
  block[3] = &unk_1E5DD0588;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  v5 = (void *)v14[5];
  id v11 = 0;
  id v6 = [v5 stateUpdatedWithChange:v4 changeDetails:&v11];
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

void __77__PXPhotoKitPeopleSuggestionsDataSourceManager_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _state];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_handleFinishedFetchingBatch:(id)a3 preparedChangeDetails:(id)a4 forFetchResult:(id)a5
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self _state];
  v12 = [v11 personSuggestionsByPerson];
  uint64_t v13 = (void *)[v12 mutableCopy];

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __114__PXPhotoKitPeopleSuggestionsDataSourceManager__handleFinishedFetchingBatch_preparedChangeDetails_forFetchResult___block_invoke;
  v41[3] = &unk_1E5DBE460;
  id v14 = v13;
  id v42 = v14;
  [v8 enumerateKeysAndObjectsUsingBlock:v41];
  uint64_t v15 = [PXPhotoKitPeopleSuggestionsDataSourceState alloc];
  v16 = [v11 people];
  id v17 = [(PXPhotoKitPeopleSuggestionsDataSourceState *)v15 initWithPeople:v16 personSuggestionsByPerson:v14];

  [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self set_state:v17];
  if (self->_hasCreatedInitialDataSource)
  {
    v36 = v17;
    v37 = v11;
    id v18 = [(PXSectionedDataSourceManager *)self dataSource];
    v19 = [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self _createSuggestionsDataSourceFromCurrentState];
    id v20 = [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self people];

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
      id v23 = [v22 people];
      [v19 _state];
      v25 = v24 = v18;
      v26 = [v25 people];
      v27 = [v21 changeDetailsFromFetchResult:v23 toFetchResult:v26 changedObjects:v35];

      id v18 = v24;
      id v28 = [off_1E5DA5568 changeDetailsFromFetchResultChangeDetails:v27];
    }
    id v29 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v30 = [v18 identifier];
    uint64_t v31 = [v19 identifier];
    v32 = [off_1E5DA5568 changeDetailsWithNoChanges];
    v43 = &unk_1F02D8410;
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
  self->_isPrefetching = 0;
  [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self startPrefetchingIfNeeded];
}

void __114__PXPhotoKitPeopleSuggestionsDataSourceManager__handleFinishedFetchingBatch_preparedChangeDetails_forFetchResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

  if (!v6) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

- (void)_workerQueue_fetchRemainingPeopleInBatches
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self _remainingPeopleToFetch];
  id v5 = [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self people];
  id v23 = [MEMORY[0x1E4F28E60] indexSet];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v7 = v6;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v31 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v30 + 1) + 8 * v12);
      id v14 = +[PXPhotoKitPersonSuggestion personSuggestionWithPerson:v13];
      [v3 setObject:v14 forKeyedSubscript:v13];
      uint64_t v15 = [v5 indexOfObject:v13];
      if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
        [v23 addIndex:v15];
      }
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v17 = v16 - v7;

      if (v17 > 0.25 || v17 < 0.0) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if ([v3 count])
  {
    id v18 = [v3 allKeys];
    [v8 removeObjectsInArray:v18];
  }
  if (![v8 count]) {
    [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self set_remainingPeopleToFetch:0];
  }
  v19 = (void *)[objc_alloc((Class)off_1E5DA5568) initWithIncrementalChangeDetailsRemovedIndexes:0 insertedIndexes:0 movesToIndexes:0 movesFromIndexes:0 changedIndexes:v23];
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PXPhotoKitPeopleSuggestionsDataSourceManager__workerQueue_fetchRemainingPeopleInBatches__block_invoke;
  block[3] = &unk_1E5DCEA88;
  objc_copyWeak(&v28, &location);
  id v25 = v3;
  id v26 = v19;
  id v27 = v5;
  id v20 = v5;
  id v21 = v19;
  id v22 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __90__PXPhotoKitPeopleSuggestionsDataSourceManager__workerQueue_fetchRemainingPeopleInBatches__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleFinishedFetchingBatch:*(void *)(a1 + 32) preparedChangeDetails:*(void *)(a1 + 40) forFetchResult:*(void *)(a1 + 48)];
}

- (void)startPrefetchingIfNeeded
{
  if (!self->_isPrefetching)
  {
    uint64_t v3 = [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self _remainingPeopleToFetch];
    if (v3)
    {
      id v4 = (void *)v3;
      BOOL v5 = [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self hasFinishedLoadingFinalDataSource];

      if (v5)
      {
        self->_isPrefetching = 1;
        objc_initWeak(&location, self);
        double v6 = [(id)objc_opt_class() sharedWorkerQueue];
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __72__PXPhotoKitPeopleSuggestionsDataSourceManager_startPrefetchingIfNeeded__block_invoke;
        v7[3] = &unk_1E5DD32D0;
        objc_copyWeak(&v8, &location);
        dispatch_async(v6, v7);

        objc_destroyWeak(&v8);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __72__PXPhotoKitPeopleSuggestionsDataSourceManager_startPrefetchingIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_workerQueue_fetchRemainingPeopleInBatches");
}

- (id)_createSuggestionsDataSourceFromCurrentState
{
  uint64_t v3 = [PXPhotoKitPeopleSuggestionsDataSource alloc];
  id v4 = [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self _state];
  BOOL v5 = [(PXPhotoKitPeopleSuggestionsDataSource *)v3 initWithState:v4];

  return v5;
}

- (id)createInitialDataSource
{
  uint64_t v3 = [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self _createSuggestionsDataSourceFromCurrentState];
  self->_hasCreatedInitialDataSource = 1;
  [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self startPrefetchingIfNeeded];
  return v3;
}

- (id)people
{
  uint64_t v2 = [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self _state];
  uint64_t v3 = [v2 people];

  return v3;
}

- (void)_handleFinishedLoadingFinalDataSourceFetchResult:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_hasFinishedLoadingFinalDataSource = 1;
  BOOL v5 = [PXPhotoKitPeopleSuggestionsDataSourceState alloc];
  double v6 = [(PXPhotoKitPeopleSuggestionsDataSourceState *)v5 initWithPeople:v4 personSuggestionsByPerson:MEMORY[0x1E4F1CC08]];
  double v7 = [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self people];
  [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self set_state:v6];
  if (self->_hasCreatedInitialDataSource)
  {
    id v21 = [(PXSectionedDataSourceManager *)self dataSource];
    id v8 = [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self _createSuggestionsDataSourceFromCurrentState];
    uint64_t v9 = [v7 fetchedObjects];
    uint64_t v10 = [v4 fetchedObjects];
    id v20 = [off_1E5DA5568 changeDetailsFromArray:v9 toArray:v10 changedObjects:MEMORY[0x1E4F1CBF0]];

    id v11 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v12 = [v21 identifier];
    uint64_t v13 = [v8 identifier];
    [off_1E5DA5568 changeDetailsWithNoChanges];
    id v14 = v4;
    uint64_t v15 = v6;
    double v17 = v16 = v7;
    id v22 = &unk_1F02D8410;
    v23[0] = v20;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v19 = (void *)[v11 initWithFromDataSourceIdentifier:v12 toDataSourceIdentifier:v13 sectionChanges:v17 itemChangeDetailsBySection:v18 subitemChangeDetailsByItemBySection:0];

    double v7 = v16;
    double v6 = v15;
    id v4 = v14;
    [(PXSectionedDataSourceManager *)self setDataSource:v8 changeDetails:v19];
  }
  self->_isPrefetching = 0;
  [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self startPrefetchingIfNeeded];
}

- (void)_loadFinalDataSource
{
  uint64_t v3 = [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self assetCollection];
  id v4 = [v3 photoLibrary];
  BOOL v5 = [v4 librarySpecificFetchOptions];

  double v6 = (void *)MEMORY[0x1E4F391F0];
  double v7 = [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self assetCollection];
  id v8 = [v6 fetchSuggestedPersonsForAssetCollection:v7 options:v5];

  if (v8 && [v8 count])
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA70] orderedSet];
    [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self set_remainingPeopleToFetch:v9];

    uint64_t v10 = [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self _remainingPeopleToFetch];
    id v11 = [v8 fetchedObjects];
    [v10 addObjectsFromArray:v11];
  }
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PXPhotoKitPeopleSuggestionsDataSourceManager__loadFinalDataSource__block_invoke;
  block[3] = &unk_1E5DD20C8;
  objc_copyWeak(&v15, &location);
  id v14 = v8;
  id v12 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __68__PXPhotoKitPeopleSuggestionsDataSourceManager__loadFinalDataSource__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleFinishedLoadingFinalDataSourceFetchResult:*(void *)(a1 + 32)];
}

- (id)mediaProvider
{
  uint64_t v2 = objc_alloc_init(PXPhotoKitPeopleSuggestionsMediaProvider);
  return v2;
}

- (BOOL)isLoading
{
  BOOL v3 = [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self hasStartedLoadingFinalDataSource];
  if (v3) {
    LOBYTE(v3) = ![(PXPhotoKitPeopleSuggestionsDataSourceManager *)self hasFinishedLoadingFinalDataSource];
  }
  return v3;
}

- (void)boostLoading
{
  uint64_t v2 = [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self people];
  uint64_t v3 = [v2 count];

  if (!v3)
  {
    queue = [(id)objc_opt_class() sharedWorkerQueue];
    dispatch_block_t v4 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, &__block_literal_global_195_137671);
    dispatch_async(queue, v4);
  }
}

- (void)startLoading
{
  if (self->_needsDeferredLoading
    && ![(PXPhotoKitPeopleSuggestionsDataSourceManager *)self hasStartedLoadingFinalDataSource])
  {
    [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self setHasStartedLoadingFinalDataSource:1];
    objc_initWeak(&location, self);
    uint64_t v3 = [(id)objc_opt_class() sharedWorkerQueue];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __60__PXPhotoKitPeopleSuggestionsDataSourceManager_startLoading__block_invoke;
    v4[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v5, &location);
    dispatch_async(v3, v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __60__PXPhotoKitPeopleSuggestionsDataSourceManager_startLoading__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _loadFinalDataSource];
}

- (id)_initWithAssetCollection:(id)a3
{
  id v5 = a3;
  double v6 = [(PXPhotoKitPeopleSuggestionsDataSourceManager *)self initWithPeopleFetchResult:0];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetCollection, a3);
    v7->_needsDeferredLoading = 1;
  }

  return v7;
}

- (PXPhotoKitPeopleSuggestionsDataSourceManager)initWithPeopleFetchResult:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXPhotoKitPeopleSuggestionsDataSourceManager;
  id v5 = [(PXSectionedDataSourceManager *)&v15 init];
  if (v5)
  {
    double v6 = [PXPhotoKitPeopleSuggestionsDataSourceState alloc];
    uint64_t v7 = [(PXPhotoKitPeopleSuggestionsDataSourceState *)v6 initWithPeople:v4 personSuggestionsByPerson:MEMORY[0x1E4F1CC08]];
    state = v5->__state;
    v5->__state = (PXPhotoKitPeopleSuggestionsDataSourceState *)v7;

    if (v4 && [v4 count])
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA70] orderedSet];
      remainingPeopleToFetch = v5->__remainingPeopleToFetch;
      v5->__remainingPeopleToFetch = (NSMutableOrderedSet *)v9;

      id v11 = v5->__remainingPeopleToFetch;
      id v12 = [v4 fetchedObjects];
      [(NSMutableOrderedSet *)v11 addObjectsFromArray:v12];
    }
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    objc_msgSend(v13, "px_registerChangeObserver:", v5);
  }
  return v5;
}

+ (id)photosGraphPeopleSuggestionsDataSourceManagerWithAssetCollection:(id)a3
{
  id v3 = a3;
  id v4 = [[PXPhotoKitPeopleSuggestionsDataSourceManager alloc] _initWithAssetCollection:v3];

  return v4;
}

+ (id)mockDataSourceManagerFromPeopleInPhotosInAssetCollection:(id)a3
{
  id v3 = [MEMORY[0x1E4F391F0] fetchPersonsForAssetCollection:a3 options:0];
  id v4 = [[PXPhotoKitPeopleSuggestionsDataSourceManager alloc] initWithPeopleFetchResult:v3];

  return v4;
}

+ (id)personsForClient:(unint64_t)a3 fetchOptions:(id)a4
{
  id v6 = a4;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__137619;
  v10[4] = __Block_byref_object_dispose__137620;
  v10[5] = 0;
  uint64_t v7 = [a1 sharedWorkerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PXPhotoKitPeopleSuggestionsDataSourceManager_personsForClient_fetchOptions___block_invoke;
  block[3] = &unk_1E5DCDEC8;
  block[5] = v10;
  void block[6] = a3;
  void block[4] = v6;
  dispatch_async(v7, block);

  [a1 sharedWorkerQueue];
  objc_claimAutoreleasedReturnValue();
  px_dispatch_queue_wait();
}

void __78__PXPhotoKitPeopleSuggestionsDataSourceManager_personsForClient_fetchOptions___block_invoke(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F391F0] fetchSuggestedPersonsForClient:a1[6] options:a1[4]];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (id)sharedLibraryPeopleSuggestionsDataSourceManager
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v4 = [v3 librarySpecificFetchOptions];

  if (!PFOSVariantHasInternalUI()) {
    goto LABEL_10;
  }
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v6 = [v5 stringForKey:@"PXPeopleSuggestionsDataSourceManagerPersonUUID"];
  if (!v6)
  {
    id v12 = +[PXSharedLibrarySettings sharedInstance];
    char v13 = [v12 mockPersonSuggestionForSetupAssistant];

    if (v13)
    {
      [v4 setFetchLimit:3];
      id v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(verifiedType = %ld) || (verifiedType = %ld)", 1, 2);
      [v4 setPredicate:v14];

      objc_super v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"type" ascending:0];
      id v22 = v15;
      double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
      [v4 setSortDescriptors:v16];

      id v11 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v4];
      double v17 = PLUIGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [v11 firstObject];
        v19 = [v18 uuid];
        *(_DWORD *)buf = 138412290;
        id v25 = v19;
        _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_DEFAULT, "Using mock people suggestion: \"%@\"", buf, 0xCu);
      }
      goto LABEL_11;
    }
LABEL_10:
    id v11 = [a1 personsForClient:4 fetchOptions:v4];
LABEL_11:
    uint64_t v7 = 0;
    goto LABEL_12;
  }
  uint64_t v7 = (void *)v6;

  id v8 = PLUIGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v7;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Using provided person UUID for people suggestion: \"%@\"", buf, 0xCu);
  }

  uint64_t v9 = (void *)MEMORY[0x1E4F391F0];
  id v23 = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  id v11 = [v9 fetchPersonsWithLocalIdentifiers:v10 options:v4];

LABEL_12:
  id v20 = [[PXPhotoKitPeopleSuggestionsDataSourceManager alloc] initWithPeopleFetchResult:v11];

  return v20;
}

+ (OS_dispatch_queue)sharedWorkerQueue
{
  if (sharedWorkerQueue_onceToken != -1) {
    dispatch_once(&sharedWorkerQueue_onceToken, &__block_literal_global_137701);
  }
  uint64_t v2 = (void *)sharedWorkerQueue__sharedWorkerQueue;
  return (OS_dispatch_queue *)v2;
}

void __65__PXPhotoKitPeopleSuggestionsDataSourceManager_sharedWorkerQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.photos.PXPhotoKitPeopleSuggestionsDataSourceManager-sharedWorkerQueue", attr);
  uint64_t v2 = (void *)sharedWorkerQueue__sharedWorkerQueue;
  sharedWorkerQueue__sharedWorkerQueue = (uint64_t)v1;
}

@end