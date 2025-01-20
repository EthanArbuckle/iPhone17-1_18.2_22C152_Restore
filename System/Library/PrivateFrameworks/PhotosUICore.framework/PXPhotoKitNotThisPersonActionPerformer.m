@interface PXPhotoKitNotThisPersonActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (id)_assetsForActionManager:(id)a3;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (void)performBackgroundTask;
@end

@implementation PXPhotoKitNotThisPersonActionPerformer

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"person.crop.circle.badge.xmark";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  id v5 = a4;
  v6 = [a1 _assetsForActionManager:v5];
  uint64_t v7 = [v6 count];
  v8 = [v5 person];

  v9 = objc_msgSend(v8, "px_localizedName");
  if ([v9 length])
  {
    if (v7 == 1) {
      v10 = @"PXPeopleAssetNotThisNamedPersonFormat";
    }
    else {
      v10 = @"PXPeopleAssetsNotThisNamedPersonFormat";
    }
    v11 = PXLocalizedStringForPersonOrPetAndVisibility(v8, 0, v10);
    v12 = PXStringWithValidatedFormat();
  }
  else
  {
    if (v7 == 1) {
      v13 = @"PXPeopleAssetNotThisUnnamedPerson";
    }
    else {
      v13 = @"PXPeopleAssetsNotThisUnnamedPerson";
    }
    v12 = PXLocalizedStringForPersonOrPetAndVisibility(v8, 0, v13);
  }

  return v12;
}

+ (id)_assetsForActionManager:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 objectReference];
  if (v4)
  {
    id v5 = [v3 objectReference];

    v9[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    id v5 = [v3 selectionManager];

    uint64_t v7 = [v5 selectionSnapshot];
    v6 = [v7 allItemsEnumerator];
  }
  return v6;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  if (a3) {
    BOOL v6 = a5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6;
}

- (void)performBackgroundTask
{
  [(PXPhotoKitAssetActionPerformer *)self instantlyExcludeAssetsFromDataSource];
  id v3 = [(PXAssetActionPerformer *)self selectionSnapshot];
  v4 = [v3 selectedIndexPaths];

  id v5 = [(PXPhotoKitAssetActionPerformer *)self photosDataSourceSnapshot];
  BOOL v6 = [v5 fetchResultWithAssetsAtIndexPaths:v4];

  uint64_t v7 = [PXNotThisPersonAction alloc];
  v8 = [(PXPhotoKitAssetActionPerformer *)self person];
  v9 = [(PXNotThisPersonAction *)v7 initWithPerson:v8 assets:v6];

  v10 = [(PXActionPerformer *)self undoManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__PXPhotoKitNotThisPersonActionPerformer_performBackgroundTask__block_invoke;
  v11[3] = &unk_1E5DD3158;
  v11[4] = self;
  [(PXAction *)v9 executeWithUndoManager:v10 completionHandler:v11];
}

void __63__PXPhotoKitNotThisPersonActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    BOOL v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      int v14 = 138412290;
      v15 = v8;
      v9 = "[%@] Not This Person succeeded.";
      v10 = v6;
      os_log_type_t v11 = OS_LOG_TYPE_INFO;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else
  {
    [*(id *)(a1 + 32) stopExcludingAssetsFromDataSource];
    BOOL v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v13);
      int v14 = 138412546;
      v15 = v8;
      __int16 v16 = 2112;
      id v17 = v5;
      v9 = "[%@] Not This Person failed: %@.";
      v10 = v6;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
      goto LABEL_6;
    }
  }

  [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:v5];
}

@end