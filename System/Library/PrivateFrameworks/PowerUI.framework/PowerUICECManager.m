@interface PowerUICECManager
+ (BOOL)isCECSupported;
+ (id)fetchEstimatedCountryCode;
+ (id)manager;
+ (id)monitorWithDelegate:(id)a3;
+ (void)fetchEstimatedCountryCode;
- (BOOL)displayedFirstTimeNotification;
- (BOOL)evaluateEngagementAndSetup;
- (BOOL)firstChargingEvaluation;
- (BOOL)hasInfluencedCharging;
- (BOOL)isActiveRegion;
- (BOOL)isCECEnabled;
- (BOOL)isCECTemporarilyDisabled;
- (BOOL)isChargingPaused;
- (BOOL)isEnabled;
- (BOOL)isEngaged;
- (BOOL)isInternal;
- (BOOL)isPluggedIntoEligiblePowerSource;
- (BOOL)shouldEngageCEC;
- (BOOL)shouldSupportCEC;
- (BOOL)tOverrideActiveCheck;
- (NSDate)cecTemporarilyDisabledDate;
- (NSDate)pauseChargingCheckDate;
- (NSDate)pluggedInDate;
- (NSDate)userDeadline;
- (NSDictionary)phaseDescriptions;
- (NSString)debugStatus;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (OS_os_log)log;
- (PowerUIAnalyticsManager)analyticsManager;
- (PowerUIBDCDataManager)bdcDataManager;
- (PowerUICECManager)init;
- (PowerUICECPredictedTimeManager)pluggedInTimeManager;
- (PowerUIChargingController)chargingController;
- (_CDLocalContext)context;
- (double)tPluggedInWaitInterval;
- (id)dateFormatter;
- (id)defaultDateToDisableUntilGivenDate:(id)a3;
- (id)requiredFullChargeDate;
- (id)sessionEndCECAnalytics;
- (id)status;
- (int64_t)pluggedInBatteryLevel;
- (unint64_t)cecState;
- (unint64_t)currentPhase;
- (unint64_t)currentState;
- (unint64_t)signalID;
- (void)analyticsCECEngagementEvaluation:(BOOL)a3 byPredictedTime:(BOOL)a4 byGridMix:(BOOL)a5;
- (void)analyticsCECSessionChargingState:(BOOL)a3;
- (void)clearAnalyticsDate;
- (void)evaluatePausingNow;
- (void)handleCallback:(id)a3;
- (void)handleChargeUp;
- (void)handleDisengagement;
- (void)handleNewDebugState:(id)a3;
- (void)handleNotificationResponse:(id)a3;
- (void)handlePowerUICECStateChange:(unint64_t)a3 withHandler:(id)a4;
- (void)isPluggedIntoEligiblePowerSource;
- (void)loadState;
- (void)monitorBatteryNotifications;
- (void)promptBDCToQueryCurrentState;
- (void)recordAnalytics;
- (void)recordPowerLogCECState:(unint64_t)a3;
- (void)recordPowerLogEvent;
- (void)refreshShouldSupportCEC;
- (void)registerTimer;
- (void)resetState;
- (void)setAnalyticsManager:(id)a3;
- (void)setBdcDataManager:(id)a3;
- (void)setCecTemporarilyDisabledDate:(id)a3;
- (void)setChargingController:(id)a3;
- (void)setContext:(id)a3;
- (void)setCurrentPhase:(unint64_t)a3;
- (void)setCurrentState:(unint64_t)a3;
- (void)setDefaults:(id)a3;
- (void)setDisplayedFirstTimeNotification:(BOOL)a3;
- (void)setFirstChargingEvaluation:(BOOL)a3;
- (void)setIsCECEnabled:(BOOL)a3;
- (void)setIsCECTemporarilyDisabled:(BOOL)a3;
- (void)setIsChargingPaused:(BOOL)a3;
- (void)setIsInternal:(BOOL)a3;
- (void)setLog:(id)a3;
- (void)setPauseChargingCheckDate:(id)a3;
- (void)setPhaseDescriptions:(id)a3;
- (void)setPluggedInBatteryLevel:(int64_t)a3;
- (void)setPluggedInDate:(id)a3;
- (void)setPluggedInTimeManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setShouldSupportCEC:(BOOL)a3;
- (void)setTOverrideActiveCheck:(BOOL)a3;
- (void)setTPluggedInWaitInterval:(double)a3;
- (void)setTemporarilyDisabled:(BOOL)a3 from:(id)a4;
- (void)setTimer:(id)a3;
- (void)setUserDeadline:(id)a3;
- (void)setupTempDisabledCheckAfterInterval:(double)a3;
- (void)unregisterTimer;
- (void)updatePhaseFrom:(unint64_t)a3 to:(unint64_t)a4;
@end

@implementation PowerUICECManager

- (BOOL)isPluggedIntoEligiblePowerSource
{
  kern_return_t v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v19;
  uint8_t v20[8];
  CFMutableDictionaryRef properties;

  if (!+[PowerUISmartChargeUtilities isPluggedInWithContext:self->_context])return 0; {
  if (self->_isInternal)
  }
  {
    uint64_t v3 = [(NSUserDefaults *)self->_defaults objectForKey:@"testPowerSource"];
    if (v3)
    {
      CFMutableDictionaryRef v4 = (CFMutableDictionaryRef)v3;
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
        [(PowerUICECManager *)log isPluggedIntoEligiblePowerSource];
      }
      char v6 = [(__CFDictionary *)v4 BOOLValue];
LABEL_19:

      return v6;
    }
  }
  mach_port_t v7 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v8 = IOServiceMatching("IOPMPowerSource");
  io_service_t MatchingService = IOServiceGetMatchingService(v7, v8);
  if (MatchingService)
  {
    properties = 0;
    v10 = IORegistryEntryCreateCFProperties(MatchingService, &properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (!v10)
    {
      CFMutableDictionaryRef v4 = properties;
      v13 = [(__CFDictionary *)properties objectForKeyedSubscript:@"FedDetails"];
      v14 = v13;
      if (v13
        && ([v13 objectAtIndexedSubscript:0],
            v15 = objc_claimAutoreleasedReturnValue(),
            [v15 objectForKeyedSubscript:@"FedExternalConnected"],
            v16 = objc_claimAutoreleasedReturnValue(),
            v17 = [v16 BOOLValue],
            v16,
            v15,
            (v17 & 1) == 0))
      {
        v19 = self->_log;
        char v6 = 0;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v20 = 0;
          _os_log_impl(&dword_22135E000, v19, OS_LOG_TYPE_DEFAULT, "Device powering from another device", v20, 2u);
          char v6 = 0;
        }
      }
      else
      {
        char v6 = 1;
      }

      goto LABEL_19;
    }
    v11 = v10;
    v12 = self->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      [(PowerUICECManager *)v11 isPluggedIntoEligiblePowerSource];
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[PowerUICECManager isPluggedIntoEligiblePowerSource]();
  }
  return 1;
}

uint64_t __48__PowerUICECManager_monitorBatteryNotifications__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleCallback:@"Battery state"];
}

void __48__PowerUICECManager_monitorBatteryNotifications__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 56);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__PowerUICECManager_monitorBatteryNotifications__block_invoke_2;
  block[3] = &unk_2645A5CF0;
  block[4] = v1;
  dispatch_async(v2, block);
}

- (BOOL)isEnabled
{
  if (+[PowerUICECManager isCECSupported])
  {
    cecTemporarilyDisabledDate = self->_cecTemporarilyDisabledDate;
    if (cecTemporarilyDisabledDate)
    {
      [(NSDate *)cecTemporarilyDisabledDate timeIntervalSinceNow];
      if (v4 < 0.0) {
        [(PowerUICECManager *)self setTemporarilyDisabled:0 from:0];
      }
    }
    char v5 = self->_isCECEnabled & ~self->_isCECTemporarilyDisabled;
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

- (BOOL)isActiveRegion
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_isInternal)
  {
    if (self->_tPluggedInWaitInterval == 0.0)
    {
      double v5 = 900.0;
    }
    else
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        double tPluggedInWaitInterval = self->_tPluggedInWaitInterval;
        int v8 = 134217984;
        double v9 = tPluggedInWaitInterval;
        _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "TestMode: PluggedInWait set to %lf", (uint8_t *)&v8, 0xCu);
      }
      double v5 = self->_tPluggedInWaitInterval;
    }
    if (self->_tOverrideActiveCheck)
    {
      LOBYTE(v6) = 1;
      return v6;
    }
  }
  else
  {
    double v5 = 900.0;
  }
  if (!self->_shouldSupportCEC) {
    goto LABEL_14;
  }
  BOOL v6 = [(PowerUICECManager *)self isPluggedIntoEligiblePowerSource];
  if (!v6) {
    return v6;
  }
  if (+[PowerUISmartChargeUtilities deviceWasConnectedToChargerWithinSeconds:withContext:](PowerUISmartChargeUtilities, "deviceWasConnectedToChargerWithinSeconds:withContext:", self->_context, v5)|| +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:self->_context] < 30)
  {
LABEL_14:
    LOBYTE(v6) = 0;
    return v6;
  }
  LOBYTE(v6) = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:self->_context] < 75;
  return v6;
}

- (void)handleCallback:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:self->_context];
  BOOL v6 = [(PowerUICECManager *)self isPluggedIntoEligiblePowerSource];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t currentPhase = self->_currentPhase;
    int v25 = 138413058;
    *(void *)v26 = v4;
    *(_WORD *)&v26[8] = 2048;
    unint64_t v27 = currentPhase;
    __int16 v28 = 2048;
    int64_t v29 = v5;
    __int16 v30 = 1024;
    BOOL v31 = v6;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Evaluating state. Trigger: %@ (CurrentPhase %lu batteryLevel %ld, isPluggedIntoEligibleSource %d)", (uint8_t *)&v25, 0x26u);
  }
  p_unint64_t currentPhase = &self->_currentPhase;
  int64_t v9 = self->_currentPhase;
  if (v9 > 19)
  {
    if (v9 == 20)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
        -[PowerUICECManager handleCallback:].cold.6();
      }
    }
    else
    {
      if (v9 != 30)
      {
LABEL_21:
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
          -[PowerUICECManager handleCallback:]();
        }
        goto LABEL_34;
      }
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
        -[PowerUICECManager handleCallback:].cold.5();
      }
    }
  }
  else
  {
    if (v9)
    {
      if (v9 == 10)
      {
        if ([(PowerUICECManager *)self isActiveRegion])
        {
          BOOL v11 = [(PowerUICECPredictedTimeManager *)self->_pluggedInTimeManager hasSufficientTimeForFullCharge];
          v12 = +[PowerUINotificationManager sharedInstance];
          int v13 = [v12 immediateCharge];

          BOOL v14 = [(PowerUICECManager *)self isEnabled];
          BOOL v15 = v14;
          if (v11 && (v13 & 1) == 0 && v14)
          {
            [(PowerUICECManager *)self evaluatePausingNow];
          }
          else
          {
            v16 = self->_log;
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              int v25 = 67109632;
              *(_DWORD *)v26 = v15;
              *(_WORD *)&v26[4] = 1024;
              *(_DWORD *)&v26[6] = v13;
              LOWORD(v27) = 1024;
              *(_DWORD *)((char *)&v27 + 2) = v11;
              _os_log_impl(&dword_22135E000, v16, OS_LOG_TYPE_DEFAULT, "Deciding to Charge up. (isCECEnabled %d, didUserOverride %d, notEnoughTime %d)", (uint8_t *)&v25, 0x14u);
            }
            [(PowerUICECManager *)self handleChargeUp];
          }
        }
        else
        {
          [(PowerUICECManager *)self handleDisengagement];
        }
        goto LABEL_34;
      }
      goto LABEL_21;
    }
    if ([(PowerUICECManager *)self isEnabled])
    {
      if ([(PowerUICECManager *)self isActiveRegion])
      {
        if ([(PowerUICECManager *)self evaluateEngagementAndSetup])
        {
          [(PowerUICECManager *)self updatePhaseFrom:self->_currentPhase to:10];
          [(PowerUICECManager *)self evaluatePausingNow];
          [(PowerUICECManager *)self registerTimer];
        }
        else
        {
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
            -[PowerUICECManager handleCallback:]();
          }
          [(PowerUICECManager *)self updatePhaseFrom:self->_currentPhase to:30];
        }
      }
      else
      {
        v17 = self->_log;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v25) = 0;
          _os_log_impl(&dword_22135E000, v17, OS_LOG_TYPE_DEFAULT, "Not in active region", (uint8_t *)&v25, 2u);
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    {
      -[PowerUICECManager handleCallback:].cold.4();
    }
  }
LABEL_34:
  v18 = self->_log;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[PowerUICECManager handleCallback:]((uint64_t)p_currentPhase, v18, v19, v20, v21, v22, v23, v24);
  }
}

+ (BOOL)isCECSupported
{
  if (!_os_feature_enabled_impl()
    || !+[PowerUISmartChargeUtilities isiPhone])
  {
    return 0;
  }
  v2 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v3 = [v2 countryCode];
  char v4 = [v3 isEqualToString:@"US"];

  return v4;
}

+ (id)monitorWithDelegate:(id)a3
{
  return +[PowerUICECManager manager];
}

- (unint64_t)signalID
{
  return 11;
}

- (id)requiredFullChargeDate
{
  unint64_t currentPhase = self->_currentPhase;
  if (currentPhase) {
    BOOL v3 = currentPhase == 30;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    [MEMORY[0x263EFF910] distantFuture];
  }
  else {
  char v4 = [(NSDate *)self->_userDeadline dateByAddingTimeInterval:(double)0x708uLL];
  }
  return v4;
}

- (void)handleNotificationResponse:(id)a3
{
  char v4 = [a3 actionIdentifier];
  int v5 = [v4 isEqualToString:@"cecChargeUp"];

  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "User requested immediate charge.", buf, 2u);
    }
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__PowerUICECManager_handleNotificationResponse___block_invoke;
    block[3] = &unk_2645A5CF0;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __48__PowerUICECManager_handleNotificationResponse___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handlePowerUICECStateChange:2 withHandler:&__block_literal_global_16];
}

+ (id)fetchEstimatedCountryCode
{
  v2 = os_log_create("com.apple.powerui.cec", "");
  BOOL v3 = [MEMORY[0x263F62D20] currentEstimates];
  if ([v3 count])
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      +[PowerUICECManager fetchEstimatedCountryCode].cold.4();
    }
    char v4 = [v3 objectAtIndexedSubscript:0];
    int v5 = [v4 countryCode];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      +[PowerUICECManager fetchEstimatedCountryCode]();
    }
LABEL_12:
    id v7 = v5;

    BOOL v6 = v3;
    goto LABEL_13;
  }
  BOOL v6 = [MEMORY[0x263F62D20] lastKnownEstimates];

  if ([v6 count])
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      +[PowerUICECManager fetchEstimatedCountryCode]();
    }
    char v4 = [v6 objectAtIndexedSubscript:0];
    int v5 = [v4 countryCode];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      +[PowerUICECManager fetchEstimatedCountryCode]();
    }
    BOOL v3 = v6;
    goto LABEL_12;
  }
  id v7 = 0;
LABEL_13:

  return v7;
}

+ (id)manager
{
  if (+[PowerUICECManager isCECSupported])
  {
    if (manager_onceToken_0 != -1) {
      dispatch_once(&manager_onceToken_0, &__block_literal_global_108);
    }
    id v2 = (id)manager_manager_0;
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

uint64_t __28__PowerUICECManager_manager__block_invoke()
{
  manager_manager_0 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (PowerUICECManager)init
{
  v60[4] = *MEMORY[0x263EF8340];
  v58.receiver = self;
  v58.super_class = (Class)PowerUICECManager;
  id v2 = [(PowerUICECManager *)&v58 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.powerui.cec", "");
    char v4 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v3;

    *((unsigned char *)v2 + 15) = +[PowerUISmartChargeUtilities isInternalBuild];
    v59[0] = &unk_26D385978;
    v59[1] = &unk_26D385990;
    v60[0] = @"Not Evaluated";
    v60[1] = @"Engaged";
    v59[2] = &unk_26D3859A8;
    v59[3] = &unk_26D3859C0;
    v60[2] = @"Charge Up";
    v60[3] = @"Evaluated and Not Engaged";
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:4];
    BOOL v6 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v5;

    [v2 refreshShouldSupportCEC];
    uint64_t v7 = +[PowerUIChargingController sharedInstance];
    int v8 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v7;

    uint64_t v9 = +[PowerUIAnalyticsManager sharedInstance];
    uint64_t v10 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v9;

    uint64_t v11 = [MEMORY[0x263F351B8] userContext];
    v12 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.powerui.cec"];
    BOOL v14 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v13;

    BOOL v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.powerui.cecmanager.queue", v15);
    v17 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v16;

    dispatch_source_t v18 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *((dispatch_queue_t *)v2 + 7));
    uint64_t v19 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v18;

    uint64_t v20 = *((void *)v2 + 14);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __25__PowerUICECManager_init__block_invoke;
    handler[3] = &unk_2645A5CF0;
    uint64_t v21 = v2;
    id v57 = v21;
    dispatch_source_set_event_handler(v20, handler);
    [v21 loadState];
    if (v21[3] == 10) {
      [v21 registerTimer];
    }
    [v21 monitorBatteryNotifications];
    uint64_t v22 = +[PowerUIBDCDataManager sharedInstance];
    uint64_t v23 = (void *)v21[19];
    v21[19] = v22;

    uint64_t v24 = *((void *)v2 + 5);
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __25__PowerUICECManager_init__block_invoke_2;
    v54[3] = &unk_2645A5CF0;
    int v25 = v21;
    id v55 = v25;
    uint64_t v26 = +[PowerUICECPredictedTimeManager managerWithContextStore:v24 withHandler:v54];
    unint64_t v27 = (void *)v25[10];
    v25[10] = v26;

    __int16 v28 = *((void *)v2 + 7);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __25__PowerUICECManager_init__block_invoke_4;
    block[3] = &unk_2645A5CF0;
    int64_t v29 = v25;
    id v53 = v29;
    dispatch_async(v28, block);
    int out_token = 0;
    __int16 v30 = *((void *)v2 + 7);
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __25__PowerUICECManager_init__block_invoke_5;
    v49[3] = &unk_2645A5CA8;
    BOOL v31 = v29;
    id v50 = v31;
    notify_register_dispatch("com.apple.powerui.cec.notification", &out_token, v30, v49);
    int v48 = 0;
    uint64_t v32 = *((void *)v2 + 7);
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __25__PowerUICECManager_init__block_invoke_6;
    v46[3] = &unk_2645A5CA8;
    v33 = v31;
    id v47 = v33;
    notify_register_dispatch("com.apple.powerui.cec.powerLogDonation", &v48, v32, v46);
    int v45 = 0;
    v34 = (const char *)[ (id) *MEMORY[0x263F62D28] UTF8String];
    v35 = *((void *)v2 + 7);
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __25__PowerUICECManager_init__block_invoke_7;
    v43[3] = &unk_2645A5CA8;
    v36 = v33;
    id v44 = v36;
    notify_register_dispatch(v34, &v45, v35, v43);
    int v42 = 0;
    v37 = *((void *)v2 + 7);
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __25__PowerUICECManager_init__block_invoke_8;
    v40[3] = &unk_2645A5CA8;
    v38 = v36;
    id v41 = v38;
    notify_register_dispatch("com.apple.powerui.cec.checkForEligiblePowerSource", &v42, v37, v40);
    v38[13] = 1;
  }
  return (PowerUICECManager *)v2;
}

uint64_t __25__PowerUICECManager_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleCallback:@"Timer"];
}

void __25__PowerUICECManager_init__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = v1[7];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__PowerUICECManager_init__block_invoke_3;
  block[3] = &unk_2645A5CF0;
  char v4 = v1;
  dispatch_async(v2, block);
}

uint64_t __25__PowerUICECManager_init__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleCallback:@"PluggedIn Prediction"];
}

uint64_t __25__PowerUICECManager_init__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleCallback:@"Boot up"];
}

void __25__PowerUICECManager_init__block_invoke_5(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  if (state64 == 2)
  {
    os_log_t v3 = +[PowerUINotificationManager sharedInstance];
    id v5 = (id)[v3 postCECEngagedNotificationWithDate:*(void *)(*(void *)(a1 + 32) + 16)];
  }
  else
  {
    if (state64 != 1) {
      return;
    }
    os_log_t v3 = +[PowerUINotificationManager sharedInstance];
    id v4 = (id)[v3 postCECFirstTimeNotification];
  }
}

uint64_t __25__PowerUICECManager_init__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) recordPowerLogEvent];
}

uint64_t __25__PowerUICECManager_init__block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshShouldSupportCEC];
}

void __25__PowerUICECManager_init__block_invoke_8(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v3 = *(void **)(a1 + 32);
    id v4 = v2;
    v5[0] = 67109120;
    v5[1] = [v3 isPluggedIntoEligiblePowerSource];
    _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_DEFAULT, "Is Power source eligible: %d", (uint8_t *)v5, 8u);
  }
}

- (void)refreshShouldSupportCEC
{
  if (+[PowerUICECManager isCECSupported])
  {
    os_log_t v3 = +[PowerUICECManager fetchEstimatedCountryCode];
    if (v3) {
      char v4 = [v3 isEqualToString:@"US"];
    }
    else {
      char v4 = 1;
    }
    self->_shouldSupportCEC = v4;
    MEMORY[0x270F9A758]();
  }
  else
  {
    self->_shouldSupportCEC = 0;
  }
}

- (void)loadState
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  os_log_t v3 = [(NSUserDefaults *)self->_defaults stringForKey:@"bootUUIDOnLastInit"];
  char v4 = [(NSUserDefaults *)self->_defaults stringForKey:@"debugStatus"];
  debugStatus = self->_debugStatus;
  self->_debugStatus = v4;

  uint64_t v6 = +[PowerUISmartChargeUtilities getCurrentBootSessionUUID];
  int v7 = [v6 isEqualToString:v3];
  [(NSUserDefaults *)self->_defaults setObject:v6 forKey:@"bootUUIDOnLastInit"];
  int v8 = self->_log;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = NSNumber;
    uint64_t v10 = v8;
    uint64_t v11 = [v9 numberWithBool:v7 ^ 1u];
    *(_DWORD *)buf = 138412290;
    id v53 = v11;
    _os_log_impl(&dword_22135E000, v10, OS_LOG_TYPE_DEFAULT, "CECManager initializing. Was the device restarted: %@", buf, 0xCu);
  }
  if ((v7 & 1) == 0) {
    [(PowerUICECManager *)self resetState];
  }
  self->_unint64_t currentPhase = [(NSUserDefaults *)self->_defaults integerForKey:@"currentPhase"];
  v12 = [(NSUserDefaults *)self->_defaults objectForKey:@"userDeadline"];
  uint64_t v13 = v12;
  if (v12)
  {
    BOOL v14 = (void *)MEMORY[0x263EFF910];
    [v12 doubleValue];
    objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
    BOOL v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
    userDeadline = self->_userDeadline;
    self->_userDeadline = v15;
  }
  v17 = [(NSUserDefaults *)self->_defaults objectForKey:@"pluggedInDateInterval"];

  if (v17)
  {
    dispatch_source_t v18 = (void *)MEMORY[0x263EFF910];
    [v17 doubleValue];
    objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
    pluggedInDate = self->_pluggedInDate;
    self->_pluggedInDate = v19;
  }
  uint64_t v21 = [(NSUserDefaults *)self->_defaults objectForKey:@"pluggedInBatteryLevel"];

  if (v21) {
    self->_pluggedInBatteryLevel = (int)[v21 intValue];
  }
  uint64_t v22 = [(NSUserDefaults *)self->_defaults objectForKey:@"currentState"];

  if (v22)
  {
    unint64_t v23 = [v22 unsignedIntegerValue];
  }
  else
  {
    if (!+[PowerUICECManager isCECSupported]) {
      goto LABEL_16;
    }
    unint64_t v23 = 1;
  }
  self->_currentState = v23;
LABEL_16:
  uint64_t v24 = [(NSUserDefaults *)self->_defaults objectForKey:@"tempDisabledInterval"];

  if (v24)
  {
    int v25 = (void *)MEMORY[0x263EFF910];
    [v24 doubleValue];
    objc_msgSend(v25, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v26 = (NSDate *)objc_claimAutoreleasedReturnValue();
    cecTemporarilyDisabledDate = self->_cecTemporarilyDisabledDate;
    self->_cecTemporarilyDisabledDate = v26;

    [(NSDate *)self->_cecTemporarilyDisabledDate timeIntervalSinceNow];
    if (v28 <= 0.0)
    {
      [(NSDate *)self->_cecTemporarilyDisabledDate timeIntervalSinceNow];
      -[PowerUICECManager setupTempDisabledCheckAfterInterval:](self, "setupTempDisabledCheckAfterInterval:");
    }
    else
    {
      self->_isCECTemporarilyDisabled = 1;
    }
  }
  int64_t v29 = [(NSUserDefaults *)self->_defaults objectForKey:@"disabled"];

  if (v29) {
    int v30 = [v29 BOOLValue] ^ 1;
  }
  else {
    LOBYTE(v30) = 1;
  }
  self->_isCECEnabled = v30;
  BOOL v31 = [(NSUserDefaults *)self->_defaults objectForKey:@"pauseChargingCheckDate"];

  if (v31)
  {
    uint64_t v32 = (void *)MEMORY[0x263EFF910];
    [v31 doubleValue];
    objc_msgSend(v32, "dateWithTimeIntervalSinceReferenceDate:");
    v33 = (NSDate *)objc_claimAutoreleasedReturnValue();
    pauseChargingCheckDate = self->_pauseChargingCheckDate;
    self->_pauseChargingCheckDate = v33;
  }
  v35 = [(NSUserDefaults *)self->_defaults objectForKey:@"testPluggedInWait"];

  if (v35)
  {
    [(NSUserDefaults *)self->_defaults doubleForKey:@"testPluggedInWait"];
    self->_double tPluggedInWaitInterval = v36;
  }
  v37 = [(NSUserDefaults *)self->_defaults objectForKey:@"firstTime"];

  if (v37) {
    self->_displayedFirstTimeNotification = [(NSUserDefaults *)self->_defaults BOOLForKey:@"firstTime"];
  }
  v38 = [(NSUserDefaults *)self->_defaults objectForKey:@"testOverrideActiveCheck"];
  v39 = v38;
  if (v38) {
    self->_tOverrideActiveCheck = [v38 BOOLValue];
  }
  v40 = self->_log;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    id v41 = NSNumber;
    unint64_t currentPhase = self->_currentPhase;
    log = v40;
    v43 = [v41 numberWithUnsignedInteger:currentPhase];
    id v44 = [NSNumber numberWithUnsignedInteger:self->_currentState];
    int v45 = self->_userDeadline;
    v46 = v6;
    id v47 = v3;
    int v48 = self->_cecTemporarilyDisabledDate;
    v49 = [NSNumber numberWithBool:self->_isCECEnabled];
    id v50 = self->_pauseChargingCheckDate;
    *(_DWORD *)buf = 138413570;
    id v53 = v43;
    __int16 v54 = 2112;
    id v55 = v44;
    __int16 v56 = 2112;
    id v57 = v45;
    __int16 v58 = 2112;
    v59 = v48;
    os_log_t v3 = v47;
    uint64_t v6 = v46;
    __int16 v60 = 2112;
    v61 = v49;
    __int16 v62 = 2112;
    v63 = v50;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "CECManager Loaded state. Phase %@, State %@, User Deadline %@, TempDisabledDate %@, isCECEnabled %@, pauseChargingCheckDate %@", buf, 0x3Eu);
  }
}

- (id)status
{
  os_log_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  char v4 = [NSNumber numberWithUnsignedInteger:self->_currentPhase];
  [v3 setObject:v4 forKeyedSubscript:@"CECCurrentPhase"];

  id v5 = [NSNumber numberWithBool:self->_isChargingPaused];
  [v3 setObject:v5 forKeyedSubscript:@"CECChargingPaused"];

  phaseDescriptions = self->_phaseDescriptions;
  int v7 = [NSNumber numberWithUnsignedInteger:self->_currentPhase];
  int v8 = [(NSDictionary *)phaseDescriptions objectForKeyedSubscript:v7];

  if (v8)
  {
    uint64_t v9 = self->_phaseDescriptions;
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:self->_currentPhase];
    uint64_t v11 = [(NSDictionary *)v9 objectForKeyedSubscript:v10];
    [v3 setObject:v11 forKeyedSubscript:@"CECCurrentPhaseString"];
  }
  userDeadline = self->_userDeadline;
  if (userDeadline) {
    [v3 setObject:userDeadline forKeyedSubscript:@"CECUserDeadline"];
  }
  pauseChargingCheckDate = self->_pauseChargingCheckDate;
  if (pauseChargingCheckDate) {
    [v3 setObject:pauseChargingCheckDate forKeyedSubscript:@"CECCheckDate"];
  }
  return v3;
}

- (void)monitorBatteryNotifications
{
  os_log_t v3 = (void *)MEMORY[0x263F351F8];
  char v4 = [MEMORY[0x263F351D0] keyPathForBatteryStateDataDictionary];
  id v5 = [MEMORY[0x263F351D0] keyPathForBatteryStateDataDictionary];
  uint64_t v6 = [MEMORY[0x263F351D0] keyPathForForegroundApp];
  int v7 = [v3 predicateForKeyPath:v4, @"(SELF.%@.value.externalConnected = %@) AND NOT (SELF.%@.value = %@)", v5, MEMORY[0x263EFFA88], v6, @"com.apple.camera" withFormat];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __48__PowerUICECManager_monitorBatteryNotifications__block_invoke;
  v14[3] = &unk_2645A61C0;
  v14[4] = self;
  int v8 = [MEMORY[0x263F351E8] localWakingRegistrationWithIdentifier:@"com.apple.powerui.cec.battery" contextualPredicate:v7 clientIdentifier:@"com.apple.powerui.cec.batteryState" callback:v14];
  [(_CDLocalContext *)self->_context registerCallback:v8];
  uint64_t v9 = (void *)MEMORY[0x263F351F8];
  uint64_t v10 = [MEMORY[0x263F351D0] keyPathForPluginStatus];
  uint64_t v11 = [v9 predicateForChangeAtKeyPath:v10];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__PowerUICECManager_monitorBatteryNotifications__block_invoke_3;
  v13[3] = &unk_2645A61C0;
  v13[4] = self;
  v12 = [MEMORY[0x263F351E8] localWakingRegistrationWithIdentifier:@"com.apple.powerui.cec.unplug" contextualPredicate:v11 clientIdentifier:@"com.apple.powerui.cec.pluggedIn" callback:v13];
  [(_CDLocalContext *)self->_context registerCallback:v12];
}

void __48__PowerUICECManager_monitorBatteryNotifications__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 56);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__PowerUICECManager_monitorBatteryNotifications__block_invoke_4;
  block[3] = &unk_2645A5CF0;
  void block[4] = v1;
  dispatch_async(v2, block);
}

void __48__PowerUICECManager_monitorBatteryNotifications__block_invoke_4(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  BOOL v2 = +[PowerUISmartChargeUtilities isPluggedInWithContext:*(void *)(*(void *)(a1 + 32) + 40)];
  os_log_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    char v4 = v3[4];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = 1;
      _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_DEFAULT, "Plugged In %d", buf, 8u);
    }
    uint64_t v5 = *(void *)(a1 + 32);
    if (!*(void *)(v5 + 136))
    {
      uint64_t v6 = *(void **)(v5 + 40);
      int v7 = [MEMORY[0x263F351D0] keyPathForPluginStatus];
      int v8 = [v6 lastModifiedDateForContextualKeyPath:v7];

      uint64_t v9 = *(NSObject **)(*(void *)(a1 + 32) + 32);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v25 = (int64_t)v8;
        _os_log_impl(&dword_22135E000, v9, OS_LOG_TYPE_DEFAULT, "Setting pluggedIn date to %@", buf, 0xCu);
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 136), v8);
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void **)(v10 + 88);
      [*(id *)(v10 + 136) timeIntervalSinceReferenceDate];
      objc_msgSend(v11, "setDouble:forKey:", @"pluggedInDateInterval");
      int64_t v12 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:*(void *)(*(void *)(a1 + 32) + 40)];
      uint64_t v13 = *(NSObject **)(*(void *)(a1 + 32) + 32);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v25 = v12;
        _os_log_impl(&dword_22135E000, v13, OS_LOG_TYPE_DEFAULT, "Setting pluggedIn battery level to %ld", buf, 0xCu);
      }
      *(void *)(*(void *)(a1 + 32) + 144) = v12;
      [*(id *)(*(void *)(a1 + 32) + 88) setInteger:*(void *)(*(void *)(a1 + 32) + 144) forKey:@"pluggedInBatteryLevel"];

      uint64_t v5 = *(void *)(a1 + 32);
    }
    if (!*(unsigned char *)(v5 + 9))
    {
      if ([(id)v5 isEnabled])
      {
        if (+[PowerUICECManager isCECSupported])
        {
          uint64_t v14 = *(void *)(a1 + 32);
          if (*(unsigned char *)(v14 + 14))
          {
            BOOL v15 = [*(id *)(v14 + 88) objectForKey:@"firstTime"];
            dispatch_queue_t v16 = v15;
            if (v15) {
              *(unsigned char *)(*(void *)(a1 + 32) + 9) = [v15 BOOLValue];
            }
            v17 = *(unsigned char **)(a1 + 32);
            if (!v17[9])
            {
              if ([v17 shouldEngageCEC])
              {
                dispatch_source_t v18 = +[PowerUINotificationManager sharedInstance];
                id v19 = (id)[v18 postCECFirstTimeNotification];

                [*(id *)(*(void *)(a1 + 32) + 88) setBool:1 forKey:@"firstTime"];
                *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
              }
            }
          }
        }
      }
    }
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v21 = *(NSObject **)(v20 + 56);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__PowerUICECManager_monitorBatteryNotifications__block_invoke_195;
    block[3] = &unk_2645A5CF0;
    void block[4] = v20;
    dispatch_async(v21, block);
  }
  else
  {
    [v3 recordAnalytics];
    uint64_t v22 = *(void **)(a1 + 32);
    [v22 resetState];
  }
}

uint64_t __48__PowerUICECManager_monitorBatteryNotifications__block_invoke_195(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleCallback:@"PluggedIn state"];
}

- (void)registerTimer
{
  timer = self->_timer;
  dispatch_time_t v4 = dispatch_walltime(0, 300000000000);
  dispatch_source_set_timer(timer, v4, 0x45D964B800uLL, 0xDF8475800uLL);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__PowerUICECManager_registerTimer__block_invoke;
  block[3] = &unk_2645A5CF0;
  void block[4] = self;
  if (registerTimer_timerToken != -1) {
    dispatch_once(&registerTimer_timerToken, block);
  }
}

void __34__PowerUICECManager_registerTimer__block_invoke(uint64_t a1)
{
}

- (void)unregisterTimer
{
}

- (void)setupTempDisabledCheckAfterInterval:(double)a3
{
  dispatch_time_t v4 = dispatch_walltime(0, (uint64_t)(a3 * 1000000000.0));
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__PowerUICECManager_setupTempDisabledCheckAfterInterval___block_invoke;
  block[3] = &unk_2645A5CF0;
  void block[4] = self;
  dispatch_after(v4, queue, block);
}

uint64_t __57__PowerUICECManager_setupTempDisabledCheckAfterInterval___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTemporarilyDisabled:0 from:0];
}

- (id)defaultDateToDisableUntilGivenDate:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (defaultDateToDisableUntilGivenDate__onceToken_1 != -1) {
    dispatch_once(&defaultDateToDisableUntilGivenDate__onceToken_1, &__block_literal_global_200);
  }
  uint64_t v5 = [(id)defaultDateToDisableUntilGivenDate__calendar_1 components:60 fromDate:v4];
  if ([v5 hour] >= 6) {
    objc_msgSend(v5, "setDay:", objc_msgSend(v5, "day") + 1);
  }
  [v5 setHour:6];
  uint64_t v6 = [(id)defaultDateToDisableUntilGivenDate__calendar_1 dateFromComponents:v5];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Feature disabled until: %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

uint64_t __56__PowerUICECManager_defaultDateToDisableUntilGivenDate___block_invoke()
{
  defaultDateToDisableUntilGivenDate__calendar_1 = [MEMORY[0x263EFF8F0] currentCalendar];
  return MEMORY[0x270F9A758]();
}

- (BOOL)isEngaged
{
  return self->_currentPhase == 10;
}

- (BOOL)hasInfluencedCharging
{
  unint64_t currentPhase = self->_currentPhase;
  return currentPhase == 10 || currentPhase == 20;
}

- (unint64_t)cecState
{
  return self->_currentState;
}

- (void)setTemporarilyDisabled:(BOOL)a3 from:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a3)
  {
    if (!self->_isCECTemporarilyDisabled)
    {
      self->_isCECTemporarilyDisabled = 1;
      int v7 = [(PowerUICECManager *)self defaultDateToDisableUntilGivenDate:v6];
      cecTemporarilyDisabledDate = self->_cecTemporarilyDisabledDate;
      self->_cecTemporarilyDisabledDate = v7;

      [(NSDate *)self->_cecTemporarilyDisabledDate timeIntervalSinceNow];
      -[PowerUICECManager setupTempDisabledCheckAfterInterval:](self, "setupTempDisabledCheckAfterInterval:");
      defaults = self->_defaults;
      [(NSDate *)self->_cecTemporarilyDisabledDate timeIntervalSinceReferenceDate];
      -[NSUserDefaults setDouble:forKey:](defaults, "setDouble:forKey:", @"tempDisabledInterval");
    }
  }
  else
  {
    if ((self->_currentState & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Enabling CEC from temporarily disabled", (uint8_t *)&v17, 2u);
      }
      self->_unint64_t currentState = 1;
      [(PowerUICECManager *)self recordPowerLogCECState:1];
      uint64_t v11 = self->_log;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v12 = NSNumber;
        unint64_t currentState = self->_currentState;
        uint64_t v14 = v11;
        BOOL v15 = [v12 numberWithUnsignedInteger:currentState];
        int v17 = 138412290;
        dispatch_source_t v18 = v15;
        _os_log_impl(&dword_22135E000, v14, OS_LOG_TYPE_DEFAULT, "CEC State set to: %@", (uint8_t *)&v17, 0xCu);
      }
      [(NSUserDefaults *)self->_defaults setInteger:self->_currentState forKey:@"currentState"];
    }
    self->_isCECTemporarilyDisabled = 0;
    dispatch_queue_t v16 = self->_cecTemporarilyDisabledDate;
    self->_cecTemporarilyDisabledDate = 0;

    [(NSUserDefaults *)self->_defaults removeObjectForKey:@"tempDisabledInterval"];
  }
}

- (void)handlePowerUICECStateChange:(unint64_t)a3 withHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = NSNumber;
    int v9 = log;
    uint64_t v10 = [v8 numberWithUnsignedInteger:a3];
    *(_DWORD *)buf = 138412290;
    int v17 = v10;
    _os_log_impl(&dword_22135E000, v9, OS_LOG_TYPE_DEFAULT, "CEC State: %@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__PowerUICECManager_handlePowerUICECStateChange_withHandler___block_invoke;
  block[3] = &unk_2645A6D78;
  id v14 = v6;
  unint64_t v15 = a3;
  void block[4] = self;
  id v12 = v6;
  dispatch_async(queue, block);
}

void __61__PowerUICECManager_handlePowerUICECStateChange_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 4)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v31 = [MEMORY[0x263F087E8] errorWithDomain:@"PowerUISmartChargingErrorDomain" code:1 userInfo:0];
    (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
  }
  else
  {
    switch(v2)
    {
      case 0uLL:
        *(void *)(*(void *)(a1 + 32) + 128) = 0;
        *(unsigned char *)(*(void *)(a1 + 32) + 10) = 0;
        [*(id *)(*(void *)(a1 + 32) + 88) setBool:1 forKey:@"disabled"];
        uint64_t v3 = *(void *)(a1 + 32);
        id v4 = *(void **)(v3 + 104);
        uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", *(void *)(v3 + 40)));
        uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
        int v7 = v4;
        int v8 = v5;
        uint64_t v9 = 4;
        goto LABEL_14;
      case 1uLL:
        *(void *)(*(void *)(a1 + 32) + 128) = 1;
        *(unsigned char *)(*(void *)(a1 + 32) + 10) = 1;
        [*(id *)(*(void *)(a1 + 32) + 88) removeObjectForKey:@"disabled"];
        [*(id *)(a1 + 32) setTemporarilyDisabled:0 from:0];
        uint64_t v16 = *(void *)(a1 + 32);
        int v17 = *(void **)(v16 + 104);
        uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", *(void *)(v16 + 40)));
        uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
        int v7 = v17;
        int v8 = v5;
        uint64_t v9 = 5;
        goto LABEL_14;
      case 2uLL:
        uint64_t v18 = *(void *)(a1 + 32);
        if (*(void *)(v18 + 24) != 10) {
          goto LABEL_12;
        }
        *(void *)(v18 + 128) = 2;
        uint64_t v19 = *(void **)(a1 + 32);
        uint64_t v5 = [MEMORY[0x263EFF910] date];
        [v19 setTemporarilyDisabled:1 from:v5];
        goto LABEL_15;
      case 3uLL:
        *(void *)(*(void *)(a1 + 32) + 128) = 3;
        uint64_t v22 = *(void **)(a1 + 32);
        unint64_t v23 = [MEMORY[0x263EFF910] date];
        [v22 setTemporarilyDisabled:1 from:v23];

        uint64_t v24 = *(void *)(a1 + 32);
        int64_t v25 = *(void **)(v24 + 104);
        uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", *(void *)(v24 + 40)));
        uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
        int v7 = v25;
        int v8 = v5;
        uint64_t v9 = 3;
LABEL_14:
        [v7 submitEngagementEventWithBatteryLevel:v8 targetSoC:0 predictedEndOfCharge:v6 modeOfOperation:1 eventType:v9];
LABEL_15:

        uint64_t v26 = *(NSObject **)(*(void *)(a1 + 32) + 32);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v27 = NSNumber;
          uint64_t v28 = *(void *)(*(void *)(a1 + 32) + 128);
          int64_t v29 = v26;
          int v30 = [v27 numberWithUnsignedInteger:v28];
          *(_DWORD *)buf = 138412290;
          v33 = v30;
          _os_log_impl(&dword_22135E000, v29, OS_LOG_TYPE_DEFAULT, "CEC State set to: %@", buf, 0xCu);
        }
        [*(id *)(*(void *)(a1 + 32) + 88) setInteger:*(void *)(*(void *)(a1 + 32) + 128) forKey:@"currentState"];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        [*(id *)(a1 + 32) recordPowerLogCECState:*(void *)(*(void *)(a1 + 32) + 128)];
        [*(id *)(a1 + 32) handleCallback:@"User"];
        break;
      default:
        uint64_t v11 = *(NSObject **)(*(void *)(a1 + 32) + 32);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = NSNumber;
          uint64_t v13 = *(void *)(a1 + 48);
          id v14 = v11;
          unint64_t v15 = [v12 numberWithUnsignedInteger:v13];
          *(_DWORD *)buf = 138412290;
          v33 = v15;
          _os_log_impl(&dword_22135E000, v14, OS_LOG_TYPE_DEFAULT, "Unsupported CEC State: %@", buf, 0xCu);
        }
LABEL_12:
        uint64_t v20 = *(void *)(a1 + 40);
        uint64_t v21 = [MEMORY[0x263F087E8] errorWithDomain:@"PowerUISmartChargingErrorDomain" code:1 userInfo:0];
        (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v21);

        break;
    }
  }
}

- (void)updatePhaseFrom:(unint64_t)a3 to:(unint64_t)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int64_t v7 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:self->_context];
  BOOL v8 = [(PowerUICECManager *)self isPluggedIntoEligiblePowerSource];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    phaseDescriptions = self->_phaseDescriptions;
    uint64_t v11 = NSNumber;
    id v12 = log;
    uint64_t v13 = [v11 numberWithUnsignedInteger:a3];
    id v14 = [(NSDictionary *)phaseDescriptions objectForKeyedSubscript:v13];
    unint64_t v15 = self->_phaseDescriptions;
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:a4];
    int v17 = [(NSDictionary *)v15 objectForKeyedSubscript:v16];
    int v20 = 134219266;
    unint64_t v21 = a3;
    __int16 v22 = 2048;
    unint64_t v23 = a4;
    __int16 v24 = 2112;
    int64_t v25 = v14;
    __int16 v26 = 2112;
    unint64_t v27 = v17;
    __int16 v28 = 2048;
    int64_t v29 = v7;
    __int16 v30 = 1024;
    BOOL v31 = v8;
    _os_log_impl(&dword_22135E000, v12, OS_LOG_TYPE_DEFAULT, "CEC Phase update from %lu to %lu (%@ --> %@); BatteryLevel %ld, PluggedIntoEligibleSource %d",
      (uint8_t *)&v20,
      0x3Au);
  }
  self->_unint64_t currentPhase = a4;
  [(NSUserDefaults *)self->_defaults setInteger:a4 forKey:@"currentPhase"];
  if (self->_currentPhase != 10)
  {
    [(PowerUIChargingController *)self->_chargingController clearChargeLimitForLimitType:4];
    analyticsManager = self->_analyticsManager;
    uint64_t v19 = [NSNumber numberWithInteger:v7];
    [(PowerUIAnalyticsManager *)analyticsManager submitEngagementEventWithBatteryLevel:v19 targetSoC:0 predictedEndOfCharge:self->_userDeadline modeOfOperation:1 eventType:9];

    self->_isChargingPaused = 0;
  }
  [(PowerUICECManager *)self recordPowerLogEvent];
  [(PowerUICECManager *)self promptBDCToQueryCurrentState];
}

- (void)promptBDCToQueryCurrentState
{
  id v4 = [(PowerUIBDCDataManager *)self->_bdcDataManager getBDCDataDictTemplate];
  [v4 setObject:&unk_26D3859D8 forKeyedSubscript:@"ChargingState"];
  [v4 setObject:&unk_26D3859D8 forKeyedSubscript:@"InflowState"];
  [v4 setObject:&unk_26D3859F0 forKeyedSubscript:@"ChargeLimit"];
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:self->_currentPhase];
  [v4 setObject:v3 forKeyedSubscript:@"CheckPoint"];

  [v4 setObject:&unk_26D385A08 forKeyedSubscript:@"ModeOfOperation"];
  [v4 setObject:&unk_26D3859D8 forKeyedSubscript:@"DecisionMaker"];
  [(PowerUIBDCDataManager *)self->_bdcDataManager promptBDCToQueryState:v4];
}

- (void)handleDisengagement
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_22135E000, v0, OS_LOG_TYPE_ERROR, "Battery level below %ld post engagement", v1, 0xCu);
}

- (void)handleChargeUp
{
  uint64_t v3 = +[PowerUINotificationManager sharedInstance];
  [v3 removeCECNotifications];

  [(PowerUICECManager *)self updatePhaseFrom:self->_currentPhase to:20];
  [(PowerUICECPredictedTimeManager *)self->_pluggedInTimeManager stopAllMonitoring];
  [(PowerUICECManager *)self unregisterTimer];
}

- (void)evaluatePausingNow
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  pauseChargingCheckDate = self->_pauseChargingCheckDate;
  if (pauseChargingCheckDate)
  {
    [(NSDate *)pauseChargingCheckDate timeIntervalSinceNow];
    if (v4 > -300.0)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 134217984;
        uint64_t v27 = 5;
        _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Evaluated pausing in last %lu mins. Skipping", (uint8_t *)&v26, 0xCu);
      }
      return;
    }
  }
  int isChargingPaused = self->_isChargingPaused;
  int64_t v7 = +[PowerUICECGridDataManager sharedInstance];
  int v8 = [v7 shouldChargeNow];

  uint64_t v9 = self->_log;
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_22135E000, v9, OS_LOG_TYPE_DEFAULT, "CEC Engaged : Charging up", (uint8_t *)&v26, 2u);
    }
    uint64_t v11 = +[PowerUINotificationManager sharedInstance];
    [v11 removeCECPausedNotification];

    [(PowerUIChargingController *)self->_chargingController clearChargeLimitForLimitType:4];
    if (!self->_isChargingPaused
      || (analyticsManager = self->_analyticsManager,
          objc_msgSend(NSNumber, "numberWithInteger:", +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", self->_context)), uint64_t v13 = objc_claimAutoreleasedReturnValue(), -[PowerUIAnalyticsManager submitEngagementEventWithBatteryLevel:targetSoC:predictedEndOfCharge:modeOfOperation:eventType:](analyticsManager, "submitEngagementEventWithBatteryLevel:targetSoC:predictedEndOfCharge:modeOfOperation:eventType:", v13, 0, self->_userDeadline, 1, 9), v13, !self->_isChargingPaused))
    {
      if (!self->_firstChargingEvaluation)
      {
        BOOL v16 = 0;
        goto LABEL_20;
      }
    }
    id v14 = +[PowerUINotificationManager sharedInstance];
    id v15 = (id)[v14 postInternalCECNotificationWithID:@"chargingStatus" chargingStatus:1 information:@"Lower carbon emission electricity is available right now!" shouldReplace:1];
    BOOL v16 = 0;
  }
  else
  {
    if (v10)
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_22135E000, v9, OS_LOG_TYPE_DEFAULT, "CEC Engaged : Charging paused", (uint8_t *)&v26, 2u);
    }
    int v17 = +[PowerUINotificationManager sharedInstance];
    id v18 = (id)[v17 postCECEngagedNotificationWithDate:self->_userDeadline];

    int64_t v19 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:self->_context];
    if ([(PowerUIChargingController *)self->_chargingController setChargeLimitTo:v19 forLimitType:4])
    {
      int v20 = self->_analyticsManager;
      unint64_t v21 = [NSNumber numberWithInteger:v19];
      [(PowerUIAnalyticsManager *)v20 submitEngagementEventWithBatteryLevel:v21 targetSoC:0 predictedEndOfCharge:self->_userDeadline modeOfOperation:1 eventType:8];
    }
    if (self->_isChargingPaused && !self->_firstChargingEvaluation)
    {
      BOOL v16 = 1;
      goto LABEL_20;
    }
    id v14 = +[PowerUINotificationManager sharedInstance];
    BOOL v16 = 1;
    id v22 = (id)[v14 postInternalCECNotificationWithID:@"chargingStatus" chargingStatus:0 information:@"Lower carbon emission electricity is available in future." shouldReplace:1];
  }

LABEL_20:
  self->_int isChargingPaused = v16;
  if (isChargingPaused != (v8 ^ 1))
  {
    -[PowerUICECManager analyticsCECSessionChargingState:](self, "analyticsCECSessionChargingState:");
    [(PowerUICECManager *)self recordPowerLogEvent];
    [(PowerUICECManager *)self promptBDCToQueryCurrentState];
  }
  self->_firstChargingEvaluation = 0;
  unint64_t v23 = [MEMORY[0x263EFF910] date];
  __int16 v24 = self->_pauseChargingCheckDate;
  self->_pauseChargingCheckDate = v23;

  defaults = self->_defaults;
  [(NSDate *)self->_pauseChargingCheckDate timeIntervalSinceReferenceDate];
  -[NSUserDefaults setDouble:forKey:](defaults, "setDouble:forKey:", @"pauseChargingCheckDate");
}

- (BOOL)shouldEngageCEC
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  int64_t v3 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:self->_context];
  double v4 = +[PowerUISmartChargeUtilities lastPluggedInDate];
  uint64_t v5 = NSString;
  uint64_t v6 = [MEMORY[0x263F08790] localizedStringFromDate:v4 dateStyle:1 timeStyle:1];
  int64_t v7 = (void *)MEMORY[0x263F08790];
  int v8 = [MEMORY[0x263EFF910] date];
  uint64_t v9 = [v7 localizedStringFromDate:v8 dateStyle:1 timeStyle:1];
  BOOL v10 = [v5 stringWithFormat:@"BatteryLevel %ld, PluggedIn at %@ Evaluated at %@", v3, v6, v9];

  uint64_t v11 = [NSString stringWithFormat:@"\n%@", v10];
  debugStatus = self->_debugStatus;
  self->_debugStatus = v11;

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Evaluating engagement for current session", buf, 2u);
  }

  BOOL v14 = [(PowerUICECPredictedTimeManager *)self->_pluggedInTimeManager hasSufficientTimeForFullCharge];
  BOOL v15 = v14;
  if (v14)
  {
    [(PowerUICECPredictedTimeManager *)self->_pluggedInTimeManager timeToFullChargeFromBatteryLevel:80];
    double v17 = v16;
    id v18 = [(PowerUICECPredictedTimeManager *)self->_pluggedInTimeManager deadline];
    [v18 timeIntervalSinceNow];
    double v20 = v19;

    double v21 = fmax(v20 - v17, 0.0);
    [(PowerUICECPredictedTimeManager *)self->_pluggedInTimeManager timeToFullChargeFromBatteryLevel:+[PowerUISmartChargeUtilities currentBatteryLevelWithContext:self->_context]];
    double v23 = fmax(v22 - v17, 0.0);
    __int16 v24 = self->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v25 = NSNumber;
      int v26 = v24;
      uint64_t v27 = [v25 numberWithDouble:v21];
      uint64_t v28 = [NSNumber numberWithDouble:v23];
      *(_DWORD *)buf = 138412546;
      __int16 v54 = v27;
      __int16 v55 = 2112;
      __int16 v56 = v28;
      _os_log_impl(&dword_22135E000, v26, OS_LOG_TYPE_DEFAULT, "PluggedIn interval %@, Required charging interval %@", buf, 0x16u);
    }
    int64_t v29 = +[PowerUICECGridDataManager sharedInstance];
    LODWORD(v30) = [v29 shouldEngageForPluggedInTime:v21];

    if (v30)
    {
      BOOL v31 = +[PowerUICECGridDataManager sharedInstance];
      [v31 setupChargingTime:v23 forPluggedInTime:v21];

      uint64_t v32 = NSString;
      v33 = +[PowerUICECGridDataManager sharedInstance];
      uint64_t v34 = [v33 cleanIntervals];
      v35 = +[PowerUICECGridDataManager cleanIntervalsStringFromDates:v34];
      double v36 = [v32 stringWithFormat:@"Clean windows %@", v35];
    }
    else
    {
      v37 = self->_log;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22135E000, v37, OS_LOG_TYPE_DEFAULT, "Throwing Gridmix notification", buf, 2u);
      }
      v33 = +[PowerUINotificationManager sharedInstance];
      double v36 = @"Not enough variation in carbon emissions";
      id v38 = (id)[v33 postInternalCECNotificationWithID:@"engagedEvaluation" chargingStatus:1 information:@"Not enough variation in carbon emissions" shouldReplace:1];
    }
  }
  else
  {
    LOBYTE(v30) = 0;
    double v36 = &stru_26D3439E8;
  }
  v39 = NSString;
  v40 = self->_debugStatus;
  id v41 = [(PowerUICECPredictedTimeManager *)self->_pluggedInTimeManager debugStatus];
  int v42 = [v39 stringWithFormat:@"%@\n%@\n%@", v40, v41, v36];
  v43 = self->_debugStatus;
  self->_debugStatus = v42;

  if (!v15)
  {
    id v44 = [(PowerUICECPredictedTimeManager *)self->_pluggedInTimeManager deadline];
    [v44 timeIntervalSinceNow];
    if (v45 < 0.0)
    {
      uint64_t v46 = [MEMORY[0x263EFF910] date];

      id v44 = (void *)v46;
    }
    id v47 = self->_log;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, v47, OS_LOG_TYPE_DEFAULT, "Throwing Predictor notification", buf, 2u);
    }
    int v48 = NSString;
    v49 = [MEMORY[0x263F08790] localizedStringFromDate:v44 dateStyle:1 timeStyle:1];
    id v50 = [v48 stringWithFormat:@"Device not predicted to be plugged in for long enough (until %@)", v49];

    __int16 v30 = +[PowerUINotificationManager sharedInstance];
    id v51 = (id)[v30 postInternalCECNotificationWithID:@"engagedEvaluation" chargingStatus:1 information:v50 shouldReplace:1];

    LOBYTE(v30) = 0;
  }

  return (char)v30;
}

- (BOOL)evaluateEngagementAndSetup
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(PowerUICECManager *)self isActiveRegion])
  {
    BOOL v3 = [(PowerUICECManager *)self shouldEngageCEC];
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v17 = v3;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Should engage %d", buf, 8u);
    }
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"Should engage %d", v3);
    uint64_t v6 = [NSString stringWithFormat:@"%@\n%@", self->_debugStatus, v5];
    debugStatus = self->_debugStatus;
    self->_debugStatus = v6;

    [(NSUserDefaults *)self->_defaults setObject:self->_debugStatus forKey:@"debugStatus"];
    if (v3)
    {
      [(PowerUICECPredictedTimeManager *)self->_pluggedInTimeManager startAllMonitoring];
      int v8 = [(PowerUICECPredictedTimeManager *)self->_pluggedInTimeManager deadline];
      userDeadline = self->_userDeadline;
      self->_userDeadline = v8;

      defaults = self->_defaults;
      [(NSDate *)self->_userDeadline timeIntervalSinceReferenceDate];
      -[NSUserDefaults setDouble:forKey:](defaults, "setDouble:forKey:", @"userDeadline");
      uint64_t v11 = +[PowerUINotificationManager sharedInstance];
      id v12 = +[PowerUICECGridDataManager sharedInstance];
      uint64_t v13 = [v12 cleanIntervals];
      [v11 postInternalCECNotificationForChargingDates:v13];
    }
    BOOL v14 = [(PowerUICECPredictedTimeManager *)self->_pluggedInTimeManager hasSufficientTimeForFullCharge];
    [(PowerUICECManager *)self analyticsCECEngagementEvaluation:v3 byPredictedTime:v14 byGridMix:v3 & v14];
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)resetState
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Reset state", (uint8_t *)&v12, 2u);
  }
  double v4 = self->_log;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    debugStatus = self->_debugStatus;
    int v12 = 138412290;
    uint64_t v13 = debugStatus;
    _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_DEFAULT, "Debug: %@", (uint8_t *)&v12, 0xCu);
  }
  [(PowerUICECManager *)self handleNewDebugState:self->_debugStatus];
  uint64_t v6 = self->_debugStatus;
  self->_debugStatus = 0;

  self->_firstChargingEvaluation = 1;
  [(NSUserDefaults *)self->_defaults setObject:self->_debugStatus forKey:@"debugStatus"];
  self->_int isChargingPaused = 0;
  [(PowerUICECManager *)self updatePhaseFrom:self->_currentPhase to:0];
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"userDeadline"];
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"pauseChargingCheckDate"];
  int64_t v7 = +[PowerUINotificationManager sharedInstance];
  [v7 removeCECNotifications];

  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"debugStatus"];
  [(PowerUICECPredictedTimeManager *)self->_pluggedInTimeManager resetState];
  int v8 = +[PowerUICECGridDataManager sharedInstance];
  [v8 resetState];

  userDeadline = self->_userDeadline;
  self->_userDeadline = 0;

  pauseChargingCheckDate = self->_pauseChargingCheckDate;
  self->_pauseChargingCheckDate = 0;

  [(PowerUICECManager *)self clearAnalyticsDate];
  pluggedInDate = self->_pluggedInDate;
  self->_pluggedInDate = 0;

  self->_pluggedInBatteryLevel = -1;
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"pluggedInDateInterval"];
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"pluggedInBatteryLevel"];
  [(PowerUICECManager *)self unregisterTimer];
}

- (void)handleNewDebugState:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  double v4 = [(NSUserDefaults *)self->_defaults objectForKey:@"debugStatusHistory"];
  int64_t v25 = v4;
  if (v4)
  {
    uint64_t v5 = (void *)[v4 mutableCopy];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  }
  uint64_t v6 = v5;
  int64_t v7 = [v5 allKeys];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v13 = [(PowerUICECManager *)self dateFormatter];
        uint64_t v14 = [v13 dateFromString:v12];

        [v14 timeIntervalSinceNow];
        if (v15 < -86400.0)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            double v31 = *(double *)&v14;
            __int16 v32 = 2112;
            uint64_t v33 = v12;
            _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Removing entry for %@ %@", buf, 0x16u);
          }
          [v6 setObject:0 forKeyedSubscript:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v9);
  }
  BOOL v17 = self->_pluggedInDate;
  [(NSDate *)v17 timeIntervalSinceNow];
  if (v18 <= -7200.0)
  {
    double v22 = [(PowerUICECManager *)self dateFormatter];
    double v23 = [v22 stringFromDate:v17];

    [v6 setObject:self->_debugStatus forKeyedSubscript:v23];
    __int16 v24 = self->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v31 = *(double *)&v6;
      _os_log_impl(&dword_22135E000, v24, OS_LOG_TYPE_DEFAULT, "Debug history %@", buf, 0xCu);
    }
    [(NSUserDefaults *)self->_defaults setObject:v6 forKey:@"debugStatusHistory"];
  }
  else
  {
    double v19 = self->_log;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      double v20 = v19;
      [(NSDate *)v17 timeIntervalSinceNow];
      *(_DWORD *)buf = 134217984;
      double v31 = v21 / 60.0;
      _os_log_impl(&dword_22135E000, v20, OS_LOG_TYPE_DEFAULT, "Skipping debug since device was pluggedIn for %lf mins", buf, 0xCu);
    }
  }
}

- (void)analyticsCECEngagementEvaluation:(BOOL)a3 byPredictedTime:(BOOL)a4 byGridMix:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  [(NSUserDefaults *)self->_defaults setBool:a4 forKey:@"cecEngagementPredictedTime"];
  [(NSUserDefaults *)self->_defaults setBool:v5 forKey:@"cecEngagementGridMix"];
  [(NSUserDefaults *)self->_defaults setBool:v6 forKey:@"cecEngagement"];
  if (v6)
  {
    uint64_t v8 = [(PowerUICECPredictedTimeManager *)self->_pluggedInTimeManager deadline];
    if (v8)
    {
      id v12 = v8;
      [v8 timeIntervalSinceNow];
      if (v9 >= 0.0)
      {
        id v11 = v12;
      }
      else
      {
        uint64_t v10 = [MEMORY[0x263EFF910] date];

        id v11 = (id)v10;
      }
      id v13 = v11;
      [(NSUserDefaults *)self->_defaults setObject:v11 forKey:@"cecDeadline"];
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      -[PowerUICECManager analyticsCECEngagementEvaluation:byPredictedTime:byGridMix:]();
    }
  }
}

- (id)dateFormatter
{
  if (dateFormatter_onceToken != -1) {
    dispatch_once(&dateFormatter_onceToken, &__block_literal_global_263);
  }
  uint64_t v2 = (void *)dateFormatter_formatter;
  return v2;
}

uint64_t __34__PowerUICECManager_dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v1 = (void *)dateFormatter_formatter;
  dateFormatter_formatter = (uint64_t)v0;

  [(id)dateFormatter_formatter setDateStyle:1];
  uint64_t v2 = (void *)dateFormatter_formatter;
  return [v2 setTimeStyle:3];
}

- (void)analyticsCECSessionChargingState:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(NSUserDefaults *)self->_defaults objectForKey:@"cecChargingStatusTimeline"];
  id v12 = v5;
  if (v5)
  {
    uint64_t v6 = [v5 mutableCopy];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
  }
  int64_t v7 = (void *)v6;
  uint64_t v8 = [(PowerUICECManager *)self dateFormatter];
  double v9 = [MEMORY[0x263EFF910] date];
  uint64_t v10 = [v8 stringFromDate:v9];

  id v11 = [NSNumber numberWithBool:v3];
  [v7 setObject:v11 forKeyedSubscript:v10];

  [(NSUserDefaults *)self->_defaults setObject:v7 forKey:@"cecChargingStatusTimeline"];
}

- (id)sessionEndCECAnalytics
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263EFF9A0] dictionary];
  double v4 = [(NSUserDefaults *)self->_defaults objectForKey:@"cecEngagement"];
  if (!v4)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Engagement result missing", buf, 2u);
    }
  }
  uint64_t v6 = [v4 BOOLValue];
  int64_t v7 = [NSNumber numberWithBool:v6];
  [v3 setObject:v7 forKeyedSubscript:@"engaged"];

  uint64_t v8 = [(NSUserDefaults *)self->_defaults objectForKey:@"cecEngagementPredictedTime"];

  if (v8) {
    [v3 setObject:v8 forKeyedSubscript:@"engagedPredictedTime"];
  }
  double v9 = [(NSUserDefaults *)self->_defaults objectForKey:@"cecEngagementGridMix"];

  if (v9) {
    [v3 setObject:v9 forKeyedSubscript:@"engagedGridMix"];
  }
  uint64_t v10 = [(NSUserDefaults *)self->_defaults objectForKey:@"cecDeadline"];
  if (!v10)
  {
    id v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, v11, OS_LOG_TYPE_DEFAULT, "No CEC Deadline", buf, 2u);
    }
  }
  id v12 = self->_pluggedInDate;
  [v10 timeIntervalSinceNow];
  uint64_t v14 = (uint64_t)v13;
  if ((uint64_t)v13 >= 0) {
    unint64_t v15 = (uint64_t)v13;
  }
  else {
    unint64_t v15 = -v14;
  }
  if (v15 % 0xE10 <= 0x707) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = (v14 >> 63) | 1;
  }
  BOOL v17 = [NSNumber numberWithInteger:v16 + (uint64_t)v13 / 3600];
  [v3 setObject:v17 forKeyedSubscript:@"differenceHours"];

  double v18 = [NSNumber numberWithInteger:v14 / 60];
  [v3 setObject:v18 forKeyedSubscript:@"differenceRaw"];

  if (v10)
  {
    double v19 = NSNumber;
    [v10 timeIntervalSinceDate:v12];
    double v21 = [v19 numberWithInteger:(uint64_t)v20 / 60];
    [v3 setObject:v21 forKeyedSubscript:@"predictedPluggedInDuration"];
  }
  v91 = v12;
  [(NSDate *)v12 timeIntervalSinceNow];
  uint64_t v23 = (uint64_t)(v22 / -60.0);
  if (v23 <= 180) {
    uint64_t v24 = MEMORY[0x263EFFA80];
  }
  else {
    uint64_t v24 = MEMORY[0x263EFFA88];
  }
  [v3 setObject:v24 forKeyedSubscript:@"longerSession"];
  int64_t v25 = [NSNumber numberWithInteger:v23];
  [v3 setObject:v25 forKeyedSubscript:@"pluggedInDuration"];

  if (self->_pluggedInBatteryLevel != -1)
  {
    long long v26 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v3 setObject:v26 forKeyedSubscript:@"pluggedInBatteryLevel"];
  }
  uint64_t v27 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:self->_context];
  if (v27 < 100) {
    uint64_t v28 = v6;
  }
  else {
    uint64_t v28 = 0;
  }
  long long v29 = [NSNumber numberWithInteger:v27];
  [v3 setObject:v29 forKeyedSubscript:@"pluggedOutBatteryLevel"];

  __int16 v30 = [NSNumber numberWithBool:v28];
  [v3 setObject:v30 forKeyedSubscript:@"underchargeFromPrediction"];

  double v31 = [NSNumber numberWithBool:v28];
  [v3 setObject:v31 forKeyedSubscript:@"undercharge"];

  __int16 v32 = [NSNumber numberWithInt:!self->_isCECEnabled];
  [v3 setObject:v32 forKeyedSubscript:@"cecDisabled"];

  uint64_t v33 = [NSNumber numberWithBool:self->_isCECTemporarilyDisabled];
  [v3 setObject:v33 forKeyedSubscript:@"cecTemporarilyDisabled"];

  if (!v6)
  {
    [v3 setObject:&unk_26D385EA0 forKeyedSubscript:@"pausedMinutes"];
    v79 = v12;
    goto LABEL_60;
  }
  v89 = v10;
  v90 = v9;
  uint64_t v34 = [(NSUserDefaults *)self->_defaults objectForKey:@"cecChargingStatusTimeline"];
  uint64_t v35 = self->_log;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v105 = v34;
    _os_log_impl(&dword_22135E000, v35, OS_LOG_TYPE_DEFAULT, "Charging timeline %@", buf, 0xCu);
  }
  double v36 = [MEMORY[0x263EFF9A0] dictionary];
  [v34 allKeys];
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v37 = [obj countByEnumeratingWithState:&v97 objects:v103 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v98;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v98 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = *(void *)(*((void *)&v97 + 1) + 8 * i);
        int v42 = [(PowerUICECManager *)self dateFormatter];
        v43 = [v42 dateFromString:v41];

        id v44 = [v34 objectForKeyedSubscript:v41];
        [v36 setObject:v44 forKeyedSubscript:v43];
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v97 objects:v103 count:16];
    }
    while (v38);
  }
  v88 = v34;
  double v45 = self->_log;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v105 = v36;
    _os_log_impl(&dword_22135E000, v45, OS_LOG_TYPE_DEFAULT, "Dates charging timeline %@", buf, 0xCu);
  }
  uint64_t v46 = [v36 allKeys];
  id v47 = (void *)[v46 mutableCopy];

  int v48 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"self" ascending:1];
  v102 = v48;
  v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v102 count:1];
  [v47 sortUsingDescriptors:v49];

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v50 = v47;
  uint64_t v51 = [v50 countByEnumeratingWithState:&v93 objects:v101 count:16];
  if (!v51)
  {
    double v55 = 0.0;
    v70 = v50;
    uint64_t v10 = v89;
LABEL_57:

    unint64_t v80 = 0x263F08000;
    v79 = v91;
    goto LABEL_59;
  }
  uint64_t v52 = v51;
  v86 = v48;
  v87 = v3;
  id v53 = 0;
  uint64_t v54 = *(void *)v94;
  double v55 = 0.0;
  do
  {
    for (uint64_t j = 0; j != v52; ++j)
    {
      if (*(void *)v94 != v54) {
        objc_enumerationMutation(v50);
      }
      uint64_t v57 = *(void **)(*((void *)&v93 + 1) + 8 * j);
      __int16 v58 = [v36 objectForKeyedSubscript:v57];
      int v59 = [v58 BOOLValue];

      if (v59)
      {
        __int16 v60 = self->_log;
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v105 = v57;
          _os_log_impl(&dword_22135E000, v60, OS_LOG_TYPE_DEFAULT, "Prev date %@", buf, 0xCu);
        }
        id v61 = v57;
      }
      else
      {
        if (!v53) {
          continue;
        }
        [v57 timeIntervalSinceDate:v53];
        double v63 = v62;
        uint64_t v64 = NSString;
        v65 = [MEMORY[0x263F08790] localizedStringFromDate:v53 dateStyle:0 timeStyle:1];
        v66 = [MEMORY[0x263F08790] localizedStringFromDate:v57 dateStyle:0 timeStyle:1];
        uint64_t v67 = [v64 stringWithFormat:@"Paused from %@ to %@, ", v65, v66];

        v68 = [NSString stringWithFormat:@"%@\n%@", self->_debugStatus, v67];
        debugStatus = self->_debugStatus;
        self->_debugStatus = v68;

        double v55 = v55 + v63;
        id v61 = 0;
        id v53 = (void *)v67;
      }

      id v53 = v61;
    }
    uint64_t v52 = [v50 countByEnumeratingWithState:&v93 objects:v101 count:16];
  }
  while (v52);

  if (v53)
  {
    v70 = [MEMORY[0x263EFF910] date];
    [v70 timeIntervalSinceDate:v53];
    double v72 = v71;
    v73 = NSString;
    v74 = [MEMORY[0x263F08790] localizedStringFromDate:v53 dateStyle:0 timeStyle:1];
    v75 = [MEMORY[0x263F08790] localizedStringFromDate:v70 dateStyle:0 timeStyle:1];
    v76 = [v73 stringWithFormat:@"Paused from %@ to %@", v74, v75];

    v77 = [NSString stringWithFormat:@"%@\n%@", self->_debugStatus, v76];
    v78 = self->_debugStatus;
    self->_debugStatus = v77;

    double v55 = v55 + v72;
    int v48 = v86;
    BOOL v3 = v87;
    uint64_t v10 = v89;
    goto LABEL_57;
  }
  int v48 = v86;
  BOOL v3 = v87;
  uint64_t v10 = v89;
  unint64_t v80 = 0x263F08000uLL;
  v79 = v91;
LABEL_59:
  v81 = [*(id *)(v80 + 2584) numberWithInteger:(uint64_t)(v55 / 60.0)];
  [v3 setObject:v81 forKeyedSubscript:@"pausedMinutes"];

  v82 = objc_msgSend(NSString, "stringWithFormat:", @"Paused for %d mins in total", ((int)v55 / 60));
  v83 = [NSString stringWithFormat:@"%@\n%@", self->_debugStatus, v82];
  v84 = self->_debugStatus;
  self->_debugStatus = v83;

  double v9 = v90;
LABEL_60:

  return v3;
}

- (void)recordPowerLogCECState:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v5 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v6 forKeyedSubscript:@"cecState"];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = v5;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Writing to PowerLog %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v8 = (void *)MEMORY[0x223C80A30]();
  PLLogRegisteredEvent();
}

- (void)recordPowerLogEvent
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263EFF9A0] dictionary];
  int isChargingPaused = self->_isChargingPaused;
  unint64_t currentPhase = self->_currentPhase;
  if (self->_isInternal)
  {
    uint64_t v6 = [(NSUserDefaults *)self->_defaults objectForKey:@"powerLogPaused"];
    int64_t v7 = v6;
    if (v6) {
      int isChargingPaused = [v6 BOOLValue];
    }
    uint64_t v8 = [(NSUserDefaults *)self->_defaults objectForKey:@"powerLogStatus"];

    if (v8) {
      unint64_t currentPhase = [v8 integerValue];
    }
  }
  int v9 = [NSNumber numberWithUnsignedInteger:self->_currentState];
  [v3 setObject:v9 forKeyedSubscript:@"cecState"];

  uint64_t v10 = [NSNumber numberWithInteger:currentPhase];
  [v3 setObject:v10 forKeyedSubscript:@"status"];

  uint64_t v11 = [NSNumber numberWithBool:isChargingPaused != 0];
  [v3 setObject:v11 forKeyedSubscript:@"isPaused"];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    unint64_t v15 = v3;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Writing to PowerLog %@", (uint8_t *)&v14, 0xCu);
  }
  double v13 = (void *)MEMORY[0x223C80A30]();
  PLLogRegisteredEvent();
}

- (void)recordAnalytics
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = [(PowerUICECManager *)self sessionEndCECAnalytics];
  if ([v3 count])
  {
    id v5 = v3;
    AnalyticsSendEventLazy();
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int64_t v7 = v3;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Reported CEC metrics to CoreAnalytics %@", buf, 0xCu);
  }
  [(PowerUICECManager *)self clearAnalyticsDate];
}

id __36__PowerUICECManager_recordAnalytics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)clearAnalyticsDate
{
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"cecDeadline"];
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"cecEngagement"];
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"cecEngagementPredictedTime"];
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"cecEngagementGridMix"];
  defaults = self->_defaults;
  [(NSUserDefaults *)defaults removeObjectForKey:@"cecChargingStatusTimeline"];
}

- (NSDate)userDeadline
{
  return self->_userDeadline;
}

- (void)setUserDeadline:(id)a3
{
}

- (unint64_t)currentPhase
{
  return self->_currentPhase;
}

- (void)setCurrentPhase:(unint64_t)a3
{
  self->_unint64_t currentPhase = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSDictionary)phaseDescriptions
{
  return self->_phaseDescriptions;
}

- (void)setPhaseDescriptions:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)isChargingPaused
{
  return self->_isChargingPaused;
}

- (void)setIsChargingPaused:(BOOL)a3
{
  self->_int isChargingPaused = a3;
}

- (BOOL)displayedFirstTimeNotification
{
  return self->_displayedFirstTimeNotification;
}

- (void)setDisplayedFirstTimeNotification:(BOOL)a3
{
  self->_displayedFirstTimeNotification = a3;
}

- (BOOL)isCECEnabled
{
  return self->_isCECEnabled;
}

- (void)setIsCECEnabled:(BOOL)a3
{
  self->_isCECEnabled = a3;
}

- (BOOL)isCECTemporarilyDisabled
{
  return self->_isCECTemporarilyDisabled;
}

- (void)setIsCECTemporarilyDisabled:(BOOL)a3
{
  self->_isCECTemporarilyDisabled = a3;
}

- (NSDate)cecTemporarilyDisabledDate
{
  return self->_cecTemporarilyDisabledDate;
}

- (void)setCecTemporarilyDisabledDate:(id)a3
{
}

- (NSDate)pauseChargingCheckDate
{
  return self->_pauseChargingCheckDate;
}

- (void)setPauseChargingCheckDate:(id)a3
{
}

- (PowerUICECPredictedTimeManager)pluggedInTimeManager
{
  return self->_pluggedInTimeManager;
}

- (void)setPluggedInTimeManager:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (PowerUIChargingController)chargingController
{
  return self->_chargingController;
}

- (void)setChargingController:(id)a3
{
}

- (PowerUIAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (double)tPluggedInWaitInterval
{
  return self->_tPluggedInWaitInterval;
}

- (void)setTPluggedInWaitInterval:(double)a3
{
  self->_double tPluggedInWaitInterval = a3;
}

- (BOOL)tOverrideActiveCheck
{
  return self->_tOverrideActiveCheck;
}

- (void)setTOverrideActiveCheck:(BOOL)a3
{
  self->_tOverrideActiveCheck = a3;
}

- (BOOL)firstChargingEvaluation
{
  return self->_firstChargingEvaluation;
}

- (void)setFirstChargingEvaluation:(BOOL)a3
{
  self->_firstChargingEvaluation = a3;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_unint64_t currentState = a3;
}

- (NSDate)pluggedInDate
{
  return self->_pluggedInDate;
}

- (void)setPluggedInDate:(id)a3
{
}

- (int64_t)pluggedInBatteryLevel
{
  return self->_pluggedInBatteryLevel;
}

- (void)setPluggedInBatteryLevel:(int64_t)a3
{
  self->_pluggedInBatteryLevel = a3;
}

- (PowerUIBDCDataManager)bdcDataManager
{
  return self->_bdcDataManager;
}

- (void)setBdcDataManager:(id)a3
{
}

- (NSString)debugStatus
{
  return self->_debugStatus;
}

- (BOOL)shouldSupportCEC
{
  return self->_shouldSupportCEC;
}

- (void)setShouldSupportCEC:(BOOL)a3
{
  self->_shouldSupportCEC = a3;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugStatus, 0);
  objc_storeStrong((id *)&self->_bdcDataManager, 0);
  objc_storeStrong((id *)&self->_pluggedInDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_chargingController, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_pluggedInTimeManager, 0);
  objc_storeStrong((id *)&self->_pauseChargingCheckDate, 0);
  objc_storeStrong((id *)&self->_cecTemporarilyDisabledDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_phaseDescriptions, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_userDeadline, 0);
}

+ (void)fetchEstimatedCountryCode
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_22135E000, v0, v1, "Estimated countries = %@", v2, v3, v4, v5, v6);
}

- (void)isPluggedIntoEligiblePowerSource
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  v4[0] = 67109120;
  v4[1] = [a2 BOOLValue];
  _os_log_debug_impl(&dword_22135E000, v3, OS_LOG_TYPE_DEBUG, "TestMode: Power source value set to %d", (uint8_t *)v4, 8u);
}

- (void)handleCallback:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleCallback:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "Unsupported Phase", v2, v3, v4, v5, v6);
}

- (void)handleCallback:.cold.3()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_3(&dword_22135E000, v0, v1, "Evaluated and decided to not engage", v2, v3, v4, v5, v6);
}

- (void)handleCallback:.cold.4()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_3(&dword_22135E000, v0, v1, "CEC is not enabled. Skipping", v2, v3, v4, v5, v6);
}

- (void)handleCallback:.cold.5()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_3(&dword_22135E000, v0, v1, "No-op", v2, v3, v4, v5, v6);
}

- (void)handleCallback:.cold.6()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_3(&dword_22135E000, v0, v1, "Charging up", v2, v3, v4, v5, v6);
}

- (void)analyticsCECEngagementEvaluation:byPredictedTime:byGridMix:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "CEC engaged but deadline is missing", v2, v3, v4, v5, v6);
}

@end