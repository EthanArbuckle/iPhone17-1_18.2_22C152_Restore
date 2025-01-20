@interface CLRoutineMonitor
+ (BOOL)isSupported;
+ (id)bundlePath;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)armed;
- (BOOL)authorized;
- (BOOL)diminishedMode;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)updating;
- (BOOL)updatingPredictedApplications;
- (CLLocation)lastLocation;
- (CLRoutineMonitor)init;
- (NSMutableArray)cachedPlaceInferences;
- (NSMutableArray)inertialSamples;
- (NSMutableArray)locations;
- (NSMutableDictionary)scenarioTriggerClients;
- (NSMutableSet)leechClients;
- (NSMutableSet)lowConfidenceVisitLeechClients;
- (NSMutableSet)visitClients;
- (NSXPCConnection)connection;
- (NSXPCListener)listener;
- (RTRoutineManager)routineManager;
- (id).cxx_construct;
- (void)addInertialData:(id)a3;
- (void)addLocation:(id)a3;
- (void)beginService;
- (void)checkAuthorization;
- (void)checkDiminishedMode;
- (void)dealloc;
- (void)endService;
- (void)enumerateStoredLocationsWithOptions:(id)a3 withReply:(id)a4;
- (void)fetchBackgroundInertialOdometrySamplesWithOptions:(id)a3 handler:(id)a4;
- (void)fetchCachedPlaceInferencesWithReply:(id)a3;
- (void)fetchDedupedLocationOfInterestIdentifiersWithIdentifier:(id)a3 withReply:(id)a4;
- (void)fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 withReply:(id)a5;
- (void)fetchEstimatedLocationAtDate:(id)a3 withReply:(id)a4;
- (void)fetchFormattedPostalAddressesFromMeCardWithReply:(id)a3;
- (void)fetchLocationOfInterestAtLocation:(id)a3 withReply:(id)a4;
- (void)fetchLocationOfInterestForRegion:(id)a3 withReply:(id)a4;
- (void)fetchLocationOfInterestWithIdentifier:(id)a3 withReply:(id)a4;
- (void)fetchLocationsOfInterestAssociatedToIdentifier:(id)a3 withReply:(id)a4;
- (void)fetchLocationsOfInterestOfType:(int64_t)a3 withReply:(id)a4;
- (void)fetchLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 withReply:(id)a5;
- (void)fetchLookbackWindowStartDateWithReply:(id)a3;
- (void)fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 withReply:(id)a6;
- (void)fetchPlaceInferencesWithOptions:(id)a3 withReply:(id)a4;
- (void)fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 withReply:(id)a5;
- (void)fetchPredictedLocationsOfInterestOnDate:(id)a3 withReply:(id)a4;
- (void)fetchRecentLocationsOfInterestWithReply:(id)a3;
- (void)fetchRemoteStatusWithReply:(id)a3;
- (void)fetchRoutineModeFromLocation:(id)a3 withReply:(id)a4;
- (void)fetchStoredVisitsWithOptions:(id)a3 withReply:(id)a4;
- (void)flush;
- (void)getFamiliarityIndexForVisit:(id)a3 withReply:(id)a4;
- (void)getStoredLocationsBetweenStartTime:(double)a3 endTime:(double)a4 apartFromEachOther:(double)a5 lyingWithinTimeIntervals:(id)a6 withReply:(id)a7;
- (void)onClientManagerNotification:(int)a3 data:(NotificationData *)a4;
- (void)onLocationNotification:(int)a3 data:(NotificationData *)a4;
- (void)onVdrNotification:(int)a3 data:(NotificationData *)a4;
- (void)onWakeRoutinedTimer;
- (void)sendInertialData;
- (void)sendLocations;
- (void)sendLocationsWithReply:(id)a3;
- (void)setArmed:(BOOL)a3;
- (void)setAuthorized:(BOOL)a3;
- (void)setCachedPlaceInferences:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDiminishedMode:(BOOL)a3;
- (void)setHintForRegionState:(int64_t)a3 significantRegion:(id)a4 withReply:(id)a5;
- (void)setInertialSamples:(id)a3;
- (void)setLastLocation:(id)a3;
- (void)setLeechClients:(id)a3;
- (void)setListener:(id)a3;
- (void)setLocations:(id)a3;
- (void)setLowConfidenceVisitLeechClients:(id)a3;
- (void)setRoutineManager:(id)a3;
- (void)setScenarioTriggerClients:(id)a3;
- (void)setUpdating:(BOOL)a3;
- (void)setUpdatingPredictedApplications:(BOOL)a3;
- (void)setVisitClients:(id)a3;
- (void)startLeechingLowConfidenceVisitsForClient:(id)a3;
- (void)startLeechingVisitsForClient:(id)a3;
- (void)startMonitoringPlaceInferencesForCache;
- (void)startMonitoringScenarioTriggerOfType:(unint64_t)a3 forClient:(id)a4;
- (void)startMonitoringVisitsForClient:(id)a3;
- (void)startUpdatingLocation;
- (void)startWakeRoutinedTimer;
- (void)stopLeechingLowConfidenceVisitsForClient:(id)a3;
- (void)stopLeechingVisitsForClient:(id)a3;
- (void)stopMonitoringScenarioTriggerOfType:(unint64_t)a3 forClient:(id)a4;
- (void)stopMonitoringVisitsForClient:(id)a3;
- (void)stopUpdatingLocation;
- (void)stopWakeRoutinedTimer;
- (void)zipperedStoredLocationsBetweenStartTime:(double)a3 endTime:(double)a4 apartFromEachOther:(double)a5 lyingWithinTimeIntervals:(id)a6 custeredWithVisits:(id)a7 withReply:(id)a8;
@end

@implementation CLRoutineMonitor

- (void)addLocation:(id)a3
{
  [self universe].silo
  v5 = [(CLRoutineMonitor *)self lastLocation];
  if (!v5) {
    goto LABEL_21;
  }
  v6 = v5;
  [objc_msgSend(a3, "timestamp") timeIntervalSinceDate:-[CLLocation timestamp](v5, "timestamp")];
  if (fabs(v7) >= 1.0) {
    goto LABEL_21;
  }
  [a3 coordinate];
  double v9 = v8;
  [(CLLocation *)v6 coordinate];
  if (v9 != v10) {
    goto LABEL_21;
  }
  [a3 coordinate];
  double v12 = v11;
  [(CLLocation *)v6 coordinate];
  if (v12 != v13) {
    goto LABEL_21;
  }
  [a3 horizontalAccuracy];
  double v15 = v14;
  [(CLLocation *)v6 horizontalAccuracy];
  if (v15 != v16) {
    goto LABEL_21;
  }
  [a3 altitude];
  double v18 = v17;
  [(CLLocation *)v6 altitude];
  if (v18 != v19) {
    goto LABEL_21;
  }
  [a3 verticalAccuracy];
  double v21 = v20;
  [(CLLocation *)v6 verticalAccuracy];
  if (v21 != v22) {
    goto LABEL_21;
  }
  [a3 speed];
  double v24 = v23;
  [(CLLocation *)v6 speed];
  if (v24 != v25) {
    goto LABEL_21;
  }
  [a3 course];
  double v27 = v26;
  [(CLLocation *)v6 course];
  if (v27 == v28
    && (unsigned int v29 = [a3 type], v29 == -[CLLocation type](v6, "type"))
    && (id v30 = objc_msgSend(objc_msgSend(a3, "floor"), "level"),
        v30 == (id)[(CLFloor *)[(CLLocation *)v6 floor] level]))
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    v31 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      uint64_t v38 = (uint64_t)a3;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "dropping duplicate location, %{private}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022F6020);
      }
      v32 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor addLocation:]", "%s\n", v32);
      if (v32 != (char *)buf) {
        free(v32);
      }
    }
  }
  else
  {
LABEL_21:
    [(CLRoutineMonitor *)self setLastLocation:a3];
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    v33 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      uint64_t v38 = (uint64_t)a3;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "received location, %{private}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022F6020);
      }
      v35 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor addLocation:]", "%s\n", v35);
      if (v35 != (char *)buf) {
        free(v35);
      }
    }
    [(NSMutableArray *)[(CLRoutineMonitor *)self locations] addObject:a3];
    if ([(CLRoutineMonitor *)self updating])
    {
      [(CLRoutineMonitor *)self sendLocations];
    }
    else
    {
      [(CLRoutineMonitor *)self setArmed:1];
      if ((unint64_t)[(NSMutableArray *)[(CLRoutineMonitor *)self locations] count] >= 0x272)
      {
        if (qword_102419550 != -1) {
          dispatch_once(&qword_102419550, &stru_1022F6020);
        }
        v34 = qword_102419558;
        if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          uint64_t v38 = 625;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "#warning in-memory cache has exceeded threshold of %{public}lu, removing oldest fix", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419550 != -1) {
            dispatch_once(&qword_102419550, &stru_1022F6020);
          }
          v36 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor addLocation:]", "%s\n", v36);
          if (v36 != (char *)buf) {
            free(v36);
          }
        }
        [(NSMutableArray *)[(CLRoutineMonitor *)self locations] removeObjectAtIndex:0];
      }
    }
  }
}

- (BOOL)updating
{
  return self->_updating;
}

- (void)setLastLocation:(id)a3
{
}

- (void)setArmed:(BOOL)a3
{
  BOOL v3 = a3;
  [self universe].silo
  if (self->_armed == v3) {
    return;
  }
  if (![(NSMutableArray *)[(CLRoutineMonitor *)self locations] count]) {
    goto LABEL_11;
  }
  if ([(CLRoutineMonitor *)self authorized])
  {
    if (!v3) {
      goto LABEL_11;
    }
  }
  else if (![(CLRoutineMonitor *)self diminishedMode] || !v3)
  {
LABEL_11:
    if (self->_armed)
    {
      self->_armed = 0;
      [(CLRoutineMonitor *)self stopWakeRoutinedTimer];
    }
    return;
  }
  self->_armed = 1;

  [(CLRoutineMonitor *)self startWakeRoutinedTimer];
}

- (void)sendLocations
{
  [self universe].silo
  [-[NSXPCConnection _unboostingRemoteObjectProxy](-[CLRoutineMonitor connection](self, "connection"), "_unboostingRemoteObjectProxy") didUpdateLocations: -[CLRoutineMonitor locations](self, "locations")];
  [(NSMutableArray *)[(CLRoutineMonitor *)self locations] removeAllObjects];

  [(CLRoutineMonitor *)self setArmed:0];
}

- (NSMutableArray)locations
{
  return self->_locations;
}

- (CLLocation)lastLocation
{
  return self->_lastLocation;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)onLocationNotification:(int)a3 data:(NotificationData *)a4
{
  [self universe].silo
  if (a3 > 21)
  {
    if (a3 != 39)
    {
      if (a3 != 22) {
        goto LABEL_15;
      }
      if (sub_1010FB9FC(*((int **)a4 + 100)))
      {
        uint64_t v7 = 0;
        unint64_t v8 = 0;
        do
        {
          id v9 = objc_alloc((Class)CLLocation);
          uint64_t v10 = sub_1002D4CD0(*((void *)a4 + 100));
          long long v11 = *(_OWORD *)(v10 + v7 + 16);
          v27[0] = *(_OWORD *)(v10 + v7);
          v27[1] = v11;
          long long v12 = *(_OWORD *)(v10 + v7 + 80);
          long long v14 = *(_OWORD *)(v10 + v7 + 32);
          long long v13 = *(_OWORD *)(v10 + v7 + 48);
          v27[4] = *(_OWORD *)(v10 + v7 + 64);
          v27[5] = v12;
          v27[2] = v14;
          v27[3] = v13;
          long long v16 = *(_OWORD *)(v10 + v7 + 112);
          long long v15 = *(_OWORD *)(v10 + v7 + 128);
          long long v17 = *(_OWORD *)(v10 + v7 + 96);
          *(_OWORD *)&v28[12] = *(_OWORD *)(v10 + v7 + 140);
          v27[7] = v16;
          *(_OWORD *)double v28 = v15;
          v27[6] = v17;
          id v18 = [v9 initWithClientLocation:v27];
          [(CLRoutineMonitor *)self addLocation:v18];

          ++v8;
          v7 += 156;
        }
        while (v8 < sub_1010FB9FC(*((int **)a4 + 100)));
      }
LABEL_14:
      [objc_msgSend(objc_msgSend(objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "vendor"), "proxyForService:", @"CLClientManager"), "dingAllActiveTranscriptSubscriptions"];
      return;
    }
LABEL_13:
    id v19 = objc_alloc((Class)CLLocation);
    long long v20 = *((_OWORD *)a4 + 7);
    v29[6] = *((_OWORD *)a4 + 6);
    v29[7] = v20;
    v30[0] = *((_OWORD *)a4 + 8);
    *(_OWORD *)((char *)v30 + 12) = *(_OWORD *)((char *)a4 + 140);
    long long v21 = *((_OWORD *)a4 + 3);
    v29[2] = *((_OWORD *)a4 + 2);
    v29[3] = v21;
    long long v22 = *((_OWORD *)a4 + 5);
    v29[4] = *((_OWORD *)a4 + 4);
    v29[5] = v22;
    long long v23 = *((_OWORD *)a4 + 1);
    v29[0] = *(_OWORD *)a4;
    v29[1] = v23;
    id v24 = [v19 initWithClientLocation:v29];
    [(CLRoutineMonitor *)self addLocation:v24];

    goto LABEL_14;
  }
  if (a3 == 4) {
    goto LABEL_13;
  }
  if (a3 == 14)
  {
    [(CLRoutineMonitor *)self checkAuthorization];
    return;
  }
LABEL_15:
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022F6020);
  }
  double v25 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 67240192;
    int v34 = a3;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "received unhandled notification %{public, location:CLLocationProvider_Type::Notification}d", buf, 8u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    int v31 = 67240192;
    int v32 = a3;
    double v26 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLRoutineMonitor onLocationNotification:data:]", "%s\n", v26);
    if (v26 != (char *)buf) {
      free(v26);
    }
  }
}

+ (BOOL)isSupported
{
  if (qword_102481318 != -1) {
    dispatch_once(&qword_102481318, &stru_1022F5E60);
  }
  return byte_102481310;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_102481328 != -1) {
    dispatch_once(&qword_102481328, &stru_1022F5E80);
  }
  return (id)qword_102481320;
}

+ (id)bundlePath
{
  if (qword_102481338 != -1) {
    dispatch_once(&qword_102481338, &stru_1022F5EA0);
  }
  return (id)qword_102481330;
}

- (CLRoutineMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLRoutineMonitor;
  return [(CLRoutineMonitor *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLRoutineMonitorServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLRoutineMonitorClientProtocol];
}

- (void)beginService
{
  objc_super v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)[objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo") queue]);
  self->_wakeRoutinedTimer = v3;
  dispatch_source_set_timer((dispatch_source_t)v3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = sub_100177E00;
  v6[4] = sub_100177514;
  v6[5] = self;
  wakeRoutinedTimer = self->_wakeRoutinedTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100D72440;
  handler[3] = &unk_1022B6BE8;
  handler[4] = v6;
  dispatch_source_set_event_handler(wakeRoutinedTimer, handler);
  dispatch_resume((dispatch_object_t)self->_wakeRoutinedTimer);
  operator new();
}

- (void)endService
{
  [(NSXPCConnection *)[(CLRoutineMonitor *)self connection] invalidate];
  [(CLRoutineMonitor *)self setConnection:0];
  [(NSXPCListener *)[(CLRoutineMonitor *)self listener] invalidate];
  [(CLRoutineMonitor *)self setListener:0];
  value = self->_serviceLocationClient.__ptr_.__value_;
  self->_serviceLocationClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8))(value);
  }
  v4 = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = 0;
  if (v4) {
    (*(void (**)(Client *))(*(void *)v4 + 8))(v4);
  }
  unint64_t v5 = self->_filteredLocationClient.__ptr_.__value_;
  self->_filteredLocationClient.__ptr_.__value_ = 0;
  if (v5) {
    (*(void (**)(Client *))(*(void *)v5 + 8))(v5);
  }
  v6 = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0;
  if (v6) {
    (*(void (**)(Client *))(*(void *)v6 + 8))(v6);
  }
  uint64_t v7 = self->_awarenessClient.__ptr_.__value_;
  self->_awarenessClient.__ptr_.__value_ = 0;
  if (v7) {
    (*(void (**)(Client *))(*(void *)v7 + 8))(v7);
  }
  serviceLocationProvider = self->_serviceLocationProvider;
  if (serviceLocationProvider)
  {
    (*(void (**)(void *))(*(void *)serviceLocationProvider + 8))(serviceLocationProvider);
    self->_serviceLocationProvider = 0;
  }
  [(RTRoutineManager *)[(CLRoutineMonitor *)self routineManager] stopMonitoringVisits];
  [(CLRoutineMonitor *)self setVisitClients:0];
  [(RTRoutineManager *)[(CLRoutineMonitor *)self routineManager] stopLeechingVisits];
  [(CLRoutineMonitor *)self setLeechClients:0];
  [(RTRoutineManager *)[(CLRoutineMonitor *)self routineManager] stopLeechingLowConfidenceVisits];
  [(CLRoutineMonitor *)self setLowConfidenceVisitLeechClients:0];
  [(RTRoutineManager *)[(CLRoutineMonitor *)self routineManager] stopMonitoringPlaceInferences];
  [(CLRoutineMonitor *)self setCachedPlaceInferences:0];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100D727F0;
  v9[3] = &unk_1022F5EC8;
  v9[4] = self;
  [(NSMutableDictionary *)[(CLRoutineMonitor *)self scenarioTriggerClients] enumerateKeysAndObjectsUsingBlock:v9];
  [(CLRoutineMonitor *)self setScenarioTriggerClients:0];
  [(CLRoutineMonitor *)self setRoutineManager:0];
}

- (void)startMonitoringPlaceInferencesForCache
{
  id v3 = [objc_alloc((Class)RTPlaceInferenceOptions) initWithFidelityPolicy:0 locations:&__NSArray0__struct accessPoints:&__NSArray0__struct];
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022F6020);
  }
  v4 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "start monitoring place inferences for cache", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    __int16 v7 = 0;
    unint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor startMonitoringPlaceInferencesForCache]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100D72A50;
  v6[3] = &unk_10229FF00;
  v6[4] = self;
  [(RTRoutineManager *)[(CLRoutineMonitor *)self routineManager] startMonitoringPlaceInferencesWithOptions:v3 handler:v6];
}

- (void)startMonitoringVisitsForClient:(id)a3
{
  [self universe].silo
  if (![(NSMutableSet *)[(CLRoutineMonitor *)self visitClients] count])
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    unint64_t v5 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#slv telling routined to start visit monitoring", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022F6020);
      }
      __int16 v8 = 0;
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor startMonitoringVisitsForClient:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100D72E70;
    v7[3] = &unk_1022F5EF0;
    v7[4] = self;
    [(RTRoutineManager *)[(CLRoutineMonitor *)self routineManager] startMonitoringVisitsWithHandler:v7];
    *(_DWORD *)buf = 3600;
    __int16 v10 = 1;
    long long v11 = "visits";
    sub_1005E05AC();
  }
  [(NSMutableSet *)[(CLRoutineMonitor *)self visitClients] addObject:a3];
  [(CLRoutineMonitor *)self checkDiminishedMode];
}

- (void)stopMonitoringVisitsForClient:(id)a3
{
  [self universe].silo
  [(NSMutableSet *)[(CLRoutineMonitor *)self visitClients] removeObject:a3];
  if (![(NSMutableSet *)[(CLRoutineMonitor *)self visitClients] count])
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    unint64_t v5 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#slv telling routined to stop visit monitoring", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022F6020);
      }
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor stopMonitoringVisitsForClient:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
    [(RTRoutineManager *)[(CLRoutineMonitor *)self routineManager] stopMonitoringVisits];
    [*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2) unregister:*((void *)self->_wifiServiceClient.__ptr_.__value_ + 1) forNotification:12];
    [*((id *)self->_awarenessClient.__ptr_.__value_ + 2) unregister:*((void *)self->_awarenessClient.__ptr_.__value_ + 1) forNotification:0];
  }
  [(CLRoutineMonitor *)self checkDiminishedMode];
}

- (void)startLeechingVisitsForClient:(id)a3
{
  [self universe].silo
  if (![(NSMutableSet *)[(CLRoutineMonitor *)self leechClients] count])
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    unint64_t v5 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#slv Telling routined to start visit leeching", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022F6020);
      }
      __int16 v8 = 0;
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor startLeechingVisitsForClient:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100D735B4;
    v7[3] = &unk_1022F5EF0;
    v7[4] = self;
    [(RTRoutineManager *)[(CLRoutineMonitor *)self routineManager] startLeechingVisitsWithHandler:v7];
  }
  [(NSMutableSet *)[(CLRoutineMonitor *)self leechClients] addObject:a3];
}

- (void)stopLeechingVisitsForClient:(id)a3
{
  [self universe].silo
  [(NSMutableSet *)[(CLRoutineMonitor *)self leechClients] removeObject:a3];
  if (![(NSMutableSet *)[(CLRoutineMonitor *)self leechClients] count])
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    unint64_t v5 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#slv Telling routined to stop visit leeching", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022F6020);
      }
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor stopLeechingVisitsForClient:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
    [(RTRoutineManager *)[(CLRoutineMonitor *)self routineManager] stopLeechingVisits];
  }
}

- (void)startLeechingLowConfidenceVisitsForClient:(id)a3
{
  [self universe].silo
  if (![(NSMutableSet *)[(CLRoutineMonitor *)self lowConfidenceVisitLeechClients] count])
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    unint64_t v5 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#slv Telling routined to start low confidence visit leeching", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022F6020);
      }
      __int16 v8 = 0;
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor startLeechingLowConfidenceVisitsForClient:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100D73CC0;
    v7[3] = &unk_1022F5EF0;
    v7[4] = self;
    [(RTRoutineManager *)[(CLRoutineMonitor *)self routineManager] startLeechingLowConfidenceVisitsWithHandler:v7];
  }
  [(NSMutableSet *)[(CLRoutineMonitor *)self lowConfidenceVisitLeechClients] addObject:a3];
}

- (void)stopLeechingLowConfidenceVisitsForClient:(id)a3
{
  [self universe].silo
  [(NSMutableSet *)[(CLRoutineMonitor *)self lowConfidenceVisitLeechClients] removeObject:a3];
  if (![(NSMutableSet *)[(CLRoutineMonitor *)self leechClients] count])
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    unint64_t v5 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#slv Telling routined to stop low confidence visit leeching", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022F6020);
      }
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor stopLeechingLowConfidenceVisitsForClient:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
    [(RTRoutineManager *)[(CLRoutineMonitor *)self routineManager] stopLeechingLowConfidenceVisits];
  }
}

- (void)fetchLocationOfInterestAtLocation:(id)a3 withReply:(id)a4
{
  v6 = [(CLRoutineMonitor *)self routineManager];

  [(RTRoutineManager *)v6 fetchLocationOfInterestAtLocation:a3 withHandler:a4];
}

- (void)fetchRoutineModeFromLocation:(id)a3 withReply:(id)a4
{
  if ([(CLRoutineMonitor *)self routineManager])
  {
    __int16 v7 = [(CLRoutineMonitor *)self routineManager];
    [(RTRoutineManager *)v7 fetchRoutineModeFromLocation:a3 withHandler:a4];
  }
  else
  {
    __int16 v8 = (void (*)(id, void, void))*((void *)a4 + 2);
    v8(a4, 0, 0);
  }
}

- (void)fetchLocationOfInterestForRegion:(id)a3 withReply:(id)a4
{
  if ([(CLRoutineMonitor *)self routineManager])
  {
    __int16 v7 = [(CLRoutineMonitor *)self routineManager];
    [(RTRoutineManager *)v7 fetchLocationOfInterestForRegion:a3 withHandler:a4];
  }
  else if (a4)
  {
    __int16 v8 = (void (*)(id, void, void))*((void *)a4 + 2);
    v8(a4, 0, 0);
  }
}

- (void)setHintForRegionState:(int64_t)a3 significantRegion:(id)a4 withReply:(id)a5
{
  if ([(CLRoutineMonitor *)self routineManager])
  {
    id v9 = [(CLRoutineMonitor *)self routineManager];
    [(RTRoutineManager *)v9 setHintForRegionState:a3 significantRegion:a4 withHandler:a5];
  }
  else if (a5)
  {
    __int16 v10 = (void (*)(id, void, void))*((void *)a5 + 2);
    v10(a5, 0, 0);
  }
}

- (void)fetchLocationsOfInterestAssociatedToIdentifier:(id)a3 withReply:(id)a4
{
  if ([(CLRoutineMonitor *)self routineManager])
  {
    __int16 v7 = [(CLRoutineMonitor *)self routineManager];
    [(RTRoutineManager *)v7 fetchLocationsOfInterestAssociatedToIdentifier:a3 withHandler:a4];
  }
  else
  {
    __int16 v8 = (void (*)(id, void, void))*((void *)a4 + 2);
    v8(a4, 0, 0);
  }
}

- (void)fetchLocationOfInterestWithIdentifier:(id)a3 withReply:(id)a4
{
  if ([(CLRoutineMonitor *)self routineManager])
  {
    __int16 v7 = [(CLRoutineMonitor *)self routineManager];
    [(RTRoutineManager *)v7 fetchLocationOfInterestWithIdentifier:a3 withHandler:a4];
  }
  else
  {
    __int16 v8 = (void (*)(id, void, void))*((void *)a4 + 2);
    v8(a4, 0, 0);
  }
}

- (void)fetchLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 withReply:(id)a5
{
  if ([(CLRoutineMonitor *)self routineManager])
  {
    id v9 = [(CLRoutineMonitor *)self routineManager];
    [(RTRoutineManager *)v9 fetchLocationsOfInterestWithinDistance:a4 ofLocation:a5 withHandler:a3];
  }
  else
  {
    __int16 v10 = (void (*)(id, void, void))*((void *)a5 + 2);
    v10(a5, 0, 0);
  }
}

- (void)fetchLocationsOfInterestOfType:(int64_t)a3 withReply:(id)a4
{
  if ([(CLRoutineMonitor *)self routineManager])
  {
    __int16 v7 = [(CLRoutineMonitor *)self routineManager];
    [(RTRoutineManager *)v7 fetchLocationsOfInterestOfType:a3 withHandler:a4];
  }
  else
  {
    __int16 v8 = (void (*)(id, void, void))*((void *)a4 + 2);
    v8(a4, 0, 0);
  }
}

- (void)fetchRecentLocationsOfInterestWithReply:(id)a3
{
  if (![(CLRoutineMonitor *)self routineManager]) {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0, 0);
  }
  unint64_t v5 = +[NSDate dateWithTimeIntervalSinceNow:-4233600.0];
  v6 = [(CLRoutineMonitor *)self routineManager];

  [(RTRoutineManager *)v6 fetchLocationsOfInterestVisitedSinceDate:v5 withHandler:a3];
}

- (void)fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 withReply:(id)a6
{
  if (![(CLRoutineMonitor *)self routineManager]) {
    (*((void (**)(id, void, void))a6 + 2))(a6, 0, 0);
  }
  long long v11 = [(CLRoutineMonitor *)self routineManager];

  [(RTRoutineManager *)v11 fetchNextPredictedLocationsOfInterestFromLocation:a3 startDate:a4 timeInterval:a6 withHandler:a5];
}

- (void)fetchPredictedLocationsOfInterestOnDate:(id)a3 withReply:(id)a4
{
  if (![(CLRoutineMonitor *)self routineManager]) {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0, 0);
  }
  __int16 v7 = [(CLRoutineMonitor *)self routineManager];

  [(RTRoutineManager *)v7 fetchPredictedLocationsOfInterestOnDate:a3 withHandler:a4];
}

- (void)fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 withReply:(id)a5
{
  if (![(CLRoutineMonitor *)self routineManager]) {
    (*((void (**)(id, void, void))a5 + 2))(a5, 0, 0);
  }
  id v9 = [(CLRoutineMonitor *)self routineManager];

  [(RTRoutineManager *)v9 fetchPredictedLocationsOfInterestBetweenStartDate:a3 endDate:a4 withHandler:a5];
}

- (void)fetchDedupedLocationOfInterestIdentifiersWithIdentifier:(id)a3 withReply:(id)a4
{
  if (![(CLRoutineMonitor *)self routineManager]) {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0, 0);
  }
  __int16 v7 = [(CLRoutineMonitor *)self routineManager];

  [(RTRoutineManager *)v7 fetchDedupedLocationOfInterestIdentifiersWithIdentifier:a3 handler:a4];
}

- (void)dealloc
{
  [(CLRoutineMonitor *)self setLocations:0];
  [(CLRoutineMonitor *)self setLastLocation:0];
  [(CLRoutineMonitor *)self setInertialSamples:0];
  wakeRoutinedTimer = self->_wakeRoutinedTimer;
  if (wakeRoutinedTimer)
  {
    dispatch_source_cancel(wakeRoutinedTimer);
    dispatch_release((dispatch_object_t)self->_wakeRoutinedTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)CLRoutineMonitor;
  [(CLRoutineMonitor *)&v4 dealloc];
}

- (void)onClientManagerNotification:(int)a3 data:(NotificationData *)a4
{
  [self universe:a3, a4, a5 silo];
  if (a3)
  {
    if (a3 == 4)
    {
      [(CLRoutineMonitor *)self checkAuthorization];
    }
    else
    {
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022F6020);
      }
      __int16 v10 = qword_102419558;
      if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67240192;
        int v13 = a3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "received unhandled notification %{public, location:CLClientManager_Type::Notification}d", buf, 8u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419550 != -1) {
          dispatch_once(&qword_102419550, &stru_1022F6020);
        }
        long long v11 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLRoutineMonitor onClientManagerNotification:data:]", "%s\n", v11);
        if (v11 != (char *)buf) {
          free(v11);
        }
      }
    }
  }
  else
  {
    [(CLRoutineMonitor *)self flush];
    [(CLRoutineMonitor *)self checkAuthorization];
    id v7 = [[objc_msgSend(-[CLRoutineMonitor universe](self, "universe")), "vendor"] proxyForService:@"CLClientManager"];
    if (byte_10248130F >= 0) {
      __int16 v8 = &qword_1024812F8;
    }
    else {
      __int16 v8 = (uint64_t *)qword_1024812F8;
    }
    id v9 = +[NSString stringWithUTF8String:v8];
    [v7 resetNotificationConsumedForIdentifier:v9];
  }
}

- (void)addInertialData:(id)a3
{
  [self universe].silo
  if (qword_102481340 != -1) {
    dispatch_once(&qword_102481340, &stru_1022F5F10);
  }
  [(NSMutableArray *)[(CLRoutineMonitor *)self inertialSamples] addObject:a3];
  if ([(CLRoutineMonitor *)self updating]
    && (id v5 = [(NSMutableArray *)[(CLRoutineMonitor *)self inertialSamples] count],
        (unint64_t)v5 > qword_102474540))
  {
    [(CLRoutineMonitor *)self sendInertialData];
  }
  else if ((unint64_t)[(NSMutableArray *)[(CLRoutineMonitor *)self inertialSamples] count] >= 0x272)
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    v6 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v9 = 625;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#warning in-memory inertial cache has exceeded threshold of %{public}lu, removing oldest samples", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022F6020);
      }
      id v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor addInertialData:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    [(NSMutableArray *)[(CLRoutineMonitor *)self inertialSamples] removeObjectAtIndex:0];
  }
}

- (void)onVdrNotification:(int)a3 data:(NotificationData *)a4
{
  [self universe].silo
  if (a3)
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    id v7 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "CLTSP,unknown CLVDRNotifier_Type::Notification,%u", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022F6020);
      }
      __int16 v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLRoutineMonitor onVdrNotification:data:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
  else
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    uint64_t v9 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEBUG))
    {
      __int16 v10 = *(void **)a4;
      uint64_t v11 = *((void *)a4 + 1);
      uint64_t v12 = *((void *)a4 + 2);
      uint64_t v13 = *((void *)a4 + 3);
      *(_DWORD *)buf = 134218752;
      id v19 = v10;
      __int16 v20 = 2048;
      uint64_t v21 = v11;
      __int16 v22 = 2048;
      uint64_t v23 = v12;
      __int16 v24 = 2048;
      uint64_t v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "CLTSP,vdr2DofMeasurementSample,t,%.3lf,dataPeriod,%.2lf,deltaCourse,%.3lf,deltaSpeed,%.3lf", buf, 0x2Au);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022F6020);
      }
      long long v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor onVdrNotification:data:]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
    id v14 = [objc_alloc((Class)CLTripSegmentInertialData) initWithTime:[objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:*(double *)a4] dataPeriodSec:*(double *)a4 deltaCourseRad:*(double *)a4 deltaSpeedMps:*(double *)a4 deltaCourseVarRad2:*(double *)a4 deltaSpeedVarMps2:*(double *)a4 deltaCourseSpeedCovarRadMps:*(double *)a4];
    if ([v14 isValid])
    {
      [(CLRoutineMonitor *)self addInertialData:v14];
    }
    else
    {
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022F6020);
      }
      long long v15 = qword_102419558;
      if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "CLTSP,invalid tripSegmentInertialData,%@", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419550 != -1) {
          dispatch_once(&qword_102419550, &stru_1022F6020);
        }
        long long v17 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLRoutineMonitor onVdrNotification:data:]", "%s\n", v17);
        if (v17 != (char *)buf) {
          free(v17);
        }
      }
    }
  }
}

- (void)flush
{
  [self universe].silo
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022F6020);
  }
  id v3 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "flushing routine data", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    objc_super v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor flush]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(NSMutableArray *)[(CLRoutineMonitor *)self inertialSamples] removeAllObjects];
  [(NSMutableArray *)[(CLRoutineMonitor *)self locations] removeAllObjects];
  [(CLRoutineMonitor *)self setArmed:0];
}

- (void)checkAuthorization
{
  [self universe].silo
  if (sub_1001198CC() != 1)
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    objc_super v4 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Location services are disabled; stopping routine data collection",
        buf,
        2u);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_16;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419550 == -1) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (sub_100170B44((uint64_t)self->_serviceLocationProvider) != 3)
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    id v5 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Routine system service disabled; stopping routine data collection",
        buf,
        2u);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_16;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419550 == -1)
    {
LABEL_19:
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor checkAuthorization]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
LABEL_16:
      uint64_t v3 = 0;
      goto LABEL_17;
    }
LABEL_21:
    dispatch_once(&qword_102419550, &stru_1022F6020);
    goto LABEL_19;
  }
  uint64_t v3 = 1;
LABEL_17:
  [(CLRoutineMonitor *)self setAuthorized:v3];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  [self universe].silo
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022F6020);
  }
  v6 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "LocationServer received incoming connection", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    LOWORD(v22) = 0;
    long long v15 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor listener:shouldAcceptNewConnection:]", "%s\n", v15);
    if (v15 != (char *)buf) {
      free(v15);
    }
  }
  if (a4)
  {
    id v7 = [a4 valueForEntitlement:@"com.apple.locationd.routine"];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && ([v7 BOOLValue])
      {
        [a4 setExportedInterface:[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CLLocationManagerRoutineServerInterface]];
        [a4 setExportedObject:self];
        [a4 setRemoteObjectInterface:+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CLLocationManagerRoutineClientInterface)];
        [a4 _setQueue:[objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo") queue]];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100D75F58;
        v19[3] = &unk_10229FED8;
        v19[4] = self;
        [a4 setInterruptionHandler:v19];
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100D76110;
        v18[3] = &unk_10229FED8;
        v18[4] = self;
        [a4 setInvalidationHandler:v18];
        [(CLRoutineMonitor *)self setConnection:a4];
        [(NSXPCConnection *)[(CLRoutineMonitor *)self connection] resume];
        LOBYTE(v8) = 1;
        return v8;
      }
    }
    unsigned int v9 = [a4 processIdentifier];
    long long v22 = 0u;
    long long v23 = 0u;
    [a4 auditToken];
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    __int16 v10 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_FAULT))
    {
      sub_1000B73FC();
      if (v21 >= 0) {
        uint64_t v11 = __p;
      }
      else {
        uint64_t v11 = (void **)__p[0];
      }
      *(_DWORD *)buf = 68289538;
      int v25 = 0;
      __int16 v26 = 2082;
      double v27 = "";
      __int16 v28 = 1026;
      unsigned int v29 = v9;
      __int16 v30 = 2082;
      int v31 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"process is not entitled to use CLLocationManagerRoutine\", \"pid\":%{public}d, \"executable\":%{public, location:escape_only}s}", buf, 0x22u);
      if (v21 < 0) {
        operator delete(__p[0]);
      }
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022F6020);
      }
    }
    uint64_t v12 = qword_102419558;
    if (os_signpost_enabled((os_log_t)qword_102419558))
    {
      sub_1000B73FC();
      if (v21 >= 0) {
        uint64_t v13 = __p;
      }
      else {
        uint64_t v13 = (void **)__p[0];
      }
      *(_DWORD *)buf = 68289538;
      int v25 = 0;
      __int16 v26 = 2082;
      double v27 = "";
      __int16 v28 = 1026;
      unsigned int v29 = v9;
      __int16 v30 = 2082;
      int v31 = v13;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "process is not entitled to use CLLocationManagerRoutine", "{\"msg%{public}.0s\":\"process is not entitled to use CLLocationManagerRoutine\", \"pid\":%{public}d, \"executable\":%{public, location:escape_only}s}", buf, 0x22u);
      if (v21 < 0) {
        operator delete(__p[0]);
      }
    }
LABEL_27:
    LOBYTE(v8) = 0;
    return v8;
  }
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022F6020);
  }
  id v14 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "Why didn't we get a connection", buf, 2u);
  }
  BOOL v8 = sub_10013D1A0(115, 0);
  if (v8)
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    LOWORD(v22) = 0;
    long long v16 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLRoutineMonitor listener:shouldAcceptNewConnection:]", "%s\n", v16);
    if (v16 != (char *)buf) {
      free(v16);
    }
    goto LABEL_27;
  }
  return v8;
}

- (void)sendInertialData
{
  [self universe].silo
  [-[NSXPCConnection _unboostingRemoteObjectProxy](-[CLRoutineMonitor connection](self, "connection"), "_unboostingRemoteObjectProxy") didUpdateInertialData: -[CLRoutineMonitor inertialSamples](self, "inertialSamples")];
  uint64_t v3 = [(CLRoutineMonitor *)self inertialSamples];

  [(NSMutableArray *)v3 removeAllObjects];
}

- (void)startUpdatingLocation
{
  [self universe].silo
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022F6020);
  }
  uint64_t v3 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "start updating location", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    objc_super v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor startUpdatingLocation]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLRoutineMonitor *)self setUpdating:1];
  [(CLRoutineMonitor *)self sendLocations];
}

- (void)stopUpdatingLocation
{
  [self universe].silo
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022F6020);
  }
  uint64_t v3 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "stop updating location", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    objc_super v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor stopUpdatingLocation]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLRoutineMonitor *)self setUpdating:0];
}

- (void)sendLocationsWithReply:(id)a3
{
  [self universe].silo
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022F6020);
  }
  id v5 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    int v8 = 0;
    __int16 v9 = 2082;
    __int16 v10 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#location #routine sendLocationsWithReply\"}", buf, 0x12u);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100D767FC;
  v6[3] = &unk_1022D7BF0;
  v6[4] = a3;
  [[-[NSXPCConnection remoteObjectProxy](-[CLRoutineMonitor connection](self, "connection"), "remoteObjectProxy") didUpdateLocations:v1 withReply:v2];
  [(NSMutableArray *)[(CLRoutineMonitor *)self locations] removeAllObjects];
  [(CLRoutineMonitor *)self setArmed:0];
}

- (void)setAuthorized:(BOOL)a3
{
  BOOL v3 = a3;
  [self universe].silo
  if (self->_authorized != v3)
  {
    self->_authorized = v3;
    [(CLRoutineMonitor *)self setArmed:v3];
    [(CLRoutineMonitor *)self checkDiminishedMode];
  }
}

- (void)startWakeRoutinedTimer
{
  [self universe].silo
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022F6020);
  }
  BOOL v3 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "start wakeRoutinedTimer", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor startWakeRoutinedTimer]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  wakeRoutinedTimer = self->_wakeRoutinedTimer;
  dispatch_time_t v5 = dispatch_time(0, 300000000000);
  dispatch_source_set_timer(wakeRoutinedTimer, v5, 0x45D964B800uLL, 0);
}

- (void)stopWakeRoutinedTimer
{
  [self universe].silo
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022F6020);
  }
  BOOL v3 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "stop wakeRoutinedTimer", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    objc_super v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor stopWakeRoutinedTimer]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  dispatch_source_set_timer((dispatch_source_t)self->_wakeRoutinedTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)onWakeRoutinedTimer
{
  [self universe].silo
  if (![(CLRoutineMonitor *)self connection])
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    BOOL v3 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "wake routined", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022F6020);
      }
      objc_super v4 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor onWakeRoutinedTimer]", "%s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
    [objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "vendor") launchDaemon:[+[CLRoutineMonitor bundlePath](CLRoutineMonitor, "bundlePath")];
  }
}

- (void)setDiminishedMode:(BOOL)a3
{
  if (self->_diminishedMode != a3)
  {
    self->_diminishedMode = a3;
    if (a3)
    {
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022F6020);
      }
      objc_super v4 = qword_102419558;
      if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "entering diminished mode; starting data collection",
          buf,
          2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419550 != -1) {
          dispatch_once(&qword_102419550, &stru_1022F6020);
        }
        int v8 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor setDiminishedMode:]", "%s\n", v8);
        if (v8 != (char *)buf) {
          free(v8);
        }
      }
      value = self->_filteredLocationClient.__ptr_.__value_;
      if (value)
      {
        [*((id *)value + 2) register:*((void *)value + 1) forNotification:4 registrationInfo:0];
        [*((id *)self->_filteredLocationClient.__ptr_.__value_ + 2) register:*((void *)self->_filteredLocationClient.__ptr_.__value_ + 1) forNotification:22 registrationInfo:0];
      }
    }
    else
    {
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022F6020);
      }
      v6 = qword_102419558;
      if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "exiting diminished mode; stopping data collection",
          buf,
          2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419550 != -1) {
          dispatch_once(&qword_102419550, &stru_1022F6020);
        }
        __int16 v9 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor setDiminishedMode:]", "%s\n", v9);
        if (v9 != (char *)buf) {
          free(v9);
        }
      }
      id v7 = self->_filteredLocationClient.__ptr_.__value_;
      if (v7)
      {
        [*((id *)v7 + 2) unregister:*((void *)v7 + 1) forNotification:4];
        [*((id *)self->_filteredLocationClient.__ptr_.__value_ + 2) unregister:*((void *)self->_filteredLocationClient.__ptr_.__value_ + 1) forNotification:22];
      }
    }
    [(CLRoutineMonitor *)self setArmed:self->_diminishedMode];
  }
}

- (void)checkDiminishedMode
{
  [self universe].silo
  BOOL v3 = ![(CLRoutineMonitor *)self authorized]
    && [(NSMutableSet *)[(CLRoutineMonitor *)self visitClients] count];

  [(CLRoutineMonitor *)self setDiminishedMode:v3];
}

- (void)startMonitoringScenarioTriggerOfType:(unint64_t)a3 forClient:(id)a4
{
  [self universe].silo
  id v7 = +[NSNumber numberWithUnsignedInteger:a3];
  id v8 = [(NSMutableDictionary *)[(CLRoutineMonitor *)self scenarioTriggerClients] objectForKey:v7];
  if (!v8)
  {
    id v8 = (id)objc_opt_new();
    [(NSMutableDictionary *)[(CLRoutineMonitor *)self scenarioTriggerClients] setObject:v8 forKey:v7];
  }
  if (![v8 count])
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    __int16 v9 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#scenarioTrigger Telling routined to start monitoring trigger of type, %lu", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022F6020);
      }
      int v12 = 134217984;
      unint64_t v13 = a3;
      __int16 v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor startMonitoringScenarioTriggerOfType:forClient:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100D77504;
    v11[3] = &unk_1022F5F38;
    v11[4] = self;
    v11[5] = v7;
    [(RTRoutineManager *)[(CLRoutineMonitor *)self routineManager] startMonitoringScenarioTriggerOfType:a3 withHandler:v11];
  }
  [v8 addObject:a4];
}

- (void)stopMonitoringScenarioTriggerOfType:(unint64_t)a3 forClient:(id)a4
{
  [self universe].silo
  id v7 = [(NSMutableDictionary *)[(CLRoutineMonitor *)self scenarioTriggerClients] objectForKey:+[NSNumber numberWithUnsignedInteger:a3]];
  [v7 removeObject:a4];
  if (![v7 count])
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    id v8 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#scenarioTrigger Telling routined to stop monitoring trigger of type, %lu", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022F6020);
      }
      __int16 v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRoutineMonitor stopMonitoringScenarioTriggerOfType:forClient:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    [(RTRoutineManager *)[(CLRoutineMonitor *)self routineManager] stopMonitoringScenarioTriggerOfType:a3];
  }
}

- (void)fetchPlaceInferencesWithOptions:(id)a3 withReply:(id)a4
{
  v6 = [(CLRoutineMonitor *)self routineManager];

  [(RTRoutineManager *)v6 fetchPlaceInferencesWithOptions:a3 handler:a4];
}

- (void)fetchCachedPlaceInferencesWithReply:(id)a3
{
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022F6020);
  }
  dispatch_time_t v5 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289283;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    __int16 v9 = 2113;
    __int16 v10 = [(CLRoutineMonitor *)self cachedPlaceInferences];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"fetchCachedPlaceInferences\", \"cachedPlaceInferences\":%{private, location:escape_only}@}", (uint8_t *)v6, 0x1Cu);
  }
  (*((void (**)(id, NSMutableArray *, void))a3 + 2))(a3, [(CLRoutineMonitor *)self cachedPlaceInferences], 0);
}

- (void)fetchFormattedPostalAddressesFromMeCardWithReply:(id)a3
{
  objc_super v4 = [(CLRoutineMonitor *)self routineManager];

  [(RTRoutineManager *)v4 fetchFormattedPostalAddressesFromMeCard:a3];
}

- (void)fetchStoredVisitsWithOptions:(id)a3 withReply:(id)a4
{
  if (![(CLRoutineMonitor *)self routineManager]) {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0, 0);
  }
  __int16 v7 = [(CLRoutineMonitor *)self routineManager];

  [(RTRoutineManager *)v7 fetchStoredVisitsWithOptions:a3 handler:a4];
}

- (void)getStoredLocationsBetweenStartTime:(double)a3 endTime:(double)a4 apartFromEachOther:(double)a5 lyingWithinTimeIntervals:(id)a6 withReply:(id)a7
{
  id v13 = [objc_alloc((Class)NSDateInterval) initWithStartDate:[NSDate dateWithTimeIntervalSinceReferenceDate:] endDate:[NSDate dateWithTimeIntervalSinceReferenceDate:a4]];
  id v14 = objc_alloc((Class)RTStoredVisitFetchOptions);
  id v15 = [v14 initWithAscending:1 confidence:[NSNumber numberWithDouble:RTVisitConfidenceHigh] dateInterval:v13 limit:0];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100D77F0C;
  v16[3] = &unk_1022F5F60;
  *(double *)&v16[7] = a3;
  *(double *)&v16[8] = a4;
  *(double *)&v16[9] = a5;
  v16[4] = [[-[CLRoutineMonitor vendor](self, "vendor") proxyForService:@"CLRoutineMonitor" forClient:@"CLRoutineMonitor"];
  v16[5] = a6;
  v16[6] = a7;
  [(RTRoutineManager *)[(CLRoutineMonitor *)self routineManager] fetchStoredVisitsWithOptions:v15 handler:v16];
}

- (void)zipperedStoredLocationsBetweenStartTime:(double)a3 endTime:(double)a4 apartFromEachOther:(double)a5 lyingWithinTimeIntervals:(id)a6 custeredWithVisits:(id)a7 withReply:(id)a8
{
  __int16 v28 = +[NSMutableArray arrayWithCapacity:0];
  double v27 = +[NSMutableArray arrayWithCapacity:0];
  id v15 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3];
  long long v16 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a4];
  id v26 = [objc_alloc((Class)RTStoredLocationEnumerationOptions) initWithDateInterval:[objc_alloc((Class)NSDateInterval) initWithStartDate:v15 endDate:v16], horizontalAccuracy:0, batchSize:0, boundingBoxLocation:0.0];
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022F6040);
  }
  long long v17 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
  {
    *(void *)buf = 68290562;
    *(_WORD *)v56 = 2082;
    *(void *)&v56[2] = "";
    *(_WORD *)&v56[10] = 2050;
    *(void *)&v56[12] = [a6 count];
    *(_WORD *)&v56[20] = 2050;
    *(void *)&v56[22] = [a7 count];
    *(_WORD *)&v56[30] = 2050;
    uint64_t v57 = (uint64_t)a3;
    __int16 v58 = 2050;
    uint64_t v59 = (uint64_t)a4;
    __int16 v60 = 2114;
    v61 = v15;
    __int16 v62 = 2114;
    v63 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#storedLocations: zipper start\", \"IntervalCount\":%{public}ld, \"VisitCount\":%{public}ld, \"startTime\":%{public}ld, \"endTime\":%{public}ld, \"FromDate\":%{public, location:escape_only}@, \"ToDate\":%{public, location:escape_only}@}", buf, 0x4Eu);
  }
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  int v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  int v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  char v40 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 0xFFEFFFFFFFFFFFFFLL;
  *(void *)buf = 0;
  *(void *)v56 = buf;
  *(void *)&v56[8] = 0x3052000000;
  *(void *)&v56[16] = sub_100177E00;
  *(void *)&v56[24] = sub_100177514;
  uint64_t v57 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3052000000;
  v35 = sub_100177E00;
  v36 = sub_100177514;
  uint64_t v37 = 0;
  v30[0] = 0;
  v30[1] = v30;
  _OWORD v30[2] = 0x2020000000;
  char v31 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100D7870C;
  v29[3] = &unk_1022F5F88;
  _OWORD v29[8] = v43;
  v29[9] = v30;
  v29[10] = &v32;
  v29[11] = v38;
  *(double *)&v29[15] = a5;
  v29[4] = a6;
  v29[5] = a7;
  v29[12] = v41;
  v29[13] = buf;
  v29[14] = v39;
  v29[6] = v27;
  v29[7] = v28;
  [(RTRoutineManager *)[(CLRoutineMonitor *)self routineManager] enumerateStoredLocationsWithOptions:v26 usingBlock:v29];
  id v18 = v33;
  id v19 = (void *)v33[5];
  if (v19)
  {

    id v18 = v33;
  }
  void v18[5] = 0;
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022F6040);
  }
  __int16 v20 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
  {
    id v21 = [(NSMutableArray *)v28 count];
    id v22 = [(NSMutableArray *)v27 count];
    *(_DWORD *)v45 = 68289794;
    int v46 = 0;
    __int16 v47 = 2082;
    v48 = "";
    __int16 v49 = 2050;
    id v50 = v21;
    __int16 v51 = 2050;
    id v52 = v22;
    __int16 v53 = 2050;
    uint64_t v54 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#storedLocations: zipper finished\", \"LocationCount\":%{public}ld, \"ClusteredCount\":%{public}ld, \"UnattributedIntervals\":%{public}ld}", v45, 0x30u);
  }
  id v23 = sub_100D78E90(v28, 0x64u);
  id v24 = sub_100D78E90(v27, 0x64u);
  (*(void (**)(uint64_t, id, id))(v25 + 16))(v25, v23, v24);
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);
}

- (void)fetchEstimatedLocationAtDate:(id)a3 withReply:(id)a4
{
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022F6020);
  }
  __int16 v7 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    LOWORD(v18[0]) = 2082;
    *(std::__shared_weak_count **)((char *)v18 + 2) = (std::__shared_weak_count *)"";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#location #routine fetchEstimatedLocationAtDate\"}", buf, 0x12u);
  }
  sub_1000C7F88(buf);
  BOOL v14 = 0;
  int v8 = sub_1000D2988(*(uint64_t *)buf, "EstimatedLocationAtDateEnabled", &v14);
  if (v14) {
    int v9 = 0;
  }
  else {
    int v9 = v8;
  }
  if (v18[0]) {
    sub_1000DB0A0(v18[0]);
  }
  if (v9)
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    __int16 v10 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      LOWORD(v18[0]) = 2082;
      *(std::__shared_weak_count **)((char *)v18 + 2) = (std::__shared_weak_count *)"";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#location #routine fetchEstimatedLocationAtDate is disabled\"}", buf, 0x12u);
    }
    id v11 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    CFStringRef v16 = @"fetchEstimatedLocationAtDate is disabled";
    int v12 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    (*((void (**)(id, void, id))a4 + 2))(a4, 0, [v11 initWithDomain:kCLErrorDomainPrivate code:5 userInfo:v12]);
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100D79514;
    v13[3] = &unk_1022F5FB0;
    v13[4] = self;
    v13[5] = a3;
    v13[6] = a4;
    [(CLRoutineMonitor *)self sendLocationsWithReply:v13];
  }
}

- (void)fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 withReply:(id)a5
{
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022F6020);
  }
  int v9 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    LOWORD(v20[0]) = 2082;
    *(std::__shared_weak_count **)((char *)v20 + 2) = (std::__shared_weak_count *)"";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#location #routine fetchEstimatedLocationAtDateOptions\"}", buf, 0x12u);
  }
  sub_1000C7F88(buf);
  BOOL v16 = 0;
  int v10 = sub_1000D2988(*(uint64_t *)buf, "EstimatedLocationAtDateEnabled", &v16);
  if (v16) {
    int v11 = 0;
  }
  else {
    int v11 = v10;
  }
  if (v20[0]) {
    sub_1000DB0A0(v20[0]);
  }
  if (v11)
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F6020);
    }
    int v12 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      LOWORD(v20[0]) = 2082;
      *(std::__shared_weak_count **)((char *)v20 + 2) = (std::__shared_weak_count *)"";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#location #routine fetchEstimatedLocationAtDate is disabled\"}", buf, 0x12u);
    }
    id v13 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    CFStringRef v18 = @"fetchEstimatedLocationAtDate is disabled";
    BOOL v14 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    (*((void (**)(id, void, id))a5 + 2))(a5, 0, [v13 initWithDomain:kCLErrorDomainPrivate code:5 userInfo:v14]);
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100D798B4;
    v15[3] = &unk_1022F5FD8;
    v15[4] = self;
    v15[5] = a3;
    v15[6] = a4;
    v15[7] = a5;
    [(CLRoutineMonitor *)self sendLocationsWithReply:v15];
  }
}

- (void)fetchLookbackWindowStartDateWithReply:(id)a3
{
  objc_super v4 = [(CLRoutineMonitor *)self routineManager];

  [(RTRoutineManager *)v4 fetchLookbackWindowStartDateWithHandler:a3];
}

- (void)fetchRemoteStatusWithReply:(id)a3
{
  objc_super v4 = [(CLRoutineMonitor *)self routineManager];

  [(RTRoutineManager *)v4 fetchRemoteStatusWithHandler:a3];
}

- (void)enumerateStoredLocationsWithOptions:(id)a3 withReply:(id)a4
{
  __int16 v7 = [[CLOSTransaction alloc] initWithDescription:"CLRoutineMonitor.enumerateStoredLocations"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100D79AE4;
  v8[3] = &unk_1022F6000;
  v8[4] = a4;
  [(RTRoutineManager *)[(CLRoutineMonitor *)self routineManager] enumerateStoredLocationsWithOptions:a3 usingBlock:v8];

  (*((void (**)(id, void, void, uint64_t))a4 + 2))(a4, 0, 0, 1);
}

- (void)fetchBackgroundInertialOdometrySamplesWithOptions:(id)a3 handler:(id)a4
{
  __int16 v7 = [[CLOSTransaction alloc] initWithDescription:"CLRoutineMonitor.fetchBackgroundInertialOdometrySamplesWithOptions"];
  [(RTRoutineManager *)[(CLRoutineMonitor *)self routineManager] fetchBackgroundInertialOdometrySamplesWithOptions:a3 handler:a4];
}

- (void)getFamiliarityIndexForVisit:(id)a3 withReply:(id)a4
{
  id v7 = objc_alloc((Class)RTLocation);
  [a3 coordinate];
  double v9 = v8;
  [a3 coordinate];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100D79C9C;
  v11[3] = &unk_1022EF588;
  v11[4] = a4;
  -[RTRoutineManager fetchFamiliarityIndexResultsWithOptions:handler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "fetchFamiliarityIndexResultsWithOptions:handler:", objc_msgSend(objc_alloc((Class)RTFamiliarityIndexOptions), "initWithDateInterval:lookbackInterval:spatialGranularity:referenceLocation:referenceLocationSummary:distance:", 0, 1, objc_msgSend(v7, "initWithLatitude:longitude:horizontalUncertainty:date:", +[NSDate date](NSDate, "date"), v9, v10, 0.0), 1, 4838400.0, 100.0),
    v11);
}

- (void)setConnection:(id)a3
{
}

- (void)setLocations:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void)setUpdating:(BOOL)a3
{
  self->_updating = a3;
}

- (BOOL)updatingPredictedApplications
{
  return self->_updatingPredictedApplications;
}

- (void)setUpdatingPredictedApplications:(BOOL)a3
{
  self->_updatingPredictedApplications = a3;
}

- (NSMutableArray)inertialSamples
{
  return self->_inertialSamples;
}

- (void)setInertialSamples:(id)a3
{
}

- (BOOL)authorized
{
  return self->_authorized;
}

- (BOOL)armed
{
  return self->_armed;
}

- (BOOL)diminishedMode
{
  return self->_diminishedMode;
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)setRoutineManager:(id)a3
{
}

- (NSMutableSet)visitClients
{
  return self->_visitClients;
}

- (void)setVisitClients:(id)a3
{
}

- (NSMutableSet)leechClients
{
  return self->_leechClients;
}

- (void)setLeechClients:(id)a3
{
}

- (NSMutableSet)lowConfidenceVisitLeechClients
{
  return self->_lowConfidenceVisitLeechClients;
}

- (void)setLowConfidenceVisitLeechClients:(id)a3
{
}

- (NSMutableDictionary)scenarioTriggerClients
{
  return self->_scenarioTriggerClients;
}

- (void)setScenarioTriggerClients:(id)a3
{
}

- (NSMutableArray)cachedPlaceInferences
{
  return self->_cachedPlaceInferences;
}

- (void)setCachedPlaceInferences:(id)a3
{
}

- (void).cxx_destruct
{
  value = self->_awarenessClient.__ptr_.__value_;
  self->_awarenessClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  objc_super v4 = self->_vdrNotifierClient.__ptr_.__value_;
  self->_vdrNotifierClient.__ptr_.__value_ = 0;
  if (v4) {
    (*(void (**)(Client *, SEL))(*(void *)v4 + 8))(v4, a2);
  }
  dispatch_time_t v5 = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0;
  if (v5) {
    (*(void (**)(Client *, SEL))(*(void *)v5 + 8))(v5, a2);
  }
  v6 = self->_filteredLocationClient.__ptr_.__value_;
  self->_filteredLocationClient.__ptr_.__value_ = 0;
  if (v6) {
    (*(void (**)(Client *, SEL))(*(void *)v6 + 8))(v6, a2);
  }
  id v7 = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = 0;
  if (v7) {
    (*(void (**)(Client *, SEL))(*(void *)v7 + 8))(v7, a2);
  }
  double v8 = self->_serviceLocationClient.__ptr_.__value_;
  self->_serviceLocationClient.__ptr_.__value_ = 0;
  if (v8)
  {
    double v9 = *(void (**)(void))(*(void *)v8 + 8);
    v9();
  }
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  int64x2_t v2 = vdupq_n_s64(0x7FF0000000000000uLL);
  *(int64x2_t *)((char *)self + 72) = v2;
  *((unsigned char *)self + 88) = 0;
  *((int64x2_t *)self + 6) = v2;
  *((unsigned char *)self + 112) = 0;
  return self;
}

@end