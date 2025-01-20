@interface PowerUIBatteryMitigationManager
+ (id)managerWithDefaultsDomain:(id)a3;
+ (id)sharedManager;
- (BOOL)fetchCurrentMitigationState;
- (BOOL)mitigationsCurrentlyEnabled;
- (NSString)defaultsDomain;
- (OS_os_log)log;
- (PowerUIAnalyticsManager)analyticsManager;
- (PowerUIBatteryMitigationManager)initWithDefaultsDomain:(id)a3;
- (id)getGaugingMitigationDict;
- (unint64_t)decisionSignalID;
- (void)fetchCurrentMitigationState;
- (void)setAnalyticsManager:(id)a3;
- (void)setDefaultsDomain:(id)a3;
- (void)setLog:(id)a3;
- (void)submitGaugingAnalytics:(id)a3;
@end

@implementation PowerUIBatteryMitigationManager

- (PowerUIBatteryMitigationManager)initWithDefaultsDomain:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PowerUIBatteryMitigationManager;
  v6 = [(PowerUIBatteryMitigationManager *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_defaultsDomain, a3);
    uint64_t v8 = +[PowerUIAnalyticsManager sharedInstance];
    analyticsManager = v7->_analyticsManager;
    v7->_analyticsManager = (PowerUIAnalyticsManager *)v8;

    os_log_t v10 = os_log_create("com.apple.powerui.smartcharging", "ocvmitigation");
    log = v7->_log;
    v7->_log = (OS_os_log *)v10;

    [(PowerUIBatteryMitigationManager *)v7 fetchCurrentMitigationState];
  }

  return v7;
}

+ (id)managerWithDefaultsDomain:(id)a3
{
  id v3 = a3;
  v4 = [[PowerUIBatteryMitigationManager alloc] initWithDefaultsDomain:v3];

  return v4;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)sharedManager_manager;
  return v2;
}

uint64_t __48__PowerUIBatteryMitigationManager_sharedManager__block_invoke()
{
  sharedManager_manager = [[PowerUIBatteryMitigationManager alloc] initWithDefaultsDomain:@"com.apple.smartcharging.topoffprotection"];
  return MEMORY[0x270F9A758]();
}

- (id)getGaugingMitigationDict
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  id v3 = [NSDictionary dictionary];
  int State = IOPSGaugingMitigationGetState();
  log = self->_log;
  BOOL v6 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (State)
  {
    if (v6)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = State;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Gauging mitigation state error received: %d", buf, 8u);
    }
    v7 = v3;
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Gauging dict:", buf, 2u);
    }
    v7 = (id)cf;

    CFRelease(cf);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = [v7 allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_super v13 = self->_log;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
            v15 = v13;
            v16 = [v7 objectForKeyedSubscript:v14];
            *(_DWORD *)buf = 138412546;
            uint64_t v24 = v14;
            __int16 v25 = 2112;
            v26 = v16;
            _os_log_impl(&dword_22135E000, v15, OS_LOG_TYPE_DEFAULT, "\t%@: %@", buf, 0x16u);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v27 count:16];
      }
      while (v10);
    }
  }
  return v7;
}

- (BOOL)fetchCurrentMitigationState
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int mitigationsCurrentlyEnabled = self->_mitigationsCurrentlyEnabled;
  int out_token = 0;
  if (notify_register_check("com.apple.system.powersources.gaugingmitigation", &out_token))
  {
    log = self->_log;
    BOOL v5 = os_log_type_enabled(log, OS_LOG_TYPE_FAULT);
    if (v5)
    {
      -[PowerUIBatteryMitigationManager fetchCurrentMitigationState](log);
LABEL_8:
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if (notify_get_state(out_token, &v13))
    {
      BOOL v6 = self->_log;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[PowerUIBatteryMitigationManager fetchCurrentMitigationState](v6);
      }
      notify_cancel(out_token);
      goto LABEL_8;
    }
    notify_cancel(out_token);
    int v7 = v13 & 1;
    self->_int mitigationsCurrentlyEnabled = v7;
    uint64_t v8 = self->_log;
    if (mitigationsCurrentlyEnabled == v7)
    {
      BOOL v5 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
      if (!v5) {
        return v5;
      }
      BOOL v9 = self->_mitigationsCurrentlyEnabled;
      *(_DWORD *)buf = 67109120;
      BOOL v16 = v9;
      _os_log_impl(&dword_22135E000, v8, OS_LOG_TYPE_INFO, "Current mitigation state unchanged: %d", buf, 8u);
      goto LABEL_8;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = self->_mitigationsCurrentlyEnabled;
      *(_DWORD *)buf = 67109120;
      BOOL v16 = v10;
      _os_log_impl(&dword_22135E000, v8, OS_LOG_TYPE_DEFAULT, "Current mitigation state changed to: %d", buf, 8u);
    }
    uint64_t v11 = [(PowerUIBatteryMitigationManager *)self getGaugingMitigationDict];
    [(PowerUIBatteryMitigationManager *)self submitGaugingAnalytics:v11];

    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)submitGaugingAnalytics:(id)a3
{
  id v18 = a3;
  v4 = [MEMORY[0x263EFF910] now];
  BOOL v5 = [v18 objectForKeyedSubscript:@"lastQMaxUpdate"];
  if (v5)
  {
    [v4 timeIntervalSinceDate:v5];
    uint64_t v7 = (int)(v6 / 86400.0);
  }
  else
  {
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  uint64_t v8 = [v18 objectForKeyedSubscript:@"lastDOD0Update"];
  if (v8)
  {
    [v4 timeIntervalSinceDate:v8];
    uint64_t v10 = (int)(v9 / 86400.0);
  }
  else
  {
    uint64_t v10 = 0xFFFFFFFFLL;
  }
  uint64_t v11 = [v18 objectForKeyedSubscript:@"lastFullChargeDate"];
  if (v11)
  {
    [v4 timeIntervalSinceDate:v11];
    uint64_t v13 = (int)(v12 / 86400.0);
  }
  else
  {
    uint64_t v13 = 0xFFFFFFFFLL;
  }
  analyticsManager = self->_analyticsManager;
  v15 = [NSNumber numberWithInt:v7];
  BOOL v16 = [NSNumber numberWithInt:v10];
  uint64_t v17 = [NSNumber numberWithInt:v13];
  [(PowerUIAnalyticsManager *)analyticsManager submitGaugingEventWithUpdateType:1 qmaxState:0 daysSinceQMax:v15 ocvState:0 daysSinceOCV:v16 fullChargeState:0 daysSinceFullChargeAttempt:v17];
}

- (unint64_t)decisionSignalID
{
  return self->_decisionSignalID;
}

- (BOOL)mitigationsCurrentlyEnabled
{
  return self->_mitigationsCurrentlyEnabled;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (PowerUIAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (NSString)defaultsDomain
{
  return self->_defaultsDomain;
}

- (void)setDefaultsDomain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)fetchCurrentMitigationState
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22135E000, log, OS_LOG_TYPE_FAULT, "Could not register for gauging mitigation notification", v1, 2u);
}

@end