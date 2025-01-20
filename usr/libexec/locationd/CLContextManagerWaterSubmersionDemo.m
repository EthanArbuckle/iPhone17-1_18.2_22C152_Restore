@interface CLContextManagerWaterSubmersionDemo
+ (double)boundedIncrementBetweenStart:(double)a3 andStop:(double)a4 withCurrent:(double)a5 withIncrement:(double *)a6;
+ (double)incrementTowardsTarget:(double)result andCurrent:(double)a4 withIncrement:(double)a5;
+ (double)settleToTemperatureFromStart:(double)a3 toStop:(double)a4 withCurrent:(double)a5 withDecrement:(double)a6;
- (CLContextManagerWaterSubmersionDemo)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6;
- (float)targetPressure;
- (void)dealloc;
- (void)demoDepthUpdate_bounce;
- (void)pauseEvent_bounce;
- (void)resumeEvent_bounce;
- (void)retrieveCachedSubmersionState;
- (void)startUpdates;
- (void)stopUpdates;
- (void)updateEvent_bounce:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)a3;
- (void)updateTargetDemoDepth;
@end

@implementation CLContextManagerWaterSubmersionDemo

- (CLContextManagerWaterSubmersionDemo)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
  }
  v11 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Demo context manager started", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    LOWORD(v50[0]) = 0;
    v23 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionDemo initWithUniverse:delegate:withBuffer:withSourceAggregator:]", "%s\n", v23);
    if (v23 != (char *)buf) {
      free(v23);
    }
  }
  v51.receiver = self;
  v51.super_class = (Class)CLContextManagerWaterSubmersionDemo;
  v12 = [(CLContextManagerWaterSubmersionBase *)&v51 initWithUniverse:a3 delegate:a4 withBuffer:a5 withSourceAggregator:a6];
  v13 = v12;
  if (v12)
  {
    [(CLContextManagerWaterSubmersionDemo *)v12 retrieveCachedSubmersionState];
    v13->_measurementTimer = (CLTimer *)[objc_msgSend(objc_msgSend(a3, "silo"), "newTimer")];
    [(CLContextManagerWaterSubmersionBase *)v13 setSubmersionState:100];
    for (uint64_t i = 0; i != 5; ++i)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v13, (CFNotificationCallback)sub_100AD4E08, off_1022DCA50[i], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    *(void *)buf = 0;
    v53 = buf;
    uint64_t v54 = 0x2020000000;
    uint64_t v55 = 0x405954CCCCCCCCCDLL;
    [(CLContextManagerWaterSubmersionDemo *)v13 updateTargetDemoDepth];
    LODWORD(v49[0]) = 1036831949;
    sub_101A22680((unsigned __int8 *)v50, "DemoMetersPerSecond", v49, 0);
    float v16 = *((float *)v50 + 1);
    LOBYTE(v49[0]) = 1;
    sub_10006ACBC((unsigned __int8 *)v50, "DemoCycleMinMaxDepth", (unsigned __int8 *)v49, 0);
    char v17 = BYTE1(v50[0]);
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x2020000000;
    *(double *)&v50[3] = v16 * 1020.0 * 9.80665016 / 1000.0;
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x2020000000;
    v49[3] = 0x40595407FC6B3FB5;
    uint64_t v45 = 0;
    v46 = (double *)&v45;
    uint64_t v47 = 0x2020000000;
    double v48 = 0.0;
    LODWORD(v39) = 1101004800;
    sub_101A22680((unsigned __int8 *)v43, "DemoInitialTemperature", &v39, 0);
    double v48 = *((float *)v43 + 1);
    v43[0] = 0;
    v43[1] = v43;
    uint64_t v44 = 0;
    uint64_t v18 = *((void *)v46 + 3);
    v43[2] = 0x2020000000;
    uint64_t v44 = v18;
    uint64_t v39 = 0;
    v40 = (double *)&v39;
    uint64_t v41 = 0x2020000000;
    double v42 = 0.0;
    LODWORD(v31) = 1094713344;
    sub_101A22680((unsigned __int8 *)&v35, "DemoFinalTemperature", &v31, 0);
    double v42 = *((float *)&v35 + 1);
    uint64_t v35 = 0;
    v36 = (double *)&v35;
    uint64_t v37 = 0x2020000000;
    uint64_t v38 = 0x4014000000000000;
    uint64_t v31 = 0;
    v32 = (double *)&v31;
    uint64_t v33 = 0x2020000000;
    uint64_t v34 = 0x3FF0000000000000;
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v30[3] = 0x4014000000000000;
    LODWORD(v26[0]) = 1106247680;
    sub_101A22680((unsigned __int8 *)v28, "DemoTemperatureSettlingTime", v26, 0);
    double v19 = *((float *)v28 + 1);
    v28[0] = 0;
    v28[1] = v28;
    double v29 = 0.0;
    double v20 = (v46[3] - v40[3]) / v19;
    v28[2] = 0x2020000000;
    double v29 = v20;
    v26[0] = 0;
    v26[1] = v26;
    double v27 = 0.0;
    double v21 = v36[3] - v32[3];
    v26[2] = 0x2020000000;
    double v27 = v21 / v19;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100AD4FB4;
    v24[3] = &unk_1022DCA80;
    char v25 = v17;
    v24[4] = v13;
    v24[5] = buf;
    v24[6] = v50;
    v24[7] = v43;
    v24[8] = &v45;
    v24[9] = &v39;
    v24[10] = v28;
    v24[11] = v30;
    v24[12] = &v35;
    v24[13] = &v31;
    v24[14] = v26;
    v24[15] = v49;
    [(CLTimer *)v13->_measurementTimer setHandler:v24];
    [(CLContextManagerWaterSubmersionDemo *)v13 startUpdates];
    _Block_object_dispose(v26, 8);
    _Block_object_dispose(v28, 8);
    _Block_object_dispose(v30, 8);
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(v43, 8);
    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(v49, 8);
    _Block_object_dispose(v50, 8);
    _Block_object_dispose(buf, 8);
  }
  return v13;
}

- (float)targetPressure
{
  return self->_targetDemoDepth * 9.80665016 + 101.325;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);

  v4.receiver = self;
  v4.super_class = (Class)CLContextManagerWaterSubmersionDemo;
  [(CLContextManagerWaterSubmersionBase *)&v4 dealloc];
}

- (void)updateEvent_bounce:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)a3
{
  ptr = a3.__ptr_;
  id v5 = [(CLIntersiloUniverse *)self->super.super._universe silo];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3321888768;
  v8[2] = sub_100AD5340;
  v8[3] = &unk_1022DCAA8;
  uint64_t v7 = *(void *)ptr;
  v6 = (std::__shared_weak_count *)*((void *)ptr + 1);
  v8[4] = self;
  v8[5] = v7;
  v9 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [v5 async:v8];
  if (v9) {
    sub_1000DB0A0(v9);
  }
}

- (void)pauseEvent_bounce
{
  id v3 = [(CLIntersiloUniverse *)self->super.super._universe silo];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100AD5468;
  v4[3] = &unk_10229FED8;
  v4[4] = self;
  [v3 async:v4];
}

- (void)resumeEvent_bounce
{
  id v3 = [(CLIntersiloUniverse *)self->super.super._universe silo];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100AD54FC;
  v4[3] = &unk_10229FED8;
  v4[4] = self;
  [v3 async:v4];
}

- (void)demoDepthUpdate_bounce
{
  id v3 = [(CLIntersiloUniverse *)self->super.super._universe silo];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100AD5590;
  v4[3] = &unk_10229FED8;
  v4[4] = self;
  [v3 async:v4];
}

- (void)retrieveCachedSubmersionState
{
  v5.receiver = self;
  v5.super_class = (Class)CLContextManagerWaterSubmersionDemo;
  [(CLContextManagerWaterSubmersionBase *)&v5 retrieveCachedSubmersionState];
  if (self)
  {
    [(CLContextManagerWaterSubmersionBase *)self aopSubmersionState];
  }
  else
  {
    uint64_t v3 = 0;
    objc_super v4 = 0;
  }
  [(CLContextManagerWaterSubmersionBase *)self updateSubmersionStateFromAOPState:&v3];
  if (v4) {
    sub_1000DB0A0(v4);
  }
}

+ (double)settleToTemperatureFromStart:(double)a3 toStop:(double)a4 withCurrent:(double)a5 withDecrement:(double)a6
{
  if (a3 >= a4) {
    double v6 = a4;
  }
  else {
    double v6 = a3;
  }
  if (a3 < a4) {
    a3 = a4;
  }
  double v7 = a5 - a6;
  if (a3 < v7 || v7 < v6) {
    return a4;
  }
  else {
    return v7;
  }
}

+ (double)boundedIncrementBetweenStart:(double)a3 andStop:(double)a4 withCurrent:(double)a5 withIncrement:(double *)a6
{
  if (a3 >= a4) {
    double v6 = a4;
  }
  else {
    double v6 = a3;
  }
  if (a3 >= a4) {
    double v7 = a3;
  }
  else {
    double v7 = a4;
  }
  double v8 = *a6;
  double result = *a6 + a5;
  if (result < v6 || v7 < result)
  {
    *a6 = -v8;
    return a5 - v8;
  }
  return result;
}

+ (double)incrementTowardsTarget:(double)result andCurrent:(double)a4 withIncrement:(double)a5
{
  double v5 = fabs(a5);
  if (vabdd_f64(result, a4) > v5)
  {
    if (result - a4 >= 0.0) {
      return v5 + a4;
    }
    else {
      return a4 - v5;
    }
  }
  return result;
}

- (void)startUpdates
{
}

- (void)stopUpdates
{
}

- (void)updateTargetDemoDepth
{
  [(CLSubmersionStateMachine *)[(CLContextManagerWaterSubmersionBase *)self submersionStateMachine] nearDepthLimitThreshold];
  *(float *)&double v3 = v3;
  int v4 = LODWORD(v3);
  sub_101A22680(v5, "DemoMaxDepthMeters", &v4, 0);
  self->_targetDemoDepth = v6;
}

@end