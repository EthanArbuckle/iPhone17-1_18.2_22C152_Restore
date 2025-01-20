@interface PXContentSyndicationMockSharedAlbumsDataSourceManager
+ (id)createCountsController;
- (PHPhotoLibrary)photoLibrary;
- (PXCollectionsDataSourceManager)sharedAlbumsDataSourceManager;
- (PXContentSyndicationMockSharedAlbumsDataSourceManager)init;
- (id)allAssetsFetchResult;
- (id)assetFetchResultProvider;
- (id)createAssetsDataSourceManager;
- (id)createInitialDataSource;
- (id)imageProvider;
- (id)socialLayerHighlightProvider;
- (void)_handleDataSourceChange;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setSharedAlbumsDataSourceManager:(id)a3;
@end

@implementation PXContentSyndicationMockSharedAlbumsDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedAlbumsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_highlightProvider, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_assetFetchResultProvider, 0);
}

- (void)setSharedAlbumsDataSourceManager:(id)a3
{
}

- (PXCollectionsDataSourceManager)sharedAlbumsDataSourceManager
{
  return self->_sharedAlbumsDataSourceManager;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)PXContentSyndicationMockSharedAlbumsDataSourceManagerContext == a5) {
    [(PXContentSyndicationMockSharedAlbumsDataSourceManager *)self _handleDataSourceChange];
  }
}

- (void)_handleDataSourceChange
{
  v3 = [(PXContentSyndicationMockSharedAlbumsDataSourceManager *)self sharedAlbumsDataSourceManager];
  id v12 = [v3 dataSource];

  v4 = [[PXContentSyndicationMockSharedAlbumsDataSource alloc] initWithSharedAlbumsDataSource:v12];
  v5 = [(PXContentSyndicationMockSharedAlbumsDataSourceManager *)self sharedAlbumsDataSourceManager];
  v6 = [(PXSectionedDataSourceManager *)self dataSource];
  v7 = [v6 sharedAlbumsDataSource];
  v8 = [v5 changeDetailsFromDataSource:v7 toDataSource:v12];

  id v9 = objc_alloc((Class)off_1E5DA8488);
  v10 = [(PXSectionedDataSourceManager *)self dataSource];
  v11 = objc_msgSend(v9, "initWithSectionedDataSourceChangeDetails:withFromDataSourceIdentifier:toDataSourceIdentifier:", v8, objc_msgSend(v10, "identifier"), -[PXContentSyndicationMockSharedAlbumsDataSource identifier](v4, "identifier"));

  [(PXSectionedDataSourceManager *)self setDataSource:v4 changeDetails:v11];
}

- (id)createInitialDataSource
{
  v3 = [(PXContentSyndicationMockSharedAlbumsDataSourceManager *)self photoLibrary];
  v4 = objc_msgSend(v3, "px_virtualCollections");
  v5 = [v4 sharedAlbumsCollectionList];

  v6 = [[PXPhotoKitCollectionsDataSourceManagerConfiguration alloc] initWithCollectionList:v5];
  v7 = [[PXPhotoKitCollectionsDataSourceManager alloc] initWithConfiguration:v6];
  sharedAlbumsDataSourceManager = self->_sharedAlbumsDataSourceManager;
  self->_sharedAlbumsDataSourceManager = &v7->super;
  id v9 = v7;

  [(PXCollectionsDataSourceManager *)self->_sharedAlbumsDataSourceManager registerChangeObserver:self context:PXContentSyndicationMockSharedAlbumsDataSourceManagerContext];
  v10 = [(PXContentSyndicationMockSharedAlbumsDataSourceManager *)self sharedAlbumsDataSourceManager];
  v11 = [v10 dataSource];

  id v12 = [PXContentSyndicationMockSharedAlbumsDataSource alloc];
  v13 = [(PXContentSyndicationMockSharedAlbumsDataSource *)v12 initWithSharedAlbumsDataSource:v11];

  return v13;
}

- (id)createAssetsDataSourceManager
{
  v2 = [(PXContentSyndicationMockSharedAlbumsDataSourceManager *)self photoLibrary];
  v3 = objc_msgSend(v2, "px_virtualCollections");
  v4 = [v3 sharedAlbumsCollectionList];

  v5 = [MEMORY[0x1E4F38EE8] fetchCollectionsInCollectionList:v4 options:0];
  v6 = PXContentSyndicationAssetsDataSourceManagerForAssetCollectionFetchResult(v5);

  return v6;
}

- (id)socialLayerHighlightProvider
{
  highlightProvider = self->_highlightProvider;
  if (!highlightProvider)
  {
    v4 = [[PXContentSyndicationPhotoKitSocialLayerHighlightProvider alloc] initWithHighlightFetchBlock:&__block_literal_global];
    v5 = self->_highlightProvider;
    self->_highlightProvider = (PXContentSyndicationSocialLayerHighlightProvider *)v4;

    highlightProvider = self->_highlightProvider;
  }
  return highlightProvider;
}

uint64_t __85__PXContentSyndicationMockSharedAlbumsDataSourceManager_socialLayerHighlightProvider__block_invoke()
{
  return 0;
}

- (id)imageProvider
{
  imageProvider = self->_imageProvider;
  if (!imageProvider)
  {
    v4 = [(PXContentSyndicationMockSharedAlbumsDataSourceManager *)self photoLibrary];
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
    v4 = [(PXContentSyndicationMockSharedAlbumsDataSourceManager *)self photoLibrary];
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
  v2 = [(PXContentSyndicationMockSharedAlbumsDataSourceManager *)self photoLibrary];
  v3 = _AllPhotosFetchResultForPhotoLibrary(v2, 2);

  return v3;
}

- (PXContentSyndicationMockSharedAlbumsDataSourceManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXContentSyndicationMockSharedAlbumsDataSourceManager;
  v2 = [(PXSectionedDataSourceManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    photoLibrary = v2->_photoLibrary;
    v2->_photoLibrary = (PHPhotoLibrary *)v3;
  }
  return v2;
}

+ (id)createCountsController
{
  v2 = objc_alloc_init(PXContentSyndicationPhotoKitCountsController);
  return v2;
}

@end