@interface PXPhotoKitAssetCollectionDeleteActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (BOOL)isActionDestructive;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (void)_promptDeleteConfirmationWithCompletionHandler:(id)a3;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionDeleteActionPerformer

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v6 = a3;
  v7 = [v6 assetCollection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v9 = @"trash";
  if ((isKindOfClass & 1) == 0) {
    goto LABEL_7;
  }
  v10 = [v6 assetCollection];
  if (!v10)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionDeleteActionPerformer.m", 90, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v14 object file lineNumber description];
LABEL_10:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v15);
    v16 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
    [v12 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionDeleteActionPerformer.m", 90, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v14, v16 object file lineNumber description];

    goto LABEL_10;
  }
LABEL_4:
  if (![v10 isOwned]) {
    v9 = @"minus.circle";
  }

LABEL_7:
  return v9;
}

+ (BOOL)isActionDestructive
{
  return 1;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v7 = a4;
  v8 = PXLocalizedStringFromTable(@"PXAssetCollectionDeleteAlbumActionMenuTitle", @"PhotosUICore");
  v9 = [v7 assetCollection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_7;
  }
  v11 = [v7 assetCollection];
  if (!v11)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v14 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionDeleteActionPerformer.m", 73, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v16 object file lineNumber description];
LABEL_12:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v17);
    v18 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
    [v14 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionDeleteActionPerformer.m", 73, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v16, v18 object file lineNumber description];

    goto LABEL_12;
  }
LABEL_4:
  if (([v11 isOwned] & 1) == 0)
  {
    uint64_t v12 = PXLocalizedStringFromTable(@"PXAssetCollectionUnsubscribeSharedAlbumActionMenuTitle", @"PhotosUICore");

    v8 = (void *)v12;
  }

LABEL_7:
  return v8;
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v6 = [a3 assetCollection];
  if (!v6)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionDeleteActionPerformer.m", 27, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v11 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v12);
    v13 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v9 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionDeleteActionPerformer.m", 27, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v11, v13 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  char v7 = [v6 canPerformEditOperation:6];

  return v7;
}

- (void)_promptDeleteConfirmationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(PXActionPerformer *)self presentationEnvironment];
  uint64_t v6 = [v5 canPresentPopovers] ^ 1;

  char v7 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  v8 = [(PXActionPerformer *)self undoManager];
  PXCollectionDeletionAlertControllerForCollection(v7, 0, v6, v8, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [(PXActionPerformer *)self presentViewController:v9];
}

- (void)performUserInteractionTask
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __76__PXPhotoKitAssetCollectionDeleteActionPerformer_performUserInteractionTask__block_invoke;
  v2[3] = &unk_1E5DD2188;
  v2[4] = self;
  [(PXPhotoKitAssetCollectionDeleteActionPerformer *)self _promptDeleteConfirmationWithCompletionHandler:v2];
}

void __76__PXPhotoKitAssetCollectionDeleteActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, int a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    id v4 = [v3 assetCollection];
    v5 = [*(id *)(a1 + 32) undoManager];
    uint64_t v6 = [[PXDeleteCollectionsAction alloc] initWithCollection:v4];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __76__PXPhotoKitAssetCollectionDeleteActionPerformer_performUserInteractionTask__block_invoke_2;
    v10[3] = &unk_1E5DD2570;
    v10[4] = *(void *)(a1 + 32);
    id v11 = v4;
    id v7 = v4;
    [(PXAction *)v6 executeWithUndoManager:v5 completionHandler:v10];
    v8 = (void *)MEMORY[0x1E4F56658];
    uint64_t v12 = *MEMORY[0x1E4F56548];
    v13[0] = v7;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    [v8 sendEvent:@"com.apple.photos.CPAnalytics.albumDeleted" withPayload:v9];
  }
  else
  {
    [v3 completeUserInteractionTaskWithSuccess:0 error:0];
  }
}

void __76__PXPhotoKitAssetCollectionDeleteActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, char a2, void *a3)
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