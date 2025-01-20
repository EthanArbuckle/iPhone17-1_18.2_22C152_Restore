@interface PXCMMMomentShareInvitationsDataSourceManager
+ (id)mostRecentCreationDate;
+ (id)mostRecentCreationDateForPhotoLibrary:(id)a3;
- (PXCMMMomentShareInvitationsDataSourceManager)init;
- (PXCMMMomentShareInvitationsDataSourceManager)initWithPhotoLibrary:(id)a3 fetchLimit:(int64_t)a4;
- (id)createInitialDataSource;
- (id)mediaProvider;
- (id)momentShares;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (int64_t)fetchLimit;
- (void)_handleFinishedFetchingBatch:(id)a3 preparedChangeDetails:(id)a4 forFetchResult:(id)a5 changedObjects:(id)a6;
- (void)_startLoadingIfNeeded;
- (void)_workerQueue_fetchRemainingMomentSharesInBatchesWithMomentShares:(id)a3;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4;
- (void)setFilter:(int64_t)a3;
@end

@implementation PXCMMMomentShareInvitationsDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingMomentShareObjectIDsToFetch, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (int64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = self->_state;
  v9 = [v7 objectForKeyedSubscript:@"preparedForCurrentState"];

  if (v9 == v8)
  {
    v10 = [v7 objectForKeyedSubscript:@"preparedState"];
    id v11 = [v7 objectForKeyedSubscript:@"preparedChangeDetails"];
  }
  else
  {
    id v25 = 0;
    v10 = [(PXCMMMomentShareInvitationsDataSourceState *)v8 stateUpdatedWithChange:v6 changeDetails:&v25];
    id v11 = v25;
  }
  v12 = v11;
  if (v10 != v8)
  {
    objc_storeStrong((id *)&self->_state, v10);
    v23 = [(PXSectionedDataSourceManager *)self dataSource];
    v13 = [[PXCMMMomentShareInvitationsDataSource alloc] initWithState:self->_state];
    id v22 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v14 = [v23 identifier];
    id v24 = v6;
    uint64_t v15 = [(PXCMMMomentShareInvitationsDataSource *)v13 identifier];
    v16 = [off_1E5DA5568 changeDetailsWithNoChanges];
    v26 = &unk_1F02D5A88;
    v27[0] = v12;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    id v17 = v7;
    v19 = v18 = self;
    v20 = (void *)[v22 initWithFromDataSourceIdentifier:v14 toDataSourceIdentifier:v15 sectionChanges:v16 itemChangeDetailsBySection:v19 subitemChangeDetailsByItemBySection:0];

    v21 = v18;
    id v7 = v17;
    [(PXSectionedDataSourceManager *)v21 setDataSource:v13 changeDetails:v20];

    id v6 = v24;
  }
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__15406;
  id v17 = __Block_byref_object_dispose__15407;
  id v18 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PXCMMMomentShareInvitationsDataSourceManager_prepareForPhotoLibraryChange___block_invoke;
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

void __77__PXCMMMomentShareInvitationsDataSourceManager_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
}

- (void)_handleFinishedFetchingBatch:(id)a3 preparedChangeDetails:(id)a4 forFetchResult:(id)a5 changedObjects:(id)a6
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  p_state = &self->_state;
  uint64_t v14 = self->_state;
  id v15 = a3;
  v16 = [(PXCMMMomentShareInvitationsDataSourceState *)v14 invitationsByMomentShareObjectID];
  id v17 = (void *)[v16 mutableCopy];

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __129__PXCMMMomentShareInvitationsDataSourceManager__handleFinishedFetchingBatch_preparedChangeDetails_forFetchResult_changedObjects___block_invoke;
  v43[3] = &unk_1E5DB0588;
  id v18 = v17;
  id v44 = v18;
  [v15 enumerateKeysAndObjectsUsingBlock:v43];

  v19 = [PXCMMMomentShareInvitationsDataSourceState alloc];
  v20 = [(PXCMMMomentShareInvitationsDataSourceState *)v14 momentShares];
  v21 = [(PXCMMMomentShareInvitationsDataSourceState *)v19 initWithMomentShares:v20 invitationsByMomentShareObjectID:v18];

  objc_storeStrong((id *)&self->_state, v21);
  if (self->_hasCreatedInitialDataSource)
  {
    v38 = v21;
    v39 = v14;
    id v22 = [(PXSectionedDataSourceManager *)self dataSource];
    v23 = [[PXCMMMomentShareInvitationsDataSource alloc] initWithState:*p_state];
    id v24 = [(PXCMMMomentShareInvitationsDataSourceState *)*p_state momentShares];

    id v41 = v11;
    id v42 = v10;
    id v40 = v12;
    if (v24 == v11)
    {
      id v31 = v10;
    }
    else
    {
      id v25 = (void *)MEMORY[0x1E4F390B8];
      v26 = [v22 state];
      v27 = [v26 momentShares];
      v28 = [(PXCMMMomentShareInvitationsDataSource *)v23 state];
      v29 = [v28 momentShares];
      v30 = [v25 changeDetailsFromFetchResult:v27 toFetchResult:v29 changedObjects:v12];

      id v31 = [off_1E5DA5568 changeDetailsFromFetchResultChangeDetails:v30];
    }
    id v32 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v33 = [v22 identifier];
    uint64_t v34 = [(PXCMMMomentShareInvitationsDataSource *)v23 identifier];
    v35 = [off_1E5DA5568 changeDetailsWithNoChanges];
    v45 = &unk_1F02D5A88;
    v46[0] = v31;
    v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
    v37 = (void *)[v32 initWithFromDataSourceIdentifier:v33 toDataSourceIdentifier:v34 sectionChanges:v35 itemChangeDetailsBySection:v36 subitemChangeDetailsByItemBySection:0];

    [(PXSectionedDataSourceManager *)self setDataSource:v23 changeDetails:v37];
    id v11 = v41;
    id v10 = v42;
    uint64_t v14 = v39;
    id v12 = v40;
    v21 = v38;
  }
  self->_isLoading = 0;
  [(PXCMMMomentShareInvitationsDataSourceManager *)self _startLoadingIfNeeded];
}

void __129__PXCMMMomentShareInvitationsDataSourceManager__handleFinishedFetchingBatch_preparedChangeDetails_forFetchResult_changedObjects___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

  if (!v6) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

- (void)_workerQueue_fetchRemainingMomentSharesInBatchesWithMomentShares:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v6 = v5;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  val = self;
  id v7 = self->_remainingMomentShareObjectIDsToFetch;
  uint64_t v8 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v56;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v56 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v55 + 1) + 8 * v11);
      id v13 = objc_alloc(MEMORY[0x1E4F39150]);
      uint64_t v60 = v12;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
      photoLibrary = val->_photoLibrary;
      v16 = [MEMORY[0x1E4F391B0] fetchType];
      id v17 = (void *)[v13 initWithOids:v14 photoLibrary:photoLibrary fetchType:v16 fetchPropertySets:0 identifier:0 registerIfNeeded:1];

      id v18 = [v17 firstObject];
      v19 = +[PXCMMMomentShareInvitation invitationWithMomentShare:v18];

      [v4 setObject:v19 forKeyedSubscript:v12];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v21 = v20 - v6;

      if (v21 > 0.25 || v21 < 0.0) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v55 objects:v61 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if ([v4 count])
  {
    remainingMomentShareObjectIDsToFetch = val->_remainingMomentShareObjectIDsToFetch;
    v23 = [v4 allKeys];
    [(NSMutableOrderedSet *)remainingMomentShareObjectIDsToFetch removeObjectsInArray:v23];
  }
  if (![(NSMutableOrderedSet *)val->_remainingMomentShareObjectIDsToFetch count])
  {
    id v24 = val->_remainingMomentShareObjectIDsToFetch;
    val->_remainingMomentShareObjectIDsToFetch = 0;
  }
  id v25 = [MEMORY[0x1E4F28E60] indexSet];
  v26 = [MEMORY[0x1E4F1CA48] array];
  v27 = [v42 fetchedObjectIDs];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v28 = v4;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v52 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v34 = [v27 indexOfObject:v33];
        if (v34 != 0x7FFFFFFFFFFFFFFFLL)
        {
          [v25 addIndex:v34];
          v35 = [v28 objectForKeyedSubscript:v33];
          v36 = [v35 momentShare];
          [v26 addObject:v36];
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v30);
  }

  v37 = (void *)[objc_alloc((Class)off_1E5DA5568) initWithIncrementalChangeDetailsRemovedIndexes:0 insertedIndexes:0 movesToIndexes:0 movesFromIndexes:0 changedIndexes:v25];
  objc_initWeak(&location, val);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __113__PXCMMMomentShareInvitationsDataSourceManager__workerQueue_fetchRemainingMomentSharesInBatchesWithMomentShares___block_invoke;
  block[3] = &unk_1E5DBDF50;
  objc_copyWeak(&v49, &location);
  id v45 = v28;
  id v46 = v37;
  id v47 = v42;
  id v48 = v26;
  id v38 = v26;
  id v39 = v42;
  id v40 = v37;
  id v41 = v28;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v49);
  objc_destroyWeak(&location);
}

void __113__PXCMMMomentShareInvitationsDataSourceManager__workerQueue_fetchRemainingMomentSharesInBatchesWithMomentShares___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _handleFinishedFetchingBatch:*(void *)(a1 + 32) preparedChangeDetails:*(void *)(a1 + 40) forFetchResult:*(void *)(a1 + 48) changedObjects:*(void *)(a1 + 56)];
}

- (void)_startLoadingIfNeeded
{
  if (!self->_isLoading)
  {
    if (self->_remainingMomentShareObjectIDsToFetch)
    {
      self->_isLoading = 1;
      v3 = [(PXCMMMomentShareInvitationsDataSourceManager *)self momentShares];
      objc_initWeak(&location, self);
      workerQueue = self->_workerQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__PXCMMMomentShareInvitationsDataSourceManager__startLoadingIfNeeded__block_invoke;
      block[3] = &unk_1E5DD20C8;
      objc_copyWeak(&v8, &location);
      id v7 = v3;
      id v5 = v3;
      dispatch_async(workerQueue, block);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __69__PXCMMMomentShareInvitationsDataSourceManager__startLoadingIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_workerQueue_fetchRemainingMomentSharesInBatchesWithMomentShares:", *(void *)(a1 + 32));
}

- (id)momentShares
{
  return [(PXCMMMomentShareInvitationsDataSourceState *)self->_state momentShares];
}

- (id)createInitialDataSource
{
  if (self->_hasCreatedInitialDataSource)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXCMMMomentShareInvitationsDataSourceManager.m", 132, @"Invalid parameter not satisfying: %@", @"!_hasCreatedInitialDataSource" object file lineNumber description];
  }
  v3 = [[PXCMMMomentShareInvitationsDataSource alloc] initWithState:self->_state];
  self->_hasCreatedInitialDataSource = 1;
  [(PXCMMMomentShareInvitationsDataSourceManager *)self _startLoadingIfNeeded];
  return v3;
}

- (void)setFilter:(int64_t)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  if (self->_filter != a3)
  {
    self->_filter = a3;
    _DataSourceState(self->_photoLibrary, a3, self->_fetchLimit);
    id v4 = (PXCMMMomentShareInvitationsDataSourceState *)objc_claimAutoreleasedReturnValue();
    state = self->_state;
    self->_state = v4;

    double v6 = [[PXCMMMomentShareInvitationsDataSource alloc] initWithState:self->_state];
    id v7 = [(PXSectionedDataSourceManager *)self dataSource];
    id v8 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v9 = v6;
    uint64_t v10 = [v7 state];
    uint64_t v11 = [v10 momentShares];
    uint64_t v12 = [v11 fetchedObjects];
    id v25 = [v8 arrayWithArray:v12];

    id v13 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v14 = [(PXCMMMomentShareInvitationsDataSource *)v9 state];
    id v15 = [v14 momentShares];
    v16 = [v15 fetchedObjects];
    id v17 = [v13 arrayWithArray:v16];

    id v18 = [off_1E5DA5568 changeDetailsFromArray:v25 toArray:v17 changedObjects:MEMORY[0x1E4F1CBF0] objectComparator:&__block_literal_global_15436];
    id v19 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v20 = [v7 identifier];
    uint64_t v21 = [(PXCMMMomentShareInvitationsDataSource *)v9 identifier];

    id v22 = [off_1E5DA5568 changeDetailsWithNoChanges];
    v26 = &unk_1F02D5A88;
    v27[0] = v18;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    id v24 = (void *)[v19 initWithFromDataSourceIdentifier:v20 toDataSourceIdentifier:v21 sectionChanges:v22 itemChangeDetailsBySection:v23 subitemChangeDetailsByItemBySection:0];

    [(PXSectionedDataSourceManager *)self setDataSource:v9 changeDetails:v24];
  }
}

- (id)mediaProvider
{
  v2 = objc_alloc_init(PXCMMPreviewUIImageProvider);
  return v2;
}

- (PXCMMMomentShareInvitationsDataSourceManager)initWithPhotoLibrary:(id)a3 fetchLimit:(int64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PXCMMMomentShareInvitationsDataSourceManager.m", 90, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)PXCMMMomentShareInvitationsDataSourceManager;
  uint64_t v9 = [(PXSectionedDataSourceManager *)&v25 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_filter = 0;
    p_photoLibrary = (void **)&v9->_photoLibrary;
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    v10->_fetchLimit = a4;
    uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.photos.PXCMMMomentShareInvitationsDataSourceManager", v13);
    workerQueue = v10->_workerQueue;
    v10->_workerQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = _DataSourceState(*p_photoLibrary, v10->_filter, v10->_fetchLimit);
    state = v10->_state;
    v10->_state = (PXCMMMomentShareInvitationsDataSourceState *)v16;

    id v18 = (void *)MEMORY[0x1E4F1CA70];
    id v19 = [(PXCMMMomentShareInvitationsDataSourceState *)v10->_state momentShares];
    uint64_t v20 = [v19 fetchedObjectIDs];
    uint64_t v21 = [v18 orderedSetWithArray:v20];
    remainingMomentShareObjectIDsToFetch = v10->_remainingMomentShareObjectIDsToFetch;
    v10->_remainingMomentShareObjectIDsToFetch = (NSMutableOrderedSet *)v21;

    objc_msgSend(*p_photoLibrary, "px_registerChangeObserver:", v10);
  }

  return v10;
}

- (PXCMMMomentShareInvitationsDataSourceManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMMomentShareInvitationsDataSourceManager.m", 86, @"%s is not available as initializer", "-[PXCMMMomentShareInvitationsDataSourceManager init]");

  abort();
}

+ (id)mostRecentCreationDateForPhotoLibrary:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    dispatch_queue_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"PXCMMMomentShareInvitationsDataSourceManager.m", 71, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  double v6 = [v5 librarySpecificFetchOptions];
  id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v15[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v6 setSortDescriptors:v8];

  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(status != %d && publishState == %d)", 0, 2);
  [v6 setPredicate:v9];

  [v6 setFetchLimit:1];
  uint64_t v10 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:7 subtype:0x7FFFFFFFFFFFFFFFLL options:v6];
  uint64_t v11 = [v10 firstObject];
  uint64_t v12 = [v11 creationDate];

  return v12;
}

+ (id)mostRecentCreationDate
{
  v3 = [MEMORY[0x1E4F39228] sharedMomentSharePhotoLibrary];
  id v4 = [a1 mostRecentCreationDateForPhotoLibrary:v3];

  return v4;
}

@end