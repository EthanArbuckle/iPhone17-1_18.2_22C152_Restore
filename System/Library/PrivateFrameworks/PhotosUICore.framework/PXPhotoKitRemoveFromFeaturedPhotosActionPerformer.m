@interface PXPhotoKitRemoveFromFeaturedPhotosActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (BOOL)isActionDestructive;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (void)performBackgroundTask;
@end

@implementation PXPhotoKitRemoveFromFeaturedPhotosActionPerformer

+ (BOOL)isActionDestructive
{
  return 1;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"rectangle.badge.minus";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PXLocalizedStringFromTable(@"PXPhotoKitRemoveFromFeaturedPhotosActionPerformer_Title", @"PhotosUICore");
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v6 = a4;
  if (objc_msgSend(v6, "px_isSuggestion")) {
    char v7 = 1;
  }
  else {
    char v7 = objc_msgSend(v6, "px_isFeaturedPhotosCollection");
  }

  return v7;
}

- (void)performBackgroundTask
{
  v3 = [PXRemoveAssetsFromFeaturedPhotosAction alloc];
  v4 = [(PXPhotoKitAssetActionPerformer *)self assets];
  v5 = [(PXAssetsAction *)v3 initWithAssets:v4];

  id v6 = [(PXActionPerformer *)self undoManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PXPhotoKitRemoveFromFeaturedPhotosActionPerformer_performBackgroundTask__block_invoke;
  v7[3] = &unk_1E5DD3158;
  v7[4] = self;
  [(PXAction *)v5 executeWithUndoManager:v6 completionHandler:v7];
}

uint64_t __74__PXPhotoKitRemoveFromFeaturedPhotosActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:a3];
}

@end