@interface PXPhotoKitAlbumMakeKeyPhotoActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
- (void)performBackgroundTask;
@end

@implementation PXPhotoKitAlbumMakeKeyPhotoActionPerformer

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PXLocalizedStringFromTable(@"PXPhotoKitAssetActionManagerActionTitle_AlbumMakeKeyPhoto", @"PhotosUICore");
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v7 = a5;
  v8 = (void *)MEMORY[0x1E4FB13F0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __89__PXPhotoKitAlbumMakeKeyPhotoActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke;
  v12[3] = &unk_1E5DC8470;
  id v13 = v7;
  id v9 = v7;
  v10 = [v8 actionWithTitle:a3 image:a4 identifier:0 handler:v12];

  return v10;
}

uint64_t __89__PXPhotoKitAlbumMakeKeyPhotoActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  if (!a3) {
    return 0;
  }
  v8 = objc_msgSend(a4, "px_fetchAncestorThatSupportsCustomKeyAssets");
  if (a5) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v8 == 0;
  }
  BOOL v11 = !v9 && a6 == 0;

  return v11;
}

- (void)performBackgroundTask
{
  v4 = [(PXPhotoKitAssetActionPerformer *)self assetsByAssetCollection];
  v5 = [v4 allKeys];
  v6 = [v5 firstObject];

  id v7 = objc_msgSend(v6, "px_fetchAncestorThatSupportsCustomKeyAssets");
  v8 = [(PXPhotoKitAssetActionPerformer *)self assetsByAssetCollection];
  BOOL v9 = [v8 objectForKeyedSubscript:v6];
  v10 = [v9 firstObject];

  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_6:
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXPhotoKitAlbumMakeKeyPhotoActionPerformer.m", 52, @"Invalid parameter not satisfying: %@", @"editableAssetCollection" object file lineNumber description];

    if (v10) {
      goto LABEL_4;
    }
LABEL_7:
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXPhotoKitAlbumMakeKeyPhotoActionPerformer.m", 53, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    goto LABEL_4;
  }
  id v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"PXPhotoKitAlbumMakeKeyPhotoActionPerformer.m", 51, @"Invalid parameter not satisfying: %@", @"assetCollection" object file lineNumber description];

  if (!v7) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v10) {
    goto LABEL_7;
  }
LABEL_4:
  BOOL v11 = [[PXMakeKeyAssetAction alloc] initWithAssetCollection:v7 keyAsset:v10];
  v12 = [(PXActionPerformer *)self undoManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__PXPhotoKitAlbumMakeKeyPhotoActionPerformer_performBackgroundTask__block_invoke;
  v16[3] = &unk_1E5DD3158;
  v16[4] = self;
  [(PXAction *)v11 executeWithUndoManager:v12 completionHandler:v16];
}

uint64_t __67__PXPhotoKitAlbumMakeKeyPhotoActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:a3];
}

@end