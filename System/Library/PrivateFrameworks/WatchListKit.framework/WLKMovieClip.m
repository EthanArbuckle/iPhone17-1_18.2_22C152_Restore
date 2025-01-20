@interface WLKMovieClip
+ (id)movieClipsWithArray:(id)a3;
- (NSArray)assets;
- (NSString)hlsUrl;
- (NSString)title;
- (WLKMovieClip)init;
- (WLKMovieClip)initWithDictionary:(id)a3;
- (WLKMovieClipAsset)preferredAsset;
- (WLKMovieClipPreviewArtwork)previewArtwork;
- (id)_init;
- (id)preferredURL;
@end

@implementation WLKMovieClip

+ (id)movieClipsWithArray:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (v10)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v11 = v10;
              v12 = [WLKMovieClip alloc];
              v13 = -[WLKMovieClip initWithDictionary:](v12, "initWithDictionary:", v11, (void)v16);

              [v4 addObject:v13];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    v14 = (void *)[v4 copy];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (WLKMovieClip)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(WLKMovieClip *)self _init];
    if (v5)
    {
      uint64_t v6 = objc_msgSend(v4, "wlk_stringForKey:", @"title");
      uint64_t v7 = [v6 copy];
      uint64_t v8 = (void *)v5[1];
      v5[1] = v7;

      v9 = objc_msgSend(v4, "wlk_dictionaryForKey:", @"previewArtwork");
      if (v9)
      {
        v10 = [[WLKMovieClipPreviewArtwork alloc] initWithDictionary:v9];
        id v11 = (void *)v5[2];
        v5[2] = v10;
      }
      v12 = objc_msgSend(v4, "wlk_arrayForKey:", @"clipAssets");
      if (v12)
      {
        v13 = +[WLKMovieClipAsset movieClipAssetsWithArray:v12];
        uint64_t v14 = [v13 copy];
        v15 = (void *)v5[3];
        v5[3] = v14;
      }
      uint64_t v16 = objc_msgSend(v4, "wlk_stringForKey:", @"hlsUrl");
      long long v17 = (void *)v5[4];
      v5[4] = v16;
    }
    self = v5;
    long long v18 = self;
  }
  else
  {
    long long v18 = 0;
  }

  return v18;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)WLKMovieClip;
  return [(WLKMovieClip *)&v3 init];
}

- (WLKMovieClip)init
{
  return 0;
}

- (WLKMovieClipAsset)preferredAsset
{
  v17[4] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__9;
  v15 = __Block_byref_object_dispose__9;
  id v16 = 0;
  v17[0] = @"1080pHdVideo";
  v17[1] = @"720pHdVideo";
  v17[2] = @"sd480pVideo";
  v17[3] = @"sdVideo";
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __30__WLKMovieClip_preferredAsset__block_invoke;
  v10[3] = &unk_1E620BE78;
  v10[4] = self;
  v10[5] = &v11;
  [v3 enumerateObjectsUsingBlock:v10];
  id v4 = (void *)v12[5];
  if (!v4)
  {
    id v5 = [(WLKMovieClip *)self assets];
    uint64_t v6 = [v5 firstObject];
    uint64_t v7 = (void *)v12[5];
    v12[5] = v6;

    id v4 = (void *)v12[5];
  }
  id v8 = v4;

  _Block_object_dispose(&v11, 8);

  return (WLKMovieClipAsset *)v8;
}

void __30__WLKMovieClip_preferredAsset__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  uint64_t v7 = [*(id *)(a1 + 32) assets];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __30__WLKMovieClip_preferredAsset__block_invoke_2;
  v10[3] = &unk_1E620BE50;
  uint64_t v8 = *(void *)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = v8;
  uint64_t v13 = a4;
  id v9 = v6;
  [v7 enumerateObjectsUsingBlock:v10];
}

void __30__WLKMovieClip_preferredAsset__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v7 = [v9 flavor];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
    **(unsigned char **)(a1 + 48) = 1;
  }
}

- (id)preferredURL
{
  objc_super v3 = [(WLKMovieClip *)self hlsUrl];
  if (!v3)
  {
    id v4 = [(WLKMovieClip *)self preferredAsset];
    objc_super v3 = [v4 url];
  }

  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (WLKMovieClipPreviewArtwork)previewArtwork
{
  return self->_previewArtwork;
}

- (NSArray)assets
{
  return self->_assets;
}

- (NSString)hlsUrl
{
  return self->_hlsUrl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hlsUrl, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_previewArtwork, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end