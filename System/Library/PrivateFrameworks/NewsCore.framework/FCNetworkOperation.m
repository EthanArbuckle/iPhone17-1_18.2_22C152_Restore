@interface FCNetworkOperation
- (BOOL)areNetworkRequirementsSatisfiedWithReachability:(id)a3 offlineReason:(int64_t *)a4;
- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4;
- (BOOL)shouldStartThrottlingWithError:(id)a3 retryAfter:(double *)a4;
- (BOOL)validateOperationError:(id *)a3;
- (FCNetworkOperation)init;
- (FCNetworkOperation)initWithNetworkReachability:(id)a3;
- (FCNetworkReachabilityType)networkReachability;
- (double)preferredTimeoutIntervalForRequest;
- (unint64_t)maxRetries;
- (void)networkReachabilityDidChange:(id)a3;
- (void)prepareOperation;
@end

@implementation FCNetworkOperation

- (FCNetworkOperation)initWithNetworkReachability:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "networkReachability");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCNetworkOperation initWithNetworkReachability:]";
    __int16 v13 = 2080;
    v14 = "FCNetworkOperation.m";
    __int16 v15 = 1024;
    int v16 = 37;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v10.receiver = self;
  v10.super_class = (Class)FCNetworkOperation;
  v6 = [(FCOperation *)&v10 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_networkReachability, a3);
  }

  return v7;
}

- (double)preferredTimeoutIntervalForRequest
{
  unint64_t v2 = [(FCOperation *)self retryCount];
  double result = 15.0;
  if (!v2) {
    return 10.0;
  }
  return result;
}

- (void).cxx_destruct
{
}

- (BOOL)validateOperationError:(id *)a3
{
  id v5 = [(FCNetworkOperation *)self networkReachability];
  uint64_t v8 = 0;
  BOOL v6 = [(FCNetworkOperation *)self areNetworkRequirementsSatisfiedWithReachability:v5 offlineReason:&v8];
  if (v6)
  {
    *a3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "fc_offlineErrorWithReason:");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)prepareOperation
{
  id v3 = [(FCNetworkOperation *)self networkReachability];
  [v3 addObserver:self];
}

- (FCNetworkReachabilityType)networkReachability
{
  return self->_networkReachability;
}

- (FCNetworkOperation)init
{
  id v3 = +[FCNetworkReachability sharedNetworkReachability];
  v4 = [(FCNetworkOperation *)self initWithNetworkReachability:v3];

  return v4;
}

- (unint64_t)maxRetries
{
  return 1;
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F28A50];
  uint64_t v8 = *MEMORY[0x1E4F19C40];
  v9 = (__CFString *)*MEMORY[0x1E4F19C60];
  uint64_t v33 = *MEMORY[0x1E4F281F8];
  v31 = v6;
  uint64_t v32 = *MEMORY[0x1E4F289A0];
  while (1)
  {
    id v10 = v6;
    v11 = v10;
    if (!self || (objc_msgSend(v10, "fc_isServiceUnavailableError", v31) & 1) != 0)
    {
LABEL_4:

      goto LABEL_27;
    }
    v12 = [v11 domain];
    if ([v12 isEqualToString:v8])
    {
      __int16 v13 = [v11 userInfo];
      v14 = [v13 objectForKeyedSubscript:v9];

      if (v14)
      {
        __int16 v15 = [v11 userInfo];
        int v16 = v15;
        __int16 v17 = v9;
        goto LABEL_12;
      }
    }
    else
    {
    }
    v18 = [v11 domain];
    if ([v18 isEqualToString:@"FCErrorDomain"]) {
      break;
    }

LABEL_15:
    v25 = [v11 domain];
    if ([v25 isEqualToString:v33])
    {
      uint64_t v26 = [v11 code];

      if (v26 == 4097) {
        goto LABEL_21;
      }
    }
    else
    {
    }
    v27 = [v11 domain];
    int v28 = [v27 isEqualToString:v32];

    if (!v28 || ([v11 code] | 4) != 0xFFFFFFFFFFFFFC17) {
      goto LABEL_4;
    }
LABEL_21:
    int v24 = 1;
    double v23 = 1.0;
    if (a4) {
      goto LABEL_25;
    }
LABEL_26:

    if (v24) {
      goto LABEL_30;
    }
LABEL_27:
    v29 = objc_msgSend(v11, "userInfo", v31);
    id v6 = [v29 objectForKeyedSubscript:v7];

    if (!v6)
    {
      v11 = 0;
      goto LABEL_31;
    }
  }
  uint64_t v19 = [v11 userInfo];
  v20 = [v19 objectForKeyedSubscript:@"FCErrorRetryAfter"];

  if (!v20) {
    goto LABEL_15;
  }
  __int16 v15 = [v11 userInfo];
  int v16 = v15;
  __int16 v17 = @"FCErrorRetryAfter";
LABEL_12:
  v21 = [v15 objectForKeyedSubscript:v17];

  if (v21)
  {
    [v21 doubleValue];
    double v23 = v22;
    int v24 = 1;
  }
  else
  {
    int v24 = 0;
    double v23 = 0.0;
  }

  if (!a4) {
    goto LABEL_26;
  }
LABEL_25:
  if (!v24) {
    goto LABEL_26;
  }
  *a4 = [[FCOperationDelayedRetrySignal alloc] initWithDelay:v23];

LABEL_30:
  LOBYTE(v6) = 1;
LABEL_31:

  return (char)v6;
}

uint64_t __45__FCNetworkOperation_validateOperationError___block_invoke(uint64_t a1)
{
  **(void **)(a1 + 32) = (id)objc_claimAutoreleasedReturnValue();
  return 0;
}

- (BOOL)areNetworkRequirementsSatisfiedWithReachability:(id)a3 offlineReason:(int64_t *)a4
{
  id v5 = a3;
  char v6 = [v5 isNetworkReachable];
  if ((v6 & 1) == 0) {
    *a4 = [v5 offlineReason];
  }

  return v6;
}

- (BOOL)shouldStartThrottlingWithError:(id)a3 retryAfter:(double *)a4
{
  id v6 = a3;
  uint64_t v7 = [(FCOperation *)self throttleGroup];
  double v8 = 0.0;
  if (!v7)
  {
LABEL_10:
    if (!a4) {
      goto LABEL_12;
    }
LABEL_11:
    *a4 = fmin(v8, 43200.0);
    goto LABEL_12;
  }
  int v9 = objc_msgSend(v6, "fc_isServiceUnavailableError");

  if (!v9) {
    goto LABEL_9;
  }
  id v10 = [v6 domain];
  int v11 = [v10 isEqualToString:@"FCErrorDomain"];

  if (v11)
  {
    v12 = [v6 userInfo];
    __int16 v13 = v12;
    v14 = FCErrorRetryAfterKey;
    goto LABEL_7;
  }
  __int16 v15 = [v6 domain];
  int v16 = [v15 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (!v16)
  {
LABEL_9:
    LOBYTE(v7) = 0;
    goto LABEL_10;
  }
  v12 = [v6 userInfo];
  __int16 v13 = v12;
  v14 = (__CFString **)MEMORY[0x1E4F19C60];
LABEL_7:
  __int16 v17 = [v12 objectForKeyedSubscript:*v14];

  if (v17)
  {
    [v17 doubleValue];
    double v8 = v18;
    LOBYTE(v7) = 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  if (a4) {
    goto LABEL_11;
  }
LABEL_12:

  return (char)v7;
}

- (void)networkReachabilityDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(FCOperation *)self hasOperationStarted])
  {
    uint64_t v8 = 0;
    if (![(FCNetworkOperation *)self areNetworkRequirementsSatisfiedWithReachability:v4 offlineReason:&v8])
    {
      id v5 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v5;
        uint64_t v7 = [(FCOperation *)self shortOperationDescription];
        *(_DWORD *)buf = 138543618;
        id v10 = v7;
        __int16 v11 = 2048;
        uint64_t v12 = v8;
        _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "cancelling %{public}@ due to failure to satisfy network requirements with offline reason %ld", buf, 0x16u);
      }
      [(FCOperation *)self cancel];
    }
  }
}

@end