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
  v12[2] = sub_100094054;
  v12[3] = &unk_10018D740;
  v12[4] = v7;
  v12[5] = a4;
  [(MSUCheckpointAsyncBlockContext *)v7 setWorkBlock:dispatch_block_create((dispatch_block_flags_t)0, v12)];
  return v7;
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
  v12 = [(MSUCheckpointAsyncBlockContext *)self workQueue];
  id v13 = [(MSUCheckpointAsyncBlockContext *)self workBlock];

  dispatch_sync((dispatch_queue_t)v12, v13);
}

- (void)runForCheckpoint:(void *)a3
{
  [(MSUCheckpointAsyncContext *)self setCheckpoint_closure_context:a3];
  uint64_t step_desc = checkpoint_closure_context_get_step_desc((uint64_t)[(MSUCheckpointAsyncContext *)self checkpoint_closure_context]);
  ramrod_log_msg("[AsyncCP][DispatchAsync] Checkpoint %s dispatched asynchronously.\n", v5, v6, v7, v8, v9, v10, v11, *(void *)(step_desc + 8));
  v12 = [(MSUCheckpointAsyncBlockContext *)self workQueue];
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