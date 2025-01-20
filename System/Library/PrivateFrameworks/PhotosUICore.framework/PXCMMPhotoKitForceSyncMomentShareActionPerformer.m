@interface PXCMMPhotoKitForceSyncMomentShareActionPerformer
- (BOOL)canPerformActionWithSession:(id)a3;
- (void)performBackgroundTask;
@end

@implementation PXCMMPhotoKitForceSyncMomentShareActionPerformer

- (void)performBackgroundTask
{
  v4 = [(PXCMMActionPerformer *)self session];
  v5 = [v4 momentShare];

  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXCMMPhotoKitForceSyncMomentShareActionPerformer.m", 41, @"Invalid parameter not satisfying: %@", @"momentShare" object file lineNumber description];
  }
  if ([v5 status] != 1 && objc_msgSend(v5, "status") != 3)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXCMMPhotoKitForceSyncMomentShareActionPerformer.m", 42, @"Invalid parameter not satisfying: %@", @"momentShare.status == PHShareStatusOwned || momentShare.status == PHShareStatusAccepted" object file lineNumber description];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__PXCMMPhotoKitForceSyncMomentShareActionPerformer_performBackgroundTask__block_invoke;
  v8[3] = &unk_1E5DD2D68;
  v8[4] = self;
  [v5 forceSyncMomentShareWithCompletion:v8];
}

void __73__PXCMMPhotoKitForceSyncMomentShareActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  px_dispatch_on_main_queue();
}

uint64_t __73__PXCMMPhotoKitForceSyncMomentShareActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", *(void *)(a1 + 40) == 0);
}

- (BOOL)canPerformActionWithSession:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 momentShare];
    v5 = v4;
    if (v4) {
      BOOL v6 = [v4 status] == 1 || objc_msgSend(v5, "status") == 3;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end