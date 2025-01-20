@interface WAClient
+ (id)sharedClient;
+ (id)sharedClientWithIdentifier:(id)a3;
- (NSDictionary)deviceAnalyticsConfig;
- (NSMutableArray)queuedInvocations;
- (NSMutableDictionary)configuredMessageIdentifiers;
- (NSMutableDictionary)interestedMessageIdentifiers;
- (NSMutableSet)registeredGroupTypes;
- (NSString)identifierForThisClient;
- (NSString)tokenForThisClient;
- (NSURL)wifianalyticsTmpDir;
- (NSXPCConnection)conn;
- (OS_dispatch_queue)fileHandlingQueue;
- (OS_dispatch_queue)propertyQueue;
- (OS_dispatch_queue)queryableQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)replyQueue;
- (WAClient)init;
- (double)allowPurgeJSONFilesAfterSec;
- (double)connectionRecoveryStartTime;
- (id)_getConnectionIssueHandlerBlock;
- (id)_initPrivate;
- (id)recoveryTickBlock;
- (int64_t)_processWAMessageForJSONDump:(id)a3;
- (int64_t)_writeWiFiAnalyticsMessageToJSONFile:(id)a3 metricInfo:(id)a4;
- (unsigned)blockDaemonConnection;
- (unsigned)daemonConnectionValid;
- (void)_clearMessageStoreAndReply:(id)a3 queuedInvocation:(id)a4;
- (void)_connectionRecovered;
- (void)_connectionRecoveryTick;
- (void)_connectionTimedOut;
- (void)_dequeueInvocation:(id)a3;
- (void)_establishDaemonConnection;
- (void)_getDeviceAnalyticsConfigurationAndReply:(id)a3 queuedInvocation:(id)a4;
- (void)_getDpsStatsandReply:(id)a3 queuedInvocation:(id)a4;
- (void)_getMessagesModelForGroupType:(int64_t)a3 andReply:(id)a4 queuedInvocation:(id)a5;
- (void)_getNewMessageForKey:(id)a3 groupType:(int64_t)a4 withCopy:(id)a5 andReply:(id)a6 queuedInvocation:(id)a7;
- (void)_getUsageStatsandReply:(id)a3 queuedInvocation:(id)a4;
- (void)_issueIOReportManagementCommand:(unint64_t)a3 andReply:(id)a4 queuedInvocation:(id)a5;
- (void)_killDaemonAndReply:(id)a3 queuedInvocation:(id)a4;
- (void)_lqmCrashTracerNotifyForInterfaceWithName:(id)a3 andReply:(id)a4 queuedInvocation:(id)a5;
- (void)_lqmCrashTracerReceiveBlock:(id)a3 forInterfaceWithName:(id)a4 andReply:(id)a5 queuedInvocation:(id)a6;
- (void)_processWAMessageForCoreAnalytics:(id)a3;
- (void)_registerMessageGroup:(int64_t)a3 andReply:(id)a4 queuedInvocation:(id)a5;
- (void)_removeAllQueuedInvocations;
- (void)_replyAllWithTimeoutErrorAndRemove;
- (void)_reregister;
- (void)_sendMemoryPressureRequestAndReply:(id)a3 queuedInvocation:(id)a4;
- (void)_setDeviceAnalyticsConfiguration:(id)a3 andReply:(id)a4 queuedInvocation:(id)a5;
- (void)_startConnectionRecovery;
- (void)_submitMessage:(id)a3 groupType:(int64_t)a4 andReply:(id)a5 queuedInvocation:(id)a6;
- (void)_submitWiFiAnalyticsMessageAdvanced:(id)a3 andReply:(id)a4 queuedInvocation:(id)a5;
- (void)_trapCrashMiniTracerDumpReadyForInterfaceWithName:(id)a3 andReply:(id)a4 queuedInvocation:(id)a5;
- (void)_triggerDatapathDiagnosticsAndCollectUpdates:(int64_t)a3 waMessage:(id)a4 andReply:(id)a5 queuedInvocation:(id)a6;
- (void)_triggerDeviceAnalyticsStoreMigrationAndReply:(id)a3 queuedInvocation:(id)a4;
- (void)_triggerQueryForNWActivity:(int64_t)a3 andReply:(id)a4 queuedInvocation:(id)a5;
- (void)_wakeUpNotificationForThisClientReceived:(id)a3;
- (void)clearMessageStoreAndReply:(id)a3;
- (void)convertWiFiStatsIntoPercentile:(id)a3 analysisGroup:(int64_t)a4 groupTarget:(id)a5 andReply:(id)a6;
- (void)convertWiFiStatsIntoPercentile:(id)a3 analysisGroup:(int64_t)a4 groupTarget:(id)a5 andReply:(id)a6 queuedInvocation:(id)a7;
- (void)dealloc;
- (void)fakeDaemonConnectionDead:(unsigned __int8)a3;
- (void)getDeviceAnalyticsConfigurationAndReply:(id)a3;
- (void)getDpsStatsandReply:(id)a3;
- (void)getMessagesModelForGroupType:(int64_t)a3 andReply:(id)a4;
- (void)getNewMessageForKey:(id)a3 groupType:(int64_t)a4 andReply:(id)a5;
- (void)getNewMessageForKey:(id)a3 groupType:(int64_t)a4 withCopy:(id)a5 andReply:(id)a6;
- (void)getUsageStatsandReply:(id)a3;
- (void)issueIOReportManagementCommand:(unint64_t)a3 andReply:(id)a4;
- (void)killDaemonAndReply:(id)a3;
- (void)lqmCrashTracerNotifyForInterfaceWithName:(id)a3 andReply:(id)a4;
- (void)lqmCrashTracerReceiveBlock:(id)a3 forInterfaceWithName:(id)a4 andReply:(id)a5;
- (void)registerMessageGroup:(int64_t)a3 andReply:(id)a4;
- (void)sendMemoryPressureRequestAndReply:(id)a3;
- (void)setAllowPurgeJSONFilesAfterSec:(double)a3;
- (void)setBlockDaemonConnection:(unsigned __int8)a3;
- (void)setConfiguredMessageIdentifiers:(id)a3;
- (void)setConn:(id)a3;
- (void)setConnectionRecoveryStartTime:(double)a3;
- (void)setDaemonConnectionValid:(unsigned __int8)a3;
- (void)setDeviceAnalyticsConfig:(id)a3;
- (void)setDeviceAnalyticsConfiguration:(id)a3 andReply:(id)a4;
- (void)setFileHandlingQueue:(id)a3;
- (void)setIdentifierForThisClient:(id)a3;
- (void)setInterestedMessageIdentifiers:(id)a3;
- (void)setPropertyQueue:(id)a3;
- (void)setQueryableQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setQueuedInvocations:(id)a3;
- (void)setRecoveryTickBlock:(id)a3;
- (void)setRegisteredGroupTypes:(id)a3;
- (void)setReplyQueue:(id)a3;
- (void)setTokenForThisClient:(id)a3;
- (void)setWifianalyticsTmpDir:(id)a3;
- (void)submitMessage:(id)a3 groupType:(int64_t)a4 andReply:(id)a5;
- (void)submitWiFiAnalyticsMessageAdvanced:(id)a3;
- (void)summarizeDeviceAnalyticsForNetwork:(id)a3 maxAgeInDays:(unint64_t)a4 andReply:(id)a5;
- (void)summarizeDeviceAnalyticsForNetwork:(id)a3 maxAgeInDays:(unint64_t)a4 andReply:(id)a5 queuedInvocation:(id)a6;
- (void)trapCrashMiniTracerDumpReadyForInterfaceWithName:(id)a3 andReply:(id)a4;
- (void)triggerDatapathDiagnosticsAndCollectUpdates:(int64_t)a3 waMessage:(id)a4 andReply:(id)a5;
- (void)triggerDeviceAnalyticsStoreMigrationAndReply:(id)a3;
- (void)triggerQueryForNWActivity:(int64_t)a3 andReply:(id)a4;
@end

@implementation WAClient

- (void)_wakeUpNotificationForThisClientReceived:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(WAClient *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__WAClient__wakeUpNotificationForThisClientReceived___block_invoke;
  v6[3] = &unk_264467380;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __53__WAClient__wakeUpNotificationForThisClientReceived___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = [WeakRetained daemonConnectionValid];
  v5 = WALogCategoryDefaultHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v7 = 136446466;
      v8 = "-[WAClient _wakeUpNotificationForThisClientReceived:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 1171;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:XPC: Received 'wake up' notification, but this client has no indication the connection is dead (daemonConnectionValid == true). Not starting connection recovery", (uint8_t *)&v7, 0x12u);
    }
  }
  else
  {
    if (v6)
    {
      int v7 = 136446466;
      v8 = "-[WAClient _wakeUpNotificationForThisClientReceived:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 1168;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:XPC: Received 'wake up' notification, establishing a connection to the daemon now...", (uint8_t *)&v7, 0x12u);
    }

    [WeakRetained _startConnectionRecovery];
  }
}

- (unsigned)daemonConnectionValid
{
  return self->_daemonConnectionValid;
}

+ (id)sharedClient
{
  return +[WAClient sharedClientWithIdentifier:0];
}

+ (id)sharedClientWithIdentifier:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__WAClient_sharedClientWithIdentifier___block_invoke;
  block[3] = &unk_264466048;
  id v9 = v3;
  uint64_t v4 = qword_26AA93CF0;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_26AA93CF0, block);
  }
  id v6 = (id)_MergedGlobals_3;

  return v6;
}

void __39__WAClient_sharedClientWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v1 = *(id *)(a1 + 32);
  v2 = +[WAUtil getValueForEntitlementForCurrentProcess:@"keychain-access-groups"];
  if (![v2 count])
  {
    int v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446466;
      v14 = "+[WAClient sharedClientWithIdentifier:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 111;
      v8 = "%{public}s::%d:XPC: no keychain-access-groups entries for this client";
      id v9 = v7;
      uint32_t v10 = 18;
LABEL_15:
      _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v13, v10);
    }
LABEL_16:

    goto LABEL_6;
  }
  if (([v2 containsObject:@"wifianalyticsd"] & 1) == 0)
  {
    int v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446722;
      v14 = "+[WAClient sharedClientWithIdentifier:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 112;
      __int16 v17 = 2112;
      v18 = @"wifianalyticsd";
      v8 = "%{public}s::%d:XPC: keychain-access-groups entries do NOT contain %@ for this client. WiFiAnalytics will be u"
           "nusable until the required entitlement is added";
      id v9 = v7;
      uint32_t v10 = 28;
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (v1
    || ([MEMORY[0x263F086E0] mainBundle],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 bundleIdentifier],
        v1 = objc_claimAutoreleasedReturnValue(),
        v3,
        v1))
  {
    id v4 = [[WAClient alloc] _initPrivate];
    id v5 = (void *)_MergedGlobals_3;
    _MergedGlobals_3 = (uint64_t)v4;

    [(id)_MergedGlobals_3 setIdentifierForThisClient:v1];
  }
  else
  {
    v1 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [MEMORY[0x263F086E0] mainBundle];
      v12 = [v11 infoDictionary];
      int v13 = 136446722;
      v14 = "+[WAClient sharedClientWithIdentifier:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 115;
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_21D96D000, v1, OS_LOG_TYPE_ERROR, "%{public}s::%d:Couldn't determine an identify for this client, so access token can't be stored. WiFiAnalytics is disabled. :%@", (uint8_t *)&v13, 0x1Cu);
    }
  }
LABEL_6:

  if (!_MergedGlobals_3)
  {
    id v6 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446466;
      v14 = "+[WAClient sharedClientWithIdentifier:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 120;
      _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to get WAClient sharedClient instance. Check for logged errors above this one", (uint8_t *)&v13, 0x12u);
    }
  }
}

- (WAClient)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"-[WAClient init] unavailable" userInfo:0];
  objc_exception_throw(v2);
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WAClient;
  [(WAClient *)&v4 dealloc];
}

- (void)registerMessageGroup:(int64_t)a3 andReply:(id)a4
{
}

- (void)_registerMessageGroup:(int64_t)a3 andReply:(id)a4 queuedInvocation:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  uint64_t v11 = [(WAClient *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__WAClient__registerMessageGroup_andReply_queuedInvocation___block_invoke;
  block[3] = &unk_264467240;
  objc_copyWeak(v18, &location);
  v18[1] = (id)a3;
  v18[2] = (id)a2;
  id v15 = v10;
  int v16 = self;
  id v17 = v9;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(v11, block);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

void __60__WAClient__registerMessageGroup_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_super v4 = [WeakRetained registeredGroupTypes];
  id v5 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
  [v4 addObject:v5];

  id v6 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!v6)
  {
    id v6 = objc_alloc_init(WAQueuedInvocation);
    int v7 = [[InvokeMakerInfo alloc] initWithSel:*(void *)(a1 + 72) andTarget:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(a1 + 64);
    id v9 = (void *)MEMORY[0x223C0F530](*(void *)(a1 + 48));
    id v10 = +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v7, v8, v9, v6, 0);

    [(WAQueuedInvocation *)v6 setInvocation:v10];
    [(WAQueuedInvocation *)v6 setReply:*(void *)(a1 + 48)];
    uint64_t v11 = [WeakRetained queuedInvocations];
    [v11 addObject:v6];
  }
  if ([WeakRetained daemonConnectionValid])
  {
    id v12 = [WeakRetained conn];
    id v13 = [v12 remoteObjectProxyWithErrorHandler:&__block_literal_global_3];
    uint64_t v14 = *(void *)(a1 + 64);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __60__WAClient__registerMessageGroup_andReply_queuedInvocation___block_invoke_86;
    v17[3] = &unk_264467218;
    uint64_t v19 = v14;
    v18 = v6;
    [v13 registerMessageGroup:v14 andReply:v17];

    id v15 = (void (**)(void))v18;
  }
  else
  {
    int v16 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v21 = "-[WAClient _registerMessageGroup:andReply:queuedInvocation:]_block_invoke";
      __int16 v22 = 1024;
      int v23 = 162;
      _os_log_impl(&dword_21D96D000, v16, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    id v15 = [WeakRetained _getConnectionIssueHandlerBlock];
    v15[2]();
  }
}

void __60__WAClient__registerMessageGroup_andReply_queuedInvocation___block_invoke_84(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446722;
    id v5 = "-[WAClient _registerMessageGroup:andReply:queuedInvocation:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 166;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - registerMessageGroup - error: %@", (uint8_t *)&v4, 0x1Cu);
  }
}

void __60__WAClient__registerMessageGroup_andReply_queuedInvocation___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    __int16 v8 = +[WAUtil groupTypeToString:*(void *)(a1 + 40)];
    *(_DWORD *)buf = 136446722;
    v18 = "-[WAClient _registerMessageGroup:andReply:queuedInvocation:]_block_invoke";
    __int16 v19 = 1024;
    int v20 = 169;
    __int16 v21 = 2112;
    __int16 v22 = v8;
    _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_INFO, "%{public}s::%d:XPC: WAClient - registerMessageGroup - %@ - DONE", buf, 0x1Cu);
  }
  id v9 = +[WAClient sharedClient];
  uint64_t v10 = [v9 replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__WAClient__registerMessageGroup_andReply_queuedInvocation___block_invoke_87;
  block[3] = &unk_2644671F0;
  id v14 = *(id *)(a1 + 32);
  id v15 = v5;
  id v16 = v6;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v10, block);
}

void __60__WAClient__registerMessageGroup_andReply_queuedInvocation___block_invoke_87(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = [*(id *)(a1 + 32) reply];

  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) reply];
    v4[2](v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  id v5 = +[WAClient sharedClient];
  [v5 _dequeueInvocation:*(void *)(a1 + 32)];
}

- (void)getNewMessageForKey:(id)a3 groupType:(int64_t)a4 andReply:(id)a5
{
  __int16 v8 = NSNumber;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 numberWithBool:0];
  [(WAClient *)self _getNewMessageForKey:v10 groupType:a4 withCopy:v11 andReply:v9 queuedInvocation:0];
}

- (void)getNewMessageForKey:(id)a3 groupType:(int64_t)a4 withCopy:(id)a5 andReply:(id)a6
{
}

- (void)_getNewMessageForKey:(id)a3 groupType:(int64_t)a4 withCopy:(id)a5 andReply:(id)a6 queuedInvocation:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  objc_initWeak(&location, self);
  id v17 = [(WAClient *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__WAClient__getNewMessageForKey_groupType_withCopy_andReply_queuedInvocation___block_invoke;
  block[3] = &unk_264467290;
  objc_copyWeak(v28, &location);
  id v23 = v16;
  uint64_t v24 = self;
  v28[1] = (id)a2;
  v28[2] = (id)a4;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v16;
  dispatch_async(v17, block);

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
}

void __78__WAClient__getNewMessageForKey_groupType_withCopy_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  int v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!v4)
  {
    int v4 = objc_alloc_init(WAQueuedInvocation);
    id v5 = [[InvokeMakerInfo alloc] initWithSel:*(void *)(a1 + 80) andTarget:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(a1 + 88);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    id v9 = (void *)MEMORY[0x223C0F530](*(void *)(a1 + 64));
    id v10 = +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v5, v7, v6, v8, v9, v4, 0);

    [(WAQueuedInvocation *)v4 setInvocation:v10];
    [(WAQueuedInvocation *)v4 setReply:*(void *)(a1 + 64)];
    id v11 = [WeakRetained queuedInvocations];
    [v11 addObject:v4];
  }
  if ([WeakRetained daemonConnectionValid])
  {
    id v12 = [WeakRetained conn];
    id v13 = [v12 remoteObjectProxyWithErrorHandler:&__block_literal_global_91];
    uint64_t v14 = *(void *)(a1 + 88);
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 56);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __78__WAClient__getNewMessageForKey_groupType_withCopy_andReply_queuedInvocation___block_invoke_92;
    v19[3] = &unk_264467268;
    id v20 = v4;
    [v13 getNewMessageForKey:v16 groupType:v14 withCopy:v15 andReply:v19];

    id v17 = (void (**)(void))v20;
  }
  else
  {
    id v18 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v22 = "-[WAClient _getNewMessageForKey:groupType:withCopy:andReply:queuedInvocation:]_block_invoke";
      __int16 v23 = 1024;
      int v24 = 209;
      _os_log_impl(&dword_21D96D000, v18, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    id v17 = [WeakRetained _getConnectionIssueHandlerBlock];
    v17[2]();
  }
}

void __78__WAClient__getNewMessageForKey_groupType_withCopy_andReply_queuedInvocation___block_invoke_89(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446722;
    id v5 = "-[WAClient _getNewMessageForKey:groupType:withCopy:andReply:queuedInvocation:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 214;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - getNewMessageForKey - error: %@", (uint8_t *)&v4, 0x1Cu);
  }
}

void __78__WAClient__getNewMessageForKey_groupType_withCopy_andReply_queuedInvocation___block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 code] == 9009)
  {
    int v7 = +[WAClient sharedClient];
    [v7 _reregister];
  }
  __int16 v8 = +[WAClient sharedClient];
  id v9 = [v8 replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__WAClient__getNewMessageForKey_groupType_withCopy_andReply_queuedInvocation___block_invoke_2;
  block[3] = &unk_2644671F0;
  id v13 = *(id *)(a1 + 32);
  id v14 = v5;
  id v15 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, block);
}

void __78__WAClient__getNewMessageForKey_groupType_withCopy_andReply_queuedInvocation___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = [*(id *)(a1 + 32) reply];

  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) reply];
    v4[2](v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  id v5 = +[WAClient sharedClient];
  [v5 _dequeueInvocation:*(void *)(a1 + 32)];
}

- (void)_dequeueInvocation:(id)a3
{
  id v4 = a3;
  id v5 = [(WAClient *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__WAClient__dequeueInvocation___block_invoke;
  block[3] = &unk_264466048;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

void __31__WAClient__dequeueInvocation___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  [*(id *)(a1 + 32) setInvocation:0];
  [*(id *)(a1 + 32) setReply:0];
  id v3 = +[WAClient sharedClient];
  id v4 = [v3 queuedInvocations];
  [v4 removeObject:*(void *)(a1 + 32)];
}

- (void)submitMessage:(id)a3 groupType:(int64_t)a4 andReply:(id)a5
{
}

- (void)_submitMessage:(id)a3 groupType:(int64_t)a4 andReply:(id)a5 queuedInvocation:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  if (v11)
  {
    id v14 = [(WAClient *)self queue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __63__WAClient__submitMessage_groupType_andReply_queuedInvocation___block_invoke;
    v17[3] = &unk_2644672B8;
    objc_copyWeak(v22, &location);
    id v15 = v13;
    v22[1] = (id)a2;
    id v18 = v15;
    id v19 = self;
    id v20 = v11;
    v22[2] = (id)a4;
    id v21 = v12;
    dispatch_async(v14, v17);

    objc_destroyWeak(v22);
  }
  else
  {
    uint64_t v16 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v25 = "-[WAClient _submitMessage:groupType:andReply:queuedInvocation:]";
      __int16 v26 = 1024;
      int v27 = 246;
      _os_log_impl(&dword_21D96D000, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:message argument is null, bailing", buf, 0x12u);
    }
  }
  objc_destroyWeak(&location);
}

void __63__WAClient__submitMessage_groupType_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(void *)(a1 + 32))
  {
    id v5 = objc_alloc_init(WAQueuedInvocation);

    id v6 = [[InvokeMakerInfo alloc] initWithSel:*(void *)(a1 + 72) andTarget:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(a1 + 80);
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = (void *)MEMORY[0x223C0F530](*(void *)(a1 + 56));
    id v10 = +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v8, v7, v9, v5, 0);

    [(WAQueuedInvocation *)v5 setInvocation:v10];
    [(WAQueuedInvocation *)v5 setReply:*(void *)(a1 + 56)];
    id v11 = [WeakRetained queuedInvocations];
    [v11 addObject:v5];

    id v4 = v5;
  }
  if ([WeakRetained daemonConnectionValid])
  {
    id v12 = [WeakRetained conn];
    id v13 = [v12 remoteObjectProxyWithErrorHandler:&__block_literal_global_95];
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 80);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __63__WAClient__submitMessage_groupType_andReply_queuedInvocation___block_invoke_96;
    id v18[3] = &unk_264467268;
    id v19 = v4;
    [v13 submitMessage:v14 groupType:v15 andReply:v18];

    uint64_t v16 = v19;
  }
  else
  {
    id v17 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v21 = "-[WAClient _submitMessage:groupType:andReply:queuedInvocation:]_block_invoke";
      __int16 v22 = 1024;
      int v23 = 261;
      _os_log_impl(&dword_21D96D000, v17, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    uint64_t v16 = [WeakRetained _getConnectionIssueHandlerBlock];
    v16[2]();
  }
}

void __63__WAClient__submitMessage_groupType_andReply_queuedInvocation___block_invoke_93(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446722;
    id v5 = "-[WAClient _submitMessage:groupType:andReply:queuedInvocation:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 267;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - submitMessage - error: %@", (uint8_t *)&v4, 0x1Cu);
  }
}

void __63__WAClient__submitMessage_groupType_andReply_queuedInvocation___block_invoke_96(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 code] == 9009)
  {
    int v7 = +[WAClient sharedClient];
    [v7 _reregister];
  }
  __int16 v8 = +[WAClient sharedClient];
  id v9 = [v8 replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__WAClient__submitMessage_groupType_andReply_queuedInvocation___block_invoke_2;
  block[3] = &unk_2644671F0;
  id v13 = *(id *)(a1 + 32);
  id v14 = v5;
  id v15 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, block);
}

void __63__WAClient__submitMessage_groupType_andReply_queuedInvocation___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = [*(id *)(a1 + 32) reply];

  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) reply];
    v4[2](v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  id v5 = +[WAClient sharedClient];
  [v5 _dequeueInvocation:*(void *)(a1 + 32)];
}

- (int64_t)_writeWiFiAnalyticsMessageToJSONFile:(id)a3 metricInfo:(id)a4
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F08900] isValidJSONObject:v7])
  {
    id v65 = v7;
    v62 = v6;
    id v8 = objc_alloc_init(MEMORY[0x263F08790]);
    [v8 setDateFormat:@"yyyy'-'MM'-'dd-HHmmssSSS"];
    id v9 = [MEMORY[0x263EFF910] date];
    v64 = v8;
    uint64_t v10 = [v8 stringFromDate:v9];

    unint64_t v11 = 0x263F08000uLL;
    v68 = (void *)v10;
    id v12 = [NSString stringWithFormat:@"wifianalytics_%@.json", v10];
    v67 = self;
    id v13 = [(WAClient *)self wifianalyticsTmpDir];
    id v14 = [v13 URLByAppendingPathComponent:v12 isDirectory:0];

    id v15 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v16 = [v14 path];
    v66 = v15;
    int v17 = [v15 fileExistsAtPath:v16];

    if (v17)
    {
      uint64_t v18 = 1;
      do
      {
        id v19 = *(void **)(v11 + 2880);
        unint64_t v20 = v11;
        uint64_t v21 = v18 + 1;
        __int16 v22 = [v19 stringWithFormat:@"wifianalytics_%@_%lu.json", v68, v18];

        int v23 = [(WAClient *)v67 wifianalyticsTmpDir];
        uint64_t v24 = [v23 URLByAppendingPathComponent:v22 isDirectory:0];

        uint64_t v25 = [v24 path];
        char v26 = [v15 fileExistsAtPath:v25];

        id v12 = v22;
        uint64_t v18 = v21;
        unint64_t v11 = v20;
        id v14 = v24;
      }
      while ((v26 & 1) != 0);
    }
    else
    {
      uint64_t v24 = v14;
      __int16 v22 = v12;
    }
    id v74 = 0;
    id v7 = v65;
    uint64_t v27 = [MEMORY[0x263F08900] dataWithJSONObject:v65 options:3 error:&v74];
    id v28 = v74;
    v63 = (void *)v27;
    if (v28)
    {
      id v29 = v28;
      v30 = WALogCategoryDeviceStoreHandle();
      v32 = v15;
      v31 = v67;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v76 = "-[WAClient _writeWiFiAnalyticsMessageToJSONFile:metricInfo:]";
        __int16 v77 = 1024;
        int v78 = 341;
        __int16 v79 = 2112;
        v80 = v22;
        __int16 v81 = 2112;
        id v82 = v29;
        _os_log_impl(&dword_21D96D000, v30, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to write to file %@ error %@", buf, 0x26u);
      }
      id v6 = v62;
    }
    else
    {
      v30 = [objc_alloc(*(Class *)(v11 + 2880)) initWithData:v27 encoding:4];
      id v73 = 0;
      [v30 writeToURL:v24 atomically:1 encoding:4 error:&v73];
      id v29 = v73;
      __uint64_t v33 = clock_gettime_nsec_np(_CLOCK_REALTIME);
      v31 = v67;
      v34 = [(WAClient *)v67 identifierForThisClient];
      int v35 = [v34 isEqualToString:@"xctests"];

      v32 = v66;
      if (v35) {
        __uint64_t v36 = clock_gettime_nsec_np(_CLOCK_REALTIME) + 10000000000;
      }
      else {
        __uint64_t v36 = v33 + 172800000000000;
      }
      long long v69 = xmmword_21DA6C840;
      long long v70 = xmmword_21DA6C850;
      __uint64_t v71 = v36;
      uint64_t v72 = 0;
      id v37 = [v24 path];
      int v38 = fsctl((const char *)[v37 cStringUsingEncoding:4], 0xC0304A6FuLL, &v69, 0);

      v39 = WALogCategoryDeviceStoreHandle();
      v40 = v39;
      if (v38)
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          id v60 = [v24 path];
          uint64_t v41 = [v60 cStringUsingEncoding:4];
          v42 = (void *)v69;
          uint64_t v56 = v41;
          uint64_t v58 = v70;
          v43 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)(v36 / 0x3B9ACA00)];
          v44 = __error();
          v45 = strerror(*v44);
          *(_DWORD *)buf = 136448002;
          v76 = "-[WAClient _writeWiFiAnalyticsMessageToJSONFile:metricInfo:]";
          __int16 v77 = 1024;
          int v78 = 338;
          __int16 v79 = 2080;
          v80 = v56;
          __int16 v81 = 2048;
          id v82 = v42;
          __int16 v83 = 2048;
          uint64_t v84 = v58;
          __int16 v85 = 2112;
          v86 = v43;
          __int16 v87 = 1024;
          int v88 = v38;
          __int16 v89 = 2080;
          v90 = v45;
          _os_log_impl(&dword_21D96D000, v40, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to mark %s as purgeable with flags 0x%llx, supplemental 0x%llx, notBeforeDate:%@: (%d) %s\n", buf, 0x4Au);
        }
      }
      else if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        id v61 = [v24 path];
        uint64_t v46 = [v61 cStringUsingEncoding:4];
        v47 = (void *)v69;
        uint64_t v57 = v46;
        uint64_t v59 = v70;
        v48 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)(v36 / 0x3B9ACA00)];
        *(_DWORD *)buf = 136447490;
        v76 = "-[WAClient _writeWiFiAnalyticsMessageToJSONFile:metricInfo:]";
        __int16 v77 = 1024;
        int v78 = 334;
        __int16 v79 = 2080;
        v80 = v57;
        __int16 v81 = 2048;
        id v82 = v47;
        __int16 v83 = 2048;
        uint64_t v84 = v59;
        __int16 v85 = 2112;
        v86 = v48;
        _os_log_impl(&dword_21D96D000, v40, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Marked %s purgeable with flags 0x%llx (supplemental 0x%llx notBeforeDate:%@)\n", buf, 0x3Au);
      }
      id v6 = v62;
      id v7 = v65;
    }

    v49 = [(WAClient *)v31 wifianalyticsTmpDir];
    v50 = [v49 path];
    v51 = [v32 contentsOfDirectoryAtPath:v50 error:0];

    v52 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF EndsWith '.json'"];
    v53 = [v51 filteredArrayUsingPredicate:v52];

    int64_t v54 = [v53 count];
  }
  else
  {
    __int16 v22 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v76 = "-[WAClient _writeWiFiAnalyticsMessageToJSONFile:metricInfo:]";
      __int16 v77 = 1024;
      int v78 = 300;
      __int16 v79 = 2112;
      v80 = v6;
      _os_log_impl(&dword_21D96D000, v22, OS_LOG_TYPE_ERROR, "%{public}s::%d:Invalid data passed to JSON serialization for %@", buf, 0x1Cu);
    }
    int64_t v54 = -1;
  }

  return v54;
}

- (int64_t)_processWAMessageForJSONDump:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_processWAMessageForJSONDump", "", buf, 2u);
  }

  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  if (!v6)
  {
    int v38 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v55 = "-[WAClient _processWAMessageForJSONDump:]";
      __int16 v56 = 1024;
      *(_DWORD *)uint64_t v57 = 359;
      _os_log_impl(&dword_21D96D000, v38, OS_LOG_TYPE_ERROR, "%{public}s::%d:Null jsonDict", buf, 0x12u);
    }
    int64_t v41 = 0;
LABEL_36:

    goto LABEL_38;
  }
  v45 = self;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v7 = [v4 metricInfo];
  id v8 = [v7 allKeys];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (!v9) {
    goto LABEL_33;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v51;
  uint64_t v46 = v6;
  v47 = v8;
  uint64_t v49 = *(void *)v51;
  do
  {
    uint64_t v12 = 0;
    uint64_t v48 = v10;
    do
    {
      if (*(void *)v51 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v50 + 1) + 8 * v12);
      id v14 = [v4 metricInfo];
      id v15 = [v14 objectForKeyedSubscript:v13];

      uint64_t v16 = [v15 objectForKeyedSubscript:@"options"];
      char v17 = [v16 integerValue];

      if ((v17 & 2) != 0)
      {
        uint64_t v18 = [v15 objectForKeyedSubscript:@"value"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        unint64_t v20 = [v15 objectForKeyedSubscript:@"value"];
        uint64_t v21 = v20;
        if (isKindOfClass)
        {
          id v22 = v20;
          uint64_t v23 = [v22 bytes];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = v4;
            char v26 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", 2 * objc_msgSend(v22, "length"));
            if ([v22 length])
            {
              uint64_t v27 = 0;
              while (1)
              {
                uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"%02lx", *(unsigned __int8 *)(v24 + v27));
                if (!v28) {
                  break;
                }
                id v29 = (void *)v28;
                [v26 appendString:v28];

                if (++v27 >= (unint64_t)[v22 length]) {
                  goto LABEL_16;
                }
              }
              v32 = WALogCategoryDeviceStoreHandle();
              id v4 = v25;
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                __uint64_t v33 = [v25 metricName];
                v34 = [v15 objectForKeyedSubscript:@"value"];
                *(_DWORD *)buf = 136447234;
                v55 = "-[WAClient _processWAMessageForJSONDump:]";
                __int16 v56 = 1024;
                *(_DWORD *)uint64_t v57 = 377;
                *(_WORD *)&v57[4] = 2112;
                *(void *)&v57[6] = v33;
                *(_WORD *)&v57[14] = 2112;
                *(void *)&v57[16] = v13;
                __int16 v58 = 2112;
                uint64_t v59 = v34;
                _os_log_impl(&dword_21D96D000, v32, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to convert to hex %@ field %@ with value %@", buf, 0x30u);
              }
              id v6 = v46;
              uint64_t v10 = v48;
LABEL_25:
              int v35 = WALogCategoryDeviceStoreHandle();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                __uint64_t v36 = [v4 metricName];
                id v37 = [v15 objectForKeyedSubscript:@"value"];
                *(_DWORD *)buf = 136447234;
                v55 = "-[WAClient _processWAMessageForJSONDump:]";
                __int16 v56 = 1024;
                *(_DWORD *)uint64_t v57 = 385;
                *(_WORD *)&v57[4] = 2112;
                *(void *)&v57[6] = v36;
                *(_WORD *)&v57[14] = 2112;
                *(void *)&v57[16] = v13;
                __int16 v58 = 2112;
                uint64_t v59 = v37;
                _os_log_impl(&dword_21D96D000, v35, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to convert %@ field %@ with value %@", buf, 0x30u);

                uint64_t v10 = v48;
              }
            }
            else
            {
LABEL_16:
              id v4 = v25;
              id v6 = v46;
              uint64_t v10 = v48;
              if (!v26) {
                goto LABEL_25;
              }
              [v46 setObject:v26 forKey:v13];
            }
            id v8 = v47;
          }
          else
          {
            char v26 = WALogCategoryDeviceStoreHandle();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              v30 = [v4 metricName];
              v31 = [v15 objectForKeyedSubscript:@"value"];
              *(_DWORD *)buf = 136447234;
              v55 = "-[WAClient _processWAMessageForJSONDump:]";
              __int16 v56 = 1024;
              *(_DWORD *)uint64_t v57 = 388;
              *(_WORD *)&v57[4] = 2112;
              *(void *)&v57[6] = v30;
              *(_WORD *)&v57[14] = 2112;
              *(void *)&v57[16] = v13;
              __int16 v58 = 2112;
              uint64_t v59 = v31;
              _os_log_impl(&dword_21D96D000, v26, OS_LOG_TYPE_ERROR, "%{public}s::%d:Invalid data - %@ field %@ with value %@", buf, 0x30u);

              id v8 = v47;
            }
            uint64_t v10 = v48;
          }
        }
        else
        {
          [v6 setObject:v20 forKey:v13];
        }

        uint64_t v11 = v49;
      }

      ++v12;
    }
    while (v12 != v10);
    uint64_t v10 = [v8 countByEnumeratingWithState:&v50 objects:v60 count:16];
  }
  while (v10);
LABEL_33:

  if ([v6 count])
  {
    int v38 = [MEMORY[0x263EFF9A0] dictionary];
    v39 = [v4 metricName];
    [v38 setValue:v6 forKey:v39];

    v40 = [v4 metricName];
    int64_t v41 = [(WAClient *)v45 _writeWiFiAnalyticsMessageToJSONFile:v40 metricInfo:v38];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      v42 = [v4 metricName];
      *(_DWORD *)buf = 136315650;
      v55 = "-[WAClient _processWAMessageForJSONDump:]";
      __int16 v56 = 2112;
      *(void *)uint64_t v57 = v42;
      *(_WORD *)&v57[8] = 2048;
      *(void *)&v57[10] = v41;
      _os_log_impl(&dword_21D96D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "{ADAPTIVE-ROAM} %s: metric name: %@ (current files on disk:%ld)", buf, 0x20u);
    }
    goto LABEL_36;
  }
  int64_t v41 = 0;
LABEL_38:
  v43 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v43))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v43, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_processWAMessageForJSONDump", "", buf, 2u);
  }

  return v41;
}

- (void)_processWAMessageForCoreAnalytics:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v20 = a3;
  id v3 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_processWAMessageForCoreAnalytics", "", buf, 2u);
  }

  id v19 = [MEMORY[0x263EFF9A0] dictionary];
  if (!v19)
  {
    char v17 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v28 = "-[WAClient _processWAMessageForCoreAnalytics:]";
      __int16 v29 = 1024;
      int v30 = 415;
      __int16 v31 = 2080;
      v32 = "-[WAClient _processWAMessageForCoreAnalytics:]";
      _os_log_impl(&dword_21D96D000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:%s: Null coreAnalyticsDict", buf, 0x1Cu);
    }
    goto LABEL_15;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = [v20 metricInfo];
  id v5 = [v4 allKeys];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v11 = [v20 metricInfo];
        uint64_t v12 = [v11 objectForKeyedSubscript:v10];

        uint64_t v13 = [v12 objectForKeyedSubscript:@"options"];
        char v14 = [v13 integerValue];

        if (v14)
        {
          id v15 = [v12 objectForKeyedSubscript:@"value"];
          [v19 setObject:v15 forKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  if ([v19 count])
  {
    uint64_t v16 = [v20 metricName];
    uint64_t v21 = v19;
    AnalyticsSendEventLazy();

    char v17 = v21;
LABEL_15:
  }
  uint64_t v18 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_processWAMessageForCoreAnalytics", "", buf, 2u);
  }
}

id __46__WAClient__processWAMessageForCoreAnalytics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)submitWiFiAnalyticsMessageAdvanced:(id)a3
{
}

- (void)_submitWiFiAnalyticsMessageAdvanced:(id)a3 andReply:(id)a4 queuedInvocation:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_initWeak(&location, self);
  if (!v9)
  {
    uint64_t v16 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 136446466;
    char v26 = "-[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:]";
    __int16 v27 = 1024;
    int v28 = 446;
    char v17 = "%{public}s::%d:message argument is null, bailing";
    goto LABEL_7;
  }
  uint64_t v12 = [v9 metricName];
  if (!v12
    || ([v9 metricInfo],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        BOOL v14 = v13 == 0,
        v13,
        v12,
        v14))
  {
    uint64_t v16 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 136446466;
    char v26 = "-[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:]";
    __int16 v27 = 1024;
    int v28 = 447;
    char v17 = "%{public}s::%d:NULL metricName or NULL metricInfo";
LABEL_7:
    _os_log_impl(&dword_21D96D000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x12u);
    goto LABEL_8;
  }
  id v15 = [(WAClient *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke;
  block[3] = &unk_264467420;
  id v19 = v9;
  id v20 = self;
  objc_copyWeak(v23, &location);
  id v21 = v11;
  v23[1] = (id)a2;
  id v22 = v10;
  dispatch_async(v15, block);

  objc_destroyWeak(v23);
  uint64_t v16 = v19;
LABEL_8:

  objc_destroyWeak(&location);
}

void __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  if ([*(id *)(a1 + 32) options]) {
    [*(id *)(a1 + 40) _processWAMessageForCoreAnalytics:*(void *)(a1 + 32)];
  }
  if (([*(id *)(a1 + 32) options] & 2) != 0
    && +[WAUtil isWritingWAMessageToJsonAllowed]
    && +[WAUtil isAnalyticsProcessorAllowed])
  {
    id v3 = [*(id *)(a1 + 40) fileHandlingQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke_2;
    block[3] = &unk_2644673D0;
    int8x16_t v19 = *(int8x16_t *)(a1 + 32);
    id v4 = (id)v19.i64[0];
    int8x16_t v23 = vextq_s8(v19, v19, 8uLL);
    objc_copyWeak(&v24, (id *)(a1 + 64));
    dispatch_async(v3, block);

    objc_destroyWeak(&v24);
  }
  if (([*(id *)(a1 + 32) options] & 0x10) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v6 = (WAQueuedInvocation *)*(id *)(a1 + 48);
    if (!*(void *)(a1 + 48))
    {
      uint64_t v7 = objc_alloc_init(WAQueuedInvocation);

      uint64_t v8 = [[InvokeMakerInfo alloc] initWithSel:*(void *)(a1 + 72) andTarget:*(void *)(a1 + 40)];
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = (void *)MEMORY[0x223C0F530](*(void *)(a1 + 56));
      id v11 = +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v8, v9, v10, v7, 0);

      [(WAQueuedInvocation *)v7 setInvocation:v11];
      [(WAQueuedInvocation *)v7 setReply:*(void *)(a1 + 56)];
      uint64_t v12 = [WeakRetained queuedInvocations];
      [v12 addObject:v7];

      uint64_t v6 = v7;
    }
    if ([WeakRetained daemonConnectionValid])
    {
      uint64_t v13 = [WeakRetained conn];
      BOOL v14 = [v13 remoteObjectProxyWithErrorHandler:&__block_literal_global_139];
      uint64_t v15 = *(void *)(a1 + 32);
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke_140;
      v20[3] = &unk_264467268;
      id v21 = v6;
      [v14 submitWiFiAnalyticsMessageAdvanced:v15 andReply:v20];

      uint64_t v16 = v21;
    }
    else
    {
      uint64_t v18 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        char v26 = "-[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:]_block_invoke";
        __int16 v27 = 1024;
        int v28 = 524;
        _os_log_impl(&dword_21D96D000, v18, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
      }

      uint64_t v16 = [WeakRetained _getConnectionIssueHandlerBlock];
      v16[2]();
    }

    char v17 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      char v26 = "-[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:]_block_invoke_3";
      __int16 v27 = 1024;
      int v28 = 543;
      _os_log_impl(&dword_21D96D000, v17, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: WAClient - submitWiFiAnalyticsMessageAdvanced - done", buf, 0x12u);
    }
  }
}

void __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke_2(id *a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  uint64_t v3 = [a1[4] _processWAMessageForJSONDump:a1[5]];
  id v4 = [a1[5] metricInfo];
  id v5 = [v4 objectForKeyedSubscript:@"metricProcessImmediately"];

  if (v5)
  {
    uint64_t v6 = [v5 objectForKeyedSubscript:@"value"];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      uint64_t v8 = [v5 objectForKeyedSubscript:@"value"];
      char v9 = [v8 BOOLValue];

      if (v9) {
        goto LABEL_9;
      }
    }
  }
  if (+[WAUtil shouldProcessAnalyticsImmediately] || v3 > 49) {
    goto LABEL_8;
  }
  id v10 = [a1[4] deviceAnalyticsConfig];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"WA_DEVICE_ANALYTICS_PROCESSING_INTERVAL"];
  if (!v11)
  {
    int v21 = 0;
    goto LABEL_14;
  }
  uint64_t v12 = (void *)v11;
  uint64_t v13 = [a1[4] deviceAnalyticsConfig];
  BOOL v14 = [v13 objectForKeyedSubscript:@"WA_DEVICE_ANALYTICS_PROCESSING_INTERVAL"];
  [v14 doubleValue];
  double v16 = v15;

  if (v16 < 1.0)
  {
LABEL_8:
    if (!v5)
    {
LABEL_12:
      id v22 = a1[5];
      int v21 = 1;
      id v10 = [NSNumber numberWithBool:1];
      [v22 addFieldForKey:@"metricProcessImmediately" value:v10 options:2];
LABEL_14:

      goto LABEL_15;
    }
LABEL_9:
    uint64_t v17 = [v5 objectForKeyedSubscript:@"value"];
    if (v17)
    {
      uint64_t v18 = (void *)v17;
      int8x16_t v19 = [v5 objectForKeyedSubscript:@"value"];
      char v20 = [v19 BOOLValue];

      if (v20)
      {
        int v21 = 1;
        goto LABEL_15;
      }
    }
    goto LABEL_12;
  }
  int v21 = 0;
LABEL_15:
  int8x16_t v23 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = [a1[5] metricName];
    long long v25 = (void *)v24;
    *(_DWORD *)buf = 136447234;
    v40 = "-[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:]_block_invoke_2";
    char v26 = @"NO";
    __int16 v41 = 1024;
    int v42 = 478;
    if (v21) {
      char v26 = @"YES";
    }
    __int16 v43 = 2112;
    uint64_t v44 = v24;
    __int16 v45 = 2112;
    uint64_t v46 = @"metricProcessImmediately";
    __int16 v47 = 2112;
    uint64_t v48 = v26;
    _os_log_impl(&dword_21D96D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:message(%@)[%@]:%@", buf, 0x30u);
  }
  if (v21)
  {
    __int16 v27 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v40 = "-[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:]_block_invoke";
      __int16 v41 = 1024;
      int v42 = 482;
      _os_log_impl(&dword_21D96D000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:ProcessJournalImmediately", buf, 0x12u);
    }

    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    if ([WeakRetained daemonConnectionValid])
    {
      uint64_t v29 = [WeakRetained conn];
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke_135;
      v37[3] = &unk_2644672E0;
      int v38 = (void (**)(void))a1[5];
      int v30 = [v29 remoteObjectProxyWithErrorHandler:v37];
      id v31 = a1[5];
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke_136;
      v35[3] = &unk_264467268;
      id v36 = v31;
      [v30 submitWiFiAnalyticsMessageAdvanced:v36 andReply:v35];

      v32 = v38;
    }
    else
    {
      uint64_t v33 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        v34 = [a1[5] metricName];
        *(_DWORD *)buf = 136446722;
        v40 = "-[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:]_block_invoke";
        __int16 v41 = 1024;
        int v42 = 489;
        __int16 v43 = 2112;
        uint64_t v44 = (uint64_t)v34;
        _os_log_impl(&dword_21D96D000, v33, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, connection establishment about to be initiated... (%@ has been written on disk but XPC won't be called)", buf, 0x1Cu);
      }
      v32 = [WeakRetained _getConnectionIssueHandlerBlock];
      v32[2]();
    }
  }
}

void __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke_135(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = [*(id *)(a1 + 32) metricName];
    int v6 = 136446978;
    uint64_t v7 = "-[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 496;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_21D96D000, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - submitWiFiAnalyticsMessageAdvanced:%@ - error: %@", (uint8_t *)&v6, 0x26u);
  }
}

void __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke_136(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 code] == 9009)
  {
    id v5 = +[WAClient sharedClient];
    [v5 _reregister];
  }
  int v6 = WALogCategoryDefaultHandle();
  uint64_t v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __int16 v8 = [*(id *)(a1 + 32) metricName];
      int v13 = 136446978;
      uint64_t v14 = "-[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 501;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      id v20 = v4;
      int v9 = "%{public}s::%d:WAClient - FAILED to submitWiFiAnalyticsMessageAdvanced:%@ - error: %@";
      __int16 v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 38;
LABEL_8:
      _os_log_impl(&dword_21D96D000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = [*(id *)(a1 + 32) metricName];
    int v13 = 136446722;
    uint64_t v14 = "-[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:]_block_invoke";
    __int16 v15 = 1024;
    int v16 = 503;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    int v9 = "%{public}s::%d:Successfully Sent %@";
    __int16 v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 28;
    goto LABEL_8;
  }
}

void __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke_137(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446722;
    id v5 = "-[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 530;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - submitWiFiAnalyticsMessageAdvanced - error: %@", (uint8_t *)&v4, 0x1Cu);
  }
}

void __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke_140(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 code] == 9009)
  {
    int v7 = +[WAClient sharedClient];
    [v7 _reregister];
  }
  __int16 v8 = +[WAClient sharedClient];
  id v9 = [v8 replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke_2_141;
  block[3] = &unk_2644671F0;
  id v13 = *(id *)(a1 + 32);
  id v14 = v5;
  id v15 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, block);
}

void __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke_2_141(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = [*(id *)(a1 + 32) reply];

  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) reply];
    v4[2](v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  id v5 = +[WAClient sharedClient];
  [v5 _dequeueInvocation:*(void *)(a1 + 32)];
}

- (void)triggerQueryForNWActivity:(int64_t)a3 andReply:(id)a4
{
}

- (void)_triggerQueryForNWActivity:(int64_t)a3 andReply:(id)a4 queuedInvocation:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(WAClient *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__WAClient__triggerQueryForNWActivity_andReply_queuedInvocation___block_invoke;
  block[3] = &unk_264467240;
  objc_copyWeak(v18, &location);
  id v15 = v10;
  int v16 = self;
  v18[1] = (id)a2;
  v18[2] = (id)a3;
  id v17 = v9;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(v11, block);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

void __65__WAClient__triggerQueryForNWActivity_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!v4)
  {
    int v4 = objc_alloc_init(WAQueuedInvocation);
    id v5 = [[InvokeMakerInfo alloc] initWithSel:*(void *)(a1 + 64) andTarget:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(a1 + 72);
    int v7 = (void *)MEMORY[0x223C0F530](*(void *)(a1 + 48));
    __int16 v8 = +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v5, v6, v7, v4, 0);

    [(WAQueuedInvocation *)v4 setInvocation:v8];
    [(WAQueuedInvocation *)v4 setReply:*(void *)(a1 + 48)];
    id v9 = [WeakRetained queuedInvocations];
    [v9 addObject:v4];
  }
  if ([WeakRetained daemonConnectionValid])
  {
    id v10 = [WeakRetained conn];
    id v11 = [v10 remoteObjectProxyWithErrorHandler:&__block_literal_global_144];
    uint64_t v12 = *(void *)(a1 + 72);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __65__WAClient__triggerQueryForNWActivity_andReply_queuedInvocation___block_invoke_145;
    v15[3] = &unk_264467268;
    int v16 = v4;
    [v11 triggerQueryForNWActivity:v12 andReply:v15];

    id v13 = (void (**)(void))v16;
  }
  else
  {
    id v14 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v18 = "-[WAClient _triggerQueryForNWActivity:andReply:queuedInvocation:]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 604;
      _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    id v13 = [WeakRetained _getConnectionIssueHandlerBlock];
    v13[2]();
  }
}

void __65__WAClient__triggerQueryForNWActivity_andReply_queuedInvocation___block_invoke_142(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446722;
    id v5 = "-[WAClient _triggerQueryForNWActivity:andReply:queuedInvocation:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 608;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - triggerQueryForNWActivity - error: %@", (uint8_t *)&v4, 0x1Cu);
  }
}

void __65__WAClient__triggerQueryForNWActivity_andReply_queuedInvocation___block_invoke_145(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = WALogCategoryDefaultHandle();
  __int16 v8 = v7;
  if (v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136446722;
    uint64_t v24 = "-[WAClient _triggerQueryForNWActivity:andReply:queuedInvocation:]_block_invoke";
    __int16 v25 = 1024;
    int v26 = 612;
    __int16 v27 = 2112;
    id v28 = v6;
    id v9 = "%{public}s::%d:XPC: WAClient - triggerQueryForNWActivity - error: %@";
    uint64_t v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 28;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136446466;
    uint64_t v24 = "-[WAClient _triggerQueryForNWActivity:andReply:queuedInvocation:]_block_invoke";
    __int16 v25 = 1024;
    int v26 = 614;
    id v9 = "%{public}s::%d:WAClient - triggerQueryForNWActivity - success";
    uint64_t v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 18;
  }
  _os_log_impl(&dword_21D96D000, v10, v11, v9, buf, v12);
LABEL_7:

  id v13 = v6;
  if ([v13 code] == 9009)
  {
    id v14 = +[WAClient sharedClient];
    [v14 _reregister];
  }
  id v15 = +[WAClient sharedClient];
  int v16 = [v15 replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__WAClient__triggerQueryForNWActivity_andReply_queuedInvocation___block_invoke_146;
  block[3] = &unk_2644671F0;
  id v20 = *(id *)(a1 + 32);
  id v21 = v5;
  id v22 = v13;
  id v17 = v13;
  id v18 = v5;
  dispatch_async(v16, block);
}

void __65__WAClient__triggerQueryForNWActivity_andReply_queuedInvocation___block_invoke_146(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = [*(id *)(a1 + 32) reply];

  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) reply];
    v4[2](v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  id v5 = +[WAClient sharedClient];
  [v5 _dequeueInvocation:*(void *)(a1 + 32)];
}

- (void)convertWiFiStatsIntoPercentile:(id)a3 analysisGroup:(int64_t)a4 groupTarget:(id)a5 andReply:(id)a6
{
}

- (void)convertWiFiStatsIntoPercentile:(id)a3 analysisGroup:(int64_t)a4 groupTarget:(id)a5 andReply:(id)a6 queuedInvocation:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  objc_initWeak(&location, self);
  id v17 = [(WAClient *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__WAClient_convertWiFiStatsIntoPercentile_analysisGroup_groupTarget_andReply_queuedInvocation___block_invoke;
  block[3] = &unk_264467290;
  objc_copyWeak(v28, &location);
  id v23 = v16;
  uint64_t v24 = self;
  v28[1] = (id)a2;
  v28[2] = (id)a4;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v16;
  dispatch_async(v17, block);

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
}

void __95__WAClient_convertWiFiStatsIntoPercentile_analysisGroup_groupTarget_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  int v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(void *)(a1 + 32))
  {
    id v5 = objc_alloc_init(WAQueuedInvocation);

    id v6 = [[InvokeMakerInfo alloc] initWithSel:*(void *)(a1 + 80) andTarget:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(a1 + 88);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = (void *)MEMORY[0x223C0F530](*(void *)(a1 + 64));
    os_log_type_t v11 = +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v8, v7, v9, v10, v5, 0);

    [(WAQueuedInvocation *)v5 setInvocation:v11];
    [(WAQueuedInvocation *)v5 setReply:*(void *)(a1 + 64)];
    uint32_t v12 = [WeakRetained queuedInvocations];
    [v12 addObject:v5];

    int v4 = v5;
  }
  if ([WeakRetained daemonConnectionValid])
  {
    id v13 = [WeakRetained conn];
    id v14 = [v13 remoteObjectProxyWithErrorHandler:&__block_literal_global_149];
    uint64_t v15 = *(void *)(a1 + 88);
    uint64_t v17 = *(void *)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 56);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __95__WAClient_convertWiFiStatsIntoPercentile_analysisGroup_groupTarget_andReply_queuedInvocation___block_invoke_150;
    v20[3] = &unk_264467268;
    id v21 = v4;
    [v14 convertWiFiStatsIntoPercentile:v17 analysisGroup:v15 groupTarget:v16 andReply:v20];

    id v18 = v21;
  }
  else
  {
    id v19 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v23 = "-[WAClient convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:andReply:queuedInvocation:]_block_invoke";
      __int16 v24 = 1024;
      int v25 = 652;
      _os_log_impl(&dword_21D96D000, v19, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    id v18 = [WeakRetained _getConnectionIssueHandlerBlock];
    v18[2]();
  }
}

void __95__WAClient_convertWiFiStatsIntoPercentile_analysisGroup_groupTarget_andReply_queuedInvocation___block_invoke_147(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446722;
    id v5 = "-[WAClient convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:andReply:queuedInvocation:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 660;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - convertWiFiStatsIntoPercentile - error: %@", (uint8_t *)&v4, 0x1Cu);
  }
}

void __95__WAClient_convertWiFiStatsIntoPercentile_analysisGroup_groupTarget_andReply_queuedInvocation___block_invoke_150(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = WALogCategoryDefaultHandle();
  __int16 v8 = v7;
  if (v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136446722;
    __int16 v24 = "-[WAClient convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:andReply:queuedInvocation:]_block_invoke";
    __int16 v25 = 1024;
    int v26 = 664;
    __int16 v27 = 2112;
    id v28 = v6;
    id v9 = "%{public}s::%d:XPC: WAClient - convertWiFiStatsIntoPercentile - error: %@";
    uint64_t v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 28;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136446466;
    __int16 v24 = "-[WAClient convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:andReply:queuedInvocation:]_block_invoke";
    __int16 v25 = 1024;
    int v26 = 666;
    id v9 = "%{public}s::%d:WAClient - convertWiFiStatsIntoPercentile - success";
    uint64_t v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 18;
  }
  _os_log_impl(&dword_21D96D000, v10, v11, v9, buf, v12);
LABEL_7:

  id v13 = v6;
  if ([v13 code] == 9009)
  {
    id v14 = +[WAClient sharedClient];
    [v14 _reregister];
  }
  uint64_t v15 = +[WAClient sharedClient];
  uint64_t v16 = [v15 replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__WAClient_convertWiFiStatsIntoPercentile_analysisGroup_groupTarget_andReply_queuedInvocation___block_invoke_151;
  block[3] = &unk_2644671F0;
  id v20 = *(id *)(a1 + 32);
  id v21 = v5;
  id v22 = v13;
  id v17 = v13;
  id v18 = v5;
  dispatch_async(v16, block);
}

void __95__WAClient_convertWiFiStatsIntoPercentile_analysisGroup_groupTarget_andReply_queuedInvocation___block_invoke_151(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = [*(id *)(a1 + 32) reply];

  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) reply];
    v4[2](v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  id v5 = +[WAClient sharedClient];
  [v5 _dequeueInvocation:*(void *)(a1 + 32)];
}

- (void)triggerDatapathDiagnosticsAndCollectUpdates:(int64_t)a3 waMessage:(id)a4 andReply:(id)a5
{
}

- (void)_triggerDatapathDiagnosticsAndCollectUpdates:(int64_t)a3 waMessage:(id)a4 andReply:(id)a5 queuedInvocation:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  id v14 = [(WAClient *)self queue];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __93__WAClient__triggerDatapathDiagnosticsAndCollectUpdates_waMessage_andReply_queuedInvocation___block_invoke;
  id v18[3] = &unk_2644672B8;
  objc_copyWeak(v23, &location);
  id v19 = v13;
  id v20 = self;
  v23[1] = (id)a2;
  id v23[2] = (id)a3;
  id v21 = v11;
  id v22 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  dispatch_async(v14, v18);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
}

void __93__WAClient__triggerDatapathDiagnosticsAndCollectUpdates_waMessage_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  int v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!v4)
  {
    int v4 = objc_alloc_init(WAQueuedInvocation);
    id v5 = [[InvokeMakerInfo alloc] initWithSel:*(void *)(a1 + 72) andTarget:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(a1 + 80);
    uint64_t v7 = *(void *)(a1 + 48);
    __int16 v8 = (void *)MEMORY[0x223C0F530](*(void *)(a1 + 56));
    id v9 = +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v5, v6, v7, v8, v4, 0);

    [(WAQueuedInvocation *)v4 setInvocation:v9];
    [(WAQueuedInvocation *)v4 setReply:*(void *)(a1 + 56)];
    uint64_t v10 = [WeakRetained queuedInvocations];
    [v10 addObject:v4];
  }
  if ([WeakRetained daemonConnectionValid])
  {
    id v11 = [WeakRetained conn];
    id v12 = [v11 remoteObjectProxyWithErrorHandler:&__block_literal_global_154];
    uint64_t v13 = *(void *)(a1 + 80);
    uint64_t v14 = *(void *)(a1 + 48);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __93__WAClient__triggerDatapathDiagnosticsAndCollectUpdates_waMessage_andReply_queuedInvocation___block_invoke_155;
    v17[3] = &unk_264467268;
    id v18 = v4;
    [v12 triggerDatapathDiagnosticsAndCollectUpdates:v13 waMessage:v14 andReply:v17];

    id v15 = (void (**)(void))v18;
  }
  else
  {
    id v16 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v20 = "-[WAClient _triggerDatapathDiagnosticsAndCollectUpdates:waMessage:andReply:queuedInvocation:]_block_invoke";
      __int16 v21 = 1024;
      int v22 = 707;
      _os_log_impl(&dword_21D96D000, v16, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    id v15 = [WeakRetained _getConnectionIssueHandlerBlock];
    v15[2]();
  }
}

void __93__WAClient__triggerDatapathDiagnosticsAndCollectUpdates_waMessage_andReply_queuedInvocation___block_invoke_152(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446722;
    id v5 = "-[WAClient _triggerDatapathDiagnosticsAndCollectUpdates:waMessage:andReply:queuedInvocation:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 711;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - triggerDatapathDiagnosticsAndCollectUpdates - error: %@", (uint8_t *)&v4, 0x1Cu);
  }
}

void __93__WAClient__triggerDatapathDiagnosticsAndCollectUpdates_waMessage_andReply_queuedInvocation___block_invoke_155(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = WALogCategoryDefaultHandle();
  __int16 v8 = v7;
  if (v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136446722;
    __int16 v24 = "-[WAClient _triggerDatapathDiagnosticsAndCollectUpdates:waMessage:andReply:queuedInvocation:]_block_invoke";
    __int16 v25 = 1024;
    int v26 = 715;
    __int16 v27 = 2112;
    id v28 = v6;
    id v9 = "%{public}s::%d:XPC: WAClient - triggerDatapathDiagnosticsAndCollectUpdates - error: %@";
    uint64_t v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 28;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136446466;
    __int16 v24 = "-[WAClient _triggerDatapathDiagnosticsAndCollectUpdates:waMessage:andReply:queuedInvocation:]_block_invoke";
    __int16 v25 = 1024;
    int v26 = 717;
    id v9 = "%{public}s::%d:WAClient - triggerDatapathDiagnosticsAndCollectUpdates - success";
    uint64_t v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 18;
  }
  _os_log_impl(&dword_21D96D000, v10, v11, v9, buf, v12);
LABEL_7:

  id v13 = v6;
  if ([v13 code] == 9009)
  {
    uint64_t v14 = +[WAClient sharedClient];
    [v14 _reregister];
  }
  id v15 = +[WAClient sharedClient];
  id v16 = [v15 replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __93__WAClient__triggerDatapathDiagnosticsAndCollectUpdates_waMessage_andReply_queuedInvocation___block_invoke_156;
  block[3] = &unk_2644671F0;
  id v20 = *(id *)(a1 + 32);
  id v21 = v5;
  id v22 = v13;
  id v17 = v13;
  id v18 = v5;
  dispatch_async(v16, block);
}

void __93__WAClient__triggerDatapathDiagnosticsAndCollectUpdates_waMessage_andReply_queuedInvocation___block_invoke_156(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = [*(id *)(a1 + 32) reply];

  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) reply];
    v4[2](v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  id v5 = +[WAClient sharedClient];
  [v5 _dequeueInvocation:*(void *)(a1 + 32)];
}

- (void)getDpsStatsandReply:(id)a3
{
}

- (void)_getDpsStatsandReply:(id)a3 queuedInvocation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  id v9 = [(WAClient *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50__WAClient__getDpsStatsandReply_queuedInvocation___block_invoke;
  v12[3] = &unk_264467040;
  objc_copyWeak(v16, &location);
  id v13 = v8;
  uint64_t v14 = self;
  v16[1] = (id)a2;
  id v15 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __50__WAClient__getDpsStatsandReply_queuedInvocation___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(void *)(a1 + 32))
  {
    id v5 = objc_alloc_init(WAQueuedInvocation);

    id v6 = [[InvokeMakerInfo alloc] initWithSel:*(void *)(a1 + 64) andTarget:*(void *)(a1 + 40)];
    id v7 = (void *)MEMORY[0x223C0F530](*(void *)(a1 + 48));
    id v8 = +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v5, 0);

    [(WAQueuedInvocation *)v5 setInvocation:v8];
    [(WAQueuedInvocation *)v5 setReply:*(void *)(a1 + 48)];
    id v9 = [WeakRetained queuedInvocations];
    [v9 addObject:v5];

    int v4 = v5;
  }
  if ([WeakRetained daemonConnectionValid])
  {
    id v10 = [WeakRetained conn];
    id v11 = [v10 remoteObjectProxyWithErrorHandler:&__block_literal_global_159];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __50__WAClient__getDpsStatsandReply_queuedInvocation___block_invoke_160;
    v14[3] = &unk_264467268;
    id v15 = v4;
    [v11 getDpsStatsandReply:v14];

    uint32_t v12 = v15;
  }
  else
  {
    id v13 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v17 = "-[WAClient _getDpsStatsandReply:queuedInvocation:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 751;
      _os_log_impl(&dword_21D96D000, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    uint32_t v12 = [WeakRetained _getConnectionIssueHandlerBlock];
    v12[2]();
  }
}

void __50__WAClient__getDpsStatsandReply_queuedInvocation___block_invoke_157(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446722;
    id v5 = "-[WAClient _getDpsStatsandReply:queuedInvocation:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 756;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - getDpsStatsandReply - error: %@", (uint8_t *)&v4, 0x1Cu);
  }
}

void __50__WAClient__getDpsStatsandReply_queuedInvocation___block_invoke_160(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v19 = "-[WAClient _getDpsStatsandReply:queuedInvocation:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 760;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - _getDpsStatsandReply - error: %@", buf, 0x1Cu);
    }
  }
  id v8 = v6;
  if ([v8 code] == 9009)
  {
    id v9 = +[WAClient sharedClient];
    [v9 _reregister];
  }
  uint64_t v10 = +[WAClient sharedClient];
  id v11 = [v10 replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__WAClient__getDpsStatsandReply_queuedInvocation___block_invoke_161;
  block[3] = &unk_2644671F0;
  id v15 = *(id *)(a1 + 32);
  id v16 = v5;
  id v17 = v8;
  id v12 = v8;
  id v13 = v5;
  dispatch_async(v11, block);
}

void __50__WAClient__getDpsStatsandReply_queuedInvocation___block_invoke_161(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = [*(id *)(a1 + 32) reply];

  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) reply];
    v4[2](v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  id v5 = +[WAClient sharedClient];
  [v5 _dequeueInvocation:*(void *)(a1 + 32)];
}

- (void)killDaemonAndReply:(id)a3
{
}

- (void)_killDaemonAndReply:(id)a3 queuedInvocation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  id v9 = [(WAClient *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__WAClient__killDaemonAndReply_queuedInvocation___block_invoke;
  v12[3] = &unk_264467040;
  objc_copyWeak(v16, &location);
  id v13 = v8;
  uint64_t v14 = self;
  v16[1] = (id)a2;
  id v15 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __49__WAClient__killDaemonAndReply_queuedInvocation___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(void *)(a1 + 32))
  {
    id v5 = objc_alloc_init(WAQueuedInvocation);

    id v6 = [[InvokeMakerInfo alloc] initWithSel:*(void *)(a1 + 64) andTarget:*(void *)(a1 + 40)];
    id v7 = (void *)MEMORY[0x223C0F530](*(void *)(a1 + 48));
    id v8 = +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v5, 0);

    [(WAQueuedInvocation *)v5 setInvocation:v8];
    [(WAQueuedInvocation *)v5 setReply:*(void *)(a1 + 48)];
    id v9 = [WeakRetained queuedInvocations];
    [v9 addObject:v5];

    int v4 = v5;
  }
  if (![WeakRetained daemonConnectionValid])
  {
    __int16 v18 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v25 = "-[WAClient _killDaemonAndReply:queuedInvocation:]_block_invoke";
      __int16 v26 = 1024;
      int v27 = 799;
      _os_log_impl(&dword_21D96D000, v18, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    id v17 = [WeakRetained _getConnectionIssueHandlerBlock];
    v17[2]();
    goto LABEL_6;
  }
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  id v11 = [WeakRetained conn];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __49__WAClient__killDaemonAndReply_queuedInvocation___block_invoke_162;
  id v22[3] = &unk_2644672E0;
  id v12 = v10;
  id v23 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v22];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __49__WAClient__killDaemonAndReply_queuedInvocation___block_invoke_163;
  v19[3] = &unk_264467308;
  __int16 v20 = v4;
  int v21 = v12;
  uint64_t v14 = v12;
  [v13 killDaemonAndReply:v19];

  dispatch_time_t v15 = dispatch_time(0, 15000000000);
  dispatch_semaphore_wait(v14, v15);

  [WeakRetained setDaemonConnectionValid:0];
  id v16 = [WeakRetained conn];

  if (v16)
  {
    id v17 = [WeakRetained conn];
    [v17 invalidate];
LABEL_6:
  }
}

void __49__WAClient__killDaemonAndReply_queuedInvocation___block_invoke_162(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136446722;
    id v6 = "-[WAClient _killDaemonAndReply:queuedInvocation:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 807;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_21D96D000, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - killDaemonAndReply - error: %@", (uint8_t *)&v5, 0x1Cu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __49__WAClient__killDaemonAndReply_queuedInvocation___block_invoke_163(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 code] == 9009)
  {
    __int16 v7 = +[WAClient sharedClient];
    [v7 _reregister];
  }
  int v8 = +[WAClient sharedClient];
  __int16 v9 = [v8 replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__WAClient__killDaemonAndReply_queuedInvocation___block_invoke_2;
  block[3] = &unk_2644671F0;
  id v13 = *(id *)(a1 + 32);
  id v14 = v5;
  id v15 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __49__WAClient__killDaemonAndReply_queuedInvocation___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = [*(id *)(a1 + 32) reply];

  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) reply];
    v4[2](v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  id v5 = +[WAClient sharedClient];
  [v5 _dequeueInvocation:*(void *)(a1 + 32)];
}

- (void)clearMessageStoreAndReply:(id)a3
{
}

- (void)_clearMessageStoreAndReply:(id)a3 queuedInvocation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  __int16 v9 = [(WAClient *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__WAClient__clearMessageStoreAndReply_queuedInvocation___block_invoke;
  v12[3] = &unk_264467040;
  objc_copyWeak(v16, &location);
  id v13 = v8;
  id v14 = self;
  v16[1] = (id)a2;
  id v15 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __56__WAClient__clearMessageStoreAndReply_queuedInvocation___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(void *)(a1 + 32))
  {
    id v5 = objc_alloc_init(WAQueuedInvocation);

    id v6 = [[InvokeMakerInfo alloc] initWithSel:*(void *)(a1 + 64) andTarget:*(void *)(a1 + 40)];
    id v7 = (void *)MEMORY[0x223C0F530](*(void *)(a1 + 48));
    id v8 = +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v5, 0);

    [(WAQueuedInvocation *)v5 setInvocation:v8];
    [(WAQueuedInvocation *)v5 setReply:*(void *)(a1 + 48)];
    __int16 v9 = [WeakRetained queuedInvocations];
    [v9 addObject:v5];

    int v4 = v5;
  }
  if ([WeakRetained daemonConnectionValid])
  {
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    id v11 = [WeakRetained conn];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __56__WAClient__clearMessageStoreAndReply_queuedInvocation___block_invoke_164;
    v20[3] = &unk_2644672E0;
    id v12 = v10;
    int v21 = v12;
    id v13 = [v11 remoteObjectProxyWithErrorHandler:v20];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __56__WAClient__clearMessageStoreAndReply_queuedInvocation___block_invoke_165;
    v17[3] = &unk_264467308;
    __int16 v18 = v4;
    int v19 = v12;
    id v14 = v12;
    [v13 clearMessageStoreAndReply:v17];

    dispatch_time_t v15 = dispatch_time(0, 15000000000);
    dispatch_semaphore_wait(v14, v15);
  }
  else
  {
    id v16 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v23 = "-[WAClient _clearMessageStoreAndReply:queuedInvocation:]_block_invoke";
      __int16 v24 = 1024;
      int v25 = 854;
      _os_log_impl(&dword_21D96D000, v16, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    id v14 = [WeakRetained _getConnectionIssueHandlerBlock];
    ((void (*)(void))v14[2].isa)();
  }
}

void __56__WAClient__clearMessageStoreAndReply_queuedInvocation___block_invoke_164(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136446722;
    id v6 = "-[WAClient _clearMessageStoreAndReply:queuedInvocation:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 862;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_21D96D000, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - clearMessageStoreAndReply - error: %@", (uint8_t *)&v5, 0x1Cu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __56__WAClient__clearMessageStoreAndReply_queuedInvocation___block_invoke_165(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 code] == 9009)
  {
    __int16 v7 = +[WAClient sharedClient];
    [v7 _reregister];
  }
  int v8 = +[WAClient sharedClient];
  __int16 v9 = [v8 replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__WAClient__clearMessageStoreAndReply_queuedInvocation___block_invoke_2;
  block[3] = &unk_2644671F0;
  id v13 = *(id *)(a1 + 32);
  id v14 = v5;
  id v15 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __56__WAClient__clearMessageStoreAndReply_queuedInvocation___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = [*(id *)(a1 + 32) reply];

  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) reply];
    v4[2](v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  id v5 = +[WAClient sharedClient];
  [v5 _dequeueInvocation:*(void *)(a1 + 32)];
}

- (void)getMessagesModelForGroupType:(int64_t)a3 andReply:(id)a4
{
}

- (void)_getMessagesModelForGroupType:(int64_t)a3 andReply:(id)a4 queuedInvocation:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(WAClient *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__WAClient__getMessagesModelForGroupType_andReply_queuedInvocation___block_invoke;
  block[3] = &unk_264467240;
  objc_copyWeak(v18, &location);
  id v15 = v10;
  id v16 = self;
  v18[1] = (id)a2;
  v18[2] = (id)a3;
  id v17 = v9;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(v11, block);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

void __68__WAClient__getMessagesModelForGroupType_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(void *)(a1 + 32))
  {
    id v5 = objc_alloc_init(WAQueuedInvocation);

    id v6 = [[InvokeMakerInfo alloc] initWithSel:*(void *)(a1 + 64) andTarget:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(a1 + 72);
    int v8 = (void *)MEMORY[0x223C0F530](*(void *)(a1 + 48));
    id v9 = +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v8, v5, 0);

    [(WAQueuedInvocation *)v5 setInvocation:v9];
    [(WAQueuedInvocation *)v5 setReply:*(void *)(a1 + 48)];
    id v10 = [WeakRetained queuedInvocations];
    [v10 addObject:v5];

    int v4 = v5;
  }
  if ([WeakRetained daemonConnectionValid])
  {
    id v11 = [WeakRetained conn];
    id v12 = [v11 remoteObjectProxyWithErrorHandler:&__block_literal_global_168];
    uint64_t v13 = *(void *)(a1 + 72);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    id v16[2] = __68__WAClient__getMessagesModelForGroupType_andReply_queuedInvocation___block_invoke_169;
    v16[3] = &unk_264467268;
    id v17 = v4;
    [v12 getMessagesModelForGroupType:v13 andReply:v16];

    id v14 = v17;
  }
  else
  {
    id v15 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      int v19 = "-[WAClient _getMessagesModelForGroupType:andReply:queuedInvocation:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 906;
      _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    id v14 = [WeakRetained _getConnectionIssueHandlerBlock];
    v14[2]();
  }
}

void __68__WAClient__getMessagesModelForGroupType_andReply_queuedInvocation___block_invoke_166(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446722;
    id v5 = "-[WAClient _getMessagesModelForGroupType:andReply:queuedInvocation:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 912;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - getMessagesModelAndReply - error: %@", (uint8_t *)&v4, 0x1Cu);
  }
}

void __68__WAClient__getMessagesModelForGroupType_andReply_queuedInvocation___block_invoke_169(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 code] == 9009)
  {
    int v7 = +[WAClient sharedClient];
    [v7 _reregister];
  }
  __int16 v8 = +[WAClient sharedClient];
  id v9 = [v8 replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__WAClient__getMessagesModelForGroupType_andReply_queuedInvocation___block_invoke_2;
  block[3] = &unk_2644671F0;
  id v13 = *(id *)(a1 + 32);
  id v14 = v5;
  id v15 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, block);
}

void __68__WAClient__getMessagesModelForGroupType_andReply_queuedInvocation___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = [*(id *)(a1 + 32) reply];

  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) reply];
    v4[2](v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  id v5 = +[WAClient sharedClient];
  [v5 _dequeueInvocation:*(void *)(a1 + 32)];
}

- (void)sendMemoryPressureRequestAndReply:(id)a3
{
}

- (void)_sendMemoryPressureRequestAndReply:(id)a3 queuedInvocation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  id v9 = [(WAClient *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__WAClient__sendMemoryPressureRequestAndReply_queuedInvocation___block_invoke;
  v12[3] = &unk_264467040;
  objc_copyWeak(v16, &location);
  id v13 = v8;
  id v14 = self;
  v16[1] = (id)a2;
  id v15 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __64__WAClient__sendMemoryPressureRequestAndReply_queuedInvocation___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(void *)(a1 + 32))
  {
    id v5 = objc_alloc_init(WAQueuedInvocation);

    id v6 = [[InvokeMakerInfo alloc] initWithSel:*(void *)(a1 + 64) andTarget:*(void *)(a1 + 40)];
    id v7 = (void *)MEMORY[0x223C0F530](*(void *)(a1 + 48));
    id v8 = +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v5, 0);

    [(WAQueuedInvocation *)v5 setInvocation:v8];
    [(WAQueuedInvocation *)v5 setReply:*(void *)(a1 + 48)];
    id v9 = [WeakRetained queuedInvocations];
    [v9 addObject:v5];

    int v4 = v5;
  }
  if ([WeakRetained daemonConnectionValid])
  {
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    id v11 = [WeakRetained conn];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __64__WAClient__sendMemoryPressureRequestAndReply_queuedInvocation___block_invoke_170;
    v20[3] = &unk_2644672E0;
    id v12 = v10;
    int v21 = v12;
    id v13 = [v11 remoteObjectProxyWithErrorHandler:v20];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __64__WAClient__sendMemoryPressureRequestAndReply_queuedInvocation___block_invoke_171;
    v17[3] = &unk_264467308;
    __int16 v18 = v4;
    int v19 = v12;
    id v14 = v12;
    [v13 sendMemoryPressureRequestAndReply:v17];

    dispatch_time_t v15 = dispatch_time(0, 15000000000);
    dispatch_semaphore_wait(v14, v15);
  }
  else
  {
    id v16 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v23 = "-[WAClient _sendMemoryPressureRequestAndReply:queuedInvocation:]_block_invoke";
      __int16 v24 = 1024;
      int v25 = 952;
      _os_log_impl(&dword_21D96D000, v16, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    id v14 = [WeakRetained _getConnectionIssueHandlerBlock];
    ((void (*)(void))v14[2].isa)();
  }
}

void __64__WAClient__sendMemoryPressureRequestAndReply_queuedInvocation___block_invoke_170(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136446722;
    id v6 = "-[WAClient _sendMemoryPressureRequestAndReply:queuedInvocation:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 960;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_21D96D000, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - _sendMemoryPressureRequestAndReply - error: %@", (uint8_t *)&v5, 0x1Cu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __64__WAClient__sendMemoryPressureRequestAndReply_queuedInvocation___block_invoke_171(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 code] == 9009)
  {
    __int16 v7 = +[WAClient sharedClient];
    [v7 _reregister];
  }
  int v8 = +[WAClient sharedClient];
  __int16 v9 = [v8 replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__WAClient__sendMemoryPressureRequestAndReply_queuedInvocation___block_invoke_2;
  block[3] = &unk_2644671F0;
  id v13 = *(id *)(a1 + 32);
  id v14 = v5;
  id v15 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __64__WAClient__sendMemoryPressureRequestAndReply_queuedInvocation___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = [*(id *)(a1 + 32) reply];

  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) reply];
    v4[2](v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  id v5 = +[WAClient sharedClient];
  [v5 _dequeueInvocation:*(void *)(a1 + 32)];
}

- (id)_initPrivate
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v30.receiver = self;
  v30.super_class = (Class)WAClient;
  id v2 = [(WAClient *)&v30 init];
  if (!v2)
  {
    p_super = 0;
    goto LABEL_11;
  }
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.wifianalytics.clientQueue", v3);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v4;

  if (!v2->_queue) {
    goto LABEL_16;
  }
  id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.wifianalytics.clientReplyQueue", v6);
  replyQueue = v2->_replyQueue;
  v2->_replyQueue = (OS_dispatch_queue *)v7;

  if (!v2->_replyQueue) {
    goto LABEL_16;
  }
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.wifianalytics.clientPropertyQueue", MEMORY[0x263EF83A8]);
  propertyQueue = v2->_propertyQueue;
  v2->_propertyQueue = (OS_dispatch_queue *)v9;

  if (!v2->_propertyQueue) {
    goto LABEL_16;
  }
  id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v12 = dispatch_queue_create("com.apple.wifianalytics.queryableConcurrentQueue", v11);
  queryableQueue = v2->_queryableQueue;
  v2->_queryableQueue = (OS_dispatch_queue *)v12;

  if (!v2->_queryableQueue) {
    goto LABEL_16;
  }
  id v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v15 = dispatch_queue_create("com.apple.wifianalytics.fileHandlingQueue", v14);
  fileHandlingQueue = v2->_fileHandlingQueue;
  v2->_fileHandlingQueue = (OS_dispatch_queue *)v15;

  if (!v2->_fileHandlingQueue
    || ([MEMORY[0x263EFF980] array],
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        queuedInvocations = v2->_queuedInvocations,
        v2->_queuedInvocations = (NSMutableArray *)v17,
        queuedInvocations,
        !v2->_queuedInvocations))
  {
LABEL_16:
    p_super = &v2->super;
    id v2 = 0;
    goto LABEL_11;
  }
  uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
  configuredMessageIdentifiers = v2->_configuredMessageIdentifiers;
  v2->_configuredMessageIdentifiers = (NSMutableDictionary *)v19;

  uint64_t v21 = [MEMORY[0x263EFF9A0] dictionary];
  interestedMessageIdentifiers = v2->_interestedMessageIdentifiers;
  v2->_interestedMessageIdentifiers = (NSMutableDictionary *)v21;

  uint64_t v23 = [MEMORY[0x263EFF9C0] set];
  registeredGroupTypes = v2->_registeredGroupTypes;
  v2->_registeredGroupTypes = (NSMutableSet *)v23;

  v2->_blockDaemonConnection = 0;
  uint64_t v25 = +[WAUtil wifianalyticsTmpDirectory];
  wifianalyticsTmpDir = v2->_wifianalyticsTmpDir;
  v2->_wifianalyticsTmpDir = (NSURL *)v25;

  if (!v2->_wifianalyticsTmpDir)
  {
    uint64_t v29 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v32 = "-[WAClient _initPrivate]";
      __int16 v33 = 1024;
      int v34 = 1019;
      _os_log_impl(&dword_21D96D000, v29, OS_LOG_TYPE_ERROR, "%{public}s::%d:nil wifianalyticsTmpDirectory", buf, 0x12u);
    }

    goto LABEL_16;
  }
  p_super = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v32 = "-[WAClient _initPrivate]";
    __int16 v33 = 1024;
    int v34 = 1021;
    __int16 v35 = 2080;
    id v36 = "WiFiAnalytics-680.21 Nov 14 2024 23:02:13";
    _os_log_impl(&dword_21D96D000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WiFiClient version: %s", buf, 0x1Cu);
  }
LABEL_11:

  return v2;
}

- (void)_establishDaemonConnection
{
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__WAClient__establishDaemonConnection__block_invoke;
  v6[3] = &unk_264466048;
  void v6[4] = self;
  if (_establishDaemonConnection_tokenLookupOnceToken != -1) {
    dispatch_once(&_establishDaemonConnection_tokenLookupOnceToken, v6);
  }
  id v3 = [(WAClient *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__WAClient__establishDaemonConnection__block_invoke_2;
  block[3] = &unk_264467380;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __38__WAClient__establishDaemonConnection__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tokenForThisClient];

  if (!v2)
  {
    id v4 = [*(id *)(a1 + 32) identifierForThisClient];
    id v3 = +[WAUtil getTokenForIdentifier:v4];
    [*(id *)(a1 + 32) setTokenForThisClient:v3];
  }
}

void __38__WAClient__establishDaemonConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = [WeakRetained blockDaemonConnection];
  id v6 = WALogCategoryDefaultHandle();
  dispatch_queue_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v43 = "-[WAClient _establishDaemonConnection]_block_invoke_2";
      __int16 v44 = 1024;
      int v45 = 1053;
      _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Connection to daemon blocked, this should only happen during testing.", buf, 0x12u);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [WeakRetained tokenForThisClient];
      dispatch_queue_t v9 = +[WAUtil trimTokenForLogging:v8];
      *(_DWORD *)buf = 136446722;
      __int16 v43 = "-[WAClient _establishDaemonConnection]_block_invoke";
      __int16 v44 = 1024;
      int v45 = 1057;
      __int16 v46 = 2112;
      __int16 v47 = v9;
      _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:XPC: establishing connection to daemon with token ending in: %@...", buf, 0x1Cu);
    }
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    id v11 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.wifianalyticsd" options:4096];
    [WeakRetained setConn:v11];

    dispatch_queue_t v12 = WAXPCRequestDelegateInterface();
    id v13 = [WeakRetained conn];
    [v13 setRemoteObjectInterface:v12];

    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __38__WAClient__establishDaemonConnection__block_invoke_187;
    v38[3] = &unk_264467330;
    objc_copyWeak(&v40, v3);
    char v41 = 0;
    id v14 = v10;
    v39 = v14;
    dispatch_queue_t v15 = [WeakRetained conn];
    [v15 setInvalidationHandler:v38];

    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __38__WAClient__establishDaemonConnection__block_invoke_189;
    v34[3] = &unk_264467330;
    objc_copyWeak(&v36, v3);
    char v37 = 0;
    id v16 = v14;
    __int16 v35 = v16;
    uint64_t v17 = [WeakRetained conn];
    [v17 setInterruptionHandler:v34];

    __int16 v18 = [WeakRetained conn];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __38__WAClient__establishDaemonConnection__block_invoke_191;
    v32[3] = &unk_2644672E0;
    uint64_t v19 = v16;
    __int16 v33 = v19;
    __int16 v20 = [v18 remoteObjectProxyWithErrorHandler:v32];
    uint64_t v21 = [WeakRetained tokenForThisClient];
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    int v27 = __38__WAClient__establishDaemonConnection__block_invoke_192;
    uint64_t v28 = &unk_264467358;
    objc_copyWeak(&v30, v3);
    char v31 = 0;
    dispatch_queue_t v7 = v19;
    uint64_t v29 = v7;
    [v20 establishConnectionWithToken:v21 andReply:&v25];

    uint64_t v22 = objc_msgSend(WeakRetained, "conn", v25, v26, v27, v28);
    [v22 resume];

    dispatch_time_t v23 = dispatch_time(0, 15000000000);
    if (dispatch_semaphore_wait(v7, v23))
    {
      __int16 v24 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        __int16 v43 = "-[WAClient _establishDaemonConnection]_block_invoke";
        __int16 v44 = 1024;
        int v45 = 1124;
        _os_log_impl(&dword_21D96D000, v24, OS_LOG_TYPE_ERROR, "%{public}s::%d:PARSER: gave up waiting to establish connection. Bailing to avoid a hang", buf, 0x12u);
      }
    }
    objc_destroyWeak(&v30);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&v40);
  }
}

void __38__WAClient__establishDaemonConnection__block_invoke_187(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__WAClient__establishDaemonConnection__block_invoke_2_188;
  block[3] = &unk_264467330;
  objc_copyWeak(&v7, v2);
  char v8 = *(unsigned char *)(a1 + 48);
  id v6 = *(id *)(a1 + 32);
  dispatch_sync(v4, block);

  objc_destroyWeak(&v7);
}

void __38__WAClient__establishDaemonConnection__block_invoke_2_188(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setDaemonConnectionValid:0];
  int v5 = [WeakRetained queuedInvocations];
  uint64_t v6 = [v5 count];

  id v7 = WALogCategoryDefaultHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8)
    {
      int v11 = 136446466;
      dispatch_queue_t v12 = "-[WAClient _establishDaemonConnection]_block_invoke_2";
      __int16 v13 = 1024;
      int v14 = 1070;
      _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: Client invalidation handler, but there are queued invocations! removing them", (uint8_t *)&v11, 0x12u);
    }

    [WeakRetained _removeAllQueuedInvocations];
  }
  else
  {
    if (v8)
    {
      dispatch_queue_t v9 = [WeakRetained queuedInvocations];
      if (v9)
      {
        v1 = [WeakRetained queuedInvocations];
        uint64_t v10 = [v1 count];
      }
      else
      {
        uint64_t v10 = 99;
      }
      int v11 = 136446722;
      dispatch_queue_t v12 = "-[WAClient _establishDaemonConnection]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 1073;
      __int16 v15 = 2048;
      uint64_t v16 = v10;
      _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: Client invalidation handler, won't try to reestablish connection as the daemon could have been told to idle-exit. Queued invocations count: %ld", (uint8_t *)&v11, 0x1Cu);
      if (v9) {
    }
      }
  }
  if (!*(unsigned char *)(a1 + 48)) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void __38__WAClient__establishDaemonConnection__block_invoke_189(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__WAClient__establishDaemonConnection__block_invoke_2_190;
  block[3] = &unk_264467330;
  objc_copyWeak(&v7, v2);
  char v8 = *(unsigned char *)(a1 + 48);
  id v6 = *(id *)(a1 + 32);
  dispatch_sync(v4, block);

  objc_destroyWeak(&v7);
}

void __38__WAClient__establishDaemonConnection__block_invoke_2_190(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setDaemonConnectionValid:0];
  int v5 = [WeakRetained queuedInvocations];
  uint64_t v6 = [v5 count];

  id v7 = WALogCategoryDefaultHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8)
    {
      int v11 = 136446466;
      dispatch_queue_t v12 = "-[WAClient _establishDaemonConnection]_block_invoke_2";
      __int16 v13 = 1024;
      int v14 = 1084;
      _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: Client interruption handler, but there are queued invocations! removing them", (uint8_t *)&v11, 0x12u);
    }

    [WeakRetained _removeAllQueuedInvocations];
  }
  else
  {
    if (v8)
    {
      dispatch_queue_t v9 = [WeakRetained queuedInvocations];
      if (v9)
      {
        v1 = [WeakRetained queuedInvocations];
        uint64_t v10 = [v1 count];
      }
      else
      {
        uint64_t v10 = 99;
      }
      int v11 = 136446722;
      dispatch_queue_t v12 = "-[WAClient _establishDaemonConnection]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 1087;
      __int16 v15 = 2048;
      uint64_t v16 = v10;
      _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: Client interruption handler, won't try to reestablish connection as the daemon could have been told to idle-exit. Queued invocations count: %ld", (uint8_t *)&v11, 0x1Cu);
      if (v9) {
    }
      }
  }
  if (!*(unsigned char *)(a1 + 48)) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void __38__WAClient__establishDaemonConnection__block_invoke_191(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136446722;
    uint64_t v6 = "-[WAClient _establishDaemonConnection]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 1095;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_21D96D000, v4, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: WA XPC API error: %@", (uint8_t *)&v5, 0x1Cu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __38__WAClient__establishDaemonConnection__block_invoke_192(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  __int16 v7 = WeakRetained;
  if (!a3)
  {
    [WeakRetained setDaemonConnectionValid:1];
    int v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 removeObserver:v7];

    __int16 v9 = [MEMORY[0x263F08A00] defaultCenter];
    id v10 = [v7 tokenForThisClient];
    [v9 addObserver:v7 selector:sel__wakeUpNotificationForThisClientReceived_ name:v10 object:0];

    uint64_t v11 = [v7 tokenForThisClient];

    if (!v11)
    {
      if (v5)
      {
        [v7 setTokenForThisClient:v5];
        dispatch_queue_t v12 = [v7 identifierForThisClient];
        +[WAUtil storeToken:v5 withIdentifier:v12];
      }
      else
      {
        uint64_t v16 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v17 = 136446466;
          __int16 v18 = "-[WAClient _establishDaemonConnection]_block_invoke";
          __int16 v19 = 1024;
          int v20 = 1110;
          _os_log_impl(&dword_21D96D000, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: Didn't supply a previously received token to WA daemon and didn't receive one back! Persistence *is* broken for this client", (uint8_t *)&v17, 0x12u);
        }
      }
    }
  }
  __int16 v13 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v14 = [v7 tokenForThisClient];
    __int16 v15 = [v7 identifierForThisClient];
    int v17 = 136446978;
    __int16 v18 = "-[WAClient _establishDaemonConnection]_block_invoke";
    __int16 v19 = 1024;
    int v20 = 1116;
    __int16 v21 = 2112;
    uint64_t v22 = v14;
    __int16 v23 = 2112;
    __int16 v24 = v15;
    _os_log_impl(&dword_21D96D000, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Connection established (token:%@ identifier:%@)", (uint8_t *)&v17, 0x26u);
  }
  if (!*(unsigned char *)(a1 + 48)) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

- (void)_reregister
{
  objc_initWeak(&location, self);
  id v3 = [(WAClient *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__WAClient__reregister__block_invoke;
  block[3] = &unk_2644673A8;
  objc_copyWeak(&v5, &location);
  void block[4] = self;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __23__WAClient__reregister__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  context = (void *)MEMORY[0x223C0F2E0]();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained registeredGroupTypes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        __int16 v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        int v8 = *(void **)(a1 + 32);
        uint64_t v9 = [v7 unsignedIntegerValue];
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __23__WAClient__reregister__block_invoke_2;
        v12[3] = &unk_264467268;
        void v12[4] = v7;
        [v8 _registerMessageGroup:v9 andReply:v12 queuedInvocation:0];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

void __23__WAClient__reregister__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = WALogCategoryDefaultHandle();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446722;
      dispatch_queue_t v12 = "-[WAClient _reregister]_block_invoke_2";
      __int16 v13 = 1024;
      int v14 = 1142;
      __int16 v15 = 2112;
      uint64_t v16 = (uint64_t)v4;
      __int16 v7 = "%{public}s::%d:XPC: Error ensuring registration is intact: %@";
      int v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_21D96D000, v8, v9, v7, (uint8_t *)&v11, 0x1Cu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = [*(id *)(a1 + 32) unsignedLongValue];
    int v11 = 136446722;
    dispatch_queue_t v12 = "-[WAClient _reregister]_block_invoke";
    __int16 v13 = 1024;
    int v14 = 1144;
    __int16 v15 = 2048;
    uint64_t v16 = v10;
    __int16 v7 = "%{public}s::%d:XPC: Successfully reregistered for group type: %lu";
    int v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
    goto LABEL_6;
  }
}

- (id)_getConnectionIssueHandlerBlock
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__WAClient__getConnectionIssueHandlerBlock__block_invoke;
  v4[3] = &unk_264467380;
  objc_copyWeak(&v5, &location);
  id v2 = (void *)MEMORY[0x223C0F530](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __43__WAClient__getConnectionIssueHandlerBlock__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startConnectionRecovery];
}

- (void)_removeAllQueuedInvocations
{
  objc_initWeak(&location, self);
  [(WAClient *)self setDaemonConnectionValid:0];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  int v8 = __39__WAClient__removeAllQueuedInvocations__block_invoke;
  os_log_type_t v9 = &unk_264467380;
  objc_copyWeak(&v10, &location);
  dispatch_block_t v3 = dispatch_block_create(DISPATCH_BLOCK_BARRIER, &v6);
  dispatch_time_t v4 = dispatch_time(0, 500000000);
  id v5 = [(WAClient *)self queue];
  dispatch_after(v4, v5, v3);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __39__WAClient__removeAllQueuedInvocations__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446466;
    id v5 = "-[WAClient _removeAllQueuedInvocations]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 1186;
    _os_log_impl(&dword_21D96D000, v2, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: replying with WAErrorCodeDaemonContactTimeout error to all requests and removing them", (uint8_t *)&v4, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _replyAllWithTimeoutErrorAndRemove];
}

- (void)_startConnectionRecovery
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  [(WAClient *)self connectionRecoveryStartTime];
  if (v3 >= 1.0)
  {
    __int16 v15 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v23 = "-[WAClient _startConnectionRecovery]";
      __int16 v24 = 1024;
      int v25 = 1197;
      _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: connection recovery already in progress, won't start another.", buf, 0x12u);
    }
  }
  else
  {
    [(WAClient *)self setDaemonConnectionValid:0];
    int v4 = [(WAClient *)self conn];

    if (v4)
    {
      id v5 = [(WAClient *)self conn];
      [v5 invalidate];
    }
    __int16 v6 = [MEMORY[0x263EFF910] date];
    [v6 timeIntervalSince1970];
    -[WAClient setConnectionRecoveryStartTime:](self, "setConnectionRecoveryStartTime:");

    int v7 = [(WAClient *)self recoveryTickBlock];
    if (v7)
    {
      uint64_t v8 = [(WAClient *)self recoveryTickBlock];
      BOOL v9 = dispatch_block_testcancel(v8) == 0;

      if (v9)
      {
        id v10 = [(WAClient *)self recoveryTickBlock];
        dispatch_block_cancel(v10);
      }
    }
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __36__WAClient__startConnectionRecovery__block_invoke;
    __int16 v19 = &unk_264467380;
    objc_copyWeak(&v20, &location);
    dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_BARRIER, &v16);
    -[WAClient setRecoveryTickBlock:](self, "setRecoveryTickBlock:", v11, v16, v17, v18, v19);

    dispatch_time_t v12 = dispatch_time(0, 500000000);
    __int16 v13 = [(WAClient *)self queue];
    int v14 = [(WAClient *)self recoveryTickBlock];
    dispatch_after(v12, v13, v14);

    objc_destroyWeak(&v20);
  }
  objc_destroyWeak(&location);
}

void __36__WAClient__startConnectionRecovery__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionRecoveryTick];
}

- (void)_connectionRecoveryTick
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  int v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    [(WAClient *)self connectionRecoveryStartTime];
    uint64_t v6 = v5;
    [(WAClient *)self connectionRecoveryStartTime];
    double v8 = v7;
    if (v7 < 2.22507386e-308)
    {
      double v12 = -1.0;
    }
    else
    {
      id v2 = [MEMORY[0x263EFF910] date];
      [v2 timeIntervalSince1970];
      double v10 = v9;
      [(WAClient *)self connectionRecoveryStartTime];
      double v12 = v10 - v11;
    }
    int v22 = 136446978;
    __int16 v23 = "-[WAClient _connectionRecoveryTick]";
    __int16 v24 = 1024;
    int v25 = 1222;
    __int16 v26 = 2048;
    uint64_t v27 = v6;
    __int16 v28 = 2048;
    double v29 = v12;
    _os_log_impl(&dword_21D96D000, v4, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: connectionRecoveryStartTime:%f delta:%f", (uint8_t *)&v22, 0x26u);
    if (v8 >= 2.22507386e-308) {
  }
    }
  if ([(WAClient *)self daemonConnectionValid])
  {
    [(WAClient *)self _connectionRecovered];
  }
  else
  {
    [(WAClient *)self connectionRecoveryStartTime];
    if (v13 >= 2.22507386e-308
      && ([MEMORY[0x263EFF910] date],
          int v14 = objc_claimAutoreleasedReturnValue(),
          [v14 timeIntervalSince1970],
          double v16 = v15,
          [(WAClient *)self connectionRecoveryStartTime],
          double v18 = v16 - v17,
          v14,
          v18 >= 60.0))
    {
      [(WAClient *)self _connectionTimedOut];
    }
    else
    {
      [(WAClient *)self _establishDaemonConnection];
      dispatch_time_t v19 = dispatch_time(0, 500000000);
      id v20 = [(WAClient *)self queue];
      __int16 v21 = [(WAClient *)self recoveryTickBlock];
      dispatch_after(v19, v20, v21);
    }
  }
}

- (void)_connectionTimedOut
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  double v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446466;
    uint64_t v5 = "-[WAClient _connectionTimedOut]";
    __int16 v6 = 1024;
    int v7 = 1235;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: connection recovery timed out, replying with WAErrorCodeDaemonContactTimeout error to all requests", (uint8_t *)&v4, 0x12u);
  }

  [(WAClient *)self _replyAllWithTimeoutErrorAndRemove];
}

- (void)_replyAllWithTimeoutErrorAndRemove
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  id v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = objc_loadWeakRetained(&location);
  id obj = [v3 queuedInvocations];

  uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        int v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v8 = [v7 reply];
        NSClassFromString(&cfstr_Nsblock.isa);
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          dispatch_group_enter(v2);
          double v10 = [(WAClient *)self replyQueue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __46__WAClient__replyAllWithTimeoutErrorAndRemove__block_invoke;
          block[3] = &unk_2644673D0;
          void block[4] = v7;
          objc_copyWeak(&v18, &location);
          double v17 = v2;
          dispatch_async(v10, block);

          objc_destroyWeak(&v18);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v4);
  }

  double v11 = [(WAClient *)self queue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__WAClient__replyAllWithTimeoutErrorAndRemove__block_invoke_3;
  v14[3] = &unk_264467380;
  objc_copyWeak(&v15, &location);
  dispatch_group_notify(v2, v11, v14);

  dispatch_group_leave(v2);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __46__WAClient__replyAllWithTimeoutErrorAndRemove__block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = [*(id *)(a1 + 32) reply];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) reply];
    uint64_t v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F08338];
    v14[0] = @"WAErrorCodeDaemonContactTimeout";
    __int16 v6 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    int v7 = [v5 errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9014 userInfo:v6];
    ((void (**)(void, void, void *))v4)[2](v4, 0, v7);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  double v9 = [WeakRetained queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__WAClient__replyAllWithTimeoutErrorAndRemove__block_invoke_2;
  block[3] = &unk_264466020;
  double v10 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v12 = v10;
  dispatch_sync(v9, block);
}

void __46__WAClient__replyAllWithTimeoutErrorAndRemove__block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  [*(id *)(a1 + 32) setInvocation:0];
  [*(id *)(a1 + 32) setReply:0];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __46__WAClient__replyAllWithTimeoutErrorAndRemove__block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained queuedInvocations];
  [v2 removeAllObjects];

  id v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446466;
    uint64_t v5 = "-[WAClient _replyAllWithTimeoutErrorAndRemove]_block_invoke_3";
    __int16 v6 = 1024;
    int v7 = 1260;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: Removed all queuedInvocations", (uint8_t *)&v4, 0x12u);
  }

  [WeakRetained setConnectionRecoveryStartTime:0.0];
}

- (void)_connectionRecovered
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  id v2 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    long long v21 = "-[WAClient _connectionRecovered]";
    __int16 v22 = 1024;
    int v23 = 1270;
    _os_log_impl(&dword_21D96D000, v2, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: CONNECTION RECOVERED", buf, 0x12u);
  }

  id v3 = +[WAClient sharedClient];
  id obj = [v3 queuedInvocations];

  objc_sync_enter(obj);
  id v13 = objc_loadWeakRetained(&location);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v4 = [v13 queuedInvocations];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        double v9 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          double v10 = [v8 invocation];
          double v11 = NSStringFromSelector((SEL)[v10 selector]);
          *(_DWORD *)buf = 136446722;
          long long v21 = "-[WAClient _connectionRecovered]";
          __int16 v22 = 1024;
          int v23 = 1274;
          __int16 v24 = 2112;
          uint64_t v25 = v11;
          _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Connection recovery invoke iteration... selector: %@", buf, 0x1Cu);
        }
        id v12 = [v8 invocation];
        [v12 invoke];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v26 count:16];
    }
    while (v5);
  }

  [v13 setConnectionRecoveryStartTime:0.0];
  objc_sync_exit(obj);

  objc_destroyWeak(&location);
}

- (NSMutableDictionary)interestedMessageIdentifiers
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  double v10 = __Block_byref_object_copy__3;
  double v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  id v3 = [(WAClient *)self propertyQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__WAClient_interestedMessageIdentifiers__block_invoke;
  v6[3] = &unk_2644673F8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSMutableDictionary *)v4;
}

void __40__WAClient_interestedMessageIdentifiers__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 8));
}

- (NSMutableDictionary)configuredMessageIdentifiers
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  double v10 = __Block_byref_object_copy__3;
  double v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  id v3 = [(WAClient *)self propertyQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__WAClient_configuredMessageIdentifiers__block_invoke;
  v6[3] = &unk_2644673F8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSMutableDictionary *)v4;
}

void __40__WAClient_configuredMessageIdentifiers__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 16));
}

- (void)setInterestedMessageIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WAClient *)self propertyQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__WAClient_setInterestedMessageIdentifiers___block_invoke;
  v7[3] = &unk_264466020;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

void __44__WAClient_setInterestedMessageIdentifiers___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (void)setConfiguredMessageIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WAClient *)self propertyQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__WAClient_setConfiguredMessageIdentifiers___block_invoke;
  v7[3] = &unk_264466020;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

void __44__WAClient_setConfiguredMessageIdentifiers___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (void)trapCrashMiniTracerDumpReadyForInterfaceWithName:(id)a3 andReply:(id)a4
{
}

- (void)_trapCrashMiniTracerDumpReadyForInterfaceWithName:(id)a3 andReply:(id)a4 queuedInvocation:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_initWeak(&location, self);
  id v12 = [(WAClient *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__WAClient__trapCrashMiniTracerDumpReadyForInterfaceWithName_andReply_queuedInvocation___block_invoke;
  block[3] = &unk_264467420;
  objc_copyWeak(v21, &location);
  v21[1] = (id)a2;
  id v17 = v11;
  long long v18 = self;
  id v19 = v9;
  id v20 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v12, block);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __88__WAClient__trapCrashMiniTracerDumpReadyForInterfaceWithName_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(void *)(a1 + 32))
  {
    uint64_t v5 = objc_alloc_init(WAQueuedInvocation);

    id v6 = [[InvokeMakerInfo alloc] initWithSel:*(void *)(a1 + 72) andTarget:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = (void *)MEMORY[0x223C0F530](*(void *)(a1 + 56));
    id v9 = +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v8, v5, 0);

    [(WAQueuedInvocation *)v5 setInvocation:v9];
    [(WAQueuedInvocation *)v5 setReply:*(void *)(a1 + 56)];
    id v10 = [WeakRetained queuedInvocations];
    [v10 addObject:v5];

    id v4 = v5;
  }
  if ([WeakRetained daemonConnectionValid])
  {
    id v11 = [WeakRetained conn];
    id v12 = [v11 remoteObjectProxyWithErrorHandler:&__block_literal_global_210];
    uint64_t v13 = *(void *)(a1 + 48);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    id v16[2] = __88__WAClient__trapCrashMiniTracerDumpReadyForInterfaceWithName_andReply_queuedInvocation___block_invoke_211;
    v16[3] = &unk_264467268;
    id v17 = v4;
    [v12 trapCrashMiniTracerDumpReadyForInterfaceWithName:v13 andReply:v16];

    id v14 = v17;
  }
  else
  {
    id v15 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v19 = "-[WAClient _trapCrashMiniTracerDumpReadyForInterfaceWithName:andReply:queuedInvocation:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 1334;
      _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    id v14 = [WeakRetained _getConnectionIssueHandlerBlock];
    v14[2]();
  }
}

void __88__WAClient__trapCrashMiniTracerDumpReadyForInterfaceWithName_andReply_queuedInvocation___block_invoke_208(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446722;
    uint64_t v5 = "-[WAClient _trapCrashMiniTracerDumpReadyForInterfaceWithName:andReply:queuedInvocation:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 1340;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - trapCrashMiniTracerDumpReady - error: %@", (uint8_t *)&v4, 0x1Cu);
  }
}

void __88__WAClient__trapCrashMiniTracerDumpReadyForInterfaceWithName_andReply_queuedInvocation___block_invoke_211(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 code] == 9009)
  {
    uint64_t v5 = +[WAClient sharedClient];
    [v5 _reregister];
  }
  __int16 v6 = +[WAClient sharedClient];
  int v7 = [v6 replyQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __88__WAClient__trapCrashMiniTracerDumpReadyForInterfaceWithName_andReply_queuedInvocation___block_invoke_2;
  v9[3] = &unk_264466020;
  id v10 = *(id *)(a1 + 32);
  id v11 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

void __88__WAClient__trapCrashMiniTracerDumpReadyForInterfaceWithName_andReply_queuedInvocation___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = [*(id *)(a1 + 32) reply];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) reply];
    v4[2](v4, 0, *(void *)(a1 + 40));
  }
  uint64_t v5 = +[WAClient sharedClient];
  [v5 _dequeueInvocation:*(void *)(a1 + 32)];
}

- (void)lqmCrashTracerNotifyForInterfaceWithName:(id)a3 andReply:(id)a4
{
}

- (void)_lqmCrashTracerNotifyForInterfaceWithName:(id)a3 andReply:(id)a4 queuedInvocation:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_initWeak(&location, self);
  id v12 = [(WAClient *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__WAClient__lqmCrashTracerNotifyForInterfaceWithName_andReply_queuedInvocation___block_invoke;
  block[3] = &unk_264467420;
  objc_copyWeak(v21, &location);
  v21[1] = (id)a2;
  id v17 = v11;
  long long v18 = self;
  id v19 = v9;
  id v20 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v12, block);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __80__WAClient__lqmCrashTracerNotifyForInterfaceWithName_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(void *)(a1 + 32))
  {
    uint64_t v5 = objc_alloc_init(WAQueuedInvocation);

    __int16 v6 = [[InvokeMakerInfo alloc] initWithSel:*(void *)(a1 + 72) andTarget:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = (void *)MEMORY[0x223C0F530](*(void *)(a1 + 56));
    id v9 = +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v8, v5, 0);

    [(WAQueuedInvocation *)v5 setInvocation:v9];
    [(WAQueuedInvocation *)v5 setReply:*(void *)(a1 + 56)];
    id v10 = [WeakRetained queuedInvocations];
    [v10 addObject:v5];

    id v4 = v5;
  }
  if ([WeakRetained daemonConnectionValid])
  {
    id v11 = [WeakRetained conn];
    id v12 = [v11 remoteObjectProxyWithErrorHandler:&__block_literal_global_214];
    uint64_t v13 = *(void *)(a1 + 48);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    id v16[2] = __80__WAClient__lqmCrashTracerNotifyForInterfaceWithName_andReply_queuedInvocation___block_invoke_215;
    v16[3] = &unk_264467268;
    id v17 = v4;
    [v12 lqmCrashTracerNotifyForInterfaceWithName:v13 andReply:v16];

    id v14 = v17;
  }
  else
  {
    id v15 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v19 = "-[WAClient _lqmCrashTracerNotifyForInterfaceWithName:andReply:queuedInvocation:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 1379;
      _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    id v14 = [WeakRetained _getConnectionIssueHandlerBlock];
    v14[2]();
  }
}

void __80__WAClient__lqmCrashTracerNotifyForInterfaceWithName_andReply_queuedInvocation___block_invoke_212(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446722;
    uint64_t v5 = "-[WAClient _lqmCrashTracerNotifyForInterfaceWithName:andReply:queuedInvocation:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 1385;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - lqmCrashTracerNotify - error: %@", (uint8_t *)&v4, 0x1Cu);
  }
}

void __80__WAClient__lqmCrashTracerNotifyForInterfaceWithName_andReply_queuedInvocation___block_invoke_215(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 code] == 9009)
  {
    uint64_t v5 = +[WAClient sharedClient];
    [v5 _reregister];
  }
  __int16 v6 = +[WAClient sharedClient];
  int v7 = [v6 replyQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __80__WAClient__lqmCrashTracerNotifyForInterfaceWithName_andReply_queuedInvocation___block_invoke_2;
  v9[3] = &unk_264466020;
  id v10 = *(id *)(a1 + 32);
  id v11 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

void __80__WAClient__lqmCrashTracerNotifyForInterfaceWithName_andReply_queuedInvocation___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = [*(id *)(a1 + 32) reply];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) reply];
    v4[2](v4, 0, *(void *)(a1 + 40));
  }
  uint64_t v5 = +[WAClient sharedClient];
  [v5 _dequeueInvocation:*(void *)(a1 + 32)];
}

- (void)lqmCrashTracerReceiveBlock:(id)a3 forInterfaceWithName:(id)a4 andReply:(id)a5
{
}

- (void)_lqmCrashTracerReceiveBlock:(id)a3 forInterfaceWithName:(id)a4 andReply:(id)a5 queuedInvocation:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  objc_initWeak(&location, self);
  id v15 = [(WAClient *)self queue];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __87__WAClient__lqmCrashTracerReceiveBlock_forInterfaceWithName_andReply_queuedInvocation___block_invoke;
  v20[3] = &unk_264467448;
  objc_copyWeak(v26, &location);
  id v21 = v14;
  uint64_t v22 = self;
  id v23 = v11;
  id v24 = v12;
  v26[1] = (id)a2;
  id v25 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v14;
  dispatch_async(v15, v20);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
}

void __87__WAClient__lqmCrashTracerReceiveBlock_forInterfaceWithName_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(void *)(a1 + 32))
  {
    uint64_t v5 = objc_alloc_init(WAQueuedInvocation);

    __int16 v6 = [[InvokeMakerInfo alloc] initWithSel:*(void *)(a1 + 80) andTarget:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    id v9 = (void *)MEMORY[0x223C0F530](*(void *)(a1 + 64));
    id v10 = +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v8, v9, v5, 0);

    [(WAQueuedInvocation *)v5 setInvocation:v10];
    [(WAQueuedInvocation *)v5 setReply:*(void *)(a1 + 64)];
    id v11 = [WeakRetained queuedInvocations];
    [v11 addObject:v5];

    id v4 = v5;
  }
  if ([WeakRetained daemonConnectionValid])
  {
    id v12 = [WeakRetained conn];
    id v13 = [v12 remoteObjectProxyWithErrorHandler:&__block_literal_global_218];
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 56);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __87__WAClient__lqmCrashTracerReceiveBlock_forInterfaceWithName_andReply_queuedInvocation___block_invoke_219;
    id v18[3] = &unk_264467268;
    id v19 = v4;
    [v13 lqmCrashTracerReceiveBlock:v15 forInterfaceWithName:v14 andReply:v18];

    id v16 = v19;
  }
  else
  {
    id v17 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v21 = "-[WAClient _lqmCrashTracerReceiveBlock:forInterfaceWithName:andReply:queuedInvocation:]_block_invoke";
      __int16 v22 = 1024;
      int v23 = 1425;
      _os_log_impl(&dword_21D96D000, v17, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    id v16 = [WeakRetained _getConnectionIssueHandlerBlock];
    v16[2]();
  }
}

void __87__WAClient__lqmCrashTracerReceiveBlock_forInterfaceWithName_andReply_queuedInvocation___block_invoke_216(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446722;
    uint64_t v5 = "-[WAClient _lqmCrashTracerReceiveBlock:forInterfaceWithName:andReply:queuedInvocation:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 1431;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - lqmCrashTracerReceiveBlock - error: %@", (uint8_t *)&v4, 0x1Cu);
  }
}

void __87__WAClient__lqmCrashTracerReceiveBlock_forInterfaceWithName_andReply_queuedInvocation___block_invoke_219(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 code] == 9009)
  {
    uint64_t v5 = +[WAClient sharedClient];
    [v5 _reregister];
  }
  __int16 v6 = +[WAClient sharedClient];
  int v7 = [v6 replyQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __87__WAClient__lqmCrashTracerReceiveBlock_forInterfaceWithName_andReply_queuedInvocation___block_invoke_2;
  v9[3] = &unk_264466020;
  id v10 = *(id *)(a1 + 32);
  id v11 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

void __87__WAClient__lqmCrashTracerReceiveBlock_forInterfaceWithName_andReply_queuedInvocation___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = [*(id *)(a1 + 32) reply];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) reply];
    v4[2](v4, 0, *(void *)(a1 + 40));
  }
  uint64_t v5 = +[WAClient sharedClient];
  [v5 _dequeueInvocation:*(void *)(a1 + 32)];
}

- (void)setDeviceAnalyticsConfiguration:(id)a3 andReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(WAClient *)self setDeviceAnalyticsConfig:v7];
  [(WAClient *)self _setDeviceAnalyticsConfiguration:v7 andReply:v6 queuedInvocation:0];
}

- (void)_setDeviceAnalyticsConfiguration:(id)a3 andReply:(id)a4 queuedInvocation:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_initWeak(&location, self);
  if (v9)
  {
    id v12 = [(WAClient *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__WAClient__setDeviceAnalyticsConfiguration_andReply_queuedInvocation___block_invoke;
    block[3] = &unk_264467420;
    objc_copyWeak(v20, &location);
    id v13 = v11;
    v20[1] = (id)a2;
    id v16 = v13;
    id v17 = self;
    id v18 = v9;
    id v19 = v10;
    dispatch_async(v12, block);

    objc_destroyWeak(v20);
  }
  else
  {
    uint64_t v14 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      int v23 = "-[WAClient _setDeviceAnalyticsConfiguration:andReply:queuedInvocation:]";
      __int16 v24 = 1024;
      int v25 = 1462;
      _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:configurationDict argument is null, bailing", buf, 0x12u);
    }
  }
  objc_destroyWeak(&location);
}

void __71__WAClient__setDeviceAnalyticsConfiguration_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(void *)(a1 + 32))
  {
    uint64_t v5 = objc_alloc_init(WAQueuedInvocation);

    id v6 = [[InvokeMakerInfo alloc] initWithSel:*(void *)(a1 + 72) andTarget:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = (void *)MEMORY[0x223C0F530](*(void *)(a1 + 56));
    id v9 = +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v8, v5, 0);

    [(WAQueuedInvocation *)v5 setInvocation:v9];
    [(WAQueuedInvocation *)v5 setReply:*(void *)(a1 + 56)];
    id v10 = [WeakRetained queuedInvocations];
    [v10 addObject:v5];

    id v4 = v5;
  }
  if ([WeakRetained daemonConnectionValid])
  {
    id v11 = [WeakRetained conn];
    id v12 = [v11 remoteObjectProxyWithErrorHandler:&__block_literal_global_222];
    uint64_t v13 = *(void *)(a1 + 48);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    id v16[2] = __71__WAClient__setDeviceAnalyticsConfiguration_andReply_queuedInvocation___block_invoke_223;
    v16[3] = &unk_264467268;
    id v17 = v4;
    [v12 setDeviceAnalyticsConfiguration:v13 andReply:v16];

    uint64_t v14 = v17;
  }
  else
  {
    uint64_t v15 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v19 = "-[WAClient _setDeviceAnalyticsConfiguration:andReply:queuedInvocation:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 1477;
      _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    uint64_t v14 = [WeakRetained _getConnectionIssueHandlerBlock];
    v14[2]();
  }
}

void __71__WAClient__setDeviceAnalyticsConfiguration_andReply_queuedInvocation___block_invoke_220(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446722;
    uint64_t v5 = "-[WAClient _setDeviceAnalyticsConfiguration:andReply:queuedInvocation:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 1483;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - setDeviceAnalyticsConfiguration - error: %@", (uint8_t *)&v4, 0x1Cu);
  }
}

void __71__WAClient__setDeviceAnalyticsConfiguration_andReply_queuedInvocation___block_invoke_223(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 code] == 9009)
  {
    int v7 = +[WAClient sharedClient];
    [v7 _reregister];
  }
  __int16 v8 = +[WAClient sharedClient];
  id v9 = [v8 replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__WAClient__setDeviceAnalyticsConfiguration_andReply_queuedInvocation___block_invoke_2;
  block[3] = &unk_2644671F0;
  id v13 = *(id *)(a1 + 32);
  id v14 = v5;
  id v15 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, block);
}

void __71__WAClient__setDeviceAnalyticsConfiguration_andReply_queuedInvocation___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = [*(id *)(a1 + 32) reply];

  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) reply];
    v4[2](v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  id v5 = +[WAClient sharedClient];
  [v5 _dequeueInvocation:*(void *)(a1 + 32)];
}

- (void)getDeviceAnalyticsConfigurationAndReply:(id)a3
{
}

- (void)_getDeviceAnalyticsConfigurationAndReply:(id)a3 queuedInvocation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  id v9 = [(WAClient *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __70__WAClient__getDeviceAnalyticsConfigurationAndReply_queuedInvocation___block_invoke;
  v12[3] = &unk_264467040;
  objc_copyWeak(v16, &location);
  id v13 = v8;
  id v14 = self;
  v16[1] = (id)a2;
  id v15 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __70__WAClient__getDeviceAnalyticsConfigurationAndReply_queuedInvocation___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(void *)(a1 + 32))
  {
    id v5 = objc_alloc_init(WAQueuedInvocation);

    id v6 = [[InvokeMakerInfo alloc] initWithSel:*(void *)(a1 + 64) andTarget:*(void *)(a1 + 40)];
    id v7 = (void *)MEMORY[0x223C0F530](*(void *)(a1 + 48));
    id v8 = +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v5, 0);

    [(WAQueuedInvocation *)v5 setInvocation:v8];
    [(WAQueuedInvocation *)v5 setReply:*(void *)(a1 + 48)];
    id v9 = [WeakRetained queuedInvocations];
    [v9 addObject:v5];

    int v4 = v5;
  }
  if ([WeakRetained daemonConnectionValid])
  {
    id v10 = [WeakRetained conn];
    id v11 = [v10 remoteObjectProxyWithErrorHandler:&__block_literal_global_226];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __70__WAClient__getDeviceAnalyticsConfigurationAndReply_queuedInvocation___block_invoke_227;
    v14[3] = &unk_264467268;
    id v15 = v4;
    [v11 getDeviceAnalyticsConfigurationAndReply:v14];

    id v12 = v15;
  }
  else
  {
    id v13 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v17 = "-[WAClient _getDeviceAnalyticsConfigurationAndReply:queuedInvocation:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 1523;
      _os_log_impl(&dword_21D96D000, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    id v12 = [WeakRetained _getConnectionIssueHandlerBlock];
    v12[2]();
  }
}

void __70__WAClient__getDeviceAnalyticsConfigurationAndReply_queuedInvocation___block_invoke_224(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446722;
    id v5 = "-[WAClient _getDeviceAnalyticsConfigurationAndReply:queuedInvocation:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 1528;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - getDeviceAnalyticsConfigurationAndReply - error: %@", (uint8_t *)&v4, 0x1Cu);
  }
}

void __70__WAClient__getDeviceAnalyticsConfigurationAndReply_queuedInvocation___block_invoke_227(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v19 = "-[WAClient _getDeviceAnalyticsConfigurationAndReply:queuedInvocation:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 1532;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - _getDeviceAnalyticsConfigurationAndReply - error: %@", buf, 0x1Cu);
    }
  }
  id v8 = v6;
  if ([v8 code] == 9009)
  {
    id v9 = +[WAClient sharedClient];
    [v9 _reregister];
  }
  uint64_t v10 = +[WAClient sharedClient];
  id v11 = [v10 replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__WAClient__getDeviceAnalyticsConfigurationAndReply_queuedInvocation___block_invoke_228;
  block[3] = &unk_2644671F0;
  id v15 = *(id *)(a1 + 32);
  id v16 = v5;
  id v17 = v8;
  id v12 = v8;
  id v13 = v5;
  dispatch_async(v11, block);
}

void __70__WAClient__getDeviceAnalyticsConfigurationAndReply_queuedInvocation___block_invoke_228(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = [*(id *)(a1 + 32) reply];

  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) reply];
    v4[2](v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  id v5 = +[WAClient sharedClient];
  [v5 _dequeueInvocation:*(void *)(a1 + 32)];
}

- (void)summarizeDeviceAnalyticsForNetwork:(id)a3 maxAgeInDays:(unint64_t)a4 andReply:(id)a5
{
}

- (void)summarizeDeviceAnalyticsForNetwork:(id)a3 maxAgeInDays:(unint64_t)a4 andReply:(id)a5 queuedInvocation:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  id v14 = [(WAClient *)self queue];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __86__WAClient_summarizeDeviceAnalyticsForNetwork_maxAgeInDays_andReply_queuedInvocation___block_invoke;
  id v18[3] = &unk_2644672B8;
  objc_copyWeak(v23, &location);
  id v19 = v13;
  __int16 v20 = self;
  v23[1] = (id)a2;
  id v23[2] = (id)a4;
  id v21 = v11;
  id v22 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  dispatch_async(v14, v18);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
}

void __86__WAClient_summarizeDeviceAnalyticsForNetwork_maxAgeInDays_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  int v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(void *)(a1 + 32))
  {
    id v5 = objc_alloc_init(WAQueuedInvocation);

    id v6 = [[InvokeMakerInfo alloc] initWithSel:*(void *)(a1 + 72) andTarget:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(a1 + 80);
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = (void *)MEMORY[0x223C0F530](*(void *)(a1 + 56));
    uint64_t v10 = +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v8, v7, v9, v5, 0);

    [(WAQueuedInvocation *)v5 setInvocation:v10];
    [(WAQueuedInvocation *)v5 setReply:*(void *)(a1 + 56)];
    id v11 = [WeakRetained queuedInvocations];
    [v11 addObject:v5];

    int v4 = v5;
  }
  if ([WeakRetained daemonConnectionValid])
  {
    id v12 = [WeakRetained conn];
    id v13 = [v12 remoteObjectProxyWithErrorHandler:&__block_literal_global_231];
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 80);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __86__WAClient_summarizeDeviceAnalyticsForNetwork_maxAgeInDays_andReply_queuedInvocation___block_invoke_232;
    id v18[3] = &unk_264467268;
    id v19 = v4;
    [v13 summarizeDeviceAnalyticsForNetwork:v14 maxAgeInDays:v15 andReply:v18];

    id v16 = v19;
  }
  else
  {
    id v17 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v21 = "-[WAClient summarizeDeviceAnalyticsForNetwork:maxAgeInDays:andReply:queuedInvocation:]_block_invoke";
      __int16 v22 = 1024;
      int v23 = 1567;
      _os_log_impl(&dword_21D96D000, v17, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    id v16 = [WeakRetained _getConnectionIssueHandlerBlock];
    v16[2]();
  }
}

void __86__WAClient_summarizeDeviceAnalyticsForNetwork_maxAgeInDays_andReply_queuedInvocation___block_invoke_229(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446722;
    id v5 = "-[WAClient summarizeDeviceAnalyticsForNetwork:maxAgeInDays:andReply:queuedInvocation:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 1573;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - summarizeDeviceAnalyticsForNetwork - error: %@", (uint8_t *)&v4, 0x1Cu);
  }
}

void __86__WAClient_summarizeDeviceAnalyticsForNetwork_maxAgeInDays_andReply_queuedInvocation___block_invoke_232(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 code] == 9009)
  {
    int v7 = +[WAClient sharedClient];
    [v7 _reregister];
  }
  __int16 v8 = +[WAClient sharedClient];
  id v9 = [v8 replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__WAClient_summarizeDeviceAnalyticsForNetwork_maxAgeInDays_andReply_queuedInvocation___block_invoke_2;
  block[3] = &unk_2644671F0;
  id v13 = *(id *)(a1 + 32);
  id v14 = v5;
  id v15 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, block);
}

void __86__WAClient_summarizeDeviceAnalyticsForNetwork_maxAgeInDays_andReply_queuedInvocation___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = [*(id *)(a1 + 32) reply];

  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) reply];
    v4[2](v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  id v5 = +[WAClient sharedClient];
  [v5 _dequeueInvocation:*(void *)(a1 + 32)];
}

- (void)triggerDeviceAnalyticsStoreMigrationAndReply:(id)a3
{
}

- (void)_triggerDeviceAnalyticsStoreMigrationAndReply:(id)a3 queuedInvocation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  id v9 = [(WAClient *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__WAClient__triggerDeviceAnalyticsStoreMigrationAndReply_queuedInvocation___block_invoke;
  v12[3] = &unk_264467040;
  objc_copyWeak(v16, &location);
  id v13 = v8;
  id v14 = self;
  v16[1] = (id)a2;
  id v15 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __75__WAClient__triggerDeviceAnalyticsStoreMigrationAndReply_queuedInvocation___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(void *)(a1 + 32))
  {
    id v5 = objc_alloc_init(WAQueuedInvocation);

    id v6 = [[InvokeMakerInfo alloc] initWithSel:*(void *)(a1 + 64) andTarget:*(void *)(a1 + 40)];
    id v7 = (void *)MEMORY[0x223C0F530](*(void *)(a1 + 48));
    id v8 = +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v5, 0);

    [(WAQueuedInvocation *)v5 setInvocation:v8];
    [(WAQueuedInvocation *)v5 setReply:*(void *)(a1 + 48)];
    id v9 = [WeakRetained queuedInvocations];
    [v9 addObject:v5];

    int v4 = v5;
  }
  if ([WeakRetained daemonConnectionValid])
  {
    id v10 = [WeakRetained conn];
    id v11 = [v10 remoteObjectProxyWithErrorHandler:&__block_literal_global_235];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __75__WAClient__triggerDeviceAnalyticsStoreMigrationAndReply_queuedInvocation___block_invoke_236;
    v14[3] = &unk_264467268;
    id v15 = v4;
    [v11 triggerDeviceAnalyticsStoreMigrationAndReply:v14];

    id v12 = v15;
  }
  else
  {
    id v13 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v17 = "-[WAClient _triggerDeviceAnalyticsStoreMigrationAndReply:queuedInvocation:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 1610;
      _os_log_impl(&dword_21D96D000, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    id v12 = [WeakRetained _getConnectionIssueHandlerBlock];
    v12[2]();
  }
}

void __75__WAClient__triggerDeviceAnalyticsStoreMigrationAndReply_queuedInvocation___block_invoke_233(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446722;
    id v5 = "-[WAClient _triggerDeviceAnalyticsStoreMigrationAndReply:queuedInvocation:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 1615;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - _triggerDeviceAnalyticsStoreMigrationAndReply - error: %@", (uint8_t *)&v4, 0x1Cu);
  }
}

void __75__WAClient__triggerDeviceAnalyticsStoreMigrationAndReply_queuedInvocation___block_invoke_236(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v19 = "-[WAClient _triggerDeviceAnalyticsStoreMigrationAndReply:queuedInvocation:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 1619;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - _triggerDeviceAnalyticsStoreMigrationAndReply - error: %@", buf, 0x1Cu);
    }
  }
  id v8 = v6;
  if ([v8 code] == 9009)
  {
    id v9 = +[WAClient sharedClient];
    [v9 _reregister];
  }
  uint64_t v10 = +[WAClient sharedClient];
  id v11 = [v10 replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__WAClient__triggerDeviceAnalyticsStoreMigrationAndReply_queuedInvocation___block_invoke_237;
  block[3] = &unk_2644671F0;
  id v15 = *(id *)(a1 + 32);
  id v16 = v5;
  id v17 = v8;
  id v12 = v8;
  id v13 = v5;
  dispatch_async(v11, block);
}

void __75__WAClient__triggerDeviceAnalyticsStoreMigrationAndReply_queuedInvocation___block_invoke_237(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = [*(id *)(a1 + 32) reply];

  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) reply];
    v4[2](v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  id v5 = +[WAClient sharedClient];
  [v5 _dequeueInvocation:*(void *)(a1 + 32)];
}

- (void)issueIOReportManagementCommand:(unint64_t)a3 andReply:(id)a4
{
}

- (void)_issueIOReportManagementCommand:(unint64_t)a3 andReply:(id)a4 queuedInvocation:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(WAClient *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__WAClient__issueIOReportManagementCommand_andReply_queuedInvocation___block_invoke;
  block[3] = &unk_264467240;
  objc_copyWeak(v18, &location);
  id v15 = v10;
  id v16 = self;
  v18[1] = (id)a2;
  v18[2] = (id)a3;
  id v17 = v9;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(v11, block);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

void __70__WAClient__issueIOReportManagementCommand_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(void *)(a1 + 32))
  {
    id v5 = objc_alloc_init(WAQueuedInvocation);

    id v6 = [[InvokeMakerInfo alloc] initWithSel:*(void *)(a1 + 64) andTarget:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(a1 + 72);
    id v8 = (void *)MEMORY[0x223C0F530](*(void *)(a1 + 48));
    id v9 = +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v8, v5, 0);

    [(WAQueuedInvocation *)v5 setInvocation:v9];
    [(WAQueuedInvocation *)v5 setReply:*(void *)(a1 + 48)];
    id v10 = [WeakRetained queuedInvocations];
    [v10 addObject:v5];

    int v4 = v5;
  }
  if ([WeakRetained daemonConnectionValid])
  {
    id v11 = [WeakRetained conn];
    id v12 = [v11 remoteObjectProxyWithErrorHandler:&__block_literal_global_240];
    uint64_t v13 = *(void *)(a1 + 72);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    id v16[2] = __70__WAClient__issueIOReportManagementCommand_andReply_queuedInvocation___block_invoke_241;
    v16[3] = &unk_264467268;
    id v17 = v4;
    [v12 issueIOReportManagementCommand:v13 andReply:v16];

    id v14 = v17;
  }
  else
  {
    id v15 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      int v19 = "-[WAClient _issueIOReportManagementCommand:andReply:queuedInvocation:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 1654;
      _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    id v14 = [WeakRetained _getConnectionIssueHandlerBlock];
    v14[2]();
  }
}

void __70__WAClient__issueIOReportManagementCommand_andReply_queuedInvocation___block_invoke_238(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446722;
    id v5 = "-[WAClient _issueIOReportManagementCommand:andReply:queuedInvocation:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 1659;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - _issueIOReportManagementCommand - error: %@", (uint8_t *)&v4, 0x1Cu);
  }
}

void __70__WAClient__issueIOReportManagementCommand_andReply_queuedInvocation___block_invoke_241(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v19 = "-[WAClient _issueIOReportManagementCommand:andReply:queuedInvocation:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 1663;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - issueIOReportManagementCommand - error: %@", buf, 0x1Cu);
    }
  }
  id v8 = v6;
  if ([v8 code] == 9009)
  {
    id v9 = +[WAClient sharedClient];
    [v9 _reregister];
  }
  uint64_t v10 = +[WAClient sharedClient];
  id v11 = [v10 replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__WAClient__issueIOReportManagementCommand_andReply_queuedInvocation___block_invoke_242;
  block[3] = &unk_2644671F0;
  id v15 = *(id *)(a1 + 32);
  id v16 = v5;
  id v17 = v8;
  id v12 = v8;
  id v13 = v5;
  dispatch_async(v11, block);
}

void __70__WAClient__issueIOReportManagementCommand_andReply_queuedInvocation___block_invoke_242(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = [*(id *)(a1 + 32) reply];

  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) reply];
    v4[2](v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  id v5 = +[WAClient sharedClient];
  [v5 _dequeueInvocation:*(void *)(a1 + 32)];
}

- (void)getUsageStatsandReply:(id)a3
{
}

- (void)_getUsageStatsandReply:(id)a3 queuedInvocation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  id v9 = [(WAClient *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__WAClient__getUsageStatsandReply_queuedInvocation___block_invoke;
  v12[3] = &unk_264467040;
  objc_copyWeak(v16, &location);
  id v13 = v8;
  id v14 = self;
  v16[1] = (id)a2;
  id v15 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __52__WAClient__getUsageStatsandReply_queuedInvocation___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(void *)(a1 + 32))
  {
    id v5 = objc_alloc_init(WAQueuedInvocation);

    id v6 = [[InvokeMakerInfo alloc] initWithSel:*(void *)(a1 + 64) andTarget:*(void *)(a1 + 40)];
    id v7 = (void *)MEMORY[0x223C0F530](*(void *)(a1 + 48));
    id v8 = +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v5, 0);

    [(WAQueuedInvocation *)v5 setInvocation:v8];
    [(WAQueuedInvocation *)v5 setReply:*(void *)(a1 + 48)];
    id v9 = [WeakRetained queuedInvocations];
    [v9 addObject:v5];

    int v4 = v5;
  }
  if ([WeakRetained daemonConnectionValid])
  {
    id v10 = [WeakRetained conn];
    id v11 = [v10 remoteObjectProxyWithErrorHandler:&__block_literal_global_245];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __52__WAClient__getUsageStatsandReply_queuedInvocation___block_invoke_246;
    v14[3] = &unk_264467268;
    id v15 = v4;
    [v11 getUsageStatsandReply:v14];

    id v12 = v15;
  }
  else
  {
    id v13 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v17 = "-[WAClient _getUsageStatsandReply:queuedInvocation:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 1697;
      _os_log_impl(&dword_21D96D000, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    id v12 = [WeakRetained _getConnectionIssueHandlerBlock];
    v12[2]();
  }
}

void __52__WAClient__getUsageStatsandReply_queuedInvocation___block_invoke_243(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446722;
    id v5 = "-[WAClient _getUsageStatsandReply:queuedInvocation:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 1702;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - getUsageStatsandReply - error: %@", (uint8_t *)&v4, 0x1Cu);
  }
}

void __52__WAClient__getUsageStatsandReply_queuedInvocation___block_invoke_246(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v19 = "-[WAClient _getUsageStatsandReply:queuedInvocation:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 1706;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - getUsageStatsandReply - error: %@", buf, 0x1Cu);
    }
  }
  id v8 = v6;
  if ([v8 code] == 9009)
  {
    id v9 = +[WAClient sharedClient];
    [v9 _reregister];
  }
  uint64_t v10 = +[WAClient sharedClient];
  id v11 = [v10 replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__WAClient__getUsageStatsandReply_queuedInvocation___block_invoke_247;
  block[3] = &unk_2644671F0;
  id v15 = *(id *)(a1 + 32);
  id v16 = v5;
  id v17 = v8;
  id v12 = v8;
  id v13 = v5;
  dispatch_async(v11, block);
}

void __52__WAClient__getUsageStatsandReply_queuedInvocation___block_invoke_247(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = [*(id *)(a1 + 32) reply];

  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) reply];
    v4[2](v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  id v5 = +[WAClient sharedClient];
  [v5 _dequeueInvocation:*(void *)(a1 + 32)];
}

- (void)fakeDaemonConnectionDead:(unsigned __int8)a3
{
  objc_initWeak(&location, self);
  id v5 = [(WAClient *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__WAClient_fakeDaemonConnectionDead___block_invoke;
  block[3] = &unk_264467470;
  unsigned __int8 v8 = a3;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __37__WAClient_fakeDaemonConnectionDead___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  id v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 40)) {
      int v4 = @"ACTIVE";
    }
    else {
      int v4 = @"INACTIVE";
    }
    id v5 = [MEMORY[0x263F08B88] callStackSymbols];
    int v9 = 136446978;
    uint64_t v10 = "-[WAClient fakeDaemonConnectionDead:]_block_invoke";
    __int16 v11 = 1024;
    int v12 = 1724;
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:XPC: Faking dead daemon connection is: %@ - stack: %@", (uint8_t *)&v9, 0x26u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setDaemonConnectionValid:*(unsigned char *)(a1 + 40) == 0];
  if (![WeakRetained daemonConnectionValid])
  {
    id v7 = [WeakRetained conn];

    if (v7)
    {
      unsigned __int8 v8 = [WeakRetained conn];
      [v8 invalidate];
    }
  }
  [WeakRetained setBlockDaemonConnection:*(unsigned __int8 *)(a1 + 40)];
  if (!*(unsigned char *)(a1 + 40)) {
    [WeakRetained _establishDaemonConnection];
  }
}

- (NSXPCConnection)conn
{
  return self->_conn;
}

- (void)setConn:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)replyQueue
{
  return self->_replyQueue;
}

- (void)setReplyQueue:(id)a3
{
}

- (OS_dispatch_queue)propertyQueue
{
  return self->_propertyQueue;
}

- (void)setPropertyQueue:(id)a3
{
}

- (OS_dispatch_queue)fileHandlingQueue
{
  return self->_fileHandlingQueue;
}

- (void)setFileHandlingQueue:(id)a3
{
}

- (OS_dispatch_queue)queryableQueue
{
  return self->_queryableQueue;
}

- (void)setQueryableQueue:(id)a3
{
}

- (NSMutableArray)queuedInvocations
{
  return self->_queuedInvocations;
}

- (void)setQueuedInvocations:(id)a3
{
}

- (double)connectionRecoveryStartTime
{
  return self->_connectionRecoveryStartTime;
}

- (void)setConnectionRecoveryStartTime:(double)a3
{
  self->_connectionRecoveryStartTime = a3;
}

- (void)setDaemonConnectionValid:(unsigned __int8)a3
{
  self->_daemonConnectionValid = a3;
}

- (unsigned)blockDaemonConnection
{
  return self->_blockDaemonConnection;
}

- (void)setBlockDaemonConnection:(unsigned __int8)a3
{
  self->_blockDaemonConnection = a3;
}

- (id)recoveryTickBlock
{
  return self->_recoveryTickBlock;
}

- (void)setRecoveryTickBlock:(id)a3
{
}

- (NSString)tokenForThisClient
{
  return self->_tokenForThisClient;
}

- (void)setTokenForThisClient:(id)a3
{
}

- (NSString)identifierForThisClient
{
  return self->_identifierForThisClient;
}

- (void)setIdentifierForThisClient:(id)a3
{
}

- (NSMutableSet)registeredGroupTypes
{
  return self->_registeredGroupTypes;
}

- (void)setRegisteredGroupTypes:(id)a3
{
}

- (NSURL)wifianalyticsTmpDir
{
  return self->_wifianalyticsTmpDir;
}

- (void)setWifianalyticsTmpDir:(id)a3
{
}

- (NSDictionary)deviceAnalyticsConfig
{
  return self->_deviceAnalyticsConfig;
}

- (void)setDeviceAnalyticsConfig:(id)a3
{
}

- (double)allowPurgeJSONFilesAfterSec
{
  return self->_allowPurgeJSONFilesAfterSec;
}

- (void)setAllowPurgeJSONFilesAfterSec:(double)a3
{
  self->_allowPurgeJSONFilesAfterSec = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAnalyticsConfig, 0);
  objc_storeStrong((id *)&self->_wifianalyticsTmpDir, 0);
  objc_storeStrong((id *)&self->_registeredGroupTypes, 0);
  objc_storeStrong((id *)&self->_identifierForThisClient, 0);
  objc_storeStrong((id *)&self->_tokenForThisClient, 0);
  objc_storeStrong(&self->_recoveryTickBlock, 0);
  objc_storeStrong((id *)&self->_queuedInvocations, 0);
  objc_storeStrong((id *)&self->_queryableQueue, 0);
  objc_storeStrong((id *)&self->_fileHandlingQueue, 0);
  objc_storeStrong((id *)&self->_propertyQueue, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_conn, 0);
  objc_storeStrong((id *)&self->_configuredMessageIdentifiers, 0);
  objc_storeStrong((id *)&self->_interestedMessageIdentifiers, 0);
}

@end