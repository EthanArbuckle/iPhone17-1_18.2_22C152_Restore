@interface PUPXPhotoKitCopyAdjustmentsActionPerformer
+ (BOOL)_canPerformOnAsset:(id)a3;
+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (void)performUserInteractionTask;
@end

@implementation PUPXPhotoKitCopyAdjustmentsActionPerformer

- (void)performUserInteractionTask
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v4 = [(PXPhotoKitAssetActionPerformer *)self assets];
  uint64_t v5 = [v4 count];

  if (v5 != 1)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PUPXPhotoKitAssetActionManager.m" lineNumber:854 description:@"Adjustments can only be copied from one unique asset"];
  }
  v6 = [(PXPhotoKitAssetActionPerformer *)self assets];
  v7 = [v6 firstObject];

  uint64_t v21 = 0;
  v8 = [MEMORY[0x1E4F910A0] synchronousCompositionControllerForAsset:v7 networkAccessAllowed:0 disposition:&v21 originalComposition:0];
  if (v8)
  {
    if ([(PXPhotoKitAssetActionPerformer *)self shouldSkipUserConfirmation]
      || !+[PUPhotoEditCopyEditsViewController shouldPresentForCopyingFromCompositionController:v8 asset:v7])
    {
      v15 = [MEMORY[0x1E4F910D8] sharedPresetManager];
      [v15 copyPresetFromAsset:v7 removeCrop:1];

      [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
    }
    else
    {
      v9 = [[PUPhotoEditCopyEditsViewController alloc] initWithCompositionController:v8 asset:v7];
      objc_initWeak(&location, self);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __72__PUPXPhotoKitCopyAdjustmentsActionPerformer_performUserInteractionTask__block_invoke;
      v18[3] = &unk_1E5F2D898;
      objc_copyWeak(&v19, &location);
      [(PUPhotoEditCopyEditsViewController *)v9 setCompletionHandler:v18];
      v10 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v9];
      [v10 setModalPresentationStyle:7];
      v11 = [v10 popoverPresentationController];
      v12 = [v11 adaptiveSheetPresentationController];
      v13 = [MEMORY[0x1E4FB1C30] mediumDetent];
      v22[0] = v13;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      [v12 setDetents:v14];

      [(PXActionPerformer *)self presentViewController:v10];
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v16 = PLUIGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location) = 0;
      _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_ERROR, "Failed to copy edits, composition controller failed to load", (uint8_t *)&location, 2u);
    }

    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
  }
}

void __72__PUPXPhotoKitCopyAdjustmentsActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained completeUserInteractionTaskWithSuccess:1 error:0];
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"slider.horizontal.2.square.on.square";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PULocalizedString(@"COPY_ACTIVITY_ADJUSTMENTS");
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)[MEMORY[0x1E4FB13F0] actionWithTitle:a3 image:a4 identifier:0 handler:a5];
}

+ (BOOL)_canPerformOnAsset:(id)a3
{
  id v3 = a3;
  v4 = +[PUPhotoEditProtoSettings sharedInstance];
  int v5 = [v4 enableSpatialMediaEditing];

  if ([v3 canPerformEditOperation:2]
    && [MEMORY[0x1E4F911C0] canPerformEditOnAsset:v3])
  {
    v6 = [MEMORY[0x1E4F910D8] sharedPresetManager];
    v7 = +[PUPhotoEditProtoSettings sharedInstance];
    int v8 = objc_msgSend(v6, "assetHasCopyableAdjustments:removeCrop:", v3, objc_msgSend(v7, "enableSelectiveCopyEdits") ^ 1);
    if (((v8 ^ 1 | v5) & 1) == 0) {
      int v8 = [v3 isSpatialMedia] ^ 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v6 = a3;
  v7 = [v6 selectedIndexPaths];
  uint64_t v8 = [v7 count];

  if (v8 == 1)
  {
    id v9 = [v6 firstObject];
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v10 = v9;

      if (v10)
      {
        char v11 = [a1 _canPerformOnAsset:v10];
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {

      id v10 = 0;
    }
    char v11 = 0;
    goto LABEL_9;
  }
  char v11 = 0;
LABEL_10:

  return v11;
}

@end