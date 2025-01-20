@interface PXContentSyndicationPhotoKitCountsController
- (void)_updateDetailedCounts;
- (void)_updateSavedCount;
- (void)didSetAssetCollection:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
@end

@implementation PXContentSyndicationPhotoKitCountsController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResultCountObserver, 0);
  objc_storeStrong((id *)&self->_assetsCountsController, 0);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXAssetsDataSourceCountsControllerObserverContext_22838 != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXContentSyndicationPhotoKitCountsController.m" lineNumber:98 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v11 = v9;
    [(PXContentSyndicationPhotoKitCountsController *)self _updateDetailedCounts];
    [(PXContentSyndicationPhotoKitCountsController *)self _updateSavedCount];
    id v9 = v11;
  }
}

- (void)_updateSavedCount
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  fetchResultCountObserver = self->_fetchResultCountObserver;
  if (fetchResultCountObserver) {
    unint64_t v4 = [(PXFetchResultCountObserver *)fetchResultCountObserver fetchResultCount];
  }
  else {
    unint64_t v4 = -1;
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  [(PXContentSyndicationCountsController *)self actualDetailedCounts];
  uint64_t v5 = -1;
  if (v4 != -1)
  {
    if (v10 + v9 + v11 && v10 + v9 + v11 >= v4)
    {
      uint64_t v5 = v4;
    }
    else
    {
      char v6 = PLUIGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = objc_opt_class();
        *(_DWORD *)buf = 138412802;
        uint64_t v13 = v7;
        __int16 v14 = 2048;
        uint64_t v15 = v10 + v9 + v11;
        __int16 v16 = 2048;
        unint64_t v17 = v4;
        _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "<%@: _updateSavedCount failed to update with totalCount:%lu, unsavedFetchResultCount:%li>", buf, 0x20u);
      }

      uint64_t v5 = -1;
    }
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__PXContentSyndicationPhotoKitCountsController__updateSavedCount__block_invoke;
  v8[3] = &__block_descriptor_40_e55_v16__0___PXContentSyndicationMutableCountsController__8l;
  v8[4] = v5;
  [(PXContentSyndicationCountsController *)self performChanges:v8];
}

uint64_t __65__PXContentSyndicationPhotoKitCountsController__updateSavedCount__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSavedCount:*(void *)(a1 + 32)];
}

- (void)_updateDetailedCounts
{
  long long v7 = 0uLL;
  uint64_t v8 = 0;
  assetsCountsController = self->_assetsCountsController;
  if (assetsCountsController) {
    [(PXAssetsDataSourceCountsController *)assetsCountsController counts];
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__PXContentSyndicationPhotoKitCountsController__updateDetailedCounts__block_invoke;
  v4[3] = &__block_descriptor_56_e55_v16__0___PXContentSyndicationMutableCountsController__8l;
  long long v5 = v7;
  uint64_t v6 = v8;
  [(PXContentSyndicationCountsController *)self performChanges:v4];
}

uint64_t __69__PXContentSyndicationPhotoKitCountsController__updateDetailedCounts__block_invoke(uint64_t a1, void *a2)
{
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  return [a2 setDetailedCounts:&v3];
}

- (void)didSetAssetCollection:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXContentSyndicationPhotoKitCountsController.m", 34, @"Invalid parameter not satisfying: %@", @"assetCollection" object file lineNumber description];
  }
  id v6 = objc_alloc(MEMORY[0x1E4F39150]);
  v25[0] = v5;
  long long v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  uint64_t v8 = [v5 photoLibrary];
  uint64_t v9 = (void *)[v6 initWithObjects:v7 photoLibrary:v8 fetchType:*MEMORY[0x1E4F39650] fetchPropertySets:0 identifier:0 registerIfNeeded:1];

  uint64_t v10 = PXContentSyndicationAssetsDataSourceManagerForAssetCollectionFetchResult(v9);
  uint64_t v11 = (PXAssetsDataSourceCountsController *)[objc_alloc((Class)off_1E5DA5640) initWithAssetsDataSourceManager:v10];
  assetsCountsController = self->_assetsCountsController;
  self->_assetsCountsController = v11;

  [(PXAssetsDataSourceCountsController *)self->_assetsCountsController registerChangeObserver:self context:PXAssetsDataSourceCountsControllerObserverContext_22838];
  [(PXAssetsDataSourceCountsController *)self->_assetsCountsController prepareCountsIfNeeded];
  [(PXContentSyndicationPhotoKitCountsController *)self _updateDetailedCounts];
  uint64_t v13 = [v5 photoLibrary];
  __int16 v14 = [v13 librarySpecificFetchOptions];
  [v14 setIncludeGuestAssets:1];
  uint64_t v15 = [MEMORY[0x1E4F38EB8] filterPredicateForSavedSyndicationAssetsOnly];
  [v14 setInternalPredicate:v15];

  __int16 v16 = [PXFetchResultCountObserver alloc];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __70__PXContentSyndicationPhotoKitCountsController_didSetAssetCollection___block_invoke;
  v22[3] = &unk_1E5DC2968;
  id v23 = v5;
  id v24 = v14;
  id v17 = v14;
  id v18 = v5;
  v19 = [(PXFetchResultCountObserver *)v16 initWithQOSClass:17 photoLibrary:v13 fetchResultBlock:v22];
  fetchResultCountObserver = self->_fetchResultCountObserver;
  self->_fetchResultCountObserver = v19;

  [(PXFetchResultCountObserver *)self->_fetchResultCountObserver setDelegate:self];
  [(PXContentSyndicationPhotoKitCountsController *)self _updateSavedCount];
}

uint64_t __70__PXContentSyndicationPhotoKitCountsController_didSetAssetCollection___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];
}

@end