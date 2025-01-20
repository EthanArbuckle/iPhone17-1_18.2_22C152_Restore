@interface PXContentSyndicationMockSingleAssetsDataSourceManager
+ (id)createCountsController;
- (PXContentSyndicationMockSingleAssetsDataSourceManager)init;
- (id)allAssetsFetchResult;
- (id)assetFetchResultProvider;
- (id)createAssetsDataSourceManager;
- (id)createInitialDataSource;
- (id)imageProvider;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (id)socialLayerHighlightProvider;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4;
@end

@implementation PXContentSyndicationMockSingleAssetsDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightProvider, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_assetFetchResultProvider, 0);
  objc_storeStrong((id *)&self->_allPhotosFetchResult, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [(PXSectionedDataSourceManager *)self dataSource];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    v27 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v27);
    v28 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
    [v24 handleFailureInMethod:a2, self, @"PXContentSyndicationMockSingleAssetsDataSource.m", 265, @"%@ should be an instance inheriting from %@, but it is %@", @"self.dataSource", v26, v28 object file lineNumber description];
  }
  else
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    [v24 handleFailureInMethod:a2, self, @"PXContentSyndicationMockSingleAssetsDataSource.m", 265, @"%@ should be an instance inheriting from %@, but it is nil", @"self.dataSource", v26 object file lineNumber description];
  }

LABEL_3:
  v10 = [v8 objectForKeyedSubscript:@"currentDataSource"];

  if (v10 == v9)
  {
    v11 = [v8 objectForKeyedSubscript:@"preparedDataSource"];
    id v12 = [v8 objectForKeyedSubscript:@"preparedChangeDetails"];
  }
  else
  {
    id v30 = 0;
    v11 = [v9 dataSourceUpdatedWithChange:v7 changeDetails:&v30];
    id v12 = v30;
  }
  v13 = v12;
  if (v11 != v9)
  {
    id v14 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v15 = [v9 identifier];
    id v29 = v8;
    v16 = self;
    id v17 = v7;
    uint64_t v18 = [v11 identifier];
    v19 = [off_1E5DA5568 changeDetailsWithNoChanges];
    v31 = &unk_1F02D58D8;
    v32[0] = v13;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    uint64_t v21 = v18;
    id v7 = v17;
    v22 = (void *)[v14 initWithFromDataSourceIdentifier:v15 toDataSourceIdentifier:v21 sectionChanges:v19 itemChangeDetailsBySection:v20 subitemChangeDetailsByItemBySection:0];

    v23 = v16;
    id v8 = v29;
    [(PXSectionedDataSourceManager *)v23 setDataSource:v11 changeDetails:v22];
  }
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__5762;
  uint64_t v18 = __Block_byref_object_dispose__5763;
  id v19 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__PXContentSyndicationMockSingleAssetsDataSourceManager_prepareForPhotoLibraryChange___block_invoke;
  block[3] = &unk_1E5DCDEC8;
  block[4] = self;
  block[5] = &v14;
  block[6] = a2;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  v6 = (void *)v15[5];
  id v12 = 0;
  id v7 = [v6 dataSourceUpdatedWithChange:v5 changeDetails:&v12];
  id v8 = v12;
  uint64_t v9 = v15[5];
  v20[0] = @"currentDataSource";
  v20[1] = @"preparedDataSource";
  v21[0] = v9;
  v21[1] = v7;
  v20[2] = @"preparedChangeDetails";
  v21[2] = v8;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];

  _Block_object_dispose(&v14, 8);
  return v10;
}

void __86__PXContentSyndicationMockSingleAssetsDataSourceManager_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
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
    [v5 handleFailureInMethod:v10, v11, @"PXContentSyndicationMockSingleAssetsDataSource.m", 251, @"%@ should be an instance inheriting from %@, but it is %@", @"self.dataSource", v9, v13 object file lineNumber description];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    [v5 handleFailureInMethod:v6, v7, @"PXContentSyndicationMockSingleAssetsDataSource.m", 251, @"%@ should be an instance inheriting from %@, but it is nil", @"self.dataSource", v9 object file lineNumber description];
  }

LABEL_3:
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)createAssetsDataSourceManager
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PXSectionedDataSourceManager *)self dataSource];
  id v5 = v4;
  if (v4) {
    [v4 firstItemIndexPath];
  }
  else {
    memset(v18, 0, sizeof(v18));
  }
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __86__PXContentSyndicationMockSingleAssetsDataSourceManager_createAssetsDataSourceManager__block_invoke;
  uint64_t v15 = &unk_1E5DCA3B8;
  id v16 = v5;
  id v17 = v3;
  id v6 = v3;
  id v7 = v5;
  [v7 enumerateItemIndexPathsStartingAtIndexPath:v18 reverseDirection:0 usingBlock:&v12];
  id v8 = objc_alloc(MEMORY[0x1E4F39150]);
  uint64_t v9 = objc_msgSend(v8, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v6, self->_photoLibrary, *MEMORY[0x1E4F39650], 0, 0, 1, v12, v13, v14, v15);
  uint64_t v10 = PXContentSyndicationAssetsDataSourceManagerForAssetCollectionFetchResult(v9);

  return v10;
}

void __86__PXContentSyndicationMockSingleAssetsDataSourceManager_createAssetsDataSourceManager__block_invoke(uint64_t a1, _OWORD *a2)
{
  id v3 = *(void **)(a1 + 32);
  long long v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  id v5 = [v3 assetCollectionAtItemIndexPath:v6];
  [*(id *)(a1 + 40) addObject:v5];
}

- (id)socialLayerHighlightProvider
{
  highlightProvider = self->_highlightProvider;
  if (!highlightProvider)
  {
    long long v4 = [[PXContentSyndicationPhotoKitSocialLayerHighlightProvider alloc] initWithHighlightFetchBlock:&__block_literal_global_5765];
    id v5 = self->_highlightProvider;
    self->_highlightProvider = (PXContentSyndicationSocialLayerHighlightProvider *)v4;

    highlightProvider = self->_highlightProvider;
  }
  return highlightProvider;
}

id __85__PXContentSyndicationMockSingleAssetsDataSourceManager_socialLayerHighlightProvider__block_invoke(uint64_t a1, void *a2)
{
  return PXContentSyndicationSocialLayerHighlightForAsset(a2);
}

- (id)imageProvider
{
  imageProvider = self->_imageProvider;
  if (!imageProvider)
  {
    PXContentSyndicationImageProviderForPhotoLibrary(self->_photoLibrary);
    long long v4 = (PXUIImageProvider *)objc_claimAutoreleasedReturnValue();
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
    long long v4 = (PXContentSyndicationAssetFetchResultProvider *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_assetFetchResultProvider;
    self->_assetFetchResultProvider = v4;

    assetFetchResultProvider = self->_assetFetchResultProvider;
  }
  return assetFetchResultProvider;
}

- (id)allAssetsFetchResult
{
  return PXContentSyndicationMockSingleAssetsFetchResult(self->_photoLibrary, 1, 0);
}

- (id)createInitialDataSource
{
  id v3 = [(PHFetchResult *)self->_allPhotosFetchResult photoLibrary];
  objc_msgSend(v3, "px_registerChangeObserver:", self);
  long long v4 = [[PXContentSyndicationMockSingleAssetsDataSource alloc] initWithFetchResult:self->_allPhotosFetchResult];

  return v4;
}

- (PXContentSyndicationMockSingleAssetsDataSourceManager)init
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PXContentSyndicationMockSingleAssetsDataSourceManager;
  v2 = [(PXSectionedDataSourceManager *)&v16 init];
  if (!v2) {
    goto LABEL_5;
  }
  id v3 = +[PXContentSyndicationSettings sharedInstance];
  if ([v3 useUserLibraryForSyndicatedAssets])
  {
    objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    long long v4 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue();
    id v5 = 0;
    if (v4)
    {
LABEL_4:
      photoLibrary = v2->_photoLibrary;
      v2->_photoLibrary = v4;
      id v7 = v4;

      id v8 = +[PXContentSyndicationSettings sharedInstance];
      uint64_t v9 = [v8 maxNumberOfBatches];

      uint64_t v10 = PXContentSyndicationMockSingleAssetsFetchResult(v2->_photoLibrary, 0, v9);
      allPhotosFetchResult = v2->_allPhotosFetchResult;
      v2->_allPhotosFetchResult = (PHFetchResult *)v10;

LABEL_5:
      uint64_t v12 = v2;
      goto LABEL_10;
    }
  }
  else
  {
    id v15 = 0;
    long long v4 = [MEMORY[0x1E4F39228] openPhotoLibraryWithWellKnownIdentifier:3 error:&v15];
    id v5 = v15;
    if (v4) {
      goto LABEL_4;
    }
  }
  uint64_t v13 = PLUIGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "Error opening syndication library: %@", buf, 0xCu);
  }

  uint64_t v12 = 0;
LABEL_10:

  return v12;
}

+ (id)createCountsController
{
  v2 = objc_alloc_init(PXContentSyndicationPhotoKitCountsController);
  return v2;
}

@end