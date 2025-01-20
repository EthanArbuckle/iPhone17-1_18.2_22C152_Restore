@interface MSUCheckpointAsyncBlockContext
- (BOOL)wait;
- (BOOL)waitUntilDate:(id)a3;
- (MSUCheckpointAsyncBlockContext)initWithQueue:(id)a3 block:(id)a4;
- (OS_dispatch_queue)workQueue;
- (id)workBlock;
- (void)dealloc;
- (void)runForCheckpoint:(void *)a3;
- (void)runSynchronousForCheckpoint:(void *)a3;
- (void)setWorkBlock:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation MSUCheckpointAsyncBlockContext

- (MSUCheckpointAsyncBlockContext)initWithQueue:(id)a3 block:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)MSUCheckpointAsyncBlockContext;
  v6 = [(MSUCheckpointAsyncContext *)&v13 init];
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      [(MSUCheckpointAsyncBlockContext *)v6 setWorkQueue:a3];
    }
    else
    {
      qos_class_t v8 = qos_class_self();
      v9 = dispatch_queue_attr_make_with_qos_class(0, v8, 0);
      v10 = dispatch_queue_create(0, v9);
      [(MSUCheckpointAsyncBlockContext *)v7 setWorkQueue:v10];
      dispatch_release(v10);
    }
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3254779904;
  v12[2] = __54__MSUCheckpointAsyncBlockContext_initWithQueue_block___block_invoke;
  v12[3] = &__block_descriptor_48_e8_32o40b_e5_v8__0l;
  v12[4] = v7;
  v12[5] = a4;
  [(MSUCheckpointAsyncBlockContext *)v7 setWorkBlock:dispatch_block_create((dispatch_block_flags_t)0, v12)];
  return v7;
}

void __54__MSUCheckpointAsyncBlockContext_initWithQueue_block___block_invoke(uint64_t a1)
{
  uint64_t step_desc = checkpoint_closure_context_get_step_desc((uint64_t)objc_msgSend(*(id *)(a1 + 32), "checkpoint_closure_context"));
  ramrod_log_msg("[AsyncCP][Start] Checkpoint %s start running.\n", v3, v4, v5, v6, v7, v8, v9, *(void *)(step_desc + 8));
  v10 = [*(id *)(a1 + 32) workQueue];
  dispatch_queue_set_specific(v10, kCheckpointAsyncStepContextKey, objc_msgSend(*(id *)(a1 + 32), "checkpoint_closure_context"), 0);
  char v11 = 0;
  char v12 = 1;
  do
  {
    while (1)
    {
      unsigned int v44 = 0;
      id v43 = 0;
      if (v11)
      {
        objc_super v13 = (uint64_t *)objc_msgSend(*(id *)(a1 + 32), "checkpoint_closure_context");
        if (checkpoint_closure_context_handle_simulator_actions(v13, 1, (int *)&v44, (const void **)&v43, v14, v15, v16, v17))goto LABEL_4; {
      }
        }
      else if (v12)
      {
LABEL_4:
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        unsigned int v44 = [*(id *)(a1 + 32) result];
        id v43 = [*(id *)(a1 + 32) error];
        char v12 = 1;
        goto LABEL_7;
      }
      char v12 = 0;
LABEL_7:
      v18 = (uint64_t *)objc_msgSend(*(id *)(a1 + 32), "checkpoint_closure_context");
      if (checkpoint_closure_context_handle_simulator_actions(v18, 0, (int *)&v44, (const void **)&v43, v19, v20, v21, v22))
      {
        v23 = (uint64_t *)objc_msgSend(*(id *)(a1 + 32), "checkpoint_closure_context");
        BOOL v31 = checkpoint_closure_context_handle_simulator_match_name(v23, v24, v25, v26, v27, v28, v29, v30) != 0;
      }
      else
      {
        BOOL v31 = 0;
      }
      [*(id *)(a1 + 32) setResult:v44];
      [*(id *)(a1 + 32) setError:v43];
      if (!v44 || v31) {
        break;
      }
      int should_retry = checkpoint_closure_context_should_retry((uint64_t)objc_msgSend(*(id *)(a1 + 32), "checkpoint_closure_context"));
      char v11 = 1;
      if (!should_retry) {
        goto LABEL_18;
      }
    }
    if (v44) {
      char v33 = 1;
    }
    else {
      char v33 = v31;
    }
    char v11 = 1;
  }
  while ((v33 & 1) != 0);
LABEL_18:
  v34 = [*(id *)(a1 + 32) workQueue];
  dispatch_queue_set_specific(v34, kCheckpointAsyncStepContextKey, 0, 0);
  uint64_t v35 = *(void *)(step_desc + 8);
  [*(id *)(a1 + 32) result];
  ramrod_log_msg("[AsyncCP][End] Checkpoint %s finished with result: %d.\n", v36, v37, v38, v39, v40, v41, v42, v35);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MSUCheckpointAsyncBlockContext;
  [(MSUCheckpointAsyncContext *)&v3 dealloc];
}

- (void)runSynchronousForCheckpoint:(void *)a3
{
  [(MSUCheckpointAsyncContext *)self setCheckpoint_closure_context:a3];
  uint64_t step_desc = checkpoint_closure_context_get_step_desc((uint64_t)[(MSUCheckpointAsyncContext *)self checkpoint_closure_context]);
  ramrod_log_msg("[AsyncCP][DispatchSync] Checkpoint %s dispatched synchronously because async is disabled.\n", v5, v6, v7, v8, v9, v10, v11, *(void *)(step_desc + 8));
  char v12 = [(MSUCheckpointAsyncBlockContext *)self workQueue];
  id v13 = [(MSUCheckpointAsyncBlockContext *)self workBlock];
  dispatch_sync((dispatch_queue_t)v12, v13);
}

- (void)runForCheckpoint:(void *)a3
{
  [(MSUCheckpointAsyncContext *)self setCheckpoint_closure_context:a3];
  uint64_t step_desc = checkpoint_closure_context_get_step_desc((uint64_t)[(MSUCheckpointAsyncContext *)self checkpoint_closure_context]);
  ramrod_log_msg("[AsyncCP][DispatchAsync] Checkpoint %s dispatched asynchronously.\n", v5, v6, v7, v8, v9, v10, v11, *(void *)(step_desc + 8));
  char v12 = [(MSUCheckpointAsyncBlockContext *)self workQueue];
  id v13 = [(MSUCheckpointAsyncBlockContext *)self workBlock];
  dispatch_async((dispatch_queue_t)v12, v13);
}

- (BOOL)wait
{
  objc_super v3 = +[NSDate distantFuture];
  return [(MSUCheckpointAsyncBlockContext *)self waitUntilDate:v3];
}

- (BOOL)waitUntilDate:(id)a3
{
  uint64_t step_desc = checkpoint_closure_context_get_step_desc((uint64_t)[(MSUCheckpointAsyncContext *)self checkpoint_closure_context]);
  [a3 timeIntervalSinceNow];
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)rint(v6 * 1000000000.0));
  ramrod_log_msg("[AsyncCP][WaitStart] Start to Wait checkpoint %s.\n", v8, v9, v10, v11, v12, v13, v14, *(void *)(step_desc + 8));
  LOBYTE(v7) = dispatch_block_wait([(MSUCheckpointAsyncBlockContext *)self workBlock], v7) == 0;
  ramrod_log_msg("[AsyncCP][WaitEnd] Wait checkpoint %s %s.\n", v15, v16, v17, v18, v19, v20, v21, *(void *)(step_desc + 8));
  return v7;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (id)workBlock
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setWorkBlock:(id)a3
{
}

@end