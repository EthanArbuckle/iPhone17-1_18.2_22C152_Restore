@interface PUPhotoKitDestructiveActionsPerformer
- (BOOL)shouldConfirmDestructiveAction;
- (int64_t)destructivePhotosAction;
- (void)deletePhotosActionController:(id)a3 dismissConfirmationViewController:(id)a4;
- (void)deletePhotosActionController:(id)a3 presentConfirmationViewController:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PUPhotoKitDestructiveActionsPerformer

- (void)deletePhotosActionController:(id)a3 dismissConfirmationViewController:(id)a4
{
}

- (void)deletePhotosActionController:(id)a3 presentConfirmationViewController:(id)a4
{
  if (![(PUAssetActionPerformer *)self presentViewController:a4])
  {
    v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_ERROR, "Failed to present delete confirmation. User must confirm to perform removal.", v7, 2u);
    }

    v6 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to present delete confirmation");
    [(PUAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v6];
  }
}

- (void)performUserInteractionTask
{
  int64_t v3 = [(PUPhotoKitDestructiveActionsPerformer *)self destructivePhotosAction];
  v4 = [(PUAssetActionPerformer *)self assets];
  id v5 = objc_alloc(MEMORY[0x1E4F90488]);
  v6 = [(PUAssetActionPerformer *)self undoManager];
  v7 = (void *)[v5 initWithAction:v3 assets:v4 undoManager:v6 delegate:self];

  objc_msgSend(v7, "setShouldSkipDeleteConfirmation:", -[PUPhotoKitDestructiveActionsPerformer shouldConfirmDestructiveAction](self, "shouldConfirmDestructiveAction") ^ 1);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__PUPhotoKitDestructiveActionsPerformer_performUserInteractionTask__block_invoke;
  v13[3] = &unk_1E5F2E200;
  v13[4] = self;
  v13[5] = v14;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__PUPhotoKitDestructiveActionsPerformer_performUserInteractionTask__block_invoke_2;
  v9[3] = &unk_1E5F298B8;
  v11 = v14;
  v9[4] = self;
  id v8 = v4;
  id v10 = v8;
  int64_t v12 = v3;
  [v7 performWithWillDeleteHandler:v13 completionHandler:v9];

  _Block_object_dispose(v14, 8);
}

uint64_t __67__PUPhotoKitDestructiveActionsPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) state];
  if (result == 10)
  {
    [*(id *)(a1 + 32) instantlyExcludeAssetsFromDataSource];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    int64_t v3 = *(void **)(a1 + 32);
    return [v3 completeUserInteractionTaskWithSuccess:1 error:0];
  }
  return result;
}

void __67__PUPhotoKitDestructiveActionsPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0 && *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    [*(id *)(a1 + 32) stopExcludingAssetsFromDataSource];
  }
  uint64_t v4 = [*(id *)(a1 + 32) state];
  id v5 = *(void **)(a1 + 32);
  if (v4 == 10)
  {
    [v5 completeUserInteractionTaskWithSuccess:a2 error:0];
  }
  else if ([v5 state] == 20)
  {
    [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:0];
  }
  if (a2 && [*(id *)(a1 + 40) count])
  {
    v6 = PXCPAnalyticsEventNameForDeletePhotosAction();
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E4F56658];
      v11[0] = *MEMORY[0x1E4F56560];
      id v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      v11[1] = *MEMORY[0x1E4F56558];
      v12[0] = v9;
      v12[1] = *(void *)(a1 + 40);
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
      [v7 sendEvent:v6 withPayload:v10];
    }
  }
}

- (BOOL)shouldConfirmDestructiveAction
{
  return 1;
}

- (int64_t)destructivePhotosAction
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"PUPhotoKitAssetActionManager.m", 825, @"Concrete subclass must implement %@", v5 object file lineNumber description];

  return 0;
}

@end