@interface CLDurianCommuteMetricManager
- (BOOL)isDataCollectionAuthorized;
- (BOOL)lookupStatsWithDate:(id)a3 stats:(id)a4;
- (BOOL)valid;
- (CLDurianCommuteMetricManager)init;
- (double)decimateDoulbe:(double)a3;
- (id).cxx_construct;
- (id)initInUniverse:(id)a3;
- (id)keyFromDate:(id)a3;
- (id)readAllStats;
- (int64_t)decimateInteger:(int64_t)a3;
- (void)_completeJourney;
- (void)checkNearOrAtHome:(CLLocationCoordinate2D)a3 horizontalAccuracy:(double)a4;
- (void)cleanup;
- (void)dealloc;
- (void)didChangeConnectionStateForDevice:(id)a3 fromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)didObserveScanForDevice:(id)a3;
- (void)initAnalyticsTimer;
- (void)loadStats;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)observeDevice:(id)a3;
- (void)onAnalyticsTimerFired:(id)a3;
- (void)onDataProtectionNotification:(int)a3 data:(uint64_t)a4;
- (void)onVisit:(id)a3;
- (void)printCurrentStats;
- (void)pruneOldStats;
- (void)resetStats;
- (void)saveStats:(id)a3;
- (void)sendMetrics;
- (void)setValid:(BOOL)a3;
- (void)transitionWithEvent:(int)a3;
@end

@implementation CLDurianCommuteMetricManager

- (void)checkNearOrAtHome:(CLLocationCoordinate2D)a3 horizontalAccuracy:(double)a4
{
  [(CLIntersiloUniverse *)self->_universe silo];
  if (CLLocationCoordinate2DIsValid(self->_homeLocation))
  {
    CLLocationCoordinate2DGetDistanceFrom();
    double v7 = v6 - a4;
    self->_BOOL nearOrAtHome = v6 - a4 < 250.0;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    uint64_t v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
    {
      BOOL nearOrAtHome = self->_nearOrAtHome;
      *(_DWORD *)buf = 68290307;
      int v16 = 0;
      __int16 v17 = 2082;
      v18 = "";
      __int16 v19 = 1025;
      BOOL v20 = nearOrAtHome;
      __int16 v21 = 2049;
      CLLocationDegrees latitude = a3.latitude;
      __int16 v23 = 2049;
      CLLocationDegrees longitude = a3.longitude;
      __int16 v25 = 2049;
      double v26 = a4;
      __int16 v27 = 2049;
      double v28 = v7;
      v10 = "{\"msg%{public}.0s\":\"#rwl, _nearOrAtHome\", \"_nearOrAtHome\":%{private}hhd, \"loc.lat\":\"%{private}f\", "
            "\"loc.lon\":\"%{private}f\", \"loc.hacc\":\"%{private}f\", \"distance\":\"%{private}f\"}";
      v11 = v8;
      uint32_t v12 = 64;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, v10, buf, v12);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    uint64_t v13 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      int v16 = 0;
      __int16 v17 = 2082;
      v18 = "";
      v10 = "{\"msg%{public}.0s\":\"#rwl, _nearOrAtHome, Home location is unknown.\"}";
      v11 = v13;
      uint32_t v12 = 18;
      goto LABEL_10;
    }
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  [(CLIntersiloUniverse *)self->_universe silo];
  [objc_msgSend(a4, "lastObject") coordinate];
  double v7 = v6;
  double v9 = v8;
  [objc_msgSend(a4, "lastObject") horizontalAccuracy];

  -[CLDurianCommuteMetricManager checkNearOrAtHome:horizontalAccuracy:](self, "checkNearOrAtHome:horizontalAccuracy:", v7, v9, v10);
}

- (CLDurianCommuteMetricManager)init
{
  return 0;
}

- (id)initInUniverse:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLDurianCommuteMetricManager;
  v4 = [(CLDurianCommuteMetricManager *)&v7 init];
  if (v4)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    v5 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      v9[0] = 2082;
      *(void *)&v9[1] = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, init CLCommuteMetricManager\"}", buf, 0x12u);
    }
    v4->_universe = (CLIntersiloUniverse *)a3;
    v4->_beaconManager = (SPBeaconManager *)objc_alloc_init((Class)SPBeaconManager);
    operator new();
  }
  return 0;
}

- (void)onDataProtectionNotification:(int)a3 data:(uint64_t)a4
{
  [*(id *)(a1 + 8) silo];
  if (a3 == 1)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    double v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
    {
      int v10 = 68289282;
      int v11 = 0;
      __int16 v12 = 2082;
      uint64_t v13 = "";
      __int16 v14 = 1026;
      int v15 = BYTE4(a4) & 1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, device unlocked since boot\", \"deviceUnlockedSinceBoot\":%{public}hhd}", (uint8_t *)&v10, 0x18u);
    }
  }
  else if (!a3)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    objc_super v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
    {
      int v8 = *(unsigned __int8 *)(a1 + 137);
      int v10 = 68289538;
      int v11 = 0;
      __int16 v12 = 2082;
      uint64_t v13 = "";
      __int16 v14 = 1026;
      int v15 = v8;
      __int16 v16 = 1026;
      BOOL v17 = a4 == 1;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, data availability\", \"statsLoaded\":%{public}hhd, \"dataAvailability\":%{public}hhd}", (uint8_t *)&v10, 0x1Eu);
    }
    if (!*(unsigned char *)(a1 + 137) && a4 == 1) {
      [(id)a1 loadStats];
    }
  }
}

- (BOOL)isDataCollectionAuthorized
{
  unsigned int v2 = +[CLLocationManager authorizationStatusForBundlePath:@"/System/Library/LocationBundles/FindMyDevice.framework/"];
  if (v2 != 3)
  {
    signed int v4 = v2;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    uint64_t v5 = qword_102419398;
    if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG)) {
      return 0;
    }
    int v11 = 68289283;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2049;
    uint64_t v16 = v4;
    double v6 = "{\"msg%{public}.0s\":\"#rwl, location authorization status\", \"authorizationStatus\":%{private}ld}";
    objc_super v7 = v5;
    uint32_t v8 = 28;
    goto LABEL_14;
  }
  if (!objc_opt_class())
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    uint64_t v9 = qword_102419398;
    if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG)) {
      return 0;
    }
    int v11 = 68289026;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    double v6 = "{\"msg%{public}.0s\":\"#rwl, sendMetrics, skip metric submission. MCProfileConnection is not supported.\"}";
    objc_super v7 = v9;
    uint32_t v8 = 18;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v11, v8);
    return 0;
  }
  id v3 = +[MCProfileConnection sharedConnection];

  return _[v3 isDiagnosticSubmissionAllowed];
}

- (void)loadStats
{
  [(CLIntersiloUniverse *)self->_universe silo];
  if (!self->_statsLoaded)
  {
    int v3 = (*(uint64_t (**)(void *))(*(void *)self->_metricCache + 936))(self->_metricCache);
    self->_statsLoaded = 1;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    signed int v4 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = 68289282;
      LOWORD(v8) = 2082;
      *(void *)((char *)&v8 + 2) = "";
      WORD5(v8) = 1026;
      HIDWORD(v8) = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, loadStats, load existing stats\", \"result\":%{public}hhd}", (uint8_t *)&v7, 0x18u);
    }
    if ([(CLDurianCommuteMetricManager *)self lookupStatsWithDate:[(CLDurianCommuteStats *)self->_stats startDate] stats:self->_stats])
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331C58);
      }
      uint64_t v5 = qword_102419398;
      if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
      uint64_t v7 = 68289026;
      LOWORD(v8) = 2082;
      *(void *)((char *)&v8 + 2) = "";
      double v6 = "{\"msg%{public}.0s\":\"#rwl, loadStats, load existing stats\"}";
    }
    else
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331C58);
      }
      uint64_t v5 = qword_102419398;
      if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
      uint64_t v7 = 68289026;
      LOWORD(v8) = 2082;
      *(void *)((char *)&v8 + 2) = "";
      double v6 = "{\"msg%{public}.0s\":\"#rwl, loadStats, init a new stats\"}";
    }
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v7, 0x12u);
LABEL_16:
    [(CLDurianCommuteMetricManager *)self printCurrentStats];
  }
}

- (void)dealloc
{
  [(CLLocationManager *)self->_locationManager stopUpdatingLocation];

  metricCache = self->_metricCache;
  if (metricCache) {
    (*(void (**)(void *))(*(void *)metricCache + 8))(metricCache);
  }
  self->_metricCache = 0;
  v4.receiver = self;
  v4.super_class = (Class)CLDurianCommuteMetricManager;
  [(CLDurianCommuteMetricManager *)&v4 dealloc];
}

- (void)cleanup
{
  if (((*(uint64_t (**)(void *, SEL))(*(void *)self->_metricCache + 944))(self->_metricCache, a2) & 1) == 0)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    int v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      long long v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#rwl Could not store metric cache\"}", (uint8_t *)&v5, 0x12u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331C58);
      }
    }
    objc_super v4 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      long long v8 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#rwl Could not store metric cache", "{\"msg%{public}.0s\":\"#rwl Could not store metric cache\"}", (uint8_t *)&v5, 0x12u);
    }
  }
  [(CLRoutineMonitorServiceProtocol *)self->_routineMonitor stopLeechingVisitsForClient:self];
  [(CLDurianCommuteMetricManager *)self setValid:0];
}

- (void)printCurrentStats
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331C58);
  }
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
  {
    id v3 = +[NSMutableString string];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    objc_super v4 = [(CLDurianCommuteStats *)self->_stats carryingItems];
    id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v26 objects:v47 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v27;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v27 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 appendFormat:@"(%@)", [*(id *)(*((void *)&v26 + 1) + 8 * i) UUIDString]];
        }
        id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v26 objects:v47 count:16];
      }
      while (v6);
    }
    id v9 = +[NSMutableString string];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = [(NSMutableDictionary *)[(CLDurianCommuteStats *)self->_stats itemJourneyStats] keyEnumerator];
    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v46 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          [v9 appendFormat:@"(%@:%ld)", [*(id *)(*((void *)&v22 + 1) + 8 * (void)j) UUIDString], [-[NSMutableDictionary objectForKey:](-[CLDurianCommuteStats itemJourneyStats](self->_stats, "itemJourneyStats"), "objectForKey:", *(void *)(*((void *)&v22 + 1) + 8 * (void)j)) journeyCount]];
        }
        id v12 = [v10 countByEnumeratingWithState:&v22 objects:v46 count:16];
      }
      while (v12);
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    __int16 v15 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
    {
      uint64_t state = self->_state;
      BOOL v17 = [(CLDurianCommuteStats *)self->_stats startDate];
      v18 = [(CLDurianCommuteStats *)self->_stats endDate];
      int64_t v19 = [(CLDurianCommuteStats *)self->_stats deviceJourneyCount];
      id v20 = [v3 UTF8String];
      id v21 = [v9 UTF8String];
      *(_DWORD *)buf = 68290563;
      int v31 = 0;
      __int16 v32 = 2082;
      v33 = "";
      __int16 v34 = 2049;
      uint64_t v35 = state;
      __int16 v36 = 2114;
      v37 = v17;
      __int16 v38 = 2114;
      v39 = v18;
      __int16 v40 = 2049;
      int64_t v41 = v19;
      __int16 v42 = 2081;
      id v43 = v20;
      __int16 v44 = 2081;
      id v45 = v21;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#rwl, current stats\", \"state\":%{private}ld, \"startDate\":%{public, location:escape_only}@, \"endDate\":%{public, location:escape_only}@, \"journeyCount\":%{private}ld, \"carryingItems\":%{private, location:escape_only}s, \"items.journeyCounts\":%{private, location:escape_only}s}", buf, 0x4Eu);
    }
  }
}

- (void)resetStats
{
  self->_uint64_t state = 0;
  [(CLDurianCommuteStats *)self->_stats removeAllCarryingItems];
}

- (void)transitionWithEvent:(int)a3
{
  [(CLIntersiloUniverse *)self->_universe silo];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331C58);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
  {
    uint64_t state = self->_state;
    int v17 = 68289795;
    int v18 = 0;
    __int16 v19 = 2082;
    id v20 = "";
    __int16 v21 = 2049;
    uint64_t v22 = state;
    __int16 v23 = 1025;
    *(_DWORD *)long long v24 = a3;
    *(_WORD *)&v24[4] = 1025;
    *(_DWORD *)&v24[6] = [(CLDurianCommuteMetricManager *)self valid];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#rwl, fsm event\", \"state\":%{private}ld, \"event\":%{private}d, \"valid\":%{private}hhd}", (uint8_t *)&v17, 0x28u);
  }
  if (![(CLDurianCommuteMetricManager *)self isDataCollectionAuthorized])
  {
    [(CLDurianCommuteMetricManager *)self resetStats];
    return;
  }
  if (a3 != 3)
  {
    if (a3 != 2)
    {
      if (a3 == 1)
      {
        uint64_t v7 = +[NSDate date];
        self->_uint64_t state = 2;
        unsigned int v8 = [(CLDurianCommuteStats *)self->_stats containsDate:v7];
        stats = self->_stats;
        if (v8)
        {
          [(CLDurianCommuteStats *)stats removeAllCarryingItems];
        }
        else
        {
          [(CLDurianCommuteStats *)stats resetWithDate:v7];
          [(CLDurianCommuteMetricManager *)self pruneOldStats];
        }
        self->_lastTravelTime = CFAbsoluteTimeGetCurrent();
      }
      goto LABEL_27;
    }
    int v11 = self->_state;
    if (v11 == 3)
    {
      double v12 = CFAbsoluteTimeGetCurrent() - self->_lastTravelTime;
      if (v12 <= self->_minimumTravelTimeInterval)
      {
        [(CLDurianCommuteStats *)self->_stats removeAllCarryingItems];
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102331C58);
        }
        uint64_t v13 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
        {
          uint64_t minimumTravelTimeInterval = (uint64_t)self->_minimumTravelTimeInterval;
          int v17 = 68289539;
          int v18 = 0;
          __int16 v19 = 2082;
          id v20 = "";
          __int16 v21 = 2049;
          uint64_t v22 = (uint64_t)v12;
          __int16 v23 = 2049;
          *(void *)long long v24 = minimumTravelTimeInterval;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#rwl, fsm travel time is too short.\", \"interval\":%{private}ld, \"threshold\":%{private}ld}", (uint8_t *)&v17, 0x26u);
        }
      }
      else
      {
        [(CLDurianCommuteMetricManager *)self _completeJourney];
      }
    }
    else if (v11 == 2)
    {
      [(CLDurianCommuteStats *)self->_stats removeAllCarryingItems];
    }
    int v10 = 1;
    goto LABEL_26;
  }
  if (self->_state == 2)
  {
    int v10 = 3;
LABEL_26:
    self->_uint64_t state = v10;
  }
LABEL_27:
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331C58);
  }
  __int16 v15 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = self->_state;
    int v17 = 68289283;
    int v18 = 0;
    __int16 v19 = 2082;
    id v20 = "";
    __int16 v21 = 2049;
    uint64_t v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#rwl, fsm processed\", \"state\":%{private}ld}", (uint8_t *)&v17, 0x1Cu);
  }
  [(CLDurianCommuteMetricManager *)self printCurrentStats];
}

- (void)observeDevice:(id)a3
{
  [(CLIntersiloUniverse *)self->_universe silo];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331C58);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
  {
    uint64_t state = self->_state;
    v7[0] = 68289539;
    v7[1] = 0;
    __int16 v8 = 2082;
    id v9 = "";
    __int16 v10 = 2049;
    uint64_t v11 = state;
    __int16 v12 = 2113;
    id v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#rwl, fsm observe device\", \"state\":%{private}ld, \"deviceID\":%{private, location:escape_only}@}", (uint8_t *)v7, 0x26u);
  }
  if ((self->_state & 0xFFFFFFFE) == 2) {
    [(CLDurianCommuteStats *)self->_stats addCarryingItem:a3];
  }
  [(CLDurianCommuteMetricManager *)self printCurrentStats];
}

- (void)_completeJourney
{
  [(CLIntersiloUniverse *)self->_universe silo];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331C58);
  }
  id v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    id v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#rwl, fsm complete journey\"}", (uint8_t *)v4, 0x12u);
  }
  [(CLDurianCommuteStats *)self->_stats completeJourney];
  [(CLDurianCommuteMetricManager *)self saveStats:self->_stats];
  [(CLDurianCommuteMetricManager *)self printCurrentStats];
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  if (![(CLDurianCommuteMetricManager *)self isDataCollectionAuthorized])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    objc_super v4 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
    {
      v5[0] = 68289026;
      v5[1] = 0;
      __int16 v6 = 2082;
      uint64_t v7 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, location auth change, clean stats.\"}", (uint8_t *)v5, 0x12u);
    }
    [(CLDurianCommuteMetricManager *)self resetStats];
  }
}

- (void)onVisit:(id)a3
{
  [(CLIntersiloUniverse *)self->_universe silo];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331C58);
  }
  __int16 v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
  {
    uint64_t state = self->_state;
    int v19 = 68290307;
    int v20 = 0;
    __int16 v21 = 2082;
    uint64_t v22 = "";
    __int16 v23 = 2049;
    uint64_t v24 = state;
    __int16 v25 = 2049;
    id v26 = [objc_msgSend(a3, "_placeInference") userType];
    __int16 v27 = 2114;
    id v28 = [a3 arrivalDate];
    __int16 v29 = 2114;
    id v30 = [a3 departureDate];
    __int16 v31 = 2113;
    id v32 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, fsm on visit (routine monitor)\", \"state\":%{private}ld, \"type\":%{private}ld, \"startDate\":%{public, location:escape_only}@, \"endDate\":%{public, location:escape_only}@, \"visit\":%{private, location:escape_only}@}", (uint8_t *)&v19, 0x44u);
  }
  if (a3)
  {
    [a3 coordinate];
    double v8 = v7;
    double v10 = v9;
    [a3 horizontalAccuracy];
    -[CLDurianCommuteMetricManager checkNearOrAtHome:horizontalAccuracy:](self, "checkNearOrAtHome:horizontalAccuracy:", v8, v10, v11);
    if ([a3 _placeInference])
    {
      unsigned __int8 v12 = [a3 hasDepartureDate];
      if (objc_msgSend(objc_msgSend(a3, "_placeInference"), "userType") == (id)1)
      {
        [a3 coordinate];
        self->_homeLocation.CLLocationDegrees latitude = v13;
        self->_homeLocation.CLLocationDegrees longitude = v14;
        __int16 v15 = self;
        if (v12) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = 2;
        }
        goto LABEL_20;
      }
      if (objc_msgSend(objc_msgSend(a3, "_placeInference"), "userType") == (id)2) {
        char v18 = v12;
      }
      else {
        char v18 = 1;
      }
      if ((v18 & 1) == 0)
      {
        __int16 v15 = self;
        uint64_t v16 = 3;
LABEL_20:
        [(CLDurianCommuteMetricManager *)v15 transitionWithEvent:v16];
      }
    }
    else
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331C58);
      }
      int v17 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
      {
        int v19 = 68289026;
        int v20 = 0;
        __int16 v21 = 2082;
        uint64_t v22 = "";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#rwl, fsm on visit (routine monitor), no SLV.\"}", (uint8_t *)&v19, 0x12u);
      }
    }
  }
}

- (void)didChangeConnectionStateForDevice:(id)a3 fromState:(unint64_t)a4 toState:(unint64_t)a5
{
  [(CLIntersiloUniverse *)self->_universe silo];
  if (a4 != a5)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    double v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
    {
      BOOL nearOrAtHome = self->_nearOrAtHome;
      v11[0] = 68290051;
      v11[1] = 0;
      __int16 v12 = 2082;
      CLLocationDegrees v13 = "";
      __int16 v14 = 1025;
      BOOL v15 = nearOrAtHome;
      __int16 v16 = 2113;
      id v17 = a3;
      __int16 v18 = 1026;
      int v19 = a4;
      __int16 v20 = 1026;
      int v21 = a5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#rwl, connection state updated\", \"_nearOrAtHome\":%{private}hhd, \"deviceID\":%{private, location:escape_only}@, \"oldState\":%{public}d, \"newState\":%{public}d}", (uint8_t *)v11, 0x2Eu);
    }
    if ((a5 == 4 || a5 == 2) && !self->_nearOrAtHome) {
      [(CLDurianCommuteMetricManager *)self observeDevice:a3];
    }
  }
}

- (void)didObserveScanForDevice:(id)a3
{
  [(CLIntersiloUniverse *)self->_universe silo];
  if (a3)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    __int16 v5 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
    {
      BOOL nearOrAtHome = self->_nearOrAtHome;
      int v8 = 68289283;
      int v9 = 0;
      __int16 v10 = 2082;
      double v11 = "";
      __int16 v12 = 1025;
      BOOL v13 = nearOrAtHome;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#rwl, didObserveScanForDevice UUID\", \"_nearOrAtHome\":%{private}hhd}", (uint8_t *)&v8, 0x18u);
    }
    if (!self->_nearOrAtHome) {
      [(CLDurianCommuteMetricManager *)self observeDevice:a3];
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    double v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      double v11 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#rwl, unable to retrieve UUID\"}", (uint8_t *)&v8, 0x12u);
    }
  }
}

- (id)keyFromDate:(id)a3
{
  dateFormatter = self->_dateFormatter;
  id v4 = [a3 startDayOfWeek];

  return [(NSDateFormatter *)dateFormatter stringFromDate:v4];
}

- (BOOL)lookupStatsWithDate:(id)a3 stats:(id)a4
{
  [(CLIntersiloUniverse *)self->_universe silo];
  if (!self->_statsLoaded)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    __int16 v10 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      uint64_t buf = 68289026;
      __int16 v19 = 2082;
      __int16 v20 = "";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#rwl, lookupStatsWithDate, cannot read data due to access to encrypted data\"}", (uint8_t *)&buf, 0x12u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331C58);
      }
    }
    double v11 = qword_102419398;
    if (!os_signpost_enabled((os_log_t)qword_102419398)) {
      return 0;
    }
    uint64_t buf = 68289026;
    __int16 v19 = 2082;
    __int16 v20 = "";
    __int16 v12 = "#rwl, lookupStatsWithDate, cannot read data due to access to encrypted data";
    BOOL v13 = "{\"msg%{public}.0s\":\"#rwl, lookupStatsWithDate, cannot read data due to access to encrypted data\"}";
    goto LABEL_25;
  }
  if (a3 && a4)
  {
    id v7 = [(CLDurianCommuteMetricManager *)self keyFromDate:a3];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    int v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
    {
      uint64_t buf = 68289282;
      __int16 v19 = 2082;
      __int16 v20 = "";
      __int16 v21 = 2082;
      id v22 = [v7 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, lookupStatsWithDate\", \"key\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
    }
    sub_1000E9354();
    if (sub_100012960((uint64_t)self->_metricCache, (const char *)[@"CLDurianCommuteStats" UTF8String], &buf))
    {
      sub_1000E9354();
      if (sub_100012960((uint64_t)&buf, (const char *)[v7 UTF8String], v17))
      {
        sub_1004CE794(v16);
        [a4 updateStatsWithNVP:v16];
        sub_10013F3C4(v16);
        sub_10013F3C4(v17);
        BOOL v9 = 1;
LABEL_29:
        sub_10013F3C4(&buf);
        return v9;
      }
      sub_10013F3C4(v17);
    }
    BOOL v9 = 0;
    goto LABEL_29;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331C58);
  }
  __int16 v14 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
  {
    uint64_t buf = 68289026;
    __int16 v19 = 2082;
    __int16 v20 = "";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#rwl, lookupStatsWithDate, invalid parameters\"}", (uint8_t *)&buf, 0x12u);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
  }
  double v11 = qword_102419398;
  if (os_signpost_enabled((os_log_t)qword_102419398))
  {
    uint64_t buf = 68289026;
    __int16 v19 = 2082;
    __int16 v20 = "";
    __int16 v12 = "#rwl, lookupStatsWithDate, invalid parameters";
    BOOL v13 = "{\"msg%{public}.0s\":\"#rwl, lookupStatsWithDate, invalid parameters\"}";
LABEL_25:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v12, v13, (uint8_t *)&buf, 0x12u);
  }
  return 0;
}

- (id)readAllStats
{
  [(CLIntersiloUniverse *)self->_universe silo];
  if (self->_statsLoaded)
  {
    sub_1000E9354();
    if (sub_100012960((uint64_t)self->_metricCache, (const char *)[@"CLDurianCommuteStats" UTF8String], v9))
    {
      id v3 = [[CLDurianCommuteStats alloc] initWithDate:+[NSDate date]];
      sub_1004CFF34((uint64_t)v9);
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    __int16 v6 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v11 = 2082;
      __int16 v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#rwl, read stats, stats don't exist\"}", buf, 0x12u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331C58);
      }
    }
    id v7 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v11 = 2082;
      __int16 v12 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#rwl, read stats, stats don't exist", "{\"msg%{public}.0s\":\"#rwl, read stats, stats don't exist\"}", buf, 0x12u);
    }
    sub_10013F3C4(v9);
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    id v4 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v11 = 2082;
      __int16 v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#rwl, readAllStats, cannot read data due to access to encrypted data\"}", buf, 0x12u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331C58);
      }
    }
    __int16 v5 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v11 = 2082;
      __int16 v12 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#rwl, readAllStats, cannot read data due to access to encrypted data", "{\"msg%{public}.0s\":\"#rwl, readAllStats, cannot read data due to access to encrypted data\"}", buf, 0x12u);
    }
  }
  return 0;
}

- (void)saveStats:(id)a3
{
  [(CLIntersiloUniverse *)self->_universe silo];
  if (self->_statsLoaded)
  {
    sub_1000E9354();
    if (!sub_100012960((uint64_t)self->_metricCache, (const char *)[@"CLDurianCommuteStats" UTF8String], v16))
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331C58);
      }
      __int16 v5 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)__int16 v18 = 2082;
        *(void *)&v18[2] = "";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, save stats, stats don't exist\"}", buf, 0x12u);
      }
    }
    id v6 = -[CLDurianCommuteMetricManager keyFromDate:](self, "keyFromDate:", [a3 startDate]);
    id v7 = (const char *)[v6 UTF8String];
    if (a3)
    {
      [a3 getNVPFromStats];
    }
    else
    {
      *(void *)uint64_t buf = 0;
      *(void *)__int16 v18 = 0;
    }
    sub_1004D3878((uint64_t)v16, v7, (uint64_t)buf);
    sub_10013F3C4(buf);
    sub_1004D3878((uint64_t)self->_metricCache, (const char *)[@"CLDurianCommuteStats" UTF8String], (uint64_t)v16);
    int v9 = (*(uint64_t (**)(void *))(*(void *)self->_metricCache + 944))(self->_metricCache);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    __int16 v10 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
    {
      id v11 = [v6 UTF8String];
      id v12 = [a3 startDate];
      id v13 = [a3 endDate];
      id v14 = [a3 deviceJourneyCount];
      id v15 = [objc_msgSend(a3, "itemJourneyStats") count];
      *(_DWORD *)uint64_t buf = 68290563;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)__int16 v18 = 2082;
      *(void *)&v18[2] = "";
      __int16 v19 = 2082;
      id v20 = v11;
      __int16 v21 = 2114;
      id v22 = v12;
      __int16 v23 = 2114;
      id v24 = v13;
      __int16 v25 = 2049;
      id v26 = v14;
      __int16 v27 = 2049;
      id v28 = v15;
      __int16 v29 = 1026;
      int v30 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, store done\", \"key\":%{public, location:escape_only}s, \"startDate\":%{public, location:escape_only}@, \"endDate\":%{public, location:escape_only}@, \"journeyCount\":%{private}ld, \"itemCount\":%{private}ld, \"result\":%{public}hhd}", buf, 0x4Au);
    }
    sub_10013F3C4(v16);
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    int v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)__int16 v18 = 2082;
      *(void *)&v18[2] = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, saveStats, cannot update due to access to encrypted data\"}", buf, 0x12u);
    }
  }
}

- (void)pruneOldStats
{
  [(CLIntersiloUniverse *)self->_universe silo];
  if (self->_statsLoaded)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    id v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v8 = 2082;
      int v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, prune old stats\"}", buf, 0x12u);
    }
    sub_1000E9354();
    if (sub_100012960((uint64_t)self->_metricCache, (const char *)[@"CLDurianCommuteStats" UTF8String], v6))
    {
      sub_1004CFF34((uint64_t)v6);
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    __int16 v5 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v8 = 2082;
      int v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, save stats, stats don't exist\"}", buf, 0x12u);
    }
    sub_10013F3C4(v6);
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    id v4 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v8 = 2082;
      int v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, pruneOldStats, cannot prune data due to access to encrypted data\"}", buf, 0x12u);
    }
  }
}

- (void)initAnalyticsTimer
{
  id v3 = (CLTimer *)[[-[CLIntersiloUniverse silo](self->_universe, "silo") newTimer];
  self->_analyticsTimer = v3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1015D75AC;
  v8[3] = &unk_10229FED8;
  v8[4] = self;
  [(CLTimer *)v3 setHandler:v8];
  double analyticsHoldoffInterval = self->_analyticsHoldoffInterval;
  double v5 = CFAbsoluteTimeGetCurrent() - self->_lastAnalyticsSubmissionTime;
  if (analyticsHoldoffInterval > v5) {
    double analyticsHoldoffInterval = 86400.0 - v5;
  }
  [(CLTimer *)self->_analyticsTimer setNextFireDelay:analyticsHoldoffInterval interval:self->_analyticsHoldoffInterval];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331C58);
  }
  id v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
  {
    double v7 = self->_analyticsHoldoffInterval;
    *(_DWORD *)uint64_t buf = 68289538;
    int v10 = 0;
    __int16 v11 = 2082;
    id v12 = "";
    __int16 v13 = 2050;
    double v14 = analyticsHoldoffInterval;
    __int16 v15 = 2050;
    double v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, Commute Metrics, init analytics timer\", \"delay\":\"%{public}f\", \"interval\":\"%{public}f\"}", buf, 0x26u);
  }
}

- (void)onAnalyticsTimerFired:(id)a3
{
  if (self->_analyticsTimer == a3)
  {
    self->_lastAnalyticsSubmissionTime = CFAbsoluteTimeGetCurrent();
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    id v4 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
    {
      double analyticsHoldoffInterval = self->_analyticsHoldoffInterval;
      v6[0] = 68289282;
      v6[1] = 0;
      __int16 v7 = 2082;
      __int16 v8 = "";
      __int16 v9 = 2050;
      double v10 = analyticsHoldoffInterval;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, Commute Metrics, timer fired\", \"interval\":\"%{public}f\"}", (uint8_t *)v6, 0x1Cu);
    }
    [(CLDurianCommuteMetricManager *)self sendMetrics];
  }
}

- (void)sendMetrics
{
  [(CLIntersiloUniverse *)self->_universe silo];
  if (!self->_statsLoaded)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    id v17 = qword_102419398;
    if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO)) {
      return;
    }
    uint64_t buf = 68289026;
    __int16 v35 = 2082;
    __int16 v36 = "";
    __int16 v18 = "{\"msg%{public}.0s\":\"#rwl, sendMetrics, skip metric submission due to access to encrypted data\"}";
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, v18, (uint8_t *)&buf, 0x12u);
    return;
  }
  [(CLDurianCommuteMetricManager *)self pruneOldStats];
  if (![(CLDurianCommuteMetricManager *)self isDataCollectionAuthorized])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    id v17 = qword_102419398;
    if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO)) {
      return;
    }
    uint64_t buf = 68289026;
    __int16 v35 = 2082;
    __int16 v36 = "";
    __int16 v18 = "{\"msg%{public}.0s\":\"#rwl, sendMetrics, skip metric submission.\"}";
    goto LABEL_31;
  }
  id v3 = [(CLDurianCommuteMetricManager *)self readAllStats];
  id v25 = [objc_msgSend(v3, "startDate") daysToDate:[v3 endDate]];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331C58);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
  {
    uint64_t buf = 68290307;
    __int16 v35 = 2082;
    __int16 v36 = "";
    __int16 v37 = 2114;
    id v38 = [v3 startDate];
    __int16 v39 = 2114;
    id v40 = [v3 endDate];
    __int16 v41 = 2050;
    id v42 = v25;
    __int16 v43 = 2049;
    id v44 = [v3 deviceJourneyCount];
    __int16 v45 = 2049;
    id v46 = [[objc_msgSend(v3, "itemJourneyStats") count];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, send metrics\", \"startDate\":%{public, location:escape_only}@, \"endDate\":%{public, location:escape_only}@, \"days\":%{public}ld, \"journeyCount\":%{private}ld, \"itemCount\":%{private}ld}", (uint8_t *)&buf, 0x44u);
  }
  if (v25 && [v3 deviceJourneyCount])
  {
    id v5 = [objc_msgSend(objc_msgSend(v3, "itemJourneyStats"), "count")];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = [[[[v3 itemJourneyStats] keysSortedByValueUsingSelector:@"journeyCount"] reverseObjectEnumerator];
    id v24 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v24)
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      double v8 = (double)(uint64_t)v5;
      uint64_t v23 = *(void *)v28;
LABEL_11:
      uint64_t v9 = 0;
      if (v6 <= 5) {
        uint64_t v10 = 5;
      }
      else {
        uint64_t v10 = v6;
      }
      uint64_t v11 = v6 - v10;
      while (1)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * v9);
        id v13 = [[[objc_msgSend(objc_msgSend(v3, "itemJourneyStats"), "objectForKey:", v12) journeyCount];
        double v14 = (double)(uint64_t)[v3 deviceJourneyCount];
        beaconManager = self->_beaconManager;
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_1015D7D1C;
        v26[3] = &unk_102331C38;
        v26[6] = v6 + v9;
        v26[7] = v25;
        double v16 = (double)(uint64_t)v13 / v14;
        v26[4] = self;
        v26[5] = v3;
        *(double *)&v26[8] = (double)(v6 + v9 + 1) / v8;
        if (v7 <= (uint64_t)v13) {
          uint64_t v7 = (uint64_t)v13;
        }
        v26[9] = (uint64_t)((double)(v6 + v9 + 1) / v8 * 10.0);
        *(double *)&v26[10] = v16;
        [(SPBeaconManager *)beaconManager beaconForUUID:v12 completion:v26];
        if (!(v11 + v9)) {
          break;
        }
        if (v24 == (id)++v9)
        {
          v6 += v9;
          id v24 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
          if (v24) {
            goto LABEL_11;
          }
          break;
        }
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    double v19 = (double)(uint64_t)[v3 deviceJourneyCount];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331C58);
    }
    id v20 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
    {
      id v21 = [v3 deviceJourneyCount];
      uint64_t buf = 68289539;
      __int16 v35 = 2082;
      __int16 v36 = "";
      __int16 v37 = 2049;
      id v38 = (id)v7;
      __int16 v39 = 2049;
      id v40 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#rwl, send summary metrics\", \"maxItemJourneyCount\":%{private}ld, \"journeyCount\":%{private}ld}", (uint8_t *)&buf, 0x26u);
    }
    v31[0] = @"DurationBinned";
    v32[0] = +[NSNumber numberWithInteger:[(CLDurianCommuteMetricManager *)self decimateInteger:v25]];
    v31[1] = @"TransitsBinned";
    v32[1] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CLDurianCommuteMetricManager decimateInteger:](self, "decimateInteger:", [v3 deviceJourneyCount]));
    v32[2] = @"Work";
    v31[2] = @"LOIType";
    v31[3] = @"ModelType";
    v32[3] = @"Commute";
    v31[4] = @"MaxParityRate";
    [(CLDurianCommuteMetricManager *)self decimateDoulbe:(double)v7 / v19];
    v32[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v31[5] = @"ItemCount";
    v32[5] = +[NSNumber numberWithInteger:[(CLDurianCommuteMetricManager *)self decimateInteger:v5]];
    +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:6];
    AnalyticsSendEvent();
  }
}

- (int64_t)decimateInteger:(int64_t)a3
{
  return 5 * (a3 / 5);
}

- (double)decimateDoulbe:(double)a3
{
  return (double)(uint64_t)(a3 * 100.0) / 100.0;
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

- (void).cxx_destruct
{
  value = self->_dataProtectionManagerClient.__ptr_.__value_;
  self->_dataProtectionManagerClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  return self;
}

@end