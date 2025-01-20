@interface PUPhotoKitRestoreNoConfirmActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
- (BOOL)shouldConfirmDestructiveAction;
- (int64_t)destructivePhotosAction;
@end

@implementation PUPhotoKitRestoreNoConfirmActionPerformer

- (BOOL)shouldConfirmDestructiveAction
{
  return 0;
}

- (int64_t)destructivePhotosAction
{
  return 4;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(a4, "isTrashBin", a3);
}

@end