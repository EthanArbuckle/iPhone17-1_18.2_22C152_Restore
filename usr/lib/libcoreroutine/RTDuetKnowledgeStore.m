@interface RTDuetKnowledgeStore
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)requestQueue;
- (RTDuetKnowledgeStore)init;
- (_DKKnowledgeQuerying)knowledgeStoreQuery;
- (_DKKnowledgeStore)knowledgeStore;
- (void)clearEventsFromStream:(id)a3 completion:(id)a4;
- (void)executeQuery:(id)a3 completion:(id)a4;
- (void)reset;
- (void)resume;
- (void)saveEvents:(id)a3 completion:(id)a4;
- (void)setKnowledgeStore:(id)a3;
- (void)setKnowledgeStoreQuery:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequestQueue:(id)a3;
@end

@implementation RTDuetKnowledgeStore

- (RTDuetKnowledgeStore)init
{
  v13.receiver = self;
  v13.super_class = (Class)RTDuetKnowledgeStore;
  v2 = [(RTDuetKnowledgeStore *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = (const char *)[(RTDuetKnowledgeStore *)v4 UTF8String];
    }
    else
    {
      id v7 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v4];
      v6 = (const char *)[v7 UTF8String];
    }
    dispatch_queue_t v8 = dispatch_queue_create(v6, v5);

    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create_with_target_V2("RTDuetKnowledgeStore-requests", 0, (dispatch_queue_t)v4->_queue);
    requestQueue = v4->_requestQueue;
    v4->_requestQueue = (OS_dispatch_queue *)v10;
  }
  return v3;
}

- (void)executeQuery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__RTDuetKnowledgeStore_executeQuery_completion___block_invoke;
  block[3] = &unk_1E6B92668;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(requestQueue, block);
}

void __48__RTDuetKnowledgeStore_executeQuery_completion___block_invoke(void *a1)
{
  dispatch_suspend(*(dispatch_object_t *)(a1[4] + 24));
  if (!*(void *)(a1[4] + 8))
  {
    uint64_t v2 = [MEMORY[0x1E4F5B560] knowledgeStoreWithDirectReadOnlyAccess];
    uint64_t v3 = a1[4];
    v4 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = v2;
  }
  uint64_t v5 = a1[4];
  id v6 = *(void **)(v5 + 8);
  if (v6) {
    [v6 executeQuery:a1[5] responseQueue:*(void *)(v5 + 32) withCompletion:a1[6]];
  }
  else {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (void)resume
{
}

- (void)reset
{
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__RTDuetKnowledgeStore_reset__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(requestQueue, block);
}

void __29__RTDuetKnowledgeStore_reset__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;
}

- (void)saveEvents:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__RTDuetKnowledgeStore_saveEvents_completion___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(requestQueue, block);
}

uint64_t __46__RTDuetKnowledgeStore_saveEvents_completion___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void **)(v2 + 16);
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F5B560] knowledgeStore];
    uint64_t v5 = a1[4];
    id v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;

    uint64_t v2 = a1[4];
    uint64_t v3 = *(void **)(v2 + 16);
  }
  uint64_t v7 = *(void *)(v2 + 32);
  uint64_t v8 = a1[5];
  uint64_t v9 = a1[6];

  return [v3 saveObjects:v8 responseQueue:v7 withCompletion:v9];
}

- (void)clearEventsFromStream:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__RTDuetKnowledgeStore_clearEventsFromStream_completion___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(requestQueue, block);
}

void __57__RTDuetKnowledgeStore_clearEventsFromStream_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F5B560] knowledgeStore];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;

    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v2 + 16);
  }
  uint64_t v7 = *(void *)(v2 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__RTDuetKnowledgeStore_clearEventsFromStream_completion___block_invoke_2;
  v9[3] = &unk_1E6B9AA68;
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  [v3 deleteAllEventsInEventStream:v8 responseQueue:v7 withCompletion:v9];
}

uint64_t __57__RTDuetKnowledgeStore_clearEventsFromStream_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a3 != 0);
}

- (_DKKnowledgeQuerying)knowledgeStoreQuery
{
  return self->_knowledgeStoreQuery;
}

- (void)setKnowledgeStoreQuery:(id)a3
{
}

- (_DKKnowledgeStore)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);

  objc_storeStrong((id *)&self->_knowledgeStoreQuery, 0);
}

@end