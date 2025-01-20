@interface PXPhotoKitAssetCollectionRenameActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (void)_reallyPerformUserInteractionTask;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionRenameActionPerformer

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"pencil";
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:a3 actionType:a4 activityType:@"PXActivityTypeRenameAlbum" systemImageName:a5];
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  v5 = objc_msgSend(a4, "assetCollection", a3);
  v6 = PXCollectionRenameActionLocalizedTitle(v5);

  return v6;
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  v6 = [a3 assetCollection];
  if (!v6)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionRenameActionPerformer.m", 30, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v11 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v12);
    v13 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v9 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionRenameActionPerformer.m", 30, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v11, v13 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  char v7 = [v6 canPerformEditOperation:7];

  return v7;
}

- (void)_reallyPerformUserInteractionTask
{
  v3 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  v4 = [(PXActionPerformer *)self undoManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__PXPhotoKitAssetCollectionRenameActionPerformer__reallyPerformUserInteractionTask__block_invoke;
  v7[3] = &unk_1E5DD3158;
  v7[4] = self;
  v5 = PXCollectionRenameActionAlertController(v3, v4, v7);

  if (![(PXActionPerformer *)self presentViewController:v5])
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to present asset collection rename alert");
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v6];
  }
}

uint64_t __83__PXPhotoKitAssetCollectionRenameActionPerformer__reallyPerformUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:a2 error:a3];
}

- (void)performUserInteractionTask
{
  v4 = +[PXContentSyndicationAssetSavingHelper assetSavingHelperFromAssetCollectionActionPerformer:self];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__PXPhotoKitAssetCollectionRenameActionPerformer_performUserInteractionTask__block_invoke;
  v5[3] = &unk_1E5DB3498;
  v5[4] = self;
  v5[5] = a2;
  [v4 performSaveActionIfNeededOnUnsavedSyndicatedAssetsWithCompletion:v5];
}

void __76__PXPhotoKitAssetCollectionRenameActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v9 = PLSyndicationUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [v8 localizedDescription];
      int v14 = 138412290;
      v15 = v10;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "Rename Album: Error processing unsaved syndicated assets: %@", (uint8_t *)&v14, 0xCu);
    }
    v11 = *(void **)(a1 + 32);
    id v12 = v8;
    goto LABEL_5;
  }
  if (a2 < 3)
  {
    [*(id *)(a1 + 32) _reallyPerformUserInteractionTask];
    goto LABEL_10;
  }
  if (a2 == 4)
  {
    v11 = *(void **)(a1 + 32);
    id v12 = 0;
LABEL_5:
    [v11 completeUserInteractionTaskWithSuccess:0 error:v12];
    goto LABEL_10;
  }
  if (a2 == 3)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"PXPhotoKitAssetCollectionRenameActionPerformer.m" lineNumber:55 description:@"Code which should be unreachable has been reached"];

    abort();
  }
LABEL_10:
}

@end