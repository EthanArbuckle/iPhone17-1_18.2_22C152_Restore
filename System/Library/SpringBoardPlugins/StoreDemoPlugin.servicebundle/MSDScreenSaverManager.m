@interface MSDScreenSaverManager
+ (id)sharedInstance;
+ (void)awakeFromBundle;
- (BLSAssertion)backlightAssertion;
- (BOOL)handleIdleTimerDidExpire;
- (BOOL)handleIdleTimerDidWarn;
- (BOOL)isInStandbyMode:(id)a3;
- (BOOL)isRetailDeviceContentUpdating;
- (BOOL)isStandbyMode;
- (BOOL)justBootUp;
- (BOOL)loadScreenSaverConfig;
- (BOOL)screenSaverRunning;
- (BOOL)shouldHandleIdleHandler;
- (BOOL)shouldSetupIdleHandler;
- (BOOL)turnOffAlwaysOnTimeAtNight;
- (BOOL)turnOffDisplayAtNight;
- (BSInvalidatable)idleTimerAssertion;
- (MSDScreenSaverManager)init;
- (MSDStoreHoursManager)storeHoursManager;
- (NSArray)storeHourSettings;
- (NSDate)lastSettingsUpdated;
- (NSDate)sessionStartTime;
- (NSString)screenSaverAppID;
- (OS_dispatch_queue)workQueue;
- (PCPersistentTimer)aotTimer;
- (PCPersistentTimer)timer;
- (RBSProcessMonitor)monitor;
- (id)applicationStateString:(unsigned __int8)a3 withVisibility:(BOOL)a4;
- (id)getLastAutoRebootTime;
- (id)getLastSettingsUpdatedTime;
- (id)getStoreHours;
- (id)readHubSuppliedSettings;
- (id)readLastAutoReboot;
- (id)readLastSettingsUpdated;
- (int)getDemoMode;
- (int)readDemoMode;
- (int64_t)backlightLevel;
- (unint64_t)deviceType;
- (void)acquireDisableAlwaysOnTimeAssertion;
- (void)applicationsDidInstall:(id)a3;
- (void)assertion:(id)a3 didFailToAcquireWithError:(id)a4;
- (void)assertionWasAcquired:(id)a3;
- (void)handleAlwaysOnTimeToggleTimerFired:(id)a3;
- (void)handleApplicationStateChanged:(id)a3;
- (void)handleSpringBoardLaunch;
- (void)handleStoreHourSettingsChanged:(id)a3;
- (void)launchScreenSaver;
- (void)launchScreenSaverTimerFired;
- (void)launchSpringBoard;
- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4;
- (void)releaseDisableAlwaysOnTimeAssertion;
- (void)screenSaverStarted;
- (void)screenSaverStopped;
- (void)setAotTimer:(id)a3;
- (void)setBacklightAssertion:(id)a3;
- (void)setBacklightLevel:(int64_t)a3;
- (void)setDeviceType:(unint64_t)a3;
- (void)setIdleTimerAssertion:(id)a3;
- (void)setIsStandbyMode:(BOOL)a3;
- (void)setJustBootUp:(BOOL)a3;
- (void)setLastSettingsUpdated:(id)a3;
- (void)setMonitor:(id)a3;
- (void)setScreenSaverAppID:(id)a3;
- (void)setScreenSaverRunning:(BOOL)a3;
- (void)setSessionStartTime:(id)a3;
- (void)setStoreHourSettings:(id)a3;
- (void)setStoreHoursManager:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTurnOffAlwaysOnTimeAtNight:(BOOL)a3;
- (void)setTurnOffDisplayAtNight:(BOOL)a3;
- (void)setWorkQueue:(id)a3;
- (void)setupAlwaysOnTimeToggleTimer;
- (void)setupIdleTimerHandler;
- (void)stopScreenSaver;
- (void)stopScreenSaverTimerFired;
@end

@implementation MSDScreenSaverManager

+ (void)awakeFromBundle
{
  v2 = sub_7D3C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, " ", buf, 2u);
  }

  v3 = sub_7D3C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "StoreDemo plugin awake.", v5, 2u);
  }

  id v4 = +[MSDScreenSaverManager sharedInstance];
}

+ (id)sharedInstance
{
  if (qword_1E6F0 != -1) {
    dispatch_once(&qword_1E6F0, &stru_187B8);
  }
  v2 = (void *)qword_1E6E8;

  return v2;
}

- (MSDScreenSaverManager)init
{
  v36.receiver = self;
  v36.super_class = (Class)MSDScreenSaverManager;
  v2 = [(MSDScreenSaverManager *)&v36 init];
  v3 = v2;
  if (v2)
  {
    [(MSDScreenSaverManager *)v2 setJustBootUp:1];
    id v4 = +[MSDKManagedDevice sharedInstance];
    -[MSDScreenSaverManager setDeviceType:](v3, "setDeviceType:", [v4 typeOfDemoDevice:0]);

    if (CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", 0))
    {
      dispatch_queue_t v5 = dispatch_queue_create("com.apple.StoreDemoPlugin", 0);
      [(MSDScreenSaverManager *)v3 setWorkQueue:v5];

      unsigned int v6 = +[MSDHubFeatureFlags disableScreenDarkHours];
      if ((v6 & 1) == 0)
      {
        v7 = sub_7D3C();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Will turn off display at night due to screen dark hours override.", buf, 2u);
        }
      }
      [(MSDScreenSaverManager *)v3 setTurnOffDisplayAtNight:v6 ^ 1];
      v8 = (void *)MGCopyAnswer();
      v31 = v8;
      if (v8 && [v8 BOOLValue])
      {
        v9 = sub_7D3C();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Will turn off always-on time at night for Andromeda device.", buf, 2u);
        }

        uint64_t v10 = 1;
      }
      else
      {
        uint64_t v10 = 0;
      }
      [(MSDScreenSaverManager *)v3 setTurnOffAlwaysOnTimeAtNight:v10];
      v11 = +[NSArray arrayWithObjects:@"com.apple.ist.demoloop", @"com.retailtech.arkenstone", @"com.apple.ist.DemoDiscoveryApp", @"com.apple.ist.windward", @"com.apple.ist.DigitalSignage.iOS", 0];
      v12 = +[LSApplicationWorkspace defaultWorkspace];
      [v12 addObserver:v3];

      v13 = sub_7D3C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Observer for LSApplicationWorkSpace registered.", buf, 2u);
      }

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v14 = v11;
      id v15 = [v14 countByEnumeratingWithState:&v32 objects:v39 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v33;
        while (2)
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v33 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            v20 = +[LSApplicationProxy applicationProxyForIdentifier:v19 placeholder:0];
            v21 = v20;
            if (v20)
            {
              v22 = [v20 appState];
              unsigned int v23 = [v22 isInstalled];

              if (v23)
              {
                [(MSDScreenSaverManager *)v3 setScreenSaverAppID:v19];

                goto LABEL_29;
              }
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v32 objects:v39 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
LABEL_29:

      v26 = sub_7D3C();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = [(MSDScreenSaverManager *)v3 screenSaverAppID];
        *(_DWORD *)buf = 138543362;
        v38 = v27;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "Screen saver app is %{public}@", buf, 0xCu);
      }
      v28 = [(MSDScreenSaverManager *)v3 screenSaverAppID];

      if (v28) {
        [(MSDScreenSaverManager *)v3 setupIdleTimerHandler];
      }
      v29 = v3;
    }
    else
    {
      v24 = sub_7D3C();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Store Demo Mode bit is not on.", buf, 2u);
      }

      v25 = v3;
    }
  }

  return v3;
}

- (void)setupIdleTimerHandler
{
  if ([(MSDScreenSaverManager *)self shouldSetupIdleHandler])
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    [v3 setBool:1 forKey:@"SBUsesStoreDemoPlugin"];

    id v4 = sub_7D3C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "SBUsesStoreDemoPlugin set!", buf, 2u);
    }

    dispatch_queue_t v5 = +[MSDStoreHoursManager sharedInstance];
    [(MSDScreenSaverManager *)self setStoreHoursManager:v5];

    [(MSDScreenSaverManager *)self setStoreHourSettings:0];
    unsigned int v6 = +[NSDistributedNotificationCenter defaultCenter];
    [v6 addObserver:self selector:"handleStoreHourSettingsChanged:" name:@"com.apple.MobileStoreDemo.SettingsUpdated" object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:self selector:"handleStoreHourSettingsChanged:" name:@"com.apple.MobileStoreDemo.StoreHours.Expired" object:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:self selector:"handleStoreHourSettingsChanged:" name:NSSystemClockDidChangeNotification object:0];

    [(MSDScreenSaverManager *)self loadScreenSaverConfig];
    v9 = +[SBIdleTimerRequestConfiguration configurationWithIdleEventHandler:self];
    uint64_t v10 = +[ITIdleTimerState sharedInstance];
    id v11 = [v10 newIdleTimerAssertionWithConfiguration:v9 forReason:@"MSD - Screen saver idle timer"];
    [(MSDScreenSaverManager *)self setIdleTimerAssertion:v11];

    v12 = sub_7D3C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v23 = "-[MSDScreenSaverManager setupIdleTimerHandler]";
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%s - Idle timer assertion acquired.", buf, 0xCu);
    }

    [(MSDScreenSaverManager *)self setBacklightLevel:-1];
    v13 = +[FBSDisplayLayoutMonitor sharedMonitorForDisplayType:0];
    [v13 addObserver:self];
    id v14 = [(MSDScreenSaverManager *)self monitor];

    if (v14)
    {
      id v15 = [(MSDScreenSaverManager *)self monitor];
      [v15 invalidate];

      [(MSDScreenSaverManager *)self setMonitor:0];
    }
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_91D4;
    v21[3] = &unk_18808;
    v21[4] = self;
    id v16 = +[RBSProcessMonitor monitorWithConfiguration:v21];
    [(MSDScreenSaverManager *)self setMonitor:v16];

    uint64_t v17 = sub_7D3C();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v23 = "-[MSDScreenSaverManager setupIdleTimerHandler]";
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "%s - RBSProcessMonitor initialized.", buf, 0xCu);
    }

    if ([(MSDScreenSaverManager *)self turnOffAlwaysOnTimeAtNight]) {
      [(MSDScreenSaverManager *)self setupAlwaysOnTimeToggleTimer];
    }
    v18 = +[NSDate now];
    [(MSDScreenSaverManager *)self setSessionStartTime:v18];

    if ((char *)[(MSDScreenSaverManager *)self deviceType] == (char *)&dword_4 + 2)
    {
      uint64_t v19 = +[MSDKManagedDevice sharedInstance];
      [v19 stashCurrentWallpaperSettingsIfNeeded];

      v20 = +[MSDKManagedDevice sharedInstance];
      [v20 initializeAppSwitcherContent];
    }
  }
}

- (BOOL)handleIdleTimerDidWarn
{
  v3 = sub_7D3C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    unsigned int v6 = "-[MSDScreenSaverManager handleIdleTimerDidWarn]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s get called.", (uint8_t *)&v5, 0xCu);
  }

  return [(MSDScreenSaverManager *)self shouldHandleIdleHandler];
}

- (BOOL)handleIdleTimerDidExpire
{
  v3 = sub_7D3C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[MSDScreenSaverManager handleIdleTimerDidExpire]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s get called.", buf, 0xCu);
  }

  BOOL v4 = [(MSDScreenSaverManager *)self shouldHandleIdleHandler];
  if (v4)
  {
    int v5 = [(MSDScreenSaverManager *)self workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_952C;
    block[3] = &unk_185A0;
    block[4] = self;
    dispatch_async(v5, block);
  }
  return v4;
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [(MSDScreenSaverManager *)self workQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_95E8;
  v8[3] = &unk_18830;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)assertionWasAcquired:(id)a3
{
  v3 = sub_7D3C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Backlight assertion was acquired!", v4, 2u);
  }
}

- (void)assertion:(id)a3 didFailToAcquireWithError:(id)a4
{
  id v4 = a4;
  id v5 = sub_7D3C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_EE54(v4, v5);
  }
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v22 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v22)
  {
    uint64_t v6 = *(void *)v26;
    v21 = v24;
    *(void *)&long long v5 = 138543362;
    long long v20 = v5;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v7);
        id v9 = objc_msgSend(v8, "bundleIdentifier", v20, v21);
        if (([v9 isEqualToString:@"com.apple.ist.demoloop"] & 1) == 0)
        {
          uint64_t v10 = [v8 bundleIdentifier];
          if (([v10 isEqualToString:@"com.apple.ist.windward"] & 1) == 0)
          {
            id v11 = [v8 bundleIdentifier];
            if (![v11 isEqualToString:@"com.apple.ist.DemoDiscoveryApp"])
            {
              [v8 bundleIdentifier];
              uint64_t v15 = v6;
              v17 = id v16 = v4;
              unsigned __int8 v18 = [v17 isEqualToString:@"com.retailtech.arkenstone"];

              id v4 = v16;
              uint64_t v6 = v15;

              if ((v18 & 1) == 0) {
                goto LABEL_15;
              }
              goto LABEL_12;
            }
          }
        }

LABEL_12:
        v12 = sub_7D3C();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = [v8 bundleIdentifier];
          *(_DWORD *)buf = v20;
          v30 = v13;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "StoreDemo plugin: %{public}@ app installed", buf, 0xCu);
        }
        id v14 = [(MSDScreenSaverManager *)self workQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        v24[0] = sub_9DEC;
        v24[1] = &unk_18830;
        v24[2] = self;
        v24[3] = v8;
        dispatch_async(v14, block);

LABEL_15:
        id v7 = (char *)v7 + 1;
      }
      while (v22 != v7);
      id v19 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
      id v22 = v19;
    }
    while (v19);
  }
}

- (BOOL)isRetailDeviceContentUpdating
{
  v3 = [(MSDScreenSaverManager *)self screenSaverAppID];
  if ([v3 isEqualToString:@"com.apple.ist.windward"])
  {
  }
  else
  {
    id v4 = [(MSDScreenSaverManager *)self screenSaverAppID];
    unsigned int v5 = [v4 isEqualToString:@"com.apple.ist.DemoDiscoveryApp"];

    if (!v5) {
      return 0;
    }
  }
  unsigned int v6 = [(MSDScreenSaverManager *)self getDemoMode];
  return v6 == 2 || v6 == 4;
}

- (BOOL)shouldHandleIdleHandler
{
  if (BYSetupAssistantNeedsToRun())
  {
    v3 = sub_7D3C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v5 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Buddy is still running, will not launch screen saver.", v5, 2u);
    }

    return 0;
  }
  else
  {
    return [(MSDScreenSaverManager *)self shouldSetupIdleHandler];
  }
}

- (BOOL)shouldSetupIdleHandler
{
  unsigned int v3 = [(MSDScreenSaverManager *)self getDemoMode];
  BOOL result = 1;
  if (v3 && v3 != 5)
  {
    if ([(MSDScreenSaverManager *)self isRetailDeviceContentUpdating])
    {
      return 1;
    }
    else
    {
      unsigned int v5 = sub_7D3C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v6 = [(MSDScreenSaverManager *)self screenSaverAppID];
        v7[0] = 67109378;
        v7[1] = v3;
        __int16 v8 = 2114;
        id v9 = v6;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Device in mode %d, screensaver: %{public}@, will not launch screen saver.", (uint8_t *)v7, 0x12u);
      }
      return 0;
    }
  }
  return result;
}

- (void)handleApplicationStateChanged:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MSDScreenSaverManager *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  _DWORD v7[2] = sub_A120;
  v7[3] = &unk_18830;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)handleStoreHourSettingsChanged:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MSDScreenSaverManager *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  _DWORD v7[2] = sub_A334;
  v7[3] = &unk_18830;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)loadScreenSaverConfig
{
  unsigned int v3 = [(MSDScreenSaverManager *)self getStoreHours];
  id v4 = [(MSDScreenSaverManager *)self getLastSettingsUpdatedTime];
  uint64_t v5 = [(MSDScreenSaverManager *)self storeHourSettings];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [(MSDScreenSaverManager *)self lastSettingsUpdated];
    if (v7)
    {
      id v8 = (void *)v7;
      id v9 = [(MSDScreenSaverManager *)self storeHourSettings];
      if ([v9 isEqualToArray:v3])
      {
        uint64_t v10 = [(MSDScreenSaverManager *)self lastSettingsUpdated];
        unsigned __int8 v11 = [v10 isEqualToDate:v4];

        if (v11) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }
    }
  }
LABEL_8:
  v12 = [(MSDScreenSaverManager *)self storeHoursManager];
  [v12 updateStoreHours:v3 lastSettingsUpdatedDate:v4];

  [(MSDScreenSaverManager *)self setStoreHourSettings:v3];
  [(MSDScreenSaverManager *)self setLastSettingsUpdated:v4];
LABEL_9:
  v13 = [(MSDScreenSaverManager *)self storeHoursManager];
  unsigned __int8 v14 = [v13 evaluateStoreStatusAgainstCurrentTime];

  return v14;
}

- (void)handleSpringBoardLaunch
{
  if ([(MSDScreenSaverManager *)self turnOffDisplayAtNight])
  {
    unsigned int v3 = [(MSDScreenSaverManager *)self getLastAutoRebootTime];
    [(MSDScreenSaverManager *)self loadScreenSaverConfig];
    id v4 = [(MSDScreenSaverManager *)self storeHoursManager];
    if (([v4 isStoreOpenNow] & 1) != 0
      || !v3
      || ([v3 timeIntervalSinceNow], v5 <= -180.0))
    {
    }
    else
    {
      id v6 = [(MSDScreenSaverManager *)self screenSaverAppID];
      unsigned int v7 = [v6 isEqualToString:@"com.apple.ist.demoloop"];

      if (v7)
      {
        id v8 = sub_7D3C();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Channel device auto-rebooted during close hour, will not launch screensaver.", buf, 2u);
        }

        [(MSDScreenSaverManager *)self stopScreenSaver];
        return;
      }
    }
  }
  if ([(MSDScreenSaverManager *)self shouldHandleIdleHandler])
  {
    id v9 = sub_7D3C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Launching screen saver right after system boot.", v10, 2u);
    }

    [(MSDScreenSaverManager *)self launchScreenSaver];
  }
}

- (void)launchSpringBoard
{
  id v2 = objc_alloc_init((Class)FBSOpenApplicationService);
  unsigned int v3 = sub_7D3C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "StoreDemo plugin: launching SpringBoard.", v6, 2u);
  }

  uint64_t v7 = FBSOpenApplicationOptionKeyUnlockDevice;
  id v8 = &__kCFBooleanTrue;
  id v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  double v5 = +[FBSOpenApplicationOptions optionsWithDictionary:v4];

  [v2 openApplication:@"com.apple.springboard" withOptions:v5 completion:&stru_18870];
}

- (void)launchScreenSaver
{
  if (![(MSDScreenSaverManager *)self screenSaverRunning])
  {
    unsigned int v3 = sub_7D3C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v14 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "StoreDemo plugin: launching screen saver.", v14, 2u);
    }

    id v4 = objc_alloc_init((Class)FBSOpenApplicationService);
    double v5 = [(MSDScreenSaverManager *)self screenSaverAppID];
    if ([v5 isEqualToString:@"com.apple.ist.windward"])
    {
    }
    else
    {
      id v6 = [(MSDScreenSaverManager *)self screenSaverAppID];
      unsigned int v7 = [v6 isEqualToString:@"com.apple.ist.DemoDiscoveryApp"];

      if (!v7)
      {
        v12 = sub_7D3C();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)unsigned __int8 v14 = 0;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Opening app without URL", v14, 2u);
        }

        uint64_t v15 = FBSOpenApplicationOptionKeyUnlockDevice;
        id v16 = &__kCFBooleanTrue;
        id v9 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
        unsigned __int8 v11 = +[FBSOpenApplicationOptions optionsWithDictionary:v9];
        goto LABEL_13;
      }
    }
    id v8 = sub_7D3C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v14 = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Opening app with URL", v14, 2u);
    }

    v17[0] = FBSOpenApplicationOptionKeyUnlockDevice;
    v17[1] = FBSOpenApplicationOptionKeyPayloadURL;
    v18[0] = &__kCFBooleanTrue;
    id v9 = +[NSURL URLWithString:@"msdss://"];
    v18[1] = v9;
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    unsigned __int8 v11 = +[FBSOpenApplicationOptions optionsWithDictionary:v10];

LABEL_13:
    v13 = [(MSDScreenSaverManager *)self screenSaverAppID];
    [v4 openApplication:v13 withOptions:v11 completion:&stru_18890];
  }
}

- (id)applicationStateString:(unsigned __int8)a3 withVisibility:(BOOL)a4
{
  id v4 = @"0 - RBSTaskStateUnknown";
  switch(a3)
  {
    case 0u:
      break;
    case 1u:
      id v4 = @"1 - RBSTaskStateNone";
      break;
    case 2u:
      id v4 = @"2 - RBSTaskStateRunningUnknown";
      break;
    case 3u:
      id v4 = @"3 - RBSTaskStateRunningSuspended";
      break;
    case 4u:
      if (a4) {
        CFStringRef v5 = @"(Foreground)";
      }
      else {
        CFStringRef v5 = @"(Background)";
      }
      id v4 = [@"4 - RBSTaskStateRunningScheduled" stringByAppendingString:v5];
      break;
    default:
      id v4 = +[NSString stringWithFormat:@"%d - StateUnknown", a4, a3];
      break;
  }

  return v4;
}

- (void)screenSaverStopped
{
  if ([(MSDScreenSaverManager *)self screenSaverRunning])
  {
    unsigned int v3 = +[NSDate now];
    [(MSDScreenSaverManager *)self setSessionStartTime:v3];

    id v4 = [(MSDScreenSaverManager *)self timer];

    if (v4)
    {
      CFStringRef v5 = [(MSDScreenSaverManager *)self timer];
      id v6 = [v5 userInfo];
      unsigned int v7 = [v6 objectForKey:@"LaunchScreenSaver"];

      if (v7 && [v7 BOOLValue])
      {
        id v8 = sub_7D3C();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Timer will be kept alive since its purpose is to relaunch screen saver later.", buf, 2u);
        }
      }
      else
      {
        id v9 = sub_7D3C();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)unsigned __int8 v11 = 0;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Timer will be canceled because screen saver stopped.", v11, 2u);
        }

        uint64_t v10 = [(MSDScreenSaverManager *)self timer];
        [v10 invalidate];

        [(MSDScreenSaverManager *)self setTimer:0];
      }
    }
  }
  [(MSDScreenSaverManager *)self setScreenSaverRunning:0];
}

- (void)screenSaverStarted
{
  if (![(MSDScreenSaverManager *)self screenSaverRunning])
  {
    [(MSDScreenSaverManager *)self setScreenSaverRunning:1];
    unsigned int v3 = [(MSDScreenSaverManager *)self sessionStartTime];

    if (v3)
    {
      id v4 = +[MSDKManagedDevice sharedInstance];
      CFStringRef v5 = [(MSDScreenSaverManager *)self sessionStartTime];
      id v6 = +[NSDate now];
      [v4 collectAppUsageWithSessionStart:v5 andEnd:v6];
    }
    if ([(MSDScreenSaverManager *)self isRetailDeviceContentUpdating]
      || ![(MSDScreenSaverManager *)self turnOffDisplayAtNight])
    {
      id v8 = sub_7D3C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "DemoUpdate on retail device, will run Pricing app till reboot (or it get killed).", buf, 2u);
      }
    }
    else
    {
      [(MSDScreenSaverManager *)self loadScreenSaverConfig];
      unsigned int v7 = [(MSDScreenSaverManager *)self storeHoursManager];
      id v8 = [v7 screenSaverShouldRunUntil];

      [v8 timeIntervalSinceNow];
      uint64_t v10 = (uint64_t)v9;
      unsigned __int8 v11 = sub_7D3C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [v8 toString];
        *(_DWORD *)buf = 134218242;
        uint64_t v21 = v10;
        __int16 v22 = 2114;
        unsigned int v23 = v12;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "The app should run for %td seconds (till %{public}@).", buf, 0x16u);
      }
      id v13 = [objc_alloc((Class)PCPersistentTimer) initWithTimeInterval:@"com.apple.StoreDemoPlugin.stopScreenSaver" serviceIdentifier:self target:"stopScreenSaverTimerFired" selector:0 userInfo:(double)v10];
      [(MSDScreenSaverManager *)self setTimer:v13];

      unsigned __int8 v14 = [(MSDScreenSaverManager *)self timer];
      [v14 setMinimumEarlyFireProportion:1.0];

      uint64_t v15 = [(MSDScreenSaverManager *)self timer];
      id v16 = [(MSDScreenSaverManager *)self workQueue];
      [v15 scheduleInQueue:v16];
    }
    dispatch_time_t v17 = dispatch_time(0, 5000000000);
    unsigned __int8 v18 = [(MSDScreenSaverManager *)self workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_B328;
    block[3] = &unk_185A0;
    block[4] = self;
    dispatch_after(v17, v18, block);
  }
}

- (void)stopScreenSaverTimerFired
{
  unsigned int v3 = sub_7D3C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Timer to stop screen saver fired.", v4, 2u);
  }

  [(MSDScreenSaverManager *)self stopScreenSaver];
}

- (void)stopScreenSaver
{
  [(MSDScreenSaverManager *)self loadScreenSaverConfig];
  unsigned int v3 = [(MSDScreenSaverManager *)self storeHoursManager];
  id v4 = [v3 screenSaverShouldLaunchAt];

  [v4 timeIntervalSinceNow];
  uint64_t v6 = (uint64_t)v5;
  unsigned int v7 = [(MSDScreenSaverManager *)self timer];

  if (v7)
  {
    id v8 = [(MSDScreenSaverManager *)self timer];
    [v8 invalidate];
  }
  id v9 = [objc_alloc((Class)PCPersistentTimer) initWithTimeInterval:@"com.apple.StoreDemoPlugin.launchScreenSaver" serviceIdentifier:self target:"launchScreenSaverTimerFired" selector:&off_19568 userInfo:(double)v6];
  [(MSDScreenSaverManager *)self setTimer:v9];

  uint64_t v10 = [(MSDScreenSaverManager *)self timer];
  [v10 setMinimumEarlyFireProportion:1.0];

  unsigned __int8 v11 = [(MSDScreenSaverManager *)self timer];
  v12 = [(MSDScreenSaverManager *)self workQueue];
  [v11 scheduleInQueue:v12];

  id v13 = sub_7D3C();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v14 = [v4 toString];
    int v15 = 138543362;
    id v16 = v14;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Timer scheduled to run screen saver at %{public}@", (uint8_t *)&v15, 0xCu);
  }
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_188D0);
}

- (void)launchScreenSaverTimerFired
{
  unsigned int v3 = sub_7D3C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Timer to launch screen saver fired.", v4, 2u);
  }

  [(MSDScreenSaverManager *)self launchScreenSaver];
}

- (void)setupAlwaysOnTimeToggleTimer
{
  [(MSDScreenSaverManager *)self loadScreenSaverConfig];
  unsigned int v3 = [(MSDScreenSaverManager *)self storeHoursManager];
  unsigned int v4 = [v3 isStoreOpenNow];

  double v5 = [(MSDScreenSaverManager *)self storeHoursManager];
  uint64_t v6 = [v5 nextStoreOpenDate];

  unsigned int v7 = [(MSDScreenSaverManager *)self storeHoursManager];
  id v8 = [v7 nextStoreClosedDate];

  [v6 timeIntervalSinceNow];
  double v10 = v9;
  [v8 timeIntervalSinceNow];
  if (v10 <= 0.0 || v11 <= 0.0)
  {
    unsigned __int8 v14 = sub_7D3C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_EEEC(v14);
    }

    BOOL v12 = 0;
    BOOL v13 = 0;
    unsigned int v4 = 1;
  }
  else
  {
    BOOL v12 = v10 < 60.0;
    BOOL v13 = v11 < 60.0;
  }
  int v15 = sub_7D3C();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 67109632;
    *(_DWORD *)v29 = v4;
    *(_WORD *)&v29[4] = 1024;
    *(_DWORD *)&v29[6] = v12;
    LOWORD(v30) = 1024;
    *(_DWORD *)((char *)&v30 + 2) = v13;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Setting up AOT toggle timer: Store open=%{BOOL}d, Soon open=%{BOOL}d, Soon close=%{BOOL}d", (uint8_t *)&v28, 0x14u);
  }

  if (v4)
  {
    if (v13)
    {
LABEL_11:
      id v16 = [v6 dateByAddingTimeInterval:-30.0];
      [(MSDScreenSaverManager *)self acquireDisableAlwaysOnTimeAssertion];
      goto LABEL_14;
    }
  }
  else if (!v12)
  {
    goto LABEL_11;
  }
  id v16 = [v8 dateByAddingTimeInterval:-30.0];
  [(MSDScreenSaverManager *)self releaseDisableAlwaysOnTimeAssertion];
LABEL_14:
  [v16 timeIntervalSinceNow];
  double v18 = v17;
  if (v17 <= 0.0)
  {
    id v19 = sub_7D3C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "AOT toggle timer interval is negative. Use default value of 3600 seconds.", (uint8_t *)&v28, 2u);
    }

    double v18 = 3600.0;
  }
  long long v20 = sub_7D3C();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = [v16 toString];
    int v28 = 134218242;
    *(double *)v29 = v18;
    *(_WORD *)&v29[8] = 2114;
    v30 = v21;
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "AOT toggle timer will fire in %f seconds (at %{public}@).", (uint8_t *)&v28, 0x16u);
  }
  __int16 v22 = [(MSDScreenSaverManager *)self aotTimer];

  if (v22)
  {
    unsigned int v23 = [(MSDScreenSaverManager *)self aotTimer];
    [v23 invalidate];

    [(MSDScreenSaverManager *)self setAotTimer:0];
  }
  id v24 = [objc_alloc((Class)PCPersistentTimer) initWithTimeInterval:@"com.apple.StoreDemoPlugin.AlwaysOnTimeToggle" serviceIdentifier:self target:"handleAlwaysOnTimeToggleTimerFired:" selector:0 userInfo:v18];
  [(MSDScreenSaverManager *)self setAotTimer:v24];

  long long v25 = [(MSDScreenSaverManager *)self aotTimer];
  [v25 setMinimumEarlyFireProportion:1.0];

  long long v26 = [(MSDScreenSaverManager *)self aotTimer];
  long long v27 = [(MSDScreenSaverManager *)self workQueue];
  [v26 scheduleInQueue:v27];
}

- (void)handleAlwaysOnTimeToggleTimerFired:(id)a3
{
  unsigned int v4 = sub_7D3C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "AOT toggle timer fired to toggle AOT!", v5, 2u);
  }

  [(MSDScreenSaverManager *)self launchSpringBoard];
  [(MSDScreenSaverManager *)self setupAlwaysOnTimeToggleTimer];
}

- (void)acquireDisableAlwaysOnTimeAssertion
{
  unsigned int v3 = sub_7D3C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v9 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Acquiring backlight assertion for disabling always-on time.", v9, 2u);
  }

  unsigned int v4 = [(MSDScreenSaverManager *)self backlightAssertion];

  if (v4)
  {
    double v5 = sub_7D3C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v9 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Backlight assertion is already acquired!", v9, 2u);
    }
  }
  else
  {
    uint64_t v6 = +[BLSDisableAlwaysOnAttribute disableAlwaysOn];
    v10[0] = v6;
    unsigned int v7 = +[BLSValidWhenBacklightInactiveAttribute ignoreWhenBacklightInactivates];
    v10[1] = v7;
    double v5 = +[NSArray arrayWithObjects:v10 count:2];

    id v8 = +[BLSAssertion acquireWithExplanation:@"Store Demo - Night Time Disable" observer:self attributes:v5];
    [(MSDScreenSaverManager *)self setBacklightAssertion:v8];
  }
}

- (void)releaseDisableAlwaysOnTimeAssertion
{
  unsigned int v3 = sub_7D3C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Releasing backlight assertion for disabling always-on time.", buf, 2u);
  }

  unsigned int v4 = [(MSDScreenSaverManager *)self backlightAssertion];

  if (v4)
  {
    double v5 = [(MSDScreenSaverManager *)self backlightAssertion];
    [v5 invalidate];

    [(MSDScreenSaverManager *)self setBacklightAssertion:0];
  }
  else
  {
    uint64_t v6 = sub_7D3C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v7 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Backlight assertion is already released!", v7, 2u);
    }
  }
}

- (int)getDemoMode
{
  int result = +[MSDPreferencesFile preferencesFileExists];
  if (result)
  {
    return [(MSDScreenSaverManager *)self readDemoMode];
  }
  return result;
}

- (id)getLastAutoRebootTime
{
  if (+[MSDPreferencesFile preferencesFileExists])
  {
    unsigned int v3 = [(MSDScreenSaverManager *)self readLastAutoReboot];
    unsigned int v4 = v3;
    if (v3)
    {
      double v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)(uint64_t)[v3 integerValue]);
    }
    else
    {
      double v5 = 0;
    }
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (id)getLastSettingsUpdatedTime
{
  if (+[MSDPreferencesFile preferencesFileExists])
  {
    unsigned int v3 = [(MSDScreenSaverManager *)self readLastSettingsUpdated];
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v4 = v3;
    }
    else
    {
      id v4 = +[NSDate distantPast];
    }
    double v5 = v4;
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (id)getStoreHours
{
  if (+[MSDPreferencesFile preferencesFileExists])
  {
    unsigned int v3 = [(MSDScreenSaverManager *)self readHubSuppliedSettings];
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v4 = [v3 objectForKey:@"StoreHours"];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (int)readDemoMode
{
  id v2 = +[MSDKManagedDevice sharedInstance];
  int v3 = [v2 getDemoInstallState];

  return v3;
}

- (id)readLastAutoReboot
{
  id v2 = +[MSDPreferencesFile sharedInstance];
  [v2 reload];

  int v3 = +[MSDPreferencesFile sharedInstance];
  id v4 = [v3 objectForKey:@"msd-last-auto-reboot"];

  return v4;
}

- (id)readLastSettingsUpdated
{
  id v2 = +[MSDPreferencesFile sharedInstance];
  [v2 reload];

  int v3 = +[MSDPreferencesFile sharedInstance];
  id v4 = [v3 objectForKey:@"LastSettingsUpdatedTime"];

  return v4;
}

- (id)readHubSuppliedSettings
{
  id v2 = +[MSDPreferencesFile sharedInstance];
  [v2 reload];

  int v3 = +[MSDPreferencesFile sharedInstance];
  id v4 = [v3 objectForKey:@"HubSuppliedSettings"];

  return v4;
}

- (BOOL)isInStandbyMode:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v3 = objc_msgSend(a3, "elements", 0);
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    uint64_t v7 = SBSDisplayLayoutElementStandByIdentifier;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        double v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) identifier];
        unsigned __int8 v10 = [v9 isEqualToString:v7];

        if (v10)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (NSString)screenSaverAppID
{
  return self->_screenSaverAppID;
}

- (void)setScreenSaverAppID:(id)a3
{
}

- (MSDStoreHoursManager)storeHoursManager
{
  return self->_storeHoursManager;
}

- (void)setStoreHoursManager:(id)a3
{
}

- (NSArray)storeHourSettings
{
  return self->_storeHourSettings;
}

- (void)setStoreHourSettings:(id)a3
{
}

- (NSDate)lastSettingsUpdated
{
  return self->_lastSettingsUpdated;
}

- (void)setLastSettingsUpdated:(id)a3
{
}

- (BOOL)justBootUp
{
  return self->_justBootUp;
}

- (void)setJustBootUp:(BOOL)a3
{
  self->_justBootUp = a3;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unint64_t)a3
{
  self->_deviceType = a3;
}

- (RBSProcessMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
}

- (BOOL)screenSaverRunning
{
  return self->_screenSaverRunning;
}

- (void)setScreenSaverRunning:(BOOL)a3
{
  self->_screenSaverRunning = a3;
}

- (PCPersistentTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (int64_t)backlightLevel
{
  return self->_backlightLevel;
}

- (void)setBacklightLevel:(int64_t)a3
{
  self->_backlightLevel = a3;
}

- (BOOL)turnOffDisplayAtNight
{
  return self->_turnOffDisplayAtNight;
}

- (void)setTurnOffDisplayAtNight:(BOOL)a3
{
  self->_turnOffDisplayAtNight = a3;
}

- (BOOL)turnOffAlwaysOnTimeAtNight
{
  return self->_turnOffAlwaysOnTimeAtNight;
}

- (void)setTurnOffAlwaysOnTimeAtNight:(BOOL)a3
{
  self->_turnOffAlwaysOnTimeAtNight = a3;
}

- (PCPersistentTimer)aotTimer
{
  return self->_aotTimer;
}

- (void)setAotTimer:(id)a3
{
}

- (BLSAssertion)backlightAssertion
{
  return self->_backlightAssertion;
}

- (void)setBacklightAssertion:(id)a3
{
}

- (BSInvalidatable)idleTimerAssertion
{
  return self->_idleTimerAssertion;
}

- (void)setIdleTimerAssertion:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (NSDate)sessionStartTime
{
  return self->_sessionStartTime;
}

- (void)setSessionStartTime:(id)a3
{
}

- (BOOL)isStandbyMode
{
  return self->_isStandbyMode;
}

- (void)setIsStandbyMode:(BOOL)a3
{
  self->_isStandbyMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStartTime, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_idleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_backlightAssertion, 0);
  objc_storeStrong((id *)&self->_aotTimer, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_lastSettingsUpdated, 0);
  objc_storeStrong((id *)&self->_storeHourSettings, 0);
  objc_storeStrong((id *)&self->_storeHoursManager, 0);

  objc_storeStrong((id *)&self->_screenSaverAppID, 0);
}

@end