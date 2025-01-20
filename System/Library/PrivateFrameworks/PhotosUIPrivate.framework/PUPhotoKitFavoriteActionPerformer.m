@interface PUPhotoKitFavoriteActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
- (BOOL)favorite;
- (void)_logEventForAssets:(id)a3 favorite:(BOOL)a4;
- (void)performBackgroundTask;
- (void)setFavorite:(BOOL)a3;
@end

@implementation PUPhotoKitFavoriteActionPerformer

- (void)setFavorite:(BOOL)a3
{
  self->_favorite = a3;
}

- (BOOL)favorite
{
  return self->_favorite;
}

- (void)_logEventForAssets:(id)a3 favorite:(BOOL)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v5 = (void **)MEMORY[0x1E4F56418];
    if (!a4) {
      v5 = (void **)MEMORY[0x1E4F56420];
    }
    v6 = *v5;
    v7 = (void *)MEMORY[0x1E4F56658];
    uint64_t v8 = *MEMORY[0x1E4F56558];
    v16[0] = a3;
    uint64_t v9 = *MEMORY[0x1E4F56560];
    v15[0] = v8;
    v15[1] = v9;
    id v10 = v6;
    id v11 = a3;
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v16[1] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    [v7 sendEvent:v10 withPayload:v14];
  }
}

- (void)performBackgroundTask
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PUPhotoKitFavoriteActionPerformer *)self favorite];
  if (!v3)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v4 = [(PUAssetActionPerformer *)self assetsByAssetCollection];
    v5 = [v4 allKeys];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v10 assetCollectionType] == 2 && objc_msgSend(v10, "assetCollectionSubtype") == 203)
          {

            [(PUPhotoKitActionPerformer *)self forceIncludeAssetsInDataSource];
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
LABEL_13:
  id v11 = objc_alloc(MEMORY[0x1E4F901D0]);
  v12 = [(PUAssetActionPerformer *)self assets];
  v13 = (void *)[v11 initWithAssets:v12 favorite:v3];

  v14 = [(PUAssetActionPerformer *)self undoManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __58__PUPhotoKitFavoriteActionPerformer_performBackgroundTask__block_invoke;
  v15[3] = &unk_1E5F29930;
  v15[4] = self;
  BOOL v16 = v3;
  [v13 executeWithUndoManager:v14 completionHandler:v15];
}

void __58__PUPhotoKitFavoriteActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v5 assets];
    [v5 _logEventForAssets:v6 favorite:*(unsigned __int8 *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:v7];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return [MEMORY[0x1E4F901D0] canPerformOnAsset:a3 inAssetCollection:a4];
}

@end