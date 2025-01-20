@interface PUPXPhotoKitPasteAdjustmentsActionPerformer
+ (BOOL)_canPasteOnAsset:(id)a3;
+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (void)performUserInteractionTask;
@end

@implementation PUPXPhotoKitPasteAdjustmentsActionPerformer

- (void)performUserInteractionTask
{
  v3 = [(PXPhotoKitAssetActionPerformer *)self assets];
  v4 = PFFilter();
  if ([v4 count])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__PUPXPhotoKitPasteAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_545;
    aBlock[3] = &unk_1E5F2E1C0;
    id v26 = v4;
    v27 = self;
    v5 = _Block_copy(aBlock);
    if (PFExists())
    {
      v6 = (void *)MEMORY[0x1E4FB1418];
      v7 = PELocalizedString();
      v8 = PELocalizedString();
      v9 = [v6 alertControllerWithTitle:v7 message:v8 preferredStyle:1];

      v10 = (void *)MEMORY[0x1E4FB1410];
      v11 = PELocalizedString();
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __73__PUPXPhotoKitPasteAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_3;
      v23[3] = &unk_1E5F2E898;
      id v12 = v5;
      id v24 = v12;
      v13 = [v10 actionWithTitle:v11 style:0 handler:v23];
      [v9 addAction:v13];

      v14 = (void *)MEMORY[0x1E4FB1410];
      v15 = PELocalizedString();
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      v20 = __73__PUPXPhotoKitPasteAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_569;
      v21 = &unk_1E5F2E898;
      id v22 = v12;
      v16 = [v14 actionWithTitle:v15 style:1 handler:&v18];
      objc_msgSend(v9, "addAction:", v16, v18, v19, v20, v21);

      [(PXActionPerformer *)self presentViewController:v9];
    }
    else
    {
      (*((void (**)(void *, void))v5 + 2))(v5, 0);
    }
  }
  else
  {
    v17 = PLUIGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_INFO, "No valid assets to paste on, aborting.", buf, 2u);
    }

    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
}

void __73__PUPXPhotoKitPasteAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_545(uint64_t a1, char a2)
{
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __73__PUPXPhotoKitPasteAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_2;
  v11 = &__block_descriptor_33_e17_B16__0__PHAsset_8l;
  char v12 = a2;
  v3 = PFFilter();
  if ([v3 count])
  {
    id v4 = +[PUPXPhotoKitBatchActionPerformer newEditActionForPerformer:*(void *)(a1 + 40) class:objc_opt_class() assets:v3 prepareAction:0];
    v5 = [*(id *)(a1 + 40) undoManager];
    [v4 executeWithUndoManager:v5 completionHandler:&__block_literal_global_550];

    [*(id *)(a1 + 40) completeUserInteractionTaskWithSuccess:1 error:0];
  }
  else
  {
    v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_INFO, "No valid assets to paste on after removing spatials, aborting.", v7, 2u);
    }

    [*(id *)(a1 + 40) completeUserInteractionTaskWithSuccess:1 error:0];
  }
}

uint64_t __73__PUPXPhotoKitPasteAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_INFO, "User approved pasting edits on spatial assets.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__PUPXPhotoKitPasteAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_569(uint64_t a1)
{
  v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_INFO, "User skipped pasting edits on spatial assets.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__PUPXPhotoKitPasteAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_2_551(uint64_t a1, void *a2)
{
  return [a2 isSpatialMedia];
}

uint64_t __73__PUPXPhotoKitPasteAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    return [a2 isSpatialMedia] ^ 1;
  }
  else {
    return 1;
  }
}

uint64_t __73__PUPXPhotoKitPasteAdjustmentsActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (+[PUPXPhotoKitPasteAdjustmentsActionPerformer _canPasteOnAsset:v2])
  {
    uint64_t v3 = [MEMORY[0x1E4F8FFE8] isSupportedAsset:v2 type:0];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"slider.horizontal.2.square.badge.arrow.down";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PULocalizedString(@"PASTE_ACTIVITY_ADJUSTMENTS");
}

+ (BOOL)_canPasteOnAsset:(id)a3
{
  id v4 = a3;
  v5 = +[PUPhotoEditProtoSettings sharedInstance];
  char v6 = [v5 enableSpatialMediaEditing];

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___PUPXPhotoKitPasteAdjustmentsActionPerformer;
  if (objc_msgSendSuper2(&v10, sel_canPerformBatchOnAsset_, v4)
    && ((v6 & 1) != 0 || ([v4 isSpatialMedia] & 1) == 0)
    && [MEMORY[0x1E4F911C0] canPerformEditOnAsset:v4])
  {
    v7 = [MEMORY[0x1E4F910D8] sharedPresetManager];
    char v8 = [v7 hasPresetOnPasteboard];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F910D8] sharedPresetManager];
  if ([v11 hasPresetOnPasteboard]
    && ([v11 isBusyWithBatchAction] & 1) == 0
    && ([v8 selectedIndexPaths],
        char v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 count],
        v12,
        v13))
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __98__PUPXPhotoKitPasteAdjustmentsActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke;
    v16[3] = &unk_1E5F28708;
    v16[4] = &v17;
    v16[5] = a1;
    [v8 enumerateSelectedObjectsUsingBlock:v16];
    BOOL v14 = *((unsigned char *)v18 + 24) != 0;
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

void __98__PUPXPhotoKitPasteAdjustmentsActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v6;

    if (v5 && [*(id *)(a1 + 40) _canPasteOnAsset:v5])
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