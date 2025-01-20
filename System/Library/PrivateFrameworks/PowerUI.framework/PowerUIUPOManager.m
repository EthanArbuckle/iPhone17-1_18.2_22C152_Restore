@interface PowerUIUPOManager
+ (id)sharedInstance;
- (BOOL)dataProviderLoaded;
- (NSBundle)bundle;
- (NSDate)lastTimeLocked;
- (NSDate)upoTime;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)lockNotificationQueue;
- (OS_dispatch_queue)notificationResponseQueue;
- (OS_os_log)log;
- (PowerUIUPOManager)init;
- (UNUserNotificationCenter)userNotificationCenter;
- (_CDContext)contextStore;
- (id)mitigationsEnabledNotificationRequest;
- (id)sortDescriptors;
- (int)mitigationsDisabledToken;
- (int)unlockToken;
- (void)clearMitigationsEnabledNotificationRequestIfNecessary;
- (void)dataProviderDidLoad;
- (void)displayMitigationsEnabledNotification;
- (void)registerForWithdrawalNotifications;
- (void)removeMitigationsEnabledNotification;
- (void)requestBulletin;
- (void)setBundle:(id)a3;
- (void)setContextStore:(id)a3;
- (void)setDataProviderLoaded:(BOOL)a3;
- (void)setDefaults:(id)a3;
- (void)setLastTimeLocked:(id)a3;
- (void)setLockNotificationQueue:(id)a3;
- (void)setLog:(id)a3;
- (void)setMitigationsDisabledToken:(int)a3;
- (void)setNotificationResponseQueue:(id)a3;
- (void)setUnlockToken:(int)a3;
- (void)setUpoTime:(id)a3;
- (void)setUserNotificationCenter:(id)a3;
@end

@implementation PowerUIUPOManager

- (PowerUIUPOManager)init
{
  v25.receiver = self;
  v25.super_class = (Class)PowerUIUPOManager;
  v2 = [(PowerUIUPOManager *)&v25 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(NSURL) initFileURLWithPath:@"/System/Library/PrivateFrameworks/PowerUI.framework"];
    uint64_t v4 = [MEMORY[0x263F086E0] bundleWithURL:v3];
    v5 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v4;

    os_log_t v6 = os_log_create("com.apple.thermalmonitor.ui", "mitigationsEnabled");
    v7 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.thermalmonitor.postUPONotificationResponseQueue", v8);
    v10 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, (dispatch_qos_class_t)2u, 0);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.thermalmonitor.lockNotificationQueue", v12);
    v14 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v13;

    *(void *)(v2 + 12) = -1;
    uint64_t v15 = [objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.powerui.thermalmonitor"];
    v16 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.thermalmonitor.mitigationsUI"];
    v18 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v17;

    [v2 clearMitigationsEnabledNotificationRequestIfNecessary];
    int out_token = 0;
    notify_register_dispatch("com.apple.language.changed", &out_token, MEMORY[0x263EF83A0], &__block_literal_global_5);
    int v23 = 0;
    v19 = *((void *)v2 + 11);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __25__PowerUIUPOManager_init__block_invoke_2;
    v21[3] = &unk_2645A5CA8;
    v22 = v2;
    notify_register_dispatch("com.apple.thermalmonitor.testdisplayuponotification", &v23, v19, v21);
  }
  return (PowerUIUPOManager *)v2;
}

void __25__PowerUIUPOManager_init__block_invoke()
{
}

uint64_t __25__PowerUIUPOManager_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) displayMitigationsEnabledNotification];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__PowerUIUPOManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, block);
  }
  v2 = (void *)sharedInstance_manager;
  return v2;
}

uint64_t __35__PowerUIUPOManager_sharedInstance__block_invoke()
{
  sharedInstance_manager = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x270F9A758]();
}

- (void)dataProviderDidLoad
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  self->_dataProviderLoaded = 1;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)MEMORY[0x263EFF910];
    uint64_t v4 = log;
    v5 = [v3 date];
    int v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_DEFAULT, "Data provider loaded: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)displayMitigationsEnabledNotification
{
  v3 = [(NSUserDefaults *)self->_defaults objectForKey:@"bulletinPosted"];

  if (v3) {
    [(UNUserNotificationCenter *)self->_userNotificationCenter removeAllDeliveredNotifications];
  }
  id v6 = [(PowerUIUPOManager *)self mitigationsEnabledNotificationRequest];
  [(UNUserNotificationCenter *)self->_userNotificationCenter addNotificationRequest:v6 withCompletionHandler:0];
  ADClientAddValueForScalarKey();
  [(NSUserDefaults *)self->_defaults setBool:1 forKey:@"bulletinPosted"];
  defaults = self->_defaults;
  v5 = [(PowerUIUPOManager *)self upoTime];
  [(NSUserDefaults *)defaults setObject:v5 forKey:@"upoTime"];
}

- (void)removeMitigationsEnabledNotification
{
  v3 = [(NSUserDefaults *)self->_defaults objectForKey:@"bulletinPosted"];

  if (v3) {
    [(UNUserNotificationCenter *)self->_userNotificationCenter removeAllDeliveredNotifications];
  }
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"upoTime"];
  defaults = self->_defaults;
  [(NSUserDefaults *)defaults removeObjectForKey:@"bulletinPosted"];
}

- (void)clearMitigationsEnabledNotificationRequestIfNecessary
{
  v3 = [(NSUserDefaults *)self->_defaults objectForKey:@"bulletinPosted"];

  if (v3)
  {
    uint64_t v4 = [(NSUserDefaults *)self->_defaults objectForKey:@"upoTime"];
    if (v4)
    {
      [(PowerUIUPOManager *)self setUpoTime:v4];
    }
    else
    {
      v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-180.0];
      [(PowerUIUPOManager *)self setUpoTime:v5];
    }
  }
  [(PowerUIUPOManager *)self registerForWithdrawalNotifications];
}

- (void)registerForWithdrawalNotifications
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  int v8 = 0;
  lockNotificationQueue = self->_lockNotificationQueue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __55__PowerUIUPOManager_registerForWithdrawalNotifications__block_invoke;
  handler[3] = &unk_2645A6018;
  handler[4] = self;
  handler[5] = v7;
  notify_register_dispatch("com.apple.springboard.lockstate", &self->_unlockToken, lockNotificationQueue, handler);
  uint64_t v4 = self->_lockNotificationQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__PowerUIUPOManager_registerForWithdrawalNotifications__block_invoke_33;
  v5[3] = &unk_2645A5CA8;
  v5[4] = self;
  notify_register_dispatch("com.apple.thermalmonitor.ageAwareMitigationsDisabled", &self->_mitigationsDisabledToken, v4, v5);
  _Block_object_dispose(v7, 8);
}

void __55__PowerUIUPOManager_registerForWithdrawalNotifications__block_invoke(uint64_t a1, int token)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  v3 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
    *(_DWORD *)buf = 134218240;
    uint64_t v24 = state64;
    __int16 v25 = 1024;
    int v26 = v4;
    _os_log_impl(&dword_22135E000, v3, OS_LOG_TYPE_DEFAULT, "Lock state changed: %llu (Loaded = %u)", buf, 0x12u);
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v5 = state64;
    id v6 = [MEMORY[0x263EFF910] date];
    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      int v8 = (void *)v7[7];
      v7[7] = v6;

      dispatch_queue_t v9 = *(NSObject **)(*(void *)(a1 + 32) + 72);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 56);
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = v10;
        _os_log_impl(&dword_22135E000, v9, OS_LOG_TYPE_DEFAULT, "Locked at %@", buf, 0xCu);
      }
      return;
    }
    v11 = [v7 upoTime];
    [v6 timeIntervalSinceDate:v11];
    double v13 = v12;

    uint64_t v14 = *(void *)(a1 + 32);
    if (v13 >= 180.0)
    {
      if (*(void *)(v14 + 56))
      {
        objc_msgSend(v6, "timeIntervalSinceDate:");
        if (v17 >= 15.0)
        {
          ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          v18 = *(NSObject **)(*(void *)(a1 + 32) + 72);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            int v19 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
            *(_DWORD *)buf = 67109120;
            LODWORD(v24) = v19;
            _os_log_impl(&dword_22135E000, v18, OS_LOG_TYPE_DEFAULT, "Unlock Count: %d", buf, 8u);
          }
          if (*(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= 1)
          {
            [*(id *)(a1 + 32) removeMitigationsEnabledNotification];
            uint64_t v20 = *(void *)(a1 + 32);
            int v21 = *(_DWORD *)(v20 + 16);
            if (v21 != -1)
            {
              notify_cancel(v21);
              uint64_t v20 = *(void *)(a1 + 32);
            }
            notify_cancel(*(_DWORD *)(v20 + 12));
          }
          goto LABEL_21;
        }
        uint64_t v15 = *(NSObject **)(*(void *)(a1 + 32) + 72);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v24) = 15;
          v16 = "Device was locked for less than %ds. Not counting this unlock";
          goto LABEL_14;
        }
      }
    }
    else
    {
      uint64_t v15 = *(NSObject **)(v14 + 72);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v24) = 180;
        v16 = "Notification posted less than %ds ago. Not counting this unlock.";
LABEL_14:
        _os_log_impl(&dword_22135E000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 8u);
      }
    }
LABEL_21:
  }
}

uint64_t __55__PowerUIUPOManager_registerForWithdrawalNotifications__block_invoke_33(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_22135E000, v2, OS_LOG_TYPE_DEFAULT, "Mitigations disabled.", v6, 2u);
  }
  [*(id *)(a1 + 32) removeMitigationsEnabledNotification];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(_DWORD *)(v3 + 12);
  if (v4 != -1)
  {
    notify_cancel(v4);
    uint64_t v3 = *(void *)(a1 + 32);
  }
  return notify_cancel(*(_DWORD *)(v3 + 16));
}

- (void)requestBulletin
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Bulletin requested", buf, 2u);
  }
  int v4 = [MEMORY[0x263EFF910] date];
  [(PowerUIUPOManager *)self setUpoTime:v4];

  char v6 = 0;
  uint64_t v5 = SBSSpringBoardBlockableServerPort();
  MEMORY[0x223C80720](v5, &v6, 900);
  [(PowerUIUPOManager *)self displayMitigationsEnabledNotification];
  [(PowerUIUPOManager *)self registerForWithdrawalNotifications];
}

- (id)sortDescriptors
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)mitigationsEnabledNotificationRequest
{
  id v3 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  int v4 = [NSString localizedUserNotificationStringForKey:@"MITIGATIONS_UPO_ENABLED_TITLE" arguments:0];
  [v3 setTitle:v4];

  uint64_t v5 = [NSString localizedUserNotificationStringForKey:@"MITIGATIONS_UPO_ENABLED_BODY" arguments:0];
  [v3 setBody:v5];

  [v3 setCategoryIdentifier:@"mitigations-enabled"];
  char v6 = [(PowerUIUPOManager *)self upoTime];
  [v3 setDate:v6];

  [v3 setShouldSuppressScreenLightUp:1];
  v7 = [NSURL URLWithString:@"prefs:root=BATTERY_USAGE&path=BATTERY_HEALTH"];
  [v3 setDefaultActionURL:v7];

  int v8 = [MEMORY[0x263F1DF40] iconForApplicationIdentifier:@"com.apple.Preferences"];
  [v3 setIcon:v8];

  dispatch_queue_t v9 = (void *)MEMORY[0x263F1DF48];
  uint64_t v10 = [MEMORY[0x263F08C38] UUID];
  v11 = [v10 UUIDString];
  double v12 = [v9 requestWithIdentifier:v11 content:v3 trigger:0];

  return v12;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void)setUserNotificationCenter:(id)a3
{
}

- (BOOL)dataProviderLoaded
{
  return self->_dataProviderLoaded;
}

- (void)setDataProviderLoaded:(BOOL)a3
{
  self->_dataProviderLoaded = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (_CDContext)contextStore
{
  return self->_contextStore;
}

- (void)setContextStore:(id)a3
{
}

- (int)unlockToken
{
  return self->_unlockToken;
}

- (void)setUnlockToken:(int)a3
{
  self->_unlockToken = a3;
}

- (int)mitigationsDisabledToken
{
  return self->_mitigationsDisabledToken;
}

- (void)setMitigationsDisabledToken:(int)a3
{
  self->_mitigationsDisabledToken = a3;
}

- (NSDate)lastTimeLocked
{
  return self->_lastTimeLocked;
}

- (void)setLastTimeLocked:(id)a3
{
}

- (NSDate)upoTime
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUpoTime:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)lockNotificationQueue
{
  return self->_lockNotificationQueue;
}

- (void)setLockNotificationQueue:(id)a3
{
}

- (OS_dispatch_queue)notificationResponseQueue
{
  return self->_notificationResponseQueue;
}

- (void)setNotificationResponseQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationResponseQueue, 0);
  objc_storeStrong((id *)&self->_lockNotificationQueue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_upoTime, 0);
  objc_storeStrong((id *)&self->_lastTimeLocked, 0);
  objc_storeStrong((id *)&self->_contextStore, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end