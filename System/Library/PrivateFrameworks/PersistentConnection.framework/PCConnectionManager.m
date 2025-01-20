@interface PCConnectionManager
+ (BOOL)_isCachedKeepAliveIntervalStillValid:(double)a3 date:(id)a4;
+ (Class)growthAlgorithmClass;
+ (id)_keepAliveCachePath;
+ (id)intervalCacheDictionaries;
+ (void)_keepAliveCachePath;
- (BOOL)_hasBudgetRemaining;
- (BOOL)_isPushConnected;
- (BOOL)alwaysWantsInterfaceChangeCallbacks;
- (BOOL)disableEarlyFire;
- (BOOL)isRunning;
- (BOOL)minimumIntervalFallbackEnabled;
- (BOOL)operatorMinimumIntervalFallbackAllowed;
- (BOOL)powerOptimizationsForExpensiveNetworkingDisabled;
- (BOOL)shouldClientScheduleReconnectDueToFailure;
- (BOOL)usingServerStatsAggressively;
- (NSString)duetIdentifier;
- (PCConnectionManager)initWithConnectionClass:(int)a3 delegate:(id)a4 delegateQueue:(id)a5 serviceIdentifier:(id)a6;
- (PCConnectionManager)initWithConnectionClass:(int)a3 delegate:(id)a4 serviceIdentifier:(id)a5;
- (PCConnectionManager)initWithConnectionClass:(int)a3 interfaceIdentifier:(int64_t)a4 guidancePriority:(unint64_t)a5 delegate:(id)a6 serviceIdentifier:(id)a7;
- (PCConnectionManagerDelegate)delegate;
- (PCKeepAliveState)currentKeepAliveState;
- (double)currentKeepAliveInterval;
- (double)keepAliveGracePeriod;
- (double)lastScheduledIntervalTime;
- (double)maximumKeepAliveInterval;
- (double)minimumKeepAliveInterval;
- (double)nonCellularEarlyFireConstantInterval;
- (double)pollingInterval;
- (double)serverStatsExpectedKeepAliveInterval;
- (double)serverStatsMaxKeepAliveInterval;
- (double)serverStatsMinKeepAliveInterval;
- (id)_currentGrowthAlgorithm;
- (id)_getCachedWWANKeepAliveIntervalForAddressFamily:(int)a3;
- (id)_growthAlgorithmOnInterface:(int64_t)a3;
- (id)_initWithConnectionClass:(int)a3 interfaceIdentifier:(int64_t)a4 guidancePriority:(unint64_t)a5 delegate:(id)a6 delegateQueue:(id)a7 serviceIdentifier:(id)a8;
- (id)_stringForAction:(int)a3;
- (id)_stringForAddressFamily:(int)a3;
- (id)_stringForEvent:(int)a3;
- (id)_stringForStyle:(int)a3;
- (id)persistentInterfaceManager;
- (int)currentAddressFamily;
- (int)currentGrowthStage;
- (int)currentStyle;
- (int)lastProcessedAction;
- (int64_t)interfaceIdentifier;
- (unint64_t)countOfGrowthActions;
- (void)_adjustInterfaceAssertions;
- (void)_adjustMinimumIntervalFallback;
- (void)_adjustPollTimerIfNecessary;
- (void)_callDelegateWithEventAndContext:(id)a3;
- (void)_calloutWithEvent:(int)a3 context:(id)a4;
- (void)_clearTimers;
- (void)_clearTimersReleasingPowerAssertion:(BOOL)a3;
- (void)_delayTimerFired;
- (void)_deregisterForDeviceConditionsNotifications;
- (void)_handleDeviceConditionChangeCallback;
- (void)_intervalTimerFired;
- (void)_loadPreferencesGeneratingEvent:(BOOL)a3;
- (void)_pauseTimers;
- (void)_preferencesChanged;
- (void)_processDeviceConditionChanges;
- (void)_registerForDeviceConditionsNotifications;
- (void)_releasePowerAssertion;
- (void)_resolveStateWithAction:(int)a3;
- (void)_saveWWANKeepAliveInterval;
- (void)_setMaximumKeepAliveInterval:(double)a3 onInterface:(int64_t)a4;
- (void)_setMinimumKeepAliveInterval:(double)a3 onInterface:(int64_t)a4;
- (void)_setTimerGuidance:(double)a3;
- (void)_setupKeepAliveForReconnect;
- (void)_setupTimerForPollForAdjustment:(BOOL)a3;
- (void)_setupTimerForPushWithKeepAliveInterval:(double)a3;
- (void)_takePowerAssertionWithTimeout:(double)a3;
- (void)_validateActionForCurrentStyle:(int)a3;
- (void)cancelPollingIntervalOverride;
- (void)carrierBundleDidChange;
- (void)dealloc;
- (void)interfaceLinkQualityChanged:(id)a3 previousLinkQuality:(int)a4;
- (void)interfaceManagerInHomeCountryStatusChanged:(id)a3;
- (void)interfaceManagerInternetReachabilityChanged:(id)a3;
- (void)interfaceManagerWWANInterfaceStatusChanged:(id)a3;
- (void)resumeManagerWithAction:(int)a3;
- (void)resumeManagerWithAction:(int)a3 forceGrow:(BOOL)a4;
- (void)setAlwaysWantsInterfaceChangeCallbacks:(BOOL)a3;
- (void)setCurrentAddressFamily:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableEarlyFire:(BOOL)a3;
- (void)setDuetIdentifier:(id)a3;
- (void)setEnableNonCellularConnections:(BOOL)a3;
- (void)setInterfaceIdentifier:(int64_t)a3;
- (void)setKeepAliveGracePeriod:(double)a3;
- (void)setKeepAliveOverrideOnInterface:(int64_t)a3 interval:(double)a4 timeout:(double)a5;
- (void)setMaximumKeepAliveInterval:(double)a3;
- (void)setMinimumIntervalFallbackEnabled:(BOOL)a3;
- (void)setMinimumKeepAliveInterval:(double)a3;
- (void)setNonCellularEarlyFireConstantInterval:(double)a3;
- (void)setOnlyAllowedStyle:(int)a3;
- (void)setOperatorMinimumIntervalFallbackAllowed:(BOOL)a3;
- (void)setPollingIntervalOverride:(double)a3;
- (void)setPowerOptimizationsForExpensiveNetworkingDisabled:(BOOL)a3;
- (void)setServerStatsExpectedKeepAliveInterval:(double)a3;
- (void)setServerStatsMaxKeepAliveInterval:(double)a3;
- (void)setServerStatsMinKeepAliveInterval:(double)a3;
- (void)setUsingServerStatsAggressively:(BOOL)a3;
- (void)startManager;
- (void)stopAndResetManager;
- (void)stopManager;
@end

@implementation PCConnectionManager

+ (Class)growthAlgorithmClass
{
  return (Class)objc_opt_class();
}

- (id)_initWithConnectionClass:(int)a3 interfaceIdentifier:(int64_t)a4 guidancePriority:(unint64_t)a5 delegate:(id)a6 delegateQueue:(id)a7 serviceIdentifier:(id)a8
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v75.receiver = self;
  v75.super_class = (Class)PCConnectionManager;
  v18 = [(PCConnectionManager *)&v75 init];
  if (!v18) {
    goto LABEL_16;
  }
  if (!v15)
  {
    v67 = [MEMORY[0x1E4F28B00] currentHandler];
    [v67 handleFailureInMethod:a2 object:v18 file:@"PCConnectionManager.m" lineNumber:121 description:@"delegate must not be nil"];

    if (v17) {
      goto LABEL_4;
    }
LABEL_18:
    v68 = [MEMORY[0x1E4F28B00] currentHandler];
    [v68 handleFailureInMethod:a2 object:v18 file:@"PCConnectionManager.m" lineNumber:122 description:@"serviceIdentifer must not be nil"];

    goto LABEL_4;
  }
  if (!v17) {
    goto LABEL_18;
  }
LABEL_4:
  id v19 = v17;
  uint64_t v20 = +[PCLog logWithCategory:](PCLog, "logWithCategory:", [v19 UTF8String]);
  v21 = (void *)*((void *)v18 + 11);
  *((void *)v18 + 11) = v20;

  *((void *)v18 + 21) = 0;
  *((void *)v18 + 7) = a4;
  *((_DWORD *)v18 + 2) = a3;
  objc_storeWeak((id *)v18 + 2, v15);
  uint64_t v22 = [v19 copy];
  v23 = (void *)*((void *)v18 + 3);
  *((void *)v18 + 3) = v22;

  *((void *)v18 + 8) = a5;
  *((_DWORD *)v18 + 82) = 0;
  if (v16)
  {
    id v24 = v16;
    v25 = (void *)*((void *)v18 + 10);
    *((void *)v18 + 10) = v24;
  }
  else
  {
    uint64_t v26 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    v25 = (void *)*((void *)v18 + 9);
    *((void *)v18 + 9) = v26;
  }
  id v69 = v17;

  *((_DWORD *)v18 + 40) = 0;
  v27 = *((void *)v18 + 11);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = *((void *)v18 + 3);
    uint64_t v29 = *((void *)v18 + 7);
    *(_DWORD *)buf = 138412802;
    v77 = v18;
    __int16 v78 = 2112;
    uint64_t v79 = v28;
    __int16 v80 = 2048;
    uint64_t v81 = v29;
    _os_log_impl(&dword_1D340D000, v27, OS_LOG_TYPE_DEFAULT, "Creating PCManager %@ with identifier %@ and interfaceIdentifier %ld", buf, 0x20u);
  }
  id v70 = v16;
  notify_register_check("PCPushIsConnectedToken", (int *)v18 + 63);
  if (!*((void *)v18 + 7)) {
    goto LABEL_13;
  }
  uint64_t v30 = 0;
  v31 = v18 + 96;
  char v32 = 1;
  do
  {
    char v33 = v32;
    v34 = [v18 _getCachedWWANKeepAliveIntervalForAddressFamily:v30];
    v35 = NSString;
    uint64_t v36 = *((void *)v18 + 3);
    v37 = [v18 _stringForAddressFamily:v30];
    v38 = [v35 stringWithFormat:@"%@-%@", v36, v37];

    v39 = NSString;
    v40 = [v18 _stringForAddressFamily:v30];
    v41 = [v39 stringWithFormat:@"WWAN growth algorithm-%@", v40];

    uint64_t v42 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "growthAlgorithmClass")), "initWithCacheInfo:loggingIdentifier:algorithmName:", v34, v38, v41);
    v43 = *(void **)&v31[8 * v30];
    *(void *)&v31[8 * v30] = v42;

    objc_msgSend(*(id *)&v31[8 * v30], "setSignalAvoidanceRange:", 1680.0, 240.0);
    char v32 = 0;
    uint64_t v30 = 1;
  }
  while ((v33 & 1) != 0);
  if (*((void *)v18 + 7) != 1)
  {
LABEL_13:
    uint64_t v44 = 0;
    v45 = v18 + 112;
    char v46 = 1;
    do
    {
      char v47 = v46;
      v48 = NSString;
      uint64_t v49 = *((void *)v18 + 3);
      v50 = [v18 _stringForAddressFamily:v44];
      v51 = [v48 stringWithFormat:@"%@-%@", v49, v50];

      v52 = NSString;
      v53 = [v18 _stringForAddressFamily:v44];
      v54 = [v52 stringWithFormat:@"WiFi growth algorithm-%@", v53];

      uint64_t v55 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "growthAlgorithmClass")), "initWithCacheInfo:loggingIdentifier:algorithmName:", 0, v51, v54);
      v56 = *(void **)&v45[8 * v44];
      *(void *)&v45[8 * v44] = v55;

      [*(id *)&v45[8 * v44] setMaximumKeepAliveInterval:1800.0];
      char v46 = 0;
      uint64_t v44 = 1;
    }
    while ((v47 & 1) != 0);
  }
  v57 = dispatch_queue_create("PCConnectionManager-noteQueue", 0);
  v58 = +[PCInterfaceMonitor sharedInstanceForIdentifier:0];
  [v58 addDelegate:v18 queue:v57];

  v59 = +[PCInterfaceMonitor sharedInstanceForIdentifier:1];
  [v59 addDelegate:v18 queue:v57];

  v60 = [MEMORY[0x1E4F59E30] weakRefWithObject:v18];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __126__PCConnectionManager__initWithConnectionClass_interfaceIdentifier_guidancePriority_delegate_delegateQueue_serviceIdentifier___block_invoke;
  handler[3] = &unk_1E698DF18;
  id v61 = v60;
  id v74 = v61;
  notify_register_dispatch("PCPersistentTimerGuidanceNotification", (int *)v18 + 62, v57, handler);
  v62 = [v18 persistentInterfaceManager];
  [v62 addDelegate:v18 queue:v57];

  v63 = (const char *)[(__CFString *)@"PCPreferencesDidChangeNotification" cStringUsingEncoding:4];
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __126__PCConnectionManager__initWithConnectionClass_interfaceIdentifier_guidancePriority_delegate_delegateQueue_serviceIdentifier___block_invoke_2;
  v71[3] = &unk_1E698DF18;
  id v72 = v61;
  id v64 = v61;
  notify_register_dispatch(v63, (int *)v18 + 64, v57, v71);
  [v18 _loadPreferencesGeneratingEvent:0];
  v65 = +[PCCarrierBundleHelper helper];
  [v65 addDelegate:v18];

  id v16 = v70;
  id v17 = v69;
LABEL_16:

  return v18;
}

void __126__PCConnectionManager__initWithConnectionClass_interfaceIdentifier_guidancePriority_delegate_delegateQueue_serviceIdentifier___block_invoke(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  v3 = [*(id *)(a1 + 32) object];
  [v3 _setTimerGuidance:(double)state64 / 1000.0];
}

void __126__PCConnectionManager__initWithConnectionClass_interfaceIdentifier_guidancePriority_delegate_delegateQueue_serviceIdentifier___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) object];
  [v1 _preferencesChanged];
}

- (void)carrierBundleDidChange
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PCConnectionManager_carrierBundleDidChange__block_invoke;
  block[3] = &unk_1E698DE90;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __45__PCConnectionManager_carrierBundleDidChange__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) interfaceIdentifier];
  if (result)
  {
    v3 = *(NSObject **)(*(void *)(a1 + 32) + 88);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1D340D000, v3, OS_LOG_TYPE_DEFAULT, "%@ carrier bundle changed", (uint8_t *)&v5, 0xCu);
    }
    return [*(id *)(a1 + 32) _preferencesChanged];
  }
  return result;
}

- (PCConnectionManager)initWithConnectionClass:(int)a3 delegate:(id)a4 delegateQueue:(id)a5 serviceIdentifier:(id)a6
{
  return (PCConnectionManager *)[(PCConnectionManager *)self _initWithConnectionClass:*(void *)&a3 interfaceIdentifier:2 guidancePriority:-1 delegate:a4 delegateQueue:a5 serviceIdentifier:a6];
}

- (PCConnectionManager)initWithConnectionClass:(int)a3 interfaceIdentifier:(int64_t)a4 guidancePriority:(unint64_t)a5 delegate:(id)a6 serviceIdentifier:(id)a7
{
  return (PCConnectionManager *)[(PCConnectionManager *)self _initWithConnectionClass:*(void *)&a3 interfaceIdentifier:a4 guidancePriority:a5 delegate:a6 delegateQueue:0 serviceIdentifier:a7];
}

- (PCConnectionManager)initWithConnectionClass:(int)a3 delegate:(id)a4 serviceIdentifier:(id)a5
{
  return [(PCConnectionManager *)self initWithConnectionClass:*(void *)&a3 interfaceIdentifier:2 guidancePriority:-1 delegate:a4 serviceIdentifier:a5];
}

- (void)setDelegate:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak((id *)&obj->_delegate, v4);

  objc_sync_exit(obj);
}

- (PCConnectionManagerDelegate)delegate
{
  v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_sync_exit(v2);

  return (PCConnectionManagerDelegate *)WeakRetained;
}

- (void)setDuetIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (NSString *)a3;
  int v5 = self;
  objc_sync_enter(v5);
  if (v5->_duetIdentifier != v4)
  {
    logObject = v5->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      duetIdentifier = v5->_duetIdentifier;
      int v10 = 138412802;
      v11 = v5;
      __int16 v12 = 2112;
      v13 = duetIdentifier;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%@ Changing duetIdentifier from %@ to %@", (uint8_t *)&v10, 0x20u);
    }
    uint64_t v8 = [(NSString *)v4 copy];
    v9 = v5->_duetIdentifier;
    v5->_duetIdentifier = (NSString *)v8;
  }
  objc_sync_exit(v5);
}

- (NSString)duetIdentifier
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(NSString *)v2->_duetIdentifier copy];
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (void)dealloc
{
  [(PCConnectionManager *)self _clearTimers];
  v3 = [(PCConnectionManager *)self persistentInterfaceManager];
  [v3 enableWiFiAutoAssociation:0 forDelegate:self];
  [v3 enableWakeOnWiFi:0 forDelegate:self];
  [v3 removeDelegate:self];
  id v4 = +[PCInterfaceMonitor sharedInstanceForIdentifier:1];
  [v4 removeDelegate:self];

  int v5 = +[PCInterfaceMonitor sharedInstanceForIdentifier:0];
  [v5 removeDelegate:self];

  lastScheduledGrowthAlgorithm = self->_lastScheduledGrowthAlgorithm;
  self->_lastScheduledGrowthAlgorithm = 0;

  uint64_t v7 = +[PCCarrierBundleHelper helper];
  [v7 removeDelegate:self];

  notify_cancel(self->_timerGuidanceToken);
  notify_cancel(self->_pushIsConnectedToken);
  notify_cancel(self->_prefsChangedToken);

  v8.receiver = self;
  v8.super_class = (Class)PCConnectionManager;
  [(PCConnectionManager *)&v8 dealloc];
}

- (void)_preferencesChanged
{
  obj = self;
  objc_sync_enter(obj);
  [(PCConnectionManager *)obj _loadPreferencesGeneratingEvent:1];
  objc_sync_exit(obj);
}

- (void)_loadPreferencesGeneratingEvent:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = self;
  objc_sync_enter(v4);
  logObject = v4->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "_loadPreferencesGeneratingEvent", buf, 2u);
  }
  int v6 = [(PCConnectionManager *)v4 currentStyle];
  double defaultPollingInterval = v4->_defaultPollingInterval;
  v4->_prefsStyle = PCSettingsGetStyle(v4->_connectionClass, (const __CFString *)v4->_serviceIdentifier);
  v4->_double defaultPollingInterval = (double)(int)PCSettingsGetPollInterval(v4->_connectionClass, (const __CFString *)v4->_serviceIdentifier);
  if (v4->_connectionClass == 1)
  {
    unsigned int ForceManualWhenRoamingForMCCAccount = PCSettingsGetForceManualWhenRoamingForMCCAccount((const __CFString *)v4->_serviceIdentifier);
    int GlobalMCCForceManualWhenRoaming = PCSettingsGetGlobalMCCForceManualWhenRoaming();
    int v10 = v4->_logObject;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = @"NO";
      if (ForceManualWhenRoamingForMCCAccount) {
        __int16 v12 = @"YES";
      }
      else {
        __int16 v12 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v44 = (__CFString *)v4;
      double v46 = *(double *)&v12;
      __int16 v45 = 2112;
      if (GlobalMCCForceManualWhenRoaming) {
        v11 = @"YES";
      }
      __int16 v47 = 2112;
      v48 = v11;
      _os_log_impl(&dword_1D340D000, v10, OS_LOG_TYPE_DEFAULT, "%@ Loading forceManualWhenRoaming: accountSetting %@  globalSetting %@", buf, 0x20u);
    }
    v4->_forceManualWhenRoaming = (ForceManualWhenRoamingForMCCAccount | GlobalMCCForceManualWhenRoaming) != 0;
  }
  else
  {
    v4->_forceManualWhenRoaming = 0;
  }
  v13 = [(PCConnectionManager *)v4 _stringForStyle:v4->_prefsStyle];
  __int16 v14 = v4->_logObject;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = v4->_defaultPollingInterval / 60.0;
    *(_DWORD *)buf = 138412546;
    uint64_t v44 = v13;
    __int16 v45 = 2048;
    double v46 = v15;
    _os_log_impl(&dword_1D340D000, v14, OS_LOG_TYPE_DEFAULT, "Loaded preferences. Style is %@ and default poll interval is %g minutes.", buf, 0x16u);
  }
  if (v4->_forceManualWhenRoaming)
  {
    uint64_t v16 = v4->_logObject;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D340D000, v16, OS_LOG_TYPE_DEFAULT, "Forcing manual when roaming.", buf, 2u);
    }
  }
  id v17 = +[PCCarrierBundleHelper helper];
  v18 = (void *)[v17 copyValueFromPushBundleForKey:@"PCForcedMinimumHBI" error:0];

  uint64_t v19 = [v18 integerValue];
  if (v18 && v19 >= 1)
  {
    double v20 = (double)v19;
    v21 = v4->_logObject;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v44 = *(__CFString **)&v20;
      _os_log_impl(&dword_1D340D000, v21, OS_LOG_TYPE_DEFAULT, "Carrier bundle override for minimum HBI set. Setting minimum keep alive interval to %g seconds.", buf, 0xCu);
    }
    [(PCConnectionManager *)v4 _setMinimumKeepAliveInterval:1 onInterface:v20];
  }

  uint64_t v22 = +[PCCarrierBundleHelper helper];
  v23 = (void *)[v22 copyValueFromPushBundleForKey:@"PCForcedMaximumHBI" error:0];

  uint64_t v24 = [v23 integerValue];
  if (v23 && v24 >= 1)
  {
    double v25 = (double)v24;
    uint64_t v26 = v4->_logObject;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v44 = *(__CFString **)&v25;
      _os_log_impl(&dword_1D340D000, v26, OS_LOG_TYPE_DEFAULT, "Carrier bundle override for maximum HBI set. Setting maximum keep alive interval to %g seconds.", buf, 0xCu);
    }
    [(PCConnectionManager *)v4 _setMaximumKeepAliveInterval:1 onInterface:v25];
  }

  v27 = +[PCCarrierBundleHelper helper];
  uint64_t v28 = (void *)[v27 copyValueFromPushBundleForKey:@"PCAllowMinimumIntervalFallback" error:0];

  uint64_t v29 = [v28 BOOLValue];
  if (v28)
  {
    uint64_t v30 = v29;
    v31 = v4->_logObject;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      char v32 = @"NO";
      if (v30) {
        char v32 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v44 = v32;
      _os_log_impl(&dword_1D340D000, v31, OS_LOG_TYPE_DEFAULT, "Operator bundle set PCAllowMinimumIntervalFallback to %@", buf, 0xCu);
    }
    [(PCConnectionManager *)v4 setOperatorMinimumIntervalFallbackAllowed:v30];
  }
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"PCForceDemoMaxHBI", @"com.apple.persistentconnection", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat && AppIntegerValue >= 1)
  {
    double v34 = (double)AppIntegerValue;
    v35 = v4->_logObject;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v44 = @"PCForceDemoMaxHBI";
      __int16 v45 = 2048;
      double v46 = v34;
      _os_log_impl(&dword_1D340D000, v35, OS_LOG_TYPE_DEFAULT, "%@ set. Setting maximum keep alive interval to %g seconds for demo mode.", buf, 0x16u);
    }
    [(PCConnectionManager *)v4 setMaximumKeepAliveInterval:v34];
  }
  CFIndex v36 = CFPreferencesGetAppIntegerValue(@"PCForceMinHBI", @"com.apple.persistentconnection", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat && v36 >= 1)
  {
    double v37 = (double)v36;
    v38 = v4->_logObject;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v44 = @"PCForceMinHBI";
      __int16 v45 = 2048;
      double v46 = v37;
      _os_log_impl(&dword_1D340D000, v38, OS_LOG_TYPE_DEFAULT, "%@ set. Setting minimum keep alive interval to %g seconds for demo mode.", buf, 0x16u);
    }
    [(PCConnectionManager *)v4 setMinimumKeepAliveInterval:v37];
  }
  [(PCConnectionManager *)v4 _adjustInterfaceAssertions];
  BOOL v39 = (!v4->_pollingIntervalOverrideSet || fabs(v4->_pollingIntervalOverride) >= 2.22044605e-16)
     && fabs(v4->_defaultPollingInterval) >= 2.22044605e-16;
  char v40 = [(PCConnectionManager *)v4 currentStyle] != 1 || v39;
  if (v40) {
    [(PCConnectionManager *)v4 _deregisterForDeviceConditionsNotifications];
  }
  else {
    [(PCConnectionManager *)v4 _registerForDeviceConditionsNotifications];
  }
  if (v4->_isRunning && v3)
  {
    if (v6 != [(PCConnectionManager *)v4 currentStyle])
    {
      [(PCConnectionManager *)v4 _clearTimers];
      uint64_t v41 = 5;
      goto LABEL_63;
    }
    if (v6 == 1
      && !v4->_isInReconnectMode
      && defaultPollingInterval != v4->_defaultPollingInterval
      && !v4->_pollingIntervalOverrideSet)
    {
      [(PCConnectionManager *)v4 _clearTimers];
      uint64_t v41 = 3;
LABEL_63:
      [(PCConnectionManager *)v4 _calloutWithEvent:v41 context:0];
    }
  }

  objc_sync_exit(v4);
}

- (void)_registerForDeviceConditionsNotifications
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_duetContextRegistration)
  {
    logObject = self->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      id duetContextRegistration = self->_duetContextRegistration;
      *(_DWORD *)buf = 138412547;
      uint64_t v24 = self;
      __int16 v25 = 2113;
      id v26 = duetContextRegistration;
      _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%@ is already registered for contextual change notifications, {Registration: %{private}@}", buf, 0x16u);
    }
  }
  int v5 = (void *)CUTWeakLinkClass();
  int v6 = (void *)CUTWeakLinkClass();
  uint64_t v7 = (void *)CUTWeakLinkClass();
  objc_super v8 = (void *)CUTWeakLinkClass();
  v9 = [v5 userContext];
  int v10 = [MEMORY[0x1E4F1CA48] array];
  if (v10)
  {
    v11 = [v6 keyPathForWiFiConnectionQuality];

    if (v11)
    {
      __int16 v12 = [v6 keyPathForWiFiConnectionQuality];
      CFArrayAppendValue(v10, v12);
    }
    v13 = [v6 keyPathForThermalPressureLevel];

    if (v13)
    {
      __int16 v14 = [v6 keyPathForThermalPressureLevel];
      CFArrayAppendValue(v10, v14);
    }
    double v15 = [v6 keyPathForPluginStatus];

    if (v15)
    {
      uint64_t v16 = [v6 keyPathForPluginStatus];
      CFArrayAppendValue(v10, v16);
    }
    id v17 = [v6 keyPathForEnergyBudgetRemainingStatus];

    if (v17)
    {
      v18 = [v6 keyPathForEnergyBudgetRemainingStatus];
      CFArrayAppendValue(v10, v18);
    }
  }
  uint64_t v19 = [v7 predicateForChangeAtKeyPaths:v10];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __64__PCConnectionManager__registerForDeviceConditionsNotifications__block_invoke;
  v22[3] = &unk_1E698DF40;
  v22[4] = self;
  double v20 = [v8 localNonWakingRegistrationWithIdentifier:@"com.apple.pc.automatictimer.goodconditions" contextualPredicate:v19 callback:v22];
  id v21 = self->_duetContextRegistration;
  self->_id duetContextRegistration = v20;

  [v9 registerCallback:self->_duetContextRegistration];
  [(PCConnectionManager *)self _handleDeviceConditionChangeCallback];
}

uint64_t __64__PCConnectionManager__registerForDeviceConditionsNotifications__block_invoke(uint64_t a1)
{
  return 1;
}

- (void)_deregisterForDeviceConditionsNotifications
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_duetContextRegistration)
  {
    logObject = self->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      id duetContextRegistration = self->_duetContextRegistration;
      int v8 = 138412547;
      v9 = self;
      __int16 v10 = 2113;
      id v11 = duetContextRegistration;
      _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%@ request to deregister contextual change notifications {Registration: %{private}@}", (uint8_t *)&v8, 0x16u);
    }
    int v5 = (void *)CUTWeakLinkClass();
    CUTWeakLinkClass();
    int v6 = [v5 userContext];
    if (objc_opt_isKindOfClass()) {
      [v6 deregisterCallback:self->_duetContextRegistration];
    }
    id v7 = self->_duetContextRegistration;
    self->_id duetContextRegistration = 0;
  }
}

- (void)_handleDeviceConditionChangeCallback
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)CUTWeakLinkClass();
  id v4 = (void *)CUTWeakLinkClass();
  int v5 = [v3 userContext];
  int v6 = [v4 keyPathForThermalPressureLevel];
  id v7 = [v5 objectForKeyedSubscript:v6];
  LOBYTE(v3) = [v7 BOOLValue];

  int v8 = [v4 keyPathForWiFiConnectionQuality];
  v9 = [v5 objectForKeyedSubscript:v8];
  uint64_t v10 = [v9 integerValue];

  id v11 = [v4 keyPathForPluginStatus];
  uint64_t v12 = [v5 objectForKeyedSubscript:v11];
  unsigned __int8 v13 = [v12 BOOLValue];

  BOOL v14 = (v10 > 49) & ~(_BYTE)v3 & v13;
  if (self->_deviceUnderGoodCondition != v14)
  {
    self->_deviceUnderGoodCondition = v14;
    logObject = self->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_deviceUnderGoodCondition) {
        uint64_t v16 = @"YES";
      }
      else {
        uint64_t v16 = @"NO";
      }
      id v17 = logObject;
      v18 = [v4 keyPathForThermalPressureLevel];
      uint64_t v19 = [v5 objectForKeyedSubscript:v18];
      double v20 = [v4 keyPathForWiFiConnectionQuality];
      id v21 = [v5 objectForKeyedSubscript:v20];
      uint64_t v22 = [v4 keyPathForPluginStatus];
      v23 = [v5 objectForKeyedSubscript:v22];
      int v24 = 138413314;
      __int16 v25 = self;
      __int16 v26 = 2114;
      uint64_t v27 = v16;
      __int16 v28 = 2114;
      uint64_t v29 = v19;
      __int16 v30 = 2114;
      v31 = v21;
      __int16 v32 = 2114;
      char v33 = v23;
      _os_log_impl(&dword_1D340D000, v17, OS_LOG_TYPE_DEFAULT, "%@ Query duet context for device condition, {GoodCondition:%{public}@, thermalPressureLevel:%{public}@, wifiConnectionQuality:%{public}@, pluggedIn:%{public}@}", (uint8_t *)&v24, 0x34u);
    }
    [(PCConnectionManager *)self _processDeviceConditionChanges];
  }
}

- (void)_processDeviceConditionChanges
{
  obj = self;
  objc_sync_enter(obj);
  int v2 = [(PCConnectionManager *)obj currentStyle];
  BOOL v3 = (!obj->_pollingIntervalOverrideSet || fabs(obj->_pollingIntervalOverride) >= 2.22044605e-16)
    && fabs(obj->_defaultPollingInterval) >= 2.22044605e-16;
  if (v2 == 1 && !v3)
  {
    if (!obj->_deviceUnderGoodCondition) {
      [(PCConnectionManager *)obj _calloutWithEvent:6 context:0];
    }
    if (obj->_isRunning)
    {
      if (obj->_deviceUnderGoodCondition) {
        [(PCConnectionManager *)obj _setupTimerForPollForAdjustment:0];
      }
      else {
        [(PCConnectionManager *)obj _pauseTimers];
      }
    }
  }
  objc_sync_exit(obj);
}

- (int)currentStyle
{
  int v2 = self;
  objc_sync_enter(v2);
  if (v2->_forceManualWhenRoaming
    && ([(PCConnectionManager *)v2 persistentInterfaceManager],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 isWWANInHomeCountry],
        v3,
        (v4 & 1) == 0))
  {
    int v7 = 2;
  }
  else
  {
    int prefsStyle = v2->_prefsStyle;
    if (v2->_onlyAllowedStyleSet && (int onlyAllowedStyle = v2->_onlyAllowedStyle, prefsStyle != onlyAllowedStyle))
    {
      int v7 = 2;
      if (!prefsStyle && onlyAllowedStyle == 1)
      {
        [(PCConnectionManager *)v2 pollingInterval];
        if (v10 > -2.22044605e-16)
        {
          int v7 = 1;
          goto LABEL_15;
        }
      }
    }
    else
    {
      int v7 = v2->_prefsStyle;
    }
    if (v2->_pollingIntervalOverrideSet && v7 == 2)
    {
      if (v2->_pollingIntervalOverride > -2.22044605e-16) {
        int v7 = 1;
      }
      else {
        int v7 = 2;
      }
    }
  }
LABEL_15:
  objc_sync_exit(v2);

  return v7;
}

- (void)setOnlyAllowedStyle:(int)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_int onlyAllowedStyle = a3;
  obj->_onlyAllowedStyleSet = 1;
  [(PCConnectionManager *)obj _adjustInterfaceAssertions];
  objc_sync_exit(obj);
}

- (id)_growthAlgorithmOnInterface:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    int v5 = self->_wifiGrowthAlgorithm[self->_currentAddressFamily];
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    int v5 = self->_wwanGrowthAlgorithm[self->_currentAddressFamily];
LABEL_5:
    int v6 = v5;
    goto LABEL_9;
  }
  logObject = self->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    double v10 = self;
    __int16 v11 = 2048;
    int64_t v12 = a3;
    _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%@ Asked to get growth algorithm with invalid interface %ld", (uint8_t *)&v9, 0x16u);
  }
  int v6 = 0;
LABEL_9:
  return v6;
}

- (id)_currentGrowthAlgorithm
{
  int64_t interfaceIdentifier = self->_interfaceIdentifier;
  if (!interfaceIdentifier)
  {
    char v4 = self->_wifiGrowthAlgorithm[self->_currentAddressFamily];
    goto LABEL_5;
  }
  if (interfaceIdentifier == 1)
  {
    char v4 = self->_wwanGrowthAlgorithm[self->_currentAddressFamily];
LABEL_5:
    int v5 = v4;
    goto LABEL_9;
  }
  int v6 = [(PCConnectionManager *)self persistentInterfaceManager];
  int v7 = [v6 isWWANInterfaceUp];
  uint64_t v8 = 112;
  if (v7) {
    uint64_t v8 = 96;
  }
  int v5 = (PCGrowthAlgorithm *)objc_retain(*(id *)((char *)&self->super.isa
                                              + 8 * self->_currentAddressFamily
                                              + v8));

LABEL_9:
  return v5;
}

- (int)currentGrowthStage
{
  int v2 = [(PCConnectionManager *)self _currentGrowthAlgorithm];
  int v3 = [v2 growthStage];

  return v3;
}

- (void)startManager
{
  obj = self;
  objc_sync_enter(obj);
  if ([(PCConnectionManager *)obj currentStyle]) {
    uint64_t v2 = 4;
  }
  else {
    uint64_t v2 = 2;
  }
  [(PCConnectionManager *)obj resumeManagerWithAction:v2];
  objc_sync_exit(obj);
}

- (void)resumeManagerWithAction:(int)a3
{
}

- (void)resumeManagerWithAction:(int)a3 forceGrow:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  int v6 = self;
  objc_sync_enter(v6);
  [(PCConnectionManager *)v6 _clearTimers];
  [(PCConnectionManager *)v6 _validateActionForCurrentStyle:v5];
  *(_WORD *)&v6->_hasStarted = 257;
  v6->_lastResumeTime = CFAbsoluteTimeGetCurrent();
  v6->_lastElapsedInterval = 0.0;
  int v7 = [(PCConnectionManager *)v6 currentStyle];
  [(PCConnectionManager *)v6 _resolveStateWithAction:v5];
  if (!v6->_isInReconnectMode)
  {
    if (v7)
    {
      if (v7 != 1)
      {
        if (v7 != 2) {
          goto LABEL_62;
        }
        double v10 = v6->_logObject;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v12 = [(PCConnectionManager *)v6 _stringForAction:v5];
          *(_DWORD *)buf = 138412290;
          v63 = v12;
          _os_log_impl(&dword_1D340D000, v10, OS_LOG_TYPE_DEFAULT, "Resuming manual keep alive timer in normal mode with action %@", buf, 0xCu);
        }
        goto LABEL_16;
      }
      double v20 = v6->_logObject;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [(PCConnectionManager *)v6 _stringForAction:v5];
        *(_DWORD *)buf = 138412290;
        v63 = v21;
        _os_log_impl(&dword_1D340D000, v20, OS_LOG_TYPE_DEFAULT, "Resuming poll keep alive timer in normal mode with action %@", buf, 0xCu);
      }
      [(PCConnectionManager *)v6 _setupTimerForPollForAdjustment:0];
      goto LABEL_62;
    }
    uint64_t v16 = v6->_logObject;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [(PCConnectionManager *)v6 _stringForAction:v5];
      *(_DWORD *)buf = 138412290;
      v63 = v17;
      _os_log_impl(&dword_1D340D000, v16, OS_LOG_TYPE_DEFAULT, "Resuming push keep alive timer in normal mode with action %@", buf, 0xCu);
    }
    double onTimeKeepAliveTime = v6->_onTimeKeepAliveTime;
    if (v6->_keepAliveGracePeriod <= 2.22044605e-16)
    {
      double v19 = onTimeKeepAliveTime + PCScheduledWakeRTCPrecision() * -2.0;
      double onTimeKeepAliveTime = v6->_onTimeKeepAliveTime;
    }
    else
    {
      double v19 = onTimeKeepAliveTime + -5.0;
    }
    BOOL v22 = onTimeKeepAliveTime == 0.0 || v6->_lastStopTime < v19;
    v23 = v6->_logObject;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v59 = v22;
      if (v22) {
        int v24 = "early";
      }
      else {
        int v24 = "on time";
      }
      __int16 v25 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v6->_lastStopTime];
      PCStringFromDate(v25);
      double v26 = COERCE_DOUBLE((id)objc_claimAutoreleasedReturnValue());
      uint64_t v27 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v6->_onTimeKeepAliveTime];
      PCStringFromDate(v27);
      *(double *)&uint64_t v28 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      uint64_t v29 = (void *)v28;
      __int16 v30 = @"NO";
      *(_DWORD *)buf = 136315906;
      v63 = (void *)v24;
      __int16 v64 = 2112;
      if (onTimeKeepAliveTime == 0.0) {
        __int16 v30 = @"YES";
      }
      double v65 = v26;
      __int16 v66 = 2112;
      double v67 = *(double *)&v28;
      __int16 v68 = 2112;
      id v69 = v30;
      _os_log_impl(&dword_1D340D000, v23, OS_LOG_TYPE_DEFAULT, "Last timer interruption was %s: [%@]. Expected fire time was [%@]. {lastKeepAliveWasUntracked: %@}", buf, 0x2Au);

      BOOL v22 = v59;
    }

    v31 = [(PCConnectionManager *)v6 _currentGrowthAlgorithm];
    __int16 v32 = v31;
    if (!v5)
    {
      BOOL v33 = !v4;
      if (onTimeKeepAliveTime != 0.0) {
        BOOL v33 = 0;
      }
      if (v33 || !v22)
      {
        if (!v33)
        {
LABEL_58:
          [(PCGrowthAlgorithm *)v32 currentKeepAliveInterval];
          -[PCGrowthAlgorithm setLastSuccessfulKeepAliveInterval:](v32, "setLastSuccessfulKeepAliveInterval:");
          uint64_t v5 = 0;
          goto LABEL_59;
        }
      }
      else
      {
        double v34 = v6->_onTimeKeepAliveTime;
        [(PCGrowthAlgorithm *)v31 currentKeepAliveInterval];
        double v36 = v34 - v35;
        double lastStopTime = v6->_lastStopTime;
        lastScheduledGrowthAlgorithm = v6->_lastScheduledGrowthAlgorithm;
        logObject = v6->_logObject;
        if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
        {
          double v40 = v6->_onTimeKeepAliveTime;
          *(double *)&uint64_t v41 = COERCE_DOUBLE(@"NO");
          double v42 = v6->_lastStopTime;
          if (lastScheduledGrowthAlgorithm == v32) {
            *(double *)&uint64_t v41 = COERCE_DOUBLE(@"YES");
          }
          *(_DWORD *)buf = 138413314;
          v63 = v6;
          __int16 v64 = 2112;
          double v65 = *(double *)&v41;
          __int16 v66 = 2048;
          double v67 = v36;
          __int16 v68 = 2048;
          id v69 = *(__CFString **)&v40;
          __int16 v70 = 2048;
          double v71 = v42;
          _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%@: lastKeepAliveWasEarly - Examining sameAlgorithm %@ timeKeepAliveWasScheduled %f, onTimeKeepAliveTime: %f, lastStopTime %f", buf, 0x34u);
        }
        if (lastScheduledGrowthAlgorithm == v32)
        {
          double v43 = lastStopTime - v36;
          if ([(PCGrowthAlgorithm *)v32 useIntervalIfImprovement:v43])
          {
            uint64_t v44 = v6->_logObject;
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v63 = v6;
              __int16 v64 = 2048;
              double v65 = v43;
              _os_log_impl(&dword_1D340D000, v44, OS_LOG_TYPE_DEFAULT, "%@: This grow action is early but we're past the interval our previous growth was based on. Regrowing based on this interval %f.", buf, 0x16u);
            }
            goto LABEL_58;
          }
        }
        __int16 v45 = v6->_logObject;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(double *)&uint64_t v46 = [(PCConnectionManager *)v6 _stringForAction:0];
          __int16 v47 = (void *)v46;
          *(double *)&v48 = COERCE_DOUBLE("NO");
          *(_DWORD *)buf = 138412802;
          v63 = v6;
          if (v4) {
            *(double *)&v48 = COERCE_DOUBLE("YES");
          }
          __int16 v64 = 2080;
          double v65 = *(double *)&v48;
          __int16 v66 = 2112;
          double v67 = *(double *)&v46;
          _os_log_impl(&dword_1D340D000, v45, OS_LOG_TYPE_DEFAULT, "%@ Last keep alive was early {forceGrow: %s, action: %@}", buf, 0x20u);
        }
        if (v4) {
          goto LABEL_58;
        }
      }
      uint64_t v5 = 2;
    }
LABEL_59:
    v6->_lastProcessedAction = v5;
    [(PCGrowthAlgorithm *)v32 processNextAction:v5];
    [(PCConnectionManager *)v6 currentKeepAliveInterval];
    -[PCConnectionManager _setupTimerForPushWithKeepAliveInterval:](v6, "_setupTimerForPushWithKeepAliveInterval:");
    if (v32 == v6->_wwanGrowthAlgorithm[v6->_currentAddressFamily]) {
      [(PCConnectionManager *)v6 _saveWWANKeepAliveInterval];
    }

    goto LABEL_62;
  }
  uint64_t v8 = [(PCConnectionManager *)v6 persistentInterfaceManager];
  int v9 = [v8 areAllNetworkInterfacesDisabled];

  if (v9)
  {
    double v10 = v6->_logObject;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = [(PCConnectionManager *)v6 _stringForAction:v5];
      *(_DWORD *)buf = 138412290;
      v63 = v11;
      _os_log_impl(&dword_1D340D000, v10, OS_LOG_TYPE_DEFAULT, "Choosing not to resume keep alive in reconnect mode since all interfaces are disabled. Action %@", buf, 0xCu);
    }
LABEL_16:

    goto LABEL_62;
  }
  if (!v6->_powerOptimizationsForExpensiveNetworkingDisabled
    && +[PCInterfaceMonitor isNetworkingPowerExpensiveToUse])
  {
    double v10 = v6->_logObject;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(PCConnectionManager *)v6 _stringForAction:v5];
      *(_DWORD *)buf = 138412290;
      v63 = v13;
      _os_log_impl(&dword_1D340D000, v10, OS_LOG_TYPE_DEFAULT, "Choosing not to resume keep alive in reconnect mode since interface is networking power expensive to use. Action %@", buf, 0xCu);
    }
    goto LABEL_16;
  }
  BOOL v14 = v6->_logObject;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = [(PCConnectionManager *)v6 _stringForAction:v5];
    *(_DWORD *)buf = 138412290;
    v63 = v15;
    _os_log_impl(&dword_1D340D000, v14, OS_LOG_TYPE_DEFAULT, "Resuming keep alive in reconnect mode with action %@", buf, 0xCu);
  }
  [(PCConnectionManager *)v6 _setupKeepAliveForReconnect];
  v6->_lastReconnectTime = CFAbsoluteTimeGetCurrent();
LABEL_62:
  [(PCConnectionManager *)v6 _adjustInterfaceAssertions];
  if (!v7)
  {
    uint64_t v49 = v6->_logObject;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      serviceIdentifier = v6->_serviceIdentifier;
      v51 = [MEMORY[0x1E4F1C9C8] date];
      PCStringFromDate(v51);
      double v52 = COERCE_DOUBLE((id)objc_claimAutoreleasedReturnValue());
      [(PCConnectionManager *)v6 currentKeepAliveInterval];
      *(_DWORD *)buf = 138412802;
      v63 = serviceIdentifier;
      __int16 v64 = 2112;
      double v65 = v52;
      __int16 v66 = 1024;
      LODWORD(v67) = (int)v53;
      _os_log_impl(&dword_1D340D000, v49, OS_LOG_TYPE_INFO, "logKeepAlive {identifier: %@, currentDate: %@, keepAliveInterval: %i}", buf, 0x1Cu);
    }
    if (resumeManagerWithAction_forceGrow___pred_PLLogRegisteredEventPowerLog != -1) {
      dispatch_once(&resumeManagerWithAction_forceGrow___pred_PLLogRegisteredEventPowerLog, &__block_literal_global_1);
    }
    v60[0] = @"KeepAliveInterval";
    v54 = NSNumber;
    [(PCConnectionManager *)v6 currentKeepAliveInterval];
    uint64_t v55 = objc_msgSend(v54, "numberWithDouble:");
    v61[0] = v55;
    v60[1] = @"ServiceIdentifier";
    v56 = [NSString stringWithFormat:@"%@", v6->_serviceIdentifier];
    v61[1] = v56;
    v60[2] = @"IsInReconnectMode";
    v57 = [NSNumber numberWithBool:v6->_isInReconnectMode];
    v61[2] = v57;
    v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:3];

    if (resumeManagerWithAction_forceGrow___PLLogRegisteredEvent) {
      resumeManagerWithAction_forceGrow___PLLogRegisteredEvent(3, @"PC APSD Resume PCConnectionManager", v58, 0);
    }
  }
  objc_sync_exit(v6);
}

uint64_t (*__57__PCConnectionManager_resumeManagerWithAction_forceGrow___block_invoke())(void, void, void, void)
{
  uint64_t result = (uint64_t (*)(void, void, void, void))CUTWeakLinkSymbol();
  resumeManagerWithAction_forceGrow___PLLogRegisteredEvent = result;
  return result;
}

- (void)_validateActionForCurrentStyle:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 < 7)
  {
    int v6 = [(PCConnectionManager *)self currentStyle];
    if ((v6 - 1) >= 2)
    {
      if (!v6 && v3 == 4)
      {
        BOOL v14 = NSString;
        double v15 = [(PCConnectionManager *)self _stringForAction:4];
        uint64_t v5 = [v14 stringWithFormat:@"Action %@ not appropriate for push style.", v15];

        if (v5) {
          goto LABEL_18;
        }
      }
    }
    else if (v3 <= 3)
    {
      int v7 = NSString;
      uint64_t v8 = [(PCConnectionManager *)self _stringForAction:v3];
      int v9 = [(PCConnectionManager *)self _stringForStyle:[(PCConnectionManager *)self currentStyle]];
      double v10 = [(PCConnectionManager *)self _stringForStyle:self->_prefsStyle];
      __int16 v11 = self->_forceManualWhenRoaming ? @"YES" : @"NO";
      int64_t v12 = self->_onlyAllowedStyleSet ? @"YES" : @"NO";
      uint64_t v13 = [(PCConnectionManager *)self _stringForStyle:self->_onlyAllowedStyle];
      uint64_t v5 = [v7 stringWithFormat:@"Action %@ not appropriate for %@. PrefsStyle=%@. _forceManualWhenRoaming = %@  onlyAllowedStyleSet=%@ onlyAllowedStyle=%@", v8, v9, v10, v11, v12, v13];

      if (v5)
      {
LABEL_18:
        logObject = self->_logObject;
        if (os_log_type_enabled(logObject, OS_LOG_TYPE_ERROR)) {
          -[PCConnectionManager _validateActionForCurrentStyle:](v5, logObject);
        }
        id v17 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v5 userInfo:0];
        objc_exception_throw(v17);
      }
    }
  }
  else
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid action type: %i", *(void *)&a3);
    if (v5) {
      goto LABEL_18;
    }
  }
}

- (void)_resolveStateWithAction:(int)a3
{
  if (a3 >= 5)
  {
    if ((a3 - 5) <= 1)
    {
      if (self->_isInReconnectMode) {
        unsigned int v3 = self->_reconnectIteration + 1;
      }
      else {
        unsigned int v3 = 1;
      }
      self->_isInReconnectMode = 1;
      self->_reconnectIteration = v3;
      self->_reconnectWithKeepAliveDelay = a3 == 6;
    }
  }
  else
  {
    self->_isInReconnectMode = 0;
  }
}

- (void)stopManager
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  logObject = v2->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "PCConnectionManager was stopped by client", v4, 2u);
  }
  [(PCConnectionManager *)v2 _clearTimers];
  objc_sync_exit(v2);
}

- (void)stopAndResetManager
{
  obj = self;
  objc_sync_enter(obj);
  [(PCConnectionManager *)obj stopManager];
  obj->_isInReconnectMode = 0;
  obj->_reconnectIteration = 0;
  objc_sync_exit(obj);
}

- (BOOL)isRunning
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL isRunning = v2->_isRunning;
  objc_sync_exit(v2);

  return isRunning;
}

- (unint64_t)countOfGrowthActions
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = [(PCConnectionManager *)v2 _currentGrowthAlgorithm];
  unint64_t v4 = [v3 countOfGrowthActions];

  objc_sync_exit(v2);
  return v4;
}

- (PCKeepAliveState)currentKeepAliveState
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = [(PCConnectionManager *)v2 _currentGrowthAlgorithm];
  unsigned __int8 v4 = [v3 growthStage];

  uint64_t v5 = [(PCConnectionManager *)v2 _currentGrowthAlgorithm];
  LOBYTE(v3) = [v5 previousAction];

  int v6 = [[PCKeepAliveState alloc] initWithKeepAliveState:v4 subState:v3];
  objc_sync_exit(v2);

  return v6;
}

- (double)currentKeepAliveInterval
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = [(PCConnectionManager *)v2 _currentGrowthAlgorithm];
  [v3 currentKeepAliveInterval];
  double v5 = v4;

  objc_sync_exit(v2);
  return v5;
}

- (double)minimumKeepAliveInterval
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = [(PCConnectionManager *)v2 _currentGrowthAlgorithm];
  [v3 minimumKeepAliveInterval];
  double v5 = v4;

  objc_sync_exit(v2);
  return v5;
}

- (void)setMinimumKeepAliveInterval:(double)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v4 = self;
  objc_sync_enter(v4);
  logObject = v4->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    double v10 = a3;
    _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "Setting minimum keep alive interval to %g", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v6 = 0;
  char v7 = 1;
  do
  {
    char v8 = v7;
    [(PCGrowthAlgorithm *)v4->_wwanGrowthAlgorithm[v6] setMinimumKeepAliveInterval:a3];
    [(PCGrowthAlgorithm *)v4->_wifiGrowthAlgorithm[v6] setMinimumKeepAliveInterval:a3];
    char v7 = 0;
    uint64_t v6 = 1;
  }
  while ((v8 & 1) != 0);
  objc_sync_exit(v4);
}

- (void)_setMinimumKeepAliveInterval:(double)a3 onInterface:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = self;
  objc_sync_enter(v6);
  char v7 = v6->_logObject;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    char v8 = [(PCConnectionManager *)v6 _growthAlgorithmOnInterface:a4];
    int v10 = 138412802;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2048;
    double v15 = a3;
    _os_log_impl(&dword_1D340D000, v7, OS_LOG_TYPE_DEFAULT, "%@ Setting minimum keep alive interval for %@ to %g", (uint8_t *)&v10, 0x20u);
  }
  int v9 = [(PCConnectionManager *)v6 _growthAlgorithmOnInterface:a4];
  [v9 setMinimumKeepAliveInterval:a3];

  objc_sync_exit(v6);
}

- (double)maximumKeepAliveInterval
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = [(PCConnectionManager *)v2 _currentGrowthAlgorithm];
  [v3 maximumKeepAliveInterval];
  double v5 = v4;

  objc_sync_exit(v2);
  return v5;
}

- (void)setMaximumKeepAliveInterval:(double)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v4 = self;
  objc_sync_enter(v4);
  logObject = v4->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    double v10 = a3;
    _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "Setting maximum keep alive interval to %g", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v6 = 0;
  char v7 = 1;
  do
  {
    char v8 = v7;
    [(PCGrowthAlgorithm *)v4->_wwanGrowthAlgorithm[v6] setMaximumKeepAliveInterval:a3];
    [(PCGrowthAlgorithm *)v4->_wifiGrowthAlgorithm[v6] setMaximumKeepAliveInterval:a3];
    char v7 = 0;
    uint64_t v6 = 1;
  }
  while ((v8 & 1) != 0);
  objc_sync_exit(v4);
}

- (void)_setMaximumKeepAliveInterval:(double)a3 onInterface:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = self;
  objc_sync_enter(v6);
  logObject = v6->_logObject;
  BOOL v8 = os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT);
  if (a4 < 2)
  {
    if (v8)
    {
      int v14 = 138412802;
      double v15 = v6;
      __int16 v16 = 2048;
      int64_t v17 = a4;
      __int16 v18 = 2048;
      double v19 = a3;
      _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%@ Setting maximum keep alive interval for %lu to %g", (uint8_t *)&v14, 0x20u);
    }
    uint64_t v9 = 0;
    uint64_t v10 = 112;
    if (a4 == 1) {
      uint64_t v10 = 96;
    }
    uint64_t v11 = (char *)v6 + v10;
    char v12 = 1;
    do
    {
      char v13 = v12;
      [*(id *)&v11[8 * v9] setMaximumKeepAliveInterval:a3];
      char v12 = 0;
      uint64_t v9 = 1;
    }
    while ((v13 & 1) != 0);
  }
  else if (v8)
  {
    int v14 = 138412546;
    double v15 = v6;
    __int16 v16 = 2048;
    int64_t v17 = a4;
    _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%@ Asked to set maximum keep alive interval on invalid interface %ld", (uint8_t *)&v14, 0x16u);
  }
  objc_sync_exit(v6);
}

- (double)serverStatsMaxKeepAliveInterval
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = [(PCConnectionManager *)v2 _growthAlgorithmOnInterface:1];
  [v3 serverStatsMaxKeepAliveInterval];
  double v5 = v4;

  objc_sync_exit(v2);
  return v5;
}

- (double)serverStatsMinKeepAliveInterval
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = [(PCConnectionManager *)v2 _growthAlgorithmOnInterface:1];
  [v3 serverStatsMinKeepAliveInterval];
  double v5 = v4;

  objc_sync_exit(v2);
  return v5;
}

- (double)serverStatsExpectedKeepAliveInterval
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = [(PCConnectionManager *)v2 _growthAlgorithmOnInterface:1];
  [v3 serverStatsExpectedKeepAliveInterval];
  double v5 = v4;

  objc_sync_exit(v2);
  return v5;
}

- (BOOL)usingServerStatsAggressively
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = [(PCConnectionManager *)v2 _growthAlgorithmOnInterface:1];
  char v4 = [v3 usingServerStatsAggressively];

  objc_sync_exit(v2);
  return v4;
}

- (void)setServerStatsMaxKeepAliveInterval:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v4 = self;
  objc_sync_enter(v4);
  double v5 = v4->_logObject;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(PCConnectionManager *)v4 _growthAlgorithmOnInterface:1];
    int v8 = 138412802;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    double v13 = a3;
    _os_log_impl(&dword_1D340D000, v5, OS_LOG_TYPE_DEFAULT, "%@ Setting server stats max keep alive interval for %@ to %g", (uint8_t *)&v8, 0x20u);
  }
  char v7 = [(PCConnectionManager *)v4 _growthAlgorithmOnInterface:1];
  [v7 setServerStatsMaxKeepAliveInterval:a3];

  objc_sync_exit(v4);
}

- (void)setServerStatsMinKeepAliveInterval:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v4 = self;
  objc_sync_enter(v4);
  double v5 = v4->_logObject;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(PCConnectionManager *)v4 _growthAlgorithmOnInterface:1];
    int v8 = 138412802;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    double v13 = a3;
    _os_log_impl(&dword_1D340D000, v5, OS_LOG_TYPE_DEFAULT, "%@ Setting server stats min keep alive interval for %@ to %g", (uint8_t *)&v8, 0x20u);
  }
  char v7 = [(PCConnectionManager *)v4 _growthAlgorithmOnInterface:1];
  [v7 setServerStatsMinKeepAliveInterval:a3];

  objc_sync_exit(v4);
}

- (void)setServerStatsExpectedKeepAliveInterval:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v4 = self;
  objc_sync_enter(v4);
  double v5 = v4->_logObject;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(PCConnectionManager *)v4 _growthAlgorithmOnInterface:1];
    int v8 = 138412802;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    double v13 = a3;
    _os_log_impl(&dword_1D340D000, v5, OS_LOG_TYPE_DEFAULT, "%@ Setting server stats expected keep alive interval for %@ to %g", (uint8_t *)&v8, 0x20u);
  }
  char v7 = [(PCConnectionManager *)v4 _growthAlgorithmOnInterface:1];
  [v7 setServerStatsExpectedKeepAliveInterval:a3];

  objc_sync_exit(v4);
}

- (void)setKeepAliveGracePeriod:(double)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v4 = self;
  objc_sync_enter(v4);
  if (a3 > 2.22044605e-16)
  {
    double v5 = PCScheduledWakeRTCPrecision() * 2.0 + 5.0;
    if (a3 + 5.0 >= v5) {
      a3 = a3 + 5.0;
    }
    else {
      a3 = v5;
    }
  }
  logObject = v4->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    double v9 = a3;
    _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "Setting keep alive grace period to %g", (uint8_t *)&v8, 0xCu);
  }
  v4->_keepAliveGracePeriod = a3;
  char v7 = [(PCConnectionManager *)v4 _currentGrowthAlgorithm];
  [v7 setIsServerOriginatedKeepAlive:a3 > 2.22044605e-16];

  objc_sync_exit(v4);
}

- (void)setUsingServerStatsAggressively:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v4 = self;
  objc_sync_enter(v4);
  double v5 = v4->_logObject;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(PCConnectionManager *)v4 _growthAlgorithmOnInterface:1];
    char v7 = (void *)v6;
    int v8 = @"NO";
    int v10 = 138412802;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    if (v3) {
      int v8 = @"YES";
    }
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    double v15 = v8;
    _os_log_impl(&dword_1D340D000, v5, OS_LOG_TYPE_DEFAULT, "%@ Setting usingServerStatsAggressively for %@ to %@", (uint8_t *)&v10, 0x20u);
  }
  double v9 = [(PCConnectionManager *)v4 _growthAlgorithmOnInterface:1];
  [v9 setUsingServerStatsAggressively:v3];

  objc_sync_exit(v4);
}

- (void)setKeepAliveOverrideOnInterface:(int64_t)a3 interval:(double)a4 timeout:(double)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_interfaceIdentifier == a3)
  {
    double v9 = -[PCConnectionManager _growthAlgorithmOnInterface:](self, "_growthAlgorithmOnInterface:");
    [v9 minimumKeepAliveInterval];
    double v11 = v10;

    id v15 = 0;
    id v16 = 0;
    uint64_t v12 = 112;
    if (a3 == 1)
    {
      uint64_t v12 = 96;
      uint64_t v13 = 104;
    }
    else
    {
      uint64_t v13 = 120;
    }
    id v15 = *(id *)((char *)&self->super.isa + v12);
    id v16 = *(id *)((char *)&self->super.isa + v13);
    [v15 setMinimumKeepAliveInterval:a4];
    [v15 setMaximumKeepAliveInterval:v11];
    [v15 setLastSuccessfulKeepAliveInterval:a4];
    [v15 setMinimumIntervalFallbackStateTimeout:a5];
    [v15 setMinimumIntervalFallbackEnabled:1];
    [v16 setMinimumKeepAliveInterval:a4];
    [v16 setMaximumKeepAliveInterval:v11];
    [v16 setLastSuccessfulKeepAliveInterval:a4];
    [v16 setMinimumIntervalFallbackStateTimeout:a5];
    [v16 setMinimumIntervalFallbackEnabled:1];
    self->_minimumIntervalFallbackEnabled = 1;
    [(PCConnectionManager *)self resumeManagerWithAction:3 forceGrow:0];
    [(PCConnectionManager *)self resumeManagerWithAction:1 forceGrow:0];
    for (uint64_t i = 8; i != -8; i -= 8)
  }
}

- (void)setNonCellularEarlyFireConstantInterval:(double)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v4 = self;
  objc_sync_enter(v4);
  logObject = v4->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    double v7 = a3;
    _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "Setting NonCellular early fire constant interval to %g", (uint8_t *)&v6, 0xCu);
  }
  v4->_nonCellularEarlyFireConstantInterval = a3;
  objc_sync_exit(v4);
}

- (BOOL)_isPushConnected
{
  uint64_t state64 = 0;
  notify_get_state(self->_pushIsConnectedToken, &state64);
  return state64 != 0;
}

- (double)pollingInterval
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  double defaultPollingInterval = v2->_defaultPollingInterval;
  double pollingIntervalOverride = v2->_pollingIntervalOverride;
  if (fabs(pollingIntervalOverride) < 2.22044605e-16 && v2->_deviceUnderGoodCondition) {
    double pollingIntervalOverride = 3600.0;
  }
  if (fabs(defaultPollingInterval) < 2.22044605e-16 && v2->_deviceUnderGoodCondition) {
    double defaultPollingInterval = 3600.0;
  }
  if (!v2->_pollingIntervalOverrideSet)
  {
    if (defaultPollingInterval < 2.22044605e-16) {
      goto LABEL_13;
    }
    double v5 = +[PCInterfaceMonitor sharedInstanceForIdentifier:0];
    if ([v5 isInterfaceHistoricallyUsable])
    {
      int v6 = 1;
    }
    else
    {
      double v7 = +[PCInterfaceMonitor sharedInstanceForIdentifier:1];
      int v6 = [v7 isInterfaceHistoricallyUsable];
    }
    if ([(PCConnectionManager *)v2 _isPushConnected] & v6)
    {
LABEL_13:
      double pollingIntervalOverride = defaultPollingInterval;
    }
    else
    {
      uint64_t v8 = +[PCInterfaceMonitor sharedInstanceForIdentifier:0];
      if ([v8 isBadLinkQuality])
      {
        double v9 = +[PCInterfaceMonitor sharedInstanceForIdentifier:1];
        int v10 = [v9 isBadLinkQuality];

        if (v10) {
          double v11 = 3600.0;
        }
        else {
          double v11 = 1800.0;
        }
      }
      else
      {

        int v10 = 0;
        double v11 = 1800.0;
      }
      if (defaultPollingInterval >= v11) {
        double pollingIntervalOverride = defaultPollingInterval;
      }
      else {
        double pollingIntervalOverride = v11;
      }
      uint64_t v12 = v2->_logObject;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v13 = [(PCConnectionManager *)v2 _isPushConnected];
        __int16 v14 = @"NO";
        int v18 = 138413314;
        if (v13) {
          id v15 = @"YES";
        }
        else {
          id v15 = @"NO";
        }
        double v19 = v15;
        __int16 v20 = 2112;
        if (v6) {
          id v16 = @"YES";
        }
        else {
          id v16 = @"NO";
        }
        id v21 = v16;
        __int16 v22 = 2112;
        if (v10) {
          __int16 v14 = @"YES";
        }
        v23 = v14;
        __int16 v24 = 2048;
        double v25 = defaultPollingInterval;
        __int16 v26 = 2048;
        double v27 = v11;
        _os_log_impl(&dword_1D340D000, v12, OS_LOG_TYPE_DEFAULT, "Push is connected? %@  networkIsHistoricallyUsable? %@  isBadLQ? %@ -- choosing pollInterval = MAX(%g, %g)", (uint8_t *)&v18, 0x34u);
      }
    }
  }
  objc_sync_exit(v2);

  return pollingIntervalOverride;
}

- (void)setPollingIntervalOverride:(double)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v4 = self;
  objc_sync_enter(v4);
  if (!v4->_pollingIntervalOverrideSet || v4->_pollingIntervalOverride != a3)
  {
    logObject = v4->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      double v7 = a3;
      _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "Setting polling interval override to %g", (uint8_t *)&v6, 0xCu);
    }
    v4->_double pollingIntervalOverride = a3;
    v4->_pollingIntervalOverrideSet = 1;
  }
  objc_sync_exit(v4);
}

- (void)cancelPollingIntervalOverride
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2->_pollingIntervalOverrideSet)
  {
    logObject = v2->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v4 = 0;
      _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "Cacnceling polling interval override", v4, 2u);
    }
    v2->_pollingIntervalOverrideSet = 0;
  }
  objc_sync_exit(v2);
}

- (BOOL)shouldClientScheduleReconnectDueToFailure
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  double Current = CFAbsoluteTimeGetCurrent();
  double lastReachableTime = v2->_lastReachableTime;
  if (lastReachableTime == 0.0) {
    goto LABEL_29;
  }
  double v5 = Current - lastReachableTime;
  if (v5 < 0.0) {
    double v5 = -v5;
  }
  if (v5 >= 10.0)
  {
LABEL_29:
    if (v2->_isInReconnectMode)
    {
      logObject = v2->_logObject;
      if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "Advising client to enter reconnect mode in response to a connection failure since currently in reconnect mode", (uint8_t *)&v21, 2u);
      }
      LOBYTE(v6) = 1;
    }
    else
    {
      double lastResumeTime = v2->_lastResumeTime;
      if ([(PCConnectionManager *)v2 currentStyle])
      {
        [(PCConnectionManager *)v2 pollingInterval];
        double v12 = v11;
      }
      else
      {
        BOOL v13 = [(PCConnectionManager *)v2 _currentGrowthAlgorithm];
        [v13 minimumKeepAliveInterval];
        double v12 = v14;
      }
      double v15 = Current - lastResumeTime;
      double v16 = fabs(v12);
      BOOL v17 = v15 < v12 + v2->_keepAliveGracePeriod + 15.0;
      if (v15 <= 2.22044605e-16) {
        BOOL v17 = 0;
      }
      if (v16 < 2.22044605e-16) {
        BOOL v17 = 1;
      }
      LODWORD(v6) = !v2->_hasStarted || v17;
      int v18 = v2->_logObject;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        double v19 = "issue a shrink";
        if (v6) {
          double v19 = "enter reconnect mode";
        }
        int v21 = 136315394;
        __int16 v22 = v19;
        __int16 v23 = 2048;
        double v24 = v15;
        _os_log_impl(&dword_1D340D000, v18, OS_LOG_TYPE_DEFAULT, "Advising client to %s in response to a connection failure after elapsed time from start %g seconds", (uint8_t *)&v21, 0x16u);
      }
    }
  }
  else
  {
    int v6 = v2->_logObject;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v2->_lastReachableTime];
      PCStringFromDate(v7);
      uint64_t v8 = (char *)objc_claimAutoreleasedReturnValue();
      int v21 = 138412290;
      __int16 v22 = v8;
      _os_log_impl(&dword_1D340D000, v6, OS_LOG_TYPE_DEFAULT, "Advising client to not enter reconnect mode since the network just became reachable at %@", (uint8_t *)&v21, 0xCu);
    }
    LOBYTE(v6) = 0;
    v2->_double lastReachableTime = 0.0;
  }
  objc_sync_exit(v2);

  return (char)v6;
}

- (void)setEnableNonCellularConnections:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v4 = self;
  objc_sync_enter(v4);
  if (v4->_enableNonCellularConnections != v3)
  {
    logObject = v4->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = @"NO";
      if (v3) {
        int v6 = @"YES";
      }
      int v7 = 138412546;
      uint64_t v8 = v4;
      __int16 v9 = 2112;
      int v10 = v6;
      _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%@: enableNonCellularConnections changed to %@", (uint8_t *)&v7, 0x16u);
    }
    v4->_enableNonCellularConnections = v3;
    [(PCConnectionManager *)v4 _adjustInterfaceAssertions];
  }
  objc_sync_exit(v4);
}

- (BOOL)disableEarlyFire
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL disableEarlyFire = v2->_disableEarlyFire;
  objc_sync_exit(v2);

  return disableEarlyFire;
}

- (void)setDisableEarlyFire:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL disableEarlyFire = a3;
  objc_sync_exit(obj);
}

- (BOOL)minimumIntervalFallbackEnabled
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL minimumIntervalFallbackEnabled = v2->_minimumIntervalFallbackEnabled;
  objc_sync_exit(v2);

  return minimumIntervalFallbackEnabled;
}

- (void)setMinimumIntervalFallbackEnabled:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL minimumIntervalFallbackEnabled = a3;
  [(PCConnectionManager *)obj _adjustMinimumIntervalFallback];
  objc_sync_exit(obj);
}

- (BOOL)operatorMinimumIntervalFallbackAllowed
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL operatorMinimumIntervalFallbackAllowed = v2->_operatorMinimumIntervalFallbackAllowed;
  objc_sync_exit(v2);

  return operatorMinimumIntervalFallbackAllowed;
}

- (void)setOperatorMinimumIntervalFallbackAllowed:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL operatorMinimumIntervalFallbackAllowed = a3;
  [(PCConnectionManager *)obj _adjustMinimumIntervalFallback];
  objc_sync_exit(obj);
}

- (void)_adjustMinimumIntervalFallback
{
  BOOL v3 = self->_minimumIntervalFallbackEnabled && self->_operatorMinimumIntervalFallbackAllowed;
  int64_t interfaceIdentifier = self->_interfaceIdentifier;
  if (interfaceIdentifier == 1)
  {
    double v5 = [(PCConnectionManager *)self _currentGrowthAlgorithm];
    [v5 setMinimumIntervalFallbackEnabled:v3];

    int64_t interfaceIdentifier = self->_interfaceIdentifier;
  }
  if (!interfaceIdentifier)
  {
    id v6 = [(PCConnectionManager *)self _currentGrowthAlgorithm];
    [v6 setMinimumIntervalFallbackEnabled:self->_minimumIntervalFallbackEnabled];
  }
}

- (void)setCurrentAddressFamily:(int)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_currentAddressFamily = a3;
  objc_sync_exit(obj);
}

- (int)currentAddressFamily
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  int currentAddressFamily = v2->_currentAddressFamily;
  objc_sync_exit(v2);

  return currentAddressFamily;
}

- (void)_setupTimerForPushWithKeepAliveInterval:(double)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (*(_OWORD *)&self->_intervalTimer != 0 || self->_delayTimer)
  {
    double v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PCConnectionManager.m" lineNumber:1111 description:@"timers already exist"];
  }
  self->_double onTimeKeepAliveTime = CFAbsoluteTimeGetCurrent() + a3;
  id v6 = [(PCConnectionManager *)self _currentGrowthAlgorithm];
  lastScheduledGrowthAlgorithm = self->_lastScheduledGrowthAlgorithm;
  self->_lastScheduledGrowthAlgorithm = v6;

  uint64_t v8 = [[PCPersistentTimer alloc] initWithTimeInterval:self->_serviceIdentifier serviceIdentifier:self->_guidancePriority guidancePriority:self target:sel__intervalTimerFired selector:0 userInfo:self->_keepAliveGracePeriod + a3];
  intervalTimer = self->_intervalTimer;
  self->_intervalTimer = v8;

  if (self->_disableEarlyFire)
  {
    logObject = self->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      int v21 = self;
      _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%@ - early fire has been manually disabled for this timer!", (uint8_t *)&v20, 0xCu);
    }
    [(PCPersistentTimer *)self->_intervalTimer setMinimumEarlyFireProportion:1.0];
  }
  if (!self->_interfaceIdentifier && self->_nonCellularEarlyFireConstantInterval > 0.0)
  {
    uint64_t v11 = self->_logObject;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      double nonCellularEarlyFireConstantInterval = self->_nonCellularEarlyFireConstantInterval;
      int v20 = 138412546;
      int v21 = self;
      __int16 v22 = 2048;
      double v23 = nonCellularEarlyFireConstantInterval;
      _os_log_impl(&dword_1D340D000, v11, OS_LOG_TYPE_DEFAULT, "%@ - setting early fire constant interval to %f!", (uint8_t *)&v20, 0x16u);
    }
    [(PCPersistentTimer *)self->_intervalTimer setEarlyFireConstantInterval:self->_nonCellularEarlyFireConstantInterval];
  }
  BOOL v13 = [(PCConnectionManager *)self persistentInterfaceManager];
  if (([v13 doesWWANInterfaceExist] & 1) == 0 && (objc_msgSend(v13, "isWakeOnWiFiSupported") & 1) == 0)
  {
    [(PCConnectionManager *)self pollingInterval];
    if (v14 < 2.22044605e-16)
    {
      double v15 = self->_logObject;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1D340D000, v15, OS_LOG_TYPE_DEFAULT, "Trying to push no persistent interface exists and the poll interval is 'manual', so disabling waking to conserve power", (uint8_t *)&v20, 2u);
      }
      [(PCPersistentTimer *)self->_intervalTimer setDisableSystemWaking:1];
    }
  }
  [(PCPersistentTimer *)self->_intervalTimer fireTime];
  self->_lastScheduledIntervalTime = v16;
  BOOL v17 = self->_intervalTimer;
  int v18 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [(PCPersistentTimer *)v17 scheduleInRunLoop:v18];
}

- (void)_adjustPollTimerIfNecessary
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int v3 = [(PCConnectionManager *)self currentStyle];
  BOOL v4 = [(PCPersistentTimer *)self->_intervalTimer firingIsImminent];
  BOOL v5 = v4;
  if (v3 == 1 && self->_isRunning && !self->_isInReconnectMode)
  {
    if (self->_intervalTimer) {
      int v6 = !v4;
    }
    else {
      int v6 = 0;
    }
  }
  else
  {
    int v6 = 0;
  }
  logObject = self->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"NO";
    BOOL isInReconnectMode = self->_isInReconnectMode;
    if (v3 == 1) {
      int v10 = @"YES";
    }
    else {
      int v10 = @"NO";
    }
    intervalTimer = self->_intervalTimer;
    if (self->_isRunning) {
      double v12 = @"YES";
    }
    else {
      double v12 = @"NO";
    }
    int v16 = 138413826;
    if (isInReconnectMode) {
      BOOL v13 = @"YES";
    }
    else {
      BOOL v13 = @"NO";
    }
    BOOL v17 = self;
    if (v5) {
      double v14 = @"YES";
    }
    else {
      double v14 = @"NO";
    }
    double v19 = v10;
    __int16 v18 = 2112;
    if (v6) {
      uint64_t v8 = @"YES";
    }
    __int16 v20 = 2112;
    int v21 = v12;
    __int16 v22 = 2112;
    double v23 = v13;
    __int16 v24 = 2112;
    uint64_t v25 = intervalTimer;
    __int16 v26 = 2112;
    double v27 = v14;
    __int16 v28 = 2112;
    uint64_t v29 = v8;
    _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%@ _adjustPollTimerIfNecessary  rightStyle %@  isRunning %@  isInReconnectMode %@   intervalTimer %@  firingIsImminent %@ - should Adjust? %@", (uint8_t *)&v16, 0x48u);
  }
  if (v6)
  {
    [(PCPersistentTimer *)self->_intervalTimer invalidate];
    double v15 = self->_intervalTimer;
    self->_intervalTimer = 0;

    [(PCConnectionManager *)self _setupTimerForPollForAdjustment:1];
  }
}

- (void)_setupTimerForPollForAdjustment:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  if (*(_OWORD *)&self->_intervalTimer != 0 || self->_delayTimer)
  {
    v77 = [MEMORY[0x1E4F28B00] currentHandler];
    [v77 handleFailureInMethod:a2 object:self file:@"PCConnectionManager.m" lineNumber:1166 description:@"timers already exist"];
  }
  [(PCConnectionManager *)self pollingInterval];
  double v7 = v6;
  if (v6 < 2.22044605e-16)
  {
    logObject = self->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v83 = self;
      __int16 v84 = 2050;
      double v85 = v7;
      _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%@ Unable to setup a poll timer with {pollingInterval: %{public}f}, start when on power", buf, 0x16u);
    }
    return;
  }
  double lastElapsedInterval = self->_lastElapsedInterval;
  if (lastElapsedInterval > 2.22044605e-16)
  {
    double v10 = v7 - lastElapsedInterval;
    double v7 = v10 >= 0.0 ? v10 : 0.0;
    uint64_t v11 = self->_logObject;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      double v12 = v11;
      [(PCConnectionManager *)self pollingInterval];
      double v13 = self->_lastElapsedInterval;
      *(_DWORD *)buf = 138413058;
      v83 = self;
      __int16 v84 = 2048;
      double v85 = v14;
      __int16 v86 = 2048;
      double v87 = v7;
      __int16 v88 = 2048;
      double v89 = v13;
      _os_log_impl(&dword_1D340D000, v12, OS_LOG_TYPE_DEFAULT, "%@ adjust polling interval {pollingInterval: %f, adjustedPollingInterval: %f, lastElapsedInterval: %f}.", buf, 0x2Au);
    }
  }
  double v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_timerGuidance];
  int v16 = v15;
  if (v15
    && ([v15 timeIntervalSinceNow], v17 > 2.22044605e-16)
    && ([v16 timeIntervalSinceNow], v18 < 7200.0))
  {
    [v16 timeIntervalSinceNow];
    BOOL v20 = v19 > (v7 + v7) / 3.0;
  }
  else
  {
    BOOL v20 = 0;
  }
  int v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_lastScheduledIntervalTime];
  [v21 timeIntervalSinceNow];
  double v23 = v22;
  if (v7 >= 2.22044605e-16)
  {
    if (v20)
    {
      id v26 = v16;
      if (v3)
      {
        int v27 = 0;
        double v28 = CFAbsoluteTimeGetCurrent() - self->_lastResumeTime;
        double v29 = v7 + v7;
        LODWORD(v30) = v28 > v7 + v7;
        double v31 = 0.0;
        if (v23 > 2.22044605e-16 && v23 < v29 && v28 <= v29)
        {
          LODWORD(v30) = 0;
          double v31 = self->_lastScheduledIntervalTime + -120.0;
          int v27 = 1;
        }
      }
      else
      {
        if (v23 <= 2.22044605e-16 || v23 >= v7 || fabs(self->_lastElapsedInterval) >= 2.22044605e-16)
        {
          double Current = CFAbsoluteTimeGetCurrent();
          int v27 = 0;
        }
        else
        {
          double Current = self->_lastScheduledIntervalTime;
          int v27 = 1;
        }
        LODWORD(v30) = 0;
        double v31 = v7 + Current + -120.0;
      }
      double v42 = self->_logObject;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        log = v42;
        PCStringFromDate(v26);
        uint64_t v81 = v21;
        double v43 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        if (v3) {
          *(double *)&uint64_t v44 = COERCE_DOUBLE(@"YES");
        }
        else {
          *(double *)&uint64_t v44 = COERCE_DOUBLE(@"NO");
        }
        __int16 v78 = v44;
        if (v27) {
          *(double *)&__int16 v45 = COERCE_DOUBLE(@"YES");
        }
        else {
          *(double *)&__int16 v45 = COERCE_DOUBLE(@"NO");
        }
        uint64_t v79 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_lastResumeTime];
        uint64_t v46 = PCStringFromDate(v79);
        double v47 = CFAbsoluteTimeGetCurrent() - self->_lastResumeTime;
        v48 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_lastScheduledIntervalTime];
        PCStringFromDate(v48);
        *(double *)&uint64_t v49 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        int v50 = (int)v30;
        uint64_t v30 = (void *)v49;
        double lastScheduledIntervalTime = self->_lastScheduledIntervalTime;
        double v52 = @"YES";
        if (!v50) {
          double v52 = @"NO";
        }
        *(_DWORD *)buf = 138414594;
        v83 = self;
        __int16 v84 = 2112;
        double v85 = v43;
        __int16 v86 = 2112;
        double v87 = *(double *)&v78;
        __int16 v88 = 2112;
        double v89 = *(double *)&v45;
        __int16 v90 = 2112;
        v91 = v46;
        __int16 v92 = 2048;
        double v93 = v47;
        __int16 v94 = 2112;
        double v95 = *(double *)&v49;
        __int16 v96 = 2048;
        double v97 = lastScheduledIntervalTime;
        __int16 v98 = 2048;
        double v99 = v23;
        __int16 v100 = 2112;
        v101 = v52;
        _os_log_impl(&dword_1D340D000, log, OS_LOG_TYPE_DEFAULT, "%@ scheduling the next poll to align with the next push keepAlive date (%@). isAdjustment %@  isLastTimeIntervalValid? %@, lastResumeTime %@ (%f), lastScheduledIntervalTime (%@) %f, timeDiff %f. Should fire immediately? %@", buf, 0x66u);

        LOBYTE(v30) = v50;
        int v21 = v81;
      }
      if (v30)
      {
        double v7 = 0.0;
      }
      else
      {
        double v53 = self->_logObject;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          v54 = v53;
          [v26 timeIntervalSinceNow];
          double v56 = v55;
          v57 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v31];
          PCStringFromDate(v57);
          double v58 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 138413058;
          v83 = self;
          __int16 v84 = 2048;
          double v85 = v56;
          __int16 v86 = 2048;
          double v87 = v7;
          __int16 v88 = 2112;
          double v89 = v58;
          _os_log_impl(&dword_1D340D000, v54, OS_LOG_TYPE_DEFAULT, "%@ nextPollDate timeIntervalSinceNow %f  pollingInterval %f  earliestAllowableFire %@", buf, 0x2Au);
        }
        [v26 timeIntervalSinceNow];
        if (v59 > v7 + 120.0)
        {
          while (1)
          {
            [v26 timeIntervalSinceReferenceDate];
            if (v60 - v7 <= v31) {
              break;
            }
            id v61 = [v26 dateByAddingTimeInterval:-v7];

            v62 = self->_logObject;
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              v63 = v62;
              PCStringFromDate(v61);
              double v64 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              [v61 timeIntervalSinceNow];
              *(_DWORD *)buf = 138412802;
              v83 = self;
              __int16 v84 = 2112;
              double v85 = v64;
              __int16 v86 = 2048;
              double v87 = v65;
              _os_log_impl(&dword_1D340D000, v63, OS_LOG_TYPE_DEFAULT, "%@ nextPollDate whittled down by a polling interval to %@, %f", buf, 0x20u);
            }
            [v61 timeIntervalSinceNow];
            id v26 = v61;
            if (v66 <= v7 + 120.0) {
              goto LABEL_73;
            }
          }
        }
        id v61 = v26;
LABEL_73:
        [v61 timeIntervalSinceNow];
        double v7 = v67;
        id v26 = v61;
      }
      __int16 v68 = self->_logObject;
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v83 = self;
        __int16 v84 = 2048;
        double v85 = v7;
        _os_log_impl(&dword_1D340D000, v68, OS_LOG_TYPE_DEFAULT, "%@ using nextPollInterval = %f.", buf, 0x16u);
      }

      goto LABEL_77;
    }
    __int16 v32 = self->_logObject;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      if (v3) {
        *(double *)&BOOL v33 = COERCE_DOUBLE(@"YES");
      }
      else {
        *(double *)&BOOL v33 = COERCE_DOUBLE(@"NO");
      }
      double v34 = v32;
      PCStringFromDate(v16);
      double v35 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      [v16 timeIntervalSinceNow];
      double v37 = v36;
      v38 = PCStringFromDate(v21);
      *(_DWORD *)buf = 138413826;
      v83 = self;
      __int16 v84 = 2112;
      double v85 = *(double *)&v33;
      __int16 v86 = 2112;
      double v87 = v35;
      __int16 v88 = 2048;
      double v89 = v37;
      __int16 v90 = 2112;
      v91 = v38;
      __int16 v92 = 2048;
      double v93 = v23;
      __int16 v94 = 2048;
      double v95 = v7;
      _os_log_impl(&dword_1D340D000, v34, OS_LOG_TYPE_DEFAULT, "%@ scheduling next poll - isAdjustment %@. PushDate %@ is not valid - timeIntervalSinceNow %f. Last scheduled fire date %@. TimeDiff = %f, pollingInterval %f", buf, 0x48u);
    }
    if (v3)
    {
      if (v23 < v7 + v7 && v23 > 2.22044605e-16) {
        double v7 = v23;
      }
    }
    else if (v23 > 2.22044605e-16 && v23 < v7 + -120.0)
    {
      double v41 = -0.0;
      if (fabs(self->_lastElapsedInterval) < 2.22044605e-16) {
        double v41 = v23;
      }
      double v7 = v7 + v41;
    }
    __int16 v24 = self->_logObject;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v83 = self;
      __int16 v84 = 2048;
      double v85 = v7;
      uint64_t v25 = "%@ using nextPollInterval = %f.";
      goto LABEL_49;
    }
  }
  else
  {
    __int16 v24 = self->_logObject;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v83 = self;
      __int16 v84 = 2048;
      double v85 = v7;
      uint64_t v25 = "%@ firing immediately {nextPollInterval:%f}.";
LABEL_49:
      _os_log_impl(&dword_1D340D000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0x16u);
    }
  }
LABEL_77:
  id v69 = [[PCPersistentTimer alloc] initWithTimeInterval:self->_serviceIdentifier serviceIdentifier:self target:sel__intervalTimerFired selector:0 userInfo:v7];
  intervalTimer = self->_intervalTimer;
  self->_intervalTimer = v69;

  double v71 = [(PCConnectionManager *)self persistentInterfaceManager];
  int v72 = [v71 areAllNetworkInterfacesDisabled];

  if (v72)
  {
    v73 = self->_logObject;
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D340D000, v73, OS_LOG_TYPE_DEFAULT, "All network interfaces are disabled, so not scheduling any wakes in polling mode", buf, 2u);
    }
    [(PCPersistentTimer *)self->_intervalTimer setDisableSystemWaking:1];
  }
  [(PCPersistentTimer *)self->_intervalTimer fireTime];
  self->_double lastScheduledIntervalTime = v74;
  objc_super v75 = self->_intervalTimer;
  v76 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [(PCPersistentTimer *)v75 scheduleInRunLoop:v76];

  self->_lastStartTime = CFAbsoluteTimeGetCurrent();
}

- (void)_setupKeepAliveForReconnect
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (*(_OWORD *)&self->_intervalTimer != 0 || self->_delayTimer)
  {
    double v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2 object:self file:@"PCConnectionManager.m" lineNumber:1273 description:@"timers already exist"];
  }
  LODWORD(v2) = self->_reconnectIteration;
  double v5 = fmin((double)v2 * 60.0, 900.0);
  double v6 = [(PCConnectionManager *)self persistentInterfaceManager];
  if ([v6 areAllNetworkInterfacesDisabled])
  {
    logObject = self->_logObject;
    double v8 = 0.0;
    if (!os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    LOWORD(v36) = 0;
    __int16 v9 = "All network interfaces are disabled, so not scheduling any wakes in reconnect mode";
    goto LABEL_6;
  }
  if (![(PCConnectionManager *)self currentStyle]
    && (([v6 doesWWANInterfaceExist] & 1) != 0 || objc_msgSend(v6, "isWakeOnWiFiSupported")))
  {
    BOOL v30 = self->_reconnectIteration == 1;
    if (CFAbsoluteTimeGetCurrent() - self->_lastReconnectTime >= 3600.0)
    {
      double v8 = dbl_1D342EA30[v30];
    }
    else
    {
      double v31 = self->_logObject;
      double v8 = 1800.0;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v36) = 0;
        _os_log_impl(&dword_1D340D000, v31, OS_LOG_TYPE_DEFAULT, "Experienced recent dropped connection. Using 30 minute wake interval", (uint8_t *)&v36, 2u);
      }
    }
    __int16 v32 = +[PCInterfaceMonitor sharedInstanceForIdentifier:0];
    if ([v32 isBadLinkQuality])
    {
      BOOL v33 = +[PCInterfaceMonitor sharedInstanceForIdentifier:1];
      int v34 = [v33 isBadLinkQuality];

      if (v34)
      {
        logObject = self->_logObject;
        double v5 = 300.0;
        if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v36) = 0;
          __int16 v9 = "Network interfaces reporting BAD LQM. Altering timer interval to 5 minutes";
LABEL_6:
          _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v36, 2u);
        }
      }
    }
    else
    {
    }
  }
  else
  {
    [(PCConnectionManager *)self pollingInterval];
    double v8 = v10;
  }
LABEL_9:
  double v11 = (double)arc4random() / 4294967300.0 * 0.5 + 0.75;
  double v12 = v5 * v11;
  double v13 = v8 * v11;
  if (self->_reconnectWithKeepAliveDelay)
  {
    [(PCConnectionManager *)self currentKeepAliveInterval];
    double v12 = v12 + v14;
    if (v13 <= 2.22044605e-16) {
      double v14 = -0.0;
    }
    double v13 = v13 + v14;
  }
  double v15 = self->_logObject;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int reconnectIteration = self->_reconnectIteration;
    int v36 = 67109632;
    *(_DWORD *)double v37 = reconnectIteration;
    *(_WORD *)&v37[4] = 2048;
    *(double *)&v37[6] = v12;
    *(_WORD *)&v37[14] = 2048;
    *(double *)&v37[16] = v13;
    _os_log_impl(&dword_1D340D000, v15, OS_LOG_TYPE_DEFAULT, "Creating reconnect timers for iteration %i with keep alive interval %.4g and wake interval %.4g", (uint8_t *)&v36, 0x1Cu);
  }
  double v17 = [[PCPersistentTimer alloc] initWithTimeInterval:self->_serviceIdentifier serviceIdentifier:self target:sel__intervalTimerFired selector:0 userInfo:v12];
  intervalTimer = self->_intervalTimer;
  self->_intervalTimer = v17;

  [(PCPersistentTimer *)self->_intervalTimer setDisableSystemWaking:1];
  [(PCPersistentTimer *)self->_intervalTimer fireTime];
  self->_double lastScheduledIntervalTime = v19;
  BOOL v20 = self->_intervalTimer;
  int v21 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [(PCPersistentTimer *)v20 scheduleInRunLoop:v21];

  double v22 = self->_logObject;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    double v23 = self->_intervalTimer;
    int v36 = 138412546;
    *(void *)double v37 = self;
    *(_WORD *)&v37[8] = 2112;
    *(void *)&v37[10] = v23;
    _os_log_impl(&dword_1D340D000, v22, OS_LOG_TYPE_DEFAULT, "%@ _intervalTimer = %@", (uint8_t *)&v36, 0x16u);
  }
  if (v13 > 2.22044605e-16)
  {
    __int16 v24 = [[PCPersistentTimer alloc] initWithTimeInterval:self->_serviceIdentifier serviceIdentifier:self target:sel__intervalTimerFired selector:0 userInfo:v13];
    reconnectWakeTimer = self->_reconnectWakeTimer;
    self->_reconnectWakeTimer = v24;

    [(PCPersistentTimer *)self->_reconnectWakeTimer setMinimumEarlyFireProportion:1.0];
    id v26 = self->_reconnectWakeTimer;
    int v27 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(PCPersistentTimer *)v26 scheduleInRunLoop:v27];

    double v28 = self->_logObject;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      double v29 = self->_reconnectWakeTimer;
      int v36 = 138412546;
      *(void *)double v37 = self;
      *(_WORD *)&v37[8] = 2112;
      *(void *)&v37[10] = v29;
      _os_log_impl(&dword_1D340D000, v28, OS_LOG_TYPE_DEFAULT, "%@ _reconnectWakeTimer = %@", (uint8_t *)&v36, 0x16u);
    }
  }
}

- (BOOL)_hasBudgetRemaining
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_duetIdentifier)
  {
    BOOL v3 = [(id)CUTWeakLinkClass() sharedInstance];
    int v4 = [v3 allowsDiscretionaryWorkForTask:self->_duetIdentifier withPriority:*(void *)CUTWeakLinkSymbol() withParameters:0];
    if ((v4 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      duetIdentifier = self->_duetIdentifier;
      int v9 = 138412546;
      double v10 = self;
      __int16 v11 = 2112;
      double v12 = (__CFString *)duetIdentifier;
      _os_log_impl(&dword_1D340D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@ DASSystemContext denied discretionary work for %@.", (uint8_t *)&v9, 0x16u);
    }
    logObject = self->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = @"NO";
      if (v4) {
        double v7 = @"YES";
      }
      int v9 = 138412546;
      double v10 = self;
      __int16 v11 = 2112;
      double v12 = v7;
      _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%@ got response from DASSystemContext: hasBudget: %@.", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)_intervalTimerFired
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  BOOL v3 = self;
  objc_sync_enter(v3);
  if (v3->_intervalTimer)
  {
    if (v3->_delayTimer)
    {
      double v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2 object:v3 file:@"PCConnectionManager.m" lineNumber:1384 description:@"delay timer already exists"];
    }
    [(PCConnectionManager *)v3 _takePowerAssertionWithTimeout:30.0];
    [(PCPersistentTimer *)v3->_intervalTimer invalidate];
    intervalTimer = v3->_intervalTimer;
    v3->_intervalTimer = 0;

    [(PCPersistentTimer *)v3->_reconnectWakeTimer invalidate];
    reconnectWakeTimer = v3->_reconnectWakeTimer;
    v3->_reconnectWakeTimer = 0;

    if ([(PCConnectionManager *)v3 _hasBudgetRemaining])
    {
      double v6 = [(PCConnectionManager *)v3 persistentInterfaceManager];
      if ([(PCConnectionManager *)v3 currentStyle] != 1
        && (([v6 isWWANInterfaceUp] & 1) != 0 || (objc_msgSend(v6, "isWakeOnWiFiSupported") & 1) != 0))
      {
        int v21 = v3->_logObject;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = [v6 isWWANInterfaceUp];
          int v23 = [v6 isWakeOnWiFiSupported];
          __int16 v24 = @"NO";
          if (v22) {
            uint64_t v25 = @"YES";
          }
          else {
            uint64_t v25 = @"NO";
          }
          if (v23) {
            __int16 v24 = @"YES";
          }
          int v29 = 138412546;
          double v30 = *(double *)&v25;
          __int16 v31 = 2112;
          __int16 v32 = v24;
          _os_log_impl(&dword_1D340D000, v21, OS_LOG_TYPE_DEFAULT, "Timer fired. Delay is 0 so scheduling notification immediately. isWWANInterfaceUp %@, isWoWSupported %@", (uint8_t *)&v29, 0x16u);
        }

        id v26 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
        int v27 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1C4B0]];
        [v26 performSelector:sel__delayTimerFired target:v3 argument:0 order:0 modes:v27];

        double v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
        CFRunLoopWakeUp((CFRunLoopRef)[v8 getCFRunLoop]);
      }
      else
      {
        double v7 = [(PCConnectionManager *)v3 persistentInterfaceManager];
        [v7 enableWiFiAutoAssociation:1 forDelegate:v3];

        double v8 = +[PCPersistentTimer lastSystemWakeDate];
        [v8 timeIntervalSinceNow];
        double v10 = v9 + 10.0;
        if (v10 >= 1.0) {
          double v11 = v10;
        }
        else {
          double v11 = 1.0;
        }
        double v12 = v3->_logObject;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          PCStringFromDate(v8);
          uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          int v29 = 134218242;
          double v30 = v11;
          __int16 v31 = 2112;
          __int16 v32 = v13;
          _os_log_impl(&dword_1D340D000, v12, OS_LOG_TYPE_DEFAULT, "Timer fired. Delaying notification %g seconds. Last system wake: %@", (uint8_t *)&v29, 0x16u);
        }
        double v14 = [[PCPersistentTimer alloc] initWithTimeInterval:v3->_serviceIdentifier serviceIdentifier:v3 target:sel__delayTimerFired selector:0 userInfo:v11];
        delayTimer = v3->_delayTimer;
        v3->_delayTimer = v14;

        [(PCPersistentTimer *)v3->_delayTimer setDisableSystemWaking:1];
        [(PCPersistentTimer *)v3->_delayTimer setMinimumEarlyFireProportion:1.0];
        int v16 = v3->_delayTimer;
        double v17 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
        [(PCPersistentTimer *)v16 scheduleInRunLoop:v17];
      }
    }
    else
    {
      logObject = v3->_logObject;
      if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
      {
        serviceIdentifier = v3->_serviceIdentifier;
        int v29 = 138412546;
        double v30 = *(double *)&v3;
        __int16 v31 = 2112;
        __int16 v32 = (__CFString *)serviceIdentifier;
        _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%@ (%@) does not have budget to perform callout, bailing and starting next timer interval.", (uint8_t *)&v29, 0x16u);
      }
      [(PCConnectionManager *)v3 _releasePowerAssertion];
      [(PCConnectionManager *)v3 startManager];
    }
  }
  else
  {
    double v18 = v3->_logObject;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_1D340D000, v18, OS_LOG_TYPE_DEFAULT, "_intervalTimer was already invalidated, no need to perform callback", (uint8_t *)&v29, 2u);
    }
  }
  objc_sync_exit(v3);
}

- (void)_delayTimerFired
{
  obj = self;
  objc_sync_enter(obj);
  [(PCConnectionManager *)obj _clearTimersReleasingPowerAssertion:0];
  if (obj->_isInReconnectMode)
  {
    uint64_t v2 = 4;
  }
  else
  {
    unsigned int v3 = [(PCConnectionManager *)obj currentStyle];
    if (v3 >= 3) {
      uint64_t v2 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v2 = dword_1D342EA40[v3];
    }
  }
  double keepAliveGracePeriod = obj->_keepAliveGracePeriod;
  double onTimeKeepAliveTime = obj->_onTimeKeepAliveTime;
  if (keepAliveGracePeriod <= 2.22044605e-16) {
    double v6 = onTimeKeepAliveTime + PCScheduledWakeRTCPrecision() * -2.0;
  }
  else {
    double v6 = keepAliveGracePeriod + onTimeKeepAliveTime + -5.0;
  }
  double v7 = (void *)MEMORY[0x1E4F1C9E8];
  double v8 = [NSNumber numberWithBool:obj->_lastStopTime < v6];
  double v9 = objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, @"PCTimerFireEarlyToCoalesce", 0);

  [(PCConnectionManager *)obj _calloutWithEvent:v2 context:v9];
  objc_sync_exit(obj);
}

- (void)_callDelegateWithEventAndContext:(id)a3
{
  id v4 = a3;
  double v5 = self;
  objc_sync_enter(v5);
  id WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
  objc_sync_exit(v5);

  double v7 = [v4 objectForKey:@"PCEvent"];
  uint64_t v8 = [v7 intValue];

  double v9 = [v4 objectForKey:@"PCEventContext"];
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained connectionManager:v5 handleEvent:v8];
  }
  else if (objc_opt_respondsToSelector())
  {
    [WeakRetained connectionManager:v5 handleEvent:v8 context:v9];
  }
  double v10 = v5;
  objc_sync_enter(v10);
  v10->_inCallback = 0;
  logObject = v10->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v12 = 0;
    _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "Returned from callout", v12, 2u);
  }
  [(PCConnectionManager *)v10 _adjustInterfaceAssertions];
  [(PCConnectionManager *)v10 _releasePowerAssertion];
  objc_sync_exit(v10);
}

- (void)_calloutWithEvent:(int)a3 context:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(PCConnectionManager *)self _takePowerAssertionWithTimeout:30.0];
  logObject = self->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = logObject;
    double v9 = [(PCConnectionManager *)self _stringForEvent:v4];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    *(_DWORD *)buf = 138412546;
    BOOL v20 = v9;
    __int16 v21 = 2112;
    id v22 = WeakRetained;
    _os_log_impl(&dword_1D340D000, v8, OS_LOG_TYPE_DEFAULT, "Calling out with reason %@ to delegate %@", buf, 0x16u);
  }
  self->_inCallback = 1;
  double v11 = (void *)MEMORY[0x1E4F1C9E8];
  double v12 = [NSNumber numberWithInt:v4];
  uint64_t v13 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, @"PCEvent", v6, @"PCEventContext", 0);

  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__PCConnectionManager__calloutWithEvent_context___block_invoke;
    block[3] = &unk_1E698DD80;
    block[4] = self;
    id v18 = v13;
    dispatch_async(delegateQueue, block);
  }
  else
  {
    delegateRunLoop = self->_delegateRunLoop;
    int v16 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1C4B0]];
    [(NSRunLoop *)delegateRunLoop performSelector:sel__callDelegateWithEventAndContext_ target:self argument:v13 order:0 modes:v16];

    CFRunLoopWakeUp([(NSRunLoop *)self->_delegateRunLoop getCFRunLoop]);
  }
}

uint64_t __49__PCConnectionManager__calloutWithEvent_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callDelegateWithEventAndContext:*(void *)(a1 + 40)];
}

- (void)_clearTimers
{
}

- (void)_clearTimersReleasingPowerAssertion:(BOOL)a3
{
  BOOL v3 = a3;
  self->_BOOL isRunning = 0;
  [(PCPersistentTimer *)self->_intervalTimer invalidate];
  intervalTimer = self->_intervalTimer;
  self->_intervalTimer = 0;

  [(PCPersistentTimer *)self->_reconnectWakeTimer invalidate];
  reconnectWakeTimer = self->_reconnectWakeTimer;
  self->_reconnectWakeTimer = 0;

  [(PCPersistentTimer *)self->_delayTimer invalidate];
  delayTimer = self->_delayTimer;
  self->_delayTimer = 0;

  [(PCConnectionManager *)self _adjustInterfaceAssertions];
  if (v3) {
    [(PCConnectionManager *)self _releasePowerAssertion];
  }
  self->_double lastStopTime = CFAbsoluteTimeGetCurrent();
}

- (void)_pauseTimers
{
  [(PCPersistentTimer *)self->_intervalTimer invalidate];
  intervalTimer = self->_intervalTimer;
  self->_intervalTimer = 0;

  [(PCPersistentTimer *)self->_reconnectWakeTimer invalidate];
  reconnectWakeTimer = self->_reconnectWakeTimer;
  self->_reconnectWakeTimer = 0;

  [(PCPersistentTimer *)self->_delayTimer invalidate];
  delayTimer = self->_delayTimer;
  self->_delayTimer = 0;

  [(PCConnectionManager *)self _adjustInterfaceAssertions];
  if (!self->_inCallback) {
    [(PCConnectionManager *)self _releasePowerAssertion];
  }
  double Current = CFAbsoluteTimeGetCurrent();
  self->_double lastStopTime = Current;
  double v7 = Current - self->_lastStartTime;
  if (v7 < 0.0) {
    double v7 = 0.0;
  }
  self->_double lastElapsedInterval = self->_lastElapsedInterval + v7;
}

- (void)_setTimerGuidance:(double)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_timerGuidance = a3;
  [(PCConnectionManager *)obj _adjustPollTimerIfNecessary];
  objc_sync_exit(obj);
}

- (void)interfaceLinkQualityChanged:(id)a3 previousLinkQuality:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = self;
  objc_sync_enter(v7);
  [(PCConnectionManager *)v7 _adjustPollTimerIfNecessary];
  if ((int)[v6 linkQuality] > (int)v4
    && +[PCInterfaceUsabilityMonitor isBadLinkQuality:v4])
  {
    [(PCPersistentTimer *)v7->_intervalTimer startTime];
    BOOL v9 = CFAbsoluteTimeGetCurrent() - v8 > 60.0 && v7->_isRunning && !v7->_delayTimer && v7->_isInReconnectMode;
    logObject = v7->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = @"NO";
      if (v9) {
        double v11 = @"YES";
      }
      int v14 = 138412290;
      double v15 = v11;
      _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "Persistent interface link quality changed, firing interval timer: %@", (uint8_t *)&v14, 0xCu);
    }
    if (v9)
    {
      [(PCConnectionManager *)v7 _intervalTimerFired];
    }
    else if (![(PCConnectionManager *)v7 currentStyle])
    {
      id v12 = +[PCInterfaceMonitor sharedInstanceForIdentifier:1];
      if (v12 == v6)
      {
        BOOL v13 = v7->_interfaceIdentifier == 1;

        if (v13) {
          [(PCConnectionManager *)v7 _calloutWithEvent:7 context:0];
        }
      }
      else
      {
      }
    }
  }
  objc_sync_exit(v7);
}

- (void)interfaceManagerWWANInterfaceStatusChanged:(id)a3
{
  id v4 = a3;
  double v5 = self;
  objc_sync_enter(v5);
  if (v5->_interfaceIdentifier == 1)
  {
    [(PCConnectionManager *)v5 _adjustInterfaceAssertions];
    int v6 = [v4 isWWANInterfaceUp];
    if (v5->_alwaysWantsInterfaceChangeCallbacks || v5->_isRunning && !v5->_delayTimer)
    {
      v5->_isReachable = [v4 isInternetReachable];
      if (v5->_isInReconnectMode && (v5->_intervalTimer ? (int v7 = v6) : (int v7 = 0), v7 == 1))
      {
        logObject = v5->_logObject;
        if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)double v10 = 0;
          _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "Persistent interface went up while in reconnect mode. Firing reconnect timer.", v10, 2u);
        }
        [(PCConnectionManager *)v5 _intervalTimerFired];
      }
      else if (![(PCConnectionManager *)v5 currentStyle])
      {
        if (v6) {
          uint64_t v9 = 7;
        }
        else {
          uint64_t v9 = 8;
        }
        [(PCConnectionManager *)v5 _calloutWithEvent:v9 context:0];
      }
    }
  }
  objc_sync_exit(v5);
}

- (void)interfaceManagerInHomeCountryStatusChanged:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(PCConnectionManager *)v4 _loadPreferencesGeneratingEvent:1];
  objc_sync_exit(v4);
}

- (void)interfaceManagerInternetReachabilityChanged:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  [(PCConnectionManager *)v5 _adjustInterfaceAssertions];
  BOOL isReachable = v5->_isReachable;
  int v7 = [v4 isInternetReachable];
  v5->_BOOL isReachable = v7;
  if (v7) {
    v5->_double lastReachableTime = CFAbsoluteTimeGetCurrent();
  }
  double v8 = v5->_logObject;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isRunning = v5->_isRunning;
    delayTimer = v5->_delayTimer;
    BOOL v11 = v5->_isReachable;
    int v12 = [(PCConnectionManager *)v5 currentStyle];
    BOOL v13 = @"YES";
    *(_DWORD *)__int16 v21 = 138413826;
    *(void *)&v21[4] = v5;
    if (v11) {
      int v14 = @"YES";
    }
    else {
      int v14 = @"NO";
    }
    if (isReachable) {
      double v15 = @"YES";
    }
    else {
      double v15 = @"NO";
    }
    if (isRunning) {
      uint64_t v16 = @"YES";
    }
    else {
      uint64_t v16 = @"NO";
    }
    *(_WORD *)&v21[12] = 2112;
    *(void *)&v21[14] = v4;
    *(_WORD *)&v21[22] = 2112;
    id v22 = v16;
    if (v12) {
      BOOL v13 = @"NO";
    }
    __int16 v23 = 2112;
    __int16 v24 = delayTimer;
    __int16 v25 = 2112;
    id v26 = v15;
    __int16 v27 = 2112;
    double v28 = v14;
    __int16 v29 = 2112;
    double v30 = v13;
    _os_log_impl(&dword_1D340D000, v8, OS_LOG_TYPE_DEFAULT, "%@ interfaceManagerInternetReachabilityChanged: %@ isRunning %@ delayTimer %@ wasReachable %@ isReachable %@ currentStyleIsPush? %@", v21, 0x48u);
  }

  if (v5->_alwaysWantsInterfaceChangeCallbacks || v5->_isRunning && !v5->_delayTimer)
  {
    if (!v5->_isInReconnectMode || isReachable || !v5->_intervalTimer || ((v7 ^ 1) & 1) != 0)
    {
      int v18 = [(PCConnectionManager *)v5 currentStyle];
      if (isReachable) {
        char v19 = v7;
      }
      else {
        char v19 = 0;
      }
      if (!v18 && (v19 & 1) == 0)
      {
        if (v7) {
          uint64_t v20 = 7;
        }
        else {
          uint64_t v20 = 8;
        }
        [(PCConnectionManager *)v5 _calloutWithEvent:v20 context:0];
      }
    }
    else
    {
      logObject = v5->_logObject;
      if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v21 = 0;
        _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "Network went reachable while in reconnect mode. Firing reconnect timer.", v21, 2u);
      }
      [(PCConnectionManager *)v5 _intervalTimerFired];
    }
  }
  objc_sync_exit(v5);
}

- (void)_adjustInterfaceAssertions
{
  BOOL v3 = [(PCConnectionManager *)self persistentInterfaceManager];
  id v8 = v3;
  if (!self->_intervalTimer)
  {
    [v3 enableWiFiAutoAssociation:0 forDelegate:self];
    int v6 = v8;
    goto LABEL_8;
  }
  unsigned int v4 = [(PCConnectionManager *)self currentStyle];
  int v5 = [v8 isWWANInterfaceUp];
  if (v4 >= 2)
  {
    [v8 enableWiFiAutoAssociation:0 forDelegate:self];
    goto LABEL_11;
  }
  if (!v5)
  {
    [v8 enableWiFiAutoAssociation:self->_interfaceIdentifier != 1 forDelegate:self];
    if (!v4)
    {
LABEL_18:
      BOOL v7 = self->_interfaceIdentifier != 1;
      goto LABEL_12;
    }
LABEL_11:
    BOOL v7 = 0;
LABEL_12:
    int v6 = v8;
    goto LABEL_13;
  }
  if (self->_enableNonCellularConnections)
  {
    [v8 enableWiFiAutoAssociation:self->_interfaceIdentifier != 1 forDelegate:self];
    int v6 = v8;
    if (!v4)
    {
LABEL_17:
      if (self->_enableNonCellularConnections) {
        goto LABEL_18;
      }
      goto LABEL_11;
    }
LABEL_8:
    BOOL v7 = 0;
    goto LABEL_13;
  }
  [v8 enableWiFiAutoAssociation:0 forDelegate:self];
  int v6 = v8;
  BOOL v7 = 0;
  if (!v4) {
    goto LABEL_17;
  }
LABEL_13:
  [v6 enableWakeOnWiFi:v7 forDelegate:self];
}

- (id)persistentInterfaceManager
{
  return +[PCPersistentInterfaceManager sharedInstance];
}

- (void)_takePowerAssertionWithTimeout:(double)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_powerAssertionID = &self->_powerAssertionID;
  if (!self->_powerAssertionID)
  {
    serviceIdentifier = self->_serviceIdentifier;
    if (serviceIdentifier) {
      [NSString stringWithFormat:@"%@-connectionmanager(%p)", serviceIdentifier, self];
    }
    else {
    BOOL v7 = objc_msgSend(NSString, "stringWithFormat:", @"connectionmanager(%p)", self, v13);
    }
    id v8 = +[PCPersistentIdentifiers processNamePidAndStringIdentifier:v7];

    IOReturn v9 = IOPMAssertionCreateWithDescription(@"NoIdleSleepAssertion", v8, @"Staying awake during callout to clients", 0, 0, a3, @"TimeoutActionTurnOff", p_powerAssertionID);
    logObject = self->_logObject;
    if (v9)
    {
      int v11 = v9;
      if (os_log_type_enabled(logObject, OS_LOG_TYPE_FAULT)) {
        -[PCConnectionManager _takePowerAssertionWithTimeout:](v11, logObject);
      }
    }
    else if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      IOPMAssertionID v12 = *p_powerAssertionID;
      *(_DWORD *)buf = 67109378;
      IOPMAssertionID v15 = v12;
      __int16 v16 = 2112;
      double v17 = v8;
      _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "Preventing sleep with power assertion with identifier %i assertionIdentifier: %@", buf, 0x12u);
    }
  }
}

- (void)_releasePowerAssertion
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1D340D000, a2, OS_LOG_TYPE_FAULT, "Unable to release power assertion. IOPMAssertionRelease() returned %#x.", (uint8_t *)v2, 8u);
}

- (void)_saveWWANKeepAliveInterval
{
  wwanGrowthAlgorithm = self->_wwanGrowthAlgorithm;
  if (self->_wwanGrowthAlgorithm[self->_currentAddressFamily])
  {
    if (_saveWWANKeepAliveInterval_pred != -1) {
      dispatch_once(&_saveWWANKeepAliveInterval_pred, &__block_literal_global_169);
    }
    unsigned int v4 = self->_serviceIdentifier;
    int v5 = [(PCConnectionManager *)self _stringForAddressFamily:self->_currentAddressFamily];
    int v6 = [(PCGrowthAlgorithm *)wwanGrowthAlgorithm[self->_currentAddressFamily] cacheInfo];
    BOOL v7 = v6;
    if (v6)
    {
      id v8 = (void *)[v6 mutableCopy];
      IOReturn v9 = (void *)MEMORY[0x1E4F28B48];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __49__PCConnectionManager__saveWWANKeepAliveInterval__block_invoke_2;
      v12[3] = &unk_1E698DD30;
      uint64_t v13 = v4;
      id v14 = v8;
      id v15 = v5;
      id v10 = v8;
      int v11 = [v9 blockOperationWithBlock:v12];
      [(id)_saveWWANKeepAliveInterval_queue addOperation:v11];
    }
  }
}

uint64_t __49__PCConnectionManager__saveWWANKeepAliveInterval__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  id v1 = (void *)_saveWWANKeepAliveInterval_queue;
  _saveWWANKeepAliveInterval_queue = (uint64_t)v0;

  uint64_t v2 = (void *)_saveWWANKeepAliveInterval_queue;
  return [v2 setMaxConcurrentOperationCount:1];
}

void __49__PCConnectionManager__saveWWANKeepAliveInterval__block_invoke_2(void *a1)
{
  uint64_t v2 = +[PCConnectionManager _keepAliveCachePath];
  uint64_t v3 = [v2 stringByAppendingPathExtension:@"lock"];
  unsigned int v4 = (void *)v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    int v6 = [[PCDistributedLock alloc] initWithPath:v3];
    [(PCDistributedLock *)v6 lock];
    BOOL v7 = +[PCConnectionManager intervalCacheDictionaries];
    id v8 = (void *)[v7 mutableCopy];

    IOReturn v9 = [v8 objectForKey:a1[4]];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    IOPMAssertionID v12 = v11;

    [v12 setObject:a1[5] forKey:a1[6]];
    [v8 setObject:v12 forKey:a1[4]];
    uint64_t v13 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v8 format:200 options:0 error:0];
    [v13 writeToFile:v2 atomically:1];
    [(PCDistributedLock *)v6 unlock];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"PCIntervalCacheChangedNotification", 0, 0, 0);
  }
}

- (id)_getCachedWWANKeepAliveIntervalForAddressFamily:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = +[PCConnectionManager intervalCacheDictionaries];
  int v6 = [v5 objectForKey:self->_serviceIdentifier];
  BOOL v7 = [(PCConnectionManager *)self _stringForAddressFamily:v3];
  id v8 = [v6 objectForKey:v7];

  return v8;
}

+ (id)intervalCacheDictionaries
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v32 = a1;
  unsigned int v4 = [a1 _keepAliveCachePath];
  BOOL v5 = (void *)[v3 initWithContentsOfFile:v4];

  unint64_t v6 = 0x1E4F1C000uLL;
  id v30 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v38;
    uint64_t v24 = *(void *)v38;
    id v25 = v7;
    do
    {
      uint64_t v11 = 0;
      uint64_t v26 = v9;
      do
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v37 + 1) + 8 * v11);
        uint64_t v13 = [v7 objectForKey:v12];
        uint64_t v31 = [*(id *)(v6 + 2656) dictionary];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v27 = v12;
          double v28 = v13;
          uint64_t v29 = v11;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v14 = v13;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v34;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v34 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * i);
                uint64_t v20 = [v14 objectForKey:v19];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  __int16 v21 = [v20 objectForKey:@"keepAliveInterval"];
                  id v22 = [v20 objectForKey:@"cacheDate"];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      [v21 doubleValue];
                      if (objc_msgSend(v32, "_isCachedKeepAliveIntervalStillValid:date:", v22)) {
                        [v31 setObject:v20 forKey:v19];
                      }
                    }
                  }
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }
            while (v16);
          }

          unint64_t v6 = 0x1E4F1C000;
          uint64_t v10 = v24;
          id v7 = v25;
          uint64_t v9 = v26;
          uint64_t v12 = v27;
          uint64_t v13 = v28;
          uint64_t v11 = v29;
        }
        [v30 setObject:v31 forKey:v12];

        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v9);
  }

  return v30;
}

+ (id)_keepAliveCachePath
{
  uint64_t v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v3 = [v2 objectAtIndex:0];

  unsigned int v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = 0;
  int v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v9];
  id v6 = v9;

  if (v5)
  {
    id v7 = [v3 stringByAppendingPathComponent:@"com.apple.persistentconnection.intervalcache.plist"];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      +[PCConnectionManager _keepAliveCachePath];
    }
    id v7 = 0;
  }

  return v7;
}

+ (BOOL)_isCachedKeepAliveIntervalStillValid:(double)a3 date:(id)a4
{
  [a4 timeIntervalSinceNow];
  return v5 > -(a3 + 3600.0);
}

- (id)_stringForStyle:(int)a3
{
  id v3 = @"manual";
  if (a3 == 1) {
    id v3 = @"poll";
  }
  if (!a3) {
    id v3 = @"push";
  }
  unsigned int v4 = v3;
  return v4;
}

- (id)_stringForAction:(int)a3
{
  if (a3 > 6) {
    return @"unknown action";
  }
  else {
    return off_1E698DF60[a3];
  }
}

- (id)_stringForEvent:(int)a3
{
  if ((a3 - 2) > 6) {
    return @"unknown event";
  }
  else {
    return off_1E698DF98[a3 - 2];
  }
}

- (id)_stringForAddressFamily:(int)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_1E698DFD0[a3];
  }
}

- (double)keepAliveGracePeriod
{
  return self->_keepAliveGracePeriod;
}

- (int64_t)interfaceIdentifier
{
  return self->_interfaceIdentifier;
}

- (void)setInterfaceIdentifier:(int64_t)a3
{
  self->_int64_t interfaceIdentifier = a3;
}

- (int)lastProcessedAction
{
  return self->_lastProcessedAction;
}

- (double)nonCellularEarlyFireConstantInterval
{
  return self->_nonCellularEarlyFireConstantInterval;
}

- (double)lastScheduledIntervalTime
{
  return self->_lastScheduledIntervalTime;
}

- (BOOL)alwaysWantsInterfaceChangeCallbacks
{
  return self->_alwaysWantsInterfaceChangeCallbacks;
}

- (void)setAlwaysWantsInterfaceChangeCallbacks:(BOOL)a3
{
  self->_alwaysWantsInterfaceChangeCallbacks = a3;
}

- (BOOL)powerOptimizationsForExpensiveNetworkingDisabled
{
  return self->_powerOptimizationsForExpensiveNetworkingDisabled;
}

- (void)setPowerOptimizationsForExpensiveNetworkingDisabled:(BOOL)a3
{
  self->_powerOptimizationsForExpensiveNetworkingDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_duetContextRegistration, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_reconnectWakeTimer, 0);
  objc_storeStrong((id *)&self->_intervalTimer, 0);
  objc_storeStrong((id *)&self->_lastScheduledGrowthAlgorithm, 0);
  for (uint64_t i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_wifiGrowthAlgorithm[i + 1], 0);
  for (uint64_t j = 0; j != -2; --j)
    objc_storeStrong((id *)&self->_wwanGrowthAlgorithm[j + 1], 0);
  objc_storeStrong((id *)&self->_logObject, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_delegateRunLoop, 0);
  objc_storeStrong((id *)&self->_duetIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_validateActionForCurrentStyle:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D340D000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

- (void)_takePowerAssertionWithTimeout:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1D340D000, a2, OS_LOG_TYPE_FAULT, "Unable to take power assertion. IOPMAssertionCreateWithName() returned %#x.", (uint8_t *)v2, 8u);
}

void __49__PCConnectionManager__saveWWANKeepAliveInterval__block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_fault_impl(&dword_1D340D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unable to write cache dictionary: %@", (uint8_t *)&v1, 0xCu);
}

+ (void)_keepAliveCachePath
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2114;
  uint64_t v5 = a2;
  _os_log_fault_impl(&dword_1D340D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unable to create directory %@ {error:%{public}@}", (uint8_t *)&v2, 0x16u);
}

@end