@interface PUPhotoKitMoveToPersonalLibraryFromSuggestionActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
+ (Class)pxActionPerformerClass;
- (id)pxActionType;
- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4;
@end

@implementation PUPhotoKitMoveToPersonalLibraryFromSuggestionActionPerformer

- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4) {
    [(PUPhotoKitActionPerformer *)self forceIncludeAssetsInDataSource];
  }
  v7.receiver = self;
  v7.super_class = (Class)PUPhotoKitMoveToPersonalLibraryFromSuggestionActionPerformer;
  [(PUAssetActionPerformer *)&v7 completeUserInteractionTaskWithSuccess:v4 error:v6];
}

- (id)pxActionType
{
  return (id)*MEMORY[0x1E4F90D10];
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((objc_msgSend(v7, "px_isSharedLibrarySharingSuggestion") & 1) != 0
    || objc_msgSend(v7, "px_isSharedLibrarySharingSuggestionsSmartAlbum"))
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___PUPhotoKitMoveToPersonalLibraryFromSuggestionActionPerformer;
    unsigned __int8 v8 = objc_msgSendSuper2(&v10, sel_canPerformOnAsset_inAssetCollection_, v6, v7);
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

@end