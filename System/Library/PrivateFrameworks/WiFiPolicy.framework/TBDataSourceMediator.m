@interface TBDataSourceMediator
- (NSOperationQueue)fetchQueue;
- (TBCoreDataSource)local;
- (TBDataSource)remote;
- (TBDataSourceMediator)initWithLocalStoreDescriptor:(id)a3;
- (TBDataSourceMediator)initWithLocalStoreDescriptor:(id)a3 remoteStore:(id)a4;
- (void)executeFetchRequest:(id)a3;
- (void)prune3BarsNetworks:(unint64_t)a3 completionHandler:(id)a4;
- (void)removeAllWithCompletionHandler:(id)a3;
- (void)removeWithFetchRequest:(id)a3;
- (void)setFetchQueue:(id)a3;
- (void)setLocal:(id)a3;
- (void)setRemote:(id)a3;
@end

@implementation TBDataSourceMediator

- (TBDataSourceMediator)initWithLocalStoreDescriptor:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(TBRemoteDataSource);
  v6 = [(TBDataSourceMediator *)self initWithLocalStoreDescriptor:v4 remoteStore:v5];

  return v6;
}

- (TBDataSourceMediator)initWithLocalStoreDescriptor:(id)a3 remoteStore:(id)a4
{
  v6 = (TBDataSource *)a4;
  v17.receiver = self;
  v17.super_class = (Class)TBDataSourceMediator;
  id v7 = a3;
  v8 = [(TBDataSourceMediator *)&v17 init];
  v9 = [TBCoreDataSource alloc];
  uint64_t v10 = -[TBCoreDataSource initWithStoreDescriptor:](v9, "initWithStoreDescriptor:", v7, v17.receiver, v17.super_class);

  local = v8->_local;
  v8->_local = (TBCoreDataSource *)v10;

  remote = v8->_remote;
  v8->_remote = v6;
  v13 = v6;

  v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
  fetchQueue = v8->_fetchQueue;
  v8->_fetchQueue = v14;

  return v8;
}

- (void)executeFetchRequest:(id)a3
{
  id v18 = a3;
  NSLog(&cfstr_SExecutingFetc.isa, "-[TBDataSourceMediator executeFetchRequest:]", v18);
  if ([v18 sourcePolicy] == 2)
  {
    if ([v18 cacheable])
    {
      id v4 = [TBRemoteFetchAndCacheDataSource alloc];
      v5 = [(TBDataSourceMediator *)self remote];
      v6 = [(TBDataSourceMediator *)self local];
      id v7 = [(TBRemoteFetchAndCacheDataSource *)v4 initWithFetchDataSource:v5 cacheProvider:v6];

      v8 = [[TBRemoteFetchAndCacheOperation alloc] initWithFetchRequest:v18 dataSource:v7];
LABEL_6:
      v15 = [(TBDataSourceMediator *)self fetchQueue];
      [v15 addOperation:v8];

      goto LABEL_11;
    }
    remote = (TBCoreDataSource *)self->_remote;
  }
  else
  {
    if ([v18 sourcePolicy] == 3)
    {
      v9 = [TBPreferLocalFetchDataSource alloc];
      uint64_t v10 = [(TBDataSourceMediator *)self local];
      v11 = [(TBDataSourceMediator *)self remote];
      v12 = [(TBDataSourceMediator *)self local];
      id v7 = [(TBPreferLocalFetchDataSource *)v9 initWithLocalDataSource:v10 remoteDataSource:v11 cacheProvider:v12];

      v13 = [TBPreferLocalFetchOperation alloc];
      v14 = [(TBDataSourceMediator *)self fetchQueue];
      v8 = [(TBPreferLocalFetchOperation *)v13 initWithFetchRequest:v18 dataSource:v7 fetchQueue:v14];

      goto LABEL_6;
    }
    if ([v18 sourcePolicy] != 1)
    {
      id v17 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Unhandled source policy" userInfo:0];
      objc_exception_throw(v17);
    }
    remote = self->_local;
  }
  [(TBCoreDataSource *)remote executeFetchRequest:v18];
LABEL_11:
}

- (TBCoreDataSource)local
{
  return self->_local;
}

- (NSOperationQueue)fetchQueue
{
  return self->_fetchQueue;
}

- (TBDataSource)remote
{
  return self->_remote;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_remote, 0);

  objc_storeStrong((id *)&self->_local, 0);
}

- (void)removeWithFetchRequest:(id)a3
{
  id v4 = a3;
  NSLog(&cfstr_SRemovingWithF.isa, "-[TBDataSourceMediator removeWithFetchRequest:]", v4);
  local = self->_local;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__TBDataSourceMediator_removeWithFetchRequest___block_invoke;
  v7[3] = &unk_1E69BD5D8;
  id v8 = v4;
  id v6 = v4;
  [(TBCoreDataSource *)local removeWithFetchRequest:v6 completionHandler:v7];
}

void __47__TBDataSourceMediator_removeWithFetchRequest___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) resultsHandler];
  v1 = [[TBLocalFetchResponse alloc] initWithResults:0 entityDescription:0];
  v2[2](v2, v1, 0, 1);
}

- (void)removeAllWithCompletionHandler:(id)a3
{
  id v4 = a3;
  NSLog(&cfstr_SRemovingAll.isa, "-[TBDataSourceMediator removeAllWithCompletionHandler:]");
  [(TBCoreDataSource *)self->_local removeAllWithCompletionHandler:v4];
}

- (void)prune3BarsNetworks:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  NSLog(&cfstr_SPruneLocalSto.isa, "-[TBDataSourceMediator prune3BarsNetworks:completionHandler:]", a3);
  [(TBCoreDataSource *)self->_local prune3BarsNetworks:a3 completionHandler:v6];
}

- (void)setLocal:(id)a3
{
}

- (void)setRemote:(id)a3
{
}

- (void)setFetchQueue:(id)a3
{
}

@end