@interface PXPhotoKitShowActionsMenuAssetActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4;
@end

@implementation PXPhotoKitShowActionsMenuAssetActionPerformer

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  if (a3) {
    return [a3 isPhotoIrisPlaceholder] ^ 1;
  }
  else {
    return 0;
  }
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v4 = a3;
  char v5 = [v4 isPhotoIrisPlaceholder];
  char v6 = [v4 canPerformSharingAction];

  return v6 | v5;
}

@end