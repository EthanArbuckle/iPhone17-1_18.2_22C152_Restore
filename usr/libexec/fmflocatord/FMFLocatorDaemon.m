@interface FMFLocatorDaemon
+ (id)sharedInstance;
- (BOOL)isFirstRunAfterBoot;
- (BOOL)logLevelsMaxedOut;
- (BOOL)startupComplete;
- (FMFLocatorDaemon)init;
- (FMStateCapture)stateCapture;
- (NSDate)startTime;
- (NSMutableDictionary)apsHandlers;
- (id)apsHandlerForEnvironment:(id)a3;
- (id)xpcDarwinEventHandlers;
- (id)xpcDistributedEventHandlers;
- (void)calculateFirstRunStatus;
- (void)checkInAllAPSHandlers;
- (void)setApsHandlers:(id)a3;
- (void)setIsFirstRunAfterBoot:(BOOL)a3;
- (void)setLogLevelsMaxedOut:(BOOL)a3;
- (void)setStartTime:(id)a3;
- (void)setStartupComplete:(BOOL)a3;
- (void)setStateCapture:(id)a3;
- (void)startServiceProviders;
- (void)startupWithCompletion:(id)a3;
- (void)waitForSpringBoard;
@end

@implementation FMFLocatorDaemon

+ (id)sharedInstance
{
  if (qword_10006D3C8 != -1) {
    dispatch_once(&qword_10006D3C8, &stru_100059138);
  }
  v2 = (void *)qword_10006D3C0;

  return v2;
}

- (FMFLocatorDaemon)init
{
  v8.receiver = self;
  v8.super_class = (Class)FMFLocatorDaemon;
  v2 = [(FMFLocatorDaemon *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    apsHandlers = v2->_apsHandlers;
    v2->_apsHandlers = v3;

    id v5 = objc_alloc_init((Class)FMStateCapture);
    [(FMFLocatorDaemon *)v2 setStateCapture:v5];

    v6 = [(FMFLocatorDaemon *)v2 stateCapture];
    [v6 setStateCaptureBlock:&stru_100059178];
  }
  return v2;
}

- (void)startupWithCompletion:(id)a3
{
  v4 = (void (**)(void))a3;
  if (MGGetBoolAnswer()) {
    [(FMFLocatorDaemon *)self waitForSpringBoard];
  }
  id v5 = sub_10001B6D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "\n*******************************************************************************\n                    FMFLocator Daemon Starting...\n*******************************************************************************", buf, 2u);
  }

  v6 = +[NSDate date];
  [(FMFLocatorDaemon *)self setStartTime:v6];

  [(FMFLocatorDaemon *)self calculateFirstRunStatus];
  if ([(FMFLocatorDaemon *)self isFirstRunAfterBoot])
  {
    v7 = objc_alloc_init(FMFLocatorMigrator);
    unsigned __int8 v8 = [(FMFLocatorMigrator *)v7 performMigration];

    if ((v8 & 1) == 0)
    {
      v9 = sub_10001B6D4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Could not perform migration", buf, 2u);
      }
    }
  }
  v10 = +[FMXPCTransactionManager sharedInstance];
  [v10 setLaunchOnRebootActivity:@"com.apple.icloud.fmflocatord.launch-on-reboot" keepAliveActivity:@"com.apple.icloud.fmflocatord.keep-alive-on-dirty"];

  id v11 = +[SystemConfig sharedInstance];
  id v12 = +[FMFAppStateObserver sharedInstance];
  v13 = +[FMSystemInfo sharedInstance];
  unsigned int v14 = [v13 isInternalBuild];

  if (v14)
  {
    v15 = [(FMFLocatorDaemon *)self verifyLaunchEventsConfiguration:@"/System/Library/LaunchDaemons/com.apple.icloud.fmflocatord.plist" withExclusions:&__NSArray0__struct];
    if (v15)
    {
      v16 = sub_10001B6D4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        sub_1000369A0((uint64_t)v15, v16);
      }
    }
  }
  v17 = sub_10001B6D4();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_1000368E8(v17);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v18 = [(FMFLocatorDaemon *)self apsHandlers];
  id v19 = [v18 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v42;
    do
    {
      v22 = 0;
      do
      {
        if (*(void *)v42 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v41 + 1) + 8 * (void)v22);
        v24 = [(FMFLocatorDaemon *)self apsHandlers];
        v25 = [v24 objectForKeyedSubscript:v23];

        [v25 suspendRegistrations];
        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v20);
  }

  id v26 = +[APSTokenWatcher sharedInstance];
  [(FMFLocatorDaemon *)self startServiceProviders];
  id v27 = +[FMXPCTransactionManager sharedInstance];
  sub_100005140();
  [(FMFLocatorDaemon *)self setStartupComplete:1];
  [(FMFLocatorDaemon *)self checkInAllAPSHandlers];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v28 = [(FMFLocatorDaemon *)self apsHandlers];
  id v29 = [v28 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v38;
    do
    {
      v32 = 0;
      do
      {
        if (*(void *)v38 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v37 + 1) + 8 * (void)v32);
        v34 = [(FMFLocatorDaemon *)self apsHandlers];
        v35 = [v34 objectForKeyedSubscript:v33];

        [v35 resumeRegistrations];
        v32 = (char *)v32 + 1;
      }
      while (v30 != v32);
      id v30 = [v28 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v30);
  }

  v36 = +[XPCManager sharedInstance];
  [v36 initializeXPC];

  if (v4) {
    v4[2](v4);
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
  v4[2] = sub_100004344;
  v4[3] = &unk_1000591A0;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

- (id)apsHandlerForEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFLocatorDaemon *)self apsHandlers];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    id v7 = objc_alloc((Class)FMAPSHandler);
    unsigned __int8 v8 = [@"com.apple.icloud.fmflocatord.aps-" stringByAppendingString:v4];
    id v6 = [v7 initWithEnvironmentName:v4 launchOnDemandPort:v8];

    if (![(FMFLocatorDaemon *)self startupComplete]) {
      [v6 suspendRegistrations];
    }
    v9 = [(FMFLocatorDaemon *)self apsHandlers];
    [v9 setObject:v6 forKeyedSubscript:v4];
  }

  return v6;
}

- (void)startServiceProviders
{
  v2 = sub_10001B6D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100036A18(v2);
  }

  v3 = +[ServiceProviderMgr sharedInstance];
  [v3 start];
}

- (id)xpcDarwinEventHandlers
{
  v14[0] = @"com.apple.locationd/Prefs";
  id v2 = [&stru_1000591C0 copy];
  v15[0] = v2;
  v14[1] = @"com.apple.locationd.authorization";
  id v3 = [&stru_1000591E0 copy];
  v15[1] = v3;
  v14[2] = @"com.apple.mobileme.fmf1.allowFindMyFriendsModification";
  id v4 = [&stru_100059200 copy];
  v15[2] = v4;
  v14[3] = @"com.apple.system.hostname";
  id v5 = [&stru_100059220 copy];
  v15[3] = v5;
  v13[0] = @"AppleLanguagePreferencesChangedNotification";
  v13[1] = @"AppleDatePreferencesChangedNotification";
  v13[2] = @"AppleTimePreferencesChangedNotification";
  v13[3] = @"AppleNumberPreferencesChangedNotification";
  v13[4] = @"AppleKeyboardsPreferencesChangedNotification";
  v13[5] = @"com.apple.language.changed";
  id v6 = +[NSArray arrayWithObjects:v13 count:6];
  v14[4] = v6;
  id v7 = [&stru_100059240 copy];
  v15[4] = v7;
  v14[5] = @"com.apple.purplebuddy.setupdone";
  id v8 = [&stru_100059260 copy];
  v15[5] = v8;
  v14[6] = NRPairedDeviceRegistryDeviceDidPairDarwinNotification;
  id v9 = [&stru_100059280 copy];
  v15[6] = v9;
  v14[7] = NRPairedDeviceRegistryDeviceDidUnpairDarwinNotification;
  id v10 = [&stru_1000592A0 copy];
  v15[7] = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:8];

  return v11;
}

- (id)xpcDistributedEventHandlers
{
  v6[0] = @"com.apple.LaunchServices.applicationRegistered";
  id v2 = [&stru_1000592E0 copy];
  v6[1] = @"com.apple.LaunchServices.applicationUnregistered";
  v7[0] = v2;
  id v3 = [&stru_100059300 copy];
  v7[1] = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)calculateFirstRunStatus
{
  id v3 = sem_open("fmflocatord.boot_check", 0);
  if (v3 == (sem_t *)-1)
  {
    [(FMFLocatorDaemon *)self setIsFirstRunAfterBoot:1];
    id v4 = sub_10001B6D4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "This is the first run after a boot", buf, 2u);
    }

    id v5 = sem_open("fmflocatord.boot_check", 512, 256, 0);
    if (v5 == (sem_t *)-1)
    {
      id v6 = sub_10001B6D4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = __error();
        id v8 = strerror(*v7);
        *(_DWORD *)buf = 136315394;
        id v10 = "fmflocatord.boot_check";
        __int16 v11 = 2080;
        id v12 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Failed to create semaphore %s: %s", buf, 0x16u);
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
  int out_token = -1;
  notify_register_check("com.apple.springboard.finishedstartup", &out_token);
  if (out_token != -1)
  {
    uint64_t v7 = 0;
    notify_get_state(out_token, &v7);
    uint64_t v2 = v7;
    id v3 = sub_10001B6D4();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
    if (v2)
    {
      if (v4)
      {
        *(_WORD *)buf = 0;
        id v5 = "SpringBoard is already running. Continuing to start fmflocatord";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v5, buf, 2u);
      }
    }
    else
    {
      if (v4)
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v10 = 0x404E000000000000;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Waiting upto %.0f seconds for SpringBoard to start...", buf, 0xCu);
      }

      if (!v7)
      {
        unsigned int v6 = 0;
        do
        {
          sleep(1u);
          notify_get_state(out_token, &v7);
          if (v6 > 0x3A) {
            break;
          }
          ++v6;
        }
        while (!v7);
        if (!v7)
        {
          id v3 = sub_10001B6D4();
          if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
            goto LABEL_15;
          }
          *(_WORD *)buf = 0;
          id v5 = "Timed out while waiting for SpringBoard to start. Continuing to start fmflocatord anyway";
          goto LABEL_14;
        }
      }
      id v3 = sub_10001B6D4();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        id v5 = "SpringBoard has started. Continuing to start fmflocatord";
        goto LABEL_14;
      }
    }
LABEL_15:
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

- (BOOL)startupComplete
{
  return self->_startupComplete;
}

- (void)setStartupComplete:(BOOL)a3
{
  self->_startupComplete = a3;
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
  objc_storeStrong((id *)&self->_apsHandlers, 0);

  objc_storeStrong((id *)&self->_startTime, 0);
}

@end