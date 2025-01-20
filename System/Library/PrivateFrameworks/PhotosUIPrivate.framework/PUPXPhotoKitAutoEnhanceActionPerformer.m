@interface PUPXPhotoKitAutoEnhanceActionPerformer
+ (BOOL)_canPerformOnAsset:(id)a3;
+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (void)performUserInteractionTask;
@end

@implementation PUPXPhotoKitAutoEnhanceActionPerformer

- (void)performUserInteractionTask
{
  v3 = [(PXPhotoKitAssetActionPerformer *)self assets];
  v4 = PFFilter();
  if ([v4 count])
  {
    id v5 = +[PUPXPhotoKitBatchActionPerformer newEditActionForPerformer:self class:objc_opt_class() assets:v4 prepareAction:0];
    v6 = [(PXActionPerformer *)self undoManager];
    [v5 executeWithUndoManager:v6 completionHandler:&__block_literal_global_621];

    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
  else
  {
    v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_INFO, "No valid assets to enhance, aborting.", v8, 2u);
    }

    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
}

uint64_t __68__PUPXPhotoKitAutoEnhanceActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (+[PUPXPhotoKitBatchActionPerformer canPerformBatchOnAsset:v2])
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
  return @"wand.and.stars";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return (id)PXLocalizedString();
}

+ (BOOL)_canPerformOnAsset:(id)a3
{
  return [a3 canPerformEditOperation:2];
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 selectedIndexPaths];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __93__PUPXPhotoKitAutoEnhanceActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke;
    v15[3] = &unk_1E5F28708;
    v15[4] = &v16;
    v15[5] = a1;
    [v8 enumerateSelectedObjectsUsingBlock:v15];
    BOOL v13 = *((unsigned char *)v17 + 24) != 0;
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

void __93__PUPXPhotoKitAutoEnhanceActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v6;

    if (v5 && [*(id *)(a1 + 40) _canPerformOnAsset:v5])
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