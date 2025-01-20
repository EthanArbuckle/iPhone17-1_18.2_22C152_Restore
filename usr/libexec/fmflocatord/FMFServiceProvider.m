@interface FMFServiceProvider
+ (BOOL)_isFMFAppRestrictionSet;
- (BOOL)hasCompletedInitialSetup;
- (BOOL)isProviderEnabledForLocations;
- (BOOL)waitingForBuddy;
- (FMFServiceProvider)init;
- (FMNanoIDSManager)idsManager;
- (NSTimer)buddyWaitTimer;
- (OS_dispatch_semaphore)locationManagerSemaphore;
- (id)_constructNonVolatileFullDeviceInfo;
- (id)_constructStandardDeviceContext;
- (id)_constructVolatileFullDeviceInfo;
- (id)connectionStringForNRDevice:(id)a3;
- (id)copyHandlerForCommand:(id)a3 params:(id)a4;
- (id)newLocationManager;
- (id)serviceIdentifierInURL;
- (id)serviceName;
- (id)tokenWatcherObserverToken;
- (void)_beginXPCTransaction;
- (void)_buddyCompletionCheckTimerFired:(id)a3;
- (void)_checkForBuddyCompletion;
- (void)_endXPCTransaction;
- (void)_registerIDSServices;
- (void)_sendStartupRegister;
- (void)_triggerFence:(id)a3 atLocation:(id)a4;
- (void)accountDeactivated;
- (void)accountDidChange;
- (void)ackFencesCommand:(id)a3 withCompletion:(id)a4;
- (void)buddyDidComplete:(id)a3;
- (void)deinitializeProvider;
- (void)deregisterCommonNotifications;
- (void)didReceiveAPSMessage:(id)a3;
- (void)didReceiveAPSToken:(id)a3;
- (void)didReceiveAuthFailureForRequest:(id)a3;
- (void)fenceTriggered:(id)a3 atLocation:(id)a4;
- (void)fmfRestrictionsChanged:(id)a3;
- (void)pairedDevicesChanged:(id)a3;
- (void)performInitialSetup;
- (void)registerCommonNotifications;
- (void)requestAuthenticationShouldForce:(BOOL)a3;
- (void)sendTriggeredFence:(id)a3 withTriggerLocation:(id)a4;
- (void)setBuddyWaitTimer:(id)a3;
- (void)setHasCompletedInitialSetup:(BOOL)a3;
- (void)setIdsManager:(id)a3;
- (void)setLocationManagerSemaphore:(id)a3;
- (void)setTokenWatcherObserverToken:(id)a3;
- (void)setWaitingForBuddy:(BOOL)a3;
- (void)start;
- (void)stop;
- (void)tryToFetchAuthToken;
@end

@implementation FMFServiceProvider

- (FMFServiceProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMFServiceProvider;
  v2 = [(FindBaseServiceProvider *)&v5 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(1);
    [(FMFServiceProvider *)v2 setLocationManagerSemaphore:v3];
  }
  return v2;
}

- (id)serviceName
{
  return @"FMF";
}

- (void)start
{
  [(FMFServiceProvider *)self performInitialSetup];
  v3.receiver = self;
  v3.super_class = (Class)FMFServiceProvider;
  [(ServiceProvider *)&v3 start];
}

- (void)performInitialSetup
{
  if (![(FMFServiceProvider *)self hasCompletedInitialSetup])
  {
    uint64_t v3 = [(FindBaseServiceProvider *)self authInvalidError];
    id v4 = +[APSTokenWatcher sharedInstance];
    id v5 = [objc_alloc((Class)FMNanoIDSManager) initWithServiceId:@"com.apple.private.alloy.fmflocator" minimumVersion:4];
    [(FMFServiceProvider *)self setIdsManager:v5];
    v6 = +[SystemConfig sharedInstance];
    unsigned int v7 = [v6 isBuddyDone];

    if (v7)
    {
      v8 = +[NSNotificationCenter defaultCenter];
      [v8 removeObserver:self name:@"purplebuddy.setupdone" object:0];

      if (v3 == 1196379972)
      {
        v20 = sub_10001B6D4();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v21 = [(FMFServiceProvider *)self fm_logID];
          v22 = [(ServiceProvider *)self account];
          v23 = [v22 username];
          *(_DWORD *)buf = 138412546;
          v46 = v21;
          __int16 v47 = 2112;
          v48 = v23;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@ found account: %@", buf, 0x16u);
        }
        [(FindBaseServiceProvider *)self setAllowServerRequests:1];
        v24 = +[FMFFencesMgr sharedInstance];
        [v24 setDelegate:self];

        uint64_t v25 = +[FMFLocatorDaemon sharedInstance];
        v26 = [(ServiceProvider *)self account];
        v27 = [v26 apsEnvironmentConstant];
        v28 = [(id)v25 apsHandlerForEnvironment:v27];

        [v28 registerDelegate:self forTopic:@"com.apple.mobileme.fmf"];
        v29 = [v28 apsToken];
        LOBYTE(v25) = v29 == 0;

        if (v25)
        {
          v37 = sub_10001B6D4();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            v38 = [(FMFServiceProvider *)self fm_logID];
            *(_DWORD *)buf = 138412290;
            v46 = v38;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%@ No APS token yet", buf, 0xCu);
          }
          v39 = +[FMSystemInfo sharedInstance];
          unsigned int v40 = [v39 isInternalBuild];

          if (v40)
          {
            objc_initWeak((id *)buf, self);
            dispatch_time_t v41 = dispatch_time(0, 5000000000);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100009D70;
            block[3] = &unk_100059510;
            objc_copyWeak(&v44, (id *)buf);
            dispatch_after(v41, (dispatch_queue_t)&_dispatch_main_q, block);
            objc_destroyWeak(&v44);
            objc_destroyWeak((id *)buf);
          }
        }
        else
        {
          v30 = self;
          objc_sync_enter(v30);
          v31 = [v28 apsToken];
          [(FindBaseServiceProvider *)v30 setApsToken:v31];

          objc_sync_exit(v30);
          [(FMFServiceProvider *)v30 _sendStartupRegister];
        }
        [(FMFServiceProvider *)self registerCommonNotifications];
        [(FMFServiceProvider *)self _registerIDSServices];
        [(FindBaseServiceProvider *)self updateProactiveMonitorRegistration];
        [(FMFServiceProvider *)self setHasCompletedInitialSetup:1];
      }
      else if (v3 == 1481920331)
      {
        v9 = sub_10001B6D4();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = [(FMFServiceProvider *)self serviceName];
          v11 = [(ServiceProvider *)self account];
          v12 = [v11 username];
          v13 = sub_10000C9F4(1481920331);
          *(_DWORD *)buf = 138412802;
          v46 = v10;
          __int16 v47 = 2112;
          v48 = v12;
          __int16 v49 = 2112;
          v50 = v13;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@: Account %@ is invalid due to '%@' - will not register at this time", buf, 0x20u);
        }
        v14 = +[FMSystemInfo sharedInstance];
        unsigned int v15 = [v14 isInternalBuild];

        if (v15)
        {
          v16 = sub_10001B6D4();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v17 = [(FMFServiceProvider *)self serviceName];
            *(_DWORD *)buf = 138412290;
            v46 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@ is not functional as authentication credentials are not available.", buf, 0xCu);
          }
        }
        [(FMFServiceProvider *)self requestAuthenticationShouldForce:1];
      }
      else
      {
        v32 = sub_10001B6D4();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v33 = [(FMFServiceProvider *)self serviceName];
          v34 = [(ServiceProvider *)self account];
          v35 = [v34 username];
          v36 = sub_10000C9F4(v3);
          *(_DWORD *)buf = 138412802;
          v46 = v33;
          __int16 v47 = 2112;
          v48 = v35;
          __int16 v49 = 2112;
          v50 = v36;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%@: Account %@ is invalid due to '%@' - will not register at this time", buf, 0x20u);
        }
      }
    }
    else
    {
      v18 = sub_10001B6D4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = [(FMFServiceProvider *)self serviceName];
        *(_DWORD *)buf = 138412290;
        v46 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@: Buddy is not complete yet. Waiting...", buf, 0xCu);
      }
      [(FMFServiceProvider *)self _checkForBuddyCompletion];
    }
    v42 = [(FMFServiceProvider *)self idsManager];
    [v42 start];
  }
}

- (void)_sendStartupRegister
{
  uint64_t v3 = [(ServiceProvider *)self account];
  uint64_t v4 = [v3 accountAddTime];
  if (v4)
  {
    id v5 = (void *)v4;
    v6 = [(ServiceProvider *)self account];
    unsigned int v7 = [v6 accountAddTime];
    v8 = +[FMFLocatorDaemon sharedInstance];
    v9 = [v8 startTime];
    id v10 = [v7 compare:v9];

    if (v10 != (id)-1)
    {
      v14 = +[NSString stringWithFormat:@"AccountAdded"];
      [(FindBaseServiceProvider *)self registerDeviceWithCause:v14];
      goto LABEL_8;
    }
  }
  else
  {
  }
  v11 = +[FMFLocatorDaemon sharedInstance];
  unsigned int v12 = [v11 isFirstRunAfterBoot];
  v13 = @"Restart";
  if (v12) {
    v13 = @"DeviceRestart";
  }
  v14 = v13;

  [(FindBaseServiceProvider *)self registerDeviceWithCause:v14];
LABEL_8:
}

- (void)registerCommonNotifications
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"fmfRestrictionsChanged:" name:@"FMFRestrictionsMayHaveChangedNotification" object:0];

  uint64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"pairedDevicesChanged:" name:@"nano.devicedidpair" object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"pairedDevicesChanged:" name:@"nano.devicedidunpair" object:0];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"pairedDevicesChanged:" name:NRPairedDeviceRegistryDeviceDidPairNotification object:0];

  unsigned int v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"pairedDevicesChanged:" name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];

  v8 = +[NSNotificationCenter defaultCenter];
  v9 = +[NSOperationQueue mainQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000A1D8;
  v12[3] = &unk_100059328;
  v12[4] = self;
  id v10 = [v8 addObserverForName:@"kAPSTokenWatcherUpdatedNotification" object:0 queue:v9 usingBlock:v12];
  [(FMFServiceProvider *)self setTokenWatcherObserverToken:v10];

  v11.receiver = self;
  v11.super_class = (Class)FMFServiceProvider;
  [(FindBaseServiceProvider *)&v11 registerCommonNotifications];
}

- (void)deregisterCommonNotifications
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"FMFRestrictionsMayHaveChangedNotification" object:0];

  uint64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"nano.devicedidpair" object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"nano.devicedidunpair" object:0];

  v6 = +[NSNotificationCenter defaultCenter];
  unsigned int v7 = [(FMFServiceProvider *)self tokenWatcherObserverToken];
  [v6 removeObserver:v7];

  [(FMFServiceProvider *)self setTokenWatcherObserverToken:0];
  v8.receiver = self;
  v8.super_class = (Class)FMFServiceProvider;
  [(FindBaseServiceProvider *)&v8 deregisterCommonNotifications];
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)FMFServiceProvider;
  [(ServiceProvider *)&v3 stop];
  [(FindBaseServiceProvider *)self setAllowServerRequests:0];
}

- (void)accountDeactivated
{
  v9.receiver = self;
  v9.super_class = (Class)FMFServiceProvider;
  [(ServiceProvider *)&v9 accountDeactivated];
  objc_super v3 = +[StartupRegisterManager sharedInstance];
  [v3 eventDidOccur:1];

  uint64_t v4 = sub_10001B6D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(FMFServiceProvider *)self fm_logID];
    *(_DWORD *)buf = 138412290;
    objc_super v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ Removing any fences that were set...", buf, 0xCu);
  }
  v6 = +[FMFFencesMgr sharedInstance];
  [v6 setFencesToMonitor:0 withFenceVersion:0 triggerValidityDuration:0 andTriggerURL:0.0];

  unsigned int v7 = [(FMFServiceProvider *)self buddyWaitTimer];

  if (v7)
  {
    objc_super v8 = [(FMFServiceProvider *)self buddyWaitTimer];
    [v8 invalidate];

    [(FMFServiceProvider *)self setBuddyWaitTimer:0];
  }
  [(FMFServiceProvider *)self setWaitingForBuddy:0];
  [(FindBaseServiceProvider *)self deleteRegisterDigest];
  +[RealmSupport setServerContextHeaderString:0];
  [(FindBaseServiceProvider *)self unregisterDevice];
}

- (void)accountDidChange
{
  objc_super v3 = [(ServiceProvider *)self account];
  unsigned int v4 = [(FMFServiceProvider *)self hasCompletedInitialSetup];
  id v5 = sub_10001B6D4();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      unsigned int v7 = [(FMFServiceProvider *)self fm_logID];
      int v10 = 138412290;
      objc_super v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ Sending register because account changed", (uint8_t *)&v10, 0xCu);
    }
    [(FindBaseServiceProvider *)self registerDeviceWithCause:@"AccountChange"];
  }
  else
  {
    if (v6)
    {
      objc_super v8 = [(FMFServiceProvider *)self fm_logID];
      int v10 = 138412290;
      objc_super v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ Attempting to start this FMF provider again because account changed", (uint8_t *)&v10, 0xCu);
    }
    [(FMFServiceProvider *)self performInitialSetup];
  }
  objc_super v9 = [v3 internalAuthToken];

  if (!v9) {
    [(FMFServiceProvider *)self requestAuthenticationShouldForce:0];
  }
}

- (void)deinitializeProvider
{
  v10.receiver = self;
  v10.super_class = (Class)FMFServiceProvider;
  [(FindBaseServiceProvider *)&v10 deinitializeProvider];
  [(FMFServiceProvider *)self deregisterCommonNotifications];
  objc_super v3 = +[FMFFencesMgr sharedInstance];
  unsigned int v4 = [v3 delegate];

  if (v4 == self)
  {
    id v5 = +[FMFFencesMgr sharedInstance];
    [v5 setDelegate:0];
  }
  BOOL v6 = +[FMFLocatorDaemon sharedInstance];
  unsigned int v7 = [(ServiceProvider *)self account];
  objc_super v8 = [v7 apsEnvironmentConstant];
  objc_super v9 = [v6 apsHandlerForEnvironment:v8];

  [v9 deregisterDelegate:self];
}

- (id)serviceIdentifierInURL
{
  return @"fmf";
}

- (id)copyHandlerForCommand:(id)a3 params:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (void *)qword_10006D410;
  if (!qword_10006D410)
  {
    v15[0] = @"register";
    v16[0] = objc_opt_class();
    v15[1] = @"locate";
    v16[1] = objc_opt_class();
    v15[2] = @"fence";
    v16[2] = objc_opt_class();
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
    objc_super v10 = (void *)qword_10006D410;
    qword_10006D410 = v9;

    objc_super v8 = (void *)qword_10006D410;
  }
  objc_super v11 = (objc_class *)[v8 objectForKeyedSubscript:v6];
  if (v11)
  {
    id v12 = [[v11 alloc] initWithParams:v7 provider:self];
  }
  else
  {
    v13 = sub_10001B6D4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_100036FAC(self, (uint64_t)v6, v13);
    }

    id v12 = 0;
  }

  return v12;
}

- (BOOL)isProviderEnabledForLocations
{
  v2 = +[FMFConfig sharedInstance];
  if ([v2 isLocationServicesEnabled])
  {
    objc_super v3 = +[FMFConfig sharedInstance];
    unsigned __int8 v4 = [v3 isLocationServicesEnabledForShareMyLocation];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)_constructStandardDeviceContext
{
  v6.receiver = self;
  v6.super_class = (Class)FMFServiceProvider;
  v2 = [(FindBaseServiceProvider *)&v6 _constructStandardDeviceContext];
  objc_super v3 = +[PreferencesMgr sharedInstance];
  unsigned int v4 = [v3 bccOnFenceTrigger];

  if (v4) {
    [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:@"bccOnFenceTrigger"];
  }

  return v2;
}

- (id)_constructVolatileFullDeviceInfo
{
  v16.receiver = self;
  v16.super_class = (Class)FMFServiceProvider;
  objc_super v3 = [(FindBaseServiceProvider *)&v16 _constructVolatileFullDeviceInfo];
  unsigned int v4 = self;
  objc_sync_enter(v4);
  id v5 = [(FindBaseServiceProvider *)v4 apsToken];
  [v3 fm_safelyMapKey:@"aps-token" toObject:v5];
  objc_super v6 = +[APSTokenWatcher sharedInstance];
  id v7 = [v6 tokenList];

  if (v5 && ([v7 containsObject:v5] & 1) == 0)
  {
    objc_super v8 = sub_10001B6D4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10003705C(v8);
    }

    uint64_t v9 = [v7 arrayByAddingObject:v5];

    id v7 = (void *)v9;
  }
  [v3 fm_safelyMapKey:@"allPushTokens" toObject:v7];

  objc_sync_exit(v4);
  objc_super v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[FMFServiceProvider _isFMFAppRestrictionSet]);
  [v3 setObject:v10 forKeyedSubscript:@"fmfRestrictions"];

  objc_super v11 = [(ServiceProvider *)v4 account];
  id v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 isActive]);
  [v3 setObject:v12 forKeyedSubscript:@"fmf"];

  [v3 fm_safelyMapKey:@"fmfVersion" toObject:@"526"];
  [v3 fm_safelyMapKey:@"fmfBuildVersion" toObject:@"5.0"];
  v13 = +[FMFFencesMgr sharedInstance];
  v14 = [v13 fenceVersion];
  [v3 fm_safelyMapKey:@"fenceVersion" toObject:v14];

  return v3;
}

- (id)_constructNonVolatileFullDeviceInfo
{
  v7.receiver = self;
  v7.super_class = (Class)FMFServiceProvider;
  v2 = [(FindBaseServiceProvider *)&v7 _constructNonVolatileFullDeviceInfo];
  uint64_t v3 = +[SystemConfig sharedInstance];
  unsigned int v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [(id)v3 isRegionMonitoringAvailable]);
  [v2 setObject:v4 forKeyedSubscript:@"fenceMonitoringCapable"];

  id v5 = +[FMFConfig sharedInstance];
  LOBYTE(v3) = [v5 isFMFAllowed];

  if ((v3 & 1) == 0) {
    [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:@"fmfBlocked"];
  }

  return v2;
}

- (id)newLocationManager
{
  id v2 = objc_alloc((Class)CLLocationManager);
  uint64_t v3 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/FMF.framework"];
  id v4 = [v2 initWithEffectiveBundle:v3];

  return v4;
}

- (void)_triggerFence:(id)a3 atLocation:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = sub_10001B6D4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = [v5 description];
    int v10 = 136315394;
    objc_super v11 = "-[FMFServiceProvider _triggerFence:atLocation:]";
    __int16 v12 = 2112;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v9 = +[FMFFencesMgr sharedInstance];
  [v9 triggerFence:v6 atLocation:v5];
}

- (void)sendTriggeredFence:(id)a3 withTriggerLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = sub_10001B6D4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[FMFServiceProvider sendTriggeredFence:withTriggerLocation:]";
    __int16 v28 = 1024;
    LODWORD(v29) = [v6 shouldUseIDSTrigger];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: fence.shouldUseIDSTrigger == %{BOOL}d", buf, 0x12u);
  }

  if ([v6 shouldUseIDSTrigger])
  {
    [(FMFServiceProvider *)self _triggerFence:v6 atLocation:v7];
  }
  else
  {
    uint64_t v9 = [v6 triggerURL];
    int v10 = sub_100026B04((uint64_t)[v6 lastTrigger]);
    if (!v9 || ![v9 length])
    {
      objc_super v11 = +[FMFFencesMgr sharedInstance];
      __int16 v12 = [v11 triggerURL];

      uint64_t v9 = [(FindBaseServiceProvider *)self substituteStandardURLPlaceholders:v12];

      v13 = [v6 fenceId];

      if (v13)
      {
        v14 = [v6 fenceId];
        uint64_t v15 = [v9 stringByReplacingOccurrencesOfString:@"${fenceId}" withString:v14];

        uint64_t v9 = (void *)v15;
      }
      if (v10)
      {
        uint64_t v16 = [v9 stringByReplacingOccurrencesOfString:@"${triggerAction}" withString:v10];

        uint64_t v9 = (void *)v16;
      }
    }
    v17 = +[NSURL URLWithString:v9];
    v18 = sub_10001B6D4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [(FMFServiceProvider *)self serviceName];
      *(_DWORD *)buf = 138412802;
      v27 = v19;
      __int16 v28 = 2080;
      v29 = "-[FMFServiceProvider sendTriggeredFence:withTriggerLocation:]";
      __int16 v30 = 2112;
      v31 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@: %s: %@", buf, 0x20u);
    }
    v20 = [FMRequestFenceTrigger alloc];
    v21 = +[FMFFencesMgr sharedInstance];
    [v21 triggerValidityDuration];
    v22 = -[FMRequestFenceTrigger initWithProvider:triggeredLocation:fence:validityDuration:triggerURL:](v20, "initWithProvider:triggeredLocation:fence:validityDuration:triggerURL:", self, v7, v6, v17);

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000B270;
    v25[3] = &unk_100059538;
    v25[4] = self;
    [(FMRequest *)v22 setCompletionHandler:v25];
    ct_green_tea_logger_create_static();
    v23 = getCTGreenTeaOsLogHandle();
    v24 = v23;
    if (v23 && os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Transmitting Location.", buf, 2u);
    }

    [(FindBaseServiceProvider *)self enqueueRequest:v22];
  }
}

- (void)ackFencesCommand:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v6 objectForKeyedSubscript:@"ackURL"];
  if (v8)
  {
    uint64_t v9 = +[NSURL URLWithString:v8];
    int v10 = [[FMRequestAckFences alloc] initWithProvider:self fencesCommand:v6 ackURL:v9];
    __int16 v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_10000B5D8;
    uint64_t v15 = &unk_100059560;
    uint64_t v16 = self;
    id v17 = v7;
    [(FMRequest *)v10 setCompletionHandler:&v12];
    -[FindBaseServiceProvider enqueueRequest:](self, "enqueueRequest:", v10, v12, v13, v14, v15, v16);
  }
  else
  {
    uint64_t v9 = sub_10001B6D4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_super v11 = [(FMFServiceProvider *)self serviceName];
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@: Not acking the fences command because there is no ack URL", buf, 0xCu);
    }
  }
}

- (void)didReceiveAuthFailureForRequest:(id)a3
{
  id v4 = a3;
  id v5 = sub_10001B6D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(FMFServiceProvider *)self serviceName];
    id v7 = [(ServiceProvider *)self account];
    objc_super v8 = [v7 username];
    int v10 = 138412546;
    objc_super v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ - Auth failure received for account %@", (uint8_t *)&v10, 0x16u);
  }
  unsigned int v9 = [v4 showAuthFailedMessage];

  if (v9) {
    [(FMFServiceProvider *)self requestAuthenticationShouldForce:1];
  }
}

- (void)tryToFetchAuthToken
{
  uint64_t v3 = [(ServiceProvider *)self account];
  id v4 = [v3 authToken];
  id v5 = [v4 length];

  if (!v5)
  {
    [(FMFServiceProvider *)self requestAuthenticationShouldForce:0];
  }
}

- (void)requestAuthenticationShouldForce:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AppleAccountManager sharedInstance];
  [v4 requestAuthenticationShouldForce:v3 completion:0];
}

- (void)_checkForBuddyCompletion
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BA2C;
  block[3] = &unk_100059350;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_registerIDSServices
{
  BOOL v3 = [(FMFServiceProvider *)self idsManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000BD14;
  v4[3] = &unk_100059588;
  v4[4] = self;
  [v3 handleRequestsOfType:1 withHandler:v4];
}

- (id)connectionStringForNRDevice:(id)a3
{
  id v4 = a3;
  id v5 = @"unknown";
  id v7 = [(FMFServiceProvider *)self idsManager];
  objc_super v8 = [v7 devices];

  unsigned int v9 = +[NRPairedDeviceRegistry sharedInstance];
  int v10 = [v9 deviceForNRDevice:v4 fromIDSDevices:v8];

  if (v10)
  {
    if ([v10 isNearby])
    {
      objc_super v11 = &off_10005A220;
    }
    else
    {
      unsigned int v14 = [v10 isConnected];
      objc_super v11 = &off_10005A228;
      if (v14) {
        objc_super v11 = &off_10005A238;
      }
    }
    uint64_t v13 = *v11;

    __int16 v12 = sub_10001B6D4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v10;
      __int16 v18 = 2112;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMFServiceProvider : match ids device %@ %@", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    __int16 v12 = sub_10001B6D4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMFServiceProvider : !match ids device %@", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v13 = v5;
  }

  return v13;
}

- (void)didReceiveAPSMessage:(id)a3
{
  id v4 = a3;
  [(FMFServiceProvider *)self _beginXPCTransaction];
  id v5 = +[StartupRegisterManager sharedInstance];
  [v5 eventDidOccur:4];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SRFMFNotificationReceived", 0, 0, 1u);
  uint64_t v7 = [(FindBaseServiceProvider *)self essentialServerInfoMissingError];
  objc_super v8 = sub_10001B6D4();
  unsigned int v9 = v8;
  if (v7 == 1196379972)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000370A0(self, v4, v9);
    }

    unsigned int v9 = [v4 objectForKeyedSubscript:@"serverContext"];
    int v10 = [v4 objectForKeyedSubscript:@"intents"];
    [(FindBaseServiceProvider *)self sendQueueCheckRequest:v9 withReasons:v10];
    goto LABEL_7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v11 = [(FMFServiceProvider *)self fm_logID];
    int v10 = sub_10000C9F4(v7);
    int v12 = 138412546;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Ignoring APS message since some essential server info is missing = '%@'", (uint8_t *)&v12, 0x16u);

LABEL_7:
  }

  [(FMFServiceProvider *)self _endXPCTransaction];
}

- (void)didReceiveAPSToken:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(FindBaseServiceProvider *)v4 apsToken];

  [(FindBaseServiceProvider *)v4 setApsToken:v6];
  if (v5) {
    [(FindBaseServiceProvider *)v4 registerDeviceWithCause:@"APSTokenReceived"];
  }
  else {
    [(FMFServiceProvider *)v4 _sendStartupRegister];
  }
  objc_sync_exit(v4);
}

- (void)fenceTriggered:(id)a3 atLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_10001F020())
  {
    [(FMFServiceProvider *)self sendTriggeredFence:v6 withTriggerLocation:v7];
  }
  else
  {
    objc_super v8 = sub_10001B6D4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v14 = "-[FMFServiceProvider fenceTriggered:atLocation:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: checking if this device is being used to share location", buf, 0xCu);
    }

    unsigned int v9 = +[FMFFencesMgr sharedInstance];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000C48C;
    v10[3] = &unk_1000595B0;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [v9 checkIfThisDeviceIsBeingUsedToShareLocation:v10];
  }
}

+ (BOOL)_isFMFAppRestrictionSet
{
  id v2 = +[MCProfileConnection sharedConnection];
  unsigned int v3 = [v2 effectiveBoolValueForSetting:MCFeatureFindMyFriendsModificationAllowed];

  return v3 == 2;
}

- (void)_buddyCompletionCheckTimerFired:(id)a3
{
  id v4 = sub_10001B6D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Buddy completion check timer fired", v5, 2u);
  }

  [(FMFServiceProvider *)self _checkForBuddyCompletion];
}

- (void)buddyDidComplete:(id)a3
{
  id v4 = sub_10001B6D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(FMFServiceProvider *)self fm_logID];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ Buddy completion notification received", (uint8_t *)&v6, 0xCu);
  }
  [(FMFServiceProvider *)self _checkForBuddyCompletion];
}

- (void)fmfRestrictionsChanged:(id)a3
{
}

- (void)pairedDevicesChanged:(id)a3
{
}

- (void)_beginXPCTransaction
{
  unsigned int v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v6 = +[NSString stringWithFormat:@"%@-%X", v4, self];

  id v5 = +[FMXPCTransactionManager sharedInstance];
  [v5 beginTransaction:v6];
}

- (void)_endXPCTransaction
{
  unsigned int v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v6 = +[NSString stringWithFormat:@"%@-%X", v4, self];

  id v5 = +[FMXPCTransactionManager sharedInstance];
  [v5 endTransaction:v6];
}

- (BOOL)hasCompletedInitialSetup
{
  return self->_hasCompletedInitialSetup;
}

- (void)setHasCompletedInitialSetup:(BOOL)a3
{
  self->_hasCompletedInitialSetup = a3;
}

- (OS_dispatch_semaphore)locationManagerSemaphore
{
  return self->_locationManagerSemaphore;
}

- (void)setLocationManagerSemaphore:(id)a3
{
}

- (id)tokenWatcherObserverToken
{
  return self->_tokenWatcherObserverToken;
}

- (void)setTokenWatcherObserverToken:(id)a3
{
}

- (NSTimer)buddyWaitTimer
{
  return self->_buddyWaitTimer;
}

- (void)setBuddyWaitTimer:(id)a3
{
}

- (BOOL)waitingForBuddy
{
  return self->_waitingForBuddy;
}

- (void)setWaitingForBuddy:(BOOL)a3
{
  self->_waitingForBuddy = a3;
}

- (FMNanoIDSManager)idsManager
{
  return self->_idsManager;
}

- (void)setIdsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsManager, 0);
  objc_storeStrong((id *)&self->_buddyWaitTimer, 0);
  objc_storeStrong(&self->_tokenWatcherObserverToken, 0);

  objc_storeStrong((id *)&self->_locationManagerSemaphore, 0);
}

@end