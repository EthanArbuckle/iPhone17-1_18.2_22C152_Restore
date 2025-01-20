@interface PXLikeSharedAlbumAssetsAction
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
+ (BOOL)currentValueForAssets:(id)a3;
+ (BOOL)toggledValueForAssets:(id)a3;
- (BOOL)isLike;
- (PXLikeSharedAlbumAssetsAction)initWithAssets:(id)a3;
- (PXLikeSharedAlbumAssetsAction)initWithAssets:(id)a3 like:(BOOL)a4;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (int64_t)mediaType;
- (void)markAssetsAsLiked:(BOOL)a3 completionHandler:(id)a4;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXLikeSharedAlbumAssetsAction

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (BOOL)isLike
{
  return self->_like;
}

- (void)markAssetsAsLiked:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, uint64_t, void))a4;
  v7 = (void *)MEMORY[0x1E4F1CA80];
  v8 = [(PXAssetsAction *)self assets];
  v9 = objc_msgSend(v7, "setWithCapacity:", objc_msgSend(v8, "count"));

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v10 = [(PXAssetsAction *)self assets];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v14), "pl_managedAsset");
        if (v15) {
          [v9 addObject:v15];
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }

  if ([v9 count])
  {
    id v23 = 0;
    int v16 = [MEMORY[0x1E4F8AAB0] canSetUserCloudSharedLiked:v4 forAssets:v9 error:&v23];
    id v17 = v23;
    if (v16)
    {
      v18 = [v9 anyObject];
      v19 = [v18 photoLibrary];

      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __69__PXLikeSharedAlbumAssetsAction_markAssetsAsLiked_completionHandler___block_invoke;
      v20[3] = &unk_1E5DCFE98;
      id v21 = v9;
      BOOL v22 = v4;
      [v19 performTransaction:v20];
      v6[2](v6, 1, 0);
    }
    else
    {
      ((void (**)(id, uint64_t, id))v6)[2](v6, 0, v17);
    }
  }
  else
  {
    v6[2](v6, 0, 0);
  }
}

void __69__PXLikeSharedAlbumAssetsAction_markAssetsAsLiked_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setUserCloudSharedLiked:", *(unsigned __int8 *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  [(PXLikeSharedAlbumAssetsAction *)self markAssetsAsLiked:[(PXLikeSharedAlbumAssetsAction *)self isLike] ^ 1 completionHandler:v4];
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  [(PXLikeSharedAlbumAssetsAction *)self markAssetsAsLiked:[(PXLikeSharedAlbumAssetsAction *)self isLike] completionHandler:v4];
}

- (id)actionNameLocalizationKey
{
  BOOL v3 = [(PXLikeSharedAlbumAssetsAction *)self isLike];
  id v4 = [(PXAssetsAction *)self assets];
  uint64_t v5 = [v4 count];

  uint64_t v6 = [(PXLikeSharedAlbumAssetsAction *)self mediaType];
  if (v3)
  {
    if (v5 != 1)
    {
      long long v7 = @"LIKE_ALL_PHOTOS_BUTTON_TITLE";
      long long v8 = @"LIKE_ALL_VIDEOS_BUTTON_TITLE";
      long long v9 = @"LIKE_ALL_ITEMS_BUTTON_TITLE";
      goto LABEL_9;
    }
    long long v8 = @"LIKE_VIDEO_BUTTON_TITLE";
    long long v7 = @"LIKE_PHOTO_BUTTON_TITLE";
  }
  else
  {
    if (v5 != 1)
    {
      long long v7 = @"UNLIKE_ALL_PHOTOS_BUTTON_TITLE";
      long long v8 = @"UNLIKE_ALL_VIDEOS_BUTTON_TITLE";
      long long v9 = @"UNLIKE_ALL_ITEMS_BUTTON_TITLE";
      goto LABEL_9;
    }
    long long v8 = @"UNLIKE_VIDEO_BUTTON_TITLE";
    long long v7 = @"UNLIKE_PHOTO_BUTTON_TITLE";
  }
  long long v9 = v7;
LABEL_9:
  long long v10 = PXLocalizationKeyForMediaType(v6, v7, v8, v9);
  return v10;
}

- (id)actionIdentifier
{
  return @"LikeAssetsInSharedAlbum";
}

- (PXLikeSharedAlbumAssetsAction)initWithAssets:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[PXLikeSharedAlbumAssetsAction initWithAssets:like:](self, "initWithAssets:like:", v4, [(id)objc_opt_class() toggledValueForAssets:v4]);

  return v5;
}

- (PXLikeSharedAlbumAssetsAction)initWithAssets:(id)a3 like:(BOOL)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXLikeSharedAlbumAssetsAction;
  long long v7 = [(PXAssetsAction *)&v9 initWithAssets:v6];
  if (v7)
  {
    v7->_like = a4;
    PXMediaTypeForAssets();
  }

  return 0;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return [a3 isCloudSharedAsset];
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

uint64_t __55__PXLikeSharedAlbumAssetsAction_toggledValueForAssets___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isCloudSharedAsset])
  {
    id v3 = objc_msgSend(v2, "pl_managedAsset");
    uint64_t v4 = [v3 userCloudSharedLiked] ^ 1;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end