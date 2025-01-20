@interface MTStandardIDService
+ (BOOL)isTinkerPaired;
+ (NSString)localCachePath;
+ (id)writeDebugData:(id)a3 toFileWithNameFormat:(id)a4;
+ (void)registerInterprocessChangeNotifier:(id)a3;
+ (void)setLocalCachePath:(id)a3;
+ (void)triggerInterprocessChangeNotifier:(id)a3;
- (MTIDCache)cache;
- (MTIDConfig)cachedConfig;
- (MTIDSecretStore)secretStore;
- (MTInterprocessChangeNotifier)accountChanged;
- (MTPromise)configDictPromise;
- (MTStandardIDService)init;
- (MTStandardIDService)initWithAMSBag:(id)a3;
- (MTStandardIDService)initWithConfigDictPromise:(id)a3 bag:(id)a4;
- (MTStandardIDService)initWithConfigDictionary:(id)a3;
- (MTStandardIDService)initWithConfigPromise:(id)a3;
- (NSMutableDictionary)associatedObjects;
- (NSNumber)defaultDSID;
- (NSNumber)dsId;
- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution;
- (OS_dispatch_queue)serialQueue;
- (id)IDFieldsForTopic:(id)a3 options:(id)a4;
- (id)IDForTopic:(id)a3 type:(int64_t)a4 options:(id)a5;
- (id)IDInfoForNamespace:(id)a3 options:(id)a4 fromConfig:(id)a5;
- (id)IDsForNamespaces:(id)a3 options:(id)a4 fromConfig:(id)a5;
- (id)_IDInfoForNamespace:(id)a3 options:(id)a4 fromConfig:(id)a5;
- (id)configPromise;
- (id)filledOptions:(id)a3;
- (id)generateIDInfo:(id)a3 secret:(id)a4 dsId:(id)a5 correlationIDs:(id)a6;
- (id)resetIDForTopics:(id)a3 options:(id)a4;
- (id)secretValueForNamespace:(id)a3 options:(id)a4;
- (id)sync;
- (id)sync:(id)a3;
- (void)IDFieldsForTopic:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_clearLocalData;
- (void)_getConfig;
- (void)_getIDs;
- (void)_getSecrets;
- (void)_resetIDs;
- (void)dealloc;
- (void)flushPerfKitEvents;
- (void)handleAccountNotification;
- (void)handleApplicationStateChange:(id)a3;
- (void)handleRecordNotification;
- (void)handleResetNotification:(id)a3;
- (void)maybeSubscribeToDarwinNotifications;
- (void)performMaintenanceWithCompletion:(id)a3;
- (void)queryIDForTopic:(id)a3 type:(int64_t)a4 options:(id)a5 completion:(id)a6;
- (void)resetIDForTopics:(id)a3 options:(id)a4 completion:(id)a5;
- (void)setAccountChanged:(id)a3;
- (void)setApplicationBundleIdentifierOverrideForNetworkAttribution:(id)a3;
- (void)setAssociatedObjects:(id)a3;
- (void)setCache:(id)a3;
- (void)setCachedConfig:(id)a3;
- (void)setConfig:(id)a3;
- (void)setConfigDictPromise:(id)a3;
- (void)setDefaultDSID:(id)a3;
- (void)setDsId:(id)a3;
- (void)setSecretStore:(id)a3;
@end

@implementation MTStandardIDService

void __61__MTStandardIDService_IDInfoForNamespace_options_fromConfig___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  v12 = v5;
  if (v16)
  {
    [*(id *)(a1 + 32) finishWithResult:v16];
  }
  else
  {
    v13 = *(void **)(a1 + 32);
    if (v5)
    {
      [v13 finishWithError:v5];
    }
    else
    {
      v14 = MTError(110, @"Promise completed with no result or error", v6, v7, v8, v9, v10, v11, v15);
      [v13 finishWithError:v14];
    }
  }
}

void __48__MTStandardIDService_IDFieldsForTopic_options___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    if (v5) {
      id v8 = v5;
    }
    else {
      id v8 = v6;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = 138412802;
    id v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_impl(&dword_218211000, v7, OS_LOG_TYPE_DEBUG, "MetricsKit: Rendered ID fields: %@ for topic: %@ options: %@", (uint8_t *)&v11, 0x20u);
  }
}

id __48__MTStandardIDService_IDFieldsForTopic_options___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "mt_map:", &__block_literal_global_72);
  v3 = +[MTReflectUtil mergeAndCleanDictionaries:v2];
  v4 = +[MTPromise promiseWithResult:v3];

  return v4;
}

uint64_t __48__MTStandardIDService_IDFieldsForTopic_options___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 metricsFields];
}

id __48__MTStandardIDService_IDFieldsForTopic_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 namespaceForTopic:*(void *)(a1 + 32) idType:2];
  id v5 = [v3 namespaceForTopic:*(void *)(a1 + 32) idType:1];
  id v6 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
  uint64_t v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"idType"];
  id v8 = v7;
  if (v7 && [v7 integerValue] != 2) {
    goto LABEL_7;
  }
  if (v4)
  {
    uint64_t v9 = [*(id *)(a1 + 48) IDInfoForNamespace:v4 options:*(void *)(a1 + 40) fromConfig:v3];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      [v6 addObject:v9];
    }
  }
  if (v8)
  {
LABEL_7:
    if ([v8 integerValue] != 1 || v5 == 0) {
      goto LABEL_16;
    }
  }
  else if (!v5)
  {
    goto LABEL_16;
  }
  uint64_t v12 = [*(id *)(a1 + 48) IDInfoForNamespace:v5 options:*(void *)(a1 + 40) fromConfig:v3];
  if (v12)
  {
    __int16 v13 = (void *)v12;
    [v6 addObject:v12];
  }
LABEL_16:
  if ([v6 count])
  {
    uint64_t v14 = +[MTPromise promiseWithAll:v6];
    __int16 v15 = [v14 thenWithBlock:&__block_literal_global_69];
  }
  else
  {
    __int16 v15 = +[MTPromise promiseWithResult:MEMORY[0x263EFFA78]];
  }

  return v15;
}

- (id)IDInfoForNamespace:(id)a3 options:(id)a4 fromConfig:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = objc_alloc_init(MTPromise);
  uint64_t v12 = [(MTStandardIDService *)self serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__MTStandardIDService_IDInfoForNamespace_options_fromConfig___block_invoke;
  block[3] = &unk_26430FA68;
  id v21 = v9;
  v22 = self;
  id v23 = v8;
  id v24 = v10;
  __int16 v13 = v11;
  v25 = v13;
  id v14 = v10;
  id v15 = v8;
  id v16 = v9;
  dispatch_async(v12, block);

  uint64_t v17 = v25;
  v18 = v13;

  return v18;
}

- (OS_dispatch_queue)serialQueue
{
  if (serialQueue_onceToken != -1) {
    dispatch_once(&serialQueue_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)serialQueue_serialQueue;

  return (OS_dispatch_queue *)v2;
}

- (MTStandardIDService)initWithConfigDictPromise:(id)a3 bag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)MTStandardIDService;
  id v8 = [(MTStandardIDService *)&v29 init];
  id v9 = v8;
  if (v8)
  {
    if (v6)
    {
      [(MTStandardIDService *)v8 setConfigDictPromise:v6];
    }
    else
    {
      id v10 = +[MTPromise promiseWithResult:MEMORY[0x263EFFA78]];
      [(MTStandardIDService *)v9 setConfigDictPromise:v10];
    }
    int v11 = +[MTFrameworkEnvironment sharedEnvironment];
    uint64_t v12 = [v11 idCache];
    [(MTStandardIDService *)v9 setCache:v12];

    __int16 v13 = +[MTFrameworkEnvironment sharedEnvironment];
    id v14 = [v13 secretStore];
    [(MTStandardIDService *)v9 setSecretStore:v14];

    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(MTStandardIDService *)v9 setAssociatedObjects:v15];

    if (v7)
    {
      id v16 = [(MTStandardIDService *)v9 associatedObjects];
      [v16 setObject:v7 forKeyedSubscript:@"AMSBag"];
    }
    uint64_t v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v9 selector:sel_handleResetNotification_ name:@"MTIDNamespacesDidResetNotification" object:0];
    if (NSClassFromString(&cfstr_Uiapplication.isa)) {
      [v17 addObserver:v9 selector:sel_handleApplicationStateChange_ name:@"UIApplicationWillEnterForegroundNotification" object:0];
    }
    objc_initWeak(&location, v9);
    v18 = [MTInterprocessChangeNotifier alloc];
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __53__MTStandardIDService_initWithConfigDictPromise_bag___block_invoke;
    v26 = &unk_26430F848;
    objc_copyWeak(&v27, &location);
    v19 = [(MTInterprocessChangeNotifier *)v18 initWithIdentifier:@"MTCloudKitAccountDidChangeNotification" onChange:&v23];
    -[MTStandardIDService setAccountChanged:](v9, "setAccountChanged:", v19, v23, v24, v25, v26);

    v20 = [MEMORY[0x263F08A00] defaultCenter];
    [v20 addObserver:v9 selector:sel_handleAccountNotification name:*MEMORY[0x263EFAC10] object:0];

    id v21 = [MEMORY[0x263F08A00] defaultCenter];
    [v21 addObserver:v9 selector:sel_handleAccountNotification name:*MEMORY[0x263EFAE30] object:0];

    [(MTStandardIDService *)v9 maybeSubscribeToDarwinNotifications];
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return v9;
}

- (void)setSecretStore:(id)a3
{
}

- (void)setConfigDictPromise:(id)a3
{
}

- (void)setCache:(id)a3
{
}

- (void)setAssociatedObjects:(id)a3
{
}

- (void)setAccountChanged:(id)a3
{
}

- (void)maybeSubscribeToDarwinNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)_handleITunesAccountsChangedNotification, @"com.apple.itunesstored.accountschanged", 0, CFNotificationSuspensionBehaviorDrop);
  id v5 = +[MTFrameworkEnvironment sharedEnvironment];
  int v6 = [v5 isInternalBuild];

  if (v6)
  {
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleDarwinNotification, @"MTIDServiceClearLocalDataNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleDarwinNotification, @"MTIDServiceResetIDsNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleDarwinNotification, @"MTIDServiceGetSecretsNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleDarwinNotification, @"MTIDServiceGetIDsNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleDarwinNotification, @"MTIDServiceGetConfigNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (id)IDFieldsForTopic:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = [(MTStandardIDService *)self filledOptions:a4];
  id v8 = [(MTStandardIDService *)self configPromise];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __48__MTStandardIDService_IDFieldsForTopic_options___block_invoke;
  v18[3] = &unk_26430F928;
  id v9 = v6;
  id v19 = v9;
  id v10 = v7;
  id v20 = v10;
  id v21 = self;
  int v11 = [v8 thenWithBlock:v18];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __48__MTStandardIDService_IDFieldsForTopic_options___block_invoke_4;
  v15[3] = &unk_26430F950;
  id v16 = v9;
  id v17 = v10;
  id v12 = v10;
  id v13 = v9;
  [v11 addFinishBlock:v15];

  return v11;
}

- (id)configPromise
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(MTStandardIDService *)v2 cachedConfig];
  objc_sync_exit(v2);

  if (v3)
  {
    v4 = +[MTPromise promiseWithResult:v3];
  }
  else
  {
    id v5 = v2;
    objc_sync_enter(v5);
    id v6 = [(MTStandardIDService *)v5 associatedObjects];
    id v7 = [v6 objectForKeyedSubscript:@"AMSBag"];

    objc_sync_exit(v5);
    if (v7)
    {
      id v8 = objc_alloc_init(MTPromise);
      id v9 = [v7 dictionaryForKey:@"metrics"];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __36__MTStandardIDService_configPromise__block_invoke;
      v15[3] = &unk_26430F870;
      void v15[4] = v5;
      id v10 = v8;
      id v16 = v10;
      [v9 valueWithCompletion:v15];

      int v11 = v16;
      id v12 = v10;

      v4 = v12;
    }
    else
    {
      id v12 = [(MTStandardIDService *)v5 configDictPromise];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __36__MTStandardIDService_configPromise__block_invoke_42;
      v14[3] = &unk_26430F898;
      v14[4] = v5;
      v4 = [(MTPromise *)v12 thenWithBlock:v14];
    }
  }

  return v4;
}

- (MTIDConfig)cachedConfig
{
  return self->_cachedConfig;
}

void __62__MTStandardIDService__IDInfoForNamespace_options_fromConfig___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:");
  }
  else if (v5)
  {
    [*(id *)(a1 + 32) finishWithError:v5];
  }
}

uint64_t __59__MTStandardIDService_IDsForNamespaces_options_fromConfig___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) IDInfoForNamespace:a2 options:*(void *)(a1 + 40) fromConfig:*(void *)(a1 + 48)];
}

void __41__MTStandardIDService_flushPerfKitEvents__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = MTMetricsKitOSLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v3;
      id v6 = "MetricsKit: Failed to flush PerfKit events. Error %@";
      id v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      uint32_t v9 = 12;
LABEL_6:
      _os_log_impl(&dword_218211000, v7, v8, v6, (uint8_t *)&v10, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v10) = 0;
    id v6 = "MetricsKit: Flushed PerfKit events";
    id v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEBUG;
    uint32_t v9 = 2;
    goto LABEL_6;
  }
}

- (MTStandardIDService)initWithAMSBag:(id)a3
{
  return [(MTStandardIDService *)self initWithConfigDictPromise:0 bag:a3];
}

void __61__MTStandardIDService_IDInfoForNamespace_options_fromConfig___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"waitTime"];
  if (v2
    && (id v3 = (void *)v2,
        [*(id *)(a1 + 32) objectForKeyedSubscript:@"syncWaitTime"],
        v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    id v6 = (void *)[*(id *)(a1 + 32) mutableCopy];
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"waitTime"];
    [v6 setObject:v7 forKeyedSubscript:@"syncWaitTime"];

    id v5 = (id)[v6 copy];
  }
  else
  {
    id v5 = *(id *)(a1 + 32);
  }
  os_log_type_t v8 = [*(id *)(a1 + 40) _IDInfoForNamespace:*(void *)(a1 + 48) options:v5 fromConfig:*(void *)(a1 + 56)];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__MTStandardIDService_IDInfoForNamespace_options_fromConfig___block_invoke_2;
  v9[3] = &unk_26430FA40;
  id v10 = *(id *)(a1 + 64);
  [v8 addFinishBlock:v9];
}

- (id)filledOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"date"];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [v4 objectForKeyedSubscript:@"dsId"];
    if (v7)
    {
      os_log_type_t v8 = (void *)v7;
      uint32_t v9 = [v4 objectForKeyedSubscript:@"appBundleID"];

      if (v9) {
        goto LABEL_23;
      }
    }
    else
    {
    }
  }
  id v10 = [MEMORY[0x263EFF9A0] dictionary];
  id v11 = v10;
  if (v4) {
    [v10 addEntriesFromDictionary:v4];
  }
  uint64_t v12 = [v4 objectForKeyedSubscript:@"date"];

  if (!v12)
  {
    id v13 = +[MTFrameworkEnvironment sharedEnvironment];
    id v14 = [v13 date];
    [v11 setObject:v14 forKeyedSubscript:@"date"];
  }
  id v15 = [v4 objectForKeyedSubscript:@"dsId"];

  if (!v15)
  {
    id v16 = [(MTStandardIDService *)self dsId];
    if (v16)
    {
      [v11 setObject:v16 forKeyedSubscript:@"dsId"];
    }
    else
    {
      id v17 = [(MTStandardIDService *)self defaultDSID];
      [v11 setObject:v17 forKeyedSubscript:@"dsId"];
    }
  }
  v18 = [v4 objectForKeyedSubscript:@"appBundleID"];

  if (!v18)
  {
    id v19 = [(MTStandardIDService *)self applicationBundleIdentifierOverrideForNetworkAttribution];
    if (v19)
    {
      [v11 setObject:v19 forKeyedSubscript:@"appBundleID"];
    }
    else
    {
      id v20 = +[MTFrameworkEnvironment sharedEnvironment];
      id v21 = [v20 hostProcessBundleIdentifier];
      [v11 setObject:v21 forKeyedSubscript:@"appBundleID"];
    }
  }
  v22 = [v4 objectForKeyedSubscript:@"iTunesUserRequired"];

  if (!v22) {
    [v11 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"iTunesUserRequired"];
  }
  uint64_t v23 = [v11 copy];

  id v4 = (id)v23;
LABEL_23:

  return v4;
}

- (id)_IDInfoForNamespace:(id)a3 options:(id)a4 fromConfig:(id)a5
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v80 = v7;
  id v10 = [v9 schemeForNamespace:v7];
  v82 = [v8 objectForKeyedSubscript:@"date"];
  v83 = [v8 objectForKeyedSubscript:@"dsId"];
  id v11 = [v8 objectForKeyedSubscript:@"existingOnly"];
  unsigned __int8 v12 = [v11 BOOLValue];

  id v13 = [v8 objectForKeyedSubscript:@"iTunesUserRequired"];
  int v14 = [v13 BOOLValue];

  if (v14)
  {
    id v15 = objc_msgSend(MEMORY[0x263EFB218], "ams_sharedAccountStore");
    id v16 = objc_msgSend(v15, "ams_activeiTunesAccount");
    id v17 = objc_msgSend(v16, "ams_DSID");

    if (!v83 || v17 && ![v17 isEqualToNumber:v83])
    {
      v38 = [[MTIDSecret alloc] initWithValue:&stru_26C95D008 effectiveDate:0 expirationDate:0 isSynchronize:0];
      v39 = [MTIDInfo alloc];
      v40 = [(MTIDSecret *)v38 value];
      LOBYTE(v71) = 0;
      v41 = [(MTIDInfo *)v39 initWithScheme:v10 secret:v38 idString:v40 dsId:0 effectiveDate:0 expirationDate:0 shouldGenerateMetricsFields:v71];

      id v31 = +[MTPromise promiseWithResult:v41];

      goto LABEL_43;
    }
  }
  if ([v10 lifespan] < 1) {
    goto LABEL_10;
  }
  v18 = +[MTFrameworkEnvironment sharedEnvironment];
  id v19 = [v18 date];
  [v82 timeIntervalSinceDate:v19];
  double v21 = v20;

  [v10 maxPastTimeInterval];
  if (v21 < -v28) {
    goto LABEL_9;
  }
  [v10 maxFutureTimeInterval];
  if (v21 <= v29)
  {
LABEL_10:
    v32 = [v8 objectForKeyedSubscript:@"reset"];
    int v33 = [v32 BOOLValue];

    id v34 = v8;
    v35 = v34;
    if (v33)
    {
      v36 = (void *)[v34 mutableCopy];
      [v36 setObject:0 forKeyedSubscript:@"reset"];
      v78 = (void *)[v36 copy];

      BOOL v37 = 1;
    }
    else
    {
      v42 = [v34 objectForKeyedSubscript:@"cachePolicy"];
      v36 = v42;
      if (v42) {
        BOOL v37 = [v42 integerValue] != 0;
      }
      else {
        BOOL v37 = 0;
      }
      v78 = v35;
    }

    v43 = [(MTStandardIDService *)self cache];
    v79 = [v43 IDInfoForScheme:v10 options:v35];

    if (v79) {
      char v44 = v37;
    }
    else {
      char v44 = 1;
    }
    v45 = MTMetricsKitOSLog();
    BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_INFO);
    if ((v44 | v12))
    {
      if (v79)
      {
        if (v46)
        {
          v47 = [v10 idNamespace];
          *(_DWORD *)buf = 138412290;
          v95 = v47;
          _os_log_impl(&dword_218211000, v45, OS_LOG_TYPE_INFO, "MetricsKit: ID promise for scheme %@ is cached but not used", buf, 0xCu);
        }
      }
      else if (v46)
      {
        v50 = [v10 idNamespace];
        *(_DWORD *)buf = 138412290;
        v95 = v50;
        _os_log_impl(&dword_218211000, v45, OS_LOG_TYPE_INFO, "MetricsKit: ID promise for scheme %@ is not cached", buf, 0xCu);
      }
      v51 = (void *)MEMORY[0x263EFF980];
      uint64_t v52 = [v10 correlations];
      v53 = (void *)v52;
      if (v52) {
        uint64_t v54 = v52;
      }
      else {
        uint64_t v54 = MEMORY[0x263EFFA68];
      }
      v77 = [v51 arrayWithArray:v54];

      [v77 removeObject:v80];
      v55 = [(MTStandardIDService *)self secretStore];
      v76 = [v55 secretForScheme:v10 options:v35];

      v74 = dispatch_get_global_queue(0, 0);
      v56 = [[MTPromiseWithTimeout alloc] initWithTimeout:v74 queue:&__block_literal_global_102 timeoutBlock:55.0];
      v91[0] = MEMORY[0x263EF8330];
      v91[1] = 3221225472;
      v91[2] = __62__MTStandardIDService__IDInfoForNamespace_options_fromConfig___block_invoke_2;
      v91[3] = &unk_26430FAB0;
      v73 = v56;
      v92 = v73;
      [v76 addFinishBlock:v91];
      v72 = [(MTStandardIDService *)self IDsForNamespaces:v77 options:v78 fromConfig:v9];
      v75 = [v9 performanceTopic];
      if (v75 && [v10 idType] == 2)
      {
        v57 = [(MTStandardIDService *)self associatedObjects];
        objc_sync_enter(v57);
        v58 = [(MTStandardIDService *)self associatedObjects];
        v59 = [v58 objectForKeyedSubscript:@"AMSBag"];

        if (v59)
        {
          v60 = [(MTStandardIDService *)self associatedObjects];
          v61 = [v60 objectForKeyedSubscript:@"perfKit"];

          if (!v61)
          {
            v61 = +[MTMetricsKitTemplate kitWithTopic:v75 amsBag:v59];
            v62 = [(MTStandardIDService *)self associatedObjects];
            [v62 setObject:v61 forKeyedSubscript:@"perfKit"];
          }
        }
        else
        {
          v61 = 0;
        }

        objc_sync_exit(v57);
        if (v61)
        {
          v63 = [v61 flexibleMeasurementWithEventType:@"idRequest"];
          [v63 mark:@"requestStartTime"];
          v88[0] = MEMORY[0x263EF8330];
          v88[1] = 3221225472;
          v88[2] = __62__MTStandardIDService__IDInfoForNamespace_options_fromConfig___block_invoke_3;
          v88[3] = &unk_26430FAD8;
          id v89 = v10;
          id v90 = v63;
          id v64 = v63;
          [v76 addFinishBlock:v88];
        }
      }
      v65 = [(MTPromiseWithTimeout *)v73 promise];
      v93[0] = v65;
      v93[1] = v72;
      v66 = [MEMORY[0x263EFF8C0] arrayWithObjects:v93 count:2];
      v67 = +[MTPromise promiseWithAll:v66];
      v84[0] = MEMORY[0x263EF8330];
      v84[1] = 3221225472;
      v84[2] = __62__MTStandardIDService__IDInfoForNamespace_options_fromConfig___block_invoke_115;
      v84[3] = &unk_26430F780;
      id v68 = v10;
      id v85 = v68;
      id v86 = v83;
      v87 = self;
      id v31 = [v67 thenWithBlock:v84];

      v69 = [(MTStandardIDService *)self cache];
      [v69 addIdInfoPromise:v31 forScheme:v68 options:v35];

      v49 = v79;
    }
    else
    {
      if (v46)
      {
        v48 = [v10 idNamespace];
        *(_DWORD *)buf = 138412290;
        v95 = v48;
        _os_log_impl(&dword_218211000, v45, OS_LOG_TYPE_INFO, "MetricsKit: Returning cached ID promise for scheme %@", buf, 0xCu);
      }
      v49 = v79;
      id v31 = v79;
    }
  }
  else
  {
LABEL_9:
    v30 = MTError(706, @"Date for the request ID is out of bounds", v22, v23, v24, v25, v26, v27, v71);
    id v31 = +[MTPromise promiseWithError:v30];
  }
LABEL_43:

  return v31;
}

- (MTIDCache)cache
{
  return self->_cache;
}

- (void)flushPerfKitEvents
{
  id v3 = [(MTStandardIDService *)self associatedObjects];
  objc_sync_enter(v3);
  id v4 = [(MTStandardIDService *)self associatedObjects];
  id v9 = [v4 objectForKeyedSubscript:@"perfKit"];

  objc_sync_exit(v3);
  uint64_t v5 = v9;
  if (v9)
  {
    id v6 = [v9 system];
    id v7 = [v6 eventRecorder];
    id v8 = [v7 flushUnreportedEvents];

    [v8 addFinishBlock:&__block_literal_global_130];
    uint64_t v5 = v9;
  }
}

- (NSMutableDictionary)associatedObjects
{
  return self->_associatedObjects;
}

- (NSNumber)dsId
{
  dsId = self->_dsId;
  if (dsId)
  {
    id v3 = dsId;
  }
  else
  {
    id v3 = [(MTStandardIDService *)self defaultDSID];
  }

  return v3;
}

- (NSNumber)defaultDSID
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  defaultDSID = v2->_defaultDSID;
  if (!defaultDSID)
  {
    id v4 = objc_msgSend(MEMORY[0x263EFB218], "ams_sharedAccountStore");
    uint64_t v5 = objc_msgSend(v4, "ams_activeiTunesAccount");
    uint64_t v6 = objc_msgSend(v5, "ams_DSID");
    id v7 = v2->_defaultDSID;
    v2->_defaultDSID = (NSNumber *)v6;

    defaultDSID = v2->_defaultDSID;
  }
  id v8 = defaultDSID;
  objc_sync_exit(v2);

  return v8;
}

- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution
{
  return self->_applicationBundleIdentifierOverrideForNetworkAttribution;
}

- (MTIDSecretStore)secretStore
{
  return self->_secretStore;
}

- (id)IDsForNamespaces:(id)a3 options:(id)a4 fromConfig:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __59__MTStandardIDService_IDsForNamespaces_options_fromConfig___block_invoke;
    v14[3] = &unk_26430FA18;
    v14[4] = self;
    id v15 = v9;
    id v16 = v10;
    id v11 = objc_msgSend(v8, "mt_map:", v14);
    unsigned __int8 v12 = +[MTPromise promiseWithAll:v11];
  }
  else
  {
    unsigned __int8 v12 = +[MTPromise promiseWithResult:MEMORY[0x263EFFA68]];
  }

  return v12;
}

void __62__MTStandardIDService__IDInfoForNamespace_options_fromConfig___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [*(id *)(a1 + 32) idNamespace];
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = v8;
    _os_log_impl(&dword_218211000, v7, OS_LOG_TYPE_INFO, "MetricsKit: Secret promise for scheme %@ completed", buf, 0xCu);
  }
  if (v5)
  {
    [*(id *)(a1 + 40) mark:@"requestEndTime"];
    id v9 = *(void **)(a1 + 40);
    uint64_t v24 = @"syncState";
    id v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isSynchronized"));
    uint64_t v25 = v10;
    id v11 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    objc_msgSend(v9, "addFields:", v11, 0);

    unsigned __int8 v12 = [v5 syncStatusCode];

    if (v12)
    {
      id v13 = *(void **)(a1 + 40);
      uint64_t v22 = @"statusCode";
      int v14 = [v5 syncStatusCode];
      uint64_t v23 = v14;
      id v15 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      objc_msgSend(v13, "addFields:", v15, 0);
LABEL_8:
    }
  }
  else if (v6)
  {
    id v16 = *(void **)(a1 + 40);
    double v20 = @"statusCode";
    id v17 = NSString;
    int v14 = [v6 domain];
    id v15 = [v17 stringWithFormat:@"%@-%ld", v14, objc_msgSend(v6, "code")];
    double v21 = v15;
    v18 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    objc_msgSend(v16, "addFields:", v18, 0);

    goto LABEL_8;
  }
  id v19 = (id)[*(id *)(a1 + 40) record];
}

- (id)generateIDInfo:(id)a3 secret:(id)a4 dsId:(id)a5 correlationIDs:(id)a6
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v48 = a5;
  id v11 = a6;
  unsigned __int8 v12 = (void *)MEMORY[0x263EFF980];
  id v13 = [v9 idNamespace];
  v50 = v9;
  uint64_t v14 = [v9 version];
  id v15 = (void *)v14;
  if (v14) {
    id v16 = (__CFString *)v14;
  }
  else {
    id v16 = &stru_26C95D008;
  }
  uint64_t v17 = [v10 value];
  v18 = (void *)v17;
  if (v17) {
    id v19 = (__CFString *)v17;
  }
  else {
    id v19 = &stru_26C95D008;
  }
  v51 = objc_msgSend(v12, "arrayWithObjects:", v13, v16, v19, 0);

  double v20 = [v10 effectiveDate];
  double v21 = [v10 expirationDate];
  v49 = v10;
  uint64_t v22 = [v10 isSynchronized];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v11;
  uint64_t v23 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v54;
    uint64_t v26 = v51;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v54 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        double v29 = [v28 idString];
        [v26 addObject:v29];

        uint64_t v30 = [v28 effectiveDate];
        id v31 = (void *)v30;
        if (v20)
        {
          if (v30)
          {
            v32 = [v28 effectiveDate];
            if ([v20 compare:v32] == -1)
            {
              uint64_t v33 = [v28 effectiveDate];

              double v20 = (void *)v33;
              uint64_t v26 = v51;
            }
          }
        }
        else
        {
          double v20 = (void *)v30;
        }
        uint64_t v34 = [v28 expirationDate];
        v35 = (void *)v34;
        if (v21)
        {
          if (v34)
          {
            v36 = [v28 expirationDate];
            if ([v21 compare:v36] != -1)
            {
              uint64_t v37 = [v28 expirationDate];

              double v21 = (void *)v37;
              uint64_t v26 = v51;
            }
          }
        }
        else
        {
          double v21 = (void *)v34;
        }
        uint64_t v22 = v22 & [v28 isSynchronized];
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
    }
    while (v24);
  }

  v38 = [MEMORY[0x263F089D8] string];
  v39 = [v50 version];
  uint64_t v40 = [v39 length];

  if (v40)
  {
    v41 = [v50 version];
    [v38 appendString:v41];

    [v38 appendString:@"_"];
  }
  v42 = [v51 componentsJoinedByString:@"\n"];
  v43 = objc_msgSend(v42, "mt_SHA1Base62String");
  [v38 appendString:v43];

  char v44 = [[MTIDInfo alloc] initWithScheme:v50 secret:v49 idString:v38 dsId:v48 effectiveDate:v20 expirationDate:v21];
  [(MTIDInfo *)v44 setIsSynchronized:v22];
  v45 = [(MTIDInfo *)v44 scheme];
  BOOL v46 = [v45 idNamespace];
  +[MTStandardIDService registerInterprocessChangeNotifier:v46];

  return v44;
}

id __62__MTStandardIDService__IDInfoForNamespace_options_fromConfig___block_invoke_115(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count] != 2) {
    __62__MTStandardIDService__IDInfoForNamespace_options_fromConfig___block_invoke_115_cold_1();
  }
  id v4 = [v3 objectAtIndexedSubscript:0];
  id v5 = [v3 objectAtIndexedSubscript:1];
  id v6 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [*(id *)(a1 + 32) idNamespace];
    int v16 = 138412290;
    uint64_t v17 = v7;
    _os_log_impl(&dword_218211000, v6, OS_LOG_TYPE_INFO, "MetricsKit: Secret promise and correlations promise for scheme %@ completed", (uint8_t *)&v16, 0xCu);
  }
  id v8 = [v4 value];
  int v9 = [v8 isEqual:&stru_26C95D008];

  if (v9)
  {
    id v10 = [MTIDInfo alloc];
    uint64_t v11 = *(void *)(a1 + 32);
    unsigned __int8 v12 = [v4 value];
    id v13 = [(MTIDInfo *)v10 initWithScheme:v11 secret:v4 idString:v12 dsId:*(void *)(a1 + 40) effectiveDate:0 expirationDate:0];
  }
  else
  {
    id v13 = [*(id *)(a1 + 48) generateIDInfo:*(void *)(a1 + 32) secret:v4 dsId:*(void *)(a1 + 40) correlationIDs:v5];
  }
  uint64_t v14 = +[MTPromise promiseWithResult:v13];

  return v14;
}

+ (void)registerInterprocessChangeNotifier:(id)a3
{
  id v3 = a3;
  if (registerInterprocessChangeNotifier__onceToken != -1) {
    dispatch_once(&registerInterprocessChangeNotifier__onceToken, &__block_literal_global_132);
  }
  id v4 = (id)registerInterprocessChangeNotifier__subscriptions;
  objc_sync_enter(v4);
  id v5 = [(id)registerInterprocessChangeNotifier__subscriptions objectForKeyedSubscript:v3];

  if (!v5)
  {
    id v6 = [MTInterprocessChangeNotifier alloc];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __58__MTStandardIDService_registerInterprocessChangeNotifier___block_invoke_2;
    v9[3] = &unk_26430FB90;
    id v7 = v3;
    id v10 = v7;
    id v8 = [(MTInterprocessChangeNotifier *)v6 initWithIdentifier:v7 onChange:v9];
    [(id)registerInterprocessChangeNotifier__subscriptions setObject:v8 forKeyedSubscript:v7];
  }
  objc_sync_exit(v4);
}

- (void)dealloc
{
  [(MTStandardIDService *)self flushPerfKitEvents];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)MTStandardIDService;
  [(MTStandardIDService *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultDSID, 0);
  objc_storeStrong((id *)&self->_secretStore, 0);
  objc_storeStrong((id *)&self->_accountChanged, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_associatedObjects, 0);
  objc_storeStrong((id *)&self->_cachedConfig, 0);
  objc_storeStrong((id *)&self->_configDictPromise, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForNetworkAttribution, 0);

  objc_storeStrong((id *)&self->_dsId, 0);
}

void __36__MTStandardIDService_configPromise__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    id v8 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_218211000, v8, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to retrieve metrics bag key value: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  int v9 = [v6 objectForKeyedSubscript:@"identifiers"];
  id v10 = [MTIDConfig alloc];
  if (v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = (void *)MEMORY[0x263EFFA78];
  }
  unsigned __int8 v12 = [(MTIDConfig *)v10 initWithDictionary:v11];
  if (v9) {
    [*(id *)(a1 + 32) setConfig:v12];
  }
  [*(id *)(a1 + 40) finishWithResult:v12];
}

- (void)setConfig:(id)a3
{
  id v5 = a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  [(MTStandardIDService *)v4 setCachedConfig:v5];
  objc_sync_exit(v4);
}

- (void)setCachedConfig:(id)a3
{
}

- (MTStandardIDService)init
{
  return [(MTStandardIDService *)self initWithConfigDictionary:MEMORY[0x263EFFA78]];
}

- (MTStandardIDService)initWithConfigDictionary:(id)a3
{
  objc_super v4 = +[MTPromise promiseWithResult:a3];
  id v5 = [(MTStandardIDService *)self initWithConfigPromise:v4];

  return v5;
}

- (MTStandardIDService)initWithConfigPromise:(id)a3
{
  return [(MTStandardIDService *)self initWithConfigDictPromise:a3 bag:0];
}

void __53__MTStandardIDService_initWithConfigDictPromise_bag___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleAccountNotification];
}

uint64_t __34__MTStandardIDService_serialQueue__block_invoke()
{
  serialQueue_serialQueue = (uint64_t)dispatch_queue_create("MTStandardIDService.serialQueue", 0);

  return MEMORY[0x270F9A758]();
}

id __36__MTStandardIDService_configPromise__block_invoke_42(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [[MTIDConfig alloc] initWithDictionary:v3];

  [*(id *)(a1 + 32) setConfig:v4];
  id v5 = +[MTPromise promiseWithResult:v4];

  return v5;
}

- (void)handleAccountNotification
{
  id obj = self;
  objc_sync_enter(obj);
  uint64_t v2 = [(MTStandardIDService *)obj cache];
  [v2 removeAllNamespaces];

  [(MTStandardIDService *)obj setDefaultDSID:0];
  objc_sync_exit(obj);
}

- (void)handleRecordNotification
{
  id obj = self;
  objc_sync_enter(obj);
  uint64_t v2 = [(MTStandardIDService *)obj cache];
  [v2 removeUnsyncedNamespaces];

  objc_sync_exit(obj);
}

- (void)handleResetNotification:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v7 = [v4 objectForKeyedSubscript:@"namespaces"];

  id v5 = [(MTStandardIDService *)self cache];
  id v6 = v5;
  if (v7) {
    [v5 removeNamespaces:v7];
  }
  else {
    [v5 removeAllNamespaces];
  }
}

- (void)handleApplicationStateChange:(id)a3
{
  id v6 = a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  id v5 = [(MTStandardIDService *)v4 cache];
  [v5 removeAllNamespaces];

  objc_sync_exit(v4);
}

+ (void)setLocalCachePath:(id)a3
{
  id v3 = a3;
  id v4 = +[MTFrameworkEnvironment sharedEnvironment];
  [v4 setLocalDataPath:v3];
}

+ (NSString)localCachePath
{
  uint64_t v2 = +[MTFrameworkEnvironment sharedEnvironment];
  id v3 = [v2 localDataPath];

  return (NSString *)v3;
}

- (void)IDFieldsForTopic:(id)a3 options:(id)a4 completion:(id)a5
{
  id v9 = a5;
  id v8 = [(MTStandardIDService *)self IDFieldsForTopic:a3 options:a4];
  if (v9) {
    [v8 addFinishBlock:v9];
  }
}

- (void)resetIDForTopics:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = [(MTStandardIDService *)self resetIDForTopics:a3 options:a4];
  if (v8)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __59__MTStandardIDService_resetIDForTopics_options_completion___block_invoke;
    v10[3] = &unk_26430F8C0;
    id v11 = v8;
    [v9 addFinishBlock:v10];
  }
}

uint64_t __59__MTStandardIDService_resetIDForTopics_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)resetIDForTopics:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = [(MTStandardIDService *)self filledOptions:a4];
  id v8 = [(MTStandardIDService *)self configPromise];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__MTStandardIDService_resetIDForTopics_options___block_invoke;
  v13[3] = &unk_26430F928;
  id v14 = v6;
  uint64_t v15 = self;
  id v16 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = [v8 thenWithBlock:v13];

  return v11;
}

id __48__MTStandardIDService_resetIDForTopics_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", 2 * objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v11 = [v3 namespaceForTopic:v10 idType:2];
        if (v11)
        {
          unsigned __int8 v12 = [v3 schemeForNamespace:v11];
          [v4 addObject:v12];
        }
        int v13 = [v3 namespaceForTopic:v10 idType:1];

        if (v13)
        {
          id v14 = [v3 schemeForNamespace:v13];
          [v4 addObject:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  uint64_t v15 = [*(id *)(a1 + 40) secretStore];
  id v16 = [v4 allObjects];
  uint64_t v17 = [v15 resetSchemes:v16 options:*(void *)(a1 + 48)];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __48__MTStandardIDService_resetIDForTopics_options___block_invoke_2;
  v21[3] = &unk_26430F978;
  uint64_t v18 = *(void *)(a1 + 40);
  id v22 = v4;
  uint64_t v23 = v18;
  id v19 = v4;
  [v17 addSuccessBlock:v21];

  return v17;
}

void __48__MTStandardIDService_resetIDForTopics_options___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "idNamespace", (void)v11);
        +[MTStandardIDService triggerInterprocessChangeNotifier:v8];

        id v9 = [*(id *)(a1 + 40) cache];
        uint64_t v10 = [v7 idNamespace];
        [v9 removeNamespace:v10];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)queryIDForTopic:(id)a3 type:(int64_t)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = [(MTStandardIDService *)self IDForTopic:a3 type:a4 options:a5];
  [v11 addFinishBlock:v10];
}

- (void)performMaintenanceWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void))a3;
  if ([(id)objc_opt_class() isTinkerPaired])
  {
    uint64_t v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v6 = [v5 valueForKey:@"MTIDServiceLastMaintenanceDate"];
    uint64_t v7 = +[MTFrameworkEnvironment sharedEnvironment];
    uint64_t v8 = [v7 date];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 timeIntervalSinceDate:v6];
      if (v9 < 86400.0)
      {
        id v10 = MTMetricsKitOSLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v19 = v6;
          _os_log_impl(&dword_218211000, v10, OS_LOG_TYPE_INFO, "MetricsKit: Skipping ID service maintenance because the last performed maintenance was too recent at %@", buf, 0xCu);
        }

        v4[2](v4, 0);
        goto LABEL_13;
      }
    }
    [v5 setValue:v8 forKey:@"MTIDServiceLastMaintenanceDate"];
  }
  uint64_t v5 = [(MTStandardIDService *)self filledOptions:0];
  id v11 = [(MTStandardIDService *)self secretStore];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    long long v13 = [(MTStandardIDService *)self configPromise];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __56__MTStandardIDService_performMaintenanceWithCompletion___block_invoke;
    v16[3] = &unk_26430F9A0;
    v16[4] = self;
    id v17 = v5;
    uint64_t v6 = [v13 thenWithBlock:v16];

    if (!v4) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  uint64_t v6 = +[MTPromise promiseWithResult:MEMORY[0x263EFFA88]];
  if (v4)
  {
LABEL_12:
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __56__MTStandardIDService_performMaintenanceWithCompletion___block_invoke_2;
    v14[3] = &unk_26430F8C0;
    uint64_t v15 = v4;
    [v6 addFinishBlock:v14];
    uint64_t v8 = v15;
LABEL_13:
  }
LABEL_14:
}

id __56__MTStandardIDService_performMaintenanceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 secretStore];
  uint64_t v6 = [v4 allKnownSchemes];

  uint64_t v7 = [v5 maintainSchemes:v6 options:*(void *)(a1 + 40)];

  return v7;
}

uint64_t __56__MTStandardIDService_performMaintenanceWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)sync
{
  return [(MTStandardIDService *)self sync:0];
}

- (id)sync:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTStandardIDService *)self filledOptions:0];
  uint64_t v6 = [(MTStandardIDService *)self configPromise];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __28__MTStandardIDService_sync___block_invoke;
  v11[3] = &unk_26430F928;
  id v12 = v4;
  long long v13 = self;
  id v14 = v5;
  id v7 = v5;
  id v8 = v4;
  double v9 = [v6 thenWithBlock:v11];

  return v9;
}

id __28__MTStandardIDService_sync___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = objc_msgSend(a2, "schemeForNamespace:");
    id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v3, 0);
  }
  else
  {
    id v4 = [a2 allKnownSchemes];
  }
  uint64_t v5 = [*(id *)(a1 + 40) secretStore];
  uint64_t v6 = [v5 syncForSchemes:v4 options:*(void *)(a1 + 48)];

  return v6;
}

- (id)IDForTopic:(id)a3 type:(int64_t)a4 options:(id)a5
{
  id v8 = a3;
  double v9 = [(MTStandardIDService *)self filledOptions:a5];
  id v10 = [(MTStandardIDService *)self configPromise];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __47__MTStandardIDService_IDForTopic_type_options___block_invoke;
  v20[3] = &unk_26430F9C8;
  id v11 = v8;
  int64_t v24 = a4;
  id v21 = v11;
  id v22 = self;
  id v12 = v9;
  id v23 = v12;
  long long v13 = [v10 thenWithBlock:v20];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __47__MTStandardIDService_IDForTopic_type_options___block_invoke_2;
  v17[3] = &unk_26430F9F0;
  id v18 = v11;
  id v19 = v12;
  id v14 = v12;
  id v15 = v11;
  [v13 addFinishBlock:v17];

  return v13;
}

id __47__MTStandardIDService_IDForTopic_type_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = a2;
  uint64_t v6 = [v5 namespaceForTopic:v3 idType:v4];
  id v7 = [*(id *)(a1 + 40) IDInfoForNamespace:v6 options:*(void *)(a1 + 48) fromConfig:v5];

  return v7;
}

void __47__MTStandardIDService_IDForTopic_type_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    if (v5)
    {
      id v8 = [v5 metricsFields];
    }
    else
    {
      id v8 = v6;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = 138412802;
    id v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_impl(&dword_218211000, v7, OS_LOG_TYPE_DEBUG, "MetricsKit: Rendered ID fields: %@ for topic: %@ options: %@", (uint8_t *)&v11, 0x20u);
    if (v5) {
  }
    }
}

void __62__MTStandardIDService__IDInfoForNamespace_options_fromConfig___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[MTIDSecret alloc] initWithValue:&stru_26C95D008 effectiveDate:0 expirationDate:0 isSynchronize:0];
  [v2 finishWithResult:v3];
}

- (id)secretValueForNamespace:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MTStandardIDService *)self configPromise];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __55__MTStandardIDService_secretValueForNamespace_options___block_invoke;
  v17[3] = &unk_26430FB00;
  id v18 = v6;
  id v9 = v6;
  uint64_t v10 = [v8 thenWithBlock:v17];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __55__MTStandardIDService_secretValueForNamespace_options___block_invoke_2;
  v15[3] = &unk_26430FB28;
  void v15[4] = self;
  id v16 = v7;
  id v11 = v7;
  id v12 = [v10 thenWithBlock:v15];
  __int16 v13 = [v12 thenWithBlock:&__block_literal_global_128];

  return v13;
}

id __55__MTStandardIDService_secretValueForNamespace_options___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 schemeForNamespace:*(void *)(a1 + 32)];
  uint64_t v3 = +[MTPromise promiseWithComposition:v2];

  return v3;
}

id __55__MTStandardIDService_secretValueForNamespace_options___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 secretStore];
  id v6 = [v5 secretForScheme:v4 options:*(void *)(a1 + 40)];

  return v6;
}

id __55__MTStandardIDService_secretValueForNamespace_options___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 value];
  uint64_t v3 = +[MTPromise promiseWithComposition:v2];

  return v3;
}

uint64_t __58__MTStandardIDService_registerInterprocessChangeNotifier___block_invoke()
{
  registerInterprocessChangeNotifier__subscriptions = [MEMORY[0x263EFF9A0] dictionary];

  return MEMORY[0x270F9A758]();
}

void __58__MTStandardIDService_registerInterprocessChangeNotifier___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = @"namespaces";
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v5 count:1];
  v7[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"MTIDNamespacesDidResetNotification" object:0 userInfo:v4];
}

+ (void)triggerInterprocessChangeNotifier:(id)a3
{
}

+ (id)writeDebugData:(id)a3 toFileWithNameFormat:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v5 = (objc_class *)MEMORY[0x263F08790];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setDateFormat:@"yyyyMMddHHmmss"];
  id v9 = NSString;
  uint64_t v10 = +[MTFrameworkEnvironment sharedEnvironment];
  id v11 = [v10 hostProcessBundleIdentifier];
  id v12 = +[MTFrameworkEnvironment sharedEnvironment];
  __int16 v13 = [v12 date];
  uint64_t v14 = [v8 stringFromDate:v13];
  __int16 v15 = objc_msgSend(v9, "stringWithFormat:", v6, v11, v14);

  id v16 = NSTemporaryDirectory();
  uint64_t v17 = +[MTFrameworkEnvironment sharedEnvironment];
  id v18 = [v17 metricsKitBundleIdentifier];
  id v19 = [v16 stringByAppendingPathComponent:v18];

  uint64_t v20 = [MEMORY[0x263F08850] defaultManager];
  [v20 createDirectoryAtPath:v19 withIntermediateDirectories:1 attributes:0 error:0];

  id v21 = [v19 stringByAppendingPathComponent:v15];

  id v22 = (void *)[objc_alloc(MEMORY[0x263EFF9E0]) initToFileAtPath:v21 append:0];
  [v22 open];
  id v27 = 0;
  [MEMORY[0x263F08900] writeJSONObject:v7 toStream:v22 options:0 error:&v27];

  id v23 = v27;
  [v22 close];
  if (v23)
  {
    int64_t v24 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = v21;
      __int16 v30 = 2112;
      id v31 = v23;
      _os_log_impl(&dword_218211000, v24, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to write to %@ error %@", buf, 0x16u);
    }

    id v25 = 0;
  }
  else
  {
    id v25 = v21;
  }

  return v25;
}

- (void)_clearLocalData
{
  id v2 = [(MTStandardIDService *)self secretStore];
  [v2 clearLocalData];

  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"MTIDNamespacesDidResetNotification" object:0 userInfo:0];

  id v4 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_218211000, v4, OS_LOG_TYPE_INFO, "MetricsKit: ID service has cleared local cached data", v5, 2u);
  }
}

- (void)_resetIDs
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(MTStandardIDService *)self filledOptions:0];
  id v4 = objc_loadWeakRetained(&location);
  uint64_t v5 = [v4 configPromise];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __32__MTStandardIDService__resetIDs__block_invoke;
  v7[3] = &unk_26430FBB8;
  v7[4] = self;
  id v6 = v3;
  id v8 = v6;
  [v5 addSuccessBlock:v7];

  objc_destroyWeak(&location);
}

void __32__MTStandardIDService__resetIDs__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 secretStore];
  id v6 = [v4 allKnownSchemes];

  id v7 = (id)[v5 resetSchemes:v6 options:*(void *)(a1 + 40)];
  id v8 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_218211000, v8, OS_LOG_TYPE_INFO, "MetricsKit: ID service has reset IDs in all namespaces", v9, 2u);
  }
}

- (void)_getSecrets
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(MTStandardIDService *)self secretStore];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(MTStandardIDService *)self secretStore];
    uint64_t v5 = [v4 debugInfo];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263EFFA78];
  }

  id v6 = +[MTStandardIDService writeDebugData:v5 toFileWithNameFormat:@"MTIDSecrets-%@-%@.json"];
  if (v6)
  {
    id v7 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_218211000, v7, OS_LOG_TYPE_INFO, "MetricsKit: ID service has written current secrets to %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_getIDs
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(MTStandardIDService *)self filledOptions:0];
  id v4 = objc_loadWeakRetained(&location);
  uint64_t v5 = [v4 configPromise];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __30__MTStandardIDService__getIDs__block_invoke;
  v7[3] = &unk_26430FC00;
  objc_copyWeak(&v9, &location);
  id v6 = v3;
  id v8 = v6;
  [v5 addSuccessBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __30__MTStandardIDService__getIDs__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v17 = a2;
  id v2 = [v17 allKnownSchemes];
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v9 = [MEMORY[0x263EFF9A0] dictionary];
        uint64_t v10 = [v8 dictionaryRepresentation];
        [v9 setObject:v10 forKeyedSubscript:@"scheme"];

        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        id v12 = [v8 idNamespace];
        __int16 v13 = [WeakRetained IDInfoForNamespace:v12 options:*(void *)(a1 + 32) fromConfig:v17];
        uint64_t v14 = [v13 thenWithBlock:&__block_literal_global_151];
        [v9 setObject:v14 forKeyedSubscript:@"current"];

        [v3 addObject:v9];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  __int16 v15 = +[MTPromise promiseWithComposition:v3];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __30__MTStandardIDService__getIDs__block_invoke_3;
  v19[3] = &unk_26430F580;
  id v20 = *(id *)(a1 + 32);
  [v15 addFinishBlock:v19];
}

id __30__MTStandardIDService__getIDs__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 debugInfo];
  uint64_t v3 = +[MTPromise promiseWithResult:v2];

  return v3;
}

void __30__MTStandardIDService__getIDs__block_invoke_3(uint64_t a1, void *a2)
{
  v12[2] = *MEMORY[0x263EF8340];
  v11[0] = @"date";
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 objectForKeyedSubscript:@"date"];
  uint64_t v5 = [v4 description];
  v11[1] = @"ids";
  v12[0] = v5;
  v12[1] = v3;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  id v7 = +[MTStandardIDService writeDebugData:v6 toFileWithNameFormat:@"MTIDs-%@-%@.json"];

  if (v7)
  {
    id v8 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_218211000, v8, OS_LOG_TYPE_INFO, "MetricsKit: ID service has written the current IDs to %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_getConfig
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = [(MTStandardIDService *)self configPromise];
  id v3 = [v2 resultWithError:0];

  uint64_t v4 = [v3 dictionaryRepresentation];

  if (v4)
  {
    uint64_t v5 = [v3 dictionaryRepresentation];
    uint64_t v6 = +[MTStandardIDService writeDebugData:v5 toFileWithNameFormat:@"MTIDConfig-%@-%@.json"];
    if (v6)
    {
      id v7 = MTMetricsKitOSLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412290;
        int v9 = v6;
        _os_log_impl(&dword_218211000, v7, OS_LOG_TYPE_INFO, "MetricsKit: ID service has written current config to %@", (uint8_t *)&v8, 0xCu);
      }
    }
  }
}

+ (BOOL)isTinkerPaired
{
  return 0;
}

- (void)setDsId:(id)a3
{
}

- (void)setApplicationBundleIdentifierOverrideForNetworkAttribution:(id)a3
{
}

- (MTPromise)configDictPromise
{
  return self->_configDictPromise;
}

- (MTInterprocessChangeNotifier)accountChanged
{
  return self->_accountChanged;
}

- (void)setDefaultDSID:(id)a3
{
}

void __62__MTStandardIDService__IDInfoForNamespace_options_fromConfig___block_invoke_115_cold_1()
{
  __assert_rtn("-[MTStandardIDService _IDInfoForNamespace:options:fromConfig:]_block_invoke", "MTStandardIDService.m", 726, "array.count == 2");
}

@end