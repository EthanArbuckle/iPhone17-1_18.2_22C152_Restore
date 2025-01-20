@interface DismissPresentedViewControllerOperation
+ (id)blacklistedDismissalClasses;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (DismissPresentedViewControllerOperation)initWithPresentingViewController:(id)a3 transition:(int)a4 completion:(id)a5;
- (OS_dispatch_queue)queue;
- (id)description;
- (void)cancel;
- (void)finish;
- (void)main;
- (void)setQueue:(id)a3;
- (void)start;
@end

@implementation DismissPresentedViewControllerOperation

- (DismissPresentedViewControllerOperation)initWithPresentingViewController:(id)a3 transition:(int)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)DismissPresentedViewControllerOperation;
  v11 = [(DismissPresentedViewControllerOperation *)&v21 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_presentingViewController, a3);
    v12->_transition = a4;
    id v13 = objc_retainBlock(v10);
    id completion = v12->_completion;
    v12->_id completion = v13;

    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    id v16 = objc_claimAutoreleasedReturnValue();
    v17 = (const char *)[v16 UTF8String];

    v18 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v19 = dispatch_queue_create(v17, v18);
    [(DismissPresentedViewControllerOperation *)v12 setQueue:v19];
  }
  return v12;
}

- (id)description
{
  return +[NSString stringWithFormat:@"%@ dismisses its presented view controller", objc_opt_class()];
}

- (void)start
{
  v3 = [(DismissPresentedViewControllerOperation *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A4DF4;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)isConcurrent
{
  return 0;
}

- (void)cancel
{
  v2.receiver = self;
  v2.super_class = (Class)DismissPresentedViewControllerOperation;
  [(DismissPresentedViewControllerOperation *)&v2 cancel];
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)finish
{
  v3 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    int v7 = 138412546;
    v8 = v6;
    __int16 v9 = 2048;
    id v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Finishing %@ operation: [%p]", (uint8_t *)&v7, 0x16u);
  }
  if (!self->_isFinished)
  {
    if (self->_isExecuting)
    {
      [(DismissPresentedViewControllerOperation *)self willChangeValueForKey:@"isExecuting"];
      self->_isExecuting = 0;
      [(DismissPresentedViewControllerOperation *)self didChangeValueForKey:@"isExecuting"];
    }
    [(DismissPresentedViewControllerOperation *)self willChangeValueForKey:@"isFinished"];
    self->_isFinished = 1;
    [(DismissPresentedViewControllerOperation *)self didChangeValueForKey:@"isFinished"];
  }
}

+ (id)blacklistedDismissalClasses
{
  if (qword_100216740 != -1) {
    dispatch_once(&qword_100216740, &stru_1001D4020);
  }
  objc_super v2 = (void *)qword_100216738;

  return v2;
}

- (void)main
{
  v3 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Executing operation: %@", buf, 0xCu);
  }
  [(DismissPresentedViewControllerOperation *)self willChangeValueForKey:@"isExecuting"];
  self->_isExecuting = 1;
  [(DismissPresentedViewControllerOperation *)self didChangeValueForKey:@"isExecuting"];
  if ([(DismissPresentedViewControllerOperation *)self isCancelled])
  {
    [(DismissPresentedViewControllerOperation *)self finish];
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A5228;
    block[3] = &unk_1001D2740;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end