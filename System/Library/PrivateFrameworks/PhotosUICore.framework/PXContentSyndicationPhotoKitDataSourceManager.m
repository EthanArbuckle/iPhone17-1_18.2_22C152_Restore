@interface PXContentSyndicationPhotoKitDataSourceManager
+ (id)createCountsController;
- (PXContentSyndicationPhotoKitDataSourceManager)init;
- (PXContentSyndicationPhotoKitDataSourceManager)initWithPhotoLibrary:(id)a3;
- (id)allAssetsFetchResult;
- (id)assetFetchResultProvider;
- (id)createAssetsDataSourceManager;
- (id)createInitialDataSource;
- (id)imageProvider;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (id)socialLayerHighlightProvider;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4;
- (void)setDataSource:(id)a3 changeDetails:(id)a4;
@end

@implementation PXContentSyndicationPhotoKitDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightProvider, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_assetFetchResultProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [(PXSectionedDataSourceManager *)self dataSource];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    v25 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v25);
    v26 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
    [v22 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitDataSource.m", 355, @"%@ should be an instance inheriting from %@, but it is %@", @"self.dataSource", v24, v26 object file lineNumber description];
  }
  else
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    [v22 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitDataSource.m", 355, @"%@ should be an instance inheriting from %@, but it is nil", @"self.dataSource", v24 object file lineNumber description];
  }

LABEL_3:
  v10 = [v8 objectForKeyedSubscript:@"currentDataSource"];

  if (v10 == v9)
  {
    v11 = [v8 objectForKeyedSubscript:@"preparedDataSource"];
    id v12 = [v8 objectForKeyedSubscript:@"preparedUnderlyingChangeDetails"];
  }
  else
  {
    id v28 = 0;
    v11 = [v9 dataSourceUpdatedWithChange:v7 underlyingArrayChangeDetails:&v28];
    id v12 = v28;
  }
  v13 = v12;
  if ([v12 hasAnyChanges])
  {
    v14 = PLSyndicationUIGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v13;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "ContentSyndicationPhotoKitDataSourceManager: Data Source has non-empty underlying change details: %{public}@.", buf, 0xCu);
    }
  }
  if (v11 != v9)
  {
    id v27 = v7;
    id v15 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v16 = [v9 identifier];
    uint64_t v17 = [v11 identifier];
    v18 = [off_1E5DA5568 changeDetailsWithNoChanges];
    v33 = &unk_1F02D9DD8;
    v34[0] = v13;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    v20 = (void *)[v15 initWithFromDataSourceIdentifier:v16 toDataSourceIdentifier:v17 sectionChanges:v18 itemChangeDetailsBySection:v19 subitemChangeDetailsByItemBySection:0];

    v21 = PLSyndicationUIGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v30 = v9;
      __int16 v31 = 2114;
      v32 = v11;
      _os_log_impl(&dword_1A9AE7000, v21, OS_LOG_TYPE_DEFAULT, "ContentSyndicationPhotoKitDataSourceManager: Updating data Source from: %{public}@ to %{public}@", buf, 0x16u);
    }

    [(PXContentSyndicationPhotoKitDataSourceManager *)self setDataSource:v11 changeDetails:v20];
    id v7 = v27;
  }
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__262314;
  v18 = __Block_byref_object_dispose__262315;
  id v19 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PXContentSyndicationPhotoKitDataSourceManager_prepareForPhotoLibraryChange___block_invoke;
  block[3] = &unk_1E5DCDEC8;
  block[4] = self;
  block[5] = &v14;
  block[6] = a2;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  v6 = (void *)v15[5];
  id v12 = 0;
  id v7 = [v6 dataSourceUpdatedWithChange:v5 underlyingArrayChangeDetails:&v12];
  id v8 = v12;
  uint64_t v9 = v15[5];
  v20[0] = @"currentDataSource";
  v20[1] = @"preparedDataSource";
  v21[0] = v9;
  v21[1] = v7;
  v20[2] = @"preparedUnderlyingChangeDetails";
  v21[2] = v8;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];

  _Block_object_dispose(&v14, 8);
  return v10;
}

void __78__PXContentSyndicationPhotoKitDataSourceManager_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dataSource];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v12);
    v13 = objc_msgSend(v2, "px_descriptionForAssertionMessage");
    [v5 handleFailureInMethod:v10, v11, @"PXContentSyndicationPhotoKitDataSource.m", 341, @"%@ should be an instance inheriting from %@, but it is %@", @"self.dataSource", v9, v13 object file lineNumber description];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    [v5 handleFailureInMethod:v6, v7, @"PXContentSyndicationPhotoKitDataSource.m", 341, @"%@ should be an instance inheriting from %@, but it is nil", @"self.dataSource", v9 object file lineNumber description];
  }

LABEL_3:
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)createAssetsDataSourceManager
{
  v2 = PXContentSyndicationCollectionsFetchResultForPhotoLibraryWithFetchLimit(self->_photoLibrary, 0, 0);
  uint64_t v3 = PXContentSyndicationAssetsDataSourceManagerForAssetCollectionFetchResult(v2);

  return v3;
}

- (id)socialLayerHighlightProvider
{
  highlightProvider = self->_highlightProvider;
  if (!highlightProvider)
  {
    v4 = +[PXContentSyndicationPhotoKitSocialLayerHighlightProvider sharedInstance];
    id v5 = self->_highlightProvider;
    self->_highlightProvider = v4;

    highlightProvider = self->_highlightProvider;
  }
  return highlightProvider;
}

- (id)imageProvider
{
  imageProvider = self->_imageProvider;
  if (!imageProvider)
  {
    PXContentSyndicationImageProviderForPhotoLibrary(self->_photoLibrary);
    v4 = (PXUIImageProvider *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_imageProvider;
    self->_imageProvider = v4;

    imageProvider = self->_imageProvider;
  }
  return imageProvider;
}

- (id)assetFetchResultProvider
{
  assetFetchResultProvider = self->_assetFetchResultProvider;
  if (!assetFetchResultProvider)
  {
    PXContentSyndicationAssetFetchResultProviderForPhotoLibrary(self->_photoLibrary);
    v4 = (PXContentSyndicationAssetFetchResultProvider *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_assetFetchResultProvider;
    self->_assetFetchResultProvider = v4;

    assetFetchResultProvider = self->_assetFetchResultProvider;
  }
  return assetFetchResultProvider;
}

- (id)allAssetsFetchResult
{
  return PXContentSyndicationAssetsFetchResultForPhotoLibrary(self->_photoLibrary, 1, 0);
}

- (void)setDataSource:(id)a3 changeDetails:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8) {
    goto LABEL_21;
  }
  uint64_t v9 = PLSyndicationUIGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "ContentSyndicationPhotoKitDataSourceManager: setDataSource: has non-nil change details. Attempting to invalidate key asset fetch results for affected asset collections", buf, 2u);
  }

  uint64_t v10 = [v8 itemChangesInSection:0];
  if (![v10 hasIncrementalChanges])
  {
LABEL_20:

LABEL_21:
    uint64_t v10 = [(PXContentSyndicationPhotoKitDataSourceManager *)self assetFetchResultProvider];
    [v10 invalidateAllAssetFetchResults];
    goto LABEL_22;
  }
  *(void *)buf = 0;
  v40 = buf;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__262314;
  v43 = __Block_byref_object_dispose__262315;
  id v44 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v11 = [v10 removedIndexes];
  if ([v11 count])
  {
    id v12 = [(PXSectionedDataSourceManager *)self dataSource];
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_8:
        uint64_t v13 = [v12 numberOfItemsInSection:0];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        void v34[2] = __77__PXContentSyndicationPhotoKitDataSourceManager_setDataSource_changeDetails___block_invoke;
        v34[3] = &unk_1E5DCD888;
        uint64_t v37 = v13;
        id v14 = v12;
        uint64_t v38 = 0;
        id v35 = v14;
        v36 = buf;
        [v11 enumerateIndexesUsingBlock:v34];
        id v15 = PLSyndicationUIGetLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v45 = 138543362;
          uint64_t v46 = (uint64_t)v11;
          _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_INFO, "ContentSyndicationPhotoKitDataSourceManager: Invalidating key asset fetchresults for removed indexes (relative to old data source): %{public}@", v45, 0xCu);
        }

        goto LABEL_11;
      }
      id v27 = [MEMORY[0x1E4F28B00] currentHandler];
      v24 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v24);
      v25 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
      [v27 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitDataSource.m", 247, @"%@ should be an instance inheriting from %@, but it is %@", @"self.dataSource", v26, v25 object file lineNumber description];
    }
    else
    {
      id v27 = [MEMORY[0x1E4F28B00] currentHandler];
      v23 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v23);
      [v27 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitDataSource.m", 247, @"%@ should be an instance inheriting from %@, but it is nil", @"self.dataSource", v26 object file lineNumber description];
    }

    goto LABEL_8;
  }
LABEL_11:
  uint64_t v16 = [v10 changedIndexes];
  if (v16)
  {
    uint64_t v17 = [v7 numberOfItemsInSection:0];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __77__PXContentSyndicationPhotoKitDataSourceManager_setDataSource_changeDetails___block_invoke_272;
    v29[3] = &unk_1E5DCD888;
    uint64_t v32 = v17;
    uint64_t v33 = 0;
    id v30 = v7;
    __int16 v31 = buf;
    [v16 enumerateIndexesUsingBlock:v29];
    v18 = PLSyndicationUIGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v45 = 138543362;
      uint64_t v46 = (uint64_t)v16;
      _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_INFO, "ContentSyndicationPhotoKitDataSourceManager: Invalidating key asset fetchresults for changed indexes (relative to new data source): %{public}@", v45, 0xCu);
    }
  }
  if (![*((id *)v40 + 5) count])
  {

    _Block_object_dispose(buf, 8);
    goto LABEL_20;
  }
  id v19 = PLSyndicationUIGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = [*((id *)v40 + 5) count];
    uint64_t v21 = *((void *)v40 + 5);
    *(_DWORD *)v45 = 134218242;
    uint64_t v46 = v20;
    __int16 v47 = 2112;
    uint64_t v48 = v21;
    _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_INFO, "ContentSyndicationPhotoKitDataSourceManager: Invalidating %tu asset collection fetch results after change notification: %@", v45, 0x16u);
  }

  v22 = [(PXContentSyndicationPhotoKitDataSourceManager *)self assetFetchResultProvider];
  [v22 invalidateAssetFetchResultsInAssetCollections:*((void *)v40 + 5)];

  _Block_object_dispose(buf, 8);
LABEL_22:

  v28.receiver = self;
  v28.super_class = (Class)PXContentSyndicationPhotoKitDataSourceManager;
  [(PXSectionedDataSourceManager *)&v28 setDataSource:v7 changeDetails:v8];
}

void __77__PXContentSyndicationPhotoKitDataSourceManager_setDataSource_changeDetails___block_invoke(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 48) > a2)
  {
    uint64_t v4 = [*(id *)(a1 + 32) identifier];
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void **)(a1 + 32);
    v8[0] = v4;
    v8[1] = v5;
    v8[2] = a2;
    v8[3] = 0x7FFFFFFFFFFFFFFFLL;
    id v7 = [v6 objectAtIndexPath:v8];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
  }
}

void __77__PXContentSyndicationPhotoKitDataSourceManager_setDataSource_changeDetails___block_invoke_272(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 48) > a2)
  {
    uint64_t v4 = [*(id *)(a1 + 32) identifier];
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void **)(a1 + 32);
    v8[0] = v4;
    v8[1] = v5;
    v8[2] = a2;
    v8[3] = 0x7FFFFFFFFFFFFFFFLL;
    id v7 = [v6 objectAtIndexPath:v8];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
  }
}

- (id)createInitialDataSource
{
  [(PHPhotoLibrary *)self->_photoLibrary px_registerChangeObserver:self];
  uint64_t v3 = PLSyndicationGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  if (PFProcessIsLaunchedToExecuteTests())
  {
    int v5 = 0;
  }
  else
  {
    uint64_t v6 = +[PXContentSyndicationSettings sharedInstance];
    int v5 = [v6 loadVerySmallInitialBatchOfRecentCollections];
  }
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  id v8 = PLSyndicationUIGetLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "ContentSyndicationPhotoKitDataSourceManager: Loading a very small batch of initial Shared with You items", buf, 2u);
    }

    uint64_t v10 = PXContentSyndicationCollectionsFetchResultForPhotoLibraryWithFetchLimit(self->_photoLibrary, 1, 1);
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "ContentSyndicationPhotoKitDataSourceManager: Loading full batch of initial Shared with You items", buf, 2u);
    }

    uint64_t v11 = v3;
    id v12 = v11;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PXContentSyndicationPhotoKitDataSource.fullBatchFetch", "", buf, 2u);
    }

    uint64_t v10 = PXContentSyndicationCollectionsFetchResultForPhotoLibraryWithFetchLimit(self->_photoLibrary, 0, 0);
    uint64_t v13 = v12;
    id v14 = v13;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v14, OS_SIGNPOST_INTERVAL_END, v4, "PXContentSyndicationPhotoKitDataSource.fullBatchFetch", "", buf, 2u);
    }
  }
  id v15 = [[PXContentSyndicationPhotoKitDataSource alloc] initWithFetchResult:v10];
  if (v5)
  {
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v17 = PLSyndicationUIGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_DEFAULT, "ContentSyndicationPhotoKitDataSourceManager: Kicking off loading of the delayed full batch of Shared with You items", buf, 2u);
    }

    v18 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__PXContentSyndicationPhotoKitDataSourceManager_createInitialDataSource__block_invoke;
    block[3] = &unk_1E5DCE038;
    os_signpost_id_t v26 = v4;
    v22 = v3;
    v23 = self;
    id v24 = v7;
    id v25 = v16;
    id v19 = v16;
    dispatch_async(v18, block);
  }
  return v15;
}

void __72__PXContentSyndicationPhotoKitDataSourceManager_createInitialDataSource__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = *(id *)(a1 + 32);
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PXContentSyndicationPhotoKitDataSource.fullBatchFetch", "", buf, 2u);
  }

  int v5 = PXContentSyndicationCollectionsFetchResultForPhotoLibraryWithFetchLimit(*(void **)(*(void *)(a1 + 40) + 128), 0, 0);
  uint64_t v6 = *(id *)(a1 + 32);
  id v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 64);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_END, v8, "PXContentSyndicationPhotoKitDataSource.fullBatchFetch", "", buf, 2u);
  }

  BOOL v9 = [MEMORY[0x1E4F1C9C8] date];
  [v9 timeIntervalSinceDate:*(void *)(a1 + 48)];
  double v11 = v10;
  [v9 timeIntervalSinceDate:*(void *)(a1 + 56)];
  double v13 = v12;
  id v14 = PLSyndicationUIGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [v5 count];
    *(_DWORD *)buf = 134218496;
    uint64_t v22 = v15;
    __int16 v23 = 2048;
    double v24 = v13 * 1000.0;
    __int16 v25 = 2048;
    double v26 = v11 * 1000.0;
    _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "ContentSyndicationPhotoKitDataSourceManager: Loaded delayed full batch of Shared with You items: %lu items. Took %.0fms for full batch fetch, %.0fms since initial data source", buf, 0x20u);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__PXContentSyndicationPhotoKitDataSourceManager_createInitialDataSource__block_invoke_265;
  v18[3] = &unk_1E5DD32A8;
  uint64_t v16 = *(void *)(a1 + 40);
  id v19 = v5;
  uint64_t v20 = v16;
  id v17 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v18);
}

void __72__PXContentSyndicationPhotoKitDataSourceManager_createInitialDataSource__block_invoke_265(uint64_t a1)
{
  v2 = [[PXContentSyndicationPhotoKitDataSource alloc] initWithFetchResult:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) setDataSource:v2 changeDetails:0];
}

- (PXContentSyndicationPhotoKitDataSourceManager)initWithPhotoLibrary:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitDataSource.m", 170, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXContentSyndicationPhotoKitDataSourceManager;
  id v7 = [(PXSectionedDataSourceManager *)&v11 init];
  os_signpost_id_t v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
  }

  return v8;
}

- (PXContentSyndicationPhotoKitDataSourceManager)init
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  uint64_t v3 = [MEMORY[0x1E4F39228] openPhotoLibraryWithWellKnownIdentifier:3 error:&v8];
  id v4 = v8;
  if (v3)
  {
    self = [(PXContentSyndicationPhotoKitDataSourceManager *)self initWithPhotoLibrary:v3];
    int v5 = self;
  }
  else
  {
    id v6 = PLSyndicationUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Error opening syndication library: %@", buf, 0xCu);
    }

    int v5 = 0;
  }

  return v5;
}

+ (id)createCountsController
{
  v2 = objc_alloc_init(PXContentSyndicationPhotoKitCountsController);
  return v2;
}

@end