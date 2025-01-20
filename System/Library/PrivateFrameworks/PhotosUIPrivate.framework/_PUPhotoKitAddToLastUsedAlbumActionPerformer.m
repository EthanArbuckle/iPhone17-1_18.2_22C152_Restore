@interface _PUPhotoKitAddToLastUsedAlbumActionPerformer
+ (Class)pxActionPerformerClass;
- (id)pxActionType;
@end

@implementation _PUPhotoKitAddToLastUsedAlbumActionPerformer

- (id)pxActionType
{
  return (id)*MEMORY[0x1E4F90C18];
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

@end