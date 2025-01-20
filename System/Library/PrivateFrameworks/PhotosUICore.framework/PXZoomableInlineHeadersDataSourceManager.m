@interface PXZoomableInlineHeadersDataSourceManager
+ (BOOL)supportsAssetsDataSourceManager:(id)a3;
- (PXUpdater)updater;
- (PXZoomableInlineHeadersDataSource)monthsDataSource;
- (PXZoomableInlineHeadersDataSource)yearsDataSource;
- (PXZoomableInlineHeadersDataSourceManager)initWithAssetsDataSourceManager:(id)a3;
- (id)_fetchResultForDataSource:(id)a3;
- (id)_prepareQueue_createMetaDataStoreForAlbumWithDataSource:(id)a3;
- (id)dataSourceForLevel:(unint64_t)a3;
- (void)_didFinishBackgroundPreparationWithResult:(id)a3 forDataSource:(id)a4;
- (void)_invalidateDataSource;
- (void)_prepareInBackgroundWithDataSource:(id)a3;
- (void)_prepareQueue_prepareInBackroundWithDataSource:(id)a3;
- (void)_updateDataSource;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setNeedsUpdate;
@end

@implementation PXZoomableInlineHeadersDataSourceManager

void __100__PXZoomableInlineHeadersDataSourceManager__prepareQueue_createMetaDataStoreForAlbumWithDataSource___block_invoke_4(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 32);
  v5 = [NSNumber numberWithUnsignedInteger:a2];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    v7 = [*(id *)(a1 + 40) components:12 fromDate:v6];
    uint64_t v8 = [v7 year];
    uint64_t v9 = [v7 month];
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)
      || (*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
    {
      [v6 timeIntervalSinceReferenceDate];
      v10 = *(void **)(*(void *)(a1 + 64) + 8);
      v10[4] = a2;
      v10[5] = v8;
      v10[6] = v9;
      v10[7] = v11;
      v12 = *(void **)(a1 + 48);
      uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
      long long v14 = *(_OWORD *)(v13 + 48);
      long long v20 = *(_OWORD *)(v13 + 32);
      long long v21 = v14;
      [v12 addSectionInfo:&v20 forLevel:0];
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)
      || ((*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))() & 1) != 0
      || (*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
    {
      [v6 timeIntervalSinceReferenceDate];
      v15 = *(void **)(*(void *)(a1 + 72) + 8);
      v15[4] = a2;
      v15[5] = v8;
      v15[6] = v9;
      v15[7] = v16;
      v17 = *(void **)(a1 + 48);
      uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8);
      long long v19 = *(_OWORD *)(v18 + 48);
      long long v20 = *(_OWORD *)(v18 + 32);
      long long v21 = v19;
      [v17 addSectionInfo:&v20 forLevel:1];
    }
  }
}

BOOL __100__PXZoomableInlineHeadersDataSourceManager__prepareQueue_createMetaDataStoreForAlbumWithDataSource___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3 > a2;
}

BOOL __100__PXZoomableInlineHeadersDataSourceManager__prepareQueue_createMetaDataStoreForAlbumWithDataSource___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 components:12 fromDate:a2];
  uint64_t v8 = [*(id *)(a1 + 32) components:12 fromDate:v6];

  uint64_t v9 = [v7 year];
  if (v9 == [v8 year])
  {
    uint64_t v10 = [v7 month];
    BOOL v11 = v10 == [v8 month];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)setNeedsUpdate
{
}

- (void)_invalidateDataSource
{
}

- (void)_updateDataSource
{
  id v19 = [(PXAssetsDataSourceManager *)self->_assetsDataSourceManager dataSource];
  if ([v19 numberOfSections] >= 2)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"PXZoomableInlineHeadersDataSourceManager.m" lineNumber:114 description:@"Only supports data sources with 1 section (or empty)"];
  }
  if (self->_metaDataStore)
  {
    if (![v19 numberOfSections] || !objc_msgSend(v19, "numberOfItemsInSection:", 0))
    {
      metaDataStore = self->_metaDataStore;
      self->_metaDataStore = 0;

      goto LABEL_19;
    }
    v4 = [(PXZoomableInlineHeaderSectionInfoMetaDataStore *)self->_metaDataStore dataSource];
    v5 = [(PXAssetsDataSourceManager *)self->_assetsDataSourceManager changeHistory];
    id v6 = objc_msgSend(v5, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v4, "identifier"), objc_msgSend(v19, "identifier"));

    BOOL v7 = [(PXZoomableInlineHeaderSectionInfoMetaDataStore *)self->_metaDataStore updateWithDataSourceAfterChanges:v19 changeDetails:v6];
    uint64_t v8 = [(PXZoomableInlineHeadersDataSourceManager *)self _fetchResultForDataSource:v4];
    uint64_t v9 = [v8 fetchSortDescriptors];

    uint64_t v10 = [(PXZoomableInlineHeadersDataSourceManager *)self _fetchResultForDataSource:v19];
    BOOL v11 = [v10 fetchSortDescriptors];

    if (v9 == v11)
    {
      int v12 = 0;
      if (!v7) {
        goto LABEL_16;
      }
    }
    else
    {
      int v12 = [v9 isEqual:v11] ^ 1;
      if (!v7) {
        goto LABEL_16;
      }
    }
    if (!v12)
    {
LABEL_18:

      goto LABEL_19;
    }
LABEL_16:
    if (!self->_isPreparingMetadataInBackground) {
      [(PXZoomableInlineHeadersDataSourceManager *)self _prepareInBackgroundWithDataSource:v19];
    }
    goto LABEL_18;
  }
  if (!self->_isPreparingMetadataInBackground
    && [v19 containsAnyItems]
    && [v19 areAllSectionsConsideredAccurate])
  {
    [(PXZoomableInlineHeadersDataSourceManager *)self _prepareInBackgroundWithDataSource:v19];
  }
LABEL_19:
  long long v14 = [[PXZoomableInlineHeadersDataSource alloc] initWithAssetsDataSource:v19 level:0 metaDataStore:self->_metaDataStore];
  yearsDataSource = self->_yearsDataSource;
  self->_yearsDataSource = v14;

  uint64_t v16 = [[PXZoomableInlineHeadersDataSource alloc] initWithAssetsDataSource:v19 level:1 metaDataStore:self->_metaDataStore];
  monthsDataSource = self->_monthsDataSource;
  self->_monthsDataSource = v16;

  [(PXSectionedDataSourceManager *)self setDataSource:self->_monthsDataSource changeDetails:0];
}

- (id)_fetchResultForDataSource:(id)a3
{
  id v3 = a3;
  uint64_t v6 = [v3 identifier];
  long long v7 = xmmword_1AB359AA0;
  uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  v4 = [v3 assetsInSectionIndexPath:&v6];

  return v4;
}

- (void)_prepareInBackgroundWithDataSource:(id)a3
{
  id v5 = a3;
  if (self->_isPreparingMetadataInBackground)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXZoomableInlineHeadersDataSourceManager.m", 147, @"Invalid parameter not satisfying: %@", @"!_isPreparingMetadataInBackground" object file lineNumber description];
  }
  self->_isPreparingMetadataInBackground = 1;
  objc_initWeak(&location, self);
  uint64_t v6 = +[PXPreloadScheduler sharedScheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__PXZoomableInlineHeadersDataSourceManager__prepareInBackgroundWithDataSource___block_invoke;
  v9[3] = &unk_1E5DD2548;
  v9[4] = self;
  objc_copyWeak(&v11, &location);
  id v7 = v5;
  id v10 = v7;
  [v6 scheduleTaskAfterCATransactionCommits:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

uint64_t __76__PXZoomableInlineHeadersDataSourceManager_initWithAssetsDataSourceManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateDataSource];
}

uint64_t __73__PXZoomableInlineHeadersDataSourceManager_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateDataSource];
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXZoomableInlineHeadersDataSourceManager;
  [(PXZoomableInlineHeadersDataSourceManager *)&v4 didPerformChanges];
  id v3 = [(PXZoomableInlineHeadersDataSourceManager *)self updater];
  [v3 updateIfNeeded];
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXZoomableInlineHeadersDataSourceManager)initWithAssetsDataSourceManager:(id)a3
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PXZoomableInlineHeadersDataSourceManager;
  id v7 = [(PXSectionedDataSourceManager *)&v19 init];
  if (v7)
  {
    uint64_t v8 = [v6 dataSource];
    uint64_t v9 = [v8 numberOfSections];

    if (v9 != 1)
    {
      uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, v7, @"PXZoomableInlineHeadersDataSourceManager.m", 76, @"Invalid parameter not satisfying: %@", @"assetsDataSourceManager.dataSource.numberOfSections == 1" object file lineNumber description];
    }
    objc_storeStrong((id *)&v7->_assetsDataSourceManager, a3);
    [v6 registerChangeObserver:v7 context:PXAssetsDataSourceManagerObserverContext];
    uint64_t v10 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v7 needsUpdateSelector:sel_setNeedsUpdate];
    updater = v7->_updater;
    v7->_updater = (PXUpdater *)v10;

    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updateDataSource];
    int v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.photos.inline-headers-queue", v12);
    prepareQueue = v7->_prepareQueue;
    v7->_prepareQueue = (OS_dispatch_queue *)v13;

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __76__PXZoomableInlineHeadersDataSourceManager_initWithAssetsDataSourceManager___block_invoke;
    v17[3] = &unk_1E5DD0FA8;
    uint64_t v18 = v7;
    [(PXZoomableInlineHeadersDataSourceManager *)v18 performChanges:v17];
  }
  return v7;
}

+ (BOOL)supportsAssetsDataSourceManager:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (PXZoomableInlineHeadersDataSource)yearsDataSource
{
  return self->_yearsDataSource;
}

- (PXZoomableInlineHeadersDataSource)monthsDataSource
{
  return self->_monthsDataSource;
}

- (id)_prepareQueue_createMetaDataStoreForAlbumWithDataSource:(id)a3
{
  id v4 = a3;
  id v5 = [[PXZoomableInlineHeaderSectionInfoMetaDataStore alloc] initWithDataSource:v4];
  id v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v7 = [(PXZoomableInlineHeadersDataSourceManager *)self _fetchResultForDataSource:v4];
  if ((unint64_t)(objc_msgSend(v7, "px_sortOrder") - 1) <= 1)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __100__PXZoomableInlineHeadersDataSourceManager__prepareQueue_createMetaDataStoreForAlbumWithDataSource___block_invoke;
    v30[3] = &unk_1E5DCD1B8;
    id v8 = v6;
    id v31 = v8;
    uint64_t v9 = objc_msgSend(v7, "px_fetchAssetSortDatesWithDateRangeEliminationBlock:", v30);

    if (v9)
    {
      uint64_t v10 = [v9 sortDescriptor];
      int v11 = [v10 ascending];

      int v12 = [v9 dateByIndex];
      v27[0] = 0;
      v27[1] = v27;
      v27[2] = 0x4010000000;
      v27[3] = &unk_1AB5D584F;
      long long v28 = 0u;
      long long v29 = 0u;
      v24[0] = 0;
      v24[1] = v24;
      v24[2] = 0x4010000000;
      v24[3] = &unk_1AB5D584F;
      long long v25 = 0u;
      long long v26 = 0u;
      dispatch_queue_t v13 = [v9 fetchedIndexes];
      if (v11) {
        long long v14 = &__block_literal_global_141922;
      }
      else {
        long long v14 = &__block_literal_global_228;
      }
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __100__PXZoomableInlineHeadersDataSourceManager__prepareQueue_createMetaDataStoreForAlbumWithDataSource___block_invoke_4;
      v17[3] = &unk_1E5DBEA10;
      id v15 = v12;
      id v18 = v15;
      id v21 = v14;
      v22 = v27;
      id v19 = v8;
      long long v20 = v5;
      v23 = v24;
      [v13 enumerateIndexesUsingBlock:v17];

      _Block_object_dispose(v24, 8);
      _Block_object_dispose(v27, 8);
    }
  }

  return v5;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXAssetsDataSourceManagerObserverContext != a5)
  {
    int v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXZoomableInlineHeadersDataSourceManager.m" lineNumber:279 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  uint64_t v10 = v9;
  if (v6)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __73__PXZoomableInlineHeadersDataSourceManager_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E5DD0FA8;
    v12[4] = self;
    [(PXZoomableInlineHeadersDataSourceManager *)self performChanges:v12];
  }
}

void __91__PXZoomableInlineHeadersDataSourceManager__prepareQueue_prepareInBackroundWithDataSource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _didFinishBackgroundPreparationWithResult:*(void *)(a1 + 32) forDataSource:*(void *)(a1 + 40)];
}

void __79__PXZoomableInlineHeadersDataSourceManager__prepareInBackgroundWithDataSource___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_prepareQueue_prepareInBackroundWithDataSource:", *(void *)(a1 + 32));
}

void __79__PXZoomableInlineHeadersDataSourceManager__prepareInBackgroundWithDataSource___block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 152);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__PXZoomableInlineHeadersDataSourceManager__prepareInBackgroundWithDataSource___block_invoke_2;
  v3[3] = &unk_1E5DD20C8;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

uint64_t __100__PXZoomableInlineHeadersDataSourceManager__didFinishBackgroundPreparationWithResult_forDataSource___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateDataSource];
}

- (void)_prepareQueue_prepareInBackroundWithDataSource:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_prepareQueue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    PXAssertGetLog();
  }
  id v5 = v4;
  char v6 = [(PXZoomableInlineHeadersDataSourceManager *)self _prepareQueue_createMetaDataStoreForAlbumWithDataSource:v5];
  objc_initWeak(location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__PXZoomableInlineHeadersDataSourceManager__prepareQueue_prepareInBackroundWithDataSource___block_invoke;
  block[3] = &unk_1E5DD2548;
  objc_copyWeak(&v12, location);
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(location);
}

- (void)_didFinishBackgroundPreparationWithResult:(id)a3 forDataSource:(id)a4
{
  char v6 = (PXZoomableInlineHeaderSectionInfoMetaDataStore *)a3;
  if (!self->_isPreparingMetadataInBackground)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXZoomableInlineHeadersDataSourceManager.m", 177, @"Invalid parameter not satisfying: %@", @"_isPreparingMetadataInBackground" object file lineNumber description];
  }
  self->_isPreparingMetadataInBackground = 0;
  metaDataStore = self->_metaDataStore;
  self->_metaDataStore = v6;
  id v8 = v6;

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __100__PXZoomableInlineHeadersDataSourceManager__didFinishBackgroundPreparationWithResult_forDataSource___block_invoke;
  v10[3] = &unk_1E5DD0FA8;
  v10[4] = self;
  [(PXZoomableInlineHeadersDataSourceManager *)self performChanges:v10];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_yearsDataSource, 0);
  objc_storeStrong((id *)&self->_monthsDataSource, 0);
  objc_storeStrong((id *)&self->_prepareQueue, 0);
  objc_storeStrong((id *)&self->_metaDataStore, 0);
  objc_storeStrong((id *)&self->_previousAssetsDataSource, 0);
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
}

BOOL __100__PXZoomableInlineHeadersDataSourceManager__prepareQueue_createMetaDataStoreForAlbumWithDataSource___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3 < a2;
}

- (id)dataSourceForLevel:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"PXZoomableInlineHeadersDataSourceManager.m" lineNumber:101 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    id v3 = &OBJC_IVAR___PXZoomableInlineHeadersDataSourceManager__monthsDataSource;
  }
  else
  {
    id v3 = &OBJC_IVAR___PXZoomableInlineHeadersDataSourceManager__yearsDataSource;
  }
  id v4 = *(Class *)((char *)&self->super.super.super.isa + *v3);
  return v4;
}

@end