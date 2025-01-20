@interface ICURLSessionManager
+ (ICURLSession)defaultSession;
+ (ICURLSession)highPrioritySession;
+ (ICURLSession)unlimitedHighPrioritySession;
+ (ICURLSessionManager)sharedSessionManager;
- (ICURLSessionManager)init;
- (id)_defaultSessionIdentifierWithQualityOfService:(int64_t)a3 maxConcurrentRequests:(unint64_t)a4;
- (id)_defaultSessionWithQualityOfService:(int64_t)a3 maxConcurrentRequests:(unint64_t)a4;
- (id)sessionWithIdentifier:(id)a3;
- (id)sessionWithIdentifier:(id)a3 configuration:(id)a4;
- (id)sessionWithIdentifier:(id)a3 creationBlock:(id)a4;
- (id)sessionWithQualityOfService:(int64_t)a3;
- (void)addSession:(id)a3 withIdentifier:(id)a4;
- (void)removeSessionWithIdentifier:(id)a3;
@end

@implementation ICURLSessionManager

+ (ICURLSession)unlimitedHighPrioritySession
{
  v2 = +[ICURLSessionManager sharedSessionManager];
  v3 = [v2 _defaultSessionWithQualityOfService:33 maxConcurrentRequests:-1];

  return (ICURLSession *)v3;
}

+ (ICURLSessionManager)sharedSessionManager
{
  if (sharedSessionManager_sOnceToken != -1) {
    dispatch_once(&sharedSessionManager_sOnceToken, &__block_literal_global_3875);
  }
  v2 = (void *)sharedSessionManager_sSharedSessionManager;

  return (ICURLSessionManager *)v2;
}

- (id)_defaultSessionWithQualityOfService:(int64_t)a3 maxConcurrentRequests:(unint64_t)a4
{
  v7 = -[ICURLSessionManager _defaultSessionIdentifierWithQualityOfService:maxConcurrentRequests:](self, "_defaultSessionIdentifierWithQualityOfService:maxConcurrentRequests:");
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__ICURLSessionManager__defaultSessionWithQualityOfService_maxConcurrentRequests___block_invoke;
  v11[3] = &unk_1E5AC7538;
  v11[4] = self;
  id v12 = v7;
  int64_t v13 = a3;
  unint64_t v14 = a4;
  id v8 = v7;
  v9 = [(ICURLSessionManager *)self sessionWithIdentifier:v8 creationBlock:v11];

  return v9;
}

- (id)sessionWithIdentifier:(id)a3 creationBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3856;
  v21 = __Block_byref_object_dispose__3857;
  id v22 = 0;
  accessQueue = self->_accessQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__ICURLSessionManager_sessionWithIdentifier_creationBlock___block_invoke;
  v13[3] = &unk_1E5ACCEA0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(accessQueue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

- (id)_defaultSessionIdentifierWithQualityOfService:(int64_t)a3 maxConcurrentRequests:(unint64_t)a4
{
  if (a3 <= 16)
  {
    if (a3 == -1)
    {
      id v6 = @"Default";
      return (id)[NSString stringWithFormat:@"com.apple.iTunesCloud.ICURLSessionManager.%@.max%lu", v6, a4, v4, v5];
    }
    if (a3 == 9)
    {
      id v6 = @"Background";
      return (id)[NSString stringWithFormat:@"com.apple.iTunesCloud.ICURLSessionManager.%@.max%lu", v6, a4, v4, v5];
    }
LABEL_12:
    id v6 = @"Unknown";
    return (id)[NSString stringWithFormat:@"com.apple.iTunesCloud.ICURLSessionManager.%@.max%lu", v6, a4, v4, v5];
  }
  if (a3 == 17)
  {
    id v6 = @"Utility";
    return (id)[NSString stringWithFormat:@"com.apple.iTunesCloud.ICURLSessionManager.%@.max%lu", v6, a4, v4, v5];
  }
  if (a3 == 33)
  {
    id v6 = @"UserInteractive";
    return (id)[NSString stringWithFormat:@"com.apple.iTunesCloud.ICURLSessionManager.%@.max%lu", v6, a4, v4, v5];
  }
  if (a3 != 25) {
    goto LABEL_12;
  }
  id v6 = @"UserInitiated";
  return (id)[NSString stringWithFormat:@"com.apple.iTunesCloud.ICURLSessionManager.%@.max%lu", v6, a4, v4, v5];
}

void __59__ICURLSessionManager_sessionWithIdentifier_creationBlock___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[7] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!v2)
  {
    uint64_t v5 = (*(void (**)(void))(a1[6] + 16))();
    uint64_t v6 = *(void *)(a1[7] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = a1[5];
    id v9 = *(void **)(a1[4] + 16);
    uint64_t v10 = *(void *)(*(void *)(a1[7] + 8) + 40);
    [v9 setObject:v10 forKey:v8];
  }
}

ICURLSession *__81__ICURLSessionManager__defaultSessionWithQualityOfService_maxConcurrentRequests___block_invoke(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F18DD0], "ic_defaultSessionConfiguration");
  uint64_t v3 = a1[6];
  if (v3 == 33 || v3 == 25)
  {
    uint64_t v5 = +[ICDeviceInfo currentDeviceInfo];
    int v6 = [v5 isWatch];

    if (v6)
    {
      objc_msgSend(v2, "set_requiresSustainedDataDelivery:", 1);
      objc_msgSend(v2, "set_ignoreDidReceiveResponseDisposition:", 1);
    }
    id v7 = +[ICDeviceInfo currentDeviceInfo];
    if ([v7 hasCellularDataCapability])
    {
      uint64_t v8 = +[ICDefaults standardDefaults];
      int v9 = [v8 enableMultipathTCP];

      if (!v9) {
        goto LABEL_13;
      }
      [v2 setMultipathServiceType:2];
      id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = a1[4];
        uint64_t v11 = a1[5];
        int v14 = 138543618;
        uint64_t v15 = v10;
        __int16 v16 = 2114;
        uint64_t v17 = v11;
        _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ enabled multipath service type NSURLSessionMultipathServiceTypeInteractive for session %{public}@", (uint8_t *)&v14, 0x16u);
      }
    }
  }
LABEL_13:
  id v12 = [[ICURLSession alloc] initWithConfiguration:v2 maxConcurrentRequests:a1[7] qualityOfService:a1[6]];

  return v12;
}

uint64_t __43__ICURLSessionManager_sharedSessionManager__block_invoke()
{
  sharedSessionManager_sSharedSessionManager = objc_alloc_init(ICURLSessionManager);

  return MEMORY[0x1F41817F8]();
}

- (ICURLSessionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICURLSessionManager;
  uint64_t v2 = [(ICURLSessionManager *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesCloud.ICURLSessionManager.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    cachedSessions = v2->_cachedSessions;
    v2->_cachedSessions = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSessions, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)addSession:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__ICURLSessionManager_addSession_withIdentifier___block_invoke;
  block[3] = &unk_1E5ACD5C8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(accessQueue, block);
}

uint64_t __49__ICURLSessionManager_addSession_withIdentifier___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) setObject:a1[5] forKey:a1[6]];
}

- (id)sessionWithIdentifier:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__ICURLSessionManager_sessionWithIdentifier_configuration___block_invoke;
  v10[3] = &unk_1E5AC7510;
  id v11 = v6;
  id v7 = v6;
  objc_super v8 = [(ICURLSessionManager *)self sessionWithIdentifier:a3 creationBlock:v10];

  return v8;
}

ICURLSession *__59__ICURLSessionManager_sessionWithIdentifier_configuration___block_invoke(uint64_t a1)
{
  v1 = [[ICURLSession alloc] initWithConfiguration:*(void *)(a1 + 32)];

  return v1;
}

- (id)sessionWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__3856;
  __int16 v16 = __Block_byref_object_dispose__3857;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ICURLSessionManager_sessionWithIdentifier___block_invoke;
  block[3] = &unk_1E5ACCC88;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __45__ICURLSessionManager_sessionWithIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)removeSessionWithIdentifier:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__ICURLSessionManager_removeSessionWithIdentifier___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

uint64_t __51__ICURLSessionManager_removeSessionWithIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)sessionWithQualityOfService:(int64_t)a3
{
  unint64_t v5 = +[ICURLSession defaultMaximumConcurrentRequests];

  return [(ICURLSessionManager *)self _defaultSessionWithQualityOfService:a3 maxConcurrentRequests:v5];
}

+ (ICURLSession)highPrioritySession
{
  uint64_t v2 = +[ICURLSessionManager sharedSessionManager];
  uint64_t v3 = objc_msgSend(v2, "_defaultSessionWithQualityOfService:maxConcurrentRequests:", 33, +[ICURLSession defaultMaximumConcurrentRequests](ICURLSession, "defaultMaximumConcurrentRequests"));

  return (ICURLSession *)v3;
}

+ (ICURLSession)defaultSession
{
  uint64_t v2 = +[ICURLSessionManager sharedSessionManager];
  uint64_t v3 = objc_msgSend(v2, "_defaultSessionWithQualityOfService:maxConcurrentRequests:", -1, +[ICURLSession defaultMaximumConcurrentRequests](ICURLSession, "defaultMaximumConcurrentRequests"));

  return (ICURLSession *)v3;
}

@end