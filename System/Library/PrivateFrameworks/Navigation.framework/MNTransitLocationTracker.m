@interface MNTransitLocationTracker
- (BOOL)_isInaccurateLocation:(id)a3;
- (BOOL)debugSnapToTransitLines;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (MNTransitLocationTracker)initWithNavigationSession:(id)a3;
- (double)_timeToDisplayStaleGPSLocation;
- (id)_clRegionWithCenter:(id)a3 identifier:(id)a4 signalStrength:(int)a5;
- (id)_correctedLocationForLocation:(id)a3;
- (id)_locationForInaccurateLocation:(id)a3;
- (id)_matchedLocationForLocation:(id)a3;
- (id)_roadMatchForOffRouteLocation:(id)a3 routeMatch:(id)a4;
- (id)_stepForRegionAlert:(id)a3;
- (int)transportType;
- (void)_initRegionAlertsForRoute:(id)a3;
- (void)_startMonitoringTransitAlerts;
- (void)_stopMonitoringAllRegions;
- (void)_stopMonitoringForRegionWithIdentifier:(id)a3;
- (void)_triggerAlertForRegionId:(id)a3;
- (void)locationManager:(id)a3 didEnterRegion:(id)a4;
- (void)locationManager:(id)a3 didExitRegion:(id)a4;
- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
- (void)reroute:(id)a3 reason:(unint64_t)a4;
- (void)setDebugSnapToTransitLines:(BOOL)a3;
- (void)startTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4;
- (void)stopTracking;
@end

@implementation MNTransitLocationTracker

- (MNTransitLocationTracker)initWithNavigationSession:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)MNTransitLocationTracker;
  v5 = [(MNSteppingLocationTracker *)&v41 initWithNavigationSession:v4];
  if (v5)
  {
    v6 = [v4 routeManager];
    v7 = [v6 currentRoute];

    uint64_t v8 = [v4 motionContext];
    id v9 = objc_alloc(MEMORY[0x1E4F64B00]);
    v10 = [v4 auditToken];
    v34 = (void *)v8;
    uint64_t v11 = [v9 initWithRoute:v7 motionContext:v8 auditToken:v10];
    transitRouteMatcher = v5->_transitRouteMatcher;
    v5->_transitRouteMatcher = (GEOTransitRouteMatcher *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v13;

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v35 = v7;
    v15 = [v7 steps];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v38;
      unint64_t v19 = 0x1EB597000uLL;
      id v36 = v4;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(v15);
          }
          v21 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          if ([v21 transportType] == 1)
          {
            id v22 = v21;
            v23 = v22;
            uint64_t v24 = *(int *)(v19 + 1416);
            if (!*(Class *)((char *)&v5->super.super.super.isa + v24) && [v22 routeSegmentType] == 6)
            {
              id v25 = v23;
              if ([v25 isBus])
              {
                v26 = v5;
                id v27 = objc_alloc(MEMORY[0x1E4F64990]);
                v28 = [v4 auditToken];
                v29 = v27;
                v5 = v26;
                unint64_t v19 = 0x1EB597000;
                uint64_t v30 = [v29 initWithAuditToken:v28];
                v31 = *(Class *)((char *)&v5->super.super.super.isa + v24);
                *(Class *)((char *)&v5->super.super.super.isa + v24) = (Class)v30;

                id v4 = v36;
              }
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v17);
    }

    [(MNTransitLocationTracker *)v5 _initRegionAlertsForRoute:v35];
    v32 = v5;
  }
  return v5;
}

- (int)transportType
{
  return 1;
}

- (void)startTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MNTransitLocationTracker;
  [(MNSteppingLocationTracker *)&v7 startTrackingWithInitialLocation:a3 targetLegIndex:a4];
  v5 = +[MNLocationManager sharedLocationManager];
  [v5 addLocationListener:self];

  [(MNTransitLocationTracker *)self _startMonitoringTransitAlerts];
  if (GEOConfigGetBOOL())
  {
    v6 = [(MNLocationTracker *)self safeDelegate];
    [v6 locationTracker:self didReceiveRouteSignalStrength:2];
  }
}

- (void)stopTracking
{
  [(MNTransitLocationTracker *)self _stopMonitoringAllRegions];
  v3 = +[MNLocationManager sharedLocationManager];
  [v3 removeLocationListener:self];

  v4.receiver = self;
  v4.super_class = (Class)MNTransitLocationTracker;
  [(MNSteppingLocationTracker *)&v4 stopTracking];
}

- (void)reroute:(id)a3 reason:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4 != 14)
  {
    uint64_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315906;
      v10 = "-[MNTransitLocationTracker reroute:reason:]";
      __int16 v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTransitLocationTracker.m";
      __int16 v13 = 1024;
      int v14 = 121;
      __int16 v15 = 2080;
      uint64_t v16 = "rerouteReason == MNRerouteReason_UserSwitchedRideIndex";
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v9, 0x26u);
    }
  }
  objc_super v7 = [v6 route];
  [(MNTransitLocationTracker *)self _initRegionAlertsForRoute:v7];

  [(MNTransitLocationTracker *)self _startMonitoringTransitAlerts];
}

- (void)_initRegionAlertsForRoute:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (NSMutableDictionary *)objc_opt_new();
  transitRegions = self->_transitRegions;
  self->_transitRegions = v5;

  objc_super v7 = (NSMutableDictionary *)objc_opt_new();
  transitAlerts = self->_transitAlerts;
  self->_transitAlerts = v7;

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  objc_super v41 = v4;
  int v9 = [v4 steps];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v60;
    uint64_t v42 = *(void *)v60;
    uint64_t v43 = v9;
    do
    {
      uint64_t v13 = 0;
      uint64_t v44 = v11;
      do
      {
        if (*(void *)v60 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v59 + 1) + 8 * v13);
        if ([v14 transportType] == 1)
        {
          id v15 = v14;
          uint64_t v16 = [v15 regionAlerts];
          if (v16)
          {
            uint64_t v17 = (void *)v16;
            uint64_t v18 = [v15 regionAlerts];
            uint64_t v19 = [v18 count];

            if (v19)
            {
              id v45 = v15;
              uint64_t v46 = v13;
              long long v57 = 0u;
              long long v58 = 0u;
              long long v55 = 0u;
              long long v56 = 0u;
              v20 = [v15 regionAlerts];
              uint64_t v21 = [v20 countByEnumeratingWithState:&v55 objects:v66 count:16];
              if (v21)
              {
                uint64_t v22 = v21;
                uint64_t v23 = *(void *)v56;
                uint64_t v47 = *(void *)v56;
                v48 = v20;
                do
                {
                  uint64_t v24 = 0;
                  uint64_t v49 = v22;
                  do
                  {
                    if (*(void *)v56 != v23) {
                      objc_enumerationMutation(v20);
                    }
                    uint64_t v50 = v24;
                    id v25 = *(void **)(*((void *)&v55 + 1) + 8 * v24);
                    uint64_t v26 = [v25 triggerRegions];
                    if (v26
                      && (id v27 = (void *)v26,
                          [v25 triggerRegions],
                          v28 = objc_claimAutoreleasedReturnValue(),
                          uint64_t v29 = [v28 count],
                          v28,
                          v27,
                          v29))
                    {
                      long long v53 = 0u;
                      long long v54 = 0u;
                      long long v51 = 0u;
                      long long v52 = 0u;
                      uint64_t v30 = [v25 triggerRegions];
                      uint64_t v31 = [v30 countByEnumeratingWithState:&v51 objects:v65 count:16];
                      if (v31)
                      {
                        uint64_t v32 = v31;
                        uint64_t v33 = *(void *)v52;
                        do
                        {
                          for (uint64_t i = 0; i != v32; ++i)
                          {
                            if (*(void *)v52 != v33) {
                              objc_enumerationMutation(v30);
                            }
                            uint64_t v35 = *(void *)(*((void *)&v51 + 1) + 8 * i);
                            id v36 = NSString;
                            long long v37 = objc_opt_new();
                            long long v38 = [v37 UUIDString];
                            long long v39 = [v36 stringWithFormat:@"%@_%@", @"Maps_Transit", v38];

                            [(NSMutableDictionary *)self->_transitAlerts setValue:v25 forKey:v39];
                            [(NSMutableDictionary *)self->_transitRegions setValue:v35 forKey:v39];
                          }
                          uint64_t v32 = [v30 countByEnumeratingWithState:&v51 objects:v65 count:16];
                        }
                        while (v32);
                        uint64_t v23 = v47;
                        v20 = v48;
                        uint64_t v22 = v49;
                      }
                    }
                    else
                    {
                      uint64_t v30 = GEOFindOrCreateLog();
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v64 = v25;
                        _os_log_impl(&dword_1B542B000, v30, OS_LOG_TYPE_ERROR, "Found a transit alert with no corresponding region: %@", buf, 0xCu);
                      }
                    }

                    uint64_t v24 = v50 + 1;
                  }
                  while (v50 + 1 != v22);
                  uint64_t v22 = [v20 countByEnumeratingWithState:&v55 objects:v66 count:16];
                }
                while (v22);
              }

              uint64_t v12 = v42;
              int v9 = v43;
              uint64_t v11 = v44;
              id v15 = v45;
              uint64_t v13 = v46;
            }
          }
        }
        ++v13;
      }
      while (v13 != v11);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v59 objects:v67 count:16];
    }
    while (v11);
  }

  if (![(NSMutableDictionary *)self->_transitAlerts count])
  {
    long long v40 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v40, OS_LOG_TYPE_INFO, "No region alerts found for route.", buf, 2u);
    }
  }
}

- (id)_matchedLocationForLocation:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MNGetPuckTrackingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 uuid];
    int v34 = 138412290;
    uint64_t v35 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNTransitLocationTracker::_matchedLocationForLocation:", (uint8_t *)&v34, 0xCu);
  }
  lastLocationTimestamp = self->_lastLocationTimestamp;
  if (lastLocationTimestamp)
  {
    uint64_t v8 = [v4 timestamp];
    uint64_t v9 = [(NSDate *)lastLocationTimestamp compare:v8];

    if (v9 == 1)
    {
      uint64_t v10 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v34) = 0;
        _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_DEBUG, "Dropping location because it has an older timestamp.", (uint8_t *)&v34, 2u);
      }

      goto LABEL_15;
    }
  }
  uint64_t v11 = [v4 timestamp];
  uint64_t v12 = self->_lastLocationTimestamp;
  self->_lastLocationTimestamp = v11;

  if ([(MNTransitLocationTracker *)self _isInaccurateLocation:v4])
  {
    if (self->_lastAccurateLocationDate)
    {
      uint64_t v13 = [v4 timestamp];
      [v13 timeIntervalSinceDate:self->_lastAccurateLocationDate];
      double v15 = v14;

      if (v15 < 60.0)
      {
LABEL_15:
        uint64_t v21 = 0;
        goto LABEL_27;
      }
    }
    uint64_t v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v34) = 0;
      _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_DEBUG, "Using an inaccurate location.", (uint8_t *)&v34, 2u);
    }

    uint64_t v17 = [(MNTransitLocationTracker *)self _locationForInaccurateLocation:v4];

    uint64_t v18 = [v17 timestamp];
    uint64_t v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      id v20 = [MEMORY[0x1E4F1C9C8] date];
    }
    uint64_t v22 = v20;

    [(MNTransitLocationTracker *)self _timeToDisplayStaleGPSLocation];
    id v25 = objc_msgSend(v22, "dateByAddingTimeInterval:");
    [v17 setExpirationDate:v25];
  }
  else
  {
    uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F64660]) initWithCLLocation:v4];
    uint64_t v23 = MNGetPuckTrackingLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = [v4 uuid];
      int v34 = 138412290;
      uint64_t v35 = v24;
      _os_log_impl(&dword_1B542B000, v23, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - calling _correctedLocationForLocation:", (uint8_t *)&v34, 0xCu);
    }
    id v25 = [v4 uuid];
    uint64_t v17 = [(MNTransitLocationTracker *)self _correctedLocationForLocation:v22];

    uint64_t v26 = MNGetPuckTrackingLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = [v17 uuid];
      int v34 = 138412546;
      uint64_t v35 = v25;
      __int16 v36 = 2112;
      long long v37 = v27;
      _os_log_impl(&dword_1B542B000, v26, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - MUTATED to corrected location => %@", (uint8_t *)&v34, 0x16u);
    }
    objc_storeStrong((id *)&self->_lastAccurateLocationDate, self->_lastLocationTimestamp);
    v28 = [v17 timestamp];
    uint64_t v29 = v28;
    if (v28)
    {
      id v30 = v28;
    }
    else
    {
      id v30 = [MEMORY[0x1E4F1C9C8] date];
    }
    uint64_t v31 = v30;

    [(MNTransitLocationTracker *)self _timeToDisplayStaleGPSLocation];
    uint64_t v32 = objc_msgSend(v31, "dateByAddingTimeInterval:");
    [v17 setExpirationDate:v32];
  }
  id v4 = v17;
  uint64_t v21 = v4;
LABEL_27:

  return v21;
}

- (id)_correctedLocationForLocation:(id)a3
{
  id v4 = a3;
  p_lastMatchedLocation = &self->_lastMatchedLocation;
  id v6 = [(MNLocation *)self->_lastMatchedLocation routeMatch];
  uint64_t v7 = [(GEOTransitRouteMatcher *)self->_transitRouteMatcher matchToRouteWithLocation:v4 previousRouteMatch:v6];
  uint64_t v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (void *)v7;
  }
  else {
    uint64_t v9 = v6;
  }
  id v10 = v9;

  [v4 coordinate];
  double v12 = v11;
  [v4 coordinate];
  double v14 = v13;
  double v15 = -1.0;
  if ([v4 hasCourse])
  {
    [v4 course];
    double v15 = v16;
  }
  uint64_t v17 = 0;
  if ([v4 hasSpeed])
  {
    [v4 speed];
    uint64_t v17 = v18;
  }
  [v4 horizontalAccuracy];
  uint64_t v20 = v19;
  double v21 = -1.0;
  double v22 = -1.0;
  if ([v4 hasCourseAccuracy])
  {
    [v4 courseAccuracy];
    double v22 = v23;
  }
  if ([v4 hasSpeedAccuracy])
  {
    [v4 speedAccuracy];
    double v21 = v24;
  }
  [v4 timestamp];
  double v59 = v21;
  double v60 = v15;
  uint64_t v58 = v25;
  if (self->_debugSnapToTransitLines)
  {
    uint64_t v26 = [v10 transitTripStep];
    id v27 = v26;
    uint64_t v61 = 0;
    double v56 = v22;
    uint64_t v57 = v17;
    if (!v26)
    {
      uint64_t v35 = v20;
      uint64_t v36 = 0;
      goto LABEL_36;
    }
    if ([v26 maneuver] != 4 && objc_msgSend(v27, "maneuver") != 5) {
      goto LABEL_24;
    }
    if ([v27 isRail] && objc_msgSend(v10, "isGoodMatch"))
    {
      [v10 locationCoordinate3D];
      double v29 = v28;
      double v31 = v30;
      uint64_t v54 = v32;
      [v10 matchedCourse];
      uint64_t v34 = v54;
      goto LABEL_30;
    }
    if (![v27 isBus])
    {
LABEL_24:
      double v33 = -1.0;
      double v31 = -180.0;
      uint64_t v34 = 0x7FEFFFFFFFFFFFFFLL;
      double v29 = -180.0;
      goto LABEL_30;
    }
    long long v40 = [(MNTransitLocationTracker *)self _roadMatchForOffRouteLocation:v4 routeMatch:v10];
    objc_super v41 = v40;
    if (v40)
    {
      [v40 coordinateOnRoad];
      double v29 = v42;
      double v31 = v43;
      uint64_t v55 = v44;
      [v41 courseOnRoad];
    }
    else
    {
      if (![v10 isGoodMatch])
      {
        double v53 = -1.0;
        double v31 = -180.0;
        uint64_t v55 = 0x7FEFFFFFFFFFFFFFLL;
        double v29 = -180.0;
        goto LABEL_29;
      }
      [v10 locationCoordinate3D];
      double v29 = v46;
      double v31 = v47;
      uint64_t v55 = v48;
      [v10 matchedCourse];
    }
    double v53 = v45;
LABEL_29:

    double v33 = v53;
    uint64_t v34 = v55;
LABEL_30:
    uint64_t v36 = 0;
    if (v31 >= -180.0 && v31 <= 180.0 && v29 >= -90.0)
    {
      uint64_t v35 = v20;
      double v37 = v14;
      double v38 = v14;
      double v39 = v12;
      if (v29 <= 90.0)
      {
        uint64_t v36 = 1;
        double v15 = v33;
        uint64_t v61 = v34;
        double v38 = v31;
        double v12 = v29;
      }
      goto LABEL_37;
    }
    uint64_t v35 = v20;
LABEL_36:
    double v37 = v14;
    double v38 = v14;
    double v39 = v12;
LABEL_37:

    double v22 = v56;
    uint64_t v17 = v57;
    goto LABEL_38;
  }
  uint64_t v35 = v20;
  uint64_t v36 = 0;
  uint64_t v61 = 0;
  double v37 = v14;
  double v38 = v14;
  double v39 = v12;
LABEL_38:
  if (objc_msgSend(v10, "transitID", *(void *)&v53) && objc_msgSend(v4, "hasTransitID"))
  {
    [v10 modifiedHorizontalAccuracy];
    uint64_t v35 = v49;
  }
  int v62 = 0;
  double v63 = v12;
  double v64 = v38;
  uint64_t v65 = v35;
  uint64_t v66 = v61;
  uint64_t v67 = 0;
  uint64_t v68 = v17;
  double v69 = v59;
  double v70 = v15;
  double v71 = v22;
  uint64_t v72 = v58;
  uint64_t v73 = 0;
  uint64_t v74 = 0;
  double v75 = v39;
  double v76 = v37;
  double v77 = v60;
  long long v78 = 0u;
  long long v79 = 0u;
  uint64_t v50 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithClientLocation:&v62];
  if (v10 && [v10 isGoodMatch])
  {
    long long v51 = [[MNLocation alloc] initWithRouteMatch:v10 rawLocation:v50 locationMatchType:0];
  }
  else
  {
    long long v51 = [[MNLocation alloc] initWithRawLocation:v50];
    [(MNLocation *)v51 setRouteMatch:v10];
  }
  [(MNLocation *)v51 setIsDirectional:v36];
  objc_storeStrong((id *)p_lastMatchedLocation, v51);

  return v51;
}

- (id)_locationForInaccurateLocation:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MNGetPuckTrackingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 uuid];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in _locationForInaccurateLocation:", buf, 0xCu);
  }
  uint64_t v7 = (MNLocation *)v4;
  uint64_t v8 = [(MNLocation *)self->_lastMatchedLocation routeMatch];
  uint64_t v9 = [(MNLocationTracker *)self navigationSession];
  id v10 = [v9 routeManager];
  double v11 = [v10 currentRoute];

  double v12 = v7;
  if ([v8 isGoodMatch])
  {
    double v13 = [v8 route];

    double v12 = v7;
    if (v13 == v11)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F649E0]);
      double v15 = [(MNLocationTracker *)self navigationSession];
      double v16 = [v15 auditToken];
      uint64_t v17 = (void *)[v14 initWithRoute:v11 auditToken:v16];

      uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F64660]) initWithCLLocation:v7];
      uint64_t v19 = [v17 matchToRouteWithLocation:v18];
      uint64_t v20 = v19;
      double v12 = v7;
      if (v19)
      {
        [v19 distanceFromRoute];
        double v22 = v21;
        [(MNLocation *)v7 horizontalAccuracy];
        double v12 = v7;
        if (v22 < v23)
        {
          double v24 = objc_msgSend(v11, "segmentForPointIndex:", objc_msgSend(v20, "routeCoordinate"));
          double v12 = v7;
          if ([v24 type] == 6)
          {
            long long v39 = 0u;
            memset(v40, 0, 28);
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v34 = 0u;
            memset(buf, 0, sizeof(buf));
            if (v7) {
              [(MNLocation *)v7 clientLocation];
            }
            [v20 locationCoordinate];
            uint64_t v26 = v25;
            [v20 locationCoordinate];
            *(void *)&uint8_t buf[4] = v26;
            *(void *)&buf[12] = v27;
            double v28 = [MNLocation alloc];
            v31[6] = v38;
            v31[7] = v39;
            v32[0] = v40[0];
            *(_OWORD *)((char *)v32 + 12) = *(_OWORD *)((char *)v40 + 12);
            v31[2] = v34;
            v31[3] = v35;
            v31[4] = v36;
            v31[5] = v37;
            v31[0] = *(_OWORD *)buf;
            v31[1] = *(_OWORD *)&buf[16];
            double v12 = [(MNLocation *)v28 initWithClientLocation:v31];

            if (GEOConfigGetBOOL())
            {
              double v29 = [(MNLocation *)v7 uuid];
              [(MNLocation *)v12 setUuid:v29];
            }
          }
        }
      }
    }
  }

  return v12;
}

- (id)_roadMatchForOffRouteLocation:(id)a3 routeMatch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(GEORoadMatcher *)self->_roadMatcher matchLocation:v6 forTransportType:0];
  if (!v8) {
    goto LABEL_9;
  }
  if (![v7 isGoodMatch]) {
    goto LABEL_4;
  }
  [v7 distanceFromRoute];
  double v10 = v9;
  [v8 distanceFromRoad];
  double v12 = v11;
  [v6 horizontalAccuracy];
  if (v10 > v12 + v13) {
    goto LABEL_4;
  }
  if (![v6 hasAccurateCourse]) {
    goto LABEL_9;
  }
  [v6 speedAccuracy];
  if (v15 < 0.0) {
    goto LABEL_9;
  }
  [v6 speed];
  if (v16 <= 3.0) {
    goto LABEL_9;
  }
  [v6 course];
  [v7 matchedCourse];
  GEOAngleDifferenceDegrees();
  double v18 = fabs(v17);
  [v6 course];
  [v8 courseOnRoad];
  GEOAngleDifferenceDegrees();
  double v20 = fabs(v19);
  [v6 courseAccuracy];
  if (v18 > v20 + v21) {
LABEL_4:
  }
    id v14 = v8;
  else {
LABEL_9:
  }
    id v14 = 0;

  return v14;
}

- (double)_timeToDisplayStaleGPSLocation
{
  v2 = +[MNLocationManager sharedLocationManager];
  [v2 timeScale];
  double v4 = 15.0 / v3;

  return v4;
}

- (BOOL)_isInaccurateLocation:(id)a3
{
  return !a3 || [a3 type] - 6 < 3;
}

- (void)_startMonitoringTransitAlerts
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  double v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v26 = "-[MNTransitLocationTracker _startMonitoringTransitAlerts]";
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  if (self->_monitoredRegions) {
    [(MNTransitLocationTracker *)self _stopMonitoringAllRegions];
  }
  double v4 = (NSMutableDictionary *)objc_opt_new();
  monitoredRegions = self->_monitoredRegions;
  self->_monitoredRegions = v4;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(NSMutableDictionary *)self->_transitRegions allKeys];
  uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    uint64_t v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        double v12 = [(NSMutableDictionary *)self->_transitRegions valueForKey:v11];
        double v13 = [v12 location];
        id v14 = -[MNTransitLocationTracker _clRegionWithCenter:identifier:signalStrength:](self, "_clRegionWithCenter:identifier:signalStrength:", v13, v11, [v12 signalStrength]);

        double v15 = +[MNLocationManager sharedLocationManager];
        [v15 startMonitoringForRegion:v14];

        [(NSMutableDictionary *)self->_monitoredRegions setValue:v14 forKey:v11];
        if ([v12 signalStrength] == 2 || v9 == 2)
        {
          uint64_t v9 = 2;
        }
        else if (![v12 signalStrength])
        {
          uint64_t v9 = 0;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v9 = 1;
  }

  double v18 = [(MNLocationTracker *)self safeDelegate];
  [v18 locationTracker:self didReceiveRouteSignalStrength:v9];
}

- (id)_clRegionWithCenter:(id)a3 identifier:(id)a4 signalStrength:(int)a5
{
  id v6 = a3;
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F1E5A8];
  id v8 = a4;
  id v9 = [v7 alloc];
  [v6 lat];
  CLLocationDegrees v11 = v10;
  [v6 lng];
  CLLocationCoordinate2D v13 = CLLocationCoordinate2DMake(v11, v12);
  GEOConfigGetDouble();
  double v15 = objc_msgSend(v9, "initWithCenter:radius:identifier:", v8, v13.latitude, v13.longitude, v14);

  double v16 = (void *)MEMORY[0x1E4F64670];
  [v6 lat];
  double v18 = v17;
  [v6 lng];
  if (objc_msgSend(v16, "isLocationShiftRequiredForCoordinate:", v18, v19)) {
    [v15 setGeoReferenceFrame:2];
  }

  return v15;
}

- (void)_stopMonitoringAllRegions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v3 = [(NSMutableDictionary *)self->_monitoredRegions allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [(MNTransitLocationTracker *)self _stopMonitoringForRegionWithIdentifier:*(void *)(*((void *)&v9 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  monitoredRegions = self->_monitoredRegions;
  self->_monitoredRegions = 0;
}

- (void)_stopMonitoringForRegionWithIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315138;
    long long v9 = "-[MNTransitLocationTracker _stopMonitoringForRegionWithIdentifier:]";
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = +[MNLocationManager sharedLocationManager];
  uint64_t v7 = [(NSMutableDictionary *)self->_monitoredRegions valueForKey:v4];
  [v6 stopMonitoringForRegion:v7];

  [(NSMutableDictionary *)self->_monitoredRegions removeObjectForKey:v4];
}

- (id)_stepForRegionAlert:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MNLocationTracker *)self navigationSession];
  uint64_t v6 = [v5 routeManager];
  uint64_t v7 = [v6 currentRoute];
  int v8 = [v7 steps];
  long long v9 = [v8 firstObject];

  if (v9)
  {
    do
    {
      if ([v9 transportType] == 1)
      {
        id v10 = v9;
        long long v11 = [v10 regionAlerts];
        char v12 = [v11 containsObject:v4];

        if (v12) {
          break;
        }
      }
      id v10 = [v9 getNextStep];

      long long v9 = v10;
    }
    while (v10);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_triggerAlertForRegionId:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_transitAlerts valueForKey:v4];
  uint64_t v6 = [(MNTransitLocationTracker *)self _stepForRegionAlert:v5];
  uint64_t v7 = [(NSMutableDictionary *)self->_transitRegions valueForKey:v4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v8 = [(NSMutableDictionary *)self->_transitAlerts allKeysForObject:v5];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        [(MNTransitLocationTracker *)self _stopMonitoringForRegionWithIdentifier:*(void *)(*((void *)&v19 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v9);
  }

  if (v6)
  {
    objc_initWeak(location, self);
    unsigned int v12 = [v7 hasDelaySeconds];
    if (v12) {
      unsigned int v12 = [v7 delaySeconds];
    }
    dispatch_time_t v13 = dispatch_time(0, (uint64_t)((double)v12 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__MNTransitLocationTracker__triggerAlertForRegionId___block_invoke;
    block[3] = &unk_1E60FB640;
    objc_copyWeak(&v18, location);
    id v16 = v5;
    id v17 = v6;
    dispatch_after(v13, MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v18);
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v5;
      _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_ERROR, "No transit step found for transit alert: %@", (uint8_t *)location, 0xCu);
    }
  }
}

void __53__MNTransitLocationTracker__triggerAlertForRegionId___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  double v3 = [WeakRetained safeDelegate];
  id v4 = objc_loadWeakRetained(v2);
  uint64_t v5 = [MNTransitAlert alloc];
  uint64_t v6 = [*(id *)(a1 + 32) banner];
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = objc_loadWeakRetained(v2);
  uint64_t v9 = [v8 navigationSession];
  uint64_t v10 = [v9 routeManager];
  uint64_t v11 = [v10 currentRouteInfo];
  unsigned int v12 = [(MNTransitAlert *)v5 initWithTransitBanner:v6 transitStep:v7 activeRoute:v11];
  [v3 locationTracker:v4 didReceiveTransitAlert:v12];
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315138;
    uint64_t v14 = "-[MNTransitLocationTracker locationManager:didExitRegion:]";
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v7 = [v5 identifier];
  id v8 = (void *)[@"Maps_Transit" copy];
  int v9 = [v7 hasPrefix:v8];

  if (v9)
  {
    uint64_t v10 = [(NSMutableDictionary *)self->_transitRegions valueForKey:v7];
    if (!v10)
    {
      uint64_t v11 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412290;
        uint64_t v14 = (const char *)v5;
        _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_ERROR, "No transit trigger region found for region: %@", (uint8_t *)&v13, 0xCu);
      }

      unsigned int v12 = +[MNLocationManager sharedLocationManager];
      [v12 stopMonitoringForRegion:v5];
    }
    if (![v10 transition] || objc_msgSend(v10, "transition") == 2) {
      [(MNTransitLocationTracker *)self _triggerAlertForRegionId:v7];
    }
  }
}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315138;
    uint64_t v14 = "-[MNTransitLocationTracker locationManager:didEnterRegion:]";
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v7 = [v5 identifier];
  id v8 = (void *)[@"Maps_Transit" copy];
  int v9 = [v7 hasPrefix:v8];

  if (v9)
  {
    uint64_t v10 = [(NSMutableDictionary *)self->_transitRegions valueForKey:v7];
    if (!v10)
    {
      uint64_t v11 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412290;
        uint64_t v14 = (const char *)v5;
        _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_ERROR, "No transit trigger region found for region: %@", (uint8_t *)&v13, 0xCu);
      }

      unsigned int v12 = +[MNLocationManager sharedLocationManager];
      [v12 stopMonitoringForRegion:v5];
    }
    if (![v10 transition] || objc_msgSend(v10, "transition") == 1) {
      [(MNTransitLocationTracker *)self _triggerAlertForRegionId:v7];
    }
  }
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  int v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412546;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "Failed to track region with region=%@ error=%@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = [v7 identifier];
  [(MNTransitLocationTracker *)self _stopMonitoringForRegionWithIdentifier:v10];
}

- (BOOL)debugSnapToTransitLines
{
  return self->_debugSnapToTransitLines;
}

- (void)setDebugSnapToTransitLines:(BOOL)a3
{
  self->_debugSnapToTransitLines = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitAlerts, 0);
  objc_storeStrong((id *)&self->_transitRegions, 0);
  objc_storeStrong((id *)&self->_monitoredRegions, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_lastMatchedLocation, 0);
  objc_storeStrong((id *)&self->_lastAccurateLocationDate, 0);
  objc_storeStrong((id *)&self->_lastLocationTimestamp, 0);
  objc_storeStrong((id *)&self->_roadMatcher, 0);
  objc_storeStrong((id *)&self->_transitRouteMatcher, 0);
}

@end