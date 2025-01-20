@interface CLContextManagerWaterSubmersion
+ (double)calculateDepthFromPressure:(double)a3 withSurfacePressure:(double)a4;
- (CLContextManagerWaterSubmersion)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6;
- (float)calculateFilterSurfaceCal:()deque<std:(std:(BOOL *)a4 :allocator<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>> *)a3 :shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData> withSuccess:;
- (id).cxx_construct;
- (void)clientConnected:(id)a3 withNotification:(unint64_t)a4;
- (void)dealloc;
- (void)forceGPSIfSurfaceCalStale;
- (void)onCharger:(BOOL)a3;
- (void)onEnableEasySubmersion:(BOOL)a3;
- (void)retrieveCachedSubmersionState;
- (void)retrieveCachedSurfacePressure;
- (void)saveCachedSurfacePressure:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationSurfaceCalData>)a3;
- (void)sendSurfacePressureToAOP:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationSurfaceCalData>)a3;
- (void)setTimerForGPSOff;
- (void)setUpGPSSubscriptionForSurfaceCal;
- (void)sourceUpdated:(unint64_t)a3;
- (void)updateSurfaceCalWithSource:(unint64_t)a3 andPressureQueue:()deque<std:(std::allocator<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>> *)a4 :shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>;
@end

@implementation CLContextManagerWaterSubmersion

- (CLContextManagerWaterSubmersion)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)CLContextManagerWaterSubmersion;
  v6 = [(CLContextManagerWaterSubmersionBase *)&v13 initWithUniverse:a3 delegate:a4 withBuffer:a5 withSourceAggregator:a6];
  if (v6)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    v7 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Water Submersion Context created", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      LOWORD(v12[0]) = 0;
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion initWithUniverse:delegate:withBuffer:withSourceAggregator:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    v6->_forcingGPS = 0;
    v12[0] = 1097859072;
    sub_101A22680(buf, "CalibrationTimeOffset", v12, 0);
    v6->_calibrationTimeOffset = v15;
    [(CLBarometerCalibrationSourceAggregator *)v6->super.super._sourceAggregator enableSources:&off_102397B90 forContext:v6];
    v6->_lastPressureTimestampSaved = 1.79769313e308;
    v6->_tempEstimator = objc_alloc_init(CLWaterTemperatureEstimator);
    [(CLContextManagerWaterSubmersion *)v6 retrieveCachedSurfacePressure];
    [(CLContextManagerWaterSubmersion *)v6 setUpGPSSubscriptionForSurfaceCal];
    [(CLContextManagerWaterSubmersion *)v6 forceGPSIfSurfaceCalStale];
    [(CLContextManagerWaterSubmersion *)v6 retrieveCachedSubmersionState];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)sub_100AD143C, @"com.apple.locationd.WaterSubmersion.EnableEasySubmersion", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v9, v6, (CFNotificationCallback)sub_100AD143C, @"com.apple.locationd.WaterSubmersion.DisableEasySubmersion", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v6;
}

- (void)dealloc
{
  self->_tempEstimator = 0;
  [(CLTimer *)self->_forceGPSTimer invalidate];

  self->_forceGPSTimer = 0;
  value = self->_powerAssertionGPS.__ptr_.__value_;
  if (*((int *)value + 2) <= 0)
  {
    self->_powerAssertionGPS.__ptr_.__value_ = 0;
  }
  else
  {
    sub_100EBC6AC((uint64_t)value);
    value = self->_powerAssertionGPS.__ptr_.__value_;
    self->_powerAssertionGPS.__ptr_.__value_ = 0;
    if (!value) {
      goto LABEL_6;
    }
  }
  (*(void (**)(CLPowerAssertion *))(*(void *)value + 8))(value);
LABEL_6:
  v4.receiver = self;
  v4.super_class = (Class)CLContextManagerWaterSubmersion;
  [(CLContextManagerWaterSubmersionBase *)&v4 dealloc];
}

- (void)clientConnected:(id)a3 withNotification:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CLContextManagerWaterSubmersion;
  -[CLContextManagerWaterSubmersionBase clientConnected:withNotification:](&v6, "clientConnected:withNotification:", a3);
  if (a4 == 3) {
    [(CLContextManagerWaterSubmersion *)self forceGPSIfSurfaceCalStale];
  }
}

- (void)setUpGPSSubscriptionForSurfaceCal
{
}

- (void)sourceUpdated:(unint64_t)a3
{
  p_fDataBuffers = &self->super.super.fDataBuffers;
  sub_100096374((uint64_t)v47, (void *)self->super.super.fDataBuffers + 6);
  sub_100096374((uint64_t)&v43, (void *)*p_fDataBuffers + 42);
  if (a3 != 5)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFBLL) != 0)
    {
      if (a3 == 7)
      {
        uint64_t v29 = *(void *)(v44 + (((unint64_t)(v46 + v45 - 1) >> 5) & 0x7FFFFFFFFFFFFF8));
        uint64_t v30 = (v46 + v45 - 1);
        long long v31 = *(_OWORD *)(v29 + 16 * v30);
        v7 = *(std::__shared_weak_count **)(v29 + 16 * v30 + 8);
        if (v7)
        {
          atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
          v35 = v7;
          atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        else
        {
          v35 = 0;
        }
        long long v32 = v31;
        uint64_t v34 = v31;
        [(CLContextManagerWaterSubmersion *)self saveCachedSurfacePressure:&v34];
        if (v35) {
          sub_1000DB0A0(v35);
        }
        long long v33 = v32;
        if (v7) {
          atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        [(CLContextManagerWaterSubmersion *)self sendSurfacePressureToAOP:&v33];
        if (*((void *)&v33 + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&v33 + 1));
        }
        goto LABEL_28;
      }
      if (a3 != 8) {
        goto LABEL_46;
      }
      sub_100096374((uint64_t)buf, (void *)self->super.super.fDataBuffers + 48);
      v16 = (uint64_t *)(*(void *)(v51 + (((unint64_t)(v53 + v52 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                      + 16 * (v53 + v52 - 1));
      uint64_t v17 = *v16;
      v18 = (std::__shared_weak_count *)v16[1];
      if (v18)
      {
        atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
        v37 = v18;
        atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      else
      {
        v37 = 0;
      }
      uint64_t v36 = v17;
      [(CLContextManagerWaterSubmersionBase *)self updateSubmersionStateFromAOPState:&v36];
      if (v37) {
        sub_1000DB0A0(v37);
      }
      if (v18) {
        sub_1000DB0A0(v18);
      }
      v19 = buf;
    }
    else
    {
      sub_100096374((uint64_t)v38, v47);
      [(CLContextManagerWaterSubmersion *)self updateSurfaceCalWithSource:a3 andPressureQueue:v38];
      v19 = v38;
    }
    sub_1000DAF68(v19);
    goto LABEL_46;
  }
  objc_super v6 = (uint64_t *)(*(void *)(v47[1] + (((unint64_t)(v49 + v48 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                 + 16 * (v49 + v48 - 1));
  uint64_t v8 = *v6;
  v7 = (std::__shared_weak_count *)v6[1];
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_100096374((uint64_t)v40, (void *)self->super.super.fDataBuffers + 30);
  v9 = (double **)(*(void *)(v40[1] + (((unint64_t)(v42 + v41 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                 + 16 * (v42 + v41 - 1));
  v11 = *v9;
  v10 = (std::__shared_weak_count *)v9[1];
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v46)
  {
    v12 = (uint64_t *)(*(void *)(v44 + (((unint64_t)(v46 + v45 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                    + 16 * (v46 + v45 - 1));
    uint64_t v14 = *v12;
    objc_super v13 = (std::__shared_weak_count *)v12[1];
    if (v13)
    {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
      double v15 = *(double *)(v14 + 8);
      sub_1000DB0A0(v13);
    }
    else
    {
      double v15 = *(double *)(v14 + 8);
    }
  }
  else
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    v20 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "no surface pressure available, using standard sea level", buf, 2u);
    }
    double v15 = 101.325;
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      LOWORD(v39[0]) = 0;
      v21 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion sourceUpdated:]", "%s\n", v21);
      if (v21 != (char *)buf) {
        free(v21);
      }
    }
  }
  tempEstimator = self->_tempEstimator;
  double v23 = *(double *)(v8 + 16);
  float v24 = *(double *)(v8 + 24);
  *(float *)buf = v24;
  float v25 = v23;
  v39[0] = v25;
  [(CLWaterTemperatureEstimator *)tempEstimator updateWithTDot:buf andTempMeasurement:v39];
  v26 = objc_alloc_init(CLWaterSubmersionMeasurement);
  [(CLWaterSubmersionMeasurement *)v26 setStartAt:*v11];
  [(CLWaterSubmersionMeasurement *)v26 setPressure:v11[2]];
  [(CLWaterSubmersionMeasurement *)v26 setSurfacePressure:v15];
  [(CLWaterTemperatureEstimator *)self->_tempEstimator waterTempEst];
  [(CLWaterSubmersionMeasurement *)v26 setTemperature:v27];
  [(CLWaterTemperatureEstimator *)self->_tempEstimator waterTempUncertainty];
  [(CLWaterSubmersionMeasurement *)v26 setTemperatureUncertainty:v28];
  [(id)objc_opt_class() calculateDepthFromPressure:v11[2] withSurfacePressure:v15];
  -[CLWaterSubmersionMeasurement setDepth:](v26, "setDepth:");
  [(CLWaterSubmersionMeasurement *)v26 setState:[(CLContextManagerWaterSubmersionBase *)self submersionState]];
  [(CLContextManagerWaterSubmersionBase *)self updateSubmersionStateFromMeasurement:v26];
  [(CLContextManagerWaterSubmersionBase *)self updateClientsSubmersionMeasurement:v26];

  if (v10) {
    sub_1000DB0A0(v10);
  }
  sub_1000DAF68(v40);
LABEL_28:
  if (v7) {
    sub_1000DB0A0(v7);
  }
LABEL_46:
  sub_1000DAF68(&v43);
  sub_1000DAF68(v47);
}

- (void)updateSurfaceCalWithSource:(unint64_t)a3 andPressureQueue:()deque<std:(std::allocator<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>> *)a4 :shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>
{
  if (a3 >= 0xA) {
    sub_10000EDDC("array::at");
  }
  sub_100096374((uint64_t)v47, (void *)self->super.super.fDataBuffers + 6 * a3);
  uint64_t v7 = *(void *)(v47[1] + (((unint64_t)(v49 + v48 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
     + 16 * (v49 + v48 - 1);
  v9 = *(double **)v7;
  uint64_t v8 = *(std::__shared_weak_count **)(v7 + 8);
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (a3)
  {
    if (a3 == 4)
    {
      *(double *)&v10 = COERCE_DOUBLE("companion update");
      int v11 = 2;
      *(double *)&v12 = COERCE_DOUBLE("companionTimestamp");
    }
    else
    {
      *(double *)&v12 = 0.0;
      *(double *)&v10 = 0.0;
      int v11 = 3;
    }
  }
  else
  {
    int v11 = 0;
    *(double *)&v10 = COERCE_DOUBLE("leeched location");
    *(double *)&v12 = COERCE_DOUBLE("locationTimestamp");
  }
  if (![(CLContextManagerWaterSubmersionBase *)self updatingSurfacePressure])
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    float v27 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      double v29 = *v9;
      *(_DWORD *)buf = 134349570;
      CFAbsoluteTime v63 = Current;
      __int16 v64 = 2082;
      CFAbsoluteTime v65 = *(double *)&v12;
      __int16 v66 = 2050;
      double v67 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "caching pressure,timestamp,%{public}f,pressureTimestamp,0,pressure,0,%{public}s,%{public}f", buf, 0x20u);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_38;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    CFAbsoluteTime v30 = CFAbsoluteTimeGetCurrent();
    double v31 = *v9;
    int v50 = 134349570;
    CFAbsoluteTime v51 = v30;
    __int16 v52 = 2082;
    CFAbsoluteTime v53 = *(double *)&v12;
    __int16 v54 = 2050;
    double v55 = v31;
    long long v32 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion updateSurfaceCalWithSource:andPressureQueue:]", "%s\n", v32);
LABEL_44:
    if (v32 != (char *)buf) {
      free(v32);
    }
    goto LABEL_38;
  }
  unint64_t value = a4->__size_.__value_;
  if (value)
  {
    uint64_t v14 = *(char **)((char *)a4->__map_.__begin_ + (((value + a4->__start_ - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
        + 16 * (value + LOBYTE(a4->__start_) - 1);
    double v15 = *(double **)v14;
    v16 = (std::__shared_weak_count *)*((void *)v14 + 1);
    if (v16) {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (vabdd_f64(*v9, *v15) < 310.0)
    {
      char v46 = 0;
      sub_100096374((uint64_t)v45, a4);
      [(CLContextManagerWaterSubmersion *)self calculateFilterSurfaceCal:v45 withSuccess:&v46];
      float v18 = v17;
      sub_1000DAF68(v45);
      if (v46)
      {
        v19 = (char *)operator new(0x30uLL);
        *((void *)v19 + 1) = 0;
        *((void *)v19 + 2) = 0;
        *(void *)v19 = off_1022DCB58;
        *(int64x2_t *)(v19 + 24) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        *((void *)v19 + 5) = 3;
        CFAbsoluteTime v20 = CFAbsoluteTimeGetCurrent();
        *((_DWORD *)v19 + 10) = v11;
        *((CFAbsoluteTime *)v19 + 3) = v20;
        *((double *)v19 + 4) = v18;
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
        }
        v21 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
        {
          CFAbsoluteTime v22 = CFAbsoluteTimeGetCurrent();
          double v23 = *((double *)v19 + 3);
          uint64_t v24 = *((void *)v19 + 4);
          uint64_t v25 = *(void *)v9;
          *(_DWORD *)buf = 136447490;
          CFAbsoluteTime v63 = *(double *)&v10;
          __int16 v64 = 2050;
          CFAbsoluteTime v65 = v22;
          __int16 v66 = 2050;
          double v67 = v23;
          __int16 v68 = 2050;
          uint64_t v69 = v24;
          __int16 v70 = 2082;
          v71 = v12;
          __int16 v72 = 2050;
          uint64_t v73 = v25;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "caching pressure on %{public}s,timestamp,%{public}f,pressureTimestamp,%{public}f,pressure,%{public}f,%{public}s,%{public}f", buf, 0x3Eu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
          }
          CFAbsoluteTime v38 = CFAbsoluteTimeGetCurrent();
          double v39 = *((double *)v19 + 3);
          uint64_t v40 = *((void *)v19 + 4);
          uint64_t v41 = *(void *)v9;
          int v50 = 136447490;
          CFAbsoluteTime v51 = *(double *)&v10;
          __int16 v52 = 2050;
          CFAbsoluteTime v53 = v38;
          __int16 v54 = 2050;
          double v55 = v39;
          __int16 v56 = 2050;
          uint64_t v57 = v40;
          __int16 v58 = 2082;
          v59 = v12;
          __int16 v60 = 2050;
          uint64_t v61 = v41;
          uint64_t v42 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion updateSurfaceCalWithSource:andPressureQueue:]", "%s\n", v42);
          if (v42 != (char *)buf) {
            free(v42);
          }
        }
        sourceAggregator = self->super.super._sourceAggregator;
        uint64_t v43 = v19 + 24;
        uint64_t v44 = (std::__shared_weak_count *)v19;
        atomic_fetch_add_explicit((atomic_ullong *volatile)v19 + 1, 1uLL, memory_order_relaxed);
        [(CLBarometerCalibrationSourceAggregator *)sourceAggregator didUpdateSource:7 withData:&v43];
        if (v44) {
          sub_1000DB0A0(v44);
        }
        sub_1000DB0A0((std::__shared_weak_count *)v19);
      }
    }
    if (v16) {
      sub_1000DB0A0(v16);
    }
    goto LABEL_38;
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
  }
  long long v33 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime v34 = CFAbsoluteTimeGetCurrent();
    double v35 = *v9;
    *(_DWORD *)buf = 134349570;
    CFAbsoluteTime v63 = v34;
    __int16 v64 = 2080;
    CFAbsoluteTime v65 = *(double *)&v12;
    __int16 v66 = 2050;
    double v67 = v35;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "pressure data not available,timestamp,%{public}f,%s,%{public}f", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    CFAbsoluteTime v36 = CFAbsoluteTimeGetCurrent();
    double v37 = *v9;
    int v50 = 134349570;
    CFAbsoluteTime v51 = v36;
    __int16 v52 = 2080;
    CFAbsoluteTime v53 = *(double *)&v12;
    __int16 v54 = 2050;
    double v55 = v37;
    long long v32 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion updateSurfaceCalWithSource:andPressureQueue:]", "%s\n", v32);
    goto LABEL_44;
  }
LABEL_38:
  if (v8) {
    sub_1000DB0A0(v8);
  }
  sub_1000DAF68(v47);
}

- (float)calculateFilterSurfaceCal:()deque<std:(std:(BOOL *)a4 :allocator<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>> *)a3 :shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData> withSuccess:
{
  __p = 0;
  v87 = 0;
  v88 = 0;
  memset(&v85, 0, sizeof(v85));
  unint64_t v6 = a3->__start_ + a3->__size_.__value_;
  begin = a3->__map_.__begin_;
  end = a3->__map_.__end_;
  v9 = &begin[v6 >> 8];
  if (end == begin) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = (uint64_t)*v9 + 16 * v6;
  }
  int v11 = 0;
  v12 = 0;
  unsigned int v13 = 0;
  while (1)
  {
    uint64_t v14 = end == begin
        ? 0
        : (uint64_t)(*(char **)((char *)begin + ((a3->__start_ >> 5) & 0x7FFFFFFFFFFFFF8))
                  + 16 * a3->__start_);
    if (v10 == v14 || v13 > 0x12B) {
      break;
    }
    uint64_t v15 = v10;
    if ((void *)v10 == *v9) {
      uint64_t v15 = (uint64_t)*(v9 - 1) + 4096;
    }
    float v17 = *(double **)(v15 - 16);
    v16 = *(std::__shared_weak_count **)(v15 - 8);
    if (v16) {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (vabdd_f64(CFAbsoluteTimeGetCurrent(), *v17) > 310.0 && v13 != 0)
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      uint64_t v43 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
      {
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        double v45 = *v17;
        *(_DWORD *)buf = 134218496;
        *(CFAbsoluteTime *)&uint8_t buf[4] = Current;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = 0x4073600000000000;
        *(_WORD *)&buf[22] = 2048;
        *(double *)v92 = v45;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "ignoring pressure older than max age,timestamp,%f,maxAge,%f,pressureSampleTimestamp,%f", buf, 0x20u);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_92;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      CFAbsoluteTime v46 = CFAbsoluteTimeGetCurrent();
      uint64_t v47 = *(void *)v17;
      LODWORD(v89.__r_.__value_.__l.__data_) = 134218496;
      *(CFAbsoluteTime *)((char *)v89.__r_.__value_.__r.__words + 4) = v46;
      WORD2(v89.__r_.__value_.__r.__words[1]) = 2048;
      *(std::string::size_type *)((char *)&v89.__r_.__value_.__r.__words[1] + 6) = 0x4073600000000000;
      HIWORD(v89.__r_.__value_.__r.__words[2]) = 2048;
      *(void *)v90 = v47;
      uint64_t v48 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion calculateFilterSurfaceCal:withSuccess:]", "%s\n", v48);
      if (v48 == buf) {
        goto LABEL_92;
      }
      goto LABEL_153;
    }
    if (self)
    {
      [(CLContextManagerWaterSubmersionBase *)self aopSubmersionState];
      if (*(unsigned char *)(*(void *)buf + 8) == 1)
      {
        double v19 = *v17;
        [(CLContextManagerWaterSubmersionBase *)self aopSubmersionState];
        BOOL v20 = v19 < *(double *)v89.__r_.__value_.__l.__data_ + self->_calibrationTimeOffset;
        if (v89.__r_.__value_.__l.__size_) {
          sub_1000DB0A0((std::__shared_weak_count *)v89.__r_.__value_.__l.__size_);
        }
      }
      else
      {
        BOOL v20 = 0;
      }
    }
    else
    {
      BOOL v20 = 0;
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
    }
    if (*(void *)&buf[8]) {
      sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
    }
    if (v20)
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      uint64_t v49 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        CFAbsoluteTime v50 = CFAbsoluteTimeGetCurrent();
        [(CLContextManagerWaterSubmersionBase *)self aopSubmersionState];
        uint64_t v51 = *(void *)v89.__r_.__value_.__l.__data_;
        double calibrationTimeOffset = self->_calibrationTimeOffset;
        double v53 = *v17;
        *(_DWORD *)buf = 134218752;
        *(CFAbsoluteTime *)&uint8_t buf[4] = v50;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v51;
        *(_WORD *)&buf[22] = 2048;
        *(double *)v92 = v53;
        *(_WORD *)&v92[8] = 2048;
        *(double *)&v92[10] = calibrationTimeOffset;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "ignoring pressure older than desubmersion,timestamp,%f,desubmersionTimestamp,%f,pressureSampleTimestamp,%f,offset,%f", buf, 0x2Au);
        if (v89.__r_.__value_.__l.__size_) {
          sub_1000DB0A0((std::__shared_weak_count *)v89.__r_.__value_.__l.__size_);
        }
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_92;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      CFAbsoluteTime v77 = CFAbsoluteTimeGetCurrent();
      [(CLContextManagerWaterSubmersionBase *)self aopSubmersionState];
      std::string::size_type v78 = *(void *)v84.__r_.__value_.__l.__data_;
      double v79 = self->_calibrationTimeOffset;
      double v80 = *v17;
      LODWORD(v89.__r_.__value_.__l.__data_) = 134218752;
      *(CFAbsoluteTime *)((char *)v89.__r_.__value_.__r.__words + 4) = v77;
      WORD2(v89.__r_.__value_.__r.__words[1]) = 2048;
      *(std::string::size_type *)((char *)&v89.__r_.__value_.__r.__words[1] + 6) = v78;
      HIWORD(v89.__r_.__value_.__r.__words[2]) = 2048;
      *(double *)v90 = v80;
      *(_WORD *)&v90[8] = 2048;
      *(double *)&v90[10] = v79;
      uint64_t v48 = (char *)_os_log_send_and_compose_impl();
      if (v84.__r_.__value_.__l.__size_) {
        sub_1000DB0A0((std::__shared_weak_count *)v84.__r_.__value_.__l.__size_);
      }
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion calculateFilterSurfaceCal:withSuccess:]", "%s\n", v48);
      if (v48 == buf) {
        goto LABEL_92;
      }
LABEL_153:
      free(v48);
LABEL_92:
      if (v16) {
        sub_1000DB0A0(v16);
      }
      break;
    }
    float v21 = v17[1];
    CFAbsoluteTime v22 = v87;
    if (v87 >= v88)
    {
      uint64_t v24 = (float *)__p;
      uint64_t v25 = ((char *)v87 - (unsigned char *)__p) >> 2;
      unint64_t v26 = v25 + 1;
      if ((unint64_t)(v25 + 1) >> 62) {
        sub_1001D7FD4();
      }
      uint64_t v27 = (char *)v88 - (unsigned char *)__p;
      if (((char *)v88 - (unsigned char *)__p) >> 1 > v26) {
        unint64_t v26 = v27 >> 1;
      }
      if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v28 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v28 = v26;
      }
      if (v28)
      {
        double v29 = (char *)sub_10017EA34((uint64_t)&v88, v28);
        uint64_t v24 = (float *)__p;
        CFAbsoluteTime v22 = v87;
      }
      else
      {
        double v29 = 0;
      }
      CFAbsoluteTime v30 = (float *)&v29[4 * v25];
      *CFAbsoluteTime v30 = v21;
      double v23 = v30 + 1;
      while (v22 != v24)
      {
        int v31 = *((_DWORD *)v22-- - 1);
        *((_DWORD *)v30-- - 1) = v31;
      }
      __p = v30;
      v87 = v23;
      v88 = (float *)&v29[4 * v28];
      if (v24) {
        operator delete(v24);
      }
    }
    else
    {
      float *v87 = v21;
      double v23 = v22 + 1;
    }
    v87 = v23;
    if (v13) {
      goto LABEL_66;
    }
    std::to_string(&v83, *v17);
    long long v32 = std::string::insert(&v83, 0, "firstTimestamp,");
    long long v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
    v84.__r_.__value_.__r.__words[2] = v32->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v84.__r_.__value_.__l.__data_ = v33;
    v32->__r_.__value_.__l.__size_ = 0;
    v32->__r_.__value_.__r.__words[2] = 0;
    v32->__r_.__value_.__r.__words[0] = 0;
    CFAbsoluteTime v34 = std::string::append(&v84, ",firstPressure,");
    long long v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
    v89.__r_.__value_.__r.__words[2] = v34->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v89.__r_.__value_.__l.__data_ = v35;
    v34->__r_.__value_.__l.__size_ = 0;
    v34->__r_.__value_.__r.__words[2] = 0;
    v34->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v82, v17[1]);
    if ((v82.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      CFAbsoluteTime v36 = &v82;
    }
    else {
      CFAbsoluteTime v36 = (std::string *)v82.__r_.__value_.__r.__words[0];
    }
    if ((v82.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v82.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v82.__r_.__value_.__l.__size_;
    }
    CFAbsoluteTime v38 = std::string::append(&v89, (const std::string::value_type *)v36, size);
    long long v39 = *(_OWORD *)&v38->__r_.__value_.__l.__data_;
    *(void *)&buf[16] = *((void *)&v38->__r_.__value_.__l + 2);
    *(_OWORD *)buf = v39;
    v38->__r_.__value_.__l.__size_ = 0;
    v38->__r_.__value_.__r.__words[2] = 0;
    v38->__r_.__value_.__r.__words[0] = 0;
    if (buf[23] >= 0) {
      uint64_t v40 = buf;
    }
    else {
      uint64_t v40 = *(const std::string::value_type **)buf;
    }
    if (buf[23] >= 0) {
      std::string::size_type v41 = buf[23];
    }
    else {
      std::string::size_type v41 = *(void *)&buf[8];
    }
    std::string::append(&v85, v40, v41);
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    if (SHIBYTE(v82.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v82.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v89.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v89.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v84.__r_.__value_.__l.__data_);
    }
    if ((SHIBYTE(v83.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_66:
      if (!v16) {
        goto LABEL_68;
      }
LABEL_67:
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
      goto LABEL_68;
    }
    operator delete(v83.__r_.__value_.__l.__data_);
    if (v16) {
      goto LABEL_67;
    }
LABEL_68:
    if (v11) {
      sub_1000DB0A0(v11);
    }
    if (v16) {
      sub_1000DB0A0(v16);
    }
    if ((void *)v10 == *v9)
    {
      uint64_t v42 = (uint64_t)*--v9;
      uint64_t v10 = v42 + 4096;
    }
    v10 -= 16;
    ++v13;
    begin = a3->__map_.__begin_;
    end = a3->__map_.__end_;
    int v11 = v16;
    v12 = v17;
  }
  if (v13 > 9)
  {
    std::to_string(&v83, *v12);
    __int16 v58 = std::string::insert(&v83, 0, ",lastTimestamp,");
    long long v59 = *(_OWORD *)&v58->__r_.__value_.__l.__data_;
    v84.__r_.__value_.__r.__words[2] = v58->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v84.__r_.__value_.__l.__data_ = v59;
    v58->__r_.__value_.__l.__size_ = 0;
    v58->__r_.__value_.__r.__words[2] = 0;
    v58->__r_.__value_.__r.__words[0] = 0;
    __int16 v60 = std::string::append(&v84, ",lastPressure,");
    long long v61 = *(_OWORD *)&v60->__r_.__value_.__l.__data_;
    v89.__r_.__value_.__r.__words[2] = v60->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v89.__r_.__value_.__l.__data_ = v61;
    v60->__r_.__value_.__l.__size_ = 0;
    v60->__r_.__value_.__r.__words[2] = 0;
    v60->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v82, v12[1]);
    if ((v82.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v62 = &v82;
    }
    else {
      v62 = (std::string *)v82.__r_.__value_.__r.__words[0];
    }
    if ((v82.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v63 = HIBYTE(v82.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v63 = v82.__r_.__value_.__l.__size_;
    }
    __int16 v64 = std::string::append(&v89, (const std::string::value_type *)v62, v63);
    long long v65 = *(_OWORD *)&v64->__r_.__value_.__l.__data_;
    *(void *)&buf[16] = *((void *)&v64->__r_.__value_.__l + 2);
    *(_OWORD *)buf = v65;
    v64->__r_.__value_.__l.__size_ = 0;
    v64->__r_.__value_.__r.__words[2] = 0;
    v64->__r_.__value_.__r.__words[0] = 0;
    if (buf[23] >= 0) {
      __int16 v66 = buf;
    }
    else {
      __int16 v66 = *(const std::string::value_type **)buf;
    }
    if (buf[23] >= 0) {
      std::string::size_type v67 = buf[23];
    }
    else {
      std::string::size_type v67 = *(void *)&buf[8];
    }
    std::string::append(&v85, v66, v67);
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    if (SHIBYTE(v82.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v82.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v89.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v89.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v84.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v83.__r_.__value_.__l.__data_);
    }
    float v56 = sub_100AD3568((uint64_t)&__p, 10);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    __int16 v68 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      double v69 = CFAbsoluteTimeGetCurrent();
      __int16 v70 = &v85;
      if ((v85.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        __int16 v70 = (std::string *)v85.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)buf = 134349826;
      *(double *)&uint8_t buf[4] = v69;
      *(_WORD *)&buf[12] = 2050;
      *(double *)&buf[14] = v56;
      *(_WORD *)&buf[22] = 1026;
      *(_DWORD *)v92 = v13;
      *(_WORD *)&v92[4] = 2080;
      *(void *)&v92[6] = v70;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "filtering surface calibration,timestamp,%{public}f,filteredValue,%{public}f,numCalibrations,%{public}d,%s", buf, 0x26u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      double v74 = CFAbsoluteTimeGetCurrent();
      v75 = &v85;
      if ((v85.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        v75 = (std::string *)v85.__r_.__value_.__r.__words[0];
      }
      LODWORD(v89.__r_.__value_.__l.__data_) = 134349826;
      *(double *)((char *)v89.__r_.__value_.__r.__words + 4) = v74;
      WORD2(v89.__r_.__value_.__r.__words[1]) = 2050;
      *(double *)((char *)&v89.__r_.__value_.__r.__words[1] + 6) = v56;
      HIWORD(v89.__r_.__value_.__r.__words[2]) = 1026;
      *(_DWORD *)v90 = v13;
      *(_WORD *)&v90[4] = 2080;
      *(void *)&v90[6] = v75;
      v76 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion calculateFilterSurfaceCal:withSuccess:]", "%s\n", v76);
      if (v76 != buf) {
        free(v76);
      }
    }
    BOOL v57 = 1;
  }
  else
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    __int16 v54 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      CFAbsoluteTime v55 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134349568;
      *(CFAbsoluteTime *)&uint8_t buf[4] = v55;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = v13;
      *(_WORD *)&buf[18] = 1026;
      *(_DWORD *)&buf[20] = 10;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "too few pressure samples to filter not updating surface cal,timestamp,%{public}f,numSamples,%{public}d,needed,%{public}d", buf, 0x18u);
    }
    float v56 = -1.0;
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      CFAbsoluteTime v72 = CFAbsoluteTimeGetCurrent();
      LODWORD(v89.__r_.__value_.__l.__data_) = 134349568;
      *(CFAbsoluteTime *)((char *)v89.__r_.__value_.__r.__words + 4) = v72;
      WORD2(v89.__r_.__value_.__r.__words[1]) = 1026;
      *(_DWORD *)((char *)&v89.__r_.__value_.__r.__words[1] + 6) = v13;
      WORD1(v89.__r_.__value_.__r.__words[2]) = 1026;
      HIDWORD(v89.__r_.__value_.__r.__words[2]) = 10;
      uint64_t v73 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion calculateFilterSurfaceCal:withSuccess:]", "%s\n", v73);
      if (v73 != buf) {
        free(v73);
      }
    }
    BOOL v57 = 0;
  }
  *a4 = v57;
  if (v11) {
    sub_1000DB0A0(v11);
  }
  if (SHIBYTE(v85.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v85.__r_.__value_.__l.__data_);
  }
  if (__p)
  {
    v87 = (float *)__p;
    operator delete(__p);
  }
  return v56;
}

- (void)sendSurfacePressureToAOP:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationSurfaceCalData>)a3
{
  double v3 = *(double *)(*(void *)&a3.var0->fTimestamp + 8);
  float v4 = **(double **)&a3.var0->fTimestamp;
  double v7 = v4;
  float v5 = v3;
  float v8 = v5;
  uint64_t v6 = sub_1000D2E34(0);
  (*(void (**)(uint64_t, double *))(*(void *)(v6 + 112) + 24))(v6 + 112, &v7);
}

- (void)forceGPSIfSurfaceCalStale
{
  LODWORD(v26[0]) = 1155596288;
  sub_101A22680(buf, "SurfaceCalStaleTime", v26, 0);
  float v3 = *(float *)&v36;
  if ([(CLContextManagerWaterSubmersionBase *)self updatingSurfacePressure]
    && !self->_forcingGPS)
  {
    sub_100096374((uint64_t)v26, (void *)self->super.super.fDataBuffers + 42);
    if (v28)
    {
      uint64_t v4 = *(void *)(v26[1] + (((unint64_t)(v28 + v27 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
         + 16 * (v28 + v27 - 1);
      uint64_t v6 = *(double **)v4;
      float v5 = *(std::__shared_weak_count **)(v4 + 8);
      if (v5) {
        atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      double Current = CFAbsoluteTimeGetCurrent();
      double v8 = v3;
      double v9 = vabdd_f64(Current, *v6);
      if (v9 > v8)
      {
        self->_forcingGPS = 1;
        unint64_t value = self->_powerAssertionGPS.__ptr_.__value_;
        sub_100134750(__p, "Altimeter, surface calibration power assertion GPS");
        sub_100EBBFD8((uint64_t)value, (uint64_t *)__p);
        if (v25 < 0) {
          operator delete(__p[0]);
        }
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
        }
        int v11 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
        {
          double v12 = *v6;
          CFAbsoluteTime v13 = CFAbsoluteTimeGetCurrent();
          *(_DWORD *)buf = 134218496;
          CFAbsoluteTime v36 = v12;
          __int16 v37 = 2048;
          double v38 = v9;
          __int16 v39 = 2048;
          CFAbsoluteTime v40 = v13;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "surface calibration stale, subscribing to GPS notifications,surfaceCalTimestamp,%f,timeDiff,%f,now,%f", buf, 0x20u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
          }
          double v19 = *v6;
          CFAbsoluteTime v20 = CFAbsoluteTimeGetCurrent();
          int v29 = 134218496;
          CFAbsoluteTime v30 = v19;
          __int16 v31 = 2048;
          double v32 = v9;
          __int16 v33 = 2048;
          CFAbsoluteTime v34 = v20;
          float v21 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion forceGPSIfSurfaceCalStale]", "%s\n", v21);
          if (v21 != (char *)buf) {
            free(v21);
          }
        }
        [*((id *)self->_locationControllerClient.__ptr_.__value_ + 2) register:*((void *)self->_locationControllerClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
        [(CLContextManagerWaterSubmersion *)self setTimerForGPSOff];
      }
      if (v5) {
        sub_1000DB0A0(v5);
      }
    }
    else
    {
      self->_forcingGPS = 1;
      uint64_t v14 = self->_powerAssertionGPS.__ptr_.__value_;
      sub_100134750(v22, "Altimeter, surface calibration power assertion GPS");
      sub_100EBBFD8((uint64_t)v14, (uint64_t *)v22);
      if (v23 < 0) {
        operator delete(v22[0]);
      }
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      uint64_t v15 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        CFAbsoluteTime v16 = CFAbsoluteTimeGetCurrent();
        *(_DWORD *)buf = 134217984;
        CFAbsoluteTime v36 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "no saved surface calibration, subscribing to GPS notifications %f", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
        }
        CFAbsoluteTime v17 = CFAbsoluteTimeGetCurrent();
        int v29 = 134217984;
        CFAbsoluteTime v30 = v17;
        float v18 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion forceGPSIfSurfaceCalStale]", "%s\n", v18);
        if (v18 != (char *)buf) {
          free(v18);
        }
      }
      [*((id *)self->_locationControllerClient.__ptr_.__value_ + 2) register:*((void *)self->_locationControllerClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
      [(CLContextManagerWaterSubmersion *)self setTimerForGPSOff];
    }
    sub_1000DAF68(v26);
  }
}

- (void)setTimerForGPSOff
{
}

- (void)saveCachedSurfacePressure:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationSurfaceCalData>)a3
{
  var0 = (const void **)a3.var0;
  uint64_t v5 = sub_1000A6958();
  sub_10016332C(v5, "CLWaterSubmersion_SurfacePressureTimestamp", *var0);
  uint64_t v6 = sub_1000A6958();
  sub_10016332C(v6, "CLWaterSubmersion_SurfacePressure", (char *)*var0 + 8);
  uint64_t v7 = sub_1000A6958();
  *(_DWORD *)buf = *((_DWORD *)*var0 + 4);
  sub_1000EA838(v7, "CLWaterSubmersion_SurfacePressureSource", buf);
  uint64_t v8 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v8 + 944))();
  self->_double lastPressureTimestampSaved = *(double *)*var0;
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
  }
  double v9 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    double lastPressureTimestampSaved = self->_lastPressureTimestampSaved;
    uint64_t v11 = *((void *)*var0 + 1);
    *(_DWORD *)buf = 134349312;
    double v14 = lastPressureTimestampSaved;
    __int16 v15 = 2050;
    uint64_t v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "saved surface calibration pressure,timestamp,%{public}f,pressure,%{public}f", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    double v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion saveCachedSurfacePressure:]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
}

- (void)retrieveCachedSurfacePressure
{
  uint64_t v17 = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v18 = 0x7FEFFFFFFFFFFFFFLL;
  int v16 = 3;
  uint64_t v3 = sub_1000A6958();
  sub_1000A699C(v3, "CLWaterSubmersion_SurfacePressureTimestamp", &v18);
  uint64_t v4 = sub_1000A6958();
  sub_1000A699C(v4, "CLWaterSubmersion_SurfacePressure", &v17);
  uint64_t v5 = sub_1000A6958();
  sub_10006EF84(v5, "CLWaterSubmersion_SurfacePressureSource", &v16);
  uint64_t v6 = (std::__shared_weak_count *)operator new(0x30uLL);
  v6->__shared_owners_ = 0;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)off_1022DCB58;
  v6[1].__vftable = (std::__shared_weak_count_vtbl *)v18;
  v6[1].__shared_weak_owners_ = 3;
  LODWORD(v6[1].__shared_weak_owners_) = v16;
  v6[1].__shared_owners_ = v17;
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
  }
  uint64_t v7 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134349824;
    CFAbsoluteTime v28 = Current;
    __int16 v29 = 2050;
    uint64_t v30 = v18;
    __int16 v31 = 2050;
    uint64_t v32 = v17;
    __int16 v33 = 1026;
    int v34 = v16;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "recovering surface pressure on locationd start,timestamp,%{public}f,recoveredTimestamp,%{public}f,surface pressure,%{public}f,calibration source,%{public}d", buf, 0x26u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    CFAbsoluteTime v10 = CFAbsoluteTimeGetCurrent();
    int v19 = 134349824;
    CFAbsoluteTime v20 = v10;
    __int16 v21 = 2050;
    uint64_t v22 = v18;
    __int16 v23 = 2050;
    uint64_t v24 = v17;
    __int16 v25 = 1026;
    int v26 = v16;
    uint64_t v11 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion retrieveCachedSurfacePressure]", "%s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  double v14 = v6 + 1;
  __int16 v15 = v6;
  atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  [(CLContextManagerWaterSubmersion *)self sendSurfacePressureToAOP:&v14];
  if (v15) {
    sub_1000DB0A0(v15);
  }
  sourceAggregator = self->super.super._sourceAggregator;
  double v12 = v6 + 1;
  CFAbsoluteTime v13 = v6;
  atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  [(CLBarometerCalibrationSourceAggregator *)sourceAggregator didUpdateSource:7 withData:&v12];
  if (v13) {
    sub_1000DB0A0(v13);
  }
  sub_1000DB0A0(v6);
}

- (void)retrieveCachedSubmersionState
{
  v6.receiver = self;
  v6.super_class = (Class)CLContextManagerWaterSubmersion;
  [(CLContextManagerWaterSubmersionBase *)&v6 retrieveCachedSubmersionState];
  [(CLContextManagerWaterSubmersionBase *)self aopSubmersionState];
  [(CLContextManagerWaterSubmersionBase *)self aopSubmersionState];
  if (v4) {
    sub_1000DB0A0(v4);
  }
  if (v5) {
    sub_1000DB0A0(v5);
  }
  uint64_t v3 = sub_1000D2E34(0);
  (*(void (**)(void))(*(void *)(v3 + 112) + 32))();
}

- (void)onCharger:(BOOL)a3
{
  if (a3)
  {
    CFAbsoluteTimeGetCurrent();
    uint64_t v3 = sub_1000D2E34(0);
    (*(void (**)(void))(*(void *)(v3 + 112) + 32))();
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    uint64_t v4 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134217984;
      CFAbsoluteTime v8 = Current;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "detected on charger, sending state to AOP, %f", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
      }
      CFAbsoluteTimeGetCurrent();
      objc_super v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion onCharger:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
}

- (void)onEnableEasySubmersion:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
  }
  uint64_t v4 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "received easy submersion notification, sending easy submersion update to AOP,timestamp,%f,enableState,%d", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DCAD8);
    }
    CFAbsoluteTimeGetCurrent();
    objc_super v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion onEnableEasySubmersion:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  uint64_t v5 = sub_1000D2E34(0);
  (*(void (**)(void))(*(void *)(v5 + 112) + 40))();
}

+ (double)calculateDepthFromPressure:(double)a3 withSurfacePressure:(double)a4
{
  return (a3 - a4) * 1000.0 / 10002.7832;
}

- (void).cxx_destruct
{
  unint64_t value = self->_locationControllerClient.__ptr_.__value_;
  self->_locationControllerClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  uint64_t v4 = self->_powerAssertionGPS.__ptr_.__value_;
  self->_powerAssertionGPS.__ptr_.__value_ = 0;
  if (v4)
  {
    uint64_t v5 = *(void (**)(void))(*(void *)v4 + 8);
    v5();
  }
}

- (id).cxx_construct
{
  *((void *)self + 23) = 0;
  *((void *)self + 24) = 0;
  return self;
}

@end