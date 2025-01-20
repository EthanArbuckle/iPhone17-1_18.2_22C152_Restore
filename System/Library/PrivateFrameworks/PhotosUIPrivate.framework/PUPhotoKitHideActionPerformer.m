@interface PUPhotoKitHideActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
- (BOOL)isHiding;
- (PUHidePhotosActionController)hideActionController;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
- (void)setHideActionController:(id)a3;
- (void)setIsHiding:(BOOL)a3;
@end

@implementation PUPhotoKitHideActionPerformer

- (void).cxx_destruct
{
}

- (void)setIsHiding:(BOOL)a3
{
  self->_isHiding = a3;
}

- (BOOL)isHiding
{
  return self->_isHiding;
}

- (void)setHideActionController:(id)a3
{
}

- (PUHidePhotosActionController)hideActionController
{
  return self->_hideActionController;
}

- (void)performBackgroundTask
{
  [(PUPhotoKitActionPerformer *)self instantlyExcludeAssetsFromDataSource];
  [(PUAssetActionPerformer *)self completeBackgroundTaskWithSuccess:1 error:0];
  v3 = [(PUPhotoKitHideActionPerformer *)self hideActionController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__PUPhotoKitHideActionPerformer_performBackgroundTask__block_invoke;
  v4[3] = &unk_1E5F2E3B8;
  v4[4] = self;
  [v3 performActionWithCompletionHandler:v4];
}

uint64_t __54__PUPhotoKitHideActionPerformer_performBackgroundTask__block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) stopExcludingAssetsFromDataSource];
  }
  return result;
}

- (void)performUserInteractionTask
{
  v3 = [PUHidePhotosActionController alloc];
  v4 = [(PUAssetActionPerformer *)self assets];
  v5 = [(PUAssetActionPerformer *)self undoManager];
  v6 = [(PUHidePhotosActionController *)v3 initWithAssets:v4 undoManager:v5];

  [(PUPhotoKitHideActionPerformer *)self setHideActionController:v6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__PUPhotoKitHideActionPerformer_performUserInteractionTask__block_invoke;
  v8[3] = &unk_1E5F2CEE8;
  v8[4] = self;
  v7 = [(PUHidePhotosActionController *)v6 alertControllerForTogglingAssetsVisibilityWithCompletionHandler:v8];
  if (v7)
  {
    if ([(PUAssetActionPerformer *)self presentViewController:v7]) {
      goto LABEL_6;
    }
  }
  else
  {
    [(PUPhotoKitHideActionPerformer *)self setIsHiding:0];
  }
  [(PUAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:v7 == 0 error:0];
LABEL_6:
}

uint64_t __59__PUPhotoKitHideActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setIsHiding:1];
  v4 = *(void **)(a1 + 32);
  return [v4 completeUserInteractionTaskWithSuccess:a2 error:0];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return [MEMORY[0x1E4F90290] canPerformOnAsset:a3 inAssetCollection:a4];
}

@end