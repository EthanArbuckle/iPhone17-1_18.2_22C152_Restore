@interface PXFavoriteAssetsAction
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
+ (BOOL)currentValueForAssets:(id)a3;
+ (BOOL)toggledValueForAssets:(id)a3;
- (BOOL)isFavorite;
- (PXFavoriteAssetsAction)initWithAssets:(id)a3;
- (PXFavoriteAssetsAction)initWithAssets:(id)a3 favorite:(BOOL)a4;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXFavoriteAssetsAction

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXFavoriteAssetsAction *)self isFavorite];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__PXFavoriteAssetsAction_performUndo___block_invoke;
  v6[3] = &__block_descriptor_33_e30_v16__0__PHAssetChangeRequest_8l;
  BOOL v7 = !v5;
  [(PXAssetsAction *)self performAssetChanges:v6 completionHandler:v4];
}

uint64_t __38__PXFavoriteAssetsAction_performUndo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFavorite:*(unsigned __int8 *)(a1 + 32)];
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXFavoriteAssetsAction *)self isFavorite];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__PXFavoriteAssetsAction_performAction___block_invoke;
  v6[3] = &__block_descriptor_33_e30_v16__0__PHAssetChangeRequest_8l;
  BOOL v7 = v5;
  [(PXAssetsAction *)self performAssetChanges:v6 completionHandler:v4];
}

uint64_t __40__PXFavoriteAssetsAction_performAction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFavorite:*(unsigned __int8 *)(a1 + 32)];
}

- (id)actionNameLocalizationKey
{
  if ([(PXFavoriteAssetsAction *)self isFavorite]) {
    v2 = @"PXAddToFavoritesActionName";
  }
  else {
    v2 = @"PXRemoveFromFavoritesActionName";
  }
  return v2;
}

- (id)actionIdentifier
{
  return @"FavoriteAssets";
}

- (PXFavoriteAssetsAction)initWithAssets:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[PXFavoriteAssetsAction initWithAssets:favorite:](self, "initWithAssets:favorite:", v4, [(id)objc_opt_class() toggledValueForAssets:v4]);

  return v5;
}

- (PXFavoriteAssetsAction)initWithAssets:(id)a3 favorite:(BOOL)a4
{
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  BOOL v7 = __50__PXFavoriteAssetsAction_initWithAssets_favorite___block_invoke;
  v8 = &__block_descriptor_33_e17_B16__0__PHAsset_8l;
  BOOL v9 = a4;
  PXFilter();
}

BOOL __50__PXFavoriteAssetsAction_initWithAssets_favorite___block_invoke(uint64_t a1, void *a2)
{
  return *(unsigned __int8 *)(a1 + 32) != [a2 isFavorite];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5
    && [v5 canPerformEditOperation:3]
    && ([v5 isTrashed] & 1) == 0
    && ![v5 isRecoveredAsset])
  {
    LOBYTE(v7) = 1;
  }
  else if (objc_msgSend(v5, "px_isUnsavedSyndicatedAsset"))
  {
    int v7 = objc_msgSend(v5, "px_isSyndicationPhotoLibraryAsset") ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (BOOL)currentValueForAssets:(id)a3
{
  id v4 = a3;
  if ([v4 count]) {
    int v5 = [a1 toggledValueForAssets:v4] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (BOOL)toggledValueForAssets:(id)a3
{
  id v3 = a3;
  if ([v3 count]) {
    PXExists();
  }

  return 1;
}

uint64_t __48__PXFavoriteAssetsAction_toggledValueForAssets___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isFavorite] ^ 1;
}

@end