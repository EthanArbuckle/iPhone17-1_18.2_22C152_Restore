@interface CLSeparationAlertsService
+ (BOOL)isSupported;
+ (id)convertRTLocationOfInterest:(id)a3;
+ (id)getSilo;
+ (int64_t)convertCLConnectionStateChangeFromState:(unint64_t)a3 toState:(unint64_t)a4;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)isAirPodsProBuds:(id)a3;
- (BOOL)isAirPodsProCase:(id)a3;
- (CLSeparationAlertsService)init;
- (id).cxx_construct;
- (id)clientIdentifier;
- (void)beginService;
- (void)clearAndRemoveAlarm:(id)a3;
- (void)didChangeConnectionStateForDevice:(id)a3 fromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)endService;
- (void)handleCompanionConnectionUpdateWithState:(int64_t)a3;
- (void)ingestTAEventIfSAServiceRunning:(id)a3;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5;
- (void)locationManager:(id)a3 didEnterRegion:(id)a4;
- (void)locationManager:(id)a3 didExitRegion:(id)a4;
- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4;
- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
- (void)onAdvertisementBufferEmptied;
- (void)onAggressiveScanEnded;
- (void)onAggressiveScanStarted;
- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4;
- (void)onBluetoothServiceNotification:(int)a3 data:(NotificationData *)a4;
- (void)onClientManagerNotification:(int)a3 data:(NotificationData *)a4;
- (void)onCompanionNotification:(int)a3 data:(NotificationData *)a4;
- (void)onDaemonStatusNotification:(int)a3 data:(NotificationData *)a4;
- (void)onDataProtectionManagerNotification:(int)a3 data:(unint64_t)a4;
- (void)onGnssNotification:(int)a3 data:(NotificationData *)a4;
- (void)onLocationNotification:(int)a3 data:(NotificationData *)a4;
- (void)onMotionStateNotification:(int)a3 data:(NotificationData *)a4;
- (void)onPCPersistentTimerFired:(id)a3;
- (void)onUpdatedPowerState;
- (void)onVehicleStateNotification;
- (void)onVisit:(id)a3;
- (void)registerForAvengerScanner;
- (void)registerForBluetoothServiceNotification;
- (void)registerForClientManagerNotification;
- (void)registerForCompanionConnectionUpdate;
- (void)registerForDaemonStatusNotification;
- (void)registerForDataProtectionManagerNotification;
- (void)registerForDurianConnectionStateChange;
- (void)registerForGnssNotification;
- (void)registerForLocationNotification;
- (void)registerForMotionNotification;
- (void)registerForRoutineMonitor;
- (void)registerForVehicleStateNotification;
- (void)requestLoiRelatedTo:(id)a3;
- (void)sendVisit:(id)a3;
- (void)separationAlertsServiceManager:(id)a3 addGeofence:(id)a4;
- (void)separationAlertsServiceManager:(id)a3 cancelSATimeEventForAlarm:(id)a4;
- (void)separationAlertsServiceManager:(id)a3 notifySeparationsForDevices:(id)a4 withLocation:(id)a5 withContext:(id)a6;
- (void)separationAlertsServiceManager:(id)a3 removeGeofence:(id)a4;
- (void)separationAlertsServiceManager:(id)a3 requestBluetoothScanForTypes:(unint64_t)a4;
- (void)separationAlertsServiceManager:(id)a3 requestLocationForType:(unint64_t)a4;
- (void)separationAlertsServiceManager:(id)a3 requestStateForRegion:(id)a4;
- (void)separationAlertsServiceManager:(id)a3 scheduleSATimeEvent:(double)a4 forAlarm:(id)a5;
- (void)separationAlertsServiceManagerStopLongAggressiveScan:(id)a3;
- (void)showSAUserFeedbackDialogue:(id)a3;
- (void)startLocationSessionHighAccuracy;
- (void)startWatchAdvertisementBufferScanning;
- (void)stopLocationSession;
- (void)stopWatchAdvertisementBufferScanning;
- (void)unregisterForAvengerScanner;
- (void)unregisterForBluetoothServiceNotification;
- (void)unregisterForClientManagerNotification;
- (void)unregisterForCompanionConnectionUpdate;
- (void)unregisterForDaemonStatusNotification;
- (void)unregisterForDataProtectionManagerNotification;
- (void)unregisterForDurianConnectionStateChange;
- (void)unregisterForGnssNotification;
- (void)unregisterForLocationNotification;
- (void)unregisterForMotionNotification;
- (void)unregisterForRoutineMonitor;
- (void)unregisterForVehicleStateNotification;
@end

@implementation CLSeparationAlertsService

- (void)onLocationNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 < 2)
  {
LABEL_4:
    if (*((_DWORD *)a4 + 33) == 2)
    {
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      v6 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        int v19 = 0;
        __int16 v20 = 2082;
        v21 = "";
        v7 = "{\"msg%{public}.0s\":\"#sa received china shifted location\"}";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, v7, buf, 0x12u);
        return;
      }
    }
    else
    {
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      v8 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        int v19 = 0;
        __int16 v20 = 2082;
        v21 = "";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received location\"}", buf, 0x12u);
      }
      id v9 = objc_msgSend(objc_alloc((Class)TALocationLite), "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)((char *)a4 + 76)), *((unsigned __int8 *)a4 + 672), *(double *)((char *)a4 + 4), *(double *)((char *)a4 + 12), *(double *)((char *)a4 + 20), *(double *)((char *)a4 + 28), *(double *)((char *)a4 + 36), *(double *)((char *)a4 + 44), *(double *)((char *)a4 + 52), *(double *)((char *)a4 + 60), *(void *)((char *)a4 + 68), *((void *)a4 + 21),
             *((void *)a4 + 22),
             *((void *)a4 + 67),
             *((void *)a4 + 68),
             *((void *)a4 + 57),
             *((void *)a4 + 58));
      [(CLSeparationAlertsService *)self ingestTAEventIfSAServiceRunning:v9];
    }
    return;
  }
  if (a3 != 22)
  {
    if (a3 != 5)
    {
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      v16 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "#sa, received unhandled location notification", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024194A0 != -1) {
          dispatch_once(&qword_1024194A0, &stru_1022D64D8);
        }
        v17 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLSeparationAlertsService onLocationNotification:data:]", "%s\n", v17);
        if (v17 != (char *)buf) {
          free(v17);
        }
      }
      return;
    }
    goto LABEL_4;
  }
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  v10 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = sub_1010FB9FC(*((int **)a4 + 100));
    *(_DWORD *)buf = 68289283;
    int v19 = 0;
    __int16 v20 = 2082;
    v21 = "";
    __int16 v22 = 2049;
    uint64_t v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received WSB locations\", \"Count\":%{private}lu}", buf, 0x1Cu);
  }
  if (sub_1010FB9FC(*((int **)a4 + 100)))
  {
    uint64_t v12 = 0;
    for (uint64_t i = 132; ; i += 156)
    {
      uint64_t v14 = sub_1002D4CD0(*((void *)a4 + 100));
      if (*(_DWORD *)(v14 + i) == 2) {
        break;
      }
      id v15 = objc_msgSend(objc_alloc((Class)TALocationLite), "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)(v14 + i - 56)), 0, *(double *)(v14 + i - 128), *(double *)(v14 + i - 120), *(double *)(v14 + i - 112), *(double *)(v14 + i - 104), *(double *)(v14 + i - 96), *(double *)(v14 + i - 88), *(double *)(v14 + i - 80), *(double *)(v14 + i - 72), *(void *)(v14 + i - 64), 0xBFF0000000000000,
              0xBFF0000000000000,
              0,
              0xBFF0000000000000,
              0,
              0xBFF0000000000000);
      [(CLSeparationAlertsService *)self ingestTAEventIfSAServiceRunning:v15];

      if (++v12 >= (unint64_t)sub_1010FB9FC(*((int **)a4 + 100))) {
        return;
      }
    }
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    v6 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      int v19 = 0;
      __int16 v20 = 2082;
      v21 = "";
      v7 = "{\"msg%{public}.0s\":\"#sa received china shifted wifi location\"}";
      goto LABEL_9;
    }
  }
}

- (void)ingestTAEventIfSAServiceRunning:(id)a3
{
  if (a3)
  {
    if (self->_saServiceManager)
    {
      v3[0] = _NSConcreteStackBlock;
      v3[1] = 3221225472;
      v3[2] = sub_10017B3E0;
      v3[3] = &unk_10229FEB0;
      v3[4] = self;
      v3[5] = a3;
      dispatch_async([objc_msgSend(-[CLSeparationAlertsService universe](self, "universe"), "silo") queue], v3);
    }
  }
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
  if (qword_10247F1A8 != -1) {
    dispatch_once(&qword_10247F1A8, &stru_1022D6368);
  }
  return (id)qword_10247F1A0;
}

+ (BOOL)isSupported
{
  if (qword_10247F1B8 != -1) {
    dispatch_once(&qword_10247F1B8, &stru_1022D6388);
  }
  return byte_10247F1B0;
}

- (CLSeparationAlertsService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSeparationAlertsService;
  return [(CLSeparationAlertsService *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLSeparationAlertsServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLSeparationAlertsClientProtocol];
}

- (void)beginService
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  objc_super v3 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#sa initiating service", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    *(_WORD *)uint64_t v14 = 0;
    uint64_t v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSeparationAlertsService beginService]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  self->_queue = (OS_dispatch_queue *)[objc_msgSend(-[CLSeparationAlertsService universe](self, "universe"), "silo") queue];
  v4 = (SAServiceManager *)[objc_alloc((Class)SAServiceManager) initWithQueue:self->_queue];
  self->_saServiceManager = v4;
  [(SAServiceManager *)v4 addClient:self];
  self->_scheduledAlarms = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->_dialogueRemainingAlerts = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  self->_scannerClientPoweredOn = 0;
  self->_locationManager = (CLLocationManager *)[objc_alloc((Class)CLLocationManager) initWithEffectiveBundlePath:@"/System/Library/LocationBundles/FindMyDevice.framework/" delegate:self onQueue:self->_queue];
  self->_ownerSession = (SPOwnerSession *)objc_opt_new();
  sub_1000C7F88(buf);
  v14[0] = 0;
  char v5 = sub_1000D2988(*(uint64_t *)buf, "SeparationAlertsEnableWatchADVBufferScan", v14);
  if (v14[0]) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }
  self->_enableWatchADVBufferScan = v6;
  if (v16) {
    sub_1000DB0A0(v16);
  }
  [(CLSeparationAlertsService *)self registerForClientManagerNotification];
  [(CLSeparationAlertsService *)self registerForGnssNotification];
  [(CLSeparationAlertsService *)self registerForLocationNotification];
  [(CLSeparationAlertsService *)self registerForRoutineMonitor];
  [(CLSeparationAlertsService *)self registerForDaemonStatusNotification];
  [(CLSeparationAlertsService *)self registerForBluetoothServiceNotification];
  [(CLSeparationAlertsService *)self registerForDurianConnectionStateChange];
  [(CLSeparationAlertsService *)self registerForDataProtectionManagerNotification];
  [(CLSeparationAlertsService *)self registerForMotionNotification];
  [(CLSeparationAlertsService *)self registerForVehicleStateNotification];
  [(CLSeparationAlertsService *)self registerForCompanionConnectionUpdate];
  id v7 = objc_alloc_init((Class)SPOwnerInterface);
  SEL v8 = NSSelectorFromString(@"separationMonitoringSession");
  if (objc_opt_respondsToSelector()) {
    self->_separationMonitoringSession = (SPSeparationMonitoringProtocol *)[v7 performSelector:v8];
  }
  id v9 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  self->_stopLocationRequestTimer = v9;
  dispatch_source_set_timer((dispatch_source_t)v9, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
  stopLocationRequestTimer = self->_stopLocationRequestTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10098DEB4;
  handler[3] = &unk_10229FED8;
  handler[4] = self;
  dispatch_source_set_event_handler(stopLocationRequestTimer, handler);
  dispatch_resume((dispatch_object_t)self->_stopLocationRequestTimer);
  sub_100103240();
  if (sub_10073E30C())
  {
    sub_1000C7F88(buf);
    v14[0] = 0;
    int v11 = sub_1000D2988(*(uint64_t *)buf, "SeparationAlertsAllowUserFeedback", v14) ^ 1;
    if (v14[0]) {
      LOBYTE(v11) = 1;
    }
    self->_allowSAUserFeedback = v11;
    if (v16) {
      sub_1000DB0A0(v16);
    }
  }
  else
  {
    self->_allowSAUserFeedback = 0;
  }
}

- (void)endService
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  objc_super v3 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#sa terminating service", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    char v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSeparationAlertsService endService]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  [(CLSeparationAlertsService *)self unregisterForCompanionConnectionUpdate];
  [(CLSeparationAlertsService *)self unregisterForVehicleStateNotification];
  [(CLSeparationAlertsService *)self unregisterForMotionNotification];
  [(CLSeparationAlertsService *)self unregisterForDataProtectionManagerNotification];
  [(CLSeparationAlertsService *)self unregisterForDurianConnectionStateChange];
  [(CLSeparationAlertsService *)self unregisterForBluetoothServiceNotification];
  [(CLSeparationAlertsService *)self unregisterForAvengerScanner];
  [(CLSeparationAlertsService *)self unregisterForDaemonStatusNotification];
  [(CLSeparationAlertsService *)self unregisterForRoutineMonitor];
  [(CLSeparationAlertsService *)self unregisterForLocationNotification];
  [(CLSeparationAlertsService *)self unregisterForGnssNotification];
  [(CLSeparationAlertsService *)self unregisterForClientManagerNotification];
  [(CLSeparationAlertsService *)self stopLocationSession];
  stopLocationRequestTimer = self->_stopLocationRequestTimer;
  if (stopLocationRequestTimer)
  {
    dispatch_source_cancel(stopLocationRequestTimer);
    dispatch_release((dispatch_object_t)self->_stopLocationRequestTimer);
    self->_stopLocationRequestTimer = 0;
  }

  self->_locationManager = 0;
  self->_scheduledAlarms = 0;
  [(SAServiceManager *)self->_saServiceManager removeClient:self];

  self->_saServiceManager = 0;
  self->_separationMonitoringSession = 0;

  self->_dialogueRemainingAlerts = 0;
  self->_ownerSession = 0;
}

- (void)registerForClientManagerNotification
{
  value = self->_clientManagerClient.__ptr_.__value_;
  if (!value)
  {
    [(CLSeparationAlertsService *)self universe];
    sub_1007E0344();
  }
  [*((id *)value + 2) register:*((void *)value + 1) forNotification:4 registrationInfo:0];
}

- (void)unregisterForClientManagerNotification
{
  value = self->_clientManagerClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:4];
    v4 = self->_clientManagerClient.__ptr_.__value_;
    self->_clientManagerClient.__ptr_.__value_ = 0;
    if (v4)
    {
      char v5 = *(void (**)(void))(*(void *)v4 + 8);
      v5();
    }
  }
}

- (void)registerForGnssNotification
{
  if (!self->_gnssClient.__ptr_.__value_)
  {
    if (+[CLGnssProviderAdapter isSupported])
    {
      [(CLSeparationAlertsService *)self universe];
      sub_100E92BC0();
    }
  }
}

- (void)unregisterForGnssNotification
{
  value = self->_gnssClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:13];
    v4 = self->_gnssClient.__ptr_.__value_;
    self->_gnssClient.__ptr_.__value_ = 0;
    if (v4)
    {
      char v5 = *(void (**)(void))(*(void *)v4 + 8);
      v5();
    }
  }
}

- (void)registerForLocationNotification
{
  value = self->_locationClient.__ptr_.__value_;
  if (!value)
  {
    [(CLSeparationAlertsService *)self universe];
    sub_100681630();
  }
  [*((id *)value + 2) register:*((void *)value + 1) forNotification:5 registrationInfo:0];
  [*((id *)self->_locationClient.__ptr_.__value_ + 2) register:*((void *)self->_locationClient.__ptr_.__value_ + 1) forNotification:22 registrationInfo:0];
}

- (void)unregisterForLocationNotification
{
  value = self->_locationClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:5];
    [*((id *)self->_locationClient.__ptr_.__value_ + 2) unregister:*((void *)self->_locationClient.__ptr_.__value_ + 1) forNotification:22];
    v4 = self->_locationClient.__ptr_.__value_;
    self->_locationClient.__ptr_.__value_ = 0;
    if (v4)
    {
      char v5 = *(void (**)(void))(*(void *)v4 + 8);
      v5();
    }
  }
}

- (void)registerForRoutineMonitor
{
  routineProxy = self->_routineProxy;
  if (!routineProxy)
  {
    routineProxy = (CLRoutineMonitorServiceProtocol *)[[-[CLSeparationAlertsService universe](self, "universe") vendor] proxyForService:@"CLRoutineMonitor"];
    self->_routineProxy = routineProxy;
  }
  [(CLRoutineMonitorServiceProtocol *)routineProxy registerDelegate:self inSilo:[(CLSeparationAlertsService *)self silo]];
  v4 = self->_routineProxy;
  uint64_t v5 = CLISP_ME_TOKEN;

  [(CLRoutineMonitorServiceProtocol *)v4 startLeechingVisitsForClient:v5];
}

- (void)unregisterForRoutineMonitor
{
  routineProxy = self->_routineProxy;
  if (routineProxy)
  {
    [(CLRoutineMonitorServiceProtocol *)routineProxy stopLeechingLowConfidenceVisitsForClient:CLISP_ME_TOKEN];
    [(CLRoutineMonitorServiceProtocol *)self->_routineProxy stopLeechingVisitsForClient:CLISP_ME_TOKEN];
  }
  self->_routineProxy = 0;
}

- (void)registerForDaemonStatusNotification
{
  value = self->_daemonStatusClient.__ptr_.__value_;
  if (!value)
  {
    [(CLSeparationAlertsService *)self universe];
    sub_10060F068();
  }
  [*((id *)value + 2) register:*((void *)value + 1) forNotification:0 registrationInfo:0];
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:1 registrationInfo:0];
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:2 registrationInfo:0];
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:3 registrationInfo:0];
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:6 registrationInfo:0];
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:8 registrationInfo:0];
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:10 registrationInfo:0];
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:15 registrationInfo:0];
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:13 registrationInfo:0];
}

- (void)unregisterForDaemonStatusNotification
{
  value = self->_daemonStatusClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:0];
    [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:1];
    [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:2];
    [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:3];
    [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:6];
    [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:8];
    [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:10];
    [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:15];
    [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:13];
    v4 = self->_daemonStatusClient.__ptr_.__value_;
    self->_daemonStatusClient.__ptr_.__value_ = 0;
    if (v4)
    {
      uint64_t v5 = *(void (**)(void))(*(void *)v4 + 8);
      v5();
    }
  }
}

- (void)registerForDataProtectionManagerNotification
{
  value = self->_dataProtectionManagerClient.__ptr_.__value_;
  if (!value)
  {
    [(CLSeparationAlertsService *)self universe];
    sub_100EB2E6C();
  }
  [*((id *)value + 2) register:*((void *)value + 1) forNotification:1 registrationInfo:0];
}

- (void)unregisterForDataProtectionManagerNotification
{
  value = self->_dataProtectionManagerClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:1];
    v4 = self->_dataProtectionManagerClient.__ptr_.__value_;
    self->_dataProtectionManagerClient.__ptr_.__value_ = 0;
    if (v4)
    {
      uint64_t v5 = *(void (**)(void))(*(void *)v4 + 8);
      v5();
    }
  }
}

- (void)registerForBluetoothServiceNotification
{
  value = self->_bluetoothServiceClient.__ptr_.__value_;
  if (!value)
  {
    [(CLSeparationAlertsService *)self universe];
    sub_100C53368();
  }
  [*((id *)value + 2) register:*((void *)value + 1) forNotification:9 registrationInfo:0];
  [*((id *)self->_bluetoothServiceClient.__ptr_.__value_ + 2) register:*((void *)self->_bluetoothServiceClient.__ptr_.__value_ + 1) forNotification:4 registrationInfo:0];
  [*((id *)self->_bluetoothServiceClient.__ptr_.__value_ + 2) register:*((void *)self->_bluetoothServiceClient.__ptr_.__value_ + 1) forNotification:5 registrationInfo:0];
}

- (void)unregisterForBluetoothServiceNotification
{
  value = self->_bluetoothServiceClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:9];
    [*((id *)self->_bluetoothServiceClient.__ptr_.__value_ + 2) unregister:*((void *)self->_bluetoothServiceClient.__ptr_.__value_ + 1) forNotification:4];
    [*((id *)self->_bluetoothServiceClient.__ptr_.__value_ + 2) unregister:*((void *)self->_bluetoothServiceClient.__ptr_.__value_ + 1) forNotification:5];
    v4 = self->_bluetoothServiceClient.__ptr_.__value_;
    self->_bluetoothServiceClient.__ptr_.__value_ = 0;
    if (v4)
    {
      uint64_t v5 = *(void (**)(void))(*(void *)v4 + 8);
      v5();
    }
  }
}

- (void)registerForMotionNotification
{
  value = self->_motionStateClient.__ptr_.__value_;
  if (!value)
  {
    [(CLSeparationAlertsService *)self universe];
    sub_1005AEEAC();
  }
  [*((id *)value + 2) register:*((void *)value + 1) forNotification:3 registrationInfo:0];
}

- (void)unregisterForMotionNotification
{
  value = self->_motionStateClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:3];
    v4 = self->_motionStateClient.__ptr_.__value_;
    self->_motionStateClient.__ptr_.__value_ = 0;
    if (v4)
    {
      uint64_t v5 = *(void (**)(void))(*(void *)v4 + 8);
      v5();
    }
  }
}

- (void)registerForVehicleStateNotification
{
  if (objc_msgSend(objc_msgSend(-[CLSeparationAlertsService universe](self, "universe"), "vendor"), "isServiceEnabled:", @"CLVehicleStateNotifier")&& !self->_vehicleStateProxy)
  {
    objc_super v3 = (CLVehicleStateNotifierProtocol *)[objc_msgSend(-[CLSeparationAlertsService universe](self, "universe"), "vendor") proxyForService:@"CLVehicleStateNotifier"];
    self->_vehicleStateProxy = v3;
    [(CLVehicleStateNotifierProtocol *)v3 registerDelegate:self inSilo:[(CLSeparationAlertsService *)self silo]];
    [(CLVehicleStateNotifierProtocol *)self->_vehicleStateProxy setDelegateEntityName:"CLSeparationAlertsService"];
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10098F1BC;
  handler[3] = &unk_1022B4250;
  handler[4] = self;
  notify_register_dispatch((const char *)[kCMVehicularStateChangedNotification UTF8String], &self->_vehicularToken, (dispatch_queue_t)[-[CLSeparationAlertsService silo](self, "silo") queue], handler);
}

- (void)unregisterForVehicleStateNotification
{
  if (notify_is_valid_token(self->_vehicularToken))
  {
    notify_cancel(self->_vehicularToken);
    self->_vehicularToken = -1;
  }
  vehicleStateProxy = self->_vehicleStateProxy;
  if (vehicleStateProxy)
  {

    self->_vehicleStateProxy = 0;
  }
}

- (void)registerForAvengerScanner
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  objc_super v3 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    id v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa received avenger scanner registration\"}", (uint8_t *)v5, 0x12u);
  }
  if (_os_feature_enabled_impl())
  {
    if (!self->_scannerClient) {
      self->_scannerClient = [[CLAvengerScannerClient alloc] initWithDelegate:self queue:[CLSeparationAlertsService universe]silo optedIn:1];
    }
  }
  else if (!self->_avengerScannerProxy)
  {
    v4 = (CLAvengerScannerScannerServiceProtocol *)[objc_msgSend(-[CLSeparationAlertsService universe](self, "universe"), "vendor") proxyForService:@"CLAvengerScanner"];
    self->_avengerScannerProxy = v4;
    [(CLAvengerScannerServiceProtocol *)v4 registerDelegate:self inSilo:[(CLSeparationAlertsService *)self silo]];
    [(CLAvengerScannerServiceProtocol *)self->_avengerScannerProxy setDelegateEntityName:"CLSeparationAlertsService"];
    [(CLAvengerScannerServiceProtocol *)self->_avengerScannerProxy startMonitoringAvengerAdvertisementsForClient:CLISP_ME_TOKEN clientName:@"CLSeparationAlertsService"];
  }
}

- (void)unregisterForAvengerScanner
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  objc_super v3 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    id v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa received avenger scanner unregistration\"}", (uint8_t *)v5, 0x12u);
  }
  if (_os_feature_enabled_impl())
  {

    self->_scannerClient = 0;
    self->_scannerClientPoweredOn = 0;
  }
  else
  {
    avengerScannerProxy = self->_avengerScannerProxy;
    if (avengerScannerProxy)
    {
      [(CLAvengerScannerServiceProtocol *)avengerScannerProxy stopMonitoringAvengerAdvertisementsForClient:CLISP_ME_TOKEN];

      self->_avengerScannerProxy = 0;
    }
  }
}

- (void)registerForDurianConnectionStateChange
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  objc_super v3 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    id v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa received durian connection state change registration\"}", (uint8_t *)v5, 0x12u);
  }
  if (!self->_durianServiceProxy)
  {
    v4 = (CLDurianServiceProtocol *)[[-[CLSeparationAlertsService universe](self, "universe") vendor] proxyForService:@"CLDurianService"];
    self->_durianServiceProxy = v4;
    [(CLDurianServiceProtocol *)v4 registerDelegate:self inSilo:[(CLSeparationAlertsService *)self silo]];
    [(CLDurianServiceProtocol *)self->_durianServiceProxy setDelegateEntityName:"CLSeparationAlertsService"];
    [(CLDurianServiceProtocol *)self->_durianServiceProxy startMonitoringConnectionStateChangeForClient:CLISP_ME_TOKEN];
  }
}

- (void)unregisterForDurianConnectionStateChange
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  objc_super v3 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    id v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa received durian connection state change unregistration\"}", (uint8_t *)v5, 0x12u);
  }
  durianServiceProxy = self->_durianServiceProxy;
  if (durianServiceProxy)
  {
    [(CLDurianServiceProtocol *)durianServiceProxy stopMonitoringConnectionStateChangeForClient:CLISP_ME_TOKEN];

    self->_durianServiceProxy = 0;
  }
}

- (void)registerForCompanionConnectionUpdate
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  objc_super v3 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = 68289026;
    __int16 v6 = 2082;
    id v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa received companion connection update registration\"}", (uint8_t *)&v5, 0x12u);
  }
  value = self->_companionClient.__ptr_.__value_;
  if (!value)
  {
    [(CLSeparationAlertsService *)self universe];
    sub_1000B2C0C();
  }
  [*((id *)value + 2) register:*((void *)value + 1) forNotification:5 registrationInfo:0];
}

- (void)unregisterForCompanionConnectionUpdate
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  objc_super v3 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    SEL v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa received companion connection update unregistration\"}", (uint8_t *)v6, 0x12u);
  }
  value = self->_companionClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:5];
    uint64_t v5 = self->_companionClient.__ptr_.__value_;
    self->_companionClient.__ptr_.__value_ = 0;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8))(v5);
    }
  }
}

+ (int64_t)convertCLConnectionStateChangeFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  if (a3)
  {
    if (a4) {
      goto LABEL_9;
    }
    if (a3 != 4)
    {
      if (a3 == 2) {
        return 0;
      }
LABEL_9:
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      uint64_t v5 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_ERROR))
      {
        int v7 = 68289026;
        int v8 = 0;
        __int16 v9 = 2082;
        v10 = "";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa connection state change is not convertible, returning default Disconnected\"}", (uint8_t *)&v7, 0x12u);
        if (qword_1024194A0 != -1) {
          dispatch_once(&qword_1024194A0, &stru_1022D64D8);
        }
      }
      __int16 v6 = qword_1024194A8;
      if (os_signpost_enabled((os_log_t)qword_1024194A8))
      {
        int v7 = 68289026;
        int v8 = 0;
        __int16 v9 = 2082;
        v10 = "";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#sa connection state change is not convertible, returning default Disconnected", "{\"msg%{public}.0s\":\"#sa connection state change is not convertible, returning default Disconnected\"}", (uint8_t *)&v7, 0x12u);
      }
      return 0;
    }
    return 1;
  }
  else
  {
    if (a4 != 4)
    {
      if (a4 == 2) {
        return 2;
      }
      goto LABEL_9;
    }
    return 3;
  }
}

- (void)didChangeConnectionStateForDevice:(id)a3 fromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if (a4 != a5)
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    __int16 v9 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
    {
      v11[0] = 68289795;
      v11[1] = 0;
      __int16 v12 = 2082;
      v13 = "";
      __int16 v14 = 2113;
      id v15 = a3;
      __int16 v16 = 1026;
      int v17 = a4;
      __int16 v18 = 1026;
      int v19 = a5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa connection state updated\", \"deviceID\":%{private, location:escape_only}@, \"oldState\":%{public}d, \"newState\":%{public}d}", (uint8_t *)v11, 0x28u);
    }
    id v10 = [objc_alloc((Class)SAConnectionEvent) initWithDeviceUUID:a3 state:+[CLSeparationAlertsService convertCLConnectionStateChangeFromState:toState:](CLSeparationAlertsService, "convertCLConnectionStateChangeFromState:toState:", a4, a5) date:+[NSDate date](NSDate, "date")];
    [(CLSeparationAlertsService *)self ingestTAEventIfSAServiceRunning:v10];
  }
}

- (void)onVisit:(id)a3
{
  if (a3
    && [a3 hasArrivalDate]
    && ([a3 hasDepartureDate] & 1) == 0)
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    uint64_t v5 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
    {
      v6[0] = 68289026;
      v6[1] = 0;
      __int16 v7 = 2082;
      int v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received visit\"}", (uint8_t *)v6, 0x12u);
    }
    [(CLSeparationAlertsService *)self requestLoiRelatedTo:a3];
  }
}

+ (id)convertRTLocationOfInterest:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = [a3 type];
  if (v4) {
    uint64_t v5 = 2 * (v4 == (id)1);
  }
  else {
    uint64_t v5 = 1;
  }
  id v6 = objc_alloc((Class)TALocationOfInterest);
  [objc_msgSend(a3, "location") latitude];
  double v8 = v7;
  [objc_msgSend(a3, "location") longitude];
  double v10 = v9;
  [objc_msgSend(a3, "location") horizontalUncertainty];
  id v12 = [v6 initWithType:v5 latitude:objc_msgSend(objc_msgSend(a3, "location"), "referenceFrame") date:[NSDate date] horizontalAccuracy:v8 referenceFrame:v10];
  id v13 = v12;
  return v12;
}

- (void)sendVisit:(id)a3
{
  id v5 = objc_alloc((Class)TACLVisit);
  [a3 coordinate];
  double v7 = v6;
  double v9 = v8;
  [a3 horizontalAccuracy];
  id v11 = [v5 initWithCoordinate:objc_msgSend(a3, "arrivalDate") horizontalAccuracy:objc_msgSend(a3, "departureDate") arrivalDate:objc_msgSend(a3, "detectionDate") confidence:2];
  [(CLSeparationAlertsService *)self ingestTAEventIfSAServiceRunning:v11];
}

- (void)requestLoiRelatedTo:(id)a3
{
  if (a3)
  {
    if (self->_routineProxy)
    {
      if (objc_msgSend(objc_msgSend(a3, "_placeInference"), "_loiIdentifier"))
      {
        -[CLRoutineMonitorServiceProtocol fetchLocationOfInterestWithIdentifier:withReply:](self->_routineProxy, "fetchLocationOfInterestWithIdentifier:withReply:");
        return;
      }
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      double v9 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289283;
        int v11 = 0;
        __int16 v12 = 2082;
        id v13 = "";
        __int16 v14 = 2113;
        id v15 = a3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #loi no inferred place\", \"visit\":%{private, location:escape_only}@}", buf, 0x1Cu);
      }
    }
    else
    {
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      double v7 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#sa #loi skip requesting LOI information as routine monitor is no up", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024194A0 != -1) {
          dispatch_once(&qword_1024194A0, &stru_1022D64D8);
        }
        double v8 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSeparationAlertsService requestLoiRelatedTo:]", "%s\n", v8);
        if (v8 != (char *)buf) {
          free(v8);
        }
      }
    }
    [(CLSeparationAlertsService *)self sendVisit:a3];
  }
  else
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    id v5 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#sa #loi cannot request LOI information for a nil visit", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      double v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLSeparationAlertsService requestLoiRelatedTo:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
}

- (void)onVehicleStateNotification
{
  [self universe].silo
  vehicleStateProxy = self->_vehicleStateProxy;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100990A3C;
  v4[3] = &unk_1022D63D8;
  v4[4] = self;
  [(CLVehicleStateNotifierProtocol *)vehicleStateProxy fetchVehicularDndStateAndHintsAndOperatorStateWithReply:v4];
}

- (void)handleCompanionConnectionUpdateWithState:(int64_t)a3
{
  id v5 = [objc_alloc((Class)TASystemState) initWithSystemStateType:16 isOn:a3 == 3 date:[NSDate date]];
  [(CLSeparationAlertsService *)self ingestTAEventIfSAServiceRunning:v5];

  SEL v6 = NSSelectorFromString(@"activeCompanionWithCompletion:");
  if (objc_opt_respondsToSelector())
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100990FE4;
    v7[3] = &unk_1022D6428;
    v7[4] = self;
    v7[5] = a3;
    [(SPOwnerSession *)self->_ownerSession performSelector:v6 withObject:v7];
  }
}

- (void)onCompanionNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 == 5)
  {
    int v5 = *(unsigned char *)a4;
    if (*(unsigned char *)a4) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 1;
    }
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    double v7 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      int v13 = 0;
      __int16 v14 = 2082;
      id v15 = "";
      __int16 v16 = 1025;
      int v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa received companion connection update\", \"companionIsNearby\":%{private}d}", buf, 0x18u);
    }
    sub_100103240();
    if (sub_10010145C())
    {
      [(CLSeparationAlertsService *)self handleCompanionConnectionUpdateWithState:v6];
      if (self->_enableWatchADVBufferScan)
      {
        if (v5) {
          [(CLSeparationAlertsService *)self stopWatchAdvertisementBufferScanning];
        }
        else {
          [(CLSeparationAlertsService *)self startWatchAdvertisementBufferScanning];
        }
      }
    }
    else
    {
      sub_100103240();
      if (sub_10016CCBC())
      {
        [(CLSeparationAlertsService *)self handleCompanionConnectionUpdateWithState:v6];
      }
      else
      {
        if (qword_1024194A0 != -1) {
          dispatch_once(&qword_1024194A0, &stru_1022D64D8);
        }
        double v10 = qword_1024194A8;
        if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289026;
          int v13 = 0;
          __int16 v14 = 2082;
          id v15 = "";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa received companion connection update on a non-watch/iphone device\"}", buf, 0x12u);
          if (qword_1024194A0 != -1) {
            dispatch_once(&qword_1024194A0, &stru_1022D64D8);
          }
        }
        int v11 = qword_1024194A8;
        if (os_signpost_enabled((os_log_t)qword_1024194A8))
        {
          *(_DWORD *)buf = 68289026;
          int v13 = 0;
          __int16 v14 = 2082;
          id v15 = "";
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#sa received companion connection update on a non-watch/iphone device", "{\"msg%{public}.0s\":\"#sa received companion connection update on a non-watch/iphone device\"}", buf, 0x12u);
        }
      }
    }
  }
  else
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    double v8 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "#sa, received unhandled companion notification", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      double v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLSeparationAlertsService onCompanionNotification:data:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
  }
}

- (void)startWatchAdvertisementBufferScanning
{
  if (_os_feature_enabled_impl())
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    objc_super v3 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      double v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa watch adv buffer scanning not supported\"}", (uint8_t *)&v5, 0x12u);
    }
  }
  else if (!self->_watchScanRequested)
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    id v4 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      double v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa start scanning on watch\"}", (uint8_t *)&v5, 0x12u);
    }
    [(CLAvengerScannerServiceProtocol *)self->_avengerScannerProxy startWatchAdvertisementBufferScan:CLISP_ME_TOKEN];
    self->_watchScanRequested = 1;
  }
}

- (void)stopWatchAdvertisementBufferScanning
{
  if (_os_feature_enabled_impl())
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    objc_super v3 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      double v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa watch adv buffer scanning not supported\"}", (uint8_t *)&v5, 0x12u);
    }
  }
  else if (self->_watchScanRequested)
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    id v4 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      double v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa stop scanning on watch\"}", (uint8_t *)&v5, 0x12u);
    }
    [(CLAvengerScannerServiceProtocol *)self->_avengerScannerProxy stopWatchAdvertisementBufferScan:CLISP_ME_TOKEN];
    self->_watchScanRequested = 0;
  }
}

- (void)onClientManagerNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 == 4)
  {
    id v7 = [objc_alloc((Class)TASystemState) initWithSystemStateType:8 isOn:*((_DWORD *)a4 + 47) == 1 date:[NSDate date]];
    [(CLSeparationAlertsService *)self ingestTAEventIfSAServiceRunning:v7];

    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    double v8 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = *((_DWORD *)a4 + 47);
      *(_DWORD *)buf = 68289283;
      int v13 = 0;
      __int16 v14 = 2082;
      id v15 = "";
      __int16 v16 = 1025;
      int v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received client status locationServiceEnabled\", \"LocationServicesEnabled\":%{private}d}", buf, 0x18u);
    }
  }
  else
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    double v10 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "#sa, received unhandled location client manager notification", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      int v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLSeparationAlertsService onClientManagerNotification:data:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
}

- (void)startLocationSessionHighAccuracy
{
  if (self->_isLocationSessionActive)
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    v2 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      int v21 = 0;
      __int16 v22 = 2082;
      uint64_t v23 = "";
      objc_super v3 = "{\"msg%{public}.0s\":\"#sa location session already active\"}";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, v3, buf, 0x12u);
    }
  }
  else if (self->_authorized)
  {
    if (self->_locationClient.__ptr_.__value_)
    {
      sub_100103240();
      if ((sub_10010145C() & 1) != 0 || (sub_100103240(), (sub_10015F708() & 1) == 0))
      {
        if (qword_1024194A0 != -1) {
          dispatch_once(&qword_1024194A0, &stru_1022D64D8);
        }
        __int16 v12 = qword_1024194A8;
        if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289026;
          int v21 = 0;
          __int16 v22 = 2082;
          uint64_t v23 = "";
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa start wifi request\"}", buf, 0x12u);
        }
        [*((id *)self->_locationClient.__ptr_.__value_ + 2) register:*((void *)self->_locationClient.__ptr_.__value_ + 1) forNotification:1 registrationInfo:0];
        self->_isLocationSessionActive = 1;
        stopLocationRequestTimer = self->_stopLocationRequestTimer;
        dispatch_time_t v14 = dispatch_time(0, 8000000000);
        dispatch_source_set_timer(stopLocationRequestTimer, v14, 0x1DCD65000uLL, 0x1DCD6500uLL);
      }
      else
      {
        if (self->_gnssClient.__ptr_.__value_)
        {
          __asm { FMOV            V0.2D, #-1.0 }
          if (qword_1024193D0 != -1) {
            dispatch_once(&qword_1024193D0, &stru_1022D64F8);
          }
          double v10 = qword_1024193D8;
          if (os_log_type_enabled((os_log_t)qword_1024193D8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#wigo,on,CLSA", buf, 2u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024193D0 != -1) {
              dispatch_once(&qword_1024193D0, &stru_1022D64F8);
            }
            __int16 v18 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSeparationAlertsService startLocationSessionHighAccuracy]", "%s\n", v18);
            if (v18 != (char *)buf) {
              free(v18);
            }
          }
          AnalyticsSendEventLazy();
          if (qword_1024194A0 != -1) {
            dispatch_once(&qword_1024194A0, &stru_1022D64D8);
          }
          int v11 = qword_1024194A8;
          if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68289026;
            int v21 = 0;
            __int16 v22 = 2082;
            uint64_t v23 = "";
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa start no debounce\"}", buf, 0x12u);
          }
          sub_10012F770();
        }
        if (qword_1024194A0 != -1) {
          dispatch_once(&qword_1024194A0, &stru_1022D64D8);
        }
        int v17 = qword_1024194A8;
        if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "#sa no gnss client handle", buf, 2u);
        }
        if (sub_10013D1A0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024194A0 != -1) {
            dispatch_once(&qword_1024194A0, &stru_1022D64D8);
          }
          int v19 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLSeparationAlertsService startLocationSessionHighAccuracy]", "%s\n", v19);
          if (v19 != (char *)buf) {
            free(v19);
          }
        }
      }
    }
    else
    {
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      id v15 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289026;
        int v21 = 0;
        __int16 v22 = 2082;
        uint64_t v23 = "";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa no location client handle\"}", buf, 0x12u);
        if (qword_1024194A0 != -1) {
          dispatch_once(&qword_1024194A0, &stru_1022D64D8);
        }
      }
      __int16 v16 = qword_1024194A8;
      if (os_signpost_enabled((os_log_t)qword_1024194A8))
      {
        *(_DWORD *)buf = 68289026;
        int v21 = 0;
        __int16 v22 = 2082;
        uint64_t v23 = "";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#sa no location client handle", "{\"msg%{public}.0s\":\"#sa no location client handle\"}", buf, 0x12u);
      }
    }
  }
  else
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    v2 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      int v21 = 0;
      __int16 v22 = 2082;
      uint64_t v23 = "";
      objc_super v3 = "{\"msg%{public}.0s\":\"#sa not authorized\"}";
      goto LABEL_6;
    }
  }
}

- (void)stopLocationSession
{
  if (self->_isLocationSessionActive)
  {
    p_locationClient = &self->_locationClient;
    if (self->_locationClient.__ptr_.__value_)
    {
      sub_100103240();
      if ((sub_10010145C() & 1) != 0 || (sub_100103240(), (sub_10015F708() & 1) == 0))
      {
        if (qword_1024194A0 != -1) {
          dispatch_once(&qword_1024194A0, &stru_1022D64D8);
        }
        id v7 = qword_1024194A8;
        if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289026;
          int v10 = 0;
          __int16 v11 = 2082;
          __int16 v12 = "";
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa stop wifi request\"}", buf, 0x12u);
        }
        uint64_t v6 = 1;
      }
      else
      {
        p_locationClient = &self->_gnssClient;
        if (!self->_gnssClient.__ptr_.__value_)
        {
LABEL_22:
          self->_isLocationSessionActive = 0;
          dispatch_source_set_timer((dispatch_source_t)self->_stopLocationRequestTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
          return;
        }
        if (qword_1024193D0 != -1) {
          dispatch_once(&qword_1024193D0, &stru_1022D64F8);
        }
        id v4 = qword_1024193D8;
        if (os_log_type_enabled((os_log_t)qword_1024193D8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#wigo,off,CLSA", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024193D0 != -1) {
            dispatch_once(&qword_1024193D0, &stru_1022D64F8);
          }
          double v8 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSeparationAlertsService stopLocationSession]", "%s\n", v8);
          if (v8 != (char *)buf) {
            free(v8);
          }
        }
        AnalyticsSendEventLazy();
        if (qword_1024194A0 != -1) {
          dispatch_once(&qword_1024194A0, &stru_1022D64D8);
        }
        int v5 = qword_1024194A8;
        if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289026;
          int v10 = 0;
          __int16 v11 = 2082;
          __int16 v12 = "";
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa stop no debounce\"}", buf, 0x12u);
        }
        uint64_t v6 = 0;
      }
      [*(id *)(*(void *)p_locationClient + 16) unregister:*(void *)(*(void *)p_locationClient + 8) forNotification:v6];
      goto LABEL_22;
    }
  }
}

- (void)onGnssNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 == 13)
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    double v8 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *((unsigned __int8 *)a4 + 824);
      *(_DWORD *)buf = 68289282;
      int v14 = 0;
      __int16 v15 = 2082;
      __int16 v16 = "";
      __int16 v17 = 2050;
      uint64_t v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa received location simulation event\", \"SimulationStatus\":%{public}ld}", buf, 0x1Cu);
    }
    id v7 = [objc_alloc((Class)TASystemState) initWithSystemStateType:9 isOn:*((unsigned __int8 *)a4 + 824) date:[NSDate date]];
    goto LABEL_13;
  }
  if (!a3)
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    uint64_t v6 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      int v14 = 0;
      __int16 v15 = 2082;
      __int16 v16 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received location\"}", buf, 0x12u);
    }
    id v7 = objc_msgSend(objc_alloc((Class)TALocationLite), "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)((char *)a4 + 76)), *((unsigned __int8 *)a4 + 672), *(double *)((char *)a4 + 4), *(double *)((char *)a4 + 12), *(double *)((char *)a4 + 20), *(double *)((char *)a4 + 28), *(double *)((char *)a4 + 36), *(double *)((char *)a4 + 44), *(double *)((char *)a4 + 52), *(double *)((char *)a4 + 60), *(void *)((char *)a4 + 68), *((void *)a4 + 21),
           *((void *)a4 + 22),
           *((void *)a4 + 67),
           *((void *)a4 + 68),
           *((void *)a4 + 57),
           *((void *)a4 + 58));
LABEL_13:
    int v10 = v7;
    [(CLSeparationAlertsService *)self ingestTAEventIfSAServiceRunning:v7];

    return;
  }
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  __int16 v11 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "#sa, received unhandled location notification", buf, 2u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    __int16 v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLSeparationAlertsService onGnssNotification:data:]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
}

- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4
{
  if (_os_feature_enabled_impl() && ([a3 isApple] & 1) == 0)
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    __int16 v16 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      int v22 = 0;
      __int16 v23 = 2082;
      v24 = "";
      __int16 v17 = "{\"msg%{public}.0s\":\"#sa received advertisement and avoided ingest TASPAdvertisement for non-Apple advertisement\"}";
      goto LABEL_20;
    }
  }
  else
  {
    if (a4 && [a4 uuid] && objc_msgSend(a4, "type") == (id)1)
    {
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      id v7 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289283;
        int v22 = 0;
        __int16 v23 = 2082;
        v24 = "";
        __int16 v25 = 2113;
        id v26 = [a4 uuid];
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received advertisement\", \"uuid\":%{private, location:escape_only}@}", buf, 0x1Cu);
      }
      unsigned int v8 = +[TASPAdvertisement instancesRespondToSelector:NSSelectorFromString(@"initWithAddress:advertisementData:status:reserved:rssi:scanDate:detailsBitmask:uuid:protocolID:")];
      id v20 = objc_alloc((Class)TASPAdvertisement);
      id v9 = [a3 address];
      id v10 = [a3 advertisementData];
      id v11 = [a3 status];
      id v12 = [a3 reserved];
      id v13 = [a3 rssi];
      id v14 = [a3 scanDate];
      if (v8)
      {
        LODWORD(v19) = [a3 detailsBitmask];
        id v15 = [v20 initWithAddress:v9 advertisementData:v10 status:v11 reserved:v12 rssi:v13 scanDate:v14 detailsBitmask:v19 uuid:[a4 uuid] protocolID:[a3 protocolID]];
      }
      else
      {
        id v15 = [v20 initWithAddress:v9 advertisementData:v10 status:v11 reserved:v12 rssi:v13 scanDate:v14 uuid:[a4 uuid]];
      }
      uint64_t v18 = v15;
      [(CLSeparationAlertsService *)self ingestTAEventIfSAServiceRunning:v15];

      return;
    }
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    __int16 v16 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      int v22 = 0;
      __int16 v23 = 2082;
      v24 = "";
      __int16 v17 = "{\"msg%{public}.0s\":\"#sa received advertisement and avoided ingest TASPAdvertisement for non-owned devices\"}";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, v17, buf, 0x12u);
    }
  }
}

- (void)onAggressiveScanStarted
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  objc_super v3 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    id v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received scan started\"}", (uint8_t *)v5, 0x12u);
  }
  id v4 = [objc_alloc((Class)TAAggressiveScanState) initWithState:2 date:[+[NSDate date](NSDate, "date")]];
  [(CLSeparationAlertsService *)self ingestTAEventIfSAServiceRunning:v4];
}

- (void)onAggressiveScanEnded
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  objc_super v3 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    id v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received scan ended\"}", (uint8_t *)v5, 0x12u);
  }
  id v4 = [objc_alloc((Class)TAAggressiveScanState) initWithState:1 date:[NSDate date]];
  [(CLSeparationAlertsService *)self ingestTAEventIfSAServiceRunning:v4];
}

- (void)onAdvertisementBufferEmptied
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  objc_super v3 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    id v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received scan buffer emptied\"}", (uint8_t *)v5, 0x12u);
  }
  id v4 = [objc_alloc((Class)TASystemState) initWithSystemStateType:15 isOn:1 date:[NSDate date]];
  [(CLSeparationAlertsService *)self ingestTAEventIfSAServiceRunning:v4];
}

- (void)onUpdatedPowerState
{
  if (_os_feature_enabled_impl())
  {
    if (!self->_scannerClientPoweredOn && [(CLAvengerScannerClient *)self->_scannerClient poweredOn])
    {
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      objc_super v3 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
      {
        v4[0] = 68289026;
        v4[1] = 0;
        __int16 v5 = 2082;
        __int16 v6 = "";
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa performing long scan on power on\"}", (uint8_t *)v4, 0x12u);
      }
      [(CLAvengerScannerClient *)self->_scannerClient performTemporaryLongAggressiveScan];
    }
    self->_scannerClientPoweredOn = [(CLAvengerScannerClient *)self->_scannerClient poweredOn];
  }
}

- (id)clientIdentifier
{
  return @"CLSeparationAlertsService";
}

- (void)onDaemonStatusNotification:(int)a3 data:(NotificationData *)a4
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  id v7 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    int v29 = 0;
    __int16 v30 = 2082;
    v31 = "";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received daemon status\"}", buf, 0x12u);
  }
  switch(a3)
  {
    case 0:
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      uint64_t v8 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        int v29 = 0;
        __int16 v30 = 2082;
        v31 = "";
        id v9 = "{\"msg%{public}.0s\":\"#sa received daemon status: initialize\"}";
        goto LABEL_22;
      }
      return;
    case 1:
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      uint64_t v8 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        int v29 = 0;
        __int16 v30 = 2082;
        v31 = "";
        id v9 = "{\"msg%{public}.0s\":\"#sa received daemon status: shutdown\"}";
        goto LABEL_22;
      }
      return;
    case 2:
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      uint64_t v8 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        int v29 = 0;
        __int16 v30 = 2082;
        v31 = "";
        id v9 = "{\"msg%{public}.0s\":\"#sa received daemon status: device sleep\"}";
        goto LABEL_22;
      }
      return;
    case 3:
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      uint64_t v8 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        int v29 = 0;
        __int16 v30 = 2082;
        v31 = "";
        id v9 = "{\"msg%{public}.0s\":\"#sa received daemon status: device awake\"}";
LABEL_22:
        id v10 = v8;
        uint32_t v11 = 18;
        goto LABEL_23;
      }
      return;
    case 6:
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      uint64_t v14 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
      {
        int v15 = *(_DWORD *)a4;
        int v16 = *((_DWORD *)a4 + 1);
        *(_DWORD *)buf = 68289539;
        int v29 = 0;
        __int16 v30 = 2082;
        v31 = "";
        __int16 v32 = 1025;
        int v33 = v15;
        __int16 v34 = 1025;
        int v35 = v16;
        id v9 = "{\"msg%{public}.0s\":\"#sa received daemon status reachability change\", \"ReachabilityOld\":%{private}d, \""
             "ReachabilityNew\":%{private}d}";
        id v10 = v14;
        uint32_t v11 = 30;
LABEL_23:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, v9, buf, v11);
      }
      return;
    case 8:
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      __int16 v17 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
      {
        int v18 = *(unsigned char *)a4;
        *(_DWORD *)buf = 68289283;
        int v29 = 0;
        __int16 v30 = 2082;
        v31 = "";
        __int16 v32 = 1025;
        int v33 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received daemon status airplaneMode\", \"AirplaneMode\":%{private}d}", buf, 0x18u);
      }
      BOOL v19 = *(unsigned char *)a4 != 0;
      uint64_t v20 = 3;
      goto LABEL_57;
    case 10:
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      int v21 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
      {
        int v22 = *(unsigned char *)a4;
        *(_DWORD *)buf = 68289283;
        int v29 = 0;
        __int16 v30 = 2082;
        v31 = "";
        __int16 v32 = 1025;
        int v33 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received daemon status displayOn\", \"DisplayOn\":%{private}d}", buf, 0x18u);
      }
      BOOL v19 = *(unsigned char *)a4 != 0;
      uint64_t v20 = 2;
      goto LABEL_57;
    case 13:
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      __int16 v23 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
      {
        int v24 = *(_DWORD *)a4;
        *(_DWORD *)buf = 68289283;
        int v29 = 0;
        __int16 v30 = 2082;
        v31 = "";
        __int16 v32 = 1025;
        int v33 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received daemon status thermalLevel\", \"ThermalLevel\":%{private}d}", buf, 0x18u);
      }
      BOOL v19 = *(_DWORD *)a4 > 9;
      uint64_t v20 = 7;
      goto LABEL_57;
    case 15:
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      __int16 v25 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
      {
        int v26 = *(unsigned char *)a4;
        *(_DWORD *)buf = 68289283;
        int v29 = 0;
        __int16 v30 = 2082;
        v31 = "";
        __int16 v32 = 1025;
        int v33 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received daemon status batterSaveMode\", \"BatterySaverMode\":%{private}d}", buf, 0x18u);
      }
      BOOL v19 = *(unsigned char *)a4 != 0;
      uint64_t v20 = 4;
LABEL_57:
      id v27 = [objc_alloc((Class)TASystemState) initWithSystemStateType:v20 isOn:v19 date:[NSDate date]];
      [(CLSeparationAlertsService *)self ingestTAEventIfSAServiceRunning:v27];

      break;
    default:
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      id v12 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "#sa, received unhandled daemon status notification", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024194A0 != -1) {
          dispatch_once(&qword_1024194A0, &stru_1022D64D8);
        }
        id v13 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLSeparationAlertsService onDaemonStatusNotification:data:]", "%s\n", v13);
        if (v13 != (char *)buf) {
          free(v13);
        }
      }
      break;
  }
}

- (void)onDataProtectionManagerNotification:(int)a3 data:(unint64_t)a4
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  id v7 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    int v25 = 0;
    __int16 v26 = 2082;
    id v27 = "";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received data protection notification\"}", buf, 0x12u);
  }
  if (a3 == 1)
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    uint64_t v8 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      int v25 = 0;
      __int16 v26 = 2082;
      id v27 = "";
      __int16 v28 = 1025;
      LODWORD(v29) = BYTE4(a4) & 1;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa got after-first-unlock event\", \"DeviceUnlockedSinceBoot\":%{private}d}", buf, 0x18u);
    }
    id v9 = [objc_alloc((Class)TASystemState) initWithSystemStateType:11 isOn:HIDWORD(a4) & 1 date:[NSDate date]];
    [a1 ingestTAEventIfSAServiceRunning:v9];

    if ((a4 & 0x100000000) != 0)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = [a1[16] monitoredRegions];
      id v11 = [v10 countByEnumeratingWithState:&v20 objects:v30 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            int v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            if (qword_1024194A0 != -1) {
              dispatch_once(&qword_1024194A0, &stru_1022D64D8);
            }
            int v16 = qword_1024194A8;
            if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
            {
              id v17 = [v15 identifier];
              *(_DWORD *)buf = 68289283;
              int v25 = 0;
              __int16 v26 = 2082;
              id v27 = "";
              __int16 v28 = 2113;
              id v29 = v17;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa request state for region\", \"regionUUID\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
            [a1[16] requestStateForRegion:v15];
          }
          id v12 = [v10 countByEnumeratingWithState:&v20 objects:v30 count:16];
        }
        while (v12);
      }
    }
  }
  else
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    int v18 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "#sa, received unhandled data protection notification", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      BOOL v19 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLSeparationAlertsService onDataProtectionManagerNotification:data:]", "%s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
  }
}

- (void)onBluetoothServiceNotification:(int)a3 data:(NotificationData *)a4
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  uint64_t v8 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v15 = 0;
    __int16 v16 = 2082;
    id v17 = "";
    __int16 v18 = 1026;
    int v19 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received bluetooth service\", \"msg\":%{public}d}", buf, 0x18u);
  }
  if ((a3 - 4) >= 2)
  {
    if (a3 == 9)
    {
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      id v9 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
      {
        int v10 = *((unsigned __int8 *)a4 + 113);
        *(_DWORD *)buf = 68289283;
        int v15 = 0;
        __int16 v16 = 2082;
        id v17 = "";
        __int16 v18 = 1025;
        int v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received bluetooth service event\", \"power\":%{private}d}", buf, 0x18u);
      }
      id v11 = [objc_alloc((Class)TASystemState) initWithSystemStateType:5 isOn:*((unsigned __int8 *)a4 + 113) date:[NSDate date]];
      [(CLSeparationAlertsService *)self ingestTAEventIfSAServiceRunning:v11];
    }
    else
    {
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      id v12 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "#sa, received unhandled bluetooth service notification", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024194A0 != -1) {
          dispatch_once(&qword_1024194A0, &stru_1022D64D8);
        }
        uint64_t v13 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLSeparationAlertsService onBluetoothServiceNotification:data:]", "%s\n", v13);
        if (v13 != (char *)buf) {
          free(v13);
        }
      }
    }
  }
}

- (void)onMotionStateNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 != 3)
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    id v12 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "#sa, received unhandled motion notification", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    uint64_t v13 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLSeparationAlertsService onMotionStateNotification:data:]", "%s\n");
LABEL_41:
    if (v13 != buf) {
      free(v13);
    }
    return;
  }
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  id v9 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "#sa, received motion state", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    int v15 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSeparationAlertsService onMotionStateNotification:data:]", "%s\n", v15);
    if (v15 != (char *)buf) {
      free(v15);
    }
  }
  if ((CLMotionActivity::isInVehicle((CLMotionActivity *)a4) & 1) != 0
    || (CLMotionActivity::isDriving((CLMotionActivity *)a4) & 1) != 0)
  {
    uint64_t v10 = 3;
  }
  else if ((CLMotionActivity::isWalking((CLMotionActivity *)a4) & 1) != 0 {
         || (CLMotionActivity::isRunning((CLMotionActivity *)a4) & 1) != 0)
  }
  {
    uint64_t v10 = 2;
  }
  else if (CLMotionActivity::isStatic((CLMotionActivity *)a4))
  {
    uint64_t v10 = 1;
  }
  else if (CLMotionActivity::isCycling((CLMotionActivity *)a4))
  {
    uint64_t v10 = 4;
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (*((double *)a4 + 10) > 0.0)
  {
    id v11 = [objc_alloc((Class)TAUserActivity) initWithActivityType:v10 date:[NSDate dateWithTimeIntervalSinceReferenceDate:*((double *)a4 + 10)]];
    [(CLSeparationAlertsService *)self ingestTAEventIfSAServiceRunning:v11];

    return;
  }
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  uint64_t v14 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "#sa received invalid motion timestamp", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    uint64_t v13 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSeparationAlertsService onMotionStateNotification:data:]", "%s\n");
    goto LABEL_41;
  }
}

- (void)separationAlertsServiceManager:(id)a3 notifySeparationsForDevices:(id)a4 withLocation:(id)a5 withContext:(id)a6
{
  id v7 = objc_alloc_init((Class)NSMutableSet);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = [a4 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(a4);
        }
        id v12 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v11);
        if (qword_1024194A0 != -1) {
          dispatch_once(&qword_1024194A0, &stru_1022D64D8);
        }
        uint64_t v13 = qword_1024194A8;
        if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [[[v12 identifier] UUIDString];
          *(_DWORD *)buf = 68289283;
          int v30 = 0;
          __int16 v31 = 2082;
          __int16 v32 = "";
          __int16 v33 = 2113;
          id v34 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa separation for device\", \"device\":%{private, location:escape_only}@}", buf, 0x1Cu);
        }
        [v7 addObject:[v12 identifier]];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [a4 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v9);
  }
  if (a5)
  {
    id v15 = objc_alloc((Class)CLCircularRegion);
    [a5 coordinate];
    double v17 = v16;
    double v19 = v18;
    [a5 horizontalAccuracy];
    [objc_msgSend(v15, "initWithCenter:radius:identifier:", @"FMFLocationRecommendation", v17, v19, v20) setGeoReferenceFrame:[a5 referenceFrame]];
  }
  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 count]);
  id v21 = [a6 objectForKey:&off_102392D68];
  if (v21) {
    [v21 unsignedIntegerValue];
  }
  -[SPSeparationMonitoringProtocol publishSeparationEventForBeacons:eventType:region:completion:](self->_separationMonitoringSession, "publishSeparationEventForBeacons:eventType:region:completion:", v7);
}

- (void)separationAlertsServiceManager:(id)a3 addGeofence:(id)a4
{
  if (self->_locationManager)
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    __int16 v6 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 68289026;
      int v10 = 0;
      __int16 v11 = 2082;
      id v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa adding geofence\"}", (uint8_t *)&v9, 0x12u);
    }
    [(CLLocationManager *)self->_locationManager startMonitoringForRegion:a4];
  }
  else
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    id v7 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 68289026;
      int v10 = 0;
      __int16 v11 = 2082;
      id v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa attempted to add geofence but location manager doesnt exist\"}", (uint8_t *)&v9, 0x12u);
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
    }
    id v8 = qword_1024194A8;
    if (os_signpost_enabled((os_log_t)qword_1024194A8))
    {
      int v9 = 68289026;
      int v10 = 0;
      __int16 v11 = 2082;
      id v12 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#sa attempted to add geofence but location manager doesnt exist", "{\"msg%{public}.0s\":\"#sa attempted to add geofence but location manager doesnt exist\"}", (uint8_t *)&v9, 0x12u);
    }
  }
}

- (void)separationAlertsServiceManager:(id)a3 removeGeofence:(id)a4
{
  if (self->_locationManager)
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    __int16 v6 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 68289026;
      int v10 = 0;
      __int16 v11 = 2082;
      id v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa removing geofence\"}", (uint8_t *)&v9, 0x12u);
    }
    [(CLLocationManager *)self->_locationManager stopMonitoringForRegion:a4];
  }
  else
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    id v7 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 68289026;
      int v10 = 0;
      __int16 v11 = 2082;
      id v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa attempted to remove geofence but location manager doesnt exist\"}", (uint8_t *)&v9, 0x12u);
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
    }
    id v8 = qword_1024194A8;
    if (os_signpost_enabled((os_log_t)qword_1024194A8))
    {
      int v9 = 68289026;
      int v10 = 0;
      __int16 v11 = 2082;
      id v12 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#sa attempted to remove geofence but location manager doesnt exist", "{\"msg%{public}.0s\":\"#sa attempted to remove geofence but location manager doesnt exist\"}", (uint8_t *)&v9, 0x12u);
    }
  }
}

- (void)separationAlertsServiceManager:(id)a3 requestStateForRegion:(id)a4
{
  if (self->_locationManager)
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    __int16 v6 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 68289026;
      int v10 = 0;
      __int16 v11 = 2082;
      id v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa requesting geofence state\"}", (uint8_t *)&v9, 0x12u);
    }
    [(CLLocationManager *)self->_locationManager requestStateForRegion:a4];
  }
  else
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    id v7 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 68289026;
      int v10 = 0;
      __int16 v11 = 2082;
      id v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa attempted to request geofence state but location manager doesnt exist\"}", (uint8_t *)&v9, 0x12u);
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
    }
    id v8 = qword_1024194A8;
    if (os_signpost_enabled((os_log_t)qword_1024194A8))
    {
      int v9 = 68289026;
      int v10 = 0;
      __int16 v11 = 2082;
      id v12 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#sa attempted to request geofence state but location manager doesnt exist", "{\"msg%{public}.0s\":\"#sa attempted to request geofence state but location manager doesnt exist\"}", (uint8_t *)&v9, 0x12u);
    }
  }
}

- (void)separationAlertsServiceManager:(id)a3 requestBluetoothScanForTypes:(unint64_t)a4
{
  char v4 = a4;
  if (_os_feature_enabled_impl())
  {
    if (self->_scannerClient)
    {
      if ((v4 & 2) != 0)
      {
        if (qword_1024194A0 != -1) {
          dispatch_once(&qword_1024194A0, &stru_1022D64D8);
        }
        uint64_t v13 = qword_1024194A8;
        if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
        {
          int v15 = 68289026;
          int v16 = 0;
          __int16 v17 = 2082;
          double v18 = "";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa performing long avenger scan\"}", (uint8_t *)&v15, 0x12u);
        }
        [(CLAvengerScannerClient *)self->_scannerClient performTemporaryLongAggressiveScan];
      }
      else if (v4)
      {
        if (qword_1024194A0 != -1) {
          dispatch_once(&qword_1024194A0, &stru_1022D64D8);
        }
        __int16 v6 = qword_1024194A8;
        if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
        {
          int v15 = 68289026;
          int v16 = 0;
          __int16 v17 = 2082;
          double v18 = "";
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa performing avenger scan\"}", (uint8_t *)&v15, 0x12u);
        }
        [(CLAvengerScannerClient *)self->_scannerClient performTemporaryAggressiveScan];
      }
      return;
    }
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    id v8 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_ERROR))
    {
      int v15 = 68289026;
      int v16 = 0;
      __int16 v17 = 2082;
      double v18 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa attempted to issue scan but scanner client doesnt exist\"}", (uint8_t *)&v15, 0x12u);
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
    }
    int v9 = qword_1024194A8;
    if (os_signpost_enabled((os_log_t)qword_1024194A8))
    {
      int v15 = 68289026;
      int v16 = 0;
      __int16 v17 = 2082;
      double v18 = "";
      int v10 = "#sa attempted to issue scan but scanner client doesnt exist";
      __int16 v11 = "{\"msg%{public}.0s\":\"#sa attempted to issue scan but scanner client doesnt exist\"}";
LABEL_32:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v10, v11, (uint8_t *)&v15, 0x12u);
    }
  }
  else if (self->_avengerScannerProxy)
  {
    if ((v4 & 2) != 0)
    {
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      id v14 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 68289026;
        int v16 = 0;
        __int16 v17 = 2082;
        double v18 = "";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa performing long avenger scan\"}", (uint8_t *)&v15, 0x12u);
      }
      [(CLAvengerScannerServiceProtocol *)self->_avengerScannerProxy performTemporaryLongAggressiveScan:CLISP_ME_TOKEN];
    }
    else if (v4)
    {
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      id v7 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 68289026;
        int v16 = 0;
        __int16 v17 = 2082;
        double v18 = "";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa performing avenger scan\"}", (uint8_t *)&v15, 0x12u);
      }
      [(CLAvengerScannerServiceProtocol *)self->_avengerScannerProxy performTemporaryAggressiveScan:CLISP_ME_TOKEN];
    }
  }
  else
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    id v12 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_ERROR))
    {
      int v15 = 68289026;
      int v16 = 0;
      __int16 v17 = 2082;
      double v18 = "";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa attempted to issue scan but scanner proxy doesnt exist\"}", (uint8_t *)&v15, 0x12u);
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
    }
    int v9 = qword_1024194A8;
    if (os_signpost_enabled((os_log_t)qword_1024194A8))
    {
      int v15 = 68289026;
      int v16 = 0;
      __int16 v17 = 2082;
      double v18 = "";
      int v10 = "#sa attempted to issue scan but scanner proxy doesnt exist";
      __int16 v11 = "{\"msg%{public}.0s\":\"#sa attempted to issue scan but scanner proxy doesnt exist\"}";
      goto LABEL_32;
    }
  }
}

- (void)separationAlertsServiceManager:(id)a3 requestLocationForType:(unint64_t)a4
{
  if (!a4) {
    [(CLSeparationAlertsService *)self startLocationSessionHighAccuracy];
  }
}

- (void)separationAlertsServiceManager:(id)a3 scheduleSATimeEvent:(double)a4 forAlarm:(id)a5
{
  if ([(NSMutableDictionary *)self->_scheduledAlarms objectForKey:a5])
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    id v8 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 68289538;
      int v12 = 0;
      __int16 v13 = 2082;
      id v14 = "";
      __int16 v15 = 2050;
      double v16 = a4;
      __int16 v17 = 2114;
      id v18 = a5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa alarm already exist\", \"timeIntervalFromNow\":\"%{public}.1f\", \"alarmUUID\":%{public, location:escape_only}@}", (uint8_t *)&v11, 0x26u);
    }
  }
  else
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    int v9 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 68289538;
      int v12 = 0;
      __int16 v13 = 2082;
      id v14 = "";
      __int16 v15 = 2050;
      double v16 = a4;
      __int16 v17 = 2114;
      id v18 = a5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa scheduling next time event\", \"timeIntervalFromNow\":\"%{public}.1f\", \"alarmUUID\":%{public, location:escape_only}@}", (uint8_t *)&v11, 0x26u);
    }
    id v10 = [objc_alloc((Class)PCPersistentTimer) initWithTimeInterval:@"com.apple.locationd.clSeparationAlertsServicePersistentTimer" serviceIdentifier:self target:"onPCPersistentTimerFired:" selector:a5 userInfo:a4];
    [v10 setMinimumEarlyFireProportion:1.0];
    [v10 setUserVisible:0];
    [v10 setDisableSystemWaking:0];
    [v10 scheduleInQueue:self->_queue];
    [(NSMutableDictionary *)self->_scheduledAlarms setObject:v10 forKey:a5];
  }
}

- (void)separationAlertsServiceManager:(id)a3 cancelSATimeEventForAlarm:(id)a4
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  __int16 v6 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    __int16 v8 = 2082;
    int v9 = "";
    __int16 v10 = 2114;
    id v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa cancelling scheduled SATimeEvent\", \"alarmUUID\":%{public, location:escape_only}@}", (uint8_t *)v7, 0x1Cu);
  }
  [(CLSeparationAlertsService *)self clearAndRemoveAlarm:a4];
}

- (void)separationAlertsServiceManagerStopLongAggressiveScan:(id)a3
{
  if (_os_feature_enabled_impl())
  {
    if (self->_scannerClient)
    {
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      char v4 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 68289026;
        int v10 = 0;
        __int16 v11 = 2082;
        int v12 = "";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa stopping long avenger scan\"}", (uint8_t *)&v9, 0x12u);
      }
      [(CLAvengerScannerClient *)self->_scannerClient stopTemporaryLongAggressiveScan];
      return;
    }
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    __int16 v6 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 68289026;
      int v10 = 0;
      __int16 v11 = 2082;
      int v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa attempted to terminate long scan but scanner proxy doesnt exist\"}", (uint8_t *)&v9, 0x12u);
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
    }
    id v7 = qword_1024194A8;
    if (os_signpost_enabled((os_log_t)qword_1024194A8))
    {
LABEL_27:
      int v9 = 68289026;
      int v10 = 0;
      __int16 v11 = 2082;
      int v12 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#sa attempted to terminate long scan but scanner proxy doesnt exist", "{\"msg%{public}.0s\":\"#sa attempted to terminate long scan but scanner proxy doesnt exist\"}", (uint8_t *)&v9, 0x12u);
    }
  }
  else if (self->_avengerScannerProxy)
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    __int16 v5 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 68289026;
      int v10 = 0;
      __int16 v11 = 2082;
      int v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa stopping long avenger scan\"}", (uint8_t *)&v9, 0x12u);
    }
    [(CLAvengerScannerServiceProtocol *)self->_avengerScannerProxy terminateTemporaryLongAggressiveScan:CLISP_ME_TOKEN];
  }
  else
  {
    if (qword_1024194A0 != -1) {
      dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    }
    __int16 v8 = qword_1024194A8;
    if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 68289026;
      int v10 = 0;
      __int16 v11 = 2082;
      int v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa attempted to terminate long scan but scanner proxy doesnt exist\"}", (uint8_t *)&v9, 0x12u);
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
    }
    id v7 = qword_1024194A8;
    if (os_signpost_enabled((os_log_t)qword_1024194A8)) {
      goto LABEL_27;
    }
  }
}

- (void)onPCPersistentTimerFired:(id)a3
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  __int16 v5 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    __int16 v8 = 2082;
    int v9 = "";
    __int16 v10 = 2114;
    id v11 = [a3 userInfo];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa PCPersistentTimerFired, ingesting SATimeEvent\", \"alarmUUID\":%{public, location:escape_only}@}", (uint8_t *)v7, 0x1Cu);
  }
  id v6 = [objc_alloc((Class)SATimeEvent) initWithDate:+[NSDate date](NSDate, "date")];
  [(CLSeparationAlertsService *)self ingestTAEventIfSAServiceRunning:v6];

  -[CLSeparationAlertsService clearAndRemoveAlarm:](self, "clearAndRemoveAlarm:", [a3 userInfo]);
}

- (void)clearAndRemoveAlarm:(id)a3
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  __int16 v5 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 68289282;
    v8[1] = 0;
    __int16 v9 = 2082;
    __int16 v10 = "";
    __int16 v11 = 2114;
    id v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa clearing alarm and removing it from dictionary if it exists\", \"alarmUUID\":%{public, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
  }
  id v6 = [(NSMutableDictionary *)self->_scheduledAlarms objectForKey:a3];
  if (v6)
  {
    id v7 = v6;
    [v6 invalidate];

    [(NSMutableDictionary *)self->_scheduledAlarms removeObjectForKey:a3];
  }
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  id v6 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289283;
    v8[1] = 0;
    __int16 v9 = 2082;
    __int16 v10 = "";
    __int16 v11 = 2049;
    uint64_t v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa location authorization changed\", \"authorizationStatus\":%{private}ld}", (uint8_t *)v8, 0x1Cu);
  }
  self->_authorized = a4 == 3;
  if (a4 != 3) {
    [(CLSeparationAlertsService *)self stopLocationSession];
  }
  id v7 = [objc_alloc((Class)TASystemState) initWithSystemStateType:8 isOn:self->_authorized date:[NSDate date]];
  [(CLSeparationAlertsService *)self ingestTAEventIfSAServiceRunning:v7];
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  __int16 v8 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 68289539;
    v10[1] = 0;
    __int16 v11 = 2082;
    uint64_t v12 = "";
    __int16 v13 = 2113;
    id v14 = [a4 identifier];
    __int16 v15 = 2114;
    id v16 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa region monitoring failed\", \"regionUUID\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", (uint8_t *)v10, 0x26u);
  }
  id v9 = [objc_alloc((Class)SAGeofenceEvent) initWithRegion:a4 eventType:6 eventDate:[+[NSDate date](NSDate, "date")]];
  [(CLSeparationAlertsService *)self ingestTAEventIfSAServiceRunning:v9];
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  id v6 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289283;
    v8[1] = 0;
    __int16 v9 = 2082;
    __int16 v10 = "";
    __int16 v11 = 2113;
    id v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa started monitoring region\", \"region\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
  }
  id v7 = [objc_alloc((Class)SAGeofenceEvent) initWithRegion:a4 eventType:5 eventDate:[NSDate date]];
  [(CLSeparationAlertsService *)self ingestTAEventIfSAServiceRunning:v7];
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  __int16 v8 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 68289283;
    v10[1] = 0;
    __int16 v11 = 2082;
    id v12 = "";
    __int16 v13 = 2113;
    id v14 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa determined state for region\", \"region\":%{private, location:escape_only}@}", (uint8_t *)v10, 0x1Cu);
  }
  if (a4 != 2) {
    a4 = a4 == 1;
  }
  id v9 = [objc_alloc((Class)SAGeofenceEvent) initWithRegion:a5 eventType:a4 eventDate:[NSDate date]];
  [(CLSeparationAlertsService *)self ingestTAEventIfSAServiceRunning:v9];
}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  id v6 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289283;
    v8[1] = 0;
    __int16 v9 = 2082;
    __int16 v10 = "";
    __int16 v11 = 2113;
    id v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa did enter for region\", \"region\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
  }
  id v7 = [objc_alloc((Class)SAGeofenceEvent) initWithRegion:a4 eventType:3 eventDate:[+[NSDate date](NSDate, "date")]];
  [(CLSeparationAlertsService *)self ingestTAEventIfSAServiceRunning:v7];
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  id v6 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289283;
    v8[1] = 0;
    __int16 v9 = 2082;
    __int16 v10 = "";
    __int16 v11 = 2113;
    id v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa did exit for region\", \"region\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
  }
  id v7 = [objc_alloc((Class)SAGeofenceEvent) initWithRegion:a4 eventType:4 eventDate:[NSDate date]];
  [(CLSeparationAlertsService *)self ingestTAEventIfSAServiceRunning:v7];
}

- (void)showSAUserFeedbackDialogue:(id)a3
{
  sub_1000C7F88(buf);
  sub_1000D2988(*(uint64_t *)buf, "SeparationAlertsAllowUserFeedback", &self->_allowSAUserFeedback);
  if (*(void *)v35) {
    sub_1000DB0A0(*(std::__shared_weak_count **)v35);
  }
  if (self->_allowSAUserFeedback)
  {
    if ((double)arc4random() / 4294967300.0 > 0.4)
    {
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      __int16 v5 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#sa user will not receive feedback dialogue", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024194A0 == -1)
        {
LABEL_18:
          LOWORD(v31.__r_.__value_.__l.__data_) = 0;
          id v7 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSeparationAlertsService showSAUserFeedbackDialogue:]", "%s\n", v7);
          if (v7 != (char *)buf) {
            free(v7);
          }
          return;
        }
LABEL_89:
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
        goto LABEL_18;
      }
      return;
    }
    if (objc_msgSend(objc_msgSend(a3, "name"), "UTF8String")) {
      __int16 v8 = (char *)[a3 name UTF8String];
    }
    else {
      __int16 v8 = "device";
    }
    sub_100134750(&v31, v8);
    if ([(CLSeparationAlertsService *)self isAirPodsProCase:a3])
    {
      __int16 v9 = "AirPods Pro - case";
LABEL_25:
      std::string::assign(&v31, v9);
      goto LABEL_26;
    }
    int v16 = HIBYTE(v31.__r_.__value_.__r.__words[2]);
    if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    {
      if (v31.__r_.__value_.__l.__size_ != 4) {
        goto LABEL_64;
      }
      __int16 v17 = (std::string *)v31.__r_.__value_.__r.__words[0];
    }
    else
    {
      if (HIBYTE(v31.__r_.__value_.__r.__words[2]) != 4)
      {
LABEL_58:
        if (v16 != 5)
        {
LABEL_71:
          if (v16 != 6) {
            goto LABEL_26;
          }
          long long v26 = &v31;
          goto LABEL_79;
        }
        long long v22 = &v31;
        goto LABEL_66;
      }
      __int16 v17 = &v31;
    }
    if (LODWORD(v17->__r_.__value_.__l.__data_) == 1952867692)
    {
      if ([a3 deviceType] == (id)16
        || [(CLSeparationAlertsService *)self isAirPodsProBuds:a3])
      {
        __int16 v9 = "AirPods - left";
        goto LABEL_25;
      }
      int v16 = HIBYTE(v31.__r_.__value_.__r.__words[2]);
      if ((*((unsigned char *)&v31.__r_.__value_.__s + 23) & 0x80) == 0) {
        goto LABEL_58;
      }
    }
    else if ((*((unsigned char *)&v31.__r_.__value_.__s + 23) & 0x80) == 0)
    {
      goto LABEL_58;
    }
LABEL_64:
    if (v31.__r_.__value_.__l.__size_ != 5) {
      goto LABEL_77;
    }
    long long v22 = (std::string *)v31.__r_.__value_.__r.__words[0];
LABEL_66:
    int data = (int)v22->__r_.__value_.__l.__data_;
    int v24 = v22->__r_.__value_.__s.__data_[4];
    if (data == 1751607666 && v24 == 116)
    {
      if ([a3 deviceType] == (id)16
        || [(CLSeparationAlertsService *)self isAirPodsProBuds:a3])
      {
        __int16 v9 = "AirPods - right";
        goto LABEL_25;
      }
      int v16 = HIBYTE(v31.__r_.__value_.__r.__words[2]);
      if ((*((unsigned char *)&v31.__r_.__value_.__s + 23) & 0x80) == 0) {
        goto LABEL_71;
      }
    }
    else if ((v16 & 0x80) == 0)
    {
      goto LABEL_71;
    }
LABEL_77:
    if (v31.__r_.__value_.__l.__size_ != 6) {
      goto LABEL_26;
    }
    long long v26 = (std::string *)v31.__r_.__value_.__r.__words[0];
LABEL_79:
    int v27 = (int)v26->__r_.__value_.__l.__data_;
    int v28 = WORD2(v26->__r_.__value_.__r.__words[0]);
    BOOL v29 = v27 == 1735289203 && v28 == 25964;
    if (v29 && [a3 deviceType] == (id)16)
    {
      __int16 v9 = "AirPods Max";
      goto LABEL_25;
    }
LABEL_26:
    id v10 = [a3 deviceType];
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    [v11 setObject:@"[Internal Only] Find My: Notify When Left Behind" forKeyedSubscript:kCFUserNotificationAlertHeaderKey];
    [v11 setObject:@"Yes - Expected" forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];
    [v11 setObject:@"No - Not Expected" forKeyedSubscript:kCFUserNotificationOtherButtonTitleKey];
    [v11 setObject:@"Don't ask again" forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];
    if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      id v12 = &v31;
    }
    else {
      id v12 = (std::string *)v31.__r_.__value_.__r.__words[0];
    }
    [v11 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Did you leave %@ behind? If not, please file a radar to FindMy | iOS", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v12)), kCFUserNotificationAlertMessageKey forKeyedSubscript];
    CFUserNotificationRef v13 = CFUserNotificationCreate(kCFAllocatorDefault, 30.0, 0, 0, (CFDictionaryRef)v11);
    CFTypeRef cf = v13;

    if (v13)
    {
      CFRetain(v13);
      RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v13, (CFUserNotificationCallBack)sub_100997B84, 0);
      if (RunLoopSource)
      {
        *(void *)buf = &cf;
        sub_10017C9B0((uint64_t **)&qword_10247F170, (unint64_t *)&cf, (uint64_t)&unk_101D0B290, (uint64_t **)buf)[5] = (uint64_t)v10;
        __int16 v15 = (__CFRunLoop *)sub_1001C2710();
        CFRunLoopAddSource(v15, RunLoopSource, kCFRunLoopCommonModes);
        CFRelease(RunLoopSource);
        CFRelease(cf);
LABEL_47:
        if (qword_1024194A0 != -1) {
          dispatch_once(&qword_1024194A0, &stru_1022D64D8);
        }
        double v20 = qword_1024194A8;
        if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = [a3 identifier];
          *(_DWORD *)buf = 68289283;
          *(_DWORD *)&uint8_t buf[4] = 0;
          *(_WORD *)int v35 = 2082;
          *(void *)&v35[2] = "";
          __int16 v36 = 2113;
          id v37 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa user feedback submitted\", \"uuid\":%{private, location:escape_only}@}", buf, 0x1Cu);
        }
        if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v31.__r_.__value_.__l.__data_);
        }
        return;
      }
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      double v19 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "Could not create runloop source for SA user feedback", buf, 2u);
      }
      if (!sub_10013D1A0(115, 0)) {
        goto LABEL_47;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1024194A0 == -1)
      {
LABEL_87:
        __int16 v32 = 0;
        int v30 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "void displaySAUserFeedback(const std::string &, SADeviceType)", "%s\n", v30);
        if (v30 != (char *)buf) {
          free(v30);
        }
        goto LABEL_47;
      }
    }
    else
    {
      if (qword_1024194A0 != -1) {
        dispatch_once(&qword_1024194A0, &stru_1022D64D8);
      }
      id v18 = qword_1024194A8;
      if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "Could not create SA user feedback", buf, 2u);
      }
      if (!sub_10013D1A0(115, 0)) {
        goto LABEL_47;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1024194A0 == -1) {
        goto LABEL_87;
      }
    }
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
    goto LABEL_87;
  }
  if (qword_1024194A0 != -1) {
    dispatch_once(&qword_1024194A0, &stru_1022D64D8);
  }
  id v6 = qword_1024194A8;
  if (os_log_type_enabled((os_log_t)qword_1024194A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#sa user opt out feedback dialogue", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194A0 == -1) {
      goto LABEL_18;
    }
    goto LABEL_89;
  }
}

- (BOOL)isAirPodsProBuds:(id)a3
{
  return [a3 productId] == (id)8212 || [a3 productId] == (id)8228;
}

- (BOOL)isAirPodsProCase:(id)a3
{
  return [a3 productId] == (id)8213 || [a3 productId] == (id)8216;
}

- (void).cxx_destruct
{
  value = self->_motionStateClient.__ptr_.__value_;
  self->_motionStateClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  char v4 = self->_companionClient.__ptr_.__value_;
  self->_companionClient.__ptr_.__value_ = 0;
  if (v4) {
    (*(void (**)(Client *, SEL))(*(void *)v4 + 8))(v4, a2);
  }
  __int16 v5 = self->_gnssClient.__ptr_.__value_;
  self->_gnssClient.__ptr_.__value_ = 0;
  if (v5) {
    (*(void (**)(Client *, SEL))(*(void *)v5 + 8))(v5, a2);
  }
  id v6 = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = 0;
  if (v6) {
    (*(void (**)(Client *, SEL))(*(void *)v6 + 8))(v6, a2);
  }
  id v7 = self->_bluetoothServiceClient.__ptr_.__value_;
  self->_bluetoothServiceClient.__ptr_.__value_ = 0;
  if (v7) {
    (*(void (**)(Client *, SEL))(*(void *)v7 + 8))(v7, a2);
  }
  __int16 v8 = self->_dataProtectionManagerClient.__ptr_.__value_;
  self->_dataProtectionManagerClient.__ptr_.__value_ = 0;
  if (v8) {
    (*(void (**)(Client *, SEL))(*(void *)v8 + 8))(v8, a2);
  }
  __int16 v9 = self->_daemonStatusClient.__ptr_.__value_;
  self->_daemonStatusClient.__ptr_.__value_ = 0;
  if (v9) {
    (*(void (**)(Client *, SEL))(*(void *)v9 + 8))(v9, a2);
  }
  id v10 = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0;
  if (v10)
  {
    id v11 = *(void (**)(void))(*(void *)v10 + 8);
    v11();
  }
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  return self;
}

@end