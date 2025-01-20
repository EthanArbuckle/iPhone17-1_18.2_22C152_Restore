@interface PUPhotoKitRevertAdjustmentsActionPerformer
+ (Class)pxActionPerformerClass;
- (id)pxActionType;
@end

@implementation PUPhotoKitRevertAdjustmentsActionPerformer

- (id)pxActionType
{
  return (id)*MEMORY[0x1E4F90D68];
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

@end