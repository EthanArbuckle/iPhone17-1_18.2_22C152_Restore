@interface CLMicroLocationLoiBridge
- (BOOL)valid;
- (id)generateLocationManagerNotAvailableError;
- (id)generateRegionMonitorNotAvailableError;
- (id)initInUniverse:(id)a3;
- (id)retrieveAllActiveGeofences;
- (unint64_t)convertMonitoringEventToGeofenceState:(id)a3;
- (void)dealloc;
- (void)fetchLocationOfInterestAtLocation:(id)a3;
- (void)fetchPlaceInferenceAtCurrentLocation;
- (void)fetchRelatedLoisForLoi:(id)a3;
- (void)generateGeofenceUpdateToClient:(id)a3;
- (void)getAllActiveGeofences;
- (void)getCurrentLocation;
- (void)invalidateFetchPlaceInferenceTimer;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)onVisit:(id)a3;
- (void)regionMonitor:(id)a3 didGenerateEvent:(id)a4;
- (void)removeGeofenceWithRegionId:(id)a3;
- (void)removeGeofencesNearLocationWithLatitude:(double)a3 andLongitude:(double)a4;
- (void)requestBootstrapWithLastGeofenceStates;
- (void)setGeofenceAtLocation:(id)a3;
- (void)setMicroLocationLoiClient:(CLMicroLocationLoiClient *)a3;
- (void)setValid:(BOOL)a3;
- (void)startVisitMonitoring;
@end

@implementation CLMicroLocationLoiBridge

- (id)initInUniverse:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)CLMicroLocationLoiBridge;
  v4 = [(CLMicroLocationLoiBridge *)&v21 init];
  if (v4)
  {
    v4->_universe = (CLIntersiloUniverse *)a3;
    v5 = (CLDispatchSilo *)[a3 silo];
    v4->_silo = v5;
    v4->_queue = (OS_dispatch_queue *)[(CLDispatchSilo *)v5 queue];
    v4->_fetchPlaceInferenceTimer = 0;
    *(_WORD *)&v4->_bridgeReady = 256;
    v6 = (CLRoutineMonitorServiceProtocol *)[[-[CLIntersiloUniverse vendor](v4->_universe, "vendor") proxyForService:@"CLRoutineMonitor"];
    v4->_routineMonitor = v6;
    [(CLRoutineMonitorServiceProtocol *)v6 registerDelegate:v4 inSilo:[(CLIntersiloUniverse *)v4->_universe silo]];
    [(CLRoutineMonitorServiceProtocol *)v4->_routineMonitor setDelegateEntityName:"CLMicroLocationLoiBridge"];
    if (sub_10023554C())
    {
      id v7 = objc_alloc((Class)CLLocationManager);
      if (byte_10247A6E7 >= 0) {
        v8 = &qword_10247A6D0;
      }
      else {
        v8 = (uint64_t *)qword_10247A6D0;
      }
      v9 = (CLLocationManager *)[v7 initWithEffectiveBundlePath:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8) delegate:v4 onQueue:v4->_queue];
      v4->_clLocationManager = v9;
      if (!v9)
      {
        if (qword_102419450 != -1) {
          dispatch_once(&qword_102419450, &stru_10229FF98);
        }
        v10 = qword_102419458;
        if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Failed to create location manager using MicroLocation bundle", buf, 2u);
        }
        if (sub_10013D1A0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419450 != -1) {
            dispatch_once(&qword_102419450, &stru_10229FF98);
          }
          __int16 v20 = 0;
          v17 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMicroLocationLoiBridge initInUniverse:]", "%s\n", v17);
          if (v17 != (char *)buf) {
            free(v17);
          }
        }
      }
      [(CLLocationManager *)v4->_clLocationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1002355F8;
      v19[3] = &unk_10229FE60;
      v19[4] = v4;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100235640;
      v18[3] = &unk_10229FE88;
      v18[4] = v4;
      id v11 = objc_alloc((Class)CLMonitorConfiguration);
      if (byte_10247A717 >= 0) {
        v12 = &qword_10247A700;
      }
      else {
        v12 = (uint64_t *)qword_10247A700;
      }
      v13 = +[NSString stringWithUTF8String:v12];
      if (byte_10247A6FF >= 0) {
        v14 = &qword_10247A6E8;
      }
      else {
        v14 = (uint64_t *)qword_10247A6E8;
      }
      v15 = (CLMonitorConfiguration *)[v11 initWithName:v13 path:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v14) onQueue:v4->_queue eventHandler:v18 useMonitorQueueForVendingMonitor:1 vendingHandler:v19];
      v4->_regionMonitorConfiguration = v15;
      [(CLLocationManager *)v4->_clLocationManager requestMonitorWithConfiguration:v15 completion:v19];
    }
    if (sub_10023554C()) {
      [(CLMicroLocationLoiBridge *)v4 startVisitMonitoring];
    }
  }
  return v4;
}

- (void)dealloc
{
  [(CLRoutineMonitorServiceProtocol *)self->_routineMonitor stopLeechingVisitsForClient:self];
  [(CLRoutineMonitorServiceProtocol *)self->_routineMonitor stopLeechingLowConfidenceVisitsForClient:self];

  v3.receiver = self;
  v3.super_class = (Class)CLMicroLocationLoiBridge;
  [(CLMicroLocationLoiBridge *)&v3 dealloc];
}

- (void)setMicroLocationLoiClient:(CLMicroLocationLoiClient *)a3
{
  self->_microlocationLoiClient = a3;
}

- (void)requestBootstrapWithLastGeofenceStates
{
  regionMonitor = self->_regionMonitor;
  if (regionMonitor)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v4 = [(CLMonitor *)regionMonitor monitoredIdentifiers];
    id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = [(CLMonitor *)self->_regionMonitor monitoringRecordForIdentifier:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          if ([(CLMonitoringRecord *)v9 lastEvent])
          {
            silo = self->_silo;
            v13[0] = _NSConcreteStackBlock;
            v13[1] = 3221225472;
            v13[2] = sub_100235984;
            v13[3] = &unk_10229FEB0;
            v13[4] = v9;
            v13[5] = self;
            [(CLDispatchSilo *)silo async:v13];
          }
        }
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v6);
    }
  }
  else
  {
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_10229FF98);
    }
    id v11 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#LOI Bridge, Attempted bootstraping when region monitor was not available", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419450 != -1) {
        dispatch_once(&qword_102419450, &stru_10229FF98);
      }
      __int16 v18 = 0;
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMicroLocationLoiBridge requestBootstrapWithLastGeofenceStates]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
  }
}

- (id)generateLocationManagerNotAvailableError
{
  if (qword_102419450 != -1) {
    dispatch_once(&qword_102419450, &stru_10229FF98);
  }
  v2 = qword_102419458;
  if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "#LOI Bridge, Attempted LOI request when location manager was not available", buf, 2u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_10229FF98);
    }
    id v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMicroLocationLoiBridge generateLocationManagerNotAvailableError]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  id v3 = objc_alloc((Class)NSError);
  NSErrorUserInfoKey v6 = NSLocalizedDescriptionKey;
  CFStringRef v7 = @"Location Manager not available";
  return [v3 initWithDomain:kCLErrorDomainPrivate code:2 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1)];
}

- (id)generateRegionMonitorNotAvailableError
{
  if (qword_102419450 != -1) {
    dispatch_once(&qword_102419450, &stru_10229FF98);
  }
  v2 = qword_102419458;
  if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "#LOI Bridge, Attempted geofence request when region monitor was not available", buf, 2u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_10229FF98);
    }
    id v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMicroLocationLoiBridge generateRegionMonitorNotAvailableError]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  id v3 = objc_alloc((Class)NSError);
  NSErrorUserInfoKey v6 = NSLocalizedDescriptionKey;
  CFStringRef v7 = @"Routine Monitor is not active";
  return [v3 initWithDomain:kCLErrorDomainPrivate code:3 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1)];
}

- (void)generateGeofenceUpdateToClient:(id)a3
{
  unint64_t v5 = -[CLMicroLocationLoiBridge convertMonitoringEventToGeofenceState:](self, "convertMonitoringEventToGeofenceState:");
  microlocationLoiClient = self->_microlocationLoiClient;
  id v7 = [a3 identifier];
  v8 = (void (*)(CLMicroLocationLoiClient *, id, unint64_t))*((void *)microlocationLoiClient->var0
                                                                              + 7);

  v8(microlocationLoiClient, v7, v5);
}

- (unint64_t)convertMonitoringEventToGeofenceState:(id)a3
{
  id v3 = [a3 state];
  if (v3 == (id)1) {
    return 1;
  }
  else {
    return 2 * (v3 == (id)2);
  }
}

- (void)regionMonitor:(id)a3 didGenerateEvent:(id)a4
{
  if (qword_102419450 != -1) {
    dispatch_once(&qword_102419450, &stru_10229FF98);
  }
  NSErrorUserInfoKey v6 = qword_102419458;
  if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_INFO))
  {
    v7[0] = 68289539;
    v7[1] = 0;
    __int16 v8 = 2082;
    v9 = "";
    __int16 v10 = 2081;
    id v11 = [[objc_msgSend(a4, "identifier") UTF8String];
    __int16 v12 = 1025;
    unsigned int v13 = [a4 state];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"LOI Bridge, got geofence update\", \"Geofence Id\":%{private, location:escape_only}s, \"state\":%{private}d}", (uint8_t *)v7, 0x22u);
  }
  [(CLMicroLocationLoiBridge *)self generateGeofenceUpdateToClient:a4];
}

- (void)startVisitMonitoring
{
  [(CLRoutineMonitorServiceProtocol *)self->_routineMonitor startLeechingVisitsForClient:self];
  routineMonitor = self->_routineMonitor;

  [(CLRoutineMonitorServiceProtocol *)routineMonitor startLeechingLowConfidenceVisitsForClient:self];
}

- (void)invalidateFetchPlaceInferenceTimer
{
  self->_fetchPlaceInferenceTimer = 0;
}

- (void)fetchPlaceInferenceAtCurrentLocation
{
  if (sub_10023554C())
  {
    if (!self->_clLocationManager)
    {
      silo = self->_silo;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100236378;
      v10[3] = &unk_10229FED8;
      v10[4] = self;
      [(CLDispatchSilo *)silo async:v10];
    }
    v4 = (CLTimer *)[(CLDispatchSilo *)self->_silo newTimer];
    self->_fetchPlaceInferenceTimer = v4;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1002363DC;
    v9[3] = &unk_10229FED8;
    v9[4] = self;
    [(CLTimer *)v4 setHandler:v9];
    [(CLTimer *)self->_fetchPlaceInferenceTimer setNextFireDelay:5.0];
    clLocationManager = self->_clLocationManager;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002365EC;
    v8[3] = &unk_10229FF00;
    v8[4] = self;
    [(CLLocationManager *)clLocationManager _fetchPlaceInferencesWithFidelityPolicy:0 handler:v8];
  }
  if (qword_102419450 != -1) {
    dispatch_once(&qword_102419450, &stru_10229FF98);
  }
  NSErrorUserInfoKey v6 = qword_102419458;
  if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "fetchPlaceInferenceAtCurrentLocation - MicroLocation is disabled", buf, 2u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_10229FF98);
    }
    id v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMicroLocationLoiBridge fetchPlaceInferenceAtCurrentLocation]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
}

- (void)fetchLocationOfInterestAtLocation:(id)a3
{
  routineMonitor = self->_routineMonitor;
  if (!routineMonitor)
  {
    id v6 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Routine Monitor is not active";
    id v7 = [v6 initWithDomain:kCLErrorDomainPrivate code:1 userInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)];
    silo = self->_silo;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1002369F0;
    v10[3] = &unk_10229FF28;
    v10[4] = self;
    void v10[5] = a3;
    v10[6] = v7;
    [(CLDispatchSilo *)silo async:v10];
    routineMonitor = self->_routineMonitor;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100236A28;
  v9[3] = &unk_10229FF50;
  v9[4] = self;
  void v9[5] = a3;
  [(CLRoutineMonitorServiceProtocol *)routineMonitor fetchLocationOfInterestAtLocation:a3 withReply:v9];
}

- (void)fetchRelatedLoisForLoi:(id)a3
{
  routineMonitor = self->_routineMonitor;
  if (!routineMonitor)
  {
    id v6 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Routine Monitor is not active";
    id v7 = [v6 initWithDomain:kCLErrorDomainPrivate code:1 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)];
    silo = self->_silo;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100236C58;
    v10[3] = &unk_10229FEB0;
    v10[4] = self;
    void v10[5] = v7;
    [(CLDispatchSilo *)silo async:v10];
    routineMonitor = self->_routineMonitor;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100236C88;
  v9[3] = &unk_10229FF00;
  v9[4] = self;
  [(CLRoutineMonitorServiceProtocol *)routineMonitor fetchDedupedLocationOfInterestIdentifiersWithIdentifier:a3 withReply:v9];
}

- (id)retrieveAllActiveGeofences
{
  id v3 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v4 = [(CLMonitor *)self->_regionMonitor monitoredIdentifiers];
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v24;
    *(void *)&long long v6 = 68289282;
    long long v22 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v4);
        }
        __int16 v10 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v9);
        NSErrorUserInfoKey v11 = -[CLMonitor monitoringRecordForIdentifier:](self->_regionMonitor, "monitoringRecordForIdentifier:", v10, v22);
        if (v11)
        {
          CFStringRef v12 = [(CLMonitoringRecord *)v11 condition];
          unsigned int v13 = objc_alloc_init(CLMicroLocationGeofence);
          [(CLMicroLocationGeofence *)v13 setRegionId:v10];
          id v14 = objc_alloc((Class)CLLocation);
          [(CLCondition *)v12 center];
          double v16 = v15;
          [(CLCondition *)v12 center];
          -[CLMicroLocationGeofence setRegionCenterLocation:](v13, "setRegionCenterLocation:", [v14 initWithLatitude:v16]);
          [v3 addObject:v13];
        }
        else
        {
          if (qword_102419450 != -1) {
            dispatch_once(&qword_102419450, &stru_10229FF98);
          }
          long long v17 = qword_102419458;
          if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_ERROR))
          {
            id v18 = [v10 UTF8String];
            *(_DWORD *)buf = v22;
            int v28 = 0;
            __int16 v29 = 2082;
            v30 = "";
            __int16 v31 = 2082;
            id v32 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#LoiBridge, was unable to retrieve monitor record for valid region identifier\", \"identifier\":%{public, location:escape_only}s}", buf, 0x1Cu);
            if (qword_102419450 != -1) {
              dispatch_once(&qword_102419450, &stru_10229FF98);
            }
          }
          v19 = qword_102419458;
          if (os_signpost_enabled((os_log_t)qword_102419458))
          {
            id v20 = [v10 UTF8String];
            *(_DWORD *)buf = v22;
            int v28 = 0;
            __int16 v29 = 2082;
            v30 = "";
            __int16 v31 = 2082;
            id v32 = v20;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#LoiBridge, was unable to retrieve monitor record for valid region identifier", "{\"msg%{public}.0s\":\"#LoiBridge, was unable to retrieve monitor record for valid region identifier\", \"identifier\":%{public, location:escape_only}s}", buf, 0x1Cu);
          }
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSArray *)v4 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v7);
  }
  return +[NSArray arrayWithArray:v3];
}

- (void)getAllActiveGeofences
{
  if (self->_regionMonitor)
  {
    id v3 = [(CLMicroLocationLoiBridge *)self retrieveAllActiveGeofences];
    id v4 = 0;
  }
  else
  {
    id v4 = [(CLMicroLocationLoiBridge *)self generateRegionMonitorNotAvailableError];
    id v3 = 0;
  }
  silo = self->_silo;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002371F0;
  v6[3] = &unk_10229FF28;
  v6[4] = self;
  v6[5] = v3;
  v6[6] = v4;
  [(CLDispatchSilo *)silo async:v6];
}

- (void)removeGeofencesNearLocationWithLatitude:(double)a3 andLongitude:(double)a4
{
  if (self->_regionMonitor)
  {
    id v7 = [(CLMicroLocationLoiBridge *)self retrieveAllActiveGeofences];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v8)
    {
      id v10 = v8;
      uint64_t v11 = *(void *)v25;
      *(void *)&long long v9 = 68289539;
      long long v23 = v9;
      do
      {
        CFStringRef v12 = 0;
        do
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v7);
          }
          unsigned int v13 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v12);
          [objc_msgSend(v13, "regionCenterLocation", v23) coordinate];
          double v15 = v14;
          [objc_msgSend(v13, "regionCenterLocation") coordinate];
          double v17 = sub_1000A3D9C(a3, a4, v15, v16);
          sub_1002374EC();
          if (v17 <= v18 + v18)
          {
            if (qword_102419450 != -1) {
              dispatch_once(&qword_102419450, &stru_10229FF98);
            }
            objc_super v21 = qword_102419458;
            if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
            {
              id v22 = [[objc_msgSend(v13, "regionId") UTF8String];
              *(_DWORD *)buf = v23;
              int v29 = 0;
              __int16 v30 = 2082;
              __int16 v31 = "";
              __int16 v32 = 2081;
              id v33 = v22;
              __int16 v34 = 2049;
              double v35 = v17;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#LOI Bridge, removing geofence because it overlap the geofence at the requested location\", \"Geofence ID\":%{private, location:escape_only}s, \"Distance Between Geofences\":\"%{private}7f\"}", buf, 0x26u);
            }
            -[CLMonitor removeConditionFromMonitoringWithIdentifier:](self->_regionMonitor, "removeConditionFromMonitoringWithIdentifier:", [v13 regionId]);
          }
          else
          {
            if (qword_102419450 != -1) {
              dispatch_once(&qword_102419450, &stru_10229FF98);
            }
            v19 = qword_102419458;
            if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_INFO))
            {
              id v20 = [[objc_msgSend(v13, "regionId") UTF8String];
              *(_DWORD *)buf = v23;
              int v29 = 0;
              __int16 v30 = 2082;
              __int16 v31 = "";
              __int16 v32 = 2081;
              id v33 = v20;
              __int16 v34 = 2049;
              double v35 = v17;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#LOI Bridge, geofence does not overlap the geofence at the requested location\", \"Geofence ID\":%{private, location:escape_only}s, \"Distance Between Geofences\":\"%{private}7f\"}", buf, 0x26u);
            }
          }
          CFStringRef v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v7 countByEnumeratingWithState:&v24 objects:v36 count:16];
      }
      while (v10);
    }
  }
}

- (void)getCurrentLocation
{
  if (sub_10023554C())
  {
    clLocationManager = self->_clLocationManager;
    if (!clLocationManager)
    {
      silo = self->_silo;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      _DWORD v7[2] = sub_100237790;
      v7[3] = &unk_10229FED8;
      v7[4] = self;
      [(CLDispatchSilo *)silo async:v7];
      clLocationManager = self->_clLocationManager;
    }
    [(CLLocationManager *)clLocationManager requestLocation];
    self->_waitingOnLocationUpdate = 1;
  }
  else
  {
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_10229FF98);
    }
    id v5 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      uint64_t v11 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"LOI Bridge, getCurrentLocation while MicroLocation disabled\"}", buf, 0x12u);
      if (qword_102419450 != -1) {
        dispatch_once(&qword_102419450, &stru_10229FF98);
      }
    }
    long long v6 = qword_102419458;
    if (os_signpost_enabled((os_log_t)qword_102419458))
    {
      *(_DWORD *)buf = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      uint64_t v11 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LOI Bridge, getCurrentLocation while MicroLocation disabled", "{\"msg%{public}.0s\":\"LOI Bridge, getCurrentLocation while MicroLocation disabled\"}", buf, 0x12u);
    }
  }
}

- (void)setGeofenceAtLocation:(id)a3
{
  id v5 = [(NSString *)[+[NSUUID UUID] UUIDString] uppercaseString];
  if (qword_102419450 != -1) {
    dispatch_once(&qword_102419450, &stru_10229FF98);
  }
  long long v6 = qword_102419458;
  if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_INFO))
  {
    [a3 coordinate];
    uint64_t v8 = v7;
    [a3 coordinate];
    *(_DWORD *)buf = 68289539;
    int v22 = 0;
    __int16 v23 = 2082;
    long long v24 = "";
    __int16 v25 = 2049;
    uint64_t v26 = v8;
    __int16 v27 = 2049;
    uint64_t v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"LOI Bridge, requested geofence at location\", \"latitude\":\"%{private}7f\", \"longitude\":\"%{private}7f\"}", buf, 0x26u);
  }
  if (self->_regionMonitor)
  {
    sub_1002374EC();
    uint64_t v11 = v10;
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_10229FF98);
    }
    CFStringRef v12 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      int v22 = 0;
      __int16 v23 = 2082;
      long long v24 = "";
      __int16 v25 = 2049;
      uint64_t v26 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#LOI Bridge, setting geofence for custom LOI\", \"Custom LOI Geofence radius\":\"%{private}7f\"}", buf, 0x1Cu);
    }
    id v13 = objc_alloc((Class)CLCircularGeographicCondition);
    [a3 coordinate];
    -[CLMonitor addConditionForMonitoring:identifier:](self->_regionMonitor, @"addConditionForMonitoring:identifier:", [v13 initWithCenter:radius:], v5);
    double v14 = [(NSString *)v5 UTF8String];
    size_t v15 = strlen(v14);
    uint64_t v16 = sub_1002383B4((uint64_t)buf, (unsigned __int8 *)v14, (unsigned __int8 *)&v14[v15]);
    id v18 = 0;
  }
  else
  {
    id v18 = [(CLMicroLocationLoiBridge *)self generateRegionMonitorNotAvailableError];
    uint64_t v16 = 0;
    uint64_t v17 = 0;
  }
  silo = self->_silo;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100237A9C;
  v20[3] = &unk_10229FF78;
  v20[4] = self;
  v20[5] = a3;
  v20[7] = v16;
  v20[8] = v17;
  v20[6] = v18;
  [(CLDispatchSilo *)silo async:v20];
}

- (void)removeGeofenceWithRegionId:(id)a3
{
  regionMonitor = self->_regionMonitor;
  if (regionMonitor)
  {
    [(CLMonitor *)regionMonitor removeConditionFromMonitoringWithIdentifier:a3];
    id v6 = 0;
  }
  else
  {
    id v6 = [(CLMicroLocationLoiBridge *)self generateRegionMonitorNotAvailableError];
  }
  silo = self->_silo;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100237B7C;
  v8[3] = &unk_10229FF28;
  v8[4] = self;
  void v8[5] = a3;
  v8[6] = v6;
  [(CLDispatchSilo *)silo async:v8];
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  if (self->_waitingOnLocationUpdate)
  {
    self->_waitingOnLocationUpdate = 0;
    if (a4 && objc_msgSend(a4, "count", a3))
    {
      id v6 = [a4 objectAtIndexedSubscript:0];
      id v7 = 0;
    }
    else
    {
      id v8 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
      CFStringRef v21 = @"Failed to get current Location";
      id v7 = [v8 initWithDomain:kCLErrorDomainPrivate code:5 userInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1)];
      id v6 = 0;
    }
    [v6 horizontalAccuracy];
    double v10 = v9;
    sub_1002374EC();
    if (v10 > v11)
    {
      id v12 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
      CFStringRef v19 = @"Failed to get current Location";
      id v7 = [v12 initWithDomain:kCLErrorDomainPrivate code:5 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1)];
      id v6 = 0;
    }
    silo = self->_silo;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100237EC0;
    v16[3] = &unk_10229FF28;
    v16[4] = self;
    v16[5] = v6;
    v16[6] = v7;
    [(CLDispatchSilo *)silo async:v16];
  }
  else
  {
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_10229FF98);
    }
    double v14 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "LOI Bridge: Received location update when not waiting on one... Ignoring", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419450 != -1) {
        dispatch_once(&qword_102419450, &stru_10229FF98);
      }
      size_t v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMicroLocationLoiBridge locationManager:didUpdateLocations:]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  if (qword_102419450 != -1) {
    dispatch_once(&qword_102419450, &stru_10229FF98);
  }
  id v5 = qword_102419458;
  if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_ERROR))
  {
    int v7 = 68289283;
    int v8 = 0;
    __int16 v9 = 2082;
    double v10 = "";
    __int16 v11 = 2113;
    id v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#LOI Bridge: location manager failed\", \"error:\":%{private, location:escape_only}@}", (uint8_t *)&v7, 0x1Cu);
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_10229FF98);
    }
  }
  id v6 = qword_102419458;
  if (os_signpost_enabled((os_log_t)qword_102419458))
  {
    int v7 = 68289283;
    int v8 = 0;
    __int16 v9 = 2082;
    double v10 = "";
    __int16 v11 = 2113;
    id v12 = a4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#LOI Bridge: location manager failed", "{\"msg%{public}.0s\":\"#LOI Bridge: location manager failed\", \"error:\":%{private, location:escape_only}@}", (uint8_t *)&v7, 0x1Cu);
  }
}

- (void)onVisit:(id)a3
{
  if (a3)
  {
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_10229FF98);
    }
    id v5 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "LOI Bridge: Received visit notification", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419450 != -1) {
        dispatch_once(&qword_102419450, &stru_10229FF98);
      }
      int v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMicroLocationLoiBridge onVisit:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    ((void (*)(CLMicroLocationLoiClient *, id))*self->_microlocationLoiClient->var0)(self->_microlocationLoiClient, a3);
  }
  else
  {
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_10229FF98);
    }
    id v6 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "LOI Bridge: Received nil visit notification", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419450 != -1) {
        dispatch_once(&qword_102419450, &stru_10229FF98);
      }
      int v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMicroLocationLoiBridge onVisit:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end