@interface PUPhotoKitMoveToSharedLibraryActionPerformer
+ (Class)pxActionPerformerClass;
- (id)pxActionType;
@end

@implementation PUPhotoKitMoveToSharedLibraryActionPerformer

- (id)pxActionType
{
  return (id)*MEMORY[0x1E4F90D18];
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

@end