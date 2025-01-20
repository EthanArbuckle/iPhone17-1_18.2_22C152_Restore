@interface CARDNDGeofencingObserver
- (BOOL)_shouldCreateGeofences;
- (BOOL)activelyMonitoringGeofences;
- (BOOL)currentlyInRegion;
- (BOOL)didCreateGeofenceAroundStart;
- (BOOL)exitConfirmationActive;
- (BOOL)exitConfirmationOverride;
- (BOOL)isCurrentlyInsideGeofence;
- (BOOL)isDNDActive;
- (BOOL)locationServicesEnabled;
- (BOOL)shouldCreateGeofenceAroundStart;
- (CARDNDGeofencingObserver)init;
- (CARDNDGeofencingObserver)initWithRoutineManager:(id)a3 locationManager:(id)a4 wiFiManager:(id)a5;
- (CARDNDGeofencingObserverDelegate)delegate;
- (CLLocationManager)locationManager;
- (CRWiFiCarManager)wiFiManager;
- (NSArray)monitoredRegions;
- (RTRoutineManager)routineManager;
- (id)_addCoordinatesToMonitoredRegion:(CLLocationCoordinate2D)a3 identifier:(id)a4 radius:(unint64_t)a5;
- (void)_checkWiFiPowerForGeofences;
- (void)_createGeofenceForLOI:(id)a3;
- (void)_createGeofencesAroundHomeAndWork;
- (void)_createGeofencesAroundPredictedLocationsFromLocation:(id)a3;
- (void)_postNotificationForGeofence;
- (void)_updateState:(int64_t)a3 forRegion:(id)a4;
- (void)beginMonitoringLOIsWithStartingLocationGeofence:(BOOL)a3;
- (void)dealloc;
- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5;
- (void)locationManager:(id)a3 didEnterRegion:(id)a4;
- (void)locationManager:(id)a3 didExitRegion:(id)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)setActivelyMonitoringGeofences:(BOOL)a3;
- (void)setDNDActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDidCreateGeofenceAroundStart:(BOOL)a3;
- (void)setExitConfirmationActive:(BOOL)a3;
- (void)setExitConfirmationOverride:(BOOL)a3;
- (void)setIsCurrentlyInsideGeofence:(BOOL)a3;
- (void)setLocationManager:(id)a3;
- (void)setLocationServicesEnabled:(BOOL)a3;
- (void)setMonitoredRegions:(id)a3;
- (void)setRoutineManager:(id)a3;
- (void)setShouldCreateGeofenceAroundStart:(BOOL)a3;
- (void)setWiFiManager:(id)a3;
- (void)stopMonitoringLOIs;
@end

@implementation CARDNDGeofencingObserver

- (CARDNDGeofencingObserver)init
{
  v3 = [CARDNDGeofencingObserver alloc];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v4 = (void *)qword_1000E3858;
  uint64_t v18 = qword_1000E3858;
  if (!qword_1000E3858)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100014578;
    v14[3] = &unk_1000BD318;
    v14[4] = &v15;
    sub_100014578((uint64_t)v14);
    v4 = (void *)v16[3];
  }
  v5 = v4;
  _Block_object_dispose(&v15, 8);
  id v6 = objc_alloc_init(v5);
  id v7 = objc_alloc((Class)CLLocationManager);
  v8 = CRAutomaticDNDLocationBundle();
  id v9 = [v7 initWithEffectiveBundle:v8];
  v10 = objc_alloc_init(CRWiFiCarManager);
  v11 = [(CARDNDGeofencingObserver *)v3 initWithRoutineManager:v6 locationManager:v9 wiFiManager:v10];

  v12 = CarDNDWDLogging();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Geofencing observer initialized", (uint8_t *)v14, 2u);
  }

  return v11;
}

- (CARDNDGeofencingObserver)initWithRoutineManager:(id)a3 locationManager:(id)a4 wiFiManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CARDNDGeofencingObserver;
  v11 = [(CARDNDGeofencingObserver *)&v19 init];
  v12 = v11;
  if (v11)
  {
    [(CARDNDGeofencingObserver *)v11 setRoutineManager:v8];
    [(CARDNDGeofencingObserver *)v12 setLocationManager:v9];
    v13 = [(CARDNDGeofencingObserver *)v12 locationManager];
    [v13 setDelegate:v12];

    v14 = [(CARDNDGeofencingObserver *)v12 locationManager];
    [v14 setDesiredAccuracy:kCLLocationAccuracyHundredMeters];

    [(CARDNDGeofencingObserver *)v12 setWiFiManager:v10];
    uint64_t v15 = +[NSArray array];
    monitoredRegions = v12->_monitoredRegions;
    v12->_monitoredRegions = (NSArray *)v15;

    v12->_exitConfirmationOverride = 0;
    v12->_locationServicesEnabled = CRAutomaticDNDLocationServicesEnabled();
    uint64_t v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v12 selector:"_checkWiFiPowerForGeofences" name:@"CRWiFiPowerChangedNotification" object:0];
  }
  return v12;
}

- (void)dealloc
{
  [(CARDNDGeofencingObserver *)self stopMonitoringLOIs];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CARDNDGeofencingObserver;
  [(CARDNDGeofencingObserver *)&v4 dealloc];
}

- (void)beginMonitoringLOIsWithStartingLocationGeofence:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = [(CARDNDGeofencingObserver *)self _shouldCreateGeofences];
  id v6 = CarDNDWDLogging();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Beginning to fetch LOIs for geofencing", buf, 2u);
    }

    [(CARDNDGeofencingObserver *)self setActivelyMonitoringGeofences:1];
    [(CARDNDGeofencingObserver *)self setShouldCreateGeofenceAroundStart:v3];
    if ([(CARDNDGeofencingObserver *)self shouldCreateGeofenceAroundStart]
      && ![(CARDNDGeofencingObserver *)self didCreateGeofenceAroundStart])
    {
      id v8 = [(CARDNDGeofencingObserver *)self locationManager];
      id v9 = [v8 location];

      if (v9
        && ([v9 horizontalAccuracy], v10 < 400.0)
        && ([v9 timestamp],
            v11 = objc_claimAutoreleasedReturnValue(),
            [v11 timeIntervalSinceNow],
            double v13 = fabs(v12),
            v11,
            v13 <= 30.0))
      {
        uint64_t v15 = CarDNDWDLogging();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v18 = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Creating geofence around start location using cached location", v18, 2u);
        }

        [v9 coordinate];
        v14 = -[CARDNDGeofencingObserver _addCoordinatesToMonitoredRegion:identifier:radius:](self, "_addCoordinatesToMonitoredRegion:identifier:radius:", @"Start Identifier", 100);
        [v14 setRegionState:1];
        [(CARDNDGeofencingObserver *)self setDidCreateGeofenceAroundStart:1];
        [(CARDNDGeofencingObserver *)self setIsCurrentlyInsideGeofence:1];
        [(CARDNDGeofencingObserver *)self _createGeofencesAroundPredictedLocationsFromLocation:v9];
      }
      else
      {
        v14 = CarDNDWDLogging();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v17 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No start location geofence created, location manager doesn't have cached location or accuracy does not qualify", v17, 2u);
        }
      }
    }
    [(CARDNDGeofencingObserver *)self _postNotificationForGeofence];
    [(CARDNDGeofencingObserver *)self _createGeofencesAroundHomeAndWork];
    v16 = [(CARDNDGeofencingObserver *)self locationManager];
    [v16 startMonitoringSignificantLocationChanges];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not setting up geofences; posting exit confirmation.",
        v20,
        2u);
    }

    [(CARDNDGeofencingObserver *)self _postNotificationForGeofence];
  }
}

- (void)stopMonitoringLOIs
{
  BOOL v3 = CarDNDWDLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stop fetching LOIs for geofencing", buf, 2u);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_super v4 = [(CARDNDGeofencingObserver *)self monitoredRegions];
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v8);
        double v10 = [(CARDNDGeofencingObserver *)self locationManager];
        v11 = [v9 region];
        [v10 stopMonitoringForRegion:v11];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v6);
  }

  [(CARDNDGeofencingObserver *)self setDidCreateGeofenceAroundStart:0];
  [(CARDNDGeofencingObserver *)self setShouldCreateGeofenceAroundStart:0];
  [(CARDNDGeofencingObserver *)self setIsCurrentlyInsideGeofence:0];
  [(CARDNDGeofencingObserver *)self setActivelyMonitoringGeofences:0];
  double v12 = +[NSArray array];
  [(CARDNDGeofencingObserver *)self setMonitoredRegions:v12];

  double v13 = CarDNDWDLogging();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Geofences cleared", buf, 2u);
  }

  v14 = [(CARDNDGeofencingObserver *)self locationManager];
  [v14 stopMonitoringSignificantLocationChanges];

  uint64_t v15 = [(CARDNDGeofencingObserver *)self locationManager];
  [v15 stopUpdatingLocation];

  [(CARDNDGeofencingObserver *)self _postNotificationForGeofence];
}

- (BOOL)currentlyInRegion
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(CARDNDGeofencingObserver *)self monitoredRegions];
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) regionState] == (id)1)
        {
          id v8 = CarDNDWDLogging();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
            sub_10006FDC4();
          }

          BOOL v7 = 1;
          goto LABEL_15;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  v2 = CarDNDWDLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Not in any monitored regions", v10, 2u);
  }
  BOOL v7 = 0;
LABEL_15:

  return v7;
}

- (void)setExitConfirmationOverride:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = CarDNDWDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSNumber numberWithBool:v3];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting exit confirmation override %@", (uint8_t *)&v7, 0xCu);
  }
  if (self->_exitConfirmationOverride != v3)
  {
    self->_exitConfirmationOverride = v3;
    [(CARDNDGeofencingObserver *)self _postNotificationForGeofence];
  }
}

- (id)_addCoordinatesToMonitoredRegion:(CLLocationCoordinate2D)a3 identifier:(id)a4 radius:(unint64_t)a5
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v9 = a4;
  double v10 = objc_alloc_init(_CARDNDRegion);
  id v11 = [objc_alloc((Class)CLCircularRegion) initWithCenter:v9 radius:latitude longitude:longitude identifier:a5];
  [(_CARDNDRegion *)v10 setRegion:v11];

  long long v12 = CarDNDWDLogging();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10006FE78(v12, latitude, longitude);
  }

  long long v13 = CarDNDWDLogging();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Creating geofence for [%@]", (uint8_t *)&v19, 0xCu);
  }

  long long v14 = [(CARDNDGeofencingObserver *)self monitoredRegions];
  uint64_t v15 = [v14 arrayByAddingObject:v10];
  [(CARDNDGeofencingObserver *)self setMonitoredRegions:v15];

  long long v16 = [(CARDNDGeofencingObserver *)self locationManager];
  long long v17 = [(_CARDNDRegion *)v10 region];
  [v16 startMonitoringForRegion:v17];

  return v10;
}

- (void)_postNotificationForGeofence
{
  if (![(CARDNDGeofencingObserver *)self exitConfirmationOverride])
  {
    if ([(CARDNDGeofencingObserver *)self isDNDActive])
    {
      int v7 = [(CARDNDGeofencingObserver *)self wiFiManager];
      unsigned __int8 v8 = [v7 isPowered];

      if ((v8 & 1) == 0)
      {
        BOOL v3 = CarDNDWDLogging();
        if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_5;
        }
        __int16 v20 = 0;
        id v4 = "Posting Exit Confirmation Enabled because WiFi is powered off.";
        uint64_t v5 = (uint8_t *)&v20;
        goto LABEL_4;
      }
      if (![(CARDNDGeofencingObserver *)self locationServicesEnabled])
      {
        BOOL v3 = CarDNDWDLogging();
        if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_5;
        }
        __int16 v19 = 0;
        id v4 = "Posting Exit Confirmation Enabled because Location Services are disabled";
        uint64_t v5 = (uint8_t *)&v19;
        goto LABEL_4;
      }
      if (![(CARDNDGeofencingObserver *)self activelyMonitoringGeofences])
      {
        BOOL v3 = CarDNDWDLogging();
        if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        __int16 v18 = 0;
        id v11 = "Posting Exit Confirmation Disabled because we are not monitoring geofences";
        long long v12 = (uint8_t *)&v18;
        goto LABEL_15;
      }
      unsigned int v9 = [(CARDNDGeofencingObserver *)self isCurrentlyInsideGeofence];
      BOOL v3 = CarDNDWDLogging();
      BOOL v10 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
      if (!v9)
      {
        if (!v10) {
          goto LABEL_5;
        }
        LOWORD(v16) = 0;
        id v4 = "Posting Exit Confirmation Enabled because we are not in a geofence";
        uint64_t v5 = (uint8_t *)&v16;
        goto LABEL_4;
      }
      if (v10)
      {
        __int16 v17 = 0;
        id v11 = "Posting Exit Confirmation Disabled because we are in a geofence";
        long long v12 = (uint8_t *)&v17;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
      }
    }
    else
    {
      BOOL v3 = CarDNDWDLogging();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        id v11 = "Posting Exit Confirmation Disabled because the Driving mode is not active";
        long long v12 = v21;
        goto LABEL_15;
      }
    }
LABEL_16:
    id v6 = (CFStringRef *)&CARAutomaticDNDExitConfirmationDisabledNotification;
    goto LABEL_17;
  }
  BOOL v3 = CarDNDWDLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v4 = "Posting Exit Confirmation Enabled because of override.";
    uint64_t v5 = buf;
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
  }
LABEL_5:
  id v6 = (CFStringRef *)&CARAutomaticDNDExitConfirmationEnabledNotification;
LABEL_17:

  CFStringRef v13 = *v6;
  BOOL v14 = CFEqual(*v6, CARAutomaticDNDExitConfirmationEnabledNotification);
  -[CARDNDGeofencingObserver setExitConfirmationActive:](self, "setExitConfirmationActive:", v14, v16);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v13, 0, 0, 1u);
}

- (void)_updateState:(int64_t)a3 forRegion:(id)a4
{
  id v5 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [(CARDNDGeofencingObserver *)self monitoredRegions];
  id v6 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v31;
    *(void *)&long long v7 = 138413058;
    long long v27 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v12 = [v11 region:v27];
        CFStringRef v13 = [v12 identifier];
        BOOL v14 = [v5 identifier];
        unsigned int v15 = [v13 isEqualToString:v14];

        if (v15)
        {
          uint64_t v16 = CarDNDWDLogging();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            v23 = [v5 identifier];
            [v5 center];
            int64_t v25 = v24;
            [v5 center];
            *(_DWORD *)buf = v27;
            v35 = v23;
            __int16 v36 = 2048;
            int64_t v37 = v25;
            __int16 v38 = 2048;
            uint64_t v39 = v26;
            __int16 v40 = 2048;
            int64_t v41 = a3;
            _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Updating region state for [%@] lat/long: {%f, %f}: %ld", buf, 0x2Au);
          }
          __int16 v17 = CarDNDWDLogging();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v18 = [v5 identifier];
            *(_DWORD *)buf = 138412546;
            v35 = v18;
            __int16 v36 = 2048;
            int64_t v37 = a3;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Updating region state for geofence [%@]: %ld", buf, 0x16u);
          }
          [v11 setRegionState:a3];
          BOOL v19 = [(CARDNDGeofencingObserver *)self currentlyInRegion];
          if (v19 != [(CARDNDGeofencingObserver *)self isCurrentlyInsideGeofence])
          {
            [(CARDNDGeofencingObserver *)self setIsCurrentlyInsideGeofence:v19];
            [(CARDNDGeofencingObserver *)self _postNotificationForGeofence];
          }
          __int16 v20 = [(CARDNDGeofencingObserver *)self delegate];
          char v21 = objc_opt_respondsToSelector();

          if (v21)
          {
            v22 = [(CARDNDGeofencingObserver *)self delegate];
            [v22 geofencingObserver:self didUpdateRegionState:a3];
          }
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v8);
  }
}

- (void)_createGeofenceForLOI:(id)a3
{
  id v4 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v26 = self;
  id v5 = [(CARDNDGeofencingObserver *)self monitoredRegions];
  id v6 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v28;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = [*(id *)(*((void *)&v27 + 1) + 8 * i) region];
        id v11 = [v10 identifier];
        long long v12 = [v4 identifier];
        CFStringRef v13 = [v12 UUIDString];
        unsigned __int8 v14 = [v11 isEqualToString:v13];

        if (v14)
        {

          __int16 v17 = CarDNDWDLogging();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            sub_10006FFB4();
          }
          goto LABEL_15;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  unsigned int v15 = [(CARDNDGeofencingObserver *)v26 monitoredRegions];
  id v16 = [v15 count];

  if ((unint64_t)v16 > 0x13)
  {
    __int16 v17 = CarDNDWDLogging();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_10006FF00();
    }
  }
  else
  {
    __int16 v17 = [v4 location];
    [v17 latitude];
    CLLocationDegrees v19 = v18;
    __int16 v20 = [v4 location];
    [v20 longitude];
    CLLocationCoordinate2D v22 = CLLocationCoordinate2DMake(v19, v21);
    v23 = [v4 identifier];
    int64_t v24 = [v23 UUIDString];
    id v25 = -[CARDNDGeofencingObserver _addCoordinatesToMonitoredRegion:identifier:radius:](v26, "_addCoordinatesToMonitoredRegion:identifier:radius:", v24, 400, v22.latitude, v22.longitude);
  }
LABEL_15:
}

- (void)_createGeofencesAroundPredictedLocationsFromLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(CARDNDGeofencingObserver *)self routineManager];
  id v6 = +[NSDate date];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001312C;
  v7[3] = &unk_1000BD4A0;
  v7[4] = self;
  [v5 fetchNextPredictedLocationsOfInterestFromLocation:v4 startDate:v6 timeInterval:v7 withHandler:28800.0];
}

- (void)_createGeofencesAroundHomeAndWork
{
  BOOL v3 = CarDNDWDLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Fetching home LOI", buf, 2u);
  }

  id v4 = [(CARDNDGeofencingObserver *)self routineManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000134B8;
  v8[3] = &unk_1000BD4A0;
  v8[4] = self;
  [v4 fetchLocationsOfInterestOfType:0 withHandler:v8];

  id v5 = CarDNDWDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Fetching work LOI", buf, 2u);
  }

  id v6 = [(CARDNDGeofencingObserver *)self routineManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013704;
  v7[3] = &unk_1000BD4A0;
  v7[4] = self;
  [v6 fetchLocationsOfInterestOfType:1 withHandler:v7];
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000139C4;
  block[3] = &unk_1000BD1B0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  [a4 lastObject:a3];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013B78;
  v6[3] = &unk_1000BD3A8;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = self;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  id v4 = a4;
  id v5 = CarDNDWDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100070068();
  }

  id v6 = CarDNDWDLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 identifier];
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Begin monitoring for [%@]", (uint8_t *)&v8, 0xCu);
  }
}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  id v5 = a4;
  id v6 = CarDNDWDLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000700F4();
  }

  id v7 = CarDNDWDLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v5 identifier];
    *(_DWORD *)buf = 138412290;
    CFStringRef v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Entered region for [%@]", buf, 0xCu);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100013FA4;
  v10[3] = &unk_1000BD3A8;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  id v5 = a4;
  id v6 = CarDNDWDLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100070180();
  }

  id v7 = CarDNDWDLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v5 identifier];
    *(_DWORD *)buf = 138412290;
    CFStringRef v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Exited region for [%@]", buf, 0xCu);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100014114;
  v10[3] = &unk_1000BD3A8;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  id v7 = a5;
  int v8 = CarDNDWDLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 identifier];
    *(_DWORD *)buf = 138412546;
    unsigned int v15 = v9;
    __int16 v16 = 2048;
    int64_t v17 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Determined state for [%@]: %ld", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014274;
  block[3] = &unk_1000BD4C8;
  id v12 = v7;
  int64_t v13 = a4;
  block[4] = self;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  id v5 = CarDNDWDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    sub_10007020C((uint64_t)v4, v5);
  }
}

- (BOOL)_shouldCreateGeofences
{
  if ([(CARDNDGeofencingObserver *)self locationServicesEnabled])
  {
    BOOL v3 = [(CARDNDGeofencingObserver *)self wiFiManager];
    unsigned __int8 v4 = [v3 isPowered];

    if (v4) {
      return 1;
    }
    id v6 = CarDNDWDLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      id v7 = "WiFi is powered off.";
      int v8 = (uint8_t *)&v9;
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = CarDNDWDLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      id v7 = "Location services are not enabled.";
      int v8 = (uint8_t *)&v10;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }

  return 0;
}

- (void)_checkWiFiPowerForGeofences
{
  BOOL v3 = [(CARDNDGeofencingObserver *)self wiFiManager];
  unsigned __int8 v4 = [v3 isPowered];

  if ((v4 & 1) == 0)
  {
    [(CARDNDGeofencingObserver *)self stopMonitoringLOIs];
  }
}

- (BOOL)isDNDActive
{
  return self->_DNDActive;
}

- (void)setDNDActive:(BOOL)a3
{
  self->_DNDActive = a3;
}

- (CARDNDGeofencingObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CARDNDGeofencingObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)didCreateGeofenceAroundStart
{
  return self->_didCreateGeofenceAroundStart;
}

- (void)setDidCreateGeofenceAroundStart:(BOOL)a3
{
  self->_didCreateGeofenceAroundStart = a3;
}

- (BOOL)shouldCreateGeofenceAroundStart
{
  return self->_shouldCreateGeofenceAroundStart;
}

- (void)setShouldCreateGeofenceAroundStart:(BOOL)a3
{
  self->_shouldCreateGeofenceAroundStart = a3;
}

- (BOOL)isCurrentlyInsideGeofence
{
  return self->_isCurrentlyInsideGeofence;
}

- (void)setIsCurrentlyInsideGeofence:(BOOL)a3
{
  self->_isCurrentlyInsideGeofence = a3;
}

- (BOOL)activelyMonitoringGeofences
{
  return self->_activelyMonitoringGeofences;
}

- (void)setActivelyMonitoringGeofences:(BOOL)a3
{
  self->_activelyMonitoringGeofences = a3;
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)setRoutineManager:(id)a3
{
}

- (BOOL)exitConfirmationActive
{
  return self->_exitConfirmationActive;
}

- (void)setExitConfirmationActive:(BOOL)a3
{
  self->_exitConfirmationActive = a3;
}

- (BOOL)locationServicesEnabled
{
  return self->_locationServicesEnabled;
}

- (void)setLocationServicesEnabled:(BOOL)a3
{
  self->_locationServicesEnabled = a3;
}

- (NSArray)monitoredRegions
{
  return self->_monitoredRegions;
}

- (void)setMonitoredRegions:(id)a3
{
}

- (CRWiFiCarManager)wiFiManager
{
  return self->_wiFiManager;
}

- (void)setWiFiManager:(id)a3
{
}

- (BOOL)exitConfirmationOverride
{
  return self->_exitConfirmationOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wiFiManager, 0);
  objc_storeStrong((id *)&self->_monitoredRegions, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end