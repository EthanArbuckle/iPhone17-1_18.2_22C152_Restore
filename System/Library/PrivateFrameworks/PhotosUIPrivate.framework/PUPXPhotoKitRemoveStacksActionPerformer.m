@interface PUPXPhotoKitRemoveStacksActionPerformer
+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PUPXPhotoKitRemoveStacksActionPerformer

- (void)performUserInteractionTask
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(PXAssetActionPerformer *)self selectionSnapshot];
  v4 = [v3 allItemsEnumerator];

  if ([v4 count])
  {
    v5 = PXMap();
    v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:45998 userInfo:0];
    v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = [v5 componentsJoinedByString:@", "];
      int v9 = 138543618;
      v10 = v6;
      __int16 v11 = 2114;
      v12 = v8;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_INFO, "Failed to remove stacks from assets: %{public}@ assetUUIDs: %{public}@", (uint8_t *)&v9, 0x16u);
    }
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v6];
  }
  else
  {
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
  }
}

uint64_t __69__PUPXPhotoKitRemoveStacksActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return @"(Internal) Remove Stacks";
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F90618] sharedInstance];
  int v11 = [v10 canShowInternalUI];

  if (!v11) {
    goto LABEL_5;
  }
  v12 = [MEMORY[0x1E4F90578] sharedInstance];
  int v13 = [v12 enableStacksReviewUI];

  if (!v13) {
    goto LABEL_5;
  }
  v14 = [v7 selectedIndexPaths];
  uint64_t v15 = [v14 count];

  if (v15 >= 1)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __94__PUPXPhotoKitRemoveStacksActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke;
    v18[3] = &unk_1E5F287E0;
    v18[4] = &v19;
    [v7 enumerateSelectedObjectsUsingBlock:v18];
    BOOL v16 = *((unsigned char *)v20 + 24) != 0;
    _Block_object_dispose(&v19, 8);
  }
  else
  {
LABEL_5:
    BOOL v16 = 0;
  }

  return v16;
}

void __94__PUPXPhotoKitRemoveStacksActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v8;
  }
  else {
    id v5 = 0;
  }

  v6 = [v5 burstIdentifier];

  if (v6)
  {
    id v7 = objc_msgSend(v5, "pl_managedAsset");
    if ([v7 avalancheKind] == 2)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
}

@end