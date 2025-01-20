@interface PXPhotoKitDuplicateActionController
+ (void)_presentDuplicationWasInterruptedWithItemCount:(int64_t)a3 hasPhotos:(BOOL)a4 hasVideos:(BOOL)a5;
- (BOOL)_validateOriginalAssetResourcesForDuplicateAction:(int64_t)a3;
- (BOOL)shouldUseAlertController;
- (NSProgress)progress;
- (NSUndoManager)undoManager;
- (PXActivityProgressController)progressController;
- (PXPhotoKitDuplicateActionController)init;
- (PXPhotoKitDuplicateActionController)initWithSelectionSnapshot:(id)a3 undoManager:(id)a4;
- (id)alertConfigurationForDuplicateActionWithUserConfirmationHandler:(id)a3;
- (void)_checkHasPhotos:(BOOL *)a3 hasVideos:(BOOL *)a4;
- (void)_finishedDuplicationWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_presentAlertWithError:(id)a3;
- (void)_progressFractionCompletedDidChange;
- (void)configureAlertConfiguration:(id)a3 withUserConfirmationHandler:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performDuplicateAction:(int64_t)a3 newStillImageTime:(id *)a4 completionHandler:(id)a5;
- (void)setProgress:(id)a3;
- (void)setProgressController:(id)a3;
@end

@implementation PXPhotoKitDuplicateActionController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressController, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)setProgressController:(id)a3
{
}

- (PXActivityProgressController)progressController
{
  return self->_progressController;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (void)_checkHasPhotos:(BOOL *)a3 hasVideos:(BOOL *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXPhotoKitDuplicateActionController.m", 259, @"Invalid parameter not satisfying: %@", @"hasPhotos" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
LABEL_21:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXPhotoKitDuplicateActionController.m", 260, @"Invalid parameter not satisfying: %@", @"hasVideos" object file lineNumber description];

    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_21;
  }
LABEL_3:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = [(PXAssetsSelectionAction *)self->_action selectedAssets];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v9)
  {
    LOBYTE(v11) = 0;
    LOBYTE(v12) = 0;
    goto LABEL_19;
  }
  uint64_t v10 = v9;
  LOBYTE(v11) = 0;
  LOBYTE(v12) = 0;
  uint64_t v13 = *(void *)v19;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v19 != v13) {
        objc_enumerationMutation(v8);
      }
      v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      if (v12)
      {
        int v12 = 1;
        if ((v11 & 1) == 0) {
          goto LABEL_10;
        }
      }
      else
      {
        int v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) isPhoto];
        if ((v11 & 1) == 0)
        {
LABEL_10:
          int v11 = [v15 isVideo];
          goto LABEL_13;
        }
      }
      int v11 = 1;
LABEL_13:
      if (v12 & v11)
      {
        LOBYTE(v11) = 1;
        LOBYTE(v12) = 1;
        goto LABEL_19;
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_19:

  *a3 = v12;
  *a4 = v11;
}

- (void)_finishedDuplicationWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = v6;
  if (v4)
  {
    v8 = [(PXPhotoKitDuplicateActionController *)self progressController];
    [v8 setFractionCompleted:1.0];
  }
  else if (v6)
  {
    uint64_t v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      int v12 = v7;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "Duplication failed with error %@.", (uint8_t *)&v11, 0xCu);
    }

    [(PXPhotoKitDuplicateActionController *)self _presentAlertWithError:v7];
  }
  uint64_t v10 = [(PXPhotoKitDuplicateActionController *)self progressController];
  [v10 hideAnimated:1 allowDelay:v4];

  [(PXPhotoKitDuplicateActionController *)self setProgressController:0];
  [(PXPhotoKitDuplicateActionController *)self setProgress:0];
}

- (void)_progressFractionCompletedDidChange
{
  id v6 = [(PXPhotoKitDuplicateActionController *)self progress];
  [v6 fractionCompleted];
  double v4 = v3;
  v5 = [(PXPhotoKitDuplicateActionController *)self progressController];
  [v5 setFractionCompleted:v4];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == &PUDuplicateProgressObserverFractionCompletedContext)
  {
    id v13 = [(PXPhotoKitDuplicateActionController *)self progress];

    if (v13 == v11)
    {
      objc_initWeak(&location, self);
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __86__PXPhotoKitDuplicateActionController_observeValueForKeyPath_ofObject_change_context___block_invoke;
      long long v18 = &unk_1E5DD32D0;
      objc_copyWeak(&v19, &location);
      px_dispatch_on_main_queue();
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PXPhotoKitDuplicateActionController;
    [(PXPhotoKitDuplicateActionController *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

void __86__PXPhotoKitDuplicateActionController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _progressFractionCompletedDidChange];
}

- (void)setProgress:(id)a3
{
  v5 = (NSProgress *)a3;
  progress = self->_progress;
  if (progress != v5)
  {
    v7 = v5;
    [(NSProgress *)progress removeObserver:self forKeyPath:@"fractionCompleted"];
    objc_storeStrong((id *)&self->_progress, a3);
    [(NSProgress *)self->_progress addObserver:self forKeyPath:@"fractionCompleted" options:4 context:&PUDuplicateProgressObserverFractionCompletedContext];
    v5 = v7;
  }
}

- (void)_presentAlertWithError:(id)a3
{
  __int16 v8 = 0;
  [(PXPhotoKitDuplicateActionController *)self _checkHasPhotos:(char *)&v8 + 1 hasVideos:&v8];
  int64_t v4 = [(PXDuplicateAssetsAction *)self->_action assetCount];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__PXPhotoKitDuplicateActionController__presentAlertWithError___block_invoke;
  v5[3] = &__block_descriptor_42_e5_v8__0l;
  v5[4] = v4;
  char v6 = HIBYTE(v8);
  char v7 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __62__PXPhotoKitDuplicateActionController__presentAlertWithError___block_invoke(uint64_t a1)
{
  return +[PXPhotoKitDuplicateActionController _presentDuplicationWasInterruptedWithItemCount:*(void *)(a1 + 32) hasPhotos:*(unsigned __int8 *)(a1 + 40) hasVideos:*(unsigned __int8 *)(a1 + 41)];
}

- (void)performDuplicateAction:(int64_t)a3 newStillImageTime:(id *)a4 completionHandler:(id)a5
{
  id v8 = a5;
  if (a3
    && (uint64_t v9 = self->_action) != 0
    && (a3 != 2 || [(PXDuplicateAssetsAction *)v9 canExtractStill])
    && [(PXPhotoKitDuplicateActionController *)self _validateOriginalAssetResourcesForDuplicateAction:a3])
  {
    id v10 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
    id v11 = objc_alloc_init(PXActivityProgressController);
    id v12 = PXLocalizedStringFromTable(@"PXPhotoKitDuplicateAssetActionPerformer_DOWNLOADING", @"PhotosUICore");
    [(PXActivityProgressController *)v11 setTitle:v12];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __98__PXPhotoKitDuplicateActionController_performDuplicateAction_newStillImageTime_completionHandler___block_invoke;
    v26[3] = &unk_1E5DD36F8;
    id v13 = v10;
    id v27 = v13;
    [(PXActivityProgressController *)v11 setCancellationHandler:v26];
    [(PXActivityProgressController *)v11 showAnimated:1 allowDelay:1];
    objc_initWeak(&location, self);
    [(PXDuplicateAssetsAction *)self->_action setDuplicatesAsStill:a3 == 2];
    long long v23 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    [(PXDuplicateAssetsAction *)self->_action setStillImageTime:&v23];
    [(PXDuplicateAssetsAction *)self->_action setActionProgress:v13];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __98__PXPhotoKitDuplicateActionController_performDuplicateAction_newStillImageTime_completionHandler___block_invoke_2;
    v20[3] = &unk_1E5DB2BC8;
    objc_super v14 = v11;
    long long v21 = v14;
    objc_copyWeak(v22, &location);
    v22[1] = (id)a3;
    [(PXDuplicateAssetsAction *)self->_action setDownloadCompletionHandler:v20];
    [(PXPhotoKitDuplicateActionController *)self setProgress:v13];
    [(PXPhotoKitDuplicateActionController *)self setProgressController:v14];
    action = self->_action;
    uint64_t v16 = [(PXPhotoKitDuplicateActionController *)self undoManager];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __98__PXPhotoKitDuplicateActionController_performDuplicateAction_newStillImageTime_completionHandler___block_invoke_3;
    v17[3] = &unk_1E5DCD9C8;
    objc_copyWeak(&v19, &location);
    id v18 = v8;
    [(PXAction *)action executeWithUndoManager:v16 completionHandler:v17];

    objc_destroyWeak(&v19);
    objc_destroyWeak(v22);

    objc_destroyWeak(&location);
  }
  else if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

uint64_t __98__PXPhotoKitDuplicateActionController_performDuplicateAction_newStillImageTime_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

uint64_t __98__PXPhotoKitDuplicateActionController_performDuplicateAction_newStillImageTime_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  double v3 = PXLocalizedStringFromTable(@"PXPhotoKitDuplicateAssetActionPerformer_DUPLICATING", @"PhotosUICore");
  [*(id *)(a1 + 32) setTitle:v3];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = [WeakRetained _validateOriginalAssetResourcesForDuplicateAction:*(void *)(a1 + 48)];

  return v5;
}

uint64_t __98__PXPhotoKitDuplicateActionController_performDuplicateAction_newStillImageTime_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 40);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _finishedDuplicationWithSuccess:a2 error:v6];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v9 = *(uint64_t (**)(void))(result + 16);
    return v9();
  }
  return result;
}

- (BOOL)_validateOriginalAssetResourcesForDuplicateAction:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(PXAssetsSelectionAction *)self->_action selectedAssets];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v5);
      }
      +[PXAssetSupportChecker checkIsSupportedAsset:type:completionHandler:](PXAssetSupportChecker, "checkIsSupportedAsset:type:completionHandler:", MEMORY[0x1E4F143A8], 3221225472, __89__PXPhotoKitDuplicateActionController__validateOriginalAssetResourcesForDuplicateAction___block_invoke, &unk_1E5DB2BA0, self, *(void *)(*((void *)&v11 + 1) + 8 * v8), &v15, a2);
      if (!*((unsigned char *)v16 + 24)) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v19 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  char v9 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v9;
}

void __89__PXPhotoKitDuplicateActionController__validateOriginalAssetResourcesForDuplicateAction___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = a3;
  unint64_t v8 = a4;
  char v9 = (void *)v8;
  if ((a2 & 1) == 0)
  {
    if (!(v7 | v8))
    {
      uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"PXPhotoKitDuplicateActionController.m", 121, @"Invalid parameter not satisfying: %@", @"isSupported || (uti || codecName)" object file lineNumber description];
    }
    id v10 = [*(id *)(a1 + 32) progress];
    [v10 cancel];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    long long v11 = PLUIGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v12;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEBUG, "Duplication failed for unsupported asset: %@", buf, 0xCu);
    }

    buf[0] = 0;
    unsigned __int8 v17 = 0;
    unint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 8) assetCount];
    [*(id *)(a1 + 32) _checkHasPhotos:buf hasVideos:&v17];
    long long v14 = _ConditionallyFormattedString(buf[0], v17, @"PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_TITLE_ONE_PHOTO", @"PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_TITLE_N_PHOTOS", @"PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_TITLE_ONE_VIDEO", @"PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_TITLE_N_VIDEOS", @"PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_TITLE_ONE_ITEM", @"PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_TITLE_N_ITEMS", v13);
    uint64_t v15 = _ConditionallyFormattedString(buf[0], v17, @"PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_MESSAGE_ONE_PHOTO", @"PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_MESSAGE_N_PHOTOS", @"PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_MESSAGE_ONE_VIDEO", @"PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_MESSAGE_N_VIDEOS", @"PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_MESSAGE_ONE_ITEM", @"PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_MESSAGE_N_ITEMS", v13);
    +[PXAssetSupportChecker presentAlertWithTitle:v14 message:v15 uti:v7 codecName:v9 alertControllerPresenter:&__block_literal_global_39051 completionHandler:0];
  }
}

uint64_t __89__PXPhotoKitDuplicateActionController__validateOriginalAssetResourcesForDuplicateAction___block_invoke_265(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4FB1438];
  id v3 = a2;
  int64_t v4 = [v2 sharedApplication];
  uint64_t v5 = objc_msgSend(v4, "px_firstKeyWindow");
  objc_msgSend(v5, "pl_presentViewController:animated:", v3, 1);

  return 1;
}

- (void)configureAlertConfiguration:(id)a3 withUserConfirmationHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  action = self->_action;
  if (action && [(PXDuplicateAssetsAction *)action canExtractStill])
  {
    uint64_t v9 = [(PXDuplicateAssetsAction *)self->_action assetCount];
    BOOL v10 = v9 <= 1;
    if (v9 <= 1) {
      long long v11 = @"PXPhotoKitDuplicateAssetActionPerformer_LIVE_WARNING_MESSAGE_ONE_ITEM";
    }
    else {
      long long v11 = @"PXPhotoKitDuplicateAssetActionPerformer_LIVE_WARNING_MESSAGE_N_ITEMS";
    }
    if (v10) {
      uint64_t v12 = @"PXPhotoKitDuplicateAssetActionPerformer_STILL_CONFIRMATION_MESSAGE_ONE_ITEM";
    }
    else {
      uint64_t v12 = @"PXPhotoKitDuplicateAssetActionPerformer_STILL_CONFIRMATION_MESSAGE_N_ITEMS";
    }
    if (v10) {
      unint64_t v13 = @"PXPhotoKitDuplicateAssetActionPerformer_LIVE_CONFIRMATION_MESSAGE_ONE_ITEM";
    }
    else {
      unint64_t v13 = @"PXPhotoKitDuplicateAssetActionPerformer_LIVE_CONFIRMATION_MESSAGE_N_ITEMS";
    }
    long long v14 = PXLocalizedStringFromTable(v11, @"PhotosUICore");
    uint64_t v15 = PXLocalizedStringFromTable(v12, @"PhotosUICore");
    uint64_t v16 = PXLocalizedStringFromTable(v13, @"PhotosUICore");
    unsigned __int8 v17 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
    [v6 setTitle:v14];
    [v6 setStyle:0];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __95__PXPhotoKitDuplicateActionController_configureAlertConfiguration_withUserConfirmationHandler___block_invoke;
    v24[3] = &unk_1E5DD3128;
    id v18 = v7;
    id v25 = v18;
    [v6 addActionWithTitle:v17 style:1 action:v24];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    id v22[2] = __95__PXPhotoKitDuplicateActionController_configureAlertConfiguration_withUserConfirmationHandler___block_invoke_2;
    v22[3] = &unk_1E5DD3128;
    id v19 = v18;
    id v23 = v19;
    [v6 addActionWithTitle:v16 style:0 action:v22];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __95__PXPhotoKitDuplicateActionController_configureAlertConfiguration_withUserConfirmationHandler___block_invoke_3;
    v20[3] = &unk_1E5DD3128;
    id v21 = v19;
    [v6 addActionWithTitle:v15 style:0 action:v20];
  }
}

uint64_t __95__PXPhotoKitDuplicateActionController_configureAlertConfiguration_withUserConfirmationHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __95__PXPhotoKitDuplicateActionController_configureAlertConfiguration_withUserConfirmationHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, 1, 1);
  }
  return result;
}

uint64_t __95__PXPhotoKitDuplicateActionController_configureAlertConfiguration_withUserConfirmationHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, 1, 2);
  }
  return result;
}

- (id)alertConfigurationForDuplicateActionWithUserConfirmationHandler:(id)a3
{
  id v4 = a3;
  action = self->_action;
  if (action && [(PXDuplicateAssetsAction *)action canExtractStill])
  {
    id v6 = objc_alloc_init(PXAlertConfiguration);
    [(PXPhotoKitDuplicateActionController *)self configureAlertConfiguration:v6 withUserConfirmationHandler:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)shouldUseAlertController
{
  return [(PXDuplicateAssetsAction *)self->_action canExtractStill];
}

- (void)dealloc
{
  [(PXDuplicateAssetsAction *)self->_action setDownloadCompletionHandler:0];
  [(PXPhotoKitDuplicateActionController *)self setProgress:0];
  v3.receiver = self;
  v3.super_class = (Class)PXPhotoKitDuplicateActionController;
  [(PXPhotoKitDuplicateActionController *)&v3 dealloc];
}

- (PXPhotoKitDuplicateActionController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotoKitDuplicateActionController.m", 57, @"%s is not available as initializer", "-[PXPhotoKitDuplicateActionController init]");

  abort();
}

- (PXPhotoKitDuplicateActionController)initWithSelectionSnapshot:(id)a3 undoManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPhotoKitDuplicateActionController;
  unint64_t v8 = [(PXPhotoKitDuplicateActionController *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [[PXDuplicateAssetsAction alloc] initWithSelectionSnapshot:v6];
    action = v8->_action;
    v8->_action = v9;

    objc_storeStrong((id *)&v8->_undoManager, a4);
  }

  return v8;
}

+ (void)_presentDuplicationWasInterruptedWithItemCount:(int64_t)a3 hasPhotos:(BOOL)a4 hasVideos:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  _ConditionallyFormattedString(a4, a5, @"PXPhotoKitDuplicateAssetActionPerformer_FAILED_TITLE_ONE_PHOTO", @"PXPhotoKitDuplicateAssetActionPerformer_FAILED_TITLE_N_PHOTOS", @"PXPhotoKitDuplicateAssetActionPerformer_FAILED_TITLE_ONE_VIDEO", @"PXPhotoKitDuplicateAssetActionPerformer_FAILED_TITLE_N_VIDEOS", @"PXPhotoKitDuplicateAssetActionPerformer_FAILED_TITLE_ONE_ITEM", @"PXPhotoKitDuplicateAssetActionPerformer_FAILED_TITLE_N_ITEMS", a3);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v8 = _ConditionallyFormattedString(v6, v5, @"PXPhotoKitDuplicateAssetActionPerformer_FAILED_MESSAGE_ONE_PHOTO", @"PXPhotoKitDuplicateAssetActionPerformer_FAILED_MESSAGE_N_PHOTOS", @"PXPhotoKitDuplicateAssetActionPerformer_FAILED_MESSAGE_ONE_VIDEO", @"PXPhotoKitDuplicateAssetActionPerformer_FAILED_MESSAGE_N_VIDEOS", @"PXPhotoKitDuplicateAssetActionPerformer_FAILED_MESSAGE_ONE_ITEM", @"PXPhotoKitDuplicateAssetActionPerformer_FAILED_MESSAGE_N_ITEMS", a3);
  uint64_t v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v15 message:v8 preferredStyle:1];
  BOOL v10 = (void *)MEMORY[0x1E4FB1410];
  long long v11 = PXLocalizedStringFromTable(@"PXPhotoKitDuplicateAssetActionPerformer_FAILURE_OK_BUTTON", @"PhotosUICore");
  objc_super v12 = [v10 actionWithTitle:v11 style:0 handler:0];
  [v9 addAction:v12];

  unint64_t v13 = [MEMORY[0x1E4FB1438] sharedApplication];
  long long v14 = objc_msgSend(v13, "px_firstKeyWindow");
  objc_msgSend(v14, "pl_presentViewController:animated:", v9, 1);
}

@end