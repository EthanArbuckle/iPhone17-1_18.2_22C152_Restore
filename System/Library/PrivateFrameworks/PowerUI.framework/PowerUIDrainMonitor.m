@interface PowerUIDrainMonitor
+ (id)sharedInstance;
- (BOOL)didEnableLPM;
- (BOOL)hasVariationForMedianLevels:(id)a3;
- (BOOL)isAtKnownChargingLocation;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (PowerUIDrainMonitor)init;
- (PowerUILocationSignalMonitor)locationSignalMonitor;
- (UNUserNotificationCenter)unCenter;
- (_CDLocalContext)context;
- (id)isTrendingLowerWithBatteryLevel:(int64_t)a3 atDate:(id)a4;
- (int)notifyTestToken;
- (int)notifyToken;
- (unint64_t)slotForDate:(id)a3 withTimeSlotWidth:(unint64_t)a4;
- (void)disableLPM;
- (void)enableLPM;
- (void)evaluateNudgeForLPM;
- (void)postLPMNudgeNotificationWithInfo:(id)a3;
- (void)setContext:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setDidEnableLPM:(BOOL)a3;
- (void)setLocationSignalMonitor:(id)a3;
- (void)setLog:(id)a3;
- (void)setNotifyTestToken:(int)a3;
- (void)setNotifyToken:(int)a3;
- (void)setQueue:(id)a3;
- (void)setUnCenter:(id)a3;
- (void)start;
@end

@implementation PowerUIDrainMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_drainMonitor;
  return v2;
}

uint64_t __37__PowerUIDrainMonitor_sharedInstance__block_invoke()
{
  sharedInstance_drainMonitor = objc_alloc_init(PowerUIDrainMonitor);
  return MEMORY[0x270F9A758]();
}

- (PowerUIDrainMonitor)init
{
  v20.receiver = self;
  v20.super_class = (Class)PowerUIDrainMonitor;
  v2 = [(PowerUIDrainMonitor *)&v20 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.powerui.drainMonitor"];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.powerui.powerUIDrainMonitor", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    os_log_t v8 = os_log_create("com.apple.powerui", "powerUIDrainMonitor");
    log = v2->_log;
    v2->_log = (OS_os_log *)v8;

    v10 = [(PowerUIDrainMonitor *)v2 log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, v10, OS_LOG_TYPE_DEFAULT, "PowerUIDrainMonitor initiating...", buf, 2u);
    }

    uint64_t v11 = [MEMORY[0x263F351B8] userContext];
    context = v2->_context;
    v2->_context = (_CDLocalContext *)v11;

    v13 = [(NSUserDefaults *)v2->_defaults objectForKey:@"didEnableLPM"];
    v14 = v13;
    if (v13) {
      v2->_didEnableLPM = [v13 BOOLValue];
    }
    *(_DWORD *)buf = 0;
    v15 = v2->_queue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __27__PowerUIDrainMonitor_init__block_invoke;
    handler[3] = &unk_2645A5CA8;
    v18 = v2;
    notify_register_dispatch("com.apple.powerui.drainmonitor.notification", (int *)buf, v15, handler);
  }
  return v2;
}

void __27__PowerUIDrainMonitor_init__block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v2 = MEMORY[0x263EFFA88];
  [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"shouldEngage"];
  [v3 setObject:&unk_26D385378 forKeyedSubscript:@"currentLevel"];
  [v3 setObject:&unk_26D385390 forKeyedSubscript:@"referenceLevel"];
  [v3 setObject:v2 forKeyedSubscript:@"ignoreLastNudge"];
  [*(id *)(a1 + 32) postLPMNudgeNotificationWithInfo:v3];
}

- (void)start
{
  id v3 = (void *)MEMORY[0x263F351F8];
  v4 = [MEMORY[0x263F351D0] keyPathForBatteryLevel];
  v5 = [v3 predicateForChangeAtKeyPath:v4];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __28__PowerUIDrainMonitor_start__block_invoke;
  v12[3] = &unk_2645A61C0;
  v12[4] = self;
  dispatch_queue_t v6 = [MEMORY[0x263F351E8] localWakingRegistrationWithIdentifier:@"com.apple.powerui.drainMonitor" contextualPredicate:v5 clientIdentifier:@"com.apple.PowerUIAgent.contextstore-registration" callback:v12];
  notify_register_check((const char *)[@"com.apple.powerui.nudge.LPM" UTF8String], &self->_notifyToken);
  [(_CDLocalContext *)self->_context registerCallback:v6];
  v7 = +[PowerUIBrightnessController sharedInstance];
  [v7 start];

  os_log_t v8 = +[PowerUILocationSignalMonitor monitorWithDelegate:self];
  locationSignalMonitor = self->_locationSignalMonitor;
  self->_locationSignalMonitor = v8;

  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __28__PowerUIDrainMonitor_start__block_invoke_3;
  v11[3] = &unk_2645A5CA8;
  v11[4] = self;
  notify_register_dispatch("com.apple.powerui.ambrosia.enableMitigation", &self->_notifyTestToken, queue, v11);
}

void __28__PowerUIDrainMonitor_start__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__PowerUIDrainMonitor_start__block_invoke_2;
  block[3] = &unk_2645A5CF0;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(v2, block);
}

void __28__PowerUIDrainMonitor_start__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id v3 = [MEMORY[0x263F351D0] keyPathForPluginStatus];
  v4 = [v2 objectForKeyedSubscript:v3];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    dispatch_queue_t v6 = +[PowerUIBrightnessController sharedInstance];
    [v6 resetMitigation];

    notify_set_state(*(_DWORD *)(*(void *)(a1 + 32) + 16), 0);
    notify_post((const char *)[@"com.apple.powerui.nudge.LPM" UTF8String]);
    v7 = *(unsigned char **)(a1 + 32);
    if (v7[8])
    {
      [v7 disableLPM];
    }
  }
  else
  {
    os_log_t v8 = *(void **)(*(void *)(a1 + 32) + 40);
    v9 = [MEMORY[0x263F351D0] keyPathForBatteryLevel];
    v10 = [v8 objectForContextualKeyPath:v9];
    uint64_t v11 = [v10 integerValue];

    if (v11 <= 20) {
      [*(id *)(a1 + 32) enableLPM];
    }
    v12 = *(void **)(*(void *)(a1 + 32) + 40);
    v13 = [MEMORY[0x263F351D0] keyPathForLowPowerModeStatus];
    v14 = [v12 objectForKeyedSubscript:v13];
    char v15 = [v14 BOOLValue];

    if ((v15 & 1) == 0)
    {
      v16 = *(void **)(a1 + 32);
      [v16 evaluateNudgeForLPM];
    }
  }
}

void __28__PowerUIDrainMonitor_start__block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  notify_set_state(*(_DWORD *)(*(void *)(a1 + 32) + 16), 1uLL);
  notify_post((const char *)[@"com.apple.powerui.nudge.LPM" UTF8String]);
  uint64_t v2 = +[PowerUIBrightnessController sharedInstance];
  [v2 engageMitigation];

  [*(id *)(a1 + 32) enableLPM];
  id v3 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_22135E000, v3, OS_LOG_TYPE_DEFAULT, "SMDEBUG: Posting Ambrosia Engage notification", (uint8_t *)&v6, 2u);
  }

  v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [*(id *)(a1 + 32) isAtKnownChargingLocation];
    int v6 = 134217984;
    uint64_t v7 = v5;
    _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_DEFAULT, "SMDEBUG: Is at known location: %lu", (uint8_t *)&v6, 0xCu);
  }
}

- (void)enableLPM
{
  id v3 = [(PowerUIDrainMonitor *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl(&dword_22135E000, v3, OS_LOG_TYPE_DEFAULT, "SMDEBUG: Enabling LPM", v5, 2u);
  }

  v4 = [MEMORY[0x263F52788] sharedInstance];
  [v4 setPowerMode:1 fromSource:@"com.apple.powerui.ambrosia"];

  self->_didEnableLPM = 1;
  [(NSUserDefaults *)self->_defaults setBool:1 forKey:@"didEnableLPM"];
}

- (void)disableLPM
{
  id v3 = [(PowerUIDrainMonitor *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl(&dword_22135E000, v3, OS_LOG_TYPE_DEFAULT, "SMDEBUG: Disabling LPM", v5, 2u);
  }

  v4 = [MEMORY[0x263F52788] sharedInstance];
  [v4 setPowerMode:0 fromSource:@"com.apple.powerui.ambrosia"];

  self->_didEnableLPM = 0;
  [(NSUserDefaults *)self->_defaults setBool:0 forKey:@"didEnableLPM"];
}

- (void)evaluateNudgeForLPM
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  context = self->_context;
  v4 = [MEMORY[0x263F351D0] keyPathForBatteryLevel];
  unsigned int v5 = [(_CDLocalContext *)context objectForContextualKeyPath:v4];
  uint64_t v6 = [v5 integerValue];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134217984;
    uint64_t v15 = v6;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Current battery level %lu", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v8 = [MEMORY[0x263EFF910] date];
  v9 = [(PowerUIDrainMonitor *)self isTrendingLowerWithBatteryLevel:v6 atDate:v8];

  v10 = [v9 objectForKeyedSubscript:@"shouldEngage"];

  if (v10)
  {
    uint64_t v11 = [v9 objectForKeyedSubscript:@"shouldEngage"];
    int v12 = [v11 BOOLValue];

    if (v12)
    {
      [(PowerUIDrainMonitor *)self postLPMNudgeNotificationWithInfo:v9];
      notify_set_state(self->_notifyToken, 1uLL);
      notify_post((const char *)[@"com.apple.powerui.nudge.LPM" UTF8String]);
      v13 = +[PowerUIBrightnessController sharedInstance];
      [v13 engageMitigation];
    }
  }
}

- (void)postLPMNudgeNotificationWithInfo:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[PowerUISmartChargeUtilities isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v4;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Posting LPM notification %@", buf, 0xCu);
    }
    v26 = +[PowerUINotificationManager sharedInstance];
    uint64_t v6 = [MEMORY[0x263EFF910] date];
    uint64_t v7 = [(NSUserDefaults *)self->_defaults objectForKey:@"kLastALPMNotificationDate"];
    uint64_t v8 = [v4 objectForKeyedSubscript:@"ignoreLastNudge"];
    if (([v8 BOOLValue] & 1) != 0 || !v7)
    {
    }
    else
    {
      [v7 timeIntervalSinceNow];
      double v10 = v9;

      if (v10 >= -43200.0)
      {
        uint64_t v11 = self->_log;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22135E000, v11, OS_LOG_TYPE_DEFAULT, "Posted LPM notification in last 12 hours; Skipping",
            buf,
            2u);
        }
LABEL_16:

        goto LABEL_17;
      }
    }
    int v12 = [v4 objectForKeyedSubscript:@"currentLevel"];
    uint64_t v13 = [v12 integerValue];

    int v14 = NSString;
    uint64_t v15 = [v4 objectForKeyedSubscript:@"referenceLevel"];
    uint64_t v16 = objc_msgSend(v14, "stringWithFormat:", @"Your battery level is trending lower than typical!(Current:%ld Typical:%ld)", v13, objc_msgSend(v15, "integerValue"));

    v17 = @"Enable LPM!";
    if (v13 <= 9)
    {
      v18 = [v4 objectForKeyedSubscript:@"knownChargingLocation"];
      int v19 = [v18 BOOLValue];

      if (v19) {
        v17 = @"Charge Device!";
      }
    }
    objc_super v20 = [NSString stringWithFormat:@"%@ %@!!", v16, v17];
    v21 = [MEMORY[0x263F1DF40] iconForSystemImageNamed:@"battery.25percent"];
    v22 = [v6 dateByAddingTimeInterval:1800.0];
    v23 = [NSURL URLWithString:@"E-T-Insights://"];
    v24 = [MEMORY[0x263EFF910] date];
    [v26 postInternalNotificationAtDate:v24 withTitle:@"[Internal] Low Power Mode" withTextContent:v20 icon:v21 url:v23 expirationDate:v22];

    v25 = self->_log;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, v25, OS_LOG_TYPE_DEFAULT, "Posted LPM notification ", buf, 2u);
    }
    [(NSUserDefaults *)self->_defaults setObject:v6 forKey:@"kLastALPMNotificationDate"];

    goto LABEL_16;
  }
LABEL_17:
}

- (unint64_t)slotForDate:(id)a3 withTimeSlotWidth:(unint64_t)a4
{
  unsigned int v5 = (void *)MEMORY[0x263EFF8F0];
  id v6 = a3;
  uint64_t v7 = [v5 currentCalendar];
  uint64_t v8 = [v7 components:540 fromDate:v6];
  double v9 = [v7 dateFromComponents:v8];
  [v6 timeIntervalSinceDate:v9];
  double v11 = v10;

  return (unint64_t)(v11 / (double)(60 * a4));
}

- (BOOL)hasVariationForMedianLevels:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v20;
    uint64_t v9 = 101;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        double v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v11 integerValue] < v9) {
          uint64_t v9 = [v11 integerValue];
        }
        if ([v11 integerValue] > v7) {
          uint64_t v7 = [v11 integerValue];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 101;
  }
  uint64_t v12 = v7 - v9;
  if (v7 - v9 <= 45)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = NSNumber;
      uint64_t v15 = log;
      uint64_t v16 = [v14 numberWithInteger:v9];
      v17 = [NSNumber numberWithInteger:v7];
      *(_DWORD *)buf = 138412546;
      v24 = v16;
      __int16 v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_22135E000, v15, OS_LOG_TYPE_DEFAULT, "Not enough variation in the values. Min %@, Max %@", buf, 0x16u);
    }
  }

  return v12 > 45;
}

- (BOOL)isAtKnownChargingLocation
{
  uint64_t v2 = [(PowerUILocationSignalMonitor *)self->_locationSignalMonitor requiredFullChargeDate];
  [v2 timeIntervalSinceNow];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (id)isTrendingLowerWithBatteryLevel:(int64_t)a3 atDate:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_opt_new();
  [v6 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"shouldEngage"];
  uint64_t v7 = +[PowerUIBatteryData sharedInstance];
  uint64_t v8 = [MEMORY[0x263EFF910] date];
  if (+[PowerUISmartChargeUtilities isWeekend:v8]) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  double v10 = [v7 medianBatteryLevelByTimeSlot:15 dayType:v9];
  double v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", -[PowerUIDrainMonitor slotForDate:withTimeSlotWidth:](self, "slotForDate:withTimeSlotWidth:", v8, 15));
  uint64_t v12 = [v11 integerValue];

  uint64_t v13 = [NSNumber numberWithInteger:a3];
  [v6 setObject:v13 forKeyedSubscript:@"currentLevel"];

  int v14 = [NSNumber numberWithInteger:v12];
  [v6 setObject:v14 forKeyedSubscript:@"referenceLevel"];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 134218240;
    int64_t v25 = a3;
    __int16 v26 = 2048;
    uint64_t v27 = v12;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Current battery level %lu, Reference level %lu", (uint8_t *)&v24, 0x16u);
  }
  if ([(PowerUIDrainMonitor *)self hasVariationForMedianLevels:v10])
  {
    double v16 = 10.0;
    if (a3 < 50) {
      double v16 = 5.0;
    }
    if ((unint64_t)(a3 - 50) >= 0x1E) {
      double v17 = v16;
    }
    else {
      double v17 = 7.0;
    }
    double v18 = (double)(v12 - a3);
    if (v17 < v18)
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x263EFFA88], @"shouldEngage", v16);
      long long v19 = &unk_26D3853D8;
      if (v17 * 1.5 < v18) {
        long long v19 = &unk_26D3853C0;
      }
      if (v17 + v17 >= v18) {
        long long v20 = v19;
      }
      else {
        long long v20 = &unk_26D3853A8;
      }
      [v6 setObject:v20 forKeyedSubscript:@"mitigationEffort"];
    }
    BOOL v21 = [(PowerUIDrainMonitor *)self isAtKnownChargingLocation];
    long long v22 = [NSNumber numberWithBool:v21];
    [v6 setObject:v22 forKeyedSubscript:@"knownChargingLocation"];
  }
  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (UNUserNotificationCenter)unCenter
{
  return self->_unCenter;
}

- (void)setUnCenter:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (int)notifyTestToken
{
  return self->_notifyTestToken;
}

- (void)setNotifyTestToken:(int)a3
{
  self->_notifyTestToken = a3;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (PowerUILocationSignalMonitor)locationSignalMonitor
{
  return self->_locationSignalMonitor;
}

- (void)setLocationSignalMonitor:(id)a3
{
}

- (BOOL)didEnableLPM
{
  return self->_didEnableLPM;
}

- (void)setDidEnableLPM:(BOOL)a3
{
  self->_didEnableLPM = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationSignalMonitor, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_unCenter, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end