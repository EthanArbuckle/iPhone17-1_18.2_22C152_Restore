@interface ASKResourceLoader
- (ASKResourceLoader)init;
- (ASKResourceLoader)initWithParentResourceLoader:(id)a3;
- (ASKResourceLoader)initWithRequestQueue:(id)a3 accessQueue:(id)a4 notificationQueue:(id)a5 cacheLimit:(int64_t)a6;
- (BOOL)isIdle;
- (BOOL)isIdleForReason:(int64_t)a3;
- (BOOL)isInBackground;
- (BOOL)loadResourceWithRequest:(id)a3 reason:(int64_t)a4;
- (BOOL)setReason:(int64_t)a3 forRequestWithKey:(id)a4;
- (NSCache)cachedResources;
- (NSMapTable)requestsByCacheKey;
- (NSMutableDictionary)pendingOperations;
- (NSOperationQueue)accessQueue;
- (NSOperationQueue)notificationQueue;
- (NSOperationQueue)requestQueue;
- (id)cachedResourcesForCacheKey:(id)a3;
- (id)description;
- (id)requestKeyForCacheKey:(id)a3;
- (int64_t)currentQualityOfService;
- (void)_commonInit;
- (void)addResource:(id)a3 forCacheKey:(id)a4;
- (void)cancelAllRequests;
- (void)cancelRequestForCacheKey:(id)a3;
- (void)dealloc;
- (void)enterBackground;
- (void)enterForeground;
- (void)finishLoadForRequest:(id)a3 withResource:(id)a4 error:(id)a5;
- (void)postDidBeginLoadingIfIdle;
- (void)postDidIdleIfIdle;
- (void)postDidLoadAllForReason:(int64_t)a3;
- (void)removeAllCachedResources;
- (void)reprioritizeOperations;
- (void)updateLoadReason:(int64_t)a3 forOperation:(id)a4;
@end

@implementation ASKResourceLoader

- (void)_commonInit
{
  v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  pendingOperations = self->_pendingOperations;
  self->_pendingOperations = v3;

  self->_requestsByCacheKey = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:0 valueOptions:0 capacity:0];

  _objc_release_x1();
}

- (ASKResourceLoader)initWithRequestQueue:(id)a3 accessQueue:(id)a4 notificationQueue:(id)a5 cacheLimit:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ASKResourceLoader;
  v14 = [(ASKResourceLoader *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_requestQueue, a3);
    objc_storeStrong((id *)&v15->_accessQueue, a4);
    objc_storeStrong((id *)&v15->_notificationQueue, a5);
    v16 = (NSCache *)objc_alloc_init((Class)NSCache);
    cachedResources = v15->_cachedResources;
    v15->_cachedResources = v16;

    [(NSCache *)v15->_cachedResources setCountLimit:a6];
    [(ASKResourceLoader *)v15 _commonInit];
  }

  return v15;
}

- (ASKResourceLoader)initWithParentResourceLoader:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASKResourceLoader;
  v5 = [(ASKResourceLoader *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 requestQueue];
    requestQueue = v5->_requestQueue;
    v5->_requestQueue = (NSOperationQueue *)v6;

    uint64_t v8 = [v4 accessQueue];
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (NSOperationQueue *)v8;

    uint64_t v10 = [v4 notificationQueue];
    notificationQueue = v5->_notificationQueue;
    v5->_notificationQueue = (NSOperationQueue *)v10;

    uint64_t v12 = [v4 cachedResources];
    cachedResources = v5->_cachedResources;
    v5->_cachedResources = (NSCache *)v12;

    [(ASKResourceLoader *)v5 _commonInit];
    v5->_isInBackground = 1;
  }

  return v5;
}

- (ASKResourceLoader)init
{
  return 0;
}

- (void)dealloc
{
  [(ASKResourceLoader *)self cancelAllRequests];
  v3.receiver = self;
  v3.super_class = (Class)ASKResourceLoader;
  [(ASKResourceLoader *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(ASKResourceLoader *)self requestQueue];
  uint64_t v6 = [(ASKResourceLoader *)self accessQueue];
  v7 = [(ASKResourceLoader *)self notificationQueue];
  uint64_t v8 = +[NSNumber numberWithBool:[(ASKResourceLoader *)self isInBackground]];
  v9 = +[NSString stringWithFormat:@"{onScreen: %ld, cacheAhead: %ld, cacheFarAhead: %ld}", self->_requestCountMap[2], self->_requestCountMap[1], self->_requestCountMap[0]];
  uint64_t v10 = +[NSString stringWithFormat:@"<%@:%p requestQueue = %@, accessQueue = %@, notificationQueue = %@, isInBackground = %@, loadCounts = %@>", v4, self, v5, v6, v7, v8, v9];

  return v10;
}

- (void)addResource:(id)a3 forCacheKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ASKResourceLoader *)self cachedResources];
  v9 = [v8 objectForKey:v7];

  if (v9)
  {
    uint64_t v10 = [v9 arrayByAddingObject:v6];
  }
  else
  {
    id v12 = v6;
    uint64_t v10 = +[NSArray arrayWithObjects:&v12 count:1];
  }
  id v11 = [(ASKResourceLoader *)self cachedResources];
  [v11 setObject:v10 forKey:v7];
}

- (id)cachedResourcesForCacheKey:(id)a3
{
  id v4 = a3;
  v5 = [(ASKResourceLoader *)self cachedResources];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)removeAllCachedResources
{
  id v2 = [(ASKResourceLoader *)self cachedResources];
  [v2 removeAllObjects];
}

- (id)requestKeyForCacheKey:(id)a3
{
  id v4 = a3;
  v5 = [(ASKResourceLoader *)self requestsByCacheKey];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)cancelAllRequests
{
  objc_super v3 = [(ASKResourceLoader *)self pendingOperations];
  id v4 = [v3 allValues];
  [v4 makeObjectsPerformSelector:"cancel"];

  v5 = [(ASKResourceLoader *)self pendingOperations];
  [v5 removeAllObjects];

  id v6 = [(ASKResourceLoader *)self requestsByCacheKey];
  [v6 removeAllObjects];

  if (self->_requestCountMap[2] >= 1) {
    self->_requestCountMap[2] = 0;
  }
  if (self->_requestCountMap[1] >= 1) {
    self->_requestCountMap[1] = 0;
  }
  if (self->_requestCountMap[0] >= 1) {
    self->_requestCountMap[0] = 0;
  }
}

- (void)cancelRequestForCacheKey:(id)a3
{
  id v11 = a3;
  id v4 = -[ASKResourceLoader requestKeyForCacheKey:](self, "requestKeyForCacheKey:");
  if (v4)
  {
    v5 = [(ASKResourceLoader *)self pendingOperations];
    id v6 = [v5 objectForKeyedSubscript:v4];

    if (v6)
    {
      [v6 cancel];
      id v7 = [(ASKResourceLoader *)self pendingOperations];
      [v7 removeObjectForKey:v4];

      uint64_t v8 = [(ASKResourceLoader *)self requestsByCacheKey];
      [v8 removeObjectForKey:v11];

      id v9 = [v6 _loadReason];
      uint64_t v10 = self->_requestCountMap[(void)v9];
      if (v10 >= 1) {
        self->_requestCountMap[(void)v9] = --v10;
      }
      if (!v10) {
        [(ASKResourceLoader *)self postDidLoadAllForReason:v9];
      }
    }
  }
}

- (void)enterBackground
{
  if (!self->_isInBackground)
  {
    self->_isInBackground = 1;
    [(ASKResourceLoader *)self reprioritizeOperations];
  }
}

- (void)enterForeground
{
  if (self->_isInBackground)
  {
    self->_isInBackground = 0;
    [(ASKResourceLoader *)self reprioritizeOperations];
  }
}

- (BOOL)isIdle
{
  id v2 = [(ASKResourceLoader *)self pendingOperations];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (BOOL)isIdleForReason:(int64_t)a3
{
  return self->_requestCountMap[a3] == 0;
}

- (BOOL)loadResourceWithRequest:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  id v7 = [v6 requestKey];
  uint64_t v8 = [(ASKResourceLoader *)self pendingOperations];
  id v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    unsigned int v10 = [(ASKResourceLoader *)self isInBackground];
    int64_t v11 = 4 * a4;
    if ((unint64_t)a4 >= 3) {
      int64_t v11 = 4;
    }
    uint64_t v12 = -8;
    if (a4 == 1) {
      uint64_t v12 = -4;
    }
    if (a4 == 2) {
      uint64_t v12 = 0;
    }
    if (v10) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = v11;
    }
    if (v13 > (uint64_t)[v9 queuePriority])
    {
      [(ASKResourceLoader *)self updateLoadReason:a4 forOperation:v9];
      [v9 setQueuePriority:v13];
    }
  }
  else
  {
    v14 = [v6 makeLoadOperation];
    [v14 _setLoadReason:a4];
    [v14 setQualityOfService:[self currentQualityOfService]];
    unsigned int v15 = [(ASKResourceLoader *)self isInBackground];
    int64_t v16 = 4 * a4;
    if ((unint64_t)a4 >= 3) {
      int64_t v16 = 4;
    }
    uint64_t v17 = -8;
    if (a4 == 1) {
      uint64_t v17 = -4;
    }
    if (a4 == 2) {
      uint64_t v17 = 0;
    }
    if (v15) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = v16;
    }
    [v14 setQueuePriority:v18];
    objc_initWeak(&location, self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __52__ASKResourceLoader_loadResourceWithRequest_reason___block_invoke;
    v25[3] = &unk_471048;
    objc_copyWeak(&v27, &location);
    id v19 = v6;
    id v26 = v19;
    [v14 setOutputBlock:v25];
    [(ASKResourceLoader *)self postDidBeginLoadingIfIdle];
    v20 = [(ASKResourceLoader *)self pendingOperations];
    [v20 setObject:v14 forKeyedSubscript:v7];

    v21 = [(ASKResourceLoader *)self requestsByCacheKey];
    v22 = [v19 cacheKey];
    [v21 setObject:v7 forKey:v22];

    v23 = [(ASKResourceLoader *)self requestQueue];
    [v23 addOperation:v14];

    ++self->_requestCountMap[a4];
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return v9 == 0;
}

void __52__ASKResourceLoader_loadResourceWithRequest_reason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = [WeakRetained accessQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __52__ASKResourceLoader_loadResourceWithRequest_reason___block_invoke_2;
  v11[3] = &unk_471020;
  objc_copyWeak(&v15, (id *)(a1 + 40));
  id v12 = *(id *)(a1 + 32);
  id v9 = v5;
  id v13 = v9;
  id v10 = v6;
  id v14 = v10;
  [v8 addOperationWithBlock:v11];

  objc_destroyWeak(&v15);
}

void __52__ASKResourceLoader_loadResourceWithRequest_reason___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained finishLoadForRequest:*(void *)(a1 + 32) withResource:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (BOOL)setReason:(int64_t)a3 forRequestWithKey:(id)a4
{
  id v6 = a4;
  id v7 = [(ASKResourceLoader *)self pendingOperations];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    [(ASKResourceLoader *)self updateLoadReason:a3 forOperation:v8];
    unsigned int v9 = [(ASKResourceLoader *)self isInBackground];
    int64_t v10 = 4 * a3;
    if ((unint64_t)a3 >= 3) {
      int64_t v10 = 4;
    }
    uint64_t v11 = -8;
    if (a3 == 1) {
      uint64_t v11 = -4;
    }
    if (a3 == 2) {
      uint64_t v11 = 0;
    }
    if (v9) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = v10;
    }
    [v8 setQueuePriority:v12];
  }

  return v8 != 0;
}

- (void)finishLoadForRequest:(id)a3 withResource:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 requestKey];
  uint64_t v12 = [v8 cacheKey];
  id v13 = [(ASKResourceLoader *)self pendingOperations];
  id v14 = [v13 objectForKeyedSubscript:v11];

  id v15 = [v14 _loadReason];
  int64_t v16 = [(ASKResourceLoader *)self pendingOperations];
  [v16 removeObjectForKey:v11];

  uint64_t v17 = [(ASKResourceLoader *)self requestsByCacheKey];
  [v17 removeObjectForKey:v12];

  if (v9)
  {
    unsigned __int8 v18 = [v8 cacheOptions];
    if ((v18 & 2) != 0)
    {
      if ((v18 & 4) != 0)
      {
        id v19 = [(ASKResourceLoader *)self cachedResources];
        id v22 = v9;
        v20 = +[NSArray arrayWithObjects:&v22 count:1];
        [v19 setObject:v20 forKey:v12];
      }
      else
      {
        [(ASKResourceLoader *)self addResource:v9 forCacheKey:v12];
      }
    }
  }
  [v8 didLoadResource:v9 error:v10];
  uint64_t v21 = self->_requestCountMap[(void)v15];
  if (v21 >= 1) {
    self->_requestCountMap[(void)v15] = --v21;
  }
  if (!v21) {
    [(ASKResourceLoader *)self postDidLoadAllForReason:v15];
  }
  [(ASKResourceLoader *)self postDidIdleIfIdle];
}

- (int64_t)currentQualityOfService
{
  if ([(ASKResourceLoader *)self isInBackground]) {
    return 9;
  }
  else {
    return 25;
  }
}

- (void)updateLoadReason:(int64_t)a3 forOperation:(id)a4
{
  id v9 = a4;
  id v6 = [v9 _loadReason];
  id v7 = v9;
  if (v6 != (id)a3)
  {
    [v9 _setLoadReason:a3];
    ++self->_requestCountMap[a3];
    uint64_t v8 = self->_requestCountMap[(void)v6];
    if (v8 >= 1) {
      self->_requestCountMap[(void)v6] = --v8;
    }
    id v7 = v9;
    if (!v8)
    {
      [(ASKResourceLoader *)self postDidLoadAllForReason:v6];
      id v7 = v9;
    }
  }
}

- (void)reprioritizeOperations
{
  int64_t v3 = [(ASKResourceLoader *)self currentQualityOfService];
  unsigned int v4 = [(ASKResourceLoader *)self isInBackground];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(ASKResourceLoader *)self pendingOperations];
  id v6 = [v5 objectEnumerator];

  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v12 = (unint64_t)[v11 _loadReason];
        if (v4)
        {
          if (v12 == 1) {
            uint64_t v13 = -4;
          }
          else {
            uint64_t v13 = -8;
          }
          if (v12 == 2) {
            uint64_t v14 = 0;
          }
          else {
            uint64_t v14 = v13;
          }
        }
        else if (v12 >= 3)
        {
          uint64_t v14 = 4;
        }
        else
        {
          uint64_t v14 = 4 * v12;
        }
        [v11 setQueuePriority:v14];
        [v11 setQualityOfService:v3];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)postDidBeginLoadingIfIdle
{
  if ([(ASKResourceLoader *)self isIdle])
  {
    objc_initWeak(&location, self);
    int64_t v3 = [(ASKResourceLoader *)self notificationQueue];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = __46__ASKResourceLoader_postDidBeginLoadingIfIdle__block_invoke;
    v4[3] = &unk_471070;
    objc_copyWeak(&v5, &location);
    [v3 addOperationWithBlock:v4];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __46__ASKResourceLoader_postDidBeginLoadingIfIdle__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = +[NSNotificationCenter defaultCenter];
    [v1 postNotificationName:@"ASKResourceLoaderDidBeginLoadingNotification" object:WeakRetained];
  }
}

- (void)postDidIdleIfIdle
{
  if ([(ASKResourceLoader *)self isIdle])
  {
    objc_initWeak(&location, self);
    int64_t v3 = [(ASKResourceLoader *)self notificationQueue];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = __38__ASKResourceLoader_postDidIdleIfIdle__block_invoke;
    v4[3] = &unk_471070;
    objc_copyWeak(&v5, &location);
    [v3 addOperationWithBlock:v4];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __38__ASKResourceLoader_postDidIdleIfIdle__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = +[NSNotificationCenter defaultCenter];
    [v1 postNotificationName:@"ASKResourceLoaderDidIdleNotification" object:WeakRetained];
  }
}

- (void)postDidLoadAllForReason:(int64_t)a3
{
  objc_initWeak(&location, self);
  id v5 = [(ASKResourceLoader *)self notificationQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __45__ASKResourceLoader_postDidLoadAllForReason___block_invoke;
  v6[3] = &unk_471098;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  [v5 addOperationWithBlock:v6];

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __45__ASKResourceLoader_postDidLoadAllForReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int64_t v3 = +[NSNotificationCenter defaultCenter];
    CFStringRef v6 = @"ASKResourceLoaderLoadReasonUserInfoKey";
    unsigned int v4 = +[NSNumber numberWithInteger:*(void *)(a1 + 40)];
    id v7 = v4;
    id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
    [v3 postNotificationName:@"ASKResourceLoaderDidLoadAllForReasonNotification" object:WeakRetained userInfo:v5];
  }
}

- (NSOperationQueue)accessQueue
{
  return self->_accessQueue;
}

- (NSOperationQueue)notificationQueue
{
  return self->_notificationQueue;
}

- (NSOperationQueue)requestQueue
{
  return self->_requestQueue;
}

- (BOOL)isInBackground
{
  return self->_isInBackground;
}

- (NSMutableDictionary)pendingOperations
{
  return self->_pendingOperations;
}

- (NSMapTable)requestsByCacheKey
{
  return self->_requestsByCacheKey;
}

- (NSCache)cachedResources
{
  return self->_cachedResources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedResources, 0);
  objc_storeStrong((id *)&self->_requestsByCacheKey, 0);
  objc_storeStrong((id *)&self->_pendingOperations, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end