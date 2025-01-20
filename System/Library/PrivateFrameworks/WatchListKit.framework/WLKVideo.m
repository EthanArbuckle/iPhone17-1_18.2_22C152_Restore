@interface WLKVideo
+ (id)videosWithDictionaries:(id)a3;
- (NSString)ID;
- (NSString)externalID;
- (NSString)title;
- (WLKArtworkVariantListing)images;
- (WLKVideo)initWithDictionary:(id)a3;
- (WLKVideoAsset)asset;
- (unint64_t)duration;
@end

@implementation WLKVideo

+ (id)videosWithDictionaries:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
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
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        v11 = [WLKVideo alloc];
        v12 = -[WLKVideo initWithDictionary:](v11, "initWithDictionary:", v10, (void)v16);
        if (v12) {
          [v4 addObject:v12];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  if ([v4 count]) {
    v13 = v4;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  return v14;
}

- (WLKVideo)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v21.receiver = self;
    v21.super_class = (Class)WLKVideo;
    id v5 = [(WLKVideo *)&v21 init];
    if (v5)
    {
      uint64_t v6 = objc_msgSend(v4, "wlk_stringForKey:", @"id");
      ID = v5->_ID;
      v5->_ID = (NSString *)v6;

      uint64_t v8 = objc_msgSend(v4, "wlk_stringForKey:", @"externalId");
      externalID = v5->_externalID;
      v5->_externalID = (NSString *)v8;

      uint64_t v10 = objc_msgSend(v4, "wlk_stringForKey:", @"title");
      title = v5->_title;
      v5->_title = (NSString *)v10;

      v12 = objc_msgSend(v4, "wlk_dictionaryForKey:", @"assets");
      if (v12)
      {
        v13 = [[WLKVideoAsset alloc] initWithDictionary:v12];
        asset = v5->_asset;
        v5->_asset = v13;
      }
      v15 = objc_msgSend(v4, "wlk_dictionaryForKey:", @"images");
      long long v16 = [[WLKArtworkVariantListing alloc] initWithArtworkDictionary:v15];
      images = v5->_images;
      v5->_images = v16;

      long long v18 = objc_msgSend(v4, "wlk_numberForKey:", @"duration");
      v5->_duration = [v18 unsignedIntegerValue];
    }
    self = v5;
    long long v19 = self;
  }
  else
  {
    long long v19 = 0;
  }

  return v19;
}

- (NSString)ID
{
  return self->_ID;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (WLKArtworkVariantListing)images
{
  return self->_images;
}

- (WLKVideoAsset)asset
{
  return self->_asset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_externalID, 0);

  objc_storeStrong((id *)&self->_ID, 0);
}

@end