@interface FCOperation
- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4;
- (BOOL)hasOperationStarted;
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)shouldStartThrottlingWithError:(id)a3 retryAfter:(double *)a4;
- (BOOL)validateOperation;
- (BOOL)validateOperationError:(id *)a3;
- (BOOL)waitUntilFinishedWithTimeout:(double)a3;
- (FCOperation)init;
- (FCOperation)proxyOperation;
- (NSDictionary)errorUserInfo;
- (NSString)longOperationDescription;
- (NSString)operationID;
- (NSString)purpose;
- (NSString)shortOperationDescription;
- (double)operationStartTime;
- (double)timeoutDuration;
- (id)_userDefaultsKeyForThrottleEndDate;
- (id)throttleGroup;
- (int64_t)flags;
- (int64_t)relativePriority;
- (unint64_t)maxRetries;
- (unint64_t)propertiesInheritedByChildOperations;
- (unint64_t)retryCount;
- (void)_associateChildOperation:(uint64_t)a1;
- (void)_finishOperationWithError:(uint64_t)a1;
- (void)_finishedPerformingOperationWithError:(void *)a1;
- (void)_startIfNeeded;
- (void)addCompletionHandler:(id)a3;
- (void)associateChildOperation:(id)a3;
- (void)associateChildOperations:(id)a3;
- (void)cancel;
- (void)cancelChildOperations;
- (void)dealloc;
- (void)finishFromEarlyCancellation;
- (void)finishedPerformingOperationWithError:(id)a3;
- (void)performOperation;
- (void)setFlags:(int64_t)a3;
- (void)setOperationStartTime:(double)a3;
- (void)setPurpose:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRelativePriority:(int64_t)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setTimeoutDuration:(double)a3;
@end

@implementation FCOperation

void __39__FCOperation_associateChildOperation___block_invoke(uint64_t a1)
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retentionToken, 0);
  objc_storeStrong((id *)&self->_finishedGroup, 0);
  objc_storeStrong((id *)&self->_startOnce, 0);
  objc_storeStrong((id *)&self->_childOperationsLock, 0);
  objc_storeStrong((id *)&self->_childOperations, 0);
  objc_storeStrong(&self->_timedOutTest, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_shortOperationDescription, 0);
}

void __41__FCOperation__finishOperationWithError___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    objc_storeStrong((id *)(v1 + 328), 0);
  }
}

- (BOOL)isExecuting
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_executing);
  return v2 & 1;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_finished);
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_executing);
  if (v3 & 1) == 0 && (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)[[NSString alloc] initWithFormat:@"an operation should never be deallocated while still executing"];
      *(_DWORD *)buf = 136315906;
      v8 = "-[FCOperation dealloc]";
      __int16 v9 = 2080;
      v10 = "FCOperation.m";
      __int16 v11 = 1024;
      int v12 = 92;
      __int16 v13 = 2114;
      v14 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    goto LABEL_6;
  }
  if ((v3 & 1) == 0) {
LABEL_6:
  }
    dispatch_group_leave((dispatch_group_t)self->_finishedGroup);
  v6.receiver = self;
  v6.super_class = (Class)FCOperation;
  [(FCOperation *)&v6 dealloc];
}

- (void)_startIfNeeded
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1 && [a1[43] trigger])
  {
    objc_storeStrong(a1 + 45, a1);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    objc_msgSend(a1, "setOperationStartTime:");
    unsigned __int8 v2 = a1;
    unsigned __int8 v3 = [v2 throttleGroup];

    if (v3)
    {
      unsigned __int8 v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v5 = -[FCOperation _userDefaultsKeyForThrottleEndDate](v2);
      objc_super v6 = [v4 objectForKey:v5];

      if (v6)
      {
        [v6 timeIntervalSinceNow];
        if (v7 > 0.0)
        {
          double v8 = ceil(v7) + 1.0;

          __int16 v9 = [MEMORY[0x1E4F1CA60] dictionary];
          v10 = [v2 errorUserInfo];
          [v9 addEntriesFromDictionary:v10];

          __int16 v11 = [NSNumber numberWithDouble:v8];
          [v9 setObject:v11 forKey:@"FCErrorRetryAfter"];

          int v12 = objc_msgSend(MEMORY[0x1E4F28C58], "fc_errorWithCode:description:additionalUserInfo:", 12, @"The operation was throttled.", v9);
          -[FCOperation _finishOperationWithError:]((uint64_t)v2, v12);

          id v13 = 0;
LABEL_18:

          return;
        }
      }
    }
    id v24 = 0;
    char v14 = [v2 validateOperationError:&v24];
    id v13 = v24;
    if (v14)
    {
      if ([v2 isCancelled])
      {
        [v2 finishFromEarlyCancellation];
      }
      else
      {
        [v2 willChangeValueForKey:@"isExecuting"];
        atomic_store(1u, v2 + 248);
        [v2 didChangeValueForKey:@"isExecuting"];
        uint64_t v15 = (void *)FCOperationLog;
        if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
        {
          v16 = v15;
          v17 = [v2 longOperationDescription];
          *(_DWORD *)buf = 138543362;
          v26 = v17;
          _os_log_impl(&dword_1A460D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ started", buf, 0xCu);
        }
        [v2 timeoutDuration];
        if (v18 == 1.79769313e308) {
          dispatch_time_t v19 = -1;
        }
        else {
          dispatch_time_t v19 = dispatch_time(0, (uint64_t)(v18 * 1000000000.0));
        }
        v20 = FCDispatchQueueForQualityOfService([v2 qualityOfService]);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __29__FCOperation__startIfNeeded__block_invoke_85;
        v23[3] = &unk_1E5B4C018;
        v23[4] = v2;
        v21 = FCHandleOperationTimeout(v19, v20, v23);
        objc_setProperty_nonatomic_copy(v2, v22, v21, 320);

        [v2 prepareOperation];
        [v2 performOperation];
      }
    }
    else
    {
      -[FCOperation _finishOperationWithError:]((uint64_t)v2, v13);
    }
    goto LABEL_18;
  }
}

- (void)_finishOperationWithError:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v3 = a2;
  if (a1)
  {
    if ([(id)a1 isFinished] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v15 = [NSString alloc];
      v16 = [(id)a1 shortOperationDescription];
      v17 = (void *)[v15 initWithFormat:@"operation %@ must only be finished once", v16];
      *(_DWORD *)buf = 136315906;
      SEL v22 = "-[FCOperation _finishOperationWithError:]";
      __int16 v23 = 2080;
      id v24 = "FCOperation.m";
      __int16 v25 = 1024;
      int v26 = 594;
      __int16 v27 = 2114;
      v28 = v17;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v5 = v4;
    if ([(id)a1 isCancelled])
    {
      objc_super v6 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        double v7 = v6;
        double v8 = [(id)a1 shortOperationDescription];
        *(_DWORD *)buf = 138543362;
        SEL v22 = v8;
        __int16 v9 = "%{public}@ cancelled";
        v10 = v7;
        uint32_t v11 = 12;
LABEL_16:
        _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
LABEL_17:
      [(id)a1 operationWillFinishWithError:v3];
      [(id)a1 willChangeValueForKey:@"isExecuting"];
      atomic_store(0, (unsigned __int8 *)(a1 + 248));
      [(id)a1 didChangeValueForKey:@"isExecuting"];
      [(id)a1 willChangeValueForKey:@"isFinished"];
      atomic_store(1u, (unsigned __int8 *)(a1 + 249));
      [(id)a1 didChangeValueForKey:@"isFinished"];
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 352));
      char v14 = *(void **)(a1 + 336);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __41__FCOperation__finishOperationWithError___block_invoke;
      v20[3] = &unk_1E5B4C018;
      v20[4] = a1;
      [v14 performWithLockSync:v20];
      [(id)a1 operationDidFinishWithError:v3];
      objc_storeStrong((id *)(a1 + 360), 0);
      goto LABEL_18;
    }
    int v12 = FCOperationLog;
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
      {
        double v18 = v12;
        dispatch_time_t v19 = [(id)a1 shortOperationDescription];
        *(_DWORD *)buf = 138543618;
        SEL v22 = v19;
        __int16 v23 = 2114;
        id v24 = v3;
        _os_log_error_impl(&dword_1A460D000, v18, OS_LOG_TYPE_ERROR, "%{public}@ failed with error: %{public}@. This log is being duplicated as an default-level log", buf, 0x16u);

        int v12 = FCOperationLog;
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      double v7 = v12;
      double v8 = [(id)a1 shortOperationDescription];
      *(_DWORD *)buf = 138543618;
      SEL v22 = v8;
      __int16 v23 = 2114;
      id v24 = v3;
      __int16 v9 = "%{public}@ failed with error: %{public}@. This log is being duplicated as an error-level log";
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      double v7 = v12;
      double v8 = [(id)a1 shortOperationDescription];
      [(id)a1 operationStartTime];
      *(_DWORD *)buf = 138543618;
      SEL v22 = v8;
      __int16 v23 = 2048;
      id v24 = (char *)(fmax(v5 - v13, 0.0) * 1000.0);
      __int16 v9 = "%{public}@ finished with total time: %llums";
    }
    v10 = v7;
    uint32_t v11 = 22;
    goto LABEL_16;
  }
LABEL_18:
}

- (BOOL)isFinished
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_finished);
  return v2 & 1;
}

- (double)timeoutDuration
{
  return self->_timeoutDuration;
}

- (void)setOperationStartTime:(double)a3
{
  self->_operationStartTime = a3;
}

- (double)operationStartTime
{
  return self->_operationStartTime;
}

- (BOOL)validateOperationError:(id *)a3
{
  BOOL v5 = [(FCOperation *)self validateOperation];
  if (v5)
  {
    *a3 = 0;
  }
  else
  {
    objc_super v6 = (void *)MEMORY[0x1E4F28C58];
    double v7 = [(FCOperation *)self errorUserInfo];
    objc_msgSend(v6, "fc_errorWithCode:description:additionalUserInfo:", 9, @"The operation failed validation.", v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)throttleGroup
{
  return 0;
}

- (void)_associateChildOperation:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = v3;
  if (!a1 || !v3) {
    goto LABEL_15;
  }
  if ([v3 conformsToProtocol:&unk_1EF8DB728]) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = v5;
  double v7 = (void *)FCOperationLog;
  BOOL v8 = os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8) {
      goto LABEL_12;
    }
    __int16 v9 = v7;
    v10 = [v6 shortOperationDescription];
    uint32_t v11 = [(id)a1 shortOperationDescription];
    int v25 = 138543618;
    int v26 = v10;
    __int16 v27 = 2114;
    v28 = v11;
    _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "associated child operation %{public}@ with parent %{public}@", (uint8_t *)&v25, 0x16u);
  }
  else
  {
    if (!v8) {
      goto LABEL_12;
    }
    __int16 v9 = v7;
    int v12 = objc_opt_class();
    id v13 = v12;
    char v14 = [(id)a1 shortOperationDescription];
    int v25 = 138543618;
    int v26 = v12;
    __int16 v27 = 2114;
    v28 = v14;
    _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "associated child operation %{public}@ with parent %{public}@", (uint8_t *)&v25, 0x16u);
  }
LABEL_12:
  if (*(unsigned char *)(a1 + 250) || (id v15 = *(void **)(a1 + 328)) == 0)
  {
    [v4 cancel];
  }
  else
  {
    [v15 addObject:v4];
    if (([(id)a1 propertiesInheritedByChildOperations] & 2) != 0)
    {
      if ([v4 conformsToProtocol:&unk_1EF8DB7B8]) {
        v16 = v4;
      }
      else {
        v16 = 0;
      }
      id v17 = v16;
      objc_msgSend(v17, "setRelativePriority:", objc_msgSend((id)a1, "relativePriority"));
    }
    if ([(id)a1 propertiesInheritedByChildOperations])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        double v18 = v4;
      }
      else {
        double v18 = 0;
      }
      id v19 = v18;
      objc_msgSend(v19, "setQualityOfService:", objc_msgSend((id)a1, "qualityOfService"));
    }
    if (([(id)a1 propertiesInheritedByChildOperations] & 4) != 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v20 = v4;
      }
      else {
        v20 = 0;
      }
      id v21 = v20;
      SEL v22 = [(id)a1 purpose];
      [v21 setPurpose:v22];
    }
    if (([(id)a1 propertiesInheritedByChildOperations] & 8) != 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        __int16 v23 = v4;
      }
      else {
        __int16 v23 = 0;
      }
      id v24 = v23;
      objc_msgSend(v24, "setFlags:", objc_msgSend((id)a1, "flags"));
    }
  }

LABEL_15:
}

- (NSString)shortOperationDescription
{
  return self->_shortOperationDescription;
}

- (unint64_t)propertiesInheritedByChildOperations
{
  return 15;
}

- (void)setRelativePriority:(int64_t)a3
{
  if (self->_relativePriority != a3)
  {
    self->_relativePriority = a3;
    if ((unint64_t)(a3 + 1) >= 4) {
      int64_t v5 = 0;
    }
    else {
      int64_t v5 = 4 * (a3 + 1) - 4;
    }
    [(FCOperation *)self setQueuePriority:v5];
    if (([(FCOperation *)self propertiesInheritedByChildOperations] & 2) != 0)
    {
      childOperationsLock = self->_childOperationsLock;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __35__FCOperation_setRelativePriority___block_invoke;
      v7[3] = &unk_1E5B51AE8;
      v7[4] = self;
      v7[5] = a3;
      [(NFUnfairLock *)childOperationsLock performWithLockSync:v7];
    }
  }
}

- (void)setQualityOfService:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FCOperation;
  if ([(FCOperation *)&v8 qualityOfService] != (id)a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)FCOperation;
    [(FCOperation *)&v7 setQualityOfService:a3];
    if ([(FCOperation *)self propertiesInheritedByChildOperations])
    {
      if (self) {
        childOperationsLock = self->_childOperationsLock;
      }
      else {
        childOperationsLock = 0;
      }
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __35__FCOperation_setQualityOfService___block_invoke;
      v6[3] = &unk_1E5B51AE8;
      v6[4] = self;
      v6[5] = a3;
      [(NFUnfairLock *)childOperationsLock performWithLockSync:v6];
    }
  }
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (NSString)longOperationDescription
{
  id v3 = FCStringFromQualityOfService([(FCOperation *)self qualityOfService]);
  double v4 = FCStringFromQueuePriority([(FCOperation *)self queuePriority]);
  int64_t v5 = [(FCOperation *)self purpose];

  id v6 = NSString;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [(FCOperation *)self operationID];
  __int16 v9 = (void *)v8;
  if (v5 == @"unknown")
  {
    uint32_t v11 = [v6 stringWithFormat:@"<%@ %@, qos=%@, priority=%@>", v7, v8, v3, v4];
  }
  else
  {
    v10 = [(FCOperation *)self purpose];
    uint32_t v11 = [v6 stringWithFormat:@"<%@ %@, qos=%@, priority=%@, purpose=%@>", v7, v9, v3, v4, v10];
  }
  return (NSString *)v11;
}

- (NSString)purpose
{
  return self->_purpose;
}

- (NSString)operationID
{
  return self->_operationID;
}

- (FCOperation)init
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)FCOperation;
  id v2 = [(FCOperation *)&v24 init];
  if (v2)
  {
    uint64_t v3 = FCGenerateOperationID();
    double v4 = (void *)*((void *)v2 + 38);
    *((void *)v2 + 38) = v3;

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = (void *)*((void *)v2 + 41);
    *((void *)v2 + 41) = v5;

    id v7 = objc_alloc_init(MEMORY[0x1E4F81C18]);
    uint64_t v8 = (void *)*((void *)v2 + 42);
    *((void *)v2 + 42) = v7;

    __int16 v9 = [[FCOnce alloc] initWithOptions:1];
    v10 = (void *)*((void *)v2 + 43);
    *((void *)v2 + 43) = v9;

    objc_storeStrong((id *)v2 + 37, @"unknown");
    *((void *)v2 + 35) = 0x7FEFFFFFFFFFFFFFLL;
    uint64_t v11 = [NSString stringWithFormat:@"<%@ %@>", objc_opt_class(), *((void *)v2 + 38)];
    int v12 = (void *)*((void *)v2 + 32);
    *((void *)v2 + 32) = v11;

    dispatch_group_t v13 = dispatch_group_create();
    char v14 = (void *)*((void *)v2 + 44);
    *((void *)v2 + 44) = v13;

    dispatch_group_enter(*((dispatch_group_t *)v2 + 44));
    uint64_t v15 = FCCurrentQoSOrUtilityIfMain();
    v23.receiver = v2;
    v23.super_class = (Class)FCOperation;
    [(FCOperation *)&v23 setQualityOfService:v15];
    if (v15 == 33 || v15 == 25)
    {
      uint64_t v16 = 4;
      uint64_t v17 = 1;
    }
    else if (v15 == 9)
    {
      uint64_t v16 = -4;
      uint64_t v17 = -1;
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v16 = 0;
    }
    *((void *)v2 + 33) = v17;
    v22.receiver = v2;
    v22.super_class = (Class)FCOperation;
    [(FCOperation *)&v22 setQueuePriority:v16];
    double v18 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = v18;
      v20 = [v2 shortOperationDescription];
      *(_DWORD *)buf = 138543362;
      int v26 = v20;
      _os_log_impl(&dword_1A460D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ created", buf, 0xCu);
    }
  }
  return (FCOperation *)v2;
}

- (int64_t)flags
{
  return self->_flags;
}

- (BOOL)validateOperation
{
  return 1;
}

- (void)setPurpose:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4FBA8A8];
    id v6 = [(FCOperation *)self purpose];
    LOBYTE(v5) = objc_msgSend(v5, "nf_object:isEqualToObject:", v4, v6);

    if ((v5 & 1) == 0)
    {
      id v7 = (NSString *)[v4 copy];
      purpose = self->_purpose;
      self->_purpose = v7;

      if (([(FCOperation *)self propertiesInheritedByChildOperations] & 4) != 0)
      {
        childOperationsLock = self->_childOperationsLock;
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __26__FCOperation_setPurpose___block_invoke_2;
        v10[3] = &unk_1E5B4BE70;
        v10[4] = self;
        id v11 = v4;
        [(NFUnfairLock *)childOperationsLock performWithLockSync:v10];
      }
    }
  }
  else
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    char v14 = __26__FCOperation_setPurpose___block_invoke;
    uint64_t v15 = &unk_1E5B4C018;
    uint64_t v16 = self;
    [(FCOperation *)self setPurpose:@"unknown"];
  }
}

- (void)setFlags:(int64_t)a3
{
  if (self->_flags != a3)
  {
    self->_flags = a3;
    if (([(FCOperation *)self propertiesInheritedByChildOperations] & 8) != 0)
    {
      childOperationsLock = self->_childOperationsLock;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __24__FCOperation_setFlags___block_invoke;
      v6[3] = &unk_1E5B51AE8;
      v6[4] = self;
      v6[5] = a3;
      [(NFUnfairLock *)childOperationsLock performWithLockSync:v6];
    }
  }
}

- (void)associateChildOperation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (self) {
      childOperationsLock = self->_childOperationsLock;
    }
    else {
      childOperationsLock = 0;
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__FCOperation_associateChildOperation___block_invoke;
    v7[3] = &unk_1E5B4BE70;
    v7[4] = self;
    id v8 = v4;
    [(NFUnfairLock *)childOperationsLock performWithLockSync:v7];
  }
}

- (id)_userDefaultsKeyForThrottleEndDate
{
  if (a1)
  {
    uint64_t v1 = NSString;
    id v2 = [a1 throttleGroup];
    uint64_t v3 = [v1 stringWithFormat:@"FCOperationThrottling:%@", v2];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (void)finishedPerformingOperationWithError:(id)a3
{
  id v6 = a3;
  if (!self)
  {
    id v5 = 0;
LABEL_4:
    -[FCOperation _finishedPerformingOperationWithError:](self, v6);
    goto LABEL_5;
  }
  id v4 = self->_timedOutTest;
  id v5 = v4;
  if (!v4 || ((*((uint64_t (**)(id))v4 + 2))(v4) & 1) == 0) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)_finishedPerformingOperationWithError:(void *)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!a1) {
    goto LABEL_21;
  }
  if (!v3 || (objc_msgSend(v3, "fc_isOperationThrottledError") & 1) != 0) {
    goto LABEL_20;
  }
  uint64_t v28 = 0;
  if ([a1 shouldStartThrottlingWithError:v4 retryAfter:&v28])
  {
    uint64_t v5 = v28;
    id v6 = v4;
    if (qword_1E9659830 != -1) {
      dispatch_once(&qword_1E9659830, &__block_literal_global_97_0);
    }
    id v7 = [a1 throttleGroup];

    if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v26 = (void *)[[NSString alloc] initWithFormat:@"a throttled operation must be part of a throttle group"];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[FCOperation _handleThrottlingFromError:delay:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "FCOperation.m";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)v30 = 372;
      *(_WORD *)&v30[4] = 2114;
      *(void *)&v30[6] = v26;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    id v8 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = v8;
      v10 = [a1 shortOperationDescription];
      id v11 = [a1 throttleGroup];
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2048;
      *(void *)v30 = v5;
      *(_WORD *)&v30[8] = 2114;
      *(void *)&v30[10] = v6;
      _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ will start throttling requests from group %@ for %.2f seconds due to error %{public}@", buf, 0x2Au);
    }
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __48__FCOperation__handleThrottlingFromError_delay___block_invoke_102;
    *(void *)v30 = &unk_1E5B51AE8;
    *(void *)&v30[8] = a1;
    *(void *)&v30[16] = v5;
    [(id)_MergedGlobals_16 performWithLockSync:buf];

    goto LABEL_20;
  }
  if (([a1 isCancelled] & 1) != 0
    || (unint64_t v12 = [a1 maxRetries], objc_msgSend(a1, "retryCount") >= v12))
  {
LABEL_20:
    -[FCOperation _finishOperationWithError:]((uint64_t)a1, v4);
    goto LABEL_21;
  }
  id v27 = 0;
  char v13 = [a1 canRetryWithError:v4 retryAfter:&v27];
  id v14 = v27;
  uint64_t v15 = v14;
  if ((v13 & 1) == 0)
  {

    goto LABEL_20;
  }
  id v16 = v4;
  id v17 = v15;
  objc_msgSend(a1, "setRetryCount:", objc_msgSend(a1, "retryCount") + 1);
  double v18 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = v18;
    v20 = [a1 shortOperationDescription];
    uint64_t v21 = [a1 retryCount];
    uint64_t v22 = [a1 maxRetries];
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v20;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v21;
    *(_WORD *)&buf[22] = 2048;
    *(void *)v30 = v22;
    *(_WORD *)&v30[8] = 2114;
    *(void *)&v30[10] = v17;
    *(_WORD *)&v30[18] = 2114;
    *(void *)&v30[20] = v16;
    _os_log_impl(&dword_1A460D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ will perform retry %lu of %lu after %{public}@ due to error: %{public}@", buf, 0x34u);
  }
  objc_super v23 = FCDispatchQueueForQualityOfService([a1 qualityOfService]);
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __44__FCOperation__handleRetryFromError_signal___block_invoke;
  *(void *)v30 = &unk_1E5B58F70;
  *(void *)&v30[8] = a1;
  id v24 = v16;
  *(void *)&v30[16] = v24;
  id v25 = v17;
  *(void *)&v30[24] = v25;
  [v25 onQueue:v23 signal:buf];

LABEL_21:
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (BOOL)shouldStartThrottlingWithError:(id)a3 retryAfter:(double *)a4
{
  return 0;
}

- (unint64_t)maxRetries
{
  return 0;
}

void __35__FCOperation_setRelativePriority___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[41];
  }
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        if (v8)
        {
          if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "conformsToProtocol:", &unk_1EF8DB7B8, (void)v11))__int16 v9 = v8; {
          else
          }
            __int16 v9 = 0;
        }
        else
        {
          __int16 v9 = 0;
        }
        id v10 = v9;
        [v10 setRelativePriority:*(void *)(a1 + 40)];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

void __35__FCOperation_setQualityOfService___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[41];
  }
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if (v8)
        {
          if (objc_opt_isKindOfClass()) {
            __int16 v9 = v8;
          }
          else {
            __int16 v9 = 0;
          }
        }
        else
        {
          __int16 v9 = 0;
        }
        id v10 = v9;
        objc_msgSend(v10, "setQualityOfService:", *(void *)(a1 + 40), (void)v11);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

void __26__FCOperation_setPurpose___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[41];
  }
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if (v8)
        {
          if (objc_opt_isKindOfClass()) {
            __int16 v9 = v8;
          }
          else {
            __int16 v9 = 0;
          }
        }
        else
        {
          __int16 v9 = 0;
        }
        id v10 = v9;
        objc_msgSend(v10, "setPurpose:", *(void *)(a1 + 40), (void)v11);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)FCOperation;
  [(FCOperation *)&v3 cancel];
  [(FCOperation *)self cancelChildOperations];
}

void __24__FCOperation_setFlags___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[41];
  }
  objc_super v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if (v8)
        {
          if (objc_opt_isKindOfClass()) {
            __int16 v9 = v8;
          }
          else {
            __int16 v9 = 0;
          }
        }
        else
        {
          __int16 v9 = 0;
        }
        id v10 = v9;
        objc_msgSend(v10, "setFlags:", *(void *)(a1 + 40), (void)v11);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

uint64_t __26__FCOperation_setPurpose___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPurpose:@"unknown"];
}

void __29__FCOperation__startIfNeeded__block_invoke_85(uint64_t a1)
{
  [*(id *)(a1 + 32) cancelChildOperations];
  id v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_errorWithCode:description:", 15, @"The operation timed out.");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  -[FCOperation _finishedPerformingOperationWithError:](v2, v3);
}

- (void)performOperation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_class();
  if (v3 != objc_opt_class())
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
      *(_DWORD *)buf = 136315906;
      id v10 = "-[FCOperation performOperation]";
      __int16 v11 = 2080;
      long long v12 = "FCOperation.m";
      __int16 v13 = 1024;
      int v14 = 315;
      __int16 v15 = 2114;
      uint64_t v16 = v4;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3B8];
    uint64_t v7 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCOperation performOperation]"];
    id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

    objc_exception_throw(v8);
  }
  [(FCOperation *)self finishedPerformingOperationWithError:0];
}

uint64_t __48__FCOperation__handleThrottlingFromError_delay___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F81BE0]);
  uint64_t v1 = _MergedGlobals_16;
  _MergedGlobals_16 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __48__FCOperation__handleThrottlingFromError_delay___block_invoke_102(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = -[FCOperation _userDefaultsKeyForThrottleEndDate](*(void **)(a1 + 32));
  id v7 = [v2 objectForKey:v3];

  uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:*(double *)(a1 + 40)];
  if (!v7 || objc_msgSend(v4, "fc_isLaterThan:", v7))
  {
    uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v6 = -[FCOperation _userDefaultsKeyForThrottleEndDate](*(void **)(a1 + 32));
    [v5 setObject:v4 forKey:v6];
  }
}

void __44__FCOperation__handleRetryFromError_signal___block_invoke(uint64_t a1, int a2)
{
  if (a2 && ([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    [*(id *)(a1 + 32) resetForRetry];
    uint64_t v5 = *(void **)(a1 + 32);
    [v5 performOperation];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 40);
    -[FCOperation _finishOperationWithError:](v3, v4);
  }
}

- (void)finishFromEarlyCancellation
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  id v5 = [(FCOperation *)self errorUserInfo];
  uint64_t v4 = objc_msgSend(v3, "fc_operationCancelledErrorWithAdditionalUserInfo:", v5);
  -[FCOperation _finishOperationWithError:]((uint64_t)self, v4);
}

- (void)associateChildOperations:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    if (self) {
      childOperationsLock = self->_childOperationsLock;
    }
    else {
      childOperationsLock = 0;
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__FCOperation_associateChildOperations___block_invoke;
    v6[3] = &unk_1E5B4BE70;
    id v7 = v4;
    id v8 = self;
    [(NFUnfairLock *)childOperationsLock performWithLockSync:v6];
  }
}

void __40__FCOperation_associateChildOperations___block_invoke(uint64_t a1)
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
        -[FCOperation _associateChildOperation:](*(void *)(a1 + 40), *(void **)(*((void *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)cancelChildOperations
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy__59;
  long long v10 = __Block_byref_object_dispose__59;
  id v11 = 0;
  if (self) {
    childOperationsLock = self->_childOperationsLock;
  }
  else {
    childOperationsLock = 0;
  }
  uint64_t v4 = childOperationsLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__FCOperation_cancelChildOperations__block_invoke;
  v5[3] = &unk_1E5B4C258;
  v5[4] = self;
  v5[5] = &v6;
  [(NFUnfairLock *)v4 performWithLockSync:v5];

  [(id)v7[5] makeObjectsPerformSelector:sel_cancel];
  _Block_object_dispose(&v6, 8);
}

uint64_t __36__FCOperation_cancelChildOperations__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[41];
  }
  uint64_t v3 = v2;
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7 && (*(unsigned char *)(v7 + 250) = 1, (uint64_t v8 = *(void *)(a1 + 32)) != 0)) {
    long long v9 = *(void **)(v8 + 328);
  }
  else {
    long long v9 = 0;
  }
  return [v9 removeAllObjects];
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  return 0;
}

- (BOOL)waitUntilFinishedWithTimeout:(double)a3
{
  if (self) {
    finishedGroup = self->_finishedGroup;
  }
  else {
    finishedGroup = 0;
  }
  int64_t v4 = (uint64_t)(a3 * 1000000000.0);
  uint64_t v5 = finishedGroup;
  dispatch_time_t v6 = dispatch_time(0, v4);
  intptr_t v7 = dispatch_group_wait(v5, v6);

  return v7 == 0;
}

- (void)addCompletionHandler:(id)a3
{
  if (a3)
  {
    if (self) {
      finishedGroup = self->_finishedGroup;
    }
    else {
      finishedGroup = 0;
    }
    dispatch_time_t v6 = finishedGroup;
    id v7 = a3;
    uint64_t v8 = FCDispatchQueueForQualityOfService([(FCOperation *)self qualityOfService]);
    dispatch_group_notify(v6, v8, v7);
  }
}

- (FCOperation)proxyOperation
{
  return (FCOperation *)+[FCProxyOperation proxyForOperation:self];
}

- (BOOL)hasOperationStarted
{
  if (self) {
    self = (FCOperation *)self->_startOnce;
  }
  return [(FCOperation *)self hasBeenTriggered];
}

- (NSDictionary)errorUserInfo
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"FCErrorOperationClassNameKey";
  uint64_t v3 = (objc_class *)objc_opt_class();
  int64_t v4 = NSStringFromClass(v3);
  v9[0] = v4;
  v8[1] = @"FCErrorOperationIDKey";
  uint64_t v5 = [(FCOperation *)self operationID];
  v9[1] = v5;
  dispatch_time_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return (NSDictionary *)v6;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (void)setTimeoutDuration:(double)a3
{
  self->_timeoutDuration = a3;
}

@end