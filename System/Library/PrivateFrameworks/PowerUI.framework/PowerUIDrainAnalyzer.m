@interface PowerUIDrainAnalyzer
+ (id)sharedInstance;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)notificationQueue;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (PowerUIDrainAnalyzer)init;
- (_CDLocalContext)context;
- (int64_t)minBatteryLevel;
- (void)monitorPluggedInStatus;
- (void)recordAnalytics;
- (void)recordPredictionResultAndTime;
- (void)resetState;
- (void)scheduleAnalyticsActivity;
- (void)scheduleLowSOCPrediction;
- (void)setContext:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setLog:(id)a3;
- (void)setMinBatteryLevel:(int64_t)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)updateLPMAndMinSOC;
@end

@implementation PowerUIDrainAnalyzer

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_12);
  }
  v2 = (void *)sharedInstance_drainAnalyzer;
  return v2;
}

uint64_t __38__PowerUIDrainAnalyzer_sharedInstance__block_invoke()
{
  sharedInstance_drainAnalyzer = objc_alloc_init(PowerUIDrainAnalyzer);
  return MEMORY[0x270F9A758]();
}

- (PowerUIDrainAnalyzer)init
{
  v27.receiver = self;
  v27.super_class = (Class)PowerUIDrainAnalyzer;
  v2 = [(PowerUIDrainAnalyzer *)&v27 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.powerui.drainAnalyzer", "");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.powerui.drainAnalyzer.queue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.powerui.drainAnalyzer.notify.queue", v8);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [MEMORY[0x263F351B8] userContext];
    context = v2->_context;
    v2->_context = (_CDLocalContext *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.powerui.lowSOCAnalyzer"];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v13;

    v15 = [(NSUserDefaults *)v2->_defaults objectForKey:@"minSOC"];
    if (v15)
    {
      v16 = [(NSUserDefaults *)v2->_defaults objectForKey:@"minSOC"];
      v2->_minBatteryLevel = [v16 integerValue];
    }
    else
    {
      v2->_minBatteryLevel = 100;
    }

    [(PowerUIDrainAnalyzer *)v2 monitorPluggedInStatus];
    int out_token = 0;
    v17 = v2->_notificationQueue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __28__PowerUIDrainAnalyzer_init__block_invoke;
    handler[3] = &unk_2645A5CA8;
    v18 = v2;
    v25 = v18;
    notify_register_dispatch("com.apple.powerui.drainAnalyzer.predictLowSOC", &out_token, v17, handler);
    int v23 = 0;
    v19 = v2->_notificationQueue;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __28__PowerUIDrainAnalyzer_init__block_invoke_2;
    v21[3] = &unk_2645A5CA8;
    v22 = v18;
    notify_register_dispatch("com.apple.powerui.drainAnalyzer.lowSOCAnalytics", &v23, v19, v21);
  }
  return v2;
}

uint64_t __28__PowerUIDrainAnalyzer_init__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) recordPredictionResultAndTime];
  v2 = *(void **)(a1 + 32);
  return [v2 resetState];
}

uint64_t __28__PowerUIDrainAnalyzer_init__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) recordPredictionResultAndTime];
  [*(id *)(a1 + 32) recordAnalytics];
  v2 = *(void **)(a1 + 32);
  return [v2 resetState];
}

- (void)monitorPluggedInStatus
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__PowerUIDrainAnalyzer_monitorPluggedInStatus__block_invoke;
  block[3] = &unk_2645A5CF0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__PowerUIDrainAnalyzer_monitorPluggedInStatus__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F351F8];
  os_log_t v3 = [MEMORY[0x263F351D0] keyPathForPluginStatus];
  v4 = [v2 predicateForChangeAtKeyPath:v3];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__PowerUIDrainAnalyzer_monitorPluggedInStatus__block_invoke_2;
  v6[3] = &unk_2645A61C0;
  v6[4] = *(void *)(a1 + 32);
  v5 = [MEMORY[0x263F351E8] localWakingRegistrationWithIdentifier:@"com.apple.powerui.lowSOCAnalyzer.pluggedIn" contextualPredicate:v4 clientIdentifier:@"com.apple.powerui.lowSOCAnalyzer.pluggedIn" callback:v6];
  [*(id *)(*(void *)(a1 + 32) + 16) registerCallback:v5];
}

void __46__PowerUIDrainAnalyzer_monitorPluggedInStatus__block_invoke_2(uint64_t a1)
{
  BOOL v2 = +[PowerUISmartChargeUtilities isPluggedInWithContext:*(void *)(*(void *)(a1 + 32) + 16)];
  os_log_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = (void *)v3[5];
    v5 = [MEMORY[0x263EFF910] date];
    [v4 setObject:v5 forKey:@"pluggedinTime"];

    dispatch_queue_t v6 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:@"predictionTime"];
    if (v6)
    {
      id v7 = v6;
      [*(id *)(a1 + 32) updateLPMAndMinSOC];
      dispatch_queue_t v6 = v7;
    }
  }
  else
  {
    [v3 scheduleLowSOCPrediction];
  }
}

- (void)scheduleLowSOCPrediction
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  os_log_t v3 = [(NSUserDefaults *)self->_defaults objectForKey:@"pluggedinTime"];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v3;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Device pluggedin at %@", buf, 0xCu);
  }
  [v3 timeIntervalSinceNow];
  double v6 = v5;
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"pluggedinTime"];
  if (v6 <= -10800.0)
  {
    v8 = [(NSUserDefaults *)self->_defaults objectForKey:@"predictionTime"];
    dispatch_queue_t v9 = v8;
    if (v8 && ([v8 timeIntervalSinceNow], v10 > -86400.0))
    {
      uint64_t v11 = self->_log;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22135E000, v11, OS_LOG_TYPE_DEFAULT, "Analytics from prediction in last 24 hours not recorded. Skipping Low SOC prediction", buf, 2u);
      }
    }
    else
    {
      xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v12, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8290]);
      xpc_dictionary_set_BOOL(v12, (const char *)*MEMORY[0x263EF8180], 1);
      xpc_dictionary_set_BOOL(v12, (const char *)*MEMORY[0x263EF82A0], 0);
      xpc_dictionary_set_int64(v12, (const char *)*MEMORY[0x263EF81C0], 7200);
      xpc_dictionary_set_int64(v12, (const char *)*MEMORY[0x263EF81A0], 7200);
      xpc_dictionary_set_BOOL(v12, (const char *)*MEMORY[0x263EF82B8], 1);
      xpc_dictionary_set_BOOL(v12, (const char *)*MEMORY[0x263EF82D8], 1);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __48__PowerUIDrainAnalyzer_scheduleLowSOCPrediction__block_invoke;
      handler[3] = &unk_2645A6698;
      void handler[4] = self;
      xpc_activity_register("com.apple.powerui.lowSOCPrediction.prediction", v12, handler);
    }
  }
  else
  {
    id v7 = self->_log;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, v7, OS_LOG_TYPE_DEFAULT, "Device pluggedin for less than 3 hours. Skipping Low SOC prediction", buf, 2u);
    }
  }
}

void __48__PowerUIDrainAnalyzer_scheduleLowSOCPrediction__block_invoke(uint64_t a1, xpc_activity_t activity)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    [*(id *)(a1 + 32) recordPredictionResultAndTime];
    *(void *)(*(void *)(a1 + 32) + 48) = 101;
    [*(id *)(a1 + 32) updateLPMAndMinSOC];
    double v5 = *(void **)(a1 + 32);
    [v5 scheduleAnalyticsActivity];
  }
  else if (!state)
  {
    v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      id v7 = "com.apple.powerui.lowSOCPrediction.prediction";
      _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_INFO, "Checking in for %s!", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)scheduleAnalyticsActivity
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8290]);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF8180], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF82A0], 0);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x263EF81C0], 120);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x263EF81A0], 21600);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF82B8], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF82D8], 1);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __49__PowerUIDrainAnalyzer_scheduleAnalyticsActivity__block_invoke;
  handler[3] = &unk_2645A6698;
  void handler[4] = self;
  xpc_activity_register("com.apple.powerui.lowSOCPrediction.analytics", v3, handler);
}

void __49__PowerUIDrainAnalyzer_scheduleAnalyticsActivity__block_invoke(uint64_t a1, xpc_activity_t activity)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    [*(id *)(a1 + 32) recordAnalytics];
    double v5 = *(void **)(a1 + 32);
    [v5 resetState];
  }
  else if (!state)
  {
    v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      id v7 = "com.apple.powerui.lowSOCPrediction.analytics";
      _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_INFO, "Checking in for %s!", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)recordPredictionResultAndTime
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int64_t v3 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:self->_context];
  v4 = [MEMORY[0x263F5B660] predictor];
  double v5 = [v4 lowSOCPredictionOutput];
  uint64_t v6 = [v5 lowSOCPredicted];
  log = self->_log;
  BOOL v8 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)v21 = 134217984;
      *(void *)&void v21[4] = 15;
      dispatch_queue_t v9 = "Predicted to hit low SOC: %ld%%";
LABEL_6:
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, v9, v21, 0xCu);
    }
  }
  else if (v8)
  {
    *(_DWORD *)v21 = 134217984;
    *(void *)&void v21[4] = 15;
    dispatch_queue_t v9 = "Not predicted to hit low SOC: %ld%%";
    goto LABEL_6;
  }
  defaults = self->_defaults;
  uint64_t v11 = objc_msgSend(v5, "modelVersion", *(_OWORD *)v21);
  [(NSUserDefaults *)defaults setObject:v11 forKey:@"modelVersion"];

  xpc_object_t v12 = self->_defaults;
  uint64_t v13 = [MEMORY[0x263EFF910] date];
  [(NSUserDefaults *)v12 setObject:v13 forKey:@"predictionTime"];

  v14 = self->_defaults;
  v15 = [NSNumber numberWithBool:v6];
  [(NSUserDefaults *)v14 setObject:v15 forKey:@"predictionResult"];

  uint64_t v16 = self->_defaults;
  v17 = [NSNumber numberWithInteger:v3];
  [(NSUserDefaults *)v16 setObject:v17 forKey:@"startSOC"];

  v18 = self->_defaults;
  v19 = NSNumber;
  [v5 confidence];
  v20 = objc_msgSend(v19, "numberWithDouble:");
  [(NSUserDefaults *)v18 setObject:v20 forKey:@"predictionConfidence"];
}

- (void)updateLPMAndMinSOC
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__PowerUIDrainAnalyzer_updateLPMAndMinSOC__block_invoke;
  block[3] = &unk_2645A5CF0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __42__PowerUIDrainAnalyzer_updateLPMAndMinSOC__block_invoke(uint64_t a1)
{
  int64_t v2 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2 < *(void *)(v3 + 48))
  {
    *(void *)(v3 + 48) = v2;
    v4 = *(void **)(*(void *)(a1 + 32) + 40);
    double v5 = [NSNumber numberWithInteger:v2];
    [v4 setObject:v5 forKey:@"minSOC"];

    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 40);
    id v7 = [MEMORY[0x263EFF910] date];
    [v6 setObject:v7 forKey:@"kDefaultsMinSOCDate"];
  }
  BOOL v8 = [MEMORY[0x263F08AB0] processInfo];
  int v9 = [v8 isLowPowerModeEnabled];

  if (v9)
  {
    uint64_t v10 = MEMORY[0x263EFFA88];
    uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 40);
    [v11 setObject:v10 forKey:@"wasInLPM"];
  }
}

- (void)recordAnalytics
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22135E000, log, OS_LOG_TYPE_ERROR, "Missing last prediction date. Skipping analytics", v1, 2u);
}

id __39__PowerUIDrainAnalyzer_recordAnalytics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)resetState
{
  self->_minBatteryLevel = 100;
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

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (int64_t)minBatteryLevel
{
  return self->_minBatteryLevel;
}

- (void)setMinBatteryLevel:(int64_t)a3
{
  self->_minBatteryLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end