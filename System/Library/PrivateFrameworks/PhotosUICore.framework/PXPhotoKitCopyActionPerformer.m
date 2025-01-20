@interface PXPhotoKitCopyActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (void)_performCopy;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitCopyActionPerformer

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"doc.on.doc";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  v4 = NSString;
  if (a3 > 2) {
    v5 = 0;
  }
  else {
    v5 = off_1E5DB8B58[a3];
  }
  v6 = v5;
  v7 = [v4 stringWithFormat:@"PXPhotoKitAssetActionManager%@Title_Copy", v6];

  v8 = PXLocalizedStringFromTable(v7, @"PhotosUICore");

  return v8;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)[MEMORY[0x1E4FB13F0] actionWithTitle:a3 image:a4 identifier:0 handler:a5];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v6 = a3;
  if ([v6 isPhoto] && (objc_msgSend(v6, "isTrashed") & 1) == 0) {
    int v7 = [v6 isRecoveredAsset] ^ 1;
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)_performCopy
{
  id v3 = PXDefaultAssetSharingHelperClass();
  v4 = [(PXPhotoKitAssetActionPerformer *)self assets];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PXPhotoKitCopyActionPerformer__performCopy__block_invoke;
  v5[3] = &unk_1E5DD3158;
  v5[4] = self;
  [v3 copyAssets:v4 completionHandler:v5];
}

uint64_t __45__PXPhotoKitCopyActionPerformer__performCopy__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:a2 error:a3];
}

- (void)performUserInteractionTask
{
  id v3 = [(PXPhotoKitAssetActionPerformer *)self assets];
  BOOL v4 = +[PXSharingConfidentialityController confidentialWarningRequiredForAssets:v3];

  if (v4)
  {
    v7[4] = self;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__PXPhotoKitCopyActionPerformer_performUserInteractionTask__block_invoke;
    v8[3] = &unk_1E5DD0030;
    v8[4] = self;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__PXPhotoKitCopyActionPerformer_performUserInteractionTask__block_invoke_2;
    v7[3] = &unk_1E5DD0030;
    v5 = +[PXSharingConfidentialityController confidentialityAlertWithConfirmAction:v8 abortAction:v7];
    if (![(PXActionPerformer *)self presentViewController:v5])
    {
      id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to present confidentiality alert");
      [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v6];
    }
  }
  else
  {
    [(PXPhotoKitCopyActionPerformer *)self _performCopy];
  }
}

uint64_t __59__PXPhotoKitCopyActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performCopy];
}

void __59__PXPhotoKitCopyActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"User cancelled because of confidentiality alert");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 completeUserInteractionTaskWithSuccess:0 error:v2];
}

@end