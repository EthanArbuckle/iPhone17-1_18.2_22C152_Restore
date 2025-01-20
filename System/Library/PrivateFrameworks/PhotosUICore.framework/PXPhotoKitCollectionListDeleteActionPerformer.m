@interface PXPhotoKitCollectionListDeleteActionPerformer
+ (BOOL)canPerformOnCollectionList:(id)a3;
+ (BOOL)isActionDestructive;
+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4;
+ (id)systemImageNameForCollectionList:(id)a3 actionType:(id)a4;
- (void)_promptDeleteConfirmationWithCompletionHandler:(id)a3;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitCollectionListDeleteActionPerformer

+ (id)systemImageNameForCollectionList:(id)a3 actionType:(id)a4
{
  return @"trash";
}

+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4
{
  return PXLocalizedStringFromTable(@"PXDeleteFolderActionName", @"PhotosUICore");
}

+ (BOOL)isActionDestructive
{
  return 1;
}

+ (BOOL)canPerformOnCollectionList:(id)a3
{
  return [a3 canPerformEditOperation:6];
}

- (void)_promptDeleteConfirmationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(PXActionPerformer *)self presentationEnvironment];
  uint64_t v6 = [v5 canPresentPopovers] ^ 1;

  v7 = [(PXPhotoKitCollectionListActionPerformer *)self collectionList];
  v8 = [(PXActionPerformer *)self undoManager];
  PXCollectionDeletionAlertControllerForCollection(v7, 0, v6, v8, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [(PXActionPerformer *)self presentViewController:v9];
}

- (void)performUserInteractionTask
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __75__PXPhotoKitCollectionListDeleteActionPerformer_performUserInteractionTask__block_invoke;
  v2[3] = &unk_1E5DD2188;
  v2[4] = self;
  [(PXPhotoKitCollectionListDeleteActionPerformer *)self _promptDeleteConfirmationWithCompletionHandler:v2];
}

void __75__PXPhotoKitCollectionListDeleteActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, int a2)
{
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    id v4 = [v3 collectionList];
    v5 = [*(id *)(a1 + 32) undoManager];
    uint64_t v6 = [[PXDeleteCollectionsAction alloc] initWithCollection:v4];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __75__PXPhotoKitCollectionListDeleteActionPerformer_performUserInteractionTask__block_invoke_2;
    v8[3] = &unk_1E5DD2570;
    v8[4] = *(void *)(a1 + 32);
    id v9 = v4;
    id v7 = v4;
    [(PXAction *)v6 executeWithUndoManager:v5 completionHandler:v8];
  }
  else
  {
    [v3 completeUserInteractionTaskWithSuccess:0 error:0];
  }
}

void __75__PXPhotoKitCollectionListDeleteActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:v5];
    uint64_t v6 = PLUIActionsGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [*(id *)(a1 + 40) localIdentifier];
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Failed to delete collection %{public}@ with error %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

@end