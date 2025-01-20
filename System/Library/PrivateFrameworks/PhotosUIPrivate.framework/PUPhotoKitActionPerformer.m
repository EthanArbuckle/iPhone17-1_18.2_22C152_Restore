@interface PUPhotoKitActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4;
- (PXPhotosDataSource)photosDataSource;
- (id)_indexPathsInPhotosDataSource:(id)a3;
- (void)forceIncludeAssetsInDataSource;
- (void)instantlyExcludeAssetsFromDataSource;
- (void)setPhotosDataSource:(id)a3;
- (void)stopExcludingAssetsFromDataSource;
@end

@implementation PUPhotoKitActionPerformer

- (void).cxx_destruct
{
}

- (void)setPhotosDataSource:(id)a3
{
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (id)_indexPathsInPhotosDataSource:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA48];
  v6 = [(PUAssetActionPerformer *)self assets];
  v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

  v8 = [(PUAssetActionPerformer *)self assetsByAssetCollection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__PUPhotoKitActionPerformer__indexPathsInPhotosDataSource___block_invoke;
  v14[3] = &unk_1E5F29868;
  id v15 = v4;
  id v9 = v7;
  id v16 = v9;
  id v10 = v4;
  [v8 enumerateKeysAndObjectsUsingBlock:v14];

  v11 = v16;
  id v12 = v9;

  return v12;
}

void __59__PUPhotoKitActionPerformer__indexPathsInPhotosDataSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(a1 + 32) indexPathForAsset:*(void *)(*((void *)&v12 + 1) + 8 * v10) hintIndexPath:0 hintCollection:v5];
        if (v11) {
          [*(id *)(a1 + 40) addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)forceIncludeAssetsInDataSource
{
  id v4 = [(PUPhotoKitActionPerformer *)self photosDataSource];
  v3 = [(PUPhotoKitActionPerformer *)self _indexPathsInPhotosDataSource:v4];
  [v4 forceIncludeAssetsAtIndexPaths:v3];
}

- (void)stopExcludingAssetsFromDataSource
{
  id v4 = [(PUPhotoKitActionPerformer *)self photosDataSource];
  v3 = [(PUAssetActionPerformer *)self assets];
  [v4 stopExcludingAssets:v3];
}

- (void)instantlyExcludeAssetsFromDataSource
{
  id v4 = [(PUPhotoKitActionPerformer *)self photosDataSource];
  v3 = [(PUPhotoKitActionPerformer *)self _indexPathsInPhotosDataSource:v4];
  [v4 forceExcludeAssetsAtIndexPaths:v3];
}

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return 1;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return 0;
}

@end