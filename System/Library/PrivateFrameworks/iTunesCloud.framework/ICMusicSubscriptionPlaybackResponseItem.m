@interface ICMusicSubscriptionPlaybackResponseItem
- (ICMusicSubscriptionPlaybackResponseItem)initWithItemResponseDictionary:(id)a3 urlBag:(id)a4;
- (ICStoreHLSAssetInfo)hlsAsset;
- (NSArray)fileAssets;
- (NSDate)assetExpirationDate;
- (id)fileAssetWithFlavorType:(int64_t)a3;
- (int64_t)storeAdamID;
- (void)setAssetExpirationDate:(id)a3;
@end

@implementation ICMusicSubscriptionPlaybackResponseItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetExpirationDate, 0);
  objc_storeStrong((id *)&self->_urlBag, 0);

  objc_storeStrong((id *)&self->_itemResponseDictionary, 0);
}

- (void)setAssetExpirationDate:(id)a3
{
}

- (NSDate)assetExpirationDate
{
  return self->_assetExpirationDate;
}

- (id)fileAssetWithFlavorType:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(ICMusicSubscriptionPlaybackResponseItem *)self fileAssets];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 flavorType] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (int64_t)storeAdamID
{
  v2 = [(NSDictionary *)self->_itemResponseDictionary objectForKey:@"songId"];
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 longLongValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (ICStoreHLSAssetInfo)hlsAsset
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [[ICStoreHLSAssetInfo alloc] initWithItemResponseDictionary:self->_itemResponseDictionary];
  uint64_t v4 = [(ICStoreHLSAssetInfo *)v3 keyServerURL];
  if (!v4
    || (uint64_t v5 = (void *)v4,
        [(ICStoreHLSAssetInfo *)v3 keyCertificateURL],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    uint64_t v7 = [(ICStoreHLSAssetInfo *)v3 keyServerProtocolType];
    v8 = v7;
    if (v7 == @"simplified") {
      int v9 = 1;
    }
    else {
      int v9 = [(__CFString *)v7 isEqual:@"simplified"];
    }

    id v10 = [(ICURLBag *)self->_urlBag enhancedAudioConfiguration];
    v11 = [(ICStoreHLSAssetInfo *)v3 keyServerURL];

    if (!v11)
    {
      if (v9 && ([v10 keyServerURL], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        long long v13 = (void *)v12;
        long long v14 = [v10 keyServerURL];
      }
      else
      {
        long long v14 = [(ICURLBag *)self->_urlBag urlForBagKey:@"fps-request"];
      }
      [(ICStoreHLSAssetInfo *)v3 setKeyServerURL:v14];
    }
    long long v15 = [(ICStoreHLSAssetInfo *)v3 keyCertificateURL];

    if (!v15)
    {
      if (v9 && ([v10 certificateURL], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v17 = (void *)v16;
        v18 = [v10 certificateURL];
      }
      else
      {
        v18 = [(ICURLBag *)self->_urlBag urlForBagKey:@"fps-cert"];
      }
      [(ICStoreHLSAssetInfo *)v3 setKeyCertificateURL:v18];
    }
  }
  if ([(ICMusicSubscriptionPlaybackResponseItem *)self storeAdamID])
  {
    v19 = objc_msgSend(NSNumber, "numberWithLongLong:", -[ICMusicSubscriptionPlaybackResponseItem storeAdamID](self, "storeAdamID"));
    [(ICStoreHLSAssetInfo *)v3 setKeyServerAdamID:v19];

    goto LABEL_27;
  }
  v20 = [(ICStoreHLSAssetInfo *)v3 keyServerURL];
  if (v20)
  {
  }
  else
  {
    v21 = [(ICStoreHLSAssetInfo *)v3 keyCertificateURL];

    if (!v21) {
      goto LABEL_27;
    }
  }
  v22 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    itemResponseDictionary = self->_itemResponseDictionary;
    int v25 = 138543618;
    v26 = self;
    __int16 v27 = 2114;
    v28 = itemResponseDictionary;
    _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_ERROR, "%{public}@ Payload contains HLS asset without an adam ID, which is unexpected: %{public}@", (uint8_t *)&v25, 0x16u);
  }

LABEL_27:

  return v3;
}

- (NSArray)fileAssets
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(NSDictionary *)self->_itemResponseDictionary objectForKey:@"assets"];
  if (_NSIsNSArray())
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = v3;
    uint64_t v5 = [(ICStoreFileAssetInfo *)v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            v11 = [ICStoreFileAssetInfo alloc];
            uint64_t v12 = -[ICStoreFileAssetInfo initWithFileAssetResponseDictionary:](v11, "initWithFileAssetResponseDictionary:", v10, (void)v14);
            [(ICStoreFileAssetInfo *)v12 setExpectedProtectionType:3];
            if (v12)
            {
              if (!v7) {
                uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[ICStoreFileAssetInfo count](v4, "count"));
              }
              [v7 addObject:v12];
            }
          }
        }
        uint64_t v6 = [(ICStoreFileAssetInfo *)v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v6);
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v4 = [[ICStoreFileAssetInfo alloc] initWithFileAssetResponseDictionary:self->_itemResponseDictionary];
    uint64_t v7 = [(ICStoreFileAssetInfo *)v4 assetURL];

    if (v7)
    {
      v18 = v4;
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    }
  }

  return (NSArray *)v7;
}

- (ICMusicSubscriptionPlaybackResponseItem)initWithItemResponseDictionary:(id)a3 urlBag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ICMusicSubscriptionPlaybackResponseItem *)self init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    itemResponseDictionary = v8->_itemResponseDictionary;
    v8->_itemResponseDictionary = (NSDictionary *)v9;

    objc_storeStrong((id *)&v8->_urlBag, a4);
  }

  return v8;
}

@end