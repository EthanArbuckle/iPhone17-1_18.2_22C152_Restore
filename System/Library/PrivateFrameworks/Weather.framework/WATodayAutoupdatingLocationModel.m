@interface WATodayAutoupdatingLocationModel
- (BOOL)_reloadForecastData:(BOOL)a3;
- (BOOL)isLocationTrackingEnabled;
- (BOOL)locationServicesActive;
- (BOOL)shouldNotUseUpdatedLocation;
- (BOOL)shouldUseNewLocation:(id)a3 oldLocation:(id)a4;
- (BOOL)stopUpdateIfNeeded;
- (BOOL)updateLocationTrackingStatus;
- (NSDate)lastLocationUpdateDate;
- (WATodayAutoupdatingLocationModel)init;
- (WATodayAutoupdatingLocationModel)initWithPreferences:(id)a3 effectiveBundleIdentifier:(id)a4;
- (WFGeocodeRequest)geocodeRequest;
- (WeatherLocationManager)locationManager;
- (WeatherPreferences)preferences;
- (double)minDistanceChangeInMeters;
- (double)minTimeBetweenUpdates;
- (id)WeatherLocationManagerGenerator;
- (id)forecastModel;
- (unint64_t)citySource;
- (unint64_t)fallbackCitySource;
- (void)_executeLocationUpdateForFirstWeatherCityWithCompletion:(id)a3;
- (void)_executeLocationUpdateForLocalWeatherCityWithCompletion:(id)a3;
- (void)_executeLocationUpdateWithCompletion:(id)a3;
- (void)_kickstartLocationManager;
- (void)_persistStateWithModel:(id)a3;
- (void)_teardownLocationManager;
- (void)_willDeliverForecastModel:(id)a3;
- (void)checkIfNeedsToUpdate;
- (void)clearLocationUpdateState;
- (void)configureWithInitialCitySource:(unint64_t)a3 locationServicesActive:(BOOL)a4;
- (void)configureWithLocationServicesActive:(BOOL)a3;
- (void)dealloc;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)setCitySource:(unint64_t)a3;
- (void)setCitySource:(unint64_t)a3 fireNotification:(BOOL)a4;
- (void)setFallbackCitySource:(unint64_t)a3;
- (void)setGeocodeRequest:(id)a3;
- (void)setIsLocationTrackingEnabled:(BOOL)a3;
- (void)setLastLocationUpdateDate:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setLocationServicesActive:(BOOL)a3;
- (void)setPreferences:(id)a3;
- (void)setStopUpdateIfNeeded:(BOOL)a3;
- (void)setWeatherLocationManagerGenerator:(id)a3;
- (void)syncLastUpdateTime;
- (void)ubiquitousDefaultsDidChange:(id)a3;
- (void)weatherPreferencesWereSynchronized;
@end

@implementation WATodayAutoupdatingLocationModel

- (WATodayAutoupdatingLocationModel)initWithPreferences:(id)a3 effectiveBundleIdentifier:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)WATodayAutoupdatingLocationModel;
  v8 = [(WATodayModel *)&v32 init];
  if (v8)
  {
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    v28 = __82__WATodayAutoupdatingLocationModel_initWithPreferences_effectiveBundleIdentifier___block_invoke;
    v29 = &unk_2647E0320;
    id v9 = v6;
    id v30 = v9;
    id v31 = v7;
    [(WATodayAutoupdatingLocationModel *)v8 setWeatherLocationManagerGenerator:&v26];
    -[WATodayAutoupdatingLocationModel setStopUpdateIfNeeded:](v8, "setStopUpdateIfNeeded:", 0, v26, v27, v28, v29);
    [(WATodayAutoupdatingLocationModel *)v8 setPreferences:v9];
    v10 = [(WATodayModel *)v8 lastUpdateDate];

    if (!v10)
    {
      v11 = (void *)MEMORY[0x263EFF910];
      v12 = [v9 readDefaultValueForKey:@"LastWidgetForecastUpdateDate"];
      [v12 doubleValue];
      v13 = objc_msgSend(v11, "dateWithTimeIntervalSince1970:");
      [(WATodayModel *)v8 setLastUpdateDate:v13];
    }
    v14 = [MEMORY[0x263F85F60] sharedInstance];
    v15 = [v14 settings];

    [v15 locationUpdateMinTimeInterval];
    v8->_double minTimeBetweenUpdates = v16;
    [v15 locationUpdateMinDistance];
    v8->_double minDistanceChangeInMeters = v17;
    uint64_t v18 = [MEMORY[0x263EFF910] distantPast];
    lastLocationUpdateDate = v8->_lastLocationUpdateDate;
    v8->_lastLocationUpdateDate = (NSDate *)v18;

    v20 = WALogForCategory(4);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      double minTimeBetweenUpdates = v8->_minTimeBetweenUpdates;
      double minDistanceChangeInMeters = v8->_minDistanceChangeInMeters;
      *(_DWORD *)buf = 134218240;
      double v34 = minTimeBetweenUpdates;
      __int16 v35 = 2048;
      double v36 = minDistanceChangeInMeters;
      _os_log_impl(&dword_226D1D000, v20, OS_LOG_TYPE_DEFAULT, "[WATodayAutoupdatingLocationModel] initialize with minTimeBetweenUpdates: %f, minDistanceChangeInMeters: %f", buf, 0x16u);
    }

    v23 = [MEMORY[0x263F087C8] defaultCenter];
    [v23 addObserver:v8 selector:sel_weatherPreferencesWereSynchronized name:@"WeatherPrefAppToPrefsDidUpdateNotification" object:0 suspensionBehavior:2];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)WeatherCityListChanged, @"com.apple.weather.WeatherCityListPrefsChangedNotification", 0, (CFNotificationSuspensionBehavior)1024);
  }
  return v8;
}

WeatherLocationManager *__82__WATodayAutoupdatingLocationModel_initWithPreferences_effectiveBundleIdentifier___block_invoke(uint64_t a1)
{
  v1 = [[WeatherLocationManager alloc] initWithPreferences:*(void *)(a1 + 32) effectiveBundleIdentifier:*(void *)(a1 + 40)];
  return v1;
}

- (WATodayAutoupdatingLocationModel)init
{
  v3 = objc_opt_new();
  v4 = [(WATodayAutoupdatingLocationModel *)self initWithPreferences:v3 effectiveBundleIdentifier:0];

  return v4;
}

- (double)minTimeBetweenUpdates
{
  double result = self->_minTimeBetweenUpdates;
  if (result <= 0.0)
  {
    self->_double minTimeBetweenUpdates = 1800.0;
    return 1800.0;
  }
  return result;
}

- (double)minDistanceChangeInMeters
{
  double result = self->_minDistanceChangeInMeters;
  if (result <= 0.0)
  {
    self->_double minDistanceChangeInMeters = 1500.0;
    return 1500.0;
  }
  return result;
}

- (void)configureWithLocationServicesActive:(BOOL)a3
{
}

- (void)configureWithInitialCitySource:(unint64_t)a3 locationServicesActive:(BOOL)a4
{
  BOOL v4 = a4;
  [(WATodayAutoupdatingLocationModel *)self setFallbackCitySource:a3];
  [(WATodayAutoupdatingLocationModel *)self setCitySource:[(WATodayAutoupdatingLocationModel *)self fallbackCitySource] fireNotification:0];
  [(WATodayAutoupdatingLocationModel *)self setLocationServicesActive:v4];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.weather.WeatherCityListPrefsChangedNotification", 0);
  [(WATodayAutoupdatingLocationModel *)self _teardownLocationManager];
  v5.receiver = self;
  v5.super_class = (Class)WATodayAutoupdatingLocationModel;
  [(WATodayModel *)&v5 dealloc];
}

- (void)clearLocationUpdateState
{
  id v2 = [(WATodayAutoupdatingLocationModel *)self locationManager];
  [v2 stopLocationUpdate];
}

- (void)setPreferences:(id)a3
{
  objc_super v5 = (WeatherPreferences *)a3;
  preferences = self->_preferences;
  if (preferences != v5)
  {
    id v7 = v5;
    [(WeatherPreferences *)preferences setSyncDelegate:0];
    objc_storeStrong((id *)&self->_preferences, a3);
    preferences = (WeatherPreferences *)[(WeatherPreferences *)self->_preferences setSyncDelegate:self];
    objc_super v5 = v7;
  }
  MEMORY[0x270F9A758](preferences, v5);
}

- (void)setIsLocationTrackingEnabled:(BOOL)a3
{
  if (self->_isLocationTrackingEnabled != a3)
  {
    BOOL v3 = a3;
    objc_super v5 = [(WATodayAutoupdatingLocationModel *)self locationManager];
    [v5 setLocationTrackingReady:1 activelyTracking:v3 watchKitExtension:0];

    self->_isLocationTrackingEnabled = v3;
    if (v3)
    {
      id v6 = WALogForCategory(4);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_226D1D000, v6, OS_LOG_TYPE_DEFAULT, "Clear weather update state", v8, 2u);
      }

      id v7 = [(WATodayAutoupdatingLocationModel *)self locationManager];
      [v7 clearLocalWeatherUpdateState];
    }
    else
    {
      [(WATodayModel *)self _fireTodayModelWantsUpdate];
    }
  }
}

- (id)forecastModel
{
  v9.receiver = self;
  v9.super_class = (Class)WATodayAutoupdatingLocationModel;
  BOOL v3 = [(WATodayModel *)&v9 forecastModel];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
LABEL_5:
    id v6 = v5;
    goto LABEL_7;
  }
  if ([(WATodayAutoupdatingLocationModel *)self _reloadForecastData:0])
  {
    v8.receiver = self;
    v8.super_class = (Class)WATodayAutoupdatingLocationModel;
    id v5 = [(WATodayModel *)&v8 forecastModel];
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (void)setCitySource:(unint64_t)a3 fireNotification:(BOOL)a4
{
  if (self->_citySource != a3)
  {
    BOOL v4 = a4;
    self->_citySource = a3;
    [(WATodayAutoupdatingLocationModel *)self _reloadForecastData:0];
    if (v4)
    {
      [(WATodayModel *)self _fireTodayModelWantsUpdate];
    }
  }
}

- (void)setCitySource:(unint64_t)a3
{
}

- (void)setLocationServicesActive:(BOOL)a3
{
  if (self->_locationServicesActive != a3)
  {
    self->_locationServicesActive = a3;
    if (a3) {
      [(WATodayAutoupdatingLocationModel *)self _kickstartLocationManager];
    }
    else {
      [(WATodayAutoupdatingLocationModel *)self _teardownLocationManager];
    }
  }
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v9 = [(WATodayAutoupdatingLocationModel *)self preferences];
  id v6 = [(WATodayAutoupdatingLocationModel *)self locationManager];
  if ([v6 locationTrackingIsReady])
  {
    if (a4 >= 3)
    {
      [v9 setLocalWeatherEnabled:1];
      [(WATodayAutoupdatingLocationModel *)self setIsLocationTrackingEnabled:1];
      [v6 setLocationTrackingActive:1];
      objc_super v8 = [(WATodayAutoupdatingLocationModel *)self locationManager];
      [v8 clearLocalWeatherUpdateState];

      [(WATodayAutoupdatingLocationModel *)self setCitySource:1];
      goto LABEL_8;
    }
    [v9 setLocalWeatherEnabled:0];
    [v6 setLocationTrackingActive:0];
    [(WATodayAutoupdatingLocationModel *)self setIsLocationTrackingEnabled:0];
    id v7 = [(WATodayAutoupdatingLocationModel *)self locationManager];
    [v7 clearLocalWeatherUpdateState];
  }
  else if (a4 > 2)
  {
    goto LABEL_8;
  }
  [(WATodayAutoupdatingLocationModel *)self setCitySource:[(WATodayAutoupdatingLocationModel *)self fallbackCitySource]];
  if (!a4) {
    [v6 askForLocationManagerAuthorization];
  }
LABEL_8:
  [(WATodayModel *)self _fireTodayModelWantsUpdate];
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = (__CFString *)a4;
  BOOL isLocationTrackingEnabled = self->_isLocationTrackingEnabled;
  id v7 = WALogForCategory(4);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (isLocationTrackingEnabled)
  {
    if (v8)
    {
      uint64_t v9 = [(__CFString *)v5 count];
      if (v9)
      {
        v10 = [(__CFString *)v5 lastObject];
      }
      else
      {
        v10 = @"No new location";
      }
      int v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_226D1D000, v7, OS_LOG_TYPE_DEFAULT, "[WATodayAutoupdatingLocationModel] Received location update: %@", (uint8_t *)&v11, 0xCu);
      if (v9) {
    }
      }
    [(WATodayModel *)self _fireTodayModelWantsUpdate];
  }
  else
  {
    if (v8)
    {
      int v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_226D1D000, v7, OS_LOG_TYPE_DEFAULT, "Received location update after CL is stopped, ignoring: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_kickstartLocationManager
{
  BOOL v3 = [(WATodayAutoupdatingLocationModel *)self WeatherLocationManagerGenerator];
  BOOL v4 = v3[2]();
  if (v4)
  {
    [(WATodayAutoupdatingLocationModel *)self setLocationManager:v4];
  }
  else
  {
    id v5 = objc_opt_new();
    [(WATodayAutoupdatingLocationModel *)self setLocationManager:v5];
  }
  [(WATodayAutoupdatingLocationModel *)self minTimeBetweenUpdates];
  unint64_t v7 = (unint64_t)v6;
  BOOL v8 = [(WATodayAutoupdatingLocationModel *)self locationManager];
  [v8 setUpdateInterval:v7];

  uint64_t v9 = [(WATodayAutoupdatingLocationModel *)self locationManager];
  [v9 setDelegate:self];

  uint64_t v10 = [MEMORY[0x263F00A60] locationServicesEnabled];
  int v11 = [(WATodayAutoupdatingLocationModel *)self locationManager];
  int v12 = [v11 localWeatherAuthorized];

  uint64_t v13 = [(WATodayAutoupdatingLocationModel *)self preferences];
  [v13 setLocalWeatherEnabled:v10 & v12];

  if v10 && (v12) {
    unint64_t v14 = 1;
  }
  else {
    unint64_t v14 = [(WATodayAutoupdatingLocationModel *)self fallbackCitySource];
  }
  [(WATodayAutoupdatingLocationModel *)self setCitySource:v14 fireNotification:0];
  if ((v12 & 1) == 0)
  {
    v15 = [(WATodayAutoupdatingLocationModel *)self locationManager];
    [v15 askForLocationManagerAuthorization];
  }
  [(WATodayAutoupdatingLocationModel *)self setIsLocationTrackingEnabled:v10];
  id v16 = [(WATodayAutoupdatingLocationModel *)self locationManager];
  [v16 setLocationTrackingActive:1];
}

- (void)checkIfNeedsToUpdate
{
  if (![(WATodayAutoupdatingLocationModel *)self updateLocationTrackingStatus])
  {
    BOOL v3 = WALogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226D1D000, v3, OS_LOG_TYPE_DEFAULT, "Check if needs to update", buf, 2u);
    }

    BOOL v4 = [(WATodayAutoupdatingLocationModel *)self locationManager];
    if (([v4 isLocalStaleOrOutOfDate] & 1) == 0)
    {
      id v5 = [(WATodayAutoupdatingLocationModel *)self locationManager];
      if (![v5 isCacheOutOfDate])
      {
        BOOL v9 = [(WATodayModel *)self hasCrossedHourlyBoundary];

        if (!v9)
        {
          uint64_t v10 = WALogForCategory(0);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)int v12 = 0;
            _os_log_impl(&dword_226D1D000, v10, OS_LOG_TYPE_DEFAULT, "Check current location to see if movement is within distance filter", v12, 2u);
          }

          [(WATodayAutoupdatingLocationModel *)self setStopUpdateIfNeeded:1];
          unint64_t v7 = [(WATodayAutoupdatingLocationModel *)self locationManager];
          [v7 updateLocationWithNoConditionCheck];
          goto LABEL_11;
        }
LABEL_8:
        double v6 = WALogForCategory(0);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v13 = 0;
          _os_log_impl(&dword_226D1D000, v6, OS_LOG_TYPE_DEFAULT, "Forced location update", v13, 2u);
        }

        unint64_t v7 = [(WATodayAutoupdatingLocationModel *)self locationManager];
        [v7 forceLocationUpdate];
LABEL_11:

        goto LABEL_12;
      }
    }
    goto LABEL_8;
  }
LABEL_12:
  BOOL v8 = WALogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v11 = 0;
    _os_log_impl(&dword_226D1D000, v8, OS_LOG_TYPE_DEFAULT, "Update location tracking status", v11, 2u);
  }
}

- (void)_teardownLocationManager
{
  BOOL v3 = [(WATodayAutoupdatingLocationModel *)self locationManager];
  [v3 setLocationTrackingReady:0 activelyTracking:0 watchKitExtension:0];

  BOOL v4 = [(WATodayAutoupdatingLocationModel *)self locationManager];
  [v4 setDelegate:0];

  [(WATodayAutoupdatingLocationModel *)self setLocationManager:0];
  unint64_t v5 = [(WATodayAutoupdatingLocationModel *)self fallbackCitySource];
  [(WATodayAutoupdatingLocationModel *)self setCitySource:v5 fireNotification:0];
}

- (void)syncLastUpdateTime
{
  BOOL v3 = [(WATodayAutoupdatingLocationModel *)self preferences];
  BOOL v4 = NSNumber;
  unint64_t v5 = [(WATodayModel *)self lastUpdateDate];
  [v5 timeIntervalSince1970];
  double v6 = objc_msgSend(v4, "numberWithDouble:");
  [v3 writeDefaultValue:v6 forKey:@"LastWidgetForecastUpdateDate"];

  id v7 = [(WATodayAutoupdatingLocationModel *)self preferences];
  [v7 synchronizeStateToDisk];
}

- (BOOL)updateLocationTrackingStatus
{
  BOOL v3 = [(WATodayAutoupdatingLocationModel *)self locationManager];

  if (v3)
  {
    int v4 = [MEMORY[0x263F00A60] locationServicesEnabled];
    LODWORD(v3) = v4 & ![(WATodayAutoupdatingLocationModel *)self isLocationTrackingEnabled];
    -[WATodayAutoupdatingLocationModel setIsLocationTrackingEnabled:](self, "setIsLocationTrackingEnabled:", [MEMORY[0x263F00A60] locationServicesEnabled]);
  }
  return (char)v3;
}

- (void)weatherPreferencesWereSynchronized
{
  if ([(WATodayAutoupdatingLocationModel *)self _reloadForecastData:1])
  {
    id v3 = [(WATodayAutoupdatingLocationModel *)self forecastModel];
    [(WATodayModel *)self _fireTodayModelForecastWasUpdated:v3];
  }
}

- (void)_executeLocationUpdateWithCompletion:(id)a3
{
  int v4 = (void (**)(id, void, void *))a3;
  unint64_t v5 = [(WATodayAutoupdatingLocationModel *)self citySource];
  if (v5 == 2)
  {
    [(WATodayAutoupdatingLocationModel *)self _executeLocationUpdateForFirstWeatherCityWithCompletion:v4];
  }
  else if (v5 == 1)
  {
    [(WATodayAutoupdatingLocationModel *)self _executeLocationUpdateForLocalWeatherCityWithCompletion:v4];
  }
  else
  {
    double v6 = WALogForCategory(4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[WATodayAutoupdatingLocationModel _executeLocationUpdateWithCompletion:](v6);
    }

    if (v4)
    {
      id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.weather.errorDomain" code:-1 userInfo:0];
      v4[2](v4, 0, v7);
    }
  }
}

- (void)_willDeliverForecastModel:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(WATodayAutoupdatingLocationModel *)self citySource];
  double v6 = WACityFromForecastModel(v4);
  [v4 setCity:v6];

  id v7 = [v4 city];
  [v7 setIsLocalWeatherCity:v5 == 1];

  v8.receiver = self;
  v8.super_class = (Class)WATodayAutoupdatingLocationModel;
  [(WATodayModel *)&v8 _willDeliverForecastModel:v4];
}

- (BOOL)shouldNotUseUpdatedLocation
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [(WATodayAutoupdatingLocationModel *)self preferences];
  id v4 = WATodayLoadSavedLastForecastModelFromPreferences(v3);

  unint64_t v5 = [(WATodayAutoupdatingLocationModel *)self locationManager];
  double v6 = [v5 location];

  id v7 = [v4 location];
  objc_super v8 = [(WATodayAutoupdatingLocationModel *)self forecastModel];
  BOOL v9 = [v8 location];
  uint64_t v10 = [v9 geoLocation];

  int v11 = WALogForCategory(4);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    v24 = v7;
    _os_log_impl(&dword_226D1D000, v11, OS_LOG_TYPE_DEFAULT, "savedModelLocation is %@", (uint8_t *)&v23, 0xCu);
  }

  BOOL v12 = 0;
  if (v7 && v6)
  {
    uint64_t v13 = [v7 geoLocation];
    [v13 distanceFromLocation:v6];
    double v15 = v14;
    id v16 = [(WATodayAutoupdatingLocationModel *)self locationManager];
    [v16 distanceFilter];
    BOOL v12 = v15 < v17;
  }
  if (v10)
  {
    [v10 distanceFromLocation:v6];
    double v19 = v18;
    v20 = [(WATodayAutoupdatingLocationModel *)self locationManager];
    [v20 distanceFilter];
    if (v19 >= v21) {
      BOOL v12 = 0;
    }
  }
  return v12;
}

- (BOOL)shouldUseNewLocation:(id)a3 oldLocation:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  double v6 = COERCE_DOUBLE(a3);
  id v7 = a4;
  if (v7)
  {
    if (v6 == 0.0)
    {
      id v16 = WALogForCategory(4);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        v20 = "[WATodayAutoupdatingLocationModel] invalid new location, bailing";
        double v21 = v16;
        uint32_t v22 = 2;
        goto LABEL_15;
      }
LABEL_16:
      BOOL v27 = 0;
      goto LABEL_17;
    }
    objc_super v8 = [MEMORY[0x263EFF910] date];
    BOOL v9 = [(WATodayAutoupdatingLocationModel *)self lastLocationUpdateDate];
    [v8 timeIntervalSinceDate:v9];
    double v11 = v10;

    [*(id *)&v6 distanceFromLocation:v7];
    double v13 = v12;
    [(WATodayAutoupdatingLocationModel *)self minTimeBetweenUpdates];
    if (v11 < v14)
    {
      [(WATodayAutoupdatingLocationModel *)self minDistanceChangeInMeters];
      if (v13 < v15)
      {
        id v16 = WALogForCategory(4);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          [(WATodayAutoupdatingLocationModel *)self minTimeBetweenUpdates];
          double v18 = v17;
          [(WATodayAutoupdatingLocationModel *)self minDistanceChangeInMeters];
          int v29 = 134218752;
          double v30 = v11;
          __int16 v31 = 2048;
          double v32 = v13;
          __int16 v33 = 2048;
          double v34 = v18;
          __int16 v35 = 2048;
          uint64_t v36 = v19;
          v20 = "[WATodayAutoupdatingLocationModel] Dropping location received %f seconds since the last update, and %f m"
                "eters from the previous location. Min time in seconds: %f, min change in meters: %f";
          double v21 = v16;
          uint32_t v22 = 42;
LABEL_15:
          _os_log_impl(&dword_226D1D000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v29, v22);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
    }
    int v23 = WALogForCategory(4);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      [(WATodayAutoupdatingLocationModel *)self minTimeBetweenUpdates];
      uint64_t v25 = v24;
      [(WATodayAutoupdatingLocationModel *)self minDistanceChangeInMeters];
      int v29 = 138413314;
      double v30 = v6;
      __int16 v31 = 2048;
      double v32 = v11;
      __int16 v33 = 2048;
      double v34 = v13;
      __int16 v35 = 2048;
      uint64_t v36 = v25;
      __int16 v37 = 2048;
      uint64_t v38 = v26;
      _os_log_impl(&dword_226D1D000, v23, OS_LOG_TYPE_DEFAULT, "[WATodayAutoupdatingLocationModel] Use new location: %@, %f seconds since the last update, and %f meters from the previous location. Min time in seconds: %f, min change in meters: %f", (uint8_t *)&v29, 0x34u);
    }

    id v16 = [MEMORY[0x263EFF910] date];
    [(WATodayAutoupdatingLocationModel *)self setLastLocationUpdateDate:v16];
  }
  else
  {
    id v16 = WALogForCategory(4);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_226D1D000, v16, OS_LOG_TYPE_DEFAULT, "[WATodayAutoupdatingLocationModel] we do not have an old location, we shall use the new one", (uint8_t *)&v29, 2u);
    }
  }
  BOOL v27 = 1;
LABEL_17:

  return v27;
}

- (void)_executeLocationUpdateForLocalWeatherCityWithCompletion:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *, id))a3;
  unint64_t v5 = [(WATodayAutoupdatingLocationModel *)self preferences];
  double v6 = WATodayLoadSavedLastForecastModelFromPreferences(v5);

  id v7 = [(WATodayAutoupdatingLocationModel *)self locationManager];
  objc_super v8 = [v7 location];

  BOOL v9 = [v6 location];
  double v10 = WALogForCategory(4);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    double v30 = v8;
    __int16 v31 = 2112;
    double v32 = v9;
    _os_log_impl(&dword_226D1D000, v10, OS_LOG_TYPE_DEFAULT, "start updating location: %@, lastKnownLocation is %@", buf, 0x16u);
  }

  if (v9
    && ([v6 location],
        double v11 = objc_claimAutoreleasedReturnValue(),
        [v11 geoLocation],
        double v12 = objc_claimAutoreleasedReturnValue(),
        BOOL v13 = [(WATodayAutoupdatingLocationModel *)self shouldUseNewLocation:v8 oldLocation:v12], v12, v11, !v13))
  {
    if ([(WATodayAutoupdatingLocationModel *)self stopUpdateIfNeeded])
    {
      uint64_t v25 = WALogForCategory(4);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226D1D000, v25, OS_LOG_TYPE_DEFAULT, "Latest location is within 500m range of last one, do not need to update", buf, 2u);
      }

      id v14 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.weather.errorDomain" code:8 userInfo:0];
      [(WATodayAutoupdatingLocationModel *)self setStopUpdateIfNeeded:0];
    }
    else
    {
      id v14 = 0;
    }
    uint64_t v26 = WALogForCategory(4);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226D1D000, v26, OS_LOG_TYPE_DEFAULT, "last location is still good, use that", buf, 2u);
    }

    v4[2](v4, v9, v14);
  }
  else
  {
    id v14 = v8;
    if (v14)
    {
      double v15 = [(WATodayAutoupdatingLocationModel *)self geocodeRequest];

      if (v15)
      {
        id v16 = [(WATodayAutoupdatingLocationModel *)self geocodeRequest];
        [v16 cancel];
      }
      if (WAIsPadAndChinaSKU()) {
        WAPresentFirstUsageDialogIfNeeded();
      }
      id v17 = objc_alloc(MEMORY[0x263F85F28]);
      [v14 coordinate];
      double v19 = v18;
      double v21 = v20;
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __92__WATodayAutoupdatingLocationModel__executeLocationUpdateForLocalWeatherCityWithCompletion___block_invoke;
      v27[3] = &unk_2647E0370;
      v28 = v4;
      uint32_t v22 = objc_msgSend(v17, "initWithCoordinate:resultHandler:", v27, v19, v21);
      [(WATodayAutoupdatingLocationModel *)self setGeocodeRequest:v22];

      int v23 = [(WATodayAutoupdatingLocationModel *)self geocodeRequest];
      [v23 start];

      uint64_t v24 = v28;
      goto LABEL_17;
    }
    if (v4)
    {
      uint64_t v24 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.weather.errorDomain" code:4 userInfo:0];
      v4[2](v4, 0, v24);
LABEL_17:
    }
  }
}

void __92__WATodayAutoupdatingLocationModel__executeLocationUpdateForLocalWeatherCityWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__WATodayAutoupdatingLocationModel__executeLocationUpdateForLocalWeatherCityWithCompletion___block_invoke_2;
  block[3] = &unk_2647E0348;
  id v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 32);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __92__WATodayAutoupdatingLocationModel__executeLocationUpdateForLocalWeatherCityWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = WALogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_226D1D000, v2, OS_LOG_TYPE_DEFAULT, "geocodeRequest ended with newLocation: %@, error: %@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)_executeLocationUpdateForFirstWeatherCityWithCompletion:(id)a3
{
  uint64_t v7 = (void (**)(id, void *, void))a3;
  uint64_t v4 = [(WATodayAutoupdatingLocationModel *)self preferences];
  id v5 = WATodayLoadSavedFirstCityFromPreferences(v4);

  [(WATodayModel *)self setForecastModel:v5];
  if (v7)
  {
    int v6 = [v5 location];
    v7[2](v7, v6, 0);
  }
}

- (void)ubiquitousDefaultsDidChange:(id)a3
{
  if ([(WATodayAutoupdatingLocationModel *)self _reloadForecastData:0])
  {
    id v4 = [(WATodayAutoupdatingLocationModel *)self forecastModel];
    [(WATodayModel *)self _fireTodayModelForecastWasUpdated:v4];
  }
}

- (BOOL)_reloadForecastData:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(WATodayAutoupdatingLocationModel *)self citySource];
  v12.receiver = self;
  v12.super_class = (Class)WATodayAutoupdatingLocationModel;
  int v6 = [(WATodayModel *)&v12 forecastModel];
  uint64_t v7 = [(WATodayAutoupdatingLocationModel *)self preferences];
  __int16 v8 = v7;
  if (v5 == 1) {
    WATodayLoadSavedLastForecastModelFromPreferences(v7);
  }
  else {
  uint64_t v9 = WATodayLoadSavedFirstCityFromPreferences(v7);
  }

  if (v9 && v6)
  {
    if ([v9 isEqual:v6])
    {
LABEL_7:
      BOOL v10 = 0;
      goto LABEL_12;
    }
  }
  else if (!v9)
  {
    goto LABEL_7;
  }
  [(WATodayModel *)self setForecastModel:v9];
  if (v3) {
    [(WATodayModel *)self _fireTodayModelForecastWasUpdated:v9];
  }
  BOOL v10 = 1;
LABEL_12:

  return v10;
}

- (void)_persistStateWithModel:(id)a3
{
  id v4 = a3;
  if ([v4 isPopulated])
  {
    unint64_t v5 = [v4 city];
    if (v5)
    {
      int v6 = v5;
      [v5 updateCityForModel:v4];
    }
    else
    {
      int v6 = WACityFromForecastModel(v4);
      if (!v6) {
        goto LABEL_13;
      }
    }
    unint64_t v7 = [(WATodayAutoupdatingLocationModel *)self citySource];
    __int16 v8 = [(WATodayAutoupdatingLocationModel *)self preferences];
    uint64_t v9 = v8;
    if (v7 == 1)
    {
      [v8 saveToDiskWithLocalWeatherCity:v6];
    }
    else
    {
      BOOL v10 = [v8 loadSavedCities];
      id v11 = objc_msgSend(v10, "na_filter:", &__block_literal_global_0);
      objc_super v12 = (void *)[v11 mutableCopy];

      if ([v12 count])
      {
        [v12 setObject:v6 atIndexedSubscript:0];
        BOOL v13 = [(WATodayAutoupdatingLocationModel *)self preferences];
        [v13 saveToDiskWithCities:v12];
      }
      else
      {
        BOOL v13 = WALogForCategory(1);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v14 = 0;
          _os_log_impl(&dword_226D1D000, v13, OS_LOG_TYPE_DEFAULT, "unable to persist first weather city; preferences doesn't currently have any cities",
            v14,
            2u);
        }
      }
    }
  }
LABEL_13:
}

uint64_t __59__WATodayAutoupdatingLocationModel__persistStateWithModel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isLocalWeatherCity] ^ 1;
}

- (WeatherLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (BOOL)isLocationTrackingEnabled
{
  return self->_isLocationTrackingEnabled;
}

- (BOOL)locationServicesActive
{
  return self->_locationServicesActive;
}

- (WFGeocodeRequest)geocodeRequest
{
  return self->_geocodeRequest;
}

- (void)setGeocodeRequest:(id)a3
{
}

- (unint64_t)citySource
{
  return self->_citySource;
}

- (unint64_t)fallbackCitySource
{
  return self->_fallbackCitySource;
}

- (void)setFallbackCitySource:(unint64_t)a3
{
  self->_fallbackCitySource = a3;
}

- (BOOL)stopUpdateIfNeeded
{
  return self->_stopUpdateIfNeeded;
}

- (void)setStopUpdateIfNeeded:(BOOL)a3
{
  self->_stopUpdateIfNeeded = a3;
}

- (NSDate)lastLocationUpdateDate
{
  return self->_lastLocationUpdateDate;
}

- (void)setLastLocationUpdateDate:(id)a3
{
}

- (WeatherPreferences)preferences
{
  return self->_preferences;
}

- (id)WeatherLocationManagerGenerator
{
  return self->_WeatherLocationManagerGenerator;
}

- (void)setWeatherLocationManagerGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_WeatherLocationManagerGenerator, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_lastLocationUpdateDate, 0);
  objc_storeStrong((id *)&self->_geocodeRequest, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

- (void)_executeLocationUpdateWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_226D1D000, log, OS_LOG_TYPE_ERROR, "Unknown city source; failing location update", v1, 2u);
}

@end