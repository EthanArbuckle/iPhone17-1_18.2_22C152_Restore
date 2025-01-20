@interface PXPhotoKitDuplicateAssetActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageTime;
- (PXPhotoKitDuplicateActionController)duplicateActionController;
- (int64_t)action;
- (void)_setupActionControllerWithAssets:(id)a3 updateSelection:(BOOL)a4;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
- (void)setAction:(int64_t)a3;
- (void)setDuplicateActionController:(id)a3;
- (void)setStillImageTime:(id *)a3;
@end

@implementation PXPhotoKitDuplicateAssetActionPerformer

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"plus.square.on.square";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PXLocalizedStringFromTable(@"PXPhotoKitDuplicateAssetActionPerformer_Title", @"PhotosUICore");
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)[MEMORY[0x1E4FB13F0] actionWithTitle:a3 image:a4 identifier:0 handler:a5];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return +[PXDuplicateAssetsAction canPerformOnAsset:inAssetCollection:](PXDuplicateAssetsAction, "canPerformOnAsset:inAssetCollection:", a3, a4, a5, a6);
}

- (void).cxx_destruct
{
}

- (void)setStillImageTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_stillImageTime.value = *(_OWORD *)&a3->var0;
  self->_stillImageTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 208);
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
  v4 = [(PXPhotoKitDuplicateAssetActionPerformer *)self duplicateActionController];
  int64_t v5 = [(PXPhotoKitDuplicateAssetActionPerformer *)self action];
  [(PXPhotoKitDuplicateAssetActionPerformer *)self stillImageTime];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__PXPhotoKitDuplicateAssetActionPerformer_performBackgroundTask__block_invoke;
  v6[3] = &unk_1E5DCEB50;
  v6[4] = self;
  v6[5] = a2;
  [v4 performDuplicateAction:v5 newStillImageTime:v7 completionHandler:v6];
}

uint64_t __64__PXPhotoKitDuplicateAssetActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2)
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"PXPhotoKitDuplicateAssetActionPerformer.m", 88, @"Invalid parameter not satisfying: %@", @"[NSThread isMainThread]" object file lineNumber description];
  }
  v4 = *(void **)(a1 + 32);
  return [v4 completeBackgroundTaskWithSuccess:a2 error:0];
}

- (void)performUserInteractionTask
{
  objc_initWeak(&location, self);
  v3 = [(PXPhotoKitAssetActionPerformer *)self assets];
  v4 = [(PXActionPerformer *)self presentationEnvironment];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__PXPhotoKitDuplicateAssetActionPerformer_performUserInteractionTask__block_invoke;
  v5[3] = &unk_1E5DCEB28;
  objc_copyWeak(&v6, &location);
  PXPromptToSaveUnsavedSyndicatedAssetsIfNecessary(v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __69__PXPhotoKitDuplicateAssetActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a3;
  id v7 = a4;
  if ([v9 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _setupActionControllerWithAssets:v9 updateSelection:a2 == 3];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained completeUserInteractionTaskWithSuccess:0 error:v7];
  }
}

- (void)_setupActionControllerWithAssets:(id)a3 updateSelection:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PXAssetActionPerformer *)self selectionSnapshot];
  if (v4)
  {
    uint64_t v8 = PXContentSyndicationSelectionSnapshotForAssets((uint64_t)v6);

    id v7 = (void *)v8;
  }
  id v9 = [PXPhotoKitDuplicateActionController alloc];
  v10 = [(PXActionPerformer *)self undoManager];
  v11 = [(PXPhotoKitDuplicateActionController *)v9 initWithSelectionSnapshot:v7 undoManager:v10];

  [(PXPhotoKitDuplicateAssetActionPerformer *)self setDuplicateActionController:v11];
  if ([(PXPhotoKitDuplicateActionController *)v11 shouldUseAlertController])
  {
    v12 = [(PXActionPerformer *)self presentationEnvironment];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __92__PXPhotoKitDuplicateAssetActionPerformer__setupActionControllerWithAssets_updateSelection___block_invoke;
    v14[3] = &unk_1E5DCEB00;
    v15 = v11;
    v16 = self;
    v13 = [v12 presentAlertWithConfigurationHandler:v14];

    if (!v13) {
      PXAssertGetLog();
    }
  }
  else
  {
    [(PXPhotoKitDuplicateAssetActionPerformer *)self setAction:1];
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
}

uint64_t __92__PXPhotoKitDuplicateAssetActionPerformer__setupActionControllerWithAssets_updateSelection___block_invoke(uint64_t a1, uint64_t a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __92__PXPhotoKitDuplicateAssetActionPerformer__setupActionControllerWithAssets_updateSelection___block_invoke_2;
  v4[3] = &unk_1E5DCEAD8;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  return [v2 configureAlertConfiguration:a2 withUserConfirmationHandler:v4];
}

uint64_t __92__PXPhotoKitDuplicateAssetActionPerformer__setupActionControllerWithAssets_updateSelection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setAction:");
  BOOL v4 = *(void **)(a1 + 32);
  return [v4 completeUserInteractionTaskWithSuccess:a2 error:0];
}

@end