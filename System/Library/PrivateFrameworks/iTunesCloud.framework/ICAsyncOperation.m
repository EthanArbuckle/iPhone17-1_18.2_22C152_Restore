@interface ICAsyncOperation
- (BOOL)isAsynchronous;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (ICAsyncOperation)init;
- (NSError)error;
- (void)enqueueChildOperation:(id)a3;
- (void)finish;
- (void)finishWithError:(id)a3;
- (void)start;
@end

@implementation ICAsyncOperation

- (BOOL)isExecuting
{
  v2 = self;
  p_asyncOperationLock = &self->_asyncOperationLock;
  os_unfair_lock_lock(&self->_asyncOperationLock);
  LOBYTE(v2) = v2->_isExecuting;
  os_unfair_lock_unlock(p_asyncOperationLock);
  return (char)v2;
}

- (BOOL)isFinished
{
  v2 = self;
  p_asyncOperationLock = &self->_asyncOperationLock;
  os_unfair_lock_lock(&self->_asyncOperationLock);
  LOBYTE(v2) = v2->_isFinished;
  os_unfair_lock_unlock(p_asyncOperationLock);
  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_childOperationQueue, 0);
}

- (void)finish
{
}

- (ICAsyncOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICAsyncOperation;
  result = [(ICAsyncOperation *)&v3 init];
  if (result)
  {
    result->_asyncOperationLock._os_unfair_lock_opaque = 0;
    result->_qualityOfServiceForChildOperationQueue = -1;
  }
  return result;
}

- (void)start
{
  objc_super v3 = [MEMORY[0x1E4F29060] currentThread];
  int64_t v4 = [v3 qualityOfService];

  [(ICAsyncOperation *)self willChangeValueForKey:@"isExecuting"];
  os_unfair_lock_lock(&self->_asyncOperationLock);
  self->_isExecuting = 1;
  self->_qualityOfServiceForChildOperationQueue = v4;
  os_unfair_lock_unlock(&self->_asyncOperationLock);
  [(ICAsyncOperation *)self didChangeValueForKey:@"isExecuting"];

  [(ICAsyncOperation *)self _execute];
}

- (void)finishWithError:(id)a3
{
  int64_t v4 = (NSError *)a3;
  [(ICAsyncOperation *)self willChangeValueForKey:@"error"];
  [(ICAsyncOperation *)self willChangeValueForKey:@"isFinished"];
  [(ICAsyncOperation *)self willChangeValueForKey:@"isExecuting"];
  os_unfair_lock_lock(&self->_asyncOperationLock);
  error = self->_error;
  self->_error = v4;

  self->_isExecuting = 0;
  self->_isFinished = 1;
  os_unfair_lock_unlock(&self->_asyncOperationLock);
  [(ICAsyncOperation *)self didChangeValueForKey:@"error"];
  [(ICAsyncOperation *)self didChangeValueForKey:@"isFinished"];

  [(ICAsyncOperation *)self didChangeValueForKey:@"isExecuting"];
}

- (NSError)error
{
  return self->_error;
}

- (void)enqueueChildOperation:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_asyncOperationLock);
  os_unfair_lock_lock(&self->_asyncOperationLock);
  childOperationQueue = self->_childOperationQueue;
  if (childOperationQueue) {
    goto LABEL_2;
  }
  v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
  v8 = self->_childOperationQueue;
  self->_childOperationQueue = v7;

  v9 = self->_childOperationQueue;
  v10 = NSString;
  v11 = [MEMORY[0x1E4F29128] UUID];
  v12 = [v11 UUIDString];
  v13 = [v10 stringWithFormat:@"com.apple.iTunesCloud.ICAsyncOperation.childOperationQueue-%@", v12];
  [(NSOperationQueue *)v9 setName:v13];

  [(NSOperationQueue *)self->_childOperationQueue setMaxConcurrentOperationCount:3];
  if (self->_isExecuting || self->_isFinished)
  {
    [(NSOperationQueue *)self->_childOperationQueue setQualityOfService:self->_qualityOfServiceForChildOperationQueue];
    int v6 = 1;
  }
  else
  {
LABEL_2:
    int v6 = 0;
  }
  v14 = self->_childOperationQueue;
  os_unfair_lock_unlock(&self->_asyncOperationLock);
  if (!childOperationQueue)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F28E78]);
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    v18 = (void *)[v15 initWithFormat:@"<%@: %p", v17, v14];

    v19 = [(NSOperationQueue *)v14 name];
    [v18 appendFormat:@"; name = \"%@\"", v19];

    objc_msgSend(v18, "appendFormat:", @"; maxConcurrentOperationCount = %ld",
      [(NSOperationQueue *)v14 maxConcurrentOperationCount]);
    if (v6)
    {
      uint64_t v20 = [(NSOperationQueue *)v14 qualityOfService];
      v21 = @"????";
      if (v20 <= 16)
      {
        if (v20 == -1)
        {
          v21 = @"default";
        }
        else if (v20 == 9)
        {
          v21 = @"background";
        }
      }
      else
      {
        switch(v20)
        {
          case 17:
            v21 = @"utility";
            break;
          case 25:
            v21 = @"userInitiated";
            break;
          case 33:
            v21 = @"userInteractive";
            break;
        }
      }
      [v18 appendFormat:@"; qualityOfService = %@", v21];
    }
    [v18 appendString:@">"];
    v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v24 = self;
      __int16 v25 = 2114;
      v26 = v18;
      _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Created child operation queue: %{public}@.", buf, 0x16u);
    }
  }
  [(NSOperationQueue *)v14 addOperation:v4];
}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)isAsynchronous
{
  return 1;
}

@end