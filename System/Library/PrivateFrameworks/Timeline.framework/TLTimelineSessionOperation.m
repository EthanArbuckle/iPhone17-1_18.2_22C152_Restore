@interface TLTimelineSessionOperation
- (NSArray)operations;
- (NSError)sessionError;
- (NSOperationQueue)operationQueue;
- (TLTimelineDataSourceProvider)provider;
- (TLTimelineSessionOperation)initWithProvider:(id)a3 operations:(id)a4 providerTimeout:(double)a5 operationTimeout:(double)a6;
- (double)operationTimeout;
- (double)providerTimeout;
- (id)sessionCompletionBlock;
- (void)cancel;
- (void)main;
- (void)setSessionCompletionBlock:(id)a3;
- (void)setSessionError:(id)a3;
@end

@implementation TLTimelineSessionOperation

- (TLTimelineSessionOperation)initWithProvider:(id)a3 operations:(id)a4 providerTimeout:(double)a5 operationTimeout:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  v23.receiver = self;
  v23.super_class = (Class)TLTimelineSessionOperation;
  v13 = [(TLTimelineSessionOperation *)&v23 init];
  v14 = v13;
  if (v13)
  {
    v13->_providerTimeout = a5;
    v13->_operationTimeout = a6;
    objc_storeStrong((id *)&v13->_provider, a3);
    v15 = [v12 sortedArrayUsingComparator:&__block_literal_global_1];
    objc_storeStrong((id *)&v14->_operations, v15);
    v16 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    operationQueue = v14->_operationQueue;
    v14->_operationQueue = v16;

    [(NSOperationQueue *)v14->_operationQueue setMaxConcurrentOperationCount:1];
    objc_initWeak(&location, v14);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __91__TLTimelineSessionOperation_initWithProvider_operations_providerTimeout_operationTimeout___block_invoke_2;
    v20[3] = &unk_264477F68;
    objc_copyWeak(&v21, &location);
    v19.receiver = v14;
    v19.super_class = (Class)TLTimelineSessionOperation;
    [(TLTimelineSessionOperation *)&v19 setCompletionBlock:v20];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v14;
}

uint64_t __91__TLTimelineSessionOperation_initWithProvider_operations_providerTimeout_operationTimeout___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  id v3 = a2;
  v4 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "relativePriority"));
  v5 = NSNumber;
  v6 = objc_opt_class();

  v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "relativePriority"));
  uint64_t v8 = [v4 compare:v7];

  return v8;
}

void __91__TLTimelineSessionOperation_initWithProvider_operations_providerTimeout_operationTimeout___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained sessionError];
  if ([WeakRetained isCancelled])
  {
    uint64_t v2 = [MEMORY[0x263F087E8] errorWithDomain:@"TLOperationDomain" code:400 userInfo:&unk_26CE8DE28];

    v1 = (void *)v2;
  }
  id v3 = [WeakRetained sessionCompletionBlock];

  if (v3)
  {
    v4 = [WeakRetained sessionCompletionBlock];
    ((void (**)(void, void *))v4)[2](v4, v1);
  }
  [WeakRetained setSessionCompletionBlock:0];
}

- (void)cancel
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(TLTimelineSessionOperation *)self operations];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v7++) cancel];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  uint64_t v8 = [(TLTimelineSessionOperation *)self operationQueue];
  v9 = [(TLTimelineSessionOperation *)self operations];
  [v8 addOperations:v9 waitUntilFinished:1];

  v10.receiver = self;
  v10.super_class = (Class)TLTimelineSessionOperation;
  [(TLTimelineSessionOperation *)&v10 cancel];
}

- (void)main
{
  id v3 = [(TLTimelineSessionOperation *)self provider];
  if (v3)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v4 = dispatch_group_create();
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x2020000000;
      char v36 = 0;
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x3032000000;
      v30 = __Block_byref_object_copy__1;
      v31 = __Block_byref_object_dispose__1;
      id v32 = 0;
      dispatch_group_enter(v4);
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __34__TLTimelineSessionOperation_main__block_invoke;
      v23[3] = &unk_264478020;
      v23[4] = self;
      v25 = &v33;
      v26 = &v27;
      uint64_t v5 = v4;
      v24 = v5;
      objc_msgSend(v3, "tl_getDataSourceWithCompletion:", v23);
      [(TLTimelineSessionOperation *)self providerTimeout];
      dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
      [(TLTimelineSessionOperation *)self operationTimeout];
      dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
      dispatch_group_wait(v5, v7);
      objc_super v10 = self;
      objc_sync_enter(v10);
      if (*((unsigned char *)v34 + 24))
      {
        if (v28[5])
        {
          objc_sync_exit(v10);

          dispatch_group_t v11 = dispatch_group_create();
          long long v12 = [(TLTimelineSessionOperation *)v10 operations];
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v18[2] = __34__TLTimelineSessionOperation_main__block_invoke_2;
          v18[3] = &unk_264478098;
          id v21 = &v27;
          long long v13 = v11;
          objc_super v19 = v13;
          v20 = v10;
          dispatch_time_t v22 = v9;
          [v12 enumerateObjectsUsingBlock:v18];

          objc_super v10 = v13;
LABEL_12:

          _Block_object_dispose(&v27, 8);
          _Block_object_dispose(&v33, 8);
          goto LABEL_13;
        }
        v17 = [MEMORY[0x263F087E8] errorWithDomain:@"TLOperationDomain" code:910 userInfo:&unk_26CE8DEC8];
        [(TLTimelineSessionOperation *)v10 setSessionError:v17];
      }
      else
      {
        v17 = [MEMORY[0x263F087E8] errorWithDomain:@"TLOperationDomain" code:909 userInfo:&unk_26CE8DEA0];
        [(TLTimelineSessionOperation *)v10 setSessionError:v17];
      }

      objc_sync_exit(v10);
      goto LABEL_12;
    }
    long long v14 = (void *)MEMORY[0x263F087E8];
    v15 = &unk_26CE8DE78;
    uint64_t v16 = 905;
  }
  else
  {
    long long v14 = (void *)MEMORY[0x263F087E8];
    v15 = &unk_26CE8DE50;
    uint64_t v16 = 900;
  }
  uint64_t v5 = [v14 errorWithDomain:@"TLOperationDomain" code:v16 userInfo:v15];
  [(TLTimelineSessionOperation *)self setSessionError:v5];
LABEL_13:
}

void __34__TLTimelineSessionOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  double v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  objc_sync_exit(v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __34__TLTimelineSessionOperation_main__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v39[2] = *MEMORY[0x263EF8340];
  id v6 = a2;
  [v6 setDataSource:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  id v7 = [v6 operationCompletionBlock];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __34__TLTimelineSessionOperation_main__block_invoke_3;
  v30[3] = &unk_264478048;
  v30[4] = *(void *)(a1 + 40);
  uint64_t v33 = &v34;
  id v25 = v7;
  id v32 = v25;
  id v31 = *(id *)(a1 + 32);
  [v6 setOperationCompletionBlock:v30];
  double v8 = [*(id *)(a1 + 40) operationQueue];
  [v8 addOperation:v6];

  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), *(void *)(a1 + 56));
  id v9 = *(id *)(a1 + 40);
  objc_sync_enter(v9);
  if (!*((unsigned char *)v35 + 24))
  {
    objc_super v10 = (void *)MEMORY[0x263F087E8];
    v38[0] = @"description";
    v38[1] = @"operationName";
    v39[0] = @"Operation timed out";
    dispatch_group_t v11 = (objc_class *)objc_opt_class();
    long long v12 = NSStringFromClass(v11);
    v39[1] = v12;
    long long v13 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
    long long v14 = [v10 errorWithDomain:@"TLOperationDomain" code:930 userInfo:v13];

    [*(id *)(a1 + 40) setSessionError:v14];
  }
  v26 = [*(id *)(a1 + 40) sessionError];
  objc_sync_exit(v9);

  if (v26)
  {
    v15 = dispatch_group_create();
    for (unint64_t i = a3 + 1; ; ++i)
    {
      v17 = [*(id *)(a1 + 40) operations];
      BOOL v18 = i < [v17 count];

      if (!v18) {
        break;
      }
      objc_super v19 = [*(id *)(a1 + 40) operations];
      v20 = [v19 objectAtIndex:i];

      [v20 cancel];
      id v21 = [v20 operationCompletionBlock];
      dispatch_group_enter(v15);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __34__TLTimelineSessionOperation_main__block_invoke_4;
      v27[3] = &unk_264478070;
      id v22 = v21;
      id v29 = v22;
      v28 = v15;
      [v20 setOperationCompletionBlock:v27];
      objc_super v23 = [*(id *)(a1 + 40) operationQueue];
      [v23 addOperation:v20];

      dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), *(void *)(a1 + 56));
    }
    *a4 = 1;
  }
  _Block_object_dispose(&v34, 8);
}

void __34__TLTimelineSessionOperation_main__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v17[3] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  objc_sync_exit(v7);

  if (v6)
  {
    double v8 = (void *)MEMORY[0x263F087E8];
    v17[0] = @"Operation failed";
    v16[0] = @"description";
    v16[1] = @"operationName";
    id v9 = (objc_class *)objc_opt_class();
    objc_super v10 = NSStringFromClass(v9);
    v17[1] = v10;
    v16[2] = @"operationError";
    v17[2] = v6;
    dispatch_group_t v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
    long long v12 = [v8 errorWithDomain:@"TLOperationDomain" code:920 userInfo:v11];

    id v13 = *(id *)(a1 + 32);
    objc_sync_enter(v13);
    [*(id *)(a1 + 32) setSessionError:v12];
    objc_sync_exit(v13);
  }
  uint64_t v14 = *(void *)(a1 + 48);
  if (v14) {
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);
  }
  id v15 = *(id *)(a1 + 32);
  objc_sync_enter(v15);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  objc_sync_exit(v15);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __34__TLTimelineSessionOperation_main__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v3);
}

- (TLTimelineDataSourceProvider)provider
{
  return self->_provider;
}

- (NSArray)operations
{
  return self->_operations;
}

- (double)providerTimeout
{
  return self->_providerTimeout;
}

- (double)operationTimeout
{
  return self->_operationTimeout;
}

- (id)sessionCompletionBlock
{
  return objc_getProperty(self, a2, 280, 1);
}

- (void)setSessionCompletionBlock:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (NSError)sessionError
{
  return (NSError *)objc_getProperty(self, a2, 296, 1);
}

- (void)setSessionError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionError, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong(&self->_sessionCompletionBlock, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

@end