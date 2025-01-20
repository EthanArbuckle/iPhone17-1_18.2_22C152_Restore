@interface SXRelatedWebViewCache
- (NSMapTable)cache;
- (SXRelatedWebViewCache)init;
- (id)relatedWebViewForBaseURL:(id)a3;
- (void)storeRelatedWebView:(id)a3 baseURL:(id)a4;
@end

@implementation SXRelatedWebViewCache

- (SXRelatedWebViewCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)SXRelatedWebViewCache;
  v2 = [(SXRelatedWebViewCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    cache = v2->_cache;
    v2->_cache = (NSMapTable *)v3;
  }
  return v2;
}

- (id)relatedWebViewForBaseURL:(id)a3
{
  id v4 = a3;
  v5 = [(SXRelatedWebViewCache *)self cache];
  objc_super v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)storeRelatedWebView:(id)a3 baseURL:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    if (v6)
    {
      v7 = [(SXRelatedWebViewCache *)self relatedWebViewForBaseURL:v6];

      if (!v7)
      {
        v8 = [(SXRelatedWebViewCache *)self cache];
        [v8 setObject:v9 forKey:v6];
      }
    }
  }
}

- (NSMapTable)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
}

@end