@interface PUBrowsingSession
+ (id)importBrowsingSessionWithDeviceUUID:(id)a3;
- (NSString)emptyPlaceholderSubtitle;
- (NSString)emptyPlaceholderTitle;
- (PUAssetActionManager)actionManager;
- (PUAssetsDataSourceManager)dataSourceManager;
- (PUBrowsingSession)init;
- (PUBrowsingSession)initWithDataSourceManager:(id)a3 actionManager:(id)a4 mediaProvider:(id)a5;
- (PUBrowsingSession)initWithDataSourceManager:(id)a3 actionManager:(id)a4 mediaProvider:(id)a5 photosDetailsContext:(id)a6 lowMemoryMode:(BOOL)a7;
- (PUBrowsingSession)initWithDataSourceManager:(id)a3 actionManager:(id)a4 mediaProvider:(id)a5 photosDetailsContext:(id)a6 lowMemoryMode:(BOOL)a7 importStatusManager:(id)a8;
- (PUBrowsingSession)initWithDataSourceManager:(id)a3 actionManager:(id)a4 mediaProvider:(id)a5 photosDetailsContext:(id)a6 lowMemoryMode:(BOOL)a7 importStatusManager:(id)a8 privacyController:(id)a9;
- (PUBrowsingViewModel)viewModel;
- (PUMediaProvider)mediaProvider;
- (PUOneUpContentTileProvider)contentTileProvider;
- (PUOneUpMergedVideoProvider)mergedVideoProvider;
- (PUTileAnimator)tileAnimator;
- (PXAssetEditOperationManager)editOperationManager;
- (PXAssetImportStatusManager)importStatusManager;
- (PXContentPrivacyController)privacyController;
- (PXLoadingStatusManager)loadingStatusManager;
- (PXPhotosDetailsContext)photosDetailsContext;
- (id)assetActionManagerCurrentAssetsDataSource:(id)a3;
- (id)assetsDataSourceManagerInterestingAssetReferences:(id)a3;
- (id)imageWellThumbnailProvider;
- (void)assetEditOperationManager:(id)a3 didChangeEditOperationStatusForAsset:(id)a4 context:(void *)a5;
- (void)assetEditOperationManager:(id)a3 didChangeEditOperationsPerformedOnAsset:(id)a4 context:(void *)a5;
- (void)assetsDataSourceManager:(id)a3 didChangeAssetsDataSource:(id)a4;
- (void)configureTilingView:(id)a3;
- (void)loadingStatusManager:(id)a3 didUpdateLoadingStatus:(id)a4 forItemIdentifier:(id)a5;
- (void)setContentTileProvider:(id)a3;
- (void)setMediaProvider:(id)a3;
- (void)setTileAnimator:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation PUBrowsingSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editOperationManager, 0);
  objc_storeStrong((id *)&self->_emptyPlaceholderSubtitle, 0);
  objc_storeStrong((id *)&self->_emptyPlaceholderTitle, 0);
  objc_storeStrong((id *)&self->_mergedVideoProvider, 0);
  objc_storeStrong((id *)&self->_photosDetailsContext, 0);
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_importStatusManager, 0);
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_storeStrong((id *)&self->_tileAnimator, 0);
  objc_storeStrong((id *)&self->_contentTileProvider, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

- (PXAssetEditOperationManager)editOperationManager
{
  return self->_editOperationManager;
}

- (NSString)emptyPlaceholderSubtitle
{
  return self->_emptyPlaceholderSubtitle;
}

- (NSString)emptyPlaceholderTitle
{
  return self->_emptyPlaceholderTitle;
}

- (PUOneUpMergedVideoProvider)mergedVideoProvider
{
  return self->_mergedVideoProvider;
}

- (PXPhotosDetailsContext)photosDetailsContext
{
  return self->_photosDetailsContext;
}

- (PXContentPrivacyController)privacyController
{
  return self->_privacyController;
}

- (PXAssetImportStatusManager)importStatusManager
{
  return self->_importStatusManager;
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (void)setTileAnimator:(id)a3
{
}

- (void)setContentTileProvider:(id)a3
{
}

- (PUOneUpContentTileProvider)contentTileProvider
{
  return self->_contentTileProvider;
}

- (void)setViewModel:(id)a3
{
}

- (PUBrowsingViewModel)viewModel
{
  return self->_viewModel;
}

- (PUAssetActionManager)actionManager
{
  return self->_actionManager;
}

- (void)setMediaProvider:(id)a3
{
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PUAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (id)imageWellThumbnailProvider
{
  return 0;
}

- (void)configureTilingView:(id)a3
{
  id v4 = a3;
  v5 = [(PUBrowsingSession *)self tileAnimator];
  [v4 setTileAnimator:v5];

  v6 = [(PUBrowsingSession *)self contentTileProvider];
  [v6 registerTileControllerClassesWithTilingView:v4];

  id v7 = [(PUBrowsingSession *)self description];
  [v4 registerPostLayoutBlock:&__block_literal_global_16078 forIdentifier:v7];
}

uint64_t __41__PUBrowsingSession_configureTilingView___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "is_didLayoutPlayerViews");
}

- (void)assetEditOperationManager:(id)a3 didChangeEditOperationStatusForAsset:(id)a4 context:(void *)a5
{
  id v9 = a3;
  id v10 = a4;
  if ((void *)PUEditOperationManagerObservationContext != a5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PUBrowsingSession.m" lineNumber:224 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v11 = v10;
  if ([v10 conformsToProtocol:&unk_1F07DC470])
  {
    uint64_t v12 = [v9 editOperationStatusForAsset:v11];
    v13 = [(PUBrowsingSession *)self viewModel];
    v14 = [v13 assetSharedViewModelForAsset:v11];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __92__PUBrowsingSession_assetEditOperationManager_didChangeEditOperationStatusForAsset_context___block_invoke;
    v17[3] = &unk_1E5F2E0A8;
    id v18 = v14;
    uint64_t v19 = v12;
    id v15 = v14;
    [v15 performChanges:v17];
  }
}

uint64_t __92__PUBrowsingSession_assetEditOperationManager_didChangeEditOperationStatusForAsset_context___block_invoke(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 40) - 1;
  if (v1 > 2) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = qword_1AEFF8300[v1];
  }
  return [*(id *)(a1 + 32) setSaveState:v2];
}

- (void)assetEditOperationManager:(id)a3 didChangeEditOperationsPerformedOnAsset:(id)a4 context:(void *)a5
{
  id v9 = a3;
  id v10 = a4;
  if ((void *)PUEditOperationManagerObservationContext != a5)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PUBrowsingSession.m" lineNumber:193 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v11 = v10;
  if ([v10 conformsToProtocol:&unk_1F07DC470])
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = __Block_byref_object_copy__16088;
    v20[4] = __Block_byref_object_dispose__16089;
    id v21 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __95__PUBrowsingSession_assetEditOperationManager_didChangeEditOperationsPerformedOnAsset_context___block_invoke;
    v19[3] = &unk_1E5F23FA0;
    v19[4] = v20;
    [v9 enumerateEditOperationsPerformedOnAsset:v11 usingBlock:v19];
    uint64_t v12 = [(PUBrowsingSession *)self viewModel];
    v13 = [v12 assetSharedViewModelForAsset:v11];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __95__PUBrowsingSession_assetEditOperationManager_didChangeEditOperationsPerformedOnAsset_context___block_invoke_2;
    v16[3] = &unk_1E5F2E200;
    id v14 = v13;
    id v17 = v14;
    id v18 = v20;
    [v14 performChanges:v16];

    _Block_object_dispose(v20, 8);
  }
}

void __95__PUBrowsingSession_assetEditOperationManager_didChangeEditOperationsPerformedOnAsset_context___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if (([v7 isCancelled] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }
}

uint64_t __95__PUBrowsingSession_assetEditOperationManager_didChangeEditOperationsPerformedOnAsset_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSaveProgress:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)loadingStatusManager:(id)a3 didUpdateLoadingStatus:(id)a4 forItemIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(PUBrowsingSession *)self viewModel];
  id v10 = [v9 assetSharedViewModelForAssetUUID:v8];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__PUBrowsingSession_loadingStatusManager_didUpdateLoadingStatus_forItemIdentifier___block_invoke;
  v13[3] = &unk_1E5F2ECC8;
  id v14 = v10;
  id v15 = v7;
  id v11 = v7;
  id v12 = v10;
  [v12 performChanges:v13];
}

uint64_t __83__PUBrowsingSession_loadingStatusManager_didUpdateLoadingStatus_forItemIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLoadingStatus:*(void *)(a1 + 40)];
}

- (id)assetActionManagerCurrentAssetsDataSource:(id)a3
{
  v3 = [(PUBrowsingSession *)self viewModel];
  id v4 = [v3 assetsDataSource];

  return v4;
}

- (id)assetsDataSourceManagerInterestingAssetReferences:(id)a3
{
  v3 = [(PUBrowsingSession *)self viewModel];
  id v4 = [v3 activeAssetReferences];

  return v4;
}

- (void)assetsDataSourceManager:(id)a3 didChangeAssetsDataSource:(id)a4
{
  v6 = [a3 assetsDataSource];
  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PUBrowsingSession.m" lineNumber:142 description:@"Data source must never be nil"];
  }
  id v7 = [(PUBrowsingSession *)self viewModel];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__PUBrowsingSession_assetsDataSourceManager_didChangeAssetsDataSource___block_invoke;
  v11[3] = &unk_1E5F2ECC8;
  id v12 = v7;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  [v9 performChanges:v11];
}

uint64_t __71__PUBrowsingSession_assetsDataSourceManager_didChangeAssetsDataSource___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAssetsDataSource:*(void *)(a1 + 40)];
}

- (PUTileAnimator)tileAnimator
{
  tileAnimator = self->_tileAnimator;
  if (!tileAnimator)
  {
    id v4 = objc_alloc_init(PUBrowsingTileViewAnimator);
    v5 = self->_tileAnimator;
    self->_tileAnimator = &v4->super.super;

    tileAnimator = self->_tileAnimator;
  }
  return tileAnimator;
}

- (PUBrowsingSession)initWithDataSourceManager:(id)a3 actionManager:(id)a4 mediaProvider:(id)a5 photosDetailsContext:(id)a6 lowMemoryMode:(BOOL)a7 importStatusManager:(id)a8 privacyController:(id)a9
{
  BOOL v10 = a7;
  id v16 = a3;
  id v17 = (PUPhotoKitAssetActionManager *)a4;
  id v18 = a5;
  id v43 = a6;
  id v45 = a6;
  id v41 = a8;
  id v19 = a8;
  id v20 = a9;
  v52.receiver = self;
  v52.super_class = (Class)PUBrowsingSession;
  id v21 = [(PUBrowsingSession *)&v52 init];
  if (v21)
  {
    v44 = v18;
    v22 = [v16 assetsDataSource];

    if (!v22)
    {
      v39 = [MEMORY[0x1E4F28B00] currentHandler];
      [v39 handleFailureInMethod:a2, v21, @"PUBrowsingSession.m", 66, @"Invalid parameter not satisfying: %@", @"[dataSourceManager assetsDataSource] != nil" object file lineNumber description];
    }
    if (!v44)
    {
      v40 = [MEMORY[0x1E4F28B00] currentHandler];
      [v40 handleFailureInMethod:a2, v21, @"PUBrowsingSession.m", 67, @"Invalid parameter not satisfying: %@", @"mediaProvider != nil" object file lineNumber description];
    }
    v23 = [[PUBrowsingViewModel alloc] initWithLowMemoryMode:v10];
    objc_storeStrong((id *)&v21->_viewModel, v23);
    objc_storeStrong((id *)&v21->_mediaProvider, a5);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v16;
      v25 = [v24 underlyingDataSourceManager];
      objc_opt_class();

      LOBYTE(v24) = objc_opt_isKindOfClass();
      if (v24)
      {
LABEL_9:
        if (v17)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v26 = objc_alloc_init(PUPhotoKitAssetActionManager);
            [(PUPhotoKitAssetActionManager *)v26 setDataSourceManager:v16];
            [(PUPhotoKitAssetActionManager *)v17 setFallbackActionManager:v26];
          }
        }
        else
        {
          id v17 = objc_alloc_init(PUPhotoKitAssetActionManager);
          [(PUPhotoKitAssetActionManager *)v17 setDataSourceManager:v16];
        }
      }
    }
    [(PUBrowsingViewModel *)v23 setActionManager:v17];
    uint64_t v27 = [MEMORY[0x1E4F8FFD0] sharedManager];
    editOperationManager = v21->_editOperationManager;
    v21->_editOperationManager = (PXAssetEditOperationManager *)v27;

    [(PXAssetEditOperationManager *)v21->_editOperationManager registerObserver:v21 context:PUEditOperationManagerObservationContext];
    objc_storeStrong((id *)&v21->_actionManager, v17);
    [(PUAssetActionManager *)v21->_actionManager setDelegate:v21];
    v29 = [[PUOneUpContentTileProvider alloc] initWithMediaProvider:v21->_mediaProvider];
    contentTileProvider = v21->_contentTileProvider;
    v21->_contentTileProvider = v29;

    objc_storeStrong((id *)&v21->_dataSourceManager, a3);
    [(PUAssetsDataSourceManager *)v21->_dataSourceManager setDelegate:v21];
    objc_storeStrong((id *)&v21->_importStatusManager, v41);
    objc_storeStrong((id *)&v21->_privacyController, a9);
    v31 = +[PUOneUpSettings sharedInstance];
    int v32 = [v31 shouldMergeOverlappingLivePhotos];

    if (v32)
    {
      v33 = [[PUOneUpMergedVideoProvider alloc] initWithBrowsingViewModel:v23];
      mergedVideoProvider = v21->_mergedVideoProvider;
      v21->_mergedVideoProvider = v33;
    }
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __148__PUBrowsingSession_initWithDataSourceManager_actionManager_mediaProvider_photosDetailsContext_lowMemoryMode_importStatusManager_privacyController___block_invoke;
    v46[3] = &unk_1E5F2C960;
    v47 = v23;
    id v18 = v44;
    id v48 = v44;
    id v49 = v16;
    id v50 = v19;
    id v51 = v20;
    v35 = v23;
    [(PUViewModel *)v35 performChanges:v46];
    v36 = (PXLoadingStatusManager *)objc_alloc_init(MEMORY[0x1E4F91280]);
    loadingStatusManager = v21->_loadingStatusManager;
    v21->_loadingStatusManager = v36;

    [(PXLoadingStatusManager *)v21->_loadingStatusManager registerObserver:v21];
    [(PUMediaProvider *)v21->_mediaProvider setLoadingStatusManager:v21->_loadingStatusManager];
    objc_storeStrong((id *)&v21->_photosDetailsContext, v43);
  }
  return v21;
}

uint64_t __148__PUBrowsingSession_initWithDataSourceManager_actionManager_mediaProvider_photosDetailsContext_lowMemoryMode_importStatusManager_privacyController___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setMediaProvider:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 48) assetsDataSource];
  [v2 setAssetsDataSource:v3];

  [*(id *)(a1 + 32) setImportStatusManager:*(void *)(a1 + 56)];
  uint64_t v4 = *(void *)(a1 + 64);
  v5 = *(void **)(a1 + 32);
  return [v5 setPrivacyController:v4];
}

- (PUBrowsingSession)initWithDataSourceManager:(id)a3 actionManager:(id)a4 mediaProvider:(id)a5 photosDetailsContext:(id)a6 lowMemoryMode:(BOOL)a7 importStatusManager:(id)a8
{
  return [(PUBrowsingSession *)self initWithDataSourceManager:a3 actionManager:a4 mediaProvider:a5 photosDetailsContext:a6 lowMemoryMode:a7 importStatusManager:a8 privacyController:0];
}

- (PUBrowsingSession)initWithDataSourceManager:(id)a3 actionManager:(id)a4 mediaProvider:(id)a5 photosDetailsContext:(id)a6 lowMemoryMode:(BOOL)a7
{
  return [(PUBrowsingSession *)self initWithDataSourceManager:a3 actionManager:a4 mediaProvider:a5 photosDetailsContext:a6 lowMemoryMode:a7 importStatusManager:0];
}

- (PUBrowsingSession)initWithDataSourceManager:(id)a3 actionManager:(id)a4 mediaProvider:(id)a5
{
  return [(PUBrowsingSession *)self initWithDataSourceManager:a3 actionManager:a4 mediaProvider:a5 photosDetailsContext:0 lowMemoryMode:0];
}

- (PUBrowsingSession)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUBrowsingSession.m", 49, @"%s is not available as initializer", "-[PUBrowsingSession init]");

  abort();
}

+ (id)importBrowsingSessionWithDeviceUUID:(id)a3
{
  return +[PUImportBrowsingSession withDeviceMedia];
}

@end