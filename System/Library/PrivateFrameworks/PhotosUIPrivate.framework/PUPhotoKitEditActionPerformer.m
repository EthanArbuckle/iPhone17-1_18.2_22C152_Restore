@interface PUPhotoKitEditActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4;
- (PUPhotoEditPendingEditsRequest)pendingEditsRequest;
- (PUQuickCropContext)quickCropContext;
- (void)_beginEditingCurrentAsset;
- (void)_presentEditorForAsset:(id)a3;
- (void)performUserInteractionTask;
- (void)setPendingEditsRequest:(id)a3;
- (void)setQuickCropContext:(id)a3;
@end

@implementation PUPhotoKitEditActionPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingEditsRequest, 0);
  objc_storeStrong((id *)&self->_quickCropContext, 0);
  objc_storeStrong((id *)&self->_presentedAlertViewController, 0);
}

- (void)setPendingEditsRequest:(id)a3
{
}

- (PUPhotoEditPendingEditsRequest)pendingEditsRequest
{
  return self->_pendingEditsRequest;
}

- (void)setQuickCropContext:(id)a3
{
}

- (PUQuickCropContext)quickCropContext
{
  return self->_quickCropContext;
}

- (void)_presentEditorForAsset:(id)a3
{
  id v4 = a3;
  v12 = objc_alloc_init(PUPhotoKitMediaProvider);
  id v5 = objc_alloc_init(MEMORY[0x1E4F91168]);
  v6 = +[PUPhotoEditProtoSettings sharedInstance];
  objc_msgSend(v5, "setApplyVideoOrientationAsMetadata:", objc_msgSend(v6, "applyVideoOrientationAsMetadata"));

  unint64_t v7 = [(PUAssetActionPerformer *)self actionType];
  if (v7 - 16 > 0xB) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = qword_1AEFF8288[v7 - 16];
  }
  v9 = [[PUPhotoEditViewController alloc] initWithPhoto:v4 mediaProvider:v12 mediaDestination:v5];

  [(PUPhotoEditViewController *)v9 setInitialToolType:v8];
  v10 = [(PUPhotoKitEditActionPerformer *)self quickCropContext];
  [(PUPhotoEditViewController *)v9 setQuickCropContext:v10];

  v11 = [(PUPhotoKitEditActionPerformer *)self pendingEditsRequest];
  [(PUPhotoEditViewController *)v9 setInitialPendingEditsRequest:v11];

  [(PUAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:[(PUAssetActionPerformer *)self presentViewController:v9] error:0];
}

- (void)_beginEditingCurrentAsset
{
  v3 = [(PUAssetActionPerformer *)self assets];
  id v4 = [v3 firstObject];

  if ([v4 canPerformEditOperation:2])
  {
    [(PUPhotoKitEditActionPerformer *)self _presentEditorForAsset:v4];
  }
  else
  {
    objc_initWeak(&location, self);
    id v5 = +[PUPhotoEditTaskManager sharedManager];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__PUPhotoKitEditActionPerformer__beginEditingCurrentAsset__block_invoke;
    v6[3] = &unk_1E5F29980;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    [v5 createEditableCopyForReadOnlyPhoto:v7 completionHandler:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __58__PUPhotoKitEditActionPerformer__beginEditingCurrentAsset__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (v5)
  {
    [WeakRetained _presentEditorForAsset:v5];
  }
  else
  {
    v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "Error creating editable duplicate asset for %@. Error: %@", (uint8_t *)&v11, 0x16u);
    }

    [v8 completeUserInteractionTaskWithSuccess:0 error:0];
  }
}

- (void)performUserInteractionTask
{
  id v4 = [(PUAssetActionPerformer *)self assets];
  uint64_t v5 = [v4 count];

  if (v5 != 1)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PUPhotoKitAssetActionManager.m" lineNumber:1436 description:@"There can be only one asset in an edit action"];
  }
  id v6 = [(PUAssetActionPerformer *)self assets];
  id v7 = [v6 firstObject];

  id v8 = (void *)MEMORY[0x1E4F8FFE8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__PUPhotoKitEditActionPerformer_performUserInteractionTask__block_invoke;
  v14[3] = &unk_1E5F29958;
  v14[4] = self;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__PUPhotoKitEditActionPerformer_performUserInteractionTask__block_invoke_2;
  v11[3] = &unk_1E5F2E1C0;
  id v12 = v7;
  __int16 v13 = self;
  id v9 = v7;
  [v8 checkIsSupportedAndPresentAlertForAsset:v9 type:0 alertControllerPresenter:v14 completionHandler:v11];
}

uint64_t __59__PUPhotoKitEditActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), a2);
  id v4 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) presentViewController:v4];

  return v5;
}

void __59__PUPhotoKitEditActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    unint64_t v3 = [*(id *)(a1 + 32) playbackStyle];
    if (v3 > 5 || ((1 << v3) & 0x3A) == 0)
    {
      unint64_t v20 = v3;
      v21 = PLUIGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v27 = v20;
        _os_log_impl(&dword_1AE9F8000, v21, OS_LOG_TYPE_ERROR, "No editor for playback style: %ld", buf, 0xCu);
      }

      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"No editor for playback style: %ld", v20);
      [*(id *)(a1 + 40) completeUserInteractionTaskWithSuccess:0 error:v10];
      goto LABEL_21;
    }
    char v5 = [*(id *)(a1 + 32) canPerformEditOperation:2];
    id v6 = +[PUPhotoEditProtoSettings sharedInstance];
    char v7 = [v6 enableSpatialMediaEditing];

    if ((v5 & 1) == 0 && ((v7 & 1) != 0 || ([*(id *)(a1 + 32) isSpatialMedia] & 1) == 0))
    {
      uint64_t v10 = PULocalizedString(@"PHOTOEDIT_EDIT_READONLY_TITLE");
      int v11 = PULocalizedString(@"PHOTOEDIT_EDIT_READONLY_MESSAGE");
      id v12 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v10 message:v11 preferredStyle:0];
      __int16 v13 = (void *)MEMORY[0x1E4FB1410];
      id v14 = PULocalizedString(@"PHOTOEDIT_EDIT_READONLY_DUPLICATE_BUTTON");
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __59__PUPhotoKitEditActionPerformer_performUserInteractionTask__block_invoke_3;
      v25[3] = &unk_1E5F2BF98;
      v25[4] = *(void *)(a1 + 40);
      uint64_t v15 = [v13 actionWithTitle:v14 style:0 handler:v25];
      [v12 addAction:v15];

      v16 = (void *)MEMORY[0x1E4FB1410];
      v17 = PULocalizedString(@"PHOTOEDIT_EDIT_READONLY_CANCEL_BUTTON");
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __59__PUPhotoKitEditActionPerformer_performUserInteractionTask__block_invoke_4;
      v24[3] = &unk_1E5F2BF98;
      v24[4] = *(void *)(a1 + 40);
      v18 = [v16 actionWithTitle:v17 style:1 handler:v24];
      [v12 addAction:v18];

      if (([*(id *)(a1 + 40) presentViewController:v12] & 1) == 0)
      {
        v19 = PLUIGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_ERROR, "Failed to present duplicate confirmation. User must confirm to perform edit.", buf, 2u);
        }

        [*(id *)(a1 + 40) completeUserInteractionTaskWithSuccess:0 error:0];
      }

LABEL_21:
      goto LABEL_22;
    }
    [*(id *)(a1 + 40) _beginEditingCurrentAsset];
  }
  else
  {
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = v8[10];
    if (v9)
    {
      [v8 dismissViewController:v9 completionHandler:0];
      id v8 = *(void **)(a1 + 40);
    }
    [v8 completeUserInteractionTaskWithSuccess:0 error:0];
  }
LABEL_22:
  uint64_t v22 = *(void *)(a1 + 40);
  v23 = *(void **)(v22 + 80);
  *(void *)(v22 + 80) = 0;
}

uint64_t __59__PUPhotoKitEditActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginEditingCurrentAsset];
}

uint64_t __59__PUPhotoKitEditActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:0];
}

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(MEMORY[0x1E4F911C0], "canPerformEditOnAsset:", a3, a4);
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = +[PUPhotoEditProtoSettings sharedInstance];
  int v8 = [v7 enableSpatialMediaEditing];

  if (([v5 isPhoto] & 1) == 0
    && (![v5 isVideo]
     || ([v5 isTimelapsePlaceholder] & 1) != 0
     || ![v5 canPerformEditOperation:2])
    || ([v5 isCloudSharedAsset] & 1) != 0
    || ([v6 isTrashBin] & 1) != 0
    || [v5 sourceType] == 8)
  {
    char v10 = 0;
  }
  else
  {
    int v9 = objc_msgSend(v5, "px_isSyndicatedAsset");
    if (((v9 | v8) & 1) == 0)
    {
      if (![v5 isSpatialMedia])
      {
        char v10 = 1;
        goto LABEL_13;
      }
      LOBYTE(v9) = [v5 isPhoto];
    }
    char v10 = v9 ^ 1;
  }
LABEL_13:

  return v10;
}

@end