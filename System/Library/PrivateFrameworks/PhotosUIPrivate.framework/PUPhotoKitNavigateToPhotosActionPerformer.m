@interface PUPhotoKitNavigateToPhotosActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PUPhotoKitNavigateToPhotosActionPerformer

- (void)performUserInteractionTask
{
  v3 = [(PUAssetActionPerformer *)self assets];
  v4 = [v3 lastObject];

  objc_initWeak(&location, self);
  v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__PUPhotoKitNavigateToPhotosActionPerformer_performUserInteractionTask__block_invoke;
  v6[3] = &unk_1E5F2D940;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "px_navigateToMomentsViewRevealingAsset:completionHandler:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __71__PUPhotoKitNavigateToPhotosActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained completeUserInteractionTaskWithSuccess:a2 error:v5];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return 1;
}

@end