@interface PLCloudInMemoryDownloadTask
- (BOOL)isCompleted;
- (CPLResourceTransferTask)transferTask;
- (NSArray)taskIDs;
- (NSString)resourceID;
- (PLCloudInMemoryDownloadTask)initWithResourceID:(id)a3 taskID:(id)a4 completionHandler:(id)a5;
- (void)addClientWithTaskID:(id)a3 completionHandler:(id)a4;
- (void)cancelClientWithTaskID:(id)a3;
- (void)reportCompletionWithData:(id)a3 error:(id)a4;
- (void)setTransferTask:(id)a3;
@end

@implementation PLCloudInMemoryDownloadTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceID, 0);
  objc_storeStrong((id *)&self->_transferTask, 0);
  objc_storeStrong((id *)&self->_taskIDsToCompletionHandlers, 0);
}

- (NSString)resourceID
{
  return self->_resourceID;
}

- (void)reportCompletionWithData:(id)a3 error:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = (void *)[(NSMapTable *)self->_taskIDsToCompletionHandlers copy];
  self->_completed = 1;
  os_unfair_lock_unlock(&self->_lock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v9 = objc_msgSend(v8, "keyEnumerator", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v15 = [v8 objectForKey:v14];
        ((void (**)(void, uint64_t, id, id))v15)[2](v15, v14, v6, v7);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (NSArray)taskIDs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = NSAllMapTableKeys(self->_taskIDsToCompletionHandlers);
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)cancelClientWithTaskID:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v9 = [(NSMapTable *)self->_taskIDsToCompletionHandlers objectForKey:v5];
  [(NSMapTable *)self->_taskIDsToCompletionHandlers removeObjectForKey:v5];
  NSUInteger v6 = [(NSMapTable *)self->_taskIDsToCompletionHandlers count];
  self->_completed = v6 == 0;
  id v7 = self->_transferTask;
  os_unfair_lock_unlock(p_lock);
  v8 = [MEMORY[0x1E4F59868] operationCancelledError];
  v9[2](v9, v5, 0, v8);

  if (!v6) {
    [(CPLResourceTransferTask *)v7 cancelTask];
  }
}

- (void)addClientWithTaskID:(id)a3 completionHandler:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  taskIDsToCompletionHandlers = self->_taskIDsToCompletionHandlers;
  uint64_t v10 = (void *)MEMORY[0x19F38D650](v7);

  [(NSMapTable *)taskIDsToCompletionHandlers setObject:v10 forKey:v8];
  os_unfair_lock_unlock(p_lock);
}

- (CPLResourceTransferTask)transferTask
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_transferTask;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setTransferTask:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_transferTask)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3B8];
    resourceID = self->_resourceID;
    v13 = @"resourceID";
    v14[0] = resourceID;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v11 = [v7 exceptionWithName:v8 reason:@"An in memory download task should only ever be assigned 1 transfer task" userInfo:v10];

    objc_exception_throw(v11);
  }
  objc_storeStrong((id *)&self->_transferTask, a3);
  BOOL completed = self->_completed;
  os_unfair_lock_unlock(p_lock);
  if (completed) {
    [v12 cancelTask];
  }
}

- (BOOL)isCompleted
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_completed;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (PLCloudInMemoryDownloadTask)initWithResourceID:(id)a3 taskID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PLCloudInMemoryDownloadTask;
  id v11 = [(PLCloudInMemoryDownloadTask *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    resourceID = v11->_resourceID;
    v11->_resourceID = (NSString *)v12;

    v11->_lock._os_unfair_lock_opaque = 0;
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0x10000 valueOptions:0x10000 capacity:4];
    taskIDsToCompletionHandlers = v11->_taskIDsToCompletionHandlers;
    v11->_taskIDsToCompletionHandlers = (NSMapTable *)v14;

    long long v16 = v11->_taskIDsToCompletionHandlers;
    long long v17 = (void *)MEMORY[0x19F38D650](v10);
    [(NSMapTable *)v16 setObject:v17 forKey:v9];
  }
  return v11;
}

@end