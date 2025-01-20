@interface CLCompanionRelativeElevationService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)valid;
- (CLCompanionRelativeElevationService)init;
- (NSMutableSet)clients;
- (id).cxx_construct;
- (void)beginService;
- (void)calculateRelativeElevation;
- (void)endService;
- (void)logToCA;
- (void)onCompanionNotification:(int)a3 data:(NotificationData *)a4;
- (void)onKFFilteredPressure:(const CMKFFilteredPressureSample *)a3;
- (void)onMotionActivityNotification:(int)a3 data:(NotificationData *)a4;
- (void)registerForAlgorithmSources;
- (void)registerForUpdates:(id)a3;
- (void)rotateCADaily;
- (void)rotateCAHourly;
- (void)setClients:(id)a3;
- (void)setValid:(BOOL)a3;
- (void)unregisterForAlgorithmSources;
- (void)unregisterForUpdates:(id)a3;
- (void)updateRelativePressureCalibration;
@end

@implementation CLCompanionRelativeElevationService

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
  if (qword_10247AE08 != -1) {
    dispatch_once(&qword_10247AE08, &stru_1022B6B28);
  }
  return (id)qword_10247AE00;
}

- (CLCompanionRelativeElevationService)init
{
  v10.receiver = self;
  v10.super_class = (Class)CLCompanionRelativeElevationService;
  v2 = [(CLCompanionRelativeElevationService *)&v10 initWithInboundProtocol:&OBJC_PROTOCOL___CLCompanionRelativeElevationServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLCompanionRelativeElevationClientProtocol];
  v3 = v2;
  if (v2)
  {
    v2->_clients = 0;
    value = v2->fCompanionClient.__ptr_.__value_;
    v3->fCompanionClient.__ptr_.__value_ = 0;
    if (value) {
      (*(void (**)(Client *))(*(void *)value + 8))(value);
    }
    unint64_t v5 = v3->fMotionActivityClient.__ptr_.__value_;
    v3->fMotionActivityClient.__ptr_.__value_ = 0;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8))(v5);
    }
    v6 = v3->fMotionStateCoprocessorDispatcher.__ptr_.__value_;
    v3->fMotionStateCoprocessorDispatcher.__ptr_.__value_ = 0;
    if (v6) {
      (*(void (**)(Dispatcher *))(*(void *)v6 + 8))(v6);
    }
    v7 = v3->fPressureBiasEstimateStat.__ptr_.__value_;
    v3->fPressureBiasEstimateStat.__ptr_.__value_ = 0;
    if (v7) {
      operator delete();
    }
    *(_OWORD *)&v3->fCurrentCalibrationEntry.companionPressure = 0u;
    *(_OWORD *)&v3->fCurrentCalibrationEntry.companionPressureUncertainty = 0u;
    *(_OWORD *)&v3->fCurrentCalibrationEntry.watchPressureTimestamp = 0u;
    *(_OWORD *)&v3->fCurrentCalibrationEntry.motionState = 0u;
    *(_OWORD *)&v3->fCurrentCalibrationEntry.isNearby = 0u;
    *(_OWORD *)&v3->fCurrentCalibrationEntry.isConnected = 0u;
    *(_OWORD *)&v3->fCurrentCalibrationEntry.pressureBiasMeasurement = 0u;
    *(_OWORD *)&v3->fCurrentCalibrationEntry.deltaPressure = 0u;
    *(_OWORD *)&v3->fCurrentCalibrationEntry.btRssi = 0u;
    uint64_t v8 = (uint64_t)v3->fCalibrationTable.__ptr_.__value_;
    v3->fCalibrationTable.__ptr_.__value_ = 0;
    if (v8) {
      sub_1004DAEB0((uint64_t)&v3->fCalibrationTable, v8);
    }
    v3->fHourlyTimer = 0;
    v3->fDailyTimer = 0;
  }
  return v3;
}

+ (BOOL)isSupported
{
  return 1;
}

- (void)beginService
{
  [(CLCompanionRelativeElevationService *)self silo];
  if (qword_102419210 != -1) {
    dispatch_once(&qword_102419210, &stru_1022B6B68);
  }
  v3 = qword_102419218;
  if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[CLCompanionRelativeElevation] Starting service", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022B6B68);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionRelativeElevationService beginService]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLCompanionRelativeElevationService *)self setClients:+[NSMutableSet set]];
  [(CLCompanionRelativeElevationService *)self registerForAlgorithmSources];
  operator new();
}

- (void)endService
{
  [(CLCompanionRelativeElevationService *)self silo];
  if (qword_102419210 != -1) {
    dispatch_once(&qword_102419210, &stru_1022B6B68);
  }
  v3 = qword_102419218;
  if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[CLCompanionRelativeElevation] Ending service", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022B6B68);
    }
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionRelativeElevationService endService]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  fHourlyTimer = self->fHourlyTimer;
  if (fHourlyTimer)
  {
    [(NSTimer *)fHourlyTimer invalidate];
    self->fHourlyTimer = 0;
  }
  fDailyTimer = self->fDailyTimer;
  if (fDailyTimer)
  {
    [(NSTimer *)fDailyTimer invalidate];
    self->fDailyTimer = 0;
  }
  p_fCalibrationTable = &self->fCalibrationTable;
  value = self->fCalibrationTable.__ptr_.__value_;
  if (value)
  {
    p_fCalibrationTable->__ptr_.__value_ = 0;
    sub_1004DAEB0((uint64_t)p_fCalibrationTable, (uint64_t)value);
  }
  [(CLCompanionRelativeElevationService *)self unregisterForAlgorithmSources];
  [(CLCompanionRelativeElevationService *)self setClients:0];
}

- (void)registerForAlgorithmSources
{
}

- (void)unregisterForAlgorithmSources
{
  value = self->fCompanionClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:12];
    [*((id *)self->fCompanionClient.__ptr_.__value_ + 2) unregister:*((void *)self->fCompanionClient.__ptr_.__value_ + 1) forNotification:13];
  }
  v4 = self->fMotionActivityClient.__ptr_.__value_;
  if (v4) {
    [*((id *)v4 + 2) unregister:*((void *)v4 + 1) forNotification:1];
  }
  if (self->fMotionStateCoprocessorDispatcher.__ptr_.__value_)
  {
    uint64_t v5 = sub_1000D2E34(0);
    sub_1009D26C4(v5, 30, (uint64_t)self->fMotionStateCoprocessorDispatcher.__ptr_.__value_);
    uint64_t v6 = sub_1000D2E34(0);
    sub_1009D26C4(v6, 0, (uint64_t)self->fMotionStateCoprocessorDispatcher.__ptr_.__value_);
    v7 = self->fMotionStateCoprocessorDispatcher.__ptr_.__value_;
    self->fMotionStateCoprocessorDispatcher.__ptr_.__value_ = 0;
    if (v7) {
      (*(void (**)(Dispatcher *))(*(void *)v7 + 8))(v7);
    }
  }
  if (self->fPressureBiasEstimateStat.__ptr_.__value_)
  {
    self->fPressureBiasEstimateStat.__ptr_.__value_ = 0;
    operator delete();
  }
}

- (void)registerForUpdates:(id)a3
{
  [(NSMutableSet *)[(CLCompanionRelativeElevationService *)self clients] addObject:a3];
  if (qword_102419210 != -1) {
    dispatch_once(&qword_102419210, &stru_1022B6B68);
  }
  v3 = qword_102419218;
  if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[CLCompanionRelativeElevation] Client registerForUpdates", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022B6B68);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionRelativeElevationService registerForUpdates:]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

- (void)unregisterForUpdates:(id)a3
{
  v4 = [(CLCompanionRelativeElevationService *)self clients];

  [(NSMutableSet *)v4 removeObject:a3];
}

- (void)updateRelativePressureCalibration
{
  if (self->fPressureBiasEstimateStat.__ptr_.__value_)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v4 = vabdd_f64(Current, self->fCurrentCalibrationEntry.nearbyTimestamp);
    double companionPressure = self->fCurrentCalibrationEntry.companionPressure;
    double v6 = vabdd_f64(Current, self->fCurrentCalibrationEntry.companionPressureTimestamp);
    double watchPressure = self->fCurrentCalibrationEntry.watchPressure;
    double v8 = vabdd_f64(Current, self->fCurrentCalibrationEntry.watchPressureTimestamp);
    int isNearby = self->fCurrentCalibrationEntry.isNearby;
    double v10 = *(double *)&qword_10247ADF0;
    double v11 = vabdd_f64(companionPressure, watchPressure);
    if (isNearby) {
      BOOL v12 = v6 < *(double *)&qword_10247ADF0;
    }
    else {
      BOOL v12 = 0;
    }
    BOOL v13 = v12 && v8 < *(double *)&qword_10247ADF0;
    if (v13 && v11 < 1000.0)
    {
      self->fCurrentCalibrationEntry.double pressureBiasMeasurement = companionPressure - watchPressure;
      sub_1004D90CC((uint64_t)self->fPressureBiasEstimateStat.__ptr_.__value_, companionPressure - watchPressure);
      value = self->fPressureBiasEstimateStat.__ptr_.__value_;
      if (*(_DWORD *)value < 1) {
        double v15 = 0.0;
      }
      else {
        double v15 = *((double *)value + 2);
      }
      self->fCurrentCalibrationEntry.double pressureBiasEstimate = v15;
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_10247AE18, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_10247AE18))
      {
        qword_10247AE10 = CFAbsoluteTimeGetCurrent();
        __cxa_guard_release(&qword_10247AE18);
      }
      CFAbsoluteTime v22 = CFAbsoluteTimeGetCurrent();
      self->fCurrentCalibrationEntry.timeSinceLastCalibration = CFAbsoluteTimeGetCurrent() - *(double *)&qword_10247AE10;
      qword_10247AE10 = *(void *)&v22;
      if (qword_102419210 != -1) {
        dispatch_once(&qword_102419210, &stru_1022B6B68);
      }
      uint64_t v23 = qword_102419218;
      if (!os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_INFO)) {
        goto LABEL_33;
      }
      double v24 = self->fCurrentCalibrationEntry.watchPressure;
      double v25 = self->fCurrentCalibrationEntry.companionPressure;
      double pressureBiasMeasurement = self->fCurrentCalibrationEntry.pressureBiasMeasurement;
      double pressureBiasEstimate = self->fCurrentCalibrationEntry.pressureBiasEstimate;
      *(_DWORD *)buf = 68290306;
      int v29 = 0;
      __int16 v30 = 2082;
      v31 = "";
      __int16 v32 = 2050;
      *(double *)v33 = v24;
      *(_WORD *)&v33[8] = 2050;
      double v34 = v25;
      *(_WORD *)v35 = 2050;
      *(double *)&v35[2] = pressureBiasMeasurement;
      *(_WORD *)&v35[10] = 2050;
      *(double *)&v35[12] = pressureBiasEstimate;
      __int16 v36 = 2050;
      double v37 = v4;
      v19 = "{\"msg%{public}.0s\":\"[CLCompanionRelativeElevation] Pressure bias sync valid\", \"watchPressure\":\"%{publ"
            "ic}f\", \"companionPressure\":\"%{public}f\", \"pressureBiasMeasurement\":\"%{public}f\", \"pressureBiasEsti"
            "mate\":\"%{public}f\", \"proximityAge\":\"%{public}f\"}";
      v20 = v23;
      uint32_t v21 = 68;
    }
    else
    {
      if (qword_102419210 != -1) {
        dispatch_once(&qword_102419210, &stru_1022B6B68);
      }
      uint64_t v18 = qword_102419218;
      if (!os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_INFO)) {
        goto LABEL_33;
      }
      *(_DWORD *)buf = 68290306;
      int v29 = 0;
      __int16 v30 = 2082;
      v31 = "";
      __int16 v32 = 1026;
      *(_DWORD *)v33 = isNearby != 0;
      *(_WORD *)&v33[4] = 1026;
      *(_DWORD *)&v33[6] = v6 < v10;
      LOWORD(v34) = 1026;
      *(_DWORD *)((char *)&v34 + 2) = v8 < v10;
      HIWORD(v34) = 1026;
      *(_DWORD *)v35 = v11 < 1000.0;
      *(_WORD *)&v35[4] = 2050;
      *(double *)&v35[6] = v4;
      v19 = "{\"msg%{public}.0s\":\"[CLCompanionRelativeElevation] Pressure bias sync not valid\", \"isInProximityValid\""
            ":%{public}hhd, \"isPhonePressureDurationValid\":%{public}hhd, \"isWatchPressureDurationValid\":%{public}hhd,"
            " \"isPressureBiasValid\":%{public}hhd, \"proximityAge\":\"%{public}f\"}";
      v20 = v18;
      uint32_t v21 = 52;
    }
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v19, buf, v21);
LABEL_33:
    [(CLCompanionRelativeElevationService *)self logToCA];
    return;
  }
  if (qword_102419210 != -1) {
    dispatch_once(&qword_102419210, &stru_1022B6B68);
  }
  v16 = qword_102419218;
  if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[CLCompanionRelativeElevation] fPressureBiasEstimateStat is null", buf, 2u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022B6B68);
    }
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLCompanionRelativeElevationService updateRelativePressureCalibration]", "%s\n", v17);
    if (v17 != (char *)buf) {
      free(v17);
    }
  }
}

- (void)calculateRelativeElevation
{
  value = self->fPressureBiasEstimateStat.__ptr_.__value_;
  if (!value)
  {
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022B6B68);
    }
    double v24 = qword_102419218;
    if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "[CLCompanionRelativeElevation] fPressureBiasEstimateStat is null", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022B6B68);
    }
    __int16 v31 = 0;
    double v25 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLCompanionRelativeElevationService calculateRelativeElevation]", "%s\n");
LABEL_32:
    if (v25 != buf) {
      free(v25);
    }
    return;
  }
  if (*(_DWORD *)value)
  {
    p_fCurrentCalibrationEntry = &self->fCurrentCalibrationEntry;
    double companionPressure = self->fCurrentCalibrationEntry.companionPressure;
    double v6 = self->fCurrentCalibrationEntry.watchPressure + self->fCurrentCalibrationEntry.pressureBiasEstimate;
    float v7 = companionPressure;
    float v8 = sub_1001C1F30(v7, 101320.0);
    float v9 = v6;
    float v10 = sub_1001C1F30(v9, 101320.0);
    p_fCurrentCalibrationEntry->double deltaPressure = v6 - companionPressure;
    p_fCurrentCalibrationEntry->double deltaElevation = (float)(v10 - v8);
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022B6B68);
    }
    double v11 = qword_102419218;
    if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_DEBUG))
    {
      double watchPressure = p_fCurrentCalibrationEntry->watchPressure;
      double v13 = p_fCurrentCalibrationEntry->companionPressure;
      double pressureBiasMeasurement = p_fCurrentCalibrationEntry->pressureBiasMeasurement;
      double pressureBiasEstimate = p_fCurrentCalibrationEntry->pressureBiasEstimate;
      double deltaPressure = p_fCurrentCalibrationEntry->deltaPressure;
      double deltaElevation = p_fCurrentCalibrationEntry->deltaElevation;
      *(_DWORD *)buf = 68290562;
      int v34 = 0;
      __int16 v35 = 2082;
      __int16 v36 = "";
      __int16 v37 = 2050;
      double v38 = pressureBiasEstimate;
      __int16 v39 = 2050;
      double v40 = watchPressure;
      __int16 v41 = 2050;
      double v42 = v13;
      __int16 v43 = 2050;
      double v44 = pressureBiasMeasurement;
      __int16 v45 = 2050;
      double v46 = deltaPressure;
      __int16 v47 = 2050;
      double v48 = deltaElevation;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"[CLCompanionRelativeElevation] calculateRelativeElevationWithCompanionPressure\", \"pressureBiasEstimate\":\"%{public}f\", \"watchPressure\":\"%{public}f\", \"companionPressure\":\"%{public}f\", \"pressureBiasMeasurement\":\"%{public}f\", \"deltaPressure\":\"%{public}f\", \"deltaElevation\":\"%{public}f\"}", buf, 0x4Eu);
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v18 = [(CLCompanionRelativeElevationService *)self clients];
    id v19 = [(NSMutableSet *)v18 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          double v23 = p_fCurrentCalibrationEntry->deltaElevation;
          *(float *)&double v23 = v23;
          [*(id *)(*((void *)&v27 + 1) + 8 * i) onCompanionRelativeElevationUpdate:v23];
        }
        id v20 = [(NSMutableSet *)v18 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v20);
    }
    return;
  }
  if (qword_102419210 != -1) {
    dispatch_once(&qword_102419210, &stru_1022B6B68);
  }
  v26 = qword_102419218;
  if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "[CLCompanionRelativeElevation] pressureBiasEstimate not ready, skipping calculateRelativeElevation", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022B6B68);
    }
    __int16 v31 = 0;
    double v25 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionRelativeElevationService calculateRelativeElevation]", "%s\n");
    goto LABEL_32;
  }
}

- (void)logToCA
{
  if (byte_10247ADE1)
  {
    p_fCurrentCalibrationEntry = &self->fCurrentCalibrationEntry;
    if (self->fCurrentCalibrationEntry.isNearby)
    {
      p_fCalibrationHourBuffer = &self->fCalibrationHourBuffer;
      if (0x8E38E38E38E38E39
         * (((char *)self->fCalibrationHourBuffer.__end_ - (char *)self->fCalibrationHourBuffer.__begin_) >> 4) <= 4)
      {
        if (qword_102419210 != -1) {
          dispatch_once(&qword_102419210, &stru_1022B6B68);
        }
        double v4 = qword_102419218;
        if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v5 = 0x8E38E38E38E38E39
             * (((char *)p_fCalibrationHourBuffer->__end_ - (char *)p_fCalibrationHourBuffer->__begin_) >> 4);
          *(_DWORD *)buf = 134217984;
          unint64_t v38 = v5;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[CLCompanionRelativeElevation] Adding CA entry to fCalibrationHourBuffer, index %zu", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419210 != -1) {
            dispatch_once(&qword_102419210, &stru_1022B6B68);
          }
          __int16 v36 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionRelativeElevationService logToCA]", "%s\n", v36);
          if (v36 != (char *)buf) {
            free(v36);
          }
        }
        value = p_fCalibrationHourBuffer->__end_cap_.__value_;
        end = (char *)p_fCalibrationHourBuffer->__end_;
        if (end >= (char *)value)
        {
          unint64_t v15 = 0x8E38E38E38E38E39 * ((end - (char *)p_fCalibrationHourBuffer->__begin_) >> 4);
          unint64_t v16 = v15 + 1;
          if (v15 + 1 > 0x1C71C71C71C71C7) {
            sub_1001D7FD4();
          }
          unint64_t v17 = 0x8E38E38E38E38E39 * (((char *)value - (char *)p_fCalibrationHourBuffer->__begin_) >> 4);
          if (2 * v17 > v16) {
            unint64_t v16 = 2 * v17;
          }
          if (v17 >= 0xE38E38E38E38E3) {
            unint64_t v18 = 0x1C71C71C71C71C7;
          }
          else {
            unint64_t v18 = v16;
          }
          if (v18) {
            id v19 = (char *)sub_10014E7AC((uint64_t)&p_fCalibrationHourBuffer->__end_cap_, v18);
          }
          else {
            id v19 = 0;
          }
          id v20 = (RelativePressureBiasCalibrationEntry *)&v19[144 * v15];
          uint64_t v21 = (RelativePressureBiasCalibrationEntry *)&v19[144 * v18];
          *(_OWORD *)&v20->double companionPressure = *(_OWORD *)&p_fCurrentCalibrationEntry->companionPressure;
          long long v22 = *(_OWORD *)&p_fCurrentCalibrationEntry->companionPressureUncertainty;
          long long v23 = *(_OWORD *)&p_fCurrentCalibrationEntry->watchPressureTimestamp;
          long long v24 = *(_OWORD *)&p_fCurrentCalibrationEntry->isNearby;
          *(_OWORD *)&v20->motionState = *(_OWORD *)&p_fCurrentCalibrationEntry->motionState;
          *(_OWORD *)&v20->int isNearby = v24;
          *(_OWORD *)&v20->companionPressureUncertainty = v22;
          *(_OWORD *)&v20->watchPressureTimestamp = v23;
          long long v25 = *(_OWORD *)&p_fCurrentCalibrationEntry->isConnected;
          long long v26 = *(_OWORD *)&p_fCurrentCalibrationEntry->pressureBiasMeasurement;
          long long v27 = *(_OWORD *)&p_fCurrentCalibrationEntry->btRssi;
          *(_OWORD *)&v20->double deltaPressure = *(_OWORD *)&p_fCurrentCalibrationEntry->deltaPressure;
          *(_OWORD *)&v20->btRssi = v27;
          *(_OWORD *)&v20->isConnected = v25;
          *(_OWORD *)&v20->double pressureBiasMeasurement = v26;
          v14 = v20 + 1;
          begin = p_fCalibrationHourBuffer->__begin_;
          long long v28 = p_fCalibrationHourBuffer->__end_;
          if (v28 != p_fCalibrationHourBuffer->__begin_)
          {
            do
            {
              *(_OWORD *)&v20[-1].double companionPressure = *(_OWORD *)&v28[-1].companionPressure;
              long long v30 = *(_OWORD *)&v28[-1].companionPressureUncertainty;
              long long v31 = *(_OWORD *)&v28[-1].watchPressureTimestamp;
              long long v32 = *(_OWORD *)&v28[-1].isNearby;
              *(_OWORD *)&v20[-1].motionState = *(_OWORD *)&v28[-1].motionState;
              *(_OWORD *)&v20[-1].int isNearby = v32;
              *(_OWORD *)&v20[-1].companionPressureUncertainty = v30;
              *(_OWORD *)&v20[-1].watchPressureTimestamp = v31;
              long long v33 = *(_OWORD *)&v28[-1].isConnected;
              long long v34 = *(_OWORD *)&v28[-1].pressureBiasMeasurement;
              long long v35 = *(_OWORD *)&v28[-1].btRssi;
              *(_OWORD *)&v20[-1].double deltaPressure = *(_OWORD *)&v28[-1].deltaPressure;
              *(_OWORD *)&v20[-1].btRssi = v35;
              *(_OWORD *)&v20[-1].isConnected = v33;
              *(_OWORD *)&v20[-1].double pressureBiasMeasurement = v34;
              --v20;
              --v28;
            }
            while (v28 != begin);
            long long v28 = p_fCalibrationHourBuffer->__begin_;
          }
          p_fCalibrationHourBuffer->__begin_ = v20;
          p_fCalibrationHourBuffer->__end_ = v14;
          p_fCalibrationHourBuffer->__end_cap_.__value_ = v21;
          if (v28) {
            operator delete(v28);
          }
        }
        else
        {
          *(_OWORD *)end = *(_OWORD *)&p_fCurrentCalibrationEntry->companionPressure;
          long long v8 = *(_OWORD *)&p_fCurrentCalibrationEntry->companionPressureUncertainty;
          long long v9 = *(_OWORD *)&p_fCurrentCalibrationEntry->watchPressureTimestamp;
          long long v10 = *(_OWORD *)&p_fCurrentCalibrationEntry->isNearby;
          *((_OWORD *)end + 3) = *(_OWORD *)&p_fCurrentCalibrationEntry->motionState;
          *((_OWORD *)end + 4) = v10;
          *((_OWORD *)end + 1) = v8;
          *((_OWORD *)end + 2) = v9;
          long long v11 = *(_OWORD *)&p_fCurrentCalibrationEntry->isConnected;
          long long v12 = *(_OWORD *)&p_fCurrentCalibrationEntry->pressureBiasMeasurement;
          long long v13 = *(_OWORD *)&p_fCurrentCalibrationEntry->btRssi;
          *((_OWORD *)end + 7) = *(_OWORD *)&p_fCurrentCalibrationEntry->deltaPressure;
          *((_OWORD *)end + 8) = v13;
          *((_OWORD *)end + 5) = v11;
          *((_OWORD *)end + 6) = v12;
          v14 = (RelativePressureBiasCalibrationEntry *)(end + 144);
        }
        p_fCalibrationHourBuffer->__end_ = v14;
      }
    }
  }
}

- (void)rotateCAHourly
{
  if (!self->fCalibrationTable.__ptr_.__value_)
  {
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022B6B68);
    }
    long long v9 = qword_102419218;
    if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[CLCompanionRelativeElevation] fCalibrationTable is null", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022B6B68);
    }
    long long v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLCompanionRelativeElevationService rotateCAHourly]", "%s\n", v10);
LABEL_37:
    if (v10 != (char *)buf) {
      free(v10);
    }
    return;
  }
  p_fCalibrationHourBuffer = &self->fCalibrationHourBuffer;
  begin = self->fCalibrationHourBuffer.__begin_;
  end = self->fCalibrationHourBuffer.__end_;
  if (begin != end)
  {
    double v6 = begin + 1;
    float v7 = self->fCalibrationHourBuffer.__begin_;
    if (&begin[1] != end)
    {
      float v7 = self->fCalibrationHourBuffer.__begin_;
      do
      {
        if (vabdd_f64(v6->watchPressureTimestamp, v6->nearbyTimestamp) < vabdd_f64(v7->watchPressureTimestamp, v7->nearbyTimestamp))float v7 = v6; {
        ++v6;
        }
      }
      while (v6 != end);
    }
    if (v7 != end)
    {
      if (qword_102419210 != -1) {
        dispatch_once(&qword_102419210, &stru_1022B6B68);
      }
      long long v8 = qword_102419218;
      if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[CLCompanionRelativeElevation] Adding hourly CA entry to fCalibrationTable", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419210 != -1) {
          dispatch_once(&qword_102419210, &stru_1022B6B68);
        }
        long long v12 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionRelativeElevationService rotateCAHourly]", "%s\n", v12);
        if (v12 != (char *)buf) {
          free(v12);
        }
      }
      sub_1004D9E00((void *)self->fCalibrationTable.__ptr_.__value_, v7);
      begin = p_fCalibrationHourBuffer->__begin_;
    }
    p_fCalibrationHourBuffer->__end_ = begin;
    return;
  }
  if (qword_102419210 != -1) {
    dispatch_once(&qword_102419210, &stru_1022B6B68);
  }
  long long v11 = qword_102419218;
  if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[CLCompanionRelativeElevation] fCalibrationHourBuffer is empty, nothing to send this hour.", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022B6B68);
    }
    long long v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionRelativeElevationService rotateCAHourly]", "%s\n", v10);
    goto LABEL_37;
  }
}

- (void)rotateCADaily
{
  if (self->fCalibrationTable.__ptr_.__value_)
  {
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022B6B68);
    }
    v3 = qword_102419218;
    if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = *((void *)self->fCalibrationTable.__ptr_.__value_ + 4);
      *(_DWORD *)buf = 134217984;
      uint64_t v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[CLCompanionRelativeElevation] Submitting daily CA logs, size %zu", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419210 != -1) {
        dispatch_once(&qword_102419210, &stru_1022B6B68);
      }
      float v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionRelativeElevationService rotateCADaily]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    if (*((void *)self->fCalibrationTable.__ptr_.__value_ + 4))
    {
      unint64_t v5 = 0;
      do
      {
        AnalyticsSendEventLazy();
        ++v5;
      }
      while (*((void *)self->fCalibrationTable.__ptr_.__value_ + 4) > v5);
    }
  }
  else
  {
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022B6B68);
    }
    double v6 = qword_102419218;
    if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[CLCompanionRelativeElevation] fCalibrationTable is null", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419210 != -1) {
        dispatch_once(&qword_102419210, &stru_1022B6B68);
      }
      long long v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLCompanionRelativeElevationService rotateCADaily]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (void)onCompanionNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 == 13)
  {
    p_fCurrentCalibrationEntry = &self->fCurrentCalibrationEntry;
    self->fCurrentCalibrationEntry.int isConnected = *(unsigned char *)a4;
    self->fCurrentCalibrationEntry.int isNearby = *((unsigned __int8 *)a4 + 1);
    self->fCurrentCalibrationEntry.int isActive = *((unsigned __int8 *)a4 + 2);
    self->fCurrentCalibrationEntry.nearbyTimestamp = *((double *)a4 + 1);
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022B6B68);
    }
    uint64_t v10 = qword_102419218;
    if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_DEBUG))
    {
      int isNearby = p_fCurrentCalibrationEntry->isNearby;
      int isConnected = p_fCurrentCalibrationEntry->isConnected;
      int isActive = p_fCurrentCalibrationEntry->isActive;
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)unint64_t v18 = isConnected;
      *(_WORD *)&v18[4] = 1024;
      *(_DWORD *)&v18[6] = isNearby;
      LOWORD(v19) = 1024;
      *(_DWORD *)((char *)&v19 + 2) = isActive;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[CLCompanionRelativeElevation] kNotificationCompanionDetailedConnectionUpdate, connected %d, nearby %d, active %d", buf, 0x14u);
    }
    if (!sub_10013D1A0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022B6B68);
    }
    v14 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionRelativeElevationService onCompanionNotification:data:]", "%s\n");
LABEL_31:
    if (v14 != buf) {
      free(v14);
    }
    return;
  }
  if (a3 == 12)
  {
    unint64_t v5 = &self->fCurrentCalibrationEntry;
    *(_OWORD *)&self->fCurrentCalibrationEntry.double companionPressure = *(_OWORD *)a4;
    self->fCurrentCalibrationEntry.double companionPressureUncertainty = *((double *)a4 + 2);
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022B6B68);
    }
    double v6 = qword_102419218;
    if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_DEBUG))
    {
      double companionPressure = v5->companionPressure;
      double companionPressureUncertainty = self->fCurrentCalibrationEntry.companionPressureUncertainty;
      *(_DWORD *)buf = 134218240;
      *(double *)unint64_t v18 = companionPressure;
      *(_WORD *)&v18[8] = 2048;
      double v19 = companionPressureUncertainty;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[CLCompanionRelativeElevation] kNotificationCompanionFilteredPressure, pressure %f, unc %f", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419210 != -1) {
        dispatch_once(&qword_102419210, &stru_1022B6B68);
      }
      unint64_t v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionRelativeElevationService onCompanionNotification:data:]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
    if (self->fPressureBiasEstimateStat.__ptr_.__value_)
    {
      [(CLCompanionRelativeElevationService *)self updateRelativePressureCalibration];
      [(CLCompanionRelativeElevationService *)self calculateRelativeElevation];
      return;
    }
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022B6B68);
    }
    unint64_t v15 = qword_102419218;
    if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[CLCompanionRelativeElevation] fPressureBiasEstimateStat is not ready", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419210 != -1) {
        dispatch_once(&qword_102419210, &stru_1022B6B68);
      }
      v14 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLCompanionRelativeElevationService onCompanionNotification:data:]", "%s\n");
      goto LABEL_31;
    }
  }
}

- (void)onKFFilteredPressure:(const CMKFFilteredPressureSample *)a3
{
  if (a3)
  {
    double var1 = a3->var1;
    self->fCurrentCalibrationEntry.double watchPressure = a3->var2;
    self->fCurrentCalibrationEntry.watchPressureTimestamp = var1;
    self->fCurrentCalibrationEntry.watchPressureUncertainty = a3->var4;
  }
}

- (void)onMotionActivityNotification:(int)a3 data:(NotificationData *)a4
{
  self->fCurrentCalibrationEntry.motionStateTimestamp = *((double *)a4 + 5);
  self->fCurrentCalibrationEntry.motionState = *(_DWORD *)a4;
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (void).cxx_destruct
{
  p_fCalibrationHourBuffer = &self->fCalibrationHourBuffer;
  begin = self->fCalibrationHourBuffer.__begin_;
  if (begin)
  {
    p_fCalibrationHourBuffer->__end_ = begin;
    operator delete(begin);
  }
  value = self->fCalibrationTable.__ptr_.__value_;
  self->fCalibrationTable.__ptr_.__value_ = 0;
  if (value) {
    sub_1004DAEB0((uint64_t)&self->fCalibrationTable, (uint64_t)value);
  }
  double v6 = self->fPressureBiasEstimateStat.__ptr_.__value_;
  self->fPressureBiasEstimateStat.__ptr_.__value_ = 0;
  if (v6) {
    operator delete();
  }
  float v7 = self->fMotionStateCoprocessorDispatcher.__ptr_.__value_;
  self->fMotionStateCoprocessorDispatcher.__ptr_.__value_ = 0;
  if (v7) {
    (*(void (**)(Dispatcher *))(*(void *)v7 + 8))(v7);
  }
  long long v8 = self->fMotionActivityClient.__ptr_.__value_;
  self->fMotionActivityClient.__ptr_.__value_ = 0;
  if (v8) {
    (*(void (**)(Client *))(*(void *)v8 + 8))(v8);
  }
  long long v9 = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = 0;
  if (v9)
  {
    uint64_t v10 = *(void (**)(void))(*(void *)v9 + 8);
    v10();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 23) = 0;
  *((void *)self + 25) = 0;
  *((void *)self + 26) = 0;
  *((void *)self + 24) = 0;
  return self;
}

@end