@interface PUAssetExplorerReviewScreenAssetsDataSourceManager
- (NSDictionary)_replacementAssetsByUUID;
- (PUAssetExplorerReviewScreenAssetsDataSourceManager)initWithOriginalDataSourceManager:(id)a3;
- (PUAssetsDataSourceManager)_originalDataSourceManager;
- (id)assetsDataSourceManagerInterestingAssetReferences:(id)a3;
- (void)_setOriginalDataSourceManager:(id)a3;
- (void)_setReplacementAssetsByUUID:(id)a3;
- (void)_updateDataSource;
- (void)detachFromOriginalDataSourceManager;
- (void)performChanges:(id)a3;
@end

@implementation PUAssetExplorerReviewScreenAssetsDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__originalDataSourceManager, 0);
  objc_storeStrong((id *)&self->__replacementAssetsByUUID, 0);
}

- (void)_setOriginalDataSourceManager:(id)a3
{
}

- (PUAssetsDataSourceManager)_originalDataSourceManager
{
  return self->__originalDataSourceManager;
}

- (void)_setReplacementAssetsByUUID:(id)a3
{
}

- (NSDictionary)_replacementAssetsByUUID
{
  return self->__replacementAssetsByUUID;
}

- (id)assetsDataSourceManagerInterestingAssetReferences:(id)a3
{
  v4 = [(PUAssetsDataSourceManager *)self delegate];
  v5 = [v4 assetsDataSourceManagerInterestingAssetReferences:self];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __104__PUAssetExplorerReviewScreenAssetsDataSourceManager_assetsDataSourceManagerInterestingAssetReferences___block_invoke;
  v10[3] = &unk_1E5F23888;
  id v11 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:v10];
  v8 = (void *)[v7 copy];

  return v8;
}

void __104__PUAssetExplorerReviewScreenAssetsDataSourceManager_assetsDataSourceManagerInterestingAssetReferences___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v4 originalAssetReference];
    if (v3) {
      [*(id *)(a1 + 32) addObject:v3];
    }
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (void)_updateDataSource
{
  id v9 = [(PUAssetExplorerReviewScreenAssetsDataSourceManager *)self _originalDataSourceManager];
  v3 = [v9 assetsDataSource];
  id v4 = [(PUAssetExplorerReviewScreenAssetsDataSourceManager *)self _replacementAssetsByUUID];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [v4 allValues];
  id v7 = [v5 setWithArray:v6];

  v8 = [[PUAssetExplorerReviewScreenAssetsDataSource alloc] initWithDataSource:v3 substitutedAssets:v7];
  [(PUAssetsDataSourceManager *)self setAssetsDataSource:v8];
}

- (void)performChanges:(id)a3
{
  id v4 = (void (**)(id, PUMutableAssetExplorerReviewScreenAssetsDataSourceManagerImplementation *))a3;
  id v7 = [(PUAssetExplorerReviewScreenAssetsDataSourceManager *)self _replacementAssetsByUUID];
  v5 = [[PUMutableAssetExplorerReviewScreenAssetsDataSourceManagerImplementation alloc] initWithReplacementAssetsByUUID:v7];
  v4[2](v4, v5);

  id v6 = [(PUMutableAssetExplorerReviewScreenAssetsDataSourceManagerImplementation *)v5 replacementAssetsByUUID];
  [(PUAssetExplorerReviewScreenAssetsDataSourceManager *)self _setReplacementAssetsByUUID:v6];
  [(PUAssetExplorerReviewScreenAssetsDataSourceManager *)self _updateDataSource];
}

- (void)detachFromOriginalDataSourceManager
{
  v3 = [(PUAssetExplorerReviewScreenAssetsDataSourceManager *)self _originalDataSourceManager];
  [v3 setDelegate:0];

  [(PUAssetExplorerReviewScreenAssetsDataSourceManager *)self _setOriginalDataSourceManager:0];
}

- (PUAssetExplorerReviewScreenAssetsDataSourceManager)initWithOriginalDataSourceManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUAssetExplorerReviewScreenAssetsDataSourceManager;
  id v6 = [(PUAssetExplorerReviewScreenAssetsDataSourceManager *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__originalDataSourceManager, a3);
    [(PUAssetsDataSourceManager *)v7->__originalDataSourceManager setDelegate:v7];
    v8 = [v5 assetsDataSource];
    [(PUAssetsDataSourceManager *)v7 setAssetsDataSource:v8];
    id v9 = v7;
  }
  return v7;
}

@end