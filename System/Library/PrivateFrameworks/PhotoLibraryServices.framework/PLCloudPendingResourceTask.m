@interface PLCloudPendingResourceTask
- (PLCloudPendingResourceTask)initWithProgressBlock:(id)a3 completionHandler:(id)a4 forTaskIdentifier:(id)a5;
- (id)lastUpdated;
- (id)taskIDs;
- (void)addProgressBlock:(id)a3 completionHandler:(id)a4 withTaskIdentifier:(id)a5;
- (void)cancelTaskWithIdentifier:(id)a3;
- (void)keepAlive;
- (void)reportCompletionWithError:(id)a3;
- (void)reportProgress:(float)a3;
- (void)setTransferTask:(id)a3;
@end

@implementation PLCloudPendingResourceTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskIdentifierToCompletionHandler, 0);
  objc_storeStrong((id *)&self->_taskIdentifierToProgressBlock, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_transferTask, 0);
}

- (id)lastUpdated
{
  return self->_lastUpdated;
}

- (id)taskIDs
{
  return (id)[(NSMutableDictionary *)self->_taskIdentifierToCompletionHandler allKeys];
}

- (void)cancelTaskWithIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = (CPLResourceTransferTask *)a3;
  v5 = [(NSMutableDictionary *)self->_taskIdentifierToCompletionHandler objectForKey:v4];
  v6 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (v5)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      v7 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 138412290;
        v16 = v4;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "Canceling task with taskIdentifier %@", (uint8_t *)&v15, 0xCu);
      }
    }
    v8 = [(CPLResourceTransferTask *)self->_transferTask resource];
    uint64_t v9 = [v8 resourceType];

    v10 = [MEMORY[0x1E4F59868] operationCancelledError];
    ((void (**)(void, CPLResourceTransferTask *, uint64_t, void, void *))v5)[2](v5, v4, v9, 0, v10);

    [(NSMutableDictionary *)self->_taskIdentifierToCompletionHandler removeObjectForKey:v4];
  }
  if (![(NSMutableDictionary *)self->_taskIdentifierToCompletionHandler count])
  {
    transferTask = self->_transferTask;
    if (transferTask)
    {
      if (!*v6)
      {
        v12 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v13 = self->_transferTask;
          int v15 = 138412290;
          v16 = v13;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "Canceling task %@", (uint8_t *)&v15, 0xCu);
        }

        transferTask = self->_transferTask;
      }
      [(CPLResourceTransferTask *)transferTask cancelTask];
      [(PLCloudPendingResourceTask *)self setTransferTask:0];
      self->_transferTaskRemoved = 1;
    }
    else if (!*v6)
    {
      v14 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 138412290;
        v16 = v4;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "Transfer task not found for %@. Nothing is canceled", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  [(PLCloudPendingResourceTask *)self keepAlive];
}

- (void)reportCompletionWithError:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!*MEMORY[0x1E4F59AC0])
  {
    v5 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      transferTask = self->_transferTask;
      *(_DWORD *)buf = 138412290;
      v19 = transferTask;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Task %@ completed", buf, 0xCu);
    }
  }
  if (!self->_completed)
  {
    v7 = [(CPLResourceTransferTask *)self->_transferTask resource];
    uint64_t v8 = [v7 resourceType];

    uint64_t v9 = [(CPLResourceTransferTask *)self->_transferTask resource];
    v10 = [v9 identity];
    v11 = [v10 fileURL];

    taskIdentifierToCompletionHandler = self->_taskIdentifierToCompletionHandler;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__PLCloudPendingResourceTask_reportCompletionWithError___block_invoke;
    v14[3] = &unk_1E5868D20;
    uint64_t v17 = v8;
    id v15 = v11;
    id v16 = v4;
    id v13 = v11;
    [(NSMutableDictionary *)taskIdentifierToCompletionHandler enumerateKeysAndObjectsUsingBlock:v14];
    [(NSMutableDictionary *)self->_taskIdentifierToCompletionHandler removeAllObjects];
    self->_completed = 1;
  }
}

uint64_t __56__PLCloudPendingResourceTask_reportCompletionWithError___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void, void, void))(a3 + 16))(a3, a2, a1[6], a1[4], a1[5]);
}

- (void)reportProgress:(float)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!*MEMORY[0x1E4F59AC0])
  {
    v5 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      transferTask = self->_transferTask;
      *(_DWORD *)buf = 134218242;
      double v11 = a3;
      __int16 v12 = 2112;
      id v13 = transferTask;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Reporting progress %f for task %@", buf, 0x16u);
    }
  }
  taskIdentifierToProgressBlock = self->_taskIdentifierToProgressBlock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__PLCloudPendingResourceTask_reportProgress___block_invoke;
  v8[3] = &__block_descriptor_36_e43_v32__0__NSString_8___v____NSString_f_16_B24l;
  float v9 = a3;
  [(NSMutableDictionary *)taskIdentifierToProgressBlock enumerateKeysAndObjectsUsingBlock:v8];
  [(PLCloudPendingResourceTask *)self keepAlive];
}

uint64_t __45__PLCloudPendingResourceTask_reportProgress___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, float))(a3 + 16))(a3, *(float *)(a1 + 32));
}

- (void)addProgressBlock:(id)a3 completionHandler:(id)a4 withTaskIdentifier:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v14)
  {
    taskIdentifierToProgressBlock = self->_taskIdentifierToProgressBlock;
    double v11 = (void *)MEMORY[0x19F38D650](v14);
    [(NSMutableDictionary *)taskIdentifierToProgressBlock setObject:v11 forKey:v9];
  }
  if (v8)
  {
    taskIdentifierToCompletionHandler = self->_taskIdentifierToCompletionHandler;
    id v13 = (void *)MEMORY[0x19F38D650](v8);
    [(NSMutableDictionary *)taskIdentifierToCompletionHandler setObject:v13 forKey:v9];
  }
}

- (void)keepAlive
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  lastUpdated = self->_lastUpdated;
  self->_lastUpdated = v3;
}

- (void)setTransferTask:(id)a3
{
  objc_storeStrong((id *)&self->_transferTask, a3);
  [(PLCloudPendingResourceTask *)self keepAlive];
}

- (PLCloudPendingResourceTask)initWithProgressBlock:(id)a3 completionHandler:(id)a4 forTaskIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PLCloudPendingResourceTask;
  double v11 = [(PLCloudPendingResourceTask *)&v24 init];
  __int16 v12 = v11;
  if (v11)
  {
    v11->_completed = 0;
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    lastUpdated = v12->_lastUpdated;
    v12->_lastUpdated = (NSDate *)v13;

    id v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    taskIdentifierToProgressBlock = v12->_taskIdentifierToProgressBlock;
    v12->_taskIdentifierToProgressBlock = v15;

    if (v8)
    {
      uint64_t v17 = v12->_taskIdentifierToProgressBlock;
      v18 = (void *)MEMORY[0x19F38D650](v8);
      [(NSMutableDictionary *)v17 setObject:v18 forKey:v10];
    }
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    taskIdentifierToCompletionHandler = v12->_taskIdentifierToCompletionHandler;
    v12->_taskIdentifierToCompletionHandler = v19;

    if (v9)
    {
      v21 = v12->_taskIdentifierToCompletionHandler;
      v22 = (void *)MEMORY[0x19F38D650](v9);
      [(NSMutableDictionary *)v21 setObject:v22 forKey:v10];
    }
  }

  return v12;
}

@end