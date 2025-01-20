@interface PUPhotoKitAudioMixModePerformer
+ (Class)pxActionPerformerClass;
- (id)pxActionType;
@end

@implementation PUPhotoKitAudioMixModePerformer

- (id)pxActionType
{
  return (id)*MEMORY[0x1E4F90C78];
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

@end