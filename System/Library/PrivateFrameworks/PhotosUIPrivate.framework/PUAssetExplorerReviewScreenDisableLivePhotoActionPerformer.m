@interface PUAssetExplorerReviewScreenDisableLivePhotoActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4;
@end

@implementation PUAssetExplorerReviewScreenDisableLivePhotoActionPerformer

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return 1;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1F07FCDA8]) {
    char v5 = [v4 isLivePhoto];
  }
  else {
    char v5 = [v4 playbackStyle] == 3;
  }

  return v5;
}

@end