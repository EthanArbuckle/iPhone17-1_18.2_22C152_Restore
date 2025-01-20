@interface SearchRecentsOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (SearchRecentsOperation)initWithSearchQuery:(id)a3 context:(id)a4;
- (SearchRecentsOperationDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)start;
@end

@implementation SearchRecentsOperation

- (SearchRecentsOperation)initWithSearchQuery:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SearchRecentsOperation;
  v8 = [(SearchRecentsOperation *)&v12 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    query = v8->_query;
    v8->_query = v9;

    objc_storeStrong((id *)&v8->_context, a4);
    v8->_stateLock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (void)start
{
  if ([(SearchRecentsOperation *)self isCancelled])
  {
    v3 = sub_100109E50();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SearchRecentsOperation: %@ - is cancelled before starting", buf, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained searchRecentsOperation:self didMatchResults:&__NSArray0__struct];
  }
  else
  {
    [(SearchRecentsOperation *)self willChangeValueForKey:@"isExecuting"];
    os_unfair_lock_lock(&self->_stateLock);
    self->_isExecuting = 1;
    os_unfair_lock_unlock(&self->_stateLock);
    [(SearchRecentsOperation *)self didChangeValueForKey:@"isExecuting"];
    v5 = sub_100109E50();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SearchRecentsOperation: %@ - collecting results", buf, 0xCu);
    }

    uint64_t v6 = CRAddressKindMapLocation;
    uint64_t v26 = CRAddressKindMapLocation;
    id v7 = +[NSArray arrayWithObjects:&v26 count:1];
    WeakRetained = +[CRSearchPredicate predicateForKey:@"kind" inCollection:v7];

    v20 = +[CRSearchPredicate predicateForKey:@"displayName" matchingText:self->_query comparison:1];
    v19 = +[CRSearchPredicate predicateForKey:@"address" matchingText:self->_query comparison:1];
    v25[0] = v20;
    v25[1] = v19;
    v8 = +[NSArray arrayWithObjects:v25 count:2];
    v9 = +[CRSearchPredicate predicateSatisfyingAnySubpredicate:v8];

    id v10 = objc_alloc_init((Class)CRSearchQuery);
    v24[0] = WeakRetained;
    v24[1] = v9;
    v11 = +[NSArray arrayWithObjects:v24 count:2];
    objc_super v12 = +[CRSearchPredicate predicateSatisfyingAllSubpredicates:v11];
    [v10 setSearchPredicate:v12];

    query = self->_query;
    uint64_t v23 = v6;
    v14 = +[NSArray arrayWithObjects:&v23 count:1];
    v15 = +[CRSearchQuery frecencyComparatorForSearch:query preferredKinds:v14 sendingAddress:0 queryOptions:0];
    [v10 setComparator:v15];

    uint64_t v22 = CRRecentsDomainMaps;
    v16 = +[NSArray arrayWithObjects:&v22 count:1];
    [v10 setDomains:v16];

    v17 = +[CRRecentContactsLibrary defaultInstance];
    v18 = dispatch_get_global_queue(25, 0);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100C6C038;
    v21[3] = &unk_1012E7610;
    v21[4] = self;
    [v17 performRecentsSearch:v10 queue:v18 completion:v21];
  }
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isFinished
{
  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LOBYTE(v2) = v2->_isFinished;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (BOOL)isExecuting
{
  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LOBYTE(v2) = v2->_isExecuting;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (SearchRecentsOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SearchRecentsOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

@end