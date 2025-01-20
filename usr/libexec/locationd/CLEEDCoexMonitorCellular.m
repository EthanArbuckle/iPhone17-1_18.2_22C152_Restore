@interface CLEEDCoexMonitorCellular
- (BOOL)allowFetchingRSRP;
- (BOOL)combinedFavorableConditions;
- (BOOL)favorableCellularConditions;
- (BOOL)initialCellParamsDeemedReceived;
- (BOOL)onImpactedFrequency;
- (BOOL)supportedRat;
- (BOOL)wifiAvailable;
- (CLEEDCoexCellularForCA)fCoexCellularForCA;
- (CLEEDCoexMonitorCellular)initWithUniverse:(id)a3 mitigationConfig:(MitigationsConfig *)a4 activeSim:(int)a5 Rat:(int)a6 wifiEmergency:(BOOL)a7 cachedCoexMetricData:(id)a8 eventCB:(id)a9 coexMetricUpdateCB:(id)a10;
- (id).cxx_construct;
- (id)BandInfoTypeAsString:(int64_t)a3;
- (id)bandAsString:(int64_t)a3 forRAT:(int)a4;
- (id)fCoexMetricUpdateCallback;
- (id)getCurrentMitigation;
- (id)ratAsString:(int)a3;
- (int64_t)averageRSRP;
- (int64_t)emergencyBottleneckState;
- (int64_t)mostRecentRsrpValue;
- (int64_t)ulCenterFrequency;
- (void)checkAndRestartRsrpTimer;
- (void)checkAndSendMitigation;
- (void)dealloc;
- (void)fetchSignalStrengthMeasurements;
- (void)handleAverageRsrpUpdate:(int64_t)a3;
- (void)handleReachability:(int)a3;
- (void)handleUpdatesToSim:(int)a3 Rat:(int)a4 WifiEmergency:(BOOL)a5 bandInfo:(int)a6;
- (void)handleUplinkFrequency:(id)a3;
- (void)handleVlqmForActiveCall:(int)a3;
- (void)processAverageRSRPForCA:(int64_t)a3;
- (void)queryEmergencyBottleneck;
- (void)setAverageRSRP:(int64_t)a3;
- (void)setEmergencyBottleneckState:(int64_t)a3;
- (void)setFCoexCellularForCA:(id)a3;
- (void)setFCoexMetricUpdateCallback:(id)a3;
- (void)setUlCenterFrequency:(int64_t)a3;
- (void)setWifiAvailable:(BOOL)a3;
- (void)storeRsrpUpdate:(id)a3;
- (void)updateCoexMetricDict:(id *)a3 forCASubmission:(BOOL)a4;
@end

@implementation CLEEDCoexMonitorCellular

- (BOOL)favorableCellularConditions
{
  BOOL v3 = [(CLEEDCoexMonitorCellular *)self supportedRat];
  if (v3)
  {
    if ([(CLEEDCoexMonitorCellular *)self onImpactedFrequency]) {
      LOBYTE(v3) = [(CLEEDCoexMonitorCellular *)self averageRSRP] >= self->fMitigationConfig.cellular.rsrpThresholddBm;
    }
    else {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (BOOL)combinedFavorableConditions
{
  if (!self->fMitigationConfig.cellular.enabled
    || [(CLEEDCoexMonitorCellular *)self wifiAvailable]
    || self->fWifiEmergency)
  {
    return 1;
  }

  return [(CLEEDCoexMonitorCellular *)self favorableCellularConditions];
}

- (id)getCurrentMitigation
{
  unsigned int v3 = [(CLEEDCoexMonitorCellular *)self combinedFavorableConditions];
  uint64_t v4 = 168;
  if (v3) {
    uint64_t v4 = 128;
  }
  v5 = (unsigned __int8 *)self + v4;
  id v6 = [objc_alloc((Class)CLEEDMitigation) initWithStreamingAllowed:*v5 framerateFps:*((int *)v5 + 1) bitrateKbps:*((int *)v5 + 2) dropStreaming:v5[12] uploadAllowed:v5[1] uploadMitigation:*((unsigned __int8 *)&self->fUniverse + v4 + 5) source:4];
  id v7 = v6;
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022DD770);
  }
  v8 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v12 = "-[CLEEDCoexMonitorCellular getCurrentMitigation]";
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, Mitigation:%{public}@", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular getCurrentMitigation]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  return v6;
}

- (void)checkAndSendMitigation
{
  if (!self->fNotificationCallback)
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    v8 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v15 = "-[CLEEDCoexMonitorCellular checkAndSendMitigation]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#EED2CXCL,%{public}s, NotificationCallback is nil, early return", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    v9 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitorCellular checkAndSendMitigation]", "%s\n");
LABEL_29:
    if (v9 != buf) {
      free(v9);
    }
    return;
  }
  unsigned int v3 = [(CLEEDCoexMonitorCellular *)self initialCellParamsDeemedReceived];
  unsigned int v4 = v3;
  if (self->fWifiInitialValueReceived && (v3 & 1) != 0)
  {
    fNotificationCallback = self->fNotificationCallback;
    id v6 = [(CLEEDCoexMonitorCellular *)self getCurrentMitigation];
    id v7 = (void (*)(void *, id, void))fNotificationCallback[2];
    v7(fNotificationCallback, v6, 0);
    return;
  }
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022DD770);
  }
  v10 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = "received";
    BOOL v12 = !self->fWifiInitialValueReceived;
    v15 = "-[CLEEDCoexMonitorCellular checkAndSendMitigation]";
    if (v12) {
      __int16 v13 = "nil";
    }
    else {
      __int16 v13 = "received";
    }
    *(_DWORD *)buf = 136446722;
    v17 = v13;
    __int16 v16 = 2082;
    if (!v4) {
      v11 = "nil";
    }
    __int16 v18 = 2082;
    v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, Awaiting initial mitigations, wifi:%{public}s, cellParams:%{public}s", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    v9 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular checkAndSendMitigation]", "%s\n");
    goto LABEL_29;
  }
}

- (id)ratAsString:(int)a3
{
  if ((a3 - 1) > 0xB) {
    return @"GSM";
  }
  else {
    return off_1022DD790[a3 - 1];
  }
}

- (id)bandAsString:(int64_t)a3 forRAT:(int)a4
{
  if (a4 == 10)
  {
    CFStringRef v4 = @"NR Band %ld";
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, a3);
  }
  if (a4 == 6)
  {
    CFStringRef v4 = @"LTE Band %ld";
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, a3);
  }
  return @"-1";
}

- (BOOL)supportedRat
{
  return (self->fActiveRat > 0xCu) | (0x440u >> self->fActiveRat) & 1;
}

- (BOOL)initialCellParamsDeemedReceived
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022DD770);
  }
  unsigned int v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    if (self->fWifiEmergency) {
      CFStringRef v4 = "YES";
    }
    else {
      CFStringRef v4 = "NO";
    }
    id v5 = [[-[CLEEDCoexMonitorCellular ratAsString:](self, "ratAsString:", self->fActiveRat) UTF8String];
    if (self->fULFreqInitalValueReceived) {
      id v6 = "YES";
    }
    else {
      id v6 = "NO";
    }
    if (self->fRSRPInitialValueReceived) {
      id v7 = "YES";
    }
    else {
      id v7 = "NO";
    }
    *(_DWORD *)buf = 136447234;
    v11 = "-[CLEEDCoexMonitorCellular initialCellParamsDeemedReceived]";
    __int16 v12 = 2082;
    __int16 v13 = v4;
    __int16 v14 = 2082;
    id v15 = v5;
    __int16 v16 = 2082;
    v17 = v6;
    __int16 v18 = 2082;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, wifiEmergency:%{public}s, rat:%{public}s, ulFreqReceived:%{public}s, rsrpReceived:%{public}s", buf, 0x34u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    [self ratAsString:self->fActiveRat];
    v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular initialCellParamsDeemedReceived]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  if (self->fWifiEmergency || ![(CLEEDCoexMonitorCellular *)self supportedRat]) {
    return 1;
  }
  if (self->fULFreqInitalValueReceived) {
    return self->fRSRPInitialValueReceived;
  }
  return 0;
}

- (BOOL)allowFetchingRSRP
{
  if (self->fActiveSim == 255 || self->fWifiEmergency) {
    return 0;
  }
  else {
    return [(CLEEDCoexMonitorCellular *)self supportedRat];
  }
}

- (void)checkAndRestartRsrpTimer
{
  fRsrpTimer = self->fRsrpTimer;
  if (fRsrpTimer)
  {
    [(CLTimer *)fRsrpTimer invalidate];

    self->fRsrpTimer = 0;
  }
  if ([(CLEEDCoexMonitorCellular *)self allowFetchingRSRP])
  {
    objc_initWeak(&location, self);
    self->fRsrpTimer = (CLTimer *)[[-[CLIntersiloUniverse silo](self->fUniverse, "silo") newTimer];
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    CFStringRef v4 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v29 = "-[CLEEDCoexMonitorCellular checkAndRestartRsrpTimer]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s,fRsrpTimer created", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022DD770);
      }
      int v20 = 136446210;
      v21 = "-[CLEEDCoexMonitorCellular checkAndRestartRsrpTimer]";
      id v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular checkAndRestartRsrpTimer]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
    id v5 = self->fRsrpTimer;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100AEB96C;
    v17[3] = &unk_1022B20F8;
    objc_copyWeak(&v18, &location);
    [(CLTimer *)v5 setHandler:v17];
    [(CLTimer *)self->fRsrpTimer setNextFireDelay:0.01 interval:self->fMitigationConfig.cellular.rsrpQueryRateSecs];
    if (!self->fRsrpTimer)
    {
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022DD770);
      }
      id v6 = qword_1024193E8;
      if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[CLEEDCoexMonitorCellular checkAndRestartRsrpTimer]";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#EED2CXCL,%{public}s, rsrpTimer creation failure!", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193E0 != -1) {
          dispatch_once(&qword_1024193E0, &stru_1022DD770);
        }
        int v20 = 136446210;
        v21 = "-[CLEEDCoexMonitorCellular checkAndRestartRsrpTimer]";
        __int16 v16 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitorCellular checkAndRestartRsrpTimer]", "%s\n", v16);
        if (v16 != (char *)buf) {
          free(v16);
        }
      }
      [(CLEEDCoexMonitorCellular *)self fetchSignalStrengthMeasurements];
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    id v7 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
    {
      if (self->fWifiEmergency) {
        v8 = "YES";
      }
      else {
        v8 = "NO";
      }
      id v9 = [[-[CLEEDCoexMonitorCellular ratAsString:](self, "ratAsString:", self->fActiveRat) UTF8String];
      int fActiveSim = self->fActiveSim;
      *(_DWORD *)buf = 136446978;
      v29 = "-[CLEEDCoexMonitorCellular checkAndRestartRsrpTimer]";
      __int16 v30 = 2082;
      v31 = v8;
      __int16 v32 = 2082;
      id v33 = v9;
      __int16 v34 = 1026;
      int v35 = fActiveSim;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, wifiEmergency:%{public}s, rat:%{public}s, sim:%{public}d, rsrpTimer stopped. Resetting RSRP to default", buf, 0x26u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022DD770);
      }
      if (self->fWifiEmergency) {
        v11 = "YES";
      }
      else {
        v11 = "NO";
      }
      id v12 = [[-[CLEEDCoexMonitorCellular ratAsString:](self, "ratAsString:", self->fActiveRat) UTF8String];
      int v13 = self->fActiveSim;
      int v20 = 136446978;
      v21 = "-[CLEEDCoexMonitorCellular checkAndRestartRsrpTimer]";
      __int16 v22 = 2082;
      v23 = v11;
      __int16 v24 = 2082;
      id v25 = v12;
      __int16 v26 = 1026;
      int v27 = v13;
      __int16 v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular checkAndRestartRsrpTimer]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
  }
}

- (void)handleAverageRsrpUpdate:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)[-[CLIntersiloUniverse silo](self->fUniverse, "silo") queue]);
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022DD770);
  }
  id v5 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    if (self->fRSRPInitialValueReceived) {
      id v6 = "NO";
    }
    else {
      id v6 = "YES";
    }
    *(_DWORD *)buf = 136446978;
    int v13 = "-[CLEEDCoexMonitorCellular handleAverageRsrpUpdate:]";
    __int16 v14 = 2082;
    id v15 = v6;
    __int16 v16 = 2050;
    int64_t v17 = a3;
    __int16 v18 = 2050;
    int64_t v19 = [(CLEEDCoexMonitorCellular *)self averageRSRP];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, InitialValue:%{public}s, incomingAverageRSRP:%{public}ld, existingAverageRSRP:%{public}ld", buf, 0x2Au);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    [(CLEEDCoexMonitorCellular *)self averageRSRP];
    v11 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular handleAverageRsrpUpdate:]", "%s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  if (!self->fRSRPInitialValueReceived)
  {
    self->fRSRPInitialValueReceived = 1;
LABEL_15:
    [(CLEEDCoexMonitorCellular *)self setAverageRSRP:a3];
LABEL_16:
    [(CLEEDCoexMonitorCellular *)self checkAndSendMitigation];
    return;
  }
  int64_t rsrpThresholddBm = self->fMitigationConfig.cellular.rsrpThresholddBm;
  if (rsrpThresholddBm > a3)
  {
    int64_t v8 = [(CLEEDCoexMonitorCellular *)self averageRSRP];
    int64_t rsrpThresholddBm = self->fMitigationConfig.cellular.rsrpThresholddBm;
    if (v8 >= rsrpThresholddBm) {
      goto LABEL_15;
    }
  }
  if (rsrpThresholddBm > a3)
  {
    [(CLEEDCoexMonitorCellular *)self setAverageRSRP:a3];
    return;
  }
  int64_t v9 = [(CLEEDCoexMonitorCellular *)self averageRSRP];
  int64_t v10 = self->fMitigationConfig.cellular.rsrpThresholddBm;
  [(CLEEDCoexMonitorCellular *)self setAverageRSRP:a3];
  if (v9 < v10) {
    goto LABEL_16;
  }
}

- (void)storeRsrpUpdate:(id)a3
{
  [a3 intValue];
  if (([a3 intValue] & 0x80000000) == 0)
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    id v5 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v43 = "-[CLEEDCoexMonitorCellular storeRsrpUpdate:]";
      __int16 v44 = 2114;
      unint64_t v45 = (unint64_t)a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#EED2CXCL,%{public}s, Invalid rsrp:%{public}@", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022DD770);
      }
      id v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitorCellular storeRsrpUpdate:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
    return;
  }
  begin = self->fArrayRsrpValues.__begin_;
  end = self->fArrayRsrpValues.__end_;
  p_fArrayRsrpValues = &self->fArrayRsrpValues;
  if (self->fMitigationConfig.cellular.rsrpSamplesToAvg <= (unint64_t)(end - begin))
  {
    int64_t v19 = (char *)end - (char *)(begin + 1);
    if (end != begin + 1) {
      memmove(self->fArrayRsrpValues.__begin_, begin + 1, (char *)end - (char *)(begin + 1));
    }
    self->fArrayRsrpValues.__end_ = (int *)((char *)begin + v19);
    unsigned int v10 = [a3 intValue];
    id v12 = self->fArrayRsrpValues.__end_;
    value = self->fArrayRsrpValues.__end_cap_.__value_;
    if (v12 >= value)
    {
      int v13 = p_fArrayRsrpValues->__begin_;
      uint64_t v22 = v12 - p_fArrayRsrpValues->__begin_;
      unint64_t v23 = v22 + 1;
      if (!((unint64_t)(v22 + 1) >> 62))
      {
        uint64_t v24 = (char *)value - (char *)v13;
        if (v24 >> 1 > v23) {
          unint64_t v23 = v24 >> 1;
        }
        if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v25 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v25 = v23;
        }
        if (v25)
        {
          __int16 v26 = (char *)sub_10017EA34((uint64_t)&self->fArrayRsrpValues.__end_cap_, v25);
          int v13 = self->fArrayRsrpValues.__begin_;
          id v12 = self->fArrayRsrpValues.__end_;
        }
        else
        {
          __int16 v26 = 0;
        }
        int v27 = (int *)&v26[4 * v22];
        v28 = (int *)&v26[4 * v25];
        *int v27 = v10;
        v21 = v27 + 1;
        while (v12 != v13)
        {
          int v30 = *--v12;
          *--int v27 = v30;
        }
        goto LABEL_41;
      }
LABEL_60:
      sub_1001D7FD4();
    }
  }
  else
  {
    unsigned int v10 = [a3 intValue];
    v11 = self->fArrayRsrpValues.__end_cap_.__value_;
    id v12 = self->fArrayRsrpValues.__end_;
    if (v12 >= v11)
    {
      int v13 = p_fArrayRsrpValues->__begin_;
      uint64_t v14 = v12 - p_fArrayRsrpValues->__begin_;
      unint64_t v15 = v14 + 1;
      if (!((unint64_t)(v14 + 1) >> 62))
      {
        uint64_t v16 = (char *)v11 - (char *)v13;
        if (v16 >> 1 > v15) {
          unint64_t v15 = v16 >> 1;
        }
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v17 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v17 = v15;
        }
        if (v17)
        {
          __int16 v18 = (char *)sub_10017EA34((uint64_t)&self->fArrayRsrpValues.__end_cap_, v17);
          int v13 = self->fArrayRsrpValues.__begin_;
          id v12 = self->fArrayRsrpValues.__end_;
        }
        else
        {
          __int16 v18 = 0;
        }
        int v27 = (int *)&v18[4 * v14];
        v28 = (int *)&v18[4 * v17];
        *int v27 = v10;
        v21 = v27 + 1;
        while (v12 != v13)
        {
          int v29 = *--v12;
          *--int v27 = v29;
        }
LABEL_41:
        self->fArrayRsrpValues.__begin_ = v27;
        self->fArrayRsrpValues.__end_ = v21;
        self->fArrayRsrpValues.__end_cap_.__value_ = v28;
        if (v13) {
          operator delete(v13);
        }
        goto LABEL_43;
      }
      goto LABEL_60;
    }
  }
  int *v12 = v10;
  v21 = v12 + 1;
LABEL_43:
  self->fArrayRsrpValues.__end_ = v21;
  v31 = self->fArrayRsrpValues.__begin_;
  unint64_t v32 = v21 - v31;
  if (v32 >= self->fMitigationConfig.cellular.rsrpSamplesToAvg)
  {
    if (v31 == v21)
    {
      double v35 = 0.0;
    }
    else
    {
      uint64_t v33 = 0;
      do
      {
        uint64_t v34 = *v31++;
        v33 += v34;
      }
      while (v31 != v21);
      double v35 = (double)v33;
    }
    double v36 = v35 / (double)v32;
    if (qword_1024193E0 != -1)
    {
      double v41 = v36;
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
      double v36 = v41;
    }
    unint64_t v37 = llround(v36);
    v38 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
    {
      int64_t v39 = self->fArrayRsrpValues.__end_ - self->fArrayRsrpValues.__begin_;
      *(_DWORD *)buf = 136446722;
      v43 = "-[CLEEDCoexMonitorCellular storeRsrpUpdate:]";
      __int16 v44 = 2050;
      unint64_t v45 = v37;
      __int16 v46 = 2050;
      int64_t v47 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "#EED2CXCL,%{public}s, averageRsrp:%{public}ld, size:%{public}lu", buf, 0x20u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022DD770);
      }
      v40 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular storeRsrpUpdate:]", "%s\n", v40);
      if (v40 != (char *)buf) {
        free(v40);
      }
    }
    [(CLEEDCoexMonitorCellular *)self processAverageRSRPForCA:v37];
    [(CLEEDCoexMonitorCellular *)self handleAverageRsrpUpdate:v37];
  }
}

- (int64_t)mostRecentRsrpValue
{
  end = self->fArrayRsrpValues.__end_;
  if (end == self->fArrayRsrpValues.__begin_) {
    return -150;
  }
  else {
    return *(end - 1);
  }
}

- (void)fetchSignalStrengthMeasurements
{
  if ([(CLEEDCoexMonitorCellular *)self allowFetchingRSRP])
  {
    id v3 = [[-[CLIntersiloUniverse vendor](self->fUniverse, "vendor") proxyForService:@"CLTelephonyService"];
    [v3 registerDelegate:sub_1000C86C4((uint64_t)&self->fCallbackDropManager) inSilo:-[CLIntersiloUniverse silo](self->fUniverse, "silo")];
    objc_initWeak((id *)location, self);
    uint64_t fActiveSim = self->fActiveSim;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100AEC700;
    v15[3] = &unk_1022DD728;
    objc_copyWeak(&v16, (id *)location);
    [v3 fetchSignalStrengthMeasurementForSim:fActiveSim withReply:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)location);
  }
  else
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    id v5 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = self->fActiveSim;
      id v7 = [[-[CLEEDCoexMonitorCellular ratAsString:](self, "ratAsString:", self->fActiveRat) UTF8String];
      BOOL fWifiEmergency = self->fWifiEmergency;
      *(void *)&location[4] = "-[CLEEDCoexMonitorCellular fetchSignalStrengthMeasurements]";
      __int16 v26 = 2050;
      *(_DWORD *)id location = 136446978;
      if (fWifiEmergency) {
        int64_t v9 = "YES";
      }
      else {
        int64_t v9 = "NO";
      }
      uint64_t v27 = v6;
      __int16 v28 = 2082;
      id v29 = v7;
      __int16 v30 = 2082;
      v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, cannot fetch RSRP, activeSim:%{public}ld, activeRat:%{public}s, wifiEmergency:%{public}s", location, 0x2Au);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(location, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022DD770);
      }
      uint64_t v10 = self->fActiveSim;
      id v11 = [[-[CLEEDCoexMonitorCellular ratAsString:](self, "ratAsString:", self->fActiveRat) UTF8String];
      BOOL v12 = self->fWifiEmergency;
      int v17 = 136446978;
      __int16 v19 = 2050;
      __int16 v18 = "-[CLEEDCoexMonitorCellular fetchSignalStrengthMeasurements]";
      if (v12) {
        int v13 = "YES";
      }
      else {
        int v13 = "NO";
      }
      uint64_t v20 = v10;
      __int16 v21 = 2082;
      id v22 = v11;
      __int16 v23 = 2082;
      uint64_t v24 = v13;
      uint64_t v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular fetchSignalStrengthMeasurements]", "%s\n", v14);
      if (v14 != location) {
        free(v14);
      }
    }
  }
}

- (void)handleReachability:(int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)[-[CLIntersiloUniverse silo](self->fUniverse, "silo") queue]);
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022DD770);
  }
  id v5 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = "NO";
    BOOL fWifiEmergency = self->fWifiEmergency;
    if (self->fWifiInitialValueReceived) {
      int64_t v8 = "NO";
    }
    else {
      int64_t v8 = "YES";
    }
    *(_DWORD *)buf = 136447234;
    uint64_t v14 = "-[CLEEDCoexMonitorCellular handleReachability:]";
    __int16 v15 = 2082;
    if (a3 == 2) {
      int64_t v9 = "YES";
    }
    else {
      int64_t v9 = "NO";
    }
    id v16 = v8;
    __int16 v17 = 2082;
    if (fWifiEmergency) {
      uint64_t v6 = "YES";
    }
    __int16 v18 = v9;
    __int16 v19 = 2050;
    uint64_t v20 = a3;
    __int16 v21 = 2082;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, InitialValue:%{public}s, wifiAvailable:%{public}s, reachability:%{public}ld, wifiEmergency:%{public}s", buf, 0x34u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    BOOL v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular handleReachability:]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  BOOL fWifiInitialValueReceived = self->fWifiInitialValueReceived;
  if (self->fWifiInitialValueReceived)
  {
    if ((a3 == 2) == [(CLEEDCoexMonitorCellular *)self wifiAvailable]) {
      return;
    }
  }
  else
  {
    self->BOOL fWifiInitialValueReceived = 1;
  }
  [(CLEEDCoexMonitorCellular *)self setWifiAvailable:a3 == 2];
  if (![(CLEEDCoexMonitorCellular *)self initialCellParamsDeemedReceived])
  {
    if (fWifiInitialValueReceived) {
      return;
    }
    goto LABEL_23;
  }
  unsigned __int8 v11 = [(CLEEDCoexMonitorCellular *)self favorableCellularConditions];
  if (!fWifiInitialValueReceived || (v11 & 1) == 0) {
LABEL_23:
  }
    [(CLEEDCoexMonitorCellular *)self checkAndSendMitigation];
}

- (void)handleUpdatesToSim:(int)a3 Rat:(int)a4 WifiEmergency:(BOOL)a5 bandInfo:(int)a6
{
  int v7 = a5;
  uint64_t v8 = *(void *)&a4;
  dispatch_assert_queue_V2((dispatch_queue_t)[-[CLIntersiloUniverse silo](self->fUniverse, "silo") queue]);
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022DD770);
  }
  unsigned __int8 v11 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    if (self->fActiveSim == a3) {
      BOOL v12 = "NO";
    }
    else {
      BOOL v12 = "YES";
    }
    id v13 = [[-[CLEEDCoexMonitorCellular ratAsString:](self, "ratAsString:", v8) UTF8String];
    if (self->fActiveRat == v8) {
      uint64_t v14 = "NO";
    }
    else {
      uint64_t v14 = "YES";
    }
    int fWifiEmergency = self->fWifiEmergency;
    if (v7) {
      id v16 = "YES";
    }
    else {
      id v16 = "NO";
    }
    *(_DWORD *)buf = 136447746;
    id v22 = "-[CLEEDCoexMonitorCellular handleUpdatesToSim:Rat:WifiEmergency:bandInfo:]";
    if (fWifiEmergency == v7) {
      __int16 v17 = "NO";
    }
    else {
      __int16 v17 = "YES";
    }
    __int16 v23 = 2050;
    uint64_t v24 = a3;
    __int16 v25 = 2082;
    __int16 v26 = v12;
    __int16 v27 = 2082;
    id v28 = v13;
    __int16 v29 = 2082;
    __int16 v30 = v14;
    __int16 v31 = 2082;
    unint64_t v32 = v16;
    __int16 v33 = 2082;
    uint64_t v34 = v17;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, sim:%{public}ld, simChanged:%{public}s, rat:%{public}s, ratChanged:%{public}s, wifiEmergency:%{public}s, wifiEmergencyChanged:%{public}s", buf, 0x48u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    [[-[CLEEDCoexMonitorCellular ratAsString:](self, "ratAsString:", v8) UTF8String];
    uint64_t v20 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular handleUpdatesToSim:Rat:WifiEmergency:bandInfo:]", "%s\n", v20);
    if (v20 != (char *)buf) {
      free(v20);
    }
  }
  int fActiveRat = self->fActiveRat;
  if (fActiveRat != v8)
  {
    self->int fActiveRat = v8;
    self->fArrayRsrpValues.__end_ = self->fArrayRsrpValues.__begin_;
  }
  if (self->fActiveSim != a3)
  {
    self->uint64_t fActiveSim = a3;
    begin = self->fArrayRsrpValues.__begin_;
    self->fArrayRsrpValues.__end_ = begin;
    if (self->fWifiEmergency == v7) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (self->fWifiEmergency != v7)
  {
    begin = self->fArrayRsrpValues.__begin_;
LABEL_27:
    self->int fWifiEmergency = v7;
    self->fArrayRsrpValues.__end_ = begin;
    goto LABEL_28;
  }
  if (fActiveRat != v8)
  {
LABEL_28:
    [(CLEEDCoexMonitorCellular *)self checkAndRestartRsrpTimer];
    [(CLEEDCoexMonitorCellular *)self checkAndSendMitigation];
  }
  if ([(CLEEDCoexMonitorCellular *)self fCoexCellularForCA])
  {
    [(CLEEDCoexCellularForCA *)[(CLEEDCoexMonitorCellular *)self fCoexCellularForCA] setCellularBand:a6];
    [(CLEEDCoexCellularForCA *)[(CLEEDCoexMonitorCellular *)self fCoexCellularForCA] setCellularRAT:v8];
    if ([(CLEEDCoexMonitorCellular *)self fCoexMetricUpdateCallback]) {
      (*((void (**)(void))[(CLEEDCoexMonitorCellular *)self fCoexMetricUpdateCallback] + 2))();
    }
  }
}

- (void)handleVlqmForActiveCall:(int)a3
{
  dispatch_assert_queue_V2([-[CLIntersiloUniverse silo](self->fUniverse, "silo") queue]);
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022DD770);
  }
  CFStringRef v4 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v7 = "-[CLEEDCoexMonitorCellular handleVlqmForActiveCall:]";
    __int16 v8 = 1026;
    int v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, voiceLQM:%{public}d", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    id v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular handleVlqmForActiveCall:]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
}

- (void)handleUplinkFrequency:(id)a3
{
  if (a3)
  {
    uint64_t v5 = [(int)[a3 objectForKeyedSubscript:@"ULCenterFrequency"] intValue];
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    uint64_t v6 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      BOOL v12 = "-[CLEEDCoexMonitorCellular handleUplinkFrequency:]";
      __int16 v13 = 2114;
      id v14 = a3;
      __int16 v15 = 2082;
      id v16 = [[-[CLEEDCoexMonitorCellular BandInfoTypeAsString:](self, "BandInfoTypeAsString:", (int)[objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"BandInfoType"), "intValue")]) UTF8String];
      __int16 v17 = 2050;
      uint64_t v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, UL Frequency Info callback, Dict:%{public}@, Band:%{public}s CenterFrequency:%{public}ld", buf, 0x2Au);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022DD770);
      }
      [CLEEDCoexMonitorCellular BandInfoTypeAsString:self BandInfoTypeAsString:[objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"BandInfoType"), "intValue") UTF8String]];
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular handleUplinkFrequency:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    if (self->fULFreqInitalValueReceived)
    {
      int64_t v7 = [(CLEEDCoexMonitorCellular *)self ulCenterFrequency];
      [(CLEEDCoexMonitorCellular *)self setUlCenterFrequency:v5];
      if (v7 == v5) {
        return;
      }
    }
    else
    {
      self->fULFreqInitalValueReceived = 1;
      [(CLEEDCoexMonitorCellular *)self setUlCenterFrequency:v5];
    }
    [(CLEEDCoexMonitorCellular *)self checkAndSendMitigation];
  }
  else
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    __int16 v8 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      BOOL v12 = "-[CLEEDCoexMonitorCellular handleUplinkFrequency:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#EED2CXCL,%{public}s, ULFrequencyInfo is nil.", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022DD770);
      }
      int v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitorCellular handleUplinkFrequency:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
  }
}

- (BOOL)onImpactedFrequency
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022DD770);
  }
  id v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int64_t v7 = "-[CLEEDCoexMonitorCellular onImpactedFrequency]";
    __int16 v8 = 2050;
    int64_t v9 = [(CLEEDCoexMonitorCellular *)self ulCenterFrequency];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, ulCenterFrequency:%{public}ld", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    [(CLEEDCoexMonitorCellular *)self ulCenterFrequency];
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular onImpactedFrequency]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  return ![(CLEEDCoexMonitorCellular *)self ulCenterFrequency]
      || [(CLEEDCoexMonitorCellular *)self ulCenterFrequency] >= self->fMitigationConfig.cellular.ulFreqThresholdMHz;
}

- (id)BandInfoTypeAsString:(int64_t)a3
{
  if (a3 > 15)
  {
    switch(a3)
    {
      case 16:
        return @"HDR";
      case 32:
        return @"WCDMA";
      case 64:
        return @"NR5G";
      default:
        return @"Unknown";
    }
  }
  else
  {
    id result = @"LTE";
    switch(a3)
    {
      case 1:
        return result;
      case 2:
        id result = @"TDSCDMA";
        break;
      case 4:
        id result = @"GSM";
        break;
      case 8:
        id result = @"CDMA";
        break;
      default:
        return @"Unknown";
    }
  }
  return result;
}

- (void)queryEmergencyBottleneck
{
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(self->fEmergencyBottleneckToken, &state64);
  if (state)
  {
    uint32_t v4 = state;
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    uint64_t v5 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v21 = "-[CLEEDCoexMonitorCellular queryEmergencyBottleneck]";
      __int16 v22 = 1026;
      LODWORD(v23) = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#EED2CXCL,%{public}s, could not get EmergencyBottleneck State, status:%{public}u", buf, 0x12u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022DD770);
      }
      int v14 = 136446466;
      __int16 v15 = "-[CLEEDCoexMonitorCellular queryEmergencyBottleneck]";
      __int16 v16 = 1026;
      LODWORD(v17) = v4;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitorCellular queryEmergencyBottleneck]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
  }
  else
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    uint64_t v6 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v7 = "NO";
      if (!self->fEmergencyBottleneckInitialValueReceived) {
        int64_t v7 = "YES";
      }
      *(_DWORD *)buf = 136446722;
      __int16 v21 = "-[CLEEDCoexMonitorCellular queryEmergencyBottleneck]";
      __int16 v22 = 2082;
      __int16 v23 = v7;
      __int16 v24 = 2050;
      uint64_t v25 = state64;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, InitialValue:%{public}s, EmergencyBottleneck:%{public}llu", buf, 0x20u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022DD770);
      }
      unsigned __int8 v11 = "NO";
      if (!self->fEmergencyBottleneckInitialValueReceived) {
        unsigned __int8 v11 = "YES";
      }
      int v14 = 136446722;
      __int16 v15 = "-[CLEEDCoexMonitorCellular queryEmergencyBottleneck]";
      __int16 v16 = 2082;
      __int16 v17 = v11;
      __int16 v18 = 2050;
      uint64_t v19 = state64;
      BOOL v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular queryEmergencyBottleneck]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    if (!self->fEmergencyBottleneckInitialValueReceived
      || (__int16 v8 = (void *)state64,
          v8 != (void *)[(CLEEDCoexMonitorCellular *)self emergencyBottleneckState]))
    {
      self->fEmergencyBottleneckInitialValueReceived = 1;
      [(CLEEDCoexMonitorCellular *)self setEmergencyBottleneckState:state64];
      if ([(CLEEDCoexMonitorCellular *)self fCoexCellularForCA])
      {
        if ([(CLEEDCoexCellularForCA *)[(CLEEDCoexMonitorCellular *)self fCoexCellularForCA] bottleneckState] < 0)
        {
          [(CLEEDCoexCellularForCA *)[(CLEEDCoexMonitorCellular *)self fCoexCellularForCA] setBottleneckState:[(CLEEDCoexMonitorCellular *)self emergencyBottleneckState]];
          if ([(CLEEDCoexMonitorCellular *)self emergencyBottleneckState] >= 1) {
            [(CLEEDCoexCellularForCA *)[(CLEEDCoexMonitorCellular *)self fCoexCellularForCA] setBottleneckRsrp:[(CLEEDCoexMonitorCellular *)self mostRecentRsrpValue]];
          }
        }
        else
        {
          if ([(CLEEDCoexCellularForCA *)[(CLEEDCoexMonitorCellular *)self fCoexCellularForCA] bottleneckState] < 1&& [(CLEEDCoexMonitorCellular *)self emergencyBottleneckState] >= 1)
          {
            [(CLEEDCoexCellularForCA *)[(CLEEDCoexMonitorCellular *)self fCoexCellularForCA] setBottleneckState:[(CLEEDCoexMonitorCellular *)self emergencyBottleneckState]];
            [(CLEEDCoexCellularForCA *)[(CLEEDCoexMonitorCellular *)self fCoexCellularForCA] setBottleneckRsrp:[(CLEEDCoexMonitorCellular *)self mostRecentRsrpValue]];
          }
          int64_t v9 = [(CLEEDCoexMonitorCellular *)self fCoexCellularForCA];
          [(CLEEDCoexCellularForCA *)v9 setBottleneckToggleCount:(char *)[(CLEEDCoexCellularForCA *)v9 bottleneckToggleCount] + 1];
        }
        if ([(CLEEDCoexMonitorCellular *)self fCoexMetricUpdateCallback]) {
          (*((void (**)(void))[(CLEEDCoexMonitorCellular *)self fCoexMetricUpdateCallback]
        }
           + 2))();
      }
    }
  }
}

- (CLEEDCoexMonitorCellular)initWithUniverse:(id)a3 mitigationConfig:(MitigationsConfig *)a4 activeSim:(int)a5 Rat:(int)a6 wifiEmergency:(BOOL)a7 cachedCoexMetricData:(id)a8 eventCB:(id)a9 coexMetricUpdateCB:(id)a10
{
  BOOL v10 = a7;
  uint64_t v11 = *(void *)&a6;
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022DD770);
  }
  __int16 v16 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [[-[CLEEDCoexMonitorCellular ratAsString:](self, "ratAsString:", v11) UTF8String];
    __int16 v18 = v10 ? "YES" : "NO";
    sub_100924720();
    uint64_t v19 = v61 >= 0 ? __p : *(unsigned char **)__p;
    *(_DWORD *)buf = 136447746;
    v72 = "-[CLEEDCoexMonitorCellular initWithUniverse:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricData:"
          "eventCB:coexMetricUpdateCB:]";
    __int16 v73 = 2114;
    id v74 = a3;
    __int16 v75 = 2050;
    uint64_t v76 = a5;
    __int16 v77 = 2082;
    id v78 = v17;
    __int16 v79 = 2082;
    v80 = v18;
    __int16 v81 = 2082;
    v82 = v19;
    __int16 v83 = 2114;
    id v84 = a9;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s[universe:%{public}@,sim:%{public}ld,rat:%{public}s,wifiEmergency:%{public}s,cellularConfig:%{public}s,mitigationCB:%{public}@]", buf, 0x48u);
    if (SHIBYTE(v61) < 0) {
      operator delete(*(void **)__p);
    }
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    id v40 = [[-[CLEEDCoexMonitorCellular ratAsString:](self, "ratAsString:", v11) UTF8String];
    if (v10) {
      double v41 = "YES";
    }
    else {
      double v41 = "NO";
    }
    sub_100924720();
    if (v57 >= 0) {
      v42 = location;
    }
    else {
      v42 = (id *)location[0];
    }
    *(_DWORD *)__p = 136447746;
    *(void *)&__p[4] = "-[CLEEDCoexMonitorCellular initWithUniverse:mitigationConfig:activeSim:Rat:wifiEmergency:cached"
                         "CoexMetricData:eventCB:coexMetricUpdateCB:]";
    __int16 v59 = 2114;
    id v60 = a3;
    __int16 v61 = 2050;
    uint64_t v62 = a5;
    __int16 v63 = 2082;
    id v64 = v40;
    __int16 v65 = 2082;
    v66 = v41;
    __int16 v67 = 2082;
    v68 = v42;
    __int16 v69 = 2114;
    id v70 = a9;
    v43 = (char *)_os_log_send_and_compose_impl();
    if (v57 < 0) {
      operator delete(location[0]);
    }
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular initWithUniverse:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]", "%s\n", v43);
    if (v43 != (char *)buf) {
      free(v43);
    }
  }
  v55.receiver = self;
  v55.super_class = (Class)CLEEDCoexMonitorCellular;
  uint64_t v20 = [(CLEEDCoexMonitorCellular *)&v55 init];
  __int16 v21 = v20;
  if (v20)
  {
    v20->fUniverse = (CLIntersiloUniverse *)a3;
    dispatch_assert_queue_V2([[objc_msgSend(objc_msgSend(a3, "silo"), "queue") retain] autorelease]);
    *(_WORD *)&v21->BOOL fWifiInitialValueReceived = 0;
    v21->fULFreqInitalValueReceived = 0;
    v21->fEmergencyBottleneckInitialValueReceived = 0;
    v21->fRsrpTimer = 0;
    sub_1000FB43C((char *)&v21->fArrayRsrpValues, 0, 0, 0);
    v21->uint64_t fActiveSim = a5;
    v21->int fActiveRat = v11;
    v21->int fWifiEmergency = v10;
    long long v22 = *(_OWORD *)&a4->cellular.enabled;
    v21->fMitigationConfig.nominal = a4->nominal;
    *(_OWORD *)&v21->fMitigationConfig.cellular.enabled = v22;
    long long v23 = *(_OWORD *)&a4->cellular.rsrpSamplesToAvg;
    long long v24 = *(_OWORD *)&a4->cellular.belowThresholdParams.maxStreamingBitrateKbps;
    long long v25 = *(_OWORD *)&a4->thermal.moderate.maxFramerateFps;
    *(_OWORD *)&v21->fMitigationConfig.thermal.light.maxFramerateFps = *(_OWORD *)&a4->thermal.light.maxFramerateFps;
    *(_OWORD *)&v21->fMitigationConfig.thermal.moderate.maxFramerateFps = v25;
    *(_OWORD *)&v21->fMitigationConfig.cellular.rsrpSamplesToAvg = v23;
    *(_OWORD *)&v21->fMitigationConfig.cellular.belowThresholdParams.maxStreamingBitrateKbps = v24;
    long long v26 = *(_OWORD *)&a4->thermal.heavyAndGreater.maxFramerateFps;
    MitigationParams light = a4->peakPower.light;
    MitigationParams heavyAndGreater = a4->peakPower.heavyAndGreater;
    v21->fMitigationConfig.peakPower.moderate = a4->peakPower.moderate;
    v21->fMitigationConfig.peakPower.MitigationParams heavyAndGreater = heavyAndGreater;
    *(_OWORD *)&v21->fMitigationConfig.thermal.heavyAndGreater.maxFramerateFps = v26;
    v21->fMitigationConfig.peakPower.MitigationParams light = light;
    v21->_wifiAvailable = 0;
    v21->_averageRSRP = -150;
    v21->_ulCenterFrequency = 0;
    v21->fNotificationCallback = _Block_copy(a9);
    v21->_fCoexMetricUpdateCallback = _Block_copy(a10);
    if (!v21->fMitigationConfig.cellular.enabled)
    {
      __int16 v29 = [[-[CLIntersiloUniverse silo](v21->fUniverse, "silo") queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100AEEA58;
      block[3] = &unk_10229FED8;
      block[4] = v21;
      dispatch_async(v29, block);
    }
    v21->fUCMClient = (WRM_UCMInterface *)objc_alloc_init((Class)WRM_UCMInterface);
    v21->_fCoexCellularForCA = [[CLEEDCoexCellularForCA alloc] initWithCoexMetricDict:a8];
    if (v21->fUCMClient)
    {
      __int16 v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v31 = dispatch_queue_create("com.apple.Client.queueSOS.wirelesscoexmanager", v30);
      v21->fULInfoQueue = (OS_dispatch_queue *)v31;
      [(WRM_UCMInterface *)v21->fUCMClient registerClient:42 queue:v31];
      objc_initWeak(location, v21);
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_100AEEC38;
      v52[3] = &unk_1022DD750;
      objc_copyWeak(&v53, location);
      fULInfoQueue = v21->fULInfoQueue;
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_100AEEEAC;
      v51[3] = &unk_1022CEBF8;
      v51[4] = v21;
      v51[5] = v52;
      dispatch_async(fULInfoQueue, v51);
      __int16 v33 = [[-[CLIntersiloUniverse silo](v21->fUniverse, "silo") queue];
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100AEEEB8;
      handler[3] = &unk_1022B3858;
      objc_copyWeak(&v50, location);
      uint32_t v34 = notify_register_dispatch("com.apple.CoreTelephony.UL.Health.Emergency.Bottleneck", &v21->fEmergencyBottleneckToken, v33, handler);
      if (!v34)
      {
        unint64_t v37 = [[-[CLIntersiloUniverse silo](v21->fUniverse, "silo") queue];
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_100AEEEF0;
        v48[3] = &unk_10229FED8;
        v48[4] = v21;
        dispatch_async(v37, v48);
        v38 = [[-[CLIntersiloUniverse silo](v21->fUniverse, "silo") queue];
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_100AEEEF8;
        v47[3] = &unk_10229FED8;
        v47[4] = v21;
        dispatch_async(v38, v47);
        objc_destroyWeak(&v50);
        objc_destroyWeak(&v53);
        objc_destroyWeak(location);
        return v21;
      }
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022DD770);
      }
      double v35 = qword_1024193E8;
      if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v72 = "-[CLEEDCoexMonitorCellular initWithUniverse:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricD"
              "ata:eventCB:coexMetricUpdateCB:]";
        __int16 v73 = 1026;
        LODWORD(v74) = v34;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "#EED2CXCL,%{public}s: unable to register for EmergencyBottleneck notifications, status:%{public}u", buf, 0x12u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193E0 != -1) {
          dispatch_once(&qword_1024193E0, &stru_1022DD770);
        }
        *(_DWORD *)__p = 136446466;
        *(void *)&__p[4] = "-[CLEEDCoexMonitorCellular initWithUniverse:mitigationConfig:activeSim:Rat:wifiEmergency:ca"
                             "chedCoexMetricData:eventCB:coexMetricUpdateCB:]";
        __int16 v59 = 1026;
        LODWORD(v60) = v34;
        __int16 v44 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitorCellular initWithUniverse:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]", "%s\n", v44);
        if (v44 != (char *)buf) {
          free(v44);
        }
      }
      objc_destroyWeak(&v50);
      objc_destroyWeak(&v53);
      objc_destroyWeak(location);
    }
    else
    {
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022DD770);
      }
      double v36 = qword_1024193E8;
      if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136446210;
        v72 = "-[CLEEDCoexMonitorCellular initWithUniverse:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricD"
              "ata:eventCB:coexMetricUpdateCB:]";
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "#EED2CXCL,%{public}s, WRM_UCMInterface init failure", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193E0 != -1) {
          dispatch_once(&qword_1024193E0, &stru_1022DD770);
        }
        *(_DWORD *)__p = 136446210;
        *(void *)&__p[4] = "-[CLEEDCoexMonitorCellular initWithUniverse:mitigationConfig:activeSim:Rat:wifiEmergency:ca"
                             "chedCoexMetricData:eventCB:coexMetricUpdateCB:]";
        unint64_t v45 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitorCellular initWithUniverse:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]", "%s\n", v45);
        if (v45 != (char *)buf) {
          free(v45);
        }
      }
    }
    return 0;
  }
  return v21;
}

- (void)dealloc
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022DD770);
  }
  id v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    __int16 v16 = "-[CLEEDCoexMonitorCellular dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#EED2CXCL,%{public}s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    int v13 = 136446210;
    int v14 = "-[CLEEDCoexMonitorCellular dealloc]";
    uint64_t v11 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular dealloc]", "%s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
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
  fUCMClient = self->fUCMClient;
  if (fUCMClient)
  {
    [(WRM_UCMInterface *)fUCMClient unregisterClient];

    self->fUCMClient = 0;
  }
  begin = self->fArrayRsrpValues.__begin_;
  if (self->fArrayRsrpValues.__end_ != begin)
  {
    self->fArrayRsrpValues.__end_ = begin;
    sub_1000FB43C((char *)&self->fArrayRsrpValues, 0, 0, 0);
  }
  fRsrpTimer = self->fRsrpTimer;
  if (fRsrpTimer)
  {
    [(CLTimer *)fRsrpTimer invalidate];

    self->fRsrpTimer = 0;
  }
  fULInfoQueue = self->fULInfoQueue;
  if (fULInfoQueue)
  {

    self->fULInfoQueue = 0;
  }
  fCoexCellularForCA = self->_fCoexCellularForCA;
  if (fCoexCellularForCA)
  {

    self->_fCoexCellularForCA = 0;
  }
  self->fUniverse = 0;
  v12.receiver = self;
  v12.super_class = (Class)CLEEDCoexMonitorCellular;
  [(CLEEDCoexMonitorCellular *)&v12 dealloc];
}

- (void)processAverageRSRPForCA:(int64_t)a3
{
  if ([(CLEEDCoexMonitorCellular *)self fCoexCellularForCA])
  {
    BOOL fRSRPInitialValueReceived = self->fRSRPInitialValueReceived;
    uint64_t v6 = [(CLEEDCoexMonitorCellular *)self fCoexCellularForCA];
    if (fRSRPInitialValueReceived)
    {
      if ([(CLEEDCoexCellularForCA *)v6 maxCellularRSRP] < a3) {
        [(CLEEDCoexCellularForCA *)[(CLEEDCoexMonitorCellular *)self fCoexCellularForCA] setMaxCellularRSRP:a3];
      }
      if ([(CLEEDCoexCellularForCA *)[(CLEEDCoexMonitorCellular *)self fCoexCellularForCA] minCellularRSRP] <= a3)goto LABEL_18; {
    }
      }
    else
    {
      [(CLEEDCoexCellularForCA *)v6 setMaxCellularRSRP:a3];
    }
    [(CLEEDCoexCellularForCA *)[(CLEEDCoexMonitorCellular *)self fCoexCellularForCA] setMinCellularRSRP:a3];
LABEL_18:
    if ([(CLEEDCoexMonitorCellular *)self fCoexMetricUpdateCallback])
    {
      int64_t v9 = (void (*)(void))*((void *)[(CLEEDCoexMonitorCellular *)self fCoexMetricUpdateCallback]+ 2);
      v9();
    }
    return;
  }
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022DD770);
  }
  int64_t v7 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = "-[CLEEDCoexMonitorCellular processAverageRSRPForCA:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "#EED2CXCL,%{public}s,nil fCoexCellularForCA,early return", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    __int16 v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitorCellular processAverageRSRPForCA:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
}

- (void)updateCoexMetricDict:(id *)a3 forCASubmission:(BOOL)a4
{
  if (a3 && *a3)
  {
    BOOL v5 = a4;
    if ([(CLEEDCoexMonitorCellular *)self fCoexCellularForCA])
    {
      id v7 = *a3;
      if (v5)
      {
        [v7 setValue:-[CLEEDCoexMonitorCellular ratAsString:](self, "ratAsString:", -[CLEEDCoexCellularForCA cellularRAT](-[CLEEDCoexMonitorCellular fCoexCellularForCA](self, "fCoexCellularForCA"), "cellularRAT")) forKey:@"cellularRAT"];
        id v8 = *a3;
        int64_t v9 = [(CLEEDCoexMonitorCellular *)self bandAsString:[(CLEEDCoexCellularForCA *)[(CLEEDCoexMonitorCellular *)self fCoexCellularForCA] cellularBand] forRAT:[(CLEEDCoexCellularForCA *)[(CLEEDCoexMonitorCellular *)self fCoexCellularForCA] cellularRAT]];
      }
      else
      {
        [v7 setValue:[NSNumber numberWithInt:][CLEEDCoexCellularForCA cellularRAT][CLEEDCoexMonitorCellular fCoexCellularForCA](self, "fCoexCellularForCA")] forKey:@"cellularRAT"];
        id v8 = *a3;
        int64_t v9 = +[NSNumber numberWithInteger:[(CLEEDCoexCellularForCA *)[(CLEEDCoexMonitorCellular *)self fCoexCellularForCA] cellularBand]];
      }
      [v8 setValue:v9 forKey:@"cellularBand"];
      [*a3 setValue:[NSNumber numberWithInteger:][CLEEDCoexCellularForCA minCellularRSRP][-[CLEEDCoexMonitorCellular fCoexCellularForCA](self, "fCoexCellularForCA") minCellularRSRP] forKey:@"minCellularRSRP"];
      [*a3 setValue:[NSNumber numberWithInteger:-[CLEEDCoexCellularForCA maxCellularRSRP](-[CLEEDCoexMonitorCellular fCoexCellularForCA](self, "fCoexCellularForCA"), "maxCellularRSRP")] forKey:@"maxCellularRSRP"];
      [*a3 setValue:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CLEEDCoexCellularForCA bottleneckState](-[CLEEDCoexMonitorCellular fCoexCellularForCA](self, "fCoexCellularForCA"), "bottleneckState")) forKey:@"bottleneckState"];
      [*a3 setValue:[+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLEEDCoexCellularForCA bottleneckToggleCount](-[CLEEDCoexMonitorCellular fCoexCellularForCA](self, "fCoexCellularForCA"), "bottleneckToggleCount")) forKey:@"bottleneckToggleCount"];
      id v12 = *a3;
      int v13 = +[NSNumber numberWithInteger:[(CLEEDCoexCellularForCA *)[(CLEEDCoexMonitorCellular *)self fCoexCellularForCA] bottleneckRsrp]];
      [v12 setValue:v13 forKey:@"bottleneckRsrp"];
      return;
    }
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    uint64_t v11 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v16 = "-[CLEEDCoexMonitorCellular updateCoexMetricDict:forCASubmission:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#EED2CXCL,%{public}s, nil fCoexCellularForCA", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 == -1)
      {
LABEL_24:
        int v14 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitorCellular updateCoexMetricDict:forCASubmission:]", "%s\n", v14);
        if (v14 != (char *)buf) {
          free(v14);
        }
        return;
      }
LABEL_26:
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
      goto LABEL_24;
    }
  }
  else
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022DD770);
    }
    BOOL v10 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v16 = "-[CLEEDCoexMonitorCellular updateCoexMetricDict:forCASubmission:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#EED2CXCL,%{public}s, nil metricDict", buf, 0xCu);
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

- (int64_t)averageRSRP
{
  return self->_averageRSRP;
}

- (void)setAverageRSRP:(int64_t)a3
{
  self->_averageRSRP = a3;
}

- (BOOL)wifiAvailable
{
  return self->_wifiAvailable;
}

- (void)setWifiAvailable:(BOOL)a3
{
  self->_wifiAvailable = a3;
}

- (int64_t)ulCenterFrequency
{
  return self->_ulCenterFrequency;
}

- (void)setUlCenterFrequency:(int64_t)a3
{
  self->_ulCenterFrequency = a3;
}

- (int64_t)emergencyBottleneckState
{
  return self->_emergencyBottleneckState;
}

- (void)setEmergencyBottleneckState:(int64_t)a3
{
  self->_emergencyBottleneckState = a3;
}

- (id)fCoexMetricUpdateCallback
{
  return self->_fCoexMetricUpdateCallback;
}

- (void)setFCoexMetricUpdateCallback:(id)a3
{
  self->_id fCoexMetricUpdateCallback = a3;
}

- (CLEEDCoexCellularForCA)fCoexCellularForCA
{
  return self->_fCoexCellularForCA;
}

- (void)setFCoexCellularForCA:(id)a3
{
  self->_fCoexCellularForCA = (CLEEDCoexCellularForCA *)a3;
}

- (void).cxx_destruct
{
  sub_100789878((uint64_t)&self->fCallbackDropManager);
  begin = self->fArrayRsrpValues.__begin_;
  if (begin)
  {
    self->fArrayRsrpValues.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  self->fArrayRsrpValues.__begin_ = 0;
  self->fArrayRsrpValues.__end_ = 0;
  self->fArrayRsrpValues.__end_cap_.__value_ = 0;
  self->fCallbackDropManager._vptr$CLCallbackDropManager = (void **)off_1022B6DB8;
  id v3 = (char *)operator new(0x20uLL);
  *((void *)v3 + 1) = 0;
  *((void *)v3 + 2) = 0;
  *(void *)id v3 = off_1022B6DF0;
  self->fCallbackDropManager.fToken.__cntrl_ = (__shared_weak_count *)v3;
  self->fCallbackDropManager.fNullDelegate = 0;
  *((_DWORD *)v3 + 6) = 31337;
  self->fCallbackDropManager._vptr$CLCallbackDropManager = (void **)off_1022C7F70;
  self->fCallbackDropManager.fToken.__ptr_ = (int *)(v3 + 24);
  *(_WORD *)&self->fMitigationConfig.nominal.allowNewStreamingRequests = 257;
  *(void *)&self->fMitigationConfig.nominal.maxFramerateFps = 0x32000000018;
  *(_WORD *)&self->fMitigationConfig.nominal.dropStreaming = 0;
  self->fMitigationConfig.cellular.enabled = 1;
  self->fMitigationConfig.cellular.int64_t rsrpThresholddBm = -115;
  self->fMitigationConfig.cellular.rsrpQueryRateSecs = 2.0;
  *(void *)&self->fMitigationConfig.cellular.rsrpSamplesToAvg = 0x3E800000005;
  *(_WORD *)&self->fMitigationConfig.cellular.belowThresholdParams.allowNewStreamingRequests = 0;
  *(void *)&self->fMitigationConfig.cellular.belowThresholdParams.maxFramerateFps = -1;
  *(_WORD *)&self->fMitigationConfig.cellular.belowThresholdParams.dropStreaming = 257;
  self->fMitigationConfig.thermal.enabled = 1;
  *(_WORD *)&self->fMitigationConfig.thermal.light.allowNewStreamingRequests = 257;
  *(void *)&self->fMitigationConfig.thermal.light.maxFramerateFps = 0x32000000018;
  *(_WORD *)&self->fMitigationConfig.thermal.light.dropStreaming = 0;
  *(_WORD *)&self->fMitigationConfig.thermal.moderate.allowNewStreamingRequests = 0;
  *(void *)&self->fMitigationConfig.thermal.moderate.maxFramerateFps = 0x6400000005;
  *(_WORD *)&self->fMitigationConfig.thermal.moderate.dropStreaming = 256;
  *(_WORD *)&self->fMitigationConfig.thermal.heavyAndGreater.allowNewStreamingRequests = 0;
  *(void *)&self->fMitigationConfig.thermal.heavyAndGreater.maxFramerateFps = -1;
  *(_WORD *)&self->fMitigationConfig.thermal.heavyAndGreater.dropStreaming = 257;
  self->fMitigationConfig.peakPower.enabled = 1;
  *(_WORD *)&self->fMitigationConfig.peakPower.light.allowNewStreamingRequests = 0;
  *(void *)&self->fMitigationConfig.peakPower.light.maxFramerateFps = -1;
  *(_WORD *)&self->fMitigationConfig.peakPower.light.dropStreaming = 257;
  *(_WORD *)&self->fMitigationConfig.peakPower.moderate.allowNewStreamingRequests = 0;
  *(void *)&self->fMitigationConfig.peakPower.moderate.maxFramerateFps = -1;
  *(_WORD *)&self->fMitigationConfig.peakPower.moderate.dropStreaming = 257;
  *(_WORD *)&self->fMitigationConfig.peakPower.heavyAndGreater.allowNewStreamingRequests = 0;
  *(void *)&self->fMitigationConfig.peakPower.heavyAndGreater.maxFramerateFps = -1;
  *(_WORD *)&self->fMitigationConfig.peakPower.heavyAndGreater.dropStreaming = 257;
  return self;
}

@end