@interface PUPhotoKitMoveToPersonalLibraryActionPerformer
+ (Class)pxActionPerformerClass;
- (id)pxActionType;
@end

@implementation PUPhotoKitMoveToPersonalLibraryActionPerformer

- (id)pxActionType
{
  return (id)*MEMORY[0x1E4F90D10];
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

@end