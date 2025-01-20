@interface CLHRRecoveryService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)shouldForceWriteSampleToHealthKit;
- (CLHRRecoveryService)init;
- (id).cxx_construct;
- (unint64_t)mapWorkoutTypeToHKWorkoutActivityType:(int64_t)a3;
- (void)beginService;
- (void)endService;
- (void)forceWriteSampleToHealthKit:(const WorkoutEvent *)a3;
- (void)logBodyMetrics:(const CLBodyMetrics *)a3;
- (void)logSessionStats:(const HRRecoveryResult *)a3;
- (void)logVO2MaxStats:(const VO2MaxResult *)a3;
- (void)onCatherineNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onHRRecoveryEstimate:(HRRecoveryResult *)a3;
- (void)onHRRecoveryRegisterHRNotification;
- (void)onHRRecoverySessionEnd;
- (void)onHRRecoverySessionStart;
- (void)onHRRecoveryUnregisterHRNotification;
- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onNatalimetryNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)sendAnalytics;
- (void)setUpAggregationOnTimer;
- (void)storeHRRecoveryToHealthKit:(const HRRecoveryResult *)a3;
@end

@implementation CLHRRecoveryService

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
  if (qword_10247AB20 != -1) {
    dispatch_once(&qword_10247AB20, &stru_1022B3F98);
  }
  return (id)qword_10247AB18;
}

- (CLHRRecoveryService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLHRRecoveryService;
  return [(CLHRRecoveryService *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLHRRecoveryServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLHRRecoveryServiceClientProtocol];
}

+ (BOOL)isSupported
{
  if (qword_10247AB30 != -1) {
    dispatch_once(&qword_10247AB30, &stru_1022B3FB8);
  }
  return byte_10247AB28;
}

- (void)beginService
{
  if (qword_1024192C0 != -1) {
    dispatch_once(&qword_1024192C0, &stru_1022B3FF8);
  }
  objc_super v3 = qword_1024192C8;
  if (os_log_type_enabled((os_log_t)qword_1024192C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting up CLHRRecoveryService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024192C0 != -1) {
      dispatch_once(&qword_1024192C0, &stru_1022B3FF8);
    }
    __int16 v8 = 0;
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHRRecoveryService beginService]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  unsigned __int8 v7 = 0;
  sub_100491C40(&v7, buf);
  shared_ptr<CLHRRecoveryInputHRRecorderDb> v4 = *(shared_ptr<CLHRRecoveryInputHRRecorderDb> *)buf;
  memset(buf, 0, sizeof(buf));
  cntrl = self->fInputHRDb.__cntrl_;
  self->fInputHRDb = v4;
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
  if (qword_1024192C0 != -1) {
    dispatch_once(&qword_1024192C0, &stru_1022B3FF8);
  }
  objc_super v3 = qword_1024192C8;
  if (os_log_type_enabled((os_log_t)qword_1024192C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Shutting down CLHRRecoveryService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024192C0 != -1) {
      dispatch_once(&qword_1024192C0, &stru_1022B3FF8);
    }
    unint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHRRecoveryService endService]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  fAggregationTimer = self->fAggregationTimer;
  if (fAggregationTimer)
  {
    dispatch_source_cancel(fAggregationTimer);
    dispatch_release((dispatch_object_t)self->fAggregationTimer);
    self->fAggregationTimer = 0;
  }

  self->fHkHealthStore = 0;
}

- (void)setUpAggregationOnTimer
{
  sub_10048D634((void **)self->fInputHRAggregator.__ptr_.__value_, 259200.0);
  sub_10048D8EC((void **)self->fInputWRAggregator.__ptr_.__value_, 259200.0);
  sub_10048DBA4((void **)self->fSessionAggregator.__ptr_.__value_, 15552000.0);
  int v10 = 86400;
  uint64_t v3 = sub_1000D3E78();
  sub_10006B564(v3, &v8);
  sub_10006EF84(v8, "HRRecoveryAggregationTimeInterval", &v10);
  if (v9) {
    sub_1000DB0A0(v9);
  }
  uint64_t v4 = 1000000000 * v10;
  unint64_t v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)[objc_msgSend(-[CLHRRecoveryService universe](self, "universe"), "silo") queue]);
  self->fAggregationTimer = v5;
  dispatch_source_set_timer((dispatch_source_t)v5, 0, v4, 0xDF8475800uLL);
  fAggregationTimer = self->fAggregationTimer;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10048DE5C;
  v7[3] = &unk_10229FED8;
  v7[4] = self;
  dispatch_source_set_event_handler(fAggregationTimer, v7);
  dispatch_resume((dispatch_object_t)self->fAggregationTimer);
}

- (void)onCatherineNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [self universe].silo
  if (*a3 == 9)
  {
    value = self->fHRRecoveryEstimator.__ptr_.__value_;
    sub_1009285D4((uint64_t)value, (uint64_t)a4);
  }
  else if (*a3 == 7)
  {
    unsigned __int8 v7 = self->fHRRecoveryEstimator.__ptr_.__value_;
    float v8 = *((double *)a4 + 3);
    sub_10092840C((uint64_t)v7, v8);
  }
  else
  {
    if (qword_1024192C0 != -1) {
      dispatch_once(&qword_1024192C0, &stru_1022B3FF8);
    }
    int v10 = qword_1024192C8;
    if (os_log_type_enabled((os_log_t)qword_1024192C8, OS_LOG_TYPE_ERROR))
    {
      int v11 = *a3;
      *(_DWORD *)buf = 67109120;
      int v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "CLHRRecoveryService: Unhandled notification type, %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192C0 != -1) {
        dispatch_once(&qword_1024192C0, &stru_1022B3FF8);
      }
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLHRRecoveryService onCatherineNotification:data:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
  }
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [self universe:a3, a4, a5, a6, a7].silo;
  if (*a3 == 2)
  {
    sub_100929630((uint64_t)self->fHRRecoveryEstimator.__ptr_.__value_, (uint64_t)a4);
    if (*((void *)a4 + 2) == 1
      && sub_100929AEC((uint64_t)self->fHRRecoveryEstimator.__ptr_.__value_, *((void *)a4 + 14))
      && sub_100929CD4((uint64_t)self->fHRRecoveryEstimator.__ptr_.__value_, *((void *)a4 + 28))
      && [(CLHRRecoveryService *)self shouldForceWriteSampleToHealthKit])
    {
      [(CLHRRecoveryService *)self forceWriteSampleToHealthKit:a4];
    }
  }
  else
  {
    if (qword_1024192C0 != -1) {
      dispatch_once(&qword_1024192C0, &stru_1022B3FF8);
    }
    int v10 = qword_1024192C8;
    if (os_log_type_enabled((os_log_t)qword_1024192C8, OS_LOG_TYPE_ERROR))
    {
      int v11 = *a3;
      *(_DWORD *)buf = 67109120;
      int v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "CLHRRecoveryService: Unhandled notification type, %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192C0 != -1) {
        dispatch_once(&qword_1024192C0, &stru_1022B3FF8);
      }
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLHRRecoveryService onMotionStateMediatorNotification:data:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
  }
}

- (void)onNatalimetryNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [(-[CLHRRecoveryService universe](self, "universe")) silo];
  int v7 = *a3;
  if (*a3 == 9)
  {
    value = self->fHRRecoveryEstimator.__ptr_.__value_;
    double v9 = *((double *)a4 + 2);
    int v10 = *((_DWORD *)a4 + 26);
    double v11 = *((double *)a4 + 12);
    double v12 = *((double *)a4 + 4);
    int v13 = *((_DWORD *)a4 + 22);
    double v14 = *((float *)a4 + 39);
    sub_1009293B4((uint64_t)value, v10, v13, v9, v14, v11, v12);
  }
  else if (v7 == 6)
  {
    [(CLHRRecoveryService *)self logVO2MaxStats:a4];
  }
  else if (v7 == 2)
  {
    sub_100928170((uint64_t)self->fHRRecoveryEstimator.__ptr_.__value_, (long long *)a4);
    [(CLHRRecoveryService *)self logBodyMetrics:a4];
  }
  else
  {
    if (qword_1024192C0 != -1) {
      dispatch_once(&qword_1024192C0, &stru_1022B3FF8);
    }
    v15 = qword_1024192C8;
    if (os_log_type_enabled((os_log_t)qword_1024192C8, OS_LOG_TYPE_ERROR))
    {
      int v16 = *a3;
      *(_DWORD *)buf = 67109120;
      int v19 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "CLHRRecoveryService: Unhandled notification type, %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192C0 != -1) {
        dispatch_once(&qword_1024192C0, &stru_1022B3FF8);
      }
      v17 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLHRRecoveryService onNatalimetryNotification:data:]", "%s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
  }
}

- (void)onHRRecoverySessionStart
{
  [*((id *)self->fCatherineClient.__ptr_.__value_ + 2) register:*((void *)self->fCatherineClient.__ptr_.__value_ + 1) forNotification:9 registrationInfo:0];
  value = self->fNatalimetryClient.__ptr_.__value_;
  uint64_t v5 = *((void *)value + 1);
  uint64_t v4 = (void *)*((void *)value + 2);

  [v4 register:v5 forNotification:9 registrationInfo:0];
}

- (void)onHRRecoverySessionEnd
{
  self->fSessionStats.biologicalSex = 0;
  __asm { FMOV            V0.2S, #-1.0 }
  *(void *)&self->fSessionStats.age = _D0;
  self->fSessionStats.betaBlockerUse = 0;
  self->fSessionStats.status = 0;
  *(int64x2_t *)&self->fSessionStats.diffTimeRecoveryOnsetWorkout = vdupq_n_s64(0xC7EFFFFFE0000000);
  *(void *)&self->fSessionStats.hrRecovery = -1;
  __asm { FMOV            V2.4S, #-1.0 }
  *(_OWORD *)&self->fSessionStats.peakHR = xmmword_101D1FC70;
  *(_OWORD *)&self->fSessionStats.recoveryLoad = _Q2;
  *(void *)&self->fSessionStats.recoveryMetsStdDev = _D0;
  self->fSessionStats.isOtherwiseEligibleForLongitudinal = 0;
  *(_OWORD *)&self->fSessionStats.hrRecoveryReference = _Q2;
  self->fSessionStats.isEligibleForHK = 0;
  *(_OWORD *)&self->fSessionStats.minHRAfterWorkoutEnd = _Q2;
  *(void *)&self->fSessionStats.hrmax = _D0;
  *(void *)&self->fSessionStats.estimationStatus = -13;
  *(void *)&self->fSessionStats.lambda = _D0;
  *(void *)&self->fSessionStats.explainedVarianceScore = 3212836864;
  self->fSessionStats.workoutType = 0;
  *(void *)&self->fSessionStats.sessionDuration = 0x1BF800000;
}

- (void)onHRRecoveryEstimate:(HRRecoveryResult *)a3
{
  -[CLHRRecoveryService logSessionStats:](self, "logSessionStats:");
  if ((a3->var0 == 1 || a3->var34) && a3->var27)
  {
    [(CLHRRecoveryService *)self storeHRRecoveryToHealthKit:a3];
  }
}

- (void)onHRRecoveryUnregisterHRNotification
{
}

- (void)onHRRecoveryRegisterHRNotification
{
}

- (void)storeHRRecoveryToHealthKit:(const HRRecoveryResult *)a3
{
  if (objc_opt_class())
  {
    id v5 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRateRecoveryOneMinute];
    v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3->var1];
    int v7 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit unitFromString:@"count/min"], a3->var2);
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    [v8 setObject:&off_102392540 forKeyedSubscript:HKMetadataKeyAlgorithmVersion];
    [v8 setObject:&off_102392558 forKeyedSubscript:HKMetadataKeyHeartRateRecoveryTestType];
    [v8 setObject:[NSNumber numberWithUnsignedInteger:][CLHRRecoveryService mapWorkoutTypeToHKWorkoutActivityType:](self, "mapWorkoutTypeToHKWorkoutActivityType:", a3->var4) forKeyedSubscript:HKMetadataKeyHeartRateRecoveryActivityType];
    [v8 setObject:[+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit secondUnit](HKUnit, "secondUnit"), a3->var3) quantityWithUnit:+[HKUnit secondUnit](HKUnit, "secondUnit") doubleValue:a3->var3] forKeyedSubscript:HKMetadataKeyHeartRateRecoveryActivityDuration];
    if (a3->var17 > 0.0) {
      [v8 setObject:[+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit unitFromString:](HKUnit, "unitFromString:", @"count/min"), a3->var17) forKeyedSubscript:HKMetadataKeyHeartRateRecoveryMaxObservedRecoveryHeartRate];
    }
    if (a3->var21) {
      double v9 = &off_102392570;
    }
    else {
      double v9 = &off_102392558;
    }
    [v8 setObject:v9 forKeyedSubscript:HKMetadataKeyUserMotionContext];
    if (a3->var5) {
      int v10 = &__kCFBooleanTrue;
    }
    else {
      int v10 = &__kCFBooleanFalse;
    }
    [v8 setObject:v10 forKeyedSubscript:_HKPrivateMetadataKeyUserOnBetaBlocker];
    if (a3->var0 == 1 && a3->var22 > 0.0) {
      [v8 setObject:[+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit unitFromString:](HKUnit, "unitFromString:", @"count/min"), a3->var22) forKeyedSubscript:HKMetadataKeySessionEstimate];
    }
    double v11 = +[HKQuantitySample quantitySampleWithType:v5 quantity:v7 startDate:v6 endDate:v6 metadata:v8];
    fHkHealthStore = self->fHkHealthStore;
    int v13 = v11;
    [(HKHealthStore *)fHkHealthStore saveObjects:+[NSArray arrayWithObjects:&v13 count:1] withCompletion:&stru_1022B3FD8];
  }
}

- (unint64_t)mapWorkoutTypeToHKWorkoutActivityType:(int64_t)a3
{
  unint64_t result = a3;
  if (a3 <= 14)
  {
    if (a3 != 1)
    {
      if (a3 == 2) {
        return 37;
      }
      return 3000;
    }
  }
  else if (a3 != 15)
  {
    if (a3 == 24) {
      return result;
    }
    if (a3 == 17) {
      return 37;
    }
    return 3000;
  }
  return 52;
}

- (BOOL)shouldForceWriteSampleToHealthKit
{
  BOOL v6 = 0;
  uint64_t v2 = sub_1000D3E78();
  sub_10006B564(v2, &v4);
  sub_1000D2988(v4, "ForceWriteHRRToHealthKit", &v6);
  if (v5) {
    sub_1000DB0A0(v5);
  }
  sub_100103240();
  BOOL result = sub_10073E30C();
  if (!v6) {
    return 0;
  }
  return result;
}

- (void)forceWriteSampleToHealthKit:(const WorkoutEvent *)a3
{
  uint64_t v47 = 0x4039000000000000;
  uint64_t v5 = sub_1000D3E78();
  sub_10006B564(v5, buf);
  sub_1000A699C(*(uint64_t *)buf, "FakeHRRValue", &v47);
  if (*(void *)&buf[8]) {
    sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
  }
  uint64_t v46 = 0x4057C00000000000;
  uint64_t v6 = sub_1000D3E78();
  sub_10006B564(v6, buf);
  sub_1000A699C(*(uint64_t *)buf, "FakeHRRMaxObservedRecoveryHR", &v46);
  if (*(void *)&buf[8]) {
    sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
  }
  value = self->fHRRecoveryEstimator.__ptr_.__value_;
  int v21 = 0;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFAbsoluteTime v22 = Current;
  uint64_t v10 = v46;
  uint64_t v9 = v47;
  double v11 = a3->var1 - a3->var0;
  uint64_t v23 = v47;
  double v24 = v11;
  int64_t var3 = a3->var5.var3;
  int64_t v25 = var3;
  int v13 = *((unsigned __int8 *)value + 144);
  char v26 = v13;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v29 = 0;
  __asm { FMOV            V1.2D, #-1.0 }
  long long v30 = _Q1;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v33 = v46;
  uint64_t v45 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v34 = 0;
  char v37 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  __int16 v40 = 0;
  char v44 = 0;
  long long v43 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  if (qword_1024192C0 != -1) {
    dispatch_once(&qword_1024192C0, &stru_1022B3FF8);
  }
  int v19 = qword_1024192C8;
  if (os_log_type_enabled((os_log_t)qword_1024192C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134284801;
    *(CFAbsoluteTime *)&uint8_t buf[4] = Current;
    *(_WORD *)&buf[12] = 2049;
    *(void *)&buf[14] = v9;
    __int16 v61 = 2050;
    int64_t v62 = var3;
    __int16 v63 = 2050;
    double v64 = v11;
    __int16 v65 = 2049;
    uint64_t v66 = v10;
    __int16 v67 = 1025;
    int v68 = v13;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Forcing a fake HR Recovery sample to HealthKit: timeOfEstimate, %{private}f, hrRecovery, %{private}f, workoutType, %{public}ld, activityDuration, %{public}f, maxRecoveryHR, %{private}f, betaBlockerUse, %{private}d", buf, 0x3Au);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024192C0 != -1) {
      dispatch_once(&qword_1024192C0, &stru_1022B3FF8);
    }
    int v48 = 134284801;
    CFAbsoluteTime v49 = Current;
    __int16 v50 = 2049;
    uint64_t v51 = v9;
    __int16 v52 = 2050;
    int64_t v53 = var3;
    __int16 v54 = 2050;
    double v55 = v11;
    __int16 v56 = 2049;
    uint64_t v57 = v10;
    __int16 v58 = 1025;
    int v59 = v13;
    v20 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHRRecoveryService forceWriteSampleToHealthKit:]", "%s\n", v20);
    if (v20 != buf) {
      free(v20);
    }
  }
  [(CLHRRecoveryService *)self storeHRRecoveryToHealthKit:&v21];
}

- (void)logBodyMetrics:(const CLBodyMetrics *)a3
{
  [self universe].silo
  self->fSessionStats.age = a3->age;
  self->fSessionStats.biologicalSex = a3->biologicalSex;
  self->fSessionStats.betaBlockerUse = a3->betaBlockerUse;
  float weightKG = a3->weightKG;
  if (weightKG != 0.0)
  {
    float heightM = a3->heightM;
    if (heightM != 0.0) {
      self->fSessionStats.userBMI = weightKG / (float)(heightM * heightM);
    }
  }
  self->fSessionStats.hrmax = a3->hrmax;
}

- (void)logVO2MaxStats:(const VO2MaxResult *)a3
{
  [self universe].silo
  int v5 = llround(a3->var2);
  int var12 = a3->var12;
  self->fSessionStats.estimationStatus = a3->var11;
  self->fSessionStats.vo2MaxValue = v5;
  self->fSessionStats.sessionType = var12;
}

- (void)logSessionStats:(const HRRecoveryResult *)a3
{
  [(-[CLHRRecoveryService universe](self, "universe")) silo];
  self->fSessionStats.int status = a3->var0;
  float var3 = a3->var3;
  self->fSessionStats.double sessionDuration = var3;
  self->fSessionStats.int64_t workoutType = a3->var4;
  double var6 = a3->var6;
  self->fSessionStats.double diffTimeRecoveryOnsetWorkout = a3->var7 - var6;
  self->fSessionStats.double diffTimeTDropWorkoutEnd = a3->var13 - var6;
  self->fSessionStats.int hrRecovery = llround(a3->var2);
  self->fSessionStats.int hrRecoverySession = llround(a3->var22);
  *(float32x2_t *)&self->fSessionStats.double peakHR = vcvt_f32_f64(*(float64x2_t *)&a3->var8);
  float var14 = a3->var14;
  self->fSessionStats.double hrMinAdjusted = var14;
  double var29 = a3->var29;
  double var15 = a3->var15;
  float v10 = var29 - var15;
  self->fSessionStats.double observedHRRecovery = v10;
  *(float32x4_t *)&self->fSessionStats.double recoveryLoad = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->var16), *(float64x2_t *)&a3->var18);
  float var20 = a3->var20;
  self->fSessionStats.double recoveryMetsStdDev = var20;
  float var24 = a3->var24;
  self->fSessionStats.double biasAdjustment = var24;
  self->fSessionStats.BOOL isOtherwiseEligibleForLongitudinal = a3->var34;
  *(float *)&double var15 = var15;
  *(float *)&double var29 = var29;
  self->fSessionStats.double hrRecoveryReference = *(float *)&var15;
  self->fSessionStats.double hrRecoveryReferencePeak = *(float *)&var29;
  *(float *)&double var29 = a3->var28;
  self->fSessionStats.double hrOneMinPostRecovery = *(float *)&var29;
  *(float *)&double var29 = a3->var30;
  self->fSessionStats.double hrOneMinExponential = *(float *)&var29;
  self->fSessionStats.BOOL isEligibleForHK = a3->var27;
  v13.f64[0] = a3->var33;
  v13.f64[1] = a3->var35;
  *(float32x4_t *)&self->fSessionStats.double minHRAfterWorkoutEnd = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->var31), v13);
  *(float *)&double var29 = a3->var23;
  self->fSessionStats.double peakHrOneMinusFhr = *(float *)&var29;
  *(float32x2_t *)&self->fSessionStats.double lambda = vcvt_f32_f64(*(float64x2_t *)&a3->var10);
  *(float *)&double var29 = a3->var12;
  self->fSessionStats.double explainedVarianceScore = *(float *)&var29;
  if (qword_1024192C0 != -1) {
    dispatch_once(&qword_1024192C0, &stru_1022B3FF8);
  }
  double v14 = qword_1024192C8;
  if (os_log_type_enabled((os_log_t)qword_1024192C8, OS_LOG_TYPE_DEBUG))
  {
    double age = self->fSessionStats.age;
    int biologicalSex = self->fSessionStats.biologicalSex;
    BOOL betaBlockerUse = self->fSessionStats.betaBlockerUse;
    double userBMI = self->fSessionStats.userBMI;
    double sevenDayRestingHR = self->fSessionStats.sevenDayRestingHR;
    double hrmax = self->fSessionStats.hrmax;
    int status = self->fSessionStats.status;
    double diffTimeRecoveryOnsetWorkout = self->fSessionStats.diffTimeRecoveryOnsetWorkout;
    double diffTimeTDropWorkoutEnd = self->fSessionStats.diffTimeTDropWorkoutEnd;
    int hrRecovery = self->fSessionStats.hrRecovery;
    int hrRecoverySession = self->fSessionStats.hrRecoverySession;
    double peakHR = self->fSessionStats.peakHR;
    double steadyStateHR = self->fSessionStats.steadyStateHR;
    double hrMinAdjusted = self->fSessionStats.hrMinAdjusted;
    double observedHRRecovery = self->fSessionStats.observedHRRecovery;
    double recoveryLoad = self->fSessionStats.recoveryLoad;
    double maxRecoveryHR = self->fSessionStats.maxRecoveryHR;
    double minRecoveryHR = self->fSessionStats.minRecoveryHR;
    double recoveryMetsMean = self->fSessionStats.recoveryMetsMean;
    double recoveryMetsStdDev = self->fSessionStats.recoveryMetsStdDev;
    double biasAdjustment = self->fSessionStats.biasAdjustment;
    BOOL isOtherwiseEligibleForLongitudinal = self->fSessionStats.isOtherwiseEligibleForLongitudinal;
    double hrRecoveryReference = self->fSessionStats.hrRecoveryReference;
    double hrRecoveryReferencePeak = self->fSessionStats.hrRecoveryReferencePeak;
    double hrOneMinPostRecovery = self->fSessionStats.hrOneMinPostRecovery;
    double hrOneMinExponential = self->fSessionStats.hrOneMinExponential;
    BOOL isEligibleForHK = self->fSessionStats.isEligibleForHK;
    double minHRAfterWorkoutEnd = self->fSessionStats.minHRAfterWorkoutEnd;
    double maxHRAfterWorkoutEnd = self->fSessionStats.maxHRAfterWorkoutEnd;
    double oneMinusFHRAfterWorkoutEnd = self->fSessionStats.oneMinusFHRAfterWorkoutEnd;
    double peakHrOneMinusFhr = self->fSessionStats.peakHrOneMinusFhr;
    int estimationStatus = self->fSessionStats.estimationStatus;
    int vo2MaxValue = self->fSessionStats.vo2MaxValue;
    double lambda = self->fSessionStats.lambda;
    double meanSquaredError = self->fSessionStats.meanSquaredError;
    double explainedVarianceScore = self->fSessionStats.explainedVarianceScore;
    int sessionType = self->fSessionStats.sessionType;
    int64_t workoutType = self->fSessionStats.workoutType;
    double sessionDuration = self->fSessionStats.sessionDuration;
    unsigned int hrRecoveryAlgorithmVersion = self->fSessionStats.hrRecoveryAlgorithmVersion;
    *(_DWORD *)buf = 134227968;
    double v57 = age;
    __int16 v58 = 1024;
    int v59 = biologicalSex;
    __int16 v60 = 1024;
    BOOL v61 = betaBlockerUse;
    __int16 v62 = 2048;
    double v63 = userBMI;
    __int16 v64 = 2048;
    double v65 = sevenDayRestingHR;
    __int16 v66 = 2048;
    double v67 = hrmax;
    __int16 v68 = 1024;
    int v69 = status;
    __int16 v70 = 2048;
    double v71 = diffTimeRecoveryOnsetWorkout;
    __int16 v72 = 2048;
    double v73 = diffTimeTDropWorkoutEnd;
    __int16 v74 = 1024;
    int v75 = hrRecovery;
    __int16 v76 = 1024;
    int v77 = hrRecoverySession;
    __int16 v78 = 2048;
    double v79 = peakHR;
    __int16 v80 = 2048;
    double v81 = steadyStateHR;
    __int16 v82 = 2048;
    double v83 = hrMinAdjusted;
    __int16 v84 = 2048;
    double v85 = observedHRRecovery;
    __int16 v86 = 2048;
    double v87 = recoveryLoad;
    __int16 v88 = 2048;
    double v89 = maxRecoveryHR;
    __int16 v90 = 2048;
    double v91 = minRecoveryHR;
    __int16 v92 = 2048;
    double v93 = recoveryMetsMean;
    __int16 v94 = 2048;
    double v95 = recoveryMetsStdDev;
    __int16 v96 = 2048;
    double v97 = biasAdjustment;
    __int16 v98 = 1024;
    BOOL v99 = isOtherwiseEligibleForLongitudinal;
    __int16 v100 = 2048;
    double v101 = hrRecoveryReference;
    __int16 v102 = 2048;
    double v103 = hrRecoveryReferencePeak;
    __int16 v104 = 2048;
    double v105 = hrOneMinPostRecovery;
    __int16 v106 = 2048;
    double v107 = hrOneMinExponential;
    __int16 v108 = 1024;
    BOOL v109 = isEligibleForHK;
    __int16 v110 = 2048;
    double v111 = minHRAfterWorkoutEnd;
    __int16 v112 = 2048;
    double v113 = maxHRAfterWorkoutEnd;
    __int16 v114 = 2048;
    double v115 = oneMinusFHRAfterWorkoutEnd;
    __int16 v116 = 2048;
    double v117 = peakHrOneMinusFhr;
    __int16 v118 = 1024;
    int v119 = estimationStatus;
    __int16 v120 = 1024;
    int v121 = vo2MaxValue;
    __int16 v122 = 2048;
    double v123 = lambda;
    __int16 v124 = 2048;
    double v125 = meanSquaredError;
    __int16 v126 = 2048;
    double v127 = explainedVarianceScore;
    __int16 v128 = 1024;
    int v129 = sessionType;
    __int16 v130 = 1024;
    int v131 = workoutType;
    __int16 v132 = 2048;
    double v133 = sessionDuration;
    __int16 v134 = 1024;
    unsigned int v135 = hrRecoveryAlgorithmVersion;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "HRRecovery Analytics,age,%.2f,biologicalSex,%d,useBetaBlocker,%d,userBMI,%.2f,sevenDayRestingHR,%.2f,hrmax,%.2f,status,%d,diffTimeRecoveryOnsetWorkout,%.2f,diffTimeTDropWorkoutEnd,%.2f,hrRecovery,%d,hrRecoverySession,%d,peakHR,%.2f,steadyStateHR,%.2f,hrMinAdjusted,%.2f,observedHRRecovery,%.2f,recoveryLoad,%.2f,maxRecoveryHR,%.2f,minRecoveryHR,%.2f,recoveryMetsMean,%.2f,recoveryMetsStdDev,%.2f,biasAdjustment,%.2f,isOtherwiseEligibleForLongitudinal,%d,hrRecoveryReference,%.2f,hrRecoveryReferencePeak,%.2f,hrOneMinPostRecovery,%.2f,hrOneMinExponential,%.2f,isEligibleForHK,%d,minHRAfterWorkoutEnd,%.2f,maxHRAfterWorkoutEnd,%.2f,oneMinusFHRAfterWorkoutEnd,%.2f,peakHrOneMinusFhr,%.2f,vo2MaxestimationStatus,%d,vo2MaxValue,%d,lambda,%.2f,mse,%.2f,evs,%.2f,sessionType,%d,workoutType,%d,sessionDuration,%.2f,hrRecoveryAlgorithmVersion,%d", buf, 0x162u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024192C0 != -1) {
      dispatch_once(&qword_1024192C0, &stru_1022B3FF8);
    }
    double v55 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHRRecoveryService logSessionStats:]", "%s\n", v55);
    if (v55 != (char *)buf) {
      free(v55);
    }
  }
  [(CLHRRecoveryService *)self sendAnalytics];
}

- (void)sendAnalytics
{
  [self universe].silo
  if (objc_opt_class()
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_10247AB50, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_10247AB50))
    {
      LODWORD(v6) = 1153138688;
      *(_OWORD *)buf = xmmword_101D1FC80;
      sub_1003B17B4(&qword_10247AB38, buf, 5uLL);
      __cxa_atexit((void (*)(void *))sub_1003B1838, &qword_10247AB38, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_10247AB50);
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_10247AB70, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_10247AB70))
    {
      int v7 = 1118961664;
      *(_OWORD *)buf = xmmword_101D1FC94;
      long long v6 = unk_101D1FCA4;
      sub_1003B17B4(&qword_10247AB58, buf, 9uLL);
      __cxa_atexit((void (*)(void *))sub_1003B1838, &qword_10247AB58, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_10247AB70);
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_10247AB90, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_10247AB90))
    {
      LODWORD(v6) = 1108056474;
      *(_OWORD *)buf = xmmword_101D1FCB8;
      sub_1003B17B4(&qword_10247AB78, buf, 5uLL);
      __cxa_atexit((void (*)(void *))sub_1003B1838, &qword_10247AB78, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_10247AB90);
    }
    AnalyticsSendEventLazy();
    if (qword_1024192C0 != -1) {
      dispatch_once(&qword_1024192C0, &stru_1022B3FF8);
    }
    uint64_t v2 = qword_1024192C8;
    if (os_log_type_enabled((os_log_t)qword_1024192C8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Sent Core Analytics event", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192C0 == -1)
      {
LABEL_20:
        uint64_t v4 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHRRecoveryService sendAnalytics]", "%s\n", v4);
        if (v4 != (char *)buf) {
          free(v4);
        }
        return;
      }
LABEL_28:
      dispatch_once(&qword_1024192C0, &stru_1022B3FF8);
      goto LABEL_20;
    }
  }
  else
  {
    if (qword_1024192C0 != -1) {
      dispatch_once(&qword_1024192C0, &stru_1022B3FF8);
    }
    uint64_t v3 = qword_1024192C8;
    if (os_log_type_enabled((os_log_t)qword_1024192C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "HRRecovery, not sending analytics, no IHA permission", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192C0 == -1) {
        goto LABEL_20;
      }
      goto LABEL_28;
    }
  }
}

- (void).cxx_destruct
{
  value = self->fNatalimetryClient.__ptr_.__value_;
  self->fNatalimetryClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  uint64_t v4 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  if (v4) {
    (*(void (**)(Client *, SEL))(*(void *)v4 + 8))(v4, a2);
  }
  int v5 = self->fCatherineClient.__ptr_.__value_;
  self->fCatherineClient.__ptr_.__value_ = 0;
  if (v5) {
    (*(void (**)(Client *, SEL))(*(void *)v5 + 8))(v5, a2);
  }
  long long v6 = self->fHRRecoveryEstimator.__ptr_.__value_;
  self->fHRRecoveryEstimator.__ptr_.__value_ = 0;
  if (v6) {
    sub_1004920E4((uint64_t)&self->fHRRecoveryEstimator, v6);
  }
  sub_1003B273C((uint64_t *)&self->fSessionAggregator, 0);
  cntrl = self->fSessionDb.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  sub_1003B273C((uint64_t *)&self->fInputWRAggregator, 0);
  id v8 = self->fInputWRDb.__cntrl_;
  if (v8) {
    sub_1000DB0A0((std::__shared_weak_count *)v8);
  }
  sub_1003B273C((uint64_t *)&self->fInputHRAggregator, 0);
  uint64_t v9 = self->fInputHRDb.__cntrl_;
  if (v9)
  {
    sub_1000DB0A0((std::__shared_weak_count *)v9);
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
  *((void *)self + 11) = 0;
  *((_DWORD *)self + 24) = 0;
  __asm { FMOV            V0.2S, #-1.0 }
  *(void *)((char *)self + 100) = _D0;
  *((unsigned char *)self + 108) = 0;
  *((_DWORD *)self + 28) = 0;
  *(int64x2_t *)((char *)self + 120) = vdupq_n_s64(0xC7EFFFFFE0000000);
  *((void *)self + 17) = -1;
  __asm { FMOV            V2.4S, #-1.0 }
  *((_OWORD *)self + 9) = xmmword_101D1FC70;
  *((_OWORD *)self + 10) = _Q2;
  *((void *)self + 22) = _D0;
  *((unsigned char *)self + 184) = 0;
  *(_OWORD *)((char *)self + 188) = _Q2;
  *((unsigned char *)self + 204) = 0;
  *((_OWORD *)self + 13) = _Q2;
  *((void *)self + 28) = _D0;
  *((void *)self + 29) = -13;
  *((void *)self + 30) = _D0;
  *((void *)self + 33) = 0x1BF800000;
  *((void *)self + 31) = 3212836864;
  *((void *)self + 34) = 0;
  *((void *)self + 35) = 0;
  *((void *)self + 32) = 0;
  *((void *)self + 36) = 0;
  return self;
}

@end