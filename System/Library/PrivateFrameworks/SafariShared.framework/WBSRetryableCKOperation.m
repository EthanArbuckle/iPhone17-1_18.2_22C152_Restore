@interface WBSRetryableCKOperation
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (BOOL)_scheduleRetryIfNeededForError:(id)a3;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (CKOperation)currentOperation;
- (CKOperationConfiguration)configuration;
- (CKOperationGroup)group;
- (NSString)description;
- (NSString)operationID;
- (OS_dispatch_queue)handlingQueue;
- (OS_os_log)log;
- (WBSRetryableCKOperation)initWithOwner:(id)a3 handlingQueue:(id)a4;
- (double)timeout;
- (id)_makeOperation;
- (id)didExceedRetryTimeout;
- (id)didReceiveNonRetryableError;
- (id)longLivedOperationWasPersistedBlock;
- (id)owner;
- (id)ownerDidDeallocateBlock;
- (int64_t)_status;
- (int64_t)qualityOfService;
- (unint64_t)numberOfRetries;
- (void)_didFinishOperation;
- (void)_scheduleNextOperation;
- (void)_setStatus:(int64_t)a3;
- (void)_setUpOperation:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)sentinelDidDeallocateWithContext:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDidExceedRetryTimeout:(id)a3;
- (void)setDidReceiveNonRetryableError:(id)a3;
- (void)setGroup:(id)a3;
- (void)setLog:(id)a3;
- (void)setLongLivedOperationWasPersistedBlock:(id)a3;
- (void)setOwnerDidDeallocateBlock:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setTimeout:(double)a3;
- (void)start;
@end

@implementation WBSRetryableCKOperation

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___WBSRetryableCKOperation;
  v5 = objc_msgSendSuper2(&v8, sel_keyPathsForValuesAffectingValueForKey_, v4);
  if (([v4 isEqualToString:@"isExecuting"] & 1) != 0
    || [v4 isEqualToString:@"isFinished"])
  {
    uint64_t v6 = [v5 setByAddingObject:@"status"];

    v5 = (void *)v6;
  }

  return v5;
}

- (WBSRetryableCKOperation)initWithOwner:(id)a3 handlingQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)WBSRetryableCKOperation;
  objc_super v8 = [(WBSRetryableCKOperation *)&v25 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_owner, v6);
    objc_storeStrong((id *)&v9->_handlingQueue, a4);
    v10 = objc_alloc_init(WBSCloudKitOperationRetryManager);
    retryManager = v9->_retryManager;
    v9->_retryManager = v10;

    [(WBSCloudKitOperationRetryManager *)v9->_retryManager setScheduleQueue:v7];
    v12 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v13 = [v12 UUIDString];
    operationID = v9->_operationID;
    v9->_operationID = (NSString *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    childOperationIDs = v9->_childOperationIDs;
    v9->_childOperationIDs = (NSMutableArray *)v15;

    v17 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v9->_operationQueue;
    v9->_operationQueue = v17;

    v19 = [NSString stringWithFormat:@"com.apple.SafariShared.WBSRetryableCKOperation.%@.%p._operationQueue", objc_opt_class(), v9];
    [(NSOperationQueue *)v9->_operationQueue setName:v19];

    [(NSOperationQueue *)v9->_operationQueue setUnderlyingQueue:v7];
    uint64_t v20 = [MEMORY[0x1E4F1CA80] set];
    explicitlySetProperties = v9->_explicitlySetProperties;
    v9->_explicitlySetProperties = (NSMutableSet *)v20;

    id v22 = objc_alloc_init(MEMORY[0x1E4F1A210]);
    [(WBSRetryableCKOperation *)v9 setConfiguration:v22];

    objc_msgSend(v6, "safari_setDeallocationSentinelForObserver:", v9);
    v23 = v9;
  }

  return v9;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained(&self->_owner);
  objc_msgSend(WeakRetained, "safari_removeDeallocationSentinelForObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WBSRetryableCKOperation;
  [(WBSRetryableCKOperation *)&v4 dealloc];
}

- (OS_os_log)log
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  objc_super v4 = self->_log;
  os_unfair_lock_unlock(p_internalLock);
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = (OS_os_log *)MEMORY[0x1E4F14500];
  }
  id v6 = v5;

  return v6;
}

- (void)setLog:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__WBSRetryableCKOperation_setLog___block_invoke;
  v7[3] = &unk_1E5C8C920;
  p_internalLock = &self->_internalLock;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_unfair_lock_lock(p_internalLock);
  __34__WBSRetryableCKOperation_setLog___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_internalLock);
}

uint64_t __34__WBSRetryableCKOperation_setLog___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 328), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 328);
  id v4 = *(void **)(v2 + 288);
  return [v4 setLog:v3];
}

- (double)timeout
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  [(WBSCloudKitOperationRetryManager *)self->_retryManager timeout];
  double v5 = v4;
  os_unfair_lock_unlock(p_internalLock);
  return v5;
}

- (void)setTimeout:(double)a3
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  [(WBSCloudKitOperationRetryManager *)self->_retryManager setTimeout:a3];
  os_unfair_lock_unlock(p_internalLock);
}

- (unint64_t)numberOfRetries
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  unint64_t v4 = [(WBSCloudKitOperationRetryManager *)self->_retryManager numberOfRetries];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (int64_t)_status
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  int64_t status = self->_status;
  os_unfair_lock_unlock(p_internalLock);
  return status;
}

- (void)_setStatus:(int64_t)a3
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  self->_int64_t status = a3;
  os_unfair_lock_unlock(p_internalLock);
}

- (id)didReceiveNonRetryableError
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  unint64_t v4 = (void *)[self->_didReceiveNonRetryableError copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setDidReceiveNonRetryableError:(id)a3
{
  p_internalLock = &self->_internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  id v6 = (void *)[v5 copy];

  id didReceiveNonRetryableError = self->_didReceiveNonRetryableError;
  self->_id didReceiveNonRetryableError = v6;

  [(NSMutableSet *)self->_explicitlySetProperties addObject:@"didReceiveNonRetryableError"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)didExceedRetryTimeout
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  unint64_t v4 = (void *)[self->_didExceedRetryTimeout copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setDidExceedRetryTimeout:(id)a3
{
  p_internalLock = &self->_internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  id v6 = (void *)[v5 copy];

  id didExceedRetryTimeout = self->_didExceedRetryTimeout;
  self->_id didExceedRetryTimeout = v6;

  [(NSMutableSet *)self->_explicitlySetProperties addObject:@"didExceedRetryTimeout"];
  os_unfair_lock_unlock(p_internalLock);
}

- (void)start
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(WBSRetryableCKOperation *)self _setStatus:1];
  if ([(WBSRetryableCKOperation *)self isCancelled])
  {
    [(WBSRetryableCKOperation *)self _setStatus:2];
    uint64_t v3 = [(WBSRetryableCKOperation *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v9 = self;
      _os_log_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_INFO, "Operation %{public}@ was cancelled before starting", buf, 0xCu);
    }
  }
  else
  {
    unint64_t v4 = [(WBSRetryableCKOperation *)self log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = self;
      _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_DEFAULT, "Operation %{public}@ is starting", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    operationQueue = self->_operationQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __32__WBSRetryableCKOperation_start__block_invoke;
    v6[3] = &unk_1E5C8E0B0;
    objc_copyWeak(&v7, (id *)buf);
    [(NSOperationQueue *)operationQueue addOperationWithBlock:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
}

void __32__WBSRetryableCKOperation_start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _scheduleNextOperation];
    id WeakRetained = v2;
  }
}

- (void)cancel
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(WBSRetryableCKOperation *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = self;
    _os_log_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_DEFAULT, "Operation %{public}@ will cancel", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)WBSRetryableCKOperation;
  [(WBSRetryableCKOperation *)&v8 cancel];
  id WeakRetained = objc_loadWeakRetained(&self->_owner);
  objc_msgSend(WeakRetained, "safari_removeDeallocationSentinelForObserver:", self);

  if ([(WBSRetryableCKOperation *)self isExecuting])
  {
    objc_initWeak((id *)buf, self);
    operationQueue = self->_operationQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __33__WBSRetryableCKOperation_cancel__block_invoke;
    v6[3] = &unk_1E5C8E0B0;
    objc_copyWeak(&v7, (id *)buf);
    [(NSOperationQueue *)operationQueue addBarrierBlock:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
}

void __33__WBSRetryableCKOperation_cancel__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 68);
    id v3 = *(id *)&v2[90]._os_unfair_lock_opaque;
    unint64_t v4 = *(void **)&v2[90]._os_unfair_lock_opaque;
    *(void *)&v2[90]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v2 + 68);
    id v5 = [(os_unfair_lock_s *)v2 log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = objc_opt_class();
      id v7 = [v3 operationID];
      int v8 = 138543874;
      uint64_t v9 = v6;
      __int16 v10 = 2114;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = v2;
      _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Cancelling %{public}@ with ID %{public}@ in %{public}@", (uint8_t *)&v8, 0x20u);
    }
    [v3 cancel];
    [(os_unfair_lock_s *)v2 _setStatus:2];
  }
}

- (BOOL)isExecuting
{
  return [(WBSRetryableCKOperation *)self _status] == 1;
}

- (BOOL)isFinished
{
  return [(WBSRetryableCKOperation *)self _status] == 2;
}

- (int64_t)qualityOfService
{
  v15.receiver = self;
  v15.super_class = (Class)WBSRetryableCKOperation;
  id v3 = [(WBSRetryableCKOperation *)&v15 qualityOfService];
  unint64_t v4 = [(WBSRetryableCKOperation *)self configuration];
  int v5 = [v4 hasQualityOfService];

  if (v5)
  {
    uint64_t v6 = [(WBSRetryableCKOperation *)self configuration];
    int64_t v7 = [v6 qualityOfService];
  }
  else
  {
    int v8 = [(WBSRetryableCKOperation *)self group];
    uint64_t v9 = [v8 defaultConfiguration];
    int v10 = [v9 hasQualityOfService];

    int64_t v7 = (int64_t)v3;
    if (!v10) {
      goto LABEL_6;
    }
    uint64_t v6 = [(WBSRetryableCKOperation *)self group];
    uint64_t v11 = [v6 defaultConfiguration];
    int64_t v7 = [v11 qualityOfService];
  }
LABEL_6:
  if (v7 == -1)
  {
    __int16 v12 = [(WBSRetryableCKOperation *)self configuration];
    int64_t v7 = [v12 qualityOfService];
  }
  if ((id)v7 != v3)
  {
    v14.receiver = self;
    v14.super_class = (Class)WBSRetryableCKOperation;
    [(WBSRetryableCKOperation *)&v14 setQualityOfService:v7];
  }
  [(NSOperationQueue *)self->_operationQueue setQualityOfService:v7];
  return v7;
}

- (void)setQualityOfService:(int64_t)a3
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  [(CKOperationConfiguration *)self->_configuration setQualityOfService:a3];
  os_unfair_lock_unlock(p_internalLock);
  [(WBSRetryableCKOperation *)self qualityOfService];
}

- (CKOperationConfiguration)configuration
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  unint64_t v4 = self->_configuration;
  os_unfair_lock_unlock(p_internalLock);
  int v5 = (void *)[(CKOperationConfiguration *)v4 copy];

  return (CKOperationConfiguration *)v5;
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  if (!v4) {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1A210]);
  }
  id v7 = v4;
  os_unfair_lock_lock(&self->_internalLock);
  int v5 = (CKOperationConfiguration *)[v7 copy];
  configuration = self->_configuration;
  self->_configuration = v5;

  os_unfair_lock_unlock(&self->_internalLock);
  [(WBSRetryableCKOperation *)self qualityOfService];
}

- (CKOperationGroup)group
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id v4 = self->_group;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setGroup:(id)a3
{
  id v4 = (CKOperationGroup *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  group = self->_group;
  self->_group = v4;
  uint64_t v6 = v4;

  os_unfair_lock_unlock(&self->_internalLock);
  [(WBSCloudKitOperationRetryManager *)self->_retryManager setOperationGroup:v6];

  [(WBSRetryableCKOperation *)self qualityOfService];
}

- (void)_scheduleNextOperation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (([(WBSRetryableCKOperation *)self isCancelled] & 1) == 0)
  {
    os_unfair_lock_lock(&self->_internalLock);
    id v3 = [(WBSRetryableCKOperation *)self _makeOperation];
    [(WBSRetryableCKOperation *)self _setUpOperation:v3];
    id v4 = [(CKOperation *)v3 operationID];
    [(NSMutableArray *)self->_childOperationIDs addObject:v4];
    os_unfair_lock_unlock(&self->_internalLock);
    int v5 = [(WBSRetryableCKOperation *)self description];
    uint64_t v6 = objc_opt_class();
    unint64_t v7 = [(WBSRetryableCKOperation *)self numberOfRetries];
    int v8 = [(WBSRetryableCKOperation *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v19 = v6;
      __int16 v20 = 2114;
      v21 = v4;
      __int16 v22 = 2114;
      v23 = v5;
      __int16 v24 = 2048;
      unint64_t v25 = v7;
      _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_INFO, "Will begin %{public}@ with ID %{public}@ in %{public}@ retry: %ld", buf, 0x2Au);
    }

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49__WBSRetryableCKOperation__scheduleNextOperation__block_invoke;
    v13[3] = &unk_1E5C9F690;
    v13[4] = self;
    id v14 = v4;
    id v15 = v5;
    uint64_t v16 = v6;
    unint64_t v17 = v7;
    id v9 = v5;
    id v10 = v4;
    [(CKOperation *)v3 setCompletionBlock:v13];
    os_unfair_lock_lock(&self->_internalLock);
    currentOperation = self->_currentOperation;
    self->_currentOperation = v3;
    __int16 v12 = v3;

    os_unfair_lock_unlock(&self->_internalLock);
    [(NSOperationQueue *)self->_operationQueue addOperation:v12];
  }
}

void __49__WBSRetryableCKOperation__scheduleNextOperation__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    int v7 = 138544130;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    uint64_t v10 = v3;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    __int16 v13 = 2048;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_INFO, "Did finish %{public}@ with ID %{public}@ in %{public}@ retry: %ld", (uint8_t *)&v7, 0x2Au);
  }
}

- (void)sentinelDidDeallocateWithContext:(id)a3
{
  if (![(WBSRetryableCKOperation *)self isFinished]
    && ([(WBSRetryableCKOperation *)self isCancelled] & 1) == 0)
  {
    [(WBSRetryableCKOperation *)self cancel];
    id ownerDidDeallocateBlock = self->_ownerDidDeallocateBlock;
    if (ownerDidDeallocateBlock)
    {
      uint64_t v5 = (void (*)(void))*((void *)ownerDidDeallocateBlock + 2);
      v5();
    }
  }
}

- (BOOL)_scheduleRetryIfNeededForError:(id)a3
{
  location[4] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_owner);
  if (WeakRetained)
  {
    objc_initWeak(location, self);
    retryManager = self->_retryManager;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    unint64_t v17 = __58__WBSRetryableCKOperation__scheduleRetryIfNeededForError___block_invoke;
    v18 = &unk_1E5C8E0B0;
    objc_copyWeak(&v19, location);
    uint64_t v7 = [(WBSCloudKitOperationRetryManager *)retryManager scheduleRetryIfNeededForError:v4 usingBlock:&v15];
    if (v7 == 1)
    {
      uint64_t v10 = [(WBSRetryableCKOperation *)self log];
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSRetryableCKOperation _scheduleRetryIfNeededForError:]();
      }
    }
    else
    {
      if (v7 == 2)
      {
        uint64_t v12 = [(WBSRetryableCKOperation *)self log];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v4, "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WBSRetryableCKOperation _scheduleRetryIfNeededForError:]();
        }

        os_unfair_lock_lock(&self->_internalLock);
        __int16 v13 = (void *)MEMORY[0x1AD0C4F80](self->_didExceedRetryTimeout);
        os_unfair_lock_unlock(&self->_internalLock);
        uint64_t v10 = MEMORY[0x1AD0C4F80](v13);

        BOOL v11 = v10 != 0;
        if (!v10) {
          goto LABEL_17;
        }
      }
      else
      {
        if (v7 != 3)
        {
          BOOL v11 = 0;
          goto LABEL_19;
        }
        uint64_t v8 = [(WBSRetryableCKOperation *)self log];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v4, "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WBSRetryableCKOperation _scheduleRetryIfNeededForError:]();
        }

        os_unfair_lock_lock(&self->_internalLock);
        __int16 v9 = (void *)MEMORY[0x1AD0C4F80](self->_didReceiveNonRetryableError);
        os_unfair_lock_unlock(&self->_internalLock);
        uint64_t v10 = MEMORY[0x1AD0C4F80](v9);

        BOOL v11 = v10 != 0;
        if (!v10)
        {
LABEL_17:

LABEL_19:
          objc_destroyWeak(&v19);
          objc_destroyWeak(location);
          goto LABEL_20;
        }
      }
      (*(void (**)(uint64_t, WBSRetryableCKOperation *, id, id))(v10 + 16))(v10, self, WeakRetained, v4);
      [(WBSRetryableCKOperation *)self _didFinishOperation];
    }
    BOOL v11 = 1;
    goto LABEL_17;
  }
  BOOL v11 = 1;
LABEL_20:

  return v11;
}

void __58__WBSRetryableCKOperation__scheduleRetryIfNeededForError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = (void *)*((void *)WeakRetained + 33);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __58__WBSRetryableCKOperation__scheduleRetryIfNeededForError___block_invoke_2;
    v4[3] = &unk_1E5C8C880;
    v4[4] = v2;
    [v3 addOperationWithBlock:v4];
  }
}

uint64_t __58__WBSRetryableCKOperation__scheduleRetryIfNeededForError___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_INFO, "Will attempt retry of %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) _scheduleNextOperation];
}

- (void)_didFinishOperation
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  currentOperation = self->_currentOperation;
  self->_currentOperation = 0;

  os_unfair_lock_unlock(p_internalLock);
  [(WBSRetryableCKOperation *)self _setStatus:2];
}

- (id)_makeOperation
{
  return 0;
}

- (void)_setUpOperation:(id)a3
{
  id v4 = a3;
  [v4 setConfiguration:self->_configuration];
  [v4 setGroup:self->_group];
  if ([(CKOperationConfiguration *)self->_configuration isLongLived])
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__WBSRetryableCKOperation__setUpOperation___block_invoke;
    v5[3] = &unk_1E5C8E0B0;
    objc_copyWeak(&v6, &location);
    [v4 setLongLivedOperationWasPersistedBlock:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __43__WBSRetryableCKOperation__setUpOperation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = (void *)*((void *)WeakRetained + 33);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __43__WBSRetryableCKOperation__setUpOperation___block_invoke_2;
    v4[3] = &unk_1E5C8C880;
    v4[4] = v2;
    [v3 addOperationWithBlock:v4];
  }
}

void __43__WBSRetryableCKOperation__setUpOperation___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    uint64_t v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(*(void *)(a1 + 32) + 376));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    id v4 = (void (**)(void, void, void))MEMORY[0x1AD0C4F80](v3);

    if (v4) {
      ((void (**)(void, void, id))v4)[2](v4, *(void *)(a1 + 32), WeakRetained);
    }
    int v5 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_DEFAULT, "Long lived operation of %{public}@ was persisted", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 32) _didFinishOperation];
  }
}

- (NSString)description
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id v4 = (void *)[(NSMutableArray *)self->_childOperationIDs copy];
  os_unfair_lock_unlock(p_internalLock);
  if ([v4 count])
  {
    int v5 = NSString;
    uint64_t v6 = [v4 componentsJoinedByString:@", "];
    int v7 = [v5 stringWithFormat:@"; childOperationIDs: %@", v6];
  }
  else
  {
    int v7 = &stru_1EFBE3CF8;
  }
  uint64_t v8 = NSString;
  uint64_t v9 = objc_opt_class();
  operationID = self->_operationID;
  BOOL v11 = [(CKOperationGroup *)self->_group safari_logDescription];
  uint64_t v12 = [v8 stringWithFormat:@"<%@: %p; operationID: %@; %@%@>", v9, self, operationID, v11, v7];

  return (NSString *)v12;
}

- (id)owner
{
  id WeakRetained = objc_loadWeakRetained(&self->_owner);
  return WeakRetained;
}

- (OS_dispatch_queue)handlingQueue
{
  return self->_handlingQueue;
}

- (NSString)operationID
{
  return self->_operationID;
}

- (CKOperation)currentOperation
{
  return self->_currentOperation;
}

- (id)ownerDidDeallocateBlock
{
  return self->_ownerDidDeallocateBlock;
}

- (void)setOwnerDidDeallocateBlock:(id)a3
{
}

- (id)longLivedOperationWasPersistedBlock
{
  return self->_longLivedOperationWasPersistedBlock;
}

- (void)setLongLivedOperationWasPersistedBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_longLivedOperationWasPersistedBlock, 0);
  objc_storeStrong(&self->_ownerDidDeallocateBlock, 0);
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
  objc_storeStrong(&self->_didExceedRetryTimeout, 0);
  objc_storeStrong(&self->_didReceiveNonRetryableError, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_childOperationIDs, 0);
  objc_storeStrong((id *)&self->_retryManager, 0);
  objc_storeStrong((id *)&self->_explicitlySetProperties, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_handlingQueue, 0);
  objc_destroyWeak(&self->_owner);
}

- (void)_scheduleRetryIfNeededForError:.cold.1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_3(&dword_1A6B5F000, "Operation of %{public}@ failed with non-retryable error: %{public}@", v4, v5);
}

- (void)_scheduleRetryIfNeededForError:.cold.2()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_3(&dword_1A6B5F000, "Failed to perform operation of %{public}@ with retryable error: %{public}@; will retry",
    v4,
    v5);
}

- (void)_scheduleRetryIfNeededForError:.cold.3()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_3(&dword_1A6B5F000, "Retry timeout of %{public}@ exceeded, with error: %{public}@", v4, v5);
}

@end