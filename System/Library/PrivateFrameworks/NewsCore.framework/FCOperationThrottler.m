@interface FCOperationThrottler
- (BOOL)suspended;
- (FCOperationThrottler)init;
- (FCOperationThrottler)initWithDelegate:(id)a3;
- (FCOperationThrottler)initWithDelegate:(id)a3 updateQueue:(id)a4;
- (void)addCompletionForCurrentOperation:(id)a3;
- (void)dealloc;
- (void)setSuspended:(BOOL)a3;
- (void)tickle;
- (void)tickleWithCompletion:(id)a3;
@end

@implementation FCOperationThrottler

- (void)setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  v4 = obj;
  if (obj->_suspended != v3)
  {
    obj->_suspended = v3;
    dispatchSource = obj->_dispatchSource;
    if (v3) {
      dispatch_suspend(dispatchSource);
    }
    else {
      dispatch_resume(dispatchSource);
    }
    v4 = obj;
  }
  objc_sync_exit(v4);
}

- (FCOperationThrottler)initWithDelegate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "delegate != nil");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCOperationThrottler initWithDelegate:]";
    __int16 v12 = 2080;
    v13 = "FCOperationThrottler.m";
    __int16 v14 = 1024;
    int v15 = 31;
    __int16 v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v6 = dispatch_queue_create(0, v5);
  v7 = [(FCOperationThrottler *)self initWithDelegate:v4 updateQueue:v6];

  return v7;
}

- (FCOperationThrottler)initWithDelegate:(id)a3 updateQueue:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "delegate != nil");
    *(_DWORD *)location = 136315906;
    *(void *)&location[4] = "-[FCOperationThrottler initWithDelegate:updateQueue:]";
    __int16 v32 = 2080;
    v33 = "FCOperationThrottler.m";
    __int16 v34 = 1024;
    int v35 = 38;
    __int16 v36 = 2114;
    v37 = v18;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", location, 0x26u);
  }
  v30.receiver = self;
  v30.super_class = (Class)FCOperationThrottler;
  v8 = [(FCOperationThrottler *)&v30 init];
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      objc_initWeak((id *)location, v8);
      objc_initWeak(&from, v6);
      dispatch_group_t v10 = dispatch_group_create();
      objc_storeStrong((id *)&v9->_handlerSynchronizationGroup, v10);
      objc_storeStrong((id *)&v9->_serialQueue, a4);
      dispatch_source_t v11 = dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, v7);
      dispatchSource = v9->_dispatchSource;
      v9->_dispatchSource = (OS_dispatch_source *)v11;
      v13 = v11;

      objc_initWeak(&v28, v13);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke;
      handler[3] = &unk_1E5B5C8E8;
      __int16 v14 = v10;
      v23 = v14;
      objc_copyWeak(&v25, &from);
      objc_copyWeak(&v26, (id *)location);
      objc_copyWeak(&v27, &v28);
      int v15 = v7;
      v24 = v15;
      dispatch_source_set_event_handler(v13, handler);
      dispatch_group_enter(v14);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke_5;
      v19[3] = &unk_1E5B4BE70;
      v20 = v15;
      v21 = v14;
      __int16 v16 = v14;
      dispatch_source_set_cancel_handler(v13, v19);
      dispatch_resume(v13);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&v25);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&from);
      objc_destroyWeak((id *)location);
    }
    else
    {

      v9 = 0;
    }
  }

  return v9;
}

- (void)tickle
{
}

- (void)tickleWithCompletion:(id)a3
{
  if (a3) {
    dispatch_group_notify((dispatch_group_t)self->_handlerSynchronizationGroup, (dispatch_queue_t)self->_serialQueue, a3);
  }
  dispatchSource = self->_dispatchSource;
  dispatch_source_merge_data(dispatchSource, 1uLL);
}

- (BOOL)suspended
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL suspended = v2->_suspended;
  objc_sync_exit(v2);

  return suspended;
}

void __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    [*(id *)(a1 + 32) operationThrottlerPerformOperation:v3];
  }
  else if (objc_opt_respondsToSelector())
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    dispatch_suspend(WeakRetained);
    dispatch_suspend(*(dispatch_object_t *)(a1 + 40));
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke_4;
    v7[3] = &unk_1E5B4BE70;
    v8 = WeakRetained;
    v5 = *(void **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    id v6 = WeakRetained;
    [v5 operationThrottler:v3 performAsyncOperationWithCompletion:v7];
  }
}

void __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke_3;
  v6[3] = &unk_1E5B5C898;
  id v5 = v3;
  id v7 = v5;
  objc_copyWeak(&v9, a1 + 6);
  id v8 = a1[4];
  FCPerformIfNonNil(WeakRetained, v6);

  objc_destroyWeak(&v9);
}

void __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke_2;
  v3[3] = &unk_1E5B5C8C0;
  objc_copyWeak(&v5, (id *)(a1 + 56));
  objc_copyWeak(&v6, (id *)(a1 + 64));
  id v4 = *(id *)(a1 + 40);
  FCPerformIfNonNil(WeakRetained, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
}

- (FCOperationThrottler)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCOperationThrottler init]";
    __int16 v9 = 2080;
    dispatch_group_t v10 = "FCOperationThrottler.m";
    __int16 v11 = 1024;
    int v12 = 26;
    __int16 v13 = 2114;
    __int16 v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCOperationThrottler init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

void __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke_4(uint64_t a1)
{
  dispatch_resume(*(dispatch_object_t *)(a1 + 32));
  v2 = *(NSObject **)(a1 + 40);
  dispatch_resume(v2);
}

void __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke_5(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke_6;
  block[3] = &unk_1E5B4C018;
  v1 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

void __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke_6(uint64_t a1)
{
}

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_dispatchSource);
  v3.receiver = self;
  v3.super_class = (Class)FCOperationThrottler;
  [(FCOperationThrottler *)&v3 dealloc];
}

- (void)addCompletionForCurrentOperation:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completion");
    *(_DWORD *)buf = 136315906;
    id v7 = "-[FCOperationThrottler addCompletionForCurrentOperation:]";
    __int16 v8 = 2080;
    __int16 v9 = "FCOperationThrottler.m";
    __int16 v10 = 1024;
    int v11 = 135;
    __int16 v12 = 2114;
    __int16 v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  dispatch_async((dispatch_queue_t)self->_serialQueue, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerSynchronizationGroup, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_dispatchSource, 0);
}

@end