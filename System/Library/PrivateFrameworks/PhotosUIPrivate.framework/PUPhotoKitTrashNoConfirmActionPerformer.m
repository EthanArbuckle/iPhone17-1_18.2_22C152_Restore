@interface PUPhotoKitTrashNoConfirmActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
- (BOOL)shouldConfirmDestructiveAction;
- (int64_t)destructivePhotosAction;
@end

@implementation PUPhotoKitTrashNoConfirmActionPerformer

- (BOOL)shouldConfirmDestructiveAction
{
  return 0;
}

- (int64_t)destructivePhotosAction
{
  return 1;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return _PUCanTrashAssetFromAssetCollection(a3, a4);
}

@end