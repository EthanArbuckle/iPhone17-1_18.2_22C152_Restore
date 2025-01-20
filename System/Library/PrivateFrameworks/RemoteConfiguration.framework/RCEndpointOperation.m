@interface RCEndpointOperation
- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4;
- (BOOL)validateOperation;
- (NSDictionary)changeTagsByRequestKey;
- (NSDictionary)configurationResourcesByRequestKey;
- (NSURL)endpointURL;
- (OS_dispatch_queue)completionQueue;
- (RCConfigurationSettings)configurationSettings;
- (RCNetworkActivity)networkActivity;
- (id)configurationCompletionHandler;
- (id)networkEventHandler;
- (id)requestDataForSettings:(id)a3;
- (unint64_t)maxRetries;
- (void)_fetchConfigurationWithSettings:(id)a3;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)resetForRetry;
- (void)setChangeTagsByRequestKey:(id)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setConfigurationCompletionHandler:(id)a3;
- (void)setConfigurationResourcesByRequestKey:(id)a3;
- (void)setConfigurationSettings:(id)a3;
- (void)setEndpointURL:(id)a3;
- (void)setNetworkActivity:(id)a3;
- (void)setNetworkEventHandler:(id)a3;
- (void)validateOperation;
@end

@implementation RCEndpointOperation

- (BOOL)validateOperation
{
  uint64_t v3 = [(RCEndpointOperation *)self configurationSettings];
  if (v3
    && (v4 = (void *)v3,
        [(RCEndpointOperation *)self configurationSettings],
        v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isValid],
        v5,
        v4,
        (v6 & 1) != 0))
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v7)
    {
      -[RCEndpointOperation validateOperation]();
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (void)performOperation
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = RCSharedLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(RCOperation *)self shortOperationDescription];
    v5 = [(RCEndpointOperation *)self configurationSettings];
    int v7 = 138543618;
    v8 = v4;
    __int16 v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1A4AB3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will perform operation to fetch config with settings %@", (uint8_t *)&v7, 0x16u);
  }
  char v6 = [(RCEndpointOperation *)self configurationSettings];
  [(RCEndpointOperation *)self _fetchConfigurationWithSettings:v6];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(RCEndpointOperation *)self completionQueue];
  char v6 = v5;
  if (v5)
  {
    int v7 = v5;
  }
  else
  {
    int v7 = RCDispatchQueueForQualityOfService([(RCEndpointOperation *)self qualityOfService]);
  }
  v8 = v7;

  __int16 v9 = [(RCEndpointOperation *)self configurationCompletionHandler];

  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__RCEndpointOperation_operationWillFinishWithError___block_invoke;
    v10[3] = &unk_1E5B75F80;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v8, v10);
  }
}

void __52__RCEndpointOperation_operationWillFinishWithError___block_invoke(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) configurationCompletionHandler];
  v2 = [*(id *)(a1 + 32) configurationResourcesByRequestKey];
  v3[2](v3, v2, *(void *)(a1 + 40));
}

- (void)_fetchConfigurationWithSettings:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_alloc_init(RCURLFetchOperation);
  char v6 = [(RCEndpointOperation *)self endpointURL];
  [(RCURLFetchOperation *)v5 setURL:v6];

  int v7 = [(RCEndpointOperation *)self requestDataForSettings:v4];
  [(RCURLFetchOperation *)v5 setHTTPBody:v7];

  [(RCURLFetchOperation *)v5 setHTTPMethod:@"PUT"];
  v16 = @"Content-Type";
  v17[0] = @"application/json";
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  [(RCURLFetchOperation *)v5 setAdditionalRequestHTTPHeaders:v8];

  __int16 v9 = [v4 loggingKey];
  [(RCURLFetchOperation *)v5 setLoggingKey:v9];

  [v4 endpointTimeoutDuration];
  [(RCURLFetchOperation *)v5 setURLRequestTimeoutDuration:"setURLRequestTimeoutDuration:"];
  v10 = [(RCEndpointOperation *)self networkEventHandler];
  [(RCURLFetchOperation *)v5 setNetworkEventHandler:v10];

  id v11 = [(RCEndpointOperation *)self networkActivity];
  [(RCURLFetchOperation *)v5 setNetworkActivity:v11];

  v12 = [v4 backgroundFetchConfiguration];
  [(RCURLFetchOperation *)v5 setBackgroundFetchConfiguration:v12];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__RCEndpointOperation__fetchConfigurationWithSettings___block_invoke;
  v14[3] = &unk_1E5B76290;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  [(RCURLFetchOperation *)v5 setConfigurationDictionaryCompletionHandler:v14];
  [(RCOperation *)self associateChildOperation:v5];
  [(RCOperation *)v5 start];
}

void __55__RCEndpointOperation__fetchConfigurationWithSettings___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = RCSharedLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [*(id *)(a1 + 32) shortOperationDescription];
    uint64_t v18 = [v14 statusCode];
    objc_msgSend(MEMORY[0x1E4F28D20], "localizedStringForStatusCode:", objc_msgSend(v14, "statusCode"));
    v19 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2112;
    v28 = v19;
    _os_log_impl(&dword_1A4AB3000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Endpoint JSON HTTP response status code: %ld (%@)", buf, 0x20u);
  }
  if (!v11 || v15)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __55__RCEndpointOperation__fetchConfigurationWithSettings___block_invoke_15;
    v25[3] = &unk_1E5B75F80;
    v25[4] = *(void *)(a1 + 32);
    id v26 = v15;
    __55__RCEndpointOperation__fetchConfigurationWithSettings___block_invoke_15((uint64_t)v25);
  }
  else if (v12)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __55__RCEndpointOperation__fetchConfigurationWithSettings___block_invoke_2;
    v23[3] = &unk_1E5B75F80;
    v23[4] = *(void *)(a1 + 32);
    id v24 = v12;
    __55__RCEndpointOperation__fetchConfigurationWithSettings___block_invoke_2((uint64_t)v23);
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v28 = __Block_byref_object_copy__1;
    v29 = __Block_byref_object_dispose__1;
    id v30 = 0;
    uint64_t v20 = *(void *)(a1 + 40);
    v21 = [*(id *)(a1 + 32) shortOperationDescription];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __55__RCEndpointOperation__fetchConfigurationWithSettings___block_invoke_17;
    v22[3] = &unk_1E5B76268;
    v22[4] = *(void *)(a1 + 32);
    v22[5] = buf;
    +[RCEndpointResponseProcessing parseEndpointResponseDict:v11 parsingError:0 configurationSettings:v20 maxAge:v13 loggingPrefix:v21 completion:v22];

    [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(*(void *)&buf[8] + 40)];
    _Block_object_dispose(buf, 8);
  }
}

uint64_t __55__RCEndpointOperation__fetchConfigurationWithSettings___block_invoke_15(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

uint64_t __55__RCEndpointOperation__fetchConfigurationWithSettings___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

void __55__RCEndpointOperation__fetchConfigurationWithSettings___block_invoke_17(uint64_t a1, void *a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v6 = obj;
  id v7 = a2;
  [*(id *)(a1 + 32) setConfigurationResourcesByRequestKey:v7];
}

- (id)requestDataForSettings:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 dictionaryRepresentation];
  id v6 = (void *)[v5 mutableCopy];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v33 = v4;
  id obj = [v4 requestInfos];
  uint64_t v7 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v44;
    v35 = self;
    v36 = v6;
    uint64_t v34 = *(void *)v44;
    do
    {
      uint64_t v10 = 0;
      uint64_t v37 = v8;
      do
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v43 + 1) + 8 * v10);
        id v12 = (void *)MEMORY[0x1E4F1CA60];
        id v13 = [v11 allAdditionalFields];
        id v14 = [v12 dictionaryWithDictionary:v13];

        id v15 = [(RCEndpointOperation *)self changeTagsByRequestKey];
        v16 = [v11 requestKey];
        v17 = [v15 objectForKeyedSubscript:v16];

        if ([v11 requestType])
        {
          if ([v11 requestType] != 1) {
            goto LABEL_22;
          }
          uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
          if (v17)
          {
            v19 = [v17 dictionaryRepresentation];
            [v18 addObject:v19];
          }
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          uint64_t v20 = [v11 additionalChangeTags];
          uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v51 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v40;
            do
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v40 != v23) {
                  objc_enumerationMutation(v20);
                }
                v25 = [*(id *)(*((void *)&v39 + 1) + 8 * i) dictionaryRepresentation];
                [v18 addObject:v25];
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v51 count:16];
            }
            while (v22);
          }

          [v14 setObject:v18 forKeyedSubscript:@"changeTagWrappers"];
          id v26 = [v11 requestKey];
          id v6 = v36;
          [v36 setObject:v14 forKeyedSubscript:v26];

          uint64_t v9 = v34;
          self = v35;
          uint64_t v8 = v37;
        }
        else
        {
          if (v17)
          {
            v27 = [v17 dictionaryRepresentation];
            [v14 setObject:v27 forKeyedSubscript:@"changeTagWrapper"];
          }
          uint64_t v18 = [v11 requestKey];
          [v6 setObject:v14 forKeyedSubscript:v18];
        }

LABEL_22:
        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v8);
  }

  v28 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:0 error:0];
  v29 = RCSharedLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    id v30 = [(RCOperation *)self shortOperationDescription];
    uint64_t v31 = (void *)[[NSString alloc] initWithData:v28 encoding:4];
    *(_DWORD *)buf = 138543618;
    v48 = v30;
    __int16 v49 = 2112;
    v50 = v31;
    _os_log_impl(&dword_1A4AB3000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ Endpoint JSON request: %@", buf, 0x16u);
  }

  return v28;
}

- (unint64_t)maxRetries
{
  return 1;
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  id v5 = a3;
  if (objc_msgSend(v5, "rc_shouldRetry")
    && ([v5 userInfo],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 objectForKeyedSubscript:@"RCErrorRetryAfter"],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    uint64_t v8 = [v5 userInfo];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"RCErrorRetryAfter"];
    [v9 doubleValue];
    double v11 = v10;

    *a4 = [[RCOperationDelayedRetrySignal alloc] initWithDelay:v11];
    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)resetForRetry
{
}

- (RCConfigurationSettings)configurationSettings
{
  return self->_configurationSettings;
}

- (void)setConfigurationSettings:(id)a3
{
}

- (NSDictionary)changeTagsByRequestKey
{
  return self->_changeTagsByRequestKey;
}

- (void)setChangeTagsByRequestKey:(id)a3
{
}

- (NSURL)endpointURL
{
  return self->_endpointURL;
}

- (void)setEndpointURL:(id)a3
{
}

- (id)configurationCompletionHandler
{
  return self->_configurationCompletionHandler;
}

- (void)setConfigurationCompletionHandler:(id)a3
{
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

- (id)networkEventHandler
{
  return self->_networkEventHandler;
}

- (void)setNetworkEventHandler:(id)a3
{
}

- (RCNetworkActivity)networkActivity
{
  return self->_networkActivity;
}

- (void)setNetworkActivity:(id)a3
{
}

- (NSDictionary)configurationResourcesByRequestKey
{
  return self->_configurationResourcesByRequestKey;
}

- (void)setConfigurationResourcesByRequestKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationResourcesByRequestKey, 0);
  objc_storeStrong((id *)&self->_networkActivity, 0);
  objc_storeStrong(&self->_networkEventHandler, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong(&self->_configurationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_endpointURL, 0);
  objc_storeStrong((id *)&self->_changeTagsByRequestKey, 0);

  objc_storeStrong((id *)&self->_configurationSettings, 0);
}

- (void)validateOperation
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[[NSString alloc] initWithFormat:@"the endpoint operation must have valid configuration settings"];
  int v1 = 136315906;
  v2 = "-[RCEndpointOperation validateOperation]";
  __int16 v3 = 2080;
  id v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/RCEndpointOperation.m";
  __int16 v5 = 1024;
  int v6 = 54;
  __int16 v7 = 2114;
  uint64_t v8 = v0;
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

@end