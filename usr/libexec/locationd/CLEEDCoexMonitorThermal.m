@interface CLEEDCoexMonitorThermal
- (CLEEDCoexMonitorThermal)initWithQueue:(id)a3 mitigationConfig:(MitigationsConfig *)a4 cachedCoexMetricData:(id)a5 eventCB:(id)a6 coexMetricUpdateCB:(id)a7;
- (CLEEDCoexThermalForCA)fCoexTermalForCA;
- (id).cxx_construct;
- (id)fCoexMetricUpdateCallback;
- (id)getMitigationForCurrentlevel;
- (int)currentThermalLevel;
- (void)computeThermalLevelDurationForCA;
- (void)dealloc;
- (void)processThermalLevelForCA:(int)a3;
- (void)queryThermalLevel;
- (void)setCurrentThermalLevel:(int)a3;
- (void)setFCoexMetricUpdateCallback:(id)a3;
- (void)setFCoexTermalForCA:(id)a3;
- (void)updateCoexMetricDict:(id *)a3 forCASubmission:(BOOL)a4;
@end

@implementation CLEEDCoexMonitorThermal

- (CLEEDCoexMonitorThermal)initWithQueue:(id)a3 mitigationConfig:(MitigationsConfig *)a4 cachedCoexMetricData:(id)a5 eventCB:(id)a6 coexMetricUpdateCB:(id)a7
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022B5520);
  }
  v13 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    sub_1004693B8();
    v14 = v41 >= 0 ? __p : *(unsigned char **)__p;
    *(_DWORD *)buf = 136446978;
    v46 = "-[CLEEDCoexMonitorThermal initWithQueue:mitigationConfig:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]";
    __int16 v47 = 2114;
    id v48 = a3;
    __int16 v49 = 2082;
    v50 = v14;
    __int16 v51 = 2114;
    id v52 = a6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#EED2CXTH,%{public}s[queue:%{public}@,thermalConfig:%{public}s,mitigationCB:%{public}@]", buf, 0x2Au);
    if (SHIBYTE(v41) < 0) {
      operator delete(*(void **)__p);
    }
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B5520);
    }
    sub_1004693B8();
    if (v37 >= 0) {
      v28 = location;
    }
    else {
      v28 = (id *)location[0];
    }
    *(_DWORD *)__p = 136446978;
    *(void *)&__p[4] = "-[CLEEDCoexMonitorThermal initWithQueue:mitigationConfig:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]";
    __int16 v39 = 2114;
    id v40 = a3;
    __int16 v41 = 2082;
    v42 = v28;
    __int16 v43 = 2114;
    id v44 = a6;
    v29 = (char *)_os_log_send_and_compose_impl();
    if (v37 < 0) {
      operator delete(location[0]);
    }
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorThermal initWithQueue:mitigationConfig:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]", "%s\n", v29);
    if (v29 != (char *)buf) {
      free(v29);
    }
  }
  v35.receiver = self;
  v35.super_class = (Class)CLEEDCoexMonitorThermal;
  id v15 = [(CLEEDCoexMonitorThermal *)&v35 init];
  if (v15)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)a3);
    *((void *)v15 + 1) = a3;
    *((void *)v15 + 2) = _Block_copy(a6);
    *((void *)v15 + 25) = _Block_copy(a7);
    *((unsigned char *)v15 + 24) = 0;
    long long v16 = *(_OWORD *)&a4->cellular.enabled;
    *((_OWORD *)v15 + 2) = a4->nominal;
    *((_OWORD *)v15 + 3) = v16;
    long long v17 = *(_OWORD *)&a4->cellular.rsrpSamplesToAvg;
    long long v18 = *(_OWORD *)&a4->cellular.belowThresholdParams.maxStreamingBitrateKbps;
    long long v19 = *(_OWORD *)&a4->thermal.moderate.maxFramerateFps;
    *((_OWORD *)v15 + 6) = *(_OWORD *)&a4->thermal.light.maxFramerateFps;
    *((_OWORD *)v15 + 7) = v19;
    *((_OWORD *)v15 + 4) = v17;
    *((_OWORD *)v15 + 5) = v18;
    long long v20 = *(_OWORD *)&a4->thermal.heavyAndGreater.maxFramerateFps;
    MitigationParams light = a4->peakPower.light;
    MitigationParams heavyAndGreater = a4->peakPower.heavyAndGreater;
    *((_OWORD *)v15 + 10) = a4->peakPower.moderate;
    *((MitigationParams *)v15 + 11) = heavyAndGreater;
    *((_OWORD *)v15 + 8) = v20;
    *((MitigationParams *)v15 + 9) = light;
    *((void *)v15 + 26) = [[CLEEDCoexThermalForCA alloc] initWithCoexMetricDict:a5];
    if (!*((unsigned char *)v15 + 88))
    {
      v23 = *((void *)v15 + 1);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1004A43BC;
      block[3] = &unk_10229FED8;
      block[4] = v15;
      dispatch_async(v23, block);
    }
    objc_initWeak(location, v15);
    v24 = *((void *)v15 + 1);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1004A459C;
    handler[3] = &unk_1022B3858;
    objc_copyWeak(&v33, location);
    if (notify_register_dispatch("com.apple.system.thermalpressurelevel", (int *)v15 + 48, v24, handler))
    {
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022B5520);
      }
      v25 = qword_1024193E8;
      if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v46 = "-[CLEEDCoexMonitorThermal initWithQueue:mitigationConfig:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]";
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#EED2CXTH,%{public}s: unable to register for Thermal notifications", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193E0 != -1) {
          dispatch_once(&qword_1024193E0, &stru_1022B5520);
        }
        *(_DWORD *)__p = 136446210;
        *(void *)&__p[4] = "-[CLEEDCoexMonitorThermal initWithQueue:mitigationConfig:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]";
        v30 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorThermal initWithQueue:mitigationConfig:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]", "%s\n", v30);
        if (v30 != (char *)buf) {
          free(v30);
        }
      }
      objc_destroyWeak(&v33);
      objc_destroyWeak(location);
      return 0;
    }
    else
    {
      v26 = *((void *)v15 + 1);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1004A45D4;
      v31[3] = &unk_10229FED8;
      v31[4] = v15;
      dispatch_async(v26, v31);
      objc_destroyWeak(&v33);
      objc_destroyWeak(location);
    }
  }
  return (CLEEDCoexMonitorThermal *)v15;
}

- (void)dealloc
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022B5520);
  }
  v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v12 = "-[CLEEDCoexMonitorThermal dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2CXTH,%{public}s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B5520);
    }
    int v9 = 136446210;
    v10 = "-[CLEEDCoexMonitorThermal dealloc]";
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorThermal dealloc]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  notify_cancel(self->fToken);
  id fNotificationCallback = self->fNotificationCallback;
  if (fNotificationCallback)
  {
    _Block_release(fNotificationCallback);
    self->id fNotificationCallback = 0;
  }
  id fCoexMetricUpdateCallback = self->_fCoexMetricUpdateCallback;
  if (fCoexMetricUpdateCallback)
  {
    _Block_release(fCoexMetricUpdateCallback);
    self->_id fCoexMetricUpdateCallback = 0;
  }
  fCoexTermalForCA = self->_fCoexTermalForCA;
  if (fCoexTermalForCA)
  {

    self->_fCoexTermalForCA = 0;
  }
  self->fQueue = 0;
  v8.receiver = self;
  v8.super_class = (Class)CLEEDCoexMonitorThermal;
  [(CLEEDCoexMonitorThermal *)&v8 dealloc];
}

- (void)queryThermalLevel
{
  uint64_t state64 = 0;
  if (notify_get_state(self->fToken, &state64))
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B5520);
    }
    v3 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      long long v19 = "-[CLEEDCoexMonitorThermal queryThermalLevel]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#EED2CXTH,%{public}s, could not get Thermal State", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022B5520);
      }
      int v12 = 136446210;
      v13 = "-[CLEEDCoexMonitorThermal queryThermalLevel]";
      v4 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitorThermal queryThermalLevel]", "%s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
  }
  else
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B5520);
    }
    v5 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      if (!self->fInitialValueReceived) {
        v6 = "YES";
      }
      *(_DWORD *)buf = 136446722;
      long long v19 = "-[CLEEDCoexMonitorThermal queryThermalLevel]";
      __int16 v20 = 2082;
      v21 = v6;
      __int16 v22 = 2050;
      uint64_t v23 = state64;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#EED2CXTH,%{public}s, InitialValue:%{public}s, ThermalPressureLevel:%{public}llu", buf, 0x20u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022B5520);
      }
      int v9 = "NO";
      if (!self->fInitialValueReceived) {
        int v9 = "YES";
      }
      int v12 = 136446722;
      v13 = "-[CLEEDCoexMonitorThermal queryThermalLevel]";
      __int16 v14 = 2082;
      id v15 = v9;
      __int16 v16 = 2050;
      uint64_t v17 = state64;
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorThermal queryThermalLevel]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    if (!self->fInitialValueReceived
      || (int v7 = state64, [(CLEEDCoexMonitorThermal *)self currentThermalLevel] != v7))
    {
      [(CLEEDCoexMonitorThermal *)self processThermalLevelForCA:state64];
      self->fInitialValueReceived = 1;
      [(CLEEDCoexMonitorThermal *)self setCurrentThermalLevel:state64];
      id fNotificationCallback = (void (**)(id, id, void))self->fNotificationCallback;
      if (fNotificationCallback) {
        fNotificationCallback[2](fNotificationCallback, [(CLEEDCoexMonitorThermal *)self getMitigationForCurrentlevel], 0);
      }
    }
  }
}

- (id)getMitigationForCurrentlevel
{
  p_fMitigationConfig = &self->fMitigationConfig;
  if (self->fMitigationConfig.thermal.enabled)
  {
    int v4 = [(CLEEDCoexMonitorThermal *)self currentThermalLevel];
    if (v4 > 29)
    {
      if (v4 == 30 || v4 == 40 || v4 == 50)
      {
        p_fMitigationConfig = (MitigationsConfig *)&self->fMitigationConfig.thermal.heavyAndGreater;
        goto LABEL_17;
      }
    }
    else
    {
      switch(v4)
      {
        case 0:
          goto LABEL_17;
        case 10:
          p_fMitigationConfig = (MitigationsConfig *)&self->fMitigationConfig.thermal.light;
          goto LABEL_17;
        case 20:
          p_fMitigationConfig = (MitigationsConfig *)&self->fMitigationConfig.thermal.moderate;
          goto LABEL_17;
      }
    }
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B5520);
    }
    v5 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v14 = "-[CLEEDCoexMonitorThermal getMitigationForCurrentlevel]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "#EED2CXTH,%{public}s, unhandled thermal state", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022B5520);
      }
      int v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitorThermal getMitigationForCurrentlevel]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
  }
LABEL_17:
  id v6 = [objc_alloc((Class)CLEEDMitigation) initWithStreamingAllowed:p_fMitigationConfig->nominal.allowNewStreamingRequests framerateFps:p_fMitigationConfig->nominal.maxFramerateFps bitrateKbps:p_fMitigationConfig->nominal.maxStreamingBitrateKbps dropStreaming:p_fMitigationConfig->nominal.dropStreaming uploadAllowed:p_fMitigationConfig->nominal.allowNewMediaRequests uploadMitigation:p_fMitigationConfig->nominal.delayMedia source:2];
  id v7 = v6;
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022B5520);
  }
  objc_super v8 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [(CLEEDCoexMonitorThermal *)self currentThermalLevel];
    *(_DWORD *)buf = 136446722;
    __int16 v14 = "-[CLEEDCoexMonitorThermal getMitigationForCurrentlevel]";
    __int16 v15 = 1026;
    unsigned int v16 = v9;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#EED2CXTH,%{public}s ThermalState:%{public}u, Mitigation:%{public}@", buf, 0x1Cu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B5520);
    }
    [(CLEEDCoexMonitorThermal *)self currentThermalLevel];
    v11 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorThermal getMitigationForCurrentlevel]", "%s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  return v6;
}

- (void)processThermalLevelForCA:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!self->fInitialValueReceived)
  {
    [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] setThermalLevelAtStartOfCall:*(void *)&a3];
LABEL_6:
    [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] setMaxThermalLevelInCall:v3];
    goto LABEL_7;
  }
  if ([(CLEEDCoexMonitorThermal *)self currentThermalLevel] == a3) {
    goto LABEL_8;
  }
  [(CLEEDCoexMonitorThermal *)self computeThermalLevelDurationForCA];
  if ([(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] maxThermalLevelInCall] < (int)v3)goto LABEL_6; {
LABEL_7:
  }
  [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] setCurrentThermalLevelStartTime:CFAbsoluteTimeGetCurrent()];
LABEL_8:
  [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] setThermalLevelAtEndOfCall:v3];
  if ([(CLEEDCoexMonitorThermal *)self fCoexMetricUpdateCallback])
  {
    v5 = (void (*)(void))*((void *)[(CLEEDCoexMonitorThermal *)self fCoexMetricUpdateCallback]+ 2);
    v5();
  }
}

- (void)computeThermalLevelDurationForCA
{
  int v3 = [(CLEEDCoexMonitorThermal *)self currentThermalLevel];
  if (v3 > 29)
  {
    switch(v3)
    {
      case 30:
        [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] currentThermalLevelStartTime];
        if (v25 > 0.0)
        {
          [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] thermalHeavyDuration];
          double v27 = v26;
          double Current = CFAbsoluteTimeGetCurrent();
          [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] currentThermalLevelStartTime];
          double v30 = v27 + vabdd_f64(Current, v29);
          v31 = [(CLEEDCoexMonitorThermal *)self fCoexTermalForCA];
          [(CLEEDCoexThermalForCA *)v31 setThermalHeavyDuration:v30];
        }
        break;
      case 40:
        [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] currentThermalLevelStartTime];
        if (v39 > 0.0)
        {
          [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] thermalTrappingDuration];
          double v41 = v40;
          double v42 = CFAbsoluteTimeGetCurrent();
          [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] currentThermalLevelStartTime];
          double v44 = v41 + vabdd_f64(v42, v43);
          v45 = [(CLEEDCoexMonitorThermal *)self fCoexTermalForCA];
          [(CLEEDCoexThermalForCA *)v45 setThermalTrappingDuration:v44];
        }
        break;
      case 50:
        [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] currentThermalLevelStartTime];
        if (v11 > 0.0)
        {
          [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] thermalSleepingDuration];
          double v13 = v12;
          double v14 = CFAbsoluteTimeGetCurrent();
          [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] currentThermalLevelStartTime];
          double v16 = v13 + vabdd_f64(v14, v15);
          __int16 v17 = [(CLEEDCoexMonitorThermal *)self fCoexTermalForCA];
          [(CLEEDCoexThermalForCA *)v17 setThermalSleepingDuration:v16];
        }
        break;
    }
  }
  else if (v3)
  {
    if (v3 == 10)
    {
      [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] currentThermalLevelStartTime];
      if (v32 > 0.0)
      {
        [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] thermalLightDuration];
        double v34 = v33;
        double v35 = CFAbsoluteTimeGetCurrent();
        [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] currentThermalLevelStartTime];
        double v37 = v34 + vabdd_f64(v35, v36);
        v38 = [(CLEEDCoexMonitorThermal *)self fCoexTermalForCA];
        [(CLEEDCoexThermalForCA *)v38 setThermalLightDuration:v37];
      }
    }
    else if (v3 == 20)
    {
      [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] currentThermalLevelStartTime];
      if (v4 > 0.0)
      {
        [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] thermalModerateDuration];
        double v6 = v5;
        double v7 = CFAbsoluteTimeGetCurrent();
        [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] currentThermalLevelStartTime];
        double v9 = v6 + vabdd_f64(v7, v8);
        v10 = [(CLEEDCoexMonitorThermal *)self fCoexTermalForCA];
        [(CLEEDCoexThermalForCA *)v10 setThermalModerateDuration:v9];
      }
    }
  }
  else
  {
    [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] currentThermalLevelStartTime];
    if (v18 > 0.0)
    {
      [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] thermalNominalDuration];
      double v20 = v19;
      double v21 = CFAbsoluteTimeGetCurrent();
      [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] currentThermalLevelStartTime];
      double v23 = v20 + vabdd_f64(v21, v22);
      v24 = [(CLEEDCoexMonitorThermal *)self fCoexTermalForCA];
      [(CLEEDCoexThermalForCA *)v24 setThermalNominalDuration:v23];
    }
  }
}

- (void)updateCoexMetricDict:(id *)a3 forCASubmission:(BOOL)a4
{
  if (a3 && *a3)
  {
    BOOL v5 = a4;
    if ([(CLEEDCoexMonitorThermal *)self fCoexTermalForCA])
    {
      if (v5)
      {
        [(CLEEDCoexMonitorThermal *)self computeThermalLevelDurationForCA];
        id v7 = *a3;
        [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] thermalNominalDuration];
        LODWORD(v9) = vcvtpd_s64_f64(v8 * 1000.0);
        [v7 setValue:[NSNumber numberWithInt:v9] forKey:@"thermalNominalDuration"];
        id v10 = *a3;
        [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] thermalLightDuration];
        LODWORD(v12) = vcvtpd_s64_f64(v11 * 1000.0);
        [v10 setValue:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v12) forKey:@"thermalLightDuration"];
        id v13 = *a3;
        [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] thermalModerateDuration];
        LODWORD(v15) = vcvtpd_s64_f64(v14 * 1000.0);
        [v13 setValue:[NSNumber numberWithInt:v15] forKey:@"thermalModerateDuration"];
        id v16 = *a3;
        [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] thermalHeavyDuration];
        LODWORD(v18) = vcvtpd_s64_f64(v17 * 1000.0);
        [v16 setValue:[NSNumber numberWithInt:v18] forKey:@"thermalHeavyDuration"];
        id v19 = *a3;
        [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] thermalTrappingDuration];
        LODWORD(v21) = vcvtpd_s64_f64(v20 * 1000.0);
        [v19 setValue:[NSNumber numberWithInt:v21] forKey:@"thermalTrappingDuration"];
        id v22 = *a3;
        [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] thermalSleepingDuration];
        LODWORD(v24) = vcvtpd_s64_f64(v23 * 1000.0);
        double v25 = +[NSNumber numberWithInt:v24];
        CFStringRef v26 = @"thermalSleepingDuration";
      }
      else
      {
        id v29 = *a3;
        [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] thermalNominalDuration];
        [v29 setValue:[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:") forKey:@"thermalNominalDuration"];
        id v30 = *a3;
        [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] thermalLightDuration];
        [v30 setValue:[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:") forKey:@"thermalLightDuration"];
        id v31 = *a3;
        [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] thermalModerateDuration];
        [v31 setValue:[NSNumber numberWithDouble:] forKey:@"thermalModerateDuration"];
        id v32 = *a3;
        [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] thermalHeavyDuration];
        [v32 setValue:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:")] forKey:@"thermalHeavyDuration"];
        id v33 = *a3;
        [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] thermalTrappingDuration];
        [v33 setValue:[NSNumber numberWithDouble:] forKey:@"thermalTrappingDuration"];
        id v34 = *a3;
        [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] thermalSleepingDuration];
        [v34 setValue:[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:") forKey:@"thermalSleepingDuration"];
        id v22 = *a3;
        [(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] currentThermalLevelStartTime];
        double v25 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        CFStringRef v26 = @"currentThermalLevelStartTime";
      }
      [v22 setValue:v25 forKey:v26];
      [*a3 setValue:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLEEDCoexThermalForCA thermalLevelAtStartOfCall](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "thermalLevelAtStartOfCall")) forKey:@"thermalLevelAtStartOfCall"];
      [*a3 setValue:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLEEDCoexThermalForCA maxThermalLevelInCall](-[CLEEDCoexMonitorThermalThermalForCA](self, "fCoexTermalForCA"), "maxThermalLevelInCall")) forKey:@"maxThermalLevelInCall"];
      id v35 = *a3;
      double v36 = +[NSNumber numberWithInt:[(CLEEDCoexThermalForCA *)[(CLEEDCoexMonitorThermal *)self fCoexTermalForCA] thermalLevelAtEndOfCall]];
      [v35 setValue:v36 forKey:@"thermalLevelAtEndOfCall"];
      return;
    }
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B5520);
    }
    v28 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      double v39 = "-[CLEEDCoexMonitorThermal updateCoexMetricDict:forCASubmission:]";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#EED2CXTH,%{public}s, nil fCoexTermalForCA", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 == -1)
      {
LABEL_24:
        double v37 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitorThermal updateCoexMetricDict:forCASubmission:]", "%s\n", v37);
        if (v37 != (char *)buf) {
          free(v37);
        }
        return;
      }
LABEL_26:
      dispatch_once(&qword_1024193E0, &stru_1022B5520);
      goto LABEL_24;
    }
  }
  else
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B5520);
    }
    double v27 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      double v39 = "-[CLEEDCoexMonitorThermal updateCoexMetricDict:forCASubmission:]";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "#EED2CXTH,%{public}s, nil metricDict", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 == -1) {
        goto LABEL_24;
      }
      goto LABEL_26;
    }
  }
}

- (int)currentThermalLevel
{
  return self->_currentThermalLevel;
}

- (void)setCurrentThermalLevel:(int)a3
{
  self->_currentThermalLevel = a3;
}

- (id)fCoexMetricUpdateCallback
{
  return self->_fCoexMetricUpdateCallback;
}

- (void)setFCoexMetricUpdateCallback:(id)a3
{
  self->_id fCoexMetricUpdateCallback = a3;
}

- (CLEEDCoexThermalForCA)fCoexTermalForCA
{
  return self->_fCoexTermalForCA;
}

- (void)setFCoexTermalForCA:(id)a3
{
  self->_fCoexTermalForCA = (CLEEDCoexThermalForCA *)a3;
}

- (id).cxx_construct
{
  *((_WORD *)self + 16) = 257;
  *(void *)((char *)self + 36) = 0x32000000018;
  *((_WORD *)self + 22) = 0;
  *((unsigned char *)self + 48) = 1;
  *((_DWORD *)self + 13) = -115;
  *((void *)self + 7) = 0x4000000000000000;
  *((void *)self + 8) = 0x3E800000005;
  *((_WORD *)self + 36) = 0;
  *(void *)((char *)self + 76) = -1;
  *((_WORD *)self + 42) = 257;
  *((unsigned char *)self + 88) = 1;
  *((_WORD *)self + 46) = 257;
  *((void *)self + 12) = 0x32000000018;
  *((_WORD *)self + 52) = 0;
  *((_WORD *)self + 54) = 0;
  *((void *)self + 14) = 0x6400000005;
  *((_WORD *)self + 60) = 256;
  *((_WORD *)self + 62) = 0;
  *((void *)self + 16) = -1;
  *((_WORD *)self + 68) = 257;
  *((unsigned char *)self + 140) = 1;
  *((_WORD *)self + 72) = 0;
  *(void *)((char *)self + 148) = -1;
  *((_WORD *)self + 78) = 257;
  *((_WORD *)self + 80) = 0;
  *(void *)((char *)self + 164) = -1;
  *((_WORD *)self + 86) = 257;
  *((_WORD *)self + 88) = 0;
  *(void *)((char *)self + 180) = -1;
  *((_WORD *)self + 94) = 257;
  return self;
}

@end