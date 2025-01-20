@interface CLFenceAnalyticsManager
+ (BOOL)isSupported;
+ (id)getSilo;
+ (id)regionForFence:(Fence *)a3;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)isSimulatingLocation;
- (BOOL)updateHistoricalFenceStateWithNotificationData:(NotificationData *)a3;
- (CLFenceAnalyticsManager)init;
- (CLFenceStateChangeAnalytics)stateChangeAnalytics;
- (CLRoutineMonitorServiceProtocol)routineMonitor;
- (CLStepDistance)fetchStepCountInInterval:(SEL)a3;
- (NSMutableDictionary)historicalFenceStates;
- (id).cxx_construct;
- (id)historicalFenceStateForFence:(Fence *)a3;
- (id)historicalFenceStateForFenceName:(id)a3;
- (id)queue;
- (void)beginService;
- (void)endService;
- (void)fetchDominantMotionActivityInInterval:(id)a3 handler:(id)a4;
- (void)fetchLocationOfInterestForFence:(Fence *)a3 handler:;
- (void)fetchLocationOfInterestForRegion:(id)a3 handler:(id)a4;
- (void)fetchLocationSystemStateWithHandler:(id)a3;
- (void)fetchMotionActivitiesInInterval:(id)a3 handler:(id)a4;
- (void)onMonitorNotification:(int)a3 data:(NotificationData *)a4;
- (void)setHistoricalFenceStates:(id)a3;
- (void)setIsSimulatingLocation:(BOOL)a3;
- (void)setRoutineMonitor:(id)a3;
- (void)setStateChangeAnalytics:(id)a3;
- (void)updateTimeToInitialStateChangeForFence:(CLFenceAnalyticsManager *)self previousStatus:(SEL)a2 timeOfStateChange:(Fence *)a3;
@end

@implementation CLFenceAnalyticsManager

+ (BOOL)isSupported
{
  if (qword_10247E770 != -1) {
    dispatch_once(&qword_10247E770, &stru_1022CEF30);
  }
  return byte_10247E768;
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
  if (qword_10247E780 != -1) {
    dispatch_once(&qword_10247E780, &stru_1022CEF50);
  }
  return (id)qword_10247E778;
}

- (CLFenceAnalyticsManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLFenceAnalyticsManager;
  return [(CLFenceAnalyticsManager *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLFenceAnalyticsManagerServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLFenceAnalyticsManagerClientProtocol];
}

- (void)beginService
{
  if (qword_1024193C0 != -1) {
    dispatch_once(&qword_1024193C0, &stru_1022CF010);
  }
  objc_super v3 = qword_1024193C8;
  if (os_log_type_enabled((os_log_t)qword_1024193C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FenceAnalyticsManager beginService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193C0 != -1) {
      dispatch_once(&qword_1024193C0, &stru_1022CF010);
    }
    __int16 v8 = 0;
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFenceAnalyticsManager beginService]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  self->_stateChangeAnalytics = [[CLFenceStateChangeAnalytics alloc] initWithUniverse:[(CLFenceAnalyticsManager *)self universe] fenceAnalyticsManager:self];
  if ([objc_msgSend(-[CLFenceAnalyticsManager universe](self, "universe"), "vendor") isServiceEnabled:@"CLMotionState"])self->_motionStateProxy = (CLMotionStateProtocol *)[objc_msgSend(-[CLFenceAnalyticsManager universe](self, "universe"), "vendor") proxyForService:@"CLMotionState" forClient:@"CLFenceAnalyticsManager"]; {
  unsigned __int8 v7 = 0;
  }
  sub_10089FD7C(&v7, buf);
  shared_ptr<CLStepCountRecorderDb> v4 = *(shared_ptr<CLStepCountRecorderDb> *)buf;
  memset(buf, 0, sizeof(buf));
  cntrl = self->_stepCountDb.__cntrl_;
  self->_stepCountDb = v4;
  if (cntrl)
  {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
    if (*(void *)&buf[8]) {
      sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
    }
  }
  self->_historicalFenceStates = (NSMutableDictionary *)objc_opt_new();
  if ([objc_msgSend(-[CLFenceAnalyticsManager universe](self, "universe"), "vendor") isServiceEnabled:@"CLFenceManager"])self->_fenceManagerProxy = (CLFenceManagerProtocol *)[objc_msgSend(-[CLFenceAnalyticsManager universe](self, "universe"), "vendor") proxyForService:@"CLFenceManager" forClient:@"CLFenceAnalyticsManager"]; {
  self->_routineMonitor = (CLRoutineMonitorServiceProtocol *)[[-[CLFenceAnalyticsManager universe](self, "universe") vendor] proxyForService:@"CLRoutineMonitor" forClient:@"CLFenceAnalyticsManager"];
  }
  [(CLFenceAnalyticsManager *)self universe];
  sub_1001ABF24();
}

- (void)endService
{
  self->_historicalFenceStates = 0;
  motionStateProxy = self->_motionStateProxy;
  if (motionStateProxy)
  {

    self->_motionStateProxy = 0;
  }
  fenceManagerProxy = self->_fenceManagerProxy;
  if (fenceManagerProxy)
  {

    self->_fenceManagerProxy = 0;
  }
  stateChangeAnalytics = self->_stateChangeAnalytics;
  if (stateChangeAnalytics)
  {

    self->_stateChangeAnalytics = 0;
  }
  routineMonitor = self->_routineMonitor;
  if (routineMonitor)
  {

    self->_routineMonitor = 0;
  }
}

- (id)queue
{
  id v2 = [[-[CLFenceAnalyticsManager universe](self, "universe") silo];

  return [v2 queue];
}

- (void)fetchMotionActivitiesInInterval:(id)a3 handler:(id)a4
{
  if (!a4) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CLFenceAnalyticsManager.mm", 114, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  unsigned __int8 v7 = [[CLOSTransaction alloc] initWithDescription:"CLFenceAnalyticsManager.MotionActivityQuery"];
  motionStateProxy = self->_motionStateProxy;
  [objc_msgSend(a3, "startDate") timeIntervalSinceReferenceDate];
  double v10 = v9;
  [objc_msgSend(a3, "endDate") timeIntervalSinceReferenceDate];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10089ECE0;
  v12[3] = &unk_1022CEF78;
  v12[5] = v7;
  v12[6] = a4;
  v12[4] = self;
  [(CLMotionStateProtocol *)motionStateProxy queryMotionStatesWithStartTime:1 endTime:v12 isFromInternalClient:v10 withReply:v11];
}

- (void)fetchDominantMotionActivityInInterval:(id)a3 handler:(id)a4
{
  if (!a4) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CLFenceAnalyticsManager.mm", 129, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10089EE10;
  v7[3] = &unk_1022CEFA0;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = a4;
  [(CLFenceAnalyticsManager *)self fetchMotionActivitiesInInterval:a3 handler:v7];
}

- (CLStepDistance)fetchStepCountInInterval:(SEL)a3
{
  *(void *)&retstr->var7 = 0;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  ptr = self->_stepCountDb.__ptr_;
  [objc_msgSend(a4, "startDate") timeIntervalSinceReferenceDate];
  double v8 = v7;
  [objc_msgSend(a4, "endDate") timeIntervalSinceReferenceDate];

  sub_1015797B4((uint64_t)ptr, 0, (uint64_t)retstr, v8, v9);
  return result;
}

+ (id)regionForFence:(Fence *)a3
{
  if (a3[5].var0.var0 != *(void *)&a3[5].var0.__r_.var0) {
    return 0;
  }
  id v5 = objc_alloc((Class)NSString);
  p_var0 = &a3->var0.__r_.var0;
  if (a3[1].var0.__r_.__value_.var0.var0.__data_[7] < 0) {
    p_var0 = *(int **)p_var0;
  }
  id v7 = [v5 initWithCString:p_var0 encoding:4];
  id v8 = objc_alloc((Class)CLCircularRegion);
  CLLocationCoordinate2D v9 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)&a3[1].var0.var0, *(CLLocationDegrees *)&a3[2].var0.__r_.__value_.var0.var1.__data_);
  id v10 = [v8 initWithCenter:v7 radius:v9.latitude longitude:v9.longitude identifier:*(double *)&a3[2].var0.__r_.__value_.var0.var1.__size_];

  return v10;
}

- (void)fetchLocationOfInterestForFence:(Fence *)a3 handler:
{
  uint64_t v4 = v3;
  if (!v3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CLFenceAnalyticsManager.mm", 171, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  id v7 = objc_opt_class();
  sub_10048AEC0((char *)__dst, (long long *)a3->var0.__r_.__value_.var0.var0.__data_);
  -[CLFenceAnalyticsManager fetchLocationOfInterestForRegion:handler:](self, "fetchLocationOfInterestForRegion:handler:", [v7 regionForFence:__dst], v4);
  if (__p)
  {
    v18 = __p;
    operator delete(__p);
  }

  if (v15 < 0) {
    operator delete(v14);
  }
  if (v13 < 0) {
    operator delete(v12);
  }
  if (v11 < 0) {
    operator delete(v10);
  }
  if (v9 < 0) {
    operator delete(__dst[0]);
  }
}

- (void)fetchLocationOfInterestForRegion:(id)a3 handler:(id)a4
{
  if (!a4) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CLFenceAnalyticsManager.mm", 179, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  if (self->_routineMonitor && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    routineMonitor = self->_routineMonitor;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10089F224;
    v9[3] = &unk_1022CEFC8;
    v9[4] = self;
    v9[5] = a4;
    [(CLRoutineMonitorServiceProtocol *)routineMonitor fetchLocationOfInterestForRegion:a3 withReply:v9];
  }
  else
  {
    id v8 = (void (*)(id, void))*((void *)a4 + 2);
    v8(a4, 0);
  }
}

- (BOOL)updateHistoricalFenceStateWithNotificationData:(NotificationData *)a3
{
  id v6 = objc_alloc((Class)NSString);
  id v7 = (void *)((char *)a3 + 24);
  if (*((char *)a3 + 47) < 0) {
    id v7 = (void *)*v7;
  }
  id v8 = [v6 initWithCString:v7 encoding:4];
  unsigned int v9 = *((_DWORD *)a3 + 318);
  uint64_t v10 = *((unsigned int *)a3 + 163);
  if (v9 == -1) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = v9;
  }
  long long v12 = *((_OWORD *)a3 + 57);
  long long v30 = *((_OWORD *)a3 + 56);
  long long v31 = v12;
  v32[0] = *((_OWORD *)a3 + 58);
  *(_OWORD *)((char *)v32 + 12) = *(_OWORD *)((char *)a3 + 940);
  long long v13 = *((_OWORD *)a3 + 53);
  long long v26 = *((_OWORD *)a3 + 52);
  long long v27 = v13;
  long long v14 = *((_OWORD *)a3 + 55);
  long long v28 = *((_OWORD *)a3 + 54);
  long long v29 = v14;
  long long v15 = *((_OWORD *)a3 + 51);
  long long v24 = *((_OWORD *)a3 + 50);
  long long v25 = v15;
  if (qword_1024193C0 != -1) {
    dispatch_once(&qword_1024193C0, &stru_1022CF010);
  }
  id v16 = qword_1024193C8;
  if (os_log_type_enabled((os_log_t)qword_1024193C8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *((void *)a3 + 99);
    *(_DWORD *)buf = 138413058;
    id v42 = v8;
    __int16 v43 = 1024;
    int v44 = v11;
    __int16 v45 = 1024;
    int v46 = v10;
    __int16 v47 = 2048;
    uint64_t v48 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#FenceMetrics update historical fence state %@, previousStatus %d, currentStatus %d, timeOfLocationReceived %f", buf, 0x22u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193C0 != -1) {
      dispatch_once(&qword_1024193C0, &stru_1022CF010);
    }
    uint64_t v20 = *((void *)a3 + 99);
    int v33 = 138413058;
    id v34 = v8;
    __int16 v35 = 1024;
    int v36 = v11;
    __int16 v37 = 1024;
    int v38 = v10;
    __int16 v39 = 2048;
    uint64_t v40 = v20;
    v21 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFenceAnalyticsManager updateHistoricalFenceStateWithNotificationData:]", "%s\n", v21);
    if (v21 != (char *)buf) {
      free(v21);
    }
  }
  if (![(NSMutableDictionary *)self->_historicalFenceStates objectForKey:v8]) {
    [(NSMutableDictionary *)self->_historicalFenceStates setObject:objc_alloc_init(CLFenceAnalyticsHistoricalStates) forKeyedSubscript:v8];
  }
  id v18 = [(NSMutableDictionary *)self->_historicalFenceStates objectForKey:v8];
  v22[6] = v30;
  v22[7] = v31;
  v23[0] = v32[0];
  *(_OWORD *)((char *)v23 + 12) = *(_OWORD *)((char *)v32 + 12);
  v22[2] = v26;
  v22[3] = v27;
  v22[4] = v28;
  v22[5] = v29;
  v22[0] = v24;
  v22[1] = v25;
  [v18 updateCurrentState:v10 previousState:v11 location:v22 locationReceivedTime:*((double *)a3 + 99)];
  return 1;
}

- (void)updateTimeToInitialStateChangeForFence:(CLFenceAnalyticsManager *)self previousStatus:(SEL)a2 timeOfStateChange:(Fence *)a3
{
  if (v3 == -1)
  {
    uint64_t v17 = v9;
    uint64_t v18 = v5;
    uint64_t v19 = v4;
    double v13 = v8 - *(double *)&a3[3].var0.__r_.__value_.var0.var1.__data_;
    id v14 = objc_alloc((Class)NSString);
    p_var0 = &a3->var0.__r_.var0;
    if (a3[1].var0.__r_.__value_.var0.var0.__data_[7] < 0) {
      p_var0 = *(int **)p_var0;
    }
    id v16 = [[self->_historicalFenceStates objectForKey:[v14 initWithCString:p_var0 encoding:4 v10 v17 v18 v19 v6]]
    _[v16 updateTimeToInitialStateChange:v13];
  }
}

- (void)fetchLocationSystemStateWithHandler:(id)a3
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CLFenceAnalyticsManager.mm", 238, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10089F6E0;
  v5[3] = &unk_1022CEFF0;
  v5[4] = self;
  v5[5] = a3;
  sub_100163648([(CLFenceAnalyticsManager *)self universe], (uint64_t)v5);
}

- (id)historicalFenceStateForFence:(Fence *)a3
{
  id v5 = objc_alloc((Class)NSString);
  p_var0 = &a3->var0.__r_.var0;
  if (a3[1].var0.__r_.__value_.var0.var0.__data_[7] < 0) {
    p_var0 = *(int **)p_var0;
  }
  id v7 = [v5 initWithCString:p_var0 encoding:4];

  return [(CLFenceAnalyticsManager *)self historicalFenceStateForFenceName:v7];
}

- (id)historicalFenceStateForFenceName:(id)a3
{
  uint64_t v4 = [(CLFenceAnalyticsManager *)self historicalFenceStates];

  return [(NSMutableDictionary *)v4 objectForKey:a3];
}

- (void)onMonitorNotification:(int)a3 data:(NotificationData *)a4
{
  double v5 = __chkstk_darwin(self);
  id v7 = v6;
  int v9 = v8;
  uint64_t v11 = v10;
  [objc_msgSend(v10, "universe", v5) silo];
  if (qword_1024193C0 != -1) {
    dispatch_once(&qword_1024193C0, &stru_1022CF010);
  }
  long long v12 = qword_1024193C8;
  if (os_log_type_enabled((os_log_t)qword_1024193C8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#FenceMetrics Received FenceMonitor notification, processing metrics for state change", (uint8_t *)v23, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(v23, 0x65CuLL);
    if (qword_1024193C0 != -1) {
      dispatch_once(&qword_1024193C0, &stru_1022CF010);
    }
    LOWORD(v21) = 0;
    id v16 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFenceAnalyticsManager onMonitorNotification:data:]", "%s\n", v16);
    if (v16 != (char *)v23) {
      free(v16);
    }
  }
  if (v9 == 11)
  {
    sub_10089FBB8(v20, v7);
    [v11 updateHistoricalFenceStateWithNotificationData:v20];
    sub_1001111C8((uint64_t)v20);
    double v13 = (void *)v11[8];
    sub_10089FBB8(v19, v7);
    [v13 submitAllMetricsFromNotification:v19];
    sub_1001111C8((uint64_t)v19);
    id v14 = (void *)v11[8];
    sub_10089FBB8(v18, v7);
    [v14 evaluatePossibleFalseExitFromNotification:v18];
    sub_1001111C8((uint64_t)v18);
  }
  else
  {
    if (qword_1024193C0 != -1) {
      dispatch_once(&qword_1024193C0, &stru_1022CF010);
    }
    long long v15 = qword_1024193C8;
    if (os_log_type_enabled((os_log_t)qword_1024193C8, OS_LOG_TYPE_ERROR))
    {
      v23[0] = 67109120;
      v23[1] = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "#FenceMetrics analytics received invalid notification type, %u", (uint8_t *)v23, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(v23, 0x65CuLL);
      if (qword_1024193C0 != -1) {
        dispatch_once(&qword_1024193C0, &stru_1022CF010);
      }
      int v21 = 67109120;
      int v22 = v9;
      uint64_t v17 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLFenceAnalyticsManager onMonitorNotification:data:]", "%s\n", v17);
      if (v17 != (char *)v23) {
        free(v17);
      }
    }
  }
}

- (CLRoutineMonitorServiceProtocol)routineMonitor
{
  return self->_routineMonitor;
}

- (void)setRoutineMonitor:(id)a3
{
}

- (CLFenceStateChangeAnalytics)stateChangeAnalytics
{
  return self->_stateChangeAnalytics;
}

- (void)setStateChangeAnalytics:(id)a3
{
}

- (BOOL)isSimulatingLocation
{
  return self->_isSimulatingLocation;
}

- (void)setIsSimulatingLocation:(BOOL)a3
{
  self->_isSimulatingLocation = a3;
}

- (NSMutableDictionary)historicalFenceStates
{
  return self->_historicalFenceStates;
}

- (void)setHistoricalFenceStates:(id)a3
{
}

- (void).cxx_destruct
{
  value = self->_fenceMonitorClient.__ptr_.__value_;
  self->_fenceMonitorClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  cntrl = self->_stepCountDb.__cntrl_;
  if (cntrl)
  {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end