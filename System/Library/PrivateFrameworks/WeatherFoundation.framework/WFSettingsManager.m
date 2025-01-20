@interface WFSettingsManager
+ (WFSettingsManager)sharedInstance;
+ (id)userIdentifier;
+ (void)setUserIdentifier:(id)a3;
- (BOOL)clearConfigCacheOnLaunchIfRequested;
- (BOOL)shouldReroutePermanentURLsForContainerIdentifier:(id)a3;
- (BOOL)useFallback;
- (NSHashTable)observers;
- (NSString)APIVersion;
- (OS_dispatch_queue)requestSerialQueue;
- (WFRemoteAppSettings)settings;
- (WFSettingsManager)init;
- (WFUserInfoManager)userInfoManager;
- (char)containerIDForContainerIdentifier:(id)a3;
- (id)containerIdentifier;
- (id)debugOverrides;
- (id)permanentURLForRecordID:(id)a3 containerIdentifier:(id)a4;
- (id)urlSafeBase64EncodedStringWithData:(id)a3 options:(unint64_t)a4;
- (os_unfair_lock_s)settingsLock;
- (unint64_t)debugEnvironmentFromOverride:(id)a3;
- (void)APIVersion;
- (void)addObserver:(id)a3;
- (void)clearConfigCacheOnLaunchIfRequested;
- (void)completeOnQueue:(id)a3 error:(id)a4 completion:(id)a5;
- (void)fetchAppConfigurationIfExpired;
- (void)fetchAppConfigurationWithCompletionQueue:(id)a3 completion:(id)a4;
- (void)forceFetchAppConfiguration;
- (void)notifyObserversOfAppConfigRefresh;
- (void)removeObserver:(id)a3;
- (void)setRequestSerialQueue:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSettingsLock:(os_unfair_lock_s)a3;
- (void)setUseFallback:(BOOL)a3;
- (void)setUserInfoManager:(id)a3;
- (void)setupRemoteSettings;
- (void)updateAssetURLHostIfNeededWithComponents:(id)a3 containerIdentifier:(id)a4;
- (void)userInfoManager:(id)a3 didSynchronizeUserIdentifier:(id)a4;
@end

@implementation WFSettingsManager

+ (WFSettingsManager)sharedInstance
{
  if (onceToken != -1) {
    dispatch_once(&onceToken, &__block_literal_global_28);
  }
  v2 = (void *)sSharedInstance;
  return (WFSettingsManager *)v2;
}

uint64_t __35__WFSettingsManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(WFSettingsManager);
  uint64_t v1 = sSharedInstance;
  sSharedInstance = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (WFSettingsManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)WFSettingsManager;
  v2 = [(WFSettingsManager *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.weather.remote_config", v3);
    requestSerialQueue = v2->_requestSerialQueue;
    v2->_requestSerialQueue = (OS_dispatch_queue *)v4;

    v2->_settingsLock._os_unfair_lock_opaque = 0;
    uint64_t v6 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v6;

    v8 = objc_alloc_init(WFUserInfoManager);
    userInfoManager = v2->_userInfoManager;
    v2->_userInfoManager = v8;

    [(WFUserInfoManager *)v2->_userInfoManager setDelegate:v2];
    [(WFUserInfoManager *)v2->_userInfoManager synchronize];
    [(WFSettingsManager *)v2 setupRemoteSettings];
  }
  return v2;
}

- (void)setupRemoteSettings
{
  v3 = [(WFSettingsManager *)self requestSerialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__WFSettingsManager_setupRemoteSettings__block_invoke;
  block[3] = &unk_2644305E8;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __40__WFSettingsManager_setupRemoteSettings__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  v2 = *(void **)(a1 + 32);
  v3 = +[WFRemoteAppSettings defaultSettings];
  [v2 setSettings:v3];

  [*v1 clearConfigCacheOnLaunchIfRequested];
  dispatch_queue_t v4 = WeatherFoundationInternalUserDefaults();
  v5 = [v4 objectForKey:@"cachedAppConfig"];

  if (v5)
  {
    uint64_t v6 = +[WFSettingsManager userIdentifier];
    id v11 = 0;
    v7 = +[WFRemoteAppSettings configurationWithData:v5 userID:v6 error:&v11];
    id v8 = v11;

    [*v1 setSettings:v7];
    if (v8)
    {
      v9 = WFLogForCategory(9uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __40__WFSettingsManager_setupRemoteSettings__block_invoke_cold_3();
      }
    }
    else
    {
      v9 = WFLogForCategory(0xAuLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __40__WFSettingsManager_setupRemoteSettings__block_invoke_cold_2(v1, v9);
      }
    }

    [*v1 fetchAppConfigurationIfExpired];
  }
  else
  {
    v10 = WFLogForCategory(0xAuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __40__WFSettingsManager_setupRemoteSettings__block_invoke_cold_1(v10);
    }

    [*v1 forceFetchAppConfiguration];
  }
}

- (BOOL)useFallback
{
  v2 = self;
  p_settingsLock = &self->_settingsLock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_useFallback;
  os_unfair_lock_unlock(p_settingsLock);
  return (char)v2;
}

- (void)setUseFallback:(BOOL)a3
{
  p_settingsLock = &self->_settingsLock;
  os_unfair_lock_lock_with_options();
  self->_useFallback = a3;
  os_unfair_lock_unlock(p_settingsLock);
}

- (WFRemoteAppSettings)settings
{
  p_settingsLock = &self->_settingsLock;
  os_unfair_lock_lock_with_options();
  dispatch_queue_t v4 = (void *)[(WFRemoteAppSettings *)self->_settings copy];
  os_unfair_lock_unlock(p_settingsLock);
  return (WFRemoteAppSettings *)v4;
}

- (void)setSettings:(id)a3
{
  p_settingsLock = &self->_settingsLock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = (WFRemoteAppSettings *)[v5 copy];

  settings = self->_settings;
  self->_settings = v6;

  os_unfair_lock_unlock(p_settingsLock);
}

- (NSString)APIVersion
{
  v3 = [(WFSettingsManager *)self settings];
  if ([(WFSettingsManager *)self useFallback]) {
    [v3 apiVersionFallback];
  }
  else {
  dispatch_queue_t v4 = [v3 apiVersion];
  }
  id v5 = WFLogForCategory(0xAuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[WFSettingsManager APIVersion]();
  }

  return (NSString *)v4;
}

+ (id)userIdentifier
{
  v2 = WeatherFoundationInternalUserDefaults();
  v3 = [v2 stringForKey:@"userId"];

  if (!v3)
  {
    dispatch_queue_t v4 = [MEMORY[0x263F08C38] UUID];
    v3 = [v4 UUIDString];

    id v5 = WeatherFoundationInternalUserDefaults();
    [v5 setValue:v3 forKey:@"userId"];
  }
  return v3;
}

+ (void)setUserIdentifier:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    WeatherFoundationInternalUserDefaults();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v4 setValue:v3 forKey:@"userId"];
  }
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    p_settingsLock = &self->_settingsLock;
    id v5 = a3;
    os_unfair_lock_lock_with_options();
    uint64_t v6 = [(WFSettingsManager *)self observers];
    [v6 addObject:v5];

    os_unfair_lock_unlock(p_settingsLock);
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_settingsLock = &self->_settingsLock;
    id v9 = v4;
    os_unfair_lock_lock_with_options();
    uint64_t v6 = [(WFSettingsManager *)self observers];
    int v7 = [v6 containsObject:v9];

    if (v7)
    {
      id v8 = [(WFSettingsManager *)self observers];
      [v8 removeObject:v9];
    }
    os_unfair_lock_unlock(p_settingsLock);
    id v4 = v9;
  }
}

- (BOOL)clearConfigCacheOnLaunchIfRequested
{
  v2 = WeatherFoundationInternalUserDefaults();
  int v3 = [v2 BOOLForKey:@"clearConfigCacheOnLaunch"];

  if (!v3) {
    return 0;
  }
  id v4 = WeatherFoundationInternalUserDefaults();
  [v4 setBool:0 forKey:@"clearConfigCacheOnLaunch"];

  id v5 = objc_msgSend(NSURL, "wf_cacheDirectory");
  uint64_t v6 = WeatherFoundationInternalUserDefaults();
  [v6 removeObjectForKey:@"cachedAppConfig"];

  int v7 = WeatherFoundationInternalUserDefaults();
  [v7 removeObjectForKey:@"cachedAppConfigLastSavedDate"];

  id v8 = [MEMORY[0x263F08850] defaultManager];
  char v9 = [v8 removeItemAtURL:v5 error:0];

  v10 = WFLogForCategory(0xAuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    [(WFSettingsManager *)v9 clearConfigCacheOnLaunchIfRequested];
  }

  return v9;
}

- (void)fetchAppConfigurationIfExpired
{
  id v4 = [(WFSettingsManager *)self settings];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 isExpired])
  {
    int v3 = [(WFSettingsManager *)self requestSerialQueue];
    [(WFSettingsManager *)self fetchAppConfigurationWithCompletionQueue:v3 completion:0];
  }
}

- (void)forceFetchAppConfiguration
{
  id v3 = [(WFSettingsManager *)self requestSerialQueue];
  [(WFSettingsManager *)self fetchAppConfigurationWithCompletionQueue:v3 completion:0];
}

- (unint64_t)debugEnvironmentFromOverride:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"remoteconfig_staging"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"remoteconfig_qa"])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)debugOverrides
{
  id v3 = WeatherFoundationInternalUserDefaults();
  unint64_t v4 = [v3 stringForKey:@"remoteconfiguration_env"];

  if (v4)
  {
    unint64_t v5 = [(WFSettingsManager *)self debugEnvironmentFromOverride:v4];
    LOBYTE(v8) = 1;
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F63588]) initWithDisableAbTesting:0 overrideSegmentSetIDs:0 additionalSegmentSetIDs:0 configurationSource:1 debugEnvironment:v5 ignoreCache:1 enableExtraLogs:v8];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)fetchAppConfigurationWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WFSettingsManager *)self requestSerialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__WFSettingsManager_fetchAppConfigurationWithCompletionQueue_completion___block_invoke;
  block[3] = &unk_2644325D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __73__WFSettingsManager_fetchAppConfigurationWithCompletionQueue_completion___block_invoke(id *a1)
{
  v2 = +[WFSettingsManager userIdentifier];
  id v3 = [MEMORY[0x263F086E0] mainBundle];
  unint64_t v4 = [v3 bundleIdentifier];

  id v5 = a1[4];
  id v6 = [v5 containerIdentifier];
  id v7 = [v5 permanentURLForRecordID:@"configuration-weather-000000" containerIdentifier:v6];

  uint64_t v8 = objc_msgSend(NSURL, "wf_cacheDirectory");
  id v9 = (void *)[objc_alloc(MEMORY[0x263F63578]) initWithContentDirectoryURL:v8];
  id v10 = [a1[4] debugOverrides];
  id v11 = objc_alloc(MEMORY[0x263F63580]);
  id v12 = [MEMORY[0x263F63590] defaultDeviceInfo];
  id v13 = (void *)[v11 initWithRequestKey:@"weatherConfigRequest" responseKey:@"weatherConfigurationWrapper" fallbackURL:v7 userID:v2 storefrontID:@"00000" bundleID:v4 deviceInfo:v12 debugOverrides:v10 requestMode:1];

  objc_initWeak(&location, a1[4]);
  v14 = dispatch_get_global_queue(21, 0);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __73__WFSettingsManager_fetchAppConfigurationWithCompletionQueue_completion___block_invoke_2;
  v17[3] = &unk_2644325B0;
  objc_copyWeak(&v22, &location);
  id v18 = a1[5];
  id v21 = a1[6];
  id v15 = v2;
  id v19 = v15;
  id v16 = v4;
  id v20 = v16;
  [v9 fetchSingleConfigurationWithSettings:v13 completionQueue:v14 completion:v17];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __73__WFSettingsManager_fetchAppConfigurationWithCompletionQueue_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v8)
  {
    id v10 = WFLogForCategory(9uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __73__WFSettingsManager_fetchAppConfigurationWithCompletionQueue_completion___block_invoke_2_cold_3();
    }

    [WeakRetained completeOnQueue:*(void *)(a1 + 32) error:v8 completion:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    id v19 = 0;
    id v12 = +[WFRemoteAppSettings configurationWithData:v7 userID:v11 error:&v19];
    id v13 = v19;
    v14 = WFLogForCategory(0xAuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __73__WFSettingsManager_fetchAppConfigurationWithCompletionQueue_completion___block_invoke_2_cold_2(a1, (uint64_t)v12, v14);
    }

    if (v13)
    {
      id v15 = WFLogForCategory(9uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __40__WFSettingsManager_setupRemoteSettings__block_invoke_cold_3();
      }
    }
    else
    {
      [WeakRetained setSettings:v12];
      id v16 = WeatherFoundationInternalUserDefaults();
      [v16 setObject:v7 forKey:@"cachedAppConfig"];

      v17 = WeatherFoundationInternalUserDefaults();
      id v18 = [MEMORY[0x263EFF910] date];
      [v17 setObject:v18 forKey:@"cachedAppConfigLastSavedDate"];

      [WeakRetained notifyObserversOfAppConfigRefresh];
    }
    [WeakRetained completeOnQueue:*(void *)(a1 + 32) error:v13 completion:*(void *)(a1 + 56)];
  }
}

- (void)notifyObserversOfAppConfigRefresh
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  p_settingsLock = &self->_settingsLock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [(WFSettingsManager *)self observers];
  id v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_settingsLock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        id v12 = [(WFSettingsManager *)self settings];
        [v11 settingsManager:self didRefreshWithSettings:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)completeOnQueue:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v9)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__WFSettingsManager_completeOnQueue_error_completion___block_invoke;
    block[3] = &unk_264432600;
    id v13 = v9;
    block[4] = self;
    id v12 = v8;
    dispatch_async((dispatch_queue_t)a3, block);
  }
}

void __54__WFSettingsManager_completeOnQueue_error_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) settings];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

- (id)permanentURLForRecordID:(id)a3 containerIdentifier:(id)a4
{
  char v18 = 2;
  char v17 = 0;
  id v6 = a4;
  id v7 = a3;
  char v16 = [v7 length];
  char v15 = [(WFSettingsManager *)self containerIDForContainerIdentifier:v6];
  id v8 = [MEMORY[0x263EFF990] data];
  [v8 appendBytes:&v18 length:1];
  [v8 appendBytes:&v15 length:1];
  [v8 appendBytes:&v16 length:1];
  id v9 = [v7 dataUsingEncoding:4];

  [v8 appendData:v9];
  [v8 appendBytes:&v17 length:1];
  [v8 appendBytes:"17" length:2];
  uint64_t v10 = [(WFSettingsManager *)self urlSafeBase64EncodedStringWithData:v8 options:0];
  id v11 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v11 setScheme:@"https"];
  [v11 setHost:@"c.apple.news"];
  id v12 = [NSString stringWithFormat:@"/%@", v10];
  [v11 setPath:v12];

  [(WFSettingsManager *)self updateAssetURLHostIfNeededWithComponents:v11 containerIdentifier:v6];
  id v13 = [v11 URL];

  return v13;
}

- (char)containerIDForContainerIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.news.public"])
  {
    char v4 = 1;
  }
  else if ([v3 isEqualToString:@"com.apple.news.public.staging"])
  {
    char v4 = 2;
  }
  else if ([v3 isEqualToString:@"com.apple.news.public.qa"])
  {
    char v4 = 3;
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (id)containerIdentifier
{
  uint64_t v2 = WeatherFoundationInternalUserDefaults();
  id v3 = [v2 stringForKey:@"remoteconfiguration_env"];

  if ([v3 isEqualToString:@"remoteconfig_staging"])
  {
    char v4 = @"com.apple.news.public.staging";
  }
  else if ([v3 isEqualToString:@"remoteconfig_qa"])
  {
    char v4 = @"com.apple.news.public.qa";
  }
  else
  {
    char v4 = @"com.apple.news.public";
  }

  return v4;
}

- (id)urlSafeBase64EncodedStringWithData:(id)a3 options:(unint64_t)a4
{
  char v4 = [a3 base64EncodedStringWithOptions:a4];
  id v5 = (void *)[v4 mutableCopy];

  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"+", @"-", 0, 0, objc_msgSend(v5, "length"));
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"/", @"_", 0, 0, objc_msgSend(v5, "length"));
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"=", &stru_26CD4CE08, 0, 0, objc_msgSend(v5, "length"));
  return v5;
}

- (BOOL)shouldReroutePermanentURLsForContainerIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.news.public.staging"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"com.apple.news.public.qa"];
  }

  return v4;
}

- (void)updateAssetURLHostIfNeededWithComponents:(id)a3 containerIdentifier:(id)a4
{
  id v6 = a3;
  if ([(WFSettingsManager *)self shouldReroutePermanentURLsForContainerIdentifier:a4])
  {
    [v6 setHost:@"cvws-internal.icloud.com"];
  }
}

- (void)userInfoManager:(id)a3 didSynchronizeUserIdentifier:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    [(id)objc_opt_class() setUserIdentifier:v5];

    [(WFSettingsManager *)self setupRemoteSettings];
  }
}

- (WFUserInfoManager)userInfoManager
{
  return self->_userInfoManager;
}

- (void)setUserInfoManager:(id)a3
{
}

- (OS_dispatch_queue)requestSerialQueue
{
  return self->_requestSerialQueue;
}

- (void)setRequestSerialQueue:(id)a3
{
}

- (os_unfair_lock_s)settingsLock
{
  return self->_settingsLock;
}

- (void)setSettingsLock:(os_unfair_lock_s)a3
{
  self->_settingsLock = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_requestSerialQueue, 0);
  objc_storeStrong((id *)&self->_userInfoManager, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

void __40__WFSettingsManager_setupRemoteSettings__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_21C988000, log, OS_LOG_TYPE_DEBUG, "force fetching a new remote config", v1, 2u);
}

void __40__WFSettingsManager_setupRemoteSettings__block_invoke_cold_2(id *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = [*a1 settings];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_21C988000, a2, OS_LOG_TYPE_DEBUG, "initializing with remote app settings: %@", v4, 0xCu);
}

void __40__WFSettingsManager_setupRemoteSettings__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21C988000, v0, v1, "Error parsing remote config: %{public}@", v2, v3, v4, v5, v6);
}

- (void)APIVersion
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21C988000, v0, v1, "Using API: %@ is fallback: %@");
}

- (void)clearConfigCacheOnLaunchIfRequested
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = @"NO";
  if (a1) {
    uint64_t v2 = @"YES";
  }
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21C988000, a2, OS_LOG_TYPE_DEBUG, "cleared remote config cache? : [%@]", (uint8_t *)&v3, 0xCu);
}

void __73__WFSettingsManager_fetchAppConfigurationWithCompletionQueue_completion___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 48);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_4(&dword_21C988000, a2, a3, "updating remote app settings for %{public}@ to: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __73__WFSettingsManager_fetchAppConfigurationWithCompletionQueue_completion___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21C988000, v0, v1, "Error retrieving remote config: %{public}@", v2, v3, v4, v5, v6);
}

@end