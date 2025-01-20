@interface MapsSunsetSunriseObserver
- (BOOL)_shouldCalculateState;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (CLLocation)lastCheckLocation;
- (Class)transportTypeSupportProvider;
- (GEOObserverHashTable)observers;
- (MKLocationManager)locationManager;
- (MapsSunsetSunriseObserver)initWithLocationManager:(id)a3 sunsetSunriseCalculator:(id)a4 platformController:(id)a5;
- (MapsSunsetSunriseObserver)initWithLocationManager:(id)a3 sunsetSunriseCalculator:(id)a4 platformController:(id)a5 transportTypeSupportProvider:(Class)a6;
- (NSDate)lastCheckTime;
- (NavigationSession)navigationSession;
- (PlatformController)platformController;
- (RoutePlanningSession)routePlanningSession;
- (SunsetSunriseCalculator)sunsetSunriseCalculator;
- (double)minimumDistanceThreshold;
- (double)minimumTimeThreshold;
- (double)offsetThreshold;
- (id)_sunrise;
- (id)_sunset;
- (int64_t)_currentTransportType;
- (int64_t)currentState;
- (void)_calculateState;
- (void)dealloc;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)navigationSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)registerObserver:(id)a3;
- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5;
- (void)setCurrentState:(int64_t)a3;
- (void)setLastCheckLocation:(id)a3;
- (void)setLastCheckTime:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setMinimumDistanceThreshold:(double)a3;
- (void)setMinimumTimeThreshold:(double)a3;
- (void)setNavigationSession:(id)a3;
- (void)setObservers:(id)a3;
- (void)setOffsetThreshold:(double)a3;
- (void)setPlatformController:(id)a3;
- (void)setRoutePlanningSession:(id)a3;
- (void)setSunsetSunriseCalculator:(id)a3;
- (void)setTransportTypeSupportProvider:(Class)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation MapsSunsetSunriseObserver

- (MapsSunsetSunriseObserver)initWithLocationManager:(id)a3 sunsetSunriseCalculator:(id)a4 platformController:(id)a5 transportTypeSupportProvider:(Class)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v28.receiver = self;
  v28.super_class = (Class)MapsSunsetSunriseObserver;
  v14 = [(MapsSunsetSunriseObserver *)&v28 init];
  if (v14)
  {
    v15 = sub_10009D24C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v30 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)&v14->_locationManager, a3);
    [(MKLocationManager *)v14->_locationManager listenForLocationUpdates:v14];
    objc_storeStrong((id *)&v14->_sunsetSunriseCalculator, a4);
    id v16 = objc_storeWeak((id *)&v14->_platformController, v13);
    [v13 addObserver:v14];

    id WeakRetained = objc_loadWeakRetained((id *)&v14->_platformController);
    v18 = [WeakRetained currentSession];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
    id v20 = v19;

    [(MapsSunsetSunriseObserver *)v14 setNavigationSession:v20];
    id v21 = objc_loadWeakRetained((id *)&v14->_platformController);
    v22 = [v21 currentSession];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v23 = v22;
    }
    else {
      v23 = 0;
    }
    id v24 = v23;

    [(MapsSunsetSunriseObserver *)v14 setRoutePlanningSession:v24];
    objc_storeStrong((id *)&v14->_transportTypeSupportProvider, a6);
    v25 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___MapsSunsetSunriseObservation queue:&_dispatch_main_q];
    observers = v14->_observers;
    v14->_observers = v25;

    [(MapsSunsetSunriseObserver *)v14 _calculateState];
  }

  return v14;
}

- (void)setRoutePlanningSession:(id)a3
{
  v5 = (RoutePlanningSession *)a3;
  if (self->_routePlanningSession != v5)
  {
    v6 = sub_10009D24C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 134349314;
      v8 = self;
      __int16 v9 = 2112;
      v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Got new RoutePlanningSession: %@", (uint8_t *)&v7, 0x16u);
    }

    [(RoutePlanningSession *)self->_routePlanningSession removeObserver:self];
    objc_storeStrong((id *)&self->_routePlanningSession, a3);
    [(RoutePlanningSession *)self->_routePlanningSession addObserver:self];
  }
}

- (void)setNavigationSession:(id)a3
{
  v5 = (NavigationSession *)a3;
  if (self->_navigationSession != v5)
  {
    v6 = sub_10009D24C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 134349314;
      v8 = self;
      __int16 v9 = 2112;
      v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Got new NavigationSession: %@", (uint8_t *)&v7, 0x16u);
    }

    [(NavigationSession *)self->_navigationSession removeObserver:self];
    objc_storeStrong((id *)&self->_navigationSession, a3);
    [(NavigationSession *)self->_navigationSession addObserver:self];
  }
}

- (void)_calculateState
{
  v3 = [(MapsSunsetSunriseObserver *)self locationManager];
  unsigned int v4 = [v3 hasLocation];

  v5 = sub_10009D24C();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      [(MapsSunsetSunriseObserver *)self offsetThreshold];
      int v17 = 134349312;
      v18 = self;
      __int16 v19 = 2048;
      CFStringRef v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Calculating sunset/sunrise state with offset threshold: %f", (uint8_t *)&v17, 0x16u);
    }

    v8 = [(MapsSunsetSunriseObserver *)self sunsetSunriseCalculator];
    __int16 v9 = [(MapsSunsetSunriseObserver *)self locationManager];
    v10 = [v9 lastLocation];
    [(MapsSunsetSunriseObserver *)self offsetThreshold];
    id v11 = [v8 currentStateForLocation:v10];

    id v12 = sub_10009D24C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      if ((unint64_t)(v11 - 1) > 3) {
        CFStringRef v13 = @"Unknown";
      }
      else {
        CFStringRef v13 = off_101322A88[(void)(v11 - 1)];
      }
      int v17 = 134349314;
      v18 = self;
      __int16 v19 = 2112;
      CFStringRef v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[%{public}p] Calculated sunset/sunrise state: %@", (uint8_t *)&v17, 0x16u);
    }

    [(MapsSunsetSunriseObserver *)self setCurrentState:v11];
    v14 = +[NSDate date];
    [(MapsSunsetSunriseObserver *)self setLastCheckTime:v14];

    v15 = [(MapsSunsetSunriseObserver *)self locationManager];
    id v16 = [v15 lastLocation];
    [(MapsSunsetSunriseObserver *)self setLastCheckLocation:v16];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v17 = 134349056;
      v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] No location estimate available; cannot calculate sunset/sunrise state",
        (uint8_t *)&v17,
        0xCu);
    }

    [(MapsSunsetSunriseObserver *)self setCurrentState:0];
    [(MapsSunsetSunriseObserver *)self setLastCheckLocation:0];
  }
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
}

- (SunsetSunriseCalculator)sunsetSunriseCalculator
{
  return self->_sunsetSunriseCalculator;
}

- (void)setCurrentState:(int64_t)a3
{
  if (self->_currentState != a3)
  {
    self->_currentState = a3;
    id v4 = [(MapsSunsetSunriseObserver *)self observers];
    [v4 sunsetSunriseObserver:self didUpdateState:self->_currentState];
  }
}

- (double)offsetThreshold
{
  return self->_offsetThreshold;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  v5 = sub_10009D24C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134349314;
    v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Registering observer: %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = [(MapsSunsetSunriseObserver *)self observers];
  [v6 registerObserver:v4];
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setOffsetThreshold:(double)a3
{
  self->_offsetThreshold = a3;
}

- (void)setMinimumTimeThreshold:(double)a3
{
  self->_minimumTimeThreshold = a3;
}

- (void)setMinimumDistanceThreshold:(double)a3
{
  self->_minimumDistanceThreshold = a3;
}

- (void)setLastCheckTime:(id)a3
{
}

- (void)setLastCheckLocation:(id)a3
{
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (MapsSunsetSunriseObserver)initWithLocationManager:(id)a3 sunsetSunriseCalculator:(id)a4 platformController:(id)a5
{
  return [(MapsSunsetSunriseObserver *)self initWithLocationManager:a3 sunsetSunriseCalculator:a4 platformController:a5 transportTypeSupportProvider:0];
}

- (void)dealloc
{
  v3 = sub_10009D24C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    int v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  [(MKLocationManager *)self->_locationManager stopListeningForLocationUpdates:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);
  [WeakRetained removeObserver:self];

  [(NavigationSession *)self->_navigationSession removeObserver:self];
  [(RoutePlanningSession *)self->_routePlanningSession removeObserver:self];
  v5.receiver = self;
  v5.super_class = (Class)MapsSunsetSunriseObserver;
  [(MapsSunsetSunriseObserver *)&v5 dealloc];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  objc_super v5 = sub_10009D24C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134349314;
    v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Unregistering observer: %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = [(MapsSunsetSunriseObserver *)self observers];
  [v6 unregisterObserver:v4];
}

- (int64_t)_currentTransportType
{
  v3 = [(MapsSunsetSunriseObserver *)self routePlanningSession];

  if (v3)
  {
    id v4 = [(MapsSunsetSunriseObserver *)self routePlanningSession];
LABEL_5:
    v6 = v4;
    id v7 = [v4 currentTransportType];

    return (int64_t)v7;
  }
  objc_super v5 = [(MapsSunsetSunriseObserver *)self navigationSession];

  if (v5)
  {
    id v4 = [(MapsSunsetSunriseObserver *)self navigationSession];
    goto LABEL_5;
  }
  return 0;
}

- (BOOL)_shouldCalculateState
{
  uint64_t v3 = [(MapsSunsetSunriseObserver *)self lastCheckLocation];
  if (v3
    && (id v4 = (void *)v3,
        [(MapsSunsetSunriseObserver *)self lastCheckTime],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    if (![(MapsSunsetSunriseObserver *)self transportTypeSupportProvider])
    {
LABEL_18:
      id v12 = [(MapsSunsetSunriseObserver *)self lastCheckTime];
      [v12 timeIntervalSinceNow];
      double v14 = v13;
      v15 = [(MapsSunsetSunriseObserver *)self lastCheckTime];
      [v15 timeIntervalSinceNow];
      double v17 = v16;

      v18 = [(MapsSunsetSunriseObserver *)self locationManager];
      __int16 v9 = [v18 lastLocation];

      [v9 coordinate];
      [v9 coordinate];
      __int16 v19 = [(MapsSunsetSunriseObserver *)self lastCheckLocation];
      [v19 coordinate];
      CFStringRef v20 = [(MapsSunsetSunriseObserver *)self lastCheckLocation];
      [v20 coordinate];
      CLClientGetDistanceCoordinates();
      double v22 = v21;

      [(MapsSunsetSunriseObserver *)self minimumDistanceThreshold];
      if (v22 >= v23)
      {
        BOOL v10 = 1;
      }
      else
      {
        if (v14 >= 0.0) {
          double v24 = v17;
        }
        else {
          double v24 = -v17;
        }
        [(MapsSunsetSunriseObserver *)self minimumTimeThreshold];
        BOOL v10 = v24 >= v25;
      }
      v26 = sub_10009D24C();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v27 = @"NO";
        if (v10) {
          v27 = @"YES";
        }
        objc_super v28 = v27;
        int v30 = 134349314;
        v31 = self;
        __int16 v32 = 2112;
        CFStringRef v33 = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "[%{public}p] shouldCalculateState %@", (uint8_t *)&v30, 0x16u);
      }
      goto LABEL_29;
    }
    int64_t v6 = [(MapsSunsetSunriseObserver *)self _currentTransportType];
    if (!v6
      || ([(objc_class *)[(MapsSunsetSunriseObserver *)self transportTypeSupportProvider] isSupportedForTransportType:v6] & 1) != 0)
    {
      id v7 = sub_10009D24C();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        if ((unint64_t)(v6 - 1) > 4) {
          CFStringRef v8 = @"Undefined";
        }
        else {
          CFStringRef v8 = off_101322AC8[v6 - 1];
        }
        int v30 = 134349314;
        v31 = self;
        __int16 v32 = 2112;
        CFStringRef v33 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] Current transport type (%@) is supported", (uint8_t *)&v30, 0x16u);
      }

      goto LABEL_18;
    }
    __int16 v9 = sub_10009D24C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      if ((unint64_t)(v6 - 2) > 3) {
        CFStringRef v11 = @"Drive";
      }
      else {
        CFStringRef v11 = off_101322AA8[v6 - 2];
      }
      int v30 = 134349314;
      v31 = self;
      __int16 v32 = 2112;
      CFStringRef v33 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] Current transport type (%@) is NOT supported", (uint8_t *)&v30, 0x16u);
    }
    LOBYTE(v10) = 0;
  }
  else
  {
    __int16 v9 = sub_10009D24C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v30 = 134349056;
      v31 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] Initial state check", (uint8_t *)&v30, 0xCu);
    }
    LOBYTE(v10) = 1;
  }
LABEL_29:

  return v10;
}

- (id)_sunset
{
  uint64_t v3 = [(MapsSunsetSunriseObserver *)self sunsetSunriseCalculator];
  id v4 = [(MapsSunsetSunriseObserver *)self locationManager];
  objc_super v5 = [v4 lastLocation];
  int64_t v6 = [v3 _sunsetForLocation:v5];

  return v6;
}

- (id)_sunrise
{
  uint64_t v3 = [(MapsSunsetSunriseObserver *)self sunsetSunriseCalculator];
  id v4 = [(MapsSunsetSunriseObserver *)self locationManager];
  objc_super v5 = [v4 lastLocation];
  int64_t v6 = [v3 _sunriseForLocation:v5];

  return v6;
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  if ([(MapsSunsetSunriseObserver *)self _shouldCalculateState])
  {
    [(MapsSunsetSunriseObserver *)self _calculateState];
  }
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  [(MapsSunsetSunriseObserver *)self setNavigationSession:v8];

  id v11 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v9 = v11;
  }
  else {
    __int16 v9 = 0;
  }
  id v10 = v9;

  [(MapsSunsetSunriseObserver *)self setRoutePlanningSession:v10];
  if ([(MapsSunsetSunriseObserver *)self _shouldCalculateState]) {
    [(MapsSunsetSunriseObserver *)self _calculateState];
  }
}

- (void)navigationSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4
{
  if ([(MapsSunsetSunriseObserver *)self _shouldCalculateState])
  {
    [(MapsSunsetSunriseObserver *)self _calculateState];
  }
}

- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5
{
  if ([(MapsSunsetSunriseObserver *)self _shouldCalculateState])
  {
    [(MapsSunsetSunriseObserver *)self _calculateState];
  }
}

- (double)minimumTimeThreshold
{
  return self->_minimumTimeThreshold;
}

- (double)minimumDistanceThreshold
{
  return self->_minimumDistanceThreshold;
}

- (void)setLocationManager:(id)a3
{
}

- (void)setSunsetSunriseCalculator:(id)a3
{
}

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (void)setPlatformController:(id)a3
{
}

- (Class)transportTypeSupportProvider
{
  return self->_transportTypeSupportProvider;
}

- (void)setTransportTypeSupportProvider:(Class)a3
{
}

- (NavigationSession)navigationSession
{
  return self->_navigationSession;
}

- (RoutePlanningSession)routePlanningSession
{
  return self->_routePlanningSession;
}

- (CLLocation)lastCheckLocation
{
  return self->_lastCheckLocation;
}

- (NSDate)lastCheckTime
{
  return self->_lastCheckTime;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_lastCheckTime, 0);
  objc_storeStrong((id *)&self->_lastCheckLocation, 0);
  objc_storeStrong((id *)&self->_routePlanningSession, 0);
  objc_storeStrong((id *)&self->_navigationSession, 0);
  objc_storeStrong((id *)&self->_transportTypeSupportProvider, 0);
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong((id *)&self->_sunsetSunriseCalculator, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end