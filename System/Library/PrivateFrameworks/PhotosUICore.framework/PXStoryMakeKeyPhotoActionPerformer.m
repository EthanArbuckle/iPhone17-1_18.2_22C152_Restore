@interface PXStoryMakeKeyPhotoActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
- (BOOL)shouldPreventTargetedDismissalAnimation;
- (void)performUserInteractionTask;
@end

@implementation PXStoryMakeKeyPhotoActionPerformer

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PXLocalizedStringFromTable(@"InteractiveMemoryActionTitle_MakeKeyPhoto", @"PhotosUICore");
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v7 = a5;
  v8 = (void *)MEMORY[0x1E4FB13F0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__PXStoryMakeKeyPhotoActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke;
  v12[3] = &unk_1E5DC8470;
  id v13 = v7;
  id v9 = v7;
  v10 = [v8 actionWithTitle:a3 image:a4 identifier:0 handler:v12];

  return v10;
}

uint64_t __81__PXStoryMakeKeyPhotoActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return a3 != 0;
}

- (void)performUserInteractionTask
{
  v3 = [(PXPhotoKitAssetActionPerformer *)self assetsByAssetCollection];
  v4 = [v3 allKeys];
  id v10 = [v4 firstObject];

  v5 = [(PXPhotoKitAssetActionPerformer *)self assetsByAssetCollection];
  v6 = [v5 objectForKeyedSubscript:v10];
  id v7 = [v6 firstObject];

  v8 = [(PXStoryAssetActionPerformer *)self storyViewActionPerformer];
  id v9 = v8;
  if (v8) {
    [v8 makeAssetKeyPhoto:v7];
  }
  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:v9 != 0 error:0];
}

- (BOOL)shouldPreventTargetedDismissalAnimation
{
  return 1;
}

@end