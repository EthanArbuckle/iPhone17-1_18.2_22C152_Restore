@interface PUPhotoKitTrashActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
- (int64_t)destructivePhotosAction;
@end

@implementation PUPhotoKitTrashActionPerformer

- (int64_t)destructivePhotosAction
{
  return 0;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return _PUCanTrashAssetFromAssetCollection(a3, a4);
}

@end