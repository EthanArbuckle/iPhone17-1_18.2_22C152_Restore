@interface CLEEDCoexMonitorPower
- (CLEEDCoexMonitorPower)initWithQueue:(id)a3 mitigationConfig:(MitigationsConfig *)a4 cachedCoexMetricData:(id)a5 eventCB:(id)a6 coexMetricUpdateCB:(id)a7;
- (CLEEDCoexPowerForCA)fCoexPowerForCA;
- (id).cxx_construct;
- (id)fCoexMetricUpdateCallback;
- (id)getMitigationForCurrentlevel;
- (unsigned)currentPowerLevel;
- (void)computePowerLevelDurationForCA;
- (void)dealloc;
- (void)processPowerLevelForCA:(unsigned int)a3;
- (void)queryPeakPowerLevel;
- (void)setCurrentPowerLevel:(unsigned int)a3;
- (void)setFCoexMetricUpdateCallback:(id)a3;
- (void)setFCoexPowerForCA:(id)a3;
- (void)updateCoexMetricDict:(id *)a3 forCASubmission:(BOOL)a4;
@end

@implementation CLEEDCoexMonitorPower

- (CLEEDCoexMonitorPower)initWithQueue:(id)a3 mitigationConfig:(MitigationsConfig *)a4 cachedCoexMetricData:(id)a5 eventCB:(id)a6 coexMetricUpdateCB:(id)a7
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022B3878);
  }
  v13 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    sub_1004693B8();
    v14 = v41 >= 0 ? __p : *(unsigned char **)__p;
    *(_DWORD *)buf = 136446978;
    v46 = "-[CLEEDCoexMonitorPower initWithQueue:mitigationConfig:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]";
    __int16 v47 = 2114;
    id v48 = a3;
    __int16 v49 = 2082;
    v50 = v14;
    __int16 v51 = 2114;
    id v52 = a6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#EED2CXPB,%{public}s[queue:%{public}@,peakPowerConfig:%{public}s,mitigationCB:%{public}@]", buf, 0x2Au);
    if (SHIBYTE(v41) < 0) {
      operator delete(*(void **)__p);
    }
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B3878);
    }
    sub_1004693B8();
    if (v37 >= 0) {
      v28 = location;
    }
    else {
      v28 = (id *)location[0];
    }
    *(_DWORD *)__p = 136446978;
    *(void *)&__p[4] = "-[CLEEDCoexMonitorPower initWithQueue:mitigationConfig:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]";
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
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorPower initWithQueue:mitigationConfig:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]", "%s\n", v29);
    if (v29 != (char *)buf) {
      free(v29);
    }
  }
  v35.receiver = self;
  v35.super_class = (Class)CLEEDCoexMonitorPower;
  id v15 = [(CLEEDCoexMonitorPower *)&v35 init];
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
    *((void *)v15 + 26) = [[CLEEDCoexPowerForCA alloc] initWithCoexMetricDict:a5];
    if (!*((unsigned char *)v15 + 140))
    {
      v23 = *((void *)v15 + 1);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1004696A0;
      block[3] = &unk_10229FED8;
      block[4] = v15;
      dispatch_async(v23, block);
    }
    objc_initWeak(location, v15);
    v24 = *((void *)v15 + 1);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100469880;
    handler[3] = &unk_1022B3858;
    objc_copyWeak(&v33, location);
    if (notify_register_dispatch("com.apple.system.peakpowerpressurelevel", (int *)v15 + 48, v24, handler))
    {
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022B3878);
      }
      v25 = qword_1024193E8;
      if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v46 = "-[CLEEDCoexMonitorPower initWithQueue:mitigationConfig:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]";
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#EED2CXPB,%{public}s: unable to register for PeakPower notifications", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193E0 != -1) {
          dispatch_once(&qword_1024193E0, &stru_1022B3878);
        }
        *(_DWORD *)__p = 136446210;
        *(void *)&__p[4] = "-[CLEEDCoexMonitorPower initWithQueue:mitigationConfig:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]";
        v30 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorPower initWithQueue:mitigationConfig:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]", "%s\n", v30);
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
      v31[2] = sub_1004698B8;
      v31[3] = &unk_10229FED8;
      v31[4] = v15;
      dispatch_async(v26, v31);
      objc_destroyWeak(&v33);
      objc_destroyWeak(location);
    }
  }
  return (CLEEDCoexMonitorPower *)v15;
}

- (void)dealloc
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022B3878);
  }
  v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v12 = "-[CLEEDCoexMonitorPower dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2CXPB,%{public}s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B3878);
    }
    int v9 = 136446210;
    v10 = "-[CLEEDCoexMonitorPower dealloc]";
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorPower dealloc]", "%s\n", v7);
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
  fCoexPowerForCA = self->_fCoexPowerForCA;
  if (fCoexPowerForCA)
  {

    self->_fCoexPowerForCA = 0;
  }
  self->fQueue = 0;
  v8.receiver = self;
  v8.super_class = (Class)CLEEDCoexMonitorPower;
  [(CLEEDCoexMonitorPower *)&v8 dealloc];
}

- (void)queryPeakPowerLevel
{
  uint64_t state64 = 0;
  if (notify_get_state(self->fToken, &state64))
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B3878);
    }
    v3 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      long long v19 = "-[CLEEDCoexMonitorPower queryPeakPowerLevel]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#EED2CXPB,%{public}s, could not get PeakPowerLevel", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022B3878);
      }
      int v12 = 136446210;
      v13 = "-[CLEEDCoexMonitorPower queryPeakPowerLevel]";
      v4 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitorPower queryPeakPowerLevel]", "%s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
  }
  else
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B3878);
    }
    v5 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      if (!self->fInitialValueReceived) {
        v6 = "YES";
      }
      *(_DWORD *)buf = 136446722;
      long long v19 = "-[CLEEDCoexMonitorPower queryPeakPowerLevel]";
      __int16 v20 = 2082;
      v21 = v6;
      __int16 v22 = 2050;
      uint64_t v23 = state64;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#EED2CXPB,%{public}s, InitialValue:%{public}s, PowerLevel:%{public}llu", buf, 0x20u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022B3878);
      }
      int v9 = "NO";
      if (!self->fInitialValueReceived) {
        int v9 = "YES";
      }
      int v12 = 136446722;
      v13 = "-[CLEEDCoexMonitorPower queryPeakPowerLevel]";
      __int16 v14 = 2082;
      id v15 = v9;
      __int16 v16 = 2050;
      uint64_t v17 = state64;
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorPower queryPeakPowerLevel]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    if (!self->fInitialValueReceived
      || (int v7 = state64, [(CLEEDCoexMonitorPower *)self currentPowerLevel] != v7))
    {
      [(CLEEDCoexMonitorPower *)self processPowerLevelForCA:state64];
      self->fInitialValueReceived = 1;
      [(CLEEDCoexMonitorPower *)self setCurrentPowerLevel:state64];
      id fNotificationCallback = (void (**)(id, id, void))self->fNotificationCallback;
      if (fNotificationCallback) {
        fNotificationCallback[2](fNotificationCallback, [(CLEEDCoexMonitorPower *)self getMitigationForCurrentlevel], 0);
      }
    }
  }
}

- (id)getMitigationForCurrentlevel
{
  p_fMitigationConfig = &self->fMitigationConfig;
  if (self->fMitigationConfig.peakPower.enabled)
  {
    int v4 = [(CLEEDCoexMonitorPower *)self currentPowerLevel];
    if (v4 <= 19)
    {
      if (!v4) {
        goto LABEL_16;
      }
      if (v4 == 10)
      {
        p_fMitigationConfig = (MitigationsConfig *)&self->fMitigationConfig.peakPower.light;
        goto LABEL_16;
      }
    }
    else
    {
      if (v4 == 20)
      {
        p_fMitigationConfig = (MitigationsConfig *)&self->fMitigationConfig.peakPower.moderate;
        goto LABEL_16;
      }
      if (v4 == 30 || v4 == 40)
      {
        p_fMitigationConfig = (MitigationsConfig *)&self->fMitigationConfig.peakPower.heavyAndGreater;
        goto LABEL_16;
      }
    }
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B3878);
    }
    v5 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v14 = "-[CLEEDCoexMonitorPower getMitigationForCurrentlevel]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "#EED2CXPB,%{public}s, unhandled PPPN state", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022B3878);
      }
      int v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitorPower getMitigationForCurrentlevel]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
  }
LABEL_16:
  id v6 = [objc_alloc((Class)CLEEDMitigation) initWithStreamingAllowed:p_fMitigationConfig->nominal.allowNewStreamingRequests framerateFps:p_fMitigationConfig->nominal.maxFramerateFps bitrateKbps:p_fMitigationConfig->nominal.maxStreamingBitrateKbps dropStreaming:p_fMitigationConfig->nominal.dropStreaming uploadAllowed:p_fMitigationConfig->nominal.allowNewMediaRequests uploadMitigation:p_fMitigationConfig->nominal.delayMedia source:3];
  id v7 = v6;
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022B3878);
  }
  objc_super v8 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [(CLEEDCoexMonitorPower *)self currentPowerLevel];
    *(_DWORD *)buf = 136446722;
    __int16 v14 = "-[CLEEDCoexMonitorPower getMitigationForCurrentlevel]";
    __int16 v15 = 1026;
    unsigned int v16 = v9;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#EED2CXPB,%{public}s, PowerLevel:%{public}u, Mitigation:%{public}@", buf, 0x1Cu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B3878);
    }
    [(CLEEDCoexMonitorPower *)self currentPowerLevel];
    v11 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorPower getMitigationForCurrentlevel]", "%s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  return v6;
}

- (void)processPowerLevelForCA:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!self->fInitialValueReceived)
  {
    [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] setPeakPowerAtStartOfCall:*(void *)&a3];
LABEL_6:
    [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] setMaxPeakPowerInCall:v3];
    goto LABEL_7;
  }
  if ([(CLEEDCoexMonitorPower *)self currentPowerLevel] == a3) {
    goto LABEL_8;
  }
  [(CLEEDCoexMonitorPower *)self computePowerLevelDurationForCA];
  if ([(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] maxPeakPowerInCall] < v3)goto LABEL_6; {
LABEL_7:
  }
  [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] setCurrentpeakPowerStartTime:CFAbsoluteTimeGetCurrent()];
LABEL_8:
  [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] setPeakPowerAtEndOfCall:v3];
  if ([(CLEEDCoexMonitorPower *)self fCoexMetricUpdateCallback])
  {
    v5 = (void (*)(void))*((void *)[(CLEEDCoexMonitorPower *)self fCoexMetricUpdateCallback]+ 2);
    v5();
  }
}

- (void)computePowerLevelDurationForCA
{
  int v3 = [(CLEEDCoexMonitorPower *)self currentPowerLevel];
  if (v3 <= 19)
  {
    if (v3)
    {
      if (v3 == 10)
      {
        [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] currentpeakPowerStartTime];
        if (v11 > 0.0)
        {
          [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] peakPowerLightDuration];
          double v13 = v12;
          double Current = CFAbsoluteTimeGetCurrent();
          [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] currentpeakPowerStartTime];
          double v16 = v13 + vabdd_f64(Current, v15);
          __int16 v17 = [(CLEEDCoexMonitorPower *)self fCoexPowerForCA];
          [(CLEEDCoexPowerForCA *)v17 setPeakPowerLightDuration:v16];
        }
      }
    }
    else
    {
      [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] currentpeakPowerStartTime];
      if (v32 > 0.0)
      {
        [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] peakPowerNominalDuration];
        double v34 = v33;
        double v35 = CFAbsoluteTimeGetCurrent();
        [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] currentpeakPowerStartTime];
        double v37 = v34 + vabdd_f64(v35, v36);
        v38 = [(CLEEDCoexMonitorPower *)self fCoexPowerForCA];
        [(CLEEDCoexPowerForCA *)v38 setPeakPowerNominalDuration:v37];
      }
    }
  }
  else
  {
    switch(v3)
    {
      case 20:
        [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] currentpeakPowerStartTime];
        if (v18 > 0.0)
        {
          [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] peakPowerModerateDuration];
          double v20 = v19;
          double v21 = CFAbsoluteTimeGetCurrent();
          [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] currentpeakPowerStartTime];
          double v23 = v20 + vabdd_f64(v21, v22);
          v24 = [(CLEEDCoexMonitorPower *)self fCoexPowerForCA];
          [(CLEEDCoexPowerForCA *)v24 setPeakPowerModerateDuration:v23];
        }
        break;
      case 30:
        [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] currentpeakPowerStartTime];
        if (v25 > 0.0)
        {
          [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] peakPowerHeavyDuration];
          double v27 = v26;
          double v28 = CFAbsoluteTimeGetCurrent();
          [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] currentpeakPowerStartTime];
          double v30 = v27 + vabdd_f64(v28, v29);
          v31 = [(CLEEDCoexMonitorPower *)self fCoexPowerForCA];
          [(CLEEDCoexPowerForCA *)v31 setPeakPowerHeavyDuration:v30];
        }
        break;
      case 40:
        [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] currentpeakPowerStartTime];
        if (v4 > 0.0)
        {
          [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] peakPowerCriticalDuration];
          double v6 = v5;
          double v7 = CFAbsoluteTimeGetCurrent();
          [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] currentpeakPowerStartTime];
          double v9 = v6 + vabdd_f64(v7, v8);
          v10 = [(CLEEDCoexMonitorPower *)self fCoexPowerForCA];
          [(CLEEDCoexPowerForCA *)v10 setPeakPowerCriticalDuration:v9];
        }
        break;
    }
  }
}

- (void)updateCoexMetricDict:(id *)a3 forCASubmission:(BOOL)a4
{
  if (a3 && *a3)
  {
    BOOL v5 = a4;
    if ([(CLEEDCoexMonitorPower *)self fCoexPowerForCA])
    {
      if (v5)
      {
        [(CLEEDCoexMonitorPower *)self computePowerLevelDurationForCA];
        id v7 = *a3;
        [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] peakPowerNominalDuration];
        LODWORD(v9) = vcvtpd_s64_f64(v8 * 1000.0);
        [v7 setValue:[NSNumber numberWithInt:v9] forKey:@"peakPowerNominalDuration"];
        id v10 = *a3;
        [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] peakPowerLightDuration];
        LODWORD(v12) = vcvtpd_s64_f64(v11 * 1000.0);
        [v10 setValue:[NSNumber numberWithInt:v12] forKey:@"peakPowerLightDuration"];
        id v13 = *a3;
        [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] peakPowerModerateDuration];
        LODWORD(v15) = vcvtpd_s64_f64(v14 * 1000.0);
        [v13 setValue:[NSNumber numberWithInt:v15] forKey:@"peakPowerModerateDuration"];
        id v16 = *a3;
        [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] peakPowerHeavyDuration];
        LODWORD(v18) = vcvtpd_s64_f64(v17 * 1000.0);
        [v16 setValue:[NSNumber numberWithInt:v18] forKey:@"peakPowerHeavyDuration"];
        id v19 = *a3;
        [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] peakPowerCriticalDuration];
        LODWORD(v21) = vcvtpd_s64_f64(v20 * 1000.0);
        double v22 = +[NSNumber numberWithInt:v21];
        CFStringRef v23 = @"peakPowerCriticalDuration";
      }
      else
      {
        id v26 = *a3;
        [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] peakPowerNominalDuration];
        [v26 setValue:[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:") forKey:@"peakPowerNominalDuration"];
        id v27 = *a3;
        [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] peakPowerLightDuration];
        [v27 setValue:[NSNumber numberWithDouble:] forKey:@"peakPowerLightDuration"];
        id v28 = *a3;
        [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] peakPowerModerateDuration];
        [v28 setValue:[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:") forKey:@"peakPowerModerateDuration"];
        id v29 = *a3;
        [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] peakPowerHeavyDuration];
        [v29 setValue:[NSNumber numberWithDouble:] forKey:@"peakPowerHeavyDuration"];
        id v30 = *a3;
        [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] peakPowerCriticalDuration];
        [v30 setValue:[NSNumber numberWithDouble:] forKey:@"peakPowerCriticalDuration"];
        id v19 = *a3;
        [(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] currentpeakPowerStartTime];
        double v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        CFStringRef v23 = @"currentpeakPowerStartTime";
      }
      [v19 setValue:v22 forKey:v23];
      [*a3 setValue:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLEEDCoexPowerForCA peakPowerAtStartOfCall](-[CLEEDCoexMonitorPower fCoexPowerForCA](self, "fCoexPowerForCA"), "peakPowerAtStartOfCall")) forKey:@"peakPowerAtStartOfCall"];
      [*a3 setValue:[NSNumber numberWithInt:][CLEEDCoexPowerForCA maxPeakPowerInCall][-[CLEEDCoexMonitorPower fCoexPowerForCA](self, "fCoexPowerForCA") maxPeakPowerInCall] forKey:@"maxPeakPowerInCall"];
      id v31 = *a3;
      double v32 = +[NSNumber numberWithInt:[(CLEEDCoexPowerForCA *)[(CLEEDCoexMonitorPower *)self fCoexPowerForCA] peakPowerAtEndOfCall]];
      [v31 setValue:v32 forKey:@"peakPowerAtEndOfCall"];
      return;
    }
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B3878);
    }
    double v25 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      double v35 = "-[CLEEDCoexMonitorPower updateCoexMetricDict:forCASubmission:]";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "#EED2CXPB,%{public}s, nil fCoexPowerForCA", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 == -1)
      {
LABEL_24:
        double v33 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitorPower updateCoexMetricDict:forCASubmission:]", "%s\n", v33);
        if (v33 != (char *)buf) {
          free(v33);
        }
        return;
      }
LABEL_26:
      dispatch_once(&qword_1024193E0, &stru_1022B3878);
      goto LABEL_24;
    }
  }
  else
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B3878);
    }
    v24 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      double v35 = "-[CLEEDCoexMonitorPower updateCoexMetricDict:forCASubmission:]";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "#EED2CXPB,%{public}s, nil metricDict", buf, 0xCu);
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

- (unsigned)currentPowerLevel
{
  return self->_currentPowerLevel;
}

- (void)setCurrentPowerLevel:(unsigned int)a3
{
  self->_currentPowerLevel = a3;
}

- (id)fCoexMetricUpdateCallback
{
  return self->_fCoexMetricUpdateCallback;
}

- (void)setFCoexMetricUpdateCallback:(id)a3
{
  self->_id fCoexMetricUpdateCallback = a3;
}

- (CLEEDCoexPowerForCA)fCoexPowerForCA
{
  return self->_fCoexPowerForCA;
}

- (void)setFCoexPowerForCA:(id)a3
{
  self->_fCoexPowerForCA = (CLEEDCoexPowerForCA *)a3;
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