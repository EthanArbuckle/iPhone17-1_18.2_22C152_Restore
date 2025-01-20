@interface PSSimStatusCache
+ (id)sharedInstance;
- (BOOL)isAnySimPresent;
- (BOOL)isDualSimCapable;
- (BOOL)isSIMMissing;
- (BOOL)isSlotActiveDataSlot:(int64_t)a3;
- (CTXPCServiceSubscriptionContext)currentDataSubscriptionContext;
- (CTXPCServiceSubscriptionContext)userDefaultVoiceSubscriptionContext;
- (CTXPCServiceSubscriptionInfo)subscriptionInfo;
- (CoreTelephonyClient)coreTelephonyClient;
- (NSMutableDictionary)simHardwareTypeDict;
- (NSMutableDictionary)simStatusDict;
- (PSSimStatusCache)init;
- (PSSimStatusCache)initWithCoreTelephonyClient:(id)a3;
- (id)activeDataSubscriptionContext;
- (id)defaultVoiceSubscriptionContext;
- (id)getLogger;
- (id)initPrivate;
- (id)simStatus:(id)a3;
- (id)subscriptionContexts;
- (id)subscriptionsInUse;
- (int64_t)simHardwareInfo:(id)a3;
- (void)clearSimHardwareInfoCache;
- (void)clearSubscriptionContextCache;
- (void)currentDataSimChanged:(id)a3;
- (void)fetchActiveDataSubscriptionContextIfNeeded;
- (void)fetchDefaultVoiceSubscriptionContextIfNeeded;
- (void)fetchSimHardwareInfo;
- (void)fetchSimStatus;
- (void)fetchSubscriptionContexts;
- (void)preferredDataSimChanged:(id)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setCurrentDataSubscriptionContext:(id)a3;
- (void)setIsAnySimPresent:(BOOL)a3;
- (void)setSimHardwareTypeDict:(id)a3;
- (void)setSimStatusDict:(id)a3;
- (void)setSubscriptionInfo:(id)a3;
- (void)setUserDefaultVoiceSubscriptionContext:(id)a3;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
- (void)subscriptionInfoDidChange;
- (void)updateIsAnySimPresent;
- (void)willEnterForeground;
@end

@implementation PSSimStatusCache

uint64_t __34__PSSimStatusCache_sharedInstance__block_invoke()
{
  _MergedGlobals_4 = [[PSSimStatusCache alloc] initPrivate];
  return MEMORY[0x270F9A758]();
}

- (id)initPrivate
{
  id v3 = objc_alloc(MEMORY[0x263F02D30]);
  v4 = +[SettingsCellularSharedUtils createCTClientSerialQueue:@"sim_status"];
  v5 = (void *)[v3 initWithQueue:v4];

  v6 = [(PSSimStatusCache *)self initWithCoreTelephonyClient:v5];
  return v6;
}

- (PSSimStatusCache)initWithCoreTelephonyClient:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PSSimStatusCache;
  v6 = [(PSSimStatusCache *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coreTelephonyClient, a3);
    [(CoreTelephonyClient *)v7->_coreTelephonyClient setDelegate:v7];
    subscriptionInfo = v7->_subscriptionInfo;
    v7->_subscriptionInfo = 0;

    simStatusDict = v7->_simStatusDict;
    v7->_simStatusDict = 0;

    currentDataSubscriptionContext = v7->_currentDataSubscriptionContext;
    v7->_currentDataSubscriptionContext = 0;

    userDefaultVoiceSubscriptionContext = v7->_userDefaultVoiceSubscriptionContext;
    v7->_userDefaultVoiceSubscriptionContext = 0;

    simHardwareTypeDict = v7->_simHardwareTypeDict;
    v7->_simHardwareTypeDict = 0;

    [(PSSimStatusCache *)v7 updateIsAnySimPresent];
    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v7 selector:sel_willEnterForeground name:*MEMORY[0x263F1D0D0] object:0];
  }
  return v7;
}

- (void)updateIsAnySimPresent
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = [(PSSimStatusCache *)self subscriptionContexts];
  self->_isAnySimPresent = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v19;
    v9 = (void *)*MEMORY[0x263F03078];
    v10 = (void *)*MEMORY[0x263F030B8];
    *(void *)&long long v6 = 138412546;
    long long v17 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v4);
        }
        v12 = *(const char **)(*((void *)&v18 + 1) + 8 * i);
        -[PSSimStatusCache simStatus:](self, "simStatus:", v12, v17, (void)v18);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v14 = [(PSSimStatusCache *)self getLogger];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v17;
          v23 = v12;
          __int16 v24 = 2114;
          v25 = v13;
          _os_log_impl(&dword_2247E9000, v14, OS_LOG_TYPE_DEFAULT, "SIM status fetch succeeded: %@, %{public}@", buf, 0x16u);
        }

        if (([v9 isEqualToString:v13] & 1) == 0) {
          self->_isAnySimPresent = 1;
        }
        if ([v10 isEqualToString:v13])
        {
          objc_super v15 = [(PSSimStatusCache *)self getLogger];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v23 = "-[PSSimStatusCache updateIsAnySimPresent]";
            __int16 v24 = 2112;
            v25 = @"PSSimStatusChangedToReadyNotification";
            _os_log_impl(&dword_2247E9000, v15, OS_LOG_TYPE_DEFAULT, "%s posting notification %@", buf, 0x16u);
          }

          v16 = [MEMORY[0x263F08A00] defaultCenter];
          [v16 postNotificationName:@"PSSimStatusChangedToReadyNotification" object:0];

          goto LABEL_17;
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_17:
}

- (void)fetchSimStatus
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = [(PSSimStatusCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2247E9000, v3, OS_LOG_TYPE_DEFAULT, "Fetching SIM status", buf, 2u);
  }

  id v4 = [(PSSimStatusCache *)self subscriptionContexts];
  id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v21;
    *(void *)&long long v7 = 138412546;
    long long v17 = v7;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        coreTelephonyClient = self->_coreTelephonyClient;
        id v19 = 0;
        v12 = -[CoreTelephonyClient getSIMStatus:error:](coreTelephonyClient, "getSIMStatus:error:", v10, &v19, v17);
        id v13 = v19;
        v14 = [(PSSimStatusCache *)self getLogger];
        objc_super v15 = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v25 = v10;
            __int16 v26 = 2114;
            id v27 = v13;
            _os_log_error_impl(&dword_2247E9000, v15, OS_LOG_TYPE_ERROR, "Fetch failed: %@, %{public}@", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            v25 = v10;
            __int16 v26 = 2114;
            id v27 = v12;
            _os_log_impl(&dword_2247E9000, v15, OS_LOG_TYPE_DEFAULT, "Fetch succeeded: %@, %{public}@", buf, 0x16u);
          }

          objc_super v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "slotID"));
          [v18 setObject:v12 forKeyedSubscript:v15];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v6);
  }

  v16 = self;
  objc_sync_enter(v16);
  [(PSSimStatusCache *)v16 setSimStatusDict:v18];
  objc_sync_exit(v16);
}

- (id)simStatus:(id)a3
{
  id v4 = a3;
  if (!self->_simStatusDict) {
    [(PSSimStatusCache *)self fetchSimStatus];
  }
  id v5 = self;
  objc_sync_enter(v5);
  simStatusDict = self->_simStatusDict;
  long long v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID"));
  uint64_t v8 = [(NSMutableDictionary *)simStatusDict objectForKeyedSubscript:v7];

  objc_sync_exit(v5);
  return v8;
}

- (id)getLogger
{
  return +[Logger loggerWithCategory:@"SIMCache"];
}

- (id)subscriptionContexts
{
  subscriptionInfo = self->_subscriptionInfo;
  if (!subscriptionInfo)
  {
    [(PSSimStatusCache *)self fetchSubscriptionContexts];
    subscriptionInfo = self->_subscriptionInfo;
  }
  return (id)[(CTXPCServiceSubscriptionInfo *)subscriptionInfo subscriptions];
}

- (void)setSimStatusDict:(id)a3
{
}

- (void)fetchSubscriptionContexts
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(PSSimStatusCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2247E9000, v3, OS_LOG_TYPE_DEFAULT, "executing fetch", buf, 2u);
  }

  coreTelephonyClient = self->_coreTelephonyClient;
  id v9 = 0;
  id v5 = [(CoreTelephonyClient *)coreTelephonyClient getSubscriptionInfoWithError:&v9];
  id v6 = v9;
  long long v7 = [(PSSimStatusCache *)self getLogger];
  uint64_t v8 = (PSSimStatusCache *)v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_error_impl(&dword_2247E9000, &v8->super, OS_LOG_TYPE_ERROR, "fetch failed: %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_2247E9000, &v8->super, OS_LOG_TYPE_DEFAULT, "fetch succeeded: %@", buf, 0xCu);
    }

    uint64_t v8 = self;
    objc_sync_enter(v8);
    [(PSSimStatusCache *)v8 setSubscriptionInfo:v5];
    objc_sync_exit(v8);
  }
}

- (void)setSubscriptionInfo:(id)a3
{
}

+ (id)sharedInstance
{
  if (qword_26AC32888 != -1) {
    dispatch_once(&qword_26AC32888, &__block_literal_global_1);
  }
  v2 = (void *)_MergedGlobals_4;
  return v2;
}

- (PSSimStatusCache)init
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = [(PSSimStatusCache *)self getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    id v4 = "-[PSSimStatusCache init]";
    _os_log_error_impl(&dword_2247E9000, v2, OS_LOG_TYPE_ERROR, "unsupported initializer called: %s", (uint8_t *)&v3, 0xCu);
  }

  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer" reason:@"Unsupported initializer called" userInfo:0]);
}

- (void)clearSubscriptionContextCache
{
  int v3 = [(PSSimStatusCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2247E9000, v3, OS_LOG_TYPE_DEFAULT, "Clearing sim status cache", v5, 2u);
  }

  id v4 = self;
  objc_sync_enter(v4);
  [(PSSimStatusCache *)v4 setCurrentDataSubscriptionContext:0];
  [(PSSimStatusCache *)v4 setUserDefaultVoiceSubscriptionContext:0];
  objc_sync_exit(v4);
}

- (void)clearSimHardwareInfoCache
{
  int v3 = [(PSSimStatusCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2247E9000, v3, OS_LOG_TYPE_DEFAULT, "Clearing sim hardware info cache", v5, 2u);
  }

  id v4 = self;
  objc_sync_enter(v4);
  [(PSSimStatusCache *)v4 setSimHardwareTypeDict:0];
  objc_sync_exit(v4);
}

- (void)willEnterForeground
{
  int v3 = [(PSSimStatusCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2247E9000, v3, OS_LOG_TYPE_DEFAULT, "Entering foreground", v6, 2u);
  }

  subscriptionInfo = self->_subscriptionInfo;
  self->_subscriptionInfo = 0;

  simStatusDict = self->_simStatusDict;
  self->_simStatusDict = 0;

  [(PSSimStatusCache *)self clearSubscriptionContextCache];
  [(PSSimStatusCache *)self clearSimHardwareInfoCache];
  [(PSSimStatusCache *)self fetchSubscriptionContexts];
  [(PSSimStatusCache *)self fetchSimStatus];
  [(PSSimStatusCache *)self updateIsAnySimPresent];
}

- (void)fetchActiveDataSubscriptionContextIfNeeded
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  int v3 = [(PSSimStatusCache *)v2 currentDataSubscriptionContext];

  if (v3)
  {
    id v4 = [(PSSimStatusCache *)v2 getLogger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [(PSSimStatusCache *)v2 currentDataSubscriptionContext];
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_2247E9000, v4, OS_LOG_TYPE_DEFAULT, "No fetch needed, active data subscription context is: %@", buf, 0xCu);
    }
    objc_sync_exit(v2);
  }
  else
  {
    objc_sync_exit(v2);

    id v6 = [(PSSimStatusCache *)v2 getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2247E9000, v6, OS_LOG_TYPE_DEFAULT, "Executing fetch for active data subscription", buf, 2u);
    }

    coreTelephonyClient = v2->_coreTelephonyClient;
    id v12 = 0;
    uint64_t v8 = [(CoreTelephonyClient *)coreTelephonyClient getCurrentDataSubscriptionContextSync:&v12];
    id v9 = (PSSimStatusCache *)v12;
    v10 = [(PSSimStatusCache *)v2 getLogger];
    id v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_error_impl(&dword_2247E9000, v11, OS_LOG_TYPE_ERROR, "Fetch failed: %@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v8;
        _os_log_impl(&dword_2247E9000, v11, OS_LOG_TYPE_DEFAULT, "Fetch succeeded: %@", buf, 0xCu);
      }

      id v11 = v2;
      objc_sync_enter(v11);
      [v11 setCurrentDataSubscriptionContext:v8];
      objc_sync_exit(v11);
    }

    v2 = v9;
  }
}

- (void)fetchDefaultVoiceSubscriptionContextIfNeeded
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  int v3 = [(PSSimStatusCache *)v2 userDefaultVoiceSubscriptionContext];

  if (v3)
  {
    id v4 = [(PSSimStatusCache *)v2 getLogger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [(PSSimStatusCache *)v2 userDefaultVoiceSubscriptionContext];
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_2247E9000, v4, OS_LOG_TYPE_DEFAULT, "No fetch needed, default voice subscription context is: %@", buf, 0xCu);
    }
    objc_sync_exit(v2);
  }
  else
  {
    objc_sync_exit(v2);

    id v6 = [(PSSimStatusCache *)v2 getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2247E9000, v6, OS_LOG_TYPE_DEFAULT, "Executing fetch for default voice subscription", buf, 2u);
    }

    coreTelephonyClient = v2->_coreTelephonyClient;
    id v12 = 0;
    uint64_t v8 = [(CoreTelephonyClient *)coreTelephonyClient getUserDefaultVoiceSubscriptionContext:&v12];
    id v9 = (PSSimStatusCache *)v12;
    v10 = [(PSSimStatusCache *)v2 getLogger];
    id v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_error_impl(&dword_2247E9000, v11, OS_LOG_TYPE_ERROR, "Fetch failed: %@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v8;
        _os_log_impl(&dword_2247E9000, v11, OS_LOG_TYPE_DEFAULT, "Fetch succeeded: %@", buf, 0xCu);
      }

      id v11 = v2;
      objc_sync_enter(v11);
      [v11 setUserDefaultVoiceSubscriptionContext:v8];
      objc_sync_exit(v11);
    }

    v2 = v9;
  }
}

- (id)subscriptionsInUse
{
  subscriptionInfo = self->_subscriptionInfo;
  if (!subscriptionInfo)
  {
    [(PSSimStatusCache *)self fetchSubscriptionContexts];
    subscriptionInfo = self->_subscriptionInfo;
  }
  return (id)[(CTXPCServiceSubscriptionInfo *)subscriptionInfo subscriptionsInUse];
}

- (void)subscriptionInfoDidChange
{
  int v3 = [(PSSimStatusCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2247E9000, v3, OS_LOG_TYPE_DEFAULT, "Subscription info changed", v4, 2u);
  }

  [(PSSimStatusCache *)self fetchSubscriptionContexts];
}

- (id)defaultVoiceSubscriptionContext
{
  [(PSSimStatusCache *)self fetchDefaultVoiceSubscriptionContextIfNeeded];
  int v3 = self;
  objc_sync_enter(v3);
  id v4 = [(PSSimStatusCache *)v3 userDefaultVoiceSubscriptionContext];
  objc_sync_exit(v3);

  return v4;
}

- (id)activeDataSubscriptionContext
{
  [(PSSimStatusCache *)self fetchActiveDataSubscriptionContextIfNeeded];
  int v3 = self;
  objc_sync_enter(v3);
  id v4 = [(PSSimStatusCache *)v3 currentDataSubscriptionContext];
  objc_sync_exit(v3);

  return v4;
}

- (BOOL)isSlotActiveDataSlot:(int64_t)a3
{
  [(PSSimStatusCache *)self fetchActiveDataSubscriptionContextIfNeeded];
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(PSSimStatusCache *)v5 currentDataSubscriptionContext];
  LOBYTE(a3) = [v6 slotID] == a3;

  objc_sync_exit(v5);
  return a3;
}

- (void)fetchSimHardwareInfo
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  int v3 = [(PSSimStatusCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2247E9000, v3, OS_LOG_TYPE_DEFAULT, "Fetching SIM hardware info", buf, 2u);
  }

  id v4 = [(PSSimStatusCache *)self subscriptionContexts];
  id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v22;
    *(void *)&long long v7 = 138412546;
    long long v18 = v7;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        coreTelephonyClient = self->_coreTelephonyClient;
        id v20 = 0;
        id v12 = -[CoreTelephonyClient getSimHardwareInfo:error:](coreTelephonyClient, "getSimHardwareInfo:error:", v10, &v20, v18);
        id v13 = v20;
        v14 = [(PSSimStatusCache *)self getLogger];
        uint64_t v15 = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            __int16 v26 = v10;
            __int16 v27 = 2114;
            id v28 = v13;
            _os_log_error_impl(&dword_2247E9000, v15, OS_LOG_TYPE_ERROR, "Fetch failed: %@, %{public}@", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            __int16 v26 = v10;
            __int16 v27 = 2114;
            id v28 = v12;
            _os_log_impl(&dword_2247E9000, v15, OS_LOG_TYPE_DEFAULT, "Fetch succeeded: %@, %{public}@", buf, 0x16u);
          }

          uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "hardwareType"));
          v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "slotID"));
          [v19 setObject:v15 forKeyedSubscript:v16];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v6);
  }

  long long v17 = self;
  objc_sync_enter(v17);
  [(PSSimStatusCache *)v17 setSimHardwareTypeDict:v19];
  objc_sync_exit(v17);
}

- (int64_t)simHardwareInfo:(id)a3
{
  id v4 = a3;
  if (!self->_simHardwareTypeDict) {
    [(PSSimStatusCache *)self fetchSimHardwareInfo];
  }
  id v5 = self;
  objc_sync_enter(v5);
  simHardwareTypeDict = self->_simHardwareTypeDict;
  long long v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID"));
  uint64_t v8 = [(NSMutableDictionary *)simHardwareTypeDict objectForKeyedSubscript:v7];

  objc_sync_exit(v5);
  int v9 = [v8 intValue];
  if (v9 == 1) {
    int64_t v10 = 1;
  }
  else {
    int64_t v10 = 2 * (v9 == 2);
  }

  return v10;
}

- (BOOL)isDualSimCapable
{
  v2 = [(PSSimStatusCache *)self subscriptionContexts];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (BOOL)isSIMMissing
{
  int v3 = MGGetBoolAnswer();
  if (v3) {
    LOBYTE(v3) = !self->_isAnySimPresent;
  }
  return v3;
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PSSimStatusCache *)self getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_2247E9000, v8, OS_LOG_TYPE_DEFAULT, "Context: %@, status: %{public}@", (uint8_t *)&v12, 0x16u);
  }

  int v9 = self;
  objc_sync_enter(v9);
  simStatusDict = v9->_simStatusDict;
  id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "slotID"));
  [(NSMutableDictionary *)simStatusDict setObject:v7 forKeyedSubscript:v11];

  objc_sync_exit(v9);
  [(PSSimStatusCache *)v9 clearSubscriptionContextCache];
  [(PSSimStatusCache *)v9 clearSimHardwareInfoCache];
  [(PSSimStatusCache *)v9 updateIsAnySimPresent];
}

- (void)preferredDataSimChanged:(id)a3
{
  id v4 = [(PSSimStatusCache *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2247E9000, v4, OS_LOG_TYPE_DEFAULT, "Received Preferred Data SIM Changed, clearing cached subscription contexts", v5, 2u);
  }

  [(PSSimStatusCache *)self clearSubscriptionContextCache];
}

- (void)currentDataSimChanged:(id)a3
{
  id v4 = [(PSSimStatusCache *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2247E9000, v4, OS_LOG_TYPE_DEFAULT, "Recieved Current Data SIM Changed, clearing cached subscription contexts", v5, 2u);
  }

  [(PSSimStatusCache *)self clearSubscriptionContextCache];
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (CTXPCServiceSubscriptionInfo)subscriptionInfo
{
  return (CTXPCServiceSubscriptionInfo *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)simStatusDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (CTXPCServiceSubscriptionContext)currentDataSubscriptionContext
{
  return (CTXPCServiceSubscriptionContext *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCurrentDataSubscriptionContext:(id)a3
{
}

- (CTXPCServiceSubscriptionContext)userDefaultVoiceSubscriptionContext
{
  return (CTXPCServiceSubscriptionContext *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUserDefaultVoiceSubscriptionContext:(id)a3
{
}

- (NSMutableDictionary)simHardwareTypeDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSimHardwareTypeDict:(id)a3
{
}

- (BOOL)isAnySimPresent
{
  return self->_isAnySimPresent;
}

- (void)setIsAnySimPresent:(BOOL)a3
{
  self->_isAnySimPresent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simHardwareTypeDict, 0);
  objc_storeStrong((id *)&self->_userDefaultVoiceSubscriptionContext, 0);
  objc_storeStrong((id *)&self->_currentDataSubscriptionContext, 0);
  objc_storeStrong((id *)&self->_simStatusDict, 0);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

@end