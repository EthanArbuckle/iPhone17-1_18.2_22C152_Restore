@interface SBSynchronizeCloudCriticalDataOperation
- (BOOL)_queue_isComplete;
- (BOOL)isComplete;
- (BOOL)waitForSynchronizeToCompleteWithTimeout:(double)a3;
- (SBSynchronizeCloudCriticalDataOperation)init;
- (SBSynchronizeCloudCriticalDataOperation)initWithDefaults:(id)a3 userManager:(id)a4;
- (id)_queue_fetchCloudAccountOperation;
- (id)_queue_fetchCloudDefaultsOperation;
- (id)_queue_fetchMDMProfilesOperation;
- (id)_queue_migrateSoundPreferencesOperation;
- (unint64_t)_pendingOperationCount;
- (void)_addTestOperation:(id)a3 shouldBlock:(BOOL)a4;
- (void)_fetchDomains:(id)a3 fromIndex:(int64_t)a4 queue:(id)a5 completion:(id)a6;
- (void)_queue_addOperation:(id)a3 shouldBlock:(BOOL)a4;
- (void)_queue_startFetchingCloudCriticalData;
- (void)startSynchronize;
@end

@implementation SBSynchronizeCloudCriticalDataOperation

- (SBSynchronizeCloudCriticalDataOperation)init
{
  v3 = +[SBDefaults localDefaults];
  v4 = [v3 bootDefaults];
  v5 = [MEMORY[0x1E4FB36F8] sharedManager];
  v6 = [(SBSynchronizeCloudCriticalDataOperation *)self initWithDefaults:v4 userManager:v5];

  return v6;
}

- (SBSynchronizeCloudCriticalDataOperation)initWithDefaults:(id)a3 userManager:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SBSynchronizeCloudCriticalDataOperation;
  v9 = [(SBSynchronizeCloudCriticalDataOperation *)&v21 init];
  v10 = v9;
  if (v9)
  {
    v9->_queue_cloudSyncStartTime = -1.79769313e308;
    if ([v8 isMultiUser] && (objc_msgSend(v8, "isLoginSession") & 1) == 0) {
      int v11 = [v7 hasCompletedSynchronizingCloudCriticalData] ^ 1;
    }
    else {
      LOBYTE(v11) = 0;
    }
    v10->_needsSync = v11;
    [@"com.apple.springboard.synchronizeCloudCriticalData" UTF8String];
    uint64_t v12 = BSDispatchQueueCreateWithQualityOfService();
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    dispatch_group_t v14 = dispatch_group_create();
    queue_operationGroup = v10->_queue_operationGroup;
    v10->_queue_operationGroup = (OS_dispatch_group *)v14;

    v10->_queue_isComplete = !v10->_needsSync;
    objc_storeStrong((id *)&v10->_queue_bootDefaults, a3);
    v10->_queue_operationCount = 0;
    v16 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v10->_operationQueue;
    v10->_operationQueue = v16;

    [(NSOperationQueue *)v10->_operationQueue setQualityOfService:33];
    [(NSOperationQueue *)v10->_operationQueue setName:@"com.apple.springboard.synchronizeCloudCriticalData"];
    [(NSOperationQueue *)v10->_operationQueue setMaxConcurrentOperationCount:5];
    v18 = SBLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      if (v10->_needsSync) {
        v19 = @"YES";
      }
      else {
        v19 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      v23 = v19;
      _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "Needs to synchronize cloud critical data? %@", buf, 0xCu);
    }
  }
  return v10;
}

- (BOOL)isComplete
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__SBSynchronizeCloudCriticalDataOperation_isComplete__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__SBSynchronizeCloudCriticalDataOperation_isComplete__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_isComplete");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)startSynchronize
{
  if (self->_needsSync)
  {
    kdebug_trace();
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__SBSynchronizeCloudCriticalDataOperation_startSynchronize__block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_sync(queue, block);
    kdebug_trace();
  }
}

uint64_t __59__SBSynchronizeCloudCriticalDataOperation_startSynchronize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_startFetchingCloudCriticalData");
}

- (BOOL)waitForSynchronizeToCompleteWithTimeout:(double)a3
{
  if ([(SBSynchronizeCloudCriticalDataOperation *)self isComplete]) {
    return 1;
  }
  queue_operationGroup = self->_queue_operationGroup;
  dispatch_time_t v6 = BSDispatchTimeWithInterval();
  return dispatch_group_wait(queue_operationGroup, v6) == 0;
}

- (unint64_t)_pendingOperationCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__SBSynchronizeCloudCriticalDataOperation__pendingOperationCount__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __65__SBSynchronizeCloudCriticalDataOperation__pendingOperationCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) operationCount];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_addTestOperation:(id)a3 shouldBlock:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__SBSynchronizeCloudCriticalDataOperation__addTestOperation_shouldBlock___block_invoke;
  block[3] = &unk_1E6AF5770;
  BOOL v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(queue, block);
}

uint64_t __73__SBSynchronizeCloudCriticalDataOperation__addTestOperation_shouldBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 48))
  {
    unint64_t v3 = *(void **)(v2 + 72);
    if (v3) {
      goto LABEL_7;
    }
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v4;
    uint64_t v7 = 72;
  }
  else
  {
    unint64_t v3 = *(void **)(v2 + 80);
    if (v3) {
      goto LABEL_7;
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v9 = *(void *)(a1 + 32);
    id v6 = *(void **)(v9 + 80);
    *(void *)(v9 + 80) = v8;
    uint64_t v7 = 80;
  }

  unint64_t v3 = *(void **)(*(void *)(a1 + 32) + v7);
LABEL_7:
  uint64_t v10 = *(void *)(a1 + 40);
  return [v3 addObject:v10];
}

- (void)_queue_addOperation:(id)a3 shouldBlock:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4) {
    dispatch_group_enter((dispatch_group_t)self->_queue_operationGroup);
  }
  ++self->_queue_operationCount;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__SBSynchronizeCloudCriticalDataOperation__queue_addOperation_shouldBlock___block_invoke;
  v7[3] = &unk_1E6AF5D38;
  v7[4] = self;
  BOOL v8 = v4;
  [v6 setCompletionBlock:v7];
  [(NSOperationQueue *)self->_operationQueue addOperation:v6];
}

void __75__SBSynchronizeCloudCriticalDataOperation__queue_addOperation_shouldBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __75__SBSynchronizeCloudCriticalDataOperation__queue_addOperation_shouldBlock___block_invoke_2;
  v3[3] = &unk_1E6AF5D38;
  v3[4] = v1;
  char v4 = *(unsigned char *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __75__SBSynchronizeCloudCriticalDataOperation__queue_addOperation_shouldBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  --*(void *)(*(void *)(a1 + 32) + 48);
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 48))
  {
    *(unsigned char *)(v2 + 56) = 1;
    [*(id *)(*(void *)(a1 + 32) + 16) setHasCompletedSynchronizingCloudCriticalData:1];
    unint64_t v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      char v4 = (objc_class *)objc_opt_class();
      uint64_t v5 = NSStringFromClass(v4);
      BSContinuousMachTimeNow();
      double v7 = v6 - *(double *)(*(void *)(a1 + 32) + 64);
      int v8 = 138543618;
      uint64_t v9 = v5;
      __int16 v10 = 2048;
      double v11 = v7;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ took %fs", (uint8_t *)&v8, 0x16u);
    }
  }
  if (*(unsigned char *)(a1 + 40)) {
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  }
}

- (BOOL)_queue_isComplete
{
  return self->_queue_isComplete;
}

- (void)_queue_startFetchingCloudCriticalData
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssert();
  BSContinuousMachTimeNow();
  self->_queue_cloudSyncStartTime = v3;
  char v4 = [(SBSynchronizeCloudCriticalDataOperation *)self _queue_fetchCloudAccountOperation];
  uint64_t v5 = [(SBSynchronizeCloudCriticalDataOperation *)self _queue_fetchCloudDefaultsOperation];
  double v6 = [(SBSynchronizeCloudCriticalDataOperation *)self _queue_fetchMDMProfilesOperation];
  double v7 = [(SBSynchronizeCloudCriticalDataOperation *)self _queue_migrateSoundPreferencesOperation];
  [v5 addDependency:v4];
  [v7 addDependency:v5];
  int v8 = _os_feature_enabled_impl();
  int v9 = _os_feature_enabled_impl();
  __int16 v10 = SBLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    uint64_t v13 = v9 ^ 1u;
    *(_DWORD *)buf = 138543874;
    uint64_t v14 = v8 ^ 1u;
    v38 = v12;
    __int16 v39 = 1024;
    int v40 = v13;
    __int16 v41 = 1024;
    int v42 = v14;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ wait for iCloud sign-in: %d, wait for cloud defaults: %d", buf, 0x18u);
  }
  else
  {
    uint64_t v13 = v9 ^ 1u;
    uint64_t v14 = v8 ^ 1u;
  }

  [(SBSynchronizeCloudCriticalDataOperation *)self _queue_addOperation:v4 shouldBlock:v13];
  [(SBSynchronizeCloudCriticalDataOperation *)self _queue_addOperation:v5 shouldBlock:v14];
  [(SBSynchronizeCloudCriticalDataOperation *)self _queue_addOperation:v6 shouldBlock:0];
  [(SBSynchronizeCloudCriticalDataOperation *)self _queue_addOperation:v7 shouldBlock:v14];
  blockingTestOperations = self->_blockingTestOperations;
  if (blockingTestOperations)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v16 = blockingTestOperations;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v32;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v32 != v19) {
            objc_enumerationMutation(v16);
          }
          [(SBSynchronizeCloudCriticalDataOperation *)self _queue_addOperation:*(void *)(*((void *)&v31 + 1) + 8 * v20++) shouldBlock:1];
        }
        while (v18 != v20);
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v18);
    }
  }
  nonblockingTestOperations = self->_nonblockingTestOperations;
  if (nonblockingTestOperations)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v22 = nonblockingTestOperations;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v28;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v28 != v25) {
            objc_enumerationMutation(v22);
          }
          -[SBSynchronizeCloudCriticalDataOperation _queue_addOperation:shouldBlock:](self, "_queue_addOperation:shouldBlock:", *(void *)(*((void *)&v27 + 1) + 8 * v26++), 0, (void)v27);
        }
        while (v24 != v26);
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v24);
    }
  }
}

- (id)_queue_fetchCloudAccountOperation
{
  uint64_t v2 = objc_alloc_init(_SBSynchronizeOperation);
  [(_SBSynchronizeOperation *)v2 setName:@"FetchICloudAccount"];
  [(_SBSynchronizeOperation *)v2 setHumanReadableDescription:@"Loading iCloud account data..."];
  [(_SBSynchronizeOperation *)v2 addTask:&__block_literal_global_319];
  return v2;
}

- (id)_queue_fetchMDMProfilesOperation
{
  uint64_t v2 = objc_alloc_init(_SBSynchronizeOperation);
  [(_SBSynchronizeOperation *)v2 setName:@"FetchMDMProfiles"];
  [(_SBSynchronizeOperation *)v2 setHumanReadableDescription:@"Fetching profiles..."];
  [(_SBSynchronizeOperation *)v2 addTask:&__block_literal_global_29_2];
  return v2;
}

- (id)_queue_fetchCloudDefaultsOperation
{
  if (_queue_fetchCloudDefaultsOperation___once != -1) {
    dispatch_once(&_queue_fetchCloudDefaultsOperation___once, &__block_literal_global_31_5);
  }
  double v3 = objc_alloc_init(_SBSynchronizeOperation);
  [(_SBSynchronizeOperation *)v3 setName:@"FetchICloudDefaults"];
  [(_SBSynchronizeOperation *)v3 setHumanReadableDescription:@"Fetching data from iCloud..."];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__SBSynchronizeCloudCriticalDataOperation__queue_fetchCloudDefaultsOperation__block_invoke_2;
  v5[3] = &unk_1E6B09F58;
  v5[4] = self;
  [(_SBSynchronizeOperation *)v3 addTask:v5];
  return v3;
}

void __77__SBSynchronizeCloudCriticalDataOperation__queue_fetchCloudDefaultsOperation__block_invoke()
{
  v0 = (void *)_queue_fetchCloudDefaultsOperation___bootCriticalDomains;
  _queue_fetchCloudDefaultsOperation___bootCriticalDomains = (uint64_t)&unk_1F33483F0;
}

void __77__SBSynchronizeCloudCriticalDataOperation__queue_fetchCloudDefaultsOperation__block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = a2;
  dispatch_group_enter(v3);
  kdebug_trace();
  BSContinuousMachTimeNow();
  uint64_t v5 = v4;
  id v6 = [NSString stringWithFormat:@"%@.CloudDefaultsDomains", @"com.apple.springboard.synchronizeCloudCriticalData"];
  [v6 UTF8String];
  double v7 = (void *)BSDispatchQueueCreateWithQualityOfService();
  int v8 = *(void **)(a1 + 32);
  uint64_t v9 = _queue_fetchCloudDefaultsOperation___bootCriticalDomains;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__SBSynchronizeCloudCriticalDataOperation__queue_fetchCloudDefaultsOperation__block_invoke_3;
  v11[3] = &unk_1E6AF6FC0;
  uint64_t v13 = v5;
  v11[4] = v8;
  uint64_t v12 = v3;
  __int16 v10 = v3;
  [v8 _fetchDomains:v9 fromIndex:0 queue:v7 completion:v11];
}

void __77__SBSynchronizeCloudCriticalDataOperation__queue_fetchCloudDefaultsOperation__block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = (objc_class *)objc_opt_class();
    uint64_t v4 = NSStringFromClass(v3);
    BSContinuousMachTimeNow();
    double v6 = v5 - *(double *)(a1 + 48);
    int v7 = 138543618;
    int v8 = v4;
    __int16 v9 = 2048;
    double v10 = v6;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed syncing domains (duration: %f sec)", (uint8_t *)&v7, 0x16u);
  }
  kdebug_trace();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_fetchDomains:(id)a3 fromIndex:(int64_t)a4 queue:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBSynchronizeCloudCriticalDataOperation.m", 268, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SBSynchronizeCloudCriticalDataOperation.m", 269, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    goto LABEL_4;
  }
  uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"SBSynchronizeCloudCriticalDataOperation.m", 267, @"Invalid parameter not satisfying: %@", @"domains" object file lineNumber description];

  if (!v12) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v13) {
    goto LABEL_7;
  }
LABEL_4:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__SBSynchronizeCloudCriticalDataOperation__fetchDomains_fromIndex_queue_completion___block_invoke;
  block[3] = &unk_1E6AF6260;
  id v24 = v13;
  int64_t v25 = a4;
  id v21 = v11;
  v22 = self;
  id v23 = v12;
  id v14 = v13;
  v15 = v12;
  id v16 = v11;
  dispatch_async(v15, block);
}

void __84__SBSynchronizeCloudCriticalDataOperation__fetchDomains_fromIndex_queue_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = *(void *)(a1 + 64);
  if (v2 >= [*(id *)(a1 + 32) count])
  {
    int v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v8();
  }
  else
  {
    double v3 = [*(id *)(a1 + 32) objectAtIndex:*(void *)(a1 + 64)];
    BSContinuousMachTimeNow();
    uint64_t v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      double v5 = (objc_class *)objc_opt_class();
      double v6 = NSStringFromClass(v5);
      *(_DWORD *)buf = 138543618;
      id v13 = v6;
      __int16 v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Start syncing domain: %@", buf, 0x16u);
    }
    id v9 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    id v7 = v3;
    _CFPreferencesAppFullCloudSynchronize();
  }
}

uint64_t __84__SBSynchronizeCloudCriticalDataOperation__fetchDomains_fromIndex_queue_completion___block_invoke_70(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = (objc_class *)objc_opt_class();
    uint64_t v4 = NSStringFromClass(v3);
    uint64_t v5 = *(void *)(a1 + 40);
    BSContinuousMachTimeNow();
    double v7 = v6 - *(double *)(a1 + 72);
    int v9 = 138543874;
    id v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2048;
    double v14 = v7;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed syncing domain: %@ (duration: %f sec)", (uint8_t *)&v9, 0x20u);
  }
  return [*(id *)(a1 + 32) _fetchDomains:*(void *)(a1 + 48) fromIndex:*(void *)(a1 + 80) + 1 queue:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

- (id)_queue_migrateSoundPreferencesOperation
{
  unint64_t v2 = objc_alloc_init(_SBSynchronizeOperation);
  [(_SBSynchronizeOperation *)v2 setName:@"MigrateSoundPreferences"];
  [(_SBSynchronizeOperation *)v2 setHumanReadableDescription:@"Migrating sound preferences from com.apple.springboard to com.apple.preferences.sounds..."];
  [(_SBSynchronizeOperation *)v2 addTask:&__block_literal_global_79_2];
  return v2;
}

uint64_t __82__SBSynchronizeCloudCriticalDataOperation__queue_migrateSoundPreferencesOperation__block_invoke()
{
  return MEMORY[0x1F4145EA0]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonblockingTestOperations, 0);
  objc_storeStrong((id *)&self->_blockingTestOperations, 0);
  objc_storeStrong((id *)&self->_queue_operationGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue_bootDefaults, 0);
}

@end