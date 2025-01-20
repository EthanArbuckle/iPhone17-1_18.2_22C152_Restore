@interface PXPhotoKitRemoveNoConfirmAssetActionPerformer
+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5;
- (BOOL)shouldSkipUserConfirmation;
@end

@implementation PXPhotoKitRemoveNoConfirmAssetActionPerformer

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  return 0;
}

- (BOOL)shouldSkipUserConfirmation
{
  return 1;
}

@end