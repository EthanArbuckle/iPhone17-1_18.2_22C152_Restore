@interface SKUIResourceLoader
- (BOOL)isIdle;
- (BOOL)isIdleForReason:(int64_t)a3;
- (BOOL)loadResourceWithRequest:(id)a3 reason:(int64_t)a4;
- (BOOL)trySetReason:(int64_t)a3 forRequestWithIdentifier:(unint64_t)a4;
- (NSOperationQueue)delegateQueue;
- (NSOperationQueue)operationQueue;
- (NSString)description;
- (NSString)name;
- (SKUIClientContext)clientContext;
- (SKUIResourceLoader)init;
- (SKUIResourceLoader)initWithClientContext:(id)a3;
- (SKUIResourceLoader)initWithOperationQueue:(id)a3;
- (SKUIResourceLoader)initWithOperationQueue:(id)a3 clientContext:(id)a4;
- (SKUIResourceLoaderDelegate)delegate;
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
- (void)description;
- (void)enterBackground;
- (void)enterForeground;
- (void)removeAllCachedResources;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setName:(id)a3;
- (void)setResourceCacheLimit:(int64_t)a3;
@end

@implementation SKUIResourceLoader

- (SKUIResourceLoader)initWithOperationQueue:(id)a3
{
  return [(SKUIResourceLoader *)self initWithOperationQueue:a3 clientContext:0];
}

- (SKUIResourceLoader)initWithClientContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 resourceLoadQueue];
  v6 = [(SKUIResourceLoader *)self initWithOperationQueue:v5 clientContext:v4];

  return v6;
}

- (SKUIResourceLoader)initWithOperationQueue:(id)a3 clientContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v9) {
        -[SKUIResourceLoader initWithOperationQueue:clientContext:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  v28.receiver = self;
  v28.super_class = (Class)SKUIResourceLoader;
  v17 = [(SKUIResourceLoader *)&v28 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_clientContext, a4);
    if (v7)
    {
      objc_storeStrong((id *)&v18->_operationQueue, a3);
    }
    else
    {
      v19 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
      operationQueue = v18->_operationQueue;
      v18->_operationQueue = v19;

      [(NSOperationQueue *)v18->_operationQueue setName:@"com.apple.StoreKitUI.SKUIResourceLoader.queueFor28304306Fix"];
      [(NSOperationQueue *)v18->_operationQueue setMaxConcurrentOperationCount:8];
    }
    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    operationsByRequestID = v18->_operationsByRequestID;
    v18->_operationsByRequestID = v21;

    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    requestsByCacheKey = v18->_requestsByCacheKey;
    v18->_requestsByCacheKey = (NSMapTable *)v23;

    v25 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    resourcesByRequestID = v18->_resourcesByRequestID;
    v18->_resourcesByRequestID = v25;

    [(NSCache *)v18->_resourcesByRequestID setCountLimit:750];
    [(NSCache *)v18->_resourcesByRequestID setDelegate:v18];
  }

  return v18;
}

- (SKUIResourceLoader)init
{
  return 0;
}

- (void)dealloc
{
  [(NSCache *)self->_resourcesByRequestID setDelegate:0];
  [(SKUIResourceLoader *)self cancelAllRequests];
  v3.receiver = self;
  v3.super_class = (Class)SKUIResourceLoader;
  [(SKUIResourceLoader *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(SKUIResourceLoader *)self name];
  id v7 = [(SKUIResourceLoader *)self operationQueue];
  BOOL inBackground = self->_inBackground;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIResourceLoader description]();
  }
  if (inBackground) {
    BOOL v9 = @"YES";
  }
  else {
    BOOL v9 = @"NO";
  }
  uint64_t v10 = NSString;
  uint64_t v11 = SKUIResourceLoadCountMapGet((uint64_t)self->_requestCountMap, 1);
  uint64_t v12 = SKUIResourceLoadCountMapGet((uint64_t)self->_requestCountMap, 0);
  uint64_t v13 = [v10 stringWithFormat:@"{onScreen: %ld, cacheAhead: %ld, cacheFarAhead: %ld}", v11, v12, SKUIResourceLoadCountMapGet((uint64_t)self->_requestCountMap, -1)];
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p; name = %@; operationQueue = %@; BOOL inBackground = %@; loadCounts = %@>",
    v5,
    self,
    v6,
    v7,
    v9,
  uint64_t v14 = v13);

  return (NSString *)v14;
}

- (void)addResource:(id)a3 forRequestIdentifier:(unint64_t)a4
{
  v6 = (objc_class *)NSNumber;
  id v7 = a3;
  id v10 = (id)[[v6 alloc] initWithUnsignedInteger:a4];
  resourcesByRequestID = self->_resourcesByRequestID;
  BOOL v9 = [[_SKUIResourceCacheValue alloc] initWithResource:v7 requestCacheKey:0];

  [(NSCache *)resourcesByRequestID setObject:v9 forKey:v10];
}

- (id)cachedResourceForRequestIdentifier:(unint64_t)a3
{
  id v4 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  v5 = [(NSCache *)self->_resourcesByRequestID objectForKey:v4];
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
  if (SKUIResourceLoadCountMapClear((uint64_t)self->_requestCountMap, 1)) {
    [(SKUIResourceLoader *)self _sendDidLoadAllForReason:1];
  }
  if (SKUIResourceLoadCountMapClear((uint64_t)self->_requestCountMap, 0)) {
    [(SKUIResourceLoader *)self _sendDidLoadAllForReason:0];
  }
  if (SKUIResourceLoadCountMapClear((uint64_t)self->_requestCountMap, -1))
  {
    [(SKUIResourceLoader *)self _sendDidLoadAllForReason:-1];
  }
}

- (void)cancelRequestWithIdentifier:(unint64_t)a3
{
  id v7 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  id v4 = -[NSMutableDictionary objectForKey:](self->_operationsByRequestID, "objectForKey:");
  v5 = v4;
  if (v4)
  {
    [v4 cancel];
    [(NSMutableDictionary *)self->_operationsByRequestID removeObjectForKey:v7];
    uint64_t v6 = [v5 _loadReason];
    if (!SKUIResourceLoadCountMapDecrement((uint64_t)self->_requestCountMap, v6)) {
      [(SKUIResourceLoader *)self _sendDidLoadAllForReason:v6];
    }
  }
}

- (void)enterBackground
{
  if (!self->_inBackground)
  {
    self->_BOOL inBackground = 1;
    [(SKUIResourceLoader *)self _reprioritizeOperations];
  }
}

- (void)enterForeground
{
  if (self->_inBackground)
  {
    self->_BOOL inBackground = 0;
    [(SKUIResourceLoader *)self _reprioritizeOperations];
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
    objc_super v3 = [MEMORY[0x1E4F28F08] mainQueue];
  }

  return v3;
}

- (BOOL)isIdle
{
  return [(NSMutableDictionary *)self->_operationsByRequestID count] == 0;
}

- (BOOL)isIdleForReason:(int64_t)a3
{
  return SKUIResourceLoadCountMapGet((uint64_t)self->_requestCountMap, a3) == 0;
}

- (BOOL)loadResourceWithRequest:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", objc_msgSend(v6, "requestIdentifier"));
  id v8 = [(NSMutableDictionary *)self->_operationsByRequestID objectForKey:v7];
  if (v8)
  {
    uint64_t v9 = [(SKUIResourceLoader *)self _queuePriorityForLoadReason:a4];
    if (v9 > [v8 queuePriority])
    {
      [(SKUIResourceLoader *)self _updateLoadReason:a4 forOperation:v8];
      [v8 setQueuePriority:v9];
    }
  }
  else
  {
    id v10 = (void *)[v6 newLoadOperation];
    [v10 setClientContext:self->_clientContext];
    [v10 _setLoadReason:a4];
    objc_msgSend(v10, "setQualityOfService:", -[SKUIResourceLoader _qualityOfService](self, "_qualityOfService"));
    objc_msgSend(v10, "setQueuePriority:", -[SKUIResourceLoader _queuePriorityForLoadReason:](self, "_queuePriorityForLoadReason:", a4));
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__SKUIResourceLoader_loadResourceWithRequest_reason___block_invoke;
    v14[3] = &unk_1E64256C8;
    objc_copyWeak(&v16, &location);
    id v11 = v6;
    id v15 = v11;
    [v10 setOutputBlock:v14];
    [(SKUIResourceLoader *)self _sendDidBeginLoadingIfNecessary];
    uint64_t v12 = [v11 cacheKey];
    if (v12) {
      [(NSMapTable *)self->_requestsByCacheKey setObject:v7 forKey:v12];
    }
    [(NSMutableDictionary *)self->_operationsByRequestID setObject:v10 forKey:v7];
    [(NSOperationQueue *)self->_operationQueue addOperation:v10];
    SKUIResourceLoadCountMapIncrement((uint64_t)self->_requestCountMap, a4);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v8 == 0;
}

void __53__SKUIResourceLoader_loadResourceWithRequest_reason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [WeakRetained delegateQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__SKUIResourceLoader_loadResourceWithRequest_reason___block_invoke_2;
  v10[3] = &unk_1E6423FF8;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v11 = *(id *)(a1 + 32);
  id v9 = v5;
  id v12 = v9;
  [v8 addOperationWithBlock:v10];

  objc_destroyWeak(&v13);
}

void __53__SKUIResourceLoader_loadResourceWithRequest_reason___block_invoke_2(uint64_t a1)
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
    [(SKUIResourceLoader *)self _updateLoadReason:a3 forOperation:v7];
    objc_msgSend(v7, "setQueuePriority:", -[SKUIResourceLoader _queuePriorityForLoadReason:](self, "_queuePriorityForLoadReason:", a3));
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
  id v8 = a4;
  uint64_t v6 = [v8 _loadReason];
  if (v6 != a3)
  {
    uint64_t v7 = v6;
    [v8 _setLoadReason:a3];
    SKUIResourceLoadCountMapIncrement((uint64_t)self->_requestCountMap, a3);
    if (!SKUIResourceLoadCountMapDecrement((uint64_t)self->_requestCountMap, v7)) {
      [(SKUIResourceLoader *)self _sendDidLoadAllForReason:v7];
    }
  }
}

- (void)_reprioritizeOperations
{
  operationsByRequestID = self->_operationsByRequestID;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__SKUIResourceLoader__reprioritizeOperations__block_invoke;
  v3[3] = &unk_1E64256F0;
  v3[4] = self;
  [(NSMutableDictionary *)operationsByRequestID enumerateKeysAndObjectsUsingBlock:v3];
}

void __45__SKUIResourceLoader__reprioritizeOperations__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v5, "setQueuePriority:", objc_msgSend(v4, "_queuePriorityForLoadReason:", objc_msgSend(v5, "_loadReason")));
  objc_msgSend(v5, "setQualityOfService:", objc_msgSend(*(id *)(a1 + 32), "_qualityOfService"));
}

- (void)_finishLoadForRequest:(id)a3 withResource:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", objc_msgSend(v15, "requestIdentifier"));
  id v8 = [(NSMutableDictionary *)self->_operationsByRequestID objectForKey:v7];
  uint64_t v9 = [v8 _loadReason];
  [(NSMutableDictionary *)self->_operationsByRequestID removeObjectForKey:v7];
  if (v6)
  {
    if ([v15 cachesInMemory])
    {
      resourcesByRequestID = self->_resourcesByRequestID;
      id v11 = [_SKUIResourceCacheValue alloc];
      id v12 = [v15 cacheKey];
      id v13 = [(_SKUIResourceCacheValue *)v11 initWithResource:v6 requestCacheKey:v12];
      [(NSCache *)resourcesByRequestID setObject:v13 forKey:v7];
    }
    [v15 finishWithResource:v6];
  }
  else
  {
    uint64_t v14 = [v15 cacheKey];
    if (v14) {
      [(NSMapTable *)self->_requestsByCacheKey removeObjectForKey:v14];
    }
  }
  if (!SKUIResourceLoadCountMapDecrement((uint64_t)self->_requestCountMap, v9)) {
    [(SKUIResourceLoader *)self _sendDidLoadAllForReason:v9];
  }
  [(SKUIResourceLoader *)self _sendDidIdleIfNecessary];
}

- (void)_sendDidBeginLoadingIfNecessary
{
  if ([(SKUIResourceLoader *)self isIdle])
  {
    int64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"SKUIResourceLoaderDidBeginLoadingNotification" object:self];

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
  if ([(SKUIResourceLoader *)self isIdle])
  {
    int64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"SKUIResourceLoaderDidIdleNotification" object:self];

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
  v11[1] = *MEMORY[0x1E4F143B8];
  char v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v10 = @"SKUIResourceLoaderLoadReasonUserInfoKey";
  id v6 = [NSNumber numberWithInteger:a3];
  v11[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v5 postNotificationName:@"SKUIResourceLoaderDidLoadAllForReasonNotification" object:self userInfo:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 resourceLoader:self didLoadAllForReason:a3];
  }
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (SKUIResourceLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIResourceLoaderDelegate *)WeakRetained;
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

- (void)initWithOperationQueue:(uint64_t)a3 clientContext:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)description
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "SKUIResourceLoadCountMapGetDescription";
}

@end