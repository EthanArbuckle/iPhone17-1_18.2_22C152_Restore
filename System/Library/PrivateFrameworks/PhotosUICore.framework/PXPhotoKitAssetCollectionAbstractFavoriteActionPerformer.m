@interface PXPhotoKitAssetCollectionAbstractFavoriteActionPerformer
@end

@implementation PXPhotoKitAssetCollectionAbstractFavoriteActionPerformer

void __82___PXPhotoKitAssetCollectionAbstractFavoriteActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = PLMemoriesGetLog();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *(unsigned __int8 *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 32);
      int v18 = 67109378;
      int v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Did favorite: %d, memory: %@", (uint8_t *)&v18, 0x12u);
    }

    v10 = (void *)MEMORY[0x1E4F56658];
    if (*(unsigned char *)(a1 + 48)) {
      v11 = @"com.apple.photos.CPAnalytics.assetCollectionFavorited";
    }
    else {
      v11 = @"com.apple.photos.CPAnalytics.assetCollectionUnfavorited";
    }
    uint64_t v12 = *MEMORY[0x1E4F56548];
    v25[0] = *(void *)(a1 + 32);
    uint64_t v13 = *MEMORY[0x1E4F56560];
    v24[0] = v12;
    v24[1] = v13;
    v14 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v14);
    v25[1] = v7;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    [v10 sendEvent:v11 withPayload:v15];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v16 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 32);
    int v18 = 67109634;
    int v19 = v16;
    __int16 v20 = 2112;
    uint64_t v21 = v17;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Failed to favorite: %d, memory: %@, error: %@", (uint8_t *)&v18, 0x1Cu);
  }

  [*(id *)(a1 + 40) completeBackgroundTaskWithSuccess:a2 error:v5];
}

void __87___PXPhotoKitAssetCollectionAbstractFavoriteActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = PLSyndicationUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [v8 localizedDescription];
      int v15 = 138412290;
      int v16 = v10;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "Abstract Favorite: Error processing unsaved syndicated assets: %@", (uint8_t *)&v15, 0xCu);
    }
    v11 = *(void **)(a1 + 32);
    uint64_t v12 = 0;
    id v13 = v8;
    goto LABEL_12;
  }
  if (a2 < 3)
  {
    v11 = *(void **)(a1 + 32);
    uint64_t v12 = 1;
LABEL_11:
    id v13 = 0;
LABEL_12:
    [v11 completeUserInteractionTaskWithSuccess:v12 error:v13];
    goto LABEL_13;
  }
  if (a2 == 4)
  {
    v11 = *(void **)(a1 + 32);
    uint64_t v12 = 0;
    goto LABEL_11;
  }
  if (a2 == 3)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"PXPhotoKitAssetCollectionActionManager.m" lineNumber:872 description:@"Code which should be unreachable has been reached"];

    abort();
  }
LABEL_13:
}

@end