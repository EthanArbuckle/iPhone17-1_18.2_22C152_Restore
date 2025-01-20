@interface FCFetchOperation
- (BOOL)canSendFetchCompletionSynchronously;
- (BOOL)shouldFailOnMissingObjects;
- (FCFetchOperation)init;
- (FCFetchOperationResult)result;
- (OS_dispatch_queue)fetchCompletionQueue;
- (double)maximumCachedAge;
- (id)fetchCompletionBlock;
- (unint64_t)cachePolicy;
- (void)cancel;
- (void)finishExecutingWithError:(id)a3;
- (void)finishExecutingWithFetchedObject:(id)a3;
- (void)finishExecutingWithResult:(id)a3;
- (void)finishExecutingWithStatus:(unint64_t)a3;
- (void)finishFromEarlyCancellation;
- (void)operationDidFinishWithError:(id)a3;
- (void)setCachePolicy:(unint64_t)a3;
- (void)setCanSendFetchCompletionSynchronously:(BOOL)a3;
- (void)setFetchCompletionBlock:(id)a3;
- (void)setFetchCompletionQueue:(id)a3;
- (void)setMaximumCachedAge:(double)a3;
- (void)setShouldFailOnMissingObjects:(BOOL)a3;
- (void)takeInputsFromFetchOperation:(id)a3;
@end

@implementation FCFetchOperation

- (FCFetchOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)FCFetchOperation;
  result = [(FCOperation *)&v3 init];
  if (result) {
    result->_cachePolicy = 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchCompletionQueue, 0);
  objc_storeStrong(&self->_fetchCompletionBlock, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

- (void)setFetchCompletionBlock:(id)a3
{
}

- (void)operationDidFinishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(FCFetchOperation *)self fetchCompletionBlock];
  if (v4)
  {
    v6 = self;
    objc_sync_enter(v6);
    if (!v6->_result)
    {
      uint64_t v7 = +[FCFetchOperationResult resultWithStatus:3 fetchedObject:0 error:v4];
      result = v6->_result;
      v6->_result = (FCFetchOperationResult *)v7;
    }
    objc_sync_exit(v6);
  }
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __48__FCFetchOperation_operationDidFinishWithError___block_invoke;
  v19 = &unk_1E5B4C7C0;
  v20 = self;
  id v21 = v5;
  id v9 = v5;
  v10 = (void (**)(void))_Block_copy(&v16);
  if ([(FCFetchOperation *)self canSendFetchCompletionSynchronously])
  {
    v10[2](v10);
  }
  else
  {
    v11 = [(FCFetchOperation *)self fetchCompletionQueue];
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      v13 = FCDispatchQueueForQualityOfService([(FCFetchOperation *)self qualityOfService]);
    }
    v14 = v13;

    v15 = FCBlockWithQualityOfService([(FCFetchOperation *)self qualityOfService], v10);
    dispatch_async(v14, v15);
  }
}

- (id)fetchCompletionBlock
{
  return objc_getProperty(self, a2, 400, 1);
}

- (BOOL)canSendFetchCompletionSynchronously
{
  return self->_canSendFetchCompletionSynchronously;
}

void __48__FCFetchOperation_operationDidFinishWithError___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) result];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (FCFetchOperationResult)result
{
  return (FCFetchOperationResult *)objc_getProperty(self, a2, 368, 1);
}

- (void)setCanSendFetchCompletionSynchronously:(BOOL)a3
{
  self->_canSendFetchCompletionSynchronously = a3;
}

- (void)setShouldFailOnMissingObjects:(BOOL)a3
{
  self->_shouldFailOnMissingObjects = a3;
}

- (OS_dispatch_queue)fetchCompletionQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 408, 1);
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (void)takeInputsFromFetchOperation:(id)a3
{
  id v4 = a3;
  -[FCOperation setQualityOfService:](self, "setQualityOfService:", [v4 qualityOfService]);
  -[FCOperation setRelativePriority:](self, "setRelativePriority:", [v4 relativePriority]);
  -[FCFetchOperation setCachePolicy:](self, "setCachePolicy:", [v4 cachePolicy]);
  [v4 maximumCachedAge];
  -[FCFetchOperation setMaximumCachedAge:](self, "setMaximumCachedAge:");
  uint64_t v5 = [v4 shouldFailOnMissingObjects];

  [(FCFetchOperation *)self setShouldFailOnMissingObjects:v5];
}

- (double)maximumCachedAge
{
  return self->_maximumCachedAge;
}

- (void)finishExecutingWithResult:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)[[NSString alloc] initWithFormat:@"can't finish executing a fetch operation without a result"];
    *(_DWORD *)buf = 136315906;
    uint64_t v17 = "-[FCFetchOperation finishExecutingWithResult:]";
    __int16 v18 = 2080;
    v19 = "FCFetchOperation.m";
    __int16 v20 = 1024;
    int v21 = 73;
    __int16 v22 = 2114;
    v23 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v5->_result)
  {
    objc_sync_exit(v5);
  }
  else
  {
    if ([(FCFetchOperation *)v5 shouldFailOnMissingObjects]
      && ![v4 status]
      && [v4 anyMissingObjects])
    {
      uint64_t v6 = [(FCFetchOperation *)v5 cachePolicy];
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      if (v6 == 3)
      {
        v8 = [v4 missingObjectDescriptions];
        id v9 = objc_msgSend(v7, "fc_notCachedErrorWithMissingObjects:", v8);
      }
      else
      {
        v8 = objc_msgSend(v4, "missingObjectDescriptions", @"FCErrorMissingObjectsDescriptionsKey");
        v15 = v8;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
        id v9 = objc_msgSend(v7, "fc_partialFailureErrorWithUserInfo:", v11);
      }
      uint64_t v12 = +[FCFetchOperationResult resultWithStatus:3 fetchedObject:0 error:v9];

      id v4 = (id)v12;
    }
    objc_storeStrong((id *)&v5->_result, v4);
    objc_sync_exit(v5);

    uint64_t v13 = [v4 error];
    [(FCOperation *)v5 finishedPerformingOperationWithError:v13];
    uint64_t v5 = (FCFetchOperation *)v13;
  }
}

- (BOOL)shouldFailOnMissingObjects
{
  return self->_shouldFailOnMissingObjects;
}

- (void)setCachePolicy:(unint64_t)a3
{
  self->_cachePolicy = a3;
}

- (void)setMaximumCachedAge:(double)a3
{
  self->_maximumCachedAge = a3;
}

- (void)setFetchCompletionQueue:(id)a3
{
}

- (void)finishExecutingWithFetchedObject:(id)a3
{
  id v4 = +[FCFetchOperationResult resultWithStatus:0 fetchedObject:a3 error:0];
  [(FCFetchOperation *)self finishExecutingWithResult:v4];
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)FCFetchOperation;
  [(FCOperation *)&v4 cancel];
  if ([(FCOperation *)self hasOperationStarted])
  {
    objc_super v3 = +[FCFetchOperationResult resultWithStatus:1 fetchedObject:0 error:0];
    [(FCFetchOperation *)self finishExecutingWithResult:v3];
  }
}

- (void)finishExecutingWithStatus:(unint64_t)a3
{
  id v4 = +[FCFetchOperationResult resultWithStatus:a3 fetchedObject:0 error:0];
  [(FCFetchOperation *)self finishExecutingWithResult:v4];
}

- (void)finishExecutingWithError:(id)a3
{
  id v4 = +[FCFetchOperationResult resultWithStatus:3 fetchedObject:0 error:a3];
  [(FCFetchOperation *)self finishExecutingWithResult:v4];
}

- (void)finishFromEarlyCancellation
{
  id v3 = +[FCFetchOperationResult resultWithStatus:1 fetchedObject:0 error:0];
  [(FCFetchOperation *)self finishExecutingWithResult:v3];
}

@end