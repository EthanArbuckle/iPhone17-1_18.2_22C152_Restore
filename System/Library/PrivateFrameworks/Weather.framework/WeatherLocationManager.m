@interface WeatherLocationManager
+ (id)sharedWeatherLocationManager;
+ (int)locationManagerAuthorizationWithEffectiveBundleId:(id)a3;
+ (void)clearSharedLocationManager;
- (BOOL)hasCrossedHourBoundary;
- (BOOL)isCacheOutOfDate;
- (BOOL)isInternalBuild;
- (BOOL)isLocalStaleOrOutOfDate;
- (BOOL)isLocationWithInRange:(id)a3;
- (BOOL)limitsPrecision;
- (BOOL)localWeatherAuthorized;
- (BOOL)locationTrackingIsReady;
- (BOOL)locationUpdatesEnabled;
- (CLLocationCoordinate2D)lastLocationCoord;
- (CLLocationManager)locationManager;
- (CLLocationManagerDelegate)delegate;
- (NSDate)lastLocationTimeStamp;
- (NSString)effectiveBundleIdentifier;
- (NSTimer)accuracyFallbackTimer;
- (NSTimer)delayedUpdateTimer;
- (WeatherLocationManager)init;
- (WeatherLocationManager)initWithPreferences:(id)a3;
- (WeatherLocationManager)initWithPreferences:(id)a3 effectiveBundleIdentifier:(id)a4;
- (WeatherPreferences)preferences;
- (double)distanceFilter;
- (double)lastLocationUpdateTime;
- (double)nextPlannedUpdate;
- (double)oldestAllowedUpdateTime;
- (float)lastLocationAccuracy;
- (id)location;
- (int)forceLoadingAuthorizationStatus;
- (unint64_t)updateInterval;
- (void)accuracyFallbackTimerDidFire:(id)a3;
- (void)askForLocationManagerAuthorization;
- (void)cancelAccuracyFallbackTimer;
- (void)cancelDelayedUpdateTimer;
- (void)clearLastLocationUpdateTime;
- (void)clearLocalWeatherUpdateState;
- (void)dealloc;
- (void)delayedUpdateTimerDidFire:(id)a3;
- (void)forceLocationManagerAuthorization;
- (void)forceLocationUpdate;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)monitorLocationAuthorization;
- (void)scheduleDelayedUpdate:(double)a3;
- (void)setAccuracyFallbackTimer:(id)a3;
- (void)setAuthorizationStatus:(int)a3;
- (void)setDelayedUpdateTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsInternalBuild:(BOOL)a3;
- (void)setLastLocationAccuracy:(float)a3;
- (void)setLastLocationCoord:(CLLocationCoordinate2D)a3;
- (void)setLastLocationTimeStamp:(id)a3;
- (void)setLastLocationUpdateTime:(double)a3;
- (void)setLocationManager:(id)a3;
- (void)setLocationTrackingActive:(BOOL)a3;
- (void)setLocationTrackingIsReady:(BOOL)a3;
- (void)setLocationTrackingReady:(BOOL)a3 activelyTracking:(BOOL)a4 watchKitExtension:(BOOL)a5;
- (void)setLocationTrackingReady:(BOOL)a3 activelyTracking:(BOOL)a4 watchKitExtension:(BOOL)a5 shouldRequestAuthorization:(BOOL)a6;
- (void)setLocationUpdatesEnabled:(BOOL)a3;
- (void)setNextPlannedUpdate:(double)a3;
- (void)setOldestAllowedUpdateTime:(double)a3;
- (void)setPreferences:(id)a3;
- (void)setUpdateInterval:(unint64_t)a3;
- (void)stopLocationUpdate;
- (void)updateLocation:(id)a3;
- (void)updateLocationWithNoConditionCheck;
@end

@implementation WeatherLocationManager

+ (id)sharedWeatherLocationManager
{
  if (sharedWeatherLocationManager_onceToken != -1) {
    dispatch_once(&sharedWeatherLocationManager_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)__sharedWeatherLocationManager;
  return v2;
}

void __54__WeatherLocationManager_sharedWeatherLocationManager__block_invoke()
{
  v0 = [WeatherLocationManager alloc];
  id v3 = +[WeatherPreferences sharedPreferences];
  uint64_t v1 = [(WeatherLocationManager *)v0 initWithPreferences:v3];
  v2 = (void *)__sharedWeatherLocationManager;
  __sharedWeatherLocationManager = v1;
}

+ (void)clearSharedLocationManager
{
  NSStringFromSelector(a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(&cfstr_IsANopPleaseRe.isa, v2);
}

+ (int)locationManagerAuthorizationWithEffectiveBundleId:(id)a3
{
  if (!a3) {
    a3 = @"com.apple.weather";
  }
  return [MEMORY[0x263F00A60] authorizationStatusForBundleIdentifier:a3];
}

- (WeatherLocationManager)initWithPreferences:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WeatherLocationManager;
  v5 = [(WeatherLocationManager *)&v19 init];
  if (v5)
  {
    if (v4)
    {
      v6 = (WeatherPreferences *)v4;
    }
    else
    {
      v6 = +[WeatherPreferences sharedPreferences];
    }
    preferences = v5->_preferences;
    v5->_preferences = v6;

    v8 = [MEMORY[0x263F086E0] mainBundle];
    v9 = [v8 bundleIdentifier];
    int v10 = [v9 isEqualToString:@"com.apple.weather"];

    uint64_t v11 = 1800;
    if (v10) {
      uint64_t v11 = 300;
    }
    v5->_unint64_t updateInterval = v11;
    v12 = +[WeatherInternalPreferences sharedInternalPreferences];
    v5->_isInternalBuild = [v12 isInternalInstall];

    objc_storeStrong((id *)&v5->_effectiveBundleIdentifier, @"com.apple.weather");
    if (v5->_isInternalBuild)
    {
      v13 = +[WeatherInternalPreferences sharedInternalPreferences];
      v14 = [v13 objectForKey:@"ShouldLocalWeatherUpdateRapidly"];
      int v15 = [v14 BOOLValue];

      if (v15)
      {
        v5->_unint64_t updateInterval = 10;
        v16 = WALogForCategory(4);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t updateInterval = v5->_updateInterval;
          *(_DWORD *)buf = 134217984;
          unint64_t v21 = updateInterval;
          _os_log_impl(&dword_226D1D000, v16, OS_LOG_TYPE_DEFAULT, "Overriding local weather location update interval via user defaults - %lus", buf, 0xCu);
        }
      }
    }
  }

  return v5;
}

- (WeatherLocationManager)initWithPreferences:(id)a3 effectiveBundleIdentifier:(id)a4
{
  id v6 = a4;
  v7 = [(WeatherLocationManager *)self initWithPreferences:a3];
  v8 = v7;
  if (v6 && v7)
  {
    uint64_t v9 = [v6 copy];
    effectiveBundleIdentifier = v8->_effectiveBundleIdentifier;
    v8->_effectiveBundleIdentifier = (NSString *)v9;
  }
  return v8;
}

- (WeatherLocationManager)init
{
  return [(WeatherLocationManager *)self initWithPreferences:0];
}

- (void)dealloc
{
  [(WeatherLocationManager *)self cancelAccuracyFallbackTimer];
  [(WeatherLocationManager *)self cancelDelayedUpdateTimer];
  v3.receiver = self;
  v3.super_class = (Class)WeatherLocationManager;
  [(WeatherLocationManager *)&v3 dealloc];
}

- (double)distanceFilter
{
  objc_super v3 = [(WeatherLocationManager *)self locationManager];
  if (v3)
  {
    id v4 = [(WeatherLocationManager *)self locationManager];
    [v4 distanceFilter];
    double v6 = v5;
  }
  else
  {
    double v6 = 500.0;
  }

  return v6;
}

- (BOOL)limitsPrecision
{
  objc_super v3 = [(WeatherLocationManager *)self locationManager];

  if (v3)
  {
    id v4 = [(WeatherLocationManager *)self locationManager];
    char v5 = [v4 _limitsPrecision];

    return v5;
  }
  else
  {
    v7 = WALogForCategory(4);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_226D1D000, v7, OS_LOG_TYPE_DEFAULT, "Do not have an instance of the location manager. Use coarse location.", v8, 2u);
    }

    return 1;
  }
}

- (BOOL)localWeatherAuthorized
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  unsigned int v2 = [(WeatherLocationManager *)self authorizationStatus];
  objc_super v3 = WALogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_226D1D000, v3, OS_LOG_TYPE_DEFAULT, "autorizationStatus %d", (uint8_t *)v5, 8u);
  }

  return v2 > 2;
}

- (void)askForLocationManagerAuthorization
{
  objc_super v3 = WALogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v5 = 0;
    _os_log_impl(&dword_226D1D000, v3, OS_LOG_TYPE_DEFAULT, "Requesting permission for in-use location usage", v5, 2u);
  }

  id v4 = [(WeatherLocationManager *)self locationManager];
  [v4 requestWhenInUseAuthorization];
}

- (void)forceLocationManagerAuthorization
{
  objc_super v3 = WALogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v5 = 0;
    _os_log_impl(&dword_226D1D000, v3, OS_LOG_TYPE_DEFAULT, "Force request permission for in-use location usage", v5, 2u);
  }

  id v4 = [(WeatherLocationManager *)self locationManager];
  [v4 requestWhenInUseAuthorizationWithPrompt];
}

- (int)forceLoadingAuthorizationStatus
{
  objc_super v3 = objc_opt_class();
  id v4 = [(WeatherLocationManager *)self effectiveBundleIdentifier];
  -[WeatherLocationManager setAuthorizationStatus:](self, "setAuthorizationStatus:", [v3 locationManagerAuthorizationWithEffectiveBundleId:v4]);

  return self->_authorizationStatus;
}

- (void)setLocationTrackingReady:(BOOL)a3 activelyTracking:(BOOL)a4 watchKitExtension:(BOOL)a5
{
}

- (void)setLocationTrackingReady:(BOOL)a3 activelyTracking:(BOOL)a4 watchKitExtension:(BOOL)a5 shouldRequestAuthorization:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = "not ready";
    if (v9) {
      uint64_t v11 = "ready";
    }
    int v29 = 136315138;
    v30 = (void *)v11;
    _os_log_impl(&dword_226D1D000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Setting location tracking %s", (uint8_t *)&v29, 0xCu);
  }
  if (v9)
  {
    v12 = [(WeatherLocationManager *)self locationManager];

    if (!v12)
    {
      v13 = [(WeatherLocationManager *)self delegate];

      if (!v13) {
        NSLog(&cfstr_CannotEnableLo.isa);
      }
      v14 = WALogForCategory(4);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [(WeatherLocationManager *)self effectiveBundleIdentifier];
        v16 = (void *)v15;
        if (v15) {
          v17 = (__CFString *)v15;
        }
        else {
          v17 = @"com.apple.weather";
        }
        int v29 = 138412290;
        v30 = v17;
        _os_log_impl(&dword_226D1D000, v14, OS_LOG_TYPE_DEFAULT, "Initializing CLLocationManager with %@", (uint8_t *)&v29, 0xCu);
      }
      id v18 = objc_alloc(MEMORY[0x263F00A60]);
      uint64_t v19 = [(WeatherLocationManager *)self effectiveBundleIdentifier];
      v20 = (void *)v19;
      if (v19) {
        unint64_t v21 = (__CFString *)v19;
      }
      else {
        unint64_t v21 = @"com.apple.weather";
      }
      uint64_t v22 = (void *)[v18 initWithEffectiveBundleIdentifier:v21];
      [(WeatherLocationManager *)self setLocationManager:v22];

      v23 = [(WeatherLocationManager *)self locationManager];
      [v23 setDelegate:self];

      v24 = [(WeatherLocationManager *)self locationManager];
      [v24 setDistanceFilter:500.0];

      double v25 = *MEMORY[0x263F00B30];
      v26 = [(WeatherLocationManager *)self locationManager];
      [v26 setDesiredAccuracy:v25];

      if (v6)
      {
        v27 = [(WeatherLocationManager *)self locationManager];
        [v27 requestWhenInUseAuthorization];
      }
      v28 = [(WeatherLocationManager *)self locationManager];
      [v28 setIsActuallyAWatchKitExtension:v7];

      [(WeatherLocationManager *)self setLocationTrackingActive:v8];
    }
  }
  else
  {
    [(WeatherLocationManager *)self setLocationTrackingActive:v8];
    [(WeatherLocationManager *)self clearLastLocationUpdateTime];
    [(WeatherLocationManager *)self setAuthorizationStatus:0];
    [(WeatherLocationManager *)self setLocationUpdatesEnabled:0];
    [(WeatherLocationManager *)self setLocationManager:0];
  }
  [(WeatherLocationManager *)self setLocationTrackingIsReady:v9];
}

- (void)monitorLocationAuthorization
{
}

- (void)setLocationTrackingActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v40 = *MEMORY[0x263EF8340];
  char v5 = WALogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = "inactive";
    if (v3) {
      BOOL v6 = "active";
    }
    int v36 = 136315138;
    v37 = v6;
    _os_log_impl(&dword_226D1D000, v5, OS_LOG_TYPE_DEFAULT, "Setting location tracking %s", (uint8_t *)&v36, 0xCu);
  }

  [(WeatherLocationManager *)self cancelDelayedUpdateTimer];
  if (v3)
  {
    BOOL v7 = [(WeatherLocationManager *)self preferences];
    BOOL v8 = [v7 readDefaultValueForKey:@"LastLocationUpdateTime"];
    [v8 doubleValue];
    -[WeatherLocationManager setLastLocationUpdateTime:](self, "setLastLocationUpdateTime:");

    BOOL v9 = [MEMORY[0x263EFF910] date];
    [v9 timeIntervalSince1970];
    double v11 = v10;
    [(WeatherLocationManager *)self lastLocationUpdateTime];
    double v13 = v11 - v12;

    v14 = [MEMORY[0x263EFF910] date];
    [v14 timeIntervalSince1970];
    double v16 = v15;
    v17 = [v7 readDefaultValueForKey:@"LastLocationParseTime"];
    [v17 doubleValue];
    double v19 = v18;

    double v20 = (double)[(WeatherLocationManager *)self updateInterval];
    BOOL v21 = v13 >= 0.0 && v13 < v20;
    if (v21
      && ((double v22 = v16 - v19, v23 = (double)[(WeatherLocationManager *)self updateInterval], v22 >= 0.0)
        ? (BOOL v24 = v22 < v23)
        : (BOOL v24 = 0),
          v24 && [(WeatherLocationManager *)self authorizationStatus]))
    {
      double v25 = WALogForCategory(4);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v36) = 0;
        _os_log_impl(&dword_226D1D000, v25, OS_LOG_TYPE_DEFAULT, "schedule delayed location update", (uint8_t *)&v36, 2u);
      }

      [(WeatherLocationManager *)self scheduleDelayedUpdate:(double)[(WeatherLocationManager *)self updateInterval] - v13];
    }
    else
    {
      v27 = WALogForCategory(4);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v36) = 0;
        _os_log_impl(&dword_226D1D000, v27, OS_LOG_TYPE_DEFAULT, "First location update check passed", (uint8_t *)&v36, 2u);
      }

      v28 = WALogForCategory(4);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(NSNumber, "numberWithBool:", -[WeatherLocationManager locationUpdatesEnabled](self, "locationUpdatesEnabled"));
        int v29 = (char *)objc_claimAutoreleasedReturnValue();
        v30 = [(WeatherLocationManager *)self locationManager];
        int v36 = 138412546;
        v37 = v29;
        __int16 v38 = 2112;
        v39 = v30;
        _os_log_impl(&dword_226D1D000, v28, OS_LOG_TYPE_DEFAULT, "locationUpdatesEnabled = %@, self.locationManager = %@", (uint8_t *)&v36, 0x16u);
      }
      if (![(WeatherLocationManager *)self locationUpdatesEnabled])
      {
        uint64_t v31 = [(WeatherLocationManager *)self locationManager];

        if (v31)
        {
          v32 = WALogForCategory(4);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v36) = 0;
            _os_log_impl(&dword_226D1D000, v32, OS_LOG_TYPE_DEFAULT, "LocationUpdatesEnabled=NO", (uint8_t *)&v36, 2u);
          }

          [(WeatherLocationManager *)self oldestAllowedUpdateTime];
          if (v33 == -1.0)
          {
            v34 = [MEMORY[0x263EFF910] date];
            [v34 timeIntervalSince1970];
            -[WeatherLocationManager setOldestAllowedUpdateTime:](self, "setOldestAllowedUpdateTime:");
          }
          [(WeatherLocationManager *)self setLocationUpdatesEnabled:1];
          v35 = [MEMORY[0x263F08A00] defaultCenter];
          [v35 postNotificationName:@"BeganTrackingLocationNotification" object:0];
        }
      }
    }
  }
  else
  {
    v26 = WALogForCategory(4);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v36) = 0;
      _os_log_impl(&dword_226D1D000, v26, OS_LOG_TYPE_DEFAULT, "Disable location tracking, setting locationUpdatesEnabled=NO", (uint8_t *)&v36, 2u);
    }

    [(WeatherLocationManager *)self setLocationUpdatesEnabled:0];
    [(WeatherLocationManager *)self setOldestAllowedUpdateTime:-1.0];
    [(WeatherLocationManager *)self cancelDelayedUpdateTimer];
  }
}

- (void)updateLocationWithNoConditionCheck
{
  BOOL v3 = WALogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl(&dword_226D1D000, v3, OS_LOG_TYPE_DEFAULT, "Update location with no condition check", v7, 2u);
  }

  [(WeatherLocationManager *)self cancelDelayedUpdateTimer];
  if (![(WeatherLocationManager *)self locationUpdatesEnabled])
  {
    [(WeatherLocationManager *)self oldestAllowedUpdateTime];
    if (v4 == -1.0)
    {
      char v5 = [MEMORY[0x263EFF910] date];
      [v5 timeIntervalSince1970];
      -[WeatherLocationManager setOldestAllowedUpdateTime:](self, "setOldestAllowedUpdateTime:");
    }
    [(WeatherLocationManager *)self setLocationUpdatesEnabled:1];
    BOOL v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"BeganTrackingLocationNotification" object:0];
  }
}

- (BOOL)isLocalStaleOrOutOfDate
{
  BOOL v3 = [(WeatherLocationManager *)self lastLocationTimeStamp];

  if (!v3)
  {
    double v4 = [(WeatherLocationManager *)self preferences];
    char v5 = [v4 localWeatherCity];
    BOOL v6 = [v5 updateTime];
    [(WeatherLocationManager *)self setLastLocationTimeStamp:v6];
  }
  BOOL v7 = [MEMORY[0x263EFF910] date];
  BOOL v8 = [(WeatherLocationManager *)self lastLocationTimeStamp];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;
  double v11 = (double)[(WeatherLocationManager *)self updateInterval];

  [(WeatherLocationManager *)self lastLocationAccuracy];
  return v10 > v11 || v12 > 1500.0;
}

- (BOOL)isCacheOutOfDate
{
  [(WeatherLocationManager *)self lastLocationUpdateTime];
  if (v3 == 0.0)
  {
    double v4 = [(WeatherLocationManager *)self preferences];
    char v5 = [v4 readDefaultValueForKey:@"LastLocationUpdateTime"];
    [v5 doubleValue];
    -[WeatherLocationManager setLastLocationUpdateTime:](self, "setLastLocationUpdateTime:");
  }
  BOOL v6 = [MEMORY[0x263EFF910] date];
  [v6 timeIntervalSince1970];
  double v8 = v7;
  [(WeatherLocationManager *)self lastLocationUpdateTime];
  double v10 = v8 - v9;

  return v10 > (double)[(WeatherLocationManager *)self updateInterval];
}

- (BOOL)hasCrossedHourBoundary
{
  unsigned int v2 = (void *)MEMORY[0x263EFF910];
  [(WeatherLocationManager *)self lastLocationUpdateTime];
  double v3 = objc_msgSend(v2, "dateWithTimeIntervalSince1970:");
  double v4 = [MEMORY[0x263EFF910] date];
  BOOL v5 = DatesAreNotWithinSameHour(v3, v4);

  return v5;
}

- (BOOL)isLocationWithInRange:(id)a3
{
  double v4 = (objc_class *)MEMORY[0x263F00A50];
  id v5 = a3;
  id v6 = [v4 alloc];
  [(WeatherLocationManager *)self lastLocationCoord];
  double v8 = v7;
  [(WeatherLocationManager *)self lastLocationCoord];
  double v9 = objc_msgSend(v6, "initWithLatitude:longitude:", v8);
  [v9 distanceFromLocation:v5];
  double v11 = v10;

  [(WeatherLocationManager *)self distanceFilter];
  LOBYTE(self) = v11 < v12;

  return (char)self;
}

- (void)scheduleDelayedUpdate:(double)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = [(WeatherLocationManager *)self delayedUpdateTimer];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F08780]);
    double v7 = WALogForCategory(4);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = [v6 stringFromTimeInterval:a3];
      int v12 = 138412290;
      double v13 = v8;
      _os_log_impl(&dword_226D1D000, v7, OS_LOG_TYPE_DEFAULT, "Delaying location update for %@", (uint8_t *)&v12, 0xCu);
    }
    double v9 = [MEMORY[0x263EFF910] date];
    [v9 timeIntervalSince1970];
    [(WeatherLocationManager *)self setNextPlannedUpdate:v10 + a3];

    double v11 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_delayedUpdateTimerDidFire_ selector:0 userInfo:0 repeats:a3];
    [(WeatherLocationManager *)self setDelayedUpdateTimer:v11];
  }
}

- (void)cancelDelayedUpdateTimer
{
  double v3 = [(WeatherLocationManager *)self delayedUpdateTimer];
  [v3 invalidate];

  [(WeatherLocationManager *)self setDelayedUpdateTimer:0];
  [(WeatherLocationManager *)self cancelAccuracyFallbackTimer];
}

- (void)forceLocationUpdate
{
  double v3 = WALogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_226D1D000, v3, OS_LOG_TYPE_DEFAULT, "Forcing location update upon request", v4, 2u);
  }

  [(WeatherLocationManager *)self clearLastLocationUpdateTime];
  [(WeatherLocationManager *)self setLocationTrackingActive:1];
}

- (void)clearLastLocationUpdateTime
{
  [(WeatherLocationManager *)self setLastLocationUpdateTime:0.0];
  id v5 = [(WeatherLocationManager *)self preferences];
  double v3 = NSNumber;
  [(WeatherLocationManager *)self lastLocationUpdateTime];
  double v4 = objc_msgSend(v3, "numberWithDouble:");
  [v5 writeDefaultValue:v4 forKey:@"LastLocationUpdateTime"];
}

- (void)clearLocalWeatherUpdateState
{
  [(WeatherLocationManager *)self cancelDelayedUpdateTimer];
  [(WeatherLocationManager *)self setOldestAllowedUpdateTime:-1.0];
  double v3 = [(WeatherLocationManager *)self preferences];
  [v3 saveToDiskWithLocalWeatherCity:0];

  id v4 = [(WeatherLocationManager *)self preferences];
  [v4 writeDefaultValue:&unk_26DAEAF70 forKey:@"LastLocationUpdateTime"];
}

- (void)stopLocationUpdate
{
}

- (void)delayedUpdateTimerDidFire:(id)a3
{
  [(WeatherLocationManager *)self cancelDelayedUpdateTimer];
  id v4 = [MEMORY[0x263EFF910] date];
  [v4 timeIntervalSince1970];
  -[WeatherLocationManager setOldestAllowedUpdateTime:](self, "setOldestAllowedUpdateTime:");

  [(WeatherLocationManager *)self setLocationUpdatesEnabled:1];
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"BeganTrackingLocationNotification" object:0];
}

- (void)accuracyFallbackTimerDidFire:(id)a3
{
  id v4 = [a3 userInfo];
  [(WeatherLocationManager *)self updateLocation:v4];
}

- (void)updateLocation:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = WALogForCategory(4);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[WeatherLocationManager updateLocation:]";
    __int16 v45 = 2112;
    double v46 = *(double *)&v5;
    _os_log_impl(&dword_226D1D000, v6, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  if (!v5)
  {
    v42 = [MEMORY[0x263F08690] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"WeatherLocationManager.m", 393, @"Invalid parameter not satisfying: %@", @"info" object file lineNumber description];
  }
  double v7 = [(WeatherLocationManager *)self preferences];
  double v8 = [v5 objectForKeyedSubscript:@"MANAGER"];
  double v9 = [v5 objectForKeyedSubscript:@"LOCATIONS"];
  double v10 = [v9 lastObject];
  if ([(WeatherLocationManager *)self isInternalBuild])
  {
    double v11 = +[WeatherInternalPreferences sharedInternalPreferences];
    int v12 = [v11 objectForKey:@"LocationSimulation"];
    int v13 = [v12 BOOLValue];

    if (v13)
    {
      uint64_t v14 = +[WeatherInternalPreferences sharedInternalPreferences];
      double v15 = [v14 objectForKey:@"LocationSimulationHAccuracy"];
      [v15 doubleValue];
      double v17 = v16;

      double v18 = +[WeatherInternalPreferences sharedInternalPreferences];
      double v19 = [v18 objectForKey:@"LocationSimulationLatitude"];
      [v19 floatValue];
      double v21 = v20;
      double v22 = +[WeatherInternalPreferences sharedInternalPreferences];
      double v23 = [v22 objectForKey:@"LocationSimulationLongitude"];
      [v23 floatValue];
      double v25 = v24;

      v26 = WALogForCategory(4);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v44 = *(const char **)&v21;
        __int16 v45 = 2048;
        double v46 = v25;
        __int16 v47 = 2048;
        double v48 = v17;
        _os_log_impl(&dword_226D1D000, v26, OS_LOG_TYPE_DEFAULT, "Overriding weather location position and accuracy via user defaults - (%f, %f) %fm", buf, 0x20u);
      }

      id v27 = objc_alloc(MEMORY[0x263F00A50]);
      v28 = [v10 timestamp];
      uint64_t v29 = objc_msgSend(v27, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v28, v21, v25, 0.0, v17, 1.0);

      uint64_t v30 = [v9 arrayByAddingObject:v29];

      double v10 = (void *)v29;
      double v9 = (void *)v30;
    }
  }
  uint64_t v31 = [(WeatherLocationManager *)self delegate];
  char v32 = objc_opt_respondsToSelector();

  if (v32)
  {
    double v33 = WALogForCategory(4);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = [(WeatherLocationManager *)self delegate];
      *(_DWORD *)buf = 138412290;
      v44 = v34;
      _os_log_impl(&dword_226D1D000, v33, OS_LOG_TYPE_DEFAULT, "Notifying clients of updated location, %@", buf, 0xCu);
    }
    v35 = [(WeatherLocationManager *)self delegate];
    [v35 locationManager:v8 didUpdateLocations:v9];

    if ([(WeatherLocationManager *)self isInternalBuild])
    {
      int v36 = [MEMORY[0x263F08A00] defaultCenter];
      [v36 postNotificationName:@"BeganDataRequestNotification" object:0];
    }
  }
  [(WeatherLocationManager *)self setLocationUpdatesEnabled:0];
  v37 = [MEMORY[0x263EFF910] date];
  [v37 timeIntervalSince1970];
  -[WeatherLocationManager setLastLocationUpdateTime:](self, "setLastLocationUpdateTime:");

  __int16 v38 = NSNumber;
  [(WeatherLocationManager *)self lastLocationUpdateTime];
  v39 = objc_msgSend(v38, "numberWithDouble:");
  [v7 writeDefaultValue:v39 forKey:@"LastLocationUpdateTime"];

  [v7 synchronizeStateToDisk];
  [(WeatherLocationManager *)self scheduleDelayedUpdate:(double)[(WeatherLocationManager *)self updateInterval]];
  [(WeatherLocationManager *)self setOldestAllowedUpdateTime:-1.0];
  double v40 = *MEMORY[0x263F00B30];
  v41 = [(WeatherLocationManager *)self locationManager];
  [v41 setDesiredAccuracy:v40];
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  v49[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!self->_locationUpdatesEnabled)
  {
    double v8 = WALogForCategory(4);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v44) = 138412290;
      *(void *)((char *)&v44 + 4) = v7;
      _os_log_impl(&dword_226D1D000, v8, OS_LOG_TYPE_DEFAULT, "Received location update after CL is stopped, ignoring: %@", (uint8_t *)&v44, 0xCu);
    }
    goto LABEL_38;
  }
  [(WeatherLocationManager *)self cancelAccuracyFallbackTimer];
  if ([v7 count])
  {
    v48[0] = @"MANAGER";
    v48[1] = @"LOCATIONS";
    v49[0] = v6;
    v49[1] = v7;
    double v8 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];
    double v9 = [v7 lastObject];
    double v10 = [v9 timestamp];
    [v10 timeIntervalSince1970];
    double v12 = v11;

    int v13 = WALogForCategory(4);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v44) = 138412290;
      *(void *)((char *)&v44 + 4) = v9;
      _os_log_impl(&dword_226D1D000, v13, OS_LOG_TYPE_DEFAULT, "Received location update: %@", (uint8_t *)&v44, 0xCu);
    }

    uint64_t v14 = [(WeatherLocationManager *)self locationManager];
    char v15 = [v14 _limitsPrecision];

    if (v15)
    {
      BOOL v16 = 1;
    }
    else
    {
      [v9 horizontalAccuracy];
      BOOL v16 = v17 <= 1500.0;
    }
    [(WeatherLocationManager *)self oldestAllowedUpdateTime];
    double v19 = v18;
    [v9 horizontalAccuracy];
    BOOL v21 = v20 < 10000.0;
    double v22 = 10.0;
    if (!v21) {
      double v22 = 20.0;
    }
    float v23 = v22;
    [(WeatherLocationManager *)self oldestAllowedUpdateTime];
    double v25 = v12 - v24;
    double v26 = v23;
    id v27 = WALogForCategory(4);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(void *)&long long v44 = __PAIR64__(v16, 67109888);
      WORD4(v44) = 1024;
      *(_DWORD *)((char *)&v44 + 10) = v19 > 0.0;
      HIWORD(v44) = 1024;
      BOOL v45 = v25 > v26;
      __int16 v46 = 2048;
      double v47 = v23;
      _os_log_debug_impl(&dword_226D1D000, v27, OS_LOG_TYPE_DEBUG, "accurate: %d, requested: %d, overdue: %d (timeout: %f)", (uint8_t *)&v44, 0x1Eu);
    }

    BOOL v28 = v19 > 0.0 && v16;
    if (v28 || v25 > v26)
    {
      char v32 = WALogForCategory(4);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v44) = 138412290;
        *(void *)((char *)&v44 + 4) = v9;
        _os_log_impl(&dword_226D1D000, v32, OS_LOG_TYPE_DEFAULT, "New location meet our criteria: %@, use it", (uint8_t *)&v44, 0xCu);
      }

      [(WeatherLocationManager *)self updateLocation:v8];
    }
    else
    {
      char v29 = v19 <= 0.0 || v16;
      uint64_t v30 = WALogForCategory(4);
      BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
      if (v29)
      {
        if (v31)
        {
          LODWORD(v44) = 67109376;
          DWORD1(v44) = v16;
          WORD4(v44) = 1024;
          *(_DWORD *)((char *)&v44 + 10) = v19 > 0.0;
          _os_log_impl(&dword_226D1D000, v30, OS_LOG_TYPE_DEFAULT, "Dropping location update - accurate: %d, requested: %d", (uint8_t *)&v44, 0xEu);
        }
      }
      else
      {
        if (v31)
        {
          LODWORD(v44) = 134217984;
          *(double *)((char *)&v44 + 4) = v23;
          _os_log_impl(&dword_226D1D000, v30, OS_LOG_TYPE_DEFAULT, "Location update not accurate enough - waiting %fs for better update", (uint8_t *)&v44, 0xCu);
        }

        [v9 coordinate];
        double v34 = v33;
        [(WeatherLocationManager *)self lastLocationCoord];
        if (v34 == v35)
        {
          [v9 coordinate];
          double v37 = v36;
          [(WeatherLocationManager *)self lastLocationCoord];
          if (v37 == v38)
          {
            v39 = WALogForCategory(4);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v44) = 0;
              _os_log_impl(&dword_226D1D000, v39, OS_LOG_TYPE_DEFAULT, "Temporarily boosting location accuracy", (uint8_t *)&v44, 2u);
            }

            double v40 = *MEMORY[0x263F00B28];
            v41 = [(WeatherLocationManager *)self locationManager];
            [v41 setDesiredAccuracy:v40];
          }
        }
        uint64_t v30 = objc_msgSend(MEMORY[0x263EFFA20], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_accuracyFallbackTimerDidFire_, v8, 0, v23, v44);
        [(WeatherLocationManager *)self setAccuracyFallbackTimer:v30];
      }
    }
    objc_msgSend(v9, "coordinate", (void)v44);
    -[WeatherLocationManager setLastLocationCoord:](self, "setLastLocationCoord:");
    v42 = [v9 timestamp];
    [(WeatherLocationManager *)self setLastLocationTimeStamp:v42];

    [v9 horizontalAccuracy];
    *(float *)&double v43 = v43;
    [(WeatherLocationManager *)self setLastLocationAccuracy:v43];

LABEL_38:
  }
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = WALogForCategory(4);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v4;
    _os_log_impl(&dword_226D1D000, v7, OS_LOG_TYPE_DEFAULT, "Location authorization status is now %d", (uint8_t *)v11, 8u);
  }

  [(WeatherLocationManager *)self setAuthorizationStatus:v4];
  double v8 = [(WeatherLocationManager *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    double v10 = [(WeatherLocationManager *)self delegate];
    [v10 locationManager:v6 didChangeAuthorizationStatus:v4];
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  id v5 = WALogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[WeatherLocationManager locationManager:didFailWithError:]((uint64_t)v4, v5);
  }
}

- (void)setLocationUpdatesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([(WeatherLocationManager *)self locationUpdatesEnabled] != a3)
  {
    id v5 = WALogForCategory(4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = "Disabling";
      if (v3) {
        id v6 = "Enabling";
      }
      int v10 = 136315138;
      double v11 = v6;
      _os_log_impl(&dword_226D1D000, v5, OS_LOG_TYPE_DEFAULT, "%s location updates", (uint8_t *)&v10, 0xCu);
    }

    id v7 = WALogForCategory(4);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v8)
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_226D1D000, v7, OS_LOG_TYPE_DEFAULT, "Start updating location", (uint8_t *)&v10, 2u);
      }

      char v9 = [(WeatherLocationManager *)self locationManager];
      [v9 startUpdatingLocation];
    }
    else
    {
      if (v8)
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_226D1D000, v7, OS_LOG_TYPE_DEFAULT, "Stop updating location", (uint8_t *)&v10, 2u);
      }

      char v9 = [(WeatherLocationManager *)self locationManager];
      [v9 stopUpdatingLocation];
    }

    self->_locationUpdatesEnabled = v3;
  }
}

- (void)cancelAccuracyFallbackTimer
{
  BOOL v3 = [(WeatherLocationManager *)self accuracyFallbackTimer];
  [v3 invalidate];

  [(WeatherLocationManager *)self setAccuracyFallbackTimer:0];
}

- (id)location
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if ([(WeatherLocationManager *)self isInternalBuild]
    && (+[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences"), BOOL v3 = objc_claimAutoreleasedReturnValue(), [v3 objectForKey:@"LocationSimulation"], v4 = objc_claimAutoreleasedReturnValue(), v5 = objc_msgSend(v4, "BOOLValue"), v4, v3, v5))
  {
    id v6 = +[WeatherInternalPreferences sharedInternalPreferences];
    id v7 = [v6 objectForKey:@"LocationSimulationHAccuracy"];
    [v7 doubleValue];
    double v9 = v8;

    int v10 = +[WeatherInternalPreferences sharedInternalPreferences];
    double v11 = [v10 objectForKey:@"LocationSimulationLatitude"];
    [v11 floatValue];
    double v13 = v12;
    uint64_t v14 = +[WeatherInternalPreferences sharedInternalPreferences];
    char v15 = [v14 objectForKey:@"LocationSimulationLongitude"];
    [v15 floatValue];
    double v17 = v16;

    double v18 = WALogForCategory(4);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 134218496;
      double v28 = v13;
      __int16 v29 = 2048;
      double v30 = v17;
      __int16 v31 = 2048;
      double v32 = v9;
      _os_log_impl(&dword_226D1D000, v18, OS_LOG_TYPE_DEFAULT, "Overriding location position and accuracy via user defaults - (%f, %f) %fm", (uint8_t *)&v27, 0x20u);
    }

    id v19 = objc_alloc(MEMORY[0x263F00A50]);
    double v20 = [MEMORY[0x263EFF910] date];
    uint64_t v21 = objc_msgSend(v19, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v20, v13, v17, 0.0, v9, 1.0);
  }
  else
  {
    double v22 = WALogForCategory(4);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      float v23 = [(WeatherLocationManager *)self locationManager];
      double v24 = [v23 location];
      int v27 = 138412290;
      double v28 = *(double *)&v24;
      _os_log_impl(&dword_226D1D000, v22, OS_LOG_TYPE_DEFAULT, "Requested location from location manager, the location saved is:%@", (uint8_t *)&v27, 0xCu);
    }
    double v20 = [(WeatherLocationManager *)self locationManager];
    uint64_t v21 = [v20 location];
  }
  double v25 = (void *)v21;

  return v25;
}

- (NSString)effectiveBundleIdentifier
{
  return self->_effectiveBundleIdentifier;
}

- (void)setAuthorizationStatus:(int)a3
{
  self->_authorizationStatus = a3;
}

- (CLLocationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CLLocationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)locationTrackingIsReady
{
  return self->_locationTrackingIsReady;
}

- (void)setLocationTrackingIsReady:(BOOL)a3
{
  self->_locationTrackingIsReady = a3;
}

- (BOOL)locationUpdatesEnabled
{
  return self->_locationUpdatesEnabled;
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (unint64_t)updateInterval
{
  return self->_updateInterval;
}

- (void)setUpdateInterval:(unint64_t)a3
{
  self->_unint64_t updateInterval = a3;
}

- (double)oldestAllowedUpdateTime
{
  return self->_oldestAllowedUpdateTime;
}

- (void)setOldestAllowedUpdateTime:(double)a3
{
  self->_oldestAllowedUpdateTime = a3;
}

- (NSTimer)delayedUpdateTimer
{
  return self->_delayedUpdateTimer;
}

- (void)setDelayedUpdateTimer:(id)a3
{
}

- (NSTimer)accuracyFallbackTimer
{
  return self->_accuracyFallbackTimer;
}

- (void)setAccuracyFallbackTimer:(id)a3
{
}

- (WeatherPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (CLLocationCoordinate2D)lastLocationCoord
{
  double latitude = self->_lastLocationCoord.latitude;
  double longitude = self->_lastLocationCoord.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setLastLocationCoord:(CLLocationCoordinate2D)a3
{
  self->_lastLocationCoord = a3;
}

- (NSDate)lastLocationTimeStamp
{
  return self->_lastLocationTimeStamp;
}

- (void)setLastLocationTimeStamp:(id)a3
{
}

- (float)lastLocationAccuracy
{
  return self->_lastLocationAccuracy;
}

- (void)setLastLocationAccuracy:(float)a3
{
  self->_lastLocationAccuracy = a3;
}

- (double)lastLocationUpdateTime
{
  return self->_lastLocationUpdateTime;
}

- (void)setLastLocationUpdateTime:(double)a3
{
  self->_lastLocationUpdateTime = a3;
}

- (double)nextPlannedUpdate
{
  return self->_nextPlannedUpdate;
}

- (void)setNextPlannedUpdate:(double)a3
{
  self->_nextPlannedUpdate = a3;
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (void)setIsInternalBuild:(BOOL)a3
{
  self->_isInternalBuild = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLocationTimeStamp, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_accuracyFallbackTimer, 0);
  objc_storeStrong((id *)&self->_delayedUpdateTimer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifier, 0);
}

- (void)locationManager:(uint64_t)a1 didFailWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226D1D000, a2, OS_LOG_TYPE_ERROR, "Location manager encountered an error: %@", (uint8_t *)&v2, 0xCu);
}

@end