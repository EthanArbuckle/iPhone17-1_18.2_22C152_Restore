@interface SUUITrendingSearchProvider
- (NSMutableArray)pendingCompletionBlocks;
- (NSOperation)runningRequestOperation;
- (NSOperationQueue)callbackQueue;
- (NSOperationQueue)operationQueue;
- (SUUIClientContext)clientContext;
- (SUUITrendingSearchPage)cachedSearchPage;
- (SUUITrendingSearchProvider)initWithClientContext:(id)a3;
- (id)requestOperationWithPageURL:(id)a3 completionBlock:(id)a4;
- (void)clearCache;
- (void)dealloc;
- (void)requestTrendingSearchPageWithURL:(id)a3;
- (void)setCachedSearchPage:(id)a3;
- (void)setRunningRequestOperation:(id)a3;
- (void)trendingSearchPageWithURL:(id)a3 completionBlock:(id)a4;
@end

@implementation SUUITrendingSearchProvider

- (SUUITrendingSearchProvider)initWithClientContext:(id)a3
{
  objc_initWeak(&location, a3);
  v14.receiver = self;
  v14.super_class = (Class)SUUITrendingSearchProvider;
  v4 = [(SUUITrendingSearchProvider *)&v14 init];
  if (v4)
  {
    id v5 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v4->_clientContext, v5);

    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    operationQueue = v4->_operationQueue;
    v4->_operationQueue = v6;

    [(NSOperationQueue *)v4->_operationQueue setName:@"com.apple.iTunesStoreUI.SUUITrendingSearchProvider.operationQueue"];
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingCompletionBlocks = v4->_pendingCompletionBlocks;
    v4->_pendingCompletionBlocks = v8;

    v10 = [MEMORY[0x263F08A00] defaultCenter];
    v11 = (void *)MEMORY[0x263F83300];
    [v10 addObserver:v4 selector:sel_clearCache name:*MEMORY[0x263F83330] object:*MEMORY[0x263F83300]];

    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v4 selector:sel_clearCache name:*MEMORY[0x263F83340] object:*v11];
  }
  objc_destroyWeak(&location);
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SUUITrendingSearchProvider;
  [(SUUITrendingSearchProvider *)&v4 dealloc];
}

- (id)requestOperationWithPageURL:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [SUUILoadTrendingSearchPageOperation alloc];
  v9 = [(SUUITrendingSearchProvider *)self clientContext];
  v10 = [(SUUILoadTrendingSearchPageOperation *)v8 initWithClientContext:v9 pageURL:v7 outputBlock:v6];

  return v10;
}

- (NSOperationQueue)callbackQueue
{
  return (NSOperationQueue *)[MEMORY[0x263F08A48] mainQueue];
}

- (void)requestTrendingSearchPageWithURL:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__SUUITrendingSearchProvider_requestTrendingSearchPageWithURL___block_invoke;
  v7[3] = &unk_265402158;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  id v5 = [(SUUITrendingSearchProvider *)self requestOperationWithPageURL:v4 completionBlock:v7];
  id v6 = [(SUUITrendingSearchProvider *)self operationQueue];
  [v6 addOperation:v5];

  [(SUUITrendingSearchProvider *)self setRunningRequestOperation:v5];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __63__SUUITrendingSearchProvider_requestTrendingSearchPageWithURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = [WeakRetained callbackQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __63__SUUITrendingSearchProvider_requestTrendingSearchPageWithURL___block_invoke_2;
    v12[3] = &unk_265401E78;
    id v10 = v5;
    uint64_t v11 = *(void *)(a1 + 32);
    id v13 = v10;
    uint64_t v14 = v11;
    v15 = v8;
    id v16 = v6;
    [v9 addOperationWithBlock:v12];
  }
}

void __63__SUUITrendingSearchProvider_requestTrendingSearchPageWithURL___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "setCachedSearchPage:");
  }
  v2 = [*(id *)(a1 + 48) pendingCompletionBlocks];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
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
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
  [v2 removeAllObjects];
  [*(id *)(a1 + 48) setRunningRequestOperation:0];
}

- (void)trendingSearchPageWithURL:(id)a3 completionBlock:(id)a4
{
  id v13 = a3;
  uint64_t v6 = (void (**)(id, void *, void))a4;
  long long v7 = [(SUUITrendingSearchProvider *)self cachedSearchPage];

  if (v7)
  {
    long long v8 = [(SUUITrendingSearchProvider *)self cachedSearchPage];
    v6[2](v6, v8, 0);
  }
  else
  {
    long long v9 = [(SUUITrendingSearchProvider *)self pendingCompletionBlocks];
    long long v10 = (void *)[v6 copy];

    uint64_t v11 = _Block_copy(v10);
    [v9 addObject:v11];

    uint64_t v12 = [(SUUITrendingSearchProvider *)self runningRequestOperation];

    if (!v12) {
      [(SUUITrendingSearchProvider *)self requestTrendingSearchPageWithURL:v13];
    }
  }
}

- (void)clearCache
{
}

- (SUUIClientContext)clientContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientContext);
  return (SUUIClientContext *)WeakRetained;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (SUUITrendingSearchPage)cachedSearchPage
{
  return self->_cachedSearchPage;
}

- (void)setCachedSearchPage:(id)a3
{
}

- (NSMutableArray)pendingCompletionBlocks
{
  return self->_pendingCompletionBlocks;
}

- (NSOperation)runningRequestOperation
{
  return self->_runningRequestOperation;
}

- (void)setRunningRequestOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningRequestOperation, 0);
  objc_storeStrong((id *)&self->_pendingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_cachedSearchPage, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_clientContext);
}

@end