@interface PUPXPhotoKitRevertAdjustmentsActionPerformer
+ (BOOL)_canRevertOnAsset:(id)a3 fast:(BOOL)a4;
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (BOOL)canPerformOnSubsetOfSelection;
- (void)performUserInteractionTask;
@end

@implementation PUPXPhotoKitRevertAdjustmentsActionPerformer

- (void)performUserInteractionTask
{
  v3 = [(PXPhotoKitAssetActionPerformer *)self assets];
  v4 = PFFilter();
  if ([v4 count])
  {
    v5 = PFFilter();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__PUPXPhotoKitRevertAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_2;
    aBlock[3] = &unk_1E5F2ECC8;
    aBlock[4] = self;
    id v24 = v4;
    v6 = (void (**)(void))_Block_copy(aBlock);
    unint64_t v7 = [v3 count];
    if ([v5 count])
    {
      [v3 count];
      v8 = PXLocalizedString();
      PXMediaTypeForAssets();
      uint64_t v9 = PXLocalizedUsageStringWithoutAssetCount();
    }
    else
    {
      if (v7 < 2) {
        goto LABEL_15;
      }
      v8 = PXLocalizedString();
      uint64_t v9 = PXLocalizedString();
    }
    v11 = (void *)v9;
    v12 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v8 message:v9 preferredStyle:0];

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E4FB1410];
      v14 = PXLocalizedString();
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __74__PUPXPhotoKitRevertAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_4;
      v21[3] = &unk_1E5F28798;
      v21[4] = self;
      v22 = v6;
      v15 = [v13 actionWithTitle:v14 style:2 handler:v21];
      [v12 addAction:v15];

      v16 = (void *)MEMORY[0x1E4FB1410];
      v17 = PXLocalizedString();
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __74__PUPXPhotoKitRevertAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_5;
      v20[3] = &unk_1E5F2BF98;
      v20[4] = self;
      v18 = [v16 actionWithTitle:v17 style:1 handler:v20];
      [v12 addAction:v18];

      if (![(PXActionPerformer *)self presentViewController:v12])
      {
        v19 = PLSharedLibraryGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_ERROR, "Failed to present revert unsupported adjustments warning.", buf, 2u);
        }

        [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
      }

      goto LABEL_16;
    }
LABEL_15:
    v6[2](v6);
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
LABEL_16:

    goto LABEL_17;
  }
  v10 = PLUIGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_INFO, "No valid assets to revert, aborting.", buf, 2u);
  }

  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
LABEL_17:
}

void __74__PUPXPhotoKitRevertAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  id v3 = +[PUPXPhotoKitBatchActionPerformer newEditActionForPerformer:*(void *)(a1 + 32) class:objc_opt_class() assets:*(void *)(a1 + 40) prepareAction:0];
  v2 = [*(id *)(a1 + 32) undoManager];
  [v3 executeWithUndoManager:v2 completionHandler:&__block_literal_global_588];
}

uint64_t __74__PUPXPhotoKitRevertAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 completeUserInteractionTaskWithSuccess:1 error:0];
}

uint64_t __74__PUPXPhotoKitRevertAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:0];
}

uint64_t __74__PUPXPhotoKitRevertAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_583(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F911C0] assetHasUnsupportedOriginalAdjustments:a2];
}

uint64_t __74__PUPXPhotoKitRevertAdjustmentsActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = 0;
  if (+[PUPXPhotoKitRevertAdjustmentsActionPerformer _canRevertOnAsset:v2 fast:0])
  {
    uint64_t v3 = [MEMORY[0x1E4F8FFE8] isSupportedAsset:v2 type:0];
  }

  return v3;
}

- (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"slider.horizontal.2.gobackward";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PULocalizedString(@"REVERT_ACTIVITY_ADJUSTMENTS");
}

+ (BOOL)_canRevertOnAsset:(id)a3 fast:(BOOL)a4
{
  id v6 = a3;
  if ([v6 hasAdjustments])
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___PUPXPhotoKitRevertAdjustmentsActionPerformer;
    unsigned int v7 = objc_msgSendSuper2(&v10, sel_canPerformBatchOnAsset_, v6);
    if (v7 && !a4)
    {
      v8 = [MEMORY[0x1E4F910D8] sharedPresetManager];
      LOBYTE(v7) = [v8 assetHasRevertibleAdjustments:v6];
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return objc_msgSend(a1, "_canRevertOnAsset:fast:", a3, 0, a5, a6);
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F910D8] sharedPresetManager];
  if (([v11 isBusyWithBatchAction] & 1) != 0
    || ([v8 selectedIndexPaths],
        v12 = objc_claimAutoreleasedReturnValue(),
        unint64_t v13 = [v12 count],
        v12,
        !v13))
  {
    BOOL v14 = 0;
  }
  else
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __99__PUPXPhotoKitRevertAdjustmentsActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke;
    v16[3] = &unk_1E5F28770;
    BOOL v17 = v13 > 2;
    v16[4] = &v18;
    v16[5] = a1;
    [v8 enumerateSelectedObjectsUsingBlock:v16];
    BOOL v14 = *((unsigned char *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);
  }

  return v14;
}

void __99__PUPXPhotoKitRevertAdjustmentsActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v6;

    if (v5
      && [*(id *)(a1 + 40) _canRevertOnAsset:v5 fast:*(unsigned __int8 *)(a1 + 48)])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
  else
  {

    id v5 = 0;
  }
}

@end