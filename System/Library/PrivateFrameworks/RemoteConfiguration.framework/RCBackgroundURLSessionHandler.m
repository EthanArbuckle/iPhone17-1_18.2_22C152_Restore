@interface RCBackgroundURLSessionHandler
- (NSString)sessionIdentifier;
- (RCBackgroundURLSessionHandler)init;
- (RCConfigurationSettings)configurationSettings;
- (id)sessionCompletionHandler;
- (void)networkSessionDidFinishWithTasks:(id)a3;
- (void)reestablishBackgroundSessionWithConfigurationSettings:(id)a3 sessionCompletionHandler:(id)a4;
- (void)setConfigurationSettings:(id)a3;
- (void)setSessionCompletionHandler:(id)a3;
- (void)setSessionIdentifier:(id)a3;
@end

@implementation RCBackgroundURLSessionHandler

- (RCBackgroundURLSessionHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)RCBackgroundURLSessionHandler;
  return [(RCBackgroundURLSessionHandler *)&v3 init];
}

- (void)reestablishBackgroundSessionWithConfigurationSettings:(id)a3 sessionCompletionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  [(RCBackgroundURLSessionHandler *)self setConfigurationSettings:v7];
  [(RCBackgroundURLSessionHandler *)self setSessionCompletionHandler:v6];

  v8 = [v7 backgroundFetchConfiguration];

  v9 = [v8 sessionIdentifier];
  [(RCBackgroundURLSessionHandler *)self setSessionIdentifier:v9];

  v10 = RCSharedLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v8 sessionIdentifier];
    *(_DWORD *)buf = 138543362;
    v16 = v11;
    _os_log_impl(&dword_1A4AB3000, v10, OS_LOG_TYPE_DEFAULT, "RCBackgroundURLSessionHandler will reestablish background URL session, id: %{public}@", buf, 0xCu);
  }
  id v14 = 0;
  v12 = +[RCURLSession backgroundSessionForFetchConfig:v8 delegateReference:&v14];
  id v13 = v14;
  [v13 addObserver:self];
}

- (void)networkSessionDidFinishWithTasks:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = RCSharedLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(RCBackgroundURLSessionHandler *)self sessionIdentifier];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v3 count];
    _os_log_impl(&dword_1A4AB3000, v4, OS_LOG_TYPE_DEFAULT, "RCBackgroundURLSessionHandler networkSessionDidFinish, id: %{public}@, taskCount: %lu", buf, 0x16u);
  }
  queue = RCDispatchQueueForQualityOfService(-1);
  id v6 = dispatch_group_create();
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v43 = __Block_byref_object_copy__2;
  v44 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v45 = (id)objc_claimAutoreleasedReturnValue();
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__2;
  v35[4] = __Block_byref_object_dispose__2;
  v36 = objc_alloc_init(RCUnfairLock);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v3;
  uint64_t v24 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        dispatch_group_enter(v6);
        v9 = [v8 data];
        v10 = [v8 httpResponse];
        v11 = [v10 allHeaderFields];
        v12 = [v11 objectForKeyedSubscript:@"Cache-Control"];
        id v13 = objc_msgSend(v12, "rc_numberFollowingString:", @"max-age=");

        if (!v13 || ([v13 doubleValue], v14 == 0.0))
        {
          v15 = RCSharedLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = [v10 URL];
            uint64_t v17 = [v16 absoluteString];
            v18 = [v8 identifier];
            *(_DWORD *)v37 = 138543618;
            v38 = v17;
            __int16 v39 = 2114;
            v40 = v18;
            _os_log_impl(&dword_1A4AB3000, v15, OS_LOG_TYPE_DEFAULT, "max-age missing from Cache-Control header for URL: %{public}@, taskID: %{public}@", v37, 0x16u);
          }
          id v13 = 0;
        }
        v19 = [(RCBackgroundURLSessionHandler *)self configurationSettings];
        v20 = [v8 identifier];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __66__RCBackgroundURLSessionHandler_networkSessionDidFinishWithTasks___block_invoke;
        v27[3] = &unk_1E5B76AB8;
        v27[4] = v8;
        v27[5] = self;
        v29 = v35;
        v30 = buf;
        v28 = v6;
        +[RCEndpointResponseProcessing parseEndpointResponse:v9 configurationSettings:v19 maxAge:v13 loggingPrefix:v20 completion:v27];
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
    }
    while (v24);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__RCBackgroundURLSessionHandler_networkSessionDidFinishWithTasks___block_invoke_2;
  block[3] = &unk_1E5B76AE0;
  block[4] = self;
  block[5] = buf;
  dispatch_group_notify(v6, queue, block);
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(buf, 8);
}

void __66__RCBackgroundURLSessionHandler_networkSessionDidFinishWithTasks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = RCSharedLog();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = [*(id *)(a1 + 32) identifier];
      v10 = [*(id *)(a1 + 40) sessionIdentifier];
      *(_DWORD *)buf = 138543874;
      v25 = v9;
      __int16 v26 = 2114;
      v27 = v10;
      __int16 v28 = 2114;
      id v29 = v5;
      v11 = "Failed to parse response data for task (%{public}@) of network session (%{public}@), error: %{public}@";
      v12 = v8;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 32;
LABEL_6:
      _os_log_impl(&dword_1A4AB3000, v12, v13, v11, buf, v14);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [*(id *)(a1 + 32) identifier];
    v10 = [*(id *)(a1 + 40) sessionIdentifier];
    *(_DWORD *)buf = 138543618;
    v25 = v9;
    __int16 v26 = 2114;
    v27 = v10;
    v11 = "Successfully parsed response data for task (%{public}@) of network session (%{public}@)";
    v12 = v8;
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    uint32_t v14 = 22;
    goto LABEL_6;
  }

  v15 = [RCBackgroundTaskResult alloc];
  v16 = [*(id *)(a1 + 32) identifier];
  uint64_t v17 = [(RCBackgroundTaskResult *)v15 initWithTaskIdentifier:v16 configurationResourcesByRequestKey:v6 error:v5];

  v18 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __66__RCBackgroundURLSessionHandler_networkSessionDidFinishWithTasks___block_invoke_8;
  v21[3] = &unk_1E5B760D8;
  uint64_t v19 = *(void *)(a1 + 64);
  v22 = v17;
  uint64_t v23 = v19;
  v20 = v17;
  [v18 performWithLockSync:v21];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __66__RCBackgroundURLSessionHandler_networkSessionDidFinishWithTasks___block_invoke_8(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:*(void *)(a1 + 32)];
}

void __66__RCBackgroundURLSessionHandler_networkSessionDidFinishWithTasks___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sessionCompletionHandler];

  if (v2)
  {
    v4 = [*(id *)(a1 + 32) sessionCompletionHandler];
    id v3 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copy];
    v4[2](v4, v3);
  }
}

- (RCConfigurationSettings)configurationSettings
{
  return self->_configurationSettings;
}

- (void)setConfigurationSettings:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (id)sessionCompletionHandler
{
  return self->_sessionCompletionHandler;
}

- (void)setSessionCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sessionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);

  objc_storeStrong((id *)&self->_configurationSettings, 0);
}

@end