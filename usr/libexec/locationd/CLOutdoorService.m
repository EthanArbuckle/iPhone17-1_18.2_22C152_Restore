@interface CLOutdoorService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)shouldRunManager;
- (CLOutdoorManagerCallbackAdapter)callbackAdapter;
- (CLOutdoorService)init;
- (NSMutableSet)clients;
- (id).cxx_construct;
- (void)beginService;
- (void)bringupManager;
- (void)endService;
- (void)manager;
- (void)notifyClients:(const OutdoorUpdate *)a3;
- (void)onAmbientLightSensorData:(const CLALSLuxResult *)a3;
- (void)onBacklightStateNotification:(const int *)a3 data:(const void *)a4;
- (void)onBiomeUserFocusSleepModeEvent:(id)a3;
- (void)onDaemonStatusNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onFitnessTrackingNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onGnssAvailabilityPredictorNotification:(const int *)a3 data:(const void *)a4;
- (void)onGnssLeechLocationNotification:(const int *)a3 data:(const void *)a4;
- (void)onHKPrivacyPreferencesEnableDaylightTime:(BOOL)a3;
- (void)onLocationNotification:(const int *)a3 data:(const void *)a4;
- (void)onMotionStateCoprocessorData:(const void *)a3;
- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onOdometerNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onOldMotionCoprocessorData:(const void *)a3;
- (void)onOutdoorUpdate:(const OutdoorUpdate *)a3;
- (void)onSignalEnvironmentNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onStepCountNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onWifiNotification:(const int *)a3 data:(const void *)a4;
- (void)pause;
- (void)registerForAlgorithmSources;
- (void)registerForHKNanoLifestylePrivacyPreferencesChangedNotification;
- (void)registerForUpdates:(id)a3;
- (void)resume;
- (void)setCallbackAdapter:(CLOutdoorManagerCallbackAdapter *)a3;
- (void)setClients:(id)a3;
- (void)setManager:(void *)a3;
- (void)setupManager;
- (void)teardownManager;
- (void)toggleManagerBySettingFlag:(BOOL *)a3 toState:(BOOL)a4;
- (void)unregisterForAlgorithmSources;
- (void)unregisterForHKNanoLifestylePrivacyPreferencesChangedNotification;
- (void)unregisterForUpdates:(id)a3;
- (void)updateLocationAuthorization;
@end

@implementation CLOutdoorService

- (void)onStepCountNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [self universe].silo
  if (*a3 == 1 && [(CLOutdoorService *)self manager])
  {
    v7 = [(CLOutdoorService *)self manager];
    sub_1001B133C((uint64_t)v7, a4);
  }
}

- (void)onMotionStateCoprocessorData:(const void *)a3
{
  [self universe].silo
  if ([(CLOutdoorService *)self manager])
  {
    v5 = [(CLOutdoorService *)self manager];
    sub_10002FC4C(v5, (uint64_t)a3);
  }
}

- (void)onAmbientLightSensorData:(const CLALSLuxResult *)a3
{
  [self universe].silo
  if ([(CLOutdoorService *)self manager])
  {
    v5 = [(CLOutdoorService *)self manager];
    sub_10005F308((uint64_t)v5, (__n128 *)a3);
  }
}

- (void)notifyClients:(const OutdoorUpdate *)a3
{
  long long v3 = *(_OWORD *)&a3->var2;
  long long v14 = *(_OWORD *)&a3->var0;
  long long v15 = v3;
  long long v16 = *(_OWORD *)&a3->var4;
  uint64_t v17 = *(void *)&a3->var6;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(CLOutdoorService *)self clients];
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v10 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        long long v19 = v14;
        long long v20 = v15;
        long long v21 = v16;
        uint64_t v22 = v17;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10017B2E8;
        v18[3] = &unk_1023023A8;
        [v9 onOutdoorUpdate:[v18 copy]];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v10 objects:v23 count:16];
    }
    while (v6);
  }
}

- (void)onLocationNotification:(const int *)a3 data:(const void *)a4
{
  [self universe].silo
  if (*a3 == 14)
  {
    if (qword_1024194F0 != -1) {
      dispatch_once(&qword_1024194F0, &stru_102302368);
    }
    v9 = qword_1024194F8;
    if (os_log_type_enabled((os_log_t)qword_1024194F8, OS_LOG_TYPE_DEFAULT))
    {
      buf[0].n128_u16[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received location authorization update", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194F0 != -1) {
        dispatch_once(&qword_1024194F0, &stru_102302368);
      }
      long long v10 = (__n128 *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLOutdoorService onLocationNotification:data:]", "%s\n", (const char *)v10);
      if (v10 != buf) {
        free(v10);
      }
    }
    [(CLOutdoorService *)self updateLocationAuthorization];
  }
  else if (*a3 == 5)
  {
    if ([(CLOutdoorService *)self manager])
    {
      *(float *)&unsigned int v7 = *(double *)((char *)a4 + 4);
      *(float *)&unsigned int v8 = *(double *)((char *)a4 + 12);
      buf[0].n128_u64[0] = *(void *)((char *)a4 + 76);
      buf[0].n128_u64[1] = v7 | ((unint64_t)v8 << 32);
      sub_10011F284((uint64_t)[(CLOutdoorService *)self manager], buf);
    }
  }
}

- (void)onGnssAvailabilityPredictorNotification:(const int *)a3 data:(const void *)a4
{
  [self universe].silo
  if (*a3 == 36)
  {
    if ([(CLOutdoorService *)self manager])
    {
      unsigned int v7 = [(CLOutdoorService *)self manager];
      sub_10011F8AC((uint64_t)v7, &v8);
    }
  }
}

- (void)manager
{
  return self->_manager;
}

- (void)onOutdoorUpdate:(const OutdoorUpdate *)a3
{
  [self universe].silo

  [(CLOutdoorService *)self notifyClients:a3];
}

- (NSMutableSet)clients
{
  return self->_clients;
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
  if (qword_1024822B8 != -1) {
    dispatch_once(&qword_1024822B8, &stru_102302248);
  }
  return (id)qword_1024822B0;
}

- (CLOutdoorService)init
{
  v5.receiver = self;
  v5.super_class = (Class)CLOutdoorService;
  v2 = [(CLOutdoorService *)&v5 initWithInboundProtocol:&OBJC_PROTOCOL___CLOutdoorServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLOutdoorServiceClientProtocol];
  long long v3 = v2;
  if (v2)
  {
    [(CLOutdoorService *)v2 setClients:0];
    [(CLOutdoorService *)v3 setCallbackAdapter:0];
    [(CLOutdoorService *)v3 setManager:0];
    v3->fBatterySaverModeEnabled = 0;
    v3->fFitnessTrackingEnabled = 0;
    v3->fLocationServicesEnabled = 0;
    v3->fBedtimeSleepModeEnabled = 0;
    v3->fClientAuthorizationCache = 0;
    v3->fBiomeScheduler = 0;
    v3->fBiomeSink = 0;
  }
  return v3;
}

+ (BOOL)isSupported
{
  if (qword_1024822C8 != -1) {
    dispatch_once(&qword_1024822C8, &stru_102302268);
  }
  return byte_1024822C0;
}

- (void)beginService
{
}

- (void)endService
{
  [(CLOutdoorService *)self unregisterForHKNanoLifestylePrivacyPreferencesChangedNotification];
  sub_100EE6B14((uint64_t **)&self->fAlsCollector, 0);
  [(CLOutdoorService *)self teardownManager];
  value = self->fDaemonStatusClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:15];
    v4 = self->fDaemonStatusClient.__ptr_.__value_;
    self->fDaemonStatusClient.__ptr_.__value_ = 0;
    if (v4) {
      (*(void (**)(Client *))(*(void *)v4 + 8))(v4);
    }
  }
  objc_super v5 = self->fServiceLocationClient.__ptr_.__value_;
  if (v5)
  {
    [*((id *)v5 + 2) unregister:*((void *)v5 + 1) forNotification:14];
    id v6 = self->fServiceLocationClient.__ptr_.__value_;
    self->fServiceLocationClient.__ptr_.__value_ = 0;
    if (v6) {
      (*(void (**)(Client *))(*(void *)v6 + 8))(v6);
    }
  }
  unsigned int v7 = self->fServiceLocationProvider.__ptr_.__value_;
  if (v7)
  {
    self->fServiceLocationProvider.__ptr_.__value_ = 0;
    (*(void (**)(CLServiceLocationProvider *))(*(void *)v7 + 8))(v7);
  }
  fClientAuthorizationCache = self->fClientAuthorizationCache;
  if (fClientAuthorizationCache)
  {

    self->fClientAuthorizationCache = 0;
  }
  v9 = self->fFitnessTrackingClient.__ptr_.__value_;
  if (v9)
  {
    [*((id *)v9 + 2) unregister:*((void *)v9 + 1) forNotification:0];
    long long v10 = self->fFitnessTrackingClient.__ptr_.__value_;
    self->fFitnessTrackingClient.__ptr_.__value_ = 0;
    if (v10) {
      (*(void (**)(Client *))(*(void *)v10 + 8))(v10);
    }
  }
  fBiomeScheduler = self->fBiomeScheduler;
  if (fBiomeScheduler)
  {

    self->fBiomeScheduler = 0;
  }
  fBiomeSink = self->fBiomeSink;
  if (fBiomeSink)
  {
    [(BPSSink *)fBiomeSink cancel];

    self->fBiomeSink = 0;
  }
  long long v13 = [(CLOutdoorService *)self callbackAdapter];
  if (v13) {
    (*((void (**)(CLOutdoorManagerCallbackAdapter *))v13->var0 + 1))(v13);
  }
  [(CLOutdoorService *)self setCallbackAdapter:0];

  [(CLOutdoorService *)self setClients:0];
}

- (void)setupManager
{
}

- (void)registerForAlgorithmSources
{
}

- (void)unregisterForAlgorithmSources
{
  if (self->fMotionStateCoprocessorDispatcher.__ptr_.__value_)
  {
    uint64_t v3 = sub_1000D2E34(0);
    sub_1009D26C4(v3, 0, (uint64_t)self->fMotionStateCoprocessorDispatcher.__ptr_.__value_);
    value = self->fMotionStateCoprocessorDispatcher.__ptr_.__value_;
    self->fMotionStateCoprocessorDispatcher.__ptr_.__value_ = 0;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8))(value);
    }
  }
  if (self->fOldMotionCoprocessorDispatcher.__ptr_.__value_)
  {
    uint64_t v5 = sub_1000D2E34(0);
    sub_1009D26C4(v5, 1, (uint64_t)self->fOldMotionCoprocessorDispatcher.__ptr_.__value_);
    id v6 = self->fOldMotionCoprocessorDispatcher.__ptr_.__value_;
    self->fOldMotionCoprocessorDispatcher.__ptr_.__value_ = 0;
    if (v6) {
      (*(void (**)(Dispatcher *))(*(void *)v6 + 8))(v6);
    }
  }
  unsigned int v7 = (uint64_t *)self->fAlsCollector.__ptr_.__value_;
  if (v7) {
    sub_10087DEB4(v7);
  }
  if (sub_1000EB1B0())
  {
    long long v8 = self->fBLSClient.__ptr_.__value_;
    if (v8)
    {
      [*((id *)v8 + 2) unregister:*((void *)v8 + 1) forNotification:1];
      v9 = self->fBLSClient.__ptr_.__value_;
      self->fBLSClient.__ptr_.__value_ = 0;
      if (v9) {
        (*(void (**)(Client *))(*(void *)v9 + 8))(v9);
      }
    }
  }
  long long v10 = self->fStepCountClient.__ptr_.__value_;
  if (v10)
  {
    [*((id *)v10 + 2) unregister:*((void *)v10 + 1) forNotification:1];
    long long v11 = self->fStepCountClient.__ptr_.__value_;
    self->fStepCountClient.__ptr_.__value_ = 0;
    if (v11) {
      (*(void (**)(Client *))(*(void *)v11 + 8))(v11);
    }
  }
  long long v12 = self->fServiceLocationClient.__ptr_.__value_;
  if (v12) {
    [*((id *)v12 + 2) unregister:*((void *)v12 + 1) forNotification:5];
  }
  long long v13 = self->fOdometerClient.__ptr_.__value_;
  if (v13)
  {
    [*((id *)v13 + 2) unregister:*((void *)v13 + 1) forNotification:4];
    long long v14 = self->fOdometerClient.__ptr_.__value_;
    self->fOdometerClient.__ptr_.__value_ = 0;
    if (v14) {
      (*(void (**)(Client *))(*(void *)v14 + 8))(v14);
    }
  }
  long long v15 = self->fMotionStateMediatorClient.__ptr_.__value_;
  if (v15)
  {
    [*((id *)v15 + 2) unregister:*((void *)v15 + 1) forNotification:2];
    long long v16 = self->fMotionStateMediatorClient.__ptr_.__value_;
    self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
    if (v16) {
      (*(void (**)(Client *))(*(void *)v16 + 8))(v16);
    }
  }
  uint64_t v17 = self->fWifiClient.__ptr_.__value_;
  if (v17)
  {
    [*((id *)v17 + 2) unregister:*((void *)v17 + 1) forNotification:3];
    v18 = self->fWifiClient.__ptr_.__value_;
    self->fWifiClient.__ptr_.__value_ = 0;
    if (v18) {
      (*(void (**)(Client *))(*(void *)v18 + 8))(v18);
    }
  }
  long long v19 = self->fSignalEnvironmentClient.__ptr_.__value_;
  if (v19)
  {
    [*((id *)v19 + 2) unregister:*((void *)v19 + 1) forNotification:0];
    long long v20 = self->fSignalEnvironmentClient.__ptr_.__value_;
    self->fSignalEnvironmentClient.__ptr_.__value_ = 0;
    if (v20) {
      (*(void (**)(Client *))(*(void *)v20 + 8))(v20);
    }
  }
  long long v21 = self->fGnssAvailabilityPredictorClient.__ptr_.__value_;
  if (v21)
  {
    [*((id *)v21 + 2) unregister:*((void *)v21 + 1) forNotification:36];
    uint64_t v22 = self->fGnssAvailabilityPredictorClient.__ptr_.__value_;
    self->fGnssAvailabilityPredictorClient.__ptr_.__value_ = 0;
    if (v22) {
      (*(void (**)(Client *))(*(void *)v22 + 8))(v22);
    }
  }
  v23 = self->fGnssLeechLocationClient.__ptr_.__value_;
  if (v23)
  {
    [*((id *)v23 + 2) unregister:*((void *)v23 + 1) forNotification:5];
    v24 = self->fGnssAvailabilityPredictorClient.__ptr_.__value_;
    self->fGnssAvailabilityPredictorClient.__ptr_.__value_ = 0;
    if (v24)
    {
      v25 = *(void (**)(void))(*(void *)v24 + 8);
      v25();
    }
  }
}

- (void)registerForUpdates:(id)a3
{
  v4 = [(CLOutdoorService *)self clients];

  [(NSMutableSet *)v4 addObject:a3];
}

- (void)unregisterForUpdates:(id)a3
{
  v4 = [(CLOutdoorService *)self clients];

  [(NSMutableSet *)v4 removeObject:a3];
}

- (void)pause
{
  if ([(CLOutdoorService *)self manager])
  {
    uint64_t v3 = [(CLOutdoorService *)self manager];
    sub_100EDFF5C(v3);
  }
}

- (void)resume
{
  if ([(CLOutdoorService *)self manager])
  {
    uint64_t v3 = [(CLOutdoorService *)self manager];
    sub_100EE00F8(v3);
  }
}

- (void)bringupManager
{
  if (![(CLOutdoorService *)self manager])
  {
    if (qword_1024194F0 != -1) {
      dispatch_once(&qword_1024194F0, &stru_102302368);
    }
    uint64_t v3 = qword_1024194F8;
    if (os_log_type_enabled((os_log_t)qword_1024194F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Bringing up manager", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194F0 != -1) {
        dispatch_once(&qword_1024194F0, &stru_102302368);
      }
      v4 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLOutdoorService bringupManager]", "%s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
    [(CLOutdoorService *)self setupManager];
    [(CLOutdoorService *)self registerForAlgorithmSources];
  }
}

- (void)teardownManager
{
  if ([(CLOutdoorService *)self manager])
  {
    if (qword_1024194F0 != -1) {
      dispatch_once(&qword_1024194F0, &stru_102302368);
    }
    uint64_t v3 = qword_1024194F8;
    if (os_log_type_enabled((os_log_t)qword_1024194F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Tearing down manager", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194F0 != -1) {
        dispatch_once(&qword_1024194F0, &stru_102302368);
      }
      uint64_t v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLOutdoorService teardownManager]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
    [(CLOutdoorService *)self unregisterForAlgorithmSources];
    v4 = [(CLOutdoorService *)self manager];
    if (v4)
    {
      sub_100EE9470((uint64_t)v4);
      operator delete();
    }
    [(CLOutdoorService *)self setManager:0];
  }
}

- (BOOL)shouldRunManager
{
  return !self->fBatterySaverModeEnabled
      && self->fLocationServicesEnabled
      && self->fFitnessTrackingEnabled
      && !self->fBedtimeSleepModeEnabled;
}

- (void)toggleManagerBySettingFlag:(BOOL *)a3 toState:(BOOL)a4
{
  *a3 = a4;
  if ([(CLOutdoorService *)self shouldRunManager])
  {
    [(CLOutdoorService *)self bringupManager];
  }
  else
  {
    [(CLOutdoorService *)self teardownManager];
  }
}

- (void)updateLocationAuthorization
{
  fClientAuthorizationCache = self->fClientAuthorizationCache;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100EE8050;
  v3[3] = &unk_1023022D8;
  v3[4] = self;
  [(CLClientAuthorizationCacheProtocol *)fClientAuthorizationCache getAuthorizationContextOfNonZonalClient:+[NSString stringWithUTF8String:"com.apple.locationd.bundle-/System/Library/LocationBundles/MotionCalibration.bundle"] withReply:v3];
}

- (void)onOldMotionCoprocessorData:(const void *)a3
{
  [self universe].silo
  if ([(CLOutdoorService *)self manager])
  {
    uint64_t v5 = [(CLOutdoorService *)self manager];
    sub_10002FC4C(v5, (uint64_t)a3);
  }
}

- (void)onOdometerNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [self universe].silo
  if (*a3 == 4 && [(CLOutdoorService *)self manager])
  {
    unsigned int v7 = [(CLOutdoorService *)self manager];
    sub_100EE0290((uint64_t)v7, (long long *)a4);
  }
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [self universe:a3, a4, a5, a6, a7].silo;
  if (*a3 == 2 && [(CLOutdoorService *)self manager])
  {
    long long v10 = [(CLOutdoorService *)self manager];
    sub_100EE08A0((uint64_t)v10, (uint64_t *)a4);
  }
}

- (void)onWifiNotification:(const int *)a3 data:(const void *)a4
{
  [[-[CLOutdoorService universe](self, "universe") silo];
  if (*a3 == 3)
  {
    if ([(CLOutdoorService *)self manager])
    {
      uint64_t v7 = *((void *)a4 + 13);
      memset(v8, 0, sizeof(v8));
      sub_1000DA6E8(v8, *((void *)a4 + 14), *((void *)a4 + 15), 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*((void *)a4 + 15) - *((void *)a4 + 14)) >> 3));
      sub_100EE0298((uint64_t)[(CLOutdoorService *)self manager], &v7);
      v9 = (void **)v8;
      sub_1000D7F78(&v9);
    }
  }
}

- (void)onSignalEnvironmentNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [self universe].silo
  if (!*a3 && [(CLOutdoorService *)self manager])
  {
    uint64_t v7 = [(CLOutdoorService *)self manager];
    sub_100EE06C4((uint64_t)v7, (int *)a4);
  }
}

- (void)onGnssLeechLocationNotification:(const int *)a3 data:(const void *)a4
{
  [self universe].silo
  if (*a3 == 5 && [(CLOutdoorService *)self manager])
  {
    *(_OWORD *)__p = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
    if (sub_100C287B0((uint64_t)a4, (uint64_t)&v7)) {
      sub_100EE02B0((uint64_t)[(CLOutdoorService *)self manager], (uint64_t)&v7);
    }
    if (__p[1])
    {
      *(void **)&long long v9 = __p[1];
      operator delete(__p[1]);
    }
  }
}

- (void)onBacklightStateNotification:(const int *)a3 data:(const void *)a4
{
  [[-[CLOutdoorService universe](self, "universe") silo];
  if (*a3 == 1)
  {
    if (qword_1024194F0 != -1) {
      dispatch_once(&qword_1024194F0, &stru_102302368);
    }
    long long v7 = qword_1024194F8;
    if (os_log_type_enabled((os_log_t)qword_1024194F8, OS_LOG_TYPE_INFO))
    {
      int v8 = *((unsigned __int8 *)a4 + 56);
      *(_DWORD *)buf = 67109120;
      int v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "AlwaysOn enablement change, isAlwaysOnEnabled, %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194F0 != -1) {
        dispatch_once(&qword_1024194F0, &stru_102302368);
      }
      long long v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLOutdoorService onBacklightStateNotification:data:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    value = (uint64_t *)self->fAlsCollector.__ptr_.__value_;
    if (value) {
      sub_10087DEA8(value);
    }
  }
}

- (void)onDaemonStatusNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [self universe].silo
  if (*a3 == 15)
  {
    if (qword_1024194F0 != -1) {
      dispatch_once(&qword_1024194F0, &stru_102302368);
    }
    long long v7 = qword_1024194F8;
    if (os_log_type_enabled((os_log_t)qword_1024194F8, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *(unsigned char *)a4;
      *(_DWORD *)buf = 67109376;
      int v11 = v8;
      __int16 v12 = 1024;
      BOOL v13 = [(CLOutdoorService *)self manager] == 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Low power mode toggled, isBatterySaverModeEnabled, %d, isManagerNil, %d", buf, 0xEu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194F0 != -1) {
        dispatch_once(&qword_1024194F0, &stru_102302368);
      }
      [(CLOutdoorService *)self manager];
      long long v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLOutdoorService onDaemonStatusNotification:data:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    [(CLOutdoorService *)self toggleManagerBySettingFlag:&self->fBatterySaverModeEnabled toState:*(unsigned char *)a4];
  }
}

- (void)onFitnessTrackingNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [self.universe silo];
  if (*a3) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = *((unsigned char *)a4 + 3) == 0;
  }
  uint64_t v8 = !v7;
  if (qword_1024194F0 != -1) {
    dispatch_once(&qword_1024194F0, &stru_102302368);
  }
  long long v9 = qword_1024194F8;
  if (os_log_type_enabled((os_log_t)qword_1024194F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    int v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received fitness tracking update, enabled %{public}d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194F0 != -1) {
      dispatch_once(&qword_1024194F0, &stru_102302368);
    }
    long long v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLOutdoorService onFitnessTrackingNotification:data:]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  [(CLOutdoorService *)self toggleManagerBySettingFlag:&self->fFitnessTrackingEnabled toState:v8];
}

- (void)registerForHKNanoLifestylePrivacyPreferencesChangedNotification
{
  if (qword_1024822D0 != -1) {
    dispatch_once(&qword_1024822D0, &stru_102302388);
  }
  if (qword_1024822D8 && off_1024753B8[0]())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef v4 = (const __CFString *)off_1024753B8[0]();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100EE8C34, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void)unregisterForHKNanoLifestylePrivacyPreferencesChangedNotification
{
  if (qword_1024822D0 != -1) {
    dispatch_once(&qword_1024822D0, &stru_102302388);
  }
  if (qword_1024822D8 && off_1024753B8[0]())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef v4 = (const __CFString *)off_1024753B8[0]();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);
  }
}

- (void)onHKPrivacyPreferencesEnableDaylightTime:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CLOutdoorService *)self manager])
  {
    uint64_t v5 = [(CLOutdoorService *)self manager];
    sub_100EE0AD0((uint64_t)v5, v3);
  }
}

- (void)onBiomeUserFocusSleepModeEvent:(id)a3
{
  if (qword_1024194F0 != -1) {
    dispatch_once(&qword_1024194F0, &stru_102302368);
  }
  uint64_t v5 = qword_1024194F8;
  if (os_log_type_enabled((os_log_t)qword_1024194F8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v8 = (int)[a3 state];
    __int16 v9 = 2048;
    uint64_t v10 = (int)[a3 changeReason];
    __int16 v11 = 2112;
    id v12 = [a3 expectedEndDate];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Biome UserFocusSleepMode, state, %ld, changeReason, %ld, expectedEndDate, %@", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194F0 != -1) {
      dispatch_once(&qword_1024194F0, &stru_102302368);
    }
    [a3 state];
    [a3 changeReason];
    [a3 expectedEndDate];
    id v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLOutdoorService onBiomeUserFocusSleepModeEvent:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  -[CLOutdoorService toggleManagerBySettingFlag:toState:](self, "toggleManagerBySettingFlag:toState:", &self->fBedtimeSleepModeEnabled, [a3 state] == 3);
}

- (void)setClients:(id)a3
{
}

- (CLOutdoorManagerCallbackAdapter)callbackAdapter
{
  return self->_callbackAdapter;
}

- (void)setCallbackAdapter:(CLOutdoorManagerCallbackAdapter *)a3
{
  self->_callbackAdapter = a3;
}

- (void)setManager:(void *)a3
{
  self->_manager = a3;
}

- (void).cxx_destruct
{
  value = self->fFitnessTrackingClient.__ptr_.__value_;
  self->fFitnessTrackingClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  CFStringRef v4 = self->fDaemonStatusClient.__ptr_.__value_;
  self->fDaemonStatusClient.__ptr_.__value_ = 0;
  if (v4) {
    (*(void (**)(Client *, SEL))(*(void *)v4 + 8))(v4, a2);
  }
  uint64_t v5 = self->fBLSClient.__ptr_.__value_;
  self->fBLSClient.__ptr_.__value_ = 0;
  if (v5) {
    (*(void (**)(Client *, SEL))(*(void *)v5 + 8))(v5, a2);
  }
  id v6 = self->fGnssLeechLocationClient.__ptr_.__value_;
  self->fGnssLeechLocationClient.__ptr_.__value_ = 0;
  if (v6) {
    (*(void (**)(Client *, SEL))(*(void *)v6 + 8))(v6, a2);
  }
  BOOL v7 = self->fGnssAvailabilityPredictorClient.__ptr_.__value_;
  self->fGnssAvailabilityPredictorClient.__ptr_.__value_ = 0;
  if (v7) {
    (*(void (**)(Client *, SEL))(*(void *)v7 + 8))(v7, a2);
  }
  uint64_t v8 = self->fSignalEnvironmentClient.__ptr_.__value_;
  self->fSignalEnvironmentClient.__ptr_.__value_ = 0;
  if (v8) {
    (*(void (**)(Client *, SEL))(*(void *)v8 + 8))(v8, a2);
  }
  __int16 v9 = self->fWifiClient.__ptr_.__value_;
  self->fWifiClient.__ptr_.__value_ = 0;
  if (v9) {
    (*(void (**)(Client *, SEL))(*(void *)v9 + 8))(v9, a2);
  }
  uint64_t v10 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  if (v10) {
    (*(void (**)(Client *, SEL))(*(void *)v10 + 8))(v10, a2);
  }
  __int16 v11 = self->fOdometerClient.__ptr_.__value_;
  self->fOdometerClient.__ptr_.__value_ = 0;
  if (v11) {
    (*(void (**)(Client *, SEL))(*(void *)v11 + 8))(v11, a2);
  }
  id v12 = self->fServiceLocationClient.__ptr_.__value_;
  self->fServiceLocationClient.__ptr_.__value_ = 0;
  if (v12) {
    (*(void (**)(Client *, SEL))(*(void *)v12 + 8))(v12, a2);
  }
  BOOL v13 = self->fServiceLocationProvider.__ptr_.__value_;
  self->fServiceLocationProvider.__ptr_.__value_ = 0;
  if (v13) {
    (*(void (**)(CLServiceLocationProvider *, SEL))(*(void *)v13 + 8))(v13, a2);
  }
  long long v14 = self->fStepCountClient.__ptr_.__value_;
  self->fStepCountClient.__ptr_.__value_ = 0;
  if (v14) {
    (*(void (**)(Client *, SEL))(*(void *)v14 + 8))(v14, a2);
  }
  sub_100EE6B14((uint64_t **)&self->fAlsCollector, 0);
  long long v15 = self->fOldMotionCoprocessorDispatcher.__ptr_.__value_;
  self->fOldMotionCoprocessorDispatcher.__ptr_.__value_ = 0;
  if (v15) {
    (*(void (**)(Dispatcher *))(*(void *)v15 + 8))(v15);
  }
  long long v16 = self->fMotionStateCoprocessorDispatcher.__ptr_.__value_;
  self->fMotionStateCoprocessorDispatcher.__ptr_.__value_ = 0;
  if (v16)
  {
    uint64_t v17 = *(void (**)(void))(*(void *)v16 + 8);
    v17();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  return self;
}

@end