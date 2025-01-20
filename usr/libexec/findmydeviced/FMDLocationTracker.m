@interface FMDLocationTracker
+ (id)stringForLocationTrackerType:(unsigned __int8)a3;
- (BOOL)isTrackingOn;
- (BOOL)trackNotifyEnabled;
- (BOOL)trackingStarted;
- (CLLocation)lastLocation;
- (FMDLocationManaging)locManager;
- (FMDLocationTracker)initWithType:(unsigned __int8)a3;
- (FMDLocationTrackerDelegate)delegate;
- (FMDLocator)locator;
- (FMDTrackedLocationsStore)trackedLocationsStore;
- (NSDate)lastFallbackRetryTime;
- (NSDictionary)locateParams;
- (PCPersistentTimer)fallbackRetryTimer;
- (double)keepAlive;
- (double)minDistanceBetweenLocations;
- (double)minSLCAccuracyThreshold;
- (double)minTimeBetweenLocations;
- (double)minTimeBetweenServerCalls;
- (double)periodicCheckInterval;
- (id)fallbackTimerXPCTransactionName;
- (id)newLocationManager;
- (int64_t)maxLocations;
- (int64_t)trackingStatus;
- (unsigned)locationTrackerType;
- (void)_loadTrackingInfo;
- (void)_startLocateCycleWithLocatorPublishingBlock:(id)a3 andStoppedLocatingBlock:(id)a4;
- (void)_startTracking;
- (void)_stopFallbackRetryTimer;
- (void)_stopTracking;
- (void)_storeTrackingInfo;
- (void)_updateFallbackRetryTimer;
- (void)_updateFallbackRetryTimerUsingLocation:(id)a3;
- (void)actOnTrackedLocationsUsingBlock:(id)a3;
- (void)dealloc;
- (void)deleteLocationTrackingInfoAndStopTracking;
- (void)deregisterDelegate:(id)a3;
- (void)didAddNewTrackedLocation:(id)a3;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)recordLocation:(id)a3 ofType:(unsigned __int8)a4;
- (void)registerDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFallbackRetryTimer:(id)a3;
- (void)setKeepAlive:(double)a3;
- (void)setLastFallbackRetryTime:(id)a3;
- (void)setLastLocation:(id)a3;
- (void)setLocManager:(id)a3;
- (void)setLocateParams:(id)a3;
- (void)setLocationTrackerType:(unsigned __int8)a3;
- (void)setLocator:(id)a3;
- (void)setMaxLocations:(int64_t)a3;
- (void)setMinDistanceBetweenLocations:(double)a3;
- (void)setMinSLCAccuracyThreshold:(double)a3;
- (void)setMinTimeBetweenLocations:(double)a3;
- (void)setMinTimeBetweenServerCalls:(double)a3;
- (void)setPeriodicCheckInterval:(double)a3;
- (void)setTrackNotifyEnabled:(BOOL)a3;
- (void)setTrackedLocationsStore:(id)a3;
- (void)setTrackingStarted:(BOOL)a3;
- (void)setTrackingStatus:(int64_t)a3;
- (void)updateLocationTrackingInfoWithTrackingStatus:(int64_t)a3 minSLCAccuracyThreshold:(double)a4 locateParams:(id)a5 trackNotifyEnabled:(BOOL)a6 maxLocations:(int64_t)a7 keepAlive:(double)a8 periodicCheckInterval:(double)a9 minDistanceBetweenLocations:(double)a10 minTimeBetweenLocations:(double)a11 minTimeBetweenServerCalls:(double)a12;
@end

@implementation FMDLocationTracker

+ (id)stringForLocationTrackerType:(unsigned __int8)a3
{
  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v4 = +[NSBundle mainBundle];
    v5 = [v4 bundleIdentifier];
    v3 = +[NSString stringWithFormat:@"%@.%@", v5, @"lostmodetracks"];
  }

  return v3;
}

- (FMDLocationTracker)initWithType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMDLocationTracker;
  v4 = [(FMDLocationTracker *)&v8 init];
  v5 = v4;
  if (v4)
  {
    [(FMDLocationTracker *)v4 setLocationTrackerType:v3];
    [(FMDLocationTracker *)v5 _loadTrackingInfo];
    v6 = [[FMDTrackedLocationsStore alloc] initWithLocationTracker:v5];
    [(FMDLocationTracker *)v5 setTrackedLocationsStore:v6];
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100240EDC(self);
  }

  v4 = [(FMDLocationTracker *)self locator];
  [v4 stopLocator];

  [(FMDLocationTracker *)self _stopFallbackRetryTimer];
  v5 = [(FMDLocationTracker *)self locManager];
  [v5 setDelegate:0];

  v6.receiver = self;
  v6.super_class = (Class)FMDLocationTracker;
  [(FMDLocationTracker *)&v6 dealloc];
}

- (void)registerDelegate:(id)a3
{
  [(FMDLocationTracker *)self setDelegate:a3];
  if ([(FMDLocationTracker *)self isTrackingOn])
  {
    [(FMDLocationTracker *)self _startTracking];
  }
}

- (void)deregisterDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDLocationTracker *)self delegate];

  if (!v5 || v5 == v4) {
    [(FMDLocationTracker *)self _stopTracking];
  }
  [(FMDLocationTracker *)self setDelegate:0];
}

- (void)updateLocationTrackingInfoWithTrackingStatus:(int64_t)a3 minSLCAccuracyThreshold:(double)a4 locateParams:(id)a5 trackNotifyEnabled:(BOOL)a6 maxLocations:(int64_t)a7 keepAlive:(double)a8 periodicCheckInterval:(double)a9 minDistanceBetweenLocations:(double)a10 minTimeBetweenLocations:(double)a11 minTimeBetweenServerCalls:(double)a12
{
  BOOL v18 = a6;
  id v22 = a5;
  [(FMDLocationTracker *)self setMinSLCAccuracyThreshold:a4];
  [(FMDLocationTracker *)self setLocateParams:v22];

  [(FMDLocationTracker *)self setTrackingStatus:a3];
  [(FMDLocationTracker *)self setTrackNotifyEnabled:v18];
  [(FMDLocationTracker *)self setMaxLocations:a7];
  [(FMDLocationTracker *)self setKeepAlive:a8];
  [(FMDLocationTracker *)self setPeriodicCheckInterval:a9];
  [(FMDLocationTracker *)self setMinDistanceBetweenLocations:a10];
  [(FMDLocationTracker *)self setMinTimeBetweenLocations:a11];
  [(FMDLocationTracker *)self setMinTimeBetweenServerCalls:a12];
  if (![(FMDLocationTracker *)self trackingStatus]) {
    [(FMDLocationTracker *)self setTrackingStatus:400];
  }
  [(FMDLocationTracker *)self _storeTrackingInfo];
  v23 = [(FMDLocationTracker *)self delegate];

  if (v23)
  {
    if ([(FMDLocationTracker *)self isTrackingOn])
    {
      [(FMDLocationTracker *)self _startTracking];
    }
    else
    {
      [(FMDLocationTracker *)self _stopTracking];
    }
  }
}

- (void)deleteLocationTrackingInfoAndStopTracking
{
  [(FMDLocationTracker *)self _stopTracking];
  [(FMDLocationTracker *)self setTrackingStatus:400];
  [(FMDLocationTracker *)self _storeTrackingInfo];

  [(FMDLocationTracker *)self _loadTrackingInfo];
}

- (void)didAddNewTrackedLocation:(id)a3
{
  id v4 = a3;
  [(FMDLocationTracker *)self _updateFallbackRetryTimer];
  id v5 = [(FMDLocationTracker *)self delegate];
  [v5 didAddNewTrackedLocation:v4];
}

- (void)actOnTrackedLocationsUsingBlock:(id)a3
{
  id v5 = a3;
  if ([(FMDLocationTracker *)self isTrackingOn])
  {
    id v4 = [(FMDLocationTracker *)self trackedLocationsStore];
    [v4 actOnTrackedLocationsUsingBlock:v5];
  }
}

- (void)recordLocation:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v7 = a3;
  if ([(FMDLocationTracker *)self isTrackingOn])
  {
    objc_super v6 = [(FMDLocationTracker *)self trackedLocationsStore];
    [v6 recordLocation:v7 ofType:v4];
  }
}

- (BOOL)isTrackingOn
{
  return [(FMDLocationTracker *)self trackingStatus] >= 200
      && [(FMDLocationTracker *)self trackingStatus] < 400;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    objc_super v8 = [v7 lastObject];
    if (![(FMDLocationTracker *)self isTrackingOn])
    {
      v13 = [(FMDLocationTracker *)self delegate];
      v14 = [v13 fm_logID];

      v15 = sub_100004238();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_1002434D8();
      }

      [(FMDLocationTracker *)self _stopTracking];
      goto LABEL_12;
    }
    v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100243450(v8);
    }

    v10 = [(FMDLocationTracker *)self locator];
    BOOL v11 = v10 == 0;

    if (v11)
    {
      v16 = sub_100059618();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v17 = [v8 type];
        [v8 horizontalAccuracy];
        uint64_t v19 = v18;
        [v8 coordinate];
        uint64_t v21 = v20;
        [v8 coordinate];
        *(_DWORD *)buf = 67109889;
        *(_DWORD *)v53 = v17;
        *(_WORD *)&v53[4] = 2049;
        *(void *)&v53[6] = v19;
        __int16 v54 = 2049;
        uint64_t v55 = v21;
        __int16 v56 = 2049;
        uint64_t v57 = v22;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Processing SLC location with Position Type = %u, Accuracy = %{private}f, Latitude = %{private}f, Longitude = %{private}f", buf, 0x26u);
      }

      [v8 horizontalAccuracy];
      if (v23 >= 0.0)
      {
        v26 = [(FMDLocationTracker *)self locateParams];
        v27 = [v26 objectForKeyedSubscript:@"validityDuration"];
        [v27 doubleValue];
        double v29 = v28;

        v30 = +[NSDate date];
        [v30 timeIntervalSinceReferenceDate];
        double v32 = v31;

        v33 = [v8 timestamp];
        [v33 timeIntervalSinceReferenceDate];
        double v35 = v34;

        if (v32 - v35 <= v29)
        {
          [v8 horizontalAccuracy:v32 - v35];
          double v37 = v36;
          [(FMDLocationTracker *)self minSLCAccuracyThreshold];
          if (v37 <= v38)
          {
            [(FMDLocationTracker *)self setLastLocation:v8];
            v45 = [[CLLocationFMGeoLocatableAdapter alloc] initWithLocation:v8];
            v46 = [(FMDLocationTracker *)self trackedLocationsStore];
            [v46 recordLocation:v45 ofType:1];
          }
          else
          {
            v39 = sub_100004238();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
              sub_1002433C8(v39);
            }

            objc_initWeak(&location, self);
            v49[0] = _NSConcreteStackBlock;
            v49[1] = 3221225472;
            v49[2] = sub_1000B56F8;
            v49[3] = &unk_1002DCD98;
            objc_copyWeak(&v50, &location);
            v40 = objc_retainBlock(v49);
            v47[0] = _NSConcreteStackBlock;
            v47[1] = 3221225472;
            v47[2] = sub_1000B57F0;
            v47[3] = &unk_1002D93C8;
            objc_copyWeak(&v48, &location);
            v41 = objc_retainBlock(v47);
            [(FMDLocationTracker *)self _startLocateCycleWithLocatorPublishingBlock:v40 andStoppedLocatingBlock:v41];
            v42 = sub_100004238();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              v43 = [(FMDLocationTracker *)self locator];
              v44 = [v43 fm_logID];
              sub_100243368(v44, buf, v42, v43);
            }

            objc_destroyWeak(&v48);
            objc_destroyWeak(&v50);
            objc_destroyWeak(&location);
          }
          goto LABEL_12;
        }
        v24 = sub_100004238();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)v53 = v29;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "SLC location is older than %.0f seconds. Ignoring this", buf, 0xCu);
        }
      }
      else
      {
        v24 = sub_100004238();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          [v8 horizontalAccuracy];
          *(_DWORD *)buf = 134217984;
          *(void *)v53 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Invalid SLC location found with horizontalAccuracy of %f", buf, 0xCu);
        }
      }
    }
    else
    {
      v12 = sub_100004238();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_10024340C(v12);
      }
    }
LABEL_12:
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  id v5 = sub_100004238();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100243684();
  }
}

- (id)newLocationManager
{
  if ([(FMDLocationTracker *)self locationTrackerType]) {
    return 0;
  }
  uint64_t v3 = +[FMDLocationManagerFactory sharedInstance];
  id v4 = [v3 newLocationManager];

  return v4;
}

- (void)_startTracking
{
  if (+[FMDPreferencesMgr dontUseSLC])
  {
    uint64_t v3 = sub_100004238();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SLC has been forcibly disabled. Not starting tracking.", (uint8_t *)&v13, 2u);
    }
  }
  else
  {
    id v4 = [(FMDLocationTracker *)self newLocationManager];
    [(FMDLocationTracker *)self setLocManager:v4];

    id v5 = [(FMDLocationTracker *)self locManager];
    [v5 setDelegate:self];

    id v6 = [(FMDLocationTracker *)self locManager];
    [v6 setDistanceFilter:kCLDistanceFilterNone];

    id v7 = [(FMDLocationTracker *)self locManager];
    [v7 startMonitoringSignificantLocationChanges];

    uint64_t v3 = [(FMDLocationTracker *)self delegate];
    objc_super v8 = sub_100004238();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v3 fm_logID];
      int v13 = 138412290;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Enabling SLC for %@", (uint8_t *)&v13, 0xCu);
    }
    v10 = +[NSDate date];
    [(FMDLocationTracker *)self setLastFallbackRetryTime:v10];

    [(FMDLocationTracker *)self _updateFallbackRetryTimer];
    BOOL v11 = sub_100004238();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v3 fm_logID];
      int v13 = 138412290;
      v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Tracking is now active for %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)_stopTracking
{
  uint64_t v3 = [(FMDLocationTracker *)self delegate];
  id v4 = [(FMDLocationTracker *)self locManager];

  if (v4)
  {
    id v5 = sub_100004238();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v3 fm_logID];
      int v14 = 138412290;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Disabling SLC for %@, if it was previously enabled", (uint8_t *)&v14, 0xCu);
    }
    id v7 = [(FMDLocationTracker *)self locManager];
    [v7 stopMonitoringSignificantLocationChanges];

    objc_super v8 = [(FMDLocationTracker *)self locManager];
    [v8 setDelegate:0];

    [(FMDLocationTracker *)self setLocManager:0];
  }
  v9 = sub_100004238();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v3 fm_logID];
    int v14 = 138412290;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Tracking is now inactive for %@", (uint8_t *)&v14, 0xCu);
  }
  [(FMDLocationTracker *)self _stopFallbackRetryTimer];
  [(FMDLocationTracker *)self setLastFallbackRetryTime:0];
  BOOL v11 = [(FMDLocationTracker *)self trackedLocationsStore];
  [v11 deleteAllTrackedLocations];

  v12 = [(FMDLocationTracker *)self locator];

  if (v12)
  {
    int v13 = [(FMDLocationTracker *)self locator];
    [v13 stopLocator];

    [(FMDLocationTracker *)self setLocator:0];
  }
  [(FMDLocationTracker *)self setLastLocation:0];
}

- (void)_startLocateCycleWithLocatorPublishingBlock:(id)a3 andStoppedLocatingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B5E30;
  block[3] = &unk_1002DCDE8;
  objc_copyWeak(&v13, &location);
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_stopFallbackRetryTimer
{
  uint64_t v3 = [(FMDLocationTracker *)self fallbackRetryTimer];

  if (v3)
  {
    id v4 = [(FMDLocationTracker *)self fallbackRetryTimer];
    [(FMDLocationTracker *)self setFallbackRetryTimer:0];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B6578;
    block[3] = &unk_1002D9378;
    id v9 = v4;
    id v5 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    id v6 = +[FMXPCTransactionManager sharedInstance];
    id v7 = [(FMDLocationTracker *)self fallbackTimerXPCTransactionName];
    [v6 endTransaction:v7];
  }
}

- (void)_updateFallbackRetryTimer
{
  uint64_t v3 = [(FMDLocationTracker *)self fallbackRetryTimer];

  id v4 = [(FMDLocationTracker *)self trackedLocationsStore];
  id v8 = [v4 lastLocation];

  [(FMDLocationTracker *)self _updateFallbackRetryTimerUsingLocation:v8];
  id v5 = [(FMDLocationTracker *)self fallbackRetryTimer];

  if (v5)
  {
    if (v3) {
      goto LABEL_7;
    }
    id v6 = +[FMXPCTransactionManager sharedInstance];
    id v7 = [(FMDLocationTracker *)self fallbackTimerXPCTransactionName];
    [v6 beginTransaction:v7];
  }
  else
  {
    if (!v3) {
      goto LABEL_7;
    }
    id v6 = +[FMXPCTransactionManager sharedInstance];
    id v7 = [(FMDLocationTracker *)self fallbackTimerXPCTransactionName];
    [v6 endTransaction:v7];
  }

LABEL_7:
}

- (id)fallbackTimerXPCTransactionName
{
  return +[NSString stringWithFormat:@"TrackingFallbackRetryTimer-%lX", self];
}

- (void)_updateFallbackRetryTimerUsingLocation:(id)a3
{
  id v32 = a3;
  id v4 = [(FMDLocationTracker *)self fallbackRetryTimer];
  if (v4)
  {
    [(FMDLocationTracker *)self setFallbackRetryTimer:0];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B6CC8;
    block[3] = &unk_1002D9378;
    id v41 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  [(FMDLocationTracker *)self periodicCheckInterval];
  BOOL v6 = v5 > 0.0;
  id v7 = sub_100004238();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Checking whether I need to start a SLC fallback for tracked locations", buf, 2u);
    }

    id v9 = [(FMDLocationTracker *)self locator];
    if (v9)
    {
      v10 = [(FMDLocationTracker *)self locator];
      unsigned int v11 = [v10 locatorRunning];

      if (v11)
      {
        id v7 = sub_100004238();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v12 = "A locate cycle is already in progress. Not starting the fallback now.";
          id v13 = v7;
          uint32_t v14 = 2;
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
          goto LABEL_31;
        }
        goto LABEL_31;
      }
    }
    id v7 = [v32 timeStamp];
    double v31 = [(FMDLocationTracker *)self lastFallbackRetryTime];
    if (v7)
    {
      if (v31)
      {
        v30 = -[NSObject laterDate:](v7, "laterDate:");
LABEL_19:
        unsigned int v17 = sub_100004238();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          [(FMDLocationTracker *)self periodicCheckInterval];
          *(_DWORD *)buf = 138413058;
          v43 = v31;
          __int16 v44 = 2112;
          v45 = v7;
          __int16 v46 = 2112;
          v47 = v30;
          __int16 v48 = 2048;
          uint64_t v49 = v29;
          _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "lastFallbackRetryTime:%@ lastLocationTime:%@ latestRetryTime:%@ periodicCheckInterval:%f", buf, 0x2Au);
        }

        [(FMDLocationTracker *)self periodicCheckInterval];
        uint64_t v18 = [v30 dateByAddingTimeInterval:];
        uint64_t v19 = +[NSDate date];
        BOOL v20 = [v19 compare:v18] == (id)-1;
        uint64_t v21 = sub_100004238();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
        if (v20)
        {
          if (v22)
          {
            *(_DWORD *)buf = 138412290;
            v43 = v18;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Scheduling SLC fallback of tracked locations for %@", buf, 0xCu);
          }

          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_1000B6E34;
          v33[3] = &unk_1002D9378;
          id v34 = [objc_alloc((Class)PCPersistentTimer) initWithFireDate:v18 serviceIdentifier:@"com.apple.icloud.findmydeviced.trackingFallbackRetry" target:self selector:"_updateFallbackRetryTimer" userInfo:0];
          id v28 = v34;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, v33);
          [(FMDLocationTracker *)self setFallbackRetryTimer:v28];
        }
        else
        {
          if (v22)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Time to do a SLC fallback for tracked locations", buf, 2u);
          }

          [(FMDLocationTracker *)self setLastFallbackRetryTime:v19];
          objc_initWeak(&location, self);
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_1000B6CD0;
          v37[3] = &unk_1002DCD98;
          objc_copyWeak(&v38, &location);
          double v23 = objc_retainBlock(v37);
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_1000B6DC8;
          v35[3] = &unk_1002D93C8;
          objc_copyWeak(&v36, &location);
          v24 = objc_retainBlock(v35);
          [(FMDLocationTracker *)self _startLocateCycleWithLocatorPublishingBlock:v23 andStoppedLocatingBlock:v24];
          uint64_t v25 = sub_100004238();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            v26 = [(FMDLocationTracker *)self locator];
            v27 = [v26 fm_logID];
            sub_1002436F8(v27, buf, v25, v26);
          }

          objc_destroyWeak(&v36);
          objc_destroyWeak(&v38);
          objc_destroyWeak(&location);
        }

        goto LABEL_31;
      }
      v16 = v7;
    }
    else
    {
      v16 = v31;
    }
    v30 = v16;
    goto LABEL_19;
  }
  if (v8)
  {
    [(FMDLocationTracker *)self periodicCheckInterval];
    *(_DWORD *)buf = 134217984;
    v43 = v15;
    id v12 = "SLC fallback is disabled (interval is %f)";
    id v13 = v7;
    uint32_t v14 = 12;
    goto LABEL_12;
  }
LABEL_31:
}

- (void)_storeTrackingInfo
{
  if ((id)[(FMDLocationTracker *)self trackingStatus] == (id)400)
  {
    uint64_t v3 = 0;
  }
  else
  {
    v17[0] = @"minSLCAccuracyThreshold";
    [(FMDLocationTracker *)self minSLCAccuracyThreshold];
    v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v18[0] = v16;
    v17[1] = @"locateParams";
    uint64_t v4 = [(FMDLocationTracker *)self locateParams];
    v15 = (void *)v4;
    double v5 = &__NSDictionary0__struct;
    if (v4) {
      double v5 = (void *)v4;
    }
    v18[1] = v5;
    v17[2] = @"trackingStatus";
    uint32_t v14 = +[NSNumber numberWithInteger:[(FMDLocationTracker *)self trackingStatus]];
    v18[2] = v14;
    v17[3] = @"trackNotifyEnabled";
    BOOL v6 = +[NSNumber numberWithBool:[(FMDLocationTracker *)self trackNotifyEnabled]];
    v18[3] = v6;
    v17[4] = @"maxLocations";
    id v7 = +[NSNumber numberWithInteger:[(FMDLocationTracker *)self maxLocations]];
    v18[4] = v7;
    v17[5] = @"keepAlive";
    [(FMDLocationTracker *)self keepAlive];
    BOOL v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v18[5] = v8;
    v17[6] = @"periodicCheckInterval";
    [(FMDLocationTracker *)self periodicCheckInterval];
    id v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v18[6] = v9;
    v17[7] = @"minDistanceBetweenLocations";
    [(FMDLocationTracker *)self minDistanceBetweenLocations];
    v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v18[7] = v10;
    v17[8] = @"minTimeBetweenLocations";
    [(FMDLocationTracker *)self minTimeBetweenLocations];
    unsigned int v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v18[8] = v11;
    v17[9] = @"minTimeBetweenServerCalls";
    [(FMDLocationTracker *)self minTimeBetweenServerCalls];
    id v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v18[9] = v12;
    uint64_t v3 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:10];
  }
  id v13 = +[FMDLocationTracker stringForLocationTrackerType:[(FMDLocationTracker *)self locationTrackerType]];
  +[FMDPreferencesMgr setTrackingInfo:v3 forType:v13];
}

- (void)_loadTrackingInfo
{
  uint64_t v3 = +[FMDLocationTracker stringForLocationTrackerType:[(FMDLocationTracker *)self locationTrackerType]];
  id v14 = +[FMDPreferencesMgr trackingInfoForType:v3];

  uint64_t v4 = [v14 objectForKeyedSubscript:@"minSLCAccuracyThreshold"];
  [v4 doubleValue];
  -[FMDLocationTracker setMinSLCAccuracyThreshold:](self, "setMinSLCAccuracyThreshold:");

  double v5 = [v14 objectForKeyedSubscript:@"locateParams"];
  [(FMDLocationTracker *)self setLocateParams:v5];

  BOOL v6 = [v14 objectForKeyedSubscript:@"trackingStatus"];
  -[FMDLocationTracker setTrackingStatus:](self, "setTrackingStatus:", [v6 integerValue]);

  id v7 = [v14 objectForKeyedSubscript:@"trackNotifyEnabled"];
  -[FMDLocationTracker setTrackNotifyEnabled:](self, "setTrackNotifyEnabled:", [v7 BOOLValue]);

  BOOL v8 = [v14 objectForKeyedSubscript:@"maxLocations"];
  -[FMDLocationTracker setMaxLocations:](self, "setMaxLocations:", [v8 integerValue]);

  id v9 = [v14 objectForKeyedSubscript:@"keepAlive"];
  [v9 doubleValue];
  -[FMDLocationTracker setKeepAlive:](self, "setKeepAlive:");

  v10 = [v14 objectForKeyedSubscript:@"periodicCheckInterval"];
  [v10 doubleValue];
  -[FMDLocationTracker setPeriodicCheckInterval:](self, "setPeriodicCheckInterval:");

  unsigned int v11 = [v14 objectForKeyedSubscript:@"minDistanceBetweenLocations"];
  [v11 doubleValue];
  -[FMDLocationTracker setMinDistanceBetweenLocations:](self, "setMinDistanceBetweenLocations:");

  id v12 = [v14 objectForKeyedSubscript:@"minTimeBetweenLocations"];
  [v12 doubleValue];
  -[FMDLocationTracker setMinTimeBetweenLocations:](self, "setMinTimeBetweenLocations:");

  id v13 = [v14 objectForKeyedSubscript:@"minTimeBetweenServerCalls"];
  [v13 doubleValue];
  -[FMDLocationTracker setMinTimeBetweenServerCalls:](self, "setMinTimeBetweenServerCalls:");

  if (![(FMDLocationTracker *)self trackingStatus]) {
    [(FMDLocationTracker *)self setTrackingStatus:400];
  }
}

- (double)minSLCAccuracyThreshold
{
  return self->_minSLCAccuracyThreshold;
}

- (void)setMinSLCAccuracyThreshold:(double)a3
{
  self->_minSLCAccuracyThreshold = a3;
}

- (NSDictionary)locateParams
{
  return self->_locateParams;
}

- (void)setLocateParams:(id)a3
{
}

- (int64_t)trackingStatus
{
  return self->_trackingStatus;
}

- (void)setTrackingStatus:(int64_t)a3
{
  self->_trackingStatus = a3;
}

- (BOOL)trackNotifyEnabled
{
  return self->_trackNotifyEnabled;
}

- (void)setTrackNotifyEnabled:(BOOL)a3
{
  self->_trackNotifyEnabled = a3;
}

- (int64_t)maxLocations
{
  return self->_maxLocations;
}

- (void)setMaxLocations:(int64_t)a3
{
  self->_maxLocations = a3;
}

- (double)keepAlive
{
  return self->_keepAlive;
}

- (void)setKeepAlive:(double)a3
{
  self->_keepAlive = a3;
}

- (double)periodicCheckInterval
{
  return self->_periodicCheckInterval;
}

- (void)setPeriodicCheckInterval:(double)a3
{
  self->_periodicCheckInterval = a3;
}

- (double)minDistanceBetweenLocations
{
  return self->_minDistanceBetweenLocations;
}

- (void)setMinDistanceBetweenLocations:(double)a3
{
  self->_minDistanceBetweenLocations = a3;
}

- (double)minTimeBetweenLocations
{
  return self->_minTimeBetweenLocations;
}

- (void)setMinTimeBetweenLocations:(double)a3
{
  self->_minTimeBetweenLocations = a3;
}

- (double)minTimeBetweenServerCalls
{
  return self->_minTimeBetweenServerCalls;
}

- (void)setMinTimeBetweenServerCalls:(double)a3
{
  self->_minTimeBetweenServerCalls = a3;
}

- (unsigned)locationTrackerType
{
  return self->_locationTrackerType;
}

- (void)setLocationTrackerType:(unsigned __int8)a3
{
  self->_locationTrackerType = a3;
}

- (FMDLocationTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FMDLocationTrackerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)trackingStarted
{
  return self->_trackingStarted;
}

- (void)setTrackingStarted:(BOOL)a3
{
  self->_trackingStarted = a3;
}

- (CLLocation)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
}

- (FMDLocationManaging)locManager
{
  return self->_locManager;
}

- (void)setLocManager:(id)a3
{
}

- (FMDLocator)locator
{
  return self->_locator;
}

- (void)setLocator:(id)a3
{
}

- (PCPersistentTimer)fallbackRetryTimer
{
  return self->_fallbackRetryTimer;
}

- (void)setFallbackRetryTimer:(id)a3
{
}

- (NSDate)lastFallbackRetryTime
{
  return self->_lastFallbackRetryTime;
}

- (void)setLastFallbackRetryTime:(id)a3
{
}

- (FMDTrackedLocationsStore)trackedLocationsStore
{
  return self->_trackedLocationsStore;
}

- (void)setTrackedLocationsStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedLocationsStore, 0);
  objc_storeStrong((id *)&self->_lastFallbackRetryTime, 0);
  objc_storeStrong((id *)&self->_fallbackRetryTimer, 0);
  objc_storeStrong((id *)&self->_locator, 0);
  objc_storeStrong((id *)&self->_locManager, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_locateParams, 0);
}

@end