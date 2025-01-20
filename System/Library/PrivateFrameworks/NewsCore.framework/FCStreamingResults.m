@interface FCStreamingResults
- (BOOL)isFinished;
- (FCAsyncSerialQueue)serialQueue;
- (FCStreaming)underlyingStream;
- (FCStreamingResults)init;
- (FCStreamingResults)initWithResults:(id)a3 followedByStream:(id)a4;
- (FCStreamingResults)initWithStream:(id)a3;
- (NSHashTable)observers;
- (NSMutableArray)results;
- (_NSRange)range;
- (id)array;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (id)objectsInRange:(_NSRange)a3;
- (unint64_t)count;
- (void)addObserver:(id)a3;
- (void)fetchAllObjectsWithBatchSize:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5;
- (void)fetchObjectsUpToCount:(unint64_t)a3;
- (void)fetchObjectsUpToCount:(unint64_t)a3 completion:(id)a4;
- (void)fetchObjectsUpToCount:(unint64_t)a3 qualityOfService:(int64_t)a4;
- (void)fetchObjectsUpToCount:(unint64_t)a3 qualityOfService:(int64_t)a4 batchSize:(unint64_t)a5 completion:(id)a6;
- (void)fetchObjectsUpToCount:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5;
- (void)removeObserver:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation FCStreamingResults

- (FCStreamingResults)initWithStream:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "stream != nil");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCStreamingResults initWithStream:]";
    __int16 v19 = 2080;
    v20 = "FCStreamingResults.m";
    __int16 v21 = 1024;
    int v22 = 33;
    __int16 v23 = 2114;
    v24 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v16.receiver = self;
  v16.super_class = (Class)FCStreamingResults;
  v6 = [(FCStreamingResults *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingStream, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    results = v7->_results;
    v7->_results = v8;

    v10 = objc_alloc_init(FCAsyncSerialQueue);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = v10;

    uint64_t v12 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v12;
  }
  return v7;
}

- (FCStreamingResults)init
{
  v3 = objc_opt_new();
  v4 = [(FCStreamingResults *)self initWithStream:v3];

  return v4;
}

- (FCStreamingResults)initWithResults:(id)a3 followedByStream:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "stream != nil");
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCStreamingResults initWithResults:followedByStream:]";
    __int16 v14 = 2080;
    v15 = "FCStreamingResults.m";
    __int16 v16 = 1024;
    int v17 = 48;
    __int16 v18 = 2114;
    __int16 v19 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v8 = [(FCStreamingResults *)self initWithStream:v7];
  v9 = v8;
  if (v6 && v8) {
    [(NSMutableArray *)v8->_results addObjectsFromArray:v6];
  }

  return v9;
}

- (BOOL)isFinished
{
  v2 = [(FCStreamingResults *)self underlyingStream];
  char v3 = [v2 isFinished];

  return v3;
}

- (unint64_t)count
{
  [MEMORY[0x1E4F29060] isMainThread];
  char v3 = [(FCStreamingResults *)self results];
  unint64_t v4 = [v3 count];

  return v4;
}

- (_NSRange)range
{
  [MEMORY[0x1E4F29060] isMainThread];
  NSUInteger v3 = [(FCStreamingResults *)self count];
  NSUInteger v4 = 0;
  result.length = v3;
  result.location = v4;
  return result;
}

- (id)objectAtIndex:(unint64_t)a3
{
  [MEMORY[0x1E4F29060] isMainThread];
  id v5 = [(FCStreamingResults *)self results];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    v8 = 0;
  }
  else
  {
    id v7 = [(FCStreamingResults *)self results];
    v8 = [v7 objectAtIndex:a3];
  }
  return v8;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  [MEMORY[0x1E4F29060] isMainThread];
  return [(FCStreamingResults *)self objectAtIndex:a3];
}

- (id)objectsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  [MEMORY[0x1E4F29060] isMainThread];
  unint64_t v6 = [(FCStreamingResults *)self results];
  id v7 = objc_msgSend(v6, "subarrayWithRange:", location, length);

  return v7;
}

- (id)array
{
  [MEMORY[0x1E4F29060] isMainThread];
  return [(FCStreamingResults *)self results];
}

- (void)fetchObjectsUpToCount:(unint64_t)a3
{
}

- (void)fetchObjectsUpToCount:(unint64_t)a3 qualityOfService:(int64_t)a4
{
}

- (void)fetchObjectsUpToCount:(unint64_t)a3 completion:(id)a4
{
}

- (void)fetchObjectsUpToCount:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
}

- (void)fetchAllObjectsWithBatchSize:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
}

- (void)fetchObjectsUpToCount:(unint64_t)a3 qualityOfService:(int64_t)a4 batchSize:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  v11 = [(FCStreamingResults *)self serialQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__FCStreamingResults_fetchObjectsUpToCount_qualityOfService_batchSize_completion___block_invoke;
  v13[3] = &unk_1E5B56528;
  unint64_t v15 = a3;
  unint64_t v16 = a5;
  int64_t v17 = a4;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 enqueueBlockForMainThread:v13];
}

void __82__FCStreamingResults_fetchObjectsUpToCount_qualityOfService_batchSize_completion___block_invoke(uint64_t a1, void *a2)
{
  NSUInteger v3 = a2;
  unint64_t v4 = [*(id *)(a1 + 32) count];
  if (*(void *)(a1 + 48) <= v4
    || (unint64_t v5 = v4,
        [*(id *)(a1 + 32) underlyingStream],
        unint64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isFinished],
        v6,
        (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
    }
    v3[2](v3);
  }
  else
  {
    if (*(void *)(a1 + 48) - v5 >= *(void *)(a1 + 56)) {
      unint64_t v9 = *(void *)(a1 + 56);
    }
    else {
      unint64_t v9 = *(void *)(a1 + 48) - v5;
    }
    id v10 = [*(id *)(a1 + 32) underlyingStream];
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 64);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __82__FCStreamingResults_fetchObjectsUpToCount_qualityOfService_batchSize_completion___block_invoke_2;
    v16[3] = &unk_1E5B56500;
    v13 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 48);
    unint64_t v19 = v5;
    uint64_t v20 = v14;
    uint64_t v21 = v12;
    uint64_t v22 = v11;
    id v17 = v13;
    __int16 v18 = v3;
    id v15 = (id)[v10 fetchMoreResultsWithLimit:v9 qualityOfService:v12 callbackQueue:MEMORY[0x1E4F14428] completionHandler:v16];
  }
}

void __82__FCStreamingResults_fetchObjectsUpToCount_qualityOfService_batchSize_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v31 = a3;
  unint64_t v6 = [*(id *)(a1 + 32) results];
  uint64_t v7 = [v6 count];
  uint64_t v8 = *(void *)(a1 + 56);

  if (v7 != v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v30 = (void *)[[NSString alloc] initWithFormat:@"async results are out of sync"];
    *(_DWORD *)buf = 136315906;
    v44 = "-[FCStreamingResults fetchObjectsUpToCount:qualityOfService:batchSize:completion:]_block_invoke_2";
    __int16 v45 = 2080;
    v46 = "FCStreamingResults.m";
    __int16 v47 = 1024;
    int v48 = 154;
    __int16 v49 = 2114;
    v50 = v30;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  unint64_t v9 = [*(id *)(a1 + 32) results];
  [v9 addObjectsFromArray:v5];

  uint64_t v10 = *(void *)(a1 + 56);
  id v32 = v5;
  uint64_t v11 = [v5 count];
  uint64_t v12 = [*(id *)(a1 + 32) observers];
  v13 = (void *)[v12 copy];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v14);
        }
        unint64_t v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v19, "results:didFetchObjectsInRange:", *(void *)(a1 + 32), v10, v11);
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [*(id *)(a1 + 32) underlyingStream];
  int v21 = [v20 isFinished];

  if (v21)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v22 = v14;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v33 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            [v27 resultsDidFinish:*(void *)(a1 + 32)];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v24);
    }
  }
  if (v31)
  {
    uint64_t v28 = *(void *)(a1 + 40);
    v29 = v32;
    if (v28) {
      (*(void (**)(uint64_t, id))(v28 + 16))(v28, v31);
    }
  }
  else
  {
    [*(id *)(a1 + 32) fetchObjectsUpToCount:*(void *)(a1 + 64) qualityOfService:*(void *)(a1 + 72) batchSize:*(void *)(a1 + 80) completion:*(void *)(a1 + 40)];
    v29 = v32;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)addObserver:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    id v5 = [(FCStreamingResults *)self observers];
    int v6 = [v5 containsObject:v4];

    if (v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%p is already an observer", v4);
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = "-[FCStreamingResults addObserver:]";
      __int16 v11 = 2080;
      uint64_t v12 = "FCStreamingResults.m";
      __int16 v13 = 1024;
      int v14 = 208;
      __int16 v15 = 2114;
      uint64_t v16 = v8;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    uint64_t v7 = [(FCStreamingResults *)self observers];
    [v7 addObject:v4];
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v10 = "-[FCStreamingResults addObserver:]";
    __int16 v11 = 2080;
    uint64_t v12 = "FCStreamingResults.m";
    __int16 v13 = 1024;
    int v14 = 204;
    __int16 v15 = 2114;
    uint64_t v16 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_8:
}

- (void)removeObserver:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    id v5 = [(FCStreamingResults *)self observers];
    [v5 removeObject:v4];
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v7 = "-[FCStreamingResults removeObserver:]";
    __int16 v8 = 2080;
    unint64_t v9 = "FCStreamingResults.m";
    __int16 v10 = 1024;
    int v11 = 217;
    __int16 v12 = 2114;
    __int16 v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_5:
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (FCStreaming)underlyingStream
{
  return self->_underlyingStream;
}

- (NSMutableArray)results
{
  return self->_results;
}

- (FCAsyncSerialQueue)serialQueue
{
  return self->_serialQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_underlyingStream, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end