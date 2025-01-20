@interface PXContentSyndicationMockCMMDataSourceManager
+ (id)createCountsController;
- (PXCMMInvitationsDataSourceManager)cmmDataSourceManager;
- (id)allAssetsFetchResult;
- (id)assetFetchResultProvider;
- (id)createAssetsDataSourceManager;
- (id)createInitialDataSource;
- (id)imageProvider;
- (id)socialLayerHighlightProvider;
- (void)_handleDataSourceChange;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setCmmDataSourceManager:(id)a3;
@end

@implementation PXContentSyndicationMockCMMDataSourceManager

+ (id)createCountsController
{
  v2 = objc_alloc_init(PXContentSyndicationPhotoKitCountsController);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmmDataSourceManager, 0);
  objc_storeStrong((id *)&self->_highlightProvider, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_assetFetchResultProvider, 0);
}

- (void)setCmmDataSourceManager:(id)a3
{
}

- (PXCMMInvitationsDataSourceManager)cmmDataSourceManager
{
  return self->_cmmDataSourceManager;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)PXContentSyndicationMockCMMDataSourceManagerContext == a5) {
    [(PXContentSyndicationMockCMMDataSourceManager *)self _handleDataSourceChange];
  }
}

- (void)_handleDataSourceChange
{
  v3 = [(PXContentSyndicationMockCMMDataSourceManager *)self cmmDataSourceManager];
  id v12 = [v3 dataSource];

  v4 = [[PXContentSyndicationMockCMMDataSource alloc] initWithCMMDataSource:v12];
  v5 = [(PXContentSyndicationMockCMMDataSourceManager *)self cmmDataSourceManager];
  v6 = [(PXSectionedDataSourceManager *)self dataSource];
  v7 = [v6 cmmDataSource];
  v8 = [v5 changeDetailsFromDataSource:v7 toDataSource:v12];

  id v9 = objc_alloc((Class)off_1E5DA8488);
  v10 = [(PXSectionedDataSourceManager *)self dataSource];
  v11 = objc_msgSend(v9, "initWithSectionedDataSourceChangeDetails:withFromDataSourceIdentifier:toDataSourceIdentifier:", v8, objc_msgSend(v10, "identifier"), -[PXContentSyndicationMockCMMDataSource identifier](v4, "identifier"));

  [(PXSectionedDataSourceManager *)self setDataSource:v4 changeDetails:v11];
}

- (id)createInitialDataSource
{
  v3 = +[PXCMMInvitationsDataSourceManager currentDataSourceManager];
  cmmDataSourceManager = self->_cmmDataSourceManager;
  self->_cmmDataSourceManager = v3;

  [(PXSectionedDataSourceManager *)self->_cmmDataSourceManager registerChangeObserver:self context:PXContentSyndicationMockCMMDataSourceManagerContext];
  v5 = [(PXContentSyndicationMockCMMDataSourceManager *)self cmmDataSourceManager];
  v6 = [v5 dataSource];

  v7 = [[PXContentSyndicationMockCMMDataSource alloc] initWithCMMDataSource:v6];
  return v7;
}

- (id)createAssetsDataSourceManager
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F39228] sharedMomentSharePhotoLibrary];
  v3 = [v2 librarySpecificFetchOptions];

  v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v9[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v3 setSortDescriptors:v5];

  v6 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:7 subtype:0x7FFFFFFFFFFFFFFFLL options:v3];
  v7 = PXContentSyndicationAssetsDataSourceManagerForAssetCollectionFetchResult(v6);

  return v7;
}

- (id)socialLayerHighlightProvider
{
  highlightProvider = self->_highlightProvider;
  if (!highlightProvider)
  {
    v4 = [[PXContentSyndicationPhotoKitSocialLayerHighlightProvider alloc] initWithHighlightFetchBlock:&__block_literal_global_287941];
    v5 = self->_highlightProvider;
    self->_highlightProvider = (PXContentSyndicationSocialLayerHighlightProvider *)v4;

    highlightProvider = self->_highlightProvider;
  }
  return highlightProvider;
}

uint64_t __76__PXContentSyndicationMockCMMDataSourceManager_socialLayerHighlightProvider__block_invoke()
{
  return 0;
}

- (id)imageProvider
{
  imageProvider = self->_imageProvider;
  if (!imageProvider)
  {
    v4 = [MEMORY[0x1E4F39228] sharedMomentSharePhotoLibrary];
    PXContentSyndicationImageProviderForPhotoLibrary(v4);
    v5 = (PXUIImageProvider *)objc_claimAutoreleasedReturnValue();
    v6 = self->_imageProvider;
    self->_imageProvider = v5;

    imageProvider = self->_imageProvider;
  }
  return imageProvider;
}

- (id)assetFetchResultProvider
{
  assetFetchResultProvider = self->_assetFetchResultProvider;
  if (!assetFetchResultProvider)
  {
    v4 = [MEMORY[0x1E4F39228] sharedMomentSharePhotoLibrary];
    PXContentSyndicationAssetFetchResultProviderForPhotoLibrary(v4);
    v5 = (PXContentSyndicationAssetFetchResultProvider *)objc_claimAutoreleasedReturnValue();
    v6 = self->_assetFetchResultProvider;
    self->_assetFetchResultProvider = v5;

    assetFetchResultProvider = self->_assetFetchResultProvider;
  }
  return assetFetchResultProvider;
}

- (id)allAssetsFetchResult
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F39228] sharedMomentSharePhotoLibrary];
  if (!v2)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = [NSString stringWithUTF8String:"PHFetchResult<PHAsset *> *_AllPhotosFetchResultForPhotoLibrary(PHPhotoLibrary *__strong)"];
    [v8 handleFailureInFunction:v9, @"PXContentSyndicationMockCMMDataSource.m", 138, @"Invalid parameter not satisfying: %@", @"photoLibrary" file lineNumber description];
  }
  v3 = [v2 librarySpecificFetchOptions];
  v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:1];
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  [v3 setInternalSortDescriptors:v5];
  v6 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v3];

  return v6;
}

@end