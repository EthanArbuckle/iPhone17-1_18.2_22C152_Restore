@interface RCURLSession
+ (id)_sharedSession;
+ (id)backgroundSessionForFetchConfig:(id)a3 delegateReference:(id *)a4;
+ (id)backgroundSessionWithIdentifier:(id)a3 sharedContainerIdentifier:(id)a4 timeout:(double)a5 delegateReference:(id *)a6;
+ (id)backgroundSessionsLock;
+ (id)sharedForegroundSession;
+ (void)_configureURLSessionConfiguration:(id)a3;
+ (void)cancelAllTasksOnBackgroundSessionWithFetchConfig:(id)a3 completion:(id)a4;
- (NSMutableDictionary)backgroundSessions;
- (RCURLSession)init;
- (RCUnfairLock)backgroundSessionsLock;
- (void)setBackgroundSessions:(id)a3;
- (void)setBackgroundSessionsLock:(id)a3;
@end

@implementation RCURLSession

+ (id)_sharedSession
{
  if (_sharedSession_onceToken != -1) {
    dispatch_once(&_sharedSession_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)_sharedSession_s_sharedSession;

  return v2;
}

uint64_t __30__RCURLSession__sharedSession__block_invoke()
{
  _sharedSession_s_sharedSession = objc_alloc_init(RCURLSession);

  return MEMORY[0x1F41817F8]();
}

- (RCURLSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)RCURLSession;
  v2 = [(RCURLSession *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(RCUnfairLock);
    backgroundSessionsLock = v2->_backgroundSessionsLock;
    v2->_backgroundSessionsLock = v3;
  }
  return v2;
}

+ (id)sharedForegroundSession
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__RCURLSession_sharedForegroundSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedForegroundSession_onceToken != -1) {
    dispatch_once(&sharedForegroundSession_onceToken, block);
  }
  v2 = (void *)sharedForegroundSession_s_sharedSession;

  return v2;
}

void __39__RCURLSession_sharedForegroundSession__block_invoke(uint64_t a1)
{
  id v6 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
  [*(id *)(a1 + 32) _configureURLSessionConfiguration:v6];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  [v2 setName:@"RCFetchOperation.callbackQueue"];
  v3 = [MEMORY[0x1E4F28F80] processInfo];
  objc_msgSend(v2, "setMaxConcurrentOperationCount:", objc_msgSend(v3, "processorCount"));

  uint64_t v4 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v6 delegate:0 delegateQueue:v2];
  v5 = (void *)sharedForegroundSession_s_sharedSession;
  sharedForegroundSession_s_sharedSession = v4;
}

+ (id)backgroundSessionWithIdentifier:(id)a3 sharedContainerIdentifier:(id)a4 timeout:(double)a5 delegateReference:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = [a1 backgroundSessionsLock];
  [v12 lock];

  v13 = +[RCURLSession _sharedSession];
  v14 = [v13 backgroundSessions];
  id v15 = [v14 objectForKeyedSubscript:v10];

  v16 = [a1 backgroundSessionsLock];
  [v16 unlock];

  if (v15)
  {
    v17 = [v15 configuration];
    id v18 = [v17 sharedContainerIdentifier];

    if (v18 != v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[RCURLSession backgroundSessionWithIdentifier:sharedContainerIdentifier:timeout:delegateReference:]();
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F290F0] backgroundSessionConfigurationWithIdentifier:v10];
    [a1 _configureURLSessionConfiguration:v19];
    [v19 setTimeoutIntervalForResource:a5];
    [v19 setSharedContainerIdentifier:v11];

    id v20 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [v20 setName:@"RCFetchOperation.backgroundFetchCallbackQueue"];
    v21 = [MEMORY[0x1E4F28F80] processInfo];
    objc_msgSend(v20, "setMaxConcurrentOperationCount:", objc_msgSend(v21, "processorCount"));

    v22 = [[RCNetworkOperationURLSessionDelegate alloc] initWithSessionIdentifier:v10];
    v23 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v19 delegate:v22 delegateQueue:v20];
    v24 = [a1 backgroundSessionsLock];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __100__RCURLSession_backgroundSessionWithIdentifier_sharedContainerIdentifier_timeout_delegateReference___block_invoke;
    v29[3] = &unk_1E5B75F80;
    id v30 = v10;
    id v15 = v23;
    id v31 = v15;
    [v24 performWithLockSync:v29];
  }
  if (a6)
  {
    v25 = [v15 delegate];

    if (!v25 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[RCURLSession backgroundSessionWithIdentifier:sharedContainerIdentifier:timeout:delegateReference:]();
    }
    v26 = (objc_class *)objc_opt_class();
    v27 = [v15 delegate];
    RCCheckedDynamicCast(v26, (uint64_t)v27);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

void __100__RCURLSession_backgroundSessionWithIdentifier_sharedContainerIdentifier_timeout_delegateReference___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = +[RCURLSession _sharedSession];
  v3 = [v4 backgroundSessions];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 32)];
}

+ (id)backgroundSessionForFetchConfig:(id)a3 delegateReference:(id *)a4
{
  id v6 = a3;
  v7 = [v6 sessionIdentifier];
  v8 = [v6 sharedContainerIdentifier];
  [v6 timeout];
  double v10 = v9;

  id v11 = [a1 backgroundSessionWithIdentifier:v7 sharedContainerIdentifier:v8 timeout:a4 delegateReference:v10];

  return v11;
}

+ (void)cancelAllTasksOnBackgroundSessionWithFetchConfig:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = RCSharedLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v5 sessionIdentifier];
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_1A4AB3000, v7, OS_LOG_TYPE_DEFAULT, "Will cancel all tasks on background URLSession: %{public}@", buf, 0xCu);
  }
  double v9 = +[RCURLSession backgroundSessionForFetchConfig:v5 delegateReference:0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__RCURLSession_cancelAllTasksOnBackgroundSessionWithFetchConfig_completion___block_invoke;
  v12[3] = &unk_1E5B76A90;
  id v13 = v5;
  id v14 = v6;
  id v10 = v6;
  id v11 = v5;
  [v9 getAllTasksWithCompletionHandler:v12];
}

void __76__RCURLSession_cancelAllTasksOnBackgroundSessionWithFetchConfig_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v7++) cancel];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v5);
  }
  v8 = RCSharedLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v3 count];
    id v10 = [*(id *)(a1 + 32) sessionIdentifier];
    *(_DWORD *)buf = 134218242;
    uint64_t v17 = v9;
    __int16 v18 = 2114;
    v19 = v10;
    _os_log_impl(&dword_1A4AB3000, v8, OS_LOG_TYPE_DEFAULT, "Did cancel all tasks (%lu) on background URLSession: %{public}@", buf, 0x16u);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(void))(v11 + 16))();
  }
}

+ (id)backgroundSessionsLock
{
  uint64_t v2 = +[RCURLSession _sharedSession];
  id v3 = [v2 backgroundSessionsLock];

  return v3;
}

+ (void)_configureURLSessionConfiguration:(id)a3
{
  id v5 = a3;
  [v5 setAllowsCellularAccess:1];
  [v5 setRequestCachePolicy:1];
  [v5 setURLCache:0];
  [v5 setTimeoutIntervalForRequest:60.0];
  [v5 setTimeoutIntervalForResource:240.0];
  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v4 = [v3 objectForInfoDictionaryKey:@"RCNetworkAttributionBundleIdentifier"];

  if (v4) {
    objc_msgSend(v5, "set_sourceApplicationBundleIdentifier:", v4);
  }
  objc_msgSend(v5, "set_timingDataOptions:", 1);
  [v5 setHTTPMaximumConnectionsPerHost:1];
  [v5 setHTTPShouldUsePipelining:0];
}

- (NSMutableDictionary)backgroundSessions
{
  return self->_backgroundSessions;
}

- (void)setBackgroundSessions:(id)a3
{
}

- (RCUnfairLock)backgroundSessionsLock
{
  return self->_backgroundSessionsLock;
}

- (void)setBackgroundSessionsLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundSessionsLock, 0);

  objc_storeStrong((id *)&self->_backgroundSessions, 0);
}

+ (void)backgroundSessionWithIdentifier:sharedContainerIdentifier:timeout:delegateReference:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "urlSession.delegate");
  *(_DWORD *)buf = 136315906;
  uint64_t v2 = "+[RCURLSession backgroundSessionWithIdentifier:sharedContainerIdentifier:timeout:delegateReference:]";
  __int16 v3 = 2080;
  uint64_t v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/BackgroundURLSessionSupport/RCURLSession.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);
}

+ (void)backgroundSessionWithIdentifier:sharedContainerIdentifier:timeout:delegateReference:.cold.2()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"expected equality between %s and %s", "urlSession.configuration.sharedContainerIdentifier", "sharedContainerIdentifier");
  *(_DWORD *)buf = 136315906;
  uint64_t v2 = "+[RCURLSession backgroundSessionWithIdentifier:sharedContainerIdentifier:timeout:delegateReference:]";
  __int16 v3 = 2080;
  uint64_t v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/BackgroundURLSessionSupport/RCURLSession.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);
}

@end