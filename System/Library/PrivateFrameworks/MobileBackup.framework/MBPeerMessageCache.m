@interface MBPeerMessageCache
- (BOOL)shouldHandleNewRequestForTask:(id)a3 transactionID:(id)a4 responseHandler:(id)a5;
- (MBPeerMessageCache)init;
- (NSMutableDictionary)currentTransactionsByTask;
- (NSMutableDictionary)failureResponses;
- (NSMutableDictionary)mostRecentResponseHandlers;
- (NSMutableDictionary)successResponses;
- (os_unfair_lock_s)cacheLock;
- (void)finishedHandlingTask:(id)a3 response:(id)a4 responseError:(id)a5;
- (void)reset;
- (void)setCacheLock:(os_unfair_lock_s)a3;
@end

@implementation MBPeerMessageCache

- (MBPeerMessageCache)init
{
  v13.receiver = self;
  v13.super_class = (Class)MBPeerMessageCache;
  v2 = [(MBPeerMessageCache *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_cacheLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_opt_new();
    successResponses = v3->_successResponses;
    v3->_successResponses = (NSMutableDictionary *)v4;

    uint64_t v6 = objc_opt_new();
    failureResponses = v3->_failureResponses;
    v3->_failureResponses = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    mostRecentResponseHandlers = v3->_mostRecentResponseHandlers;
    v3->_mostRecentResponseHandlers = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    currentTransactionsByTask = v3->_currentTransactionsByTask;
    v3->_currentTransactionsByTask = (NSMutableDictionary *)v10;
  }
  return v3;
}

- (BOOL)shouldHandleNewRequestForTask:(id)a3 transactionID:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, uint64_t))a5;
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  v12 = [(MBPeerMessageCache *)self currentTransactionsByTask];
  objc_super v13 = [v12 objectForKeyedSubscript:v8];
  unsigned int v14 = [v13 isEqualToString:v9];

  v15 = [(MBPeerMessageCache *)self successResponses];
  v16 = v15;
  if (v14)
  {
    uint64_t v17 = [v15 objectForKeyedSubscript:v8];

    v18 = [(MBPeerMessageCache *)self failureResponses];
    uint64_t v19 = [v18 objectForKeyedSubscript:v8];

    if (v17 | v19)
    {
      v10[2](v10, v17, v19);
      os_unfair_lock_unlock(&self->_cacheLock);
    }
    else
    {
      v24 = [(MBPeerMessageCache *)self mostRecentResponseHandlers];
      v25 = [v24 objectForKeyedSubscript:v8];

      if (!v25) {
        __assert_rtn("-[MBPeerMessageCache shouldHandleNewRequestForTask:transactionID:responseHandler:]", "MBPeerMessageCache.m", 65, "cachedResponseHandler != nil");
      }
      v26 = +[MBError errorWithCode:1 description:@"Burned response handler. Request was resent."];
      ((void (**)(void, void, void *))v25)[2](v25, 0, v26);

      v27 = objc_retainBlock(v10);
      v28 = [(MBPeerMessageCache *)self mostRecentResponseHandlers];
      [v28 setObject:v27 forKeyedSubscript:v8];

      os_unfair_lock_unlock(p_cacheLock);
    }
  }
  else
  {
    [v15 setObject:0 forKeyedSubscript:v8];

    v20 = [(MBPeerMessageCache *)self failureResponses];
    [v20 setObject:0 forKeyedSubscript:v8];

    v21 = objc_retainBlock(v10);
    v22 = [(MBPeerMessageCache *)self mostRecentResponseHandlers];
    [v22 setObject:v21 forKeyedSubscript:v8];

    v23 = [(MBPeerMessageCache *)self currentTransactionsByTask];
    [v23 setObject:v9 forKeyedSubscript:v8];

    os_unfair_lock_unlock(p_cacheLock);
  }

  return v14 ^ 1;
}

- (void)finishedHandlingTask:(id)a3 response:(id)a4 responseError:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  v11 = [(MBPeerMessageCache *)self successResponses];
  [v11 setObject:v8 forKeyedSubscript:v15];

  v12 = [(MBPeerMessageCache *)self failureResponses];
  [v12 setObject:v9 forKeyedSubscript:v15];

  objc_super v13 = [(MBPeerMessageCache *)self mostRecentResponseHandlers];
  unsigned int v14 = [v13 objectForKeyedSubscript:v15];

  if (!v14) {
    __assert_rtn("-[MBPeerMessageCache finishedHandlingTask:response:responseError:]", "MBPeerMessageCache.m", 89, "cachedResponseHandler != nil");
  }
  ((void (**)(void, id, id))v14)[2](v14, v8, v9);
  os_unfair_lock_unlock(p_cacheLock);
}

- (void)reset
{
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  uint64_t v4 = [(MBPeerMessageCache *)self successResponses];
  [v4 removeAllObjects];

  v5 = [(MBPeerMessageCache *)self failureResponses];
  [v5 removeAllObjects];

  uint64_t v6 = [(MBPeerMessageCache *)self mostRecentResponseHandlers];
  [v6 removeAllObjects];

  v7 = [(MBPeerMessageCache *)self currentTransactionsByTask];
  [v7 removeAllObjects];

  os_unfair_lock_unlock(p_cacheLock);
}

- (os_unfair_lock_s)cacheLock
{
  return self->_cacheLock;
}

- (void)setCacheLock:(os_unfair_lock_s)a3
{
  self->_cacheLock = a3;
}

- (NSMutableDictionary)successResponses
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)failureResponses
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)mostRecentResponseHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableDictionary)currentTransactionsByTask
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransactionsByTask, 0);
  objc_storeStrong((id *)&self->_mostRecentResponseHandlers, 0);
  objc_storeStrong((id *)&self->_failureResponses, 0);
  objc_storeStrong((id *)&self->_successResponses, 0);
}

@end