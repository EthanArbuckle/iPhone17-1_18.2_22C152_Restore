@interface _TUITransactionControllerWorkQueueContext
- (BOOL)synchronousTransactionInProgress;
- (OS_dispatch_queue)backgroundWorkQueue;
- (OS_dispatch_queue)foregroundWorkQueue;
- (OS_dispatch_queue)syncWorkQueue;
- (OS_dispatch_queue)workQueue;
- (_TUITransactionControllerWorkQueueContext)initWithQueue:(id)a3;
- (float)priority;
- (id)activeCallbackQueue;
- (id)activeQueue;
- (void)setPriority:(float)a3;
- (void)setSynchronousTransactionInProgress:(BOOL)a3;
@end

@implementation _TUITransactionControllerWorkQueueContext

- (_TUITransactionControllerWorkQueueContext)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUITransactionControllerWorkQueueContext;
  v6 = [(_TUITransactionControllerWorkQueueContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (OS_dispatch_queue)workQueue
{
  return self->_queue;
}

- (OS_dispatch_queue)syncWorkQueue
{
  return self->_queue;
}

- (OS_dispatch_queue)foregroundWorkQueue
{
  return self->_queue;
}

- (OS_dispatch_queue)backgroundWorkQueue
{
  return self->_queue;
}

- (id)activeQueue
{
  return self->_queue;
}

- (id)activeCallbackQueue
{
  return dispatch_get_global_queue(2, 0);
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

- (void).cxx_destruct
{
}

@end