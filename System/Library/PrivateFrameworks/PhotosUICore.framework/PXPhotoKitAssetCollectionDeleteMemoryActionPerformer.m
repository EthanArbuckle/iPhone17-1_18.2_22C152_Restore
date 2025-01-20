@interface PXPhotoKitAssetCollectionDeleteMemoryActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (BOOL)isActionDestructive;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (void)_promptDeleteMemoryConfirmationWithCompletionHandler:(id)a3;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionDeleteMemoryActionPerformer

- (void)performBackgroundTask
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v4 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v18);
    v19 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
    [v15 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 1000, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetCollection", v17, v19 object file lineNumber description];
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    [v15 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 1000, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetCollection", v17 object file lineNumber description];
  }

LABEL_3:
  v5 = +[PXMemoriesRelatedSettings sharedInstance];
  uint64_t v6 = [v5 deleteBehavior];

  v7 = PLMemoriesGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = @"delete";
    if (v6 != 1) {
      v8 = 0;
    }
    if (!v6) {
      v8 = @"reject";
    }
    v9 = v8;
    *(_DWORD *)buf = 138412546;
    v26 = v9;
    __int16 v27 = 2112;
    v28 = v4;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Will %@ memory: %@", buf, 0x16u);
  }
  if (v6 == 1)
  {
    v12 = [[PXDeleteCollectionsAction alloc] initWithCollection:v4];
  }
  else if (v6)
  {
    v12 = 0;
  }
  else
  {
    v10 = [PXRejectMemoriesAction alloc];
    v24 = v4;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    v12 = [(PXMemoriesAction *)v10 initWithMemories:v11];
  }
  v13 = [(PXActionPerformer *)self undoManager];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __77__PXPhotoKitAssetCollectionDeleteMemoryActionPerformer_performBackgroundTask__block_invoke;
  v20[3] = &unk_1E5DC63E8;
  v22 = self;
  uint64_t v23 = v6;
  id v21 = v4;
  id v14 = v4;
  [(PXAction *)v12 executeWithUndoManager:v13 completionHandler:v20];
}

void __77__PXPhotoKitAssetCollectionDeleteMemoryActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PLMemoriesGetLog();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      v9 = @"delete";
      if (v8 != 1) {
        v9 = 0;
      }
      if (v8) {
        v10 = v9;
      }
      else {
        v10 = @"reject";
      }
      v11 = v10;
      uint64_t v12 = *(void *)(a1 + 32);
      int v21 = 138412546;
      v22 = v11;
      __int16 v23 = 2112;
      uint64_t v24 = v12;
      v13 = "Did %@ memory: %@";
      id v14 = v7;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 22;
LABEL_16:
      _os_log_impl(&dword_1A9AE7000, v14, v15, v13, (uint8_t *)&v21, v16);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = *(void *)(a1 + 48);
    v18 = @"delete";
    if (v17 != 1) {
      v18 = 0;
    }
    if (v17) {
      v19 = v18;
    }
    else {
      v19 = @"reject";
    }
    v11 = v19;
    uint64_t v20 = *(void *)(a1 + 32);
    int v21 = 138412802;
    v22 = v11;
    __int16 v23 = 2112;
    uint64_t v24 = v20;
    __int16 v25 = 2112;
    id v26 = v5;
    v13 = "Failed to %@ memory: %@, error: %@";
    id v14 = v7;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    uint32_t v16 = 32;
    goto LABEL_16;
  }

  [*(id *)(a1 + 40) completeBackgroundTaskWithSuccess:a2 error:v5];
}

- (void)performUserInteractionTask
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __82__PXPhotoKitAssetCollectionDeleteMemoryActionPerformer_performUserInteractionTask__block_invoke;
  v2[3] = &unk_1E5DD2188;
  v2[4] = self;
  [(PXPhotoKitAssetCollectionDeleteMemoryActionPerformer *)self _promptDeleteMemoryConfirmationWithCompletionHandler:v2];
}

uint64_t __82__PXPhotoKitAssetCollectionDeleteMemoryActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, int a2)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v3 = (void *)MEMORY[0x1E4F56658];
    v10[0] = *MEMORY[0x1E4F56548];
    v4 = [*(id *)(a1 + 32) assetCollection];
    v11[0] = v4;
    v10[1] = *MEMORY[0x1E4F56560];
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    v11[1] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    [v3 sendEvent:@"com.apple.photos.CPAnalytics.assetCollectionDeleted" withPayload:v7];

    return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:1 error:0];
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    return [v9 completeUserInteractionTaskWithSuccess:0 error:0];
  }
}

- (void)_promptDeleteMemoryConfirmationWithCompletionHandler:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  if (!v6)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 980, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetCollection", v11 object file lineNumber description];
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
    [v9 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 980, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetCollection", v11, v13 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  v14[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v8 = [(PXActionPerformer *)self presentationEnvironment];
  PXMemoriesDeleteConfirmationAlertShow(v7, v8, v5);
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:a3 actionType:a4 activityType:@"PXActivityTypeDeleteMemory" systemImageName:a5];
}

+ (BOOL)isActionDestructive
{
  return 1;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"trash";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return PXLocalizedStringFromTable(@"InteractiveMemoryCardActionMenuItemDelete", @"PhotosUICore");
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  v4 = [a3 assetCollection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end