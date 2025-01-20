@interface PXPhotoKitMoveToSharedLibraryActionPerformer
+ (BOOL)_canPerformWithHasSharedLibraryOrPreview:(BOOL)a3 isExitingSharedLibrary:(BOOL)a4 collectionAllowsMoveToSharedLibrary:(BOOL)a5 isUnsavedSyndicatedAsset:(BOOL)a6 canMoveAssetsToSharedLibrary:(BOOL)a7;
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (BOOL)canPerformOnSubsetOfSelection;
+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (BOOL)canPresentAlertInBackgroudState;
- (void)_checkMoveToSharedLibraryConfirmationForAssets:(id)a3;
- (void)_moveAssetsToSharedLibraryWithCompletionHandler:(id)a3;
- (void)_performAdditionalUserInteractionTasks;
- (void)_presentFailureWithError:(id)a3 completionHandler:(id)a4;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitMoveToSharedLibraryActionPerformer

- (void).cxx_destruct
{
}

- (void)_presentFailureWithError:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  v6 = PXLocalizedSharedLibraryString(@"PXSharedLibraryMoveToSharedLibraryFailureAlertTitle");
  v7 = PXLocalizedSharedLibraryString(@"PXSharedLibraryGenericFailureAlertMessage");
  v8 = PXLocalizedStringFromTable(@"PXOK", @"PhotosUICore");
  v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v6 message:v7 preferredStyle:1];
  v10 = (void *)MEMORY[0x1E4FB1410];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__PXPhotoKitMoveToSharedLibraryActionPerformer__presentFailureWithError_completionHandler___block_invoke;
  v16[3] = &unk_1E5DD1068;
  v16[4] = self;
  id v11 = v5;
  id v17 = v11;
  v12 = [v10 actionWithTitle:v8 style:0 handler:v16];
  [v9 addAction:v12];

  if (![(PXActionPerformer *)self presentViewController:v9])
  {
    v13 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "Failed to present failure alert", v15, 2u);
    }

    v14 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, @"Failed to present failure alert");
    [(PXActionPerformer *)self completeBackgroundTaskWithSuccess:0 error:v14];
  }
}

uint64_t __91__PXPhotoKitMoveToSharedLibraryActionPerformer__presentFailureWithError_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:0 error:*(void *)(a1 + 40)];
}

- (void)_moveAssetsToSharedLibraryWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXPhotoKitMoveToSharedLibraryActionPerformer.m", 189, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v6 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to move assets to shared library. Calling PXSharedLibraryMoveAssetsToSharedLibrary()", buf, 2u);
  }

  v7 = self->_assetsToProcess;
  if (![(NSArray *)v7 count])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXPhotoKitMoveToSharedLibraryActionPerformer.m", 192, @"Invalid parameter not satisfying: %@", @"assets.count" object file lineNumber description];
  }
  v8 = PXLocalizedSharedLibraryString(@"PXSharedLibraryMoveToSharedLibraryToastTitle");
  v9 = PXLocalizedAssetCountForUsage([(NSArray *)v7 count], 0, 0, 0);
  v10 = [(id)objc_opt_class() createIndeterminateProgressToastForActionPerformer:self title:v8 description:v9];
  [v10 willStartProgress];
  id v11 = [[PXMoveAssetsToSharedLibraryAction alloc] initWithAssets:v7];
  v12 = [(PXActionPerformer *)self undoManager];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __96__PXPhotoKitMoveToSharedLibraryActionPerformer__moveAssetsToSharedLibraryWithCompletionHandler___block_invoke;
  v17[3] = &unk_1E5DD1B00;
  v19 = self;
  id v20 = v5;
  id v18 = v10;
  id v13 = v5;
  id v14 = v10;
  [(PXAction *)v11 executeWithUndoManager:v12 completionHandler:v17];
}

void __96__PXPhotoKitMoveToSharedLibraryActionPerformer__moveAssetsToSharedLibraryWithCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 finishProgressMarkingAsComplete:0];
  if (a2) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    [*(id *)(a1 + 40) _presentFailureWithError:v6 completionHandler:*(void *)(a1 + 48)];
  }
}

- (void)_performAdditionalUserInteractionTasks
{
  objc_initWeak(&location, self);
  v3 = [(PXPhotoKitAssetActionPerformer *)self assets];
  v4 = [(PXActionPerformer *)self presentationEnvironment];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__PXPhotoKitMoveToSharedLibraryActionPerformer__performAdditionalUserInteractionTasks__block_invoke;
  v5[3] = &unk_1E5DCEB28;
  objc_copyWeak(&v6, &location);
  PXPromptToSaveUnsavedSyndicatedAssetsIfNecessary(v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __86__PXPhotoKitMoveToSharedLibraryActionPerformer__performAdditionalUserInteractionTasks__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [v10 count];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (v7) {
    [WeakRetained _checkMoveToSharedLibraryConfirmationForAssets:v10];
  }
  else {
    [WeakRetained completeUserInteractionTaskWithSuccess:0 error:v6];
  }
}

- (void)_checkMoveToSharedLibraryConfirmationForAssets:(id)a3
{
  id v5 = a3;
  if (PXSharedLibraryShouldDisplayMoveToSharedLibraryConfirmation()) {
    PXSharedLibraryGetMoveToSharedLibraryConfirmationTitleAndMessage(v5);
  }
  objc_storeStrong((id *)&self->_assetsToProcess, a3);
  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
}

uint64_t __95__PXPhotoKitMoveToSharedLibraryActionPerformer__checkMoveToSharedLibraryConfirmationForAssets___block_invoke(uint64_t a1)
{
  PXSharedLibrarySetDidConfirmMoveToSharedLibrary(1);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 192), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  return [v2 completeUserInteractionTaskWithSuccess:1 error:0];
}

void __95__PXPhotoKitMoveToSharedLibraryActionPerformer__checkMoveToSharedLibraryConfirmationForAssets___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Move to Shared Library canceled.");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 completeUserInteractionTaskWithSuccess:0 error:v2];
}

- (BOOL)canPresentAlertInBackgroudState
{
  return 1;
}

- (void)performBackgroundTask
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __69__PXPhotoKitMoveToSharedLibraryActionPerformer_performBackgroundTask__block_invoke;
  v2[3] = &unk_1E5DD3158;
  v2[4] = self;
  [(PXPhotoKitMoveToSharedLibraryActionPerformer *)self _moveAssetsToSharedLibraryWithCompletionHandler:v2];
}

uint64_t __69__PXPhotoKitMoveToSharedLibraryActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:a3];
}

- (void)performUserInteractionTask
{
  if (+[PXSharingConfidentialityController confidentialityCheckRequired](PXSharingConfidentialityController, "confidentialityCheckRequired")&& ([(PXPhotoKitAssetActionPerformer *)self assets], v3 = objc_claimAutoreleasedReturnValue(), BOOL v4 = +[PXSharingConfidentialityController confidentialWarningRequiredForAssets:v3], v3, v4))
  {
    v7[4] = self;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74__PXPhotoKitMoveToSharedLibraryActionPerformer_performUserInteractionTask__block_invoke;
    v8[3] = &unk_1E5DD0030;
    v8[4] = self;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __74__PXPhotoKitMoveToSharedLibraryActionPerformer_performUserInteractionTask__block_invoke_2;
    v7[3] = &unk_1E5DD0030;
    id v5 = +[PXSharingConfidentialityController confidentialityAlertWithConfirmAction:v8 abortAction:v7];
    if (![(PXActionPerformer *)self presentViewController:v5])
    {
      id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to present confidentiality alert");
      [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v6];
    }
  }
  else
  {
    [(PXPhotoKitMoveToSharedLibraryActionPerformer *)self _performAdditionalUserInteractionTasks];
  }
}

uint64_t __74__PXPhotoKitMoveToSharedLibraryActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performAdditionalUserInteractionTasks];
}

void __74__PXPhotoKitMoveToSharedLibraryActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"User cancelled because of confidentiality alert");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 completeUserInteractionTaskWithSuccess:0 error:v2];
}

+ (id)systemImageNameForActionManager:(id)a3
{
  v3 = @"person.2";
  return @"person.2";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PXLocalizedSharedLibraryString(@"PXSharedLibrary_Action_MoveToSharedLibrary");
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  uint64_t v7 = (PXActionManagerTapGestureRecognizer *)a3;
  v8 = [a5 selectionManager];
  v9 = [v8 selectionSnapshot];
  id v10 = [v9 allItemsEnumerator];
  id v11 = _PXSharedLibraryFetchAssetsFromAssets(v10, 0, 0, 0);

  uint64_t v12 = [v11 count];
  if (v12)
  {
    id v13 = PXLocalizedSharedLibraryAssetCountForUsage(v12, 0, 0, 17);
    id v14 = [[PXActionManagerTapGestureRecognizer alloc] initWithTarget:v7 action:a4];

    v15 = PXPhotosBarsCreateSelectModeCaptionLabel();
    v16 = (void *)MEMORY[0x1E4FB08E0];
    [MEMORY[0x1E4FB08E0] labelFontSize];
    id v17 = objc_msgSend(v16, "systemFontOfSize:");
    [v15 setFont:v17];

    [v15 setText:v13];
    id v18 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v15 setTextColor:v18];

    [v15 setUserInteractionEnabled:1];
    [v15 addGestureRecognizer:v14];
    v19 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v15];
    [(PXActionManagerTapGestureRecognizer *)v14 setBarButtonItem:v19];

    uint64_t v7 = v14;
  }
  else
  {
    id v20 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v13 = PXLocalizedStringFromTable(@"PXSelectItems", @"PhotosUICore");
    v19 = (void *)[v20 initWithTitle:v13 style:0 target:v7 action:a4];
  }

  return v19;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v7 = a5;
  v8 = (void *)MEMORY[0x1E4FB13F0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__PXPhotoKitMoveToSharedLibraryActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke;
  v14[3] = &unk_1E5DC8470;
  id v9 = v7;
  id v15 = v9;
  id v10 = [v8 actionWithTitle:a3 image:a4 identifier:0 handler:v14];
  id v11 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  uint64_t v12 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v11];

  if ([v12 hasPreview]) {
    PXSharedLibraryUpdateActionTitleForPreview(v10);
  }

  return v10;
}

uint64_t __91__PXPhotoKitMoveToSharedLibraryActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v7 photoLibrary];
  id v10 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v9];

  uint64_t v11 = [v10 hasSharedLibraryOrPreview];
  uint64_t v12 = [v10 exiting];
  BOOL v13 = v12 != 0;

  uint64_t v14 = objc_msgSend(v7, "px_allowsMoveToSharedLibrary");
  uint64_t v15 = objc_msgSend(v8, "px_isUnsavedSyndicatedAsset");
  v19[0] = v8;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  uint64_t CanMoveAssetsToSharedLibrary = PXSharedLibraryCanMoveAssetsToSharedLibrary(v16);

  LOBYTE(v15) = +[PXPhotoKitMoveToSharedLibraryActionPerformer _canPerformWithHasSharedLibraryOrPreview:v11 isExitingSharedLibrary:v13 collectionAllowsMoveToSharedLibrary:v14 isUnsavedSyndicatedAsset:v15 canMoveAssetsToSharedLibrary:CanMoveAssetsToSharedLibrary];
  return v15;
}

+ (BOOL)_canPerformWithHasSharedLibraryOrPreview:(BOOL)a3 isExitingSharedLibrary:(BOOL)a4 collectionAllowsMoveToSharedLibrary:(BOOL)a5 isUnsavedSyndicatedAsset:(BOOL)a6 canMoveAssetsToSharedLibrary:(BOOL)a7
{
  BOOL v7 = (a6 || a7) && a5;
  if (a4) {
    BOOL v7 = 0;
  }
  return a3 && v7;
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

@end