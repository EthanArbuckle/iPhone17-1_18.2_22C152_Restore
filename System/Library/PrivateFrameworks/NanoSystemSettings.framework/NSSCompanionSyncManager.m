@interface NSSCompanionSyncManager
+ (unint64_t)pairedWatchVictoryBehavior;
+ (void)blockUntilPaired;
- (BOOL)isCheckingIfAppConduitKnowsAboutVictoryWatchApp;
- (BOOL)shouldCheckAgainIfAppConduitKnowsAboutVictoryWatchApp;
- (LSApplicationWorkspace)applicationWorkspace;
- (NSProgress)victoryAppInstallProgress;
- (NSSCompanionSyncManager)init;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)appConduitTimer;
- (PSYServiceSyncSession)syncSession;
- (PSYSyncCoordinator)syncCoordinator;
- (id)currentNikePhoneAppBundleID;
- (id)currentNikeWatchAppBundleID;
- (int)appConduitNotifyToken;
- (unint64_t)installState;
- (void)appConduitTimerFired;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)checkForCompletionOfVictoryAppInstallationOnPhone;
- (void)checkIfAppConduitKnowsAboutVictoryWatchApp;
- (void)coordinateNikeAppInstallation;
- (void)didFetchInfoForApplication:(id)a3 error:(id)a4;
- (void)didInstallVictoryAppOnWatchWithState:(int64_t)a3 error:(id)a4;
- (void)didUpdateVictoryAppInstallationStateOntoWatch:(int64_t)a3;
- (void)installVictoryAppOntoWatch;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reportSyncCompletionWithError:(id)a3;
- (void)setAppConduitNotifyToken:(int)a3;
- (void)setAppConduitTimer:(id)a3;
- (void)setApplicationWorkspace:(id)a3;
- (void)setInstallState:(unint64_t)a3;
- (void)setIsCheckingIfAppConduitKnowsAboutVictoryWatchApp:(BOOL)a3;
- (void)setShouldCheckAgainIfAppConduitKnowsAboutVictoryWatchApp:(BOOL)a3;
- (void)setSyncCoordinator:(id)a3;
- (void)setSyncSession:(id)a3;
- (void)setVictoryAppInstallProgress:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)startAppConduitTimer;
- (void)startMonitoringAppConduitNotification;
- (void)startMonitoringVictoryAppInstallationOnPhone;
- (void)stopAppConduitTimer;
- (void)stopMonitoringAppConduitNotification;
- (void)stopMonitoringVictoryAppInstallationOnPhone;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4;
- (void)updateInstallStateForApplication:(id)a3 installState:(int64_t)a4;
@end

@implementation NSSCompanionSyncManager

- (NSSCompanionSyncManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)NSSCompanionSyncManager;
  v2 = [(NSSCompanionSyncManager *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.nanosystemsettings.SyncManager", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

    v6 = v2->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000146A0;
    block[3] = &unk_100034AE0;
    v9 = v2;
    dispatch_async(v6, block);
  }
  return v2;
}

- (id)currentNikePhoneAppBundleID
{
  if (self->_installState) {
    return @"com.nike.niketrainingclub";
  }
  else {
    return @"com.nike.nikeplus-gps";
  }
}

- (id)currentNikeWatchAppBundleID
{
  v2 = [(NSSCompanionSyncManager *)self currentNikePhoneAppBundleID];
  v3 = [v2 stringByAppendingString:@".watchkitapp"];

  return v3;
}

+ (void)blockUntilPaired
{
  id v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v2 = [v3 waitForActivePairedOrAltAccountDevice];
}

+ (unint64_t)pairedWatchVictoryBehavior
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014938;
  block[3] = &unk_100034DF8;
  void block[4] = a1;
  if (qword_10003E770 != -1) {
    dispatch_once(&qword_10003E770, block);
  }
  id v2 = +[NRPairedDeviceRegistry sharedInstance];
  id v3 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  dispatch_queue_t v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  v5 = [v4 firstObject];

  v6 = [v5 valueForProperty:NRDevicePropertyDeviceBrand];
  if ([v6 intValue] == 2)
  {
    id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E7995851-D32D-4A4F-B12C-3DD8D0252581"];
    unsigned int v8 = [v5 supportsCapability:v7];

    if (v8) {
      unint64_t v9 = 2;
    }
    else {
      unint64_t v9 = 1;
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (void)reportSyncCompletionWithError:(id)a3
{
  id v4 = a3;
  syncSession = self->_syncSession;
  if (syncSession)
  {
    if (v4) {
      [(PSYServiceSyncSession *)syncSession syncDidFailWithError:v4];
    }
    else {
      [(PSYServiceSyncSession *)syncSession syncDidComplete];
    }
    syncTransaction = self->_syncTransaction;
    self->_syncTransaction = 0;

    id v7 = self->_syncSession;
    self->_syncSession = 0;

    [(NSSCompanionSyncManager *)self stopMonitoringVictoryAppInstallationOnPhone];
    [(NSSCompanionSyncManager *)self stopMonitoringAppConduitNotification];
    [(LSApplicationWorkspace *)self->_applicationWorkspace removeObserver:self];
    applicationWorkspace = self->_applicationWorkspace;
    self->_applicationWorkspace = 0;

    unint64_t v9 = +[ACXDeviceConnection sharedDeviceConnection];
    [v9 removeObserver:self];

    *(_WORD *)&self->_isCheckingIfAppConduitKnowsAboutVictoryWatchApp = 0;
  }
  _objc_release_x1();
}

- (void)startMonitoringVictoryAppInstallationOnPhone
{
  victoryAppInstallProgress = self->_victoryAppInstallProgress;
  id v4 = NSStringFromSelector("fractionCompleted");
  [(NSProgress *)victoryAppInstallProgress addObserver:self forKeyPath:v4 options:0 context:0];

  v5 = self->_victoryAppInstallProgress;
  v6 = NSStringFromSelector("installState");
  [(NSProgress *)v5 addObserver:self forKeyPath:v6 options:0 context:0];

  [(NSSCompanionSyncManager *)self checkForCompletionOfVictoryAppInstallationOnPhone];
}

- (void)stopMonitoringVictoryAppInstallationOnPhone
{
  victoryAppInstallProgress = self->_victoryAppInstallProgress;
  id v4 = NSStringFromSelector("fractionCompleted");
  [(NSProgress *)victoryAppInstallProgress removeObserver:self forKeyPath:v4];

  v5 = self->_victoryAppInstallProgress;
  v6 = NSStringFromSelector("installState");
  [(NSProgress *)v5 removeObserver:self forKeyPath:v6];

  id v7 = self->_victoryAppInstallProgress;
  self->_victoryAppInstallProgress = 0;
}

- (void)checkForCompletionOfVictoryAppInstallationOnPhone
{
  unint64_t v3 = (unint64_t)[(NSProgress *)self->_victoryAppInstallProgress installState];
  id v4 = NSSLogForType();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    [(NSProgress *)self->_victoryAppInstallProgress fractionCompleted];
    if (v3 > 5) {
      v6 = "Unknown";
    }
    else {
      v6 = off_100034F08[v3];
    }
    int v8 = 134218498;
    uint64_t v9 = v5;
    __int16 v10 = 2080;
    v11 = v6;
    __int16 v12 = 2048;
    unint64_t v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Victory app install progress on Phone: (%f); Install state: (%s - %lu)",
      (uint8_t *)&v8,
      0x20u);
  }

  if (v3 - 2 >= 3)
  {
    if (v3 == 5)
    {
      [(NSSCompanionSyncManager *)self stopMonitoringVictoryAppInstallationOnPhone];
      [(NSSCompanionSyncManager *)self checkIfAppConduitKnowsAboutVictoryWatchApp];
    }
  }
  else
  {
    id v7 = +[NSError errorWithDomain:@"NSSErrorDomain" code:7 userInfo:0];
    [(NSSCompanionSyncManager *)self reportSyncCompletionWithError:v7];
  }
}

- (void)checkIfAppConduitKnowsAboutVictoryWatchApp
{
  if (self->_isCheckingIfAppConduitKnowsAboutVictoryWatchApp)
  {
    self->_shouldCheckAgainIfAppConduitKnowsAboutVictoryWatchApp = 1;
  }
  else
  {
    self->_isCheckingIfAppConduitKnowsAboutVictoryWatchApp = 1;
    unint64_t v3 = +[NRPairedDeviceRegistry sharedInstance];
    id v4 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    uint64_t v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
    v6 = [v5 firstObject];

    [(NSSCompanionSyncManager *)self startMonitoringAppConduitNotification];
    id v7 = NSSLogForType();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Checking if Victory app is installed onto Watch", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    int v8 = +[ACXDeviceConnection sharedDeviceConnection];
    uint64_t v9 = [(NSSCompanionSyncManager *)self currentNikeWatchAppBundleID];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100014E68;
    v10[3] = &unk_100034E48;
    objc_copyWeak(&v11, buf);
    [v8 fetchInfoForApplicationWithBundleID:v9 forPairedDevice:v6 completion:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
}

- (void)didFetchInfoForApplication:(id)a3 error:(id)a4
{
  v6 = (char *)a3;
  id v7 = a4;
  int v8 = NSSLogForType();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412546;
    v22 = v6;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "application: (%@); error: (%@)",
      (uint8_t *)&v21,
      0x16u);
  }

  self->_isCheckingIfAppConduitKnowsAboutVictoryWatchApp = 0;
  if (v7)
  {
    uint64_t v9 = [v7 domain];
    if ([v9 isEqualToString:ACXErrorDomain])
    {
      id v10 = [v7 code];

      if (v10 == (id)19)
      {
        if (self->_shouldCheckAgainIfAppConduitKnowsAboutVictoryWatchApp)
        {
          self->_shouldCheckAgainIfAppConduitKnowsAboutVictoryWatchApp = 0;
          [(NSSCompanionSyncManager *)self checkIfAppConduitKnowsAboutVictoryWatchApp];
        }
        else
        {
          v19 = NSSLogForType();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v21) = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "AppConduit doesn't know yet about the Victory Watch app; Waiting for notification.",
              (uint8_t *)&v21,
              2u);
          }
        }
        goto LABEL_29;
      }
    }
    else
    {
    }
    v14 = self;
    id v15 = v7;
LABEL_15:
    [(NSSCompanionSyncManager *)v14 reportSyncCompletionWithError:v15];
    goto LABEL_29;
  }
  if ([v6 count])
  {
    [(NSSCompanionSyncManager *)self stopMonitoringAppConduitNotification];
    id v11 = [v6 objectForKey:ACXServerStatusKey];
    __int16 v12 = (const char *)[v11 integerValue];

    if (v12 == (const char *)2)
    {
      id v13 = [(id)objc_opt_class() pairedWatchVictoryBehavior];
      if (v13 != (id)2)
      {
        if (v13 != (id)1) {
          goto LABEL_29;
        }
        v14 = self;
        id v15 = 0;
        goto LABEL_15;
      }
      if (!self->_installState)
      {
        self->_installState = 1;
        v20 = NSSLogForType();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 136315138;
          v22 = "-[NSSCompanionSyncManager didFetchInfoForApplication:error:]";
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s Moving to Next Install Phase...", (uint8_t *)&v21, 0xCu);
        }

        [(NSSCompanionSyncManager *)self coordinateNikeAppInstallation];
      }
    }
    else
    {
      v18 = NSSLogForType();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 134217984;
        v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Watch app not yet installed. Installation state: (%ld). Triggering installation!", (uint8_t *)&v21, 0xCu);
      }

      [(NSSCompanionSyncManager *)self installVictoryAppOntoWatch];
    }
  }
  else
  {
    v16 = NSSLogForType();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "AppConduit returned empty application dictionary", (uint8_t *)&v21, 2u);
    }

    v17 = +[NSError errorWithDomain:@"NSSErrorDomain" code:7 userInfo:0];
    [(NSSCompanionSyncManager *)self reportSyncCompletionWithError:v17];
  }
LABEL_29:
}

- (void)startAppConduitTimer
{
  if (!self->_appConduitTimer)
  {
    unint64_t v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_workQueue);
    appConduitTimer = self->_appConduitTimer;
    self->_appConduitTimer = v3;

    uint64_t v5 = self->_appConduitTimer;
    dispatch_time_t v6 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x59682F00uLL);
    objc_initWeak(&location, self);
    id v7 = self->_appConduitTimer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100015418;
    v8[3] = &unk_100034E70;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v7, v8);
    dispatch_resume((dispatch_object_t)self->_appConduitTimer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)stopAppConduitTimer
{
  appConduitTimer = self->_appConduitTimer;
  if (appConduitTimer)
  {
    dispatch_source_cancel(appConduitTimer);
    id v4 = self->_appConduitTimer;
    self->_appConduitTimer = 0;
  }
}

- (void)appConduitTimerFired
{
  unint64_t v3 = NSSLogForType();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AppConduit timer fired", v5, 2u);
  }

  id v4 = +[NSError errorWithDomain:@"NSSErrorDomain" code:7 userInfo:0];
  [(NSSCompanionSyncManager *)self reportSyncCompletionWithError:v4];
}

- (void)startMonitoringAppConduitNotification
{
  p_appConduitNotifyToken = &self->_appConduitNotifyToken;
  if (self->_appConduitNotifyToken == -1)
  {
    unint64_t v3 = self;
    id v4 = (const char *)[ACXApplicationsUpdatedDarwinNotification UTF8String];
    workQueue = v3->_workQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000156AC;
    handler[3] = &unk_100034E98;
    handler[4] = v3;
    uint32_t v6 = notify_register_dispatch(v4, p_appConduitNotifyToken, workQueue, handler);
    if (v6)
    {
      uint32_t v7 = v6;
      int v8 = NSSLogForType();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        uint32_t v11 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to register observer for the AppConduit notification with status: (%u)", buf, 8u);
      }
    }
    [(NSSCompanionSyncManager *)v3 startAppConduitTimer];
  }
}

- (void)stopMonitoringAppConduitNotification
{
  int appConduitNotifyToken = self->_appConduitNotifyToken;
  if (appConduitNotifyToken != -1)
  {
    uint32_t v4 = notify_cancel(appConduitNotifyToken);
    if (v4)
    {
      uint32_t v5 = v4;
      uint32_t v6 = NSSLogForType();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7[0] = 67109120;
        v7[1] = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to unregister observer for AppConduit notification with status: (%u)", (uint8_t *)v7, 8u);
      }
    }
    self->_int appConduitNotifyToken = -1;
    [(NSSCompanionSyncManager *)self stopAppConduitTimer];
  }
}

- (void)installVictoryAppOntoWatch
{
  unint64_t v3 = [(NSSCompanionSyncManager *)self currentNikeWatchAppBundleID];
  uint32_t v4 = +[NRPairedDeviceRegistry sharedInstance];
  uint32_t v5 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  uint32_t v6 = [v4 getAllDevicesWithArchivedAltAccountDevicesMatching:v5];
  uint32_t v7 = [v6 firstObject];

  int v8 = NSSLogForType();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Installing Victory app onto Watch (%@)", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v9 = +[ACXDeviceConnection sharedDeviceConnection];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100015A04;
  v10[3] = &unk_100034EC0;
  objc_copyWeak(&v11, (id *)buf);
  [v9 installApplication:v3 onPairedDevice:v7 completion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)didInstallVictoryAppOnWatchWithState:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  uint32_t v7 = NSSLogForType();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    int64_t v10 = a3;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ACXExportedApplicationInstallState: (%ld); error: (%@)",
      (uint8_t *)&v9,
      0x16u);
  }

  if (v6)
  {
    [(NSSCompanionSyncManager *)self reportSyncCompletionWithError:v6];
  }
  else if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    int v8 = +[NSError errorWithDomain:@"NSSErrorDomain" code:7 userInfo:0];
    [(NSSCompanionSyncManager *)self reportSyncCompletionWithError:v8];
  }
}

- (void)didUpdateVictoryAppInstallationStateOntoWatch:(int64_t)a3
{
  uint32_t v5 = NSSLogForType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    int64_t v10 = (const char *)a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ACXExportedApplicationInstallState: (%ld)", (uint8_t *)&v9, 0xCu);
  }

  if (a3 == 2)
  {
    id v6 = [(id)objc_opt_class() pairedWatchVictoryBehavior];
    if (v6 == (id)2)
    {
      if (!self->_installState)
      {
        self->_installState = 1;
        int v8 = NSSLogForType();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 136315138;
          int64_t v10 = "-[NSSCompanionSyncManager didUpdateVictoryAppInstallationStateOntoWatch:]";
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Moving to Next Install Phase...", (uint8_t *)&v9, 0xCu);
        }

        [(NSSCompanionSyncManager *)self coordinateNikeAppInstallation];
      }
    }
    else if (v6 == (id)1)
    {
      [(NSSCompanionSyncManager *)self reportSyncCompletionWithError:0];
    }
  }
  else if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 8)
  {
    uint32_t v7 = +[NSError errorWithDomain:@"NSSErrorDomain" code:7 userInfo:0];
    [(NSSCompanionSyncManager *)self reportSyncCompletionWithError:v7];
  }
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = NSSLogForType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "coordinator: (%@); syncSession: (%@)",
      (uint8_t *)&v16,
      0x16u);
  }

  if ([(id)objc_opt_class() pairedWatchVictoryBehavior])
  {
    int64_t v10 = (OS_os_transaction *)os_transaction_create();
    syncTransaction = self->_syncTransaction;
    self->_syncTransaction = v10;

    if (self->_syncSession)
    {
      id v12 = +[NSError errorWithDomain:@"NSSErrorDomain" code:7 userInfo:0];
      [(NSSCompanionSyncManager *)self reportSyncCompletionWithError:v12];
    }
    objc_storeStrong((id *)&self->_syncSession, a4);
    objc_storeStrong((id *)&self->_syncCoordinator, a3);
    id v13 = +[LSApplicationWorkspace defaultWorkspace];
    applicationWorkspace = self->_applicationWorkspace;
    self->_applicationWorkspace = v13;

    [(LSApplicationWorkspace *)self->_applicationWorkspace addObserver:self];
    id v15 = +[ACXDeviceConnection sharedDeviceConnection];
    [v15 addObserver:self];

    [(NSSCompanionSyncManager *)self coordinateNikeAppInstallation];
  }
  else
  {
    [v8 syncDidComplete];
  }
}

- (void)coordinateNikeAppInstallation
{
  if (self->_installState)
  {
    *(_WORD *)&self->_isCheckingIfAppConduitKnowsAboutVictoryWatchApp = 0;
    victoryAppInstallProgress = self->_victoryAppInstallProgress;
    self->_victoryAppInstallProgress = 0;
  }
  uint32_t v4 = [(NSSCompanionSyncManager *)self currentNikePhoneAppBundleID];
  uint32_t v5 = +[LSApplicationProxy applicationProxyForIdentifier:v4];

  id v6 = [v5 appState];
  unsigned int v7 = [v6 isInstalled];

  if (v7)
  {
    id v8 = NSSLogForType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Victory App is already installed on Phone", (uint8_t *)&v17, 2u);
    }

    [(NSSCompanionSyncManager *)self checkIfAppConduitKnowsAboutVictoryWatchApp];
  }
  else
  {
    int v9 = [v5 appState];
    unsigned int v10 = [v9 isPlaceholder];

    __int16 v11 = NSSLogForType();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Victory App is installing on Phone.", (uint8_t *)&v17, 2u);
      }

      id v13 = [v5 installProgress];
      v14 = NSSLogForType();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v15)
        {
          LOWORD(v17) = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Monitoring Victory App installation progress.", (uint8_t *)&v17, 2u);
        }

        objc_storeStrong((id *)&self->_victoryAppInstallProgress, v13);
        [(NSSCompanionSyncManager *)self startMonitoringVictoryAppInstallationOnPhone];
      }
      else
      {
        if (v15)
        {
          int v17 = 138412290;
          __int16 v18 = v5;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Victory app installing but no progress on application proxy (%@).", (uint8_t *)&v17, 0xCu);
        }

        int v16 = +[NSError errorWithDomain:@"NSSErrorDomain" code:7 userInfo:0];
        [(NSSCompanionSyncManager *)self reportSyncCompletionWithError:v16];
      }
    }
    else
    {
      if (v12)
      {
        int v17 = 138412290;
        __int16 v18 = v5;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Victory App not installed or installing on the Phone (proxy %@).", (uint8_t *)&v17, 0xCu);
      }

      id v13 = +[NSError errorWithDomain:@"NSSErrorDomain" code:6 userInfo:0];
      [(NSSCompanionSyncManager *)self reportSyncCompletionWithError:v13];
    }
  }
}

- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = NSSLogForType();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "coordinator: (%@); syncSession: (%@)",
      (uint8_t *)&v8,
      0x16u);
  }
}

- (void)updateInstallStateForApplication:(id)a3 installState:(int64_t)a4
{
  id v6 = a3;
  unsigned int v7 = [(NSSCompanionSyncManager *)self currentNikeWatchAppBundleID];
  unsigned int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    workQueue = self->_workQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001642C;
    v10[3] = &unk_100034EE8;
    void v10[4] = self;
    v10[5] = a4;
    dispatch_async(workQueue, v10);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000164BC;
  block[3] = &unk_100034AE0;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      unsigned int v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v8) applicationIdentifier];
        __int16 v10 = [(NSSCompanionSyncManager *)self currentNikePhoneAppBundleID];
        unsigned int v11 = [v9 isEqualToString:v10];

        if (v11)
        {
          workQueue = self->_workQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100016660;
          block[3] = &unk_100034AE0;
          void block[4] = self;
          dispatch_async(workQueue, block);
        }
        unsigned int v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      unsigned int v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v8) applicationIdentifier];
        __int16 v10 = [(NSSCompanionSyncManager *)self currentNikePhoneAppBundleID];
        unsigned int v11 = [v9 isEqualToString:v10];

        if (v11)
        {
          workQueue = self->_workQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100016874;
          block[3] = &unk_100034AE0;
          void block[4] = self;
          dispatch_async(workQueue, block);
        }
        unsigned int v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (PSYSyncCoordinator)syncCoordinator
{
  return self->_syncCoordinator;
}

- (void)setSyncCoordinator:(id)a3
{
}

- (PSYServiceSyncSession)syncSession
{
  return self->_syncSession;
}

- (void)setSyncSession:(id)a3
{
}

- (NSProgress)victoryAppInstallProgress
{
  return self->_victoryAppInstallProgress;
}

- (void)setVictoryAppInstallProgress:(id)a3
{
}

- (LSApplicationWorkspace)applicationWorkspace
{
  return self->_applicationWorkspace;
}

- (void)setApplicationWorkspace:(id)a3
{
}

- (int)appConduitNotifyToken
{
  return self->_appConduitNotifyToken;
}

- (void)setAppConduitNotifyToken:(int)a3
{
  self->_int appConduitNotifyToken = a3;
}

- (unint64_t)installState
{
  return self->_installState;
}

- (void)setInstallState:(unint64_t)a3
{
  self->_installState = a3;
}

- (OS_dispatch_source)appConduitTimer
{
  return self->_appConduitTimer;
}

- (void)setAppConduitTimer:(id)a3
{
}

- (BOOL)isCheckingIfAppConduitKnowsAboutVictoryWatchApp
{
  return self->_isCheckingIfAppConduitKnowsAboutVictoryWatchApp;
}

- (void)setIsCheckingIfAppConduitKnowsAboutVictoryWatchApp:(BOOL)a3
{
  self->_isCheckingIfAppConduitKnowsAboutVictoryWatchApp = a3;
}

- (BOOL)shouldCheckAgainIfAppConduitKnowsAboutVictoryWatchApp
{
  return self->_shouldCheckAgainIfAppConduitKnowsAboutVictoryWatchApp;
}

- (void)setShouldCheckAgainIfAppConduitKnowsAboutVictoryWatchApp:(BOOL)a3
{
  self->_shouldCheckAgainIfAppConduitKnowsAboutVictoryWatchApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appConduitTimer, 0);
  objc_storeStrong((id *)&self->_applicationWorkspace, 0);
  objc_storeStrong((id *)&self->_victoryAppInstallProgress, 0);
  objc_storeStrong((id *)&self->_syncSession, 0);
  objc_storeStrong((id *)&self->_syncCoordinator, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_syncTransaction, 0);
}

@end