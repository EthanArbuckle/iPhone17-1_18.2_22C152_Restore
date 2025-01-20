@interface PUPhotoKitCopyAdjustmentsActionPerformer
+ (Class)pxActionPerformerClass;
- (id)pxActionType;
@end

@implementation PUPhotoKitCopyAdjustmentsActionPerformer

- (id)pxActionType
{
  return (id)*MEMORY[0x1E4F90C50];
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

@end