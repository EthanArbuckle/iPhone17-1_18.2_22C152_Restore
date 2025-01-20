@interface PUPhotoKitRestoreActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
- (int64_t)destructivePhotosAction;
@end

@implementation PUPhotoKitRestoreActionPerformer

- (int64_t)destructivePhotosAction
{
  return 3;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(a4, "isTrashBin", a3);
}

@end