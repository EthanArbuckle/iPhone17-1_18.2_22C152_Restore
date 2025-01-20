@interface BMAsyncBlockOperation
- (BMAsyncBlockOperation)initWithAsyncOperationBlock:(id)a3;
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (id)block;
- (void)start;
@end

@implementation BMAsyncBlockOperation

- (BMAsyncBlockOperation)initWithAsyncOperationBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMAsyncBlockOperation;
  v5 = [(BMAsyncBlockOperation *)&v9 init];
  if (v5)
  {
    id v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = v6;

    v5->_executing = 0;
    v5->_finished = 0;
  }

  return v5;
}

- (void)start
{
  if (([(BMAsyncBlockOperation *)self isCancelled] & 1) == 0)
  {
    [(BMAsyncBlockOperation *)self willChangeValueForKey:@"isExecuting"];
    self->_executing = 1;
    [(BMAsyncBlockOperation *)self didChangeValueForKey:@"isExecuting"];
    v3 = [(BMAsyncBlockOperation *)self block];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100035944;
    v4[3] = &unk_10006CB58;
    v4[4] = self;
    ((void (**)(void, void *))v3)[2](v3, v4);
  }
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
}

@end