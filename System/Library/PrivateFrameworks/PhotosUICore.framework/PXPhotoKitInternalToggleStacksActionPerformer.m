@interface PXPhotoKitInternalToggleStacksActionPerformer
+ (BOOL)canPerformWithActionManager:(id)a3;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitInternalToggleStacksActionPerformer

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return @"Toggle Stacks";
}

+ (BOOL)canPerformWithActionManager:(id)a3
{
  v3 = +[PXRootSettings sharedInstance];
  int v4 = [v3 canShowInternalUI];

  if (!v4) {
    return 0;
  }
  v5 = +[PXPhotosGridSettings sharedInstance];
  char v6 = [v5 enableStacksReviewUI];

  return v6;
}

- (void)performUserInteractionTask
{
  id v5 = [(PXPhotoKitAssetActionPerformer *)self photoKitDataSourceManager];
  uint64_t v3 = [v5 includeAllBurstAssets] ^ 1;
  int v4 = [(PXPhotoKitAssetActionPerformer *)self photoKitDataSourceManager];
  [v4 setIncludeAllBurstAssets:v3];
}

@end