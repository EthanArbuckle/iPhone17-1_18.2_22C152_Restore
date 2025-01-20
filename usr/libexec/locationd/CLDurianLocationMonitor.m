@interface CLDurianLocationMonitor
+ (BOOL)isSupported;
- (BOOL)isLocation:(id)a3 validOnDate:(id)a4 maxHorizontalAccuracy:(double)a5;
- (BOOL)valid;
- (CLDurianLocationMonitor)initWithUniverse:(id)a3;
- (CLDurianLocationMonitorDelegate)delegate;
- (CLLocation)lastlocation;
- (NSDate)lastEvaluationDate;
- (NSMutableArray)currentLocationRequests;
- (id)lastValidLocationWithHorizontalAccuracy:(double)a3 evaluationDate:(id)a4 error:(id *)a5;
- (int64_t)binTimeInterval:(double)a3;
- (void)dealloc;
- (void)evaluateLastLocation;
- (void)fetchCurrentLocationWithHandler:(id)a3;
- (void)fetchEstimatedLocationAtDate:(id)a3 handler:(id)a4;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)onStopActiveLocationRequestTimerExpiry;
- (void)sendEstimatedLocationMetricsAfterLocationScanWithFirstEstimatedLocation:(id)a3 newLocation:(id)a4 secondEstimatedLocation:(id)a5 error:(id)a6 timeOfInterest:(id)a7 referenceTime:(id)a8 responseTime:(id)a9;
- (void)sendEstimatedLocationMetricsAtFirstAttemptForEstimatedLocation:(id)a3 estimationError:(id)a4 timeOfInterest:(id)a5 referenceTime:(id)a6 responseTime:(id)a7;
- (void)sendLastLocation:(id)a3 error:(id)a4;
- (void)setCurrentLocationRequests:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDesiredAccuracy:(double)a3;
- (void)setLastEvaluationDate:(id)a3;
- (void)setLastlocation:(id)a3;
- (void)setValid:(BOOL)a3;
- (void)startActiveLocationRequest;
- (void)startLeechingLocation;
- (void)stopActiveLocationRequest;
- (void)stopLeechingLocation;
- (void)updateEstimatedLocationMetrics:(id)a3 currentLocation:(id)a4 estimatedLocation:(id)a5;
@end

@implementation CLDurianLocationMonitor

- (CLDurianLocationMonitor)initWithUniverse:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CLDurianLocationMonitor;
  v4 = [(CLDurianLocationMonitor *)&v14 init];
  v5 = v4;
  if (v4)
  {
    [(CLDurianLocationMonitor *)v4 setValid:1];
    v6 = [objc_msgSend(a3, "silo") queue];
    v5->_locationManager = (CLLocationManager *)[objc_alloc((Class)CLLocationManager) initWithEffectiveBundlePath:@"/System/Library/LocationBundles/FindMyDevice.framework/" delegate:v5 onQueue:v6];
    v7 = (CLRoutineMonitorServiceProtocol *)[objc_msgSend(objc_msgSend(a3, "vendor"), "proxyForService:", @"CLRoutineMonitor")];
    v5->_routineMonitor = v7;
    -[CLRoutineMonitorServiceProtocol registerDelegate:inSilo:](v7, "registerDelegate:inSilo:", v5, [a3 silo]);
    [(CLRoutineMonitorServiceProtocol *)v5->_routineMonitor setDelegateEntityName:"CLDurianLocationMonitor"];
    [(CLDurianLocationMonitor *)v5 setDesiredAccuracy:kCLLocationAccuracyLeech];
    v5->_leechingLocation = 0;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331BA8);
    }
    v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      signed int v9 = +[CLLocationManager authorizationStatusForBundlePath:@"/System/Library/LocationBundles/FindMyDevice.framework/"];
      *(_DWORD *)buf = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      v18 = "";
      __int16 v19 = 2049;
      uint64_t v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #location authorization status\", \"authorizationStatus\":%{private}ld}", buf, 0x1Cu);
    }
    v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v6);
    v5->_stopActiveLocationRequestTimer = (OS_dispatch_source *)v10;
    dispatch_source_set_timer(v10, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
    stopActiveLocationRequestTimer = v5->_stopActiveLocationRequestTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1015CDD04;
    handler[3] = &unk_10229FED8;
    handler[4] = v5;
    dispatch_source_set_event_handler(stopActiveLocationRequestTimer, handler);
    dispatch_resume((dispatch_object_t)v5->_stopActiveLocationRequestTimer);
    v5->_currentLocationRequests = (NSMutableArray *)objc_opt_new();
  }
  return v5;
}

- (void)dealloc
{
  [(CLDurianLocationMonitor *)self setLastEvaluationDate:0];
  stopActiveLocationRequestTimer = self->_stopActiveLocationRequestTimer;
  if (stopActiveLocationRequestTimer)
  {
    dispatch_source_cancel(stopActiveLocationRequestTimer);
    self->_stopActiveLocationRequestTimer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CLDurianLocationMonitor;
  [(CLDurianLocationMonitor *)&v4 dealloc];
}

+ (BOOL)isSupported
{
  return 1;
}

- (void)startLeechingLocation
{
  if (!self->_leechingLocation)
  {
    self->_leechingLocation = 1;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331BA8);
    }
    v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 68289026;
      v4[1] = 0;
      __int16 v5 = 2082;
      v6 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #location startLeechingLocation\"}", (uint8_t *)v4, 0x12u);
    }
    [(CLLocationManager *)self->_locationManager startUpdatingLocation];
  }
}

- (void)stopLeechingLocation
{
  if (self->_leechingLocation)
  {
    self->_leechingLocation = 0;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331BA8);
    }
    v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 68289026;
      v4[1] = 0;
      __int16 v5 = 2082;
      v6 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #location stopLeechingLocation\"}", (uint8_t *)v4, 0x12u);
    }
    [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
  }
}

- (void)fetchEstimatedLocationAtDate:(id)a3 handler:(id)a4
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BA8);
  }
  v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v14 = 0;
    __int16 v15 = 2082;
    int v16 = "";
    __int16 v17 = 2082;
    v18 = [(NSString *)+[NSDateFormatter localizedStringFromDate:a3 dateStyle:1 timeStyle:4] UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #location fetchEstimatedLocationAtDate\", \"date\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  if (a4)
  {
    if (self->_enabled)
    {
      v8 = +[NSDate date];
      routineMonitor = self->_routineMonitor;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1015CE248;
      v12[3] = &unk_102331B88;
      v12[4] = self;
      v12[5] = a3;
      v12[6] = v8;
      v12[7] = a4;
      [(CLRoutineMonitorServiceProtocol *)routineMonitor fetchEstimatedLocationAtDate:a3 withReply:v12];
    }
    else
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331BA8);
      }
      v11 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        int v14 = 0;
        __int16 v15 = 2082;
        int v16 = "";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #location DurianLocationMonitor is disabled\"}", buf, 0x12u);
      }
      (*((void (**)(id, void, NSError *))a4 + 2))(a4, 0, +[NSError errorWithDomain:kCLErrorDomain code:1 userInfo:0]);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331BA8);
    }
    v10 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      int v14 = 0;
      __int16 v15 = 2082;
      int v16 = "";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #location handler is nil\"}", buf, 0x12u);
    }
  }
}

- (void)fetchCurrentLocationWithHandler:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BA8);
  }
  __int16 v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 68289026;
    int v9 = 0;
    __int16 v10 = 2082;
    v11 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #location fetchCurrentLocationWithHandler\"}", (uint8_t *)&v8, 0x12u);
  }
  if (a3)
  {
    if (self->_enabled)
    {
      [(NSMutableArray *)[(CLDurianLocationMonitor *)self currentLocationRequests] addObject:_Block_copy(a3)];
      [(CLDurianLocationMonitor *)self setLastEvaluationDate:+[NSDate date]];
      [(CLDurianLocationMonitor *)self evaluateLastLocation];
    }
    else
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331BA8);
      }
      v7 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
      {
        int v8 = 68289026;
        int v9 = 0;
        __int16 v10 = 2082;
        v11 = "";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #location DurianLocationMonitor is disabled\"}", (uint8_t *)&v8, 0x12u);
      }
      (*((void (**)(id, void, NSError *))a3 + 2))(a3, 0, +[NSError errorWithDomain:kCLErrorDomain code:1 userInfo:0]);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331BA8);
    }
    v6 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      v11 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #location handler is nil\"}", (uint8_t *)&v8, 0x12u);
    }
  }
}

- (void)startActiveLocationRequest
{
  if ([(NSMutableArray *)[(CLDurianLocationMonitor *)self currentLocationRequests] count])
  {
    [(CLLocationManager *)self->_locationManager desiredAccuracy];
    if (v3 != -1.0)
    {
      [(CLDurianLocationMonitor *)self setDesiredAccuracy:-1.0];
      stopActiveLocationRequestTimer = self->_stopActiveLocationRequestTimer;
      dispatch_time_t v5 = dispatch_time(0, 15000000000);
      dispatch_source_set_timer(stopActiveLocationRequestTimer, v5, 0x37E11D600uLL, 0x1DCD6500uLL);
    }
  }
}

- (void)stopActiveLocationRequest
{
  [(CLLocationManager *)self->_locationManager desiredAccuracy];
  if (v3 != kCLLocationAccuracyLeech)
  {
    [(CLDurianLocationMonitor *)self setDesiredAccuracy:2147483650.0];
    stopActiveLocationRequestTimer = self->_stopActiveLocationRequestTimer;
    dispatch_source_set_timer(stopActiveLocationRequestTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)setDesiredAccuracy:(double)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BA8);
  }
  dispatch_time_t v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    __int16 v7 = 2082;
    int v8 = "";
    __int16 v9 = 2050;
    double v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #location updating desiredAccuracy\", \"desiredAccuracy\":\"%{public}f\"}", (uint8_t *)v6, 0x1Cu);
  }
  [(CLLocationManager *)self->_locationManager setDesiredAccuracy:a3];
}

- (void)sendLastLocation:(id)a3 error:(id)a4
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  currentLocationRequests = self->_currentLocationRequests;
  id v8 = [(NSMutableArray *)currentLocationRequests countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(currentLocationRequests);
        }
        v12 = *(void (***)(void, void, void))(*((void *)&v13 + 1) + 8 * i);
        ((void (**)(void, id, id))v12)[2](v12, a3, a4);
        _Block_release(v12);
      }
      id v9 = [(NSMutableArray *)currentLocationRequests countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
  [(NSMutableArray *)self->_currentLocationRequests removeAllObjects];
  [(CLDurianLocationMonitor *)self stopActiveLocationRequest];
}

- (void)evaluateLastLocation
{
  if ([(NSMutableArray *)[(CLDurianLocationMonitor *)self currentLocationRequests] count])
  {
    id v3 = [(CLDurianLocationMonitor *)self lastValidLocationWithHorizontalAccuracy:[(CLDurianLocationMonitor *)self lastEvaluationDate] evaluationDate:0 error:15.0];
    if (v3)
    {
      [(CLDurianLocationMonitor *)self sendLastLocation:v3 error:0];
    }
    else
    {
      [(CLDurianLocationMonitor *)self startActiveLocationRequest];
    }
  }
}

- (BOOL)isLocation:(id)a3 validOnDate:(id)a4 maxHorizontalAccuracy:(double)a5
{
  if (!a3) {
    return 0;
  }
  [a3 horizontalAccuracy];
  if (v8 <= 0.0) {
    return 0;
  }
  [a3 horizontalAccuracy];
  if (v9 > a5) {
    return 0;
  }
  [a3 clientLocation];
  if (v16 >= 15.0) {
    double v11 = v16;
  }
  else {
    double v11 = 15.0;
  }
  [a4 timeIntervalSinceReferenceDate];
  double v13 = v12;
  [a3 clientLocation];
  double v14 = v13 - v15;
  if (v13 - v15 < 0.0) {
    double v14 = -(v13 - v15);
  }
  return v11 >= v14;
}

- (id)lastValidLocationWithHorizontalAccuracy:(double)a3 evaluationDate:(id)a4 error:(id *)a5
{
  v6 = (NSDate *)a4;
  if (!a4) {
    v6 = +[NSDate date];
  }
  if ([(CLDurianLocationMonitor *)self isLocation:self->_lastlocation validOnDate:v6 maxHorizontalAccuracy:a3])
  {
    return self->_lastlocation;
  }
  double v9 = [(CLLocationManager *)self->_locationManager location];
  if (![(CLDurianLocationMonitor *)self isLocation:v9 validOnDate:v6 maxHorizontalAccuracy:a3])
  {
    double v9 = 0;
    if (a5) {
      *a5 = +[NSError errorWithDomain:kCLErrorDomain code:0 userInfo:0];
    }
  }
  return v9;
}

- (void)onStopActiveLocationRequestTimerExpiry
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BA8);
  }
  id v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = 68289026;
    __int16 v6 = 2082;
    __int16 v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #location active request timeout fired\"}", (uint8_t *)&v5, 0x12u);
  }
  id v4 = [(CLDurianLocationMonitor *)self lastValidLocationWithHorizontalAccuracy:[(CLDurianLocationMonitor *)self lastEvaluationDate] evaluationDate:&v5 error:250.0];
  [(CLDurianLocationMonitor *)self sendLastLocation:v4 error:v5];
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [a4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(a4);
        }
        [(CLDurianLocationMonitor *)self setLastlocation:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9)];
        [(CLDurianLocationMonitor *)self evaluateLastLocation];
        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [a4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BA8);
  }
  id v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289283;
    v7[1] = 0;
    __int16 v8 = 2082;
    double v9 = "";
    __int16 v10 = 2049;
    uint64_t v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #location authorization changed\", \"authorizationStatus\":%{private}ld}", (uint8_t *)v7, 0x1Cu);
  }
  self->_enabled = a4 == 3;
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BA8);
  }
  id v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = 68289283;
    __int16 v8 = 2082;
    double v9 = "";
    __int16 v10 = 2113;
    id v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #location location failed\", \"error\":%{private, location:escape_only}@}", (uint8_t *)&v7, 0x1Cu);
  }
  [(CLDurianLocationMonitor *)self sendLastLocation:[(CLDurianLocationMonitor *)self lastValidLocationWithHorizontalAccuracy:[(CLDurianLocationMonitor *)self lastEvaluationDate] evaluationDate:&v7 error:250.0] error:a4];
}

- (int64_t)binTimeInterval:(double)a3
{
  return 10 * (int)(a3 / 10.0);
}

- (void)updateEstimatedLocationMetrics:(id)a3 currentLocation:(id)a4 estimatedLocation:(id)a5
{
  [objc_msgSend(a4, "timestamp") timeIntervalSinceDate:objc_msgSend(a5, "timestamp")];
  [a3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:")] forKeyedSubscript:@"timestampDiff"];
  [a4 distanceFromLocation:a5];
  [a3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:")] forKeyedSubscript:@"locationDiff"];
  [a4 distanceFromLocation:a5];
  double v9 = v8;
  [a4 horizontalAccuracy];
  [a3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", fmax(v9 - v10, 0.0))] forKeyedSubscript:@"locationDistance"];
  [a4 horizontalAccuracy];
  double v12 = v11;
  [a5 horizontalAccuracy];
  [a3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12 - v13)] forKeyedSubscript:@"horizontalAccuracyDiff"];
  [a5 horizontalAccuracy];
  if (v14 > 0.0)
  {
    [a4 distanceFromLocation:a5];
    double v16 = v15 * 100.0;
    [a5 horizontalAccuracy];
    v18 = +[NSNumber numberWithDouble:v16 / v17];
    [a3 setObject:v18 forKeyedSubscript:@"locationDistanceAccuracyRatio"];
  }
}

- (void)sendEstimatedLocationMetricsAtFirstAttemptForEstimatedLocation:(id)a3 estimationError:(id)a4 timeOfInterest:(id)a5 referenceTime:(id)a6 responseTime:(id)a7
{
  id v13 = +[NSMutableDictionary dictionary];
  [a5 timeIntervalSinceDate:a6];
  [v13 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:") forKeyedSubscript:@"timeAdjusted"];
  [a5 timeIntervalSinceDate:a6];
  [v13 setObject:[NSNumber numberWithInteger:][CLDurianLocationMonitor binTimeInterval:self] forKeyedSubscript:@"timeAdjustedBin"];
  [a7 timeIntervalSinceDate:a6];
  [v13 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:")] forKeyedSubscript:@"responseDelay"];
  if (a3)
  {
    [v13 setObject:&off_1023951F8 forKeyedSubscript:@"result1"];
    id v14 = [(CLDurianLocationMonitor *)self lastValidLocationWithHorizontalAccuracy:a6 evaluationDate:0 error:250.0];
    if (v14) {
      [(CLDurianLocationMonitor *)self updateEstimatedLocationMetrics:v13 currentLocation:v14 estimatedLocation:a3];
    }
  }
  else if (a4)
  {
    [v13 setObject:&off_102395210 forKeyedSubscript:@"result1"];
  }

  AnalyticsSendEvent();
}

- (void)sendEstimatedLocationMetricsAfterLocationScanWithFirstEstimatedLocation:(id)a3 newLocation:(id)a4 secondEstimatedLocation:(id)a5 error:(id)a6 timeOfInterest:(id)a7 referenceTime:(id)a8 responseTime:(id)a9
{
  id v15 = +[NSMutableDictionary dictionary];
  [a7 timeIntervalSinceDate:a8];
  [v15 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:") forKeyedSubscript:@"timeAdjusted"];
  [a7 timeIntervalSinceDate:a8];
  [v15 setObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CLDurianLocationMonitor binTimeInterval:](self, "binTimeInterval:"))] forKeyedSubscript:@"timeAdjustedBin"];
  [a9 timeIntervalSinceDate:a8];
  [v15 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:") forKeyedSubscript:@"responseDelay"];
  if (a3)
  {
    double v16 = &off_102395228;
  }
  else if ([(CLDurianLocationMonitor *)self lastValidLocationWithHorizontalAccuracy:a8 evaluationDate:0 error:250.0])
  {
    double v16 = &off_102395240;
  }
  else
  {
    double v16 = &off_102395258;
  }
  [v15 setObject:v16 forKeyedSubscript:@"result1"];
  if (a5)
  {
    [v15 setObject:&off_1023951F8 forKeyedSubscript:@"result2"];
    if (a4) {
      [(CLDurianLocationMonitor *)self updateEstimatedLocationMetrics:v15 currentLocation:a4 estimatedLocation:a5];
    }
  }
  else
  {
    if (a4)
    {
      double v17 = &off_102395240;
    }
    else if (a6)
    {
      double v17 = &off_102395210;
    }
    else
    {
      double v17 = &off_102395258;
    }
    [v15 setObject:v17 forKeyedSubscript:@"result2"];
  }

  AnalyticsSendEvent();
}

- (NSDate)lastEvaluationDate
{
  return self->lastEvaluationDate;
}

- (void)setLastEvaluationDate:(id)a3
{
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

- (CLDurianLocationMonitorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLDurianLocationMonitorDelegate *)a3;
}

- (CLLocation)lastlocation
{
  return self->_lastlocation;
}

- (void)setLastlocation:(id)a3
{
}

- (NSMutableArray)currentLocationRequests
{
  return self->_currentLocationRequests;
}

- (void)setCurrentLocationRequests:(id)a3
{
}

@end