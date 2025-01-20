@interface CLZoneRelevanceTracker
- (CLDaemonLocation)currentLocation;
- (CLZoneRelevanceTracker)initWithClientManagerPointer:(void *)a3 andUniverse:(id)a4;
- (id).cxx_construct;
- (void)dealloc;
- (void)handleEntryExitDelegateCallbackForRegion:(id)a3 withState:(int64_t)a4;
- (void)invalidate;
- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5;
- (void)locationManager:(id)a3 didEnterRegion:(id)a4;
- (void)locationManager:(id)a3 didExitRegion:(id)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4;
- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
- (void)onLeechedNotification:(int)a3 withData:(NotificationData *)a4;
- (void)startCircularZoneMonitoringForClient:(id)a3 withZoneId:(id)a4 latitude:(double)a5 longitude:(double)a6 radius:(double)a7;
- (void)startStopCircularZoneMonitoringForClient:(id)a3 withZoneId:(id)a4 latitude:(double)longitude longitude:(double)latitude radius:(double)a7 shouldStart:(BOOL)a8;
- (void)stopCircularZoneMonitoringForClient:(id)a3 withZoneId:(id)a4;
@end

@implementation CLZoneRelevanceTracker

- (void)onLeechedNotification:(int)a3 withData:(NotificationData *)a4
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CA700);
  }
  v7 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290307;
    int v22 = 0;
    __int16 v23 = 2082;
    v24 = "";
    __int16 v25 = 2050;
    uint64_t v26 = a3;
    __int16 v27 = 1040;
    int v28 = 156;
    __int16 v29 = 2097;
    p_currentLocation = &self->_currentLocation;
    __int16 v31 = 1040;
    int v32 = 156;
    __int16 v33 = 2097;
    v34 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#pla #zone-relevance-tracker, location notification\", \"notification\":%{public, location:CLLocationProvider_Type::Notification}lld, \"_currentLocation\":%{private, location:CLClientLocation}.*P, \"NewLocation\":%{private, location:CLClientLocation}.*P}", buf, 0x3Cu);
  }
  if (a3 == 5)
  {
    if (sub_1000E6DB4((uint64_t)a4))
    {
      if (*(double *)((char *)a4 + 76) - *(double *)((char *)&self->_currentLocation.courseAccuracy + 4) >= 0.0)
      {
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022CA700);
        }
        v12 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "#pla #zone-relevance-tracker Accepting New Location", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_1022CA700);
          }
          v20 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLZoneRelevanceTracker onLeechedNotification:withData:]", "%s\n", v20);
          if (v20 != (char *)buf) {
            free(v20);
          }
        }
        long long v13 = *((_OWORD *)a4 + 1);
        *(_OWORD *)&self->_currentLocation.suitability = *(_OWORD *)a4;
        *(_OWORD *)&self->_currentLocation.coordinate.longitude = v13;
        long long v14 = *((_OWORD *)a4 + 2);
        long long v15 = *((_OWORD *)a4 + 3);
        long long v16 = *((_OWORD *)a4 + 5);
        *(_OWORD *)&self->_currentLocation.course = *((_OWORD *)a4 + 4);
        *(_OWORD *)&self->_currentLocation.timestamp = v16;
        *(_OWORD *)&self->_currentLocation.altitude = v14;
        *(_OWORD *)&self->_currentLocation.speed = v15;
        long long v17 = *((_OWORD *)a4 + 6);
        $AB5116BA7E623E054F959CECB034F4E7 v18 = ($AB5116BA7E623E054F959CECB034F4E7)*((_OWORD *)a4 + 7);
        long long v19 = *((_OWORD *)a4 + 8);
        *(_OWORD *)&self->_currentLocation.integrity = *(_OWORD *)((char *)a4 + 140);
        self->_currentLocation.rawCoordinate = v18;
        *(_OWORD *)&self->_currentLocation.rawCourse = v19;
        *(_OWORD *)&self->_currentLocation.lifespan = v17;
        sub_10000A824(*(void *)&self->_currentLocation.ellipsoidalAltitude, &self->_currentLocation.suitability);
      }
      else
      {
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022CA700);
        }
        v8 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#pla #zone-relevance-tracker stale, older than _currentLocation. Not accepting new location", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419530 == -1) {
            goto LABEL_29;
          }
          goto LABEL_43;
        }
      }
    }
    else
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CA700);
      }
      v11 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "#pla #zone-relevance-tracker invalid lat/lon. Not accepting new location", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419530 == -1)
        {
LABEL_29:
          v10 = (uint8_t *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLZoneRelevanceTracker onLeechedNotification:withData:]", "%s\n");
LABEL_30:
          if (v10 != buf) {
            free(v10);
          }
          return;
        }
LABEL_43:
        dispatch_once(&qword_102419530, &stru_1022CA700);
        goto LABEL_29;
      }
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CA700);
    }
    v9 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      int v22 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#pla #zone-relevance-tracker: Unexpected notification: %{public}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CA700);
      }
      v10 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLZoneRelevanceTracker onLeechedNotification:withData:]", "%s\n");
      goto LABEL_30;
    }
  }
}

- (CLZoneRelevanceTracker)initWithClientManagerPointer:(void *)a3 andUniverse:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CLZoneRelevanceTracker;
  v6 = [(CLZoneRelevanceTracker *)&v8 init];
  if (v6)
  {
    v6->_universe = (CLIntersiloUniverse *)a4;
    *(void *)&v6->_currentLocation.ellipsoidalAltitude = a3;
    *(void *)&v6->_currentLocation.fromSimulationController = [objc_alloc((Class)CLLocationManager) initWithEffectiveBundlePath:@"/System/Library/LocationBundles/PLAMonitor.bundle" delegate:v6 onQueue:[-[CLIntersiloUniverse silo](v6->_universe, "silo") queue]];
    LOBYTE(v6->_clientManager) = 1;
    sub_100681630();
  }
  return 0;
}

- (void)dealloc
{
  [*((id *)self->_locationClient.__ptr_.__value_ + 2) unregister:*((void *)self->_locationClient.__ptr_.__value_ + 1) forNotification:5];
  value = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8))(value);
  }

  *(void *)&self->_currentLocation.fromSimulationController = 0;
  v4.receiver = self;
  v4.super_class = (Class)CLZoneRelevanceTracker;
  [(CLZoneRelevanceTracker *)&v4 dealloc];
}

- (void)invalidate
{
  LOBYTE(self->_clientManager) = 0;
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CA700);
  }
  v5 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    __int16 v7 = 2082;
    objc_super v8 = "";
    __int16 v9 = 2082;
    id v10 = [[objc_msgSend(a4, "identifier") UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#pla #zone-relevance-tracker region-monitoring started\", \"RegionIdentifier/ZoneRelevanceMonitoringId\":%{public, location:escape_only}s}", (uint8_t *)v6, 0x1Cu);
  }
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CA700);
  }
  __int16 v7 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
  {
    int v11 = 68289538;
    int v12 = 0;
    __int16 v13 = 2082;
    long long v14 = "";
    __int16 v15 = 2082;
    id v16 = [[objc_msgSend(a4, "identifier") UTF8String];
    __int16 v17 = 2082;
    id v18 = [[objc_msgSend(a5, "description") UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#pla #zone-relevance-tracker region-monitoring failed to start\", \"RegionIdentifier/ZoneRelevanceMonitoringId\":%{public, location:escape_only}s, \"Error\":%{public, location:escape_only}s}", (uint8_t *)&v11, 0x26u);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CA700);
    }
  }
  objc_super v8 = qword_102419538;
  if (os_signpost_enabled((os_log_t)qword_102419538))
  {
    id v9 = [[objc_msgSend(a4, "identifier") UTF8String];
    id v10 = [[objc_msgSend(a5, "description") UTF8String];
    int v11 = 68289538;
    int v12 = 0;
    __int16 v13 = 2082;
    long long v14 = "";
    __int16 v15 = 2082;
    id v16 = v9;
    __int16 v17 = 2082;
    id v18 = v10;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#pla #zone-relevance-tracker region-monitoring failed to start", "{\"msg%{public}.0s\":\"#pla #zone-relevance-tracker region-monitoring failed to start\", \"RegionIdentifier/ZoneRelevanceMonitoringId\":%{public, location:escape_only}s, \"Error\":%{public, location:escape_only}s}", (uint8_t *)&v11, 0x26u);
  }
}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CA700);
  }
  v6 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    __int16 v8 = 2082;
    id v9 = "";
    __int16 v10 = 2082;
    id v11 = [[[a4 identifier] UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#pla #zone-relevance-tracker entered circular region\", \"RegionIdentifier/ZoneRelevanceMonitoringId\":%{public, location:escape_only}s}", (uint8_t *)v7, 0x1Cu);
  }
  [(CLZoneRelevanceTracker *)self handleEntryExitDelegateCallbackForRegion:a4 withState:1];
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CA700);
  }
  v6 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    __int16 v8 = 2082;
    id v9 = "";
    __int16 v10 = 2082;
    id v11 = [[[a4 identifier] UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#pla #zone-relevance-tracker exited circular-region\", \"RegionIdentifier/ZoneRelevanceMonitoringId\":%{public, location:escape_only}s}", (uint8_t *)v7, 0x1Cu);
  }
  [(CLZoneRelevanceTracker *)self handleEntryExitDelegateCallbackForRegion:a4 withState:2];
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CA700);
  }
  __int16 v8 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68289538;
    v9[1] = 0;
    __int16 v10 = 2082;
    id v11 = "";
    __int16 v12 = 1026;
    int v13 = a4;
    __int16 v14 = 2082;
    id v15 = [[objc_msgSend(a5, "identifier") UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#pla #zone-relevance-tracker determined state\", \"State\":%{public}d, \"RegionIdentifier/ZoneRelevanceMonitoringId\":%{public, location:escape_only}s}", (uint8_t *)v9, 0x22u);
  }
  [(CLZoneRelevanceTracker *)self handleEntryExitDelegateCallbackForRegion:a5 withState:a4];
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CA700);
  }
  v5 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
  {
    int v8 = 68289282;
    int v9 = 0;
    __int16 v10 = 2082;
    id v11 = "";
    __int16 v12 = 2082;
    id v13 = [[objc_msgSend(a4, "description") UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#pla locationManager delegate received error\", \"Error\":%{public, location:escape_only}s}", (uint8_t *)&v8, 0x1Cu);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CA700);
    }
  }
  v6 = qword_102419538;
  if (os_signpost_enabled((os_log_t)qword_102419538))
  {
    id v7 = [[objc_msgSend(a4, "description") UTF8String];
    int v8 = 68289282;
    int v9 = 0;
    __int16 v10 = 2082;
    id v11 = "";
    __int16 v12 = 2082;
    id v13 = v7;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#pla locationManager delegate received error", "{\"msg%{public}.0s\":\"#pla locationManager delegate received error\", \"Error\":%{public, location:escape_only}s}", (uint8_t *)&v8, 0x1Cu);
  }
}

- (void)handleEntryExitDelegateCallbackForRegion:(id)a3 withState:(int64_t)a4
{
  if (a4)
  {
    id v5 = [a3 identifier];
    v6 = (char *)[v5 rangeOfString:@":"];
    id v7 = [v5 substringToIndex:v6];
    id v8 = [v5 substringFromIndex:v6 + 1];
    if (LOBYTE(self->_clientManager))
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CA700);
      }
      int v9 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#pla #zone-relevance-tracker recompute auth context", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022CA700);
        }
        __int16 v14 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLZoneRelevanceTracker handleEntryExitDelegateCallbackForRegion:withState:]", "%s\n", v14);
        if (v14 != (char *)buf) {
          free(v14);
        }
      }
      __int16 v10 = +[CLClientKeyPath clientKeyPathWithLegacyClientKey:v7];
      uint64_t v11 = *(void *)&self->_currentLocation.ellipsoidalAltitude;
      sub_100134750(buf, "");
      sub_1001341F0(v11, v10, (uint64_t)buf);
      if (SBYTE3(v19) < 0) {
        operator delete(*(void **)buf);
      }
    }
    else
    {
      __int16 v12 = v8;
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CA700);
      }
      id v13 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&uint8_t buf[4] = 0;
        __int16 v16 = 2082;
        __int16 v17 = "";
        __int16 v18 = 2082;
        id v19 = [v7 UTF8String];
        __int16 v20 = 2082;
        id v21 = [v12 UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#pla ClientManager has marked ZoneTracker as invalid, not updating zone relevance\", \"Client\":%{public, location:escape_only}s, \"ZoneId\":%{public, location:escape_only}s}", buf, 0x26u);
      }
    }
  }
}

- (void)startStopCircularZoneMonitoringForClient:(id)a3 withZoneId:(id)a4 latitude:(double)longitude longitude:(double)latitude radius:(double)a7 shouldStart:(BOOL)a8
{
  BOOL v8 = a8;
  id v15 = +[NSString stringWithFormat:@"%@%@%@", a3, @":", a4];
  if (v8)
  {
    CLLocationCoordinate2D v16 = CLLocationCoordinate2DMake(longitude, latitude);
    latitude = v16.latitude;
    longitude = v16.longitude;
    id v17 = [objc_alloc((Class)CLCircularRegion) initWithNearbyAllowedWithCenter:v15 radius:v16.latitude identifier:a7];
    [v17 setNotifyOnEntry:1];
    [v17 setNotifyOnExit:1];
  }
  else
  {
    id v17 = [objc_alloc((Class)CLCircularRegion) initWithCenter:v15 radius:0 identifier:nil];
  }
  if (v17)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CA700);
    }
    __int16 v18 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      if (v8) {
        id v19 = "starting";
      }
      else {
        id v19 = "stopping";
      }
      *(_DWORD *)buf = 68290562;
      int v26 = 0;
      __int16 v27 = 2082;
      int v28 = "";
      __int16 v29 = 2082;
      v30 = v19;
      __int16 v31 = 2050;
      double v32 = latitude;
      __int16 v33 = 2050;
      double v34 = longitude;
      __int16 v35 = 2050;
      double v36 = a7;
      __int16 v37 = 2082;
      id v38 = [a3 UTF8String];
      __int16 v39 = 2082;
      id v40 = [a4 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#pla #zone-relevance-tracker for circular-region\", \"monitoring\":%{public, location:escape_only}s, \"latitude\":\"%{public}.7f\", \"longitude\":\"%{public}.7f\", \"radius\":\"%{public}.3f\", \"Client\":%{public, location:escape_only}s, \"ZoneId\":%{public, location:escape_only}s}", buf, 0x4Eu);
    }
    __int16 v20 = *(void **)&self->_currentLocation.fromSimulationController;
    if (v8) {
      [v20 startMonitoringForRegion:v17];
    }
    else {
      [v20 stopMonitoringForRegion:v17];
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CA700);
    }
    id v21 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289538;
      int v26 = 0;
      __int16 v27 = 2082;
      int v28 = "";
      __int16 v29 = 2082;
      v30 = (const char *)[a3 UTF8String];
      __int16 v31 = 2082;
      double v32 = COERCE_DOUBLE([a4 UTF8String]);
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#pla #zone-relevance-tracker cannot create CircularRegion\", \"Client\":%{public, location:escape_only}s, \"ZoneId\":%{public, location:escape_only}s}", buf, 0x26u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CA700);
      }
    }
    int v22 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      __int16 v23 = (const char *)[a3 UTF8String];
      id v24 = [a4 UTF8String];
      *(_DWORD *)buf = 68289538;
      int v26 = 0;
      __int16 v27 = 2082;
      int v28 = "";
      __int16 v29 = 2082;
      v30 = v23;
      __int16 v31 = 2082;
      double v32 = *(double *)&v24;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#pla #zone-relevance-tracker cannot create CircularRegion", "{\"msg%{public}.0s\":\"#pla #zone-relevance-tracker cannot create CircularRegion\", \"Client\":%{public, location:escape_only}s, \"ZoneId\":%{public, location:escape_only}s}", buf, 0x26u);
    }
  }
}

- (void)startCircularZoneMonitoringForClient:(id)a3 withZoneId:(id)a4 latitude:(double)a5 longitude:(double)a6 radius:(double)a7
{
}

- (void)stopCircularZoneMonitoringForClient:(id)a3 withZoneId:(id)a4
{
}

- (CLDaemonLocation)currentLocation
{
  $AB5116BA7E623E054F959CECB034F4E7 v3 = *($AB5116BA7E623E054F959CECB034F4E7 *)&self->floor;
  *(_OWORD *)&retstr->lifespan = *(_OWORD *)&self->rawCoordinate.longitude;
  retstr->rawCoordinate = v3;
  *(_OWORD *)&retstr->rawCourse = *(_OWORD *)&self->signalEnvironmentType;
  *(_OWORD *)&retstr->integrity = *(_OWORD *)((char *)&self->ellipsoidalAltitude + 4);
  long long v4 = *(_OWORD *)&self->courseAccuracy;
  *(_OWORD *)&retstr->altitude = *(_OWORD *)&self->speedAccuracy;
  *(_OWORD *)&retstr->speed = v4;
  long long v5 = *(_OWORD *)&self->type;
  *(_OWORD *)&retstr->course = *(_OWORD *)&self->confidence;
  *(_OWORD *)&retstr->timestamp = v5;
  long long v6 = *(_OWORD *)&self->verticalAccuracy;
  *(_OWORD *)&retstr->suitability = *(_OWORD *)&self->horizontalAccuracy;
  *(_OWORD *)&retstr->coordinate.longitude = v6;
  return self;
}

- (void).cxx_destruct
{
  value = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((_DWORD *)self + 6) = 0xFFFF;
  *(void *)((char *)self + 36) = 0;
  *(void *)((char *)self + 28) = 0;
  *(_OWORD *)((char *)self + 44) = xmmword_101D1C320;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)((char *)self + 60) = _Q0;
  *(_OWORD *)((char *)self + 76) = _Q0;
  *(_OWORD *)((char *)self + 92) = _Q0;
  *((_DWORD *)self + 27) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 14) = 0xBFF0000000000000;
  *((_DWORD *)self + 34) = 0;
  *(void *)((char *)self + 140) = 0xBFF0000000000000;
  *((_DWORD *)self + 37) = 0x7FFFFFFF;
  *((void *)self + 20) = 0;
  *((void *)self + 21) = 0;
  *((void *)self + 19) = 0;
  *((unsigned char *)self + 176) = 0;
  return self;
}

@end