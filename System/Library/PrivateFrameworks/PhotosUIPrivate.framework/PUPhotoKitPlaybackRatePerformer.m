@interface PUPhotoKitPlaybackRatePerformer
+ (Class)pxActionPerformerClass;
- (id)pxActionType;
@end

@implementation PUPhotoKitPlaybackRatePerformer

- (id)pxActionType
{
  return (id)*MEMORY[0x1E4F90C80];
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

@end