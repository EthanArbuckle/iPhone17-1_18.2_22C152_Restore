@interface PXPhotoKitTrashNoConfirmAssetActionPerformer
+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5;
- (BOOL)shouldSkipUserConfirmation;
- (int64_t)destructivePhotosAction;
@end

@implementation PXPhotoKitTrashNoConfirmAssetActionPerformer

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  return 0;
}

- (int64_t)destructivePhotosAction
{
  return 1;
}

- (BOOL)shouldSkipUserConfirmation
{
  return 1;
}

@end