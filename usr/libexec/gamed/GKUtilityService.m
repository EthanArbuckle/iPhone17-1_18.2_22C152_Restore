@interface GKUtilityService
+ (Class)interfaceClass;
+ (unint64_t)requiredEntitlements;
- (BOOL)requiresAuthentication;
- (BOOL)shouldUseGameControllerSPI:(id)a3;
- (GKOverlayServiceUtils)overlayServiceUtils;
- (id)_bagValuesForKeys:(id)a3;
- (id)ampController;
- (void)cacheImageData:(id)a3 inSubdirectory:(id)a4 withFileName:(id)a5 handler:(id)a6;
- (void)completeGameRecording;
- (void)completeMatchRecording:(id)a3 matchType:(id)a4;
- (void)deleteCachedImageDataFromSubdirectory:(id)a3 withFileName:(id)a4 handler:(id)a5;
- (void)emitMultiplayerMessage:(id)a3;
- (void)getBSServiceConnectionEndpointForMachName:(id)a3 service:(id)a4 instance:(id)a5 handler:(id)a6;
- (void)getStoreBagValuesForKeys:(id)a3 handler:(id)a4;
- (void)handleGameControllerHomeButtonPressed;
- (void)loadCachedImageDataFromSubdirectory:(id)a3 withFileName:(id)a4 handler:(id)a5;
- (void)openDashboardAsRemoteAlertForGame:(id)a3 hostPID:(int)a4 deeplink:(id)a5;
- (void)openDashboardAsRemoteAlertForGame:(id)a3 hostPID:(int)a4 deeplink:(id)a5 launchContext:(id)a6;
- (void)openICloudSettings;
- (void)openSoftwareUpdateSettings;
- (void)recordActiveDevices:(id)a3;
- (void)recordGameStart;
- (void)recordMatchServer:(id)a3;
- (void)recordMatchStart:(id)a3 minPlayers:(id)a4 maxPlayers:(id)a5;
- (void)recordSharePlayDevices:(id)a3;
- (void)reportLoadUrlMetricsEvent:(id)a3;
- (void)reportMetricsEventWithTopic:(id)a3 shouldFlush:(id)a4 metricsFields:(id)a5;
- (void)reportMultiplayerActivityMetricsEvent:(id)a3;
- (void)reportPerformanceMetricsEvent:(id)a3;
- (void)requestImageDataForURL:(id)a3 subdirectory:(id)a4 fileName:(id)a5 handler:(id)a6;
- (void)setOverlayServiceUtils:(id)a3;
- (void)viewableThresholdWithCompletion:(id)a3;
@end

@implementation GKUtilityService

- (BOOL)requiresAuthentication
{
  return 0;
}

+ (unint64_t)requiredEntitlements
{
  return 1;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class();
}

- (GKOverlayServiceUtils)overlayServiceUtils
{
  overlayServiceUtils = self->_overlayServiceUtils;
  if (!overlayServiceUtils)
  {
    v4 = objc_alloc_init(GKOverlayServiceUtils);
    v5 = self->_overlayServiceUtils;
    self->_overlayServiceUtils = v4;

    overlayServiceUtils = self->_overlayServiceUtils;
  }

  return overlayServiceUtils;
}

- (void)getStoreBagValuesForKeys:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKUtilityService: getStoreBagValuesForKeys:", buf, 2u);
  }
  v10 = [(GKUtilityService *)self _bagValuesForKeys:v6];
  if (v7)
  {
    v11 = [(GKService *)self clientProxy];
    v12 = [v11 replyQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001B118;
    v13[3] = &unk_1002D3930;
    id v15 = v7;
    id v14 = v10;
    [v14 notifyOnQueue:v12 block:v13];
  }
}

- (id)_bagValuesForKeys:(id)a3
{
  id v4 = a3;
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKUtilityService.m", 131, "-[GKUtilityService _bagValuesForKeys:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001B2B0;
  v12[3] = &unk_1002D3980;
  v12[4] = self;
  id v13 = v4;
  id v7 = v6;
  id v14 = v7;
  id v8 = v4;
  [v7 perform:v12];
  v9 = v14;
  id v10 = v7;

  return v10;
}

- (void)requestImageDataForURL:(id)a3 subdirectory:(id)a4 fileName:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10001B66C;
  v30[3] = &unk_1002D39A8;
  id v14 = v10;
  id v31 = v14;
  id v15 = v11;
  id v32 = v15;
  id v16 = v12;
  id v33 = v16;
  v34 = self;
  id v17 = v13;
  id v35 = v17;
  v18 = objc_retainBlock(v30);
  v19 = [v14 path];
  v20 = GKImageCacheRoot();
  unsigned __int8 v21 = [v19 hasPrefix:v20];

  if ((v21 & 1) != 0
    || (+[GKPreferences shared],
        v22 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v23 = [v22 isInternalBuild],
        v22,
        (v23 & 1) == 0))
  {
    ((void (*)(void *))v18[2])(v18);
  }
  else
  {
    v24 = [(GKService *)self transport];
    v25 = [v24 storeBag];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10001B700;
    v26[3] = &unk_1002D39D0;
    id v27 = v14;
    id v28 = v17;
    v29 = v18;
    [v27 hasTrustedImageDomainWithStoreBag:v25 completionHandler:v26];
  }
}

- (void)cacheImageData:(id)a3 inSubdirectory:(id)a4 withFileName:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKUtilityService.m", 178, "-[GKUtilityService cacheImageData:inSubdirectory:withFileName:handler:]");
  id v15 = +[GKDispatchGroup dispatchGroupWithName:v14];

  if (v11 && v12)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10001B9AC;
    v20[3] = &unk_1002D3980;
    id v21 = v11;
    id v22 = v12;
    id v23 = v10;
    [v15 perform:v20];
  }
  if (v13)
  {
    id v16 = [(GKService *)self clientProxy];
    id v17 = [v16 replyQueue];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001BB5C;
    v18[3] = &unk_1002D3A20;
    id v19 = v13;
    [v15 notifyOnQueue:v17 block:v18];
  }
}

- (void)loadCachedImageDataFromSubdirectory:(id)a3 withFileName:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKUtilityService.m", 203, "-[GKUtilityService loadCachedImageDataFromSubdirectory:withFileName:handler:]");
  id v12 = +[GKDispatchGroup dispatchGroupWithName:v11];

  if (v8 && v9)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001BD4C;
    v18[3] = &unk_1002D3980;
    id v19 = v8;
    id v20 = v9;
    id v21 = v12;
    [v21 perform:v18];
  }
  if (v10)
  {
    id v13 = [(GKService *)self clientProxy];
    id v14 = [v13 replyQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001BECC;
    v15[3] = &unk_1002D3930;
    id v17 = v10;
    id v16 = v12;
    [v16 notifyOnQueue:v14 block:v15];
  }
}

- (void)deleteCachedImageDataFromSubdirectory:(id)a3 withFileName:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKUtilityService.m", 227, "-[GKUtilityService deleteCachedImageDataFromSubdirectory:withFileName:handler:]");
  id v12 = +[GKDispatchGroup dispatchGroupWithName:v11];

  if (v8 && v9)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001C0F0;
    v17[3] = &unk_1002D3A70;
    id v18 = v8;
    id v19 = v9;
    [v12 perform:v17];
  }
  if (v10)
  {
    id v13 = [(GKService *)self clientProxy];
    id v14 = [v13 replyQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001C2D8;
    v15[3] = &unk_1002D3A20;
    id v16 = v10;
    [v12 notifyOnQueue:v14 block:v15];
  }
}

- (void)openICloudSettings
{
  id v2 = +[GKApplicationWorkspace defaultWorkspace];
  [v2 openICloudSettings];
}

- (void)openSoftwareUpdateSettings
{
  id v2 = +[GKApplicationWorkspace defaultWorkspace];
  [v2 openSoftwareUpdateSettings];
}

- (id)ampController
{
  return +[GKAMPController controller];
}

- (void)viewableThresholdWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(GKService *)self clientProxy];
  id v6 = [v5 replyQueue];

  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKUtilityService.m", 271, "-[GKUtilityService viewableThresholdWithCompletion:]");
  id v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001C534;
  v17[3] = &unk_1002D3A70;
  void v17[4] = self;
  id v9 = v8;
  id v18 = v9;
  [v9 perform:v17];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001C640;
  v13[3] = &unk_1002D3AE8;
  id v15 = v6;
  id v16 = v4;
  id v14 = v9;
  id v10 = v6;
  id v11 = v4;
  id v12 = v9;
  [v12 notifyOnQueue:v10 block:v13];
}

- (void)reportMetricsEventWithTopic:(id)a3 shouldFlush:(id)a4 metricsFields:(id)a5
{
  id v16 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(GKService *)self clientProxy];
  id v11 = [v10 originalBundleIdentifier];

  id v12 = [v16 objectForKeyedSubscript:@"hostApp"];
  unsigned int v13 = [v12 isMemberOfClass:objc_opt_class()];

  if (v13)
  {
    uint64_t v14 = [v16 objectForKeyedSubscript:@"hostApp"];

    id v11 = (void *)v14;
  }
  id v15 = +[GKAMPController controller];
  [v15 reportMetricsEventWithTopic:v9 hostAppBundleId:v11 shouldFlush:v8 metricsFields:v16];
}

- (void)reportPerformanceMetricsEvent:(id)a3
{
  id v4 = a3;
  id v7 = +[GKAMPController controller];
  v5 = [(GKService *)self clientProxy];
  id v6 = [v5 originalBundleIdentifier];
  [v7 reportPerformanceEventWithHostAppBundleId:v6 metricsFields:v4];
}

- (void)reportMultiplayerActivityMetricsEvent:(id)a3
{
  id v4 = a3;
  id v7 = +[GKAMPController controller];
  v5 = [(GKService *)self clientProxy];
  id v6 = [v5 originalBundleIdentifier];
  [v7 reportMultiplayerActivityEventWithHostAppBundleId:v6 metricsFields:v4];
}

- (void)reportLoadUrlMetricsEvent:(id)a3
{
  id v3 = a3;
  id v4 = +[GKAMPController controller];
  [v4 reportLoadUrlMetricsEventWithMetricsFields:v3];
}

- (void)recordMatchStart:(id)a3 minPlayers:(id)a4 maxPlayers:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!os_log_GKGeneral) {
    id v10 = (id)GKOSLoggers();
  }
  id v11 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "match making recording started", v13, 2u);
  }
  id v12 = +[GKMatchReporter shared];
  [v12 recordMatchStartWithType:v7 minPlayers:v8 maxPlayers:v9];
}

- (void)recordMatchServer:(id)a3
{
  id v3 = a3;
  id v4 = +[GKMatchReporter shared];
  [v4 recordMatchServerWithType:v3];
}

- (void)recordActiveDevices:(id)a3
{
  id v3 = a3;
  id v4 = +[GKMatchReporter shared];
  [v4 recordActiveDevicesWithCount:v3];
}

- (void)recordSharePlayDevices:(id)a3
{
  id v3 = a3;
  id v4 = +[GKMatchReporter shared];
  [v4 recordSharePlayDevicesWithCount:v3];
}

- (void)completeMatchRecording:(id)a3 matchType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "recording completed result: %@ type: %@", buf, 0x16u);
  }
  id v10 = +[GKMatchReporter shared];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001CEC8;
  v11[3] = &unk_1002D3B10;
  v11[4] = self;
  [v10 recordMatchCompleteWithMatchType:v7 result:v6 completion:v11];
}

- (void)recordGameStart
{
  id v2 = +[GKMatchReporter shared];
  [v2 recordGameStart];
}

- (void)completeGameRecording
{
  id v3 = +[GKMatchReporter shared];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001D044;
  v4[3] = &unk_1002D3B10;
  v4[4] = self;
  [v3 recordGameCompleteWithCompletion:v4];
}

- (void)emitMultiplayerMessage:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001D180;
  v4[3] = &unk_1002D3B38;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)openDashboardAsRemoteAlertForGame:(id)a3 hostPID:(int)a4 deeplink:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v20 = a3;
  id v8 = a5;
  id v9 = [v20 bundleIdentifier];
  unsigned __int8 v10 = [v9 isEqualToString:GKGameControllerDaemonIdentifier];

  if (v10)
  {
    id v11 = (id *)&GKDashboardLaunchContextGameController;
  }
  else
  {
    id v12 = [v20 bundleIdentifier];
    unsigned __int8 v13 = +[NSBundle _gkBundleIdentifierIsRelatedToContactsUI:v12];

    if (v13)
    {
      id v11 = (id *)&GKDashboardLaunchContextContacts;
    }
    else
    {
      __int16 v14 = [v20 bundleIdentifier];
      unsigned __int8 v15 = [v14 isEqualToString:GKAppStoreIdentifier];

      if ((v15 & 1) == 0)
      {
        id v17 = [v20 bundleIdentifier];
        id v18 = +[NSString stringWithFormat:@"Unknown bundleId attempting to open the dashboard. Use openDashboardAsRemoteAlertForGame:hostPID:deeplink:launchContext: instead: %@", v17];
        id v19 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v18 userInfo:0];

        objc_exception_throw(v19);
      }
      id v11 = (id *)&GKDashboardLaunchContextAppStore;
    }
  }
  id v16 = *v11;
  [(GKUtilityService *)self openDashboardAsRemoteAlertForGame:v20 hostPID:v6 deeplink:v8 launchContext:v16];
}

- (void)openDashboardAsRemoteAlertForGame:(id)a3 hostPID:(int)a4 deeplink:(id)a5 launchContext:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!os_log_GKGeneral) {
    id v13 = (id)GKOSLoggers();
  }
  __int16 v14 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v15 = v14;
    id v16 = [v10 bundleIdentifier];
    int v26 = 138413058;
    id v27 = v16;
    __int16 v28 = 1024;
    int v29 = v8;
    __int16 v30 = 2112;
    id v31 = v11;
    __int16 v32 = 2112;
    id v33 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "RemoteAlert: openDashboardAsRemoteAlertForGame:%@\n hostPID:%d\n deeplink:%@\n launchContext:%@", (uint8_t *)&v26, 0x26u);
  }
  if ([(GKUtilityService *)self shouldUseGameControllerSPI:v10])
  {
    if (!os_log_GKGeneral) {
      id v17 = (id)GKOSLoggers();
    }
    id v18 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "RemoteAlert: redirecting to handleGameControllerHomeButtonPressed", (uint8_t *)&v26, 2u);
    }
    [(GKUtilityService *)self handleGameControllerHomeButtonPressed];
  }
  else if (_os_feature_enabled_impl())
  {
    +[GKOverlayServiceUtils showDashboardWithGame:v10 deepLink:v11 launchContext:v12];
  }
  else
  {
    id v19 = +[GKRemoteAlertLauncher shared];
    unsigned int v20 = [v19 isLaunching];

    if (v20)
    {
      if (!os_log_GKGeneral) {
        id v21 = (id)GKOSLoggers();
      }
      id v22 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        LOWORD(v26) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "RemoteAlert: Not going to open the dashboard because it is launching", (uint8_t *)&v26, 2u);
      }
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v23 = (id)GKOSLoggers();
      }
      v24 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        LOWORD(v26) = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "RemoteAlert: Launching the remote alert dashboard!", (uint8_t *)&v26, 2u);
      }
      v25 = +[GKRemoteAlertLauncher shared];
      [v25 launchBypassingPreAuthentication:1 forGame:v10 hostPID:v8 deeplink:v11 launchContext:v12 observer:0];
    }
  }
}

- (BOOL)shouldUseGameControllerSPI:(id)a3
{
  id v3 = a3;
  id v4 = [v3 bundleIdentifier];
  if ([v4 isEqualToString:GKGameControllerDaemonIdentifier])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    uint64_t v6 = [v3 bundleIdentifier];
    unsigned __int8 v5 = [v6 isEqualToString:GKGameCenterIdentifier];
  }
  return v5;
}

- (void)handleGameControllerHomeButtonPressed
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "RemoteAlert: handleGameControllerHomeButtonPressed", buf, 2u);
  }
  if (_os_feature_enabled_impl())
  {
    +[GKOverlayServiceUtils showDashboardWithGame:0 deepLink:&__NSDictionary0__struct launchContext:GKDashboardLaunchContextGameController];
  }
  else
  {
    unsigned __int8 v5 = +[GKRemoteAlertLauncher shared];
    unsigned int v6 = [v5 isLaunching];

    if (v6)
    {
      if (!os_log_GKGeneral) {
        id v7 = (id)GKOSLoggers();
      }
      uint64_t v8 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unsigned int v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "RemoteAlert: The Game Center overlay is being launched. Skipping this call.", v20, 2u);
      }
    }
    else if (+[GKClientProxy isGameCenterDashboardForegroundRunning])
    {
      if (!os_log_GKGeneral) {
        id v9 = (id)GKOSLoggers();
      }
      id v10 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "RemoteAlert: The Game Center overlay is running in the foreground. Notifying it to dismiss itself.", v19, 2u);
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, GKDashboardNeedsToDismiss, 0, 0, 1u);
    }
    else
    {
      id v12 = +[GKGameInternal createGameControllerDaemonGameInternal];
      id v13 = [(GKService *)self clientProxy];
      id v14 = [v13 pid];

      if (!os_log_GKGeneral) {
        id v15 = (id)GKOSLoggers();
      }
      id v16 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "RemoteAlert: Launching the Game Center overlay.", v18, 2u);
      }
      id v17 = +[GKRemoteAlertLauncher shared];
      [v17 launchBypassingPreAuthentication:1 forGame:v12 hostPID:v14 deeplink:&__NSDictionary0__struct launchContext:GKDashboardLaunchContextGameController observer:0];
    }
  }
}

- (void)getBSServiceConnectionEndpointForMachName:(id)a3 service:(id)a4 instance:(id)a5 handler:(id)a6
{
  id v9 = (void (**)(id, id))a6;
  id v10 = +[BSServiceConnectionEndpoint endpointForSystemMachName:a3 service:a4 instance:a5];
  v9[2](v9, v10);
}

- (void)setOverlayServiceUtils:(id)a3
{
}

- (void).cxx_destruct
{
}

@end