@interface BRCAggregateOperation
- (BOOL)shouldRetryForError:(id)a3;
- (BRCAggregateOperation)initWithSyncContext:(id)a3 sessionContext:(id)a4 subOperations:(id)a5;
- (id)wrapperOperationCompletionHandler;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setWrapperOperationCompletionHandler:(id)a3;
@end

@implementation BRCAggregateOperation

- (BRCAggregateOperation)initWithSyncContext:(id)a3 sessionContext:(id)a4 subOperations:(id)a5
{
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BRCAggregateOperation;
  v9 = [(_BRCOperation *)&v15 initWithName:@"wrapperOperation" syncContext:a3 sessionContext:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    subOperations = v9->_subOperations;
    v9->_subOperations = (NSArray *)v10;

    uint64_t v12 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
    resultDictionary = v9->_resultDictionary;
    v9->_resultDictionary = (NSMutableDictionary *)v12;
  }
  return v9;
}

- (void)main
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = dispatch_group_create();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__47;
  v23[4] = __Block_byref_object_dispose__47;
  id v24 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obj = self->_subOperations;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v19 + 1) + 8 * v7);
        dispatch_group_enter(v3);
        [v8 setIgnoreMissingRemoteClientProxy:1];
        v9 = [v8 finishBlock];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __29__BRCAggregateOperation_main__block_invoke;
        v14[3] = &unk_2650859F0;
        v14[4] = self;
        v17 = v23;
        uint64_t v18 = v5 + v7;
        id v10 = v9;
        id v16 = v10;
        objc_super v15 = v3;
        [v8 setFinishBlock:v14];
        [(_BRCOperation *)self addSubOperation:v8];

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v25 count:16];
      v5 += v7;
    }
    while (v4);
  }

  v11 = [(_BRCOperation *)self callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__BRCAggregateOperation_main__block_invoke_2;
  block[3] = &unk_2650816E8;
  block[4] = self;
  block[5] = v23;
  dispatch_group_notify(v3, v11, block);

  _Block_object_dispose(v23, 8);
}

void __29__BRCAggregateOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v9 = *(void *)(v7 + 40);
  id v8 = (id *)(v7 + 40);
  if (!v9)
  {
    if (v5)
    {
      objc_storeStrong(v8, a3);
      if (([*(id *)(a1 + 32) isCancelled] & 1) == 0) {
        [*(id *)(a1 + 32) cancel];
      }
    }
    else if (v13)
    {
      v11 = *(void **)(*(void *)(a1 + 32) + 528);
      uint64_t v12 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
      [v11 setObject:v13 forKeyedSubscript:v12];
    }
  }
  objc_sync_exit(v6);

  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v13, v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __29__BRCAggregateOperation_main__block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = v2[66];
  }
  return objc_msgSend(v2, "completedWithResult:error:", v3);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BRCAggregateOperation *)self wrapperOperationCompletionHandler];
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    [(BRCAggregateOperation *)self setWrapperOperationCompletionHandler:0];
  }

  v10.receiver = self;
  v10.super_class = (Class)BRCAggregateOperation;
  [(_BRCFrameworkOperation *)&v10 finishWithResult:v6 error:v7];
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (id)wrapperOperationCompletionHandler
{
  return self->_wrapperOperationCompletionHandler;
}

- (void)setWrapperOperationCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_wrapperOperationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_resultDictionary, 0);
  objc_storeStrong((id *)&self->_subOperations, 0);
}

@end