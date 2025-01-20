@interface PUPhotoKitDuplicateActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)newStillImageTime;
- (PXPhotoKitDuplicateActionController)duplicateActionController;
- (int64_t)action;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
- (void)setAction:(int64_t)a3;
- (void)setDuplicateActionController:(id)a3;
- (void)setNewStillImageTime:(id *)a3;
@end

@implementation PUPhotoKitDuplicateActionPerformer

- (void).cxx_destruct
{
}

- (void)setNewStillImageTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_newStillImageTime.value = *(_OWORD *)&a3->var0;
  self->_newStillImageTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)newStillImageTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (int64_t)action
{
  return self->_action;
}

- (void)setDuplicateActionController:(id)a3
{
}

- (PXPhotoKitDuplicateActionController)duplicateActionController
{
  return self->_duplicateActionController;
}

- (void)performBackgroundTask
{
  objc_initWeak(&location, self);
  v3 = [(PUPhotoKitDuplicateActionPerformer *)self duplicateActionController];
  int64_t v4 = [(PUPhotoKitDuplicateActionPerformer *)self action];
  [(PUPhotoKitDuplicateActionPerformer *)self newStillImageTime];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__PUPhotoKitDuplicateActionPerformer_performBackgroundTask__block_invoke;
  v5[3] = &unk_1E5F2D898;
  objc_copyWeak(&v6, &location);
  [v3 performDuplicateAction:v4 newStillImageTime:v7 completionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __59__PUPhotoKitDuplicateActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained completeBackgroundTaskWithSuccess:a2 error:0];
}

- (void)performUserInteractionTask
{
  v3 = [(PUAssetActionPerformer *)self assetsByAssetCollection];
  int64_t v4 = (void *)MEMORY[0x1E4F90460];
  v5 = [v3 allKeys];
  id v6 = [v4 dataSourceWithAssetCollections:v5];

  v7 = [v6 selectionSnapshotForAssetsByAssetCollection:v3];
  id v8 = objc_alloc(MEMORY[0x1E4F90498]);
  v9 = [(PUAssetActionPerformer *)self undoManager];
  v10 = (void *)[v8 initWithSelectionSnapshot:v7 undoManager:v9];

  [(PUPhotoKitDuplicateActionPerformer *)self setDuplicateActionController:v10];
  if ([v10 shouldUseAlertController])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__PUPhotoKitDuplicateActionPerformer_performUserInteractionTask__block_invoke;
    v15[3] = &unk_1E5F299F8;
    v15[4] = self;
    v11 = [v10 alertConfigurationForDuplicateActionWithUserConfirmationHandler:v15];
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F8FF78]) initWithConfiguration:v11];
    v13 = [v12 alertController];
    BOOL v14 = [(PUAssetActionPerformer *)self presentViewController:v13];

    if (!v14) {
      [(PUAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
    }
  }
  else
  {
    [(PUPhotoKitDuplicateActionPerformer *)self setAction:1];
    [(PUAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
}

uint64_t __64__PUPhotoKitDuplicateActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setAction:");
  int64_t v4 = *(void **)(a1 + 32);
  return [v4 completeUserInteractionTaskWithSuccess:a2 error:0];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return [MEMORY[0x1E4F90128] canPerformOnAsset:a3 inAssetCollection:a4];
}

@end