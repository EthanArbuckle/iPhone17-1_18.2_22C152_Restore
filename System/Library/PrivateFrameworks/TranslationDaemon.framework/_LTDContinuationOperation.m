@interface _LTDContinuationOperation
+ (id)continuationOperationWithGroupID:(id)a3 delegate:(id)a4 block:(id)a5;
- (BOOL)isAsynchronous;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (NSString)groupID;
- (_LTDContinuationOperation)initWithGroupID:(id)a3 delegate:(id)a4 continuationBlock:(id)a5;
- (_LTDContinuationOperationDelegate)delegate;
- (double)operationTimeout;
- (void)cancel;
- (void)dealloc;
- (void)setAsynchronous:(BOOL)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)setOperationTimeout:(double)a3;
- (void)start;
@end

@implementation _LTDContinuationOperation

- (_LTDContinuationOperation)initWithGroupID:(id)a3 delegate:(id)a4 continuationBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)_LTDContinuationOperation;
  v11 = [(NSBlockOperation *)&v27 init];
  if (v11)
  {
    v12 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[_LTDContinuationOperation initWithGroupID:delegate:continuationBlock:]((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
    }
    v11->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v11->_delegate, v9);
    uint64_t v19 = [v8 copy];
    groupID = v11->_groupID;
    v11->_groupID = (NSString *)v19;

    objc_initWeak(&location, v11);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __72___LTDContinuationOperation_initWithGroupID_delegate_continuationBlock___block_invoke;
    v23[3] = &unk_2655466A8;
    objc_copyWeak(&v25, &location);
    id v24 = v10;
    [(NSBlockOperation *)v11 addExecutionBlock:v23];
    v21 = v11;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v11;
}

+ (id)continuationOperationWithGroupID:(id)a3 delegate:(id)a4 block:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[_LTDContinuationOperation alloc] initWithGroupID:v9 delegate:v8 continuationBlock:v7];

  return v10;
}

- (void)dealloc
{
}

- (BOOL)isAsynchronous
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isAsynchronous;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAsynchronous:(BOOL)a3
{
  if ([(_LTDContinuationOperation *)self isAsynchronous] != a3)
  {
    [(_LTDContinuationOperation *)self willChangeValueForKey:@"isAsynchronous"];
    os_unfair_lock_lock(&self->_lock);
    self->_isAsynchronous = a3;
    os_unfair_lock_unlock(&self->_lock);
    [(_LTDContinuationOperation *)self didChangeValueForKey:@"isAsynchronous"];
  }
}

- (BOOL)isCancelled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isCancelled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setCancelled:(BOOL)a3
{
  if ([(_LTDContinuationOperation *)self isCancelled] != a3)
  {
    [(_LTDContinuationOperation *)self willChangeValueForKey:@"isCancelled"];
    os_unfair_lock_lock(&self->_lock);
    self->_isCancelled = a3;
    os_unfair_lock_unlock(&self->_lock);
    [(_LTDContinuationOperation *)self didChangeValueForKey:@"isCancelled"];
  }
}

- (BOOL)isFinished
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isFinished;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setFinished:(BOOL)a3
{
  if ([(_LTDContinuationOperation *)self isFinished] != a3)
  {
    [(_LTDContinuationOperation *)self willChangeValueForKey:@"isFinished"];
    os_unfair_lock_lock(&self->_lock);
    self->_isFinished = a3;
    os_unfair_lock_unlock(&self->_lock);
    [(_LTDContinuationOperation *)self didChangeValueForKey:@"isFinished"];
  }
}

- (void)start
{
}

- (void)cancel
{
  if (![(_LTDContinuationOperation *)self isCancelled])
  {
    [(_LTDContinuationOperation *)self setCancelled:1];
    [(_LTDContinuationOperation *)self setFinished:1];
  }
}

- (double)operationTimeout
{
  return self->_operationTimeout;
}

- (void)setOperationTimeout:(double)a3
{
  self->_operationTimeout = a3;
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (_LTDContinuationOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_LTDContinuationOperationDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_groupID, 0);
}

- (void)initWithGroupID:(uint64_t)a3 delegate:(uint64_t)a4 continuationBlock:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end