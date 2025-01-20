@interface FMDSecureLocationMonitor
- (BOOL)forcePushOndemandlocation;
- (BOOL)isRunning;
- (BOOL)locationManagerStarted;
- (BOOL)shouldStartMonitor;
- (CLLocationManager)bystanderLocationManager;
- (CLLocationManager)forceShallowLocationManager;
- (CLLocationManager)heartbeatLocationManager;
- (CLLocationManager)liveLocationManager;
- (CLLocationManager)ondemandLocationManager;
- (CLLocationManager)shallowLocationManager;
- (CLLocationManager)slcLocationManager;
- (CLLocationManager)stewieLocationManager;
- (CLLocationManager)visitsLocationManager;
- (FMDMotionMonitor)motionMonitor;
- (FMDSecureLocationConfigManager)configManager;
- (FMDSecureLocationMonitor)init;
- (FMDSecureLocationPublisher)locationPublisher;
- (NSDate)lastOnDemandPublishTime;
- (NSDate)lastPublishedTime;
- (NSDate)lastShallowPublishTime;
- (OS_dispatch_queue)forcePushOndemandLocationQueue;
- (OS_dispatch_queue)locationPublishQueue;
- (SPSecureLocationsManager)secureLocationsManager;
- (double)_clLocationAccuracyFromConfigValue:(id)a3;
- (id)_createLocationManager;
- (id)_createLocationManagerForStewie;
- (id)_createLocationManagerWithQueue:(id)a3;
- (void)_publishHeartbeatIfNeeded;
- (void)_publishLocation:(id)a3;
- (void)_publishPeriodicShallowIfNeeded:(id)a3;
- (void)_registerForOnDemandPublishRequest;
- (void)_registerForStewiePublishRequest;
- (void)_scheduleXPCActivity;
- (void)_unregisterFromOnDemandPublishRequest;
- (void)_unregisterFromStewiePublishRequest;
- (void)activeConfigChanged:(id)a3;
- (void)activeConfigExtended:(id)a3;
- (void)dealloc;
- (void)forcePublishOndemandLocationIfNeeded:(id)a3;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManager:(id)a3 didVisit:(id)a4;
- (void)publishLocationToStewie:(id)a3;
- (void)publishOnDemandLocation:(id)a3;
- (void)publishOneTimeShallowLocation:(id)a3;
- (void)requestForcedShallowLocation;
- (void)setBystanderLocationManager:(id)a3;
- (void)setConfigManager:(id)a3;
- (void)setForcePushOndemandLocationQueue:(id)a3;
- (void)setForcePushOndemandlocation:(BOOL)a3;
- (void)setForceShallowLocationManager:(id)a3;
- (void)setHeartbeatLocationManager:(id)a3;
- (void)setLastOnDemandPublishTime:(id)a3;
- (void)setLastPublishedTime:(id)a3;
- (void)setLastShallowPublishTime:(id)a3;
- (void)setLiveLocationManager:(id)a3;
- (void)setLocationManagerStarted:(BOOL)a3;
- (void)setLocationPublishQueue:(id)a3;
- (void)setLocationPublisher:(id)a3;
- (void)setMotionMonitor:(id)a3;
- (void)setOndemandLocationManager:(id)a3;
- (void)setSecureLocationsManager:(id)a3;
- (void)setShallowLocationManager:(id)a3;
- (void)setSlcLocationManager:(id)a3;
- (void)setStewieLocationManager:(id)a3;
- (void)setVisitsLocationManager:(id)a3;
- (void)startLocationMonitor:(id)a3;
- (void)startLocationMonitorAfterRestart;
- (void)startLocationMonitorWithContext:(id)a3 completion:(id)a4;
- (void)startLocationMonitorWithContext:(id)a3 forcePublish:(BOOL)a4 completion:(id)a5;
- (void)stopLocationMonitor:(id)a3;
- (void)stopLocationMonitorWithContext:(id)a3 completion:(id)a4;
- (void)updateMonitorConfig:(id)a3;
@end

@implementation FMDSecureLocationMonitor

- (FMDSecureLocationMonitor)init
{
  v17.receiver = self;
  v17.super_class = (Class)FMDSecureLocationMonitor;
  id v2 = [(FMDSecureLocationMonitor *)&v17 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.findmydevice.locationPublishQueue", 0);
    v4 = (void *)*((void *)v2 + 18);
    *((void *)v2 + 18) = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.findmydevice.forcePushOndemandLocationQueue", 0);
    v6 = (void *)*((void *)v2 + 19);
    *((void *)v2 + 19) = v5;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v2 + 19), "com.apple.findmydevice.forcePublishQueueKey", "com.apple.findmydevice.forcePublishQueueKey", 0);
    v7 = objc_alloc_init(FMDSecureLocationConfigManager);
    v8 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v7;

    [*((id *)v2 + 14) setDelegate:v2];
    v9 = [*((id *)v2 + 14) activeConfig];

    if (v9)
    {
      v10 = [FMDSecureLocationPublisher alloc];
      v11 = [*((id *)v2 + 14) activeConfig];
      v12 = [(FMDSecureLocationPublisher *)v10 initWithConfiguration:v11];
      v13 = (void *)*((void *)v2 + 13);
      *((void *)v2 + 13) = v12;
    }
    id v14 = objc_alloc_init((Class)SPSecureLocationsManager);
    v15 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v14;

    [v2 _registerForOnDemandPublishRequest];
    [v2 _registerForStewiePublishRequest];
  }
  return (FMDSecureLocationMonitor *)v2;
}

- (void)dealloc
{
  [(FMDSecureLocationMonitor *)self _unregisterFromOnDemandPublishRequest];
  [(FMDSecureLocationMonitor *)self _unregisterFromStewiePublishRequest];
  v3.receiver = self;
  v3.super_class = (Class)FMDSecureLocationMonitor;
  [(FMDSecureLocationMonitor *)&v3 dealloc];
}

- (void)startLocationMonitor:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = sub_1000599A8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attempting to start location monitors", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009087C;
  block[3] = &unk_1002DC610;
  objc_copyWeak(&v9, buf);
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

- (void)startLocationMonitorWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  id v8 = sub_1000599A8();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "startLocationMonitorWithContext %@", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [(FMDSecureLocationMonitor *)self configManager];
  [v9 requestMonitorWithContext:v6];

  v7[2](v7, 0);
}

- (void)startLocationMonitorWithContext:(id)a3 forcePublish:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, void))a5;
  int v10 = sub_1000599A8();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v8;
    __int16 v21 = 1024;
    BOOL v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "startLocationMonitorWithContext %@ forcePublish %d", buf, 0x12u);
  }

  if (v6)
  {
    objc_initWeak((id *)buf, self);
    id v11 = [(FMDSecureLocationMonitor *)self forcePushOndemandLocationQueue];
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_100091858;
    v16 = &unk_1002D9238;
    objc_copyWeak(&v18, (id *)buf);
    objc_super v17 = self;
    dispatch_async(v11, &v13);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  v12 = [(FMDSecureLocationMonitor *)self configManager];
  [v12 requestMonitorWithContext:v8];

  v9[2](v9, 0);
}

- (void)startLocationMonitorAfterRestart
{
  objc_super v3 = (char *)+[FMPreferencesUtil integerForKey:@"kFMDSecureLocationsShouldStartMonitor" inDomain:kFMDNotBackedUpPrefDomain];
  id v4 = sub_1000599A8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    int v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "shouldStart secure locations %ld", (uint8_t *)&v9, 0xCu);
  }

  id v5 = objc_alloc_init((Class)FMDSecureLocationContext);
  [v5 setFindMyId:@"restart"];
  if ((unint64_t)(v3 - 1) < 3)
  {
    [v5 setMode:*(void *)*(&off_1002DC778 + (void)(v3 - 1))];
LABEL_6:
    BOOL v6 = sub_1000599A8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v5 mode];
      int v9 = 138412290;
      int v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "starting location monitoring after restart with policy %@", (uint8_t *)&v9, 0xCu);
    }
    if (![(FMDSecureLocationMonitor *)self isRunning]) {
      [(FMDSecureLocationMonitor *)self startLocationMonitorWithContext:v5 completion:&stru_1002DC650];
    }
    goto LABEL_10;
  }
  if ((uint64_t)v3 > 0) {
    goto LABEL_6;
  }
  if (![(FMDSecureLocationMonitor *)self isRunning])
  {
    id v8 = sub_1000599A8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unregister previously scheduled activity, if any.", (uint8_t *)&v9, 2u);
    }

    xpc_activity_unregister("com.apple.findmydevice.secureLocationsCheck");
  }
LABEL_10:
}

- (void)stopLocationMonitorWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  id v8 = sub_1000599A8();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "stopLocationMonitorWithContext %@", (uint8_t *)&v10, 0xCu);
  }

  int v9 = [(FMDSecureLocationMonitor *)self configManager];
  [v9 removeMonitorWithContext:v6];

  v7[2](v7, 0);
}

- (void)stopLocationMonitor:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091D78;
  block[3] = &unk_1002D9DD0;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (BOOL)isRunning
{
  return [(FMDSecureLocationMonitor *)self locationManagerStarted];
}

- (BOOL)shouldStartMonitor
{
  return (uint64_t)+[FMPreferencesUtil integerForKey:@"kFMDSecureLocationsShouldStartMonitor" inDomain:kFMDNotBackedUpPrefDomain] > 0;
}

- (double)_clLocationAccuracyFromConfigValue:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"best"])
  {
    double v4 = kCLLocationAccuracyBest;
    CFStringRef v5 = @"kCLLocationAccuracyBest";
  }
  else if ([v3 isEqualToString:@"navigation"])
  {
    double v4 = kCLLocationAccuracyBestForNavigation;
    CFStringRef v5 = @"kCLLocationAccuracyBestForNavigation";
  }
  else if ([v3 isEqualToString:@"10meters"])
  {
    double v4 = kCLLocationAccuracyNearestTenMeters;
    CFStringRef v5 = @"kCLLocationAccuracyNearestTenMeters";
  }
  else
  {
    double v4 = kCLLocationAccuracyHundredMeters;
    CFStringRef v5 = @"kCLLocationAccuracyHundredMeters";
    if (([v3 isEqualToString:@"100meters"] & 1) == 0)
    {
      if ([v3 isEqualToString:@"1kilometer"])
      {
        double v4 = kCLLocationAccuracyKilometer;
        CFStringRef v5 = @"kCLLocationAccuracyKilometer";
      }
      else if ([v3 isEqualToString:@"3kilometers"])
      {
        CFStringRef v5 = @"kCLLocationAccuracyThreeKilometers";
        double v4 = kCLLocationAccuracyThreeKilometers;
      }
    }
  }
  id v6 = sub_1000599A8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    CFStringRef v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: returning CL accuracy %@ for config value %@", (uint8_t *)&v8, 0x16u);
  }

  return v4;
}

- (void)_publishLocation:(id)a3
{
  id v4 = a3;
  if ([v4 isLocationValid])
  {
    CFStringRef v5 = +[FMDRestrictedRegions sharedInstance];
    if ([v5 isRestrictedSKU])
    {
      id v6 = sub_1000599A8();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
LABEL_11:

        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      id v7 = "SecureLocationMonitor - not publishing - restricted SKU";
      int v8 = v6;
      uint32_t v9 = 2;
    }
    else
    {
      __int16 v10 = [v4 locationInfo];
      id v11 = [v10 latitude];
      [v11 doubleValue];
      double v13 = v12;
      uint64_t v14 = [v4 locationInfo];
      v15 = [v14 longitude];
      [v15 doubleValue];
      unsigned int v17 = [v5 isRestrictedLocationWithLatitude:v13 longitude:v16];

      if (!v17)
      {
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10009259C;
        v18[3] = &unk_1002D93F0;
        v18[4] = self;
        id v19 = v4;
        _os_activity_initiate((void *)&_mh_execute_header, "FMDSecureLocationMonitor.publishLocation", OS_ACTIVITY_FLAG_DEFAULT, v18);

        goto LABEL_13;
      }
      id v6 = sub_1000599A8();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 67109376;
      int v21 = 0;
      __int16 v22 = 1024;
      int v23 = 1;
      id v7 = "SecureLocationMonitor - not publishing - restricted region. isRestrictedSKU %d isRestrictedLocation %d";
      int v8 = v6;
      uint32_t v9 = 14;
    }
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    goto LABEL_11;
  }
  CFStringRef v5 = sub_1000599A8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor - not publishing - invalid location", buf, 2u);
  }
LABEL_13:
}

- (void)_publishHeartbeatIfNeeded
{
  id v3 = [(FMDSecureLocationMonitor *)self lastPublishedTime];

  id v4 = [(FMDSecureLocationMonitor *)self lastPublishedTime];
  [v4 timeIntervalSinceNow];
  double v6 = v5;
  id v7 = [(FMDSecureLocationMonitor *)self configManager];
  int v8 = [v7 activeConfig];
  [v8 heartbeatPublish];
  double v10 = v9;

  id v11 = sub_1000599A8();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      CFStringRef v12 = @"NO";
    }
    else {
      CFStringRef v12 = @"YES";
    }
    double v13 = [(FMDSecureLocationMonitor *)self lastPublishedTime];
    [v13 timeIntervalSinceNow];
    double v15 = -v14;
    double v16 = [(FMDSecureLocationMonitor *)self configManager];
    unsigned int v17 = [v16 activeConfig];
    [v17 heartbeatPublish];
    *(_DWORD *)buf = 138412802;
    CFStringRef v22 = v12;
    __int16 v23 = 2048;
    double v24 = v15;
    __int16 v25 = 2048;
    uint64_t v26 = v18;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: Heartbeat isfirstpublish %@. Time since last publish %f configLimit %f", buf, 0x20u);
  }
  id v19 = [(FMDSecureLocationMonitor *)self lastPublishedTime];

  if (!v19 || v10 <= -v6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100092B00;
    block[3] = &unk_1002D9378;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_publishPeriodicShallowIfNeeded:(id)a3
{
  id v4 = a3;
  double v5 = [(FMDSecureLocationMonitor *)self configManager];
  double v6 = [v5 configForPolicy:kFMDSecureLocationModeProactiveShallow];

  id v7 = +[NSDate date];
  uint64_t v8 = [(FMDSecureLocationMonitor *)self lastShallowPublishTime];
  if (!v8) {
    goto LABEL_3;
  }
  double v9 = (void *)v8;
  double v10 = [(FMDSecureLocationMonitor *)self lastShallowPublishTime];
  [v10 timeIntervalSinceNow];
  double v12 = -v11;
  [v6 minTimeBetweenPublish];
  double v14 = v13;

  if (v14 <= v12)
  {
LABEL_3:
    double v15 = [[CLLocationFMGeoLocatableAdapter alloc] initWithLocation:v4];
    double v16 = [FMDSecureLocationInfo alloc];
    unsigned int v17 = [(FMDSecureLocationMonitor *)self motionMonitor];
    uint64_t v18 = [v17 lastKnownDeviceMotion];
    id v19 = [(FMDSecureLocationInfo *)v16 initWithLocation:v15 motion:v18 publishReason:6];

    [(FMDSecureLocationMonitor *)self _publishLocation:v19];
    [(FMDSecureLocationMonitor *)self setLastShallowPublishTime:v7];
    id v20 = sub_1000599A8();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: Published periodic shallow during live session", v21, 2u);
    }
  }
}

- (void)publishOnDemandLocation:(id)a3
{
  id v4 = a3;
  double v5 = [(FMDSecureLocationMonitor *)self locationPublishQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100092E58;
  v7[3] = &unk_1002DA108;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_registerForOnDemandPublishRequest
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1000930BC, @"com.apple.icloud.searchparty.secureLocations.OnDemandPublishRequest", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v4 = sub_1000599A8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: Registered for ondemand publish notification", v5, 2u);
  }
}

- (void)_unregisterFromOnDemandPublishRequest
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.icloud.searchparty.secureLocations.OnDemandPublishRequest", 0);
}

- (void)publishLocationToStewie:(id)a3
{
  id v4 = [(FMDSecureLocationMonitor *)self stewieLocationManager];

  if (!v4)
  {
    double v5 = sub_1000599A8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v12 = @"stewie:";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: %@ No location manager - creating one", buf, 0xCu);
    }

    id v6 = [(FMDSecureLocationMonitor *)self _createLocationManagerForStewie];
    [(FMDSecureLocationMonitor *)self setStewieLocationManager:v6];
  }
  id v7 = [(FMDSecureLocationMonitor *)self stewieLocationManager];

  if (v7)
  {
    id v8 = [(FMDSecureLocationMonitor *)self locationPublishQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100093334;
    block[3] = &unk_1002D9378;
    void block[4] = self;
    dispatch_async(v8, block);
  }
  else
  {
    double v9 = sub_1000599A8();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v12 = @"stewie:";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: %@ No location manager available", buf, 0xCu);
    }
  }
}

- (void)_registerForStewiePublishRequest
{
  if (_os_feature_enabled_impl())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_10009352C, @"com.apple.icloud.searchparty.secureLocations.liteLocationPublishRequest", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    id v4 = sub_1000599A8();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      CFStringRef v7 = @"stewie:";
      double v5 = "SecureLocationMonitor: %@ Registered for publish notification";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    id v4 = sub_1000599A8();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      CFStringRef v7 = @"stewie:";
      double v5 = "SecureLocationMonitor: %@ feature disabled. Not registering for notification";
      goto LABEL_6;
    }
  }
}

- (void)_unregisterFromStewiePublishRequest
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.icloud.searchparty.secureLocations.stewiePublishRequest", 0);
  id v4 = sub_1000599A8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    CFStringRef v6 = @"stewie:";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: %@ Unregistered for publish notification", (uint8_t *)&v5, 0xCu);
  }
}

- (id)_createLocationManagerForStewie
{
  id v3 = [(FMDSecureLocationMonitor *)self _createLocationManager];
  [v3 setDelegate:self];
  [v3 setDesiredAccuracy:kCLLocationAccuracyBest];

  return v3;
}

- (id)_createLocationManager
{
  id v2 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/FindMyDevice.framework"];
  id v3 = [objc_alloc((Class)CLLocationManager) initWithEffectiveBundle:v2];

  return v3;
}

- (id)_createLocationManagerWithQueue:(id)a3
{
  id v4 = a3;
  int v5 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/FindMyDevice.framework"];
  id v6 = [objc_alloc((Class)CLLocationManager) initWithEffectiveBundle:v5 delegate:self onQueue:v4];

  return v6;
}

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  id v5 = a4;
  id v6 = sub_1000599A8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    [v5 coordinate];
    uint64_t v8 = v7;
    [v5 coordinate];
    int v27 = 138412803;
    id v28 = v5;
    __int16 v29 = 2049;
    uint64_t v30 = v8;
    __int16 v31 = 2049;
    uint64_t v32 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "didVisit %@ %{private}f %{private}f", (uint8_t *)&v27, 0x20u);
  }

  double v10 = [(FMDSecureLocationMonitor *)self locationPublisher];

  if (v10)
  {
    if ([v5 hasArrivalDate]
      && ([v5 hasDepartureDate] & 1) == 0)
    {
      id v12 = objc_alloc((Class)CLLocation);
      [v5 coordinate];
      double v14 = v13;
      double v16 = v15;
      [v5 horizontalAccuracy];
      double v18 = v17;
      id v19 = +[NSDate date];
      double v11 = [v12 initWithCoordinate:v19 altitude:v14 horizontalAccuracy:v16 verticalAccuracy:0.0 timestamp:v18];

      id v20 = [[CLLocationFMGeoLocatableAdapter alloc] initWithLocation:v11];
      int v21 = [FMDSecureLocationInfo alloc];
      CFStringRef v22 = [(FMDSecureLocationMonitor *)self motionMonitor];
      __int16 v23 = [v22 lastKnownDeviceMotion];
      double v24 = [(FMDSecureLocationInfo *)v21 initWithLocation:v20 motion:v23 publishReason:2];

      __int16 v25 = +[FMSystemInfo sharedInstance];
      LODWORD(v23) = [v25 isInternalBuild];

      if (v23
        && +[FMPreferencesUtil BOOLForKey:@"PublishVisitImmediately" inDomain:kFMDNotBackedUpPrefDomain])
      {
        [(FMDSecureLocationMonitor *)self _publishLocation:v24];
      }
      uint64_t v26 = [(FMDSecureLocationMonitor *)self locationPublisher];
      [v26 processUpdatedLocation:v24];
    }
    else
    {
      double v11 = sub_1000599A8();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: Received visit departure. Ignoring", (uint8_t *)&v27, 2u);
      }
    }
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 count])
  {
    id v20 = sub_1000599A8();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor didUpdateLocations but location count is zero", buf, 2u);
    }
    goto LABEL_51;
  }
  id v8 = [(FMDSecureLocationMonitor *)self bystanderLocationManager];

  if (v8 == v6)
  {
    id v21 = v7;
    CFStringRef v22 = [(FMDSecureLocationMonitor *)self configManager];
    __int16 v23 = [v22 activeConfig];
    double v24 = [v23 policyName];
    unsigned __int8 v25 = [v24 isEqualToString:kFMDSecureLocationModeOwnerProactive];

    if (v25)
    {
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      BOOL v15 = 0;
      uint64_t v19 = 10;
    }
    else
    {
      uint64_t v26 = [(FMDSecureLocationMonitor *)self configManager];
      int v27 = [v26 activeConfig];
      id v28 = [v27 policyName];
      unsigned int v29 = [v28 isEqualToString:kFMDSecureLocationModeBackgroundProactive];

      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      BOOL v15 = 0;
      if (v29) {
        uint64_t v19 = 12;
      }
      else {
        uint64_t v19 = 4;
      }
    }
    id v7 = v21;
  }
  else
  {
    id v9 = [(FMDSecureLocationMonitor *)self slcLocationManager];

    if (v9 == v6)
    {
      int v16 = 0;
      int v17 = 0;
      BOOL v15 = 0;
      int v18 = 1;
      uint64_t v19 = 1;
    }
    else
    {
      id v10 = [(FMDSecureLocationMonitor *)self heartbeatLocationManager];

      if (v10 == v6)
      {
        uint64_t v30 = [(FMDSecureLocationMonitor *)self configManager];
        __int16 v31 = [v30 activeConfig];
        uint64_t v32 = [v31 policyName];
        id v33 = v7;
        unsigned int v34 = [v32 isEqualToString:kFMDSecureLocationModeOwnerProactive];

        int v16 = 0;
        int v17 = 0;
        int v18 = 0;
        BOOL v15 = 0;
        BOOL v35 = v34 == 0;
        id v7 = v33;
        if (v35) {
          uint64_t v19 = 3;
        }
        else {
          uint64_t v19 = 9;
        }
      }
      else
      {
        id v11 = [(FMDSecureLocationMonitor *)self ondemandLocationManager];

        if (v11 == v6)
        {
          int v16 = 0;
          int v17 = 0;
          int v18 = 0;
          BOOL v15 = 0;
          uint64_t v19 = 5;
        }
        else
        {
          id v12 = [(FMDSecureLocationMonitor *)self liveLocationManager];

          if (v12 == v6)
          {
            int v17 = 0;
            int v18 = 0;
            BOOL v15 = 0;
            int v16 = 1;
            uint64_t v19 = 7;
          }
          else
          {
            id v13 = [(FMDSecureLocationMonitor *)self shallowLocationManager];

            if (v13 == v6)
            {
              [v6 setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
              int v16 = 0;
              int v18 = 0;
              BOOL v15 = 0;
              int v17 = 1;
              uint64_t v19 = 6;
            }
            else
            {
              id v14 = [(FMDSecureLocationMonitor *)self stewieLocationManager];
              BOOL v15 = v14 == v6;

              int v16 = 0;
              int v17 = 0;
              int v18 = 0;
              uint64_t v19 = 8 * v15;
            }
          }
        }
      }
    }
  }
  v36 = [v7 lastObject];
  [(FMDSecureLocationMonitor *)self forcePublishOndemandLocationIfNeeded:v36];

  v37 = sub_1000599A8();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
    sub_100241C14(v19, v37);
  }

  v38 = [(FMDSecureLocationMonitor *)self locationPublisher];

  if (v38)
  {
    BOOL v39 = v15;
    id v66 = v6;
    int v63 = v17;
    int v40 = v16;
    id v64 = v7;
    id v20 = [v7 lastObject];
    v41 = [[CLLocationFMGeoLocatableAdapter alloc] initWithLocation:v20];
    v42 = [FMDSecureLocationInfo alloc];
    v43 = [(FMDSecureLocationMonitor *)self motionMonitor];
    v44 = [v43 lastKnownDeviceMotion];
    v65 = v41;
    v45 = [(FMDSecureLocationInfo *)v42 initWithLocation:v41 motion:v44 publishReason:v19];

    if (v18)
    {
      v46 = [(FMDSecureLocationMonitor *)self configManager];
      v47 = [v46 configForPolicy:kFMDSecureLocationModeProactive];

      v48 = [v20 timestamp];
      [v48 timeIntervalSinceNow];
      double v50 = -v49;

      [v47 minTimeBetweenPublish];
      if (v51 < v50)
      {
        v52 = sub_1000599A8();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor - we received a very old location. Lets ignore it and request an on demand publish", buf, 2u);
        }

        [(FMDSecureLocationMonitor *)self publishOnDemandLocation:&stru_1002DC698];
        goto LABEL_32;
      }
      v56 = +[FMSystemInfo sharedInstance];
      unsigned int v57 = [v56 isInternalBuild];

      if (v57
        && +[FMPreferencesUtil BOOLForKey:@"PublishSLCImmediately" inDomain:kFMDNotBackedUpPrefDomain])
      {
        [(FMDSecureLocationMonitor *)self _publishLocation:v45];
LABEL_32:
        id v6 = v66;

        id v7 = v64;
LABEL_51:

        goto LABEL_52;
      }

      int v16 = v40;
      int v17 = v63;
      id v6 = v66;
    }
    else
    {
      int v16 = v40;
      int v17 = v63;
      id v6 = v66;
      if (v39)
      {
        v53 = sub_1000599A8();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v69 = @"stewie:";
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: %@ location request - sending to publish immediately", buf, 0xCu);
        }

        [(FMDSecureLocationMonitor *)self _publishLocation:v45];
        v54 = [(FMDSecureLocationMonitor *)self stewieLocationManager];
        [v54 stopUpdatingLocation];

        v55 = [(FMDSecureLocationMonitor *)self stewieLocationManager];
        [v55 setDelegate:0];

        [(FMDSecureLocationMonitor *)self setStewieLocationManager:0];
      }
    }
    v58 = [(FMDSecureLocationMonitor *)self locationPublisher];
    [v58 processUpdatedLocation:v45];

    id v7 = v64;
  }
  else
  {
    id v20 = sub_1000599A8();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor - anomalous condition - received locations but no publisher setup", buf, 2u);
    }
  }

  if ((v16 | v17) == 1)
  {
    v59 = [(FMDSecureLocationMonitor *)self configManager];
    v60 = v59;
    if (v16)
    {
      id v20 = [v59 expirationTimeFor:kFMDSecureLocationModeLive];

      v60 = [v7 lastObject];
      [(FMDSecureLocationMonitor *)self _publishPeriodicShallowIfNeeded:v60];
    }
    else
    {
      id v20 = [v59 expirationTimeFor:kFMDSecureLocationModeProactiveShallow];
    }

    if (v20)
    {
      v61 = +[NSDate date];
      id v62 = [v61 compare:v20];

      if (v62 == (id)1)
      {
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 3221225472;
        v67[2] = sub_1000942FC;
        v67[3] = &unk_1002D9768;
        v67[4] = self;
        [(FMDSecureLocationMonitor *)self stopLocationMonitor:v67];
      }
    }
    goto LABEL_51;
  }
LABEL_52:
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = sub_1000599A8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100241CB8((uint64_t)v5, v6);
  }

  id v7 = [v5 domain];
  if (![v7 isEqualToString:kCLErrorDomain])
  {

    goto LABEL_8;
  }
  id v8 = [v5 code];

  if (v8)
  {
LABEL_8:
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10009450C;
    v10[3] = &unk_1002D9768;
    id v11 = v5;
    [(FMDSecureLocationMonitor *)self stopLocationMonitor:v10];
    id v9 = v11;
    goto LABEL_9;
  }
  id v9 = sub_1000599A8();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not stopping the SecureLocationMonitor service because the error is temporary.", buf, 2u);
  }
LABEL_9:
}

- (void)_scheduleXPCActivity
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  id v4 = kFMDSecureLocationModeProactive;
  id v5 = [(FMDSecureLocationMonitor *)self configManager];
  id v6 = [v5 activeConfig];
  id v7 = [v6 policyName];
  id v8 = (void *)kFMDSecureLocationModeOwnerProactive;
  id v9 = [v7 caseInsensitiveCompare:kFMDSecureLocationModeOwnerProactive];

  if (v9)
  {
    id v10 = [(FMDSecureLocationMonitor *)self configManager];
    id v11 = [v10 activeConfig];
    id v12 = [v11 policyName];
    id v8 = (void *)kFMDSecureLocationModeBackgroundProactive;
    id v13 = [v12 caseInsensitiveCompare:kFMDSecureLocationModeBackgroundProactive];

    if (v13) {
      goto LABEL_9;
    }
    id v14 = sub_1000599A8();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v25 = (int64_t)v8;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: _scheduleXPCActivity for %@", buf, 0xCu);
    }
  }
  else
  {
    id v14 = sub_1000599A8();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v25 = (int64_t)v8;
      goto LABEL_7;
    }
  }

  id v15 = v8;
  id v4 = v15;
LABEL_9:
  int v16 = [(FMDSecureLocationMonitor *)self configManager];
  int v17 = [v16 configForPolicy:v4];

  if (v17)
  {
    [v17 heartbeatPublish];
    int64_t v19 = (uint64_t)v18;
    unsigned int v20 = [v17 shouldWakeDevice];
  }
  else
  {
    unsigned int v20 = 1;
    int64_t v19 = 1080;
  }
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_DELAY, v19);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, v20);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_15_MIN);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  id v21 = sub_1000599A8();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    int64_t v25 = v19;
    __int16 v26 = 1024;
    unsigned int v27 = v20;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: Configuring Heartbeat XPC activity with duration %lld. shouldWake: %i", buf, 0x12u);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000949A0;
  handler[3] = &unk_1002DC188;
  handler[4] = self;
  xpc_activity_register("com.apple.findmydevice.secureLocationsCheck", v3, handler);
  CFStringRef v22 = sub_1000599A8();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Scheduled XPC Activity for SecureLocations Hearbeat", buf, 2u);
  }
}

- (void)updateMonitorConfig:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000599A8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "updateMonitorConfig", v7, 2u);
  }

  id v6 = [(FMDSecureLocationMonitor *)self configManager];
  [v6 updateConfigData:v4];
}

- (void)activeConfigChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000599A8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: Active Config Changed: %{public}@.", buf, 0xCu);
  }

  unsigned int v6 = [(FMDSecureLocationMonitor *)self isRunning];
  id v7 = sub_1000599A8();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: Stopping and restarting after config change", buf, 2u);
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100094EF8;
    v9[3] = &unk_1002DA200;
    id v10 = v4;
    id v11 = self;
    [(FMDSecureLocationMonitor *)self stopLocationMonitor:v9];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: Not running. Starting it.", buf, 2u);
    }

    [(FMDSecureLocationMonitor *)self startLocationMonitor:&stru_1002DC6D8];
  }
}

- (void)activeConfigExtended:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000599A8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [v4 policyName];
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: Active Config Extended %@", (uint8_t *)&v10, 0xCu);
  }
  if ([(FMDSecureLocationMonitor *)self isRunning])
  {
    id v7 = sub_1000599A8();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: activeConfig already running", (uint8_t *)&v10, 2u);
    }

    BOOL v8 = [v4 policyName];
    id v9 = [v8 caseInsensitiveCompare:kFMDSecureLocationModeProactive];

    if (!v9) {
      [(FMDSecureLocationMonitor *)self publishOnDemandLocation:&stru_1002DC718];
    }
  }
  else
  {
    [(FMDSecureLocationMonitor *)self startLocationMonitor:&stru_1002DC6F8];
  }
}

- (void)forcePublishOndemandLocationIfNeeded:(id)a3
{
  id v4 = a3;
  if (dispatch_get_specific("com.apple.findmydevice.forcePublishQueueKey") == "com.apple.findmydevice.forcePublishQueueKey")
  {
    [(FMDSecureLocationMonitor *)self publishOneTimeShallowLocation:v4];
  }
  else
  {
    objc_initWeak(&location, self);
    id v5 = [(FMDSecureLocationMonitor *)self forcePushOndemandLocationQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100095580;
    block[3] = &unk_1002D9238;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_async(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)requestForcedShallowLocation
{
  xpc_object_t v3 = [(FMDSecureLocationMonitor *)self forcePushOndemandLocationQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(FMDSecureLocationMonitor *)self forceShallowLocationManager];

  if (v4)
  {
    id v5 = [(FMDSecureLocationMonitor *)self forceShallowLocationManager];
    [v5 stopUpdatingLocation];

    [(FMDSecureLocationMonitor *)self setForceShallowLocationManager:0];
  }
  unsigned int v6 = [(FMDSecureLocationMonitor *)self forcePushOndemandLocationQueue];
  id v7 = [(FMDSecureLocationMonitor *)self _createLocationManagerWithQueue:v6];
  [(FMDSecureLocationMonitor *)self setForceShallowLocationManager:v7];

  id v8 = [(FMDSecureLocationMonitor *)self forceShallowLocationManager];
  [v8 setDelegate:self];

  id v9 = [(FMDSecureLocationMonitor *)self forceShallowLocationManager];
  [v9 setDesiredAccuracy:kCLLocationAccuracyThreeKilometers];

  id v10 = [(FMDSecureLocationMonitor *)self forceShallowLocationManager];
  [v10 requestLocation];
}

- (void)publishOneTimeShallowLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDSecureLocationMonitor *)self forcePushOndemandLocationQueue];
  dispatch_assert_queue_V2(v5);

  if ([(FMDSecureLocationMonitor *)self forcePushOndemandlocation])
  {
    unsigned int v6 = sub_1000599A8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: Sending force location to searchpartyd to publish %@", (uint8_t *)&v16, 0xCu);
    }

    id v7 = [CLLocationFMGeoLocatableAdapter alloc];
    id v8 = +[NSDate now];
    id v9 = [(CLLocationFMGeoLocatableAdapter *)v7 initWithLocation:v4 timeStamp:v8];

    id v10 = [FMDSecureLocationInfo alloc];
    id v11 = [(FMDSecureLocationMonitor *)self motionMonitor];
    id v12 = [v11 lastKnownDeviceMotion];
    id v13 = [(FMDSecureLocationInfo *)v10 initWithLocation:v9 motion:v12 publishReason:6];

    [(FMDSecureLocationMonitor *)self _publishLocation:v13];
    [(FMDSecureLocationMonitor *)self setForcePushOndemandlocation:0];
    id v14 = [(FMDSecureLocationMonitor *)self forceShallowLocationManager];

    if (v14)
    {
      id v15 = [(FMDSecureLocationMonitor *)self forceShallowLocationManager];
      [v15 stopUpdatingLocation];

      [(FMDSecureLocationMonitor *)self setForceShallowLocationManager:0];
    }
  }
}

- (SPSecureLocationsManager)secureLocationsManager
{
  return self->_secureLocationsManager;
}

- (void)setSecureLocationsManager:(id)a3
{
}

- (CLLocationManager)visitsLocationManager
{
  return self->_visitsLocationManager;
}

- (void)setVisitsLocationManager:(id)a3
{
}

- (CLLocationManager)slcLocationManager
{
  return self->_slcLocationManager;
}

- (void)setSlcLocationManager:(id)a3
{
}

- (CLLocationManager)bystanderLocationManager
{
  return self->_bystanderLocationManager;
}

- (void)setBystanderLocationManager:(id)a3
{
}

- (CLLocationManager)heartbeatLocationManager
{
  return self->_heartbeatLocationManager;
}

- (void)setHeartbeatLocationManager:(id)a3
{
}

- (CLLocationManager)ondemandLocationManager
{
  return self->_ondemandLocationManager;
}

- (void)setOndemandLocationManager:(id)a3
{
}

- (CLLocationManager)stewieLocationManager
{
  return self->_stewieLocationManager;
}

- (void)setStewieLocationManager:(id)a3
{
}

- (CLLocationManager)liveLocationManager
{
  return self->_liveLocationManager;
}

- (void)setLiveLocationManager:(id)a3
{
}

- (CLLocationManager)shallowLocationManager
{
  return self->_shallowLocationManager;
}

- (void)setShallowLocationManager:(id)a3
{
}

- (CLLocationManager)forceShallowLocationManager
{
  return self->_forceShallowLocationManager;
}

- (void)setForceShallowLocationManager:(id)a3
{
}

- (FMDMotionMonitor)motionMonitor
{
  return self->_motionMonitor;
}

- (void)setMotionMonitor:(id)a3
{
}

- (FMDSecureLocationPublisher)locationPublisher
{
  return self->_locationPublisher;
}

- (void)setLocationPublisher:(id)a3
{
}

- (FMDSecureLocationConfigManager)configManager
{
  return self->_configManager;
}

- (void)setConfigManager:(id)a3
{
}

- (NSDate)lastPublishedTime
{
  return self->_lastPublishedTime;
}

- (void)setLastPublishedTime:(id)a3
{
}

- (NSDate)lastOnDemandPublishTime
{
  return self->_lastOnDemandPublishTime;
}

- (void)setLastOnDemandPublishTime:(id)a3
{
}

- (NSDate)lastShallowPublishTime
{
  return self->_lastShallowPublishTime;
}

- (void)setLastShallowPublishTime:(id)a3
{
}

- (BOOL)locationManagerStarted
{
  return self->_locationManagerStarted;
}

- (void)setLocationManagerStarted:(BOOL)a3
{
  self->_locationManagerStarted = a3;
}

- (OS_dispatch_queue)locationPublishQueue
{
  return self->_locationPublishQueue;
}

- (void)setLocationPublishQueue:(id)a3
{
}

- (OS_dispatch_queue)forcePushOndemandLocationQueue
{
  return self->_forcePushOndemandLocationQueue;
}

- (void)setForcePushOndemandLocationQueue:(id)a3
{
}

- (BOOL)forcePushOndemandlocation
{
  return self->_forcePushOndemandlocation;
}

- (void)setForcePushOndemandlocation:(BOOL)a3
{
  self->_forcePushOndemandid location = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forcePushOndemandLocationQueue, 0);
  objc_storeStrong((id *)&self->_locationPublishQueue, 0);
  objc_storeStrong((id *)&self->_lastShallowPublishTime, 0);
  objc_storeStrong((id *)&self->_lastOnDemandPublishTime, 0);
  objc_storeStrong((id *)&self->_lastPublishedTime, 0);
  objc_storeStrong((id *)&self->_configManager, 0);
  objc_storeStrong((id *)&self->_locationPublisher, 0);
  objc_storeStrong((id *)&self->_motionMonitor, 0);
  objc_storeStrong((id *)&self->_forceShallowLocationManager, 0);
  objc_storeStrong((id *)&self->_shallowLocationManager, 0);
  objc_storeStrong((id *)&self->_liveLocationManager, 0);
  objc_storeStrong((id *)&self->_stewieLocationManager, 0);
  objc_storeStrong((id *)&self->_ondemandLocationManager, 0);
  objc_storeStrong((id *)&self->_heartbeatLocationManager, 0);
  objc_storeStrong((id *)&self->_bystanderLocationManager, 0);
  objc_storeStrong((id *)&self->_slcLocationManager, 0);
  objc_storeStrong((id *)&self->_visitsLocationManager, 0);

  objc_storeStrong((id *)&self->_secureLocationsManager, 0);
}

@end