@interface CLSmootherMonitor
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)diminishedMode;
- (BOOL)isLocationUsefulForSmoothing:(int)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)updating;
- (BOOL)visitMonitorWakeTimerEnabled;
- (BOOL)wifiPowerEnabled;
- (CLSmootherMonitor)init;
- (NSDate)lastUpdateVisitMonitorWakeTimerDate;
- (NSMutableDictionary)scenarioTriggerClients;
- (NSMutableSet)visitClients;
- (NSXPCConnection)connection;
- (NSXPCListener)listener;
- (void)beginService;
- (void)dealloc;
- (void)endService;
- (void)fetchBackgroundInertialOdometrySamplesWithStartTime:(double)a3 endTime:(double)a4 intervalIndex:(unsigned int)a5 completionBlock:(id)a6;
- (void)fetchLocationsWithStartTime:(double)a3 endTime:(double)a4 intervalIndex:(unsigned int)a5 locationArray:(id)a6 completionBlock:(id)a7;
- (void)onCompanionNotification:(int)a3 data:(char *)a4;
- (void)onDaemonStatusNotification:(int)a3 data:(uint64_t)a4;
- (void)onTelephonyNotification:(int)a3 data:(void *)a4;
- (void)registerForCompanionNotification;
- (void)registerForDaemonStatusNotification;
- (void)registerForTelephonyNotification;
- (void)setConnection:(id)a3;
- (void)setDiminishedMode:(BOOL)a3;
- (void)setLastUpdateVisitMonitorWakeTimerDate:(id)a3;
- (void)setListener:(id)a3;
- (void)setScenarioTriggerClients:(id)a3;
- (void)setUpdating:(BOOL)a3;
- (void)setVisitClients:(id)a3;
- (void)setVisitMonitorWakeTimerEnabled:(BOOL)a3;
- (void)setWifiPowerEnabled:(BOOL)a3;
- (void)smoothLocations:(id)a3 workoutActivity:(int)a4 shouldReconstructRoute:(BOOL)a5 handler:(id)a6;
- (void)smoothLocations:(id)a3 workoutActivity:(int)a4 shouldReconstructRoute:(BOOL)a5 timeIntervalsThatNeedPopulated:(id)a6 handler:(id)a7;
- (void)smoothLocationsInternal:(void *)a3 workoutActivity:(int)a4 shouldReconstructRoute:(BOOL)a5 intervalEpochsVector:(void *)a6 handler:(id)a7;
- (void)unregisterForCompanionNotification;
- (void)unregisterForDaemonStatusNotification;
- (void)unregisterForTelephonyNotification;
@end

@implementation CLSmootherMonitor

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
  if (qword_102488860 != -1) {
    dispatch_once(&qword_102488860, &stru_10232D460);
  }
  return (id)qword_102488858;
}

- (CLSmootherMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)CLSmootherMonitor;
  v2 = [(CLSmootherMonitor *)&v7 initWithInboundProtocol:&OBJC_PROTOCOL___CLSmootherMonitorServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLSmootherMonitorClientProtocol];
  if (v2)
  {
    uint64_t v3 = qword_10248D7B0;
    qword_10248D7B0 = 0;
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
    }
    uint64_t v4 = qword_10248D7B8;
    qword_10248D7B8 = 0;
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
    }
    uint64_t v5 = qword_10248D7C0;
    qword_10248D7C0 = 0;
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
    }
    byte_10248D800 = 0;
    byte_10248D801 = 0;
    byte_10248D802 = 0;
  }
  return v2;
}

- (void)beginService
{
  if (qword_102419410 != -1) {
    dispatch_once(&qword_102419410, &stru_10232D630);
  }
  uint64_t v3 = qword_102419418;
  if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLRS,beginService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419410 != -1) {
      dispatch_once(&qword_102419410, &stru_10232D630);
    }
    objc_super v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSmootherMonitor beginService]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  uint64_t v4 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.locationd.smoother"];
  self->_listener = v4;
  -[NSXPCListener _setQueue:](v4, "_setQueue:", [CLSmootherMonitor silo](self, "silo").queue);
  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener resume];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.locationd.smoother", 0, 0, 1u);
  [(CLSmootherMonitor *)self registerForCompanionNotification];
  [(CLSmootherMonitor *)self registerForDaemonStatusNotification];
  [(CLSmootherMonitor *)self registerForTelephonyNotification];
  self->_smootherMonitorRoutineAdapter = objc_alloc_init(CLSmootherMonitorRoutineAdapter);
  v6 = (CLRoutineMonitorServiceProtocol *)[[-[CLSmootherMonitor universe](self, "universe") vendor] proxyForService:@"CLRoutineMonitor"];
  self->_routineMonitor = v6;
  -[CLRoutineMonitorServiceProtocol registerDelegate:inSilo:](v6, "registerDelegate:inSilo:", self->_smootherMonitorRoutineAdapter, [self universe] ->silo);
}

- (void)endService
{
  if (qword_102419410 != -1) {
    dispatch_once(&qword_102419410, &stru_10232D630);
  }
  uint64_t v3 = qword_102419418;
  if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLRS,endService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419410 != -1) {
      dispatch_once(&qword_102419410, &stru_10232D630);
    }
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSmootherMonitor endService]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  [(NSXPCConnection *)[(CLSmootherMonitor *)self connection] invalidate];
  [(CLSmootherMonitor *)self setConnection:0];
  [(NSXPCListener *)[(CLSmootherMonitor *)self listener] invalidate];
  [(CLSmootherMonitor *)self setListener:0];
  [(CLSmootherMonitor *)self unregisterForCompanionNotification];
  [(CLSmootherMonitor *)self unregisterForDaemonStatusNotification];
  [(CLSmootherMonitor *)self unregisterForTelephonyNotification];
  routineMonitor = self->_routineMonitor;
  if (routineMonitor) {

  }
  self->_routineMonitor = 0;
  smootherMonitorRoutineAdapter = self->_smootherMonitorRoutineAdapter;
  if (smootherMonitorRoutineAdapter)
  {
    [(CLSmootherMonitorRoutineAdapter *)smootherMonitorRoutineAdapter invalidate];
  }
  self->_smootherMonitorRoutineAdapter = 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CLSmootherMonitor;
  [(CLSmootherMonitor *)&v2 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  if (qword_102419410 != -1) {
    dispatch_once(&qword_102419410, &stru_10232D630);
  }
  v6 = qword_102419418;
  if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "CLRS,shouldAcceptNewConnection", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419410 != -1) {
      dispatch_once(&qword_102419410, &stru_10232D630);
    }
    LOWORD(__p) = 0;
    v27 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSmootherMonitor listener:shouldAcceptNewConnection:]", "%s\n", v27);
    if (v27 != (char *)buf) {
      free(v27);
    }
  }
  [(CLSmootherMonitor *)self silo];
  if (qword_102419410 != -1) {
    dispatch_once(&qword_102419410, &stru_10232D630);
  }
  objc_super v7 = qword_102419418;
  if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLRS,LocationServer received incoming connection", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419410 != -1) {
      dispatch_once(&qword_102419410, &stru_10232D630);
    }
    LOWORD(__p) = 0;
    v28 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSmootherMonitor listener:shouldAcceptNewConnection:]", "%s\n", v28);
    if (v28 != (char *)buf) {
      free(v28);
    }
  }
  if (a4)
  {
    id v8 = [a4 valueForEntitlement:@"com.apple.locationd.smoother"];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && ([v8 BOOLValue])
      {
        [a4 setExportedInterface:+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CLLocationSmootherServerInterface)];
        [a4 setExportedObject:self];
        id v9 = [a4 exportedInterface];
        uint64_t v10 = objc_opt_class();
        [v9 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0) forSelector:@"smoothLocations:workoutActivity:shouldReconstructRoute:handler:" argumentIndex:0 ofReply:0];
        id v11 = [a4 exportedInterface];
        uint64_t v12 = objc_opt_class();
        [v11 setClasses:[+[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(), 0)] forSelector:@"smoothLocations:workoutActivity:shouldReconstructRoute:handler:" argumentIndex:0 ofReply:1];
        id v13 = [a4 exportedInterface];
        uint64_t v14 = objc_opt_class();
        [v13 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, objc_opt_class(), 0) forSelector:@"smoothLocations:workoutActivity:shouldReconstructRoute:timeIntervalsThatNeedPopulated:handler:" argumentIndex:0 ofReply:0];
        id v15 = [a4 exportedInterface];
        uint64_t v16 = objc_opt_class();
        [v15 setClasses:[+[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, objc_opt_class(), 0)] forSelector:@"smoothLocations:workoutActivity:shouldReconstructRoute:timeIntervalsThatNeedPopulated:handler:" argumentIndex:3 ofReply:0];
        id v17 = [a4 exportedInterface];
        uint64_t v18 = objc_opt_class();
        [v17 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v18, objc_opt_class(), 0) forSelector:@"smoothLocations:workoutActivity:shouldReconstructRoute:timeIntervalsThatNeedPopulated:handler:" argumentIndex:0 ofReply:1];
        [a4 setRemoteObjectInterface:+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CLLocationSmootherClientInterface)];
        [a4 _setQueue:[-[CLSmootherMonitor silo](self, "silo") queue]];
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_10155A2D0;
        v31[3] = &unk_10229FED8;
        v31[4] = self;
        [a4 setInterruptionHandler:v31];
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_10155A484;
        v30[3] = &unk_10229FED8;
        v30[4] = self;
        [a4 setInvalidationHandler:v30];
        [(CLSmootherMonitor *)self setConnection:a4];
        [(NSXPCConnection *)[(CLSmootherMonitor *)self connection] resume];
        LOBYTE(v19) = 1;
        return v19;
      }
    }
    if (qword_102419410 != -1) {
      dispatch_once(&qword_102419410, &stru_10232D630);
    }
    v20 = qword_102419418;
    if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_FAULT))
    {
      unsigned int v21 = [a4 processIdentifier];
      [a4 auditToken];
      sub_1000B73FC();
      v22 = v33 >= 0 ? &__p : (void **)__p;
      *(_DWORD *)v34 = 67240450;
      *(_DWORD *)&v34[4] = v21;
      __int16 v35 = 2082;
      v36 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "CLRS,process is not entitled to use CLLocationSmoother, pid, %{public}d, executable, %{public}s", v34, 0x12u);
      if (v33 < 0) {
        operator delete(__p);
      }
    }
    BOOL v19 = sub_10013D1A0(115, 0);
    if (v19)
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419410 != -1) {
        dispatch_once(&qword_102419410, &stru_10232D630);
      }
      unsigned int v23 = [a4 processIdentifier];
      [a4 auditToken];
      sub_1000B73FC();
      if (v37 >= 0) {
        v24 = v34;
      }
      else {
        v24 = *(uint8_t **)v34;
      }
      int v38 = 67240450;
      unsigned int v39 = v23;
      __int16 v40 = 2082;
      v41 = v24;
      v25 = (char *)_os_log_send_and_compose_impl();
      if (v37 < 0) {
        operator delete(*(void **)v34);
      }
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLSmootherMonitor listener:shouldAcceptNewConnection:]", "%s\n", v25);
      if (v25 == (char *)buf) {
        goto LABEL_34;
      }
      goto LABEL_33;
    }
  }
  else
  {
    if (qword_102419410 != -1) {
      dispatch_once(&qword_102419410, &stru_10232D630);
    }
    v26 = qword_102419418;
    if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "CLRS,Why didn't we get a connection?", buf, 2u);
    }
    BOOL v19 = sub_10013D1A0(115, 0);
    if (v19)
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419410 != -1) {
        dispatch_once(&qword_102419410, &stru_10232D630);
      }
      LOWORD(__p) = 0;
      v25 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLSmootherMonitor listener:shouldAcceptNewConnection:]", "%s\n", v25);
      if (v25 == (char *)buf) {
        goto LABEL_34;
      }
LABEL_33:
      free(v25);
LABEL_34:
      LOBYTE(v19) = 0;
    }
  }
  return v19;
}

- (void)smoothLocationsInternal:(void *)a3 workoutActivity:(int)a4 shouldReconstructRoute:(BOOL)a5 intervalEpochsVector:(void *)a6 handler:(id)a7
{
  if (byte_10248D802) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = byte_10248D800 == 0;
  }
  BOOL v10 = v9 && byte_10248D801 == 0;
  BOOL v12 = a5;
  if (v10)
  {
    sub_100103240();
    unsigned int v13 = sub_10010145C() ^ 1;
  }
  else
  {
    unsigned int v13 = 1;
  }
  sub_1000C7F88(buf);
  v45[0] = 0;
  if (sub_1000D2988(*(uint64_t *)buf, "CLRSNetworkAccessAllowed", v45)) {
    unsigned int v13 = v45[0];
  }
  if (*(void *)v52) {
    sub_1000DB0A0(*(std::__shared_weak_count **)v52);
  }
  if (qword_102419410 != -1) {
    dispatch_once(&qword_102419410, &stru_10232D630);
  }
  uint64_t v14 = qword_102419418;
  if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = byte_10248D802;
    int v16 = byte_10248D801;
    int v17 = byte_10248D800;
    sub_100103240();
    int v18 = sub_10010145C();
    *(_DWORD *)buf = 68290306;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v52 = 2082;
    *(void *)&v52[2] = "";
    __int16 v53 = 1026;
    int v54 = v15;
    __int16 v55 = 1026;
    int v56 = v16;
    __int16 v57 = 1026;
    int v58 = v17;
    __int16 v59 = 1026;
    int v60 = v18;
    __int16 v61 = 1026;
    unsigned int v62 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLRS\", \"isCompanionConnected\":%{public}d, \"hasActiveCellConnection\":%{public}d, \"hasLargeReachability\":%{public}d, \"isWatch\":%{public}d, \"networkAccessAllowed\":%{public}d}", buf, 0x30u);
  }
  sub_101171D90((uint64_t)v45);
  uint64_t v46 = 0x101010001;
  int v47 = 65537;
  char v48 = 1;
  char v49 = 0;
  char v50 = 0;
  __p = 0;
  v43 = 0;
  uint64_t v44 = 0;
  uint64_t v19 = sub_100817950(v45, (uint64_t)[objc_msgSend(-[CLSmootherMonitor universe](self, "universe"), "silo") queue], (uint64_t)a3, &__p, a4, v12, v13, (id **)a6);
  v20 = *(void **)a3;
  *((void *)a3 + 1) = 0;
  *((void *)a3 + 2) = 0;
  *(void *)a3 = 0;
  if (v20) {
    operator delete(v20);
  }
  if (v19)
  {
    (*((void (**)(id, NSArray *, NSError *))a7 + 2))(a7, +[NSArray array](NSArray, "array"), +[NSError errorWithDomain:@"CLSmootherErrorDomain" code:v19 userInfo:0]);
  }
  else
  {
    id v21 = objc_alloc((Class)NSMutableArray);
    id v22 = [v21 initWithCapacity:0x6F96F96F96F96F97 * ((v43 - (unsigned char *)__p) >> 2)];
    unsigned int v23 = __p;
    v24 = v43;
    if (__p != v43)
    {
      do
      {
        id v25 = objc_alloc((Class)CLLocation);
        long long v26 = v23[1];
        v40[0] = *v23;
        v40[1] = v26;
        long long v27 = v23[2];
        long long v28 = v23[3];
        long long v29 = v23[5];
        v40[4] = v23[4];
        v40[5] = v29;
        v40[2] = v27;
        v40[3] = v28;
        long long v30 = v23[6];
        long long v31 = v23[7];
        long long v32 = v23[8];
        *(_OWORD *)&v41[12] = *(_OWORD *)((char *)v23 + 140);
        v40[7] = v31;
        *(_OWORD *)v41 = v32;
        v40[6] = v30;
        id v33 = [v25 initWithClientLocation:v40];
        [v22 addObject:v33];

        unsigned int v23 = (_OWORD *)((char *)v23 + 156);
      }
      while (v23 != v24);
    }
    (*((void (**)(id, id, void))a7 + 2))(a7, v22, 0);
  }
  if (qword_102419410 != -1) {
    dispatch_once(&qword_102419410, &stru_10232D630);
  }
  v34 = qword_102419418;
  if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "CLRS,Releasing held memory and OSTransaction", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419410 != -1) {
      dispatch_once(&qword_102419410, &stru_10232D630);
    }
    char v37 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSmootherMonitor smoothLocationsInternal:workoutActivity:shouldReconstructRoute:intervalEpochsVector:handler:]", "%s\n", v37);
    if (v37 != (char *)buf) {
      free(v37);
    }
  }
  __int16 v35 = (id *)qword_10248D7E8;
  uint64_t v36 = qword_10248D7F0;
  if (qword_10248D7E8 != qword_10248D7F0)
  {
    do
    {

      v35[1] = 0;
      *__int16 v35 = 0;
      v35 += 2;
    }
    while (v35 != (id *)v36);
    __int16 v35 = (id *)qword_10248D7E8;
  }
  qword_10248D7F0 = (uint64_t)v35;
  sub_100DEE0B0(qword_10248D7C8);
  if (__p)
  {
    v43 = __p;
    operator delete(__p);
  }
}

- (void)smoothLocations:(id)a3 workoutActivity:(int)a4 shouldReconstructRoute:(BOOL)a5 handler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  [CLSmootherMonitor universe:self silo];

  [(CLSmootherMonitor *)self smoothLocations:a3 workoutActivity:v8 shouldReconstructRoute:v7 timeIntervalsThatNeedPopulated:0 handler:a6];
}

- (void)smoothLocations:(id)a3 workoutActivity:(int)a4 shouldReconstructRoute:(BOOL)a5 timeIntervalsThatNeedPopulated:(id)a6 handler:(id)a7
{
  BOOL v9 = a5;
  id v11 = self;
  [-[CLSmootherMonitor universe](self, "universe") silo];
  if (sub_10015F760())
  {
    sub_100DEE0E4((uint64_t)qword_10248D7C8);
    id v53 = a7;
    obj = (NSArray *)a6;
    if (qword_102419410 != -1) {
      dispatch_once(&qword_102419410, &stru_10232D630);
    }
    BOOL v12 = qword_102419418;
    if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        unsigned int v13 = [a3 count];
      }
      else {
        unsigned int v13 = -1;
      }
      if (a6) {
        unsigned int v14 = [a6 count];
      }
      else {
        unsigned int v14 = -1;
      }
      *(_DWORD *)buf = 67240960;
      *(_DWORD *)&buf[4] = v13;
      *(_WORD *)&uint8_t buf[8] = 1026;
      *(_DWORD *)&buf[10] = a4;
      *(_WORD *)&buf[14] = 1026;
      LODWORD(v105) = v9;
      WORD2(v105) = 1026;
      *(_DWORD *)((char *)&v105 + 6) = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CLRS,smoothLocations,locations,size,%{public}d,workoutActivity,%{public}d,shouldReconstructRoute,%{public}d,timeIntervalsThatNeedPopulated,size,%{public}d", buf, 0x1Au);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419410 != -1) {
        dispatch_once(&qword_102419410, &stru_10232D630);
      }
      if (a3) {
        unsigned int v48 = [a3 count];
      }
      else {
        unsigned int v48 = -1;
      }
      if (a6) {
        unsigned int v49 = [a6 count];
      }
      else {
        unsigned int v49 = -1;
      }
      LODWORD(v98) = 67240960;
      HIDWORD(v98) = v48;
      LOWORD(v99) = 1026;
      *(_DWORD *)((char *)&v99 + 2) = a4;
      HIWORD(v99) = 1026;
      LODWORD(v100) = v9;
      WORD2(v100) = 1026;
      *(_DWORD *)((char *)&v100 + 6) = v49;
      char v50 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSmootherMonitor smoothLocations:workoutActivity:shouldReconstructRoute:timeIntervalsThatNeedPopulated:handler:]", "%s\n", v50);
      if (v50 != (char *)buf) {
        free(v50);
      }
    }
    __int16 v59 = v11;
    if ((atomic_load_explicit((atomic_uchar *volatile)qword_102488870, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(qword_102488870))
    {
      sub_1000C7F88(buf);
      LOBYTE(v98) = 0;
      char v51 = sub_1000D2988(*(uint64_t *)buf, "ForceCreateAutoStartIntervalUsingFullRoute", (BOOL *)&v98);
      if ((_BYTE)v98) {
        char v52 = v51;
      }
      else {
        char v52 = 0;
      }
      if (*(void *)&buf[8]) {
        sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
      }
      byte_102488868 = v52;
      __cxa_guard_release(qword_102488870);
    }
    if (byte_102488868) {
      unint64_t v15 = 1;
    }
    else {
      unint64_t v15 = (unint64_t)[a3 count];
    }
    uint64_t v98 = 0;
    v99 = &v98;
    *(void *)&long long v100 = 0x4812000000;
    *((void *)&v100 + 1) = sub_100178008;
    v101 = sub_10017775C;
    v102 = "";
    sub_1008297D4(v103, v15);
    if (byte_102488868)
    {
      id v16 = [a3 objectAtIndexedSubscript:[a3 count] - 1];
      if (v16)
      {
        [v16 clientLocation];
      }
      else
      {
        memset(v111, 0, sizeof(v111));
        long long v110 = 0u;
        long long v109 = 0u;
        memset(v108, 0, sizeof(v108));
        *(_OWORD *)v107 = 0u;
        long long v106 = 0u;
        *(_OWORD *)buf = 0u;
        long long v105 = 0u;
      }
      sub_1008238C8((uint64_t)buf, v99[6]);
    }
    else
    {
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id v17 = [a3 countByEnumeratingWithState:&v92 objects:v97 count:16];
      if (v17)
      {
        uint64_t v18 = 0;
        uint64_t v19 = *(void *)v93;
        do
        {
          v20 = 0;
          uint64_t v21 = 112 * v18;
          do
          {
            if (*(void *)v93 != v19) {
              objc_enumerationMutation(a3);
            }
            id v22 = *(void **)(*((void *)&v92 + 1) + 8 * (void)v20);
            if (v22)
            {
              [v22 clientLocation];
            }
            else
            {
              memset(v111, 0, sizeof(v111));
              long long v110 = 0u;
              long long v109 = 0u;
              memset(v108, 0, sizeof(v108));
              *(_OWORD *)v107 = 0u;
              long long v106 = 0u;
              *(_OWORD *)buf = 0u;
              long long v105 = 0u;
            }
            double v23 = sub_1008238C8((uint64_t)buf, v99[6] + v21);
            v20 = (char *)v20 + 1;
            v21 += 112;
          }
          while (v17 != v20);
          id v17 = [a3 countByEnumeratingWithState:&v92 objects:v97 count:16];
          v18 += (uint64_t)v20;
        }
        while (v17);
      }
    }
    BOOL v25 = v9;
    if (byte_102488868)
    {
      id v26 = [a3 objectAtIndexedSubscript:0];
      if (v26)
      {
        [v26 clientLocation];
        double v27 = *(double *)((char *)v108 + 12);
      }
      else
      {
        memset(v111, 0, sizeof(v111));
        long long v110 = 0u;
        long long v109 = 0u;
        memset(v108, 0, sizeof(v108));
        *(_OWORD *)v107 = 0u;
        long long v106 = 0u;
        double v27 = 0.0;
        *(_OWORD *)buf = 0u;
        long long v105 = 0u;
      }
      long long v28 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v27];
      id v29 = [a3 objectAtIndexedSubscript:((char *)[a3 count]) - 1];
      if (v29)
      {
        [v29 clientLocation];
        double v30 = *(double *)((char *)v108 + 12);
      }
      else
      {
        memset(v111, 0, sizeof(v111));
        long long v110 = 0u;
        long long v109 = 0u;
        memset(v108, 0, sizeof(v108));
        *(_OWORD *)v107 = 0u;
        long long v106 = 0u;
        double v30 = 0.0;
        *(_OWORD *)buf = 0u;
        long long v105 = 0u;
      }
      obj = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", [objc_alloc((Class)NSDateInterval) initWithStartDate:v28 endDate:[NSDate dateWithTimeIntervalSinceReferenceDate:v30]], 0);
      BOOL v25 = 0;
    }
    sub_1000C7F88(buf);
    uint64_t v31 = *(void *)buf;
    char v32 = _os_feature_enabled_impl();
    LOBYTE(v82) = 0;
    if (sub_1000D2988(v31, "EnableAutostartRouteReconstruction", (BOOL *)&v82)) {
      BOOL v33 = (_BYTE)v82 != 0;
    }
    else {
      BOOL v33 = v32;
    }
    if (*(void *)&buf[8]) {
      sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
    }
    if (obj && ((v34 = [(NSArray *)obj count]) != 0 ? (BOOL v35 = v33) : (BOOL v35 = 0), v35))
    {
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&long long v105 = 0x4812000000;
      *((void *)&v105 + 1) = sub_10155B8E4;
      *(void *)&long long v106 = sub_10155B908;
      *((void *)&v106 + 1) = "";
      sub_101560EB8(v107, v34);
      uint64_t v82 = 0;
      v83 = &v82;
      uint64_t v84 = 0x4812000000;
      v85 = sub_10155B8E4;
      v86 = sub_10155B908;
      v87 = "";
      sub_101560EB8(v88, v34);
      NSUInteger v56 = v34;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id v36 = [(NSArray *)obj countByEnumeratingWithState:&v78 objects:v96 count:16];
      if (v36)
      {
        uint64_t v57 = 0;
        uint64_t v55 = *(void *)v79;
        do
        {
          for (i = 0; i != v36; i = (char *)i + 1)
          {
            if (*(void *)v79 != v55) {
              objc_enumerationMutation(obj);
            }
            int v38 = *(void **)(*((void *)&v78 + 1) + 8 * i);
            [objc_msgSend(v38, "endDate") timeIntervalSinceReferenceDate];
            double v40 = v39;
            if ([a3 count])
            {
              [objc_msgSend(objc_msgSend(objc_msgSend(a3, "firstObject"), "timestamp"), "timeIntervalSinceReferenceDate");
              if (v40 > v41 + -10.0 && v40 < v41 + -1.0) {
                double v40 = v41 + -1.0;
              }
            }
            v75[0] = _NSConcreteStackBlock;
            v75[1] = 3221225472;
            v75[2] = sub_10155B920;
            v75[3] = &unk_10232D4B0;
            v75[5] = v53;
            v75[6] = &v98;
            int v76 = a4;
            BOOL v77 = v25;
            v75[4] = v11;
            sub_100134750(&v73, "inertial odometry");
            v66[0] = _NSConcreteStackBlock;
            v66[1] = 3321888768;
            v67 = sub_10155BD4C;
            v68 = &unk_10232D510;
            v69 = v11;
            char v43 = HIBYTE(v74);
            if (SHIBYTE(v74) < 0)
            {
              sub_1000DC48C(&v71, (void *)v73, *((unint64_t *)&v73 + 1));
              char v43 = HIBYTE(v74);
            }
            else
            {
              long long v71 = v73;
              uint64_t v72 = v74;
            }
            uint64_t v44 = (char *)i + v57;
            v70 = v75;
            v62[0] = _NSConcreteStackBlock;
            v62[1] = 3221225472;
            v62[2] = sub_10155C21C;
            v62[3] = &unk_10232D570;
            v62[7] = v53;
            v62[8] = &v82;
            v62[9] = buf;
            v62[10] = &v98;
            v62[11] = v56;
            int v63 = v57 + i;
            int v64 = a4;
            BOOL v45 = v25;
            BOOL v65 = v25;
            v62[5] = v38;
            v62[6] = v66;
            v62[4] = v59;
            *(double *)&v62[12] = v40;
            uint64_t v46 = v83[6];
            if (v43 < 0)
            {
              sub_1000DC48C(__p, (void *)v73, *((unint64_t *)&v73 + 1));
            }
            else
            {
              *(_OWORD *)__p = v73;
              uint64_t v61 = v74;
            }
            v67((uint64_t)v66, v44, (dispatch_object_t *)(v46 + 8 * v44), (char *)__p);
            if (SHIBYTE(v61) < 0) {
              operator delete(__p[0]);
            }
            [objc_msgSend(v38, "startDate") timeIntervalSinceReferenceDate];
            -[CLSmootherMonitor fetchBackgroundInertialOdometrySamplesWithStartTime:endTime:intervalIndex:completionBlock:](v59, "fetchBackgroundInertialOdometrySamplesWithStartTime:endTime:intervalIndex:completionBlock:", v44, v62);
            if (SHIBYTE(v72) < 0) {
              operator delete((void *)v71);
            }
            BOOL v25 = v45;
            if (SHIBYTE(v74) < 0) {
              operator delete((void *)v73);
            }
            id v11 = v59;
          }
          id v36 = [(NSArray *)obj countByEnumeratingWithState:&v78 objects:v96 count:16];
          uint64_t v57 = (v57 + i);
        }
        while (v36);
      }
      _Block_object_dispose(&v82, 8);
      if (v88[0])
      {
        v88[1] = v88[0];
        operator delete(v88[0]);
      }
      _Block_object_dispose(buf, 8);
      if (v107[0])
      {
        v107[1] = v107[0];
        operator delete(v107[0]);
      }
    }
    else
    {
      id v47 = [[-[CLSmootherMonitor universe](v11, "universe") silo];
      v89[0] = _NSConcreteStackBlock;
      v89[1] = 3221225472;
      v89[2] = sub_10155B8BC;
      v89[3] = &unk_10232D488;
      v89[6] = &v98;
      int v90 = a4;
      BOOL v91 = v25;
      v89[4] = v11;
      v89[5] = v53;
      [v47 async:v89];
    }
    _Block_object_dispose(&v98, 8);
    if (v103[0])
    {
      v103[1] = v103[0];
      operator delete(v103[0]);
    }
  }
  else
  {
    (*((void (**)(id, NSArray *, NSError *))a7 + 2))(a7, +[NSArray array](NSArray, "array"), +[NSError errorWithDomain:@"CLSmootherErrorDomain" code:1 userInfo:0]);
    sub_100DEE0B0(qword_10248D7C8);
  }
}

- (void)registerForCompanionNotification
{
  if (!qword_10248D7B0)
  {
    [(CLSmootherMonitor *)self universe];
    sub_1000B2C0C();
  }
}

- (void)registerForDaemonStatusNotification
{
  if (!qword_10248D7B8)
  {
    [(CLSmootherMonitor *)self universe];
    sub_10060F068();
  }
}

- (void)registerForTelephonyNotification
{
  if (!qword_10248D7C0)
  {
    [(CLSmootherMonitor *)self universe];
    sub_100561580();
  }
}

- (void)unregisterForCompanionNotification
{
  if (qword_10248D7B0)
  {
    [*(id *)(qword_10248D7B0 + 16) unregister:*(void *)(qword_10248D7B0 + 8) forNotification:5];
    if (qword_102419410 != -1) {
      dispatch_once(&qword_102419410, &stru_10232D630);
    }
    objc_super v2 = qword_102419418;
    if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "CLRS,unregisterForCompanionNotification", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419410 != -1) {
        dispatch_once(&qword_102419410, &stru_10232D630);
      }
      uint64_t v3 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSmootherMonitor unregisterForCompanionNotification]", "%s\n", v3);
      if (v3 != (char *)buf) {
        free(v3);
      }
    }
  }
}

- (void)unregisterForDaemonStatusNotification
{
  if (qword_10248D7B8)
  {
    [*(id *)(qword_10248D7B8 + 16) unregister:*(void *)(qword_10248D7B8 + 8) forNotification:6];
    if (qword_102419410 != -1) {
      dispatch_once(&qword_102419410, &stru_10232D630);
    }
    objc_super v2 = qword_102419418;
    if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "CLRS,unregisterForDaemonStatusNotification", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419410 != -1) {
        dispatch_once(&qword_102419410, &stru_10232D630);
      }
      uint64_t v3 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSmootherMonitor unregisterForDaemonStatusNotification]", "%s\n", v3);
      if (v3 != (char *)buf) {
        free(v3);
      }
    }
  }
}

- (void)unregisterForTelephonyNotification
{
  uint64_t v2 = qword_10248D7C0;
  if (qword_10248D7C0)
  {
    sub_1000B0164(buf, @"kDataStatusNotification");
    [*(id *)(v2 + 16) unregister:*(void *)(v2 + 8) forNotification:sub_1000F1244(buf)];
    if (qword_102419410 != -1) {
      dispatch_once(&qword_102419410, &stru_10232D630);
    }
    uint64_t v3 = qword_102419418;
    if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CLRS,unregisterForTelephonyNotification", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419410 != -1) {
        dispatch_once(&qword_102419410, &stru_10232D630);
      }
      uint64_t v4 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSmootherMonitor unregisterForTelephonyNotification]", "%s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
  }
}

- (void)onCompanionNotification:(int)a3 data:(char *)a4
{
  if (a3 == 5)
  {
    sub_100103240();
    if (sub_10010145C())
    {
      byte_10248D802 = *a4;
      if (qword_102419410 != -1) {
        dispatch_once(&qword_102419410, &stru_10232D630);
      }
      uint64_t v5 = qword_102419418;
      if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *a4;
        *(_DWORD *)buf = 67240192;
        int v9 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CLRS,kNotificationCompanionConnectionUpdate,isNearby,%{public}d", buf, 8u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419410 != -1) {
          dispatch_once(&qword_102419410, &stru_10232D630);
        }
        BOOL v7 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSmootherMonitor onCompanionNotification:data:]", "%s\n", v7);
        if (v7 != (char *)buf) {
          free(v7);
        }
      }
    }
  }
}

- (void)onDaemonStatusNotification:(int)a3 data:(uint64_t)a4
{
  if (a3 == 6)
  {
    unsigned int v5 = *(_DWORD *)(a4 + 4);
    if (v5 < 2 || v5 == 1000)
    {
      byte_10248D800 = 0;
    }
    else if (v5 == 2)
    {
      byte_10248D800 = 1;
    }
    else
    {
      byte_10248D800 = 0;
      if (qword_102419410 != -1) {
        dispatch_once(&qword_102419410, &stru_10232D630);
      }
      int v9 = qword_102419418;
      if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = *(_DWORD *)(a4 + 4);
        *(_DWORD *)buf = 67240192;
        int v15 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CLRS,unhandled reachability,%{public}d", buf, 8u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419410 != -1) {
          dispatch_once(&qword_102419410, &stru_10232D630);
        }
        unsigned int v13 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSmootherMonitor onDaemonStatusNotification:data:]", "%s\n", v13);
        if (v13 != (char *)buf) {
          free(v13);
        }
      }
    }
    if (qword_102419410 != -1) {
      dispatch_once(&qword_102419410, &stru_10232D630);
    }
    id v11 = qword_102419418;
    if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = *(_DWORD *)(a4 + 4);
      *(_DWORD *)buf = 67240448;
      int v15 = v12;
      __int16 v16 = 1026;
      int v17 = byte_10248D800;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CLRS,onDaemonStatusNotification,kNotificationReachability,current,%{public}d,hasLargeReachability,%{public}d", buf, 0xEu);
    }
    if (!sub_10013D1A0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419410 != -1) {
      dispatch_once(&qword_102419410, &stru_10232D630);
    }
    uint64_t v8 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSmootherMonitor onDaemonStatusNotification:data:]", "%s\n");
LABEL_29:
    if (v8 != buf) {
      free(v8);
    }
    return;
  }
  if (qword_102419410 != -1) {
    dispatch_once(&qword_102419410, &stru_10232D630);
  }
  BOOL v7 = qword_102419418;
  if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67240192;
    int v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "CLRS,daemonStatus notification,%{public}d", buf, 8u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419410 != -1) {
      dispatch_once(&qword_102419410, &stru_10232D630);
    }
    uint64_t v8 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLSmootherMonitor onDaemonStatusNotification:data:]", "%s\n");
    goto LABEL_29;
  }
}

- (void)onTelephonyNotification:(int)a3 data:(void *)a4
{
  int v32 = a3;
  unsigned int v5 = (const void *)sub_1000FA17C(&v32);
  if (CFEqual(@"kDataStatusNotification", v5))
  {
    int v6 = *a4;
    if (*a4)
    {
      *(_OWORD *)id v29 = 0u;
      long long v30 = 0u;
      int v31 = 1065353216;
      if (sub_10133145C(v6, (uint64_t)v29))
      {
        if (qword_102419410 != -1) {
          dispatch_once(&qword_102419410, &stru_10232D630);
        }
        BOOL v7 = qword_102419418;
        if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_DEFAULT))
        {
          int v28 = 0;
          __p[0] = &v28;
          int v8 = *((_DWORD *)sub_1007006D0((uint64_t)v29, &v28, (uint64_t)&unk_101D0B290, (_DWORD **)__p) + 9);
          *(_DWORD *)buf = 68289538;
          *(_DWORD *)&uint8_t buf[4] = 0;
          __int16 v34 = 2082;
          BOOL v35 = "";
          __int16 v36 = 1026;
          *(_DWORD *)char v37 = 0;
          *(_WORD *)&v37[4] = 1026;
          *(_DWORD *)&v37[6] = v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLRS,kDataStatusNotification\", \"sim\":%{public}d, \"RAT\":%{public}d}", buf, 0x1Eu);
        }
        LODWORD(__p[0]) = 0;
        *(void *)buf = __p;
        unsigned int v9 = *((_DWORD *)sub_1007006D0((uint64_t)v29, (int *)__p, (uint64_t)&unk_101D0B290, (_DWORD **)buf) + 9);
        byte_10248D801 = (v9 < 0xB) & (0x7BDu >> v9);
        if (sub_1000FFBA8())
        {
          if (qword_102419410 != -1) {
            dispatch_once(&qword_102419410, &stru_10232D630);
          }
          int v10 = qword_102419418;
          if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_DEFAULT))
          {
            int v28 = 1;
            __p[0] = &v28;
            int v11 = *((_DWORD *)sub_1007006D0((uint64_t)v29, &v28, (uint64_t)&unk_101D0B290, (_DWORD **)__p) + 9);
            *(_DWORD *)buf = 68289538;
            *(_DWORD *)&uint8_t buf[4] = 0;
            __int16 v34 = 2082;
            BOOL v35 = "";
            __int16 v36 = 1026;
            *(_DWORD *)char v37 = 1;
            *(_WORD *)&v37[4] = 1026;
            *(_DWORD *)&v37[6] = v11;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLRS,kDataStatusNotification\", \"sim\":%{public}d, \"RAT\":%{public}d}", buf, 0x1Eu);
          }
          LODWORD(__p[0]) = 1;
          *(void *)buf = __p;
          unsigned int v12 = *((_DWORD *)sub_1007006D0((uint64_t)v29, (int *)__p, (uint64_t)&unk_101D0B290, (_DWORD **)buf) + 9);
          byte_10248D801 |= (v12 < 0xB) & (0x7BDu >> v12);
        }
      }
      else
      {
        if (qword_102419410 != -1) {
          dispatch_once(&qword_102419410, &stru_10232D630);
        }
        int v17 = qword_102419418;
        if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "CLRS,copyValuesFromDataStatusDictionary,failed", buf, 2u);
        }
        if (sub_10013D1A0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419410 != -1) {
            dispatch_once(&qword_102419410, &stru_10232D630);
          }
          LOWORD(__p[0]) = 0;
          BOOL v25 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLSmootherMonitor onTelephonyNotification:data:]", "%s\n", v25);
          if (v25 != (char *)buf) {
            free(v25);
          }
        }
      }
      if (qword_102419410 != -1) {
        dispatch_once(&qword_102419410, &stru_10232D630);
      }
      uint64_t v18 = qword_102419418;
      if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v19 = (const __CFString *)sub_1000FA17C(&v32);
        sub_1000FECE0(v19, (uint64_t)__p);
        v20 = v27 >= 0 ? __p : (void **)__p[0];
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&uint8_t buf[4] = 0;
        __int16 v34 = 2082;
        BOOL v35 = "";
        __int16 v36 = 2082;
        *(void *)char v37 = v20;
        *(_WORD *)&v37[8] = 1026;
        int v38 = byte_10248D801;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLRS\", \"received CT notification\":%{public, location:escape_only}s, \"hasActiveCellConnection\":%{public}d}", buf, 0x22u);
        if (v27 < 0) {
          operator delete(__p[0]);
        }
      }
      sub_1000D7D80((uint64_t)v29);
    }
    else
    {
      if (qword_102419410 != -1) {
        dispatch_once(&qword_102419410, &stru_10232D630);
      }
      int v15 = qword_102419418;
      if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "CLRS,kDataStatusNotification,error fetching info", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419410 != -1) {
          dispatch_once(&qword_102419410, &stru_10232D630);
        }
        LOWORD(v29[0]) = 0;
        __int16 v16 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLSmootherMonitor onTelephonyNotification:data:]", "%s\n", v16);
        if (v16 != (char *)buf) {
          free(v16);
        }
      }
    }
  }
  else
  {
    unsigned int v13 = (const void *)sub_1000FA17C(&v32);
    if (CFEqual(@"kCLTelephonyServiceResetNotification", v13))
    {
      if (qword_102419410 != -1) {
        dispatch_once(&qword_102419410, &stru_10232D630);
      }
      unsigned int v14 = qword_102419418;
      if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CLRS,kResetNotification,setting active cell flag to false", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419410 != -1) {
          dispatch_once(&qword_102419410, &stru_10232D630);
        }
        LOWORD(v29[0]) = 0;
        v24 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSmootherMonitor onTelephonyNotification:data:]", "%s\n", v24);
        if (v24 != (char *)buf) {
          free(v24);
        }
      }
      byte_10248D801 = 0;
    }
  }
  if (qword_102419410 != -1) {
    dispatch_once(&qword_102419410, &stru_10232D630);
  }
  uint64_t v21 = qword_102419418;
  if (os_log_type_enabled((os_log_t)qword_102419418, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v22 = (const __CFString *)sub_1000FA17C(&v32);
    sub_1000FECE0(v22, (uint64_t)v29);
    if ((SBYTE7(v30) & 0x80u) == 0) {
      double v23 = v29;
    }
    else {
      double v23 = (void **)v29[0];
    }
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v34 = 2082;
    BOOL v35 = "";
    __int16 v36 = 2082;
    *(void *)char v37 = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLRS\", \"received CT notification\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (SBYTE7(v30) < 0) {
      operator delete(v29[0]);
    }
  }
}

- (BOOL)isLocationUsefulForSmoothing:(int)a3
{
  return (a3 < 0xC) & (0xE12u >> a3);
}

- (void)fetchBackgroundInertialOdometrySamplesWithStartTime:(double)a3 endTime:(double)a4 intervalIndex:(unsigned int)a5 completionBlock:(id)a6
{
  id v12 = [objc_alloc((Class)RTBackgroundInertialOdometrySampleEnumerationOptions) initWithDateInterval:[objc_alloc((Class)NSDateInterval) initWithStartDate:+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3) endDate:+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a4)]];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10155FBA0;
  v13[3] = &unk_10232D5C0;
  v13[5] = sub_10016C458();
  *(double *)&v13[6] = a4;
  *(double *)&v13[7] = a3;
  unsigned int v14 = a5;
  v13[4] = a6;
  [(CLRoutineMonitorServiceProtocol *)self->_routineMonitor fetchBackgroundInertialOdometrySamplesWithOptions:v12 handler:v13];
}

- (void)fetchLocationsWithStartTime:(double)a3 endTime:(double)a4 intervalIndex:(unsigned int)a5 locationArray:(id)a6 completionBlock:(id)a7
{
  id v14 = [objc_alloc((Class)RTStoredLocationEnumerationOptions) initWithDateInterval:[objc_alloc((Class)NSDateInterval) initWithStartDate:[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3) endDate:[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a4)] horizontalAccuracy:0 batchSize:0 boundingBoxLocation:0.0];
  double v15 = sub_10016C458();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3052000000;
  v19[3] = sub_10155CFE8;
  routineMonitor = self->_routineMonitor;
  v19[4] = sub_10155CFF8;
  v19[5] = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10156030C;
  v17[3] = &unk_10232D610;
  unsigned int v18 = a5;
  v17[4] = self;
  v17[5] = a6;
  v17[7] = a7;
  v17[8] = v19;
  *(double *)&v17[9] = v15;
  *(double *)&v17[10] = a4;
  *(double *)&v17[11] = a3;
  v17[6] = v14;
  [(CLRoutineMonitorServiceProtocol *)routineMonitor enumerateStoredLocationsWithOptions:v14 withReply:v17];
  _Block_object_dispose(v19, 8);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (BOOL)updating
{
  return self->_updating;
}

- (void)setUpdating:(BOOL)a3
{
  self->_updating = a3;
}

- (BOOL)diminishedMode
{
  return self->_diminishedMode;
}

- (void)setDiminishedMode:(BOOL)a3
{
  self->_diminishedMode = a3;
}

- (NSMutableSet)visitClients
{
  return self->_visitClients;
}

- (void)setVisitClients:(id)a3
{
}

- (BOOL)visitMonitorWakeTimerEnabled
{
  return self->_visitMonitorWakeTimerEnabled;
}

- (void)setVisitMonitorWakeTimerEnabled:(BOOL)a3
{
  self->_visitMonitorWakeTimerEnabled = a3;
}

- (BOOL)wifiPowerEnabled
{
  return self->_wifiPowerEnabled;
}

- (void)setWifiPowerEnabled:(BOOL)a3
{
  self->_wifiPowerEnabled = a3;
}

- (NSMutableDictionary)scenarioTriggerClients
{
  return self->_scenarioTriggerClients;
}

- (void)setScenarioTriggerClients:(id)a3
{
}

- (NSDate)lastUpdateVisitMonitorWakeTimerDate
{
  return self->_lastUpdateVisitMonitorWakeTimerDate;
}

- (void)setLastUpdateVisitMonitorWakeTimerDate:(id)a3
{
}

@end