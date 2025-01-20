@interface PUPhotoKitReviewActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
- (void)_enterReviewMode;
- (void)performUserInteractionTask;
@end

@implementation PUPhotoKitReviewActionPerformer

- (void)_enterReviewMode
{
  v4 = [(PUAssetActionPerformer *)self assets];
  id v19 = [v4 firstObject];

  v5 = objc_msgSend(v19, "pl_managedAsset");
  v6 = [v19 burstIdentifier];
  if (!v6)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"PUPhotoKitAssetActionManager.m" lineNumber:1862 description:@"Current asset must have an avalanche UUID"];
  }
  id v7 = objc_alloc(MEMORY[0x1E4F8A6B8]);
  v8 = [v5 photoLibrary];
  v9 = (void *)[v7 initWithUUID:v6 photoLibrary:v8];

  v10 = objc_alloc_init(PUAvalancheReviewControllerSpec);
  v11 = [(PUAssetActionPerformer *)self assetsByAssetCollection];
  v12 = [v11 allKeys];
  v13 = [v12 firstObject];
  v14 = objc_msgSend(v13, "pl_assetContainer");

  v15 = [PUAvalancheReviewController alloc];
  v16 = [v19 photoLibrary];
  v17 = [(PUAvalancheReviewController *)v15 initWithSpec:v10 startingAtAsset:v5 inAvalanche:v9 currentAssetContainer:v14 photoLibrary:v16];

  [(PUAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:[(PUAssetActionPerformer *)self presentViewController:v17] error:0];
}

- (void)performUserInteractionTask
{
  v4 = [(PUAssetActionPerformer *)self assets];
  uint64_t v5 = [v4 count];

  if (v5 != 1)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PUPhotoKitAssetActionManager.m" lineNumber:1854 description:@"There can be only one asset in a Review action"];
  }
  [(PUPhotoKitReviewActionPerformer *)self _enterReviewMode];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v5 = a4;
  if ([a3 representsBurst]) {
    char v6 = [v5 canShowAvalancheStacks];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

@end