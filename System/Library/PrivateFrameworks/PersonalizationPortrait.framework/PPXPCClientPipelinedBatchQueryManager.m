@interface PPXPCClientPipelinedBatchQueryManager
+ (void)assertBatch:(id)a3 forQueryName:(id)a4 hasExpectedContainedType:(Class)a5;
- (BOOL)syncExecuteQueryWithName:(id)a3 error:(id *)a4 queryInitializer:(id)a5 handleBatch:(id)a6;
- (PPXPCClientPipelinedBatchQueryManager)initWithName:(id)a3;
- (void)cancelPendingQueriesWithError:(id)a3;
- (void)handleReplyWithName:(id)a3 batch:(id)a4 isLast:(BOOL)a5 error:(id)a6 queryId:(unint64_t)a7 completion:(id)a8;
@end

@implementation PPXPCClientPipelinedBatchQueryManager

- (void)cancelPendingQueriesWithError:(id)a3
{
  id v4 = a3;
  v5 = self->_queryContexts;
  objc_sync_enter(v5);
  queryContexts = self->_queryContexts;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__PPXPCClientPipelinedBatchQueryManager_cancelPendingQueriesWithError___block_invoke;
  v8[3] = &unk_1E550E9F0;
  id v7 = v4;
  id v9 = v7;
  [(NSMutableDictionary *)queryContexts enumerateKeysAndObjectsUsingBlock:v8];

  objc_sync_exit(v5);
}

- (PPXPCClientPipelinedBatchQueryManager)initWithName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PPXPCClientSupport.m", 170, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)PPXPCClientPipelinedBatchQueryManager;
  v6 = [(PPXPCClientPipelinedBatchQueryManager *)&v18 init];
  id v7 = v6;
  if (v6)
  {
    atomic_store(0, &v6->_queryId);
    uint64_t v8 = objc_opt_new();
    queryContexts = v7->_queryContexts;
    v7->_queryContexts = (NSMutableDictionary *)v8;

    id v10 = (id) [[NSString alloc] initWithFormat:@"%@-completion", v5];
    v11 = (const char *)[v10 UTF8String];
    if (!v11)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, v7, @"PPXPCClientSupport.m", 177, @"Invalid parameter not satisfying: %@", @"utf8Name" object file lineNumber description];
    }
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v13;
  }
  return v7;
}

- (BOOL)syncExecuteQueryWithName:(id)a3 error:(id *)a4 queryInitializer:(id)a5 handleBatch:(id)a6
{
  id v24 = a3;
  id v9 = (void (**)(id, unint64_t))a5;
  id v10 = a6;
  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)&self->_queryId, 1uLL);
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__4766;
  v33 = __Block_byref_object_dispose__4767;
  id v34 = 0;
  dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_4768);
  dispatch_queue_t v13 = objc_opt_new();
  [v13 setQueue:self->_queue];
  [v13 setHandleBatch:v10];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __101__PPXPCClientPipelinedBatchQueryManager_syncExecuteQueryWithName_error_queryInitializer_handleBatch___block_invoke_2;
  v25[3] = &unk_1E550E978;
  v27 = &v35;
  v28 = &v29;
  v25[4] = self;
  id v14 = v12;
  id v26 = v14;
  [v13 setFinalizeCall:v25];
  v15 = self->_queryContexts;
  objc_sync_enter(v15);
  queryContexts = self->_queryContexts;
  v17 = [NSNumber numberWithUnsignedLongLong:add];
  [(NSMutableDictionary *)queryContexts setObject:v13 forKeyedSubscript:v17];

  objc_sync_exit(v15);
  v9[2](v9, add);
  dispatch_block_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  objc_super v18 = self->_queryContexts;
  objc_sync_enter(v18);
  v19 = self->_queryContexts;
  v20 = [NSNumber numberWithUnsignedLongLong:add];
  [(NSMutableDictionary *)v19 setObject:0 forKeyedSubscript:v20];

  objc_sync_exit(v18);
  if (a4) {
    *a4 = (id) v30[5];
  }
  char v21 = *((unsigned char *)v36 + 24);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v21;
}

uint64_t __99__PPXPCClientPipelinedBatchQueryManager_handleReplyWithName_batch_isLast_error_queryId_completion___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    id v4 = [v2 handleBatch];
    v4[2](v4, *(void *)(a1 + 32), *(void *)(a1 + 40) + 8);

    if (!*(unsigned char *)(a1 + 64)) {
      goto LABEL_6;
    }
    v2 = *(void **)(a1 + 40);
    uint64_t v5 = 1;
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v5 = 0;
  }
  [v2 finalizeCallWithSuccess:v5 error:v6];
LABEL_6:
  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v7();
}

void __101__PPXPCClientPipelinedBatchQueryManager_syncExecuteQueryWithName_error_queryInitializer_handleBatch___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), obj);
  id v5 = obj;
  dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 24), *(dispatch_block_t *)(a1 + 40));
}

+ (void)assertBatch:(id)a3 forQueryName:(id)a4 hasExpectedContainedType:(Class)a5
{
  id v12 = a3;
  id v8 = a4;
  if ([v12 count])
  {
    id v9 = [v12 objectAtIndexedSubscript:0];
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, a1, @"PPXPCClientSupport.m", 272, @"Received incorrect batch type for query named %@", v8 object file lineNumber description];
    }
  }
}

- (void)handleReplyWithName:(id)a3 batch:(id)a4 isLast:(BOOL)a5 error:(id)a6 queryId:(unint64_t)a7 completion:(id)a8
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  objc_super v18 = self->_queryContexts;
  objc_sync_enter(v18);
  queryContexts = self->_queryContexts;
  v20 = [NSNumber numberWithUnsignedLongLong:a7];
  char v21 = [(NSMutableDictionary *)queryContexts objectForKeyedSubscript:v20];

  objc_sync_exit(v18);
  if (v21)
  {
    v22 = [v21 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __99__PPXPCClientPipelinedBatchQueryManager_handleReplyWithName_batch_isLast_error_queryId_completion___block_invoke;
    block[3] = &unk_1E550E9A0;
    id v27 = v15;
    id v28 = v21;
    BOOL v31 = a5;
    id v29 = v16;
    id v30 = v17;
    dispatch_async(v22, block);
  }
  else
  {
    unint64_t v23 = atomic_load(&self->_queryId);
    id v24 = pp_xpc_client_log_handle();
    v25 = v24;
    if (v23 <= a7)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v33 = v14;
        __int16 v34 = 2048;
        unint64_t v35 = a7;
        _os_log_error_impl(&dword_18CAA6000, v25, OS_LOG_TYPE_ERROR, "Received batch reply of type %@ for unknown queryId %llu.", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v33 = v14;
      __int16 v34 = 2048;
      unint64_t v35 = a7;
      _os_log_debug_impl(&dword_18CAA6000, v25, OS_LOG_TYPE_DEBUG, "Received batch reply of type %@ for old queryId %llu.", buf, 0x16u);
    }

    (*((void (**)(id, uint64_t))v17 + 2))(v17, 1);
  }
}

uint64_t __71__PPXPCClientPipelinedBatchQueryManager_cancelPendingQueriesWithError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finalizeCallWithSuccess:0 error:*(void *)(a1 + 40)];
}

void __71__PPXPCClientPipelinedBatchQueryManager_cancelPendingQueriesWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__PPXPCClientPipelinedBatchQueryManager_cancelPendingQueriesWithError___block_invoke_2;
  v7[3] = &unk_1E550E9C8;
  id v8 = v4;
  id v9 = *(id *)(a1 + 32);
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queryContexts, 0);
}

@end