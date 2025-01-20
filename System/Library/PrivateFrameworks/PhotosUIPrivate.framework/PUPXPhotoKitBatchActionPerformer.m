@interface PUPXPhotoKitBatchActionPerformer
+ (BOOL)canPerformBatchOnAsset:(id)a3;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)newActivityProgressAlertForAction:(id)a3 assets:(id)a4;
+ (id)newEditActionForPerformer:(id)a3 class:(Class)a4 assets:(id)a5 prepareAction:(id)a6;
+ (id)newProgressToastForAction:(id)a3 assets:(id)a4;
@end

@implementation PUPXPhotoKitBatchActionPerformer

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)[MEMORY[0x1E4FB13F0] actionWithTitle:a3 image:a4 identifier:0 handler:a5];
}

+ (id)newActivityProgressAlertForAction:(id)a3 assets:(id)a4
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F8FF50]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F28F90]);
  [v4 setProgress:v5];

  [v4 setShowCheckmarkOnCompletion:1];
  [v4 setShouldAutoDisplay:1];
  [v4 setShouldUseProgressText:1];
  return v4;
}

+ (id)newProgressToastForAction:(id)a3 assets:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 delegate];
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
  {
    id v10 = 0;
LABEL_8:
    v22 = 0;
    goto LABEL_9;
  }
  v9 = [v5 delegate];
  id v10 = [v9 actionPerformerHostViewControllerForPresentingToast:v5];

  if (!v10) {
    goto LABEL_8;
  }
  v11 = +[PUPhotoEditProtoSettings sharedInstance];
  int v12 = [v11 useEditToastProgress];

  if (!v12) {
    goto LABEL_8;
  }
  v13 = [v5 delegate];
  char v14 = objc_opt_respondsToSelector();

  double v15 = 0.0;
  if (v14)
  {
    v16 = [v5 delegate];
    [v16 actionPerformerBottomPaddingForPresentingToast:v5];
    double v15 = v17;
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F28F90]);
  [v18 setTotalUnitCount:100];
  [v18 setCompletedUnitCount:0];
  id v19 = objc_alloc(MEMORY[0x1E4F8FF30]);
  id v20 = v10;
  v21 = objc_msgSend(v20, "px_navigationDestination");
  v22 = (void *)[v19 initWithTargetDestination:v21 progress:v18];

  [v22 setBottomSpacing:v15];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __69__PUPXPhotoKitBatchActionPerformer_newProgressToastForAction_assets___block_invoke;
  v24[3] = &unk_1E5F286E0;
  id v25 = v6;
  id v10 = v20;
  id v26 = v10;
  [v22 setErrorButtonAction:v24];

LABEL_9:
  return v22;
}

void __69__PUPXPhotoKitBatchActionPerformer_newProgressToastForAction_assets___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [[PUEditingErrorPresentationController alloc] initWithErrors:v3 forAssets:*(void *)(a1 + 32)];

  id v4 = [(PUErrorPresentationController *)v6 alertControllerWithCompletion:0];
  id v5 = *(id *)(a1 + 40);
  [v5 presentViewController:v4 animated:1 completion:0];
}

+ (id)newEditActionForPerformer:(id)a3 class:(Class)a4 assets:(id)a5 prepareAction:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v11 = (void (**)(id, void *))a6;
  if ([(objc_class *)a4 isSubclassOfClass:objc_opt_class()])
  {
    id v12 = +[PUPXPhotoKitBatchActionPerformer newProgressToastForAction:v9 assets:v10];
    if (v12)
    {
      v13 = 0;
    }
    else
    {
      v13 = [MEMORY[0x1E4F91280] defaultManager];
    }
    id v30 = v9;
    id v15 = +[PUPXPhotoKitBatchActionPerformer newActivityProgressAlertForAction:v9 assets:v10];
    v16 = [MEMORY[0x1E4F910D8] sharedPresetManager];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__PUPXPhotoKitBatchActionPerformer_newEditActionForPerformer_class_assets_prepareAction___block_invoke;
    aBlock[3] = &unk_1E5F2ED10;
    id v28 = v16;
    id v36 = v28;
    double v17 = _Block_copy(aBlock);
    [v12 setCloseButtonAction:v17];
    [v15 setCancellationHandler:v17];
    id v18 = [a4 alloc];
    id v19 = [MEMORY[0x1E4F910D8] sharedPresetManager];
    id v20 = [v15 progress];
    v21 = [v12 progress];
    char v14 = (void *)[v18 initWithPresetManager:v19 syncProgress:v20 asyncProgress:v21 asyncLoadingStatusManager:v13 forAssets:v10];

    if (v11) {
      v11[2](v11, v14);
    }
    v22 = objc_msgSend(v14, "localizedProgressToastSuccessTitle", v28);
    v23 = +[PUPhotoEditProtoSettings sharedInstance];
    objc_msgSend(v14, "setAllowSynchronousRendering:", objc_msgSend(v23, "allowSynchronousBatchRendering"));

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __89__PUPXPhotoKitBatchActionPerformer_newEditActionForPerformer_class_assets_prepareAction___block_invoke_2;
    v31[3] = &unk_1E5F2A950;
    id v32 = v15;
    id v33 = v12;
    id v34 = v22;
    id v24 = v22;
    id v25 = v12;
    id v26 = v15;
    [v14 setCompletionHandler:v31];

    id v9 = v30;
  }
  else
  {
    v13 = PLUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      Class v38 = a4;
      _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_ERROR, "Invalid class parameter for [PUPXPhotoKitPasteAdjustmentsActionPerformer newEditActionForPerformer:class:assets:] :%@", buf, 0xCu);
    }
    char v14 = 0;
  }

  return v14;
}

uint64_t __89__PUPXPhotoKitBatchActionPerformer_newEditActionForPerformer_class_assets_prepareAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelCurrentBatchAction];
}

uint64_t __89__PUPXPhotoKitBatchActionPerformer_newEditActionForPerformer_class_assets_prepareAction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 hideAnimated:0 allowDelay:0];
  [*(id *)(a1 + 40) setErrors:v4];

  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  return [v5 finishProgressMarkingAsComplete:1 updatedLocalizedTitle:v6 updatedLocalizedDescription:0];
}

+ (BOOL)canPerformBatchOnAsset:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F910D8] sharedPresetManager];
  if (([v4 isBusyWithBatchAction] & 1) != 0
    || ![v3 canPerformEditOperation:2])
  {
    char v5 = 0;
  }
  else
  {
    char v5 = [MEMORY[0x1E4F911C0] canPerformEditOnAsset:v3];
  }

  return v5;
}

@end