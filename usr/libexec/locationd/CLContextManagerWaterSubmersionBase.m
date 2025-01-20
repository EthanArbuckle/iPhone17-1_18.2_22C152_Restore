@interface CLContextManagerWaterSubmersionBase
- (BOOL)inSwimmingWorkout;
- (BOOL)sampleShouldBeWrittenToHK:(id)a3;
- (BOOL)updatingHK;
- (BOOL)updatingSurfacePressure;
- (CLContextManagerWaterSubmersionBase)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6;
- (CLSubmersionDataCollector)hkCollector;
- (CLSubmersionStateMachine)submersionStateMachine;
- (CLWaterSubmersionMeasurement)deepestDepthForHK;
- (double)lastDefaultLevelLogTimestamp;
- (double)lastHKUpdate;
- (double)timeBetweenHKUpdates;
- (id).cxx_construct;
- (int64_t)externalSubmersionState;
- (int64_t)submersionState;
- (shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)aopSubmersionState;
- (void)clientConnected:(id)a3 withNotification:(unint64_t)a4;
- (void)dealloc;
- (void)notificationAcknowledged:(unint64_t)a3;
- (void)notifyHKUpdates:(id)a3;
- (void)onDeepSubmersion:(double)a3 withStateChanged:(BOOL)a4;
- (void)onMotionStateMediatorData:(NotificationData *)a3;
- (void)onNotSubmerged;
- (void)onShallowSubmersion:(double)a3 withStateChanged:(BOOL)a4;
- (void)retrieveCachedSubmersionState;
- (void)saveCachedSubmersionState:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)a3;
- (void)setAopSubmersionState:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)a3;
- (void)setDeepestDepthForHK:(id)a3;
- (void)setExternalSubmersionState:(int64_t)a3;
- (void)setHkCollector:(id)a3;
- (void)setInSwimmingWorkout:(BOOL)a3;
- (void)setLastDefaultLevelLogTimestamp:(double)a3;
- (void)setLastHKUpdate:(double)a3;
- (void)setSubmersionState:(int64_t)a3;
- (void)setSubmersionStateMachine:(id)a3;
- (void)setTimeBetweenHKUpdates:(double)a3;
- (void)setUpdatingHK:(BOOL)a3;
- (void)setUpdatingSurfacePressure:(BOOL)a3;
- (void)startHKCollector:(double)a3;
- (void)startSubmersionPowerAssertion;
- (void)stopHKCollector;
- (void)updateClientsSubmersionMeasurement:(id)a3;
- (void)updateClientsSubmersionState:(id)a3;
- (void)updateSubmersionStateFromAOPState:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)a3;
- (void)updateSubmersionStateFromMeasurement:(id)a3;
@end

@implementation CLContextManagerWaterSubmersionBase

- (CLContextManagerWaterSubmersionBase)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  v16.receiver = self;
  v16.super_class = (Class)CLContextManagerWaterSubmersionBase;
  v7 = [(CLBarometerCalibrationContextManager *)&v16 initWithUniverse:a3 delegate:a4 withBuffer:a5 withSourceAggregator:a6];
  v8 = v7;
  if (v7)
  {
    v7->_submersionState = 0;
    v7->_externalSubmersionState = 0;
    v9 = operator new(0x28uLL);
    v9[1] = 0;
    v9[2] = 0;
    void *v9 = off_1022DCB08;
    v9[3] = 0x7FEFFFFFFFFFFFFFLL;
    ptr = (CLBarometerCalibrationWaterSubmersion *)(v9 + 3);
    v9[4] = 0;
    cntrl = (std::__shared_weak_count *)v8->_aopSubmersionState.__cntrl_;
    v8->_aopSubmersionState.__ptr_ = (CLBarometerCalibrationWaterSubmersion *)(v9 + 3);
    v8->_aopSubmersionState.__cntrl_ = (__shared_weak_count *)v9;
    if (cntrl)
    {
      sub_1000DB0A0(cntrl);
      ptr = v8->_aopSubmersionState.__ptr_;
    }
    *((unsigned char *)ptr + 8) = 1;
    *(void *)ptr = 0x7FEFFFFFFFFFFFFFLL;
    v8->_submersionStateMachine = [[CLSubmersionStateMachine alloc] initWithType:1];
    v8->_updatingSurfacePressure = 0;
    v8->_updatingHK = 0;
    v8->_inSwimmingWorkout = 0;
    int v13 = 1075838976;
    sub_101A22680(v14, "SubmersionHKDecimationTime", &v13, 0);
    v8->_timeBetweenHKUpdates = v15;
    v8->_deepestDepthForHK = 0;
    v8->_lastHKUpdate = 1.79769313e308;
    v8->_hkCollector = [[CLSubmersionDataCollector alloc] initWithUniverse:a3 andStateMachine:v8->_submersionStateMachine];
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  self->_deepestDepthForHK = 0;
  self->_hkCollector = 0;

  self->_submersionStateMachine = 0;
  [(CLTimer *)self->_submersionPowerAssertionTimer invalidate];

  self->_submersionPowerAssertionTimer = 0;
  value = self->_powerAssertionSubmersion.__ptr_.__value_;
  if (*((int *)value + 2) <= 0)
  {
    self->_powerAssertionSubmersion.__ptr_.__value_ = 0;
    goto LABEL_5;
  }
  sub_100EBC6AC((uint64_t)value);
  value = self->_powerAssertionSubmersion.__ptr_.__value_;
  self->_powerAssertionSubmersion.__ptr_.__value_ = 0;
  if (value) {
LABEL_5:
  }
    (*(void (**)(CLPowerAssertion *))(*(void *)value + 8))(value);
  v4 = self->_powerAssertionHK.__ptr_.__value_;
  if (*((int *)v4 + 2) <= 0)
  {
    self->_powerAssertionHK.__ptr_.__value_ = 0;
  }
  else
  {
    sub_100EBC6AC((uint64_t)v4);
    v4 = self->_powerAssertionHK.__ptr_.__value_;
    self->_powerAssertionHK.__ptr_.__value_ = 0;
    if (!v4) {
      goto LABEL_11;
    }
  }
  (*(void (**)(CLPowerAssertion *))(*(void *)v4 + 8))(v4);
LABEL_11:
  v5.receiver = self;
  v5.super_class = (Class)CLContextManagerWaterSubmersionBase;
  [(CLBarometerCalibrationContextManager *)&v5 dealloc];
}

- (void)startHKCollector:(double)a3
{
  if (*((int *)self->_powerAssertionHK.__ptr_.__value_ + 2) <= 0)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    objc_super v5 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "power assertion for writing to HK,timestamp,%{public}f,assertionState,1,reason,submergedDeep", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      int v10 = 134349056;
      CFAbsoluteTime v11 = CFAbsoluteTimeGetCurrent();
      v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase startHKCollector:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    value = self->_powerAssertionHK.__ptr_.__value_;
    sub_100134750(__p, "none");
    sub_100EBBFD8((uint64_t)value, (uint64_t *)__p);
    if (v9 < 0) {
      operator delete(__p[0]);
    }
  }
  [(CLSubmersionDataCollector *)self->_hkCollector startAt:a3];
}

- (void)stopHKCollector
{
  [(CLSubmersionDataCollector *)self->_hkCollector finish];
  if (*((int *)self->_powerAssertionHK.__ptr_.__value_ + 2) >= 1)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    v3 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "power assertion for writing to HK,timestamp,%{public}f,assertionState,0,reason,notSubmergedDeep", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      CFAbsoluteTimeGetCurrent();
      v4 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase stopHKCollector]", "%s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
    sub_100EBC6AC((uint64_t)self->_powerAssertionHK.__ptr_.__value_);
  }
}

- (void)notifyHKUpdates:(id)a3
{
  hkCollector = self->_hkCollector;
  [a3 startAt];
  double v6 = v5;
  BOOL v7 = [a3 state] == (id)600;

  [(CLSubmersionDataCollector *)hkCollector collectAt:a3 measurement:v7 atSensorLimit:v6];
}

- (void)clientConnected:(id)a3 withNotification:(unint64_t)a4
{
  if (a4 == 3)
  {
    double v6 = objc_alloc_init(CLWaterSubmersionState);
    [(CLWaterSubmersionState *)v6 setStartAt:CFAbsoluteTimeGetCurrent()];
    if ([(CLContextManagerWaterSubmersionBase *)self externalSubmersionState])
    {
      [(CLWaterSubmersionState *)v6 setState:[(CLContextManagerWaterSubmersionBase *)self externalSubmersionState]];
      [a3 onSubmersionStateUpdate:v6];
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      BOOL v7 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        [(CLWaterSubmersionState *)v6 startAt];
        *(_DWORD *)buf = 134349568;
        CFAbsoluteTime v12 = Current;
        __int16 v13 = 2050;
        uint64_t v14 = v9;
        __int16 v15 = 1026;
        unsigned int v16 = [(CLWaterSubmersionState *)v6 state];
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "water submersion state sent to new client,timestamp,%{public}f,startAt,%{public}f,state,%{public}d", buf, 0x1Cu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
        }
        CFAbsoluteTimeGetCurrent();
        [(CLWaterSubmersionState *)v6 startAt];
        [(CLWaterSubmersionState *)v6 state];
        int v10 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase clientConnected:withNotification:]", "%s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
      }
    }
  }
}

- (void)updateClientsSubmersionMeasurement:(id)a3
{
  -[CLBarometerCalibrationContextClient submersionMeasurementUpdate:](self->super._delegate, "submersionMeasurementUpdate:");
  if (self->_externalSubmersionState == 2
    && vabdd_f64(self->_lastDefaultLevelLogTimestamp, CFAbsoluteTimeGetCurrent()) > 15.0)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    double v5 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      [a3 startAt];
      uint64_t v8 = v7;
      [a3 pressure];
      uint64_t v10 = v9;
      [a3 depth];
      uint64_t v12 = v11;
      [a3 temperature];
      uint64_t v14 = v13;
      [a3 temperatureUncertainty];
      uint64_t v16 = v15;
      [a3 surfacePressure];
      *(_DWORD *)buf = 134350848;
      CFAbsoluteTime v41 = Current;
      __int16 v42 = 2050;
      uint64_t v43 = v8;
      __int16 v44 = 2050;
      uint64_t v45 = v10;
      __int16 v46 = 2050;
      uint64_t v47 = v12;
      __int16 v48 = 2050;
      uint64_t v49 = v14;
      __int16 v50 = 2050;
      uint64_t v51 = v16;
      __int16 v52 = 2050;
      uint64_t v53 = v17;
      __int16 v54 = 1026;
      unsigned int v55 = [a3 state];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "water submersion sent to clients,timestamp,%{public}f,pressureTimestamp,%{public}f,pressure,%{public}f,depth,%{public}f,temperature,%{public}f,temperatureUncertainty,%{public}f,surfacePressure,%{public}f,depthState,%{public}d", buf, 0x4Eu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      CFAbsoluteTimeGetCurrent();
      [a3 startAt];
      [a3 pressure];
      [a3 depth];
      [a3 temperature];
      [a3 temperatureUncertainty];
      [a3 surfacePressure];
      [a3 state];
      v39 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase updateClientsSubmersionMeasurement:]", "%s\n", v39);
      if (v39 != (char *)buf) {
        free(v39);
      }
    }
    self->_lastDefaultLevelLogTimestamp = CFAbsoluteTimeGetCurrent();
  }
  else
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    v18 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
    {
      CFAbsoluteTime v19 = CFAbsoluteTimeGetCurrent();
      [a3 startAt];
      uint64_t v21 = v20;
      [a3 pressure];
      uint64_t v23 = v22;
      [a3 depth];
      uint64_t v25 = v24;
      [a3 temperature];
      uint64_t v27 = v26;
      [a3 temperatureUncertainty];
      uint64_t v29 = v28;
      [a3 surfacePressure];
      *(_DWORD *)buf = 134350848;
      CFAbsoluteTime v41 = v19;
      __int16 v42 = 2050;
      uint64_t v43 = v21;
      __int16 v44 = 2050;
      uint64_t v45 = v23;
      __int16 v46 = 2050;
      uint64_t v47 = v25;
      __int16 v48 = 2050;
      uint64_t v49 = v27;
      __int16 v50 = 2050;
      uint64_t v51 = v29;
      __int16 v52 = 2050;
      uint64_t v53 = v30;
      __int16 v54 = 1026;
      unsigned int v55 = [a3 state];
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "water submersion sent to clients,timestamp,%{public}f,pressureTimestamp,%{public}f,pressure,%{public}f,depth,%{public}f,temperature,%{public}f,temperatureUncertainty,%{public}f,surfacePressure,%{public}f,depthState,%{public}d", buf, 0x4Eu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      CFAbsoluteTimeGetCurrent();
      [a3 startAt];
      [a3 pressure];
      [a3 depth];
      [a3 temperature];
      [a3 temperatureUncertainty];
      [a3 surfacePressure];
      [a3 state];
      v38 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase updateClientsSubmersionMeasurement:]", "%s\n", v38);
      if (v38 != (char *)buf) {
        free(v38);
      }
    }
  }
  if ([(CLContextManagerWaterSubmersionBase *)self sampleShouldBeWrittenToHK:a3])
  {
    if (!self->_updatingHK)
    {
      [a3 startAt];
      -[CLContextManagerWaterSubmersionBase startHKCollector:](self, "startHKCollector:");
      BOOL v31 = 1;
LABEL_19:
      self->_updatingHK = v31;
    }
  }
  else if (self->_updatingHK)
  {
    [(CLContextManagerWaterSubmersionBase *)self setDeepestDepthForHK:0];
    [(CLContextManagerWaterSubmersionBase *)self stopHKCollector];
    BOOL v31 = 0;
    goto LABEL_19;
  }
  if ([(CLContextManagerWaterSubmersionBase *)self updatingHK])
  {
    [(CLContextManagerWaterSubmersionBase *)self lastHKUpdate];
    if (v32 == 1.79769313e308
      || ([a3 startAt],
          double v34 = v33,
          [(CLContextManagerWaterSubmersionBase *)self lastHKUpdate],
          double v36 = vabdd_f64(v34, v35),
          [(CLContextManagerWaterSubmersionBase *)self timeBetweenHKUpdates],
          v36 > v37))
    {
      [(CLContextManagerWaterSubmersionBase *)self notifyHKUpdates:[(CLContextManagerWaterSubmersionBase *)self deepestDepthForHK]];
      [a3 startAt];
      -[CLContextManagerWaterSubmersionBase setLastHKUpdate:](self, "setLastHKUpdate:");
      [(CLContextManagerWaterSubmersionBase *)self setDeepestDepthForHK:0];
    }
  }
}

- (BOOL)sampleShouldBeWrittenToHK:(id)a3
{
  return self->_inSwimmingWorkout && [a3 state] == (id)200 || (uint64_t)[a3 state] > 299;
}

- (void)updateClientsSubmersionState:(id)a3
{
  -[CLBarometerCalibrationContextClient submersionStateUpdate:](self->super._delegate, "submersionStateUpdate:");
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
  }
  v4 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    [a3 startAt];
    *(_DWORD *)buf = 134349568;
    CFAbsoluteTime v9 = Current;
    __int16 v10 = 2050;
    uint64_t v11 = v6;
    __int16 v12 = 1026;
    unsigned int v13 = [a3 state];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "water submersion state sent to clients,timestamp,%{public}f,startAt,%{public}f,state,%{public}d", buf, 0x1Cu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    CFAbsoluteTimeGetCurrent();
    [a3 startAt];
    [a3 state];
    uint64_t v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase updateClientsSubmersionState:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
}

- (void)updateSubmersionStateFromAOPState:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)a3
{
  ptr = a3.__ptr_;
  double v5 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
  uint64_t v22 = *(void *)a3.__ptr_;
  uint64_t v23 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  -[CLContextManagerWaterSubmersionBase saveCachedSubmersionState:](self, "saveCachedSubmersionState:", &v22, a3.__cntrl_);
  if (v23) {
    sub_1000DB0A0(v23);
  }
  uint64_t v7 = *(CLBarometerCalibrationWaterSubmersion **)ptr;
  uint64_t v6 = *((void *)ptr + 1);
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_aopSubmersionState.__cntrl_;
  self->_aopSubmersionState.__ptr_ = v7;
  self->_aopSubmersionState.__cntrl_ = (__shared_weak_count *)v6;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  int64_t externalSubmersionState = self->_externalSubmersionState;
  __int16 v10 = objc_alloc_init(CLWaterSubmersionState);
  [(CLWaterSubmersionState *)v10 setStartAt:*(double *)*(double *)ptr];
  int v11 = *(unsigned __int8 *)(*(void *)ptr + 8);
  if (v11 == 1)
  {
    [(CLContextManagerWaterSubmersionBase *)self onNotSubmerged];
    [(CLWaterSubmersionState *)v10 setState:1];
  }
  else if (v11 == 2)
  {
    [(CLWaterSubmersionState *)v10 setState:2];
    self->_int64_t externalSubmersionState = 2;
    self->_updatingSurfacePressure = 0;
  }
  else
  {
    [(CLWaterSubmersionState *)v10 setState:0];
  }
  if (externalSubmersionState != self->_externalSubmersionState)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    __int16 v12 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      [(CLWaterSubmersionState *)v10 startAt];
      uint64_t v15 = v14;
      unsigned int v16 = [(CLWaterSubmersionState *)v10 state];
      *(_DWORD *)buf = 134349824;
      CFAbsoluteTime v33 = Current;
      __int16 v34 = 2050;
      uint64_t v35 = v15;
      __int16 v36 = 1026;
      unsigned int v37 = v16;
      __int16 v38 = 1026;
      int v39 = externalSubmersionState;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "update submersion state,timestamp,%{public}f,submersionState.startAt,%{public}f,submersionState.state,%{public}d,previousState,%{public}d", buf, 0x22u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      CFAbsoluteTime v17 = CFAbsoluteTimeGetCurrent();
      [(CLWaterSubmersionState *)v10 startAt];
      uint64_t v19 = v18;
      unsigned int v20 = [(CLWaterSubmersionState *)v10 state];
      int v24 = 134349824;
      CFAbsoluteTime v25 = v17;
      __int16 v26 = 2050;
      uint64_t v27 = v19;
      __int16 v28 = 1026;
      unsigned int v29 = v20;
      __int16 v30 = 1026;
      int v31 = externalSubmersionState;
      uint64_t v21 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase updateSubmersionStateFromAOPState:]", "%s\n", v21);
      if (v21 != (char *)buf) {
        free(v21);
      }
    }
    [(CLContextManagerWaterSubmersionBase *)self updateClientsSubmersionState:v10];
    int64_t externalSubmersionState = self->_externalSubmersionState;
  }
  if (externalSubmersionState != 2) {
    self->_submersionState = 100;
  }
}

- (void)updateSubmersionStateFromMeasurement:(id)a3
{
  if ((id)[(CLContextManagerWaterSubmersionBase *)self externalSubmersionState] == (id)2)
  {
    [a3 setState:-[CLSubmersionStateMachine stateFromDepth:forceSubmersion:](self->_submersionStateMachine, "stateFromDepth:forceSubmersion:", a3, 1)];
    if ([(CLContextManagerWaterSubmersionBase *)self sampleShouldBeWrittenToHK:a3])
    {
      if (![(CLContextManagerWaterSubmersionBase *)self deepestDepthForHK]
        || (-[CLWaterSubmersionMeasurement depth](-[CLContextManagerWaterSubmersionBase deepestDepthForHK](self, "deepestDepthForHK"), "depth"), double v6 = v5, [a3 depth], v6 < v7))
      {
        [(CLContextManagerWaterSubmersionBase *)self setDeepestDepthForHK:a3];
      }
    }
    if ([a3 state] == (id)300)
    {
      [a3 startAt];
      -[CLContextManagerWaterSubmersionBase onDeepSubmersion:withStateChanged:](self, "onDeepSubmersion:withStateChanged:", [a3 state] != self->_submersionState, v8);
    }
    else if ([a3 state] == (id)200)
    {
      [a3 startAt];
      -[CLContextManagerWaterSubmersionBase onShallowSubmersion:withStateChanged:](self, "onShallowSubmersion:withStateChanged:", [a3 state] != self->_submersionState, v9);
    }
    if ([a3 state] != self->_submersionState)
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      __int16 v10 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        [a3 depth];
        uint64_t v12 = v11;
        [(CLSubmersionStateMachine *)self->_submersionStateMachine deepThreshold];
        uint64_t v14 = v13;
        unsigned int v15 = [a3 state];
        int64_t submersionState = self->_submersionState;
        *(_DWORD *)buf = 134349824;
        uint64_t v19 = v12;
        __int16 v20 = 2050;
        uint64_t v21 = v14;
        __int16 v22 = 1026;
        unsigned int v23 = v15;
        __int16 v24 = 1026;
        int v25 = submersionState;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "update submersion depth state,measurement.depth,%{public}f,submergedDeepThreshold,%{public}f,submersionState.state,%{public}d, previousState,%{public}d", buf, 0x22u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
        }
        [a3 depth];
        [(CLSubmersionStateMachine *)self->_submersionStateMachine deepThreshold];
        [a3 state];
        CFAbsoluteTime v17 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase updateSubmersionStateFromMeasurement:]", "%s\n", v17);
        if (v17 != (char *)buf) {
          free(v17);
        }
      }
      self->_int64_t submersionState = (int64_t)[a3 state];
    }
  }
}

- (void)onShallowSubmersion:(double)a3 withStateChanged:(BOOL)a4
{
  if (a4) {
    [(CLContextManagerWaterSubmersionBase *)self startSubmersionPowerAssertion];
  }
  self->_updatingSurfacePressure = 0;
}

- (void)onDeepSubmersion:(double)a3 withStateChanged:(BOOL)a4
{
  if (a4) {
    [(CLContextManagerWaterSubmersionBase *)self startSubmersionPowerAssertion];
  }
  if (!self->_updatingHK)
  {
    [(CLContextManagerWaterSubmersionBase *)self startHKCollector:a3];
    self->_updatingHK = 1;
  }
  self->_updatingSurfacePressure = 0;
}

- (void)onNotSubmerged
{
  self->_int64_t externalSubmersionState = 1;
  self->_updatingSurfacePressure = 1;
}

- (void)saveCachedSubmersionState:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)a3
{
  ptr = (const void **)a3.__ptr_;
  uint64_t v4 = sub_1000A6958();
  sub_10016332C(v4, "CLWaterSubmersion_StateTimestamp", *ptr);
  uint64_t v5 = sub_1000A6958();
  *(_DWORD *)buf = *((unsigned __int8 *)*ptr + 8);
  sub_1000EA838(v5, "CLWaterSubmersion_State", buf);
  uint64_t v6 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v6 + 944))();
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
  }
  double v7 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)*ptr;
    int v9 = *((unsigned __int8 *)*ptr + 8);
    *(_DWORD *)buf = 134349312;
    uint64_t v12 = v8;
    __int16 v13 = 1026;
    int v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "saved submerged state,timestamp,%{public}f,state,%{public}d", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    __int16 v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase saveCachedSubmersionState:]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
}

- (void)retrieveCachedSubmersionState
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v16 = 1.79769313e308;
  int v15 = 1;
  uint64_t v4 = sub_1000A6958();
  sub_1000A699C(v4, "CLWaterSubmersion_StateTimestamp", &v16);
  uint64_t v5 = sub_1000A6958();
  sub_10006EF84(v5, "CLWaterSubmersion_State", &v15);
  int v17 = 1177075712;
  sub_101A22680(buf, "MaxSubmersionStateAgeFromRecovery", &v17, 0);
  if (v16 != 1.79769313e308 && Current - v16 < *(float *)&buf[4])
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    int v9 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349312;
      *(double *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "recovering state on locationd start,timestamp,%{public}f,submersion state,%{public}d", buf, 0x12u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      int v17 = 134349312;
      double v18 = v16;
      __int16 v19 = 1026;
      int v20 = v15;
      int v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase retrieveCachedSubmersionState]", "%s\n", v14);
      if (v14 != buf) {
        free(v14);
      }
    }
    char v10 = v15;
    [(CLContextManagerWaterSubmersionBase *)self aopSubmersionState];
    uint64_t v11 = *(std::__shared_weak_count **)&buf[8];
    *(unsigned char *)(*(void *)buf + 8) = v10;
    if (v11) {
      sub_1000DB0A0(v11);
    }
    double v12 = v16;
    [(CLContextManagerWaterSubmersionBase *)self aopSubmersionState];
    __int16 v13 = *(std::__shared_weak_count **)&buf[8];
    **(double **)buf = v12;
    if (v13) {
      sub_1000DB0A0(v13);
    }
  }
  else
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    double v7 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "submersion state is too old to be recovered", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      LOWORD(v17) = 0;
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase retrieveCachedSubmersionState]", "%s\n", v8);
      if (v8 != buf) {
        free(v8);
      }
    }
  }
}

- (void)startSubmersionPowerAssertion
{
  value = self->_powerAssertionSubmersion.__ptr_.__value_;
  if (*((int *)value + 2) <= 0)
  {
    sub_100134750(__p, "Altimeter, submersion state client notification power assertion");
    sub_100EBBFD8((uint64_t)value, (uint64_t *)__p);
    if (v9 < 0) {
      operator delete(__p[0]);
    }
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    uint64_t v4 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134349056;
      CFAbsoluteTime v13 = Current;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "power assertion for depth state change,timestamp,%{public}f,assertionState,1,reason,stateChange", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      CFAbsoluteTime v6 = CFAbsoluteTimeGetCurrent();
      int v10 = 134349056;
      CFAbsoluteTime v11 = v6;
      double v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase startSubmersionPowerAssertion]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
  [(CLTimer *)self->_submersionPowerAssertionTimer setNextFireDelay:10.0];
}

- (void)notificationAcknowledged:(unint64_t)a3
{
  if (a3 == 3 && *((int *)self->_powerAssertionSubmersion.__ptr_.__value_ + 2) >= 1)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    uint64_t v4 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "power assertion for depth state change,timestamp,%{public}f,assertionState,0,reason,clientResponse", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      CFAbsoluteTimeGetCurrent();
      uint64_t v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase notificationAcknowledged:]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
    sub_100EBC6AC((uint64_t)self->_powerAssertionSubmersion.__ptr_.__value_);
  }
}

- (void)onMotionStateMediatorData:(NotificationData *)a3
{
  if (*((void *)a3 + 14) == 19)
  {
    uint64_t v6 = *((void *)a3 + 2);
    if ((unint64_t)(v6 - 1) < 2)
    {
      self->_inSwimmingWorkout = 0;
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      char v9 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "swimming workout stopped,timestamp,%f", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 == -1) {
          goto LABEL_22;
        }
        goto LABEL_24;
      }
    }
    else if (v6 == 3 || v6 == 0)
    {
      self->_inSwimmingWorkout = 1;
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      uint64_t v8 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "swimming workout started,timestamp,%f", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 == -1)
        {
LABEL_22:
          CFAbsoluteTimeGetCurrent();
          int v10 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase onMotionStateMediatorData:]", "%s\n", v10);
          if (v10 != (char *)buf) {
            free(v10);
          }
          return;
        }
LABEL_24:
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
        goto LABEL_22;
      }
    }
  }
}

- (int64_t)submersionState
{
  return self->_submersionState;
}

- (void)setSubmersionState:(int64_t)a3
{
  self->_int64_t submersionState = a3;
}

- (BOOL)updatingHK
{
  return self->_updatingHK;
}

- (void)setUpdatingHK:(BOOL)a3
{
  self->_updatingHK = a3;
}

- (BOOL)inSwimmingWorkout
{
  return self->_inSwimmingWorkout;
}

- (void)setInSwimmingWorkout:(BOOL)a3
{
  self->_inSwimmingWorkout = a3;
}

- (int64_t)externalSubmersionState
{
  return self->_externalSubmersionState;
}

- (void)setExternalSubmersionState:(int64_t)a3
{
  self->_int64_t externalSubmersionState = a3;
}

- (shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)aopSubmersionState
{
  cntrl = self->_aopSubmersionState.__cntrl_;
  *v2 = self->_aopSubmersionState.__ptr_;
  v2[1] = (CLBarometerCalibrationWaterSubmersion *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (CLBarometerCalibrationWaterSubmersion *)self;
  return result;
}

- (void)setAopSubmersionState:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)a3
{
  p_aopSubmersionState = &self->_aopSubmersionState;
  uint64_t v5 = *(CLBarometerCalibrationWaterSubmersion **)a3.__ptr_;
  uint64_t v4 = *((void *)a3.__ptr_ + 1);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_aopSubmersionState.__cntrl_;
  p_aopSubmersionState->__ptr_ = v5;
  p_aopSubmersionState->__cntrl_ = (__shared_weak_count *)v4;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
}

- (BOOL)updatingSurfacePressure
{
  return self->_updatingSurfacePressure;
}

- (void)setUpdatingSurfacePressure:(BOOL)a3
{
  self->_updatingSurfacePressure = a3;
}

- (CLSubmersionDataCollector)hkCollector
{
  return self->_hkCollector;
}

- (void)setHkCollector:(id)a3
{
}

- (CLSubmersionStateMachine)submersionStateMachine
{
  return self->_submersionStateMachine;
}

- (void)setSubmersionStateMachine:(id)a3
{
}

- (double)lastHKUpdate
{
  return self->_lastHKUpdate;
}

- (void)setLastHKUpdate:(double)a3
{
  self->_lastHKUpdate = a3;
}

- (double)lastDefaultLevelLogTimestamp
{
  return self->_lastDefaultLevelLogTimestamp;
}

- (void)setLastDefaultLevelLogTimestamp:(double)a3
{
  self->_lastDefaultLevelLogTimestamp = a3;
}

- (CLWaterSubmersionMeasurement)deepestDepthForHK
{
  return self->_deepestDepthForHK;
}

- (void)setDeepestDepthForHK:(id)a3
{
}

- (double)timeBetweenHKUpdates
{
  return self->_timeBetweenHKUpdates;
}

- (void)setTimeBetweenHKUpdates:(double)a3
{
  self->_timeBetweenHKUpdates = a3;
}

- (void).cxx_destruct
{
  cntrl = self->_aopSubmersionState.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  value = self->_powerAssertionHK.__ptr_.__value_;
  self->_powerAssertionHK.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(CLPowerAssertion *, SEL))(*(void *)value + 8))(value, a2);
  }
  uint64_t v5 = self->_powerAssertionSubmersion.__ptr_.__value_;
  self->_powerAssertionSubmersion.__ptr_.__value_ = 0;
  if (v5)
  {
    uint64_t v6 = *(void (**)(void))(*(void *)v5 + 8);
    v6();
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 19) = 0;
  return self;
}

@end