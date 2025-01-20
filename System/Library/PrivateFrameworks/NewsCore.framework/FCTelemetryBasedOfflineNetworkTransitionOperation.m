@interface FCTelemetryBasedOfflineNetworkTransitionOperation
- (FCAppActivationMonitorType)appActivationMonitor;
- (FCMultiNetworkBehaviorMonitor)networkBehaviorMonitor;
- (FCTelemetryBasedOfflineNetworkTransitionOperation)init;
- (FCTelemetryBasedOfflineNetworkTransitionOperation)initWithAppActivationMonitor:(id)a3 ignoredHosts:(id)a4 networkBehaviorMonitor:(id)a5;
- (NFUnfairLock)lock;
- (NSDate)dateOfLastSuccess;
- (NSDate)monitoringStartDate;
- (NSSet)ignoredHosts;
- (double)minimumSecondsSinceSuccessToOffline;
- (id)transitionBlock;
- (void)logNetworkEvent:(id)a3;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setDateOfLastSuccess:(id)a3;
- (void)setMinimumSecondsSinceSuccessToOffline:(double)a3;
- (void)setMonitoringStartDate:(id)a3;
- (void)setTransitionBlock:(id)a3;
@end

@implementation FCTelemetryBasedOfflineNetworkTransitionOperation

- (void)performOperation
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [(FCTelemetryBasedOfflineNetworkTransitionOperation *)self setMonitoringStartDate:v3];

  id v4 = [(FCTelemetryBasedOfflineNetworkTransitionOperation *)self networkBehaviorMonitor];
  [v4 addMonitor:self];
}

- (void)setMonitoringStartDate:(id)a3
{
}

- (FCMultiNetworkBehaviorMonitor)networkBehaviorMonitor
{
  return self->_networkBehaviorMonitor;
}

void __69__FCTelemetryBasedOfflineNetworkTransitionOperation_logNetworkEvent___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = [*(id *)(a1 + 32) dateOfLastSuccess];
  v3 = objc_msgSend(v2, "fc_laterDateAllowingNilWithDate:andDate:", v4, *(void *)(a1 + 40));
  [*(id *)(a1 + 32) setDateOfLastSuccess:v3];
}

- (void)setDateOfLastSuccess:(id)a3
{
}

- (NSDate)dateOfLastSuccess
{
  return self->_dateOfLastSuccess;
}

- (void)setTransitionBlock:(id)a3
{
}

- (void)setMinimumSecondsSinceSuccessToOffline:(double)a3
{
  self->_minimumSecondsSinceSuccessToOffline = a3;
}

- (FCTelemetryBasedOfflineNetworkTransitionOperation)initWithAppActivationMonitor:(id)a3 ignoredHosts:(id)a4 networkBehaviorMonitor:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "appActivationMonitor");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCTelemetryBasedOfflineNetworkTransitionOperation initWithAppActivationMonitor:ignoredHosts:networkBehaviorMonitor:]";
    __int16 v25 = 2080;
    v26 = "FCTelemetryBasedOfflineNetworkTransitionOperation.m";
    __int16 v27 = 1024;
    int v28 = 38;
    __int16 v29 = 2114;
    v30 = v19;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10) {
      goto LABEL_6;
    }
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "ignoredHosts");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCTelemetryBasedOfflineNetworkTransitionOperation initWithAppActivationMonitor:ignoredHosts:networkBehaviorMonitor:]";
    __int16 v25 = 2080;
    v26 = "FCTelemetryBasedOfflineNetworkTransitionOperation.m";
    __int16 v27 = 1024;
    int v28 = 39;
    __int16 v29 = 2114;
    v30 = v20;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "networkBehaviorMonitor");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCTelemetryBasedOfflineNetworkTransitionOperation initWithAppActivationMonitor:ignoredHosts:networkBehaviorMonitor:]";
    __int16 v25 = 2080;
    v26 = "FCTelemetryBasedOfflineNetworkTransitionOperation.m";
    __int16 v27 = 1024;
    int v28 = 40;
    __int16 v29 = 2114;
    v30 = v21;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v22.receiver = self;
  v22.super_class = (Class)FCTelemetryBasedOfflineNetworkTransitionOperation;
  v12 = [(FCOperation *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_appActivationMonitor, a3);
    uint64_t v14 = [v10 copy];
    ignoredHosts = v13->_ignoredHosts;
    v13->_ignoredHosts = (NSSet *)v14;

    objc_storeStrong((id *)&v13->_networkBehaviorMonitor, a5);
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F81C18]) initWithOptions:1];
    lock = v13->_lock;
    v13->_lock = (NFUnfairLock *)v16;
  }
  return v13;
}

- (void)logNetworkEvent:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1C9C8];
  [v4 startTime];
  v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  v7 = [v4 error];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
    id v10 = [(FCTelemetryBasedOfflineNetworkTransitionOperation *)self monitoringStartDate];
    if ((objc_msgSend(v6, "fc_isLaterThan:", v10) & 1) == 0)
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __69__FCTelemetryBasedOfflineNetworkTransitionOperation_logNetworkEvent___block_invoke_3;
      v36[3] = &unk_1E5B4BE70;
      id v37 = v6;
      id v38 = v10;
      __69__FCTelemetryBasedOfflineNetworkTransitionOperation_logNetworkEvent___block_invoke_3((uint64_t)v36);

LABEL_10:
      goto LABEL_11;
    }
    uint64_t v35 = 0;
    if (!objc_msgSend(v9, "fc_isOfflineErrorOfflineReason:", &v35) || v35 == 2) {
      goto LABEL_10;
    }
    if (objc_msgSend(v9, "fc_failedDueToTaskConstraints"))
    {
      id v11 = FCReachabilityLog;
      if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "disregarding event, since it failed due to task constraints", buf, 2u);
      }
      goto LABEL_10;
    }
    v12 = [v4 error];
    v13 = [v12 userInfo];
    uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F289B0]];

    if (v14)
    {
      v15 = [v14 host];
      uint64_t v16 = [(FCTelemetryBasedOfflineNetworkTransitionOperation *)self ignoredHosts];
      int v17 = [v16 containsObject:v15];

      v18 = FCReachabilityLog;
      BOOL v19 = os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT);
      if (v17)
      {
        if (v19)
        {
          *(_DWORD *)buf = 138543362;
          v42 = v15;
          _os_log_impl(&dword_1A460D000, v18, OS_LOG_TYPE_DEFAULT, "host %{public}@ will be ignored", buf, 0xCu);
        }
        goto LABEL_35;
      }
      if (v19)
      {
        *(_DWORD *)buf = 138543362;
        v42 = v15;
        _os_log_impl(&dword_1A460D000, v18, OS_LOG_TYPE_DEFAULT, "host %{public}@ will not be ignored", buf, 0xCu);
      }
    }
    else
    {
      v20 = FCReachabilityLog;
      if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A460D000, v20, OS_LOG_TYPE_DEFAULT, "no failing URL was obtained, so treating error as counting towards offline", buf, 2u);
      }
    }
    v21 = [(FCTelemetryBasedOfflineNetworkTransitionOperation *)self appActivationMonitor];
    v15 = [v21 lastActivationDate];

    objc_super v22 = [(FCTelemetryBasedOfflineNetworkTransitionOperation *)self appActivationMonitor];
    v23 = [v22 lastBackgroundDate];

    if (v15)
    {
      if (v23 && objc_msgSend(v23, "fc_isLaterThan:", v15))
      {
        uint64_t v24 = FCReachabilityLog;
        if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v42 = v23;
          __int16 v43 = 2114;
          v44 = v15;
          __int16 v25 = "disregarding error, since app is currently in the background, with last activation date of %{public}@ an"
                "d last background date of %{public}@ ";
LABEL_29:
          v26 = v24;
          uint32_t v27 = 22;
LABEL_32:
          _os_log_impl(&dword_1A460D000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
        }
      }
      else
      {
        if (!objc_msgSend(v6, "fc_isEarlierThan:", v15))
        {
          __int16 v29 = [(FCTelemetryBasedOfflineNetworkTransitionOperation *)self lock];
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __69__FCTelemetryBasedOfflineNetworkTransitionOperation_logNetworkEvent___block_invoke_25;
          v30[3] = &unk_1E5B4DC70;
          v30[4] = self;
          id v31 = v4;
          id v32 = v6;
          id v33 = v15;
          id v34 = v23;
          [v29 performWithLockSync:v30];

          goto LABEL_34;
        }
        uint64_t v24 = FCReachabilityLog;
        if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v42 = v6;
          __int16 v43 = 2114;
          v44 = v15;
          __int16 v25 = "disregarding error, since network event started at %{public}@ relative to last activation date of %{public}@";
          goto LABEL_29;
        }
      }
    }
    else
    {
      uint64_t v28 = FCReachabilityLog;
      if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        __int16 v25 = "disregarding error, since app has not yet become active";
        v26 = v28;
        uint32_t v27 = 2;
        goto LABEL_32;
      }
    }
LABEL_34:

LABEL_35:
    goto LABEL_10;
  }
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __69__FCTelemetryBasedOfflineNetworkTransitionOperation_logNetworkEvent___block_invoke;
  v39[3] = &unk_1E5B4BE70;
  v39[4] = self;
  id v40 = v6;
  __69__FCTelemetryBasedOfflineNetworkTransitionOperation_logNetworkEvent___block_invoke((uint64_t)v39);

LABEL_11:
}

void __69__FCTelemetryBasedOfflineNetworkTransitionOperation_logNetworkEvent___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) lock];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__FCTelemetryBasedOfflineNetworkTransitionOperation_logNetworkEvent___block_invoke_2;
  v4[3] = &unk_1E5B4BE70;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 performWithLockSync:v4];
}

- (NFUnfairLock)lock
{
  return self->_lock;
}

- (FCTelemetryBasedOfflineNetworkTransitionOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCTelemetryBasedOfflineNetworkTransitionOperation init]";
    __int16 v9 = 2080;
    id v10 = "FCTelemetryBasedOfflineNetworkTransitionOperation.m";
    __int16 v11 = 1024;
    int v12 = 31;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCTelemetryBasedOfflineNetworkTransitionOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = [(FCTelemetryBasedOfflineNetworkTransitionOperation *)self networkBehaviorMonitor];
  [v4 removeMonitor:self];
}

void __69__FCTelemetryBasedOfflineNetworkTransitionOperation_logNetworkEvent___block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = FCReachabilityLog;
  if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "disregarding event, since it started at %{public}@ relative to offline monitoring start date of %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

void __69__FCTelemetryBasedOfflineNetworkTransitionOperation_logNetworkEvent___block_invoke_25(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) dateOfLastSuccess];
  if (!v2) {
    goto LABEL_4;
  }
  [*(id *)(a1 + 32) minimumSecondsSinceSuccessToOffline];
  uint64_t v3 = objc_msgSend(v2, "dateByAddingTimeInterval:");
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  char v5 = objc_msgSend(v4, "fc_isLaterThan:", v3);

  if (v5)
  {

LABEL_4:
    uint64_t v6 = (void *)FCReachabilityLog;
    if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v7 = *(void **)(a1 + 40);
      uint64_t v8 = v6;
      uint64_t v9 = [v7 error];
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = *(void *)(a1 + 56);
      uint64_t v12 = *(void *)(a1 + 64);
      int v15 = 138544386;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      __int16 v21 = 2114;
      uint64_t v22 = v12;
      __int16 v23 = 2114;
      uint64_t v24 = v2;
      _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "transitioning offline after receiving event with error %{public}@, starting at %{public}@ relative to last activation date of %{public}@, last background date of %{public}@, and last success date of %{public}@", (uint8_t *)&v15, 0x34u);
    }
    if (([*(id *)(a1 + 32) isFinished] & 1) == 0)
    {
      __int16 v13 = [*(id *)(a1 + 32) transitionBlock];
      v13[2]();

      [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
    }
    goto LABEL_11;
  }
  uint64_t v14 = FCReachabilityLog;
  if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    uint64_t v16 = v3;
    _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_DEFAULT, "disregarding error, since earliest failure date is %{public}@", (uint8_t *)&v15, 0xCu);
  }

LABEL_11:
}

- (double)minimumSecondsSinceSuccessToOffline
{
  return self->_minimumSecondsSinceSuccessToOffline;
}

- (id)transitionBlock
{
  return self->_transitionBlock;
}

- (FCAppActivationMonitorType)appActivationMonitor
{
  return self->_appActivationMonitor;
}

- (NSSet)ignoredHosts
{
  return self->_ignoredHosts;
}

- (NSDate)monitoringStartDate
{
  return self->_monitoringStartDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoringStartDate, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_ignoredHosts, 0);
  objc_storeStrong((id *)&self->_appActivationMonitor, 0);
  objc_storeStrong(&self->_transitionBlock, 0);
  objc_storeStrong((id *)&self->_dateOfLastSuccess, 0);
}

@end