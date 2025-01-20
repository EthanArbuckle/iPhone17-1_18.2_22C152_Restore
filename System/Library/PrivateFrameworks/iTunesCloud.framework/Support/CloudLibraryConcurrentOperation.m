@interface CloudLibraryConcurrentOperation
- (BOOL)isAsynchronous;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (void)finish;
- (void)start;
@end

@implementation CloudLibraryConcurrentOperation

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

- (BOOL)isConcurrent
{
  return 1;
}

- (void)finish
{
  v3 = NSStringFromSelector("isExecuting");
  [(CloudLibraryConcurrentOperation *)self willChangeValueForKey:v3];

  self->_executing = 0;
  v4 = NSStringFromSelector("isExecuting");
  [(CloudLibraryConcurrentOperation *)self didChangeValueForKey:v4];

  v5 = NSStringFromSelector("isFinished");
  [(CloudLibraryConcurrentOperation *)self willChangeValueForKey:v5];

  self->_finished = 1;
  NSStringFromSelector("isFinished");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(CloudLibraryConcurrentOperation *)self didChangeValueForKey:v6];
}

- (void)start
{
  unsigned int v3 = [(CloudLibraryConcurrentOperation *)self isCancelled];
  if (v3) {
    v4 = &OBJC_IVAR___CloudLibraryConcurrentOperation__finished;
  }
  else {
    v4 = &OBJC_IVAR___CloudLibraryConcurrentOperation__executing;
  }
  v5 = &selRef_isFinished;
  if (!v3) {
    v5 = &selRef_isExecuting;
  }
  id v6 = *v5;
  v7 = NSStringFromSelector(*v5);
  [(CloudLibraryConcurrentOperation *)self willChangeValueForKey:v7];

  *((unsigned char *)&self->super.super.super.isa + *v4) = 1;
  NSStringFromSelector(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(CloudLibraryConcurrentOperation *)self didChangeValueForKey:v8];
}

@end