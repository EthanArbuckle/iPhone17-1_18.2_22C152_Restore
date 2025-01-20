@interface PUPhotoKitCopyActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
- (void)_performCopy;
- (void)performUserInteractionTask;
@end

@implementation PUPhotoKitCopyActionPerformer

- (void)_performCopy
{
  v3 = (void *)PXDefaultAssetSharingHelperClass();
  v4 = [(PUAssetActionPerformer *)self assets];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PUPhotoKitCopyActionPerformer__performCopy__block_invoke;
  v5[3] = &unk_1E5F2E3B8;
  v5[4] = self;
  [v3 copyAssets:v4 completionHandler:v5];
}

uint64_t __45__PUPhotoKitCopyActionPerformer__performCopy__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:a2 error:a3];
}

- (void)performUserInteractionTask
{
  v3 = (void *)MEMORY[0x1E4F90698];
  v4 = [(PUAssetActionPerformer *)self assets];
  LODWORD(v3) = [v3 confidentialWarningRequiredForAssets:v4];

  if (v3)
  {
    v7[4] = self;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__PUPhotoKitCopyActionPerformer_performUserInteractionTask__block_invoke;
    v8[3] = &unk_1E5F2BF98;
    v8[4] = self;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__PUPhotoKitCopyActionPerformer_performUserInteractionTask__block_invoke_2;
    v7[3] = &unk_1E5F2BF98;
    v5 = [MEMORY[0x1E4F90698] confidentialityAlertWithConfirmAction:v8 abortAction:v7];
    if (![(PUAssetActionPerformer *)self presentViewController:v5])
    {
      v6 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to present confidentiality alert");
      [(PUAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v6];
    }
  }
  else
  {
    [(PUPhotoKitCopyActionPerformer *)self _performCopy];
  }
}

uint64_t __59__PUPhotoKitCopyActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performCopy];
}

void __59__PUPhotoKitCopyActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"User cancelled because of confidentiality alert");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 completeUserInteractionTaskWithSuccess:0 error:v2];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v5 = a4;
  if ([a3 isPhoto]) {
    int v6 = [v5 isTrashBin] ^ 1;
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

@end