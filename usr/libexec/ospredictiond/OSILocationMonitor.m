@interface OSILocationMonitor
- (BOOL)inTypicalLocation;
- (BOOL)inTypicalLocationWithError:(id *)a3;
- (BOOL)isInSameTimeZone;
- (BOOL)locationIsUncertain:(id)a3;
- (BOOL)locationOfInterestFoundNear:(id)a3 withError:(id *)a4;
- (BOOL)notAuthorizedForLocation;
- (CLLocation)currentLocation;
- (CLLocationManager)locationManager;
- (OSILocationMonitor)init;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_semaphore)authorizationSemaphore;
- (OS_dispatch_semaphore)requestLocationSemaphore;
- (OS_os_log)log;
- (RTRoutineManager)routine;
- (id)likelyToBeInKnownArea;
- (int)authorizationStatus;
- (int64_t)inKnownMicrolocation;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)setAuthorizationSemaphore:(id)a3;
- (void)setAuthorizationStatus:(int)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setCurrentLocation:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequestLocationSemaphore:(id)a3;
- (void)setRoutine:(id)a3;
@end

@implementation OSILocationMonitor

- (OSILocationMonitor)init
{
  v18.receiver = self;
  v18.super_class = (Class)OSILocationMonitor;
  v2 = [(OSILocationMonitor *)&v18 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.osintelligence", "locationmonitor");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.osintelligence.locationmonitor.queue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.osintelligence.locsignalmonitor.callbackqueue", v8);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = +[RTRoutineManager defaultManager];
    routine = v2->_routine;
    v2->_routine = (RTRoutineManager *)v11;

    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    authorizationSemaphore = v2->_authorizationSemaphore;
    v2->_authorizationSemaphore = (OS_dispatch_semaphore *)v13;

    v15 = (CLLocationManager *)[objc_alloc((Class)CLLocationManager) initWithEffectiveBundlePath:@"/System/Library/LocationBundles/SystemCustomization.bundle" delegate:v2 onQueue:v2->_callbackQueue];
    locationManager = v2->_locationManager;
    v2->_locationManager = v15;

    [(CLLocationManager *)v2->_locationManager setDesiredAccuracy:100.0];
  }
  return v2;
}

- (BOOL)inTypicalLocation
{
  if ([(OSILocationMonitor *)self notAuthorizedForLocation])
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Not authorized for location", buf, 2u);
    }
    goto LABEL_9;
  }
  authorizationSemaphore = self->_authorizationSemaphore;
  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(authorizationSemaphore, v5);
  id v16 = 0;
  unsigned int v6 = [(OSILocationMonitor *)self inTypicalLocationWithError:&v16];
  id v7 = v16;
  v8 = v7;
  if (v6)
  {
    dispatch_queue_t v9 = self->_log;
    if (!os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    __int16 v15 = 0;
    v10 = "In a typical location";
    uint64_t v11 = (uint8_t *)&v15;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    goto LABEL_15;
  }
  if (!v7)
  {
    dispatch_queue_t v9 = self->_log;
    if (!os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    __int16 v14 = 0;
    v10 = "Not in a typical location";
    uint64_t v11 = (uint8_t *)&v14;
    goto LABEL_14;
  }

LABEL_9:
  v8 = [(OSILocationMonitor *)self likelyToBeInKnownArea];
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_10004280C();
  }
  v12 = [v8 objectForKeyedSubscript:@"value"];
  LOBYTE(v6) = [v12 BOOLValue];

LABEL_15:
  return v6;
}

- (BOOL)inTypicalLocationWithError:(id *)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B0AC;
  block[3] = &unk_100064B48;
  block[4] = self;
  dispatch_sync(queue, block);
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_currentLocation) {
      CFStringRef v7 = @"Have Location";
    }
    else {
      CFStringRef v7 = 0;
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Current location: %@", buf, 0xCu);
  }
  v8 = [(OSILocationMonitor *)self currentLocation];
  unsigned int v9 = [(OSILocationMonitor *)self locationIsUncertain:v8];

  if (v9) {
    [(CLLocationManager *)self->_locationManager startUpdatingLocation];
  }
  v10 = [(OSILocationMonitor *)self currentLocation];
  unsigned int v11 = [(OSILocationMonitor *)self locationIsUncertain:v10];

  if (v11)
  {
    v12 = [(OSILocationMonitor *)self requestLocationSemaphore];
    if (v12)
    {
      dispatch_time_t v13 = dispatch_time(0, 30000000000);
      dispatch_semaphore_wait(v12, v13);
    }
    [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
  }
  __int16 v14 = self->_log;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = v14;
    id v16 = [(OSILocationMonitor *)self currentLocation];
    if (v16) {
      CFStringRef v17 = @"Have Location";
    }
    else {
      CFStringRef v17 = 0;
    }
    objc_super v18 = [(CLLocationManager *)self->_locationManager location];
    if (v18) {
      CFStringRef v19 = @"Have Location";
    }
    else {
      CFStringRef v19 = 0;
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v30 = v17;
    __int16 v31 = 2112;
    CFStringRef v32 = v19;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Current location %@, Location manager location: %@", buf, 0x16u);
  }
  v20 = [(OSILocationMonitor *)self currentLocation];
  v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    id v22 = [(CLLocationManager *)self->_locationManager location];
  }
  v23 = v22;

  BOOL v24 = [(OSILocationMonitor *)self locationOfInterestFoundNear:v23 withError:a3];
  v25 = self->_queue;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10001B124;
  v27[3] = &unk_100064B48;
  v27[4] = self;
  dispatch_sync(v25, v27);

  return v24;
}

- (BOOL)locationOfInterestFoundNear:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if ([(OSILocationMonitor *)self locationIsUncertain:v6])
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Location is uncertain; assuming conservatively we are not in typical location.",
        buf,
        2u);
    }
    +[NSError errorWithDomain:@"com.apple.ospredictiond" code:1 userInfo:&off_1000698B0];
    BOOL v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    *(void *)buf = 0;
    CFStringRef v32 = buf;
    uint64_t v33 = 0x3032000000;
    v34 = sub_10001B57C;
    v35 = sub_10001B58C;
    id v36 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = sub_10001B57C;
    v29[4] = sub_10001B58C;
    id v30 = 0;
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    routine = self->_routine;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10001B594;
    v25[3] = &unk_100064D88;
    v27 = v29;
    v25[4] = self;
    unsigned int v11 = v9;
    v26 = v11;
    v28 = buf;
    [(RTRoutineManager *)routine fetchLocationsOfInterestWithinDistance:v6 ofLocation:v25 withHandler:200.0];
    dispatch_time_t v12 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v11, v12))
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        sub_100042880();
      }
      +[NSError errorWithDomain:@"com.apple.ospredictiond" code:2 userInfo:&off_1000698D8];
      BOOL v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if ([*((id *)v32 + 5) count])
    {
      BOOL v8 = 1;
    }
    else
    {
      uint64_t v21 = 0;
      id v22 = &v21;
      uint64_t v23 = 0x2020000000;
      char v24 = 0;
      dispatch_semaphore_t v13 = dispatch_semaphore_create(0);

      __int16 v14 = self->_routine;
      __int16 v15 = +[NSDate dateWithTimeIntervalSinceNow:-259200.0];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10001B738;
      v18[3] = &unk_100064DB0;
      v18[4] = self;
      v20 = &v21;
      unsigned int v11 = v13;
      CFStringRef v19 = v11;
      [(RTRoutineManager *)v14 fetchLocationsOfInterestVisitedSinceDate:v15 withHandler:v18];

      dispatch_time_t v16 = dispatch_time(0, 30000000000);
      if (dispatch_semaphore_wait(v11, v16))
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
          sub_100042880();
        }
        +[NSError errorWithDomain:@"com.apple.osintelligence" code:2 userInfo:&off_100069900];
        BOOL v8 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v8 = *((unsigned char *)v22 + 24) == 0;
      }

      _Block_object_dispose(&v21, 8);
    }

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(buf, 8);
  }
  return v8;
}

- (BOOL)locationIsUncertain:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = v4;
  if (v4)
  {
    [v4 horizontalAccuracy];
    if (v6 <= 200.0)
    {
      BOOL v11 = 0;
      goto LABEL_9;
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = log;
      [v5 horizontalAccuracy];
      dispatch_semaphore_t v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      int v13 = 138412290;
      __int16 v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Horizontal accuracy: %@. Returning uncertain", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    v10 = self->_log;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "No location: Returning uncertain", (uint8_t *)&v13, 2u);
    }
  }
  BOOL v11 = 1;
LABEL_9:

  return v11;
}

- (BOOL)notAuthorizedForLocation
{
  int authorizationStatus = self->_authorizationStatus;
  if (authorizationStatus) {
    BOOL v3 = authorizationStatus == 3;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (id)likelyToBeInKnownArea
{
  BOOL v3 = +[NSMutableDictionary dictionary];
  int64_t v4 = [(OSILocationMonitor *)self inKnownMicrolocation];
  if (v4 == -1)
  {
    [v3 setObject:@"TimeZone" forKeyedSubscript:@"reason"];
    unsigned int v10 = [(OSILocationMonitor *)self isInSameTimeZone];
    log = self->_log;
    BOOL v11 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        BOOL v8 = "Device has has been in consistent timezones; Not opting out of feature";
        dispatch_semaphore_t v9 = buf;
        goto LABEL_8;
      }
LABEL_9:
      dispatch_time_t v12 = &__kCFBooleanTrue;
      goto LABEL_16;
    }
    if (v11)
    {
      *(_WORD *)objc_super v18 = 0;
      int v13 = "Device has been through multiple timezones; Opting out of feature";
      __int16 v14 = v18;
      goto LABEL_14;
    }
  }
  else
  {
    int64_t v5 = v4;
    [v3 setObject:@"Microlocation" forKeyedSubscript:@"reason"];
    log = self->_log;
    BOOL v7 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        __int16 v17 = 0;
        BOOL v8 = "In a known micro-location; Not opting out of the feature";
        dispatch_semaphore_t v9 = (uint8_t *)&v17;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    if (v7)
    {
      LOWORD(v16) = 0;
      int v13 = "Not In a known micro-location; Opting out of the feature";
      __int16 v14 = (uint8_t *)&v16;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
    }
  }
  dispatch_time_t v12 = &__kCFBooleanFalse;
LABEL_16:
  [v3 setObject:v12 forKeyedSubscript:@"value" atIndex:v16];

  return v3;
}

- (int64_t)inKnownMicrolocation
{
  BOOL v3 = +[OSIntelligenceUtilities lastPluggedInDate];
  [v3 timeIntervalSinceReferenceDate];
  uint64_t v5 = v4;

  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  double v6 = BiomeLibrary();
  BOOL v7 = [v6 Location];
  BOOL v8 = [v7 MicroLocationVisit];

  dispatch_semaphore_t v9 = [v8 publisher];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001BDB0;
  v19[3] = &unk_100064AA8;
  v19[4] = self;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  uint8_t v18[2] = sub_10001BE14;
  v18[3] = &unk_100064DD8;
  v18[7] = v5;
  v18[4] = self;
  void v18[5] = &v24;
  v18[6] = &v20;
  id v10 = [v9 sinkWithCompletion:v19 receiveInput:v18];

  if (*((unsigned char *)v25 + 24))
  {
    int v11 = *((unsigned __int8 *)v21 + 24);
    log = self->_log;
    BOOL v13 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        *(_WORD *)__int16 v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Microlocation event near pluggedIn time", v17, 2u);
      }
      int64_t v14 = 1;
    }
    else
    {
      if (v13)
      {
        *(_WORD *)__int16 v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "No matching microlocation found", v17, 2u);
      }
      int64_t v14 = 0;
    }
  }
  else
  {
    __int16 v15 = self->_log;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_DEFAULT, "No microlocations found. Falling back to TimeZone check", v17, 2u);
    }
    int64_t v14 = -1;
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v14;
}

- (BOOL)isInSameTimeZone
{
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = sub_10001B57C;
  v54 = sub_10001B58C;
  id v55 = 0;
  BOOL v3 = BiomeLibrary();
  uint64_t v4 = [v3 Device];
  uint64_t v5 = [v4 TimeZone];

  double v6 = [v5 publisher];
  BOOL v7 = [v6 last];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10001C58C;
  v49[3] = &unk_100064AA8;
  v49[4] = self;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_10001C5F0;
  v48[3] = &unk_100064E00;
  v48[4] = &v50;
  id v8 = [v7 sinkWithCompletion:v49 receiveInput:v48];

  if (v51[5])
  {
    dispatch_semaphore_t v9 = self->_log;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG))
    {
      [(id)v51[5] secondsFromGMT];
      sub_1000429CC(v62, v9, v10);
    }

    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    int v47 = 0;
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2020000000;
    int v43 = 0;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 0;
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = sub_10001B57C;
    v34[4] = sub_10001B58C;
    id v35 = 0;
    int v11 = BiomeLibrary();
    dispatch_time_t v12 = [v11 Device];
    BOOL v13 = [v12 Power];
    int64_t v14 = [v13 PluggedIn];

    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    int v33 = -1;
    __int16 v15 = [v5 publisher];
    uint64_t v16 = [v14 publisher];
    __int16 v17 = [v15 orderedMergeWithOther:v16 comparator:&stru_100064E20];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10001C6D8;
    v31[3] = &unk_100064E48;
    v31[4] = v34;
    v31[5] = v32;
    objc_super v18 = [v17 filterWithIsIncluded:v31];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10001C80C;
    v30[3] = &unk_100064AA8;
    v30[4] = self;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10001C8BC;
    v29[3] = &unk_100064E70;
    v29[4] = self;
    void v29[5] = &v36;
    v29[6] = v34;
    v29[7] = &v50;
    v29[8] = &v44;
    v29[9] = &v40;
    id v19 = [v18 sinkWithCompletion:v30 receiveInput:v29];

    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
    {
      int v26 = *((_DWORD *)v41 + 6);
      int v27 = *((_DWORD *)v45 + 6);
      int v28 = *((unsigned __int8 *)v37 + 24);
      *(_DWORD *)buf = 67109632;
      int v57 = v26;
      __int16 v58 = 1024;
      int v59 = v27;
      __int16 v60 = 1024;
      int v61 = v28;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEBUG, "differentTimeZone: %d - sameTimeZone: %d, foundEvents %d", buf, 0x14u);
    }
    int v21 = *((_DWORD *)v41 + 6);
    if (v21)
    {
      int v22 = *((_DWORD *)v45 + 6);
      BOOL v23 = v22 >= 11 && v22 / v21 > 3;
    }
    else
    {
      BOOL v23 = 1;
    }
    _Block_object_dispose(v32, 8);

    _Block_object_dispose(v34, 8);
    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);
  }
  else
  {
    uint64_t v24 = [(OSILocationMonitor *)self log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100042998();
    }

    BOOL v23 = 0;
  }

  _Block_object_dispose(&v50, 8);
  return v23;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = [a3 authorizationStatus];
  log = self->_log;
  BOOL v6 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT);
  if (v4 == 3)
  {
    if (v6)
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Authorized for OSIntelligence", (uint8_t *)&v9, 2u);
    }
  }
  else if (v6)
  {
    BOOL v7 = log;
    id v8 = +[NSNumber numberWithInt:v4];
    int v9 = 138412290;
    double v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Authorization status: %@", (uint8_t *)&v9, 0xCu);
  }
  self->_int authorizationStatus = (int)v4;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_authorizationSemaphore);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_100042B8C();
  }
  [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001CC90;
  v8[3] = &unk_100064E98;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(queue, v8);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Location Manager failed with error: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (RTRoutineManager)routine
{
  return self->_routine;
}

- (void)setRoutine:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (CLLocation)currentLocation
{
  return (CLLocation *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentLocation:(id)a3
{
}

- (int)authorizationStatus
{
  return self->_authorizationStatus;
}

- (void)setAuthorizationStatus:(int)a3
{
  self->_int authorizationStatus = a3;
}

- (OS_dispatch_semaphore)requestLocationSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRequestLocationSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)authorizationSemaphore
{
  return self->_authorizationSemaphore;
}

- (void)setAuthorizationSemaphore:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_authorizationSemaphore, 0);
  objc_storeStrong((id *)&self->_requestLocationSemaphore, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);

  objc_storeStrong((id *)&self->_routine, 0);
}

@end