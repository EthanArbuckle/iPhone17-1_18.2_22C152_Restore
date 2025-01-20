@interface FCBoostableOperationThrottler
- (BOOL)suspended;
- (BOOL)workPending;
- (FCBoostableOperationThrottler)init;
- (FCBoostableOperationThrottler)initWithDelegate:(id)a3;
- (FCBoostableOperationThrottler)initWithDelegate:(id)a3 queue:(id)a4;
- (FCBoostableOperationThrottlerDelegate)delegate;
- (OS_dispatch_queue)serialWorkQueue;
- (int64_t)workPendingQualityOfService;
- (os_unfair_lock_s)workPendingLock;
- (unint64_t)mergedData;
- (unint64_t)workPendingMergedData;
- (void)boostToQualityOfService:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setMergedData:(unint64_t)a3;
- (void)setSerialWorkQueue:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setWorkPending:(BOOL)a3;
- (void)setWorkPendingLock:(os_unfair_lock_s)a3;
- (void)setWorkPendingMergedData:(unint64_t)a3;
- (void)setWorkPendingQualityOfService:(int64_t)a3;
- (void)tickle;
- (void)tickleWithCompletion:(id)a3;
- (void)tickleWithQualityOfService:(int64_t)a3;
- (void)tickleWithQualityOfService:(int64_t)a3 completion:(id)a4;
- (void)tickleWithQualityOfService:(int64_t)a3 data:(unint64_t)a4 completion:(id)a5;
@end

@implementation FCBoostableOperationThrottler

- (void)tickleWithQualityOfService:(int64_t)a3
{
}

- (FCBoostableOperationThrottler)initWithDelegate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "delegate != nil");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCBoostableOperationThrottler initWithDelegate:]";
    __int16 v12 = 2080;
    v13 = "FCOperationThrottler.m";
    __int16 v14 = 1024;
    int v15 = 277;
    __int16 v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create("FCBoostableOperationThrottler.serial", v5);

  v7 = [(FCBoostableOperationThrottler *)self initWithDelegate:v4 queue:v6];
  return v7;
}

- (FCBoostableOperationThrottler)initWithDelegate:(id)a3 queue:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "delegate != nil");
    *(_DWORD *)buf = 136315906;
    int v15 = "-[FCBoostableOperationThrottler initWithDelegate:queue:]";
    __int16 v16 = 2080;
    v17 = "FCOperationThrottler.m";
    __int16 v18 = 1024;
    int v19 = 285;
    __int16 v20 = 2114;
    v21 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "queue != nil");
    *(_DWORD *)buf = 136315906;
    int v15 = "-[FCBoostableOperationThrottler initWithDelegate:queue:]";
    __int16 v16 = 2080;
    v17 = "FCOperationThrottler.m";
    __int16 v18 = 1024;
    int v19 = 286;
    __int16 v20 = 2114;
    v21 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v13.receiver = self;
  v13.super_class = (Class)FCBoostableOperationThrottler;
  v8 = [(FCBoostableOperationThrottler *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v9->_workPendingLock._os_unfair_lock_opaque = 0;
    v9->_workPendingQualityOfService = -1;
    objc_storeStrong((id *)&v9->_serialWorkQueue, a4);
  }

  return v9;
}

- (void)tickleWithQualityOfService:(int64_t)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialWorkQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __76__FCBoostableOperationThrottler_tickleWithQualityOfService_data_completion___block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) serialWorkQueue];
  dispatch_resume(v1);
}

void __76__FCBoostableOperationThrottler_tickleWithQualityOfService_data_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = -1;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  os_unfair_lock_lock_with_options();
  [*(id *)(a1 + 32) setWorkPending:0];
  uint64_t v2 = [*(id *)(a1 + 32) workPendingQualityOfService];
  v11[3] = v2;
  [*(id *)(a1 + 32) setWorkPendingQualityOfService:-1];
  uint64_t v3 = [*(id *)(a1 + 32) workPendingMergedData];
  v7[3] = v3;
  [*(id *)(a1 + 32) setWorkPendingMergedData:0];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__FCBoostableOperationThrottler_tickleWithQualityOfService_data_completion___block_invoke_2;
  v5[3] = &unk_1E5B5C910;
  v5[4] = *(void *)(a1 + 32);
  v5[5] = &v6;
  v5[6] = &v10;
  FCPerformIfNonNil(WeakRetained, v5);

  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

void __76__FCBoostableOperationThrottler_tickleWithQualityOfService_data_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setMergedData:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  if (objc_opt_respondsToSelector())
  {
    [v3 operationThrottlerPerformOperation:*(void *)(a1 + 32)];
  }
  else if (objc_opt_respondsToSelector())
  {
    id v4 = [*(id *)(a1 + 32) serialWorkQueue];
    dispatch_suspend(v4);

    objc_msgSend(v3, "operationThrottler:performAsyncOperationWithQualityOfService:completion:");
  }
  else if (objc_opt_respondsToSelector())
  {
    v5 = [*(id *)(a1 + 32) serialWorkQueue];
    dispatch_suspend(v5);

    objc_msgSend(v3, "operationThrottler:performAsyncOperationWithCompletion:", MEMORY[0x1E4F143A8], 3221225472, __76__FCBoostableOperationThrottler_tickleWithQualityOfService_data_completion___block_invoke_4, &unk_1E5B4C018, *(void *)(a1 + 32));
  }
}

- (void)setMergedData:(unint64_t)a3
{
  self->_mergedData = a3;
}

- (void)tickleWithQualityOfService:(int64_t)a3 data:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  os_unfair_lock_lock_with_options();
  if ([(FCBoostableOperationThrottler *)self workPending])
  {
    [(FCBoostableOperationThrottler *)self setWorkPendingQualityOfService:FCHigherQualityOfService([(FCBoostableOperationThrottler *)self workPendingQualityOfService], a3)];
    [(FCBoostableOperationThrottler *)self setWorkPendingMergedData:[(FCBoostableOperationThrottler *)self workPendingMergedData] | a4];
    os_unfair_lock_unlock(&self->_workPendingLock);
  }
  else
  {
    [(FCBoostableOperationThrottler *)self setWorkPending:1];
    [(FCBoostableOperationThrottler *)self setWorkPendingQualityOfService:FCHigherQualityOfService([(FCBoostableOperationThrottler *)self workPendingQualityOfService], a3)];
    [(FCBoostableOperationThrottler *)self setWorkPendingMergedData:[(FCBoostableOperationThrottler *)self workPendingMergedData] | a4];
    os_unfair_lock_unlock(&self->_workPendingLock);
    uint64_t v9 = [(FCBoostableOperationThrottler *)self delegate];
    objc_initWeak(&location, v9);

    uint64_t v10 = [(FCBoostableOperationThrottler *)self serialWorkQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76__FCBoostableOperationThrottler_tickleWithQualityOfService_data_completion___block_invoke;
    v14[3] = &unk_1E5B5C938;
    v14[4] = self;
    objc_copyWeak(&v15, &location);
    FCDispatchAsyncWithQualityOfService(v10, a3, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  v11 = [(FCBoostableOperationThrottler *)self serialWorkQueue];
  uint64_t v12 = v11;
  if (v8) {
    uint64_t v13 = v8;
  }
  else {
    uint64_t v13 = &__block_literal_global_196;
  }
  FCDispatchAsyncWithQualityOfService(v11, a3, v13);
}

- (OS_dispatch_queue)serialWorkQueue
{
  return self->_serialWorkQueue;
}

- (int64_t)workPendingQualityOfService
{
  return self->_workPendingQualityOfService;
}

- (unint64_t)workPendingMergedData
{
  return self->_workPendingMergedData;
}

- (void)setWorkPendingQualityOfService:(int64_t)a3
{
  self->_workPendingQualityOfService = a3;
}

- (void)setWorkPendingMergedData:(unint64_t)a3
{
  self->_workPendingMergedData = a3;
}

- (void)setWorkPending:(BOOL)a3
{
  self->_workPending = a3;
}

- (BOOL)workPending
{
  return self->_workPending;
}

- (FCBoostableOperationThrottlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FCBoostableOperationThrottlerDelegate *)WeakRetained;
}

- (unint64_t)mergedData
{
  return self->_mergedData;
}

- (void)setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  id v4 = obj;
  if (obj->_suspended != v3)
  {
    obj->_suspended = v3;
    [(FCBoostableOperationThrottler *)obj serialWorkQueue];
    if (v3) {
      v5 = {;
    }
      dispatch_suspend(v5);
    }
    else {
      v5 = {;
    }
      dispatch_resume(v5);
    }

    id v4 = obj;
  }
  objc_sync_exit(v4);
}

void __76__FCBoostableOperationThrottler_tickleWithQualityOfService_data_completion___block_invoke_4(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) serialWorkQueue];
  dispatch_resume(v1);
}

- (FCBoostableOperationThrottler)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCBoostableOperationThrottler init]";
    __int16 v9 = 2080;
    uint64_t v10 = "FCOperationThrottler.m";
    __int16 v11 = 1024;
    int v12 = 272;
    __int16 v13 = 2114;
    __int16 v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  BOOL v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCBoostableOperationThrottler init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)boostToQualityOfService:(int64_t)a3
{
  id v4 = [(FCBoostableOperationThrottler *)self serialWorkQueue];
  FCDispatchAsyncWithQualityOfService(v4, a3, &__block_literal_global_130_0);
}

- (void)tickle
{
}

- (void)tickleWithCompletion:(id)a3
{
}

- (BOOL)suspended
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL suspended = v2->_suspended;
  objc_sync_exit(v2);

  return suspended;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSerialWorkQueue:(id)a3
{
}

- (os_unfair_lock_s)workPendingLock
{
  return self->_workPendingLock;
}

- (void)setWorkPendingLock:(os_unfair_lock_s)a3
{
  self->_workPendingLock = a3;
}

@end