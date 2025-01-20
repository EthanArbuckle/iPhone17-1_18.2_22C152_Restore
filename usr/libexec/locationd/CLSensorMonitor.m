@interface CLSensorMonitor
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)deferXpcActivityIfNecessary:(id)a3;
- (CLSensorMonitor)init;
- (Class)classForSensorIdentifier:(id)a3;
- (id).cxx_construct;
- (void)beginService;
- (void)clearConfigurationsForUninstalledApps:(id)a3;
- (void)endService;
- (void)onAppUninstallationCheckActivity:(id)a3;
- (void)onCatherineNotification:(int)a3 data:(NotificationData *)a4;
- (void)onDaemonStatusNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onFallSnippetNotification:(int)a3 data:(ImpactStreamData *)a4;
- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onOdometerNotification:(int)a3 data:(NotificationData *)a4;
- (void)onStepNotification:(int)a3 data:(NotificationData *)a4;
- (void)scheduleAppUninstallationCheck;
- (void)sensorWriter:(id)a3 didReceiveUpdateToConfigurationRequests:(id)a4;
- (void)sensorWriterDidStopMonitoring:(id)a3;
- (void)sensorWriterWillStartMonitoring:(id)a3;
- (void)simulateMotionSensorDataForType:(unint64_t)a3 payload:(id)a4;
@end

@implementation CLSensorMonitor

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
  if (qword_10247DBC0 != -1) {
    dispatch_once(&qword_10247DBC0, &stru_1022C75F8);
  }
  return (id)qword_10247DBB8;
}

+ (BOOL)isSupported
{
  return 1;
}

- (CLSensorMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSensorMonitor;
  return [(CLSensorMonitor *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLSensorMonitorProtocol outboundProtocol:&OBJC_PROTOCOL___CLSensorMonitorClientProtocol];
}

- (void)beginService
{
  if (objc_msgSend(objc_msgSend(-[CLSensorMonitor universe](self, "universe"), "vendor"), "isServiceEnabled:", @"CLStepCountNotifier"))
  {
    [(CLSensorMonitor *)self universe];
    sub_101589B60();
  }
  if (objc_msgSend(objc_msgSend(-[CLSensorMonitor universe](self, "universe"), "vendor"), "isServiceEnabled:", @"CLFallNotifier"))
  {
    [(CLSensorMonitor *)self universe];
    sub_100A5D6C0();
  }
  if (objc_msgSend(objc_msgSend(-[CLSensorMonitor universe](self, "universe"), "vendor"), "isServiceEnabled:", @"CLOdometerNotifier"))
  {
    [(CLSensorMonitor *)self universe];
    sub_1004A1714();
  }
  if (objc_msgSend(objc_msgSend(-[CLSensorMonitor universe](self, "universe"), "vendor"), "isServiceEnabled:", @"CLCatherineNotifier"))
  {
    [(CLSensorMonitor *)self universe];
    sub_100A1F244();
  }
  if (objc_msgSend(objc_msgSend(-[CLSensorMonitor universe](self, "universe"), "vendor"), "isServiceEnabled:", @"CLMotionStateMediator"))
  {
    [(CLSensorMonitor *)self universe];
    sub_1006A564C();
  }
  [(CLSensorMonitor *)self universe];
  sub_10060F068();
}

- (void)endService
{
  [self universe].silo
  value = self->_stepCountClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:0];
    [*((id *)self->_stepCountClient.__ptr_.__value_ + 2) unregister:*((void *)self->_stepCountClient.__ptr_.__value_ + 1) forNotification:3];
    v4 = self->_stepCountClient.__ptr_.__value_;
    self->_stepCountClient.__ptr_.__value_ = 0;
    if (v4) {
      (*(void (**)(Client *))(*(void *)v4 + 8))(v4);
    }
  }

  unint64_t v5 = self->_odometerClient.__ptr_.__value_;
  if (v5)
  {
    [*((id *)v5 + 2) unregister:*((void *)v5 + 1) forNotification:4];
    [*((id *)self->_odometerClient.__ptr_.__value_ + 2) unregister:*((void *)self->_odometerClient.__ptr_.__value_ + 1) forNotification:7];
    v6 = self->_odometerClient.__ptr_.__value_;
    self->_odometerClient.__ptr_.__value_ = 0;
    if (v6) {
      (*(void (**)(Client *))(*(void *)v6 + 8))(v6);
    }
  }

  v7 = self->_heartRateClient.__ptr_.__value_;
  if (v7)
  {
    [*((id *)v7 + 2) unregister:*((void *)v7 + 1) forNotification:10];
    v8 = self->_heartRateClient.__ptr_.__value_;
    self->_heartRateClient.__ptr_.__value_ = 0;
    if (v8) {
      (*(void (**)(Client *))(*(void *)v8 + 8))(v8);
    }
  }

  v9 = self->_fallClient.__ptr_.__value_;
  if (v9)
  {
    [*((id *)v9 + 2) unregister:*((void *)v9 + 1) forNotification:2];
    v10 = self->_fallClient.__ptr_.__value_;
    self->_fallClient.__ptr_.__value_ = 0;
    if (v10) {
      (*(void (**)(Client *))(*(void *)v10 + 8))(v10);
    }
  }

  v11 = self->_motionStateMediatorClient.__ptr_.__value_;
  if (v11)
  {
    [*((id *)v11 + 2) unregister:*((void *)v11 + 1) forNotification:4];
    v12 = self->_motionStateMediatorClient.__ptr_.__value_;
    self->_motionStateMediatorClient.__ptr_.__value_ = 0;
    if (v12) {
      (*(void (**)(Client *))(*(void *)v12 + 8))(v12);
    }
  }

  v13 = self->_daemonStatusClient.__ptr_.__value_;
  if (v13)
  {
    [*((id *)v13 + 2) unregister:*((void *)v13 + 1) forNotification:11];
    [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:17];
    v14 = self->_daemonStatusClient.__ptr_.__value_;
    self->_daemonStatusClient.__ptr_.__value_ = 0;
    if (v14)
    {
      v15 = *(void (**)(void))(*(void *)v14 + 8);
      v15();
    }
  }
}

- (void)onAppUninstallationCheckActivity:(id)a3
{
  if (!a3)
  {
    if (qword_102419280 != -1) {
      dispatch_once(&qword_102419280, &stru_1022C7660);
    }
    v8 = qword_102419288;
    if (os_log_type_enabled((os_log_t)qword_102419288, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid xpc activity.", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419280 == -1)
    {
LABEL_28:
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLSensorMonitor onAppUninstallationCheckActivity:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
      return;
    }
LABEL_30:
    dispatch_once(&qword_102419280, &stru_1022C7660);
    goto LABEL_28;
  }
  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    if (qword_102419280 != -1) {
      dispatch_once(&qword_102419280, &stru_1022C7660);
    }
    v7 = qword_102419288;
    if (os_log_type_enabled((os_log_t)qword_102419288, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Preparing to delete configurations from uninstalled apps", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419280 != -1) {
        dispatch_once(&qword_102419280, &stru_1022C7660);
      }
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor onAppUninstallationCheckActivity:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    [(CLSensorMonitor *)self clearConfigurationsForUninstalledApps:a3];
    return;
  }
  if (qword_102419280 != -1) {
    dispatch_once(&qword_102419280, &stru_1022C7660);
  }
  v9 = qword_102419288;
  if (os_log_type_enabled((os_log_t)qword_102419288, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v13 = "com.apple.locationd.AppUninstallationCheck";
    __int16 v14 = 2048;
    xpc_activity_state_t v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unexpected %{public}s activity state: %ld", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419280 == -1) {
      goto LABEL_28;
    }
    goto LABEL_30;
  }
}

- (void)simulateMotionSensorDataForType:(unint64_t)a3 payload:(id)a4
{
  if (qword_1024195B0 != -1) {
    dispatch_once(&qword_1024195B0, &stru_1022C7640);
  }
  v7 = qword_1024195B8;
  if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Simulate motion sensor data for type : %lu, data : %@", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024195B0 != -1) {
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
    }
    int v23 = 134218242;
    unint64_t v24 = a3;
    __int16 v25 = 2112;
    id v26 = a4;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor simulateMotionSensorDataForType:payload:]", "%s\n", v17);
    if (v17 != (char *)buf) {
      free(v17);
    }
  }
  switch(a3)
  {
    case 0uLL:
      +[CLSensorMonitorSimulatedDataGenerator generateSimulatedPedometerData:a4];
      memcpy(__dst, buf, sizeof(__dst));
      v8 = __dst;
      v9 = self;
      uint64_t v10 = 0;
      goto LABEL_19;
    case 1uLL:
      +[CLSensorMonitorSimulatedDataGenerator generateSimulatedOdometerData:a4];
      v21[8] = *(_OWORD *)&buf[128];
      v21[9] = *(_OWORD *)&buf[144];
      v21[10] = *(_OWORD *)&buf[160];
      v21[11] = *(_OWORD *)&buf[176];
      v21[4] = *(_OWORD *)&buf[64];
      v21[5] = *(_OWORD *)&buf[80];
      v21[6] = *(_OWORD *)&buf[96];
      v21[7] = *(_OWORD *)&buf[112];
      v21[0] = *(_OWORD *)buf;
      v21[1] = *(_OWORD *)&buf[16];
      v21[2] = *(_OWORD *)&buf[32];
      v21[3] = *(_OWORD *)&buf[48];
      v13 = v21;
      __int16 v14 = self;
      uint64_t v15 = 4;
      goto LABEL_21;
    case 2uLL:
      v20[0] = +[CLSensorMonitorSimulatedDataGenerator generateSimulatedOdometerSuitabilityData:a4];
      v20[1] = v16;
      v8 = v20;
      v9 = self;
      uint64_t v10 = 3;
LABEL_19:
      [(CLSensorMonitor *)v9 onStepNotification:v10 data:v8];
      return;
    case 3uLL:
      +[CLSensorMonitorSimulatedDataGenerator generateSimulatedElevationData:a4];
      v19[8] = *(_OWORD *)&buf[128];
      v19[9] = *(_OWORD *)&buf[144];
      v19[10] = *(_OWORD *)&buf[160];
      v19[11] = *(_OWORD *)&buf[176];
      v19[4] = *(_OWORD *)&buf[64];
      v19[5] = *(_OWORD *)&buf[80];
      v19[6] = *(_OWORD *)&buf[96];
      v19[7] = *(_OWORD *)&buf[112];
      v19[0] = *(_OWORD *)buf;
      v19[1] = *(_OWORD *)&buf[16];
      v19[2] = *(_OWORD *)&buf[32];
      v19[3] = *(_OWORD *)&buf[48];
      v13 = v19;
      __int16 v14 = self;
      uint64_t v15 = 3;
LABEL_21:
      [(CLSensorMonitor *)v14 onOdometerNotification:v15 data:v13];
      break;
    case 4uLL:
      +[CLSensorMonitorSimulatedDataGenerator generateHighFrequencyHeartRateData:a4];
      v18[0] = *(_OWORD *)buf;
      v18[1] = *(_OWORD *)&buf[16];
      v18[2] = *(_OWORD *)&buf[32];
      v18[3] = *(_OWORD *)&buf[48];
      [(CLSensorMonitor *)self onCatherineNotification:10 data:v18];
      break;
    case 5uLL:
      +[CLSensorMonitorSimulatedDataGenerator generateSimulatedPhysicalActivityEventsData:a4];
      int v23 = 4;
      [(CLSensorMonitor *)self onMotionStateMediatorNotification:&v23 data:buf];
      break;
    default:
      if (qword_1024195B0 != -1) {
        dispatch_once(&qword_1024195B0, &stru_1022C7640);
      }
      v11 = qword_1024195B8;
      if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = a3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unhandled motion sensor type %lu", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024195B0 != -1) {
          dispatch_once(&qword_1024195B0, &stru_1022C7640);
        }
        int v23 = 134217984;
        unint64_t v24 = a3;
        v12 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLSensorMonitor simulateMotionSensorDataForType:payload:]", "%s\n", v12);
        if (v12 != (char *)buf) {
          free(v12);
        }
      }
      break;
  }
}

- (void)scheduleAppUninstallationCheck
{
  if (qword_102419280 != -1) {
    dispatch_once(&qword_102419280, &stru_1022C7660);
  }
  objc_super v3 = qword_102419288;
  if (os_log_type_enabled((os_log_t)qword_102419288, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v12 = "com.apple.locationd.AppUninstallationCheck";
    __int16 v13 = 2050;
    int64_t v14 = XPC_ACTIVITY_INTERVAL_1_MIN;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s: Registering XPC Activity with delay=(%{public}lld)", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419280 != -1) {
      dispatch_once(&qword_102419280, &stru_1022C7660);
    }
    int v7 = 136446466;
    v8 = "com.apple.locationd.AppUninstallationCheck";
    __int16 v9 = 2050;
    int64_t v10 = XPC_ACTIVITY_INTERVAL_1_MIN;
    unint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor scheduleAppUninstallationCheck]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_1_MIN);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100765928;
  handler[3] = &unk_1022B9CD0;
  handler[4] = [objc_msgSend(-[CLSensorMonitor universe](self, "universe"), "vendor") proxyForService:@"CLSensorMonitor"];
  xpc_activity_register("com.apple.locationd.AppUninstallationCheck", v4, handler);
  xpc_release(v4);
}

- (void)clearConfigurationsForUninstalledApps:(id)a3
{
  id v5 = +[NSMutableArray array];
  uint64_t v6 = sub_100F8CC8C();
  sub_100F8F710(v6, (uint64_t)v5);
  if (![(CLSensorMonitor *)self deferXpcActivityIfNecessary:a3])
  {
    sub_100103240();
    if (sub_10010145C() && [v5 count])
    {
      unint64_t v7 = 0;
      do
      {
        [v5 setObject:[v5 objectAtIndexedSubscript:v7] stringByAppendingPathExtension:@"watchkitapp" atIndexedSubscript:v7];
        if (qword_102419280 != -1) {
          dispatch_once(&qword_102419280, &stru_1022C7660);
        }
        v8 = qword_102419288;
        if (os_log_type_enabled((os_log_t)qword_102419288, OS_LOG_TYPE_DEBUG))
        {
          id v9 = [v5 objectAtIndexedSubscript:v7];
          *(_DWORD *)buf = 138543362;
          id v15 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Updated bundleId to %{public}@ for uninstall check", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419280 != -1) {
            dispatch_once(&qword_102419280, &stru_1022C7660);
          }
          int v12 = 138543362;
          id v13 = [v5 objectAtIndexedSubscript:v7];
          int64_t v10 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor clearConfigurationsForUninstalledApps:]", "%s\n", v10);
          if (v10 != (char *)buf) {
            free(v10);
          }
        }
        ++v7;
      }
      while (v7 < (unint64_t)[v5 count]);
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100765E20;
    v11[3] = &unk_1022C7620;
    v11[4] = self;
    v11[5] = a3;
    [objc_msgSend(-[CLSensorMonitor universe](self, "universe"), "vendor") proxyForService:@"CLAppMonitor" forClient:@"CLSensorMonitor"] checkApplications:v5 withReply:v11];
  }
}

- (BOOL)deferXpcActivityIfNecessary:(id)a3
{
  BOOL should_defer = xpc_activity_should_defer((xpc_activity_t)a3);
  if (should_defer)
  {
    if (qword_102419280 != -1) {
      dispatch_once(&qword_102419280, &stru_1022C7660);
    }
    id v5 = qword_102419288;
    if (os_log_type_enabled((os_log_t)qword_102419288, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      id v13 = "com.apple.locationd.AppUninstallationCheck";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attempting to defer %{public}s activity", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419280 != -1) {
        dispatch_once(&qword_102419280, &stru_1022C7660);
      }
      id v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor deferXpcActivityIfNecessary:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    if (xpc_activity_set_state((xpc_activity_t)a3, 3))
    {
      LOBYTE(should_defer) = 1;
    }
    else
    {
      if (qword_102419280 != -1) {
        dispatch_once(&qword_102419280, &stru_1022C7660);
      }
      uint64_t v6 = qword_102419288;
      if (os_log_type_enabled((os_log_t)qword_102419288, OS_LOG_TYPE_FAULT))
      {
        xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
        *(_DWORD *)buf = 136446466;
        id v13 = "com.apple.locationd.AppUninstallationCheck";
        __int16 v14 = 2050;
        xpc_activity_state_t v15 = state;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Failed to mark %{public}s activity as deferred. Current state is %{public}ld", buf, 0x16u);
      }
      BOOL v8 = sub_10013D1A0(115, 0);
      LOBYTE(should_defer) = 0;
      if (v8)
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419280 != -1) {
          dispatch_once(&qword_102419280, &stru_1022C7660);
        }
        xpc_activity_get_state((xpc_activity_t)a3);
        int64_t v10 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLSensorMonitor deferXpcActivityIfNecessary:]", "%s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
        LOBYTE(should_defer) = 0;
      }
    }
  }
  return should_defer;
}

- (void)onStepNotification:(int)a3 data:(NotificationData *)a4
{
  [CLSensorMonitor universe:self silo];
  if (a3 == 3)
  {
    id v20 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:*(double *)a4];
    if (qword_1024195B0 != -1) {
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
    }
    v21 = qword_1024195B8;
    if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
    {
      double v22 = *(double *)a4;
      unsigned int v23 = *((unsigned __int8 *)a4 + 8);
      int v24 = *((unsigned __int8 *)a4 + 9);
      *(_DWORD *)buf = 134349568;
      double v51 = v22;
      __int16 v52 = 1026;
      unsigned int v53 = v23;
      __int16 v54 = 1026;
      LODWORD(v55) = v24;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - OdometerSuitability values,startDate,%{public}.8f,suitableForRunning,%{public}d,suitableForWalking,%{public}d", buf, 0x18u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195B0 != -1) {
        dispatch_once(&qword_1024195B0, &stru_1022C7640);
      }
      v36 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor onStepNotification:data:]", "%s\n", v36);
      if (v36 != (char *)buf) {
        free(v36);
      }
    }
    id v25 = [objc_alloc((Class)CMOdometerSuitability) initWithStartDate:v20 suitableForRunning:*((unsigned __int8 *)a4 + 8) suitableForWalking:*((unsigned __int8 *)a4 + 9)];
    [(SRSensorWriter *)self->_odometerSuitabilityWriter provideSample:v25];
    if (qword_1024195B0 != -1) {
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
    }
    id v26 = qword_1024195B8;
    if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - OdometerSuitability sample sent to SensorKit", buf, 2u);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_34;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024195B0 == -1) {
      goto LABEL_45;
    }
LABEL_47:
    dispatch_once(&qword_1024195B0, &stru_1022C7640);
LABEL_45:
    v38 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor onStepNotification:data:]", "%s\n", v38);
    if (v38 != (char *)buf) {
      free(v38);
    }
    goto LABEL_34;
  }
  if (a3) {
    return;
  }
  v43 = self;
  double v8 = *((double *)a4 + 1);
  double v7 = *((double *)a4 + 2);
  unsigned int v9 = *((_DWORD *)a4 + 6);
  double v10 = *((double *)a4 + 4);
  uint64_t v12 = *((unsigned int *)a4 + 16);
  uint64_t v11 = *((unsigned int *)a4 + 17);
  double v14 = *((double *)a4 + 9);
  double v13 = *((double *)a4 + 10);
  double v15 = *((double *)a4 + 11);
  int v16 = *((_DWORD *)a4 + 24);
  uint64_t v17 = *((void *)a4 + 13);
  char v18 = *((unsigned char *)a4 + 112);
  char v19 = *((unsigned char *)a4 + 113);
  unsigned int v48 = *((_DWORD *)a4 + 37);
  unsigned int v49 = *((_DWORD *)a4 + 36);
  unsigned int v45 = *((_DWORD *)a4 + 39);
  unsigned int v46 = *((_DWORD *)a4 + 40);
  int v47 = *((unsigned __int8 *)a4 + 166);
  if (v17) {
    id v44 = [objc_alloc((Class)NSUUID) initWithUUIDString:v17];
  }
  else {
    id v44 = 0;
  }
  if (qword_1024195B0 != -1) {
    dispatch_once(&qword_1024195B0, &stru_1022C7640);
  }
  v27 = qword_1024195B8;
  if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134353152;
    double v51 = v8;
    __int16 v52 = 1026;
    unsigned int v53 = v9;
    __int16 v54 = 2050;
    double v55 = v10;
    __int16 v56 = 1026;
    int v57 = v12;
    __int16 v58 = 1026;
    int v59 = v11;
    __int16 v60 = 1026;
    int v61 = v16;
    __int16 v62 = 2050;
    double v63 = v14;
    __int16 v64 = 2050;
    double v65 = v13;
    __int16 v66 = 2050;
    double v67 = v7;
    __int16 v68 = 2050;
    double v69 = v15;
    __int16 v70 = 1026;
    int v71 = v18 & 1;
    __int16 v72 = 1026;
    int v73 = v19 & 1;
    __int16 v74 = 1026;
    unsigned int v75 = v49;
    __int16 v76 = 1026;
    unsigned int v77 = v48;
    __int16 v78 = 1026;
    unsigned int v79 = v45;
    __int16 v80 = 1026;
    unsigned int v81 = v46;
    __int16 v82 = 1026;
    int v83 = v47;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - StepCount values,startDate,%{public}.8f,count,%{public}d,distance,%{public}.3f,floorsAscended,%{public}d,floorsDescended,%{public}d,recordId,%{public}d,currentPace,%{public}.3f,currentCadence,%{public}.3f,firstStepTime,%{public}.8f,activeTime,%{public}.8f,isOdometerDistance,%{public}d,isOdometerPace,%{public}d,pushCount,%{public}d,workoutType,%{public}d,elevationAscended,%{public}d,elevationDescended,%{public}d,distanceSource,%{public}d", buf, 0x80u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024195B0 != -1) {
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
    }
    v37 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor onStepNotification:data:]", "%s\n", v37);
    if (v37 != (char *)buf) {
      free(v37);
    }
  }
  unsigned int v42 = v9;
  uint64_t v28 = v16;
  id v29 = objc_alloc((Class)CMPedometerData);
  v30 = +[NSNumber numberWithUnsignedInt:v12];
  v31 = +[NSNumber numberWithUnsignedInt:v11];
  if (v14 == 0.0) {
    v41 = 0;
  }
  else {
    v41 = +[NSNumber numberWithDouble:v14];
  }
  v32 = v30;
  if (v13 == 0.0) {
    v33 = 0;
  }
  else {
    v33 = +[NSNumber numberWithDouble:v13];
  }
  v34 = +[NSNumber numberWithDouble:v15];
  LODWORD(v40) = v47;
  v39 = +[NSNumber numberWithBool:v18 & 1];
  id v20 = v44;
  id v25 = objc_msgSend(v29, "initWithStartDate:endDate:steps:distance:floorsAscended:floorsDescended:recordID:currentPace:currentCadence:firstStepTime:activeTime:sourceId:isOdometerDistance:isOdometerPace:pushes:workoutType:elevationAscended:elevationDescended:distanceSource:", v42, v32, v31, v28, v41, v33, v8, v8, v10, v7, v34, v44, v39, +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v19 & 1), __PAIR64__(v48, v49),
          +[NSNumber numberWithUnsignedInt:v45],
          +[NSNumber numberWithUnsignedInt:v46],
          v40);
  [(SRSensorWriter *)v43->_pedometerWriter provideSample:v25];
  if (qword_1024195B0 != -1) {
    dispatch_once(&qword_1024195B0, &stru_1022C7640);
  }
  v35 = qword_1024195B8;
  if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - Pedometer sample sent to SensorKit", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024195B0 == -1) {
      goto LABEL_45;
    }
    goto LABEL_47;
  }
LABEL_34:
}

- (void)onFallSnippetNotification:(int)a3 data:(ImpactStreamData *)a4
{
  [self universe].silo
  id v6 = [objc_alloc((Class)CMFallStats) initWithBufferAndLength:*(void *)((char *)&a4->var5 + 7) length:*(void *)((char *)&a4->var6 + 7) - *(void *)((char *)&a4->var5 + 7)];
  LOBYTE(v14) = 0;
  sub_10006ACBC(buf, "SensorMonitorFallFileDump", (unsigned __int8 *)&v14, 0);
  if (buf[1])
  {
    double v7 = +[NSDate date];
    id v8 = objc_alloc_init((Class)NSDateFormatter);
    [v8 setDateFormat:@"yyyyMMdd_HH-mm-ss"];
    unsigned int v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"file:///tmp/com.apple.locationd/CMFallSnippetData_%@.msl", [v8 stringFromDate:v7]);
    [objc_msgSend(objc_msgSend(v6, "binarySampleRepresentation"), "writeToURL:atomically:", objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v9), 1];
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_1022C7680);
    }
    double v10 = qword_1024190F8;
    if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Dumped snippet in [%@]", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_1022C7680);
      }
      int v14 = 138412290;
      double v15 = v9;
      double v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor onFallSnippetNotification:data:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
  }
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022C76A0);
  }
  uint64_t v11 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = (NSString *)v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "#SensorMonitor get fall stats %@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022C76A0);
    }
    int v14 = 138412290;
    double v15 = (NSString *)v6;
    uint64_t v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor onFallSnippetNotification:data:]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  [(SRSensorWriter *)self->_fallStatsWriter provideSample:v6];
}

- (void)onOdometerNotification:(int)a3 data:(NotificationData *)a4
{
  [self universe].silo
  if (a3 == 7)
  {
LABEL_4:
    id v7 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:*((double *)a4 + 1)];
    uint64_t v8 = *((int *)a4 + 10);
    if (qword_1024195B0 != -1) {
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
    }
    unsigned int v9 = qword_1024195B8;
    if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
    {
      double v10 = *((double *)a4 + 1);
      int v11 = *((_DWORD *)a4 + 4);
      int v12 = *((_DWORD *)a4 + 5);
      int v13 = *((_DWORD *)a4 + 10);
      *(_DWORD *)buf = 134349824;
      double v56 = v10;
      __int16 v57 = 1026;
      *(_DWORD *)__int16 v58 = v11;
      *(_WORD *)&v58[4] = 1026;
      *(_DWORD *)&v58[6] = v12;
      LOWORD(v59) = 1026;
      *(_DWORD *)((char *)&v59 + 2) = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - Elevation values,startTime,%{public}.8f,elevationAscended,%{public}d,elevationDescended,%{public}d,source,%{public}d", buf, 0x1Eu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195B0 != -1) {
        dispatch_once(&qword_1024195B0, &stru_1022C7640);
      }
      v35 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor onOdometerNotification:data:]", "%s\n", v35);
      if (v35 != (char *)buf) {
        free(v35);
      }
    }
    id v14 = [objc_alloc((Class)CMElevationData) initWithStartDate:v7 endDate:v7 elevationAscended:*((unsigned int *)a4 + 4) elevationDescended:*((unsigned int *)a4 + 5) source:v8 recordId:0 sourceId:0];
    [(SRSensorWriter *)self->_elevationWriter provideSample:v14];
    if (qword_1024195B0 != -1) {
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
    }
    double v15 = qword_1024195B8;
    if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - Elevation sample sent to SensorKit", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195B0 != -1) {
        dispatch_once(&qword_1024195B0, &stru_1022C7640);
      }
      v36 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor onOdometerNotification:data:]", "%s\n", v36);
      if (v36 != (char *)buf) {
        free(v36);
      }
    }

    return;
  }
  if (a3 != 4)
  {
    if (a3 != 3) {
      return;
    }
    goto LABEL_4;
  }
  double v16 = *(double *)a4;
  double v17 = *((double *)a4 + 1);
  double v18 = *((double *)a4 + 2);
  double v19 = *((double *)a4 + 5);
  double v20 = *((double *)a4 + 7);
  double v44 = *((double *)a4 + 6);
  double v45 = *((double *)a4 + 3);
  double v21 = *((double *)a4 + 8);
  double v53 = *((double *)a4 + 9);
  int v22 = *((_DWORD *)a4 + 21);
  int v54 = *((_DWORD *)a4 + 20);
  uint64_t v42 = *((void *)a4 + 11);
  double v23 = *((double *)a4 + 13);
  double v46 = *((double *)a4 + 4);
  double v47 = *((double *)a4 + 12);
  long long v51 = *((_OWORD *)a4 + 7);
  long long v52 = *((_OWORD *)a4 + 8);
  double v24 = *((double *)a4 + 18);
  double v48 = *((double *)a4 + 19);
  long long v49 = *((_OWORD *)a4 + 10);
  CLOdometerTrackProximityInfo v50 = (CLOdometerTrackProximityInfo)*((_OWORD *)a4 + 11);
  id v25 = +[NSDate dateWithTimeIntervalSinceReferenceDate:*(double *)a4];
  uint64_t v26 = v22 == 1;
  if (v22 == 2) {
    uint64_t v26 = 2;
  }
  uint64_t v40 = v26;
  v41 = v25;
  p_previousOdometerEntry = &self->_previousOdometerEntry;
  double startTime = self->_previousOdometerEntry.startTime;
  int v43 = v22;
  if (startTime == 0.0) {
    goto LABEL_25;
  }
  if (vabdd_f64(v16, startTime) >= 1800.0)
  {
    if (qword_1024195B0 != -1) {
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
    }
    v30 = qword_1024195B8;
    if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
    {
      double v31 = p_previousOdometerEntry->startTime;
      *(_DWORD *)buf = 134349312;
      double v56 = v16;
      __int16 v57 = 2050;
      *(double *)__int16 v58 = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Ignoring cached OdometerEntry due to significant time between entries (%{public}.2f) (%{public}.2f)", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195B0 != -1) {
        dispatch_once(&qword_1024195B0, &stru_1022C7640);
      }
      v39 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor onOdometerNotification:data:]", "%s\n", v39);
      if (v39 != (char *)buf) {
        free(v39);
      }
    }
LABEL_25:
    id v29 = 0;
    goto LABEL_26;
  }
  id v29 = +[NSNumber numberWithDouble:v47 - self->_previousOdometerEntry.groundAltitude];
LABEL_26:
  id v32 = [objc_alloc((Class)CMOdometerData) initWithDeltaDistance:v41 startDate:v41 endDate:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v18) accuracy:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19) rawSpeed:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20) gpsSpeedAccuracy:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21) timestampGps:v17 deltaGroundAltitude:v29 groundAltitudeUncertainty:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v23) originDevice:v40 slope:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v24) maxAbsSlope:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v48)];
  if (qword_1024195B0 != -1) {
    dispatch_once(&qword_1024195B0, &stru_1022C7640);
  }
  v33 = qword_1024195B8;
  if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134286337;
    double v56 = v17;
    __int16 v57 = 2050;
    *(double *)__int16 v58 = v16;
    *(_WORD *)&v58[8] = 2049;
    double v59 = v46;
    __int16 v60 = 2049;
    double v61 = v19;
    __int16 v62 = 2049;
    double v63 = v20;
    __int16 v64 = 2049;
    double v65 = v18;
    __int16 v66 = 1025;
    int v67 = v43;
    __int16 v68 = 2049;
    double v69 = v47;
    __int16 v70 = 2049;
    double v71 = v23;
    __int16 v72 = 2049;
    double v73 = v21;
    __int16 v74 = 2049;
    double v75 = v24;
    __int16 v76 = 2049;
    double v77 = v48;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - Odometer values,distance,%{private}.8f,startTime,%{public}.8f,speed,%{private}.8f,rawSpeed,%{private}.4f,gpsSpeedAccuracy,%{private}.4f,accuracy,%{private}.4f,originDevice,%{private}d,groundAltitude,%{private}.4f,groundAltitudeUncertainty,%{private}.4f,timestampGps,%{private}.4f,slope,%{private}.4f,maxAbsSlope,%{private}.4f", buf, 0x76u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024195B0 != -1) {
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
    }
    v37 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor onOdometerNotification:data:]", "%s\n", v37);
    if (v37 != (char *)buf) {
      free(v37);
    }
  }
  [(SRSensorWriter *)self->_odometerWriter provideSample:v32];
  if (qword_1024195B0 != -1) {
    dispatch_once(&qword_1024195B0, &stru_1022C7640);
  }
  v34 = qword_1024195B8;
  if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - Odometer sample sent to SensorKit", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024195B0 != -1) {
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
    }
    v38 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor onOdometerNotification:data:]", "%s\n", v38);
    if (v38 != (char *)buf) {
      free(v38);
    }
  }
  p_previousOdometerEntry->double startTime = v16;
  self->_previousOdometerEntry.distance = v17;
  self->_previousOdometerEntry.accuracy = v18;
  self->_previousOdometerEntry.gpsAltitude = v45;
  self->_previousOdometerEntry.speed = v46;
  self->_previousOdometerEntry.rawSpeed = v19;
  self->_previousOdometerEntry.odometer = v44;
  self->_previousOdometerEntry.gpsSpeedAccuracy = v20;
  self->_previousOdometerEntry.timestampGps = v21;
  self->_previousOdometerEntry.machContinuousTime = v53;
  self->_previousOdometerEntry.quality = v54;
  self->_previousOdometerEntry.originDevice = v43;
  *(void *)&self->_previousOdometerEntry.type = v42;
  self->_previousOdometerEntry.groundAltitude = v47;
  self->_previousOdometerEntry.groundAltitudeUncertainty = v23;
  *(_OWORD *)&self->_previousOdometerEntry.smoothedGPSAltitude = v51;
  *(_OWORD *)&self->_previousOdometerEntry.gpsCourseRadians = v52;
  self->_previousOdometerEntry.slope = v24;
  self->_previousOdometerEntry.maxAbsSlope = v48;
  *(_OWORD *)&self->_previousOdometerEntry.batchedLocationFixType = v49;
  self->_previousOdometerEntry.trackProximityInfo = v50;
}

- (void)onCatherineNotification:(int)a3 data:(NotificationData *)a4
{
  [CLSensorMonitor universe:self silo];
  if (a3 == 10)
  {
    id v7 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:*((double *)a4 + 5)];
    if (qword_1024195B0 != -1) {
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
    }
    uint64_t v8 = qword_1024195B8;
    if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *((void *)a4 + 1);
      uint64_t v10 = *((void *)a4 + 2);
      int v11 = *((unsigned __int8 *)a4 + 24);
      int v12 = *(_DWORD *)a4;
      uint64_t v14 = *((void *)a4 + 4);
      uint64_t v13 = *((void *)a4 + 5);
      int v15 = *((_DWORD *)a4 + 14);
      *(_DWORD *)buf = 134351105;
      uint64_t v22 = v13;
      __int16 v23 = 2049;
      uint64_t v24 = v9;
      __int16 v25 = 2049;
      uint64_t v26 = v10;
      __int16 v27 = 1026;
      int v28 = v11;
      __int16 v29 = 1026;
      int v30 = v12;
      __int16 v31 = 2050;
      uint64_t v32 = v14;
      __int16 v33 = 1026;
      int v34 = v15;
      __int16 v35 = 1026;
      BOOL v36 = v15 == 5;
      __int16 v37 = 2050;
      uint64_t v38 = 0x3FF0000000000000;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - HeartRate values,startTime,%{public}.8f,catherine,%{private}.0f,confidence,%{private}.0f,error,%{public}d,dataSource,%{public}d,timestamp,%{public}.8f,context,%{public}d,convertedMode,%{public}d,frequency,%{public}f", buf, 0x4Cu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195B0 != -1) {
        dispatch_once(&qword_1024195B0, &stru_1022C7640);
      }
      double v19 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor onCatherineNotification:data:]", "%s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
    if (*((double *)a4 + 2) >= 0.4 && *(_DWORD *)a4 == 3)
    {
      id v16 = [objc_alloc((Class)CMHeartRateData) initWithHeartRate:v7 confidence:*((unsigned __int8 *)a4 + 24) timestamp:3 startDate:*((_DWORD *)a4 + 14) == 5 error:*((double *)a4 + 1) dataSource:*((double *)a4 + 2) mode:*((double *)a4 + 4)];
      [v16 setFrequency:1.0];
      id v17 = [objc_alloc((Class)CMHighFrequencyHeartRateData) initWithHeartRateData:v16];
      if (v17)
      {
        [(SRSensorWriter *)self->_heartRateWriter provideSample:v17];
        if (qword_1024195B0 != -1) {
          dispatch_once(&qword_1024195B0, &stru_1022C7640);
        }
        double v18 = qword_1024195B8;
        if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - Heart rate sample sent to SensorKit", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024195B0 != -1) {
            dispatch_once(&qword_1024195B0, &stru_1022C7640);
          }
          double v20 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor onCatherineNotification:data:]", "%s\n", v20);
          if (v20 != (char *)buf) {
            free(v20);
          }
        }
      }
    }
  }
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [self universe:a3, a4, a5, a6, a7].silo;
  if (*a3 == 4)
  {
    id v10 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:*(double *)a4];
    if (qword_1024195B0 != -1) {
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
    }
    int v11 = qword_1024195B8;
    if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *(void *)a4;
      uint64_t v13 = *((void *)a4 + 1);
      uint64_t v14 = *((void *)a4 + 2);
      uint64_t v15 = *((void *)a4 + 3);
      uint64_t v16 = *((void *)a4 + 4);
      uint64_t v17 = *((void *)a4 + 5);
      uint64_t v18 = *((void *)a4 + 6);
      *(_DWORD *)buf = 134350593;
      uint64_t v24 = v12;
      __int16 v25 = 2049;
      uint64_t v26 = v13;
      __int16 v27 = 2049;
      uint64_t v28 = v14;
      __int16 v29 = 2050;
      uint64_t v30 = v15;
      __int16 v31 = 2050;
      uint64_t v32 = v16;
      __int16 v33 = 2049;
      uint64_t v34 = v17;
      __int16 v35 = 2049;
      uint64_t v36 = v18;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - PhysicalActivityEvent values,startTime,%{public}.8f,eventType,%{private}ld,action,%{private}ld,reason,%{public}ld,workoutType,%{public}ld,recoveryStart,%{private}.8f,recoveryEnd,%{private}.8f", buf, 0x48u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195B0 != -1) {
        dispatch_once(&qword_1024195B0, &stru_1022C7640);
      }
      double v21 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor onMotionStateMediatorNotification:data:]", "%s\n", v21);
      if (v21 != (char *)buf) {
        free(v21);
      }
    }
    id v19 = [objc_alloc((Class)CMActivityEventData) initWithStartDate:v10 eventType:*((void *)a4 + 1) action:*((void *)a4 + 2) reason:*((void *)a4 + 3) workoutType:*((void *)a4 + 4)];
    [v19 setHeartRateRecoveryStartTime:*((double *)a4 + 5)];
    [v19 setHeartRateRecoveryEndTime:*((double *)a4 + 6)];
    [(SRSensorWriter *)self->_physicalActivityEventWriter provideSample:v19];
    if (qword_1024195B0 != -1) {
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
    }
    double v20 = qword_1024195B8;
    if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - Physical Activity Event sample sent to SensorKit", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195B0 != -1) {
        dispatch_once(&qword_1024195B0, &stru_1022C7640);
      }
      uint64_t v22 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor onMotionStateMediatorNotification:data:]", "%s\n", v22);
      if (v22 != (char *)buf) {
        free(v22);
      }
    }
  }
}

- (void)onDaemonStatusNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [CLSensorMonitor universe:self universe:a3 universe:a4 silo];
  if (*a3 == 17 || *a3 == 11)
  {
    value = self->_daemonStatusClient.__ptr_.__value_;
    if (value)
    {
      [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:11];
      [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:17];
      uint64_t v8 = self->_daemonStatusClient.__ptr_.__value_;
      self->_daemonStatusClient.__ptr_.__value_ = 0;
      if (v8) {
        (*(void (**)(Client *))(*(void *)v8 + 8))(v8);
      }
      if (qword_1024195B0 != -1) {
        dispatch_once(&qword_1024195B0, &stru_1022C7640);
      }
      uint64_t v9 = qword_1024195B8;
      if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = *a3;
        *(_DWORD *)buf = 67109120;
        int v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received %d notification from daemon status", buf, 8u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024195B0 != -1) {
          dispatch_once(&qword_1024195B0, &stru_1022C7640);
        }
        int v11 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor onDaemonStatusNotification:data:]", "%s\n", v11);
        if (v11 != (char *)buf) {
          free(v11);
        }
      }
      [(CLSensorMonitor *)self scheduleAppUninstallationCheck];
    }
  }
}

- (Class)classForSensorIdentifier:(id)a3
{
  if (([a3 isEqualToString:off_10241D7B0()] & 1) == 0
    && ([a3 isEqualToString:off_10241D7B8()] & 1) == 0
    && ([a3 isEqualToString:off_10241D7C0()] & 1) == 0
    && ([a3 isEqualToString:off_10241D7C8()] & 1) == 0
    && ([a3 isEqualToString:off_10241D7D0()] & 1) == 0
    && ([a3 isEqualToString:off_10241D7D8()] & 1) == 0
    && ![a3 isEqualToString:off_10241D7E0()])
  {
    return 0;
  }

  return (Class)objc_opt_class();
}

- (void)sensorWriterWillStartMonitoring:(id)a3
{
  if (self->_pedometerWriter == a3 && self->_stepCountClient.__ptr_.__value_)
  {
    if (qword_1024195B0 != -1) {
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
    }
    id v6 = qword_1024195B8;
    if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "sensorWriterWillStartMonitoring: starts pedometerWriter", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195B0 != -1) {
        dispatch_once(&qword_1024195B0, &stru_1022C7640);
      }
      __int16 v23 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterWillStartMonitoring:]", "%s\n", v23);
      if (v23 != (char *)buf) {
        free(v23);
      }
    }
    value = self->_stepCountClient.__ptr_.__value_;
    uint64_t v9 = *((void *)value + 1);
    uint64_t v8 = (void *)*((void *)value + 2);
    uint64_t v10 = 0;
    goto LABEL_66;
  }
  if (self->_odometerSuitabilityWriter == a3 && self->_stepCountClient.__ptr_.__value_)
  {
    if (qword_1024195B0 != -1) {
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
    }
    int v11 = qword_1024195B8;
    if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "sensorWriterWillStartMonitoring: starts odometerSuitabilityWriter", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195B0 != -1) {
        dispatch_once(&qword_1024195B0, &stru_1022C7640);
      }
      __int16 v25 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterWillStartMonitoring:]", "%s\n", v25);
      if (v25 != (char *)buf) {
        free(v25);
      }
    }
    uint64_t v12 = self->_stepCountClient.__ptr_.__value_;
    uint64_t v9 = *((void *)v12 + 1);
    uint64_t v8 = (void *)*((void *)v12 + 2);
    uint64_t v10 = 3;
    goto LABEL_66;
  }
  if (self->_fallStatsWriter == a3)
  {
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_1022C7680);
    }
    int v13 = qword_1024190F8;
    if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "sensorWriterWillStartMonitoring: starts fallStatsWriter", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_1022C7680);
      }
      uint64_t v24 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterWillStartMonitoring:]", "%s\n", v24);
      if (v24 != (char *)buf) {
        free(v24);
      }
    }
    uint64_t v14 = self->_fallClient.__ptr_.__value_;
    uint64_t v9 = *((void *)v14 + 1);
    uint64_t v8 = (void *)*((void *)v14 + 2);
    uint64_t v10 = 2;
    goto LABEL_66;
  }
  if (self->_elevationWriter == a3 && self->_odometerClient.__ptr_.__value_)
  {
    if (qword_1024195B0 != -1) {
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
    }
    uint64_t v15 = qword_1024195B8;
    if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "sensorWriterWillStartMonitoring: starts elevationWriter", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195B0 != -1) {
        dispatch_once(&qword_1024195B0, &stru_1022C7640);
      }
      uint64_t v26 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterWillStartMonitoring:]", "%s\n", v26);
      if (v26 != (char *)buf) {
        free(v26);
      }
    }
    uint64_t v16 = self->_odometerClient.__ptr_.__value_;
    uint64_t v9 = *((void *)v16 + 1);
    uint64_t v8 = (void *)*((void *)v16 + 2);
    uint64_t v10 = 7;
    goto LABEL_66;
  }
  if (self->_odometerWriter == a3)
  {
    uint64_t v17 = 24;
    if (self->_odometerClient.__ptr_.__value_)
    {
      if (qword_1024195B0 != -1) {
        dispatch_once(&qword_1024195B0, &stru_1022C7640);
      }
      uint64_t v18 = qword_1024195B8;
      if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "sensorWriterWillStartMonitoring: starts odometerWriter", buf, 2u);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_65;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1024195B0 == -1)
      {
LABEL_89:
        uint64_t v28 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterWillStartMonitoring:]", "%s\n", v28);
        if (v28 != (char *)buf) {
          free(v28);
        }
LABEL_65:
        uint64_t v22 = *(void *)&self->CLIntersiloService_opaque[v17];
        uint64_t v9 = *(void *)(v22 + 8);
        uint64_t v8 = *(void **)(v22 + 16);
        uint64_t v10 = 4;
LABEL_66:
        [v8 register:v9 forNotification:v10 registrationInfo:0];
        return;
      }
LABEL_91:
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
      goto LABEL_89;
    }
  }
  if (self->_heartRateWriter == a3 && self->_heartRateClient.__ptr_.__value_)
  {
    if (qword_1024195B0 != -1) {
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
    }
    id v19 = qword_1024195B8;
    if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "sensorWriterWillStartMonitoring: starts heartRateWriter", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195B0 != -1) {
        dispatch_once(&qword_1024195B0, &stru_1022C7640);
      }
      __int16 v27 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterWillStartMonitoring:]", "%s\n", v27);
      if (v27 != (char *)buf) {
        free(v27);
      }
    }
    double v20 = self->_heartRateClient.__ptr_.__value_;
    uint64_t v9 = *((void *)v20 + 1);
    uint64_t v8 = (void *)*((void *)v20 + 2);
    uint64_t v10 = 10;
    goto LABEL_66;
  }
  if (self->_physicalActivityEventWriter == a3)
  {
    uint64_t v17 = 40;
    if (self->_motionStateMediatorClient.__ptr_.__value_)
    {
      if (qword_1024195B0 != -1) {
        dispatch_once(&qword_1024195B0, &stru_1022C7640);
      }
      double v21 = qword_1024195B8;
      if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "sensorWriterWillStartMonitoring: starts physicalActivityEventWriter", buf, 2u);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_65;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1024195B0 == -1) {
        goto LABEL_89;
      }
      goto LABEL_91;
    }
  }
  if (qword_1024195B0 != -1) {
    dispatch_once(&qword_1024195B0, &stru_1022C7640);
  }
  xpc_object_t v4 = qword_1024195B8;
  if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "sensorWriterWillStartMonitoring - Unexpected writer", buf, 2u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024195B0 != -1) {
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
    }
    id v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLSensorMonitor sensorWriterWillStartMonitoring:]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
}

- (void)sensorWriterDidStopMonitoring:(id)a3
{
  if (self->_pedometerWriter == a3 && self->_stepCountClient.__ptr_.__value_)
  {
    if (qword_1024195B0 != -1) {
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
    }
    id v6 = qword_1024195B8;
    if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "sensorWriterDidStopMonitoring: stops pedometerWriter", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195B0 != -1) {
        dispatch_once(&qword_1024195B0, &stru_1022C7640);
      }
      __int16 v23 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterDidStopMonitoring:]", "%s\n", v23);
      if (v23 != (char *)buf) {
        free(v23);
      }
    }
    value = self->_stepCountClient.__ptr_.__value_;
    uint64_t v9 = *((void *)value + 1);
    uint64_t v8 = (void *)*((void *)value + 2);
    uint64_t v10 = 0;
    goto LABEL_66;
  }
  if (self->_odometerSuitabilityWriter == a3 && self->_stepCountClient.__ptr_.__value_)
  {
    if (qword_1024195B0 != -1) {
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
    }
    int v11 = qword_1024195B8;
    if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "sensorWriterDidStopMonitoring: stops odometerSuitabilityWriter", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195B0 != -1) {
        dispatch_once(&qword_1024195B0, &stru_1022C7640);
      }
      __int16 v25 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterDidStopMonitoring:]", "%s\n", v25);
      if (v25 != (char *)buf) {
        free(v25);
      }
    }
    uint64_t v12 = self->_stepCountClient.__ptr_.__value_;
    uint64_t v9 = *((void *)v12 + 1);
    uint64_t v8 = (void *)*((void *)v12 + 2);
    uint64_t v10 = 3;
    goto LABEL_66;
  }
  if (self->_fallStatsWriter == a3)
  {
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_1022C7680);
    }
    int v13 = qword_1024190F8;
    if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "sensorWriterDidStopMonitoring: stops fallStatsWriter", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_1022C7680);
      }
      uint64_t v24 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterDidStopMonitoring:]", "%s\n", v24);
      if (v24 != (char *)buf) {
        free(v24);
      }
    }
    uint64_t v14 = self->_fallClient.__ptr_.__value_;
    uint64_t v9 = *((void *)v14 + 1);
    uint64_t v8 = (void *)*((void *)v14 + 2);
    uint64_t v10 = 2;
    goto LABEL_66;
  }
  if (self->_elevationWriter == a3 && self->_odometerClient.__ptr_.__value_)
  {
    if (qword_1024195B0 != -1) {
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
    }
    uint64_t v15 = qword_1024195B8;
    if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "sensorWriterDidStopMonitoring: stops elevationWriter", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195B0 != -1) {
        dispatch_once(&qword_1024195B0, &stru_1022C7640);
      }
      uint64_t v26 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterDidStopMonitoring:]", "%s\n", v26);
      if (v26 != (char *)buf) {
        free(v26);
      }
    }
    uint64_t v16 = self->_odometerClient.__ptr_.__value_;
    uint64_t v9 = *((void *)v16 + 1);
    uint64_t v8 = (void *)*((void *)v16 + 2);
    uint64_t v10 = 7;
    goto LABEL_66;
  }
  if (self->_odometerWriter == a3)
  {
    uint64_t v17 = 24;
    if (self->_odometerClient.__ptr_.__value_)
    {
      if (qword_1024195B0 != -1) {
        dispatch_once(&qword_1024195B0, &stru_1022C7640);
      }
      uint64_t v18 = qword_1024195B8;
      if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "sensorWriterDidStopMonitoring: stops odometerWriter", buf, 2u);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_65;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1024195B0 == -1)
      {
LABEL_89:
        uint64_t v28 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterDidStopMonitoring:]", "%s\n", v28);
        if (v28 != (char *)buf) {
          free(v28);
        }
LABEL_65:
        uint64_t v22 = *(void *)&self->CLIntersiloService_opaque[v17];
        uint64_t v9 = *(void *)(v22 + 8);
        uint64_t v8 = *(void **)(v22 + 16);
        uint64_t v10 = 4;
LABEL_66:
        [v8 unregister:v9 forNotification:v10];
        return;
      }
LABEL_91:
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
      goto LABEL_89;
    }
  }
  if (self->_heartRateWriter == a3 && self->_heartRateClient.__ptr_.__value_)
  {
    if (qword_1024195B0 != -1) {
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
    }
    id v19 = qword_1024195B8;
    if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "sensorWriterDidStopMonitoring: stops heartRateWriter", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195B0 != -1) {
        dispatch_once(&qword_1024195B0, &stru_1022C7640);
      }
      __int16 v27 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterDidStopMonitoring:]", "%s\n", v27);
      if (v27 != (char *)buf) {
        free(v27);
      }
    }
    double v20 = self->_heartRateClient.__ptr_.__value_;
    uint64_t v9 = *((void *)v20 + 1);
    uint64_t v8 = (void *)*((void *)v20 + 2);
    uint64_t v10 = 10;
    goto LABEL_66;
  }
  if (self->_physicalActivityEventWriter == a3)
  {
    uint64_t v17 = 40;
    if (self->_motionStateMediatorClient.__ptr_.__value_)
    {
      if (qword_1024195B0 != -1) {
        dispatch_once(&qword_1024195B0, &stru_1022C7640);
      }
      double v21 = qword_1024195B8;
      if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "sensorWriterDidStopMonitoring: stops physicalActivityEventWriter", buf, 2u);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_65;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1024195B0 == -1) {
        goto LABEL_89;
      }
      goto LABEL_91;
    }
  }
  if (qword_1024195B0 != -1) {
    dispatch_once(&qword_1024195B0, &stru_1022C7640);
  }
  xpc_object_t v4 = qword_1024195B8;
  if (os_log_type_enabled((os_log_t)qword_1024195B8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "sensorWriterWillStartMonitoring - Unexpected writer", buf, 2u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024195B0 != -1) {
      dispatch_once(&qword_1024195B0, &stru_1022C7640);
    }
    id v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLSensorMonitor sensorWriterDidStopMonitoring:]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
}

- (void)sensorWriter:(id)a3 didReceiveUpdateToConfigurationRequests:(id)a4
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [a4 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(a4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v8);
        uint64_t v10 = sub_100F8CC8C();
        int v11 = sub_100F8E384(v10, v9);
        if (v11 != 100)
        {
          int v12 = v11;
          if (qword_102419280 != -1) {
            dispatch_once(&qword_102419280, &stru_1022C7660);
          }
          int v13 = qword_102419288;
          if (os_log_type_enabled((os_log_t)qword_102419288, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67240192;
            int v23 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Dynamic Config] Error on config insertion: %{public}d", buf, 8u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419280 != -1) {
              dispatch_once(&qword_102419280, &stru_1022C7660);
            }
            int v20 = 67240192;
            int v21 = v12;
            uint64_t v14 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriter:didReceiveUpdateToConfigurationRequests:]", "%s\n", v14);
            if (v14 != (char *)buf) {
              free(v14);
            }
          }
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v15 = [a4 countByEnumeratingWithState:&v16 objects:v24 count:16];
      id v6 = v15;
    }
    while (v15);
  }
}

- (void).cxx_destruct
{
  value = self->_daemonStatusClient.__ptr_.__value_;
  self->_daemonStatusClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  xpc_object_t v4 = self->_motionStateMediatorClient.__ptr_.__value_;
  self->_motionStateMediatorClient.__ptr_.__value_ = 0;
  if (v4) {
    (*(void (**)(Client *, SEL))(*(void *)v4 + 8))(v4, a2);
  }
  id v5 = self->_heartRateClient.__ptr_.__value_;
  self->_heartRateClient.__ptr_.__value_ = 0;
  if (v5) {
    (*(void (**)(Client *, SEL))(*(void *)v5 + 8))(v5, a2);
  }
  id v6 = self->_odometerClient.__ptr_.__value_;
  self->_odometerClient.__ptr_.__value_ = 0;
  if (v6) {
    (*(void (**)(Client *, SEL))(*(void *)v6 + 8))(v6, a2);
  }
  uint64_t v7 = self->_fallClient.__ptr_.__value_;
  self->_fallClient.__ptr_.__value_ = 0;
  if (v7) {
    (*(void (**)(Client *, SEL))(*(void *)v7 + 8))(v7, a2);
  }
  uint64_t v8 = self->_stepCountClient.__ptr_.__value_;
  self->_stepCountClient.__ptr_.__value_ = 0;
  if (v8)
  {
    uint64_t v9 = *(void (**)(void))(*(void *)v8 + 8);
    v9();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 30) = 0;
  return self;
}

@end