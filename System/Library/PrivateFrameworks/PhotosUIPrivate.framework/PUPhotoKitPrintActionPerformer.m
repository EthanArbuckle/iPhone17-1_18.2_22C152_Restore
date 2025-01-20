@interface PUPhotoKitPrintActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PUPhotoKitPrintActionPerformer

- (void)performUserInteractionTask
{
  v3 = (void *)PXDefaultAssetSharingHelperClass();
  v4 = [(PUAssetActionPerformer *)self assets];
  uint64_t v5 = *MEMORY[0x1E4F9F3C0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__PUPhotoKitPrintActionPerformer_performUserInteractionTask__block_invoke;
  v6[3] = &unk_1E5F299D0;
  v6[4] = self;
  [v3 prepareAssets:v4 forActivityType:v5 completion:v6];
}

void __60__PUPhotoKitPrintActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:a3];
  }
  else
  {
    v6 = [MEMORY[0x1E4F42D10] sharedPrintController];
    v7 = PXDefaultPrintInfo();
    [v6 setPrintInfo:v7];

    [v6 setPrintingItems:v5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__PUPhotoKitPrintActionPerformer_performUserInteractionTask__block_invoke_2;
    v8[3] = &unk_1E5F299A8;
    v8[4] = *(void *)(a1 + 32);
    [v6 presentAnimated:1 completionHandler:v8];
  }
}

uint64_t __60__PUPhotoKitPrintActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:");
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v4 = a4;
  if ([MEMORY[0x1E4F42D10] isPrintingAvailable]) {
    int v5 = [v4 isTrashBin] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

@end