@interface CLMobilityWalkingBoutService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)checkDeferMobilityCompanionSyncActivity:(id)a3;
- (BOOL)checkDeferRequestForBoutsActivity:(id)a3;
- (CLMobilityWalkingBoutService)init;
- (NSMutableSet)boutClients;
- (NSMutableSet)steadinessClients;
- (float)BMIFromHeight:(float)a3 weight:(float)a4;
- (id).cxx_construct;
- (void)beginService;
- (void)checkForBoutsReadyToProcessWithCompletion:(id)a3 activity:(id)a4;
- (void)checkForHistoricalComputeTrigger:(CLBodyMetrics *)a3;
- (void)classifySteadinessWithCompletion:(id)a3 activity:(id)a4;
- (void)dealloc;
- (void)endService;
- (void)handleBoutResults:()vector<CLMobility:(std::allocator<CLMobility::ProcessedBoutResult>> *)a3 :ProcessedBoutResult;
- (void)onAggregationTimer;
- (void)onCompanionNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onDataCollectionRequested:(id)a3;
- (void)onMobilityClassificationActivity:(id)a3;
- (void)onMobilityCompanionSyncActivity:(id)a3;
- (void)onMobilityProcessBoutsActivity:(id)a3;
- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onMotionStateObserverNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onSPUGaitMetrics:(const SPUGaitMetrics *)a3;
- (void)onStatusNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onStepCountNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onUserInfoUpdate:(const int *)a3 data:(const NotificationData *)a4;
- (void)registerForMobilityBoutMetrics:(id)a3;
- (void)registerForWalkingSteadiness:(id)a3;
- (void)sendAnalyticsBoutMetrics:()vector<CLMobility:(std::allocator<CLMobility::ProcessedBoutResult>> *)a3 :ProcessedBoutResult;
- (void)sendAnalyticsSteadinessResult:(uint64_t)a1;
- (void)sendCompanionSyncAnalyticsWithMsgSize:(int)a3 isSuccess:(BOOL)a4 isActivityDeferred:(BOOL)a5 isActivityValid:(BOOL)a6 isWatchPaired:(BOOL)a7;
- (void)setBoutClients:(id)a3;
- (void)setCompanionSyncActivityAsDone:(id)a3;
- (void)setSteadinessClients:(id)a3;
- (void)setUpAggregationOnTimer;
- (void)setUpClassificationActivityWithDeferral:(BOOL)a3;
- (void)setUpMobilityCompanionSyncActivity;
- (void)setUpProcessBoutsActivity;
- (void)unregisterForMobilityBoutMetrics:(id)a3;
- (void)unregisterForWalkingSteadiness:(id)a3;
@end

@implementation CLMobilityWalkingBoutService

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [self universe:a3, a4, a5, a6, a7].silo
  if (!*a3)
  {
    value = self->fBoutExtractor.__ptr_.__value_;
    sub_1001C0274((uint64_t)value, (uint64_t)a4 + 8);
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
  if (qword_102482458 != -1) {
    dispatch_once(&qword_102482458, &stru_102305EB0);
  }
  return (id)qword_102482450;
}

- (CLMobilityWalkingBoutService)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLMobilityWalkingBoutService;
  v2 = [(CLMobilityWalkingBoutService *)&v4 initWithInboundProtocol:&OBJC_PROTOCOL___CLMobilityWalkingBoutServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLMobilityWalkingBoutServiceClientProtocol];
  if (v2)
  {
    [(CLMobilityWalkingBoutService *)v2 setBoutClients:objc_opt_new()];
    [(CLMobilityWalkingBoutService *)v2 setSteadinessClients:objc_opt_new()];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLMobilityWalkingBoutService;
  [(CLMobilityWalkingBoutService *)&v3 dealloc];
}

+ (BOOL)isSupported
{
  if (qword_102482468 != -1) {
    dispatch_once(&qword_102482468, &stru_102305ED0);
  }
  return byte_102482460;
}

- (void)beginService
{
  if (qword_1024191F0 != -1) {
    dispatch_once(&qword_1024191F0, &stru_102306018);
  }
  objc_super v3 = qword_1024191F8;
  if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Starting up CLMobilityWalkingBoutService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_102306018);
    }
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService beginService]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  LOBYTE(v7) = 0;
  sub_100F5288C((unsigned __int8 *)&v7, buf);
  shared_ptr<CLMobility::BoutBoundaryRecorderDb> v4 = *(shared_ptr<CLMobility::BoutBoundaryRecorderDb> *)buf;
  memset(buf, 0, sizeof(buf));
  cntrl = self->fBoutBoundaryDb.__cntrl_;
  self->fBoutBoundaryDb = v4;
  if (cntrl)
  {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
    if (*(void *)&buf[8]) {
      sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
    }
  }
  operator new();
}

- (void)endService
{
  if (qword_1024191F0 != -1) {
    dispatch_once(&qword_1024191F0, &stru_102306018);
  }
  objc_super v3 = qword_1024191F8;
  if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Shutting down CLMobilityWalkingBoutService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_102306018);
    }
    v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService endService]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  fAggregationTimer = self->fAggregationTimer;
  if (fAggregationTimer)
  {
    dispatch_source_cancel(fAggregationTimer);
    dispatch_release((dispatch_object_t)self->fAggregationTimer);
    self->fAggregationTimer = 0;
  }
  if (sub_1000D2E34(0))
  {
    uint64_t v5 = sub_1000D2E34(0);
    sub_1009D26C4(v5, 27, (uint64_t)self->fSPUGaitMetricsDispatcher.__ptr_.__value_);
  }
  value = self->fMotionStateObserverClient.__ptr_.__value_;
  self->fMotionStateObserverClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8))(value);
  }
  uint64_t v7 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  if (v7) {
    (*(void (**)(Client *))(*(void *)v7 + 8))(v7);
  }
  v8 = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = 0;
  if (v8) {
    (*(void (**)(Client *))(*(void *)v8 + 8))(v8);
  }

  self->fHealthKitWriter = 0;
}

- (void)onStepCountNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [(-[CLMobilityWalkingBoutService universe](self, "universe")) silo];
  if (*a3)
  {
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_102306018);
    }
    uint64_t v7 = qword_1024191F8;
    if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_ERROR))
    {
      int v8 = *a3;
      *(_DWORD *)buf = 67240192;
      int v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "CLMobilityWalkingBoutService: Received unexpected type %{public}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191F0 != -1) {
        dispatch_once(&qword_1024191F0, &stru_102306018);
      }
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService onStepCountNotification:data:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
  }
  else
  {
    value = self->fBoutExtractor.__ptr_.__value_;
    sub_100C79C64((uint64_t)value, (uint64_t)a4);
  }
}

- (void)onUserInfoUpdate:(const int *)a3 data:(const NotificationData *)a4
{
  [self universe].silo
  if (*a3 == 2)
  {
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_102306018);
    }
    uint64_t v7 = qword_1024191F8;
    if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLMobilityWalkingBoutService: Received user info update", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191F0 != -1) {
        dispatch_once(&qword_1024191F0, &stru_102306018);
      }
      LOWORD(v19) = 0;
      v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService onUserInfoUpdate:data:]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
    if (!sub_101A2CBF8((uint64_t)a4, (uint64_t)&self->_previousBodyMetrics))
    {
      sub_100C7ABD8((uint64_t)self->fBoutExtractor.__ptr_.__value_, (long long *)a4);
      sub_10159C8B4((uint64_t)self->fSteadinessClassifier.__ptr_.__value_, (uint64_t)a4);
      long long v8 = *((_OWORD *)a4 + 1);
      v17[0] = *(_OWORD *)a4;
      v17[1] = v8;
      v18[0] = *((_OWORD *)a4 + 2);
      *(_OWORD *)((char *)v18 + 12) = *(_OWORD *)((char *)a4 + 44);
      [(CLMobilityWalkingBoutService *)self checkForHistoricalComputeTrigger:v17];
    }
    long long v9 = *(_OWORD *)a4;
    long long v10 = *((_OWORD *)a4 + 1);
    long long v11 = *((_OWORD *)a4 + 2);
    *(_OWORD *)&self->_previousBodyMetrics.runVo2max = *(_OWORD *)((char *)a4 + 44);
    *(_OWORD *)&self->_previousBodyMetrics.vo2max = v10;
    *(_OWORD *)&self->_previousBodyMetrics.hronset = v11;
    *(_OWORD *)&self->_previousBodyMetrics.gender = v9;
  }
  else
  {
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_102306018);
    }
    int v12 = qword_1024191F8;
    if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = *a3;
      *(_DWORD *)buf = 67109120;
      int v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Warning Unhandled notification type, %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191F0 != -1) {
        dispatch_once(&qword_1024191F0, &stru_102306018);
      }
      int v15 = *a3;
      int v19 = 67109120;
      int v20 = v15;
      v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService onUserInfoUpdate:data:]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
  }
}

- (void)onStatusNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if ((*a3 == 17 || *a3 == 11) && !self->fIsMigrationComplete && *(unsigned char *)a4 != 0)
  {
    self->fIsMigrationComplete = 1;
    [*((id *)self->fDaemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->fDaemonStatusClient.__ptr_.__value_ + 1) forNotification:11];
    value = self->fDaemonStatusClient.__ptr_.__value_;
    uint64_t v9 = *((void *)value + 1);
    long long v8 = (void *)*((void *)value + 2);
    [v8 unregister:v9 forNotification:17];
  }
}

- (void)onMotionStateObserverNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [self universe].silo
  if (!*a3)
  {
    value = self->fBoutExtractor.__ptr_.__value_;
    sub_100C7B4F4((uint64_t)value, (uint64_t)a4);
  }
}

- (void)onSPUGaitMetrics:(const SPUGaitMetrics *)a3
{
  sub_100103240();
  if ((sub_1000A16E8() & 0x20000000000000) == 0)
  {
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_102306018);
    }
    uint64_t v5 = qword_1024191F8;
    if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "This device is not expected to support Gait Metrics. Please file a radar: rdar://component/1021534", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191F0 != -1) {
        dispatch_once(&qword_1024191F0, &stru_102306018);
      }
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService onSPUGaitMetrics:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
  sub_100C7ADFC((uint64_t)self->fBoutExtractor.__ptr_.__value_, (uint64_t)a3);
}

- (void)onCompanionNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [self.universe silo];
  if (*a3 == 5)
  {
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_102306018);
    }
    uint64_t v7 = qword_1024191F8;
    if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "companionConnected notification received.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191F0 != -1) {
        dispatch_once(&qword_1024191F0, &stru_102306018);
      }
      long long v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService onCompanionNotification:data:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    self->fCompanionConnected = *(unsigned char *)a4;
  }
  else
  {
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_102306018);
    }
    long long v8 = qword_1024191F8;
    if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_ERROR))
    {
      int v9 = *a3;
      *(_DWORD *)buf = 67109120;
      int v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unhandled notification type, %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191F0 != -1) {
        dispatch_once(&qword_1024191F0, &stru_102306018);
      }
      long long v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService onCompanionNotification:data:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
}

- (void)onMobilityProcessBoutsActivity:(id)a3
{
  if (!a3)
  {
    if (qword_102418FA0 != -1) {
      dispatch_once(&qword_102418FA0, &stru_102306038);
    }
    uint64_t v7 = qword_102418FA8;
    if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "com.apple.locationd.Mobility.ProcessBouts";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid xpc activity (%s).", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102418FA0 != -1) {
      dispatch_once(&qword_102418FA0, &stru_102306038);
    }
    int v11 = 136315138;
    int v12 = "com.apple.locationd.Mobility.ProcessBouts";
LABEL_22:
    int v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService onMobilityProcessBoutsActivity:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
    return;
  }
  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100F456B0;
    v10[3] = &unk_1022B4250;
    v10[4] = a3;
    [(CLMobilityWalkingBoutService *)self checkForBoutsReadyToProcessWithCompletion:v10 activity:a3];
    return;
  }
  if (qword_1024191F0 != -1) {
    dispatch_once(&qword_1024191F0, &stru_102306018);
  }
  long long v8 = qword_1024191F8;
  if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "com.apple.locationd.Mobility.ProcessBouts";
    __int16 v17 = 2048;
    xpc_activity_state_t v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unexpected activity (%s) state: %ld", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_102306018);
    }
    int v11 = 136315394;
    int v12 = "com.apple.locationd.Mobility.ProcessBouts";
    __int16 v13 = 2048;
    xpc_activity_state_t v14 = v6;
    goto LABEL_22;
  }
}

- (void)onMobilityClassificationActivity:(id)a3
{
  if (!a3)
  {
    if (qword_102418FA0 != -1) {
      dispatch_once(&qword_102418FA0, &stru_102306038);
    }
    uint64_t v7 = qword_102418FA8;
    if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid xpc classification activity.", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102418FA0 != -1) {
      dispatch_once(&qword_102418FA0, &stru_102306038);
    }
    LOWORD(v11) = 0;
LABEL_22:
    int v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService onMobilityClassificationActivity:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
    return;
  }
  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100F45D40;
    v10[3] = &unk_102305EF8;
    v10[4] = a3;
    void v10[5] = self;
    [(CLMobilityWalkingBoutService *)self classifySteadinessWithCompletion:v10 activity:a3];
    return;
  }
  if (qword_102418FA0 != -1) {
    dispatch_once(&qword_102418FA0, &stru_102306038);
  }
  long long v8 = qword_102418FA8;
  if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "com.apple.locationd.Mobility.Classification";
    __int16 v17 = 2048;
    xpc_activity_state_t v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unexpected activity (%s) state: %ld", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102418FA0 != -1) {
      dispatch_once(&qword_102418FA0, &stru_102306038);
    }
    int v11 = 136315394;
    int v12 = "com.apple.locationd.Mobility.Classification";
    __int16 v13 = 2048;
    xpc_activity_state_t v14 = v6;
    goto LABEL_22;
  }
}

- (void)onDataCollectionRequested:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100F45FF4;
  v3[3] = &unk_1022CEBF8;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async([objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "silo") queue], v3);
}

- (void)onAggregationTimer
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100F464C0;
  v2[3] = &unk_1022B4250;
  v2[4] = self;
  [(CLMobilityWalkingBoutService *)self checkForBoutsReadyToProcessWithCompletion:v2 activity:0];
}

- (void)onMobilityCompanionSyncActivity:(id)a3
{
  if (!a3)
  {
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_102306018);
    }
    int v9 = qword_1024191F8;
    if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "com.apple.locationd.Mobility.CompanionSync";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "XPC Mobility Sync: Invalid xpc activity (%s).", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191F0 != -1) {
        dispatch_once(&qword_1024191F0, &stru_102306018);
      }
      int v29 = 136315138;
      v30 = "com.apple.locationd.Mobility.CompanionSync";
      v23 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService onMobilityCompanionSyncActivity:]", "%s\n", v23);
      if (v23 != (char *)buf) {
        free(v23);
      }
    }
    BOOL fCompanionConnected = self->fCompanionConnected;
    int v11 = self;
    uint64_t v12 = 0;
    goto LABEL_14;
  }
  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    unsigned int v7 = [(CLMobilityWalkingBoutService *)self checkDeferMobilityCompanionSyncActivity:a3];
    BOOL v8 = self->fCompanionConnected;
    if (v7)
    {
      [(CLMobilityWalkingBoutService *)self sendCompanionSyncAnalyticsWithMsgSize:0 isSuccess:0 isActivityDeferred:1 isActivityValid:1 isWatchPaired:v8];
      return;
    }
    if (self->fCompanionConnected)
    {
      value = (uint64_t *)self->fMobilityCalManager.__ptr_.__value_;
      double v15 = CFAbsoluteTimeGetCurrent() - (double)qword_102482448;
      double Current = CFAbsoluteTimeGetCurrent();
      __int16 v17 = sub_101571BB0(value, v15, Current);
      xpc_activity_state_t v18 = v17;
      if (v17 && [(NSData *)v17 length])
      {
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_100F4878C;
        v28[3] = &unk_1022CA588;
        v28[4] = v18;
        [objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "vendor") proxyForService:@"CLCompanionNotifier"] doAsync:v28;
      }
      else
      {
        if (qword_1024191F0 != -1) {
          dispatch_once(&qword_1024191F0, &stru_102306018);
        }
        int v19 = qword_1024191F8;
        if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "XPC Mobility Sync: No data to send", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191F0 != -1) {
            dispatch_once(&qword_1024191F0, &stru_102306018);
          }
          LOWORD(v29) = 0;
          v24 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService onMobilityCompanionSyncActivity:]", "%s\n", v24);
          if (v24 != (char *)buf) {
            free(v24);
          }
        }
      }
      [(CLMobilityWalkingBoutService *)self sendCompanionSyncAnalyticsWithMsgSize:[(NSData *)v18 length] isSuccess:1 isActivityDeferred:0 isActivityValid:1 isWatchPaired:self->fCompanionConnected];
      if (xpc_activity_set_state((xpc_activity_t)a3, 5)) {
        return;
      }
      if (qword_1024191F0 != -1) {
        dispatch_once(&qword_1024191F0, &stru_102306018);
      }
      int v20 = qword_1024191F8;
      if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_FAULT))
      {
        xpc_activity_state_t v21 = xpc_activity_get_state((xpc_activity_t)a3);
        *(_DWORD *)buf = 136446466;
        v34 = "com.apple.locationd.Mobility.CompanionSync";
        __int16 v35 = 2050;
        xpc_activity_state_t v36 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "XPC Mobility Sync: failed to mark %{public}s activity as Done. Current state is %{public}ld", buf, 0x16u);
      }
      if (!sub_10013D1A0(115, 0)) {
        return;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1024191F0 != -1) {
        dispatch_once(&qword_1024191F0, &stru_102306018);
      }
      xpc_activity_state_t v26 = xpc_activity_get_state((xpc_activity_t)a3);
      int v29 = 136446466;
      v30 = "com.apple.locationd.Mobility.CompanionSync";
      __int16 v31 = 2050;
      xpc_activity_state_t v32 = v26;
LABEL_60:
      v27 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService onMobilityCompanionSyncActivity:]", "%s\n", v27);
      if (v27 != (char *)buf) {
        free(v27);
      }
      return;
    }
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_102306018);
    }
    int v22 = qword_1024191F8;
    if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[PhoneService] Cannot send data, companion not nearby", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191F0 != -1) {
        dispatch_once(&qword_1024191F0, &stru_102306018);
      }
      LOWORD(v29) = 0;
      v25 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService onMobilityCompanionSyncActivity:]", "%s\n", v25);
      if (v25 != (char *)buf) {
        free(v25);
      }
    }
    [(CLMobilityWalkingBoutService *)self setCompanionSyncActivityAsDone:a3];
    BOOL fCompanionConnected = self->fCompanionConnected;
    int v11 = self;
    uint64_t v12 = 1;
LABEL_14:
    [(CLMobilityWalkingBoutService *)v11 sendCompanionSyncAnalyticsWithMsgSize:0 isSuccess:0 isActivityDeferred:0 isActivityValid:v12 isWatchPaired:fCompanionConnected];
    return;
  }
  if (qword_1024191F0 != -1) {
    dispatch_once(&qword_1024191F0, &stru_102306018);
  }
  __int16 v13 = qword_1024191F8;
  if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "com.apple.locationd.Mobility.CompanionSync";
    __int16 v35 = 2048;
    xpc_activity_state_t v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "XPC Mobility Sync: Unexpected activity (%s) state: %ld", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_102306018);
    }
    int v29 = 136315394;
    v30 = "com.apple.locationd.Mobility.CompanionSync";
    __int16 v31 = 2048;
    xpc_activity_state_t v32 = v6;
    goto LABEL_60;
  }
}

- (BOOL)checkDeferMobilityCompanionSyncActivity:(id)a3
{
  if (a3)
  {
    BOOL should_defer = xpc_activity_should_defer((xpc_activity_t)a3);
    if (should_defer)
    {
      if (qword_1024191F0 != -1) {
        dispatch_once(&qword_1024191F0, &stru_102306018);
      }
      uint64_t v5 = qword_1024191F8;
      if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        __int16 v13 = "com.apple.locationd.Mobility.CompanionSync";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "XPC Mobility Sync: Cancelling (%{public}s) early due to deferral.", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191F0 != -1) {
          dispatch_once(&qword_1024191F0, &stru_102306018);
        }
        long long v10 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService checkDeferMobilityCompanionSyncActivity:]", "%s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
      }
      if (xpc_activity_set_state((xpc_activity_t)a3, 3))
      {
        if (qword_1024191F0 != -1) {
          dispatch_once(&qword_1024191F0, &stru_102306018);
        }
        xpc_activity_state_t v6 = qword_1024191F8;
        if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "XPC Mobility Sync: Activity deferred", buf, 2u);
        }
        if (!sub_10013D1A0(115, 2)) {
          goto LABEL_24;
        }
        bzero(buf, 0x65CuLL);
        if (qword_1024191F0 != -1) {
          dispatch_once(&qword_1024191F0, &stru_102306018);
        }
        unsigned int v7 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService checkDeferMobilityCompanionSyncActivity:]", "%s\n", v7);
        if (v7 == (char *)buf) {
          goto LABEL_24;
        }
      }
      else
      {
        if (qword_1024191F0 != -1) {
          dispatch_once(&qword_1024191F0, &stru_102306018);
        }
        BOOL v8 = qword_1024191F8;
        if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_FAULT))
        {
          xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
          *(_DWORD *)buf = 134349056;
          __int16 v13 = (const char *)state;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "XPC Mobility Sync: Failed to defer activity. Current state is %{public}ld", buf, 0xCu);
        }
        if (!sub_10013D1A0(115, 0)) {
          goto LABEL_24;
        }
        bzero(buf, 0x65CuLL);
        if (qword_1024191F0 != -1) {
          dispatch_once(&qword_1024191F0, &stru_102306018);
        }
        xpc_activity_get_state((xpc_activity_t)a3);
        unsigned int v7 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService checkDeferMobilityCompanionSyncActivity:]", "%s\n", v7);
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

- (void)setCompanionSyncActivityAsDone:(id)a3
{
  if (!xpc_activity_set_state((xpc_activity_t)a3, 5))
  {
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_102306018);
    }
    shared_ptr<CLMobility::BoutBoundaryRecorderDb> v4 = qword_1024191F8;
    if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446466;
      unsigned int v7 = "com.apple.locationd.Mobility.CompanionSync";
      __int16 v8 = 2050;
      xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "[PhoneService] failed to mark %{public}s activity as Done. Current state is %{public}ld", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191F0 != -1) {
        dispatch_once(&qword_1024191F0, &stru_102306018);
      }
      xpc_activity_get_state((xpc_activity_t)a3);
      uint64_t v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService setCompanionSyncActivityAsDone:]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
  }
}

- (BOOL)checkDeferRequestForBoutsActivity:(id)a3
{
  if (a3)
  {
    BOOL should_defer = xpc_activity_should_defer((xpc_activity_t)a3);
    if (should_defer)
    {
      if (qword_1024191F0 != -1) {
        dispatch_once(&qword_1024191F0, &stru_102306018);
      }
      uint64_t v5 = qword_1024191F8;
      if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        __int16 v13 = "com.apple.locationd.Mobility.ProcessBouts";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BoutService: Cancelling (%{public}s) early due to deferral.", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191F0 != -1) {
          dispatch_once(&qword_1024191F0, &stru_102306018);
        }
        long long v10 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService checkDeferRequestForBoutsActivity:]", "%s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
      }
      if (xpc_activity_set_state((xpc_activity_t)a3, 3))
      {
        if (qword_1024191F0 != -1) {
          dispatch_once(&qword_1024191F0, &stru_102306018);
        }
        xpc_activity_state_t v6 = qword_1024191F8;
        if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "BoutService: Activity deferred", buf, 2u);
        }
        if (!sub_10013D1A0(115, 2)) {
          goto LABEL_24;
        }
        bzero(buf, 0x65CuLL);
        if (qword_1024191F0 != -1) {
          dispatch_once(&qword_1024191F0, &stru_102306018);
        }
        unsigned int v7 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService checkDeferRequestForBoutsActivity:]", "%s\n", v7);
        if (v7 == (char *)buf) {
          goto LABEL_24;
        }
      }
      else
      {
        if (qword_1024191F0 != -1) {
          dispatch_once(&qword_1024191F0, &stru_102306018);
        }
        __int16 v8 = qword_1024191F8;
        if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_FAULT))
        {
          xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
          *(_DWORD *)buf = 134349056;
          __int16 v13 = (const char *)state;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "Failed to defer activity. Current state is %{public}ld", buf, 0xCu);
        }
        if (!sub_10013D1A0(115, 0)) {
          goto LABEL_24;
        }
        bzero(buf, 0x65CuLL);
        if (qword_1024191F0 != -1) {
          dispatch_once(&qword_1024191F0, &stru_102306018);
        }
        xpc_activity_get_state((xpc_activity_t)a3);
        unsigned int v7 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService checkDeferRequestForBoutsActivity:]", "%s\n", v7);
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

- (void)checkForBoutsReadyToProcessWithCompletion:(id)a3 activity:(id)a4
{
  [self universe].silo
  double v9 = 0.0;
  double v10 = 0.0;
  if (sub_100C7B69C(self->fBoutExtractor.__ptr_.__value_, &v10, &v9))
  {
    if ([(CLMobilityWalkingBoutService *)self checkDeferRequestForBoutsActivity:a4])
    {
      (*((void (**)(id, uint64_t))a3 + 2))(a3, 103);
    }
    else
    {
      ptr = (id *)self->fHKQueryDelegate.__ptr_;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100F4938C;
      v8[3] = &unk_102305F80;
      *(double *)&v8[7] = v10;
      *(double *)&v8[8] = v9;
      v8[5] = a4;
      v8[6] = a3;
      v8[4] = self;
      sub_1011993CC(ptr, (uint64_t)v8, v10, v9);
      sub_100EE4924(self->fSmoothedGaitMetricsProcessor.__ptr_.__value_);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 109);
  }
}

- (void)handleBoutResults:()vector<CLMobility:(std::allocator<CLMobility::ProcessedBoutResult>> *)a3 :ProcessedBoutResult
{
  [self.universe silo];
  v45 = a3;
  if ([(NSMutableSet *)[(CLMobilityWalkingBoutService *)self boutClients] count]
    && a3->var1 != a3->var0)
  {
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_102306018);
    }
    uint64_t v5 = qword_1024191F8;
    if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_INFO))
    {
      unint64_t v6 = 0xEEEEEEEEEEEEEEEFLL * ((v45->var1 - v45->var0) >> 4);
      *(_DWORD *)buf = 134218240;
      unint64_t v62 = v6;
      __int16 v63 = 1024;
      LODWORD(v64) = [(NSMutableSet *)[(CLMobilityWalkingBoutService *)self boutClients] count];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CLMobilityWalkingBoutService: Sending %lu bout metrics to %d client(s)", buf, 0x12u);
    }
    a3 = v45;
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191F0 != -1) {
        dispatch_once(&qword_1024191F0, &stru_102306018);
      }
      var0 = v45->var0;
      var1 = v45->var1;
      int v55 = 134218240;
      unint64_t v56 = 0xEEEEEEEEEEEEEEEFLL * ((var1 - var0) >> 4);
      __int16 v57 = 1024;
      LODWORD(v58) = [(NSMutableSet *)[(CLMobilityWalkingBoutService *)self boutClients] count];
      v44 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService handleBoutResults:]", "%s\n", v44);
      if (v44 != (char *)buf) {
        free(v44);
      }
      a3 = v45;
    }
  }
  unsigned int v7 = a3;
  __int16 v8 = a3->var0;
  double v9 = v7->var1;
  if (v8 == v9)
  {
    v41 = v8;
  }
  else
  {
    do
    {
      if (qword_1024191F0 != -1) {
        dispatch_once(&qword_1024191F0, &stru_102306018);
      }
      double v10 = qword_1024191F8;
      if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v11 = *((void *)v8 + 3);
        uint64_t v12 = *((void *)v8 + 4);
        int v13 = *((_DWORD *)v8 + 10);
        *(_DWORD *)buf = 134218496;
        unint64_t v62 = v11;
        __int16 v63 = 2048;
        uint64_t v64 = v12;
        __int16 v65 = 1024;
        int v66 = v13;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Bout metrics result, startTime, %.2f, endTime, %.2f, stepCount, %d", buf, 0x1Cu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191F0 != -1) {
          dispatch_once(&qword_1024191F0, &stru_102306018);
        }
        unint64_t v37 = *((void *)v8 + 3);
        uint64_t v38 = *((void *)v8 + 4);
        int v39 = *((_DWORD *)v8 + 10);
        int v55 = 134218496;
        unint64_t v56 = v37;
        __int16 v57 = 2048;
        uint64_t v58 = v38;
        __int16 v59 = 1024;
        int v60 = v39;
        v40 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService handleBoutResults:]", "%s\n", v40);
        if (v40 != (char *)buf) {
          free(v40);
        }
      }
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      xpc_activity_state_t v14 = [(CLMobilityWalkingBoutService *)self boutClients];
      id v15 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v50 objects:v54 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v51;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v51 != v16) {
              objc_enumerationMutation(v14);
            }
            xpc_activity_state_t v18 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            long long v19 = *((_OWORD *)v8 + 1);
            long long v20 = *((_OWORD *)v8 + 2);
            long long v21 = *((_OWORD *)v8 + 3);
            long long v22 = *((_OWORD *)v8 + 4);
            long long v23 = *((_OWORD *)v8 + 6);
            v49[4] = *((_OWORD *)v8 + 5);
            v49[5] = v23;
            long long v24 = *((_OWORD *)v8 + 7);
            long long v25 = *((_OWORD *)v8 + 9);
            long long v26 = *((_OWORD *)v8 + 10);
            v49[7] = *((_OWORD *)v8 + 8);
            v49[8] = v25;
            long long v27 = *((_OWORD *)v8 + 11);
            long long v28 = *((_OWORD *)v8 + 12);
            long long v29 = *((_OWORD *)v8 + 14);
            v49[12] = *((_OWORD *)v8 + 13);
            v49[13] = v29;
            v49[10] = v27;
            v49[11] = v28;
            v49[9] = v26;
            v49[6] = v24;
            v49[2] = v21;
            v49[3] = v22;
            v49[0] = v19;
            v49[1] = v20;
            [v18 onMobilityBoutMetrics:v49];
          }
          id v15 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v50 objects:v54 count:16];
        }
        while (v15);
      }
      if (!*((_DWORD *)v8 + 17))
      {
        v30 = +[NSDate dateWithTimeIntervalSinceReferenceDate:*((double *)v8 + 3)];
        __int16 v31 = +[NSDate dateWithTimeIntervalSinceReferenceDate:*((double *)v8 + 4)];
        int v32 = *((_DWORD *)v8 + 17);
        if (v32) {
          int v33 = 42;
        }
        else {
          int v33 = -1;
        }
        if ((v33 & *((_DWORD *)v8 + 52)) == 0)
        {
          [(CLMobilityHealthKitWriter *)self->fHealthKitWriter writeToHealthKitType:0 value:v30 startDate:v31 endDate:*((double *)v8 + 16)];
          int v32 = *((_DWORD *)v8 + 17);
        }
        if (v32) {
          int v34 = 42;
        }
        else {
          int v34 = -1;
        }
        if ((v34 & *((_DWORD *)v8 + 53)) == 0)
        {
          [(CLMobilityHealthKitWriter *)self->fHealthKitWriter writeToHealthKitType:1 value:v30 startDate:v31 endDate:*((double *)v8 + 17)];
          int v32 = *((_DWORD *)v8 + 17);
        }
        if (v32) {
          int v35 = 42;
        }
        else {
          int v35 = -1;
        }
        if ((v35 & *((_DWORD *)v8 + 54)) == 0)
        {
          [(CLMobilityHealthKitWriter *)self->fHealthKitWriter writeToHealthKitType:2 value:v30 startDate:v31 endDate:*((double *)v8 + 18)];
          int v32 = *((_DWORD *)v8 + 17);
        }
        if (v32) {
          int v36 = 42;
        }
        else {
          int v36 = -1;
        }
        if ((v36 & *((_DWORD *)v8 + 55)) == 0) {
          [(CLMobilityHealthKitWriter *)self->fHealthKitWriter writeToHealthKitType:3 value:v30 startDate:v31 endDate:*((unsigned __int8 *)v8 + 64) deviceSide:*((double *)v8 + 19)];
        }
      }
      (*(void (**)(BoutMetricsRecorderDb *, uint64_t))(*(void *)self->fBoutMetricsDb.__ptr_ + 152))(self->fBoutMetricsDb.__ptr_, (uint64_t)v8 + 16);
      sub_100C80558((uint64_t)self->fBoutExtractor.__ptr_.__value_);
      __int16 v8 = (ProcessedBoutResult *)((char *)v8 + 240);
    }
    while (v8 != v9);
    v41 = v45->var0;
    __int16 v8 = v45->var1;
  }
  __p = 0;
  v47 = 0;
  uint64_t v48 = 0;
  sub_100F538B0(&__p, v41, (uint64_t)v8, 0xEEEEEEEEEEEEEEEFLL * ((v8 - v41) >> 4));
  [(CLMobilityWalkingBoutService *)self sendAnalyticsBoutMetrics:&__p];
  if (__p)
  {
    v47 = __p;
    operator delete(__p);
  }
}

- (void)classifySteadinessWithCompletion:(id)a3 activity:(id)a4
{
  [self universe].silo
  if (self->fIsMigrationComplete)
  {
    if ([(CLMobilityHealthKitWriter *)self->fHealthKitWriter isWalkingSteadinessAvailable])
    {
      if (self->fClassificationInProgress)
      {
        if (qword_102418FA0 != -1) {
          dispatch_once(&qword_102418FA0, &stru_102306038);
        }
        unsigned int v7 = qword_102418FA8;
        if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#warning: Classification already in progress", buf, 2u);
        }
        if (!sub_10013D1A0(115, 2)) {
          goto LABEL_65;
        }
        bzero(buf, 0x65CuLL);
        if (qword_102418FA0 != -1) {
          dispatch_once(&qword_102418FA0, &stru_102306038);
        }
        LOWORD(v44[0]) = 0;
        uint64_t v12 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService classifySteadinessWithCompletion:activity:]", "%s\n", v12);
        if (v12 == buf) {
          goto LABEL_65;
        }
        goto LABEL_86;
      }
      if (a4 && xpc_activity_should_defer((xpc_activity_t)a4))
      {
        xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a4);
        if (xpc_activity_set_state((xpc_activity_t)a4, 3))
        {
          if (qword_102418FA0 != -1) {
            dispatch_once(&qword_102418FA0, &stru_102306038);
          }
          unint64_t v11 = qword_102418FA8;
          if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "#warning: Classification deferred", buf, 2u);
          }
          if (!sub_10013D1A0(115, 2)) {
            goto LABEL_65;
          }
          bzero(buf, 0x65CuLL);
          if (qword_102418FA0 != -1) {
            dispatch_once(&qword_102418FA0, &stru_102306038);
          }
          LOWORD(v44[0]) = 0;
          uint64_t v12 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService classifySteadinessWithCompletion:activity:]", "%s\n", v12);
        }
        else
        {
          if (qword_102418FA0 != -1) {
            dispatch_once(&qword_102418FA0, &stru_102306038);
          }
          long long v28 = qword_102418FA8;
          if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134349056;
            *(void *)&uint8_t buf[4] = state;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "Failed to mark activity as Deferred. Current state is %{public}ld", buf, 0xCu);
          }
          if (!sub_10013D1A0(115, 0)) {
            goto LABEL_65;
          }
          bzero(buf, 0x65CuLL);
          if (qword_102418FA0 != -1) {
            dispatch_once(&qword_102418FA0, &stru_102306038);
          }
          LODWORD(v44[0]) = 134349056;
          *(void *)((char *)v44 + 4) = state;
          uint64_t v12 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService classifySteadinessWithCompletion:activity:]", "%s\n", v12);
        }
        if (v12 == buf)
        {
LABEL_65:
          (*((void (**)(id, void, void))a3 + 2))(a3, 0, 0);
          return;
        }
LABEL_86:
        free(v12);
        goto LABEL_65;
      }
      self->fClassificationInProgress = 1;
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v40 = 0;
      v41 = (double *)&v40;
      uint64_t v42 = 0x2020000000;
      uint64_t v43 = 0;
      uint64_t v36 = 0;
      unint64_t v37 = &v36;
      uint64_t v38 = 0x2020000000;
      char v39 = 0;
      uint64_t v14 = sub_1000D3E78();
      sub_10006B564(v14, buf);
      sub_1000A699C(*(uint64_t *)buf, "steadinessClassificationNextClassificationTime", v41 + 3);
      if (*(void *)&buf[8]) {
        sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
      }
      double v15 = v41[3];
      if (v15 <= Current + -7776000.0)
      {
        v41[3] = Current + -7776000.0;
        if (qword_102418FA0 != -1) {
          dispatch_once(&qword_102418FA0, &stru_102306038);
        }
        long long v20 = qword_102418FA8;
        if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = *((void *)v41 + 3);
          *(_DWORD *)buf = 134349056;
          *(void *)&uint8_t buf[4] = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Checking for historical samples -- setting classification time in the past: (%{public}.2f)", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102418FA0 != -1) {
            dispatch_once(&qword_102418FA0, &stru_102306038);
          }
          uint64_t v30 = *((void *)v41 + 3);
          LODWORD(v44[0]) = 134349056;
          *(void *)((char *)v44 + 4) = v30;
          __int16 v31 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService classifySteadinessWithCompletion:activity:]", "%s\n", v31);
          if (v31 != buf) {
            free(v31);
          }
        }
        *((unsigned char *)v37 + 24) = 1;
      }
      else if (v15 > Current)
      {
        if (qword_102418FA0 != -1) {
          dispatch_once(&qword_102418FA0, &stru_102306038);
        }
        uint64_t v16 = qword_102418FA8;
        if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = *((void *)v41 + 3);
          *(_DWORD *)buf = 134349056;
          *(void *)&uint8_t buf[4] = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Trying to classify a time period in the future (%{public}.2f)", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102418FA0 != -1) {
            dispatch_once(&qword_102418FA0, &stru_102306038);
          }
          uint64_t v18 = *((void *)v41 + 3);
          LODWORD(v44[0]) = 134349056;
          *(void *)((char *)v44 + 4) = v18;
          long long v19 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService classifySteadinessWithCompletion:activity:]", "%s\n", v19);
          if (v19 != buf) {
            free(v19);
          }
        }
      }
      double v22 = sub_10159FC80((double *)v44, v41[3], Current);
      long long v23 = (void *)(*(uint64_t (**)(BoutMetricsRecorderDb *, double))(*(void *)self->fBoutMetricsDb.__ptr_
                                                                               + 176))(self->fBoutMetricsDb.__ptr_, v22);
      if (v23)
      {
        id v24 = [v23 copy];
      }
      else
      {
        if (qword_102418FA0 != -1) {
          dispatch_once(&qword_102418FA0, &stru_102306038);
        }
        long long v25 = qword_102418FA8;
        if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "Missing Database UUID", buf, 2u);
        }
        if (sub_10013D1A0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102418FA0 != -1) {
            dispatch_once(&qword_102418FA0, &stru_102306038);
          }
          __int16 v35 = 0;
          int v32 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService classifySteadinessWithCompletion:activity:]", "%s\n", v32);
          if (v32 != buf) {
            free(v32);
          }
        }
        id v24 = 0;
      }
      ptr = (id *)self->fHKQueryDelegate.__ptr_;
      id v27 = [[-[CLMobilityWalkingBoutService universe](self, "universe") silo];
      v34[3] = v44[3];
      v34[4] = v44[4];
      v34[1] = v44[1];
      v34[2] = v44[2];
      v34[0] = v44[0];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100F4ABA0;
      v33[3] = &unk_102305FA8;
      *(double *)&v33[10] = Current;
      v33[8] = &v40;
      v33[9] = &v36;
      v33[4] = self;
      v33[5] = v24;
      v33[6] = a4;
      v33[7] = a3;
      sub_10119E198(ptr, v27, (double *)v34, (uint64_t)v24, (uint64_t)v33);
      _Block_object_dispose(&v36, 8);
      _Block_object_dispose(&v40, 8);
    }
    else
    {
      if (qword_102418FA0 != -1) {
        dispatch_once(&qword_102418FA0, &stru_102306038);
      }
      double v9 = qword_102418FA8;
      if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#warning: HealthKit: Walking Steadiness unavailable", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102418FA0 != -1) {
          dispatch_once(&qword_102418FA0, &stru_102306038);
        }
        LOWORD(v44[0]) = 0;
        long long v29 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService classifySteadinessWithCompletion:activity:]", "%s\n", v29);
        if (v29 != buf) {
          free(v29);
        }
      }
      (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(a3, 1, 1);
    }
  }
  else
  {
    if (qword_102418FA0 != -1) {
      dispatch_once(&qword_102418FA0, &stru_102306038);
    }
    __int16 v8 = qword_102418FA8;
    if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      __int16 v46 = 2082;
      v47 = "Migration is not complete";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"classifySteadinessWithCompletion: NO\", \"reason\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    (*((void (**)(id, uint64_t, void))a3 + 2))(a3, 1, 0);
  }
}

- (void)checkForHistoricalComputeTrigger:(CLBodyMetrics *)a3
{
  if (!a3->_isHeightSet)
  {
    if (qword_102418FA0 != -1) {
      dispatch_once(&qword_102418FA0, &stru_102306038);
    }
    unsigned int v7 = qword_102418FA8;
    if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "checkForHistoricalComputeTrigger: NO, height is unset", buf, 2u);
    }
    if (!sub_10013D1A0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102418FA0 == -1)
    {
LABEL_28:
      LOWORD(v14) = 0;
      unint64_t v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService checkForHistoricalComputeTrigger:]", "%s\n", v6);
LABEL_29:
      if (v6 != buf) {
        free(v6);
      }
      return;
    }
LABEL_46:
    dispatch_once(&qword_102418FA0, &stru_102306038);
    goto LABEL_28;
  }
  if (!sub_1011F8BDC((uint64_t)self->fGaitMetricsDb.__ptr_ + 72))
  {
    if (qword_102418FA0 != -1) {
      dispatch_once(&qword_102418FA0, &stru_102306038);
    }
    __int16 v8 = qword_102418FA8;
    if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "checkForHistoricalComputeTrigger: NO, ClassB database inaccessible", buf, 2u);
    }
    if (!sub_10013D1A0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102418FA0 == -1) {
      goto LABEL_28;
    }
    goto LABEL_46;
  }
  if (self->fIsMigrationComplete)
  {
    double v13 = 0.0;
    uint64_t v4 = sub_1000D3E78();
    sub_10006B564(v4, buf);
    sub_1000A699C(*(uint64_t *)buf, "steadinessClassificationNextClassificationTime", &v13);
    if (*(void *)&buf[8]) {
      sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
    }
    if (v13 <= CFAbsoluteTimeGetCurrent() + -7776000.0)
    {
      if (qword_102418FA0 != -1) {
        dispatch_once(&qword_102418FA0, &stru_102306038);
      }
      double v10 = qword_102418FA8;
      if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "checkForHistoricalComputeTrigger: YES, attempting classification", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102418FA0 != -1) {
          dispatch_once(&qword_102418FA0, &stru_102306038);
        }
        LOWORD(v14) = 0;
        unint64_t v11 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService checkForHistoricalComputeTrigger:]", "%s\n", v11);
        if (v11 != buf) {
          free(v11);
        }
      }
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100F4CA74;
      v12[3] = &unk_102305FD0;
      v12[4] = self;
      [(CLMobilityWalkingBoutService *)self classifySteadinessWithCompletion:v12 activity:0];
    }
    else
    {
      if (qword_102418FA0 != -1) {
        dispatch_once(&qword_102418FA0, &stru_102306038);
      }
      uint64_t v5 = qword_102418FA8;
      if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349056;
        *(double *)&uint8_t buf[4] = v13;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "checkForHistoricalComputeTrigger: NO, nextClassificationTime already set (%{public}.2f)", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102418FA0 != -1) {
          dispatch_once(&qword_102418FA0, &stru_102306038);
        }
        int v14 = 134349056;
        double v15 = v13;
        unint64_t v6 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService checkForHistoricalComputeTrigger:]", "%s\n", v6);
        goto LABEL_29;
      }
    }
  }
  else
  {
    if (qword_102418FA0 != -1) {
      dispatch_once(&qword_102418FA0, &stru_102306038);
    }
    double v9 = qword_102418FA8;
    if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      __int16 v17 = 2082;
      uint64_t v18 = "Migration is not complete";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"checkForHistoricalComputeTrigger: NO\", \"reason\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
  }
}

- (float)BMIFromHeight:(float)a3 weight:(float)a4
{
  float result = 0.0;
  if (a3 != 0.0) {
    return a4 / (float)(a3 * a3);
  }
  return result;
}

- (void)sendAnalyticsBoutMetrics:()vector<CLMobility:(std::allocator<CLMobility::ProcessedBoutResult>> *)a3 :ProcessedBoutResult
{
  if (objc_opt_class()
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_102482488, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_102482488))
    {
      *(_OWORD *)buf = xmmword_101D9897C;
      *(_OWORD *)&uint8_t buf[16] = unk_101D9898C;
      *(_OWORD *)double v9 = xmmword_101D9899C;
      *(_OWORD *)&v9[12] = *(long long *)((char *)&xmmword_101D9899C + 12);
      sub_1003B17B4(&qword_102482470, buf, 0xFuLL);
      __cxa_atexit((void (*)(void *))sub_1003B1838, &qword_102482470, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_102482488);
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1024824A8, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1024824A8))
    {
      *(_OWORD *)buf = xmmword_101D989B8;
      *(_OWORD *)&buf[12] = *(long long *)((char *)&xmmword_101D989B8 + 12);
      sub_1003B17B4(&qword_102482490, buf, 7uLL);
      __cxa_atexit((void (*)(void *))sub_1003B1838, &qword_102482490, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_1024824A8);
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1024824C8, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1024824C8))
    {
      *(_OWORD *)buf = xmmword_101D989D4;
      *(_OWORD *)&buf[12] = *(long long *)((char *)&xmmword_101D989D4 + 12);
      sub_1003B17B4(&qword_1024824B0, buf, 7uLL);
      __cxa_atexit((void (*)(void *))sub_1003B1838, &qword_1024824B0, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_1024824C8);
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1024824E8, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1024824E8))
    {
      LODWORD(v10) = 200;
      *(_OWORD *)buf = xmmword_101D989F0;
      *(_OWORD *)&uint8_t buf[16] = unk_101D98A00;
      *(_OWORD *)double v9 = xmmword_101D98A10;
      *(_OWORD *)&v9[16] = unk_101D98A20;
      sub_100F4CFF0(&qword_1024824D0, buf, 0x11uLL);
      __cxa_atexit((void (*)(void *))sub_100F4D074, &qword_1024824D0, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_1024824E8);
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_102482508, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_102482508))
    {
      *(_OWORD *)double v9 = xmmword_101D98A58;
      *(_OWORD *)&v9[16] = unk_101D98A68;
      long long v10 = xmmword_101D98A78;
      long long v11 = unk_101D98A88;
      *(_OWORD *)buf = xmmword_101D98A38;
      *(_OWORD *)&uint8_t buf[16] = unk_101D98A48;
      sub_100F4D0A8(&qword_1024824F0, buf, 0xCuLL);
      __cxa_atexit((void (*)(void *))sub_10039DF6C, &qword_1024824F0, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_102482508);
    }
    var0 = a3->var0;
    var1 = a3->var1;
    if (a3->var0 != var1)
    {
      do
      {
        AnalyticsSendEventLazy();
        var0 = (ProcessedBoutResult *)((char *)var0 + 240);
      }
      while (var0 != var1);
    }
  }
  else if (a3->var0 != a3->var1)
  {
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_102306018);
    }
    unint64_t v6 = qword_1024191F8;
    if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "BoutService: Not authorized to submit analytics without IHA", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191F0 != -1) {
        dispatch_once(&qword_1024191F0, &stru_102306018);
      }
      unsigned int v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService sendAnalyticsBoutMetrics:]", "%s\n", v7);
      if (v7 != buf) {
        free(v7);
      }
    }
  }
}

- (void)sendAnalyticsSteadinessResult:(uint64_t)a1
{
  double v1 = __chkstk_darwin(a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  [objc_msgSend(v4, "universe", v1) silo];
  if (objc_msgSend(objc_msgSend(v5, "steadinessClients"), "count"))
  {
    if (qword_102418FA0 != -1) {
      dispatch_once(&qword_102418FA0, &stru_102306038);
    }
    unint64_t v6 = qword_102418FA8;
    if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = [v5 steadinessClients].count;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "BoutService: Sending WalkingSteadiness to %d client(s)", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102418FA0 != -1) {
        dispatch_once(&qword_102418FA0, &stru_102306038);
      }
      LODWORD(v77) = 67109120;
      DWORD1(v77) = [[objc_msgSend(v5, "steadinessClients") count];
      id v27 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService sendAnalyticsSteadinessResult:]", "%s\n", v27);
      if (v27 != buf) {
        free(v27);
      }
    }
    long long v66 = 0u;
    long long v65 = 0u;
    long long v64 = 0u;
    long long v63 = 0u;
    id v7 = [v5 steadinessClients];
    id v8 = [v7 countByEnumeratingWithState:&v63 objects:v81 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v64;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v64 != v9) {
            objc_enumerationMutation(v7);
          }
          long long v11 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          memcpy(__dst, (const void *)v3, sizeof(__dst));
          [v11 onWalkingSteadinessClassification:__dst];
        }
        id v8 = [v7 countByEnumeratingWithState:&v63 objects:v81 count:16];
      }
      while (v8);
    }
  }
  if (objc_opt_class()
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    long long v12 = *(_OWORD *)(v3 + 208);
    long long v77 = *(_OWORD *)(v3 + 192);
    long long v78 = v12;
    long long v79 = *(_OWORD *)(v3 + 224);
    uint64_t v80 = *(void *)(v3 + 240);
    long long v13 = *(_OWORD *)(v3 + 416);
    long long v58 = *(_OWORD *)(v3 + 400);
    long long v59 = v13;
    long long v60 = *(_OWORD *)(v3 + 432);
    uint64_t v61 = *(void *)(v3 + 448);
    long long v14 = *(_OWORD *)(v3 + 552);
    long long v54 = *(_OWORD *)(v3 + 536);
    long long v55 = v14;
    long long v56 = *(_OWORD *)(v3 + 568);
    uint64_t v57 = *(void *)(v3 + 584);
    long long v15 = *(_OWORD *)(v3 + 640);
    long long v50 = *(_OWORD *)(v3 + 624);
    long long v51 = v15;
    long long v16 = *(_OWORD *)(v3 + 656);
    uint64_t v53 = *(void *)(v3 + 672);
    long long v52 = v16;
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_102482528, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_102482528))
    {
      *(void *)buf = 0x420C000041A00000;
      *(_DWORD *)&buf[8] = 1112014848;
      sub_1003B17B4(&qword_102482510, buf, 3uLL);
      __cxa_atexit((void (*)(void *))sub_1003B1838, &qword_102482510, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_102482528);
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_102482548, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_102482548))
    {
      *(void *)buf = 0x41C8000041940000;
      *(_DWORD *)&buf[8] = 1106247680;
      sub_1003B17B4(&qword_102482530, buf, 3uLL);
      __cxa_atexit((void (*)(void *))sub_1003B1838, &qword_102482530, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_102482548);
    }
    double Current = CFAbsoluteTimeGetCurrent();
    double v18 = *(double *)(v3 + 1072);
    if (v18 <= 0.0) {
      int v19 = -1;
    }
    else {
      int v19 = (int)((Current - v18) / 604800.0);
    }
    double v22 = *(double *)(v3 + 1080);
    if (v22 <= 0.0) {
      int v23 = -1;
    }
    else {
      int v23 = (int)((Current - v22) / 604800.0);
    }
    if (qword_102418FA0 != -1) {
      dispatch_once(&qword_102418FA0, &stru_102306038);
    }
    id v24 = qword_102418FA8;
    if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = *(void *)(v3 + 1072);
      uint64_t v26 = *(void *)(v3 + 1080);
      *(_DWORD *)buf = 134219009;
      *(double *)&uint8_t buf[4] = Current;
      __int16 v83 = 2049;
      uint64_t v84 = v25;
      __int16 v85 = 1025;
      int v86 = v19;
      __int16 v87 = 2049;
      uint64_t v88 = v26;
      __int16 v89 = 1025;
      int v90 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "currentTime, %{}.2f, mostRecentLowNotificationTime, %{private}.2f,  weeksSinceLowNotification, %{private}d, mostRecentVeryLowNotificationTime, %{private}.2f, weeksSinceVeryLowNotification, %{private}d", buf, 0x2Cu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102418FA0 != -1) {
        dispatch_once(&qword_102418FA0, &stru_102306038);
      }
      uint64_t v28 = *(void *)(v3 + 1072);
      uint64_t v29 = *(void *)(v3 + 1080);
      int v67 = 134219009;
      double v68 = Current;
      __int16 v69 = 2049;
      uint64_t v70 = v28;
      __int16 v71 = 1025;
      int v72 = v19;
      __int16 v73 = 2049;
      uint64_t v74 = v29;
      __int16 v75 = 1025;
      int v76 = v23;
      uint64_t v30 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService sendAnalyticsSteadinessResult:]", "%s\n", v30);
      if (v30 != buf) {
        free(v30);
      }
    }
    memcpy(v31, (const void *)v3, sizeof(v31));
    long long v32 = v77;
    long long v33 = v78;
    long long v34 = v79;
    uint64_t v35 = v80;
    long long v36 = v54;
    long long v37 = v55;
    long long v38 = v56;
    uint64_t v39 = v57;
    long long v41 = v59;
    long long v42 = v60;
    long long v40 = v58;
    uint64_t v43 = v61;
    uint64_t v47 = v53;
    long long v46 = v52;
    long long v45 = v51;
    long long v44 = v50;
    int v48 = v19;
    int v49 = v23;
    AnalyticsSendEventLazy();
  }
  else
  {
    if (qword_102418FA0 != -1) {
      dispatch_once(&qword_102418FA0, &stru_102306038);
    }
    long long v20 = qword_102418FA8;
    if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "BoutService: Not authorized to submit steadiness analytics without IHA", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102418FA0 != -1) {
        dispatch_once(&qword_102418FA0, &stru_102306038);
      }
      LOWORD(v77) = 0;
      uint64_t v21 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService sendAnalyticsSteadinessResult:]", "%s\n", v21);
      if (v21 != buf) {
        free(v21);
      }
    }
  }
}

- (void)setUpClassificationActivityWithDeferral:(BOOL)a3
{
  BOOL v3 = a3;
  [self universe].silo
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v6 = sub_1000D3E78();
  sub_10006B564(v6, &v18);
  double v17 = 0.0;
  sub_1000A699C(v18, "steadinessClassificationNextClassificationTime", &v17);
  double v7 = v17;
  if (v17 > Current + 691200.0)
  {
    if (qword_102418FA0 != -1) {
      dispatch_once(&qword_102418FA0, &stru_102306038);
    }
    id v8 = qword_102418FA8;
    if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v27 = "steadinessClassificationNextClassificationTime";
      __int16 v28 = 2050;
      double v29 = v17;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s is too far in the future (%{public}.2f). Resetting!", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102418FA0 != -1) {
        dispatch_once(&qword_102418FA0, &stru_102306038);
      }
      int v20 = 136446466;
      uint64_t v21 = "steadinessClassificationNextClassificationTime";
      __int16 v22 = 2050;
      double v23 = v17;
      long long v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService setUpClassificationActivityWithDeferral:]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
    sub_1004CF7DC(v18, "steadinessClassificationNextClassificationTime", 0xFFFFFFFFLL);
    double v17 = 0.0;
    double v7 = 0.0;
  }
  uint64_t v9 = &XPC_ACTIVITY_INTERVAL_1_DAY;
  if (!v3) {
    uint64_t v9 = &XPC_ACTIVITY_INTERVAL_30_MIN;
  }
  uint64_t v10 = *v9;
  double v11 = v7 - Current;
  if (v10 <= (uint64_t)v11) {
    uint64_t v12 = (uint64_t)v11;
  }
  else {
    uint64_t v12 = v10;
  }
  if (qword_102418FA0 != -1) {
    dispatch_once(&qword_102418FA0, &stru_102306038);
  }
  long long v13 = qword_102418FA8;
  if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v27 = "com.apple.locationd.Mobility.Classification";
    __int16 v28 = 2050;
    double v29 = v17;
    __int16 v30 = 2050;
    uint64_t v31 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s: Registering XPC Activity with nextClassificationTime=(%{public}.2f) and delay=(%{public}lld)", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102418FA0 != -1) {
      dispatch_once(&qword_102418FA0, &stru_102306038);
    }
    int v20 = 136446722;
    uint64_t v21 = "com.apple.locationd.Mobility.Classification";
    __int16 v22 = 2050;
    double v23 = v17;
    __int16 v24 = 2050;
    uint64_t v25 = v12;
    long long v14 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService setUpClassificationActivityWithDeferral:]", "%s\n", v14);
    if (v14 != (char *)buf) {
      free(v14);
    }
  }
  xpc_activity_unregister("com.apple.locationd.Mobility.Classification");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100F4F9B4;
  handler[3] = &unk_1022AD1E8;
  handler[4] = [objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "vendor") proxyForService:@"CLMobilityWalkingBoutService"];
  handler[5] = v12;
  xpc_activity_register("com.apple.locationd.Mobility.Classification", XPC_ACTIVITY_CHECK_IN, handler);
  if (v19) {
    sub_1000DB0A0(v19);
  }
}

- (void)setUpProcessBoutsActivity
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, 600);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100F5005C;
  handler[3] = &unk_1022B9CD0;
  handler[4] = [objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "vendor") proxyForService:@"CLMobilityWalkingBoutService"];
  xpc_activity_register("com.apple.locationd.Mobility.ProcessBouts", v3, handler);
  xpc_release(v3);
}

- (void)setUpAggregationOnTimer
{
  sub_100F50560((void **)self->fBoutBoundaryAggregator.__ptr_.__value_, 86400.0);
  sub_100F50818((void **)self->fGaitMetricsAggregator.__ptr_.__value_, 86400.0);
  sub_100F50AD0((void **)self->fBoutMetricsAggregator.__ptr_.__value_, 7776000.0);
  sub_100F50D88((void **)self->fSmoothedGaitMetricsAggregator.__ptr_.__value_, 259200.0);
  int v11 = 86400;
  uint64_t v3 = sub_1000D3E78();
  sub_10006B564(v3, &v9);
  int v4 = sub_10006EF84(v9, "MobilityAggregationInterval", &v11);
  if (v10) {
    sub_1000DB0A0(v10);
  }
  if (v4) {
    uint64_t v5 = 1000000000 * v11;
  }
  else {
    uint64_t v5 = 86400000000000;
  }
  uint64_t v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)[objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "silo") queue]);
  self->fAggregationTimer = v6;
  dispatch_source_set_timer((dispatch_source_t)v6, 0, v5, 0xDF8475800uLL);
  fAggregationTimer = self->fAggregationTimer;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100F51040;
  v8[3] = &unk_10229FED8;
  v8[4] = self;
  dispatch_source_set_event_handler(fAggregationTimer, v8);
  dispatch_resume((dispatch_object_t)self->fAggregationTimer);
}

- (void)setUpMobilityCompanionSyncActivity
{
  if (qword_1024191F0 != -1) {
    dispatch_once(&qword_1024191F0, &stru_102306018);
  }
  uint64_t v3 = qword_1024191F8;
  if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v10 = qword_102482448;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "XPC Mobility Sync: setting up activity. Timer set to %lld seconds", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_102306018);
    }
    int v7 = 134217984;
    uint64_t v8 = qword_102482448;
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService setUpMobilityCompanionSyncActivity]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, qword_102482448);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_COMMUNICATES_WITH_PAIRED_DEVICE, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100F51304;
  handler[3] = &unk_1022B9CD0;
  handler[4] = [objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "vendor") proxyForService:@"CLMobilityWalkingBoutService"];
  xpc_activity_register("com.apple.locationd.Mobility.CompanionSync", v4, handler);
  xpc_release(v4);
}

- (void)registerForMobilityBoutMetrics:(id)a3
{
  [(NSMutableSet *)[(CLMobilityWalkingBoutService *)self boutClients] addObject:a3];
  if (qword_1024191F0 != -1) {
    dispatch_once(&qword_1024191F0, &stru_102306018);
  }
  uint64_t v5 = qword_1024191F8;
  if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v8 = a3;
    __int16 v9 = 1024;
    unsigned int v10 = [(NSMutableSet *)[(CLMobilityWalkingBoutService *)self boutClients] count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BoutService: Registered new BoutMetrics client %@. Current client count: %d", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_102306018);
    }
    [(NSMutableSet *)[(CLMobilityWalkingBoutService *)self boutClients] count];
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService registerForMobilityBoutMetrics:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

- (void)unregisterForMobilityBoutMetrics:(id)a3
{
  [(NSMutableSet *)[(CLMobilityWalkingBoutService *)self boutClients] removeObject:a3];
  if (qword_1024191F0 != -1) {
    dispatch_once(&qword_1024191F0, &stru_102306018);
  }
  uint64_t v5 = qword_1024191F8;
  if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v8 = a3;
    __int16 v9 = 1024;
    unsigned int v10 = [(NSMutableSet *)[(CLMobilityWalkingBoutService *)self boutClients] count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BoutService: Unregistered BoutMetrics client %@. Current client count: %d", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_102306018);
    }
    [(NSMutableSet *)[(CLMobilityWalkingBoutService *)self boutClients] count];
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService unregisterForMobilityBoutMetrics:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

- (void)registerForWalkingSteadiness:(id)a3
{
  [(NSMutableSet *)[(CLMobilityWalkingBoutService *)self steadinessClients] addObject:a3];
  if (qword_102418FA0 != -1) {
    dispatch_once(&qword_102418FA0, &stru_102306038);
  }
  uint64_t v5 = qword_102418FA8;
  if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v8 = a3;
    __int16 v9 = 1024;
    unsigned int v10 = [(NSMutableSet *)[(CLMobilityWalkingBoutService *)self steadinessClients] count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BoutService: Registered new WalkingSteadiness client %@. Current client count: %d", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102418FA0 != -1) {
      dispatch_once(&qword_102418FA0, &stru_102306038);
    }
    [(NSMutableSet *)[(CLMobilityWalkingBoutService *)self steadinessClients] count];
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService registerForWalkingSteadiness:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

- (void)unregisterForWalkingSteadiness:(id)a3
{
  [(NSMutableSet *)[(CLMobilityWalkingBoutService *)self steadinessClients] removeObject:a3];
  if (qword_102418FA0 != -1) {
    dispatch_once(&qword_102418FA0, &stru_102306038);
  }
  uint64_t v5 = qword_102418FA8;
  if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v8 = a3;
    __int16 v9 = 1024;
    unsigned int v10 = [(NSMutableSet *)[(CLMobilityWalkingBoutService *)self steadinessClients] count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BoutService: Unregistered new WalkingSteadiness client %@. Current client count: %d", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102418FA0 != -1) {
      dispatch_once(&qword_102418FA0, &stru_102306038);
    }
    [(NSMutableSet *)[(CLMobilityWalkingBoutService *)self steadinessClients] count];
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService unregisterForWalkingSteadiness:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

- (void)sendCompanionSyncAnalyticsWithMsgSize:(int)a3 isSuccess:(BOOL)a4 isActivityDeferred:(BOOL)a5 isActivityValid:(BOOL)a6 isWatchPaired:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v12 = operator new(0x14uLL);
  v12[4] = 500000;
  *(_OWORD *)uint64_t v12 = xmmword_101D98A98;
  __int16 v22 = 0;
  uint64_t v23 = 0;
  uint64_t v21 = 0;
  sub_10010F834(&v21, v12, (uint64_t)(v12 + 5), 5uLL);
  uint64_t v13 = v22 - (unsigned char *)v21;
  if (v22 == (unsigned char *)v21)
  {
    LODWORD(v14) = 0;
    int v16 = 0;
    if (!v22) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = v13 >> 2;
    if ((unint64_t)(v13 >> 2) <= 1) {
      uint64_t v15 = 1;
    }
    while (v21[v14] < a3)
    {
      if (v15 == ++v14)
      {
        LODWORD(v14) = v15;
        break;
      }
    }
  }
  __int16 v22 = v21;
  operator delete(v21);
  int v16 = v14;
LABEL_9:
  if (qword_1024191F0 != -1) {
    dispatch_once(&qword_1024191F0, &stru_102306018);
  }
  double v17 = qword_1024191F8;
  if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110400;
    int v37 = a3;
    __int16 v38 = 1024;
    int v39 = v16;
    __int16 v40 = 1024;
    BOOL v41 = v9;
    __int16 v42 = 1024;
    BOOL v43 = v10;
    __int16 v44 = 1024;
    BOOL v45 = v8;
    __int16 v46 = 1024;
    BOOL v47 = v7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "CLMobilityWalkingBoutService: CompanionSync core analytics: %d, %d, %d, %d, %d, %d", buf, 0x26u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_102306018);
    }
    int v24 = 67110400;
    int v25 = a3;
    __int16 v26 = 1024;
    int v27 = v16;
    __int16 v28 = 1024;
    BOOL v29 = v9;
    __int16 v30 = 1024;
    BOOL v31 = v10;
    __int16 v32 = 1024;
    BOOL v33 = v8;
    __int16 v34 = 1024;
    BOOL v35 = v7;
    int v19 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService sendCompanionSyncAnalyticsWithMsgSize:isSuccess:isActivityDeferred:isActivityValid:isWatchPaired:]", "%s\n", v19);
    if (v19 != (char *)buf) {
      free(v19);
    }
  }
  if (objc_opt_class()
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    AnalyticsSendEventLazy();
  }
  else
  {
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_102306018);
    }
    uint64_t v18 = qword_1024191F8;
    if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "CLMobilityWalkingBoutService: Not authorized to submit analytics without IHA", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191F0 != -1) {
        dispatch_once(&qword_1024191F0, &stru_102306018);
      }
      LOWORD(v24) = 0;
      int v20 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService sendCompanionSyncAnalyticsWithMsgSize:isSuccess:isActivityDeferred:isActivityValid:isWatchPaired:]", "%s\n", v20);
      if (v20 != (char *)buf) {
        free(v20);
      }
    }
  }
  operator delete(v12);
}

- (NSMutableSet)boutClients
{
  return self->_boutClients;
}

- (void)setBoutClients:(id)a3
{
}

- (NSMutableSet)steadinessClients
{
  return self->_steadinessClients;
}

- (void)setSteadinessClients:(id)a3
{
}

- (void).cxx_destruct
{
  p_fMobilityCalManager = &self->fMobilityCalManager;
  value = p_fMobilityCalManager->__ptr_.__value_;
  p_fMobilityCalManager->__ptr_.__value_ = 0;
  if (value) {
    sub_100F52F48((uint64_t)p_fMobilityCalManager, value);
  }
  uint64_t v5 = self->fSmoothedGaitMetricsProcessor.__ptr_.__value_;
  self->fSmoothedGaitMetricsProcessor.__ptr_.__value_ = 0;
  if (v5) {
    sub_100F52EE4((uint64_t)&self->fSmoothedGaitMetricsProcessor, (uint64_t)v5);
  }
  uint64_t v6 = self->fSPUGaitMetricsDispatcher.__ptr_.__value_;
  self->fSPUGaitMetricsDispatcher.__ptr_.__value_ = 0;
  if (v6) {
    (*(void (**)(void *))(*(void *)v6 + 8))(v6);
  }
  BOOL v7 = self->fSteadinessClassifier.__ptr_.__value_;
  self->fSteadinessClassifier.__ptr_.__value_ = 0;
  if (v7) {
    sub_100F52D34((uint64_t)&self->fSteadinessClassifier, (uint64_t)v7);
  }
  sub_100F52C64((uint64_t *)&self->fBoutExtractor, 0);
  sub_1003B273C((uint64_t *)&self->fSmoothedGaitMetricsAggregator, 0);
  cntrl = self->fSmoothedGaitMetricsDb.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  BOOL v9 = self->fHKQueryDelegate.__cntrl_;
  if (v9) {
    sub_1000DB0A0((std::__shared_weak_count *)v9);
  }
  BOOL v10 = self->fPedometerDb.__cntrl_;
  if (v10) {
    sub_1000DB0A0((std::__shared_weak_count *)v10);
  }
  sub_1003B273C((uint64_t *)&self->fBoutMetricsAggregator, 0);
  int v11 = self->fBoutMetricsDb.__cntrl_;
  if (v11) {
    sub_1000DB0A0((std::__shared_weak_count *)v11);
  }
  sub_1003B273C((uint64_t *)&self->fGaitMetricsAggregator, 0);
  uint64_t v12 = self->fGaitMetricsDb.__cntrl_;
  if (v12) {
    sub_1000DB0A0((std::__shared_weak_count *)v12);
  }
  sub_1003B273C((uint64_t *)&self->fBoutBoundaryAggregator, 0);
  uint64_t v13 = self->fBoutBoundaryDb.__cntrl_;
  if (v13) {
    sub_1000DB0A0((std::__shared_weak_count *)v13);
  }
  uint64_t v14 = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = 0;
  if (v14) {
    (*(void (**)(Client *))(*(void *)v14 + 8))(v14);
  }
  uint64_t v15 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  if (v15) {
    (*(void (**)(Client *))(*(void *)v15 + 8))(v15);
  }
  int v16 = self->fMotionStateObserverClient.__ptr_.__value_;
  self->fMotionStateObserverClient.__ptr_.__value_ = 0;
  if (v16) {
    (*(void (**)(Client *))(*(void *)v16 + 8))(v16);
  }
  double v17 = self->fDaemonStatusClient.__ptr_.__value_;
  self->fDaemonStatusClient.__ptr_.__value_ = 0;
  if (v17) {
    (*(void (**)(Client *))(*(void *)v17 + 8))(v17);
  }
  uint64_t v18 = self->fUserInfoClient.__ptr_.__value_;
  self->fUserInfoClient.__ptr_.__value_ = 0;
  if (v18) {
    (*(void (**)(Client *))(*(void *)v18 + 8))(v18);
  }
  int v19 = self->fStepCountClient.__ptr_.__value_;
  self->fStepCountClient.__ptr_.__value_ = 0;
  if (v19)
  {
    int v20 = *(void (**)(void))(*(void *)v19 + 8);
    v20();
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
  *((void *)self + 16) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 20) = 0;
  *((void *)self + 21) = 0;
  *((void *)self + 22) = 0;
  *((void *)self + 24) = 0;
  *((void *)self + 25) = 0;
  *((void *)self + 27) = 0;
  *((void *)self + 28) = 0;
  *((void *)self + 29) = 0;
  return self;
}

@end