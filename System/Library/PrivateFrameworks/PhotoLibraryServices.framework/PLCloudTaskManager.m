@interface PLCloudTaskManager
- (BOOL)addProgressBlock:(id)a3 completionHandler:(id)a4 forResourceIdentifier:(id)a5 highPriority:(BOOL)a6 withTaskIdentifier:(id)a7;
- (PLCloudTaskManager)init;
- (id)_taskForResourceIdentifier:(id)a3 highPriority:(BOOL)a4;
- (id)_taskIdentifiersForResourceIdentifier:(id)a3 highPriority:(BOOL)a4;
- (id)getPendingTaskForTaskIdentifier:(id)a3;
- (void)_removeTaskIdentifiersForResourceIdentifier:(id)a3 highPriority:(BOOL)a4;
- (void)_setTaskIdentifiers:(id)a3 forResourceIdentifier:(id)a4 highPriority:(BOOL)a5;
- (void)cancelTaskWithTaskIdentifier:(id)a3 completion:(id)a4;
- (void)reportCompletionForResourceIdentifier:(id)a3 highPriority:(BOOL)a4 withError:(id)a5;
- (void)reportProgress:(float)a3 forResourceIdentifier:(id)a4 highPriority:(BOOL)a5;
- (void)reset;
- (void)setPendingTaskWithTransferTask:(id)a3 withTaskIdentifier:(id)a4;
@end

@implementation PLCloudTaskManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_lowPriorityResourceToTaskIdentifierMap, 0);
  objc_storeStrong((id *)&self->_highPriorityResourceToTaskIdentifierMap, 0);
  objc_storeStrong((id *)&self->_pendingTaskForTaskIdentifier, 0);
}

- (void)_removeTaskIdentifiersForResourceIdentifier:(id)a3 highPriority:(BOOL)a4
{
  BOOL v4 = a4;
  isolationQueue = self->_isolationQueue;
  id v8 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  uint64_t v7 = 24;
  if (v4) {
    uint64_t v7 = 16;
  }
  [*(id *)((char *)&self->super.isa + v7) removeObjectForKey:v8];
}

- (void)_setTaskIdentifiers:(id)a3 forResourceIdentifier:(id)a4 highPriority:(BOOL)a5
{
  BOOL v5 = a5;
  isolationQueue = self->_isolationQueue;
  id v9 = a4;
  id v11 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  uint64_t v10 = 24;
  if (v5) {
    uint64_t v10 = 16;
  }
  [*(id *)((char *)&self->super.isa + v10) setObject:v11 forKey:v9];
}

- (id)_taskIdentifiersForResourceIdentifier:(id)a3 highPriority:(BOOL)a4
{
  BOOL v4 = a4;
  isolationQueue = self->_isolationQueue;
  id v7 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  uint64_t v8 = 24;
  if (v4) {
    uint64_t v8 = 16;
  }
  id v9 = [*(id *)((char *)&self->super.isa + v8) objectForKey:v7];

  return v9;
}

- (id)_taskForResourceIdentifier:(id)a3 highPriority:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  [(PLCloudTaskManager *)self _taskIdentifiersForResourceIdentifier:v6 highPriority:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingTaskForTaskIdentifier, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (v12)
        {
          v13 = (void *)v12;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (void)reset
{
  v3 = +[PLConcurrencyLimiter sharedLimiter];
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__PLCloudTaskManager_reset__block_invoke;
  v5[3] = &unk_1E5875CE0;
  v5[4] = self;
  [v3 dispatchAsync:isolationQueue block:v5];
}

uint64_t __27__PLCloudTaskManager_reset__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __27__PLCloudTaskManager_reset__block_invoke_2;
  v7[3] = &unk_1E58650C0;
  v7[4] = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  if (!*MEMORY[0x1E4F59AC0])
  {
    BOOL v4 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "Removing all PLCloudPendingResourceTasks", v6, 2u);
    }
  }
  return [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
}

uint64_t __27__PLCloudTaskManager_reset__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) cancelTaskWithTaskIdentifier:a2 completion:0];
}

- (void)cancelTaskWithTaskIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[PLConcurrencyLimiter sharedLimiter];
  isolationQueue = self->_isolationQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__PLCloudTaskManager_cancelTaskWithTaskIdentifier_completion___block_invoke;
  v12[3] = &unk_1E5874868;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v8 dispatchAsync:isolationQueue block:v12];
}

void __62__PLCloudTaskManager_cancelTaskWithTaskIdentifier_completion___block_invoke(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  v3 = v2;
  if (v2)
  {
    [v2 cancelTaskWithIdentifier:a1[5]];
    if (!*MEMORY[0x1E4F59AC0])
    {
      BOOL v4 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v5 = a1[5];
        int v7 = 134218242;
        uint64_t v8 = v3;
        __int16 v9 = 2112;
        uint64_t v10 = v5;
        _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "Removing PLCloudPendingResourceTask [cancelled] %p for identifier: %@", (uint8_t *)&v7, 0x16u);
      }
    }
    [*(id *)(a1[4] + 8) removeObjectForKey:a1[5]];
  }
  uint64_t v6 = a1[6];
  if (v6) {
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v3 != 0);
  }
}

- (id)getPendingTaskForTaskIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__13689;
  long long v16 = __Block_byref_object_dispose__13690;
  id v17 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PLCloudTaskManager_getPendingTaskForTaskIdentifier___block_invoke;
  block[3] = &unk_1E5875340;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(isolationQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __54__PLCloudTaskManager_getPendingTaskForTaskIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)reportCompletionForResourceIdentifier:(id)a3 highPriority:(BOOL)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[PLConcurrencyLimiter sharedLimiter];
  isolationQueue = self->_isolationQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__PLCloudTaskManager_reportCompletionForResourceIdentifier_highPriority_withError___block_invoke;
  v14[3] = &unk_1E5873988;
  v14[4] = self;
  id v15 = v8;
  BOOL v17 = a4;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [v10 dispatchAsync:isolationQueue block:v14];
}

void __83__PLCloudTaskManager_reportCompletionForResourceIdentifier_highPriority_withError___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _taskForResourceIdentifier:*(void *)(a1 + 40) highPriority:*(unsigned __int8 *)(a1 + 56)];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 taskIDs];
    uint64_t v5 = (void *)[v4 copy];

    [v3 reportCompletionWithError:*(void *)(a1 + 48)];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)v17;
      uint64_t v11 = (unsigned char *)MEMORY[0x1E4F59AC0];
      *(void *)&long long v8 = 134218242;
      long long v15 = v8;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
          if (!*v11)
          {
            uint64_t v14 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v15;
              v21 = v3;
              __int16 v22 = 2112;
              uint64_t v23 = v13;
              _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "Removing PLCloudPendingResourceTask [completed] %p for identifier: %@", buf, 0x16u);
            }
          }
          objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "removeObjectForKey:", v13, v15, (void)v16);
          ++v12;
        }
        while (v9 != v12);
        uint64_t v9 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v9);
    }

    [*(id *)(a1 + 32) _removeTaskIdentifiersForResourceIdentifier:*(void *)(a1 + 40) highPriority:*(unsigned __int8 *)(a1 + 56)];
  }
}

- (void)reportProgress:(float)a3 forResourceIdentifier:(id)a4 highPriority:(BOOL)a5
{
  id v8 = a4;
  uint64_t v9 = +[PLConcurrencyLimiter sharedLimiter];
  isolationQueue = self->_isolationQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__PLCloudTaskManager_reportProgress_forResourceIdentifier_highPriority___block_invoke;
  v12[3] = &unk_1E5865098;
  v12[4] = self;
  id v13 = v8;
  BOOL v15 = a5;
  float v14 = a3;
  id v11 = v8;
  [v9 dispatchAsync:isolationQueue block:v12];
}

void __72__PLCloudTaskManager_reportProgress_forResourceIdentifier_highPriority___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _taskForResourceIdentifier:*(void *)(a1 + 40) highPriority:*(unsigned __int8 *)(a1 + 52)];
  if (v2)
  {
    LODWORD(v3) = *(_DWORD *)(a1 + 48);
    id v4 = v2;
    [v2 reportProgress:v3];
    uint64_t v2 = v4;
  }
}

- (void)setPendingTaskWithTransferTask:(id)a3 withTaskIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[PLConcurrencyLimiter sharedLimiter];
  isolationQueue = self->_isolationQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__PLCloudTaskManager_setPendingTaskWithTransferTask_withTaskIdentifier___block_invoke;
  v12[3] = &unk_1E5873A50;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  [v8 dispatchAsync:isolationQueue block:v12];
}

void __72__PLCloudTaskManager_setPendingTaskWithTransferTask_withTaskIdentifier___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  [v2 setTransferTask:a1[6]];
}

- (BOOL)addProgressBlock:(id)a3 completionHandler:(id)a4 forResourceIdentifier:(id)a5 highPriority:(BOOL)a6 withTaskIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__PLCloudTaskManager_addProgressBlock_completionHandler_forResourceIdentifier_highPriority_withTaskIdentifier___block_invoke;
  block[3] = &unk_1E5865070;
  block[4] = self;
  id v23 = v14;
  BOOL v28 = a6;
  id v26 = v13;
  v27 = &v29;
  id v24 = v15;
  id v25 = v12;
  id v17 = v15;
  id v18 = v13;
  id v19 = v12;
  id v20 = v14;
  dispatch_sync(isolationQueue, block);
  LOBYTE(isolationQueue) = *((unsigned char *)v30 + 24);

  _Block_object_dispose(&v29, 8);
  return (char)isolationQueue;
}

void __111__PLCloudTaskManager_addProgressBlock_completionHandler_forResourceIdentifier_highPriority_withTaskIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _taskForResourceIdentifier:*(void *)(a1 + 40) highPriority:*(unsigned __int8 *)(a1 + 80)];
  if (v2)
  {
    double v3 = v2;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    [(PLCloudPendingResourceTask *)v2 addProgressBlock:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64) withTaskIdentifier:*(void *)(a1 + 48)];
  }
  else
  {
    double v3 = [[PLCloudPendingResourceTask alloc] initWithProgressBlock:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64) forTaskIdentifier:*(void *)(a1 + 48)];
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v4 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 48);
      int v7 = 134218242;
      id v8 = v3;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "Set PLCloudPendingResourceTask %p for identifier: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v3 forKey:*(void *)(a1 + 48)];
  id v6 = [*(id *)(a1 + 32) _taskIdentifiersForResourceIdentifier:*(void *)(a1 + 40) highPriority:*(unsigned __int8 *)(a1 + 80)];
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [*(id *)(a1 + 32) _setTaskIdentifiers:v6 forResourceIdentifier:*(void *)(a1 + 40) highPriority:*(unsigned __int8 *)(a1 + 80)];
  }
  [v6 addObject:*(void *)(a1 + 48)];
}

- (PLCloudTaskManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)PLCloudTaskManager;
  id v2 = [(PLCloudTaskManager *)&v14 init];
  if (v2)
  {
    double v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingTaskForTaskIdentifier = v2->_pendingTaskForTaskIdentifier;
    v2->_pendingTaskForTaskIdentifier = v3;

    uint64_t v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    highPriorityResourceToTaskIdentifierMap = v2->_highPriorityResourceToTaskIdentifierMap;
    v2->_highPriorityResourceToTaskIdentifierMap = v5;

    int v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lowPriorityResourceToTaskIdentifierMap = v2->_lowPriorityResourceToTaskIdentifierMap;
    v2->_lowPriorityResourceToTaskIdentifierMap = v7;

    __int16 v9 = PLCloudCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.assetsd.PLCloudTaskManager.isolation", v9);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v10;

    id v12 = v2;
  }

  return v2;
}

@end