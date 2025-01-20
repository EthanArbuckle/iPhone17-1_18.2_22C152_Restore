@interface SSVPlaybackItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isiTunesStoreStream;
- (NSArray)assets;
- (NSDictionary)itemDictionary;
- (NSURL)HLSKeyCertificateURL;
- (NSURL)HLSKeyServerURL;
- (NSURL)HLSPlaylistURL;
- (NSURL)fallbackStreamingKeyCertificateURL;
- (NSURL)fallbackStreamingKeyServerURL;
- (SSVPlaybackItem)initWithItemDictionary:(id)a3;
- (id)assetForFlavor:(id)a3;
- (id)description;
- (id)itemIdentifier;
- (unint64_t)hash;
- (void)_enumerateAssetsUsingBlock:(id)a3;
- (void)setFallbackStreamingKeyCertificateURL:(id)a3;
- (void)setFallbackStreamingKeyServerURL:(id)a3;
@end

@implementation SSVPlaybackItem

- (SSVPlaybackItem)initWithItemDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSVPlaybackItem;
  v5 = [(SSVPlaybackItem *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    itemDictionary = v5->_itemDictionary;
    v5->_itemDictionary = (NSDictionary *)v6;
  }
  return v5;
}

- (id)assetForFlavor:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__28;
  v15 = __Block_byref_object_dispose__28;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__SSVPlaybackItem_assetForFlavor___block_invoke;
  v8[3] = &unk_1E5BAB428;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [(SSVPlaybackItem *)self _enumerateAssetsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __34__SSVPlaybackItem_assetForFlavor___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 flavor];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (NSArray)assets
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __25__SSVPlaybackItem_assets__block_invoke;
  v6[3] = &unk_1E5BAB450;
  id v4 = v3;
  id v7 = v4;
  [(SSVPlaybackItem *)self _enumerateAssetsUsingBlock:v6];

  return (NSArray *)v4;
}

uint64_t __25__SSVPlaybackItem_assets__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (NSURL)HLSKeyCertificateURL
{
  v3 = [(NSDictionary *)self->_itemDictionary objectForKey:@"hls-key-cert-url"];
  if (![v3 isNSString]
    || ([MEMORY[0x1E4F1CB10] URLWithString:v3],
        (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = [(SSVPlaybackItem *)self fallbackStreamingKeyCertificateURL];
  }

  return (NSURL *)v4;
}

- (NSURL)HLSKeyServerURL
{
  v3 = [(NSDictionary *)self->_itemDictionary objectForKey:@"hls-key-server-url"];
  if (![v3 isNSString]
    || ([MEMORY[0x1E4F1CB10] URLWithString:v3],
        (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = [(SSVPlaybackItem *)self fallbackStreamingKeyServerURL];
  }

  return (NSURL *)v4;
}

- (NSURL)HLSPlaylistURL
{
  v2 = [(NSDictionary *)self->_itemDictionary objectForKey:@"hls-playlist-url"];
  if ([v2 isNSString])
  {
    v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (BOOL)isiTunesStoreStream
{
  v2 = [(NSDictionary *)self->_itemDictionary objectForKey:@"is-itunes-stream"];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (id)itemIdentifier
{
  return [(NSDictionary *)self->_itemDictionary objectForKey:@"songId"];
}

- (id)description
{
  char v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)SSVPlaybackItem;
  id v4 = [(SSVPlaybackItem *)&v9 description];
  id v5 = [(SSVPlaybackItem *)self itemIdentifier];
  id v6 = [(SSVPlaybackItem *)self assets];
  id v7 = [v3 stringWithFormat:@"%@ [ID: %@, Assets: %@]", v4, v5, v6];

  return v7;
}

- (unint64_t)hash
{
  char v3 = [(SSVPlaybackItem *)self itemIdentifier];
  id v4 = v3;
  if (v3)
  {
    id v5 = (id)[v3 hash];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SSVPlaybackItem;
    id v5 = [(SSVPlaybackItem *)&v8 hash];
  }
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = [(SSVPlaybackItem *)self itemIdentifier];
    objc_super v8 = [v4 itemIdentifier];
    char v6 = [v7 isEqual:v8];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)_enumerateAssetsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSDictionary *)self->_itemDictionary objectForKey:@"assets"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__SSVPlaybackItem__enumerateAssetsUsingBlock___block_invoke;
    v6[3] = &unk_1E5BAB478;
    id v7 = v4;
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

void __46__SSVPlaybackItem__enumerateAssetsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = [[SSVPlaybackAsset alloc] initWithAssetDictionary:v4];
    if (v3) {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (NSDictionary)itemDictionary
{
  return self->_itemDictionary;
}

- (NSURL)fallbackStreamingKeyServerURL
{
  return self->_fallbackStreamingKeyServerURL;
}

- (void)setFallbackStreamingKeyServerURL:(id)a3
{
}

- (NSURL)fallbackStreamingKeyCertificateURL
{
  return self->_fallbackStreamingKeyCertificateURL;
}

- (void)setFallbackStreamingKeyCertificateURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackStreamingKeyCertificateURL, 0);
  objc_storeStrong((id *)&self->_fallbackStreamingKeyServerURL, 0);
  objc_storeStrong((id *)&self->_itemDictionary, 0);
}

@end