@interface WLKAsyncOperation
+ (id)keyPathsForValuesAffectingIsExecuting;
+ (id)keyPathsForValuesAffectingIsFinished;
+ (id)keyPathsForValuesAffectingIsReady;
- (BOOL)isAsynchronous;
- (BOOL)isCancelled;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (WLKAsyncOperation)init;
- (void)cancel;
- (void)finishExecutionIfPossible;
- (void)start;
@end

@implementation WLKAsyncOperation

- (BOOL)isFinished
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_state == 2;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isExecuting
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_state == 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

+ (id)keyPathsForValuesAffectingIsReady
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"state"];
}

+ (id)keyPathsForValuesAffectingIsFinished
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"state"];
}

+ (id)keyPathsForValuesAffectingIsExecuting
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"state"];
}

- (WLKAsyncOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)WLKAsyncOperation;
  result = [(WLKAsyncOperation *)&v3 init];
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    result->_cancelled = 0;
    result->_state = 0;
  }
  return result;
}

- (void)finishExecutionIfPossible
{
  [(WLKAsyncOperation *)self willChangeValueForKey:@"state"];
  os_unfair_lock_lock(&self->_lock);
  self->_state = 2;
  os_unfair_lock_unlock(&self->_lock);

  [(WLKAsyncOperation *)self didChangeValueForKey:@"state"];
}

- (void)start
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL cancelled = self->_cancelled;
  int state = self->_state;
  os_unfair_lock_unlock(p_lock);
  if (cancelled)
  {
    v6 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA2E8000, v6, OS_LOG_TYPE_DEFAULT, "WLKAsyncOperation - operation was cancelled, skip", buf, 2u);
    }
  }
  else if (state)
  {
    v7 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKAsyncOperation - operation already executing.", v8, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The -start method may only be called once."];
  }
  else
  {
    [(WLKAsyncOperation *)self willChangeValueForKey:@"state"];
    os_unfair_lock_lock(p_lock);
    self->_int state = 1;
    os_unfair_lock_unlock(p_lock);
    [(WLKAsyncOperation *)self didChangeValueForKey:@"state"];
    [(WLKAsyncOperation *)self executionDidBegin];
  }
}

- (BOOL)isCancelled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_cancelled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)cancel
{
  [(WLKAsyncOperation *)self willChangeValueForKey:@"state"];
  os_unfair_lock_lock(&self->_lock);
  self->_BOOL cancelled = 1;
  self->_int state = 2;
  os_unfair_lock_unlock(&self->_lock);
  [(WLKAsyncOperation *)self didChangeValueForKey:@"state"];
  v3.receiver = self;
  v3.super_class = (Class)WLKAsyncOperation;
  [(WLKAsyncOperation *)&v3 cancel];
}

- (BOOL)isAsynchronous
{
  return 1;
}

@end