@interface PUPXPhotoKitAddToLastUsedAlbumActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (void)_performUserInteractionTaskWithAssets:(id)a3;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
@end

@implementation PUPXPhotoKitAddToLastUsedAlbumActionPerformer

- (void).cxx_destruct
{
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  v3 = (void *)MEMORY[0x1E4F8FF68];
  v4 = [(PXPhotoKitAssetActionPerformer *)self assets];
  v5 = [v4 firstObject];
  v6 = [v5 photoLibrary];
  v7 = [v3 commandTitleWithPhotoLibrary:v6];

  return v7;
}

- (void)performBackgroundTask
{
  v3 = self->_preparedAction;
  v4 = v3;
  if (v3)
  {
    v5 = [(PXAddAssetsToLastUsedAssetCollectionAction *)v3 underlyingAction];
    +[PUPXPhotoKitAddToAlbumActionPerformer _configureAction:v5];

    v6 = [(PXActionPerformer *)self undoManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__PUPXPhotoKitAddToLastUsedAlbumActionPerformer_performBackgroundTask__block_invoke;
    v7[3] = &unk_1E5F2D4B8;
    v7[4] = self;
    v8 = v4;
    [(PXAddAssetsToLastUsedAssetCollectionAction *)v8 executeWithUndoManager:v6 completionHandler:v7];
  }
  else
  {
    [(PXActionPerformer *)self completeBackgroundTaskWithSuccess:0 error:0];
  }
}

void __70__PUPXPhotoKitAddToLastUsedAlbumActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = a2;
  v12[2] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:a3];
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E4F56658];
    uint64_t v6 = *MEMORY[0x1E4F90BA0];
    v11[0] = *MEMORY[0x1E4F56560];
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v12[0] = v8;
    v11[1] = *MEMORY[0x1E4F56558];
    v9 = [*(id *)(a1 + 40) assets];
    v12[1] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    [v5 sendEvent:v6 withPayload:v10];
  }
}

- (void)_performUserInteractionTaskWithAssets:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F8FF68];
  id v5 = a3;
  id v21 = 0;
  uint64_t v6 = (PXAddAssetsToLastUsedAssetCollectionAction *)[[v4 alloc] initWithAssets:v5 error:&v21];

  id v7 = v21;
  preparedAction = self->_preparedAction;
  self->_preparedAction = v6;

  if (v7)
  {
    v9 = PXAssertGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v7;
      _os_log_fault_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_FAULT, "unable to create action, %@", buf, 0xCu);
    }
  }
  v10 = [(PXAddAssetsToLastUsedAssetCollectionAction *)self->_preparedAction targetAssetCollection];
  v11 = [v10 localizedTitle];
  if (!v11)
  {
    v12 = PXAssertGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v10;
      _os_log_fault_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_FAULT, "missing title for album %@", buf, 0xCu);
    }
  }
  v13 = (void *)MEMORY[0x1E4F90820];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __87__PUPXPhotoKitAddToLastUsedAlbumActionPerformer__performUserInteractionTaskWithAssets___block_invoke;
  v19 = &unk_1E5F2B850;
  id v20 = v11;
  id v14 = v11;
  id v15 = (id)[v13 show:&v16];
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0, v16, v17, v18, v19);
}

uint64_t __87__PUPXPhotoKitAddToLastUsedAlbumActionPerformer__performUserInteractionTaskWithAssets___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32)) {
    v2 = *(__CFString **)(a1 + 32);
  }
  else {
    v2 = @"?";
  }
  return [MEMORY[0x1E4F8FF68] configureToast:a2 withAlbumName:v2];
}

- (void)performUserInteractionTask
{
  objc_initWeak(&location, self);
  int v3 = [(PXPhotoKitAssetActionPerformer *)self assets];
  v4 = [(PXActionPerformer *)self presentationEnvironment];
  objc_copyWeak(&v5, &location);
  PXPromptToSaveUnsavedSyndicatedAssetsIfNecessary();

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __75__PUPXPhotoKitAddToLastUsedAlbumActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [v10 count];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (v7) {
    [WeakRetained _performUserInteractionTaskWithAssets:v10];
  }
  else {
    [WeakRetained completeUserInteractionTaskWithSuccess:0 error:v6];
  }
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  v4 = (void *)MEMORY[0x1E4F8FF68];
  id v5 = objc_msgSend(a4, "photoLibrary", a3);
  id v6 = [v4 commandTitleWithPhotoLibrary:v5];

  return v6;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"rectangle.badge.plus";
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)[MEMORY[0x1E4FB13F0] actionWithTitle:a3 image:a4 identifier:0 handler:a5];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!+[PUPXPhotoKitAddToAlbumActionPerformer canPerformOnAsset:v9 inAssetCollection:a4 person:a5 socialGroup:a6])
  {
    v13 = PLUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v9;
      _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_DEBUG, "can't add %@ to last used album because PUPXPhotoKitAddToAlbumActionPerformer denies it", buf, 0xCu);
    }
    goto LABEL_9;
  }
  id v10 = (void *)MEMORY[0x1E4F8FF68];
  v11 = [v9 photoLibrary];
  id v17 = 0;
  v12 = [v10 targetAssetCollectionInPhotoLibrary:v11 error:&v17];
  v13 = v17;

  if (!v12)
  {
    id v15 = PLUIGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = v13;
      _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_DEBUG, "can't add %@ to last used album because the target asset collection is missing: %@", buf, 0x16u);
    }

LABEL_9:
    BOOL v14 = 0;
    goto LABEL_10;
  }
  BOOL v14 = 1;
LABEL_10:

  return v14;
}

@end