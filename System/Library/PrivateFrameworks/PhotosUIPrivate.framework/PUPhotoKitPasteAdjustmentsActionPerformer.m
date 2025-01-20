@interface PUPhotoKitPasteAdjustmentsActionPerformer
+ (Class)pxActionPerformerClass;
- (id)pxActionType;
@end

@implementation PUPhotoKitPasteAdjustmentsActionPerformer

- (id)pxActionType
{
  return (id)*MEMORY[0x1E4F90D28];
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

@end