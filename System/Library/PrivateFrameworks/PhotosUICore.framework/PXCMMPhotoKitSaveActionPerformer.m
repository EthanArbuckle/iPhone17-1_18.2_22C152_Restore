@interface PXCMMPhotoKitSaveActionPerformer
- (BOOL)isCancellable;
- (id)createActionProgress;
- (void)performUserInteractionTask;
@end

@implementation PXCMMPhotoKitSaveActionPerformer

- (void)performUserInteractionTask
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(PXCMMActionPerformer *)self session];
  v4 = [v3 viewModel];
  v5 = [v4 selectionManager];
  v6 = [v5 selectionSnapshot];

  v7 = [v6 allItemsEnumerator];
  if ([v7 count])
  {
    v8 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v9 = [v3 importSessionID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__PXCMMPhotoKitSaveActionPerformer_performUserInteractionTask__block_invoke;
    v11[3] = &unk_1E5DD3158;
    v11[4] = self;
    PXMomentShareSaveAssetsToLibrary(v7, 1, v8, v9, v11);
  }
  else
  {
    v10 = PLSharingGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = objc_opt_class();
      __int16 v14 = 2048;
      v15 = self;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "<%@:%p> Failed to perform action: Selection contained no assets to save", buf, 0x16u);
    }

    v8 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Selection contained no assets to save");
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v8];
  }
}

uint64_t __62__PXCMMPhotoKitSaveActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:1 error:0];
}

- (BOOL)isCancellable
{
  return 0;
}

- (id)createActionProgress
{
  return 0;
}

@end