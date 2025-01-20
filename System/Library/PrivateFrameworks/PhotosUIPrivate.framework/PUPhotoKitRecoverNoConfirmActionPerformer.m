@interface PUPhotoKitRecoverNoConfirmActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
- (BOOL)shouldConfirmDestructiveAction;
- (int64_t)destructivePhotosAction;
@end

@implementation PUPhotoKitRecoverNoConfirmActionPerformer

- (BOOL)shouldConfirmDestructiveAction
{
  return 0;
}

- (int64_t)destructivePhotosAction
{
  return 2;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(a4, "px_isRecoveredSmartAlbum", a3);
}

@end