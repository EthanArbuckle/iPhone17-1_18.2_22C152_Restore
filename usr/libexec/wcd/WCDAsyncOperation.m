@interface WCDAsyncOperation
- (BOOL)failed;
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (NSOperationQueue)queue;
- (WCDAsyncOperation)initWithDelegate:(id)a3 queue:(id)a4;
- (WCDOperationDelegate)delegate;
- (unint64_t)retryCount;
- (void)doWork;
- (void)doWorkWithCompletionHandler:(id)a3;
- (void)finish;
- (void)setFailed:(BOOL)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)start;
@end

@implementation WCDAsyncOperation

- (WCDAsyncOperation)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WCDAsyncOperation;
  v8 = [(WCDAsyncOperation *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v9->_queue, v7);
  }

  return v9;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)start
{
  if ([(WCDAsyncOperation *)self isCancelled])
  {
    [(WCDAsyncOperation *)self finish];
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)WCDAsyncOperation;
    [(WCDAsyncOperation *)&v3 start];
    [(WCDAsyncOperation *)self willChangeValueForKey:@"isExecuting"];
    self->_executing = 1;
    [(WCDAsyncOperation *)self didChangeValueForKey:@"isExecuting"];
  }
}

- (void)finish
{
  if (self->_executing)
  {
    [(WCDAsyncOperation *)self willChangeValueForKey:@"isExecuting"];
    self->_executing = 0;
    [(WCDAsyncOperation *)self didChangeValueForKey:@"isExecuting"];
  }
  [(WCDAsyncOperation *)self willChangeValueForKey:@"isFinished"];
  self->_finished = 1;

  [(WCDAsyncOperation *)self didChangeValueForKey:@"isFinished"];
}

- (void)doWork
{
  id v3 = objc_initWeak(&location, self);
  unsigned int v4 = [(WCDAsyncOperation *)self isCancelled];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(&location);
    [v5 finish];
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100004DFC;
    v6[3] = &unk_100044B30;
    objc_copyWeak(&v7, &location);
    [(WCDAsyncOperation *)self doWorkWithCompletionHandler:v6];
    objc_destroyWeak(&v7);
  }
  objc_destroyWeak(&location);
}

- (void)doWorkWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = NSStringFromSelector(a2);
  v8 = +[NSString stringWithFormat:@"Subclass %@ must override %@", v6, v7];
  id v9 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v8 userInfo:0];

  objc_exception_throw(v9);
}

- (WCDOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WCDOperationDelegate *)WeakRetained;
}

- (NSOperationQueue)queue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queue);

  return (NSOperationQueue *)WeakRetained;
}

- (BOOL)failed
{
  return self->_failed;
}

- (void)setFailed:(BOOL)a3
{
  self->_failed = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_queue);

  objc_destroyWeak((id *)&self->_delegate);
}

@end