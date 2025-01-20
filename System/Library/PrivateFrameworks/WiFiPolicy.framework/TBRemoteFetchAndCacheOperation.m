@interface TBRemoteFetchAndCacheOperation
- (BOOL)isFinished;
- (BOOL)isReady;
- (TBFetchRequest)fetchRequest;
- (TBFetchResponse)response;
- (TBRemoteFetchAndCacheDataSource)dataSource;
- (TBRemoteFetchAndCacheOperation)initWithFetchRequest:(id)a3 dataSource:(id)a4;
- (id)name;
- (void)finish;
- (void)setDataSource:(id)a3;
- (void)setFetchRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)start;
@end

@implementation TBRemoteFetchAndCacheOperation

- (TBRemoteFetchAndCacheOperation)initWithFetchRequest:(id)a3 dataSource:(id)a4
{
  v6 = (TBFetchRequest *)a3;
  v7 = (TBRemoteFetchAndCacheDataSource *)a4;
  v13.receiver = self;
  v13.super_class = (Class)TBRemoteFetchAndCacheOperation;
  v8 = [(TBRemoteFetchAndCacheOperation *)&v13 init];
  fetchRequest = v8->_fetchRequest;
  v8->_fetchRequest = v6;
  v10 = v6;

  dataSource = v8->_dataSource;
  v8->_dataSource = v7;

  return v8;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isReady
{
  return 1;
}

- (void)start
{
  self->_finished = 0;
  v3 = [MEMORY[0x1E4F1C9C8] date];
  start = self->_start;
  self->_start = v3;

  objc_initWeak(&location, self);
  v5 = [(TBRemoteFetchAndCacheOperation *)self fetchRequest];
  v6 = (void *)[v5 copyWithZone:0];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__TBRemoteFetchAndCacheOperation_start__block_invoke;
  v9[3] = &unk_1E69BE598;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  [v6 setResultsHandler:v9];
  v7 = [(TBRemoteFetchAndCacheOperation *)self dataSource];
  v8 = [v7 fetchDataSource];
  [v8 executeFetchRequest:v6];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __39__TBRemoteFetchAndCacheOperation_start__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v10 = [WeakRetained dataSource];
  v11 = [v10 cacheProvider];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __39__TBRemoteFetchAndCacheOperation_start__block_invoke_2;
  v21 = &unk_1E69BE570;
  id v12 = v7;
  id v22 = v12;
  id v13 = v8;
  id v23 = v13;
  char v25 = a4;
  objc_copyWeak(&v24, (id *)(a1 + 40));
  [v11 cacheFetchResponse:v12 completionHandler:&v18];

  v14 = objc_msgSend(*(id *)(a1 + 32), "fetchRequest", v18, v19, v20, v21);
  v15 = [v14 resultsHandler];

  if (v15)
  {
    v16 = [*(id *)(a1 + 32) fetchRequest];
    v17 = [v16 resultsHandler];
    ((void (**)(void, id, void, uint64_t))v17)[2](v17, v12, 0, a4);
  }
  objc_destroyWeak(&v24);
}

void __39__TBRemoteFetchAndCacheOperation_start__block_invoke_2(uint64_t a1)
{
  NSLog(&cfstr_SCompletedCach.isa, "-[TBRemoteFetchAndCacheOperation start]_block_invoke_2", *(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = (id *)(a1 + 48);
    id WeakRetained = objc_loadWeakRetained(v4);
    [WeakRetained setResponse:v3];

    NSLog(&cfstr_SFinishingCach.isa, "-[TBRemoteFetchAndCacheOperation start]_block_invoke_2");
    id v6 = objc_loadWeakRetained(v4);
    [v6 finish];
  }
}

- (void)finish
{
  uint64_t v3 = [(TBRemoteFetchAndCacheOperation *)self name];
  [(NSDate *)self->_start timeIntervalSinceNow];
  NSLog(&cfstr_FinishedElapse.isa, v3, -v4);

  [(TBRemoteFetchAndCacheOperation *)self willChangeValueForKey:@"isFinished"];
  self->_finished = 1;

  [(TBRemoteFetchAndCacheOperation *)self didChangeValueForKey:@"isFinished"];
}

- (id)name
{
  uint64_t v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (TBFetchResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (TBFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)setFetchRequest:(id)a3
{
}

- (TBRemoteFetchAndCacheDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_start, 0);
}

@end