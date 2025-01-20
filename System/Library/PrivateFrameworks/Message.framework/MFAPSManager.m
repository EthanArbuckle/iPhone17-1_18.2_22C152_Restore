@interface MFAPSManager
+ (Class)APSConnection;
+ (id)apsEnvironment;
+ (id)sharedManager;
- (MFAPSManager)init;
- (id)copyDeviceToken;
- (id)copyDiagnosticInformation;
- (id)enabledTopicsWithTopics:(id)a3;
- (void)_startAPS_nts;
- (void)_stopAPS_nts;
- (void)connect;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)setLaunchMachServiceName:(id)a3;
- (void)startWatchingForTopic:(id)a3;
- (void)stopWatchingForTopic:(id)a3;
- (void)swapTopic:(id)a3 forNewTopic:(id)a4;
@end

@implementation MFAPSManager

+ (id)sharedManager
{
  v2 = MFUserAgent();
  char v3 = [v2 canRegisterForAPSPush];

  if (v3)
  {
    if (sharedManager_onceToken != -1) {
      dispatch_once(&sharedManager_onceToken, &__block_literal_global_22);
    }
    id v4 = (id)sharedManager___sharedInstance;
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

void __29__MFAPSManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(MFAPSManager);
  v1 = (void *)sharedManager___sharedInstance;
  sharedManager___sharedInstance = (uint64_t)v0;
}

- (MFAPSManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)MFAPSManager;
  v2 = [(MFAPSManager *)&v16 init];
  if (v2)
  {
    char v3 = MFUserAgent();
    if ([v3 isMaild]) {
      id v4 = @"com.apple.email.maild.aps";
    }
    else {
      id v4 = 0;
    }
    objc_storeStrong((id *)&v2->_launchMachServiceName, v4);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.message.apsManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    watchedTopics = v2->_watchedTopics;
    v2->_watchedTopics = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    unwatchedTopics = v2->_unwatchedTopics;
    v2->_unwatchedTopics = v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F734B0]) initWithCondition:0];
    deviceTokenLock = v2->_deviceTokenLock;
    v2->_deviceTokenLock = (NSConditionLock *)v11;

    v13 = [MEMORY[0x1E4F734D0] sharedController];
    [v13 addDiagnosticsGenerator:v2];

    v14 = v2;
  }

  return v2;
}

- (void)setLaunchMachServiceName:(id)a3
{
  id v6 = a3;
  id v4 = (NSString *)[v6 copy];
  launchMachServiceName = self->_launchMachServiceName;
  self->_launchMachServiceName = v4;
}

+ (Class)APSConnection
{
  if (APSConnection_onceToken != -1) {
    dispatch_once(&APSConnection_onceToken, &__block_literal_global_38);
  }
  v2 = (void *)APSConnection_klass;
  return (Class)v2;
}

void __29__MFAPSManager_APSConnection__block_invoke()
{
  v0 = [(id)GSSystemRootDirectory() stringByAppendingPathComponent:@"System/Library/PrivateFrameworks/ApplePushService.framework"];
  v1 = [MEMORY[0x1E4F28B50] bundleWithPath:v0];
  v2 = v1;
  if (v1)
  {
    APSConnection_klass = [v1 classNamed:@"APSConnection"];
  }
  else
  {
    char v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __29__MFAPSManager_APSConnection__block_invoke_cold_1((uint64_t)v0, v3);
    }
  }
}

+ (id)apsEnvironment
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  int v3 = [v2 BOOLForKey:@"MFUseAPSDevelopmentEnvironment"];

  if (v3) {
    return @"development";
  }
  else {
    return @"production";
  }
}

- (void)_startAPS_nts
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "#aps-push A launchd mach service name is required but none was provided, pushes will not work - this will turn into an assert in the future", v1, 2u);
}

- (void)_stopAPS_nts
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  pushService = self->_pushService;
  self->_pushService = 0;

  id v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)dispatch_queue_t v5 = 0;
    _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_INFO, "#aps-push Stopped MFAPSManager.", v5, 2u);
  }
}

- (void)startWatchingForTopic:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MFAPSManager_startWatchingForTopic___block_invoke;
  v7[3] = &unk_1E5D3B6E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __38__MFAPSManager_startWatchingForTopic___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  if (!v2[2]) {
    objc_msgSend(v2, "_startAPS_nts");
  }
  int v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v10 = 138412290;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_INFO, "#aps-push Start watching topic '%@'", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 16);
  v7 = [*(id *)(v5 + 24) allObjects];
  id v8 = [(id)v5 enabledTopicsWithTopics:v7];
  v9 = [*(id *)(*(void *)(a1 + 32) + 32) allObjects];
  [v6 setEnabledTopics:v8 ignoredTopics:v9];
}

- (void)stopWatchingForTopic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__MFAPSManager_stopWatchingForTopic___block_invoke;
    v7[3] = &unk_1E5D3B6E0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __37__MFAPSManager_stopWatchingForTopic___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) countForObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
  if (v2 == 1)
  {
    int v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v10 = 138412290;
      uint64_t v11 = v4;
      _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_INFO, "#aps-push Stop watching topic '%@'", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 16);
  v7 = [*(id *)(v5 + 24) allObjects];
  id v8 = [(id)v5 enabledTopicsWithTopics:v7];
  v9 = [*(id *)(*(void *)(a1 + 32) + 32) allObjects];
  [v6 setEnabledTopics:v8 ignoredTopics:v9];
}

- (id)enabledTopicsWithTopics:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F60AD0] cloudKitAPSTopics];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count") + objc_msgSend(v4, "count"));
  [v5 addObjectsFromArray:v3];
  [v5 addObjectsFromArray:v4];

  return v5;
}

- (void)swapTopic:(id)a3 forNewTopic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MFAPSManager_swapTopic_forNewTopic___block_invoke;
  block[3] = &unk_1E5D3D2D8;
  id v12 = v6;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __38__MFAPSManager_swapTopic_forNewTopic___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MFLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v11 = 138412546;
    uint64_t v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1A7EFF000, v2, OS_LOG_TYPE_INFO, "#aps-push Swapping registered topic '%@' for topic '%@'", (uint8_t *)&v11, 0x16u);
  }

  int v5 = [*(id *)(a1[6] + 24) containsObject:a1[4]];
  if (v5)
  {
    [*(id *)(a1[6] + 24) removeObject:a1[4]];
    [*(id *)(a1[6] + 24) addObject:a1[5]];
  }
  if ([*(id *)(a1[6] + 32) containsObject:a1[4]])
  {
    [*(id *)(a1[6] + 32) removeObject:a1[4]];
    [*(id *)(a1[6] + 32) addObject:a1[5]];
  }
  else if (!v5)
  {
    return;
  }
  uint64_t v6 = a1[6];
  id v7 = *(void **)(v6 + 16);
  id v8 = [*(id *)(v6 + 24) allObjects];
  id v9 = [(id)v6 enabledTopicsWithTopics:v8];
  id v10 = [*(id *)(a1[6] + 32) allObjects];
  [v7 setEnabledTopics:v9 ignoredTopics:v10];
}

- (void)connect
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__MFAPSManager_connect__block_invoke;
  block[3] = &unk_1E5D3B5C0;
  void block[4] = self;
  dispatch_async(queue, block);
}

void *__23__MFAPSManager_connect__block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[2]) {
    return objc_msgSend(result, "_startAPS_nts");
  }
  return result;
}

- (id)copyDeviceToken
{
  if (!self->_pushService)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__MFAPSManager_copyDeviceToken__block_invoke;
    block[3] = &unk_1E5D3B5C0;
    void block[4] = self;
    dispatch_sync(queue, block);
  }
  deviceTokenLock = self->_deviceTokenLock;
  int v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:5.0];
  BOOL v6 = [(NSConditionLock *)deviceTokenLock lockWhenCondition:1 beforeDate:v5];

  if (!v6) {
    return 0;
  }
  id v7 = self->_deviceToken;
  [(NSConditionLock *)self->_deviceTokenLock unlock];
  return v7;
}

uint64_t __31__MFAPSManager_copyDeviceToken__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startAPS_nts");
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (NSData *)a4;
  if (v7
    && [(NSCountedSet *)self->_watchedTopics containsObject:@"com.apple.mobilemail.dummyTopicToForceServerConnection"])
  {
    [(MFAPSManager *)self stopWatchingForTopic:@"com.apple.mobilemail.dummyTopicToForceServerConnection"];
  }
  id v8 = MFLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [(NSData *)v7 ef_hexString];
    int v10 = 138412290;
    int v11 = v9;
    _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_INFO, "#aps-push Received public token '%@'.", (uint8_t *)&v10, 0xCu);
  }
  [(NSConditionLock *)self->_deviceTokenLock lock];
  if (self->_deviceToken == v7)
  {
    [(NSConditionLock *)self->_deviceTokenLock unlock];
  }
  else
  {
    objc_storeStrong((id *)&self->_deviceToken, a4);
    [(NSConditionLock *)self->_deviceTokenLock unlockWithCondition:self->_deviceToken != 0];
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_60_0);
  }
}

void __49__MFAPSManager_connection_didReceivePublicToken___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"MFAPSManagerDeviceTokenChangedNote" object:0];
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  int v5 = [v4 topic];
  id v6 = [v4 userInfo];
  uint64_t v7 = [v4 wasFromStorage];
  id v8 = MFLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412546;
    objc_super v16 = v5;
    __int16 v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_INFO, "#aps-push received notification on topic '%@', userInfo=%@", (uint8_t *)&v15, 0x16u);
  }

  if (([v5 hasPrefix:@"com.apple.mobilemail.push."] & 1) != 0
    || [v5 hasPrefix:@"com.apple.mail."])
  {
    id v9 = [v6 objectForKey:@"aps"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_15:

      goto LABEL_16;
    }
    int v10 = [v9 objectForKey:@"account-id"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = +[MailAccount accountWithUniqueId:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [v9 objectForKey:@"m"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          uint64_t v12 = 0;
        }
        [v11 handlePushNotificationOnMailboxes:v12 missedNotifications:v7];
      }
    }
LABEL_14:

    goto LABEL_15;
  }
  __int16 v13 = [MEMORY[0x1E4F60AD0] cloudKitAPSTopics];
  int v14 = [v13 containsObject:v5];

  if (v14)
  {
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    int v10 = [v4 userInfo];
    [v9 postNotificationName:*MEMORY[0x1E4F60950] object:0 userInfo:v10];
    goto LABEL_14;
  }
LABEL_16:
}

- (id)copyDiagnosticInformation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__MFAPSManager_copyDiagnosticInformation__block_invoke;
  v9[3] = &unk_1E5D3B6E0;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(queue, v9);
  id v6 = v10;
  id v7 = v5;

  return v7;
}

void __41__MFAPSManager_copyDiagnosticInformation__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) lock];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) condition];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "ef_hexString");
  int v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 40) unlock];
  [*(id *)(a1 + 40) appendString:@"\n==== MFAPSManager ====\n"];
  [*(id *)(a1 + 40) appendFormat:@"  push service: %@\n", *(void *)(*(void *)(a1 + 32) + 16)];
  id v3 = *(void **)(a1 + 40);
  id v4 = [*(id *)(*(void *)(a1 + 32) + 24) allObjects];
  id v5 = [v4 componentsJoinedByString:@", "];
  [v3 appendFormat:@"  watched topics: {%@}\n", v5];

  id v6 = *(void **)(a1 + 40);
  id v7 = [*(id *)(*(void *)(a1 + 32) + 32) allObjects];
  id v8 = [v7 componentsJoinedByString:@", "];
  [v6 appendFormat:@"  ignored topics: {%@}\n", v8];

  if (v2)
  {
    if (v2 != 1) {
      __assert_rtn("_tokenConditionString", "MFAPSManager.m", 322, "0 && \"unknown token condition\"");
    }
    id v9 = @"has token";
  }
  else
  {
    id v9 = @"waiting for token";
  }
  id v10 = @"<unknown>";
  if (v11) {
    id v10 = v11;
  }
  [*(id *)(a1 + 40) appendFormat:@"  device token (%@): '%@'\n", v9, v10];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchMachServiceName, 0);
  objc_storeStrong((id *)&self->_deviceToken, 0);
  objc_storeStrong((id *)&self->_deviceTokenLock, 0);
  objc_storeStrong((id *)&self->_unwatchedTopics, 0);
  objc_storeStrong((id *)&self->_watchedTopics, 0);
  objc_storeStrong((id *)&self->_pushService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __29__MFAPSManager_APSConnection__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "#aps-push Unable to open ApplePushService at %@", (uint8_t *)&v2, 0xCu);
}

@end