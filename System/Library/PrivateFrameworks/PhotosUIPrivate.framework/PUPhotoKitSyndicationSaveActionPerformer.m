@interface PUPhotoKitSyndicationSaveActionPerformer
+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4;
+ (Class)pxActionPerformerClass;
- (id)pxActionType;
@end

@implementation PUPhotoKitSyndicationSaveActionPerformer

- (id)pxActionType
{
  return (id)*MEMORY[0x1E4F90DB0];
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(a3, "px_isUnsavedSyndicatedAsset");
}

@end