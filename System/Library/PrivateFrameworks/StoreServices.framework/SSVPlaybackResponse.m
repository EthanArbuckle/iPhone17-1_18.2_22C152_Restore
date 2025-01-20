@interface SSVPlaybackResponse
- (NSArray)items;
- (NSDictionary)responseDictionary;
- (NSHTTPURLResponse)URLResponse;
- (NSURL)fallbackStreamingKeyCertificateURL;
- (NSURL)fallbackStreamingKeyServerURL;
- (SSVPlaybackResponse)initWithDictionary:(id)a3 URLResponse:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)itemForItemIdentifier:(id)a3;
- (void)_enumerateItemsUsingBlock:(id)a3;
- (void)setFallbackStreamingKeyCertificateURL:(id)a3;
- (void)setFallbackStreamingKeyServerURL:(id)a3;
@end

@implementation SSVPlaybackResponse

- (SSVPlaybackResponse)initWithDictionary:(id)a3 URLResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SSVPlaybackResponse;
  v8 = [(SSVPlaybackResponse *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    responseDictionary = v8->_responseDictionary;
    v8->_responseDictionary = (NSDictionary *)v9;

    objc_storeStrong((id *)&v8->_urlResponse, a4);
  }

  return v8;
}

- (id)itemForItemIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__SSVPlaybackResponse_itemForItemIdentifier___block_invoke;
  v8[3] = &unk_1E5BA8568;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [(SSVPlaybackResponse *)self _enumerateItemsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __45__SSVPlaybackResponse_itemForItemIdentifier___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 itemIdentifier];
  int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (NSArray)items
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__SSVPlaybackResponse_items__block_invoke;
  v6[3] = &unk_1E5BA8590;
  id v4 = v3;
  id v7 = v4;
  [(SSVPlaybackResponse *)self _enumerateItemsUsingBlock:v6];

  return (NSArray *)v4;
}

uint64_t __28__SSVPlaybackResponse_items__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSDictionary *)self->_responseDictionary copyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSHTTPURLResponse *)self->_urlResponse copyWithZone:a3];
  id v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)_enumerateItemsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self->_responseDictionary objectForKey:@"songList"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__SSVPlaybackResponse__enumerateItemsUsingBlock___block_invoke;
    v6[3] = &unk_1E5BA85B8;
    void v6[4] = self;
    id v7 = v4;
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

void __49__SSVPlaybackResponse__enumerateItemsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [[SSVPlaybackItem alloc] initWithItemDictionary:v6];
    id v4 = [*(id *)(a1 + 32) fallbackStreamingKeyCertificateURL];
    [(SSVPlaybackItem *)v3 setFallbackStreamingKeyCertificateURL:v4];

    id v5 = [*(id *)(a1 + 32) fallbackStreamingKeyServerURL];
    [(SSVPlaybackItem *)v3 setFallbackStreamingKeyServerURL:v5];

    if (v3) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (NSHTTPURLResponse)URLResponse
{
  return self->_urlResponse;
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
  objc_storeStrong((id *)&self->_urlResponse, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end