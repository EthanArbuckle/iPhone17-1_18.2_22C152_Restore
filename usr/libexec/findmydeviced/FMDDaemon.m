@interface FMDDaemon
+ (id)sharedInstance;
- (BOOL)isFirstRunAfterBoot;
- (BOOL)logLevelsMaxedOut;
- (BOOL)startupComplete;
- (FMDDaemon)init;
- (FMDServiceProvider)activeServiceProvider;
- (FMStateCapture)stateCapture;
- (NSDate)startTime;
- (NSMutableDictionary)apsHandlers;
- (OS_dispatch_queue)apsHandlersModQueue;
- (id)apsHandlerForEnvironment:(id)a3;
- (id)xpcDarwinEventHandlers;
- (id)xpcDistributedEventHandlers;
- (void)_performPostStartupTasks;
- (void)_startupNowWithCompletion:(id)a3;
- (void)calculateFirstRunStatus;
- (void)checkInAllAPSHandlers;
- (void)cleanupPostWipe;
- (void)initialLaunchProcessing;
- (void)migrateAosnotifydStuff;
- (void)migrateFromVersion:(id)a3 toVersion:(id)a4;
- (void)setActiveServiceProvider:(id)a3;
- (void)setApsHandlers:(id)a3;
- (void)setApsHandlersModQueue:(id)a3;
- (void)setIsFirstRunAfterBoot:(BOOL)a3;
- (void)setLogLevelsMaxedOut:(BOOL)a3;
- (void)setStartTime:(id)a3;
- (void)setStartupComplete:(BOOL)a3;
- (void)setStateCapture:(id)a3;
- (void)startServiceProviders;
- (void)startupWithCompletion:(id)a3;
- (void)versionCheck;
- (void)waitForSpringBoard;
@end

@implementation FMDDaemon

+ (id)sharedInstance
{
  if (qword_10031E738 != -1) {
    dispatch_once(&qword_10031E738, &stru_1002D9920);
  }
  v2 = (void *)qword_10031E730;

  return v2;
}

- (FMDDaemon)init
{
  v10.receiver = self;
  v10.super_class = (Class)FMDDaemon;
  v2 = [(FMDDaemon *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    apsHandlers = v2->_apsHandlers;
    v2->_apsHandlers = v3;

    dispatch_queue_t v5 = dispatch_queue_create("APSHandlers-Mods", 0);
    apsHandlersModQueue = v2->_apsHandlersModQueue;
    v2->_apsHandlersModQueue = (OS_dispatch_queue *)v5;

    id v7 = objc_alloc_init((Class)FMStateCapture);
    [(FMDDaemon *)v2 setStateCapture:v7];

    v8 = [(FMDDaemon *)v2 stateCapture];
    [v8 setStateCaptureBlock:&stru_1002D9940];
  }
  return v2;
}

- (void)startupWithCompletion:(id)a3
{
}

- (void)_startupNowWithCompletion:(id)a3
{
  v4 = (void (**)(void))a3;
  [(FMDDaemon *)self migrateAosnotifydStuff];
  dispatch_queue_t v5 = +[FMDFMIPSharedStateManager sharedInstance];
  [v5 recalculateLostMode];

  [(FMDDaemon *)self waitForSpringBoard];
  v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "************ FindMyDevice Daemon Starting... ************", buf, 2u);
  }

  id v7 = +[NSDate date];
  [(FMDDaemon *)self setStartTime:v7];

  [(FMDDaemon *)self versionCheck];
  [(FMDDaemon *)self calculateFirstRunStatus];
  v8 = +[FMXPCTransactionManager sharedInstance];
  [v8 setLaunchOnRebootActivity:@"com.apple.icloud.findmydeviced.launch-on-reboot" keepAliveActivity:@"com.apple.icloud.findmydeviced.keep-alive-on-dirty"];

  id v9 = +[FMDSystemConfig sharedInstance];
  objc_super v10 = sub_100004238();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10023BC40(v10);
  }

  v11 = +[FMSystemInfo sharedInstance];
  if ([v11 isInternalBuild])
  {
    v12 = +[FMDSystemConfig sharedInstance];
    unsigned __int8 v13 = [v12 isRunningInRecovery];

    if (v13) {
      goto LABEL_12;
    }
    v11 = [(FMDDaemon *)self verifyLaunchEventsConfiguration:@"/System/Library/LaunchDaemons/com.apple.icloud.findmydeviced.plist" withExclusions:&off_1002F2D68];
    if (v11)
    {
      v14 = sub_100004238();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10023BBD8();
      }
    }
  }

LABEL_12:
  v15 = sub_100004238();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_10023BB24(v15);
  }

  [(FMDDaemon *)self startServiceProviders];
  id v16 = +[FMXPCTransactionManager sharedInstance];
  v17 = +[FMNetworkMonitor sharedInstance];
  unsigned __int8 v18 = [v17 isMonitoring];

  if ((v18 & 1) == 0)
  {
    v19 = +[FMNetworkMonitor sharedInstance];
    [v19 startMonitoring];
  }
  [(FMDDaemon *)self cleanupPostWipe];
  [(FMDDaemon *)self setStartupComplete:1];
  [(FMDDaemon *)self checkInAllAPSHandlers];
  v20 = [(FMDDaemon *)self apsHandlersModQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000192F8;
  block[3] = &unk_1002D9378;
  block[4] = self;
  dispatch_sync(v20, block);

  v21 = +[FMDXPCManager sharedInstance];
  [v21 initializeXPC];

  [(FMDDaemon *)self _performPostStartupTasks];
  if (v4) {
    v4[2](v4);
  }
  v22 = [[FMDEventLoggerEventLaunch alloc] initWithEventName:@"FMDDaemonLaunchEvent"];
  [(FMDEventLoggerEventLaunch *)v22 setLaunchReason:0];
  v23 = +[FMDEventLogger sharedLogger];
  v24 = +[FMDEventLoggerFacilityDataPeek facilityName];
  v30 = v24;
  v25 = +[NSArray arrayWithObjects:&v30 count:1];
  [v23 logEvent:v22 toFacilitiesNamed:v25];

  if (!MKBGetDeviceLockState())
  {
    v26 = sub_100004238();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Start clearing up empty folders", buf, 2u);
    }

    v27 = +[FMDProtectedContextManager sharedManager];
    [v27 cleanupEmptyFolders];
  }
}

- (void)checkInAllAPSHandlers
{
  v5[0] = @"production";
  v5[1] = @"development";
  v5[2] = @"demo";
  v3 = +[NSArray arrayWithObjects:v5 count:3];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100019510;
  v4[3] = &unk_1002D9968;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

- (id)apsHandlerForEnvironment:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  unsigned __int8 v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100019768;
  id v16 = sub_100019778;
  id v17 = 0;
  if (v4)
  {
    dispatch_queue_t v5 = [(FMDDaemon *)self apsHandlersModQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100019780;
    block[3] = &unk_1002D9990;
    v11 = &v12;
    block[4] = self;
    id v10 = v4;
    dispatch_sync(v5, block);
  }
  else
  {
    v6 = sub_100004238();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10023BC84(v6);
    }
  }
  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)startServiceProviders
{
  v3 = objc_alloc_init(FMDFMIPServiceProvider);
  [(FMDDaemon *)self setActiveServiceProvider:v3];

  id v4 = [(FMDDaemon *)self activeServiceProvider];
  [v4 start];

  dispatch_queue_t v5 = +[FMDAppleAccountManager sharedInstance];
  [v5 syncFMIPAccountInfo];

  v6 = [(FMDDaemon *)self activeServiceProvider];
  id v7 = [v6 newLocationManager];

  v8 = sub_100004238();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Started Location Manager (handling launch event) %p", (uint8_t *)&v9, 0xCu);
  }
}

- (id)xpcDarwinEventHandlers
{
  if (qword_10031E748 != -1) {
    dispatch_once(&qword_10031E748, &stru_1002D99B0);
  }
  v2 = (void *)qword_10031E740;

  return v2;
}

- (id)xpcDistributedEventHandlers
{
  if (qword_10031E758 != -1) {
    dispatch_once(&qword_10031E758, &stru_1002D9CC0);
  }
  v2 = (void *)qword_10031E750;

  return v2;
}

- (void)versionCheck
{
  v3 = +[FMDSystemConfig sharedInstance];
  id v4 = [v3 buildVersion];

  dispatch_queue_t v5 = +[FMDSystemConfig sharedInstance];
  unsigned int v6 = [v5 isRunningInRecovery];

  id v7 = sub_100004238();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8) {
      goto LABEL_7;
    }
    *(_DWORD *)uint64_t v12 = 138412290;
    *(void *)&v12[4] = v4;
    int v9 = "OS: %@ [Recovery Partition]";
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    *(_DWORD *)uint64_t v12 = 138412290;
    *(void *)&v12[4] = v4;
    int v9 = "OS: %@";
  }
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, v12, 0xCu);
LABEL_7:

  id v10 = +[FMDPreferencesMgr lastLaunchVersion];
  v11 = v10;
  if (v10)
  {
    if (([v10 isEqualToString:v4] & 1) == 0) {
      [(FMDDaemon *)self migrateFromVersion:v11 toVersion:v4];
    }
  }
  else
  {
    [(FMDDaemon *)self initialLaunchProcessing];
  }
  +[FMDPreferencesMgr setLastLaunchVersion:](FMDPreferencesMgr, "setLastLaunchVersion:", v4, *(_OWORD *)v12);
}

- (void)initialLaunchProcessing
{
  v2 = sub_100004238();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Initial launch", v3, 2u);
  }
}

- (void)migrateFromVersion:(id)a3 toVersion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 compare:v6];
  if (v7 == (id)1)
  {
    v11 = sub_100004238();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v6;
      uint64_t v12 = "Back-migration from %@ to %@";
      unsigned __int8 v13 = v11;
      uint32_t v14 = 22;
      goto LABEL_11;
    }
LABEL_14:

    goto LABEL_15;
  }
  if (v7 != (id)-1)
  {
    v11 = sub_100004238();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10023BD30();
    }
    goto LABEL_14;
  }
  BOOL v8 = sub_100004238();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Migrating from %@ to %@", buf, 0x16u);
  }

  if ([@"12A196" compare:v5] != (id)-1)
  {
    int v9 = +[NSFileManager defaultManager];
    uint64_t v15 = 0;
    [v9 removeItemAtPath:@"/var/mobile/Library/Logs/findmydeviced" error:&v15];
    uint64_t v10 = v15;

    if (v10)
    {
      v11 = sub_100004238();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v12 = "Failed to delete log directory. findmydeviced logging may not work";
        unsigned __int8 v13 = v11;
        uint32_t v14 = 2;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
LABEL_15:
}

- (void)calculateFirstRunStatus
{
  v3 = sem_open("findmydeviced.boot_check", 0);
  if (v3 == (sem_t *)-1)
  {
    [(FMDDaemon *)self setIsFirstRunAfterBoot:1];
    id v4 = sub_100004238();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "This is the first run after a boot", buf, 2u);
    }

    id v5 = sem_open("findmydeviced.boot_check", 512, 256, 0);
    if (v5 == (sem_t *)-1)
    {
      id v6 = sub_100004238();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = __error();
        BOOL v8 = strerror(*v7);
        *(_DWORD *)buf = 136315394;
        uint64_t v10 = "findmydeviced.boot_check";
        __int16 v11 = 2080;
        uint64_t v12 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to create semaphore %s: %s", buf, 0x16u);
      }
    }
    else
    {
      sem_close(v5);
    }
  }
  else
  {
    sem_close(v3);
  }
}

- (void)waitForSpringBoard
{
  if (MGGetBoolAnswer())
  {
    int out_token = -1;
    notify_register_check("com.apple.springboard.finishedstartup", &out_token);
    if (out_token != -1)
    {
      uint64_t v7 = 0;
      notify_get_state(out_token, &v7);
      uint64_t v2 = v7;
      v3 = sub_100004238();
      BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
      if (v2)
      {
        if (v4)
        {
          *(_WORD *)buf = 0;
          id v5 = "SpringBoard is already running. Continuing to start findmydeviced";
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
        }
      }
      else
      {
        if (v4)
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v10 = 20;
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Waiting upto %ld seconds for SpringBoard to start...", buf, 0xCu);
        }

        if (!v7)
        {
          unsigned int v6 = 0;
          do
          {
            sleep(1u);
            notify_get_state(out_token, &v7);
            if (v6 > 0x12) {
              break;
            }
            ++v6;
          }
          while (!v7);
          if (!v7)
          {
            v3 = sub_100004238();
            if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_16;
            }
            *(_WORD *)buf = 0;
            id v5 = "Timed out while waiting for SpringBoard to start. Continuing to start findmydeviced anyway";
            goto LABEL_15;
          }
        }
        v3 = sub_100004238();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v5 = "SpringBoard has started. Continuing to start findmydeviced";
          goto LABEL_15;
        }
      }
LABEL_16:
    }
  }
}

- (void)_performPostStartupTasks
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kFMDStartupCompleteNotification, 0, 0, 1u);
  v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v3, kFMDLocalActivationLockInfoChangedNotification, 0, 0, 1u);
  BOOL v4 = sub_100004238();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDLocalActivationLockInfoManager posted activationLockInfo changed notification after startup", v5, 2u);
  }
}

- (void)cleanupPostWipe
{
  uint64_t v2 = +[FMDSystemConfig sharedInstance];
  unsigned int v3 = [v2 isBuddyDone];

  if (v3)
  {
    BOOL v4 = +[FMPreferencesUtil dictionaryForKey:@"FMIPWipeLostModeInfo" inDomain:kFMDPostWipePrefDomain];
    id v5 = [v4 objectForKey:@"lostModeEnabled"];
    unsigned int v6 = [v5 BOOLValue];

    if (v6)
    {
      uint64_t v7 = (void *)MAEGetActivationStateWithError();
      id v8 = 0;
      if (v8)
      {
        int v9 = sub_100004238();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_10023BCC8();
        }
      }
      uint64_t v10 = sub_100004238();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unsigned __int8 v13 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Doing fallback cleanup of postwipe preferences.  Activation state: [%@]", buf, 0xCu);
      }

      +[FMDPreferencesMgr setFMIPWipeLostModeInfo:0];
    }
  }
  else
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_10001B420, @"com.apple.purplebuddy.setupdone", 0, (CFNotificationSuspensionBehavior)0);
  }
}

- (void)migrateAosnotifydStuff
{
  if (!+[FMDPreferencesMgr importedAosnotifydData])
  {
    uint64_t v2 = sub_100004238();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Checking for stuff to migrate from aosnotifyd", buf, 2u);
    }

    unsigned int v3 = +[NSString stringWithFormat:@"%@/FMIP-trackedLocations.dat", @"/var/mobile/Library/Caches/com.apple.aosnotifyd"];
    BOOL v4 = +[NSFileManager defaultManager];
    unsigned int v5 = [v4 fileExistsAtPath:v3];

    if (v5)
    {
      unsigned int v6 = +[NSFileManager defaultManager];
      [v6 removeItemAtPath:v3 error:0];
    }
    uint64_t v7 = +[NSFileManager defaultManager];
    [v7 moveItemAtPath:@"/var/mobile/Library/Preferences/com.apple.AOSNotification.FMIPAccounts.plist" toPath:@"/var/mobile/Library/Preferences/com.apple.icloud.findmydeviced.FMIPAccounts.plist" error:0];

    id v8 = +[NSFileManager defaultManager];
    [v8 moveItemAtPath:@"/var/mobile/Library/Preferences/com.apple.AOSNotification.FMIPAccounts.notbackedup.plist" toPath:@"/var/mobile/Library/Preferences/com.apple.icloud.findmydeviced.FMIPAccounts.notbackedup.plist" error:0];

    int v9 = +[FMPreferencesUtil dictionaryForKey:@"_trackingInfo_FMIP" inDomain:@"com.apple.AOSNotification.notbackedup"];
    if (v9)
    {
      uint64_t v10 = +[FMDLocationTracker stringForLocationTrackerType:0];
      +[FMDPreferencesMgr setTrackingInfo:v9 forType:v10];
    }
    __int16 v11 = +[FMPreferencesUtil dictionaryForKey:@"ClientLostModeInfo" inDomain:@"com.apple.AOSNotification.public.notbackedup"];
    if (v11) {
      +[FMDPreferencesMgr setClientLostModeInfo:v11];
    }
    uint64_t v12 = +[FMPreferencesUtil dictionaryForKey:@"FMIPWipeLostModeInfo" inDomain:@"com.apple.AOSNotification.postwipe"];
    if (v12) {
      +[FMDPreferencesMgr setFMIPWipeLostModeInfo:v12];
    }
    unsigned __int8 v13 = +[FMPreferencesUtil dictionaryForKey:@"FMIPLostModeInfo" inDomain:@"com.apple.AOSNotification.public.notbackedup"];
    if (v13) {
      +[FMDPreferencesMgr setLostModeInfo:v13];
    }
    id v14 = +[FMPreferencesUtil integerForKey:@"_wipeState" inDomain:@"com.apple.AOSNotification.notbackedup"];
    if (v14) {
      +[FMDPreferencesMgr setWipeState:v14];
    }
    uint64_t v15 = +[FMPreferencesUtil dictionaryForKey:@"_wipeInfo" inDomain:@"com.apple.AOSNotification.notbackedup"];
    if (v15) {
      +[FMDPreferencesMgr setWipeInfo:v15];
    }
    +[FMDPreferencesMgr setImportedAosnotifydData:1];
  }
}

- (BOOL)isFirstRunAfterBoot
{
  return self->_isFirstRunAfterBoot;
}

- (void)setIsFirstRunAfterBoot:(BOOL)a3
{
  self->_isFirstRunAfterBoot = a3;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (BOOL)logLevelsMaxedOut
{
  return self->_logLevelsMaxedOut;
}

- (void)setLogLevelsMaxedOut:(BOOL)a3
{
  self->_logLevelsMaxedOut = a3;
}

- (NSMutableDictionary)apsHandlers
{
  return self->_apsHandlers;
}

- (void)setApsHandlers:(id)a3
{
}

- (OS_dispatch_queue)apsHandlersModQueue
{
  return self->_apsHandlersModQueue;
}

- (void)setApsHandlersModQueue:(id)a3
{
}

- (BOOL)startupComplete
{
  return self->_startupComplete;
}

- (void)setStartupComplete:(BOOL)a3
{
  self->_startupComplete = a3;
}

- (FMDServiceProvider)activeServiceProvider
{
  return self->_activeServiceProvider;
}

- (void)setActiveServiceProvider:(id)a3
{
}

- (FMStateCapture)stateCapture
{
  return self->_stateCapture;
}

- (void)setStateCapture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCapture, 0);
  objc_storeStrong((id *)&self->_activeServiceProvider, 0);
  objc_storeStrong((id *)&self->_apsHandlersModQueue, 0);
  objc_storeStrong((id *)&self->_apsHandlers, 0);

  objc_storeStrong((id *)&self->_startTime, 0);
}

@end