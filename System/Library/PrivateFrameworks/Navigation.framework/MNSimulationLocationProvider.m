@interface MNSimulationLocationProvider
- (BOOL)coarseModeEnabled;
- (BOOL)isAuthorized;
- (BOOL)isTracePlayer;
- (MNLocationProviderDelegate)delegate;
- (MNSimulationLocationProvider)initWithSimulationParameters:(id)a3 alternateRouteInfos:(id)a4;
- (MNSimulationLocationProvider)initWithStartNavigationDetails:(id)a3;
- (NSBundle)effectiveBundle;
- (NSString)effectiveBundleIdentifier;
- (double)expectedGpsUpdateInterval;
- (double)speedOverride;
- (double)timeScale;
- (double)updateIntervalSpeedMultiplier;
- (int)headingOrientation;
- (unint64_t)traceVersion;
- (void)_resetLocationUpdateInterval;
- (void)_sendLocationUpdate:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setSpeedOverride:(double)a3;
- (void)setUpdateIntervalSpeedMultiplier:(double)a3;
- (void)startMonitoringForRegion:(id)a3;
- (void)startUpdatingLocation;
- (void)stopMonitoringForRegion:(id)a3;
- (void)stopUpdatingLocation;
- (void)updatePosition:(double)a3;
- (void)updateWithRouteInfo:(id)a3 rerouteReason:(unint64_t)a4;
@end

@implementation MNSimulationLocationProvider

- (MNSimulationLocationProvider)initWithSimulationParameters:(id)a3 alternateRouteInfos:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)MNSimulationLocationProvider;
  v8 = [(MNSimulationLocationProvider *)&v42 init];
  if (v8)
  {
    uint64_t v9 = [v6 simulationType];
    v8->_simulationType = v9;
    if (v9 == 3 && [v7 count])
    {
      v10 = [v7 firstObject];
      if ((unint64_t)[v7 count] >= 2)
      {
        v33 = v8;
        id v34 = v6;
        v37 = objc_alloc_init(MNRouteDivergenceFinder);
        v11 = [v10 route];
        [v11 endRouteCoordinate];

        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v32 = v7;
        id obj = v7;
        uint64_t v12 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v36 = *(void *)v39;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v39 != v36) {
                objc_enumerationMutation(obj);
              }
              v15 = *(void **)(*((void *)&v38 + 1) + 8 * v14);
              v16 = objc_msgSend(v10, "route", v32);
              v17 = [v15 route];
              v18 = [(MNRouteDivergenceFinder *)v37 findFirstDivergenceBetweenRoute:v16 andRoute:v17];
              v19 = [v18 firstObject];
              [v19 routeCoordinate];

              if (GEOPolylineCoordinateIsABeforeB())
              {
                id v20 = v15;

                v10 = v20;
              }
              ++v14;
            }
            while (v13 != v14);
            uint64_t v13 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
          }
          while (v13);
        }

        v8 = v33;
        id v6 = v34;
        id v7 = v32;
      }
      v21 = MNGetMNNavigationSimulationLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [v10 route];
        v23 = [v22 name];
        *(_DWORD *)buf = 138412290;
        v44 = v23;
      }
      [v6 setInitialRoute:v10];
    }
    v24 = [[MNSimulatedLocationGenerator alloc] initWithSimulationParameters:v6];
    locationGenerator = v8->_locationGenerator;
    v8->_locationGenerator = v24;

    [(MNSimulatedLocationGenerator *)v8->_locationGenerator setEndAtFinalDestination:0];
    v8->_simulateGeoFences = 0;
    uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
    monitoredGeoFences = v8->_monitoredGeoFences;
    v8->_monitoredGeoFences = (NSMutableArray *)v26;

    uint64_t v28 = [MEMORY[0x1E4F1CA48] array];
    currentGeoFences = v8->_currentGeoFences;
    v8->_currentGeoFences = (NSMutableArray *)v28;

    v8->_updateIntervalSpeedMultiplier = 1.0;
    v30 = v8;
  }

  return v8;
}

- (MNSimulationLocationProvider)initWithStartNavigationDetails:(id)a3
{
  id v4 = a3;
  v5 = [v4 tracePlaybackPath];

  if (v5 || (unint64_t)([v4 simulationType] + 1) < 2)
  {
    id v6 = 0;
  }
  else
  {
    id v7 = [v4 routes];
    v8 = (void *)[v7 count];

    uint64_t v9 = 0;
    if (v8)
    {
      v8 = 0;
      unint64_t v10 = 0;
      do
      {
        v11 = [v4 routes];
        uint64_t v12 = [v11 objectAtIndexedSubscript:v10];

        uint64_t v13 = [v4 selectedRouteIndex];
        uint64_t v14 = [[MNActiveRouteInfo alloc] initWithRoute:v12];
        v15 = v14;
        if (v10 == v13)
        {
          v16 = v14;

          uint64_t v9 = v16;
        }
        else
        {
          if (!v8) {
            v8 = objc_opt_new();
          }
          [v8 addObject:v15];
        }

        ++v10;
        v17 = [v4 routes];
        unint64_t v18 = [v17 count];
      }
      while (v10 < v18);
    }
    v19 = objc_opt_new();
    objc_msgSend(v19, "setSimulationType:", objc_msgSend(v4, "simulationType"));
    [v19 setInitialRoute:v9];
    id v20 = [(MNActiveRouteInfo *)v9 route];
    BOOL v21 = [v20 source] != 1;

    v22 = [MNSuggestedNavigationModeFinder alloc];
    v23 = [(MNActiveRouteInfo *)v9 route];
    v24 = [(MNSuggestedNavigationModeFinder *)v22 initWithRoute:v23 context:v21];

    v25 = [v4 initialUserLocation];
    uint64_t v26 = [(MNSuggestedNavigationModeFinder *)v24 suggestedNavigationModeForLocation:v25];

    if (v26 == 1)
    {
      v27 = [v4 initialUserLocation];
      [v19 setStartingLocation:v27];
    }
    self = [(MNSimulationLocationProvider *)self initWithSimulationParameters:v19 alternateRouteInfos:v8];

    id v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(NSTimer *)self->_locationUpdateTimer invalidate];
  locationUpdateTimer = self->_locationUpdateTimer;
  self->_locationUpdateTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)MNSimulationLocationProvider;
  [(MNSimulationLocationProvider *)&v4 dealloc];
}

- (void)updateWithRouteInfo:(id)a3 rerouteReason:(unint64_t)a4
{
}

- (void)updatePosition:(double)a3
{
}

- (double)speedOverride
{
  [(MNSimulatedLocationGenerator *)self->_locationGenerator speedOverride];
  return result;
}

- (void)setSpeedOverride:(double)a3
{
}

- (void)setUpdateIntervalSpeedMultiplier:(double)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (vabdd_f64(self->_updateIntervalSpeedMultiplier, a3) >= 0.01)
  {
    v5 = MNGetMNNavigationSimulationLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = 1.0 / self->_updateIntervalSpeedMultiplier;
      int v7 = 134218240;
      double v8 = v6;
      __int16 v9 = 2048;
      double v10 = 1.0 / a3;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "Setting simulation update interval from %0.2fs to %0.2fs.", (uint8_t *)&v7, 0x16u);
    }

    self->_updateIntervalSpeedMultiplier = a3;
    [(MNSimulationLocationProvider *)self _resetLocationUpdateInterval];
  }
}

- (void)_sendLocationUpdate:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  v57 = [(MNSimulatedLocationGenerator *)self->_locationGenerator nextSimulatedLocationWithElapsedTime:1.0];
  objc_super v4 = MNGetMNNavigationSimulationLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    unint64_t v6 = [(MNSimulatedLocationGenerator *)self->_locationGenerator currentStateType];
    unint64_t v7 = v6;
    double v8 = (void *)MEMORY[0x1E4F28E78];
    if (v57)
    {
      [v57 coordinate];
      uint64_t v10 = v9;
      [v57 coordinate];
      uint64_t v12 = v11;
      [v57 course];
      uint64_t v14 = v13;
      [v57 speed];
      if (v7 > 0xA) {
        v16 = @"Unknown";
      }
      else {
        v16 = off_1E60FAA70[v7];
      }
      unint64_t v18 = [v8 stringWithFormat:@"Sending simulated location: %f, %f | %0.1f | %0.1f m/s | %@", v10, v12, v14, v15, v16];
      if (v7 == 2)
      {
        [(MNSimulatedLocationGenerator *)self->_locationGenerator lastRouteCoordinate];
        v19 = GEOPolylineCoordinateAsShortString();
        [v18 appendFormat:@" [%@]", v19];
      }
    }
    else
    {
      if (v6 > 0xA) {
        v17 = @"Unknown";
      }
      else {
        v17 = off_1E60FAA70[v6];
      }
      unint64_t v18 = [MEMORY[0x1E4F28E78] stringWithFormat:@"Location is nil. State: %@", v17];
    }
    id v20 = MNGetMNNavigationSimulationLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v74 = v18;
      _os_log_impl(&dword_1B542B000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  if (v57)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v22 = objc_opt_respondsToSelector();

    if (v22)
    {
      id v23 = objc_loadWeakRetained((id *)&self->_delegate);
      [v23 locationProvider:self didUpdateLocation:v57];
    }
  }
  if (self->_simulateGeoFences)
  {
    v52 = self->_monitoredGeoFences;
    objc_sync_enter(v52);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id obj = self->_monitoredGeoFences;
    v24 = 0;
    uint64_t v25 = [(NSMutableArray *)obj countByEnumeratingWithState:&v66 objects:v72 count:16];
    if (v25)
    {
      v54 = 0;
      location = (id *)&self->_delegate;
      uint64_t v26 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v67 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          uint64_t v29 = [(NSMutableArray *)self->_currentGeoFences indexOfObject:v28];
          v30 = [v57 rawLocation];
          [v30 coordinate];
          int v31 = objc_msgSend(v28, "containsCoordinate:");

          if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
            int v32 = v31;
          }
          else {
            int v32 = 0;
          }
          if (v32 == 1)
          {
            id v33 = objc_loadWeakRetained(location);
            char v34 = objc_opt_respondsToSelector();

            if (v34)
            {
              [(NSMutableArray *)self->_currentGeoFences addObject:v28];
              v35 = v24;
              if (!v24)
              {
                v35 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
              }
              v24 = v35;
              [v35 addObject:v28];
            }
          }
          else
          {
            if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
              char v36 = 1;
            }
            else {
              char v36 = v31;
            }
            if ((v36 & 1) == 0)
            {
              id v37 = objc_loadWeakRetained(location);
              char v38 = objc_opt_respondsToSelector();

              if (v38)
              {
                [(NSMutableArray *)self->_currentGeoFences removeObjectAtIndex:v29];
                long long v39 = v54;
                if (!v54)
                {
                  long long v39 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
                }
                v54 = v39;
                [v39 addObject:v28];
              }
            }
          }
        }
        uint64_t v25 = [(NSMutableArray *)obj countByEnumeratingWithState:&v66 objects:v72 count:16];
      }
      while (v25);
    }
    else
    {
      v54 = 0;
    }

    objc_sync_exit(v52);
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v40 = v24;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v62 objects:v71 count:16];
    if (v41)
    {
      uint64_t v42 = *(void *)v63;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v63 != v42) {
            objc_enumerationMutation(v40);
          }
          uint64_t v44 = *(void *)(*((void *)&v62 + 1) + 8 * j);
          id v45 = objc_loadWeakRetained((id *)&self->_delegate);
          [v45 locationProvider:self didEnterRegion:v44];
        }
        uint64_t v41 = [v40 countByEnumeratingWithState:&v62 objects:v71 count:16];
      }
      while (v41);
    }

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v46 = v54;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v58 objects:v70 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v59;
      do
      {
        for (uint64_t k = 0; k != v47; ++k)
        {
          if (*(void *)v59 != v48) {
            objc_enumerationMutation(v46);
          }
          uint64_t v50 = *(void *)(*((void *)&v58 + 1) + 8 * k);
          id v51 = objc_loadWeakRetained((id *)&self->_delegate);
          [v51 locationProvider:self didExitRegion:v50];
        }
        uint64_t v47 = [v46 countByEnumeratingWithState:&v58 objects:v70 count:16];
      }
      while (v47);
    }
  }
}

- (void)_resetLocationUpdateInterval
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  locationUpdateTimer = self->_locationUpdateTimer;
  if (locationUpdateTimer)
  {
    [(NSTimer *)locationUpdateTimer invalidate];
    objc_super v4 = self->_locationUpdateTimer;
    self->_locationUpdateTimer = 0;
  }
  double updateIntervalSpeedMultiplier = self->_updateIntervalSpeedMultiplier;
  if (updateIntervalSpeedMultiplier <= 0.0)
  {
    uint64_t v12 = MNGetMNNavigationSimulationLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_DEFAULT, "Pausing navigation simulation because update interval speed multiplier is 0.", (uint8_t *)&v13, 2u);
    }
  }
  else
  {
    double v6 = 1.0 / updateIntervalSpeedMultiplier;
    unint64_t v7 = MNGetMNNavigationSimulationLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      double v14 = v6;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "Running navigation simulation with update interval of %0.2f seconds", (uint8_t *)&v13, 0xCu);
    }

    id v8 = objc_alloc(MEMORY[0x1E4F1CB00]);
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v10 = (NSTimer *)[v8 initWithFireDate:v9 interval:self target:sel__sendLocationUpdate_ selector:0 userInfo:1 repeats:v6];
    uint64_t v11 = self->_locationUpdateTimer;
    self->_locationUpdateTimer = v10;

    uint64_t v12 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v12 addTimer:self->_locationUpdateTimer forMode:*MEMORY[0x1E4F1C3A0]];
  }
}

- (void)startUpdatingLocation
{
  v3 = MNGetMNNavigationSimulationLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "Starting navigation simulation location updates.", buf, 2u);
  }

  self->_simulateGeoFences = GEOConfigGetBOOL();
  objc_super v4 = self->_monitoredGeoFences;
  objc_sync_enter(v4);
  [(NSMutableArray *)self->_monitoredGeoFences removeAllObjects];
  [(NSMutableArray *)self->_currentGeoFences removeAllObjects];
  objc_sync_exit(v4);

  if (self->_locationUpdateTimer)
  {
    BOOL v5 = MNGetMNNavigationSimulationLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "-startUpdatingLocation called after location updates have already been started.", v6, 2u);
    }
  }
  else
  {
    [(MNSimulationLocationProvider *)self _resetLocationUpdateInterval];
  }
}

- (void)stopUpdatingLocation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = MNGetMNNavigationSimulationLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "Stopping navigation simulation location updates.", buf, 2u);
  }

  locationUpdateTimer = self->_locationUpdateTimer;
  if (locationUpdateTimer)
  {
    [(NSTimer *)locationUpdateTimer invalidate];
    BOOL v5 = self->_locationUpdateTimer;
    self->_locationUpdateTimer = 0;

    double v6 = [(MNSimulatedLocationGenerator *)self->_locationGenerator lastLocation];
    if (GEOConfigGetBOOL())
    {
      unint64_t v7 = MNGetMNNavigationSimulationLog();
      id v8 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          [v6 coordinate];
          uint64_t v10 = v9;
          [v6 coordinate];
          *(_DWORD *)buf = 134283777;
          *(void *)&uint8_t buf[4] = v10;
          *(_WORD *)&buf[12] = 2049;
          *(void *)&buf[14] = v11;
          _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "Setting simulated location to %{private}f, %{private}f", buf, 0x16u);
        }

        long long v21 = 0u;
        memset(v22, 0, 28);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v18 = 0u;
        memset(buf, 0, sizeof(buf));
        [v6 clientLocation];
        *(void *)&buf[44] = 0;
        if (*(double *)&buf[28] == 1.79769313e308) {
          *(void *)&buf[28] = 0;
        }
        id v12 = objc_alloc(MEMORY[0x1E4F1E5F0]);
        v15[6] = v20;
        v15[7] = v21;
        v16[0] = v22[0];
        *(_OWORD *)((char *)v16 + 12) = *(_OWORD *)((char *)v22 + 12);
        v15[2] = *(_OWORD *)&buf[32];
        v15[3] = *(_OWORD *)&buf[48];
        v15[4] = v18;
        v15[5] = v19;
        v15[0] = *(_OWORD *)buf;
        v15[1] = *(_OWORD *)&buf[16];
        int v13 = (void *)[v12 initWithClientLocation:v15];
        id v14 = objc_alloc_init(MEMORY[0x1E4F1E658]);
        [v14 setLocationRepeatBehavior:1];
        [v14 clearSimulatedLocations];
        [v14 appendSimulatedLocation:v13];
        [v14 startLocationSimulation];
      }
      else
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_ERROR, "Set simulated location after ending navigation was set, but no simulation location was set. Ignoring.", buf, 2u);
        }

        double v6 = 0;
      }
    }
  }
  else
  {
    double v6 = MNGetMNNavigationSimulationLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "-stopUpdatingLocation called after location updates have already been stopped.", buf, 2u);
    }
  }
}

- (void)startMonitoringForRegion:(id)a3
{
  id v5 = a3;
  objc_super v4 = self->_monitoredGeoFences;
  objc_sync_enter(v4);
  if (self->_simulateGeoFences)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(NSMutableArray *)self->_monitoredGeoFences addObject:v5];
    }
  }
  objc_sync_exit(v4);
}

- (void)stopMonitoringForRegion:(id)a3
{
  id v5 = a3;
  objc_super v4 = self->_monitoredGeoFences;
  objc_sync_enter(v4);
  if (self->_simulateGeoFences)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(NSMutableArray *)self->_monitoredGeoFences removeObject:v5];
      [(NSMutableArray *)self->_currentGeoFences removeObject:v5];
    }
  }
  objc_sync_exit(v4);
}

- (NSBundle)effectiveBundle
{
  return 0;
}

- (NSString)effectiveBundleIdentifier
{
  return 0;
}

- (BOOL)isAuthorized
{
  return 1;
}

- (int)headingOrientation
{
  return 0;
}

- (double)expectedGpsUpdateInterval
{
  return 1.0;
}

- (BOOL)coarseModeEnabled
{
  return 0;
}

- (BOOL)isTracePlayer
{
  return 0;
}

- (unint64_t)traceVersion
{
  return 0;
}

- (double)timeScale
{
  return 1.0;
}

- (MNLocationProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNLocationProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)updateIntervalSpeedMultiplier
{
  return self->_updateIntervalSpeedMultiplier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentGeoFences, 0);
  objc_storeStrong((id *)&self->_monitoredGeoFences, 0);
  objc_storeStrong((id *)&self->_locationGenerator, 0);
  objc_storeStrong((id *)&self->_locationUpdateTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end