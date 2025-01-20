@interface PXCMMPhotoKitAcceptMomentShareActionPerformer
- (BOOL)canPerformActionWithSession:(id)a3;
- (void)performBackgroundTask;
@end

@implementation PXCMMPhotoKitAcceptMomentShareActionPerformer

- (void)performBackgroundTask
{
  v4 = [(PXCMMActionPerformer *)self session];
  v5 = [v4 momentShare];

  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXCMMPhotoKitAcceptMomentShareActionPerformer.m", 43, @"Invalid parameter not satisfying: %@", @"momentShare" object file lineNumber description];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PXCMMPhotoKitAcceptMomentShareActionPerformer_performBackgroundTask__block_invoke;
  v7[3] = &unk_1E5DD3158;
  v7[4] = self;
  PXMomentShareAcceptIfNeeded(v5, v7);
}

uint64_t __70__PXCMMPhotoKitAcceptMomentShareActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:a3];
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
      BOOL v6 = [v4 status] == 2;
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