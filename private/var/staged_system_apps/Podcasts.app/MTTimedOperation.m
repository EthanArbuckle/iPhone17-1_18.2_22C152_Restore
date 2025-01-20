@interface MTTimedOperation
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isSleepingOnStartDelay;
- (BOOL)requiresStartDelayToAvoidClampErrors;
- (MTTimedOperation)init;
- (NSUUID)identifier;
- (OS_dispatch_queue)workQueue;
- (double)startDelay;
- (int64_t)operationType;
- (void)cancel;
- (void)finish;
- (void)main;
- (void)setIdentifier:(id)a3;
- (void)setIsSleepingOnStartDelay:(BOOL)a3;
- (void)setMainBlock:(id)a3;
- (void)setOperationType:(int64_t)a3;
- (void)setStartDelay:(double)a3;
- (void)setWorkQueue:(id)a3;
- (void)start;
- (void)waitForStartDelay;
@end

@implementation MTTimedOperation

- (MTTimedOperation)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTTimedOperation;
  v2 = [(MTTimedOperation *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_executing = 0;
    v2->_finished = 0;
    v2->_startDelay = 1.0;
    uint64_t v4 = +[NSUUID UUID];
    identifier = v3->_identifier;
    v3->_identifier = (NSUUID *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("MTTimedOperation.workQueue", 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v6;
  }
  return v3;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)finish
{
  [(MTTimedOperation *)self willChangeValueForKey:@"isFinished"];
  [(MTTimedOperation *)self willChangeValueForKey:@"isExecuting"];
  self->_executing = 0;
  self->_finished = 1;
  [(MTTimedOperation *)self didChangeValueForKey:@"isExecuting"];
  [(MTTimedOperation *)self didChangeValueForKey:@"isFinished"];
  v7[0] = @"MTTimedOperationIsCancelledKey";
  v3 = +[NSNumber numberWithBool:[(MTTimedOperation *)self isCancelled]];
  v7[1] = @"MTTimedOperationIdentifierKey";
  v8[0] = v3;
  uint64_t v4 = [(MTTimedOperation *)self identifier];
  v8[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  dispatch_queue_t v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"MTTimedOperationFinished" object:0 userInfo:v5];
}

- (void)start
{
  if ([(MTTimedOperation *)self isCancelled])
  {
    [(MTTimedOperation *)self finish];
  }
  else
  {
    [(MTTimedOperation *)self willChangeValueForKey:@"isExecuting"];
    self->_executing = 1;
    [(MTTimedOperation *)self didChangeValueForKey:@"isExecuting"];
    [(MTTimedOperation *)self startDelay];
    if (v3 <= 0.0)
    {
      [(MTTimedOperation *)self main];
    }
    else
    {
      [(MTTimedOperation *)self waitForStartDelay];
    }
  }
}

- (void)main
{
  if (([(MTTimedOperation *)self isCancelled] & 1) == 0)
  {
    mainBlock = (void (**)(void))self->_mainBlock;
    if (mainBlock) {
      mainBlock[2]();
    }
  }

  [(MTTimedOperation *)self finish];
}

- (void)waitForStartDelay
{
  if (([(MTTimedOperation *)self isCancelled] & 1) == 0)
  {
    [(MTTimedOperation *)self setIsSleepingOnStartDelay:1];
    objc_initWeak(&location, self);
    [(MTTimedOperation *)self startDelay];
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    v5 = [(MTTimedOperation *)self workQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000E3C28;
    v6[3] = &unk_10054E8E0;
    objc_copyWeak(&v7, &location);
    dispatch_after(v4, v5, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)MTTimedOperation;
  [(MTTimedOperation *)&v3 cancel];
  [(MTTimedOperation *)self setIsSleepingOnStartDelay:0];
  [(MTTimedOperation *)self finish];
}

- (void)setMainBlock:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id mainBlock = self->_mainBlock;
  self->_id mainBlock = v4;

  _objc_release_x1(v4, mainBlock);
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (double)startDelay
{
  return self->_startDelay;
}

- (void)setStartDelay:(double)a3
{
  self->_startDelay = a3;
}

- (int64_t)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(int64_t)a3
{
  self->_operationType = a3;
}

- (BOOL)isSleepingOnStartDelay
{
  return self->_isSleepingOnStartDelay;
}

- (void)setIsSleepingOnStartDelay:(BOOL)a3
{
  self->_isSleepingOnStartDelay = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong(&self->_mainBlock, 0);
}

- (BOOL)requiresStartDelayToAvoidClampErrors
{
  int64_t v2 = [(MTTimedOperation *)self operationType];
  return v2 != 5 && v2 != 10;
}

@end