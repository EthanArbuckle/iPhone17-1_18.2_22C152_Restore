@interface SUUIResourceLoader
- (BOOL)isIdle;
- (BOOL)isIdleForReason:(int64_t)a3;
- (BOOL)loadResourceWithRequest:(id)a3 reason:(int64_t)a4;
- (BOOL)trySetReason:(int64_t)a3 forRequestWithIdentifier:(unint64_t)a4;
- (NSOperationQueue)delegateQueue;
- (NSOperationQueue)operationQueue;
- (NSString)description;
- (NSString)name;
- (SUUIClientContext)clientContext;
- (SUUIResourceLoader)init;
- (SUUIResourceLoader)initWithClientContext:(id)a3;
- (SUUIResourceLoader)initWithOperationQueue:(id)a3;
- (SUUIResourceLoader)initWithOperationQueue:(id)a3 clientContext:(id)a4;
- (SUUIResourceLoaderDelegate)delegate;
- (id)cachedResourceForRequestIdentifier:(unint64_t)a3;
- (id)requestIdentifierForCacheKey:(id)a3;
- (int64_t)_qualityOfService;
- (int64_t)_queuePriorityForLoadReason:(int64_t)a3;
- (int64_t)resourceCacheLimit;
- (void)_finishLoadForRequest:(id)a3 withResource:(id)a4;
- (void)_reprioritizeOperations;
- (void)_sendDidBeginLoadingIfNecessary;
- (void)_sendDidIdleIfNecessary;
- (void)_sendDidLoadAllForReason:(int64_t)a3;
- (void)_updateLoadReason:(int64_t)a3 forOperation:(id)a4;
- (void)addResource:(id)a3 forRequestIdentifier:(unint64_t)a4;
- (void)cache:(id)a3 willEvictObject:(id)a4;
- (void)cancelAllRequests;
- (void)cancelRequestWithIdentifier:(unint64_t)a3;
- (void)dealloc;
- (void)enterBackground;
- (void)enterForeground;
- (void)removeAllCachedResources;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setName:(id)a3;
- (void)setResourceCacheLimit:(int64_t)a3;
@end

@implementation SUUIResourceLoader

- (SUUIResourceLoader)initWithOperationQueue:(id)a3
{
  return [(SUUIResourceLoader *)self initWithOperationQueue:a3 clientContext:0];
}

- (SUUIResourceLoader)initWithClientContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SUUIResourceLoader.m", 150, @"Invalid parameter not satisfying: %@", @"clientContext" object file lineNumber description];
  }
  v6 = [v5 resourceLoadQueue];
  v7 = [(SUUIResourceLoader *)self initWithOperationQueue:v6 clientContext:v5];

  return v7;
}

- (SUUIResourceLoader)initWithOperationQueue:(id)a3 clientContext:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SUUIResourceLoader.m", 156, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)SUUIResourceLoader;
  v10 = [(SUUIResourceLoader *)&v22 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_clientContext, a4);
    if (v8)
    {
      objc_storeStrong((id *)&v11->_operationQueue, a3);
    }
    else
    {
      v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
      operationQueue = v11->_operationQueue;
      v11->_operationQueue = v12;

      [(NSOperationQueue *)v11->_operationQueue setName:@"com.apple.iTunesStoreUI.SUUIResourceLoader.queueFor28304306Fix"];
      [(NSOperationQueue *)v11->_operationQueue setMaxConcurrentOperationCount:8];
    }
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    operationsByRequestID = v11->_operationsByRequestID;
    v11->_operationsByRequestID = v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    requestsByCacheKey = v11->_requestsByCacheKey;
    v11->_requestsByCacheKey = (NSMapTable *)v16;

    v18 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    resourcesByRequestID = v11->_resourcesByRequestID;
    v11->_resourcesByRequestID = v18;

    [(NSCache *)v11->_resourcesByRequestID setCountLimit:750];
    [(NSCache *)v11->_resourcesByRequestID setDelegate:v11];
  }

  return v11;
}

- (SUUIResourceLoader)init
{
  return 0;
}

- (void)dealloc
{
  [(NSCache *)self->_resourcesByRequestID setDelegate:0];
  [(SUUIResourceLoader *)self cancelAllRequests];
  v3.receiver = self;
  v3.super_class = (Class)SUUIResourceLoader;
  [(SUUIResourceLoader *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(SUUIResourceLoader *)self name];
  v7 = [(SUUIResourceLoader *)self operationQueue];
  if (self->_inBackground) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  id v9 = [NSString stringWithFormat:@"{onScreen: %ld, cacheAhead: %ld, cacheFarAhead: %ld}", self->_requestCountMap[2], self->_requestCountMap[1], self->_requestCountMap[0]];
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p; name = %@; operationQueue = %@; inBackground = %@; loadCounts = %@>",
    v5,
    self,
    v6,
    v7,
    v8,
  v10 = v9);

  return (NSString *)v10;
}

- (void)addResource:(id)a3 forRequestIdentifier:(unint64_t)a4
{
  v6 = (objc_class *)NSNumber;
  id v7 = a3;
  id v10 = (id)[[v6 alloc] initWithUnsignedInteger:a4];
  resourcesByRequestID = self->_resourcesByRequestID;
  id v9 = [[_SUUIResourceCacheValue alloc] initWithResource:v7 requestCacheKey:0];

  [(NSCache *)resourcesByRequestID setObject:v9 forKey:v10];
}

- (id)cachedResourceForRequestIdentifier:(unint64_t)a3
{
  v4 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  id v5 = [(NSCache *)self->_resourcesByRequestID objectForKey:v4];
  v6 = [v5 resource];

  return v6;
}

- (void)removeAllCachedResources
{
}

- (void)cancelAllRequests
{
  objc_super v3 = [(NSMutableDictionary *)self->_operationsByRequestID allValues];
  [v3 makeObjectsPerformSelector:sel_cancel];

  [(NSMutableDictionary *)self->_operationsByRequestID removeAllObjects];
  if (self->_requestCountMap[2] >= 1)
  {
    self->_requestCountMap[2] = 0;
    [(SUUIResourceLoader *)self _sendDidLoadAllForReason:1];
  }
  if (self->_requestCountMap[1] >= 1)
  {
    self->_requestCountMap[1] = 0;
    [(SUUIResourceLoader *)self _sendDidLoadAllForReason:0];
  }
  if (self->_requestCountMap[0] >= 1)
  {
    self->_requestCountMap[0] = 0;
    [(SUUIResourceLoader *)self _sendDidLoadAllForReason:-1];
  }
}

- (void)cancelRequestWithIdentifier:(unint64_t)a3
{
  id v10 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  v4 = -[NSMutableDictionary objectForKey:](self->_operationsByRequestID, "objectForKey:");
  id v5 = v4;
  if (v4)
  {
    [v4 cancel];
    [(NSMutableDictionary *)self->_operationsByRequestID removeObjectForKey:v10];
    uint64_t v6 = [v5 _loadReason];
    requestCountMap = self->_requestCountMap;
    uint64_t v8 = 2;
    if (v6 != 1) {
      uint64_t v8 = v6 == 0;
    }
    uint64_t v9 = requestCountMap[v8];
    if (v9 >= 1) {
      requestCountMap[v8] = --v9;
    }
    if (!v9) {
      [(SUUIResourceLoader *)self _sendDidLoadAllForReason:v6];
    }
  }
}

- (void)enterBackground
{
  if (!self->_inBackground)
  {
    self->_inBackground = 1;
    [(SUUIResourceLoader *)self _reprioritizeOperations];
  }
}

- (void)enterForeground
{
  if (self->_inBackground)
  {
    self->_inBackground = 0;
    [(SUUIResourceLoader *)self _reprioritizeOperations];
  }
}

- (NSOperationQueue)delegateQueue
{
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    objc_super v3 = delegateQueue;
  }
  else
  {
    objc_super v3 = [MEMORY[0x263F08A48] mainQueue];
  }
  return v3;
}

- (BOOL)isIdle
{
  return [(NSMutableDictionary *)self->_operationsByRequestID count] == 0;
}

- (BOOL)isIdleForReason:(int64_t)a3
{
  uint64_t v3 = a3 == 0;
  if (a3 == 1) {
    uint64_t v3 = 2;
  }
  return self->_requestCountMap[v3] == 0;
}

- (BOOL)loadResourceWithRequest:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", objc_msgSend(v6, "requestIdentifier"));
  uint64_t v8 = [(NSMutableDictionary *)self->_operationsByRequestID objectForKey:v7];
  if (v8)
  {
    uint64_t v9 = [(SUUIResourceLoader *)self _queuePriorityForLoadReason:a4];
    if (v9 > [v8 queuePriority])
    {
      [(SUUIResourceLoader *)self _updateLoadReason:a4 forOperation:v8];
      [v8 setQueuePriority:v9];
    }
  }
  else
  {
    id v10 = (void *)[v6 newLoadOperation];
    [v10 setClientContext:self->_clientContext];
    [v10 _setLoadReason:a4];
    objc_msgSend(v10, "setQualityOfService:", -[SUUIResourceLoader _qualityOfService](self, "_qualityOfService"));
    objc_msgSend(v10, "setQueuePriority:", -[SUUIResourceLoader _queuePriorityForLoadReason:](self, "_queuePriorityForLoadReason:", a4));
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __53__SUUIResourceLoader_loadResourceWithRequest_reason___block_invoke;
    v15[3] = &unk_2654025F0;
    objc_copyWeak(&v17, &location);
    id v11 = v6;
    id v16 = v11;
    [v10 setOutputBlock:v15];
    [(SUUIResourceLoader *)self _sendDidBeginLoadingIfNecessary];
    v12 = [v11 cacheKey];
    if (v12) {
      [(NSMapTable *)self->_requestsByCacheKey setObject:v7 forKey:v12];
    }
    [(NSMutableDictionary *)self->_operationsByRequestID setObject:v10 forKey:v7];
    [(NSOperationQueue *)self->_operationQueue addOperation:v10];
    uint64_t v13 = a4 == 0;
    if (a4 == 1) {
      uint64_t v13 = 2;
    }
    ++self->_requestCountMap[v13];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v8 == 0;
}

void __53__SUUIResourceLoader_loadResourceWithRequest_reason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = [WeakRetained delegateQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__SUUIResourceLoader_loadResourceWithRequest_reason___block_invoke_2;
  v10[3] = &unk_2654012C8;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v11 = *(id *)(a1 + 32);
  id v9 = v5;
  id v12 = v9;
  [v8 addOperationWithBlock:v10];

  objc_destroyWeak(&v13);
}

void __53__SUUIResourceLoader_loadResourceWithRequest_reason___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _finishLoadForRequest:*(void *)(a1 + 32) withResource:*(void *)(a1 + 40)];
}

- (id)requestIdentifierForCacheKey:(id)a3
{
  return [(NSMapTable *)self->_requestsByCacheKey objectForKey:a3];
}

- (BOOL)trySetReason:(int64_t)a3 forRequestWithIdentifier:(unint64_t)a4
{
  id v6 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:a4];
  id v7 = [(NSMutableDictionary *)self->_operationsByRequestID objectForKey:v6];
  if (v7)
  {
    [(SUUIResourceLoader *)self _updateLoadReason:a3 forOperation:v7];
    objc_msgSend(v7, "setQueuePriority:", -[SUUIResourceLoader _queuePriorityForLoadReason:](self, "_queuePriorityForLoadReason:", a3));
  }

  return v7 != 0;
}

- (int64_t)resourceCacheLimit
{
  return [(NSCache *)self->_resourcesByRequestID countLimit];
}

- (void)setResourceCacheLimit:(int64_t)a3
{
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v8 = a4;
  id v5 = [v8 requestCacheKey];

  if (v5)
  {
    requestsByCacheKey = self->_requestsByCacheKey;
    id v7 = [v8 requestCacheKey];
    [(NSMapTable *)requestsByCacheKey removeObjectForKey:v7];
  }
}

- (int64_t)_queuePriorityForLoadReason:(int64_t)a3
{
  int64_t v3 = 4;
  if ((unint64_t)(a3 + 1) < 3) {
    int64_t v3 = 4 * (a3 + 1);
  }
  int64_t v4 = -8;
  if (!a3) {
    int64_t v4 = -4;
  }
  if (a3 == 1) {
    int64_t v4 = 0;
  }
  if (self->_inBackground) {
    return v4;
  }
  else {
    return v3;
  }
}

- (int64_t)_qualityOfService
{
  if (self->_inBackground) {
    return 9;
  }
  else {
    return 25;
  }
}

- (void)_updateLoadReason:(int64_t)a3 forOperation:(id)a4
{
  id v12 = a4;
  uint64_t v6 = [v12 _loadReason];
  id v7 = v12;
  if (v6 != a3)
  {
    [v12 _setLoadReason:a3];
    requestCountMap = self->_requestCountMap;
    uint64_t v9 = a3 == 0;
    uint64_t v10 = 2;
    if (a3 == 1) {
      uint64_t v9 = 2;
    }
    ++requestCountMap[v9];
    if (v6 != 1) {
      uint64_t v10 = v6 == 0;
    }
    uint64_t v11 = requestCountMap[v10];
    if (v11 >= 1) {
      requestCountMap[v10] = --v11;
    }
    id v7 = v12;
    if (!v11)
    {
      [(SUUIResourceLoader *)self _sendDidLoadAllForReason:v6];
      id v7 = v12;
    }
  }
}

- (void)_reprioritizeOperations
{
  operationsByRequestID = self->_operationsByRequestID;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__SUUIResourceLoader__reprioritizeOperations__block_invoke;
  v3[3] = &unk_265402618;
  v3[4] = self;
  [(NSMutableDictionary *)operationsByRequestID enumerateKeysAndObjectsUsingBlock:v3];
}

void __45__SUUIResourceLoader__reprioritizeOperations__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v5, "setQueuePriority:", objc_msgSend(v4, "_queuePriorityForLoadReason:", objc_msgSend(v5, "_loadReason")));
  objc_msgSend(v5, "setQualityOfService:", objc_msgSend(*(id *)(a1 + 32), "_qualityOfService"));
}

- (void)_finishLoadForRequest:(id)a3 withResource:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", objc_msgSend(v18, "requestIdentifier"));
  id v8 = [(NSMutableDictionary *)self->_operationsByRequestID objectForKey:v7];
  uint64_t v9 = [v8 _loadReason];
  [(NSMutableDictionary *)self->_operationsByRequestID removeObjectForKey:v7];
  if (v6)
  {
    if ([v18 cachesInMemory])
    {
      resourcesByRequestID = self->_resourcesByRequestID;
      uint64_t v11 = [_SUUIResourceCacheValue alloc];
      id v12 = [v18 cacheKey];
      id v13 = [(_SUUIResourceCacheValue *)v11 initWithResource:v6 requestCacheKey:v12];
      [(NSCache *)resourcesByRequestID setObject:v13 forKey:v7];
    }
    [v18 finishWithResource:v6];
  }
  else
  {
    v14 = [v18 cacheKey];
    if (v14) {
      [(NSMapTable *)self->_requestsByCacheKey removeObjectForKey:v14];
    }
  }
  requestCountMap = self->_requestCountMap;
  uint64_t v16 = 2;
  if (v9 != 1) {
    uint64_t v16 = v9 == 0;
  }
  uint64_t v17 = requestCountMap[v16];
  if (v17 >= 1) {
    requestCountMap[v16] = --v17;
  }
  if (!v17) {
    [(SUUIResourceLoader *)self _sendDidLoadAllForReason:v9];
  }
  [(SUUIResourceLoader *)self _sendDidIdleIfNecessary];
}

- (void)_sendDidBeginLoadingIfNecessary
{
  if ([(SUUIResourceLoader *)self isIdle])
  {
    int64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 postNotificationName:@"SUUIResourceLoaderDidBeginLoadingNotification" object:self];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      [v6 resourceLoaderDidBeginLoading:self];
    }
  }
}

- (void)_sendDidIdleIfNecessary
{
  if ([(SUUIResourceLoader *)self isIdle])
  {
    int64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 postNotificationName:@"SUUIResourceLoaderDidIdleNotification" object:self];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      [v6 resourceLoaderDidIdle:self];
    }
  }
}

- (void)_sendDidLoadAllForReason:(int64_t)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  char v5 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v10 = @"SUUIResourceLoaderLoadReasonUserInfoKey";
  id v6 = [NSNumber numberWithInteger:a3];
  v11[0] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v5 postNotificationName:@"SUUIResourceLoaderDidLoadAllForReasonNotification" object:self userInfo:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 resourceLoader:self didLoadAllForReason:a3];
  }
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (SUUIResourceLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIResourceLoaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_resourcesByRequestID, 0);
  objc_storeStrong((id *)&self->_requestsByCacheKey, 0);
  objc_storeStrong((id *)&self->_operationsByRequestID, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end