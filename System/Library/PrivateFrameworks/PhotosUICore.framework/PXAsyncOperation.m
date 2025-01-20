@interface PXAsyncOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)px_shouldWaitForCancel;
- (PXAsyncOperation)init;
- (void)cancel;
- (void)px_finishIfPossible;
- (void)px_start;
- (void)start;
@end

@implementation PXAsyncOperation

- (void)px_finishIfPossible
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_operationState == 1)
  {
    self->_operationState = 2;
    os_unfair_lock_unlock(p_stateLock);
    NSStringFromSelector(sel_isExecuting);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = NSStringFromSelector(sel_isFinished);
    [(PXAsyncOperation *)self willChangeValueForKey:v5];
    [(PXAsyncOperation *)self willChangeValueForKey:v4];
    os_unfair_lock_lock(p_stateLock);
    self->_operationState = 3;
    os_unfair_lock_unlock(p_stateLock);
    [(PXAsyncOperation *)self didChangeValueForKey:v5];
    [(PXAsyncOperation *)self didChangeValueForKey:v4];
  }
  else
  {
    os_unfair_lock_unlock(p_stateLock);
  }
}

- (void)px_start
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXAsyncOperation.m", 96, @"Method %s is a responsibility of subclass %@", "-[PXAsyncOperation px_start]", v6 object file lineNumber description];

  abort();
}

- (BOOL)isFinished
{
  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LOBYTE(v2) = v2->_operationState == 3;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (BOOL)isExecuting
{
  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LOBYTE(v2) = (v2->_operationState - 1) < 2;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)PXAsyncOperation;
  [(PXAsyncOperation *)&v3 cancel];
  if (![(PXAsyncOperation *)self px_shouldWaitForCancel]) {
    [(PXAsyncOperation *)self px_finishIfPossible];
  }
}

- (BOOL)px_shouldWaitForCancel
{
  return 0;
}

- (void)start
{
  if ([(PXAsyncOperation *)self isCancelled])
  {
    NSStringFromSelector(sel_isFinished);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(PXAsyncOperation *)self willChangeValueForKey:v4];
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    self->_operationState = 3;
LABEL_4:
    os_unfair_lock_unlock(p_stateLock);
    [(PXAsyncOperation *)self didChangeValueForKey:v4];
    goto LABEL_6;
  }
  NSStringFromSelector(sel_isExecuting);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:");
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_operationState) {
    goto LABEL_4;
  }
  self->_operationState = 1;
  os_unfair_lock_unlock(&self->_stateLock);
  [(PXAsyncOperation *)self didChangeValueForKey:v4];
  [(PXAsyncOperation *)self px_start];
LABEL_6:
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (PXAsyncOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXAsyncOperation;
  result = [(PXAsyncOperation *)&v3 init];
  if (result) {
    result->_stateLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

@end