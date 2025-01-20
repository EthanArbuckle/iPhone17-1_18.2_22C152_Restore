@interface TouchIconFetcher
- (TouchIconFetcher)initWithWebView:(id)a3;
- (id)_webProcessActivityProxy;
- (void)_setUpTouchIconFetcherObserver;
- (void)didFetchTouchIconURLs:(id)a3 forURL:(id)a4;
- (void)fetchTouchIconURLsWithCompletion:(id)a3;
- (void)invalidate;
@end

@implementation TouchIconFetcher

- (TouchIconFetcher)initWithWebView:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TouchIconFetcher;
  v5 = [(TouchIconFetcher *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_webView, v4);
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    completionBlocks = v6->_completionBlocks;
    v6->_completionBlocks = (NSMutableArray *)v7;

    [(TouchIconFetcher *)v6 _setUpTouchIconFetcherObserver];
    v9 = v6;
  }

  return v6;
}

- (void)_setUpTouchIconFetcherObserver
{
  v3 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1F3D23098];
  touchIconFetcherObserver = self->_touchIconFetcherObserver;
  self->_touchIconFetcherObserver = v3;

  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(_WKRemoteObjectInterface *)self->_touchIconFetcherObserver setClasses:v9 forSelector:sel_didFetchTouchIconURLs_forURL_ argumentIndex:0 ofReply:0];
  [(_WKRemoteObjectInterface *)self->_touchIconFetcherObserver setClasses:v9 forSelector:sel_didFetchTouchIconURLs_forURL_ argumentIndex:1 ofReply:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v8 = [WeakRetained _remoteObjectRegistry];
  [v8 registerExportedObject:self interface:self->_touchIconFetcherObserver];
}

- (void)invalidate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_invalidated)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v3 = self->_completionBlocks;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v7));
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }

    [(NSMutableArray *)self->_completionBlocks removeAllObjects];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    id v9 = [WeakRetained _remoteObjectRegistry];
    [v9 unregisterExportedObject:self interface:self->_touchIconFetcherObserver];

    touchIconFetcherObserver = self->_touchIconFetcherObserver;
    self->_touchIconFetcherObserver = 0;

    self->_invalidated = 1;
  }
}

- (id)_webProcessActivityProxy
{
  activityProxy = self->_activityProxy;
  if (!activityProxy)
  {
    uint64_t v4 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1F3D63160];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    uint64_t v6 = [WeakRetained _remoteObjectRegistry];
    uint64_t v7 = [v6 remoteObjectProxyWithInterface:v4];
    v8 = self->_activityProxy;
    self->_activityProxy = v7;

    activityProxy = self->_activityProxy;
  }
  return activityProxy;
}

- (void)fetchTouchIconURLsWithCompletion:(id)a3
{
  if (self->_invalidated)
  {
    v3 = (void (*)(id, uint64_t))*((void *)a3 + 2);
    uint64_t v4 = MEMORY[0x1E4F1CBF0];
    v3(a3, v4);
  }
  else
  {
    completionBlocks = self->_completionBlocks;
    uint64_t v7 = (void *)MEMORY[0x1E4E42950](a3, a2);
    [(NSMutableArray *)completionBlocks addObject:v7];

    if (!self->_fetchingURLs)
    {
      self->_fetchingURLs = 1;
      id v8 = [(TouchIconFetcher *)self _webProcessActivityProxy];
      [v8 fetchTouchIconURLs];
    }
  }
}

- (void)didFetchTouchIconURLs:(id)a3 forURL:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F785C0] deviceIdealDefaultTouchIconURLsWithURL:a4];
  id v8 = (void *)[v7 mutableCopy];

  [v8 addObjectsFromArray:v6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = self->_completionBlocks;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v13) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * v13));
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  [(NSMutableArray *)self->_completionBlocks removeAllObjects];
  self->_fetchingURLs = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchIconFetcherObserver, 0);
  objc_storeStrong((id *)&self->_activityProxy, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_destroyWeak((id *)&self->_webView);
}

@end