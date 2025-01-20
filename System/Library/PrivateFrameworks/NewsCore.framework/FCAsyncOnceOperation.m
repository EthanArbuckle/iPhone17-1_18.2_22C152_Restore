@interface FCAsyncOnceOperation
- (BOOL)finishedExecuting;
- (BOOL)finishedExecutingWithFailure;
- (FCAsyncOnceOperation)initWithBlock:(id)a3;
- (FCAsyncOnceOperation)initWithTarget:(id)a3 selector:(SEL)a4;
- (id)executeWithCallbackQueue:(id)a3 completionHandler:(id)a4;
- (id)executeWithCompletionHandler:(id)a3;
- (void)setRelativePriority:(int64_t)a3;
@end

@implementation FCAsyncOnceOperation

- (id)executeWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v6 = a3;
  v7 = (void (**)(void))a4;
  [(NFMutexLock *)self->_lock lock];
  if (self->_finished)
  {
    [(NFMutexLock *)self->_lock unlock];
    v8 = 0;
LABEL_3:
    v7[2](v7);
    goto LABEL_14;
  }
  unint64_t interest = self->_interest;
  if (!interest)
  {
    if (self->_activeGroup && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)[[NSString alloc] initWithFormat:@"already have an active group"];
      *(_DWORD *)buf = 136315906;
      v23 = "-[FCAsyncOnceOperation executeWithCallbackQueue:completionHandler:]";
      __int16 v24 = 2080;
      v25 = "FCOnce.m";
      __int16 v26 = 1024;
      int v27 = 155;
      __int16 v28 = 2114;
      v29 = v18;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    if (self->_activeOperation && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)[[NSString alloc] initWithFormat:@"already have an active operation"];
      *(_DWORD *)buf = 136315906;
      v23 = "-[FCAsyncOnceOperation executeWithCallbackQueue:completionHandler:]";
      __int16 v24 = 2080;
      v25 = "FCOnce.m";
      __int16 v26 = 1024;
      int v27 = 156;
      __int16 v28 = 2114;
      v29 = v19;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    objc_storeStrong((id *)&self->_activeGroup, v10);
    workBlock = self->_workBlock;
    v20[5] = MEMORY[0x1E4F143A8];
    v20[6] = 3221225472;
    v20[7] = __67__FCAsyncOnceOperation_executeWithCallbackQueue_completionHandler___block_invoke;
    v20[8] = &unk_1E5B56DF0;
    v20[9] = self;
    v21 = v10;
    v12 = (void (*)(void))workBlock[2];
    v13 = v10;
    v14 = workBlock;
    v15 = v12();
    objc_storeStrong((id *)&self->_activeOperation, v15);

    [(FCOperationCanceling *)self->_activeOperation setRelativePriority:self->_relativePriority];
    unint64_t interest = self->_interest;
  }
  self->_unint64_t interest = interest + 1;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__FCAsyncOnceOperation_executeWithCallbackQueue_completionHandler___block_invoke_2;
  v20[3] = &unk_1E5B4C018;
  v20[4] = self;
  v8 = +[FCCancelHandler cancelHandlerWithBlock:v20];
  v16 = self->_activeGroup;
  [(NFMutexLock *)self->_lock unlock];
  if (!v16) {
    goto LABEL_3;
  }
  dispatch_group_notify((dispatch_group_t)v16, v6, v7);

LABEL_14:
  return v8;
}

id __48__FCAsyncOnceOperation_initWithTarget_selector___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = ((void (*)(id, void, void (**)(id, void)))[WeakRetained methodForSelector:*(void *)(a1 + 40)])(WeakRetained, *(void *)(a1 + 40), v3);
  }
  else
  {
    v3[2](v3, 0);
    v6 = 0;
  }

  return v6;
}

- (FCAsyncOnceOperation)initWithTarget:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  objc_initWeak(&location, v6);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__FCAsyncOnceOperation_initWithTarget_selector___block_invoke;
  aBlock[3] = &unk_1E5B56DC8;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a4;
  v7 = _Block_copy(aBlock);
  v8 = [(FCAsyncOnceOperation *)self initWithBlock:v7];

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

  return v8;
}

- (FCAsyncOnceOperation)initWithBlock:(id)a3
{
  id v4 = a3;
  v5 = [(FCAsyncOnceOperation *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id workBlock = v5->_workBlock;
    v5->_id workBlock = (id)v6;

    v8 = (NFMutexLock *)objc_alloc_init(MEMORY[0x1E4F81BE0]);
    lock = v5->_lock;
    v5->_lock = v8;
  }
  return v5;
}

- (id)executeWithCompletionHandler:(id)a3
{
  return [(FCAsyncOnceOperation *)self executeWithCallbackQueue:MEMORY[0x1E4F14428] completionHandler:a3];
}

void __67__FCAsyncOnceOperation_executeWithCallbackQueue_completionHandler___block_invoke(uint64_t a1, char a2)
{
  [*(id *)(*(void *)(a1 + 32) + 56) lock];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    v5 = (NSObject **)(a1 + 40);
    if (*(void *)(v4 + 32) != *(void *)(a1 + 40)) {
      goto LABEL_7;
    }
    *(unsigned char *)(v4 + 8) = 1;
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6 && (*(unsigned char *)(v6 + 9) = a2, (uint64_t v7 = *(void *)(a1 + 32)) != 0))
    {
      *(void *)(v7 + 24) = 0;
      uint64_t v8 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
    v5 = (NSObject **)(a1 + 40);
  }
  -[FCAssetHandle setFetchOperation:](v8, 0);
  -[FCHLSPlaylistState setCurrentStreamInf:](*(void *)(a1 + 32), 0);
  objc_setProperty_nonatomic_copy(*(id *)(a1 + 32), v9, 0, 16);
  uint64_t v4 = *(void *)(a1 + 32);
LABEL_7:
  [*(id *)(v4 + 56) unlock];
  v10 = *v5;
  dispatch_group_leave(v10);
}

- (void)setRelativePriority:(int64_t)a3
{
  [(NFMutexLock *)self->_lock lock];
  self->_relativePriority = a3;
  [(FCOperationCanceling *)self->_activeOperation setRelativePriority:a3];
  objc_opt_class();
  activeOperation = self->_activeOperation;
  if (activeOperation && (objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v6 = activeOperation;
    uint64_t v7 = 25;
    if (!a3) {
      uint64_t v7 = 17;
    }
    if (a3 == -1) {
      uint64_t v8 = 9;
    }
    else {
      uint64_t v8 = v7;
    }
    SEL v9 = v6;
    [(FCOperationCanceling *)v6 setQualityOfService:v8];
  }
  else
  {
    SEL v9 = 0;
  }
  [(NFMutexLock *)self->_lock unlock];
}

uint64_t __67__FCAsyncOnceOperation_executeWithCallbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) lock];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    uint64_t v3 = 0;
    goto LABEL_4;
  }
  --*(void *)(v2 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3 || !*(void *)(v3 + 24))
  {
LABEL_4:
    -[FCAssetHandle setFetchOperation:](v3, 0);
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      v5 = *(void **)(v4 + 40);
    }
    else {
      v5 = 0;
    }
    [v5 cancel];
    -[FCHLSPlaylistState setCurrentStreamInf:](*(void *)(a1 + 32), 0);
    uint64_t v3 = *(void *)(a1 + 32);
  }
  uint64_t v6 = *(void **)(v3 + 56);
  return [v6 unlock];
}

- (BOOL)finishedExecuting
{
  [(NFMutexLock *)self->_lock lock];
  BOOL finished = self->_finished;
  [(NFMutexLock *)self->_lock unlock];
  return finished;
}

- (BOOL)finishedExecutingWithFailure
{
  [(NFMutexLock *)self->_lock lock];
  BOOL v3 = self->_finished && !self->_succeeded;
  [(NFMutexLock *)self->_lock unlock];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_activeOperation, 0);
  objc_storeStrong((id *)&self->_activeGroup, 0);
  objc_storeStrong(&self->_workBlock, 0);
}

@end