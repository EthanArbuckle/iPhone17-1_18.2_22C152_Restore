@interface CLCardioChangeService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)checkDeferral:(id)a3;
- (CLCardioChangeService)init;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
- (void)executeCardioChangeEstimation:(id)a3;
- (void)executeDailyAggregateFeatureCompute:(id)a3;
- (void)executeRiskModelFeatureCompute;
- (void)logAnalytics:(EstimateResult *)a3;
- (void)markXpcActivityDone:(id)a3;
- (void)onChangeEstimationActivity:(id)a3;
- (void)onDailyAggregateFeatureComputeActivity:(id)a3;
- (void)onNatalimetryNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)resetCardioChangeEstimationActivity:(id)a3 withDelay:(int64_t)a4;
- (void)resetWeeklyRiskModuleComputeTime;
- (void)scheduleChangeEstimation;
- (void)scheduleDailyAggregateFeatureCompute;
- (void)scheduleWeeklyRiskModelCompute;
- (void)sendAnalytics;
- (void)sendCoreAnalyticsEvent:(RiskModelFeatureInput *)a3;
- (void)setUpAggregationOnTimer;
@end

@implementation CLCardioChangeService

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
  if (qword_1024877B0 != -1) {
    dispatch_once(&qword_1024877B0, &stru_102323978);
  }
  return (id)qword_1024877A8;
}

- (CLCardioChangeService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLCardioChangeService;
  return [(CLCardioChangeService *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLCardioChangeServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLCardioChangeServiceClientProtocol];
}

+ (BOOL)isSupported
{
  if (qword_1024877C0 != -1) {
    dispatch_once(&qword_1024877C0, &stru_102323998);
  }
  return byte_1024877B8;
}

- (void)beginService
{
  if (qword_1024192B0 != -1) {
    dispatch_once(&qword_1024192B0, &stru_102323A88);
  }
  objc_super v3 = qword_1024192B8;
  if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting up CLCardioChangeService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024192B0 != -1) {
      dispatch_once(&qword_1024192B0, &stru_102323A88);
    }
    __int16 v10 = 0;
    v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCardioChangeService beginService]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  unsigned __int8 v9 = 0;
  sub_1013D5554(&v9, buf);
  shared_ptr<CLCardioChangeHistoryDb> v4 = *(shared_ptr<CLCardioChangeHistoryDb> *)buf;
  memset(buf, 0, sizeof(buf));
  cntrl = self->fOutputDb.__cntrl_;
  self->fOutputDb = v4;
  if (cntrl)
  {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
    if (*(void *)&buf[8]) {
      sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
    }
  }
  unsigned __int8 v9 = 0;
  sub_1013D56AC(&v9, buf);
  shared_ptr<CLCardioChangeFeatureHistoryDb> v6 = *(shared_ptr<CLCardioChangeFeatureHistoryDb> *)buf;
  memset(buf, 0, sizeof(buf));
  v7 = self->fAggregateFeatureDb.__cntrl_;
  self->fAggregateFeatureDb = v6;
  if (v7)
  {
    sub_1000DB0A0((std::__shared_weak_count *)v7);
    if (*(void *)&buf[8]) {
      sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
    }
  }
  operator new();
}

- (void)endService
{
  if (qword_1024192B0 != -1) {
    dispatch_once(&qword_1024192B0, &stru_102323A88);
  }
  v2 = qword_1024192B8;
  if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Shutting down CLCardioChangeService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024192B0 != -1) {
      dispatch_once(&qword_1024192B0, &stru_102323A88);
    }
    objc_super v3 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCardioChangeService endService]", "%s\n", v3);
    if (v3 != (char *)buf) {
      free(v3);
    }
  }
}

- (void)setUpAggregationOnTimer
{
  sub_1013CF244((void **)self->fChangeAggregator.__ptr_.__value_, 86400.0);
  sub_1013CF4FC((void **)self->fDailyAggregateFeatureAggregator.__ptr_.__value_, 8985600.0);
  int v10 = 86400;
  uint64_t v3 = sub_1000D3E78();
  sub_10006B564(v3, &v8);
  sub_10006EF84(v8, "CardioChangeAggregationTimeInterval", &v10);
  if (v9) {
    sub_1000DB0A0(v9);
  }
  uint64_t v4 = 1000000000 * v10;
  unint64_t v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)[objc_msgSend(-[CLCardioChangeService universe](self, "universe"), "silo") queue]);
  self->fAggregationTimer = v5;
  dispatch_source_set_timer((dispatch_source_t)v5, 0, v4, 0xDF8475800uLL);
  fAggregationTimer = self->fAggregationTimer;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1013CF7B4;
  v7[3] = &unk_10229FED8;
  v7[4] = self;
  dispatch_source_set_event_handler(fAggregationTimer, v7);
  dispatch_resume((dispatch_object_t)self->fAggregationTimer);
}

- (void)onNatalimetryNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [self universe].silo
  if (*a3 == 2)
  {
    sub_1014E767C((uint64_t)self->fCardioChangeEstimator.__ptr_.__value_, (long long *)a4);
    self->fStats.biologicalSex = *((_DWORD *)a4 + 1);
    self->fStats.age = *((float *)a4 + 5);
    self->fStats.betaBlockerUse = *((unsigned char *)a4 + 48);
    float v7 = *((float *)a4 + 3);
    if (v7 != 0.0)
    {
      float v8 = *((float *)a4 + 2);
      if (v8 != 0.0) {
        self->fStats.userBMI = v7 / (float)(v8 * v8);
      }
    }
  }
  else
  {
    if (qword_1024192B0 != -1) {
      dispatch_once(&qword_1024192B0, &stru_102323A88);
    }
    unsigned __int8 v9 = qword_1024192B8;
    if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_ERROR))
    {
      int v10 = *a3;
      *(_DWORD *)buf = 67109120;
      int v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "CLCardioChangeService: Unhandled notification type, %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192B0 != -1) {
        dispatch_once(&qword_1024192B0, &stru_102323A88);
      }
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLCardioChangeService onNatalimetryNotification:data:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
}

- (void)onChangeEstimationActivity:(id)a3
{
  if (!a3)
  {
    if (qword_1024192B0 != -1) {
      dispatch_once(&qword_1024192B0, &stru_102323A88);
    }
    float v8 = qword_1024192B8;
    if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid xpc activity.", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024192B0 == -1)
    {
LABEL_28:
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLCardioChangeService onChangeEstimationActivity:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
      return;
    }
LABEL_30:
    dispatch_once(&qword_1024192B0, &stru_102323A88);
    goto LABEL_28;
  }
  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    if (qword_1024192B0 != -1) {
      dispatch_once(&qword_1024192B0, &stru_102323A88);
    }
    float v7 = qword_1024192B8;
    if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Preparing to execute CardioChangeEstimation", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192B0 != -1) {
        dispatch_once(&qword_1024192B0, &stru_102323A88);
      }
      int v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCardioChangeService onChangeEstimationActivity:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    [(CLCardioChangeService *)self executeCardioChangeEstimation:a3];
    return;
  }
  if (qword_1024192B0 != -1) {
    dispatch_once(&qword_1024192B0, &stru_102323A88);
  }
  unsigned __int8 v9 = qword_1024192B8;
  if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    xpc_activity_state_t v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unexpected CardioChangeEstimation activity state: %ld", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024192B0 == -1) {
      goto LABEL_28;
    }
    goto LABEL_30;
  }
}

- (void)scheduleChangeEstimation
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v15 = 0.0;
  uint64_t v4 = sub_1000A6958();
  sub_1000A699C(v4, "CardioChangeNextEstimationTime", &v15);
  double v5 = v15;
  sub_101A2AFB4(buf, "CardioChangeActivityInterval", &XPC_ACTIVITY_INTERVAL_7_DAYS, 0);
  if (v5 <= Current + (double)*(uint64_t *)&v23[4])
  {
    double v8 = v15;
  }
  else
  {
    if (qword_1024192B0 != -1) {
      dispatch_once(&qword_1024192B0, &stru_102323A88);
    }
    xpc_activity_state_t v6 = qword_1024192B8;
    if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)v23 = "CardioChangeNextEstimationTime";
      *(_WORD *)&v23[8] = 2050;
      *(double *)&v23[10] = v15;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s is too far in the future (%{public}.2f). Resetting!", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192B0 != -1) {
        dispatch_once(&qword_1024192B0, &stru_102323A88);
      }
      int v16 = 136446466;
      v17 = "CardioChangeNextEstimationTime";
      __int16 v18 = 2050;
      double v19 = v15;
      xpc_activity_state_t v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLCardioChangeService scheduleChangeEstimation]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
    uint64_t v7 = sub_1000A6958();
    sub_1004CF7DC(v7, "CardioChangeNextEstimationTime", 0xFFFFFFFFLL);
    double v15 = 0.0;
    double v8 = 0.0;
  }
  double v9 = v8 - Current;
  if (XPC_ACTIVITY_INTERVAL_30_MIN <= (uint64_t)v9) {
    int64_t v10 = (uint64_t)v9;
  }
  else {
    int64_t v10 = XPC_ACTIVITY_INTERVAL_30_MIN;
  }
  if (qword_1024192B0 != -1) {
    dispatch_once(&qword_1024192B0, &stru_102323A88);
  }
  v11 = qword_1024192B8;
  if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    *(void *)v23 = "com.apple.locationd.CardioChange.Processing";
    *(_WORD *)&v23[8] = 2050;
    *(double *)&v23[10] = v15;
    __int16 v24 = 2050;
    int64_t v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s: Registering XPC Activity with nextEstimationTime=(%{public}.2f) and delay=(%{public}lld)", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024192B0 != -1) {
      dispatch_once(&qword_1024192B0, &stru_102323A88);
    }
    int v16 = 136446722;
    v17 = "com.apple.locationd.CardioChange.Processing";
    __int16 v18 = 2050;
    double v19 = v15;
    __int16 v20 = 2050;
    int64_t v21 = v10;
    v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCardioChangeService scheduleChangeEstimation]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  xpc_activity_unregister("com.apple.locationd.CardioChange.Processing");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1013D0F6C;
  handler[3] = &unk_1022AD1E8;
  handler[4] = [objc_msgSend(-[CLCardioChangeService universe](self, "universe"), "vendor") proxyForService:@"CLCardioChangeService"];
  handler[5] = v10;
  xpc_activity_register("com.apple.locationd.CardioChange.Processing", XPC_ACTIVITY_CHECK_IN, handler);
}

- (void)executeCardioChangeEstimation:(id)a3
{
  if (objc_msgSend(objc_msgSend(objc_msgSend((id)sub_1013D1830(), "sharedInstance"), "getPairedDevices"), "count"))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (qword_1024192B0 != -1) {
      dispatch_once(&qword_1024192B0, &stru_102323A88);
    }
    xpc_activity_state_t v6 = qword_1024192B8;
    if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      double v16 = Current + -7776000.0;
      __int16 v17 = 2048;
      double v18 = Current;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "executeCardioChangeEstimation - startTime %f, endTime %f", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192B0 != -1) {
        dispatch_once(&qword_1024192B0, &stru_102323A88);
      }
      int v11 = 134218240;
      double v12 = Current + -7776000.0;
      __int16 v13 = 2048;
      double v14 = Current;
      double v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCardioChangeService executeCardioChangeEstimation:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
    value = self->fHKQueryDelegate.__ptr_.__value_;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1013D1920;
    v10[3] = &unk_1023239E0;
    v10[4] = a3;
    v10[5] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1013D1BE8;
    v9[3] = &unk_102323A08;
    v9[4] = a3;
    sub_10039A8F8((uint64_t)value, [[-[CLCardioChangeService universe](self, "universe") silo] stringByAppendingPathComponent:@"DBCShutdownCookie"], (uint64_t)v10, (uint64_t)v9, Current + -7776000.0, Current);
  }
  else
  {
    [(CLCardioChangeService *)self resetCardioChangeEstimationActivity:a3 withDelay:XPC_ACTIVITY_INTERVAL_7_DAYS];
  }
}

- (void)resetCardioChangeEstimationActivity:(id)a3 withDelay:(int64_t)a4
{
  double v6 = CFAbsoluteTimeGetCurrent() + (double)a4;
  double v10 = v6;
  if (qword_1024192B0 != -1) {
    dispatch_once(&qword_1024192B0, &stru_102323A88);
  }
  uint64_t v7 = qword_1024192B8;
  if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v16 = "CardioChangeNextEstimationTime";
    __int16 v17 = 2050;
    double v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: Resetting next activity time to: %{public}.1f", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024192B0 != -1) {
      dispatch_once(&qword_1024192B0, &stru_102323A88);
    }
    int v11 = 136446466;
    double v12 = "CardioChangeNextEstimationTime";
    __int16 v13 = 2050;
    double v14 = v6;
    double v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCardioChangeService resetCardioChangeEstimationActivity:withDelay:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  uint64_t v8 = sub_1000A6958();
  sub_10016332C(v8, "CardioChangeNextEstimationTime", &v10);
  [(CLCardioChangeService *)self markXpcActivityDone:a3];
  [(CLCardioChangeService *)self scheduleChangeEstimation];
}

- (void)markXpcActivityDone:(id)a3
{
  if (!xpc_activity_set_state((xpc_activity_t)a3, 5))
  {
    if (qword_1024192B0 != -1) {
      dispatch_once(&qword_1024192B0, &stru_102323A88);
    }
    uint64_t v4 = qword_1024192B8;
    if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134349056;
      xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "Failed to mark activity as done. Current state is %{public}ld", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192B0 != -1) {
        dispatch_once(&qword_1024192B0, &stru_102323A88);
      }
      xpc_activity_get_state((xpc_activity_t)a3);
      double v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLCardioChangeService markXpcActivityDone:]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
  }
}

- (void)scheduleDailyAggregateFeatureCompute
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  sub_101A2AFB4(v5, "DailyAggregateFeatureComputeIntervalTime", &XPC_ACTIVITY_INTERVAL_1_DAY, 0);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, value);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_5_MIN);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_4_HOURS);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1013D2450;
  v4[3] = &unk_1022B9CD0;
  v4[4] = [[-[CLCardioChangeService universe](self, "universe") vendor] proxyForService:@"CLCardioChangeService"];
  xpc_activity_register("com.apple.locationd.CardioChange.DailyAggregateFeatureCompute", v3, v4);
  xpc_release(v3);
}

- (void)scheduleWeeklyRiskModelCompute
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v8 = 0.0;
  uint64_t v3 = sub_1000A6958();
  sub_1000A699C(v3, "WeeklyRiskModelEstimationTime", &v8);
  if (v8 == 0.0)
  {
    double v8 = floor(Current / 86400.0) * 86400.0 + 604800.0;
    uint64_t v4 = sub_1000A6958();
    sub_10016332C(v4, "WeeklyRiskModelEstimationTime", &v8);
    uint64_t v5 = *(void *)sub_1000A6958();
    (*(void (**)(void))(v5 + 944))();
  }
  else
  {
    if (qword_1024192B0 != -1) {
      dispatch_once(&qword_1024192B0, &stru_102323A88);
    }
    double v6 = qword_1024192B8;
    if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      double v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Weekly Risk Model Estimation time already set, %f", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192B0 != -1) {
        dispatch_once(&qword_1024192B0, &stru_102323A88);
      }
      int v9 = 134217984;
      double v10 = v8;
      uint64_t v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCardioChangeService scheduleWeeklyRiskModelCompute]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
}

- (void)resetWeeklyRiskModuleComputeTime
{
  uint64_t v2 = sub_1000A6958();

  sub_1004CF7DC(v2, "WeeklyRiskModelEstimationTime", 0xFFFFFFFFLL);
}

- (void)onDailyAggregateFeatureComputeActivity:(id)a3
{
  if (!a3)
  {
    if (qword_1024192B0 != -1) {
      dispatch_once(&qword_1024192B0, &stru_102323A88);
    }
    double v8 = qword_1024192B8;
    if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v13 = "com.apple.locationd.CardioChange.DailyAggregateFeatureCompute";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid xpc activity, expecting (%s).", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024192B0 == -1)
    {
LABEL_29:
      int v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLCardioChangeService onDailyAggregateFeatureComputeActivity:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
      return;
    }
LABEL_31:
    dispatch_once(&qword_1024192B0, &stru_102323A88);
    goto LABEL_29;
  }
  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (double v6 = (const char *)state, state == 2))
  {
    if (![(CLCardioChangeService *)self checkDeferral:a3])
    {
      if (qword_1024192B0 != -1) {
        dispatch_once(&qword_1024192B0, &stru_102323A88);
      }
      uint64_t v7 = qword_1024192B8;
      if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Preparing to execute DailyAggregateFeatureCompute", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024192B0 != -1) {
          dispatch_once(&qword_1024192B0, &stru_102323A88);
        }
        double v10 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCardioChangeService onDailyAggregateFeatureComputeActivity:]", "%s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
      }
      [(CLCardioChangeService *)self executeDailyAggregateFeatureCompute:a3];
    }
    return;
  }
  if (qword_1024192B0 != -1) {
    dispatch_once(&qword_1024192B0, &stru_102323A88);
  }
  int v9 = qword_1024192B8;
  if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    __int16 v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unexpected DailyAggregateFeatureCompute activity state: %ld", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024192B0 == -1) {
      goto LABEL_29;
    }
    goto LABEL_31;
  }
}

- (void)executeDailyAggregateFeatureCompute:(id)a3
{
  if (objc_msgSend(objc_msgSend(objc_msgSend((id)sub_1013D1830(), "sharedInstance"), "getPairedDevices"), "count"))
  {
    uint64_t v18 = 0;
    double v19 = 0.0;
    int v20 = -1;
    uint64_t v21 = 0;
    uint64_t v5 = 0;
    double v6 = floor(CFAbsoluteTimeGetCurrent() / 86400.0) * 86400.0;
    double v16 = 0;
    uint64_t v17 = 0;
    double v15 = (uint64_t *)&v16;
    do
    {
      int v14 = dword_101DB5978[v5];
      if (sub_10046233C((uint64_t)self->fAggregateFeatureDb.__ptr_) == 100)
      {
        double v7 = v19;
        *(void *)buf = &v14;
        if (v19 <= 0.0) {
          *((double *)sub_1000FEE0C(&v15, &v14, (uint64_t)&unk_101D0B290, (_DWORD **)buf) + 5) = v6 + -7776000.0;
        }
        else {
          *((double *)sub_1000FEE0C(&v15, &v14, (uint64_t)&unk_101D0B290, (_DWORD **)buf) + 5) = v7 + 86400.0;
        }
      }
      ++v5;
    }
    while (v5 != 8);
    if (v17 == 8)
    {
      int64_t value = self->fCardioChangeEstimator.__ptr_.__value_;
      sub_1013D5D00((uint64_t *)v13, (uint64_t)&v15);
      sub_1014E7918((uint64_t)value, v13, v6);
      sub_1000F5BB0((uint64_t)v13, v13[1]);
      [(CLCardioChangeService *)self executeRiskModelFeatureCompute];
    }
    else
    {
      if (qword_1024192B0 != -1) {
        dispatch_once(&qword_1024192B0, &stru_102323A88);
      }
      double v10 = qword_1024192B8;
      if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to get startTimes for all aggregate features", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024192B0 != -1) {
          dispatch_once(&qword_1024192B0, &stru_102323A88);
        }
        LOWORD(v14) = 0;
        double v12 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLCardioChangeService executeDailyAggregateFeatureCompute:]", "%s\n", v12);
        if (v12 != (char *)buf) {
          free(v12);
        }
      }
    }
    [(CLCardioChangeService *)self markXpcActivityDone:a3];
    sub_1000F5BB0((uint64_t)&v15, v16);
  }
  else
  {
    if (qword_1024192B0 != -1) {
      dispatch_once(&qword_1024192B0, &stru_102323A88);
    }
    int v9 = qword_1024192B8;
    if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No paired watch, exit early", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192B0 != -1) {
        dispatch_once(&qword_1024192B0, &stru_102323A88);
      }
      LOWORD(v18) = 0;
      int v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCardioChangeService executeDailyAggregateFeatureCompute:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    [(CLCardioChangeService *)self markXpcActivityDone:a3];
  }
}

- (void)executeRiskModelFeatureCompute
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v21 = 0.0;
  uint64_t v4 = sub_1000A6958();
  sub_1000A699C(v4, "WeeklyRiskModelEstimationTime", &v21);
  if (v21 <= 0.0 || v21 > Current)
  {
    if (qword_1024192B0 != -1) {
      dispatch_once(&qword_1024192B0, &stru_102323A88);
    }
    double v6 = qword_1024192B8;
    if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v39 = v21;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Weekly risk model estimation scheduled to run at %f", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192B0 != -1) {
        dispatch_once(&qword_1024192B0, &stru_102323A88);
      }
      int v22 = 134217984;
      double v23 = v21;
      double v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCardioChangeService executeRiskModelFeatureCompute]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
  else
  {
    if (qword_1024192B0 != -1) {
      dispatch_once(&qword_1024192B0, &stru_102323A88);
    }
    double v8 = qword_1024192B8;
    if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v39 = v21;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Running risk model compute, estimationTime, %f", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192B0 != -1) {
        dispatch_once(&qword_1024192B0, &stru_102323A88);
      }
      int v22 = 134217984;
      double v23 = v21;
      int v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCardioChangeService executeRiskModelFeatureCompute]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    uint64_t v20 = 0;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    if (sub_1014E8948((uint64_t)self->fCardioChangeEstimator.__ptr_.__value_, (uint64_t)&v16))
    {
      if (qword_1024192B0 != -1) {
        dispatch_once(&qword_1024192B0, &stru_102323A88);
      }
      int v9 = qword_1024192B8;
      if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134219776;
        double v39 = *((double *)&v16 + 1);
        __int16 v40 = 2048;
        uint64_t v41 = v17;
        __int16 v42 = 2048;
        uint64_t v43 = *((void *)&v17 + 1);
        __int16 v44 = 2048;
        uint64_t v45 = v18;
        __int16 v46 = 2048;
        uint64_t v47 = *((void *)&v18 + 1);
        __int16 v48 = 2048;
        uint64_t v49 = v19;
        __int16 v50 = 2048;
        uint64_t v51 = *((void *)&v19 + 1);
        __int16 v52 = 2048;
        uint64_t v53 = v20;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Risk Model input features, sessionVo2maxDailyMean_Window0to90_Mean,%.2f, sessionHRRecovery_DailyMean_Window0to90_Mean,%.2f, heartRateDailyMax_Window0To90_Mean,%.2f, sixMinuteWalkDistanceDailyMean_Window0To90_Mean,%.2f,walkingHeartRateAverageDailyMean_Window0To90_Mean, %.2f,walkingSpeedNormLegLengthDailyMax_Window0to90_Mean,%.2f,stairAscentSpeedDailyMean_Window0to90_Mean,%.2f, stairDescentSpeedDailyMean_Window0to90_Mean,%.2f", buf, 0x52u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024192B0 != -1) {
          dispatch_once(&qword_1024192B0, &stru_102323A88);
        }
        int v22 = 134219776;
        double v23 = *((double *)&v16 + 1);
        __int16 v24 = 2048;
        uint64_t v25 = v17;
        __int16 v26 = 2048;
        uint64_t v27 = *((void *)&v17 + 1);
        __int16 v28 = 2048;
        uint64_t v29 = v18;
        __int16 v30 = 2048;
        uint64_t v31 = *((void *)&v18 + 1);
        __int16 v32 = 2048;
        uint64_t v33 = v19;
        __int16 v34 = 2048;
        uint64_t v35 = *((void *)&v19 + 1);
        __int16 v36 = 2048;
        uint64_t v37 = v20;
        double v12 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCardioChangeService executeRiskModelFeatureCompute]", "%s\n", v12);
        if (v12 != (char *)buf) {
          free(v12);
        }
      }
      v14[2] = v18;
      v14[3] = v19;
      uint64_t v15 = v20;
      v14[0] = v16;
      v14[1] = v17;
      [(CLCardioChangeService *)self sendCoreAnalyticsEvent:v14];
      sub_1014E8F78((uint64_t)self->fCardioChangeEstimator.__ptr_.__value_, (double *)&v16, (uint64_t)&v22);
      sub_1014E8E24((uint64_t)self->fCardioChangeEstimator.__ptr_.__value_, (uint64_t)&v16);
      if (*(_DWORD *)((char *)&v25 + 2) == 1)
      {
        if (qword_1024192B0 != -1) {
          dispatch_once(&qword_1024192B0, &stru_102323A88);
        }
        double v10 = qword_1024192B8;
        if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CLCardioChangeService: Change detected. Firing alarm and notifying watch.", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024192B0 != -1) {
            dispatch_once(&qword_1024192B0, &stru_102323A88);
          }
          __int16 v13 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCardioChangeService executeRiskModelFeatureCompute]", "%s\n", v13);
          if (v13 != (char *)buf) {
            free(v13);
          }
        }
        [objc_msgSend(-[CLCardioChangeService universe](self, "universe"), "vendor") proxyForService:@"CLCompanionNotifier"] doAsync:&stru_102323A28;
      }
      [(CLCardioChangeService *)self resetWeeklyRiskModuleComputeTime];
      [(CLCardioChangeService *)self scheduleWeeklyRiskModelCompute];
    }
  }
}

- (BOOL)checkDeferral:(id)a3
{
  if (a3)
  {
    BOOL should_defer = xpc_activity_should_defer((xpc_activity_t)a3);
    if (should_defer)
    {
      if (qword_1024192B0 != -1) {
        dispatch_once(&qword_1024192B0, &stru_102323A88);
      }
      uint64_t v5 = qword_1024192B8;
      if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        __int16 v13 = "com.apple.locationd.CardioChange.DailyAggregateFeatureCompute";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Service] Cancelling (%{public}s) early due to deferral.", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024192B0 != -1) {
          dispatch_once(&qword_1024192B0, &stru_102323A88);
        }
        double v10 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCardioChangeService checkDeferral:]", "%s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
      }
      if (xpc_activity_set_state((xpc_activity_t)a3, 3))
      {
        if (qword_1024192B0 != -1) {
          dispatch_once(&qword_1024192B0, &stru_102323A88);
        }
        double v6 = qword_1024192B8;
        if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[Service] Activity deferred", buf, 2u);
        }
        if (!sub_10013D1A0(115, 2)) {
          goto LABEL_24;
        }
        bzero(buf, 0x65CuLL);
        if (qword_1024192B0 != -1) {
          dispatch_once(&qword_1024192B0, &stru_102323A88);
        }
        double v7 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCardioChangeService checkDeferral:]", "%s\n", v7);
        if (v7 == (char *)buf) {
          goto LABEL_24;
        }
      }
      else
      {
        if (qword_1024192B0 != -1) {
          dispatch_once(&qword_1024192B0, &stru_102323A88);
        }
        double v8 = qword_1024192B8;
        if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_FAULT))
        {
          xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
          *(_DWORD *)buf = 134349056;
          __int16 v13 = (const char *)state;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "[Service] Failed to defer activity. Current state is %{public}ld", buf, 0xCu);
        }
        if (!sub_10013D1A0(115, 0)) {
          goto LABEL_24;
        }
        bzero(buf, 0x65CuLL);
        if (qword_1024192B0 != -1) {
          dispatch_once(&qword_1024192B0, &stru_102323A88);
        }
        xpc_activity_get_state((xpc_activity_t)a3);
        double v7 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLCardioChangeService checkDeferral:]", "%s\n", v7);
        if (v7 == (char *)buf) {
          goto LABEL_24;
        }
      }
      free(v7);
LABEL_24:
      LOBYTE(should_defer) = 1;
    }
  }
  else
  {
    LOBYTE(should_defer) = 0;
  }
  return should_defer;
}

- (void)logAnalytics:(EstimateResult *)a3
{
  uint64_t v48 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  uint64_t v5 = sub_1011E124C();
  if (sub_1011E1BBC(v5, &v47))
  {
    int v6 = llround(v49);
  }
  else
  {
    if (qword_1024192B0 != -1) {
      dispatch_once(&qword_1024192B0, &stru_102323A88);
    }
    double v7 = qword_1024192B8;
    if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CardioChange, unable to access DB due to device lock.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192B0 != -1) {
        dispatch_once(&qword_1024192B0, &stru_102323A88);
      }
      int v22 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCardioChangeService logAnalytics:]", "%s\n", v22);
      if (v22 != (char *)buf) {
        free(v22);
      }
    }
    int v6 = -1;
  }
  self->fStats.int vo2Max = v6;
  self->fStats.int status = a3->var2;
  if (qword_1024192B0 != -1) {
    dispatch_once(&qword_1024192B0, &stru_102323A88);
  }
  double v8 = qword_1024192B8;
  if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_DEBUG))
  {
    double age = self->fStats.age;
    int biologicalSex = self->fStats.biologicalSex;
    BOOL betaBlockerUse = self->fStats.betaBlockerUse;
    double userBMI = self->fStats.userBMI;
    int status = self->fStats.status;
    double meanVO2MaxFromClusters = self->fStats.meanVO2MaxFromClusters;
    double likelihoodRatio = self->fStats.likelihoodRatio;
    double maxAcceptedChange = self->fStats.maxAcceptedChange;
    double minConfidenceRatio = self->fStats.minConfidenceRatio;
    int numClustersContributed = self->fStats.numClustersContributed;
    double slope = self->fStats.slope;
    int vo2Max = self->fStats.vo2Max;
    *(_DWORD *)buf = 134220800;
    double v24 = age;
    __int16 v25 = 1024;
    int v26 = biologicalSex;
    __int16 v27 = 1024;
    BOOL v28 = betaBlockerUse;
    __int16 v29 = 2048;
    double v30 = userBMI;
    __int16 v31 = 1024;
    int v32 = status;
    __int16 v33 = 2048;
    double v34 = meanVO2MaxFromClusters;
    __int16 v35 = 2048;
    double v36 = likelihoodRatio;
    __int16 v37 = 2048;
    double v38 = maxAcceptedChange;
    __int16 v39 = 2048;
    double v40 = minConfidenceRatio;
    __int16 v41 = 1024;
    int v42 = numClustersContributed;
    __int16 v43 = 2048;
    double v44 = slope;
    __int16 v45 = 1024;
    int v46 = vo2Max;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "CardioChange Analytics,age,%.2f,biologicalSex,%d,useBetaBlocker,%d,userBMI,%.2f,status,%d,avgFromClustersVO2Max,%.2f,likelihoodRatio,%.2f,maxAcceptedChange,%.2f,minConfidenceRatio,%.2f,numClustersContributed,%d,slope,%.2f,vo2Max,%d", buf, 0x66u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024192B0 != -1) {
      dispatch_once(&qword_1024192B0, &stru_102323A88);
    }
    double v21 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCardioChangeService logAnalytics:]", "%s\n", v21);
    if (v21 != (char *)buf) {
      free(v21);
    }
  }
  [(CLCardioChangeService *)self sendAnalytics];
}

- (void)sendAnalytics
{
  if (objc_opt_class()
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1024877E0, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1024877E0))
    {
      int v7 = 1118961664;
      *(_OWORD *)buf = xmmword_101DB5998;
      long long v6 = unk_101DB59A8;
      sub_1003B17B4(&qword_1024877C8, buf, 9uLL);
      __cxa_atexit((void (*)(void *))sub_1003B1838, &qword_1024877C8, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_1024877E0);
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_102487800, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_102487800))
    {
      LODWORD(v6) = 1108056474;
      *(_OWORD *)buf = xmmword_101DB59BC;
      sub_1003B17B4(&qword_1024877E8, buf, 5uLL);
      __cxa_atexit((void (*)(void *))sub_1003B1838, &qword_1024877E8, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_102487800);
    }
    AnalyticsSendEventLazy();
    if (qword_1024192B0 != -1) {
      dispatch_once(&qword_1024192B0, &stru_102323A88);
    }
    uint64_t v2 = qword_1024192B8;
    if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "CardioChange, sent Core Analytics event.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192B0 == -1)
      {
LABEL_19:
        uint64_t v4 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCardioChangeService sendAnalytics]", "%s\n", v4);
        if (v4 != (char *)buf) {
          free(v4);
        }
        return;
      }
LABEL_25:
      dispatch_once(&qword_1024192B0, &stru_102323A88);
      goto LABEL_19;
    }
  }
  else
  {
    if (qword_1024192B0 != -1) {
      dispatch_once(&qword_1024192B0, &stru_102323A88);
    }
    uint64_t v3 = qword_1024192B8;
    if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CardioChange, not sending analytics, no IHA permission", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192B0 == -1) {
        goto LABEL_19;
      }
      goto LABEL_25;
    }
  }
}

- (void)sendCoreAnalyticsEvent:(RiskModelFeatureInput *)a3
{
  if (objc_opt_class()
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_102487820, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_102487820))
    {
      *(_OWORD *)buf = xmmword_101DB59D0;
      *(_OWORD *)&buf[12] = *(long long *)((char *)&xmmword_101DB59D0 + 12);
      sub_1003B17B4(&qword_102487808, buf, 7uLL);
      __cxa_atexit((void (*)(void *))sub_1003B1838, &qword_102487808, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_102487820);
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_102487840, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_102487840))
    {
      *(_OWORD *)buf = xmmword_101DB59EC;
      *(_OWORD *)&uint8_t buf[16] = unk_101DB59FC;
      *(void *)&buf[32] = 0x3FF333333FECCCCDLL;
      sub_1003B17B4(&qword_102487828, buf, 0xAuLL);
      __cxa_atexit((void (*)(void *))sub_1003B1838, &qword_102487828, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_102487840);
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_102487860, memory_order_acquire) & 1) == 0)
    {
      if (__cxa_guard_acquire(&qword_102487860))
      {
        *(_OWORD *)buf = xmmword_101DB5A14;
        *(_OWORD *)&uint8_t buf[16] = unk_101DB5A24;
        *(_OWORD *)&buf[28] = unk_101DB5A30;
        sub_1003B17B4(&qword_102487848, buf, 0xBuLL);
        __cxa_atexit((void (*)(void *))sub_1003B1838, &qword_102487848, (void *)&_mh_execute_header);
        __cxa_guard_release(&qword_102487860);
      }
    }
    memmove(v6, (char *)self->fCardioChangeEstimator.__ptr_.__value_ + 64, 0x3CuLL);
    AnalyticsSendEventLazy();
  }
  else
  {
    if (qword_1024192B0 != -1) {
      dispatch_once(&qword_1024192B0, &stru_102323A88);
    }
    uint64_t v4 = qword_1024192B8;
    if (os_log_type_enabled((os_log_t)qword_1024192B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "CardioChange, not sending analytics, no IHA permission", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192B0 != -1) {
        dispatch_once(&qword_1024192B0, &stru_102323A88);
      }
      v6[32] = 0;
      uint64_t v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCardioChangeService sendCoreAnalyticsEvent:]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
  }
}

- (void).cxx_destruct
{
  cntrl = self->fHRRecoverySessionDb.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  uint64_t v4 = self->fVO2MaxOutputDb.__cntrl_;
  if (v4) {
    sub_1000DB0A0((std::__shared_weak_count *)v4);
  }
  sub_1013D5880((uint64_t *)&self->fHKQueryDelegate, 0);
  int64_t value = self->fCardioChangeEstimator.__ptr_.__value_;
  self->fCardioChangeEstimator.__ptr_.__value_ = 0;
  if (value) {
    sub_1013D5804((uint64_t)&self->fCardioChangeEstimator, value);
  }
  long long v6 = self->fNatalimetryClient.__ptr_.__value_;
  self->fNatalimetryClient.__ptr_.__value_ = 0;
  if (v6) {
    (*(void (**)(Client *))(*(void *)v6 + 8))(v6);
  }
  sub_1003B273C((uint64_t *)&self->fDailyAggregateFeatureAggregator, 0);
  sub_1003B273C((uint64_t *)&self->fChangeAggregator, 0);
  int v7 = self->fAggregateFeatureDb.__cntrl_;
  if (v7) {
    sub_1000DB0A0((std::__shared_weak_count *)v7);
  }
  double v8 = self->fOutputDb.__cntrl_;
  if (v8)
  {
    sub_1000DB0A0((std::__shared_weak_count *)v8);
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
  *((_DWORD *)self + 16) = 0;
  __asm { FMOV            V0.2S, #-1.0 }
  *((unsigned char *)self + 76) = 0;
  *((void *)self + 10) = 0xFFFFFFFFLL;
  *((_DWORD *)self + 22) = -1;
  *(void *)((char *)self + 100) = 0;
  *(void *)((char *)self + 92) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 16) = 0;
  *(void *)((char *)self + 68) = _D0;
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 20) = 0;
  return self;
}

@end