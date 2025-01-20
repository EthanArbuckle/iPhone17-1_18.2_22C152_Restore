@interface PLCloudInMemoryTaskManager
- (BOOL)addClientHandlerAndCreateTaskIfNecessaryForResource:(id)a3 taskIdentifier:(id)a4 completionHandler:(id)a5;
- (PLCloudInMemoryTaskManager)init;
- (id)_identifierForResource:(id)a3;
- (void)cancelTaskWithTaskIdentifier:(id)a3;
- (void)reportCompletionForResource:(id)a3 withData:(id)a4 error:(id)a5;
- (void)reset;
- (void)setTransferTask:(id)a3 forResource:(id)a4;
@end

@implementation PLCloudInMemoryTaskManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskIDsToDownloadTasks, 0);
  objc_storeStrong((id *)&self->_resourceIDsToDownloadTasks, 0);
}

- (id)_identifierForResource:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v5 = [v4 itemScopedIdentifier];
  uint64_t v6 = [v4 resourceType];

  v7 = [v3 stringWithFormat:@"%@_%lu", v5, v6];

  return v7;
}

- (void)reportCompletionForResource:(id)a3 withData:(id)a4 error:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [(PLCloudInMemoryTaskManager *)self _identifierForResource:a3];
  os_unfair_lock_lock(&self->_lock);
  v11 = [(NSMutableDictionary *)self->_resourceIDsToDownloadTasks objectForKeyedSubscript:v10];
  [(NSMutableDictionary *)self->_resourceIDsToDownloadTasks removeObjectForKey:v10];
  v12 = [v11 taskIDs];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [(NSMutableDictionary *)self->_taskIDsToDownloadTasks removeObjectForKey:*(void *)(*((void *)&v17 + 1) + 8 * v16++)];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
  os_unfair_lock_unlock(&self->_lock);
  [v11 reportCompletionWithData:v8 error:v9];
}

- (void)cancelTaskWithTaskIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(NSMutableDictionary *)self->_taskIDsToDownloadTasks objectForKeyedSubscript:v5];
  os_unfair_lock_unlock(p_lock);
  [v6 cancelClientWithTaskID:v5];
}

- (void)setTransferTask:(id)a3 forResource:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v6 = a4;
  v7 = [(PLCloudInMemoryTaskManager *)self _identifierForResource:v6];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v9 = [(NSMutableDictionary *)self->_resourceIDsToDownloadTasks objectForKeyedSubscript:v7];
  os_unfair_lock_unlock(p_lock);
  if (!v9)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3B8];
    uint64_t v15 = @"resourceID";
    v16[0] = v7;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v13 = [v10 exceptionWithName:v11 reason:@"Attempting to set a transfer task for CPL download for a resource that is not tracked" userInfo:v12];

    objc_exception_throw(v13);
  }
  [v9 setTransferTask:v14];
}

- (BOOL)addClientHandlerAndCreateTaskIfNecessaryForResource:(id)a3 taskIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [(PLCloudInMemoryTaskManager *)self _identifierForResource:a3];
  os_unfair_lock_lock(&self->_lock);
  uint64_t v11 = [(NSMutableDictionary *)self->_resourceIDsToDownloadTasks objectForKeyedSubscript:v10];
  v12 = v11;
  if (v11)
  {
    [(PLCloudInMemoryDownloadTask *)v11 addClientWithTaskID:v9 completionHandler:v8];
    id v13 = v12;
  }
  else
  {
    id v13 = [[PLCloudInMemoryDownloadTask alloc] initWithResourceID:v10 taskID:v9 completionHandler:v8];
    [(NSMutableDictionary *)self->_resourceIDsToDownloadTasks setObject:v13 forKeyedSubscript:v10];
  }
  [(NSMutableDictionary *)self->_taskIDsToDownloadTasks setObject:v13 forKeyedSubscript:v9];

  os_unfair_lock_unlock(&self->_lock);
  return v12 == 0;
}

- (void)reset
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (id)[(NSMutableDictionary *)self->_taskIDsToDownloadTasks copy];
  [(NSMutableDictionary *)self->_resourceIDsToDownloadTasks removeAllObjects];
  [(NSMutableDictionary *)self->_taskIDsToDownloadTasks removeAllObjects];
  os_unfair_lock_unlock(p_lock);
  [v4 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_108322];
}

uint64_t __35__PLCloudInMemoryTaskManager_reset__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 cancelClientWithTaskID:a2];
}

- (PLCloudInMemoryTaskManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)PLCloudInMemoryTaskManager;
  v2 = [(PLCloudInMemoryTaskManager *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    resourceIDsToDownloadTasks = v3->_resourceIDsToDownloadTasks;
    v3->_resourceIDsToDownloadTasks = v4;

    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    taskIDsToDownloadTasks = v3->_taskIDsToDownloadTasks;
    v3->_taskIDsToDownloadTasks = v6;
  }
  return v3;
}

@end