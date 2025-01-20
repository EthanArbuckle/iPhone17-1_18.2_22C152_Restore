@interface CRNightModeFallbackManager
- (BOOL)_isNightForLocation:(id)a3;
- (BOOL)_shouldScheduleTimerForNextNightModeChange;
- (BOOL)nightMode;
- (CARSessionStatus)sessionStatus;
- (CLLocation)currentLocation;
- (CLLocation)initialTimerLocation;
- (CLLocationManager)locationManager;
- (CRNightModeFallbackManager)initWithSessionStatus:(id)a3;
- (GEOAlmanac)almanac;
- (NSTimer)nextNightModeChangeTimer;
- (id)_nextNightModeChangeDate;
- (int)nightModeChangeNotificationToken;
- (void)_handleLocationUpdateToLocation:(id)a3;
- (void)_start;
- (void)_stop;
- (void)_timeDidChangeSignificantly;
- (void)_updateNightMode;
- (void)_updateNightModeForNextSunsetOrSunrise;
- (void)dealloc;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setAlmanac:(id)a3;
- (void)setCurrentLocation:(id)a3;
- (void)setInitialTimerLocation:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setNextNightModeChangeTimer:(id)a3;
- (void)setNightMode:(BOOL)a3;
- (void)setNightModeChangeNotificationToken:(int)a3;
- (void)setSessionStatus:(id)a3;
@end

@implementation CRNightModeFallbackManager

- (CRNightModeFallbackManager)initWithSessionStatus:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRNightModeFallbackManager;
  v6 = [(CRNightModeFallbackManager *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sessionStatus, a3);
    [v5 addSessionObserver:v7];
  }

  return v7;
}

- (void)setNightMode:(BOOL)a3
{
  if (self->_nightMode != a3)
  {
    BOOL v3 = a3;
    self->_nightMode = a3;
    id v5 = CarGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10006EF44();
    }

    notify_set_state(self->_nightModeChangeNotificationToken, v3);
    notify_post("com.apple.private.carkit.fallbackNightModeChanged");
  }
}

- (void)dealloc
{
  [(CRNightModeFallbackManager *)self _stop];
  v3.receiver = self;
  v3.super_class = (Class)CRNightModeFallbackManager;
  [(CRNightModeFallbackManager *)&v3 dealloc];
}

- (void)sessionDidConnect:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005578;
  block[3] = &unk_1000BD1B0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)sessionDidDisconnect:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000563C;
  block[3] = &unk_1000BD1B0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  [a4 lastObject:a3];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(CRNightModeFallbackManager *)self _handleLocationUpdateToLocation:v5];
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  id v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10006F038((uint64_t)v4, v5);
  }
}

- (void)_start
{
  objc_super v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10006F13C();
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1000058C8, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  notify_register_check("com.apple.private.carkit.fallbackNightModeChanged", &self->_nightModeChangeNotificationToken);
  uint64_t state64 = 0;
  notify_get_state(self->_nightModeChangeNotificationToken, &state64);
  self->_nightMode = state64 != 0;
  id v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10006F0B0();
  }

  v6 = (GEOAlmanac *)objc_alloc_init((Class)GEOAlmanac);
  almanac = self->_almanac;
  self->_almanac = v6;

  id v8 = objc_alloc((Class)CLLocationManager);
  id v9 = objc_alloc((Class)NSBundle);
  v10 = +[NSURL fileURLWithPath:@"/System/Library/LocationBundles/SystemCustomization.bundle"];
  id v11 = [v9 initWithURL:v10];
  v12 = (CLLocationManager *)[v8 initWithEffectiveBundle:v11 delegate:self onQueue:&_dispatch_main_q];
  locationManager = self->_locationManager;
  self->_locationManager = v12;

  [(CLLocationManager *)self->_locationManager setDesiredAccuracy:kCLLocationAccuracyThreeKilometers];
  [(CLLocationManager *)self->_locationManager startUpdatingLocation];
}

- (void)_stop
{
  [(CRNightModeFallbackManager *)self setAlmanac:0];
  [(CRNightModeFallbackManager *)self setLocationManager:0];
  [(CRNightModeFallbackManager *)self setCurrentLocation:0];
  [(CRNightModeFallbackManager *)self setInitialTimerLocation:0];
  objc_super v3 = [(CRNightModeFallbackManager *)self nextNightModeChangeTimer];
  [v3 invalidate];

  [(CRNightModeFallbackManager *)self setNextNightModeChangeTimer:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SignificantTimeChangeNotification", 0);
  notify_cancel(self->_nightModeChangeNotificationToken);
  self->_nightModeChangeNotificationToken = 0;
}

- (BOOL)_isNightForLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(CRNightModeFallbackManager *)self almanac];
  [v4 coordinate];
  double v7 = v6;
  double v9 = v8;

  [v5 calculateAstronomicalTimeForLocation:v7, v9];
  v10 = [(CRNightModeFallbackManager *)self almanac];
  LOBYTE(v4) = [v10 isDayLight] ^ 1;

  return (char)v4;
}

- (void)_updateNightModeForNextSunsetOrSunrise
{
  objc_super v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10006F170();
  }

  id v4 = [(CRNightModeFallbackManager *)self nextNightModeChangeTimer];
  [v4 invalidate];

  [(CRNightModeFallbackManager *)self setNextNightModeChangeTimer:0];
  [(CRNightModeFallbackManager *)self _updateNightMode];
}

- (void)_updateNightMode
{
  objc_super v3 = [(CRNightModeFallbackManager *)self currentLocation];
  [(CRNightModeFallbackManager *)self setNightMode:[(CRNightModeFallbackManager *)self _isNightForLocation:v3]];

  if ([(CRNightModeFallbackManager *)self _shouldScheduleTimerForNextNightModeChange])
  {
    id v4 = CarGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10006F1A4();
    }

    id v5 = [(CRNightModeFallbackManager *)self nextNightModeChangeTimer];
    [v5 invalidate];

    [(CRNightModeFallbackManager *)self setNextNightModeChangeTimer:0];
    double v6 = [(CRNightModeFallbackManager *)self currentLocation];
    [(CRNightModeFallbackManager *)self setInitialTimerLocation:v6];

    double v7 = [(CRNightModeFallbackManager *)self _nextNightModeChangeDate];
    [v7 timeIntervalSinceNow];
    double v8 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_updateNightModeForNextSunsetOrSunrise", 0, 0);
    [(CRNightModeFallbackManager *)self setNextNightModeChangeTimer:v8];
  }
}

- (void)_handleLocationUpdateToLocation:(id)a3
{
  id v4 = a3;
  [v4 horizontalAccuracy];
  if (v5 < 0.0)
  {
    double v6 = CarGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10006F1D8();
    }
    goto LABEL_17;
  }
  double v6 = [(CRNightModeFallbackManager *)self currentLocation];
  double v7 = CarGeneralLogging();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8) {
      sub_10006F2A8();
    }

    [v4 distanceFromLocation:v6];
    if (v9 < 3000.0)
    {
      v10 = CarGeneralLogging();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_10006F274();
      }

      goto LABEL_17;
    }
  }
  else
  {
    if (v8) {
      sub_10006F240();
    }
  }
  id v11 = CarGeneralLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10006F20C();
  }

  [(CRNightModeFallbackManager *)self setCurrentLocation:v4];
  [(CRNightModeFallbackManager *)self _updateNightMode];
LABEL_17:
}

- (void)_timeDidChangeSignificantly
{
  objc_super v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10006F2DC();
  }

  [(CRNightModeFallbackManager *)self setCurrentLocation:0];
  [(CRNightModeFallbackManager *)self setInitialTimerLocation:0];
  id v4 = [(CRNightModeFallbackManager *)self nextNightModeChangeTimer];
  [v4 invalidate];

  [(CRNightModeFallbackManager *)self setNextNightModeChangeTimer:0];
}

- (BOOL)_shouldScheduleTimerForNextNightModeChange
{
  objc_super v3 = [(CRNightModeFallbackManager *)self currentLocation];

  if (!v3) {
    return 0;
  }
  id v4 = [(CRNightModeFallbackManager *)self nextNightModeChangeTimer];

  if (!v4) {
    return 1;
  }
  double v5 = [(CRNightModeFallbackManager *)self initialTimerLocation];
  double v6 = [(CRNightModeFallbackManager *)self currentLocation];
  [v5 distanceFromLocation:v6];
  BOOL v8 = v7 > 100000.0;

  return v8;
}

- (id)_nextNightModeChangeDate
{
  objc_super v3 = +[NSDate date];
  id v4 = [(GEOAlmanac *)self->_almanac sunset];
  id v5 = [(GEOAlmanac *)self->_almanac nextSunset];
  id v6 = v5;
  if ([v4 compare:v3] == (id)1)
  {
    id v6 = v4;
  }
  double v7 = [(GEOAlmanac *)self->_almanac sunrise];
  id v8 = [(GEOAlmanac *)self->_almanac nextSunrise];
  id v9 = v8;
  if ([v7 compare:v3] == (id)1)
  {
    id v9 = v7;
  }
  id v10 = v6;
  id v11 = v10;
  if ([v10 compare:v9] == (id)1)
  {
    id v11 = v9;
  }
  v12 = CarGeneralLogging();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    [v3 timeIntervalSinceDate:v11];
    int v15 = 138413826;
    v16 = v3;
    __int16 v17 = 2112;
    v18 = v4;
    __int16 v19 = 2112;
    id v20 = v5;
    __int16 v21 = 2112;
    v22 = v7;
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v11;
    __int16 v27 = 2048;
    uint64_t v28 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[NightModeFallback] schedule timer for next sunset or sunrise: now(%@) today's sunset(%@), tmw's sunset(%@), today's sunrise(%@), tmw's sunrise(%@), target(%@), timeInterval=%lf", (uint8_t *)&v15, 0x48u);
  }

  return v11;
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
}

- (CLLocation)initialTimerLocation
{
  return self->_initialTimerLocation;
}

- (void)setInitialTimerLocation:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (GEOAlmanac)almanac
{
  return self->_almanac;
}

- (void)setAlmanac:(id)a3
{
}

- (BOOL)nightMode
{
  return self->_nightMode;
}

- (int)nightModeChangeNotificationToken
{
  return self->_nightModeChangeNotificationToken;
}

- (void)setNightModeChangeNotificationToken:(int)a3
{
  self->_nightModeChangeNotificationToken = a3;
}

- (NSTimer)nextNightModeChangeTimer
{
  return self->_nextNightModeChangeTimer;
}

- (void)setNextNightModeChangeTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextNightModeChangeTimer, 0);
  objc_storeStrong((id *)&self->_almanac, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_initialTimerLocation, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);

  objc_storeStrong((id *)&self->_sessionStatus, 0);
}

@end