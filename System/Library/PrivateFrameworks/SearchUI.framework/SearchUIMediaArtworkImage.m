@interface SearchUIMediaArtworkImage
- (Class)classForCoder;
- (NSString)persistentID;
- (NSString)spotlightIdentifier;
- (NSString)universalLibraryID;
- (SearchUIMediaArtworkImage)initWithSFImage:(id)a3;
- (SearchUIMediaArtworkImage)initWithSpotlightIdentifier:(id)a3;
- (int64_t)mediaEntityType;
- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5;
- (void)setMediaEntityType:(int64_t)a3;
- (void)setPersistentID:(id)a3;
- (void)setSpotlightIdentifier:(id)a3;
- (void)setUniversalLibraryID:(id)a3;
@end

@implementation SearchUIMediaArtworkImage

- (SearchUIMediaArtworkImage)initWithSFImage:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SearchUIMediaArtworkImage;
  v5 = [(SearchUIImage *)&v10 initWithSFImage:v4];
  if (v5)
  {
    v6 = [v4 persistentID];
    [(SearchUIMediaArtworkImage *)v5 setPersistentID:v6];

    v7 = [v4 universalLibraryID];
    [(SearchUIMediaArtworkImage *)v5 setUniversalLibraryID:v7];

    v8 = [v4 spotlightIdentifier];
    [(SearchUIMediaArtworkImage *)v5 setSpotlightIdentifier:v8];

    -[SearchUIMediaArtworkImage setMediaEntityType:](v5, "setMediaEntityType:", +[SearchUIMediaPlayerUtilities MPMediaEntityTypeForSFMediaEntityType:](SearchUIMediaPlayerUtilities, "MPMediaEntityTypeForSFMediaEntityType:", [v4 mediaEntityType]));
    [(SearchUIImage *)v5 setSupportsFastPathShadow:1];
  }

  return v5;
}

- (SearchUIMediaArtworkImage)initWithSpotlightIdentifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchUIMediaArtworkImage;
  v5 = [(SearchUIMediaArtworkImage *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(SearchUIMediaArtworkImage *)v5 setSpotlightIdentifier:v4];
    [(SearchUIImage *)v6 setSupportsFastPathShadow:1];
  }

  return v6;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__SearchUIMediaArtworkImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke;
  v9[3] = &unk_1E6E73740;
  double v11 = a3;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  +[SearchUIUtilities dispatchAsyncIfNecessary:v9];
}

void __78__SearchUIMediaArtworkImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) universalLibraryID];
  if (v2)
  {
    v3 = (void *)v2;
    id v4 = [*(id *)(a1 + 32) universalLibraryID];
    uint64_t v5 = [v4 length];

    if (v5)
    {
      int64_t v6 = +[SearchUIMediaPlayerUtilities MPMediaGroupingForMPMediaEntityType:](SearchUIMediaPlayerUtilities, "MPMediaGroupingForMPMediaEntityType:", [*(id *)(a1 + 32) mediaEntityType]);
      id v7 = [MEMORY[0x1E4F31928] ULIDPropertyForGroupingType:v6];
      id v8 = objc_opt_new();
      v9 = (void *)MEMORY[0x1E4F31968];
      id v10 = [*(id *)(a1 + 32) universalLibraryID];
      double v11 = [v9 predicateWithValue:v10 forProperty:v7];

      [v8 setGroupingType:v6];
      [v8 addFilterPredicate:v11];
      goto LABEL_7;
    }
  }
  uint64_t v12 = [*(id *)(a1 + 32) persistentID];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [*(id *)(a1 + 32) persistentID];
    uint64_t v15 = [v14 length];

    if (v15)
    {
      int64_t v16 = +[SearchUIMediaPlayerUtilities MPMediaGroupingForMPMediaEntityType:](SearchUIMediaPlayerUtilities, "MPMediaGroupingForMPMediaEntityType:", [*(id *)(a1 + 32) mediaEntityType]);
      id v7 = +[SearchUIMediaPlayerUtilities filterPropertyForMPMediaEntityType:](SearchUIMediaPlayerUtilities, "filterPropertyForMPMediaEntityType:", [*(id *)(a1 + 32) mediaEntityType]);
      id v8 = objc_opt_new();
      v17 = (void *)MEMORY[0x1E4F31968];
      v18 = objc_opt_new();
      v19 = [*(id *)(a1 + 32) persistentID];
      v20 = [v18 numberFromString:v19];
      double v11 = [v17 predicateWithValue:v20 forProperty:v7];

      [v8 setGroupingType:v16];
      [v8 addFilterPredicate:v11];
      if (![*(id *)(a1 + 32) mediaEntityType])
      {
        v21 = [v8 items];
LABEL_8:
        v22 = v21;
        v23 = [v21 firstObject];

        if (v23) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
LABEL_7:
      v21 = [v8 collections];
      goto LABEL_8;
    }
  }
LABEL_9:
  v24 = [MEMORY[0x1E4F31940] defaultMediaLibrary];
  v25 = [*(id *)(a1 + 32) spotlightIdentifier];
  v23 = [v24 entityWithSpotlightIdentifier:v25];

  if (!v23)
  {
LABEL_19:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_20;
  }
LABEL_10:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_11:
    uint64_t v26 = [v23 artworkCatalog];
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_18:
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_19;
    }
    goto LABEL_11;
  }
  v27 = [v23 artworkCatalog];
  if (v27) {
    goto LABEL_16;
  }
  uint64_t v26 = [v23 tiledArtworkCatalogWithRows:2 columns:2];
LABEL_12:
  v27 = (void *)v26;
  if (!v26) {
    goto LABEL_18;
  }
LABEL_16:
  [MEMORY[0x1E4FAE100] maxThumbnailSize];
  objc_msgSend(v27, "setFittingSize:", v28, v28);
  [v27 setDestinationScale:*(double *)(a1 + 48)];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __78__SearchUIMediaArtworkImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2;
  v29[3] = &unk_1E6E74048;
  id v30 = *(id *)(a1 + 40);
  [v27 requestImageWithCompletion:v29];

LABEL_20:
}

uint64_t __78__SearchUIMediaArtworkImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)persistentID
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPersistentID:(id)a3
{
}

- (NSString)universalLibraryID
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setUniversalLibraryID:(id)a3
{
}

- (NSString)spotlightIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSpotlightIdentifier:(id)a3
{
}

- (int64_t)mediaEntityType
{
  return self->_mediaEntityType;
}

- (void)setMediaEntityType:(int64_t)a3
{
  self->_mediaEntityType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_universalLibraryID, 0);
  objc_storeStrong((id *)&self->_persistentID, 0);
}

@end