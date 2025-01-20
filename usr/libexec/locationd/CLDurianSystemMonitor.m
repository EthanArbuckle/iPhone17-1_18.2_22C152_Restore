@interface CLDurianSystemMonitor
- (BOOL)valid;
- (CLDurianSystemMonitor)init;
- (CLDurianSystemMonitor)initWithUniverse:(id)a3;
- (CLDurianSystemMonitorDelegate)delegate;
- (CLIntersiloUniverse)universe;
- (id).cxx_construct;
- (id)_onDataProtectionNotification:(int)a3 data:(uint64_t)a4;
- (int)coexImpactState;
- (void)_checkAudioStreamState;
- (void)_onBluetoothServiceNotification:(int)a3 data:(uint64_t)a4;
- (void)_onDaemonStatusNotification:(int)a3 data:(uint64_t)a4;
- (void)_onWifiServiceNotification:(int)a3 data:(uint64_t)a4;
- (void)_recomputeCoexImpactedStateAndNotifyClients;
- (void)_registerForNotifications;
- (void)_unregisterForNotifications;
- (void)dealloc;
- (void)fetchLOIVisitAtStart;
- (void)onVehicleStateNotification;
- (void)onVisit:(id)a3;
- (void)registerForVehicleStateNotification;
- (void)setDelegate:(id)a3;
- (void)setUniverse:(id)a3;
- (void)setValid:(BOOL)a3;
- (void)unregisterForVehicleStateNotification;
@end

@implementation CLDurianSystemMonitor

- (CLDurianSystemMonitor)init
{
  return 0;
}

- (CLDurianSystemMonitor)initWithUniverse:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLDurianSystemMonitor;
  v4 = [(CLDurianSystemMonitor *)&v9 init];
  v5 = v4;
  if (v4)
  {
    [(CLDurianSystemMonitor *)v4 setUniverse:a3];
    v5->_vehicleStateProxy = 0;
    [(CLDurianSystemMonitor *)v5 _registerForNotifications];
    dispatch_time_t v6 = dispatch_time(0, 500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1015D8308;
    block[3] = &unk_10229FED8;
    block[4] = v5;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
    [(CLDurianSystemMonitor *)v5 fetchLOIVisitAtStart];
    [(CLDurianSystemMonitor *)v5 setValid:1];
  }
  return v5;
}

- (void)dealloc
{
  [(CLDurianSystemMonitor *)self _unregisterForNotifications];
  v3.receiver = self;
  v3.super_class = (Class)CLDurianSystemMonitor;
  [(CLDurianSystemMonitor *)&v3 dealloc];
}

- (int)coexImpactState
{
  return self->_isCoexImpacted;
}

- (void)_recomputeCoexImpactedStateAndNotifyClients
{
  int isCoexImpacted = self->_isCoexImpacted;
  self->_int isCoexImpacted = self->_btStreaming | (2 * self->_wifiNetworkCritical) | (4 * self->_isAssociatedTo2GHzWiFi);
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331CA0);
  }
  v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = self->_isCoexImpacted;
    BOOL btStreaming = self->_btStreaming;
    BOOL wifiNetworkCritical = self->_wifiNetworkCritical;
    BOOL isAssociatedTo2GHzWiFi = self->_isAssociatedTo2GHzWiFi;
    v9[0] = 68290306;
    v9[1] = 0;
    __int16 v10 = 2082;
    v11 = "";
    __int16 v12 = 1026;
    int v13 = v5;
    __int16 v14 = 1026;
    BOOL v15 = btStreaming;
    __int16 v16 = 1026;
    BOOL v17 = wifiNetworkCritical;
    __int16 v18 = 1026;
    BOOL v19 = isAssociatedTo2GHzWiFi;
    __int16 v20 = 1026;
    int v21 = isCoexImpacted;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #system coex\", \"state\":%{public}d, \"btaudio\":%{public}d, \"wifiNetworkCritical\":%{public}d, \"isAssociatedTo2GHzWiFi\":%{public}d, \"prior\":%{public}d}", (uint8_t *)v9, 0x30u);
  }
  if (isCoexImpacted != self->_isCoexImpacted) {
    [(CLDurianSystemMonitorDelegate *)[(CLDurianSystemMonitor *)self delegate] systemCoexImpact:self toState:self->_isCoexImpacted];
  }
}

- (void)_checkAudioStreamState
{
  uint64_t state64 = 42;
  if (notify_get_state(self->_audioStreamNotificationToken, &state64))
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331CA0);
    }
    objc_super v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      objc_super v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian #system failed to get audio stream state\"}", buf, 0x12u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331CA0);
      }
    }
    v4 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      *(_DWORD *)buf = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      objc_super v9 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #system failed to get audio stream state", "{\"msg%{public}.0s\":\"#durian #system failed to get audio stream state\"}", buf, 0x12u);
    }
  }
  else
  {
    if (state64 <= 1) {
      self->_BOOL btStreaming = state64;
    }
    [(CLDurianSystemMonitor *)self _recomputeCoexImpactedStateAndNotifyClients];
  }
}

- (void)_registerForNotifications
{
}

- (void)_unregisterForNotifications
{
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:2];
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:3];
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:6];
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:16];
  [*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2) unregister:*((void *)self->_wifiServiceClient.__ptr_.__value_ + 1) forNotification:13];
  [*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2) unregister:*((void *)self->_wifiServiceClient.__ptr_.__value_ + 1) forNotification:6];
  CFRelease(self->_wifiManager);
  self->_wifiManager = 0;
  [(CLRoutineMonitorServiceProtocol *)self->_routineMonitor stopLeechingVisitsForClient:self];
  [(CLDurianSystemMonitor *)self unregisterForVehicleStateNotification];
  value = self->_bluetoothServiceClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:4];
    [*((id *)self->_bluetoothServiceClient.__ptr_.__value_ + 2) unregister:*((void *)self->_bluetoothServiceClient.__ptr_.__value_ + 1) forNotification:5];
    v4 = self->_bluetoothServiceClient.__ptr_.__value_;
    uint64_t v6 = *((void *)v4 + 1);
    int v5 = (void *)*((void *)v4 + 2);
    [v5 unregister:v6 forNotification:11];
  }
}

- (void)_onDaemonStatusNotification:(int)a3 data:(uint64_t)a4
{
  if (a3 > 5)
  {
    if (a3 == 6)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331CA0);
      }
      __int16 v10 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = *(_DWORD *)(a4 + 4);
        int v14 = 68289282;
        int v15 = 0;
        __int16 v16 = 2082;
        BOOL v17 = "";
        __int16 v18 = 1026;
        int v19 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #system\", \"reach\":%{public}d}", (uint8_t *)&v14, 0x18u);
      }
      [objc_msgSend(a1, "delegate") systemConnectivity:a1 isConnected:*(_DWORD *)(a4 + 4) != 0];
    }
    else
    {
      if (a3 != 16)
      {
LABEL_26:
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102331CA0);
        }
        __int16 v12 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
        {
          int v14 = 68289282;
          int v15 = 0;
          __int16 v16 = 2082;
          BOOL v17 = "";
          __int16 v18 = 1026;
          int v19 = a3;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian #system unexpected status\", \"notification\":%{public}d}", (uint8_t *)&v14, 0x18u);
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331CA0);
          }
        }
        int v13 = qword_102419398;
        if (os_signpost_enabled((os_log_t)qword_102419398))
        {
          int v14 = 68289282;
          int v15 = 0;
          __int16 v16 = 2082;
          BOOL v17 = "";
          __int16 v18 = 1026;
          int v19 = a3;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #system unexpected status", "{\"msg%{public}.0s\":\"#durian #system unexpected status\", \"notification\":%{public}d}", (uint8_t *)&v14, 0x18u);
        }
        return;
      }
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331CA0);
      }
      int v7 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 68289026;
        int v15 = 0;
        __int16 v16 = 2082;
        BOOL v17 = "";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #system metricheartbeat\"}", (uint8_t *)&v14, 0x12u);
      }
      [objc_msgSend(a1, "delegate") systemMetricHeartbeat];
    }
  }
  else
  {
    if (a3 != 2)
    {
      if (a3 == 3)
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102331CA0);
        }
        uint64_t v6 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 68289026;
          int v15 = 0;
          __int16 v16 = 2082;
          BOOL v17 = "";
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #system waking\"}", (uint8_t *)&v14, 0x12u);
        }
        [objc_msgSend(a1, "delegate") systemWaking:a1 atTime:CFAbsoluteTimeGetCurrent()];
        return;
      }
      goto LABEL_26;
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331CA0);
    }
    __int16 v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 68289026;
      int v15 = 0;
      __int16 v16 = 2082;
      BOOL v17 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #system will sleep\"}", (uint8_t *)&v14, 0x12u);
    }
    [objc_msgSend(a1, "delegate") systemWillSleep:a1];
  }
}

- (void)_onWifiServiceNotification:(int)a3 data:(uint64_t)a4
{
  if (a3 == 6)
  {
    v7 = *(unsigned char *)(a4 + 96) && (int v6 = *(_DWORD *)(a4 + 48), v6 >= 1) && sub_100D550A4(v6);
    a1[56] = v7;
    goto LABEL_17;
  }
  if (a3 == 13)
  {
    a1[49] = *(unsigned char *)(a4 + 139);
LABEL_17:
    [a1 _recomputeCoexImpactedStateAndNotifyClients];
    return;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331CA0);
  }
  __int16 v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
  {
    int v10 = 68289282;
    int v11 = 0;
    __int16 v12 = 2082;
    int v13 = "";
    __int16 v14 = 1026;
    int v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian #system unexpected wifi\", \"notification\":%{public}d}", (uint8_t *)&v10, 0x18u);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331CA0);
    }
  }
  objc_super v9 = qword_102419398;
  if (os_signpost_enabled((os_log_t)qword_102419398))
  {
    int v10 = 68289282;
    int v11 = 0;
    __int16 v12 = 2082;
    int v13 = "";
    __int16 v14 = 1026;
    int v15 = a3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #system unexpected wifi", "{\"msg%{public}.0s\":\"#durian #system unexpected wifi\", \"notification\":%{public}d}", (uint8_t *)&v10, 0x18u);
  }
}

- (void)_onBluetoothServiceNotification:(int)a3 data:(uint64_t)a4
{
  if (a3 == 11 || a3 == 5)
  {
    int v11 = (void *)(a4 + 16);
    if (*(char *)(a4 + 39) < 0) {
      int v11 = (void *)*v11;
    }
    __int16 v12 = [+[NSString stringWithUTF8String:v11] stringByReplacingOccurrencesOfString:@":" withString:&stru_10234F018];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331CA0);
    }
    int v13 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      int v17 = 0;
      __int16 v18 = 2082;
      int v19 = "";
      __int16 v20 = 2114;
      int v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #system received bluetooth disconnect event\", \"deviceAddress\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
    id v8 = [a1 delegate];
    objc_super v9 = v12;
    uint64_t v10 = 2;
    goto LABEL_18;
  }
  if (a3 == 4)
  {
    int v5 = (void *)(a4 + 16);
    if (*(char *)(a4 + 39) < 0) {
      int v5 = (void *)*v5;
    }
    int v6 = [+[NSString stringWithUTF8String:v5] stringByReplacingOccurrencesOfString:@":" withString:&stru_10234F018];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331CA0);
    }
    BOOL v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      int v17 = 0;
      __int16 v18 = 2082;
      int v19 = "";
      __int16 v20 = 2114;
      int v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #system received bluetooth connect event\", \"deviceAddress\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
    id v8 = [a1 delegate];
    objc_super v9 = v6;
    uint64_t v10 = 1;
LABEL_18:
    [v8 updateDeviceConnectionState:v9 state:v10];
    return;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331CA0);
  }
  __int16 v14 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#durian #system, received unhandled bluetooth service notification", buf, 2u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331CA0);
    }
    int v15 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLDurianSystemMonitor _onBluetoothServiceNotification:data:]", "%s\n", v15);
    if (v15 != (char *)buf) {
      free(v15);
    }
  }
}

- (void)onVisit:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331CA0);
  }
  int v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289538;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    __int16 v9 = 2050;
    id v10 = [objc_msgSend(a3, "_placeInference") userType];
    __int16 v11 = 1026;
    unsigned int v12 = [a3 hasDepartureDate] ^ 1;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #system visit\", \"loitype\":%{public}ld, \"entry\":%{public}hhd}", (uint8_t *)v6, 0x22u);
  }
  [-[CLDurianSystemMonitor delegate](self, "delegate") updateSystemLoiType:[objc_msgSend(objc_msgSend(a3, "_placeInference"), "userType")] isEntry:objc_msgSend(a3, "hasDepartureDate") ^ 1];
}

- (void)fetchLOIVisitAtStart
{
  id v3 = objc_alloc((Class)RTStoredVisitFetchOptions);
  id v4 = [v3 initWithAscending:0 confidence:[NSNumber numberWithDouble:RTVisitConfidenceHigh] dateInterval:0 labelVisit:1 limit:&off_102395270];
  routineMonitor = self->_routineMonitor;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_1015D99B0;
  v6[3] = &unk_10229FF00;
  v6[4] = self;
  [(CLRoutineMonitorServiceProtocol *)routineMonitor fetchStoredVisitsWithOptions:v4 withReply:v6];
}

- (id)_onDataProtectionNotification:(int)a3 data:(uint64_t)a4
{
  if (a3 == 1)
  {
    char v4 = BYTE4(a4);
    int v5 = result;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331CA0);
    }
    int v6 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67174657;
      int v9 = v4 & 1;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#durian received keybag unlock notification state:%{private}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331CA0);
      }
      __int16 v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDurianSystemMonitor _onDataProtectionNotification:data:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    return [v5 delegate].onFirstUnlock;
  }
  return result;
}

- (void)registerForVehicleStateNotification
{
  if (objc_msgSend(-[CLIntersiloUniverse vendor](-[CLDurianSystemMonitor universe](self, "universe"), "vendor"), "isServiceEnabled:", @"CLVehicleStateNotifier")&& !self->_vehicleStateProxy)
  {
    id v3 = [(CLVehicleStateNotifierProtocol *)[CLIntersiloUniverse vendor]([CLDurianSystemMonitor universe](self, "universe"), "vendor") proxyForService:@"CLVehicleStateNotifier"];
    self->_vehicleStateProxy = v3;
    [(CLVehicleStateNotifierProtocol *)v3 registerDelegate:self inSilo:[(CLIntersiloUniverse *)self->_universe silo]];
    [(CLVehicleStateNotifierProtocol *)self->_vehicleStateProxy setDelegateEntityName:"CLDurianSystemMonitor"];
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1015DA00C;
  handler[3] = &unk_1022B4250;
  handler[4] = self;
  notify_register_dispatch((const char *)[kCMVehicularStateChangedNotification UTF8String], &self->_vehicularToken, (dispatch_queue_t)[-[CLIntersiloUniverse silo](-[CLDurianSystemMonitor universe](self, "universe"), "silo") queue], handler);
}

- (void)unregisterForVehicleStateNotification
{
  if (notify_is_valid_token(self->_vehicularToken))
  {
    notify_cancel(self->_vehicularToken);
    self->_vehicularToken = -1;
  }
  vehicleStateProxy = self->_vehicleStateProxy;
  if (vehicleStateProxy)
  {

    self->_vehicleStateProxy = 0;
  }
}

- (void)onVehicleStateNotification
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  char v5 = 0;
  vehicleStateProxy = self->_vehicleStateProxy;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1015DA150;
  v3[3] = &unk_102331C80;
  v3[4] = self;
  v3[5] = v4;
  [(CLVehicleStateNotifierProtocol *)vehicleStateProxy fetchVehicularDndStateAndHintsAndOperatorStateWithReply:v3];
  _Block_object_dispose(v4, 8);
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

- (CLDurianSystemMonitorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLDurianSystemMonitorDelegate *)a3;
}

- (CLIntersiloUniverse)universe
{
  return (CLIntersiloUniverse *)objc_getProperty(self, a2, 96, 1);
}

- (void)setUniverse:(id)a3
{
}

- (void).cxx_destruct
{
  value = self->_dataProtectionClient.__ptr_.__value_;
  self->_dataProtectionClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  char v4 = self->_bluetoothServiceClient.__ptr_.__value_;
  self->_bluetoothServiceClient.__ptr_.__value_ = 0;
  if (v4) {
    (*(void (**)(Client *, SEL))(*(void *)v4 + 8))(v4, a2);
  }
  char v5 = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0;
  if (v5) {
    (*(void (**)(Client *, SEL))(*(void *)v5 + 8))(v5, a2);
  }
  int v6 = self->_daemonStatusClient.__ptr_.__value_;
  self->_daemonStatusClient.__ptr_.__value_ = 0;
  if (v6)
  {
    __int16 v7 = *(void (**)(void))(*(void *)v6 + 8);
    v7();
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end