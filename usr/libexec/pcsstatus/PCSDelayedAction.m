@interface PCSDelayedAction
- (BOOL)running;
- (NSOperationQueue)operationQueue;
- (NSString)label;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)waitSource;
- (OS_os_transaction)pendingTransaction;
- (PCSDelayedAction)initWithLabel:(id)a3 delay:(unint64_t)a4 operationQueue:(id)a5;
- (id)actionOnTrigger;
- (int64_t)noTransaction;
- (unint64_t)delayInSeconds;
- (void)run;
- (void)setAction:(id)a3;
- (void)setActionOnTrigger:(id)a3;
- (void)setDelayInSeconds:(unint64_t)a3;
- (void)setHoldTransaction:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setNoTransaction:(int64_t)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPendingTransaction:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setWaitSource:(id)a3;
- (void)trigger;
@end

@implementation PCSDelayedAction

- (PCSDelayedAction)initWithLabel:(id)a3 delay:(unint64_t)a4 operationQueue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PCSDelayedAction;
  v10 = [(PCSDelayedAction *)&v20 init];
  v11 = v10;
  if (v10)
  {
    [(PCSDelayedAction *)v10 setLabel:v8];
    objc_initWeak(&location, v11);
    objc_storeStrong((id *)&v11->_operationQueue, a5);
    v11->_delayInSeconds = a4;
    v12 = sub_100012ED4();
    dispatch_source_t v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_add, 0, 0, v12);
    waitSource = v11->_waitSource;
    v11->_waitSource = (OS_dispatch_source *)v13;

    v15 = v11->_waitSource;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100012F28;
    v17[3] = &unk_10001CA58;
    objc_copyWeak(&v18, &location);
    dispatch_source_set_event_handler(v15, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)setAction:(id)a3
{
  if (!self->_running)
  {
    self->_actionOnTrigger = objc_retainBlock(a3);
    _objc_release_x1();
  }
}

- (void)run
{
  self->_running = 1;
  dispatch_resume((dispatch_object_t)self->_waitSource);
}

- (void)setHoldTransaction:(BOOL)a3
{
  v5 = sub_100012ED4();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013290;
  v6[3] = &unk_10001CF20;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

- (void)trigger
{
  objc_initWeak(&location, self);
  v3 = sub_100012ED4();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013368;
  block[3] = &unk_10001CE08;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLabel:(id)a3
{
}

- (id)actionOnTrigger
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setActionOnTrigger:(id)a3
{
}

- (unint64_t)delayInSeconds
{
  return self->_delayInSeconds;
}

- (void)setDelayInSeconds:(unint64_t)a3
{
  self->_delayInSeconds = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (OS_dispatch_source)waitSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWaitSource:(id)a3
{
}

- (OS_os_transaction)pendingTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPendingTransaction:(id)a3
{
}

- (int64_t)noTransaction
{
  return self->_noTransaction;
}

- (void)setNoTransaction:(int64_t)a3
{
  self->_noTransaction = a3;
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTransaction, 0);
  objc_storeStrong((id *)&self->_waitSource, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_actionOnTrigger, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end