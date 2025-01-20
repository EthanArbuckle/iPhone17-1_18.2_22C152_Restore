@interface CLEEDCoexMonitor
- (CLEEDCoexMonitor)initWithUniverse:(id)a3 initialMitigation:(id)a4 mitigationConfig:(MitigationsConfig *)a5 activeSim:(int)a6 Rat:(int)a7 wifiEmergency:(BOOL)a8 cachedCoexMetricData:(id)a9 mitigationCB:(id)a10 coexMetricUpdateCB:(id)a11;
- (CLEEDCoexMonitorCellular)cellular;
- (CLEEDCoexMonitorPower)power;
- (CLEEDCoexMonitorThermal)thermal;
- (CLEEDMitigation)currentMitigation;
- (id)createCoexMetricDictForCASubmission:(BOOL)a3;
- (id)fCoexMetricUpdateCallback;
- (void)dealloc;
- (void)handleReachability:(int)a3;
- (void)handleUpdatesToSim:(int)a3 Rat:(int)a4 WifiEmergency:(BOOL)a5 bandInfo:(int)a6;
- (void)handleVlqmForActiveCall:(int)a3;
- (void)processIncomingMitigation:(id)a3;
- (void)setCurrentMitigation:(id)a3;
- (void)setFCoexMetricUpdateCallback:(id)a3;
- (void)submitCoexMetricToCAWithBatteryLevelAtCallStart:(int)a3 batteryLevelAtCallEnd:(int)a4;
@end

@implementation CLEEDCoexMonitor

- (CLEEDCoexMonitor)initWithUniverse:(id)a3 initialMitigation:(id)a4 mitigationConfig:(MitigationsConfig *)a5 activeSim:(int)a6 Rat:(int)a7 wifiEmergency:(BOOL)a8 cachedCoexMetricData:(id)a9 mitigationCB:(id)a10 coexMetricUpdateCB:(id)a11
{
  BOOL v58 = a8;
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022D3E80);
  }
  v14 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    sub_100922BF8();
    v15 = v73 >= 0 ? __p : *(unsigned char **)__p;
    *(_DWORD *)buf = 136447234;
    v80 = "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexM"
          "etricData:mitigationCB:coexMetricUpdateCB:]";
    __int16 v81 = 2114;
    id v82 = a3;
    __int16 v83 = 2082;
    v84 = v15;
    __int16 v85 = 2114;
    id v86 = a10;
    __int16 v87 = 2114;
    id v88 = a11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#EED2CXMN,%{public}s[universe:%{public}@,config:%{public}s,mitigationCB:%{public}@,coexMetricUpdateCB:%{public}@]", buf, 0x34u);
    if (SHIBYTE(v73) < 0) {
      operator delete(*(void **)__p);
    }
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022D3E80);
    }
    sub_100922BF8();
    if (v69 >= 0) {
      v50 = location;
    }
    else {
      v50 = (id *)location[0];
    }
    *(_DWORD *)__p = 136447234;
    *(void *)&__p[4] = "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEmerge"
                         "ncy:cachedCoexMetricData:mitigationCB:coexMetricUpdateCB:]";
    __int16 v71 = 2114;
    id v72 = a3;
    __int16 v73 = 2082;
    v74 = v50;
    __int16 v75 = 2114;
    id v76 = a10;
    __int16 v77 = 2114;
    id v78 = a11;
    v51 = (char *)_os_log_send_and_compose_impl();
    if (v69 < 0) {
      operator delete(location[0]);
    }
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricData:mitigationCB:coexMetricUpdateCB:]", "%s\n", v51);
    if (v51 != (char *)buf) {
      free(v51);
    }
  }
  v67.receiver = self;
  v67.super_class = (Class)CLEEDCoexMonitor;
  v16 = [(CLEEDCoexMonitor *)&v67 init];
  if (v16)
  {
    v16->fUniverse = (CLIntersiloUniverse *)a3;
    dispatch_assert_queue_V2([[objc_msgSend(objc_msgSend(a3, "silo"), "queue") retain] autorelease]);
    v16->id fMitigationCallback = _Block_copy(a10);
    v16->_id fCoexMetricUpdateCallback = _Block_copy(a11);
    v16->fInitialMitigationsReceived = 0;
    if (a4) {
      v17 = (CLEEDMitigation *)[objc_alloc((Class)CLEEDMitigation) initWithStreamingAllowed:objc_msgSend(a4, "newStreamingAllowed") framerateFps:objc_msgSend(a4, "streamingFPS") bitrateKbps:objc_msgSend(a4, "streamingBitrate") dropStreaming:objc_msgSend(a4, "dropStreaming") uploadAllowed:objc_msgSend(a4, "newUploadAllowed") uploadMitigation:objc_msgSend(a4, "uploadMigitation") source:objc_msgSend(a4, "source")];
    }
    else {
      v17 = (CLEEDMitigation *)objc_alloc_init((Class)CLEEDMitigation);
    }
    v16->_currentMitigation = v17;
    p_currentMitigation = (id *)&v16->_currentMitigation;
    if (v17)
    {
      objc_initWeak(location, v16);
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_100922F38;
      v65[3] = &unk_1022D3E60;
      objc_copyWeak(&v66, location);
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = sub_100923138;
      v63[3] = &unk_1022B20F8;
      objc_copyWeak(&v64, location);
      v19 = [CLEEDCoexMonitorThermal alloc];
      id v20 = [[-[CLIntersiloUniverse silo](v16->fUniverse, "silo") queue];
      MitigationParams light = a5->peakPower.light;
      v62[6] = *(_OWORD *)&a5->thermal.heavyAndGreater.maxFramerateFps;
      v62[7] = light;
      MitigationParams heavyAndGreater = a5->peakPower.heavyAndGreater;
      v62[8] = a5->peakPower.moderate;
      v62[9] = heavyAndGreater;
      long long v23 = *(_OWORD *)&a5->cellular.belowThresholdParams.maxStreamingBitrateKbps;
      v62[2] = *(_OWORD *)&a5->cellular.rsrpSamplesToAvg;
      v62[3] = v23;
      long long v24 = *(_OWORD *)&a5->thermal.moderate.maxFramerateFps;
      v62[4] = *(_OWORD *)&a5->thermal.light.maxFramerateFps;
      v62[5] = v24;
      long long v25 = *(_OWORD *)&a5->cellular.enabled;
      v62[0] = a5->nominal;
      v62[1] = v25;
      v26 = [(CLEEDCoexMonitorThermal *)v19 initWithQueue:v20 mitigationConfig:v62 cachedCoexMetricData:a9 eventCB:v65 coexMetricUpdateCB:v63];
      v16->_thermal = v26;
      p_thermal = (id *)&v16->_thermal;
      if (v26)
      {
        v28 = [CLEEDCoexMonitorPower alloc];
        id v29 = [[-[CLIntersiloUniverse silo](v16->fUniverse, "silo") queue];
        MitigationParams v30 = a5->peakPower.light;
        v61[6] = *(_OWORD *)&a5->thermal.heavyAndGreater.maxFramerateFps;
        v61[7] = v30;
        MitigationParams v31 = a5->peakPower.heavyAndGreater;
        v61[8] = a5->peakPower.moderate;
        v61[9] = v31;
        long long v32 = *(_OWORD *)&a5->cellular.belowThresholdParams.maxStreamingBitrateKbps;
        v61[2] = *(_OWORD *)&a5->cellular.rsrpSamplesToAvg;
        v61[3] = v32;
        long long v33 = *(_OWORD *)&a5->thermal.moderate.maxFramerateFps;
        v61[4] = *(_OWORD *)&a5->thermal.light.maxFramerateFps;
        v61[5] = v33;
        long long v34 = *(_OWORD *)&a5->cellular.enabled;
        v61[0] = a5->nominal;
        v61[1] = v34;
        v35 = [(CLEEDCoexMonitorPower *)v28 initWithQueue:v29 mitigationConfig:v61 cachedCoexMetricData:a9 eventCB:v65 coexMetricUpdateCB:v63];
        v16->_power = v35;
        if (v35)
        {
          v36 = [CLEEDCoexMonitorCellular alloc];
          MitigationParams v37 = a5->peakPower.light;
          v60[6] = *(_OWORD *)&a5->thermal.heavyAndGreater.maxFramerateFps;
          v60[7] = v37;
          MitigationParams v38 = a5->peakPower.heavyAndGreater;
          v60[8] = a5->peakPower.moderate;
          v60[9] = v38;
          long long v39 = *(_OWORD *)&a5->cellular.belowThresholdParams.maxStreamingBitrateKbps;
          v60[2] = *(_OWORD *)&a5->cellular.rsrpSamplesToAvg;
          v60[3] = v39;
          long long v40 = *(_OWORD *)&a5->thermal.moderate.maxFramerateFps;
          v60[4] = *(_OWORD *)&a5->thermal.light.maxFramerateFps;
          v60[5] = v40;
          long long v41 = *(_OWORD *)&a5->cellular.enabled;
          v60[0] = a5->nominal;
          v60[1] = v41;
          v42 = [(CLEEDCoexMonitorCellular *)v36 initWithUniverse:a3 mitigationConfig:v60 activeSim:a6 Rat:a7 wifiEmergency:v58 cachedCoexMetricData:a9 eventCB:v65 coexMetricUpdateCB:v63];
          v16->_cellular = v42;
          if (v42)
          {
            objc_destroyWeak(&v64);
            objc_destroyWeak(&v66);
            objc_destroyWeak(location);
            return v16;
          }
          if (qword_1024193E0 != -1) {
            dispatch_once(&qword_1024193E0, &stru_1022D3E80);
          }
          v48 = qword_1024193E8;
          if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            v80 = "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEmergency:cac"
                  "hedCoexMetricData:mitigationCB:coexMetricUpdateCB:]";
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "#EED2CXMN,%{public}s failure while creating cellular monitor", buf, 0xCu);
          }
          if (sub_10013D1A0(115, 0))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024193E0 != -1) {
              dispatch_once(&qword_1024193E0, &stru_1022D3E80);
            }
            *(_DWORD *)__p = 136446210;
            *(void *)&__p[4] = "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wi"
                                 "fiEmergency:cachedCoexMetricData:mitigationCB:coexMetricUpdateCB:]";
            v55 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricData:mitigationCB:coexMetricUpdateCB:]", "%s\n", v55);
            if (v55 != (char *)buf) {
              free(v55);
            }
          }

          p_thermal = (id *)&v16->_power;
        }
        else
        {
          if (qword_1024193E0 != -1) {
            dispatch_once(&qword_1024193E0, &stru_1022D3E80);
          }
          v47 = qword_1024193E8;
          if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            v80 = "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEmergency:cac"
                  "hedCoexMetricData:mitigationCB:coexMetricUpdateCB:]";
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "#EED2CXMN,%{public}s failure while creating peak pressure monitor", buf, 0xCu);
          }
          if (sub_10013D1A0(115, 0))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024193E0 != -1) {
              dispatch_once(&qword_1024193E0, &stru_1022D3E80);
            }
            *(_DWORD *)__p = 136446210;
            *(void *)&__p[4] = "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wi"
                                 "fiEmergency:cachedCoexMetricData:mitigationCB:coexMetricUpdateCB:]";
            v54 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricData:mitigationCB:coexMetricUpdateCB:]", "%s\n", v54);
            if (v54 != (char *)buf) {
              free(v54);
            }
          }
        }
      }
      else
      {
        if (qword_1024193E0 != -1) {
          dispatch_once(&qword_1024193E0, &stru_1022D3E80);
        }
        v46 = qword_1024193E8;
        if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v80 = "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEmergency:cache"
                "dCoexMetricData:mitigationCB:coexMetricUpdateCB:]";
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "#EED2CXMN,%{public}s failure while creating thermal monitor", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024193E0 != -1) {
            dispatch_once(&qword_1024193E0, &stru_1022D3E80);
          }
          *(_DWORD *)__p = 136446210;
          *(void *)&__p[4] = "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifi"
                               "Emergency:cachedCoexMetricData:mitigationCB:coexMetricUpdateCB:]";
          v53 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricData:mitigationCB:coexMetricUpdateCB:]", "%s\n", v53);
          if (v53 != (char *)buf) {
            free(v53);
          }
        }
        p_thermal = (id *)&v16->_currentMitigation;
      }

      objc_destroyWeak(&v64);
      objc_destroyWeak(&v66);
      objc_destroyWeak(location);
    }
    else
    {
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022D3E80);
      }
      v43 = qword_1024193E8;
      if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v80 = "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEmergency:cachedC"
              "oexMetricData:mitigationCB:coexMetricUpdateCB:]";
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "#EED2CXMN,%{public}s failure while creating current mitigation", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193E0 != -1) {
          dispatch_once(&qword_1024193E0, &stru_1022D3E80);
        }
        *(_DWORD *)__p = 136446210;
        *(void *)&__p[4] = "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEm"
                             "ergency:cachedCoexMetricData:mitigationCB:coexMetricUpdateCB:]";
        v52 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricData:mitigationCB:coexMetricUpdateCB:]", "%s\n", v52);
        if (v52 != (char *)buf) {
          free(v52);
        }
      }
      id fMitigationCallback = v16->fMitigationCallback;
      if (fMitigationCallback) {
        _Block_release(fMitigationCallback);
      }
      id fCoexMetricUpdateCallback = v16->_fCoexMetricUpdateCallback;
      if (fCoexMetricUpdateCallback) {
        _Block_release(fCoexMetricUpdateCallback);
      }
      v16->fUniverse = 0;
    }
    return 0;
  }
  return v16;
}

- (void)dealloc
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022D3E80);
  }
  v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    v11 = "-[CLEEDCoexMonitor dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#EED2CXMN,%{public}s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022D3E80);
    }
    int v8 = 136446210;
    v9 = "-[CLEEDCoexMonitor dealloc]";
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitor dealloc]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  id fMitigationCallback = self->fMitigationCallback;
  if (fMitigationCallback)
  {
    _Block_release(fMitigationCallback);
    self->id fMitigationCallback = 0;
  }
  id fCoexMetricUpdateCallback = self->_fCoexMetricUpdateCallback;
  if (fCoexMetricUpdateCallback)
  {
    _Block_release(fCoexMetricUpdateCallback);
    self->_id fCoexMetricUpdateCallback = 0;
  }

  self->_currentMitigation = 0;
  self->_cellular = 0;

  self->_thermal = 0;
  self->_power = 0;
  self->fUniverse = 0;
  v7.receiver = self;
  v7.super_class = (Class)CLEEDCoexMonitor;
  [(CLEEDCoexMonitor *)&v7 dealloc];
}

- (void)processIncomingMitigation:(id)a3
{
  if (!a3)
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022D3E80);
    }
    v10 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v21 = "-[CLEEDCoexMonitor processIncomingMitigation:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#EED2CXMN,%{public}s, mitigation nil", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022D3E80);
      }
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitor processIncomingMitigation:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    return;
  }
  id v5 = [a3 source];
  if (v5 == (id)4)
  {
    p_BOOL fInitialNotifCellular = &self->fInitialNotifCellular;
    if (!self->fInitialNotifCellular) {
      goto LABEL_6;
    }
  }
  else
  {
    if (v5 != (id)3)
    {
      if (v5 != (id)2) {
        goto LABEL_7;
      }
      p_BOOL fInitialNotifCellular = &self->fInitialNotifThermal;
      if (self->fInitialNotifThermal) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    p_BOOL fInitialNotifCellular = &self->fInitialNotifPower;
    if (!self->fInitialNotifPower) {
LABEL_6:
    }
      BOOL *p_fInitialNotifCellular = 1;
  }
LABEL_7:
  unsigned __int8 v7 = [(CLEEDMitigation *)[(CLEEDCoexMonitor *)self currentMitigation] updateWorseMitigationsFrom:a3];
  if (!self->fInitialMitigationsReceived || (v7 & 1) == 0)
  {
    if (self->fInitialMitigationsReceived
      || !self->fInitialNotifPower
      || !self->fInitialNotifThermal
      || !self->fInitialNotifCellular)
    {
      return;
    }
    self->fInitialMitigationsReceived = 1;
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022D3E80);
    }
    v12 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = "received";
      if (self->fInitialNotifThermal) {
        v14 = "received";
      }
      else {
        v14 = "nil";
      }
      BOOL fInitialNotifPower = self->fInitialNotifPower;
      v21 = "-[CLEEDCoexMonitor processIncomingMitigation:]";
      BOOL fInitialNotifCellular = self->fInitialNotifCellular;
      if (fInitialNotifPower) {
        v17 = "received";
      }
      else {
        v17 = "nil";
      }
      *(_DWORD *)buf = 136446978;
      __int16 v22 = 2082;
      if (!fInitialNotifCellular) {
        v13 = "nil";
      }
      long long v23 = (void *)v14;
      __int16 v24 = 2082;
      long long v25 = v17;
      __int16 v26 = 2082;
      v27 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#EED2CXMN,%{public}s, Received initial mitigations, Thermal:%{public}s, Power:%{public}s, Cellular:%{public}s", buf, 0x2Au);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022D3E80);
      }
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitor processIncomingMitigation:]", "%s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
  }
  if (self->fMitigationCallback)
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022D3E80);
    }
    int v8 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(CLEEDCoexMonitor *)self currentMitigation];
      *(_DWORD *)buf = 136446466;
      v21 = "-[CLEEDCoexMonitor processIncomingMitigation:]";
      __int16 v22 = 2114;
      long long v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#EED2CXMN,%{public}s, SendMitigation:%{public}@", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022D3E80);
      }
      [(CLEEDCoexMonitor *)self currentMitigation];
      v19 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitor processIncomingMitigation:]", "%s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
    (*((void (**)(id, CLEEDMitigation *, void))self->fMitigationCallback + 2))(self->fMitigationCallback, [(CLEEDCoexMonitor *)self currentMitigation], 0);
  }
}

- (void)handleVlqmForActiveCall:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(CLEEDCoexMonitor *)self cellular])
  {
    id v5 = [(CLEEDCoexMonitor *)self cellular];
    [(CLEEDCoexMonitorCellular *)v5 handleVlqmForActiveCall:v3];
  }
}

- (void)handleReachability:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(CLEEDCoexMonitor *)self cellular])
  {
    id v5 = [(CLEEDCoexMonitor *)self cellular];
    [(CLEEDCoexMonitorCellular *)v5 handleReachability:v3];
  }
}

- (void)handleUpdatesToSim:(int)a3 Rat:(int)a4 WifiEmergency:(BOOL)a5 bandInfo:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  if ([(CLEEDCoexMonitor *)self cellular])
  {
    v11 = [(CLEEDCoexMonitor *)self cellular];
    [(CLEEDCoexMonitorCellular *)v11 handleUpdatesToSim:v9 Rat:v8 WifiEmergency:v7 bandInfo:v6];
  }
}

- (id)createCoexMetricDictForCASubmission:(BOOL)a3
{
  BOOL v3 = a3;
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  if (v12)
  {
    if ([(CLEEDCoexMonitor *)self thermal]) {
      [(CLEEDCoexMonitorThermal *)[(CLEEDCoexMonitor *)self thermal] updateCoexMetricDict:&v12 forCASubmission:v3];
    }
    if ([(CLEEDCoexMonitor *)self power]) {
      [(CLEEDCoexMonitorPower *)[(CLEEDCoexMonitor *)self power] updateCoexMetricDict:&v12 forCASubmission:v3];
    }
    if ([(CLEEDCoexMonitor *)self cellular]) {
      [(CLEEDCoexMonitorCellular *)[(CLEEDCoexMonitor *)self cellular] updateCoexMetricDict:&v12 forCASubmission:v3];
    }
    if ([(CLEEDCoexMonitor *)self currentMitigation])
    {
      [v12 setValue:[NSNumber numberWithInt:-[CLEEDCoexMonitor currentMitigation](self, "currentMitigation") source] forKey:@"mitigationSource"];
      [v12 setValue:[NSNumber numberWithBool:([CLEEDMitigation newUploadAllowed](-[CLEEDCoexMonitor currentMitigation](self, "currentMitigation"), "newUploadAllowed") ^ 1)] forKey:@"uploadsDisallowed"];
      [v12 setValue:[NSNumber numberWithBool:][CLEEDMitigation uploadMigitation][-[CLEEDCoexMonitor currentMitigation](self, "currentMitigation") == (id)1] forKey:@"uploadsDelayed"];
      [v12 setValue:[NSNumber numberWithBool:][CLEEDMitigation newStreamingAllowed][-[CLEEDCoexMonitor currentMitigation](self, "currentMitigation") newStreamingAllowed] ^ 1] forKey:@"streamingDisallowed"];
    }
    else
    {
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022D3E80);
      }
      BOOL v7 = qword_1024193E8;
      if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        id v20 = "-[CLEEDCoexMonitor createCoexMetricDictForCASubmission:]";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#EED2CXMN,%{public}s, self.currentMitigation nil", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193E0 != -1) {
          dispatch_once(&qword_1024193E0, &stru_1022D3E80);
        }
        int v13 = 136446210;
        v14 = "-[CLEEDCoexMonitor createCoexMetricDictForCASubmission:]";
        v11 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitor createCoexMetricDictForCASubmission:]", "%s\n", v11);
        if (v11 != (char *)buf) {
          free(v11);
        }
      }
    }
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022D3E80);
    }
    uint64_t v8 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      id v20 = "-[CLEEDCoexMonitor createCoexMetricDictForCASubmission:]";
      __int16 v21 = 1024;
      BOOL v22 = v3;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#EED2CXMN,%{public}s, caSubmission:%d, coexMetricDict:%@", buf, 0x1Cu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022D3E80);
      }
      int v13 = 136446722;
      v14 = "-[CLEEDCoexMonitor createCoexMetricDictForCASubmission:]";
      __int16 v15 = 1024;
      BOOL v16 = v3;
      __int16 v17 = 2112;
      id v18 = v12;
      uint64_t v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitor createCoexMetricDictForCASubmission:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    return v12;
  }
  else
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022D3E80);
    }
    id v5 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      id v20 = "-[CLEEDCoexMonitor createCoexMetricDictForCASubmission:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#EED2CXMN,%{public}s, coexMetricDict nil", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022D3E80);
      }
      int v13 = 136446210;
      v14 = "-[CLEEDCoexMonitor createCoexMetricDictForCASubmission:]";
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitor createCoexMetricDictForCASubmission:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    return 0;
  }
}

- (void)submitCoexMetricToCAWithBatteryLevelAtCallStart:(int)a3 batteryLevelAtCallEnd:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v6 = [(CLEEDCoexMonitor *)self createCoexMetricDictForCASubmission:1];
  if (v6)
  {
    BOOL v7 = v6;
    id v8 = v6;
    [v7 setValue:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5)] forKey:@"batteryLevelAtStartOfCall"];
    [v7 setValue:[NSNumber numberWithInt:v4] forKey:@"batteryLevelAtEndOfCall"];
    int v9 = AnalyticsSendEventLazy();
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022D3E80);
    }
    v10 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = "NO";
      __int16 v15 = "-[CLEEDCoexMonitor submitCoexMetricToCAWithBatteryLevelAtCallStart:batteryLevelAtCallEnd:]";
      *(_DWORD *)buf = 136446723;
      if (v9) {
        v11 = "YES";
      }
      __int16 v16 = 2082;
      __int16 v17 = v11;
      __int16 v18 = 2113;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#EED2CXMN,%{public}s, eventSent:%{public}s, eventDict:%{private}@", buf, 0x20u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022D3E80);
      }
      id v12 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDCoexMonitor submitCoexMetricToCAWithBatteryLevelAtCallStart:batteryLevelAtCallEnd:]", "%s\n");
LABEL_21:
      if (v12 != buf) {
        free(v12);
      }
    }
  }
  else
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022D3E80);
    }
    int v13 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v15 = "-[CLEEDCoexMonitor submitCoexMetricToCAWithBatteryLevelAtCallStart:batteryLevelAtCallEnd:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#EED2CXMN,%{public}s, coexMetricDict nil", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022D3E80);
      }
      id v12 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDCoexMonitor submitCoexMetricToCAWithBatteryLevelAtCallStart:batteryLevelAtCallEnd:]", "%s\n");
      goto LABEL_21;
    }
  }
}

- (CLEEDMitigation)currentMitigation
{
  return self->_currentMitigation;
}

- (void)setCurrentMitigation:(id)a3
{
}

- (CLEEDCoexMonitorCellular)cellular
{
  return self->_cellular;
}

- (CLEEDCoexMonitorThermal)thermal
{
  return self->_thermal;
}

- (CLEEDCoexMonitorPower)power
{
  return self->_power;
}

- (id)fCoexMetricUpdateCallback
{
  return self->_fCoexMetricUpdateCallback;
}

- (void)setFCoexMetricUpdateCallback:(id)a3
{
  self->_id fCoexMetricUpdateCallback = a3;
}

@end