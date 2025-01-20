@interface PUPhotoKitCopyAdjustmentsSkippingOptionsActionPerformer
+ (Class)pxActionPerformerClass;
- (id)pxActionType;
@end

@implementation PUPhotoKitCopyAdjustmentsSkippingOptionsActionPerformer

- (id)pxActionType
{
  return (id)*MEMORY[0x1E4F90C58];
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

@end