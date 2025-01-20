@interface TUIWorkQueueContext
- (BOOL)synchronousTransactionInProgress;
- (OS_dispatch_queue)backgroundWorkQueue;
- (OS_dispatch_queue)foregroundWorkQueue;
- (OS_dispatch_queue)syncWorkQueue;
- (OS_dispatch_queue)workQueue;
- (TUIWorkQueueContext)init;
- (TUIWorkQueueContext)initWithQueue:(id)a3;
- (float)priority;
- (id)activeCallbackQueue;
- (id)activeQueue;
- (void)setPriority:(float)a3;
- (void)setSynchronousTransactionInProgress:(BOOL)a3;
@end

@implementation TUIWorkQueueContext

- (TUIWorkQueueContext)initWithQueue:(id)a3
{
  id v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)TUIWorkQueueContext;
  v6 = [(TUIWorkQueueContext *)&v37 init];
  v7 = (dispatch_queue_t *)v6;
  if (v6)
  {
    v6->_priority = 0.5;
    objc_storeStrong((id *)&v6->_workQueue, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v10 = dispatch_queue_create_with_target_V2("TUIWorkQueueContext.syncWorkQueue", v9, v7[6]);
    dispatch_queue_t v11 = v7[7];
    v7[7] = v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v14 = dispatch_queue_create_with_target_V2("TUIWorkQueueContext.foregroundWorkQueue", v13, v7[6]);
    dispatch_queue_t v15 = v7[8];
    v7[8] = v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v18 = dispatch_queue_create_with_target_V2("TUIWorkQueueContext.backgroundWorkQueue", v17, v7[6]);
    dispatch_queue_t v19 = v7[9];
    v7[9] = v18;

    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v22 = dispatch_queue_create("TUIWorkQueueContext.callbackQueue", v21);
    dispatch_queue_t v23 = v7[1];
    v7[1] = v22;

    v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v25 = dispatch_queue_attr_make_with_qos_class(v24, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v26 = dispatch_queue_create_with_target_V2("TUIWorkQueueContext.syncCallbackQueue", v25, v7[1]);
    dispatch_queue_t v27 = v7[2];
    v7[2] = v26;

    v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v29 = dispatch_queue_attr_make_with_qos_class(v28, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v30 = dispatch_queue_create_with_target_V2("TUIWorkQueueContext.foregroundCallbackQueue", v29, v7[1]);
    dispatch_queue_t v31 = v7[3];
    v7[3] = v30;

    v32 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v33 = dispatch_queue_attr_make_with_qos_class(v32, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v34 = dispatch_queue_create_with_target_V2("TUIWorkQueueContext.backgroundCallbackQueue", v33, v7[1]);
    dispatch_queue_t v35 = v7[4];
    v7[4] = v34;
  }
  return (TUIWorkQueueContext *)v7;
}

- (TUIWorkQueueContext)init
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v5 = dispatch_queue_create("TUIWorkQueueContext.workQueue", v4);
  v6 = [(TUIWorkQueueContext *)self initWithQueue:v5];

  return v6;
}

- (id)activeQueue
{
  if ([(TUIWorkQueueContext *)self synchronousTransactionInProgress])
  {
    uint64_t v3 = 56;
  }
  else
  {
    [(TUIWorkQueueContext *)self priority];
    uint64_t v3 = 64;
    if (v4 < 0.75) {
      uint64_t v3 = 72;
    }
  }
  id v5 = *(id *)((char *)&self->super.isa + v3);

  return v5;
}

- (id)activeCallbackQueue
{
  if ([(TUIWorkQueueContext *)self synchronousTransactionInProgress])
  {
    uint64_t v3 = 16;
  }
  else
  {
    [(TUIWorkQueueContext *)self priority];
    uint64_t v3 = 24;
    if (v4 < 0.75) {
      uint64_t v3 = 32;
    }
  }
  id v5 = *(id *)((char *)&self->super.isa + v3);

  return v5;
}

- (float)priority
{
  return self->_priority;
}

- (void)setPriority:(float)a3
{
  self->_priority = a3;
}

- (BOOL)synchronousTransactionInProgress
{
  return self->_synchronousTransactionInProgress;
}

- (void)setSynchronousTransactionInProgress:(BOOL)a3
{
  self->_synchronousTransactionInProgress = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)syncWorkQueue
{
  return self->_syncWorkQueue;
}

- (OS_dispatch_queue)foregroundWorkQueue
{
  return self->_foregroundWorkQueue;
}

- (OS_dispatch_queue)backgroundWorkQueue
{
  return self->_backgroundWorkQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundWorkQueue, 0);
  objc_storeStrong((id *)&self->_foregroundWorkQueue, 0);
  objc_storeStrong((id *)&self->_syncWorkQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_backgroundCallbackQueue, 0);
  objc_storeStrong((id *)&self->_foregroundCallbackQueue, 0);
  objc_storeStrong((id *)&self->_syncCallbackQueue, 0);

  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end