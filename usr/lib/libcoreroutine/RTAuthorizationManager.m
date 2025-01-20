@interface RTAuthorizationManager
+ (BOOL)supportsNotificationName:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)isCoreRoutineLocationClientEnabled;
- (BOOL)isEnabled;
- (BOOL)isLocationServicesEnabled;
- (BOOL)isReady;
- (BOOL)isSupported;
- (BOOL)shouldPersistLocations;
- (RTAuthorizationManager)init;
- (RTAuthorizationManager)initWithPlatform:(id)a3 userSessionMonitor:(id)a4;
- (RTInvocationDispatcher)dispatcher;
- (RTPlatform)platform;
- (RTUserSessionMonitor)userSessionMonitor;
- (id)_getMetrics:(BOOL)a3;
- (void)_onDailyMetricsNotification:(id)a3;
- (void)_registerForNotifications;
- (void)_shutdownWithHandler:(id)a3;
- (void)_unregisterForNotifications;
- (void)dealloc;
- (void)fetchRoutineEnabledWithHandler:(id)a3;
- (void)fetchRoutineSupportedWithHandler:(id)a3;
- (void)handleAppResetChangeNotification;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)onDailyMetricsNotification:(id)a3;
- (void)onUserSessionChangeNotification:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setPlatform:(id)a3;
- (void)setReady:(BOOL)a3;
- (void)setRoutineEnabled:(BOOL)a3 withHandler:(id)a4;
- (void)setSupported:(BOOL)a3;
- (void)setUserSessionMonitor:(id)a3;
- (void)setup;
- (void)updateRoutineEnabled:(BOOL)a3;
@end

@implementation RTAuthorizationManager

- (void)fetchRoutineSupportedWithHandler:(id)a3
{
  id v4 = a3;
  v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__RTAuthorizationManager_fetchRoutineSupportedWithHandler___block_invoke;
  v7[3] = &unk_1E6B90D08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)fetchRoutineEnabledWithHandler:(id)a3
{
  id v4 = a3;
  v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__RTAuthorizationManager_fetchRoutineEnabledWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __59__RTAuthorizationManager_fetchRoutineSupportedWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) isSupported];
  v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

uint64_t __57__RTAuthorizationManager_fetchRoutineEnabledWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isSupported]) {
    int v2 = [*(id *)(a1 + 32) isEnabled];
  }
  else {
    int v2 = 0;
  }
  v3 = _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = @"NO";
    if (v2) {
      id v4 = @"YES";
    }
    int v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "CoreRoutine enabled, %@", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)isSupported
{
  return self->_supported;
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([(id)objc_opt_class() supportsNotificationName:v7] & 1) == 0)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      id v17 = v7;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v16, 0xCu);
    }
  }
  v9 = +[RTNotification notificationName];
  int v10 = [v7 isEqualToString:v9];

  if (v10)
  {
    v11 = [[RTAuthorizationManagerNotificationRoutineEnabled alloc] initWithEnabled:[(RTAuthorizationManager *)self isEnabled]];
    goto LABEL_9;
  }
  v12 = +[RTNotification notificationName];
  int v13 = [v7 isEqualToString:v12];

  if (v13)
  {
    v14 = [RTAuthorizationManagerNotificationConsoleUserDidChange alloc];
    v15 = [(RTAuthorizationManager *)self userSessionMonitor];
    v11 = -[RTAuthorizationManagerNotificationConsoleUserDidChange initWithactiveUser:](v14, "initWithactiveUser:", [v15 activeUser]);

    if (!v11)
    {
LABEL_10:

      goto LABEL_11;
    }
LABEL_9:
    [(RTNotifier *)self postNotification:v11 toObserver:v6];
    goto LABEL_10;
  }
LABEL_11:
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

+ (BOOL)supportsNotificationName:(id)a3
{
  id v3 = a3;
  id v4 = +[RTNotification notificationName];
  if ([v3 isEqualToString:v4])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = +[RTNotification notificationName];
    char v5 = [v3 isEqualToString:v6];
  }
  return v5;
}

- (RTAuthorizationManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPlatform_userSessionMonitor_);
}

- (RTAuthorizationManager)initWithPlatform:(id)a3 userSessionMonitor:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
LABEL_21:

      v23 = 0;
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: platform";
LABEL_24:
    _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
    goto LABEL_21;
  }
  if (!v8)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: userSessionMonitor";
    goto LABEL_24;
  }
  v27.receiver = self;
  v27.super_class = (Class)RTAuthorizationManager;
  int v10 = [(RTNotifier *)&v27 init];
  if (v10)
  {
    v11 = [RTInvocationDispatcher alloc];
    v12 = [(RTNotifier *)v10 queue];
    uint64_t v13 = [(RTInvocationDispatcher *)v11 initWithQueue:v12];
    dispatcher = v10->_dispatcher;
    v10->_dispatcher = (RTInvocationDispatcher *)v13;

    objc_storeStrong((id *)&v10->_platform, a3);
    objc_storeStrong((id *)&v10->_userSessionMonitor, a4);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v10, (CFNotificationCallback)onAppResetChangedNotification, (CFStringRef)*MEMORY[0x1E4F22138], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    userSessionMonitor = v10->_userSessionMonitor;
    id v17 = +[RTNotification notificationName];
    [(RTNotifier *)userSessionMonitor addObserver:v10 selector:sel_onUserSessionChangeNotification_ name:v17];

    v10->_supported = [v7 supportsCoreRoutineCapability];
    uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      if (v10->_supported) {
        v19 = @"YES";
      }
      else {
        v19 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      v29 = v19;
      _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "CoreRoutine's services supported, %@", buf, 0xCu);
    }

    BOOL v20 = [(RTAuthorizationManager *)v10 isLocationServicesEnabled];
    if (v20) {
      LOBYTE(v20) = [(RTAuthorizationManager *)v10 isCoreRoutineLocationClientEnabled];
    }
    v10->_enabled = v20;
    v21 = _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      if (v10->_enabled) {
        v22 = @"YES";
      }
      else {
        v22 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      v29 = v22;
      _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "CoreRoutine's location client enabled, %@", buf, 0xCu);
    }

    [(RTAuthorizationManager *)v10 setup];
  }
  self = v10;
  v23 = self;
LABEL_22:

  return v23;
}

- (void)_registerForNotifications
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v6 = NSStringFromSelector(a2);
    int v7 = 138412290;
    id v8 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "%@, registered for daily notifications", (uint8_t *)&v7, 0xCu);
  }
  char v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel_onDailyMetricsNotification_ name:@"RTMetricManagerDailyMetricNotification" object:0];
}

- (void)_unregisterForNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];
}

- (id)_getMetrics:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(RTAuthorizationManager *)self isLocationServicesEnabled];
  BOOL v6 = [(RTAuthorizationManager *)self isCoreRoutineLocationClientEnabled];
  int v7 = objc_opt_new();
  id v8 = [NSNumber numberWithBool:v6];
  [v7 setObject:v8 forKeyedSubscript:@"coreRoutineSystemServiceEnabled"];

  uint64_t v9 = [NSNumber numberWithBool:v5];
  [v7 setObject:v9 forKeyedSubscript:@"locationServicesEnabled"];

  int v10 = [NSNumber numberWithBool:self->_enabled];
  if (v3) {
    v11 = @"authorizationStateChange";
  }
  else {
    v11 = @"authorizationState";
  }
  [v7 setObject:v10 forKeyedSubscript:v11];

  return v7;
}

- (void)_onDailyMetricsNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [v5 name];
  char v7 = [v6 isEqualToString:@"RTMetricManagerDailyMetricNotification"];

  if ((v7 & 1) == 0)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v17 = [v5 name];
      *(_DWORD *)buf = 138412802;
      v19 = v17;
      __int16 v20 = 2080;
      v21 = "-[RTAuthorizationManager _onDailyMetricsNotification:]";
      __int16 v22 = 1024;
      int v23 = 157;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v19 = v10;
    __int16 v20 = 2112;
    v21 = (const char *)v5;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, received notification, %@", buf, 0x16u);
  }
  v11 = [v5 name];
  char v12 = [v11 isEqualToString:@"RTMetricManagerDailyMetricNotification"];

  if (v12)
  {
    uint64_t v13 = [(RTAuthorizationManager *)self _getMetrics:0];
    id v14 = [NSString alloc];
    v15 = (void *)[v14 initWithCString:RTAnalyticsEventAuthorizationState encoding:1];
    log_analytics_submission(v15, v13);
    int v16 = [NSString stringWithFormat:@"com.apple.%@", v15];
    AnalyticsSendEvent();
  }
  else
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    v15 = [v5 name];
    *(_DWORD *)buf = 138412290;
    v19 = v15;
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "unknown notification name, %@", buf, 0xCu);
  }

LABEL_11:
}

- (void)onDailyMetricsNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__RTAuthorizationManager_onDailyMetricsNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __53__RTAuthorizationManager_onDailyMetricsNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onDailyMetricsNotification:*(void *)(a1 + 40)];
}

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return +[RTAuthorizationManager allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___RTAuthorizationManager;
    return [super allocWithZone:a3];
  }
}

- (void)setup
{
  BOOL v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__RTAuthorizationManager_setup__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __31__RTAuthorizationManager_setup__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setup];
  *(unsigned char *)(*(void *)(a1 + 32) + 34) = 1;
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) invocationsPending];
  if (result)
  {
    BOOL v3 = *(void **)(*(void *)(a1 + 32) + 40);
    return [v3 dispatchPendingInvocations];
  }
  return result;
}

- (void)_shutdownWithHandler:(id)a3
{
  id v6 = a3;
  id v4 = [(RTAuthorizationManager *)self dispatcher];
  [v4 shutdown];

  [(RTAuthorizationManager *)self _unregisterForNotifications];
  id v5 = v6;
  if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
    id v5 = v6;
  }
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)RTAuthorizationManager;
  [(RTAuthorizationManager *)&v5 dealloc];
}

- (BOOL)isLocationServicesEnabled
{
  return 0;
}

- (BOOL)isCoreRoutineLocationClientEnabled
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)CLCopyAppsUsingLocation();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = [v2 objectForKey:*(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10];
        if ([MEMORY[0x1E4F1E600] primaryEntityClassForLocationDictionary:v6] == 16)
        {
          LODWORD(v3) = [MEMORY[0x1E4F1E600] isEntityAuthorizedForLocationDictionary:v6];

          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  char v7 = _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = @"NO";
    if (v3) {
      id v8 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "CoreRoutine's location client enabled, %@", buf, 0xCu);
  }

  return v3;
}

- (BOOL)shouldPersistLocations
{
  id v2 = [(RTAuthorizationManager *)self userSessionMonitor];
  char v3 = [v2 activeUser];

  return v3;
}

- (void)setRoutineEnabled:(BOOL)a3 withHandler:(id)a4
{
  id v6 = a4;
  char v7 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__RTAuthorizationManager_setRoutineEnabled_withHandler___block_invoke;
  block[3] = &unk_1E6B90EE0;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __56__RTAuthorizationManager_setRoutineEnabled_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 48)) {
      char v3 = @"YES";
    }
    else {
      char v3 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "set routine enabled to %@", buf, 0xCu);
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)CLCopyAppsUsingLocation();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [v4 objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * i) v11];
        if ([MEMORY[0x1E4F1E600] primaryEntityClassForLocationDictionary:v9] == 16)
        {
          [MEMORY[0x1E4F1E600] setEntityAuthorized:*(unsigned __int8 *)(a1 + 48) forLocationDictionary:v9];

          goto LABEL_16;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  [*(id *)(a1 + 32) setEnabled:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    id v8 = [[RTAuthorizationManagerNotificationRoutineEnabled alloc] initWithEnabled:self->_enabled];
    [(RTNotifier *)self postNotification:v8];
    id v4 = [(RTAuthorizationManager *)self _getMetrics:1];
    id v5 = [NSString alloc];
    uint64_t v6 = (void *)[v5 initWithCString:RTAnalyticsEventAuthorizationStateChange encoding:1];
    log_analytics_submission(v6, v4);
    uint64_t v7 = [NSString stringWithFormat:@"com.apple.%@", v6];
    AnalyticsSendEvent();
  }
}

- (void)updateRoutineEnabled:(BOOL)a3
{
  id v5 = [(RTNotifier *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__RTAuthorizationManager_updateRoutineEnabled___block_invoke;
  v6[3] = &unk_1E6B90F08;
  BOOL v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

uint64_t __47__RTAuthorizationManager_updateRoutineEnabled___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 40)) {
      char v3 = @"YES";
    }
    else {
      char v3 = @"NO";
    }
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "update routine enabled to %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) setEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)handleAppResetChangeNotification
{
  char v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__RTAuthorizationManager_handleAppResetChangeNotification__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

void __58__RTAuthorizationManager_handleAppResetChangeNotification__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setEnabled:[*(id *)(a1 + 32) isCoreRoutineLocationClientEnabled]];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = [*(id *)(a1 + 32) isEnabled];
    id v4 = @"NO";
    if (v3) {
      id v4 = @"YES";
    }
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "Overall CoreRoutine services enabled after app reset changed notification, %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  if (([(id)objc_opt_class() supportsNotificationName:v4] & 1) == 0)
  {
    int v5 = _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)onUserSessionChangeNotification:(id)a3
{
  id v4 = a3;
  int v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__RTAuthorizationManager_onUserSessionChangeNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __58__RTAuthorizationManager_onUserSessionChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) name];
  int v3 = +[RTNotification notificationName];
  int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    int v5 = _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = [*(id *)(a1 + 32) activeUser];
      int v9 = 67109120;
      LODWORD(v10) = v6;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "active user did change: is active user: %d", (uint8_t *)&v9, 8u);
    }

    id v7 = -[RTAuthorizationManagerNotificationConsoleUserDidChange initWithactiveUser:]([RTAuthorizationManagerNotificationConsoleUserDidChange alloc], "initWithactiveUser:", [*(id *)(a1 + 32) activeUser]);
    if (v7) {
      [*(id *)(a1 + 40) postNotification:v7];
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    id v7 = (RTAuthorizationManagerNotificationConsoleUserDidChange *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_ERROR))
    {
      id v8 = [*(id *)(a1 + 32) name];
      int v9 = 138412802;
      uint64_t v10 = v8;
      __int16 v11 = 2080;
      long long v12 = "-[RTAuthorizationManager onUserSessionChangeNotification:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 393;
      _os_log_error_impl(&dword_1D9BFA000, &v7->super.super, OS_LOG_TYPE_ERROR, "unhandled notification name, %@ (in %s:%d)", (uint8_t *)&v9, 0x1Cu);
    }
  }
}

- (RTInvocationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

- (BOOL)isReady
{
  return self->_ready;
}

- (void)setReady:(BOOL)a3
{
  self->_ready = a3;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (RTUserSessionMonitor)userSessionMonitor
{
  return (RTUserSessionMonitor *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUserSessionMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSessionMonitor, 0);
  objc_storeStrong((id *)&self->_platform, 0);

  objc_storeStrong((id *)&self->_dispatcher, 0);
}

@end