@interface RCOperation
- (BOOL)_shouldThrottleOperationWithRetryAfter:(double *)a3;
- (BOOL)_startIfNeeded;
- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4;
- (BOOL)childOperationsCancelled;
- (BOOL)hasOperationStarted;
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)shouldStartThrottlingWithError:(id)a3 retryAfter:(double *)a4;
- (BOOL)validateOperation;
- (NSMutableArray)childOperations;
- (NSString)operationID;
- (OS_dispatch_group)finishedGroup;
- (RCOnce)startOnce;
- (RCOperation)init;
- (RCUnfairLock)childOperationsLock;
- (double)operationEndTime;
- (double)operationStartTime;
- (id)_errorUserInfo;
- (id)_userDefaultsKeyForThrottleEndDate;
- (id)longOperationDescription;
- (id)shortOperationDescription;
- (id)throttleGroup;
- (id)timedOutTest;
- (int64_t)relativePriority;
- (unint64_t)maxRetries;
- (unint64_t)propertiesInheritedByChildOperations;
- (unint64_t)retryCount;
- (void)_associateChildOperation:(id)a3;
- (void)_finishOperationWithError:(id)a3;
- (void)_finishedPerformingOperationWithError:(id)a3;
- (void)_handleRetryFromError:(id)a3 signal:(id)a4;
- (void)_handleThrottlingFromError:(id)a3 delay:(double)a4;
- (void)addCompletionHandler:(id)a3;
- (void)associateChildOperation:(id)a3;
- (void)associateChildOperations:(id)a3;
- (void)cancel;
- (void)cancelChildOperations;
- (void)dealloc;
- (void)finishFromEarlyCancellation;
- (void)finishedPerformingOperationWithError:(id)a3;
- (void)performOperation;
- (void)setChildOperations:(id)a3;
- (void)setChildOperationsCancelled:(BOOL)a3;
- (void)setChildOperationsLock:(id)a3;
- (void)setFinishedGroup:(id)a3;
- (void)setOperationEndTime:(double)a3;
- (void)setOperationStartTime:(double)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRelativePriority:(int64_t)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setStartOnce:(id)a3;
- (void)setTimedOutTest:(id)a3;
- (void)start;
@end

@implementation RCOperation

- (RCOperation)init
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)RCOperation;
  id v2 = [(RCOperation *)&v16 init];
  if (v2)
  {
    uint64_t v3 = RCGenerateOperationID();
    v4 = (void *)*((void *)v2 + 34);
    *((void *)v2 + 34) = v3;

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6 = (void *)*((void *)v2 + 38);
    *((void *)v2 + 38) = v5;

    v7 = objc_alloc_init(RCUnfairLock);
    v8 = (void *)*((void *)v2 + 39);
    *((void *)v2 + 39) = v7;

    v9 = [[RCOnce alloc] initWithOptions:1];
    v10 = (void *)*((void *)v2 + 40);
    *((void *)v2 + 40) = v9;

    *((void *)v2 + 32) = 0;
    dispatch_group_t v11 = dispatch_group_create();
    v12 = (void *)*((void *)v2 + 41);
    *((void *)v2 + 41) = v11;

    dispatch_group_enter(*((dispatch_group_t *)v2 + 41));
    v13 = RCSharedLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v2 shortOperationDescription];
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl(&dword_1A4AB3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ created", buf, 0xCu);
    }
  }
  return (RCOperation *)v2;
}

- (void)dealloc
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"an operation should never be deallocated while it is still executing"];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

- (BOOL)isExecuting
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_executing);
  return v2 & 1;
}

- (BOOL)isFinished
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_finished);
  return v2 & 1;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)RCOperation;
  [(RCOperation *)&v3 cancel];
  [(RCOperation *)self cancelChildOperations];
}

- (void)setRelativePriority:(int64_t)a3
{
  if (self->_relativePriority != a3)
  {
    self->_relativePriority = a3;
    [(RCOperation *)self setQueuePriority:RCQueuePriorityFromRelativePriority(a3)];
    if (([(RCOperation *)self propertiesInheritedByChildOperations] & 2) != 0)
    {
      uint64_t v5 = [(RCOperation *)self childOperationsLock];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __35__RCOperation_setRelativePriority___block_invoke;
      v6[3] = &unk_1E5B76088;
      v6[4] = self;
      v6[5] = a3;
      [v5 performWithLockSync:v6];
    }
  }
}

void __35__RCOperation_setRelativePriority___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unsigned __int8 v2 = objc_msgSend(*(id *)(a1 + 32), "childOperations", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = RCProtocolCast((uint64_t)&unk_1EF8E2C28, *(void **)(*((void *)&v8 + 1) + 8 * v6));
        [v7 setRelativePriority:*(void *)(a1 + 40)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)setQualityOfService:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RCOperation;
  if ([(RCOperation *)&v8 qualityOfService] != (id)a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)RCOperation;
    [(RCOperation *)&v7 setQualityOfService:a3];
    if ([(RCOperation *)self propertiesInheritedByChildOperations])
    {
      uint64_t v5 = [(RCOperation *)self childOperationsLock];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __35__RCOperation_setQualityOfService___block_invoke;
      v6[3] = &unk_1E5B76088;
      v6[4] = self;
      v6[5] = a3;
      [v5 performWithLockSync:v6];
    }
  }
}

void __35__RCOperation_setQualityOfService___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned __int8 v2 = objc_msgSend(*(id *)(a1 + 32), "childOperations", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        uint64_t v8 = objc_opt_class();
        long long v9 = RCDynamicCast(v8, v7);
        [v9 setQualityOfService:*(void *)(a1 + 40)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (BOOL)validateOperation
{
  return 1;
}

- (void)start
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [a1 shortOperationDescription];
  uint64_t v4 = (void *)[v2 initWithFormat:@"%@ has already been started", v3];
  *(_DWORD *)buf = 136315906;
  uint64_t v6 = "-[RCOperation start]";
  __int16 v7 = 2080;
  uint64_t v8 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Operations/RCOperation.m";
  __int16 v9 = 1024;
  int v10 = 173;
  __int16 v11 = 2114;
  long long v12 = v4;
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);
}

- (BOOL)_startIfNeeded
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(RCOperation *)self startOnce];
  int v4 = [v3 trigger];

  if (v4)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    -[RCOperation setOperationStartTime:](self, "setOperationStartTime:");
    uint64_t v5 = self;
    double v16 = 0.0;
    if ([(RCOperation *)v5 _shouldThrottleOperationWithRetryAfter:&v16])
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
      __int16 v7 = [(RCOperation *)v5 _errorUserInfo];
      [v6 addEntriesFromDictionary:v7];

      uint64_t v8 = [NSNumber numberWithDouble:v16];
      [v6 setObject:v8 forKey:@"RCErrorRetryAfter"];

      __int16 v9 = objc_msgSend(MEMORY[0x1E4F28C58], "rc_errorWithCode:description:additionalUserInfo:", 8, @"The operation was throttled.", v6);
      [(RCOperation *)v5 _finishOperationWithError:v9];
    }
    else if ([(RCOperation *)v5 validateOperation])
    {
      if (![(RCOperation *)v5 isCancelled])
      {
        [(RCOperation *)v5 willChangeValueForKey:@"isExecuting"];
        atomic_store(1u, (unsigned __int8 *)&v5->_executing);
        [(RCOperation *)v5 didChangeValueForKey:@"isExecuting"];
        v14 = RCSharedLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [(RCOperation *)v5 longOperationDescription];
          *(_DWORD *)buf = 138543362;
          v18 = v15;
          _os_log_impl(&dword_1A4AB3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ started", buf, 0xCu);
        }
        [(RCOperation *)v5 prepareOperation];
        [(RCOperation *)v5 performOperation];
        goto LABEL_9;
      }
      [(RCOperation *)v5 finishFromEarlyCancellation];
    }
    else
    {
      int v10 = (void *)MEMORY[0x1E4F28C58];
      __int16 v11 = [(RCOperation *)v5 _errorUserInfo];
      long long v12 = objc_msgSend(v10, "rc_errorWithCode:description:additionalUserInfo:", 6, @"The operation failed validation.", v11);
      [(RCOperation *)v5 _finishOperationWithError:v12];
    }
    if (v5) {
LABEL_9:
    }
  }
  return v4;
}

- (void)performOperation
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

- (void)finishedPerformingOperationWithError:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(RCOperation *)self timedOutTest];
  uint64_t v5 = (void *)v4;
  if (!v4 || ((*(uint64_t (**)(uint64_t))(v4 + 16))(v4) & 1) == 0) {
    [(RCOperation *)self _finishedPerformingOperationWithError:v6];
  }
}

- (void)_finishedPerformingOperationWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4 || (objc_msgSend(v4, "rc_isOperationThrottledError") & 1) != 0) {
    goto LABEL_10;
  }
  double v11 = 0.0;
  if ([(RCOperation *)self shouldStartThrottlingWithError:v5 retryAfter:&v11])
  {
    [(RCOperation *)self _handleThrottlingFromError:v5 delay:v11];
LABEL_10:
    [(RCOperation *)self _finishOperationWithError:v5];
    goto LABEL_11;
  }
  if ([(RCOperation *)self isCancelled]) {
    goto LABEL_10;
  }
  unint64_t v6 = [(RCOperation *)self maxRetries];
  if ([(RCOperation *)self retryCount] >= v6) {
    goto LABEL_10;
  }
  id v10 = 0;
  BOOL v7 = [(RCOperation *)self canRetryWithError:v5 retryAfter:&v10];
  id v8 = v10;
  __int16 v9 = v8;
  if (!v7)
  {

    goto LABEL_10;
  }
  [(RCOperation *)self _handleRetryFromError:v5 signal:v8];

LABEL_11:
}

- (void)_handleThrottlingFromError:(id)a3 delay:(double)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (_handleThrottlingFromError_delay__onceToken != -1) {
    dispatch_once(&_handleThrottlingFromError_delay__onceToken, &__block_literal_global_87);
  }
  BOOL v7 = [(RCOperation *)self throttleGroup];

  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCOperation _handleThrottlingFromError:delay:]();
  }
  id v8 = RCSharedLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = [(RCOperation *)self shortOperationDescription];
    id v10 = [(RCOperation *)self throttleGroup];
    *(_DWORD *)buf = 138544130;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    __int16 v16 = 2048;
    double v17 = a4;
    __int16 v18 = 2114;
    id v19 = v6;
    _os_log_impl(&dword_1A4AB3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ will start throttling requests from group %@ for %.2f seconds due to error %{public}@", buf, 0x2Au);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__RCOperation__handleThrottlingFromError_delay___block_invoke_92;
  v11[3] = &unk_1E5B76088;
  v11[4] = self;
  *(double *)&v11[5] = a4;
  [(id)_handleThrottlingFromError_delay__s_throttleLock performWithLockSync:v11];
}

uint64_t __48__RCOperation__handleThrottlingFromError_delay___block_invoke()
{
  _handleThrottlingFromError_delay__s_throttleLock = objc_alloc_init(RCMutexLock);

  return MEMORY[0x1F41817F8]();
}

void __48__RCOperation__handleThrottlingFromError_delay___block_invoke_92(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = [*(id *)(a1 + 32) _userDefaultsKeyForThrottleEndDate];
  id v7 = [v2 objectForKey:v3];

  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:*(double *)(a1 + 40)];
  if (!v7 || objc_msgSend(v4, "rc_isLaterThan:", v7))
  {
    uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v6 = [*(id *)(a1 + 32) _userDefaultsKeyForThrottleEndDate];
    [v5 setObject:v4 forKey:v6];
  }
}

- (void)_handleRetryFromError:(id)a3 signal:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(RCOperation *)self setRetryCount:[(RCOperation *)self retryCount] + 1];
  id v8 = RCSharedLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = [(RCOperation *)self shortOperationDescription];
    *(_DWORD *)buf = 138544386;
    double v17 = v9;
    __int16 v18 = 2048;
    unint64_t v19 = [(RCOperation *)self retryCount];
    __int16 v20 = 2048;
    unint64_t v21 = [(RCOperation *)self maxRetries];
    __int16 v22 = 2114;
    id v23 = v7;
    __int16 v24 = 2114;
    id v25 = v6;
    _os_log_impl(&dword_1A4AB3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ will perform retry %lu of %lu after %{public}@ due to error: %{public}@", buf, 0x34u);
  }
  id v10 = RCDispatchQueueForQualityOfService([(RCOperation *)self qualityOfService]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__RCOperation__handleRetryFromError_signal___block_invoke;
  v13[3] = &unk_1E5B760B0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v11 onQueue:v10 signal:v13];
}

uint64_t __44__RCOperation__handleRetryFromError_signal___block_invoke(uint64_t a1, int a2)
{
  if (a2 && ([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    [*(id *)(a1 + 32) resetForRetry];
    id v6 = *(void **)(a1 + 32);
    return [v6 performOperation];
  }
  else
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 _finishOperationWithError:v4];
  }
}

- (void)finishFromEarlyCancellation
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  id v5 = [(RCOperation *)self _errorUserInfo];
  uint64_t v4 = objc_msgSend(v3, "rc_errorWithCode:description:additionalUserInfo:", 1, @"The operation was cancelled.", v5);
  [(RCOperation *)self _finishOperationWithError:v4];
}

- (void)associateChildOperation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RCOperation *)self childOperationsLock];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__RCOperation_associateChildOperation___block_invoke;
    v6[3] = &unk_1E5B75F80;
    v6[4] = self;
    id v7 = v4;
    [v5 performWithLockSync:v6];
  }
}

uint64_t __39__RCOperation_associateChildOperation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _associateChildOperation:*(void *)(a1 + 40)];
}

- (void)associateChildOperations:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(RCOperation *)self childOperationsLock];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__RCOperation_associateChildOperations___block_invoke;
    v6[3] = &unk_1E5B75F80;
    id v7 = v4;
    id v8 = self;
    [v5 performWithLockSync:v6];
  }
}

void __40__RCOperation_associateChildOperations___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_associateChildOperation:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_associateChildOperation:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = RCProtocolCast((uint64_t)&unk_1EF8E2B98, v4);
    uint64_t v6 = RCSharedLog();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        long long v8 = [v5 shortOperationDescription];
        long long v9 = [(RCOperation *)self shortOperationDescription];
        int v18 = 138543618;
        unint64_t v19 = v8;
        __int16 v20 = 2114;
        unint64_t v21 = v9;
        _os_log_impl(&dword_1A4AB3000, v6, OS_LOG_TYPE_DEFAULT, "associated child operation %{public}@ with parent %{public}@", (uint8_t *)&v18, 0x16u);
      }
    }
    else if (v7)
    {
      long long v10 = objc_opt_class();
      id v11 = v10;
      uint64_t v12 = [(RCOperation *)self shortOperationDescription];
      int v18 = 138543618;
      unint64_t v19 = v10;
      __int16 v20 = 2114;
      unint64_t v21 = v12;
      _os_log_impl(&dword_1A4AB3000, v6, OS_LOG_TYPE_DEFAULT, "associated child operation %{public}@ with parent %{public}@", (uint8_t *)&v18, 0x16u);
    }
    if ([(RCOperation *)self childOperationsCancelled]
      || ([(RCOperation *)self childOperations],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          !v13))
    {
      [v4 cancel];
    }
    else
    {
      id v14 = [(RCOperation *)self childOperations];
      [v14 addObject:v4];

      if (([(RCOperation *)self propertiesInheritedByChildOperations] & 2) != 0)
      {
        id v15 = RCProtocolCast((uint64_t)&unk_1EF8E2C28, v4);
        objc_msgSend(v15, "setRelativePriority:", -[RCOperation relativePriority](self, "relativePriority"));
      }
      if ([(RCOperation *)self propertiesInheritedByChildOperations])
      {
        uint64_t v16 = objc_opt_class();
        double v17 = RCDynamicCast(v16, (uint64_t)v4);
        objc_msgSend(v17, "setQualityOfService:", -[RCOperation qualityOfService](self, "qualityOfService"));
      }
    }
  }
}

- (void)cancelChildOperations
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  long long v8 = __Block_byref_object_copy__0;
  long long v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  uint64_t v3 = [(RCOperation *)self childOperationsLock];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__RCOperation_cancelChildOperations__block_invoke;
  v4[3] = &unk_1E5B760D8;
  v4[4] = self;
  v4[5] = &v5;
  [v3 performWithLockSync:v4];

  [(id)v6[5] makeObjectsPerformSelector:sel_cancel];
  _Block_object_dispose(&v5, 8);
}

void __36__RCOperation_cancelChildOperations__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) childOperations];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  [*(id *)(a1 + 32) setChildOperationsCancelled:1];
  id v6 = [*(id *)(a1 + 32) childOperations];
  [v6 removeAllObjects];
}

- (unint64_t)propertiesInheritedByChildOperations
{
  return 3;
}

- (unint64_t)maxRetries
{
  return 0;
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  return 0;
}

- (id)throttleGroup
{
  return 0;
}

- (BOOL)shouldStartThrottlingWithError:(id)a3 retryAfter:(double *)a4
{
  return 0;
}

- (id)_userDefaultsKeyForThrottleEndDate
{
  id v2 = NSString;
  uint64_t v3 = [(RCOperation *)self throttleGroup];
  uint64_t v4 = [v2 stringWithFormat:@"RCOperationThrottling:%@", v3];

  return v4;
}

- (BOOL)_shouldThrottleOperationWithRetryAfter:(double *)a3
{
  uint64_t v5 = [(RCOperation *)self throttleGroup];

  if (!v5) {
    return 0;
  }
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v7 = [(RCOperation *)self _userDefaultsKeyForThrottleEndDate];
  long long v8 = [v6 objectForKey:v7];

  if (v8 && ([v8 timeIntervalSinceNow], v9 > 0.0))
  {
    *a3 = ceil(v9) + 1.0;
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)addCompletionHandler:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    group = [(RCOperation *)self finishedGroup];
    uint64_t v5 = RCDispatchQueueForQualityOfService([(RCOperation *)self qualityOfService]);
    dispatch_group_notify(group, v5, v4);
  }
}

- (BOOL)hasOperationStarted
{
  id v2 = [(RCOperation *)self startOnce];
  char v3 = [v2 hasBeenTriggered];

  return v3;
}

- (void)_finishOperationWithError:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(RCOperation *)self isFinished] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCOperation _finishOperationWithError:]();
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  -[RCOperation setOperationEndTime:](self, "setOperationEndTime:");
  if (![(RCOperation *)self isCancelled])
  {
    id v11 = RCSharedLog();
    uint64_t v5 = v11;
    if (v4)
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      id v6 = [(RCOperation *)self shortOperationDescription];
      *(_DWORD *)buf = 138543618;
      unint64_t v19 = v6;
      __int16 v20 = 2114;
      unint64_t v21 = (unint64_t)v4;
      uint64_t v7 = "%{public}@ failed with error: %{public}@";
      long long v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      id v6 = [(RCOperation *)self shortOperationDescription];
      [(RCOperation *)self operationEndTime];
      double v13 = v12;
      [(RCOperation *)self operationStartTime];
      *(_DWORD *)buf = 138543618;
      unint64_t v19 = v6;
      __int16 v20 = 2048;
      unint64_t v21 = RCSecondsToMilliseconds(v13 - v14);
      uint64_t v7 = "%{public}@ finished with total time: %llums";
      long long v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    }
    uint32_t v10 = 22;
    goto LABEL_13;
  }
  uint64_t v5 = RCSharedLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(RCOperation *)self shortOperationDescription];
    *(_DWORD *)buf = 138543362;
    unint64_t v19 = v6;
    uint64_t v7 = "%{public}@ cancelled";
    long long v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 12;
LABEL_13:
    _os_log_impl(&dword_1A4AB3000, v8, v9, v7, buf, v10);
  }
LABEL_14:

  [(RCOperation *)self operationWillFinishWithError:v4];
  [(RCOperation *)self willChangeValueForKey:@"isExecuting"];
  atomic_store(0, (unsigned __int8 *)&self->_executing);
  [(RCOperation *)self didChangeValueForKey:@"isExecuting"];
  [(RCOperation *)self willChangeValueForKey:@"isFinished"];
  atomic_store(1u, (unsigned __int8 *)&self->_finished);
  [(RCOperation *)self didChangeValueForKey:@"isFinished"];
  id v15 = [(RCOperation *)self finishedGroup];
  dispatch_group_leave(v15);

  uint64_t v16 = [(RCOperation *)self childOperationsLock];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __41__RCOperation__finishOperationWithError___block_invoke;
  v17[3] = &unk_1E5B76100;
  v17[4] = self;
  [v16 performWithLockSync:v17];

  [(RCOperation *)self operationDidFinishWithError:v4];
}

uint64_t __41__RCOperation__finishOperationWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setChildOperations:0];
}

- (id)_errorUserInfo
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"RCErrorOperationClassNameKey";
  char v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v9[0] = v4;
  v8[1] = @"RCErrorOperationIDKey";
  uint64_t v5 = [(RCOperation *)self operationID];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (id)shortOperationDescription
{
  char v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(RCOperation *)self operationID];
  id v6 = [v3 stringWithFormat:@"<%@ %@>", v4, v5];

  return v6;
}

- (id)longOperationDescription
{
  char v3 = RCStringFromQualityOfService([(RCOperation *)self qualityOfService]);
  uint64_t v4 = RCStringFromQueuePriority([(RCOperation *)self queuePriority]);
  uint64_t v5 = NSString;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(RCOperation *)self operationID];
  long long v8 = [v5 stringWithFormat:@"<%@ %@, qos=%@, priority=%@>", v6, v7, v3, v4];

  return v8;
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (NSString)operationID
{
  return self->_operationID;
}

- (double)operationStartTime
{
  return self->_operationStartTime;
}

- (void)setOperationStartTime:(double)a3
{
  self->_operationStartTime = a3;
}

- (double)operationEndTime
{
  return self->_operationEndTime;
}

- (void)setOperationEndTime:(double)a3
{
  self->_operationEndTime = a3;
}

- (id)timedOutTest
{
  return self->_timedOutTest;
}

- (void)setTimedOutTest:(id)a3
{
}

- (NSMutableArray)childOperations
{
  return self->_childOperations;
}

- (void)setChildOperations:(id)a3
{
}

- (BOOL)childOperationsCancelled
{
  return self->_childOperationsCancelled;
}

- (void)setChildOperationsCancelled:(BOOL)a3
{
  self->_childOperationsCancelled = a3;
}

- (RCUnfairLock)childOperationsLock
{
  return self->_childOperationsLock;
}

- (void)setChildOperationsLock:(id)a3
{
}

- (RCOnce)startOnce
{
  return self->_startOnce;
}

- (void)setStartOnce:(id)a3
{
}

- (OS_dispatch_group)finishedGroup
{
  return self->_finishedGroup;
}

- (void)setFinishedGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedGroup, 0);
  objc_storeStrong((id *)&self->_startOnce, 0);
  objc_storeStrong((id *)&self->_childOperationsLock, 0);
  objc_storeStrong((id *)&self->_childOperations, 0);
  objc_storeStrong(&self->_timedOutTest, 0);

  objc_storeStrong((id *)&self->_operationID, 0);
}

- (void)_handleThrottlingFromError:delay:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"a throttled operation must be part of a throttle group"];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_finishOperationWithError:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"operation must only be finished once"];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

@end