@interface PUPhotoKitRecoverActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
- (int64_t)destructivePhotosAction;
@end

@implementation PUPhotoKitRecoverActionPerformer

- (int64_t)destructivePhotosAction
{
  return 2;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(a4, "px_isRecoveredSmartAlbum", a3);
}

@end