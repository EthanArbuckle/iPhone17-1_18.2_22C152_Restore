@interface CLContextMetricsService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLContextMetricsService)init;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
- (void)getInitialTransitionStates;
- (void)onMotionStateNotification:(int)a3 data:(NotificationData *)a4;
- (void)onStatusNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onVisit:(id)a3;
- (void)onWifiNotification:(const int *)a3 data:(const void *)a4;
- (void)queryForTransitionEvents;
@end

@implementation CLContextMetricsService

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
  if (qword_10247B1D8 != -1) {
    dispatch_once(&qword_10247B1D8, &stru_1022B83F0);
  }
  return (id)qword_10247B1D0;
}

- (CLContextMetricsService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLContextMetricsService;
  return [(CLContextMetricsService *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLContextMetricsServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLContextMetricsServiceClientProtocol];
}

+ (BOOL)isSupported
{
  return 1;
}

- (void)beginService
{
  [self universe].silo
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022B8498);
  }
  objc_super v3 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = 68289026;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cms start service\"}", (uint8_t *)&v4, 0x12u);
  }
  self->_dq = (OS_dispatch_queue *)[[-[CLContextMetricsService universe](self, "universe") silo] queue];
  self->_oq = (NSOperationQueue *)[[-[CLContextMetricsService universe](self, "universe") silo] operationQueue];
  self->_scanMetrics = [[CLContextScanMetrics alloc] initWithStartTime:CFAbsoluteTimeGetCurrent()];
  sub_1001AE6FC();
}

- (void)endService
{
  [self universe].silo
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022B8498);
  }
  objc_super v3 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 68289026;
    v10[1] = 0;
    __int16 v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cms end service\"}", (uint8_t *)v10, 0x12u);
  }

  value = self->_wifiClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:12];
    __int16 v5 = self->_wifiClient.__ptr_.__value_;
    self->_wifiClient.__ptr_.__value_ = 0;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8))(v5);
    }
  }
  v6 = self->_statusClient.__ptr_.__value_;
  if (v6)
  {
    [*((id *)v6 + 2) unregister:*((void *)v6 + 1) forNotification:16];
    v7 = self->_statusClient.__ptr_.__value_;
    self->_statusClient.__ptr_.__value_ = 0;
    if (v7) {
      (*(void (**)(Client *))(*(void *)v7 + 8))(v7);
    }
  }
  v8 = self->_motionClient.__ptr_.__value_;
  if (v8)
  {
    [*((id *)v8 + 2) unregister:*((void *)v8 + 1) forNotification:3];
    v9 = self->_motionClient.__ptr_.__value_;
    self->_motionClient.__ptr_.__value_ = 0;
    if (v9) {
      (*(void (**)(Client *))(*(void *)v9 + 8))(v9);
    }
  }

  [(CLRoutineMonitorServiceProtocol *)self->_routineMonitor stopLeechingVisitsForClient:self];
}

- (void)onWifiNotification:(const int *)a3 data:(const void *)a4
{
  [self universe].silo
  int v7 = *a3;
  if (*a3 == 12 && *((_DWORD *)a4 + 35) == 2)
  {
    id v9 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v10 = *((void *)a4 + 14);
    uint64_t v11 = *((void *)a4 + 15);
    if (v10 != v11)
    {
      double v12 = *(double *)(v10 + 56) + -5.0;
      do
      {
        double v13 = *(double *)(v10 + 56);
        if (vabdd_f64(v12, v13) > 4.0)
        {
          [v9 addObject:[NSNumber numberWithDouble:round(v13)]];
          double v12 = *(double *)(v10 + 56);
        }
        v10 += 88;
      }
      while (v10 != v11);
    }
    [(CLContextMetricsService *)self queryForTransitionEvents];
    [(CLContextScanMetrics *)self->_scanMetrics scanEvents:v9 atTime:CFAbsoluteTimeGetCurrent()];
    int v7 = *a3;
  }
  if (v7 == 6)
  {
    scanMetrics = self->_scanMetrics;
    if (*((unsigned char *)a4 + 96)) {
      BOOL v15 = *((_DWORD *)a4 + 12) <= 0;
    }
    else {
      BOOL v15 = 1;
    }
    uint64_t v16 = !v15;
    double Current = CFAbsoluteTimeGetCurrent();
    [(CLContextScanMetrics *)scanMetrics associationEvent:v16 atTime:Current];
  }
}

- (void)onStatusNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [self universe:a3 silo:a4];
  if (*a3 == 16)
  {
    [(CLContextMetricsService *)self queryForTransitionEvents];
    scanMetrics = self->_scanMetrics;
    double Current = CFAbsoluteTimeGetCurrent();
    [(CLContextScanMetrics *)scanMetrics hearbeatEventAtTime:Current];
  }
}

- (void)onMotionStateNotification:(int)a3 data:(NotificationData *)a4
{
  [self universe:a3 a4:a5 a6:a6 a7:a7 silo];
  if (a3 == 3)
  {
    scanMetrics = self->_scanMetrics;
    long long v11 = *((_OWORD *)a4 + 7);
    v15[6] = *((_OWORD *)a4 + 6);
    v15[7] = v11;
    uint64_t v16 = *((void *)a4 + 16);
    long long v12 = *((_OWORD *)a4 + 3);
    v15[2] = *((_OWORD *)a4 + 2);
    v15[3] = v12;
    long long v13 = *((_OWORD *)a4 + 5);
    v15[4] = *((_OWORD *)a4 + 4);
    v15[5] = v13;
    long long v14 = *((_OWORD *)a4 + 1);
    v15[0] = *(_OWORD *)a4;
    v15[1] = v14;
    [(CLContextScanMetrics *)scanMetrics motionEvent:v15];
  }
}

- (void)onVisit:(id)a3
{
  if ([a3 hasDepartureDate])
  {
    scanMetrics = self->_scanMetrics;
    [(CLContextScanMetrics *)scanMetrics visitEvent:a3 withFamiliarityIndex:0];
  }
  else
  {
    routineMonitor = self->_routineMonitor;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100511B10;
    v7[3] = &unk_1022B8418;
    v7[4] = self;
    v7[5] = a3;
    [(CLRoutineMonitorServiceProtocol *)routineMonitor getFamiliarityIndexForVisit:a3 withReply:v7];
  }
}

- (void)queryForTransitionEvents
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v4 = Current - self->_lastActivityQuery;
  if (v4 >= 3600.0)
  {
    __int16 v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:Current + -900.0];
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022B8498);
    }
    int v7 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
    {
      int lastActivityQuery = (int)self->_lastActivityQuery;
      *(_DWORD *)buf = 68290307;
      int v15 = 0;
      __int16 v16 = 2082;
      v17 = "";
      __int16 v18 = 1026;
      int v19 = (int)v4;
      __int16 v20 = 1026;
      int v21 = lastActivityQuery;
      __int16 v22 = 1026;
      int v23 = (int)Current;
      __int16 v24 = 2113;
      v25 = v5;
      __int16 v26 = 2113;
      v27 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cms mode query\", \"delta\":%{public}d, \"last\":%{public}d, \"now\":%{public}d, \"from\":%{private, location:escape_only}@, \"to\":%{private, location:escape_only}@}", buf, 0x38u);
    }
    [(CMMotionActivityManager *)self->_motionActivityManager queryActivityWithAttribute:1 fromDate:v5 toDate:v6 toQueue:self->_oq withHandler:&stru_1022B8458];
    id v9 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v5 endDate:v6];
    id v10 = objc_alloc((Class)RTStoredVisitFetchOptions);
    id v11 = [v10 initWithAscending:1 confidence:[NSNumber numberWithDouble:RTVisitConfidenceHigh] dateInterval:v9 limit:0];
    routineMonitor = self->_routineMonitor;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1005120F8;
    v13[3] = &unk_10229FF00;
    v13[4] = self;
    [(CLRoutineMonitorServiceProtocol *)routineMonitor fetchStoredVisitsWithOptions:v11 withReply:v13];
    self->_int lastActivityQuery = Current + -900.0;
  }
}

- (void)getInitialTransitionStates
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022B8498);
  }
  double v4 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v10 = 0;
    __int16 v11 = 2082;
    long long v12 = "";
    __int16 v13 = 1026;
    int v14 = (int)Current;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cms mode init query\", \"now\":%{public}d}", buf, 0x18u);
  }
  [(CMMotionActivityManager *)self->_motionActivityManager queryActivityStartingFromDate:+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", Current + -900.0) toDate:+[NSDate date] toQueue:self->_oq withHandler:&stru_1022B8478];
  id v5 = objc_alloc((Class)RTStoredVisitFetchOptions);
  id v6 = [v5 initWithAscending:0 confidence:[NSNumber numberWithDouble:RTVisitConfidenceHigh] dateInterval:0 labelVisit:1 limit:&off_1023925D0];
  routineMonitor = self->_routineMonitor;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1005129FC;
  v8[3] = &unk_10229FF00;
  v8[4] = self;
  [(CLRoutineMonitorServiceProtocol *)routineMonitor fetchStoredVisitsWithOptions:v6 withReply:v8];
  self->_int lastActivityQuery = Current;
}

- (void).cxx_destruct
{
  value = self->_motionClient.__ptr_.__value_;
  self->_motionClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  double v4 = self->_statusClient.__ptr_.__value_;
  self->_statusClient.__ptr_.__value_ = 0;
  if (v4) {
    (*(void (**)(Client *, SEL))(*(void *)v4 + 8))(v4, a2);
  }
  id v5 = self->_wifiClient.__ptr_.__value_;
  self->_wifiClient.__ptr_.__value_ = 0;
  if (v5)
  {
    id v6 = *(void (**)(void))(*(void *)v5 + 8);
    v6();
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end