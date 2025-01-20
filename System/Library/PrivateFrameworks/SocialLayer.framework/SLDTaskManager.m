@interface SLDTaskManager
- (OS_dispatch_queue)serialQueue;
- (SLDTaskManager)initWithSerialQueue:(id)a3;
- (id)startAggregateTask:(id)a3 withTimeout:(double)a4 cancellationHandler:(id)a5;
- (void)startSubtask:(id)a3 withProgress:(id)a4 timer:(id)a5;
@end

@implementation SLDTaskManager

- (SLDTaskManager)initWithSerialQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SLDTaskManager;
  v6 = [(SLDTaskManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serialQueue, a3);
  }

  return v7;
}

- (id)startAggregateTask:(id)a3 withTimeout:(double)a4 cancellationHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  char v39 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1;
  v36 = __Block_byref_object_dispose__1;
  v10 = [(SLDTaskManager *)self serialQueue];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke;
  v28[3] = &unk_1E58A8910;
  v30 = v38;
  double v31 = a4;
  id v11 = v9;
  id v29 = v11;
  id v37 = +[SLGracePeriodTimer timerWithQueue:v10 delay:v28 action:a4];

  v12 = objc_opt_new();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_2;
  v24[3] = &unk_1E58A8960;
  v24[4] = self;
  v26 = v38;
  v27 = &v32;
  id v13 = v11;
  id v25 = v13;
  [v12 setCancellationHandler:v24];
  [(id)v33[5] arm];
  v14 = [(SLDTaskManager *)self serialQueue];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_3;
  v20[3] = &unk_1E58A89B0;
  id v22 = v8;
  id v15 = v12;
  id v21 = v15;
  v23 = &v32;
  id v16 = v8;
  dispatch_async(v14, v20);

  v17 = v21;
  id v18 = v15;

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(v38, 8);

  return v18;
}

uint64_t __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    v2 = SLDaemonLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_cold_1(v1, v2);
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

void __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_2;
  block[3] = &unk_1E58A8938;
  uint64_t v7 = *(void *)(a1 + 56);
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  dispatch_async(v2, block);
}

uint64_t __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_2(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  uint64_t result = [*(id *)(*(void *)(a1[6] + 8) + 40) isValid];
  if (result)
  {
    id v3 = SLDaemonLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_2_cold_1(v3);
    }

    [*(id *)(*(void *)(a1[6] + 8) + 40) suppress];
    return (*(uint64_t (**)(void))(a1[4] + 16))();
  }
  return result;
}

void __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_3(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(*(void *)(a1[6] + 8) + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_2_4;
  v7[3] = &unk_1E58A8988;
  id v5 = v2;
  uint64_t v6 = a1[6];
  id v8 = v5;
  uint64_t v9 = v6;
  (*(void (**)(uint64_t, id, uint64_t, void *))(v3 + 16))(v3, v5, v4, v7);
}

void __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_2_4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = *(id *)(a1 + 32);
    id v4 = v3;
    if (([v7 isFinished] & 1) != 0 || objc_msgSend(v7, "isCancelled"))
    {
    }
    else
    {
      int v5 = [v4 isValid];

      if (v5)
      {
        uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        [v6 suppress];
      }
    }
  }
}

- (void)startSubtask:(id)a3 withProgress:(id)a4 timer:(id)a5
{
  id v7 = (void (**)(id, id, id, void *))a3;
  id v8 = a4;
  id v9 = a5;
  if (([v8 isFinished] & 1) != 0 || objc_msgSend(v8, "isCancelled"))
  {
  }
  else
  {
    int v10 = [v9 isValid];

    if (v10)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __50__SLDTaskManager_startSubtask_withProgress_timer___block_invoke;
      v11[3] = &unk_1E58A89D8;
      id v12 = v8;
      id v13 = v9;
      v7[2](v7, v12, v13, v11);
    }
  }
}

void __50__SLDTaskManager_startSubtask_withProgress_timer___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    id v7 = *(id *)(a1 + 32);
    id v4 = v3;
    if (([v7 isFinished] & 1) != 0 || objc_msgSend(v7, "isCancelled"))
    {
    }
    else
    {
      int v5 = [v4 isValid];

      if (v5)
      {
        uint64_t v6 = *(void **)(a1 + 40);
        [v6 suppress];
      }
    }
  }
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void).cxx_destruct
{
}

void __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "[SLDTaskManager] aggregate task timeout timer fired after %f seconds", (uint8_t *)&v3, 0xCu);
}

void __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_19BE17000, log, OS_LOG_TYPE_ERROR, "[SLDTaskManager] aggregate task progress was cancelled by our client", v1, 2u);
}

@end