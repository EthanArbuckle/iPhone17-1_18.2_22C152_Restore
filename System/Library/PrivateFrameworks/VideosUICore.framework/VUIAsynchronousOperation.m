@interface VUIAsynchronousOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (void)finishExecutionIfPossible;
- (void)start;
@end

@implementation VUIAsynchronousOperation

- (void)finishExecutionIfPossible
{
  [(VUIAsynchronousOperation *)self willChangeValueForKey:@"isExecuting"];
  [(VUIAsynchronousOperation *)self willChangeValueForKey:@"isFinished"];
  int v3 = 1;
  atomic_compare_exchange_strong(&self->_state, (unsigned int *)&v3, 2u);
  [(VUIAsynchronousOperation *)self didChangeValueForKey:@"isFinished"];
  [(VUIAsynchronousOperation *)self didChangeValueForKey:@"isExecuting"];
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  return self->_state == 1;
}

- (BOOL)isFinished
{
  return self->_state == 2;
}

- (void)start
{
  [(VUIAsynchronousOperation *)self willChangeValueForKey:@"isExecuting"];
  int v3 = 0;
  atomic_compare_exchange_strong(&self->_state, (unsigned int *)&v3, 1u);
  BOOL v4 = v3 == 0;
  [(VUIAsynchronousOperation *)self didChangeValueForKey:@"isExecuting"];
  if (v4)
  {
    if ([(VUIAsynchronousOperation *)self isCancelled])
    {
      [(VUIAsynchronousOperation *)self finishExecutionIfPossible];
    }
    else
    {
      [(VUIAsynchronousOperation *)self executionDidBegin];
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    [v5 raise:v6 format:@"The -start method may only be called once."];
  }
}

@end