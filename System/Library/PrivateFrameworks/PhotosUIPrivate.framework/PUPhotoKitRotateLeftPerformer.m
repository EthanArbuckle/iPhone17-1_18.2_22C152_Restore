@interface PUPhotoKitRotateLeftPerformer
+ (Class)pxActionPerformerClass;
- (id)pxActionType;
@end

@implementation PUPhotoKitRotateLeftPerformer

- (id)pxActionType
{
  return (id)*MEMORY[0x1E4F90C88];
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

@end