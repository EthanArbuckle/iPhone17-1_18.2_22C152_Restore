@interface CLContextManagerAbsoluteAltimeter
- (BOOL)shouldEnableGPSAtTime:(double)a3;
- (BOOL)shouldEnableWifiAtTime:(double)a3;
- (CLContextManagerAbsoluteAltimeter)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6;
- (double)capAccuracy:(double)result;
- (id).cxx_construct;
- (void)calculateAndSendAltitudeFromBaro;
- (void)calculateAndSendAltitudeFromCompanion;
- (void)calculateAndSendAltitudeFromLocation;
- (void)chooseUncertaintyDuringWorkout:(double *)a3 withAltitude:(double)a4 atTime:(double)a5;
- (void)dealloc;
- (void)filteredElevation:(double *)a3 absAltUncertainty:(double *)a4 withTimestamp:(double *)a5;
- (void)forceGPSIfUnderground;
- (void)forceLocationAtTime:(double)a3;
- (void)onCompanionConnectionNotification:(int)a3 data:(unsigned char *)a4;
- (void)releasePowerAssertions;
- (void)setTimerForGPSOff;
- (void)setTimerForWifiOff;
- (void)setupTimers;
- (void)sourceUpdated:(unint64_t)a3;
- (void)teardownTimers;
- (void)wetStateUpdated:(unint64_t)a3;
@end

@implementation CLContextManagerAbsoluteAltimeter

- (CLContextManagerAbsoluteAltimeter)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)CLContextManagerAbsoluteAltimeter;
  v6 = [(CLBarometerCalibrationContextManager *)&v10 initWithUniverse:a3 delegate:a4 withBuffer:a5 withSourceAggregator:a6];
  if (v6)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022FDD50);
    }
    v7 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Absolute Altimeter Context created", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022FDD50);
      }
      LOWORD(v11) = 0;
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter initWithUniverse:delegate:withBuffer:withSourceAggregator:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    [(CLBarometerCalibrationSourceAggregator *)v6->super._sourceAggregator enableSources:&off_102397D40 forContext:v6];
    sub_100681630();
  }
  return 0;
}

- (void)setupTimers
{
  v3 = (CLTimer *)[[-[CLIntersiloUniverse silo](self->super._universe, "silo") newTimer];
  self->_forceWifiTimer = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100E73D3C;
  v6[3] = &unk_10229FED8;
  v6[4] = self;
  [(CLTimer *)v3 setHandler:v6];
  v4 = (CLTimer *)[[-[CLIntersiloUniverse silo](self->super._universe, "silo") newTimer];
  self->_forceGPSTimer = v4;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100E73F10;
  v5[3] = &unk_10229FED8;
  v5[4] = self;
  [(CLTimer *)v4 setHandler:v5];
}

- (void)teardownTimers
{
  self->_forceWifiTimer = 0;
  [(CLTimer *)self->_forceGPSTimer invalidate];

  self->_forceGPSTimer = 0;
}

- (void)releasePowerAssertions
{
  value = self->_powerAssertionWifi.__ptr_.__value_;
  if (*((int *)value + 2) <= 0)
  {
    self->_powerAssertionWifi.__ptr_.__value_ = 0;
    goto LABEL_5;
  }
  sub_100EBC6AC((uint64_t)value);
  value = self->_powerAssertionWifi.__ptr_.__value_;
  self->_powerAssertionWifi.__ptr_.__value_ = 0;
  if (value) {
LABEL_5:
  }
    (*(void (**)(CLPowerAssertion *))(*(void *)value + 8))(value);
  v4 = self->_powerAssertionGPS.__ptr_.__value_;
  if (*((int *)v4 + 2) <= 0)
  {
    self->_powerAssertionGPS.__ptr_.__value_ = 0;
  }
  else
  {
    sub_100EBC6AC((uint64_t)v4);
    v4 = self->_powerAssertionGPS.__ptr_.__value_;
    self->_powerAssertionGPS.__ptr_.__value_ = 0;
    if (!v4) {
      return;
    }
  }
  v5 = *(void (**)(void))(*(void *)v4 + 8);

  v5();
}

- (void)dealloc
{
  [(CLBarometerCalibrationSourceAggregator *)self->super._sourceAggregator disableSources:&off_102397D40 forContext:self];
  [(CLContextManagerAbsoluteAltimeter *)self teardownTimers];
  [(CLContextManagerAbsoluteAltimeter *)self releasePowerAssertions];
  v3.receiver = self;
  v3.super_class = (Class)CLContextManagerAbsoluteAltimeter;
  [(CLBarometerCalibrationContextManager *)&v3 dealloc];
}

- (void)sourceUpdated:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 4)
    {
      if (self->_currentWetState == 1)
      {
        [(CLContextManagerAbsoluteAltimeter *)self calculateAndSendAltitudeFromCompanion];
      }
    }
    else if (a3 == 5)
    {
      if (self->_currentWetState == 1)
      {
        if (self->_currentStatusInfo - 1 >= 2)
        {
          v4 = objc_opt_new();
          [v4 setTimestamp:CFAbsoluteTimeGetCurrent()];
          [v4 setAltitude:0.0];
          [(CLContextManagerAbsoluteAltimeter *)self capAccuracy:1.79769313e308];
          [v4 setAccuracy:];
          [v4 setPrecision:5.0];
          [v4 setStatusInfo:1];
          [(CLBarometerCalibrationContextClient *)self->super._delegate absoluteAltitudeUpdate:v4];
          [v4 timestamp];
          self->_double lastAltitudeSentTimestamp = v5;
          self->_unint64_t currentStatusInfo = (unint64_t)[v4 statusInfo];
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022FDD50);
          }
          v6 = qword_1024191E8;
          if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
          {
            [v4 altitude];
            uint64_t v8 = v7;
            [v4 accuracy];
            uint64_t v10 = v9;
            [v4 precision];
            unint64_t currentStatusInfo = self->_currentStatusInfo;
            double lastAltitudeSentTimestamp = self->_lastAltitudeSentTimestamp;
            *(_DWORD *)buf = 134219008;
            uint64_t v16 = v8;
            __int16 v17 = 2048;
            uint64_t v18 = v10;
            __int16 v19 = 2048;
            uint64_t v20 = v13;
            __int16 v21 = 1024;
            int v22 = currentStatusInfo;
            __int16 v23 = 2048;
            double v24 = lastAltitudeSentTimestamp;
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source timestamp %f this should be one shot", buf, 0x30u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022FDD50);
            }
            [v4 altitude];
            [v4 accuracy];
            [v4 precision];
            v14 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter sourceUpdated:]", "%s\n", v14);
            if (v14 != (char *)buf) {
              free(v14);
            }
          }
        }
      }
      else
      {
        [(CLContextManagerAbsoluteAltimeter *)self calculateAndSendAltitudeFromBaro];
      }
    }
  }
  else
  {
    if (self->_currentWetState == 1 || self->_uncalibratedState) {
      [(CLContextManagerAbsoluteAltimeter *)self calculateAndSendAltitudeFromLocation];
    }
    [(CLContextManagerAbsoluteAltimeter *)self forceGPSIfUnderground];
  }
}

- (void)forceGPSIfUnderground
{
  id v3 = [(CLBarometerCalibrationContextClient *)self->super._delegate latestAbsoluteAltitude];
  [v3 timestamp];
  if (v4 != 1.79769313e308)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022FDD50);
    }
    double v5 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      [v3 timestamp];
      uint64_t v7 = v6;
      [v3 altitude];
      *(_DWORD *)buf = 134218240;
      uint64_t v46 = v7;
      __int16 v47 = 2048;
      uint64_t v48 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "checking if DEM underground, latest alt timestamp %f, latest abs alt %f", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022FDD50);
      }
      [v3 timestamp];
      uint64_t v24 = v23;
      [v3 altitude];
      int v41 = 134218240;
      *(void *)v42 = v24;
      *(_WORD *)&v42[8] = 2048;
      *(void *)&v42[10] = v25;
      v26 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter forceGPSIfUnderground]", "%s\n", v26);
      if (v26 != (char *)buf) {
        free(v26);
      }
    }
    double Current = CFAbsoluteTimeGetCurrent();
    sub_100096374((uint64_t)&v41, (void *)self->super.fDataBuffers);
    uint64_t v10 = (uint64_t *)(*(void *)(*(void *)&v42[4] + (((unint64_t)(v44 + v43 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                    + 16 * (v44 + v43 - 1));
    uint64_t v12 = *v10;
    int v11 = (std::__shared_weak_count *)v10[1];
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (*(double *)(v12 + 56) > 0.0)
    {
      double v13 = *(double *)v12;
      [v3 timestamp];
      if (vabdd_f64(v13, v14) < 5.0)
      {
        [v3 altitude];
        double v15 = *(double *)(v12 + 48);
        if (v16 > v15 + -20.0) {
          self->_userUnderground = 0;
        }
        [v3 altitude];
        if (v15 - v17 > 20.0 && !self->_userUnderground)
        {
          self->_userUnderground = 1;
          if (*(_DWORD *)(v12 + 100) != 1 && !self->_GPSInProgress)
          {
            value = self->_powerAssertionGPS.__ptr_.__value_;
            sub_100134750(__p, "Altimeter, power assertion GPS underground");
            sub_100EBBFD8((uint64_t)value, (uint64_t *)__p);
            if (v32 < 0) {
              operator delete(__p[0]);
            }
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022FDD50);
            }
            __int16 v19 = qword_1024191E8;
            if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
            {
              [v3 altitude];
              uint64_t v20 = *(void *)(v12 + 48);
              int v21 = *(_DWORD *)(v12 + 100);
              *(_DWORD *)buf = 134218752;
              uint64_t v46 = v22;
              __int16 v47 = 2048;
              uint64_t v48 = v20;
              __int16 v49 = 1024;
              int v50 = v21;
              __int16 v51 = 2048;
              double v52 = Current;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "forcing GPS, detected underground, altitude %f, DEM %f, DEM source %d, time, %f", buf, 0x26u);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1024191E0 != -1) {
                dispatch_once(&qword_1024191E0, &stru_1022FDD50);
              }
              [v3 altitude];
              uint64_t v27 = *(void *)(v12 + 48);
              int v28 = *(_DWORD *)(v12 + 100);
              int v33 = 134218752;
              uint64_t v34 = v29;
              __int16 v35 = 2048;
              uint64_t v36 = v27;
              __int16 v37 = 1024;
              int v38 = v28;
              __int16 v39 = 2048;
              double v40 = Current;
              v30 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter forceGPSIfUnderground]", "%s\n", v30);
              if (v30 != (char *)buf) {
                free(v30);
              }
            }
            [*((id *)self->_locationControllerClient.__ptr_.__value_ + 2) register:*((void *)self->_locationControllerClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
            self->_lastForcedGPSTime = Current;
            self->_GPSInProgress = 1;
            [(CLContextManagerAbsoluteAltimeter *)self setTimerForGPSOff];
            [(CLBarometerCalibrationContextClient *)self->super._delegate announceMostRecentForcedGPS:self->_lastForcedGPSTime];
          }
        }
      }
    }
    if (v11) {
      sub_1000DB0A0(v11);
    }
    sub_1000DAF68(&v41);
  }
}

- (void)calculateAndSendAltitudeFromCompanion
{
  sub_100096374((uint64_t)v42, (void *)self->super.fDataBuffers + 24);
  id v3 = (double **)(*(void *)(v42[1] + (((unint64_t)(v44 + v43 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                 + 16 * (v44 + v43 - 1));
  double v5 = *v3;
  double v4 = (std::__shared_weak_count *)v3[1];
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = objc_opt_new();
  [v6 setTimestamp:*v5];
  [v6 setAltitude:v5[1]];
  [(CLContextManagerAbsoluteAltimeter *)self capAccuracy:v5[2]];
  [v6 setAccuracy:];
  [v6 setPrecision:100.0];
  [v6 setStatusInfo:2];
  double lastAltitudeSentTimestamp = self->_lastAltitudeSentTimestamp;
  [v6 timestamp];
  if (lastAltitudeSentTimestamp != v8)
  {
    [(CLBarometerCalibrationContextClient *)self->super._delegate absoluteAltitudeUpdate:v6];
    [v6 timestamp];
    self->_double lastAltitudeSentTimestamp = v9;
    self->_unint64_t currentStatusInfo = 2;
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022FDD50);
    }
    uint64_t v10 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
    {
      [v6 altitude];
      uint64_t v12 = v11;
      [v6 accuracy];
      uint64_t v14 = v13;
      [v6 precision];
      unint64_t currentStatusInfo = self->_currentStatusInfo;
      double v16 = self->_lastAltitudeSentTimestamp;
      *(_DWORD *)buf = 134219264;
      uint64_t v58 = v12;
      __int16 v59 = 2048;
      uint64_t v60 = v14;
      __int16 v61 = 2048;
      uint64_t v62 = v17;
      __int16 v63 = 1024;
      int v64 = currentStatusInfo;
      __int16 v65 = 1024;
      int v66 = 5;
      __int16 v67 = 2048;
      double v68 = v16;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", buf, 0x36u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022FDD50);
      }
      [v6 altitude];
      uint64_t v27 = v26;
      [v6 accuracy];
      uint64_t v29 = v28;
      [v6 precision];
      unint64_t v30 = self->_currentStatusInfo;
      double v31 = self->_lastAltitudeSentTimestamp;
      int v45 = 134219264;
      uint64_t v46 = v27;
      __int16 v47 = 2048;
      uint64_t v48 = v29;
      __int16 v49 = 2048;
      uint64_t v50 = v32;
      __int16 v51 = 1024;
      int v52 = v30;
      __int16 v53 = 1024;
      int v54 = 5;
      __int16 v55 = 2048;
      double v56 = v31;
      int v33 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromCompanion]", "%s\n", v33);
      if (v33 != (char *)buf) {
        free(v33);
      }
    }
    if (vabdd_f64(self->_lastDefaultLevelLogTimestamp, CFAbsoluteTimeGetCurrent()) > 30.0)
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022FDD50);
      }
      uint64_t v18 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        [v6 altitude];
        uint64_t v20 = v19;
        [v6 accuracy];
        uint64_t v22 = v21;
        [v6 precision];
        unint64_t v23 = self->_currentStatusInfo;
        double v24 = self->_lastAltitudeSentTimestamp;
        *(_DWORD *)buf = 134219264;
        uint64_t v58 = v20;
        __int16 v59 = 2048;
        uint64_t v60 = v22;
        __int16 v61 = 2048;
        uint64_t v62 = v25;
        __int16 v63 = 1024;
        int v64 = v23;
        __int16 v65 = 1024;
        int v66 = 5;
        __int16 v67 = 2048;
        double v68 = v24;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", buf, 0x36u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022FDD50);
        }
        [v6 altitude];
        uint64_t v35 = v34;
        [v6 accuracy];
        uint64_t v37 = v36;
        [v6 precision];
        unint64_t v38 = self->_currentStatusInfo;
        double v39 = self->_lastAltitudeSentTimestamp;
        int v45 = 134219264;
        uint64_t v46 = v35;
        __int16 v47 = 2048;
        uint64_t v48 = v37;
        __int16 v49 = 2048;
        uint64_t v50 = v40;
        __int16 v51 = 1024;
        int v52 = v38;
        __int16 v53 = 1024;
        int v54 = 5;
        __int16 v55 = 2048;
        double v56 = v39;
        int v41 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromCompanion]", "%s\n", v41);
        if (v41 != (char *)buf) {
          free(v41);
        }
      }
      self->_lastDefaultLevelLogTimestamp = CFAbsoluteTimeGetCurrent();
    }
  }

  if (v4) {
    sub_1000DB0A0(v4);
  }
  sub_1000DAF68(v42);
}

- (void)calculateAndSendAltitudeFromLocation
{
  sub_100096374((uint64_t)v154, (void *)self->super.fDataBuffers);
  long long v3 = *(_OWORD *)(*(void *)(v154[1] + (((unint64_t)(v156 + v155 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                 + 16 * (v156 + v155 - 1));
  long long v150 = v3;
  if (*((void *)&v3 + 1))
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v3 + 1) + 8), 1uLL, memory_order_relaxed);
    long long v153 = v3;
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v3 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  else
  {
    long long v153 = (unint64_t)v3;
  }
  double v151 = -1.0;
  double v152 = 1.79769313e308;
  +[CLBarometerCalibrationBiasEstimator getLocationSampleAltitudeAndUncertainty:&v153 andRefAltitude:&v152 andRefUncertainty:&v151];
  unsigned int v4 = [(CLBarometerCalibrationContextClient *)self->super._delegate inOutdoorWorkout];
  int v5 = *(_DWORD *)(v150 + 100);
  if (!v4)
  {
    if (v5 == 1)
    {
      if (*(double *)(v150 + 56) <= 0.0 || vabdd_f64(*(double *)(v150 + 24), *(double *)(v150 + 48)) > 10.0) {
        goto LABEL_86;
      }
      double v9 = objc_opt_new();
      [v9 setTimestamp:*(double *)v150];
      [v9 setAltitude:*(double *)(v150 + 48)];
      [(CLContextManagerAbsoluteAltimeter *)self capAccuracy:vabdd_f64(*(double *)(v150 + 24), *(double *)(v150 + 48))];
      [v9 setAccuracy:];
      [v9 setPrecision:5.0];
      [v9 setStatusInfo:2];
      double lastAltitudeSentTimestamp = self->_lastAltitudeSentTimestamp;
      [v9 timestamp];
      if (lastAltitudeSentTimestamp != v30)
      {
        [(CLBarometerCalibrationContextClient *)self->super._delegate absoluteAltitudeUpdate:v9];
        [v9 timestamp];
        self->_double lastAltitudeSentTimestamp = v31;
        self->_unint64_t currentStatusInfo = 2;
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022FDD50);
        }
        uint64_t v32 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
        {
          [v9 altitude];
          uint64_t v34 = v33;
          [v9 accuracy];
          uint64_t v36 = v35;
          [v9 precision];
          unint64_t currentStatusInfo = self->_currentStatusInfo;
          double v38 = self->_lastAltitudeSentTimestamp;
          *(_DWORD *)buf = 134219264;
          uint64_t v170 = v34;
          __int16 v171 = 2048;
          uint64_t v172 = v36;
          __int16 v173 = 2048;
          uint64_t v174 = v39;
          __int16 v175 = 1024;
          int v176 = currentStatusInfo;
          __int16 v177 = 1024;
          int v178 = 2;
          __int16 v179 = 2048;
          double v180 = v38;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", buf, 0x36u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022FDD50);
          }
          [v9 altitude];
          uint64_t v119 = v118;
          [v9 accuracy];
          uint64_t v121 = v120;
          [v9 precision];
          unint64_t v122 = self->_currentStatusInfo;
          double v123 = self->_lastAltitudeSentTimestamp;
          int v157 = 134219264;
          uint64_t v158 = v119;
          __int16 v159 = 2048;
          uint64_t v160 = v121;
          __int16 v161 = 2048;
          uint64_t v162 = v124;
          __int16 v163 = 1024;
          int v164 = v122;
          __int16 v165 = 1024;
          int v166 = 2;
          __int16 v167 = 2048;
          double v168 = v123;
          v125 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]", "%s\n", v125);
          if (v125 != (char *)buf) {
            free(v125);
          }
        }
        if (vabdd_f64(self->_lastDefaultLevelLogTimestamp, CFAbsoluteTimeGetCurrent()) > 30.0)
        {
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022FDD50);
          }
          uint64_t v40 = qword_1024191E8;
          if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
          {
            [v9 altitude];
            uint64_t v42 = v41;
            [v9 accuracy];
            uint64_t v44 = v43;
            [v9 precision];
            unint64_t v45 = self->_currentStatusInfo;
            double v46 = self->_lastAltitudeSentTimestamp;
            *(_DWORD *)buf = 134219264;
            uint64_t v170 = v42;
            __int16 v171 = 2048;
            uint64_t v172 = v44;
            __int16 v173 = 2048;
            uint64_t v174 = v47;
            __int16 v175 = 1024;
            int v176 = v45;
            __int16 v177 = 1024;
            int v178 = 2;
            __int16 v179 = 2048;
            double v180 = v46;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", buf, 0x36u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022FDD50);
            }
            [v9 altitude];
            uint64_t v143 = v142;
            [v9 accuracy];
            uint64_t v145 = v144;
            [v9 precision];
            unint64_t v146 = self->_currentStatusInfo;
            double v147 = self->_lastAltitudeSentTimestamp;
            int v157 = 134219264;
            uint64_t v158 = v143;
            __int16 v159 = 2048;
            uint64_t v160 = v145;
            __int16 v161 = 2048;
            uint64_t v162 = v148;
            __int16 v163 = 1024;
            int v164 = v146;
            __int16 v165 = 1024;
            int v166 = 2;
            __int16 v167 = 2048;
            double v168 = v147;
            v149 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]", "%s\n", v149);
            if (v149 != (char *)buf) {
              free(v149);
            }
          }
          self->_lastDefaultLevelLogTimestamp = CFAbsoluteTimeGetCurrent();
        }
      }
    }
    else
    {
      if (v5 != 11 && v5 != 4) {
        goto LABEL_86;
      }
      if (*(double *)(v150 + 56) > 0.0 && v151 > 0.0 && vabdd_f64(v152, *(double *)(v150 + 48)) <= 10.0)
      {
        double v9 = objc_opt_new();
        [v9 setTimestamp:*(double *)v150];
        [v9 setAltitude:*(double *)(v150 + 48)];
        [(CLContextManagerAbsoluteAltimeter *)self capAccuracy:vabdd_f64(*(double *)(v150 + 24), *(double *)(v150 + 48))];
        [v9 setAccuracy:];
        [v9 setPrecision:5.0];
        [v9 setStatusInfo:2];
        double v67 = self->_lastAltitudeSentTimestamp;
        [v9 timestamp];
        if (v67 != v68)
        {
          [(CLBarometerCalibrationContextClient *)self->super._delegate absoluteAltitudeUpdate:v9];
          [v9 timestamp];
          self->_double lastAltitudeSentTimestamp = v69;
          self->_unint64_t currentStatusInfo = 2;
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022FDD50);
          }
          v70 = qword_1024191E8;
          if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
          {
            [v9 altitude];
            uint64_t v72 = v71;
            [v9 accuracy];
            uint64_t v74 = v73;
            [v9 precision];
            unint64_t v75 = self->_currentStatusInfo;
            double v76 = self->_lastAltitudeSentTimestamp;
            *(_DWORD *)buf = 134219264;
            uint64_t v170 = v72;
            __int16 v171 = 2048;
            uint64_t v172 = v74;
            __int16 v173 = 2048;
            uint64_t v174 = v77;
            __int16 v175 = 1024;
            int v176 = v75;
            __int16 v177 = 1024;
            int v178 = 3;
            __int16 v179 = 2048;
            double v180 = v76;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", buf, 0x36u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022FDD50);
            }
            [v9 altitude];
            uint64_t v103 = v102;
            [v9 accuracy];
            uint64_t v105 = v104;
            [v9 precision];
            unint64_t v106 = self->_currentStatusInfo;
            double v107 = self->_lastAltitudeSentTimestamp;
            int v157 = 134219264;
            uint64_t v158 = v103;
            __int16 v159 = 2048;
            uint64_t v160 = v105;
            __int16 v161 = 2048;
            uint64_t v162 = v108;
            __int16 v163 = 1024;
            int v164 = v106;
            __int16 v165 = 1024;
            int v166 = 3;
            __int16 v167 = 2048;
            double v168 = v107;
            v109 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]", "%s\n", v109);
            if (v109 != (char *)buf) {
              free(v109);
            }
          }
          if (vabdd_f64(self->_lastDefaultLevelLogTimestamp, CFAbsoluteTimeGetCurrent()) > 30.0)
          {
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022FDD50);
            }
            v78 = qword_1024191E8;
            if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
            {
              [v9 altitude];
              uint64_t v80 = v79;
              [v9 accuracy];
              uint64_t v82 = v81;
              [v9 precision];
              unint64_t v83 = self->_currentStatusInfo;
              double v84 = self->_lastAltitudeSentTimestamp;
              *(_DWORD *)buf = 134219264;
              uint64_t v170 = v80;
              __int16 v171 = 2048;
              uint64_t v172 = v82;
              __int16 v173 = 2048;
              uint64_t v174 = v85;
              __int16 v175 = 1024;
              int v176 = v83;
              __int16 v177 = 1024;
              int v178 = 3;
              __int16 v179 = 2048;
              double v180 = v84;
              _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", buf, 0x36u);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1024191E0 != -1) {
                dispatch_once(&qword_1024191E0, &stru_1022FDD50);
              }
              [v9 altitude];
              uint64_t v135 = v134;
              [v9 accuracy];
              uint64_t v137 = v136;
              [v9 precision];
              unint64_t v138 = self->_currentStatusInfo;
              double v139 = self->_lastAltitudeSentTimestamp;
              int v157 = 134219264;
              uint64_t v158 = v135;
              __int16 v159 = 2048;
              uint64_t v160 = v137;
              __int16 v161 = 2048;
              uint64_t v162 = v140;
              __int16 v163 = 1024;
              int v164 = v138;
              __int16 v165 = 1024;
              int v166 = 3;
              __int16 v167 = 2048;
              double v168 = v139;
              v141 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]", "%s\n", v141);
              if (v141 != (char *)buf) {
                free(v141);
              }
            }
            self->_lastDefaultLevelLogTimestamp = CFAbsoluteTimeGetCurrent();
          }
        }
      }
      else
      {
        if (v151 <= 0.0) {
          goto LABEL_86;
        }
        double v9 = objc_opt_new();
        [v9 setTimestamp:*(double *)v150];
        [v9 setAltitude:*(double *)(v150 + 24)];
        [(CLContextManagerAbsoluteAltimeter *)self capAccuracy:*(double *)(v150 + 40)];
        [v9 setAccuracy:];
        [v9 setPrecision:5.0];
        [v9 setStatusInfo:2];
        double v10 = self->_lastAltitudeSentTimestamp;
        [v9 timestamp];
        if (v10 != v11)
        {
          [(CLBarometerCalibrationContextClient *)self->super._delegate absoluteAltitudeUpdate:v9];
          [v9 timestamp];
          self->_double lastAltitudeSentTimestamp = v12;
          self->_unint64_t currentStatusInfo = 2;
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022FDD50);
          }
          uint64_t v13 = qword_1024191E8;
          if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
          {
            [v9 altitude];
            uint64_t v15 = v14;
            [v9 accuracy];
            uint64_t v17 = v16;
            [v9 precision];
            unint64_t v18 = self->_currentStatusInfo;
            double v19 = self->_lastAltitudeSentTimestamp;
            *(_DWORD *)buf = 134219264;
            uint64_t v170 = v15;
            __int16 v171 = 2048;
            uint64_t v172 = v17;
            __int16 v173 = 2048;
            uint64_t v174 = v20;
            __int16 v175 = 1024;
            int v176 = v18;
            __int16 v177 = 1024;
            int v178 = 4;
            __int16 v179 = 2048;
            double v180 = v19;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", buf, 0x36u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022FDD50);
            }
            [v9 altitude];
            uint64_t v87 = v86;
            [v9 accuracy];
            uint64_t v89 = v88;
            [v9 precision];
            unint64_t v90 = self->_currentStatusInfo;
            double v91 = self->_lastAltitudeSentTimestamp;
            int v157 = 134219264;
            uint64_t v158 = v87;
            __int16 v159 = 2048;
            uint64_t v160 = v89;
            __int16 v161 = 2048;
            uint64_t v162 = v92;
            __int16 v163 = 1024;
            int v164 = v90;
            __int16 v165 = 1024;
            int v166 = 4;
            __int16 v167 = 2048;
            double v168 = v91;
            v93 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]", "%s\n", v93);
            if (v93 != (char *)buf) {
              free(v93);
            }
          }
          if (vabdd_f64(self->_lastDefaultLevelLogTimestamp, CFAbsoluteTimeGetCurrent()) > 30.0)
          {
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022FDD50);
            }
            uint64_t v21 = qword_1024191E8;
            if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
            {
              [v9 altitude];
              uint64_t v23 = v22;
              [v9 accuracy];
              uint64_t v25 = v24;
              [v9 precision];
              unint64_t v26 = self->_currentStatusInfo;
              double v27 = self->_lastAltitudeSentTimestamp;
              *(_DWORD *)buf = 134219264;
              uint64_t v170 = v23;
              __int16 v171 = 2048;
              uint64_t v172 = v25;
              __int16 v173 = 2048;
              uint64_t v174 = v28;
              __int16 v175 = 1024;
              int v176 = v26;
              __int16 v177 = 1024;
              int v178 = 4;
              __int16 v179 = 2048;
              double v180 = v27;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", buf, 0x36u);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1024191E0 != -1) {
                dispatch_once(&qword_1024191E0, &stru_1022FDD50);
              }
              [v9 altitude];
              uint64_t v111 = v110;
              [v9 accuracy];
              uint64_t v113 = v112;
              [v9 precision];
              unint64_t v114 = self->_currentStatusInfo;
              double v115 = self->_lastAltitudeSentTimestamp;
              int v157 = 134219264;
              uint64_t v158 = v111;
              __int16 v159 = 2048;
              uint64_t v160 = v113;
              __int16 v161 = 2048;
              uint64_t v162 = v116;
              __int16 v163 = 1024;
              int v164 = v114;
              __int16 v165 = 1024;
              int v166 = 4;
              __int16 v167 = 2048;
              double v168 = v115;
              v117 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]", "%s\n", v117);
              if (v117 != (char *)buf) {
                free(v117);
              }
            }
            self->_lastDefaultLevelLogTimestamp = CFAbsoluteTimeGetCurrent();
          }
        }
      }
    }
LABEL_85:

    goto LABEL_86;
  }
  if (v5 == 1 && *(double *)(v150 + 56) > 0.0 && v151 > 0.0 && vabdd_f64(v152, *(double *)(v150 + 48)) <= 10.0)
  {
    double v9 = objc_opt_new();
    [v9 setTimestamp:*(double *)v150];
    [v9 setAltitude:*(double *)(v150 + 48)];
    [(CLContextManagerAbsoluteAltimeter *)self capAccuracy:vabdd_f64(*(double *)(v150 + 24), *(double *)(v150 + 48))];
    [v9 setAccuracy:];
    [v9 setPrecision:5.0];
    [v9 setStatusInfo:2];
    double v48 = self->_lastAltitudeSentTimestamp;
    [v9 timestamp];
    if (v48 != v49)
    {
      [(CLBarometerCalibrationContextClient *)self->super._delegate absoluteAltitudeUpdate:v9];
      [v9 timestamp];
      self->_double lastAltitudeSentTimestamp = v50;
      self->_unint64_t currentStatusInfo = 2;
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022FDD50);
      }
      __int16 v51 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
      {
        [v9 altitude];
        uint64_t v53 = v52;
        [v9 accuracy];
        uint64_t v55 = v54;
        [v9 precision];
        unint64_t v56 = self->_currentStatusInfo;
        double v57 = self->_lastAltitudeSentTimestamp;
        *(_DWORD *)buf = 134219264;
        uint64_t v170 = v53;
        __int16 v171 = 2048;
        uint64_t v172 = v55;
        __int16 v173 = 2048;
        uint64_t v174 = v58;
        __int16 v175 = 1024;
        int v176 = v56;
        __int16 v177 = 1024;
        int v178 = 1;
        __int16 v179 = 2048;
        double v180 = v57;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", buf, 0x36u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022FDD50);
        }
        [v9 altitude];
        uint64_t v95 = v94;
        [v9 accuracy];
        uint64_t v97 = v96;
        [v9 precision];
        unint64_t v98 = self->_currentStatusInfo;
        double v99 = self->_lastAltitudeSentTimestamp;
        int v157 = 134219264;
        uint64_t v158 = v95;
        __int16 v159 = 2048;
        uint64_t v160 = v97;
        __int16 v161 = 2048;
        uint64_t v162 = v100;
        __int16 v163 = 1024;
        int v164 = v98;
        __int16 v165 = 1024;
        int v166 = 1;
        __int16 v167 = 2048;
        double v168 = v99;
        v101 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]", "%s\n", v101);
        if (v101 != (char *)buf) {
          free(v101);
        }
      }
      if (vabdd_f64(self->_lastDefaultLevelLogTimestamp, CFAbsoluteTimeGetCurrent()) > 30.0)
      {
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022FDD50);
        }
        __int16 v59 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
        {
          [v9 altitude];
          uint64_t v61 = v60;
          [v9 accuracy];
          uint64_t v63 = v62;
          [v9 precision];
          unint64_t v64 = self->_currentStatusInfo;
          double v65 = self->_lastAltitudeSentTimestamp;
          *(_DWORD *)buf = 134219264;
          uint64_t v170 = v61;
          __int16 v171 = 2048;
          uint64_t v172 = v63;
          __int16 v173 = 2048;
          uint64_t v174 = v66;
          __int16 v175 = 1024;
          int v176 = v64;
          __int16 v177 = 1024;
          int v178 = 1;
          __int16 v179 = 2048;
          double v180 = v65;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", buf, 0x36u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022FDD50);
          }
          [v9 altitude];
          uint64_t v127 = v126;
          [v9 accuracy];
          uint64_t v129 = v128;
          [v9 precision];
          unint64_t v130 = self->_currentStatusInfo;
          double v131 = self->_lastAltitudeSentTimestamp;
          int v157 = 134219264;
          uint64_t v158 = v127;
          __int16 v159 = 2048;
          uint64_t v160 = v129;
          __int16 v161 = 2048;
          uint64_t v162 = v132;
          __int16 v163 = 1024;
          int v164 = v130;
          __int16 v165 = 1024;
          int v166 = 1;
          __int16 v167 = 2048;
          double v168 = v131;
          v133 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]", "%s\n", v133);
          if (v133 != (char *)buf) {
            free(v133);
          }
        }
        self->_lastDefaultLevelLogTimestamp = CFAbsoluteTimeGetCurrent();
      }
    }
    goto LABEL_85;
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022FDD50);
  }
  uint64_t v6 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GPS too far from DEM, not updating altitude", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022FDD50);
    }
    LOWORD(v157) = 0;
    uint64_t v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
LABEL_86:
  if (*((void *)&v153 + 1)) {
    sub_1000DB0A0(*((std::__shared_weak_count **)&v153 + 1));
  }
  if (*((void *)&v150 + 1)) {
    sub_1000DB0A0(*((std::__shared_weak_count **)&v150 + 1));
  }
  sub_1000DAF68(v154);
}

- (BOOL)shouldEnableWifiAtTime:(double)a3
{
  return vabdd_f64(a3, self->_lastForcedWifiTime) > 900.0 && !self->_GPSInProgress && !self->_wifiInProgress;
}

- (BOOL)shouldEnableGPSAtTime:(double)a3
{
  return vabdd_f64(a3, self->_lastForcedGPSTime) > 1860.0 && !self->_GPSInProgress && !self->_wifiInProgress;
}

- (void)setTimerForWifiOff
{
}

- (void)setTimerForGPSOff
{
}

- (void)forceLocationAtTime:(double)a3
{
  if (self->_isCompanionConnected && self->_doesCompanionHavePressureSensor && !self->_currentWetState)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022FDD50);
    }
    double v9 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      BOOL isCompanionConnected = self->_isCompanionConnected;
      BOOL doesCompanionHavePressureSensor = self->_doesCompanionHavePressureSensor;
      *(_DWORD *)buf = 67109376;
      LODWORD(v24[0]) = isCompanionConnected;
      WORD2(v24[0]) = 1024;
      *(_DWORD *)((char *)v24 + 6) = doesCompanionHavePressureSensor;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "will not force Wifi/GPS, phone connected %d, phone has pressure %d, and sensor is dry", buf, 0xEu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022FDD50);
      }
      BOOL v14 = self->_isCompanionConnected;
      BOOL v15 = self->_doesCompanionHavePressureSensor;
      int v21 = 67109376;
      *(_DWORD *)uint64_t v22 = v14;
      *(_WORD *)&v22[4] = 1024;
      *(_DWORD *)&v22[6] = v15;
      uint64_t v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter forceLocationAtTime:]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
  }
  else if ([(CLContextManagerAbsoluteAltimeter *)self shouldEnableWifiAtTime:a3])
  {
    value = self->_powerAssertionWifi.__ptr_.__value_;
    sub_100134750(__p, "Altimeter, power assertion Wifi");
    sub_100EBBFD8((uint64_t)value, (uint64_t *)__p);
    if (v20 < 0) {
      operator delete(__p[0]);
    }
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022FDD50);
    }
    uint64_t v6 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)uint64_t v24 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "subscribing to Wifi notifications %f", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022FDD50);
      }
      int v21 = 134217984;
      *(double *)uint64_t v22 = a3;
      double v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter forceLocationAtTime:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    [*((id *)self->_locationControllerClient.__ptr_.__value_ + 2) register:*((void *)self->_locationControllerClient.__ptr_.__value_ + 1) forNotification:1 registrationInfo:0];
    self->_lastForcedWifiTime = a3;
    self->_wifiInProgress = 1;
    [(CLContextManagerAbsoluteAltimeter *)self setTimerForWifiOff];
  }
  else if ([(CLContextManagerAbsoluteAltimeter *)self shouldEnableGPSAtTime:a3])
  {
    uint64_t v7 = self->_powerAssertionGPS.__ptr_.__value_;
    sub_100134750(v17, "Altimeter, power assertion GPS");
    sub_100EBBFD8((uint64_t)v7, (uint64_t *)v17);
    if (v18 < 0) {
      operator delete(v17[0]);
    }
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022FDD50);
    }
    double v8 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)uint64_t v24 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "subscribing to GPS notifications %f", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022FDD50);
      }
      int v21 = 134217984;
      *(double *)uint64_t v22 = a3;
      uint64_t v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter forceLocationAtTime:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
    [*((id *)self->_locationControllerClient.__ptr_.__value_ + 2) register:*((void *)self->_locationControllerClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
    self->_lastForcedGPSTime = a3;
    self->_GPSInProgress = 1;
    [(CLContextManagerAbsoluteAltimeter *)self setTimerForGPSOff];
    [(CLBarometerCalibrationContextClient *)self->super._delegate announceMostRecentForcedGPS:self->_lastForcedGPSTime];
  }
}

- (double)capAccuracy:(double)result
{
  if (result > 500.0) {
    return 500.0;
  }
  return result;
}

- (void)filteredElevation:(double *)a3 absAltUncertainty:(double *)a4 withTimestamp:(double *)a5
{
  *a3 = 1.79769313e308;
  *a5 = 1.79769313e308;
  *a4 = 1.79769313e308;
  sub_100096374((uint64_t)&v39, (void *)self->super.fDataBuffers + 30);
  double v8 = (double **)(*(void *)(v40 + (((v43 + v42 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                 + 16 * (v43 + v42 - 1));
  double v9 = *v8;
  double v10 = (std::__shared_weak_count *)v8[1];
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  double v11 = v9[2];
  double v12 = v9[3];
  double v13 = *v9;
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022FDD50);
  }
  BOOL v14 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    double v51 = v11;
    __int16 v52 = 2048;
    double v53 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "latest KF,pressure,%f,absAltUnc,%f", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022FDD50);
    }
    int v44 = 134218240;
    double v45 = v11;
    __int16 v46 = 2048;
    double v47 = v12;
    uint64_t v35 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter filteredElevation:absAltUncertainty:withTimestamp:]", "%s\n", v35);
    if (v35 != (char *)buf) {
      free(v35);
    }
  }
  if (v11 * 1000.0 >= 100.0 && v41 != v40)
  {
    BOOL v15 = (void *)(v40 + 8 * (v42 >> 8));
    uint64_t v16 = *v15 + 16 * v42;
    uint64_t v17 = *(void *)(v40 + (((v43 + v42) >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * (v43 + v42);
    if (v16 != v17)
    {
      uint64_t v37 = a4;
      int v18 = 0;
      double v19 = 0.0;
      double v20 = 0.0;
      double v21 = 0.0;
      do
      {
        uint64_t v22 = *(double **)v16;
        uint64_t v23 = *(std::__shared_weak_count **)(v16 + 8);
        if (v23) {
          atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        double v24 = v22[2] * 1000.0;
        if (v24 > 100.0)
        {
          double v25 = *v22;
          if (*v22 >= v13 + -1.0)
          {
            if (self->_useAOPAltimeter)
            {
              double v26 = v22[1];
            }
            else
            {
              float v27 = v24;
              double v26 = sub_1001C1F30(v27, 101320.0);
              double v25 = *v22;
            }
            double v19 = v19 + v26;
            double v21 = v21 + v25;
            double v20 = v20 + v22[3];
            ++v18;
          }
        }
        if (v23) {
          sub_1000DB0A0(v23);
        }
        v16 += 16;
        if (v16 - *v15 == 4096)
        {
          uint64_t v28 = v15[1];
          ++v15;
          uint64_t v16 = v28;
        }
      }
      while (v16 != v17);
      double v30 = a5;
      uint64_t v29 = v37;
      if (v18 >= 1 && v19 < 3.40282347e38)
      {
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022FDD50);
        }
        double v31 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218496;
          double v51 = v19 / (double)v18;
          __int16 v52 = 2048;
          double v53 = v21 / (double)v18;
          __int16 v54 = 2048;
          double v55 = v20 / (double)v18;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "average KF,elevation,%f,averageTimestamp,%f,aveAbsAltUnc,%f", buf, 0x20u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022FDD50);
          }
          double v32 = v19 / (double)v18;
          double v33 = v21 / (double)v18;
          int v44 = 134218496;
          double v45 = v32;
          __int16 v46 = 2048;
          double v47 = v33;
          double v34 = v20 / (double)v18;
          __int16 v48 = 2048;
          double v49 = v34;
          uint64_t v36 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter filteredElevation:absAltUncertainty:withTimestamp:]", "%s\n", v36);
          if (v36 != (char *)buf) {
            free(v36);
          }
          double v30 = a5;
          uint64_t v29 = v37;
        }
        else
        {
          double v32 = v19 / (double)v18;
          double v33 = v21 / (double)v18;
          double v34 = v20 / (double)v18;
        }
        *a3 = v32;
        double *v30 = v33;
        *uint64_t v29 = v34;
      }
    }
  }
  if (v10) {
    sub_1000DB0A0(v10);
  }
  sub_1000DAF68(&v39);
}

- (void)wetStateUpdated:(unint64_t)a3
{
  if (self->_currentWetState != a3)
  {
    self->_currentWetState = a3;
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022FDD50);
    }
    int v5 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v10 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "absolute altimeter wet state updated to %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022FDD50);
      }
      uint64_t v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter wetStateUpdated:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    if (a3 == 1)
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022FDD50);
      }
      uint64_t v6 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "absolute altimeter: watch wet, forcing location", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022FDD50);
        }
        double v8 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter wetStateUpdated:]", "%s\n", v8);
        if (v8 != (char *)buf) {
          free(v8);
        }
      }
      self->_lastForcedWifiTime = 1.79769313e308;
      self->_lastForcedGPSTime = 1.79769313e308;
      [(CLContextManagerAbsoluteAltimeter *)self forceLocationAtTime:CFAbsoluteTimeGetCurrent()];
    }
  }
}

- (void)calculateAndSendAltitudeFromBaro
{
  double Current = CFAbsoluteTimeGetCurrent();
  id v4 = [(CLBarometerCalibrationContextClient *)self->super._delegate copyCurrentBias];
  [v4 timestamp];
  if (vabdd_f64(Current, v5) > 900.0)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022FDD50);
    }
    uint64_t v6 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      [v4 timestamp];
      *(_DWORD *)buf = 134217984;
      double v115 = vabdd_f64(Current, v7);
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "bias age is %f", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022FDD50);
      }
      [v4 timestamp];
      int v102 = 134217984;
      double v103 = vabdd_f64(Current, v64);
      double v65 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromBaro]", "%s\n", v65);
      if (v65 != (char *)buf) {
        free(v65);
      }
    }
    [(CLContextManagerAbsoluteAltimeter *)self forceLocationAtTime:Current];
  }
  double v100 = 0.0;
  double v101 = 0.0;
  double v99 = 0.0;
  [(CLContextManagerAbsoluteAltimeter *)self filteredElevation:&v101 absAltUncertainty:&v100 withTimestamp:&v99];
  sub_100096374((uint64_t)v96, (void *)self->super.fDataBuffers + 6);
  double v8 = (double **)(*(void *)(v96[1] + (((unint64_t)(v98 + v97 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                 + 16 * (v98 + v97 - 1));
  int v10 = *v8;
  double v9 = (std::__shared_weak_count *)v8[1];
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  double v11 = v101;
  if (v101 == 1.79769313e308)
  {
    float v12 = v10[1] * 1000.0;
    float v13 = sub_1001C1F30(v12, 101320.0);
    [v4 biasInMeters];
    double v15 = v14;
    [v4 weatherEstimateInMeter];
    double v101 = v15 + v13 - v16;
    double v99 = *v10;
  }
  else
  {
    double v17 = 0.0;
    double v18 = v101;
    if (!self->_useAOPAltimeter)
    {
      [v4 biasInMeters:0.0, v101];
      double v20 = v19;
      [v4 weatherEstimateInMeter];
      double v17 = v20 - v21;
      double v18 = v101;
    }
    double v101 = v17 + v18;
  }
  uint64_t v22 = objc_opt_new();
  [(CLContextManagerAbsoluteAltimeter *)self capAccuracy:v100];
  double v95 = v23;
  if ([(CLBarometerCalibrationContextClient *)self->super._delegate inOutdoorWorkout]) {
    [(CLContextManagerAbsoluteAltimeter *)self chooseUncertaintyDuringWorkout:&v95 withAltitude:v101 atTime:v99];
  }
  unsigned __int8 v24 = [(CLBarometerCalibrationContextClient *)self->super._delegate isInVisit];
  if (v95 > 25.0) {
    unsigned __int8 v25 = v24;
  }
  else {
    unsigned __int8 v25 = 0;
  }
  if ((v25 & 1) != 0 || v95 == 500.0)
  {
    self->_uncalibratedState = 1;
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022FDD50);
    }
    uint64_t v28 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      double v115 = v101;
      __int16 v116 = 2048;
      double v117 = v95;
      __int16 v118 = 2048;
      double v119 = v99;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "switch to wet behavior due to large uncertainty,alt2,%f,alt2Unc,%f,timestamp,%f", buf, 0x20u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022FDD50);
      }
      int v102 = 134218496;
      double v103 = v101;
      __int16 v104 = 2048;
      double v105 = v95;
      __int16 v106 = 2048;
      double v107 = v99;
      uint64_t v29 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromBaro]", "%s\n", v29);
      if (v29 != (char *)buf) {
        free(v29);
      }
    }
  }
  else
  {
    self->_uncalibratedState = 0;
    [v22 setTimestamp:v99];
    [v22 setAltitude:v101];
    [v22 setAccuracy:v95];
    [v22 setPrecision:0.5];
    [v4 timestamp];
    if (v26 == 1.79769313e308) {
      uint64_t v27 = 1;
    }
    else {
      uint64_t v27 = (uint64_t)[v4 statusInfo];
    }
    [v22 setStatusInfo:v27];
    double lastAltitudeSentTimestamp = self->_lastAltitudeSentTimestamp;
    [v22 timestamp];
    if (lastAltitudeSentTimestamp != v31)
    {
      sub_100103240();
      char v32 = sub_10010145C();
      if (v11 == 1.79769313e308) {
        char v33 = v32;
      }
      else {
        char v33 = 0;
      }
      if ((v33 & 1) == 0) {
        [(CLBarometerCalibrationContextClient *)self->super._delegate absoluteAltitudeUpdate:v22];
      }
      [v22 timestamp];
      self->_double lastAltitudeSentTimestamp = v34;
      self->_unint64_t currentStatusInfo = (unint64_t)[v22 statusInfo];
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022FDD50);
      }
      uint64_t v35 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
      {
        [v22 altitude];
        double v37 = v36;
        [v22 altitude];
        double v39 = v38;
        [v4 weatherEstimateInMeter];
        double v41 = v40;
        [v4 weatherEstimateInMeter];
        double v42 = self->_lastAltitudeSentTimestamp;
        *(_DWORD *)buf = 134218752;
        double v115 = v37;
        __int16 v116 = 2048;
        double v117 = v39 + v41;
        __int16 v118 = 2048;
        double v119 = v43;
        __int16 v120 = 2048;
        *(double *)uint64_t v121 = v42;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "absolute altitude corrected %f, absolute altitude before correction %f, weather %f, timestamp %f", buf, 0x2Au);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022FDD50);
        }
        [v22 altitude];
        double v67 = v66;
        [v22 altitude];
        double v69 = v68;
        [v4 weatherEstimateInMeter];
        double v71 = v70;
        [v4 weatherEstimateInMeter];
        double v72 = self->_lastAltitudeSentTimestamp;
        int v102 = 134218752;
        double v103 = v67;
        __int16 v104 = 2048;
        double v105 = v69 + v71;
        __int16 v106 = 2048;
        double v107 = v73;
        __int16 v108 = 2048;
        *(double *)v109 = v72;
        uint64_t v74 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromBaro]", "%s\n", v74);
        if (v74 != (char *)buf) {
          free(v74);
        }
      }
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022FDD50);
      }
      int v44 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
      {
        [v22 altitude];
        double v46 = v45;
        [v22 accuracy];
        double v48 = v47;
        [v22 precision];
        double v50 = v49;
        unint64_t currentStatusInfo = self->_currentStatusInfo;
        double v52 = self->_lastAltitudeSentTimestamp;
        [v4 uncertaintyInMeters];
        *(_DWORD *)buf = 134219520;
        double v115 = v46;
        __int16 v116 = 2048;
        double v117 = v48;
        __int16 v118 = 2048;
        double v119 = v50;
        __int16 v120 = 1024;
        *(_DWORD *)uint64_t v121 = currentStatusInfo;
        *(_WORD *)&v121[4] = 1024;
        *(_DWORD *)&v121[6] = 0;
        __int16 v122 = 2048;
        double v123 = v52;
        __int16 v124 = 2048;
        uint64_t v125 = v53;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp, %f, bias uncertainty, %f", buf, 0x40u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022FDD50);
        }
        [v22 altitude];
        double v76 = v75;
        [v22 accuracy];
        double v78 = v77;
        [v22 precision];
        double v80 = v79;
        unint64_t v81 = self->_currentStatusInfo;
        double v82 = self->_lastAltitudeSentTimestamp;
        [v4 uncertaintyInMeters];
        int v102 = 134219520;
        double v103 = v76;
        __int16 v104 = 2048;
        double v105 = v78;
        __int16 v106 = 2048;
        double v107 = v80;
        __int16 v108 = 1024;
        *(_DWORD *)v109 = v81;
        *(_WORD *)&v109[4] = 1024;
        *(_DWORD *)&v109[6] = 0;
        __int16 v110 = 2048;
        double v111 = v82;
        __int16 v112 = 2048;
        uint64_t v113 = v83;
        double v84 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromBaro]", "%s\n", v84);
        if (v84 != (char *)buf) {
          free(v84);
        }
      }
      if (vabdd_f64(self->_lastDefaultLevelLogTimestamp, CFAbsoluteTimeGetCurrent()) > 30.0)
      {
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022FDD50);
        }
        __int16 v54 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
        {
          [v22 altitude];
          double v56 = v55;
          [v22 accuracy];
          double v58 = v57;
          [v22 precision];
          double v60 = v59;
          unint64_t v61 = self->_currentStatusInfo;
          double v62 = self->_lastAltitudeSentTimestamp;
          [v4 uncertaintyInMeters];
          *(_DWORD *)buf = 134219520;
          double v115 = v56;
          __int16 v116 = 2048;
          double v117 = v58;
          __int16 v118 = 2048;
          double v119 = v60;
          __int16 v120 = 1024;
          *(_DWORD *)uint64_t v121 = v61;
          *(_WORD *)&v121[4] = 1024;
          *(_DWORD *)&v121[6] = 0;
          __int16 v122 = 2048;
          double v123 = v62;
          __int16 v124 = 2048;
          uint64_t v125 = v63;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp, %f, bias uncertainty, %f", buf, 0x40u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022FDD50);
          }
          [v22 altitude];
          double v86 = v85;
          [v22 accuracy];
          double v88 = v87;
          [v22 precision];
          double v90 = v89;
          unint64_t v91 = self->_currentStatusInfo;
          double v92 = self->_lastAltitudeSentTimestamp;
          [v4 uncertaintyInMeters];
          int v102 = 134219520;
          double v103 = v86;
          __int16 v104 = 2048;
          double v105 = v88;
          __int16 v106 = 2048;
          double v107 = v90;
          __int16 v108 = 1024;
          *(_DWORD *)v109 = v91;
          *(_WORD *)&v109[4] = 1024;
          *(_DWORD *)&v109[6] = 0;
          __int16 v110 = 2048;
          double v111 = v92;
          __int16 v112 = 2048;
          uint64_t v113 = v93;
          uint64_t v94 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromBaro]", "%s\n", v94);
          if (v94 != (char *)buf) {
            free(v94);
          }
        }
        self->_lastDefaultLevelLogTimestamp = CFAbsoluteTimeGetCurrent();
      }
    }
  }

  if (v9) {
    sub_1000DB0A0(v9);
  }
  sub_1000DAF68(v96);
}

- (void)chooseUncertaintyDuringWorkout:(double *)a3 withAltitude:(double)a4 atTime:(double)a5
{
  double v9 = *a3;
  if (*a3 > 14.9) {
    double v9 = 14.9;
  }
  *a3 = v9;
  sub_100096374((uint64_t)v25, (void *)self->super.fDataBuffers);
  if (v27)
  {
    int v10 = (uint64_t *)(*(void *)(v25[1] + (((unint64_t)(v27 + v26 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                    + 16 * (v27 + v26 - 1));
    uint64_t v12 = *v10;
    double v11 = (std::__shared_weak_count *)v10[1];
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (*(double *)(v12 + 56) > 0.0 && *(_DWORD *)(v12 + 100) == 1 && vabdd_f64(a5, *(double *)v12) < 5.0)
    {
      uint64_t v13 = 24;
      if (*(double *)(v12 + 120) > 0.0) {
        uint64_t v13 = 112;
      }
      double v14 = *(double *)(v12 + v13);
      double v15 = vabdd_f64(a4, v14);
      if (v15 > 15.0)
      {
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022FDD50);
        }
        double v16 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = *(void *)(v12 + 48);
          double v18 = *(double *)v12;
          *(_DWORD *)buf = 136317954;
          double v53 = COERCE_DOUBLE("discrepancy");
          __int16 v54 = 2048;
          double v55 = v15;
          __int16 v56 = 2080;
          double v57 = "gpsAltitude";
          __int16 v58 = 2048;
          double v59 = v14;
          __int16 v60 = 2080;
          unint64_t v61 = "demAltitude";
          __int16 v62 = 2048;
          uint64_t v63 = v17;
          __int16 v64 = 2080;
          double v65 = "currentAbsoluteAltitude";
          __int16 v66 = 2048;
          double v67 = a4;
          __int16 v68 = 2080;
          double v69 = "pressureTimestamp";
          __int16 v70 = 2048;
          double v71 = a5;
          __int16 v72 = 2080;
          double v73 = "gpsTimestamp";
          __int16 v74 = 2048;
          double v75 = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "discrepancy between GPS and altitude in workout,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0x7Au);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022FDD50);
          }
          uint64_t v22 = *(void *)(v12 + 48);
          double v23 = *(double *)v12;
          int v28 = 136317954;
          double v29 = COERCE_DOUBLE("discrepancy");
          __int16 v30 = 2048;
          double v31 = v15;
          __int16 v32 = 2080;
          char v33 = "gpsAltitude";
          __int16 v34 = 2048;
          double v35 = v14;
          __int16 v36 = 2080;
          double v37 = "demAltitude";
          __int16 v38 = 2048;
          uint64_t v39 = v22;
          __int16 v40 = 2080;
          double v41 = "currentAbsoluteAltitude";
          __int16 v42 = 2048;
          double v43 = a4;
          __int16 v44 = 2080;
          double v45 = "pressureTimestamp";
          __int16 v46 = 2048;
          double v47 = a5;
          __int16 v48 = 2080;
          double v49 = "gpsTimestamp";
          __int16 v50 = 2048;
          double v51 = v23;
          unsigned __int8 v24 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter chooseUncertaintyDuringWorkout:withAltitude:atTime:]", "%s\n", v24);
          if (v24 != (char *)buf) {
            free(v24);
          }
        }
        [(CLContextManagerAbsoluteAltimeter *)self capAccuracy:v15];
        *(void *)a3 = v19;
      }
    }
    if (v11) {
      sub_1000DB0A0(v11);
    }
  }
  else
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022FDD50);
    }
    double v20 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      double v53 = a5;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "in outdoor workout: location buffer empty, pressure timestamp, %f", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022FDD50);
      }
      int v28 = 134217984;
      double v29 = a5;
      double v21 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter chooseUncertaintyDuringWorkout:withAltitude:atTime:]", "%s\n", v21);
      if (v21 != (char *)buf) {
        free(v21);
      }
    }
  }
  sub_1000DAF68(v25);
}

- (void)onCompanionConnectionNotification:(int)a3 data:(unsigned char *)a4
{
  if (a3 == 6)
  {
    *(unsigned char *)(a1 + 82) = *a4;
    int v5 = a4[16];
    *(unsigned char *)(a1 + 83) = v5;
    uint64_t v6 = *(void **)(a1 + 16);
    if (v5) {
      BOOL v7 = *(unsigned char *)(a1 + 82) == 0;
    }
    else {
      BOOL v7 = 1;
    }
    uint64_t v8 = !v7;
    [v6 updateCompanionConnected:v8];
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022FDD50);
    }
    double v9 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *(unsigned __int8 *)(a1 + 82);
      int v11 = *(unsigned __int8 *)(a1 + 83);
      *(_DWORD *)buf = 67109376;
      int v14 = v10;
      __int16 v15 = 1024;
      int v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "received phone connection updates, is phone connected %d, does phone have pressure sensor %d", buf, 0xEu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022FDD50);
      }
      uint64_t v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter onCompanionConnectionNotification:data:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
  }
}

- (void).cxx_destruct
{
  value = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  id v4 = self->_powerAssertionGPS.__ptr_.__value_;
  self->_powerAssertionGPS.__ptr_.__value_ = 0;
  if (v4) {
    (*(void (**)(CLPowerAssertion *, SEL))(*(void *)v4 + 8))(v4, a2);
  }
  int v5 = self->_powerAssertionWifi.__ptr_.__value_;
  self->_powerAssertionWifi.__ptr_.__value_ = 0;
  if (v5) {
    (*(void (**)(CLPowerAssertion *, SEL))(*(void *)v5 + 8))(v5, a2);
  }
  uint64_t v6 = self->_locationControllerClient.__ptr_.__value_;
  self->_locationControllerClient.__ptr_.__value_ = 0;
  if (v6)
  {
    BOOL v7 = *(void (**)(void))(*(void *)v6 + 8);
    v7();
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 16) = 0;
  return self;
}

@end