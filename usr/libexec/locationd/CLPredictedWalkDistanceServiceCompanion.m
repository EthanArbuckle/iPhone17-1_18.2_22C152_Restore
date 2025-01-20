@interface CLPredictedWalkDistanceServiceCompanion
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)isWheelchairMode;
- (CLPredictedWalkDistanceServiceCompanion)init;
- (id).cxx_construct;
- (void)beginService;
- (void)completeActivity:(id)a3 withNextEstimateTime:(double)a4;
- (void)endService;
- (void)getSixMinuteWalkDistancePrediction:(id)a3;
- (void)onP6MWDActivity:(id)a3;
- (void)onUserInfoUpdate:(const int *)a3 data:(const NotificationData *)a4;
- (void)receivePredictedWalkDistanceBout:(id)a3;
- (void)scheduleEstimate;
- (void)sendAnalyticsWeeklyEstimate:(CLPredictedWalkDistanceEstimate *)a3 strideCalInfo:(StrideCalInfo *)a4 walkingWorkoutPaceStats:(CLRunningStat *)a5 runningWorkoutPaceStats:(CLRunningStat *)a6 userInfo:(CLBodyMetrics *)a7;
- (void)sendToCoreAnalyticsWeeklyEstimate:(const CLPredictedWalkDistanceEstimateAnalytics *)a3;
- (void)setUpAggregationOnTimer;
- (void)writeToHealthKitPrediction:(double)a3 estimateTime:(double)a4 earliestTimeUsed:(double)a5 calibrationStatus:(BOOL)a6;
@end

@implementation CLPredictedWalkDistanceServiceCompanion

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
  if (qword_10247A8B0 != -1) {
    dispatch_once(&qword_10247A8B0, &stru_1022AD1A0);
  }
  return (id)qword_10247A8A8;
}

- (CLPredictedWalkDistanceServiceCompanion)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLPredictedWalkDistanceServiceCompanion;
  return [(CLPredictedWalkDistanceServiceCompanion *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLPredictedWalkDistanceServiceCompanionProtocol outboundProtocol:&OBJC_PROTOCOL___CLPredictedWalkDistanceServiceCompanionClientProtocol];
}

+ (BOOL)isSupported
{
  if (qword_10247A8C0 != -1) {
    dispatch_once(&qword_10247A8C0, &stru_1022AD1C0);
  }
  return byte_10247A8B8;
}

- (void)beginService
{
  if (qword_102419200 != -1) {
    dispatch_once(&qword_102419200, &stru_1022AD450);
  }
  objc_super v3 = qword_102419208;
  if (os_log_type_enabled((os_log_t)qword_102419208, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting up CLPredictedWalkDistanceServiceCompanion", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419200 != -1) {
      dispatch_once(&qword_102419200, &stru_1022AD450);
    }
    LOWORD(v8) = 0;
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion beginService]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  LOBYTE(v7) = 0;
  sub_1003B23B4((unsigned __int8 *)&v7, buf);
  shared_ptr<CLPredictedWalkDistanceBoutRecorderDb> v4 = *(shared_ptr<CLPredictedWalkDistanceBoutRecorderDb> *)buf;
  memset(buf, 0, sizeof(buf));
  cntrl = self->fBoutDb.__cntrl_;
  self->fBoutDb = v4;
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
  fAggregationTimer = self->fAggregationTimer;
  if (fAggregationTimer)
  {
    dispatch_source_cancel(fAggregationTimer);
    dispatch_release((dispatch_object_t)self->fAggregationTimer);
    self->fAggregationTimer = 0;
  }

  self->fHkHealthStore = 0;
}

- (void)scheduleEstimate
{
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v4 = sub_1000D3E78();
  sub_10006B564(v4, &v14);
  double v13 = 0.0;
  sub_1000A699C(v14, "kP6MWDNextEstimateTime", &v13);
  double v5 = v13;
  if (v13 > Current + 604800.0)
  {
    if (qword_102419200 != -1) {
      dispatch_once(&qword_102419200, &stru_1022AD450);
    }
    v6 = qword_102419208;
    if (os_log_type_enabled((os_log_t)qword_102419208, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v23 = "kP6MWDNextEstimateTime";
      __int16 v24 = 2050;
      double v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s is too far in the future (%{public}.2f). Resetting!", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419200 != -1) {
        dispatch_once(&qword_102419200, &stru_1022AD450);
      }
      int v16 = 136446466;
      v17 = "kP6MWDNextEstimateTime";
      __int16 v18 = 2050;
      double v19 = v13;
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPredictedWalkDistanceServiceCompanion scheduleEstimate]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    sub_1004CF7DC(v14, "kP6MWDNextEstimateTime", 0xFFFFFFFFLL);
    double v13 = 0.0;
    double v5 = 0.0;
  }
  double v7 = v5 - Current;
  if (XPC_ACTIVITY_INTERVAL_30_MIN <= (uint64_t)v7) {
    int64_t v8 = (uint64_t)v7;
  }
  else {
    int64_t v8 = XPC_ACTIVITY_INTERVAL_30_MIN;
  }
  if (qword_102419200 != -1) {
    dispatch_once(&qword_102419200, &stru_1022AD450);
  }
  v9 = qword_102419208;
  if (os_log_type_enabled((os_log_t)qword_102419208, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v23 = "com.apple.locationd.P6MWD";
    __int16 v24 = 2050;
    double v25 = v13;
    __int16 v26 = 2050;
    int64_t v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: Registering XPC Activity with nextEstimateTime=(%{public}.2f) and delay=(%{public}lld)", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419200 != -1) {
      dispatch_once(&qword_102419200, &stru_1022AD450);
    }
    int v16 = 136446722;
    v17 = "com.apple.locationd.P6MWD";
    __int16 v18 = 2050;
    double v19 = v13;
    __int16 v20 = 2050;
    int64_t v21 = v8;
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion scheduleEstimate]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  xpc_activity_unregister("com.apple.locationd.P6MWD");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1003A85E4;
  handler[3] = &unk_1022AD1E8;
  handler[4] = [objc_msgSend(-[CLPredictedWalkDistanceServiceCompanion universe](self, "universe"), "vendor") proxyForService:@"CLPredictedWalkDistanceServiceCompanion"];
  handler[5] = v8;
  xpc_activity_register("com.apple.locationd.P6MWD", XPC_ACTIVITY_CHECK_IN, handler);
  if (v15) {
    sub_1000DB0A0(v15);
  }
}

- (void)setUpAggregationOnTimer
{
  sub_1003A8D3C((void **)self->fBoutAggregator.__ptr_.__value_, 2419200.0);
  int v10 = 86400;
  uint64_t v3 = sub_1000D3E78();
  sub_10006B564(v3, &v8);
  sub_10006EF84(v8, "P6MWDAggregationTimeInterval", &v10);
  if (v9) {
    sub_1000DB0A0(v9);
  }
  uint64_t v4 = 1000000000 * v10;
  double v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)[objc_msgSend(-[CLPredictedWalkDistanceServiceCompanion universe](self, "universe"), "silo") queue]);
  self->fAggregationTimer = v5;
  dispatch_source_set_timer((dispatch_source_t)v5, 0, v4, 0xDF8475800uLL);
  fAggregationTimer = self->fAggregationTimer;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003A8FF4;
  v7[3] = &unk_10229FED8;
  v7[4] = self;
  dispatch_source_set_event_handler(fAggregationTimer, v7);
  dispatch_resume((dispatch_object_t)self->fAggregationTimer);
}

- (void)onP6MWDActivity:(id)a3
{
  if (!a3)
  {
    if (qword_102419200 != -1) {
      dispatch_once(&qword_102419200, &stru_1022AD450);
    }
    uint64_t v8 = qword_102419208;
    if (os_log_type_enabled((os_log_t)qword_102419208, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid xpc activity.", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419200 == -1)
    {
LABEL_28:
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPredictedWalkDistanceServiceCompanion onP6MWDActivity:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
      return;
    }
LABEL_30:
    dispatch_once(&qword_102419200, &stru_1022AD450);
    goto LABEL_28;
  }
  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    if (qword_102419200 != -1) {
      dispatch_once(&qword_102419200, &stru_1022AD450);
    }
    double v7 = qword_102419208;
    if (os_log_type_enabled((os_log_t)qword_102419208, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Preparing to make weekly 6MWD prediction", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419200 != -1) {
        dispatch_once(&qword_102419200, &stru_1022AD450);
      }
      int v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion onP6MWDActivity:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    [(CLPredictedWalkDistanceServiceCompanion *)self getSixMinuteWalkDistancePrediction:a3];
    return;
  }
  if (qword_102419200 != -1) {
    dispatch_once(&qword_102419200, &stru_1022AD450);
  }
  v9 = qword_102419208;
  if (os_log_type_enabled((os_log_t)qword_102419208, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    xpc_activity_state_t v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unexpected activity state: %ld", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419200 == -1) {
      goto LABEL_28;
    }
    goto LABEL_30;
  }
}

- (void)getSixMinuteWalkDistancePrediction:(id)a3
{
  if (objc_opt_class() && ![(CLPredictedWalkDistanceServiceCompanion *)self isWheelchairMode])
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v117 = 0.0;
    uint64_t v7 = sub_1000D3E78();
    sub_10006B564(v7, buf);
    sub_1000A699C(*(uint64_t *)buf, "kP6MWDNextEstimateTime", &v117);
    if (*(void *)&buf[8]) {
      sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
    }
    if (Current >= v117)
    {
      int v116 = 0;
      int v116 = *(_DWORD *)self->fP6MWDEstimator.__ptr_.__value_;
      uint64_t v9 = sub_1000D3E78();
      sub_10006B564(v9, buf);
      int v10 = sub_10006EF84(*(uint64_t *)buf, "P6MWDActivityHistoryDuration", &v116);
      if (*(void *)&buf[8]) {
        sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
      }
      if (v10) {
        *(_DWORD *)self->fP6MWDEstimator.__ptr_.__value_ = v116;
      }
      int v11 = v116;
      v12 = +[NSDate date];
      xpc_activity_state_t v13 = [(NSDate *)v12 dateByAddingTimeInterval:(double)v11 * -86400.0];
      uint64_t v14 = dispatch_group_create();
      v114[0] = 0;
      v114[1] = v114;
      v114[2] = 0x2020000000;
      char v115 = 0;
      v112[0] = 0;
      v112[1] = v112;
      v112[2] = 0x2020000000;
      char v113 = 0;
      v108[0] = 0;
      v108[1] = v108;
      v108[2] = 0x4812000000;
      v108[3] = sub_1001778B4;
      v108[4] = sub_1001772C4;
      v108[5] = "";
      uint64_t v111 = 0;
      v109 = 0;
      v110 = 0;
      v104[0] = 0;
      v104[1] = v104;
      v104[2] = 0x4812000000;
      v104[3] = sub_1003AAFF8;
      v104[4] = sub_1003AB01C;
      v104[5] = "";
      uint64_t v107 = 0;
      v105 = 0;
      v106 = 0;
      v100[0] = 0;
      v100[1] = v100;
      v100[2] = 0x4812000000;
      v100[3] = sub_1003AAFF8;
      v100[4] = sub_1003AB01C;
      v100[5] = "";
      uint64_t v103 = 0;
      v101 = 0;
      v102 = 0;
      v96[0] = 0;
      v96[1] = v96;
      v96[2] = 0x4812000000;
      v96[3] = sub_1003AAFF8;
      v96[4] = sub_1003AB01C;
      v96[5] = "";
      uint64_t v99 = 0;
      v97 = 0;
      v98 = 0;
      v92[0] = 0;
      v92[1] = v92;
      v92[2] = 0x4812000000;
      v92[3] = sub_1003AAFF8;
      v92[4] = sub_1003AB01C;
      v92[5] = "";
      uint64_t v95 = 0;
      v93 = 0;
      v94 = 0;
      v88[0] = 0;
      v88[1] = v88;
      v88[2] = 0x4812000000;
      v88[3] = sub_1003AAFF8;
      v88[4] = sub_1003AB01C;
      v88[5] = "";
      uint64_t v91 = 0;
      v89 = 0;
      v90 = 0;
      v84[0] = 0;
      v84[1] = v84;
      v84[2] = 0x4812000000;
      v84[3] = sub_1003AB034;
      v84[4] = sub_1003AB058;
      v84[5] = "";
      uint64_t v87 = 0;
      v85 = 0;
      v86 = 0;
      v80[0] = 0;
      v80[1] = v80;
      v80[2] = 0x4812000000;
      v80[3] = sub_1003AB070;
      v80[4] = sub_1003AB094;
      v80[5] = "";
      uint64_t v83 = 0;
      v81 = 0;
      v82 = 0;
      v76[0] = 0;
      v76[1] = v76;
      v76[2] = 0x4812000000;
      v76[3] = sub_1003AB070;
      v76[4] = sub_1003AB094;
      v76[5] = "";
      uint64_t v79 = 0;
      v77 = 0;
      v78 = 0;
      v72[0] = 0;
      v72[1] = v72;
      v72[2] = 0x4812000000;
      v72[3] = sub_1003AB0AC;
      v72[4] = sub_1003AB0D0;
      v72[5] = "";
      uint64_t v75 = 0;
      __p = 0;
      v74 = 0;
      v68[0] = 0;
      v68[1] = v68;
      v68[2] = 0x5812000000;
      v68[3] = sub_1003AB0E8;
      v68[4] = nullsub_177;
      v68[5] = "";
      int v69 = 0;
      long long v70 = 0u;
      long long v71 = 0u;
      v64[0] = 0;
      v64[1] = v64;
      v64[2] = 0x5812000000;
      v64[3] = sub_1003AB0E8;
      v64[4] = nullsub_177;
      v64[5] = "";
      int v65 = 0;
      long long v66 = 0u;
      long long v67 = 0u;
      dispatch_group_enter(v14);
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1003AB100;
      block[3] = &unk_1022AD210;
      block[4] = self;
      block[5] = v13;
      block[8] = v108;
      block[9] = v114;
      block[6] = v12;
      block[7] = v14;
      dispatch_async(global_queue, block);
      id v16 = [[[[[[self universe] vendor] proxyForService:@"CLNatalimetryNotifier"] syncgetUserProfile] copy];
      *(void *)v125 = 0;
      *(void *)&v125[8] = v125;
      *(void *)&v125[16] = 0x7012000000;
      v126 = sub_1003AB468;
      v127 = nullsub_178;
      v128 = "";
      long long v129 = xmmword_101D1C6E8;
      long long v130 = unk_101D1C6F8;
      v131[0] = xmmword_101D1C708;
      *(_OWORD *)((char *)v131 + 12) = *(long long *)((char *)&xmmword_101D1C708 + 12);
      id v17 = [v16 objectForKey:CMNatalimeterSetUserAgeYr];
      if (v17)
      {
        uint64_t v18 = *(void *)&v125[8];
        [v17 floatValue];
        *(unsigned char *)(v18 + 104) = 1;
        *(_DWORD *)(v18 + 68) = v19;
      }
      id v20 = [v16 objectForKey:CMNatalimeterSetUserHeightMeter];
      if (v20)
      {
        uint64_t v21 = *(void *)&v125[8];
        [v20 floatValue];
        *(unsigned char *)(v21 + 105) = 1;
        *(_DWORD *)(v21 + 56) = v22;
      }
      [objc_msgSend(v16, "objectForKey:", CMNatalimeterSetUserWeightKG) floatValue];
      *(_DWORD *)(*(void *)&v125[8] + 60) = v23;
      unsigned int v24 = [[objc_msgSend(v16, "objectForKey:", CMNatalimeterSetUserBiologicalSex) intValue];
      *(_DWORD *)(*(void *)&v125[8] + 52) = v24;
      if (qword_102419200 != -1) {
        dispatch_once(&qword_102419200, &stru_1022AD450);
      }
      double v25 = qword_102419208;
      if (os_log_type_enabled((os_log_t)qword_102419208, OS_LOG_TYPE_DEBUG))
      {
        double v26 = *(float *)(*(void *)&v125[8] + 68);
        double v27 = *(float *)(*(void *)&v125[8] + 56);
        double v28 = *(float *)(*(void *)&v125[8] + 60);
        *(_DWORD *)buf = 134284033;
        *(double *)&uint8_t buf[4] = v26;
        *(_WORD *)&buf[12] = 2049;
        *(double *)&buf[14] = v27;
        __int16 v133 = 2049;
        double v134 = v28;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Retrieved demographics: age=%{private}.0f, height=%{private}.2f, weight=%{private}.1f", buf, 0x20u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419200 != -1) {
          dispatch_once(&qword_102419200, &stru_1022AD450);
        }
        double v47 = *(float *)(*(void *)&v125[8] + 68);
        double v48 = *(float *)(*(void *)&v125[8] + 56);
        double v49 = *(float *)(*(void *)&v125[8] + 60);
        int v119 = 134284033;
        double v120 = v47;
        __int16 v121 = 2049;
        double v122 = v48;
        __int16 v123 = 2049;
        double v124 = v49;
        v50 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion getSixMinuteWalkDistancePrediction:]", "%s\n", v50);
        if (v50 != buf) {
          free(v50);
        }
      }
      id v29 = objc_alloc_init((Class)CMPedometer);
      dispatch_group_enter(v14);
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472;
      v62[2] = sub_1003AB488;
      v62[3] = &unk_1022AD238;
      v62[5] = v80;
      v62[4] = v14;
      [v29 queryRemoteStepCadenceToStrideLengthBinsWithHandler:v62];
      dispatch_group_enter(v14);
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_1003AB954;
      v61[3] = &unk_1022AD238;
      v61[5] = v76;
      v61[4] = v14;
      [v29 queryStepCadenceToStrideLengthBinsWithHandler:v61];
      dispatch_group_enter(v14);
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_1003ABE20;
      v60[3] = &unk_1022AD260;
      v60[4] = self;
      v60[5] = v12;
      v60[8] = v114;
      v60[7] = v72;
      v60[6] = v14;
      dispatch_async(global_queue, v60);
      v30 = [(NSDate *)v13 dateByAddingTimeInterval:-86400.0];
      if (qword_102419200 != -1) {
        dispatch_once(&qword_102419200, &stru_1022AD450);
      }
      v31 = qword_102419208;
      if (os_log_type_enabled((os_log_t)qword_102419208, OS_LOG_TYPE_DEBUG))
      {
        [(NSDate *)v30 timeIntervalSinceReferenceDate];
        uint64_t v33 = v32;
        [(NSDate *)v12 timeIntervalSinceReferenceDate];
        *(_DWORD *)buf = 134349312;
        *(void *)&uint8_t buf[4] = v33;
        *(_WORD *)&buf[12] = 2050;
        *(void *)&buf[14] = v34;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "HealthKit queries from %{public}.0f to %{public}.0f", buf, 0x16u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419200 != -1) {
          dispatch_once(&qword_102419200, &stru_1022AD450);
        }
        [(NSDate *)v30 timeIntervalSinceReferenceDate];
        double v52 = v51;
        [(NSDate *)v12 timeIntervalSinceReferenceDate];
        int v119 = 134349312;
        double v120 = v52;
        __int16 v121 = 2050;
        double v122 = v53;
        v54 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion getSixMinuteWalkDistancePrediction:]", "%s\n", v54);
        if (v54 != buf) {
          free(v54);
        }
      }
      v35 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
      v36 = [(NSCalendar *)v35 components:30 fromDate:v30];
      [(NSDateComponents *)v36 setCalendar:v35];
      v37 = [(NSCalendar *)v35 components:30 fromDate:v12];
      [(NSDateComponents *)v37 setCalendar:v35];
      v38 = +[HKQuery predicateForActivitySummariesBetweenStartDateComponents:v36 endDateComponents:v37];
      dispatch_group_enter(v14);
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_1003AC168;
      v59[3] = &unk_1022AD2B0;
      v59[6] = v114;
      v59[7] = v104;
      v59[8] = v96;
      v59[9] = v92;
      v59[4] = self;
      v59[5] = v14;
      id v39 = [objc_alloc((Class)HKActivitySummaryQuery) initWithPredicate:v38 resultsHandler:v59];
      [(HKHealthStore *)self->fHkHealthStore executeQuery:v39];

      v40 = +[HKQuery predicateForSamplesWithStartDate:v30 endDate:v12 options:3];
      id v41 = +[HKQuery _predicateForObjectsFromAppleWatches];
      v118[0] = v40;
      v118[1] = v41;
      v42 = +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:v118 count:2]);
      dispatch_group_enter(v14);
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_1003ACB9C;
      v58[3] = &unk_1022AD2D8;
      v58[6] = v114;
      v58[7] = v84;
      v58[8] = v68;
      v58[9] = v64;
      v58[4] = self;
      v58[5] = v14;
      id v43 = [objc_alloc((Class)HKSampleQuery) initWithSampleType:+[HKSampleType workoutType](HKSampleType, "workoutType") predicate:v42 limit:0 sortDescriptors:0 resultsHandler:v58];
      [(HKHealthStore *)self->fHkHealthStore executeQuery:v43];

      dispatch_group_enter(v14);
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_1003AD550;
      v57[3] = &unk_1022AD328;
      v57[6] = v114;
      v57[7] = v88;
      v57[4] = self;
      v57[5] = v14;
      id v44 = [objc_alloc((Class)HKSampleQuery) initWithSampleType:+[HKObjectType categoryTypeForIdentifier:](HKObjectType, "categoryTypeForIdentifier:", HKCategoryTypeIdentifierAppleStandHour) predicate:v42 limit:0 sortDescriptors:0 resultsHandler:v57];
      [(HKHealthStore *)self->fHkHealthStore executeQuery:v44];

      dispatch_group_enter(v14);
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_1003ADCB0;
      v56[3] = &unk_1022AD378;
      v56[6] = v114;
      v56[7] = v112;
      v56[8] = v100;
      v56[4] = self;
      v56[5] = v14;
      id v45 = [objc_alloc((Class)HKSampleQuery) initWithSampleType:+[HKSampleType quantityTypeForIdentifier:](HKSampleType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierFlightsClimbed) predicate:v40 limit:0 sortDescriptors:0 resultsHandler:v56];
      [(HKHealthStore *)self->fHkHealthStore executeQuery:v45];

      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_1003AE5D8;
      v55[3] = &unk_1022AD3A0;
      v55[4] = v14;
      v55[5] = a3;
      v55[8] = v114;
      v55[9] = v108;
      v55[6] = self;
      v55[7] = v12;
      v55[10] = v104;
      v55[11] = v88;
      v55[12] = v80;
      v55[13] = v125;
      v55[14] = v76;
      v55[15] = v72;
      v55[16] = v112;
      v55[17] = v100;
      v55[18] = v92;
      v55[19] = v96;
      v55[20] = v84;
      v55[21] = v68;
      v55[22] = v64;
      dispatch_group_notify(v14, (dispatch_queue_t)[objc_msgSend(-[CLPredictedWalkDistanceServiceCompanion universe](self, "universe"), "silo") queue], v55);
      _Block_object_dispose(v125, 8);
      _Block_object_dispose(v64, 8);
      _Block_object_dispose(v68, 8);
      _Block_object_dispose(v72, 8);
      if (__p)
      {
        v74 = __p;
        operator delete(__p);
      }
      _Block_object_dispose(v76, 8);
      if (v77)
      {
        v78 = v77;
        operator delete(v77);
      }
      _Block_object_dispose(v80, 8);
      if (v81)
      {
        v82 = v81;
        operator delete(v81);
      }
      _Block_object_dispose(v84, 8);
      if (v85)
      {
        v86 = v85;
        operator delete(v85);
      }
      _Block_object_dispose(v88, 8);
      if (v89)
      {
        v90 = v89;
        operator delete(v89);
      }
      _Block_object_dispose(v92, 8);
      if (v93)
      {
        v94 = v93;
        operator delete(v93);
      }
      _Block_object_dispose(v96, 8);
      if (v97)
      {
        v98 = v97;
        operator delete(v97);
      }
      _Block_object_dispose(v100, 8);
      if (v101)
      {
        v102 = v101;
        operator delete(v101);
      }
      _Block_object_dispose(v104, 8);
      if (v105)
      {
        v106 = v105;
        operator delete(v105);
      }
      _Block_object_dispose(v108, 8);
      if (v109)
      {
        v110 = v109;
        operator delete(v109);
      }
      _Block_object_dispose(v112, 8);
      _Block_object_dispose(v114, 8);
    }
    else
    {
      if (qword_102419200 != -1) {
        dispatch_once(&qword_102419200, &stru_1022AD450);
      }
      uint64_t v8 = qword_102419208;
      if (os_log_type_enabled((os_log_t)qword_102419208, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "kP6MWDNextEstimateTime";
        *(_WORD *)&buf[12] = 2050;
        *(double *)&buf[14] = v117;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Estimate should not be made now. %{public}s is in the future (%{public}.2f). Resetting!", buf, 0x16u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419200 != -1) {
          dispatch_once(&qword_102419200, &stru_1022AD450);
        }
        *(_DWORD *)v125 = 136446466;
        *(void *)&v125[4] = "kP6MWDNextEstimateTime";
        *(_WORD *)&v125[12] = 2050;
        *(double *)&v125[14] = v117;
        v46 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPredictedWalkDistanceServiceCompanion getSixMinuteWalkDistancePrediction:]", "%s\n", v46);
        if (v46 != buf) {
          free(v46);
        }
      }
      [(CLPredictedWalkDistanceServiceCompanion *)self completeActivity:a3 withNextEstimateTime:v117];
    }
  }
  else
  {
    double v5 = CFAbsoluteTimeGetCurrent() + (double)self->fP6MWDPredictionInterval;
    [(CLPredictedWalkDistanceServiceCompanion *)self completeActivity:a3 withNextEstimateTime:v5];
  }
}

- (void)completeActivity:(id)a3 withNextEstimateTime:(double)a4
{
  double v11 = a4;
  uint64_t v6 = sub_1000D3E78();
  sub_10006B564(v6, buf);
  sub_10016332C(*(uint64_t *)buf, "kP6MWDNextEstimateTime", &v11);
  if (*(void *)&buf[8]) {
    sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
  }
  if (!xpc_activity_set_state((xpc_activity_t)a3, 5))
  {
    if (qword_102419200 != -1) {
      dispatch_once(&qword_102419200, &stru_1022AD450);
    }
    uint64_t v7 = qword_102419208;
    if (os_log_type_enabled((os_log_t)qword_102419208, OS_LOG_TYPE_FAULT))
    {
      xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "com.apple.locationd.P6MWD";
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = state;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "Failed to mark %{public}s activity as Done. Current state is %{public}ld", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419200 != -1) {
        dispatch_once(&qword_102419200, &stru_1022AD450);
      }
      xpc_activity_state_t v9 = xpc_activity_get_state((xpc_activity_t)a3);
      int v12 = 136446466;
      xpc_activity_state_t v13 = "com.apple.locationd.P6MWD";
      __int16 v14 = 2050;
      xpc_activity_state_t v15 = v9;
      int v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPredictedWalkDistanceServiceCompanion completeActivity:withNextEstimateTime:]", "%s\n", v10);
      if (v10 != buf) {
        free(v10);
      }
    }
  }
  [(CLPredictedWalkDistanceServiceCompanion *)self scheduleEstimate];
}

- (void)writeToHealthKitPrediction:(double)a3 estimateTime:(double)a4 earliestTimeUsed:(double)a5 calibrationStatus:(BOOL)a6
{
  BOOL v6 = a6;
  if (objc_opt_class())
  {
    if (qword_102419200 != -1) {
      dispatch_once(&qword_102419200, &stru_1022AD450);
    }
    double v11 = round(a3);
    int v12 = qword_102419208;
    if (os_log_type_enabled((os_log_t)qword_102419208, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134350081;
      double v32 = a4;
      __int16 v33 = 2050;
      double v34 = a4;
      __int16 v35 = 2049;
      double v36 = v11;
      __int16 v37 = 1025;
      BOOL v38 = v6;
      __int16 v39 = 2049;
      double v40 = a5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Writing predicted 6MWD to HealthKit, startTime: %{public}f, endTime: %{public}f, prediction: %{private}f, calibrationStatus: %{private}d, earliestTimeUsed: %{private}f", buf, 0x30u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419200 != -1) {
        dispatch_once(&qword_102419200, &stru_1022AD450);
      }
      int v21 = 134350081;
      double v22 = a4;
      __int16 v23 = 2050;
      double v24 = a4;
      __int16 v25 = 2049;
      double v26 = v11;
      __int16 v27 = 1025;
      BOOL v28 = v6;
      __int16 v29 = 2049;
      double v30 = a5;
      int v19 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion writeToHealthKitPrediction:estimateTime:earliestTimeUsed:calibrationStatus:]", "%s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
    id v13 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierSixMinuteWalkTestDistance];
    __int16 v14 = objc_opt_new();
    xpc_activity_state_t v15 = v14;
    if (v6) {
      id v16 = &__kCFBooleanTrue;
    }
    else {
      id v16 = &__kCFBooleanFalse;
    }
    [v14 setObject:v16 forKeyedSubscript:HKMetadataKeyAppleDeviceCalibrated];
    if (a5 != 0.0) {
      [v15 setObject:[+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a5)] forKeyedSubscript:HKMetadataKeyDateOfEarliestDataUsedForEstimate];
    }
    id v17 = +[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:metadata:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v13, +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit unitFromString:](HKUnit, "unitFromString:", @"m"), v11), +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a4), +[NSDate dateWithTimeIntervalSinceReferenceDate:a4], v15);
    fHkHealthStore = self->fHkHealthStore;
    id v20 = v17;
    [(HKHealthStore *)fHkHealthStore saveObjects:+[NSArray arrayWithObjects:&v20 count:1] withCompletion:&stru_1022AD3E0];
  }
}

- (void)receivePredictedWalkDistanceBout:(id)a3
{
  if (qword_102419200 != -1) {
    dispatch_once(&qword_102419200, &stru_1022AD450);
  }
  double v5 = qword_102419208;
  if (os_log_type_enabled((os_log_t)qword_102419208, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received message in CLPredictedWalkDistanceServiceCompanion", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419200 != -1) {
      dispatch_once(&qword_102419200, &stru_1022AD450);
    }
    LOWORD(v32) = 0;
    __int16 v29 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion receivePredictedWalkDistanceBout:]", "%s\n", v29);
    if (v29 != (char *)buf) {
      free(v29);
    }
  }
  LODWORD(v32) = 0;
  *((void *)&v32 + 1) = 0;
  *(void *)&long long v33 = 0;
  DWORD2(v33) = 0;
  *(void *)&long long v35 = 0;
  long long v34 = 0uLL;
  DWORD2(v35) = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v39 = 0;
  [a3 getBytes:&v32 length:120];
  if (qword_102419200 != -1) {
    dispatch_once(&qword_102419200, &stru_1022AD450);
  }
  BOOL v6 = qword_102419208;
  if (os_log_type_enabled((os_log_t)qword_102419208, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134283777;
    uint64_t v48 = *((void *)&v32 + 1);
    __int16 v49 = 2049;
    uint64_t v50 = v33;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received bout from watch...,startTime,%{private}f,endTime,%{private}f", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419200 != -1) {
      dispatch_once(&qword_102419200, &stru_1022AD450);
    }
    *(_DWORD *)double v40 = 134283777;
    *(void *)&v40[4] = *((void *)&v32 + 1);
    *(_WORD *)&v40[12] = 2049;
    *(void *)&v40[14] = v33;
    double v30 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion receivePredictedWalkDistanceBout:]", "%s\n", v30);
    if (v30 != (char *)buf) {
      free(v30);
    }
  }
  sub_1003B0548(self->fBoutDb.__ptr_, (uint64_t)&v32, 0);
  p_fPendingWatchBouts = &self->fPendingWatchBouts;
  if (DWORD2(v36) == 1)
  {
    uint64_t v8 = operator new(0x88uLL);
    long long v9 = v37;
    v8[5] = v36;
    v8[6] = v9;
    v8[7] = v38;
    *((void *)v8 + 16) = v39;
    long long v10 = v33;
    v8[1] = v32;
    v8[2] = v10;
    long long v11 = v35;
    v8[3] = v34;
    v8[4] = v11;
    prev = p_fPendingWatchBouts->__end_.__prev_;
    *(void *)uint64_t v8 = p_fPendingWatchBouts->__end_.__prev_;
    *((void *)v8 + 1) = p_fPendingWatchBouts;
    prev[1] = v8;
    p_fPendingWatchBouts->__end_.__prev_ = v8;
    unint64_t v13 = self->fPendingWatchBouts.__size_alloc_.__value_ + 1;
    self->fPendingWatchBouts.__size_alloc_.__value_ = v13;
    if (v13) {
      goto LABEL_15;
    }
  }
  else if (self->fPendingWatchBouts.__size_alloc_.__value_)
  {
LABEL_15:
    while (1)
    {
      next = self->fPendingWatchBouts.__end_.__next_;
      long long v15 = next[1];
      long long v16 = next[2];
      long long v17 = next[4];
      long long v41 = next[3];
      long long v42 = v17;
      long long v18 = next[5];
      long long v19 = next[7];
      long long v44 = next[6];
      long long v45 = v19;
      uint64_t v46 = *((void *)next + 16);
      long long v43 = v18;
      ptr = self->fGaitMetricsDb.__ptr_;
      int v21 = (char *)ptr + 400;
      BOOL v22 = ptr == 0;
      __int16 v23 = self->fWalkingSpeedCalDb.__ptr_;
      uint64_t v24 = v22 ? 0 : (uint64_t)v21;
      uint64_t v25 = v23 ? (uint64_t)v23 + 352 : 0;
      *(_OWORD *)double v40 = v15;
      *(_OWORD *)&v40[16] = v16;
      if (sub_100619F6C((uint64_t)v40, v24, v25) == 109) {
        break;
      }
      double v26 = (uint64_t *)self->fPendingWatchBouts.__end_.__next_;
      uint64_t v27 = *v26;
      *(void *)(v27 + 8) = v26[1];
      *(void *)v26[1] = v27;
      --self->fPendingWatchBouts.__size_alloc_.__value_;
      operator delete(v26);
      if (!self->fPendingWatchBouts.__size_alloc_.__value_) {
        return;
      }
    }
    if (qword_102419200 != -1) {
      dispatch_once(&qword_102419200, &stru_1022AD450);
    }
    BOOL v28 = qword_102419208;
    if (os_log_type_enabled((os_log_t)qword_102419208, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Gait Metrics unavailable, likely because device is locked.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419200 != -1) {
        dispatch_once(&qword_102419200, &stru_1022AD450);
      }
      v31 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion receivePredictedWalkDistanceBout:]", "%s\n", v31);
      if (v31 != (char *)buf) {
        free(v31);
      }
    }
  }
}

- (void)onUserInfoUpdate:(const int *)a3 data:(const NotificationData *)a4
{
  [[-[CLPredictedWalkDistanceServiceCompanion universe](self, "universe") silo];
  if (*a3 == 2)
  {
    if (qword_102419200 != -1) {
      dispatch_once(&qword_102419200, &stru_1022AD450);
    }
    uint64_t v7 = qword_102419208;
    if (os_log_type_enabled((os_log_t)qword_102419208, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLPredictedWalkDistanceServiceCompanion: Received user info update", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419200 != -1) {
        dispatch_once(&qword_102419200, &stru_1022AD450);
      }
      unint64_t v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion onUserInfoUpdate:data:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
    long long v9 = *((_OWORD *)a4 + 1);
    long long v8 = *((_OWORD *)a4 + 2);
    long long v10 = *(_OWORD *)a4;
    *(_OWORD *)&self->fUserInfo.runVo2max = *(_OWORD *)((char *)a4 + 44);
    *(_OWORD *)&self->fUserInfo.vo2max = v9;
    *(_OWORD *)&self->fUserInfo.hronset = v8;
    *(_OWORD *)&self->fUserInfo.gender = v10;
  }
  else
  {
    if (qword_102419200 != -1) {
      dispatch_once(&qword_102419200, &stru_1022AD450);
    }
    long long v11 = qword_102419208;
    if (os_log_type_enabled((os_log_t)qword_102419208, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = *a3;
      *(_DWORD *)buf = 67109120;
      int v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Warning Unhandled notification type, %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419200 != -1) {
        dispatch_once(&qword_102419200, &stru_1022AD450);
      }
      __int16 v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion onUserInfoUpdate:data:]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
  }
}

- (void)sendAnalyticsWeeklyEstimate:(CLPredictedWalkDistanceEstimate *)a3 strideCalInfo:(StrideCalInfo *)a4 walkingWorkoutPaceStats:(CLRunningStat *)a5 runningWorkoutPaceStats:(CLRunningStat *)a6 userInfo:(CLBodyMetrics *)a7
{
  if (objc_opt_class()
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    double v13 = a3->var0 + -7862400.0;
    id v14 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:a3->var0];
    id v15 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:v13];
    id v37 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierSixMinuteWalkTestDistance];
    int v16 = +[HKQuery predicateForSamplesWithStartDate:v15 endDate:v14 options:3];
    id v17 = objc_alloc((Class)HKSampleQuery);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1003B0CF0;
    v38[3] = &unk_1022AD430;
    v38[4] = self;
    long long v18 = *(_OWORD *)&a3->var34;
    long long v53 = *(_OWORD *)&a3->var32;
    long long v54 = v18;
    long long v19 = *(_OWORD *)&a3->var29;
    long long v51 = *(_OWORD *)&a3->var27;
    long long v52 = v19;
    long long v20 = *(_OWORD *)&a3->var21;
    long long v47 = *(_OWORD *)&a3->var19;
    long long v48 = v20;
    long long v21 = *(_OWORD *)&a3->var25;
    long long v49 = *(_OWORD *)&a3->var23;
    long long v50 = v21;
    long long v22 = *(_OWORD *)&a3->var10;
    long long v43 = *(_OWORD *)&a3->var8;
    long long v44 = v22;
    long long v23 = *(_OWORD *)&a3->var16;
    long long v45 = *(_OWORD *)&a3->var14;
    long long v46 = v23;
    long long v24 = *(_OWORD *)&a3->var2;
    long long v39 = *(_OWORD *)&a3->var0;
    long long v40 = v24;
    long long v25 = *(_OWORD *)&a3->var6;
    long long v41 = *(_OWORD *)&a3->var4;
    long long v42 = v25;
    long long v26 = *(_OWORD *)&a4->var7;
    long long v57 = *(_OWORD *)&a4->var5;
    long long v58 = v26;
    long long v27 = *(_OWORD *)&a4->var3;
    long long v55 = *(_OWORD *)&a4->var0;
    long long v56 = v27;
    double var9 = a4->var9;
    long long v28 = *(_OWORD *)&a5->var2;
    long long v60 = *(_OWORD *)&a5->var0;
    long long v61 = v28;
    double var4 = a5->var4;
    double v30 = a6->var4;
    long long v31 = *(_OWORD *)&a6->var2;
    long long v63 = *(_OWORD *)&a6->var0;
    long long v64 = v31;
    double v62 = var4;
    double v65 = v30;
    *(_OWORD *)((char *)v68 + 12) = *(_OWORD *)&a7->runVo2max;
    long long v32 = *(_OWORD *)&a7->hronset;
    long long v33 = *(_OWORD *)&a7->gender;
    long long v67 = *(_OWORD *)&a7->vo2max;
    v68[0] = v32;
    long long v66 = v33;
    id v34 = [v17 initWithSampleType:v37 predicate:v16 limit:0 sortDescriptors:0 resultsHandler:v38];
    [(HKHealthStore *)self->fHkHealthStore executeQuery:v34];
  }
  else
  {
    if (qword_102419200 != -1) {
      dispatch_once(&qword_102419200, &stru_1022AD450);
    }
    long long v35 = qword_102419208;
    if (os_log_type_enabled((os_log_t)qword_102419208, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Not sending analytics, no IHA permission", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419200 != -1) {
        dispatch_once(&qword_102419200, &stru_1022AD450);
      }
      __int16 v69 = 0;
      long long v36 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion sendAnalyticsWeeklyEstimate:strideCalInfo:walkingWorkoutPaceStats:runningWorkoutPaceStats:userInfo:]", "%s\n", v36);
      if (v36 != (char *)buf) {
        free(v36);
      }
    }
  }
}

- (void)sendToCoreAnalyticsWeeklyEstimate:(const CLPredictedWalkDistanceEstimateAnalytics *)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_10247A8E0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_10247A8E0))
  {
    int v6 = 1119092736;
    *(_OWORD *)uint64_t v3 = xmmword_101D1C724;
    *(_OWORD *)&v3[16] = unk_101D1C734;
    long long v4 = xmmword_101D1C744;
    long long v5 = unk_101D1C754;
    sub_1003B17B4(&qword_10247A8C8, v3, 0x11uLL);
    __cxa_atexit((void (*)(void *))sub_1003B1838, &qword_10247A8C8, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_10247A8E0);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_10247A900, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_10247A900))
  {
    *(_OWORD *)uint64_t v3 = xmmword_101D1C768;
    *(_OWORD *)&v3[12] = *(long long *)((char *)&xmmword_101D1C768 + 12);
    sub_1003B17B4(&qword_10247A8E8, v3, 7uLL);
    __cxa_atexit((void (*)(void *))sub_1003B1838, &qword_10247A8E8, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_10247A900);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_10247A920, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_10247A920))
  {
    *(_OWORD *)uint64_t v3 = xmmword_101D1C784;
    *(_OWORD *)&v3[12] = *(long long *)((char *)&xmmword_101D1C784 + 12);
    sub_1003B17B4(&qword_10247A908, v3, 7uLL);
    __cxa_atexit((void (*)(void *))sub_1003B1838, &qword_10247A908, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_10247A920);
  }
  AnalyticsSendEventLazy();
}

- (BOOL)isWheelchairMode
{
  return self->fUserInfo.condition != 0;
}

- (void).cxx_destruct
{
  value = self->fUserInfoClient.__ptr_.__value_;
  self->fUserInfoClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  cntrl = self->fWalkingSpeedCalDb.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  sub_1003B2350(&self->fPendingWatchBouts.__end_.__prev_);
  long long v5 = self->fGaitMetricsDb.__cntrl_;
  if (v5) {
    sub_1000DB0A0((std::__shared_weak_count *)v5);
  }
  int v6 = self->fP6MWDEstimator.__ptr_.__value_;
  self->fP6MWDEstimator.__ptr_.__value_ = 0;
  if (v6) {
    operator delete();
  }
  sub_1003B273C((uint64_t *)&self->fBoutAggregator, 0);
  uint64_t v7 = self->fBoutDb.__cntrl_;
  if (v7)
  {
    sub_1000DB0A0((std::__shared_weak_count *)v7);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = (char *)self + 64;
  *((void *)self + 9) = (char *)self + 64;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  return self;
}

@end