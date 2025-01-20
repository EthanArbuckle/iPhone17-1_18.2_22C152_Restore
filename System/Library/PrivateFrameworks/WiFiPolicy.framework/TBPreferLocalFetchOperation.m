@interface TBPreferLocalFetchOperation
- (BOOL)_doResults:(id)a3 satisfyFetchRequest:(id)a4 keysToFetchRemotely:(id *)a5 satisfiedKeys:(id *)a6;
- (BOOL)isFinished;
- (BOOL)isReady;
- (NSArray)remoteKeysToFetch;
- (NSArray)satisfiedLocalKeys;
- (NSOperationQueue)fetchQueue;
- (TBFetchRequest)fetchRequest;
- (TBFetchRequest)fetchRequestCopy;
- (TBFetchResponse)response;
- (TBPreferLocalFetchDataSource)dataSource;
- (TBPreferLocalFetchOperation)initWithFetchRequest:(id)a3 dataSource:(id)a4 fetchQueue:(id)a5;
- (id)_tileItemsFromTileKeys:(id)a3;
- (id)name;
- (void)_captureCacheEventWithStatus:(unint64_t)a3 userInfo:(id)a4 error:(id)a5 type:(unint64_t)a6;
- (void)_fetchLocal;
- (void)_fetchRemote;
- (void)_mergeLocalAndRemoteResults:(id)a3;
- (void)finish;
- (void)finishAndCallCompletionWithResponse:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setFetchQueue:(id)a3;
- (void)setFetchRequest:(id)a3;
- (void)setFetchRequestCopy:(id)a3;
- (void)setRemoteKeysToFetch:(id)a3;
- (void)setResponse:(id)a3;
- (void)setSatisfiedLocalKeys:(id)a3;
- (void)start;
@end

@implementation TBPreferLocalFetchOperation

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)_captureCacheEventWithStatus:(unint64_t)a3 userInfo:(id)a4 error:(id)a5 type:(unint64_t)a6
{
  id v15 = a4;
  id v9 = a5;
  v10 = [v15 objectForKeyedSubscript:@"staleness"];

  if (v10)
  {
    v11 = [v15 objectForKeyedSubscript:@"staleness"];
    v10 = (void *)[v11 unsignedIntegerValue];
  }
  v12 = [v15 objectForKeyedSubscript:@"tileKey"];

  if (v12)
  {
    v13 = [v15 objectForKeyedSubscript:@"tileKey"];
    v12 = (void *)[v13 unsignedIntegerValue];
  }
  v14 = +[TBCacheAnalyticsEvent cacheAnalyticsEventWithStatus:a3 staleness:v10 tileKey:v12 type:a6 error:v9];
  +[TBAnalytics captureEvent:v14];
}

- (BOOL)_doResults:(id)a3 satisfyFetchRequest:(id)a4 keysToFetchRemotely:(id *)a5 satisfiedKeys:(id *)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = [v10 descriptor];
  if ([v11 type] == 2)
  {
  }
  else
  {
    v12 = [v10 descriptor];
    uint64_t v13 = [v12 type];

    if (v13 != 3)
    {
      BOOL v25 = [v9 count] != 0;
      goto LABEL_20;
    }
  }
  v14 = [MEMORY[0x1E4F1CA80] set];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = objc_msgSend(v10, "descriptor", 0);
  v16 = [v15 tileItems];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = [*(id *)(*((void *)&v27 + 1) + 8 * i) key];
        [v14 addObject:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v18);
  }

  v22 = [v9 valueForKey:@"key"];
  if (v22)
  {
    v23 = [MEMORY[0x1E4F1CAD0] setWithArray:v22];
    [v14 minusSet:v23];

    uint64_t v24 = [v14 count];
    BOOL v25 = v24 == 0;
    if (a5 && v24)
    {
      *a5 = [v14 allObjects];
    }
    if (a6) {
      *a6 = v22;
    }
  }
  else
  {
    BOOL v25 = 0;
  }

LABEL_20:
  return v25;
}

void __42__TBPreferLocalFetchOperation__fetchLocal__block_invoke_2(uint64_t a1, void *a2)
{
  id v24 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [WeakRetained fetchRequest];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = [v6 fetchRequest];
    v8 = [v7 userInfo];
  }
  else
  {
    v8 = 0;
  }
  id v9 = [v24 error];

  if (v9)
  {
    id v10 = [v24 error];
    uint64_t v11 = [v10 code];

    if (v11 == 102)
    {
      uint64_t v12 = 3;
    }
    else
    {
      uint64_t v19 = [v24 error];
      uint64_t v20 = [v19 code];

      if (v20 == 103) {
        uint64_t v12 = 2;
      }
      else {
        uint64_t v12 = 4;
      }
    }
    v21 = [v24 error];
    NSLog(&cfstr_SLocalFetchErr.isa, "-[TBPreferLocalFetchOperation _fetchLocal]_block_invoke_2", v21);

    id v22 = objc_loadWeakRetained((id *)(a1 + 32));
    v23 = [v24 error];
    [v22 _captureCacheEventWithStatus:v12 userInfo:v8 error:v23 type:*(void *)(a1 + 40)];

    id v18 = objc_loadWeakRetained((id *)(a1 + 32));
    [v18 _fetchRemote];
  }
  else
  {
    id v13 = objc_loadWeakRetained((id *)(a1 + 32));
    [v13 setResponse:v24];

    v14 = [v24 results];
    uint64_t v15 = [v14 count];
    v16 = [v24 tiles];
    NSLog(&cfstr_SResultsDTiles.isa, "-[TBPreferLocalFetchOperation _fetchLocal]_block_invoke_2", v15, [v16 count]);

    id v17 = objc_loadWeakRetained((id *)(a1 + 32));
    [v17 _captureCacheEventWithStatus:1 userInfo:v8 error:0 type:*(void *)(a1 + 40)];

    id v18 = objc_loadWeakRetained((id *)(a1 + 32));
    [v18 finishAndCallCompletionWithResponse:v24];
  }
}

- (TBFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)finishAndCallCompletionWithResponse:(id)a3
{
  id v4 = a3;
  [(TBPreferLocalFetchOperation *)self setResponse:v4];
  char v5 = [(TBPreferLocalFetchOperation *)self fetchRequest];
  id v6 = [v5 resultsHandler];
  ((void (**)(void, id, void, uint64_t))v6)[2](v6, v4, 0, 1);

  [(TBPreferLocalFetchOperation *)self finish];
}

- (void)setResponse:(id)a3
{
}

- (BOOL)isReady
{
  return 1;
}

uint64_t __42__TBPreferLocalFetchOperation__fetchLocal__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  id v13 = 0;
  id v14 = 0;
  uint64_t v7 = [WeakRetained _doResults:v3 satisfyFetchRequest:v6 keysToFetchRemotely:&v14 satisfiedKeys:&v13];
  id v8 = v14;
  id v9 = v13;

  if (v7)
  {
    NSLog(&cfstr_SRequestIsFull.isa, "-[TBPreferLocalFetchOperation _fetchLocal]_block_invoke", [v3 count]);
  }
  else
  {
    NSLog(&cfstr_SRequestUnsati.isa, "-[TBPreferLocalFetchOperation _fetchLocal]_block_invoke");
    id v10 = objc_loadWeakRetained(v4);
    [v10 setRemoteKeysToFetch:v8];

    NSLog(&cfstr_KeysNeededToFe.isa, v8);
    id v11 = objc_loadWeakRetained(v4);
    [v11 setSatisfiedLocalKeys:v9];

    NSLog(&cfstr_SatisifedLocal.isa, v9);
  }

  return v7;
}

- (void)start
{
  self->_finished = 0;
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  start = self->_start;
  self->_start = v3;

  char v5 = [(TBPreferLocalFetchOperation *)self fetchRequest];
  id v6 = (void *)[v5 copyWithZone:0];
  [(TBPreferLocalFetchOperation *)self setFetchRequestCopy:v6];

  [(TBPreferLocalFetchOperation *)self _fetchLocal];
}

- (void)setFetchRequestCopy:(id)a3
{
}

- (void)_fetchLocal
{
  objc_initWeak(&location, self);
  id v3 = [(TBPreferLocalFetchOperation *)self fetchRequest];
  id v4 = [v3 descriptor];
  if ([v4 type] == 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }

  id v6 = [(TBPreferLocalFetchOperation *)self fetchRequestCopy];
  objc_initWeak(&from, v6);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __42__TBPreferLocalFetchOperation__fetchLocal__block_invoke;
  v14[3] = &unk_1E69BDD08;
  objc_copyWeak(&v15, &location);
  objc_copyWeak(&v16, &from);
  uint64_t v7 = [(TBPreferLocalFetchOperation *)self fetchRequestCopy];
  [v7 setPreferLocalHandler:v14];

  uint64_t v12 = MEMORY[0x1E4F143A8];
  objc_copyWeak(v13, &location);
  v13[1] = (id)v5;
  id v8 = [(TBPreferLocalFetchOperation *)self fetchRequestCopy];
  [v8 setResultsHandler:&v12];

  id v9 = [(TBPreferLocalFetchOperation *)self dataSource];
  id v10 = [v9 localDataSource];
  id v11 = [(TBPreferLocalFetchOperation *)self fetchRequestCopy];
  [v10 executeFetchRequest:v11];

  objc_destroyWeak(v13);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (TBFetchRequest)fetchRequestCopy
{
  return self->_fetchRequestCopy;
}

- (TBPreferLocalFetchDataSource)dataSource
{
  return self->_dataSource;
}

- (TBPreferLocalFetchOperation)initWithFetchRequest:(id)a3 dataSource:(id)a4 fetchQueue:(id)a5
{
  id v8 = (TBFetchRequest *)a3;
  id v9 = (TBPreferLocalFetchDataSource *)a4;
  id v10 = (NSOperationQueue *)a5;
  v18.receiver = self;
  v18.super_class = (Class)TBPreferLocalFetchOperation;
  id v11 = [(TBPreferLocalFetchOperation *)&v18 init];
  fetchRequest = v11->_fetchRequest;
  v11->_fetchRequest = v8;
  id v13 = v8;

  dataSource = v11->_dataSource;
  v11->_dataSource = v9;
  id v15 = v9;

  fetchQueue = v11->_fetchQueue;
  v11->_fetchQueue = v10;

  return v11;
}

- (void)finish
{
  id v3 = [(TBPreferLocalFetchOperation *)self name];
  [(NSDate *)self->_start timeIntervalSinceNow];
  NSLog(&cfstr_FinishedElapse.isa, v3, -v4);

  [(TBPreferLocalFetchOperation *)self willChangeValueForKey:@"isFinished"];
  self->_finished = 1;

  [(TBPreferLocalFetchOperation *)self didChangeValueForKey:@"isFinished"];
}

- (id)name
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_satisfiedLocalKeys, 0);
  objc_storeStrong((id *)&self->_remoteKeysToFetch, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_fetchRequestCopy, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);

  objc_storeStrong((id *)&self->_start, 0);
}

- (void)_fetchRemote
{
  uint64_t v3 = [(TBPreferLocalFetchOperation *)self remoteKeysToFetch];
  if (!v3) {
    goto LABEL_6;
  }
  double v4 = (void *)v3;
  uint64_t v5 = [(TBPreferLocalFetchOperation *)self fetchRequest];
  id v6 = [v5 descriptor];
  if ([v6 type] != 2)
  {
    uint64_t v7 = [(TBPreferLocalFetchOperation *)self fetchRequest];
    id v8 = [v7 descriptor];
    uint64_t v9 = [v8 type];

    if (v9 == 3) {
      goto LABEL_5;
    }
LABEL_6:
    v23 = [TBRemoteFetchAndCacheDataSource alloc];
    id v24 = [(TBPreferLocalFetchOperation *)self dataSource];
    BOOL v25 = [v24 remoteDataSource];
    v26 = [(TBPreferLocalFetchOperation *)self dataSource];
    long long v27 = [v26 cacheProvider];
    id v11 = [(TBRemoteFetchAndCacheDataSource *)v23 initWithFetchDataSource:v25 cacheProvider:v27];

    long long v28 = [TBRemoteFetchAndCacheOperation alloc];
    long long v29 = [(TBPreferLocalFetchOperation *)self fetchRequest];
    uint64_t v12 = [(TBRemoteFetchAndCacheOperation *)v28 initWithFetchRequest:v29 dataSource:v11];

    [(TBPreferLocalFetchOperation *)self addDependency:v12];
    long long v30 = [(TBPreferLocalFetchOperation *)self fetchQueue];
    [v30 addOperation:v12];

    objc_initWeak(&location, self);
    objc_initWeak(&from, v12);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __43__TBPreferLocalFetchOperation__fetchRemote__block_invoke_2;
    v31[3] = &unk_1E69BDD58;
    objc_copyWeak(&v32, &location);
    objc_copyWeak(&v33, &from);
    [(TBTileFetchRequestDescriptor *)v12 setCompletionBlock:v31];
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    goto LABEL_7;
  }

LABEL_5:
  id v10 = [(TBPreferLocalFetchOperation *)self remoteKeysToFetch];
  id v11 = [(TBPreferLocalFetchOperation *)self _tileItemsFromTileKeys:v10];

  uint64_t v12 = [[TBTileFetchRequestDescriptor alloc] initWithTileItems:v11];
  id v13 = [(TBPreferLocalFetchOperation *)self fetchRequest];
  id v14 = +[TBTileFetchRequest fetchRequestWithDescriptor:sourcePolicy:cacheable:](TBTileFetchRequest, "fetchRequestWithDescriptor:sourcePolicy:cacheable:", v12, 2, [v13 cacheable]);

  id v15 = [TBRemoteFetchAndCacheDataSource alloc];
  id v16 = [(TBPreferLocalFetchOperation *)self dataSource];
  id v17 = [v16 remoteDataSource];
  objc_super v18 = [(TBPreferLocalFetchOperation *)self dataSource];
  uint64_t v19 = [v18 cacheProvider];
  uint64_t v20 = [(TBRemoteFetchAndCacheDataSource *)v15 initWithFetchDataSource:v17 cacheProvider:v19];

  v21 = [[TBRemoteFetchAndCacheOperation alloc] initWithFetchRequest:v14 dataSource:v20];
  [(TBPreferLocalFetchOperation *)self addDependency:v21];
  id v22 = [(TBPreferLocalFetchOperation *)self fetchQueue];
  [v22 addOperation:v21];

  objc_initWeak(&location, self);
  objc_initWeak(&from, v21);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __43__TBPreferLocalFetchOperation__fetchRemote__block_invoke;
  v34[3] = &unk_1E69BDD58;
  objc_copyWeak(&v35, &location);
  objc_copyWeak(&v36, &from);
  [(TBRemoteFetchAndCacheOperation *)v21 setCompletionBlock:v34];
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

LABEL_7:
}

void __43__TBPreferLocalFetchOperation__fetchRemote__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [v2 response];
  [WeakRetained _mergeLocalAndRemoteResults:v3];
}

void __43__TBPreferLocalFetchOperation__fetchRemote__block_invoke_2(id *a1)
{
  v1 = a1;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  uint64_t v3 = [WeakRetained response];
  v1 += 4;
  id v4 = objc_loadWeakRetained(v1);
  [v4 setResponse:v3];

  id v5 = objc_loadWeakRetained(v1);
  [v5 finish];
}

- (void)_mergeLocalAndRemoteResults:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TBPreferLocalFetchOperation *)self satisfiedLocalKeys];
  if (!v5) {
    goto LABEL_6;
  }
  id v6 = (void *)v5;
  uint64_t v7 = [(TBPreferLocalFetchOperation *)self fetchRequest];
  id v8 = [v7 descriptor];
  if ([v8 type] != 2)
  {
    uint64_t v9 = [(TBPreferLocalFetchOperation *)self fetchRequest];
    id v10 = [v9 descriptor];
    uint64_t v11 = [v10 type];

    if (v11 == 3) {
      goto LABEL_5;
    }
LABEL_6:
    [(TBPreferLocalFetchOperation *)self finishAndCallCompletionWithResponse:v4];
    goto LABEL_7;
  }

LABEL_5:
  uint64_t v12 = [(TBPreferLocalFetchOperation *)self satisfiedLocalKeys];
  NSLog(&cfstr_SFetchingRemai.isa, "-[TBPreferLocalFetchOperation _mergeLocalAndRemoteResults:]", v12);

  id v13 = [(TBPreferLocalFetchOperation *)self satisfiedLocalKeys];
  id v14 = [(TBPreferLocalFetchOperation *)self _tileItemsFromTileKeys:v13];

  id v15 = [[TBTileFetchRequestDescriptor alloc] initWithTileItems:v14];
  id v16 = +[TBTileFetchRequest fetchRequestWithDescriptor:v15 sourcePolicy:1 cacheable:0];
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __59__TBPreferLocalFetchOperation__mergeLocalAndRemoteResults___block_invoke;
  v19[3] = &unk_1E69BDD80;
  id v20 = v4;
  objc_copyWeak(&v21, &location);
  [v16 setResultsHandler:v19];
  id v17 = [(TBPreferLocalFetchOperation *)self dataSource];
  objc_super v18 = [v17 localDataSource];
  [v18 executeFetchRequest:v16];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

LABEL_7:
}

void __59__TBPreferLocalFetchOperation__mergeLocalAndRemoteResults___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = objc_alloc_init(TBMutableTileFetchResponse);
  [(TBMutableTileFetchResponse *)v5 addResponse:*(void *)(a1 + 32)];
  [(TBMutableTileFetchResponse *)v5 addResponse:v3];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained finishAndCallCompletionWithResponse:v5];
}

- (id)_tileItemsFromTileKeys:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v5 = (void *)MEMORY[0x1D9440170]();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = +[TBTileItemDescriptor tileItemDescriptorWithKey:](TBTileItemDescriptor, "tileItemDescriptorWithKey:", v11, (void)v14);
          [v4 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v4;
}

- (void)setFetchRequest:(id)a3
{
}

- (TBFetchResponse)response
{
  return self->_response;
}

- (void)setDataSource:(id)a3
{
}

- (NSOperationQueue)fetchQueue
{
  return self->_fetchQueue;
}

- (void)setFetchQueue:(id)a3
{
}

- (NSArray)remoteKeysToFetch
{
  return self->_remoteKeysToFetch;
}

- (void)setRemoteKeysToFetch:(id)a3
{
}

- (NSArray)satisfiedLocalKeys
{
  return self->_satisfiedLocalKeys;
}

- (void)setSatisfiedLocalKeys:(id)a3
{
}

@end