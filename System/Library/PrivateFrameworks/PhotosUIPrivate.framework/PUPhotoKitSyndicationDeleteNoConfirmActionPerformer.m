@interface PUPhotoKitSyndicationDeleteNoConfirmActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4;
- (BOOL)shouldConfirmDestructiveAction;
- (int64_t)destructivePhotosAction;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
@end

@implementation PUPhotoKitSyndicationDeleteNoConfirmActionPerformer

- (int64_t)destructivePhotosAction
{
  return 1;
}

- (BOOL)shouldConfirmDestructiveAction
{
  return 0;
}

- (void)performBackgroundTask
{
  v4 = [(PUAssetActionPerformer *)self assets];
  id v5 = objc_alloc(MEMORY[0x1E4F8FF38]);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = objc_msgSend(v5, "initWithSourceIdentifier:assetCount:userConfirmation:", v7, objc_msgSend(v4, "count"), 3);

  v9 = [MEMORY[0x1E4F900C0] actionWithAssets:v4 record:v8];
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PUPhotoKitAssetActionManager.m", 2224, @"Invalid parameter not satisfying: %@", @"deleteAssetsAction != nil" object file lineNumber description];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__PUPhotoKitSyndicationDeleteNoConfirmActionPerformer_performBackgroundTask__block_invoke;
  v11[3] = &unk_1E5F2E3B8;
  v11[4] = self;
  [v9 executeWithUndoManager:0 completionHandler:v11];
}

void __76__PUPhotoKitSyndicationDeleteNoConfirmActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PUPhotoKitSyndicationDeleteNoConfirmActionPerformer_performBackgroundTask__block_invoke_2;
  block[3] = &unk_1E5F2DCD0;
  uint64_t v6 = *(void *)(a1 + 32);
  char v10 = a2;
  block[4] = v6;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __76__PUPhotoKitSyndicationDeleteNoConfirmActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
}

- (void)performUserInteractionTask
{
}

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(a3, "px_isSyndicatedAsset");
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(a3, "px_isSyndicatedAsset");
}

@end