@interface PXCMMMomentsInvitationsDataSourceManager
- (NSMutableOrderedSet)_remainingAssetCollectionObjectIDsToFetch;
- (PHPhotoLibrary)photoLibrary;
- (PXCMMMomentsInvitationsDataSourceManager)init;
- (PXCMMMomentsInvitationsDataSourceManager)initWithPhotoLibrary:(id)a3;
- (PXCMMMomentsInvitationsDataSourceState)_state;
- (id)_createInvitationsDataSourceFromCurrentState;
- (id)assetCollections;
- (id)createInitialDataSource;
- (id)mediaProvider;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (void)_handleFinishedFetchingBatch:(id)a3 preparedChangeDetails:(id)a4 forFetchResult:(id)a5;
- (void)_workerQueue_fetchRemainingAssetCollectionsInBatches;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4;
- (void)set_remainingAssetCollectionObjectIDsToFetch:(id)a3;
- (void)set_state:(id)a3;
- (void)startLoadingIfNeeded;
@end

@implementation PXCMMMomentsInvitationsDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__remainingAssetCollectionObjectIDsToFetch, 0);
  objc_storeStrong((id *)&self->__state, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
}

- (void)set_remainingAssetCollectionObjectIDsToFetch:(id)a3
{
}

- (NSMutableOrderedSet)_remainingAssetCollectionObjectIDsToFetch
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 160, 1);
}

- (void)set_state:(id)a3
{
}

- (PXCMMMomentsInvitationsDataSourceState)_state
{
  return self->__state;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PXCMMMomentsInvitationsDataSourceManager *)self _state];
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
    [(PXCMMMomentsInvitationsDataSourceManager *)self set_state:v10];
    v21 = [(PXSectionedDataSourceManager *)self dataSource];
    v13 = [(PXCMMMomentsInvitationsDataSourceManager *)self _createInvitationsDataSourceFromCurrentState];
    id v20 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v14 = [v21 identifier];
    id v22 = v6;
    uint64_t v15 = [v13 identifier];
    v16 = [off_1E5DA5568 changeDetailsWithNoChanges];
    v24 = &unk_1F02D9010;
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
  v16 = __Block_byref_object_copy__195162;
  id v17 = __Block_byref_object_dispose__195163;
  id v18 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PXCMMMomentsInvitationsDataSourceManager_prepareForPhotoLibraryChange___block_invoke;
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

void __73__PXCMMMomentsInvitationsDataSourceManager_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
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
  id v11 = [(PXCMMMomentsInvitationsDataSourceManager *)self _state];
  v12 = [v11 invitationsByAssetCollectionObjectID];
  uint64_t v13 = (void *)[v12 mutableCopy];

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __110__PXCMMMomentsInvitationsDataSourceManager__handleFinishedFetchingBatch_preparedChangeDetails_forFetchResult___block_invoke;
  v41[3] = &unk_1E5DC3BC8;
  id v14 = v13;
  id v42 = v14;
  [v8 enumerateKeysAndObjectsUsingBlock:v41];
  uint64_t v15 = [PXCMMMomentsInvitationsDataSourceState alloc];
  v16 = [v11 assetCollections];
  id v17 = [(PXCMMMomentsInvitationsDataSourceState *)v15 initWithAssetCollections:v16 invitationsByAssetCollectionObjectID:v14];

  [(PXCMMMomentsInvitationsDataSourceManager *)self set_state:v17];
  if (self->_hasCreatedInitialDataSource)
  {
    v36 = v17;
    v37 = v11;
    id v18 = [(PXSectionedDataSourceManager *)self dataSource];
    v19 = [(PXCMMMomentsInvitationsDataSourceManager *)self _createInvitationsDataSourceFromCurrentState];
    id v20 = [(PXCMMMomentsInvitationsDataSourceManager *)self assetCollections];

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
      id v23 = [v22 assetCollections];
      [v19 _state];
      v25 = v24 = v18;
      v26 = [v25 assetCollections];
      v27 = [v21 changeDetailsFromFetchResult:v23 toFetchResult:v26 changedObjects:v35];

      id v18 = v24;
      id v28 = [off_1E5DA5568 changeDetailsFromFetchResultChangeDetails:v27];
    }
    id v29 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v30 = [v18 identifier];
    uint64_t v31 = [v19 identifier];
    v32 = [off_1E5DA5568 changeDetailsWithNoChanges];
    v43 = &unk_1F02D9010;
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
  self->_isLoading = 0;
  [(PXCMMMomentsInvitationsDataSourceManager *)self startLoadingIfNeeded];
}

void __110__PXCMMMomentsInvitationsDataSourceManager__handleFinishedFetchingBatch_preparedChangeDetails_forFetchResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

  if (!v6) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

- (void)_workerQueue_fetchRemainingAssetCollectionsInBatches
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  val = self;
  id v4 = [(PXCMMMomentsInvitationsDataSourceManager *)self _remainingAssetCollectionObjectIDsToFetch];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v6 = v5;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v48;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v48 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v47 + 1) + 8 * v11);
      id v13 = objc_alloc(MEMORY[0x1E4F39150]);
      uint64_t v52 = v12;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
      uint64_t v15 = [(PXCMMMomentsInvitationsDataSourceManager *)val photoLibrary];
      v16 = [MEMORY[0x1E4F38EE8] fetchType];
      id v17 = (void *)[v13 initWithOids:v14 photoLibrary:v15 fetchType:v16 fetchPropertySets:0 identifier:0 registerIfNeeded:1];

      id v18 = [v17 firstObject];
      v19 = +[PXCMMMomentsInvitation invitationWithAssetCollection:v18];

      [v3 setObject:v19 forKeyedSubscript:v12];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v21 = v20 - v6;

      if (v21 > 0.25 || v21 < 0.0) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v47 objects:v53 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if ([v3 count])
  {
    id v22 = [v3 allKeys];
    [v7 removeObjectsInArray:v22];
  }
  if (![v7 count]) {
    [(PXCMMMomentsInvitationsDataSourceManager *)val set_remainingAssetCollectionObjectIDsToFetch:0];
  }
  id v23 = [MEMORY[0x1E4F28E60] indexSet];
  v24 = [(PXCMMMomentsInvitationsDataSourceManager *)val assetCollections];
  v25 = [v24 fetchedObjectIDs];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v26 = v3;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v44 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = [v25 indexOfObject:*(void *)(*((void *)&v43 + 1) + 8 * i)];
        if (v31 != 0x7FFFFFFFFFFFFFFFLL) {
          [v23 addIndex:v31];
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v28);
  }

  v32 = (void *)[objc_alloc((Class)off_1E5DA5568) initWithIncrementalChangeDetailsRemovedIndexes:0 insertedIndexes:0 movesToIndexes:0 movesFromIndexes:0 changedIndexes:v23];
  objc_initWeak(&location, val);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PXCMMMomentsInvitationsDataSourceManager__workerQueue_fetchRemainingAssetCollectionsInBatches__block_invoke;
  block[3] = &unk_1E5DCEA88;
  objc_copyWeak(&v41, &location);
  id v38 = v26;
  id v39 = v32;
  id v40 = v24;
  id v33 = v24;
  id v34 = v32;
  id v35 = v26;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
}

void __96__PXCMMMomentsInvitationsDataSourceManager__workerQueue_fetchRemainingAssetCollectionsInBatches__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleFinishedFetchingBatch:*(void *)(a1 + 32) preparedChangeDetails:*(void *)(a1 + 40) forFetchResult:*(void *)(a1 + 48)];
}

- (void)startLoadingIfNeeded
{
  if (!self->_isLoading)
  {
    uint64_t v3 = [(PXCMMMomentsInvitationsDataSourceManager *)self _remainingAssetCollectionObjectIDsToFetch];

    if (v3)
    {
      self->_isLoading = 1;
      objc_initWeak(&location, self);
      workerQueue = self->_workerQueue;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __64__PXCMMMomentsInvitationsDataSourceManager_startLoadingIfNeeded__block_invoke;
      v5[3] = &unk_1E5DD32D0;
      objc_copyWeak(&v6, &location);
      dispatch_async(workerQueue, v5);
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
}

void __64__PXCMMMomentsInvitationsDataSourceManager_startLoadingIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_workerQueue_fetchRemainingAssetCollectionsInBatches");
}

- (id)_createInvitationsDataSourceFromCurrentState
{
  uint64_t v3 = [PXCMMMomentsInvitationsDataSource alloc];
  id v4 = [(PXCMMMomentsInvitationsDataSourceManager *)self _state];
  double v5 = [(PXCMMMomentsInvitationsDataSource *)v3 initWithState:v4];

  return v5;
}

- (id)createInitialDataSource
{
  uint64_t v3 = [(PXCMMMomentsInvitationsDataSourceManager *)self _createInvitationsDataSourceFromCurrentState];
  self->_hasCreatedInitialDataSource = 1;
  [(PXCMMMomentsInvitationsDataSourceManager *)self startLoadingIfNeeded];
  return v3;
}

- (id)assetCollections
{
  uint64_t v2 = [(PXCMMMomentsInvitationsDataSourceManager *)self _state];
  uint64_t v3 = [v2 assetCollections];

  return v3;
}

- (id)mediaProvider
{
  uint64_t v2 = objc_alloc_init(PXPhotoKitUIMediaProvider);
  return v2;
}

- (PXCMMMomentsInvitationsDataSourceManager)initWithPhotoLibrary:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PXCMMMomentsInvitationsDataSourceManager.m", 59, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v27.receiver = self;
  v27.super_class = (Class)PXCMMMomentsInvitationsDataSourceManager;
  id v7 = [(PXSectionedDataSourceManager *)&v27 init];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
    [(PHPhotoLibrary *)v8->_photoLibrary px_registerChangeObserver:v8];
    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.photos.PXCMMMomentsInvitationsDataSourceManager", v10);
    workerQueue = v8->_workerQueue;
    v8->_workerQueue = (OS_dispatch_queue *)v11;

    id v13 = [v6 librarySpecificFetchOptions];
    id v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    v28[0] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    [v13 setSortDescriptors:v15];

    v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"estimatedAssetCount > 8"];
    [v13 setPredicate:v16];

    [v13 setFetchLimit:6];
    id v17 = [MEMORY[0x1E4F38EE8] fetchMomentsWithOptions:v13];
    id v18 = (void *)MEMORY[0x1E4F1CA70];
    v19 = [v17 fetchedObjectIDs];
    uint64_t v20 = [v18 orderedSetWithArray:v19];
    remainingAssetCollectionObjectIDsToFetch = v8->__remainingAssetCollectionObjectIDsToFetch;
    v8->__remainingAssetCollectionObjectIDsToFetch = (NSMutableOrderedSet *)v20;

    id v22 = [PXCMMMomentsInvitationsDataSourceState alloc];
    uint64_t v23 = [(PXCMMMomentsInvitationsDataSourceState *)v22 initWithAssetCollections:v17 invitationsByAssetCollectionObjectID:MEMORY[0x1E4F1CC08]];
    state = v8->__state;
    v8->__state = (PXCMMMomentsInvitationsDataSourceState *)v23;
  }
  return v8;
}

- (PXCMMMomentsInvitationsDataSourceManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMMomentsInvitationsDataSourceManager.m", 55, @"%s is not available as initializer", "-[PXCMMMomentsInvitationsDataSourceManager init]");

  abort();
}

@end