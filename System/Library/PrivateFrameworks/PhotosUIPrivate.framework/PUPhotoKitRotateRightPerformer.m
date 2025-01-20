@interface PUPhotoKitRotateRightPerformer
+ (Class)pxActionPerformerClass;
- (id)pxActionType;
@end

@implementation PUPhotoKitRotateRightPerformer

- (id)pxActionType
{
  return (id)*MEMORY[0x1E4F90C90];
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

@end