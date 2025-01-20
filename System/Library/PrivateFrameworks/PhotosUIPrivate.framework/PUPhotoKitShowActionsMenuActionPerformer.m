@interface PUPhotoKitShowActionsMenuActionPerformer
+ (Class)pxActionPerformerClass;
- (id)pxActionType;
@end

@implementation PUPhotoKitShowActionsMenuActionPerformer

- (id)pxActionType
{
  return (id)*MEMORY[0x1E4F90D78];
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

@end