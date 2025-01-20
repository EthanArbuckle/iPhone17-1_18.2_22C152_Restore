@interface PUPhotoKitAutoEnhanceActionPerformer
+ (Class)pxActionPerformerClass;
- (id)pxActionType;
@end

@implementation PUPhotoKitAutoEnhanceActionPerformer

- (id)pxActionType
{
  return (id)*MEMORY[0x1E4F90C70];
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

@end