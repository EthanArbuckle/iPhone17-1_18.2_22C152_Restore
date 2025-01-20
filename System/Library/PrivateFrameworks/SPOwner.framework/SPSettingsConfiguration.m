@interface SPSettingsConfiguration
- (FMXPCServiceDescription)serviceDescription;
- (FMXPCSession)session;
- (NSDate)beaconZoneCreationDate;
- (NSDate)lastKeyRollDate;
- (NSNumber)beaconZoneCreationErrorCode;
- (NSOperationQueue)notificationQueue;
- (NSSet)serviceDisabledReasons;
- (NSString)serviceState;
- (NSUUID)baUUID;
- (NSUserDefaults)sharedDefaults;
- (OS_dispatch_queue)queue;
- (SPBeaconManagerXPCProtocol)proxy;
- (SPSettingsConfiguration)init;
- (id)serviceSettingsChangedNotificationToken;
- (id)serviceSettingsConfiguration;
- (void)_invalidate;
- (void)beginRefreshingServiceStateWithBlock:(id)a3;
- (void)dealloc;
- (void)setNotificationQueue:(id)a3;
- (void)setProxy:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceDescription:(id)a3;
- (void)setServiceDisabledReasons:(id)a3;
- (void)setServiceSettingsChangedNotificationToken:(id)a3;
- (void)setServiceState:(id)a3;
- (void)setServiceState:(id)a3 completion:(id)a4;
- (void)setSession:(id)a3;
- (void)setSharedDefaults:(id)a3;
- (void)setUserAgentProxy:(id)a3;
@end

@implementation SPSettingsConfiguration

- (NSUUID)baUUID
{
  return 0;
}

- (NSDate)beaconZoneCreationDate
{
  v2 = [(SPSettingsConfiguration *)self sharedDefaults];
  v3 = [v2 objectForKey:@"SPBeaconZoneCreationDateKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSNumber)beaconZoneCreationErrorCode
{
  v2 = [(SPSettingsConfiguration *)self sharedDefaults];
  v3 = [v2 objectForKey:@"SPBeaconZoneCreationDateKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSNumber *)v4;
}

- (NSDate)lastKeyRollDate
{
  v2 = [(SPSettingsConfiguration *)self sharedDefaults];
  v3 = [v2 objectForKey:@"SPLastKeyRollDateKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)serviceSettingsConfiguration
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/private/var/db/searchparty/daemon/savedConfiguration.plist" isDirectory:1];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v2 error:0];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = objc_msgSend(v3, "objectForKeyedSubscript:", @"configurations", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v10 = [v9 objectForKeyedSubscript:@"source"];
          if ([v10 isEqualToString:@"serviceSettings"])
          {
            id v11 = v9;

            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    id v11 = 0;
LABEL_12:
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (SPSettingsConfiguration)init
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)SPSettingsConfiguration;
  v2 = [(SPSettingsConfiguration *)&v15 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.icloud.searchpartyd.settingsconfiguration", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = v6;

    v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B44050];
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F61588]) initWithMachServiceName:@"com.apple.icloud.searchpartyd.beaconmanager" options:0 remoteObjectInterface:v8 interruptionHandler:0 invalidationHandler:0];
    serviceDescription = v2->_serviceDescription;
    v2->_serviceDescription = (FMXPCServiceDescription *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"systemgroup.com.apple.icloud.searchpartyd.sharedsettings"];
    sharedDefaults = v2->_sharedDefaults;
    v2->_sharedDefaults = (NSUserDefaults *)v11;

    long long v13 = LogCategory_ServiceState();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v2;
      _os_log_impl(&dword_1B2FD8000, v13, OS_LOG_TYPE_DEFAULT, "SPSettingsConfiguration: Created %@", buf, 0xCu);
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = LogCategory_ServiceState();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v6 = self;
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "SPSettingsConfiguration: Dealloc %@", buf, 0xCu);
  }

  [(SPSettingsConfiguration *)self _invalidate];
  v4.receiver = self;
  v4.super_class = (Class)SPSettingsConfiguration;
  [(SPSettingsConfiguration *)&v4 dealloc];
}

- (void)_invalidate
{
  v3 = [(SPSettingsConfiguration *)self session];
  [v3 invalidate];

  [(SPSettingsConfiguration *)self setSession:0];
  id v5 = [(SPSettingsConfiguration *)self serviceSettingsChangedNotificationToken];
  [(SPSettingsConfiguration *)self setServiceSettingsChangedNotificationToken:0];
  if (v5) {
    [(SPSettingsConfiguration *)self fm_removeNotificationBlockObserver:v5];
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.icloud.searchparty.ServiceSettingsChanged", 0);
}

- (void)beginRefreshingServiceStateWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SPSettingsConfiguration *)self serviceSettingsChangedNotificationToken];

  if (v5)
  {
    uint64_t v6 = LogCategory_ServiceState();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "beginRefreshingServiceStateWithBlock: already started.", buf, 2u);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__SPSettingsConfiguration_beginRefreshingServiceStateWithBlock___block_invoke;
    block[3] = &unk_1E601B790;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__SPSettingsConfiguration_beginRefreshingServiceStateWithBlock___block_invoke_2;
    aBlock[3] = &unk_1E601C0C0;
    aBlock[4] = self;
    id v18 = v4;
    uint64_t v7 = _Block_copy(aBlock);
    uint64_t v8 = SPServiceSettingsChangedLocalNotification;
    uint64_t v9 = [(SPSettingsConfiguration *)self notificationQueue];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    long long v14 = __64__SPSettingsConfiguration_beginRefreshingServiceStateWithBlock___block_invoke_3;
    objc_super v15 = &unk_1E601D450;
    id v16 = v7;
    v10 = v7;
    uint64_t v11 = [(SPSettingsConfiguration *)self fm_addNotificationBlockObserverForName:v8 object:self queue:v9 usingBlock:&v12];
    -[SPSettingsConfiguration setServiceSettingsChangedNotificationToken:](self, "setServiceSettingsChangedNotificationToken:", v11, v12, v13, v14, v15);

    v10[2](v10);
  }
}

void __64__SPSettingsConfiguration_beginRefreshingServiceStateWithBlock___block_invoke(uint64_t a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v3 = *(const void **)(a1 + 32);

  CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)serviceSettingsChangedTrampoline, @"com.apple.icloud.searchparty.ServiceSettingsChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

void __64__SPSettingsConfiguration_beginRefreshingServiceStateWithBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) serviceState];
  v3 = [*(id *)(a1 + 32) serviceDisabledReasons];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

uint64_t __64__SPSettingsConfiguration_beginRefreshingServiceStateWithBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setServiceState:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(SPSettingsConfiguration *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__SPSettingsConfiguration_setServiceState_completion___block_invoke;
  v11[3] = &unk_1E601B850;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __54__SPSettingsConfiguration_setServiceState_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained userAgentProxy];
  [v2 setServiceState:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (NSString)serviceState
{
  uint64_t v2 = [(SPSettingsConfiguration *)self sharedDefaults];
  v3 = [v2 stringForKey:@"SPSettingsServiceStateKey"];
  id v4 = v3;
  if (!v3) {
    v3 = @"SPServiceStateEnabled";
  }
  id v5 = v3;

  return v5;
}

- (NSSet)serviceDisabledReasons
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(SPSettingsConfiguration *)self sharedDefaults];
  id v4 = [v3 arrayForKey:@"SPSettingsServiceDisabledReasonsKey"];
  id v5 = [v2 setWithArray:v4];
  id v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  uint64_t v8 = v7;

  return (NSSet *)v8;
}

- (SPBeaconManagerXPCProtocol)proxy
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(SPSettingsConfiguration *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SPSettingsConfiguration *)self session];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F61590]);
    id v6 = [(SPSettingsConfiguration *)self serviceDescription];
    id v7 = (void *)[v5 initWithServiceDescription:v6];
    [(SPSettingsConfiguration *)self setSession:v7];

    uint64_t v8 = LogCategory_ServiceState();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(SPSettingsConfiguration *)self serviceDescription];
      id v10 = [v9 machService];
      int v15 = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPSettingsConfiguration: Establishing XPC connection to %@", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v11 = [(SPSettingsConfiguration *)self session];
    [v11 resume];
  }
  id v12 = [(SPSettingsConfiguration *)self session];
  id v13 = [v12 proxy];

  return (SPBeaconManagerXPCProtocol *)v13;
}

- (NSUserDefaults)sharedDefaults
{
  return self->_sharedDefaults;
}

- (void)setSharedDefaults:(id)a3
{
}

- (void)setServiceState:(id)a3
{
}

- (void)setServiceDisabledReasons:(id)a3
{
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void)setProxy:(id)a3
{
}

- (void)setUserAgentProxy:(id)a3
{
}

- (id)serviceSettingsChangedNotificationToken
{
  id WeakRetained = objc_loadWeakRetained(&self->_serviceSettingsChangedNotificationToken);

  return WeakRetained;
}

- (void)setServiceSettingsChangedNotificationToken:(id)a3
{
}

- (NSOperationQueue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_destroyWeak(&self->_serviceSettingsChangedNotificationToken);
  objc_storeStrong((id *)&self->_userAgentProxy, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong((id *)&self->_serviceDisabledReasons, 0);
  objc_storeStrong((id *)&self->_serviceState, 0);

  objc_storeStrong((id *)&self->_sharedDefaults, 0);
}

@end