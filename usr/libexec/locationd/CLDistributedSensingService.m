@interface CLDistributedSensingService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLDistributedSensingService)init;
- (id).cxx_construct;
- (void)beginService;
- (void)dealloc;
- (void)dsmotion:(id)a3 didFailToStartListenerWithError:(id)a4;
- (void)dsmotion:(id)a3 didFailToStartProviderWithError:(id)a4;
- (void)dsmotion:(id)a3 didReceiveMotionData:(id)a4 fromProvider:(id)a5;
- (void)dsmotion:(id)a3 didRequestMotionDataWithOptions:(id)a4;
- (void)dsmotion:(id)a3 didSubscribeToMotionDataWithOptions:(id)a4;
- (void)dsmotionDidExpireMotionDataSubscription:(id)a3;
- (void)dsmotionDidStartListener:(id)a3;
- (void)dsmotionDidStartProvider:(id)a3;
- (void)dsmotionDidUnsubscribeToMotionData:(id)a3;
- (void)endService;
- (void)listenerBeginService;
- (void)listenerDealloc;
- (void)listenerEndService;
- (void)listenerInit;
- (void)listenerOnWifiServiceNotification:(int)a3 data:(id)a4;
- (void)listenerVehicleStateUpdate:(id)a3;
- (void)providerBeginService;
- (void)providerDealloc;
- (void)providerEndService;
- (void)providerFitnessTrackingNotification:(BOOL)a3;
- (void)providerInit;
- (void)providerOnVehicleStateNotification:(VehicleStateData *)a3;
- (void)providerQueryMotionDataType:(unsigned int)a3;
- (void)providerSubscribeToMotionDataType:(unsigned int)a3;
- (void)providerUnsubscribeToMotionDataType:(unsigned int)a3;
- (void)registerClient:(id)a3 forNotification:(int)a4;
- (void)sendVehicleState;
- (void)toggleProactiveVehicleDetection:(BOOL)a3;
- (void)toggleVehicleStateListener:(BOOL)a3;
- (void)toggleVehicleStateProvider:(BOOL)a3;
- (void)unregisterClient:(id)a3 forNotification:(int)a4;
@end

@implementation CLDistributedSensingService

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
  if (qword_10247ACD8 != -1) {
    dispatch_once(&qword_10247ACD8, &stru_1022B5968);
  }
  return (id)qword_10247ACD0;
}

+ (BOOL)isSupported
{
  sub_100103240();
  if (sub_10016CCBC()) {
    return 1;
  }
  sub_100103240();
  if (sub_1001B7C64()) {
    return 1;
  }
  sub_100103240();

  return sub_1000F08D4();
}

- (CLDistributedSensingService)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLDistributedSensingService;
  v2 = [(CLDistributedSensingService *)&v4 initWithInboundProtocol:&OBJC_PROTOCOL___CLDistributedSensingServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLDistributedSensingServiceClientProtocol];
  [(CLDistributedSensingService *)v2 listenerInit];
  [(CLDistributedSensingService *)v2 providerInit];
  return v2;
}

- (void)dealloc
{
  [(CLDistributedSensingService *)self listenerDealloc];
  [(CLDistributedSensingService *)self providerDealloc];
  v3.receiver = self;
  v3.super_class = (Class)CLDistributedSensingService;
  [(CLDistributedSensingService *)&v3 dealloc];
}

- (void)beginService
{
  [(CLDistributedSensingService *)self listenerBeginService];

  [(CLDistributedSensingService *)self providerBeginService];
}

- (void)endService
{
  [(CLDistributedSensingService *)self listenerEndService];

  [(CLDistributedSensingService *)self providerEndService];
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void *)&self->_proactiveVehicleDetectionEnabled;
  *(void *)&self->_proactiveVehicleDetectionEnabled = 0;
  if (v3) {
    (*(void (**)(uint64_t, SEL))(*(void *)v3 + 8))(v3, a2);
  }
  vehicleStateProvider = self->_vehicleStateProvider;
  self->_vehicleStateProvider = 0;
  if (vehicleStateProvider) {
    (*(void (**)(DSMotionProvider *, SEL))(*(void *)vehicleStateProvider + 8))(vehicleStateProvider, a2);
  }
  uint64_t v5 = *(void *)&self->_mostRecentVehicleState.state;
  *(void *)&self->_mostRecentVehicleState.state = 0;
  if (v5)
  {
    v6 = *(void (**)(void))(*(void *)v5 + 8);
    v6();
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 13) = 0;
  return self;
}

- (void)toggleProactiveVehicleDetection:(BOOL)a3
{
  if (LOBYTE(self->_proactiveVehicleDetectionTimer))
  {
    if (a3)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      double v19 = Current;
      double v18 = 1.79769313e308;
      uint64_t v5 = sub_1000A6958();
      sub_1000A6A10(v5, @"DistributedSensingProactiveVehicleStateSubscriptionTimestamp", &v18);
      if (vabdd_f64(Current, v18) <= *(double *)&self->_vehicleStateClient.__ptr_.__value_)
      {
        if (qword_102419240 != -1) {
          dispatch_once(&qword_102419240, &stru_1022B6F58);
        }
        v15 = qword_102419248;
        if (os_log_type_enabled((os_log_t)qword_102419248, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134283777;
          *(double *)v25 = Current;
          *(_WORD *)&v25[8] = 2049;
          *(double *)&v25[10] = v18;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Provider, Too frequent proactive vehicle detection request, declined, %{private}.3f, %{private}.3f", buf, 0x16u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419240 != -1) {
            dispatch_once(&qword_102419240, &stru_1022B6F58);
          }
          int v20 = 134283777;
          double v21 = Current;
          __int16 v22 = 2049;
          double v23 = v18;
          goto LABEL_42;
        }
      }
      else
      {
        uint64_t v6 = sub_1000A6958();
        sub_100163398(v6, @"DistributedSensingProactiveVehicleStateSubscriptionTimestamp", &v19);
        uint64_t v7 = *(void *)sub_1000A6958();
        (*(void (**)(void))(v7 + 944))();
        double timeBetweenProactiveVehicleDetection = self->_timeBetweenProactiveVehicleDetection;
        if (timeBetweenProactiveVehicleDetection == 0.0)
        {
          id v9 = [[-[CLDistributedSensingService silo](self, "silo") newTimer];
          *(void *)&self->_double timeBetweenProactiveVehicleDetection = v9;
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_1004DE9BC;
          v17[3] = &unk_10229FED8;
          v17[4] = self;
          [v9 setHandler:v17];
          double timeBetweenProactiveVehicleDetection = self->_timeBetweenProactiveVehicleDetection;
        }
        [*(id *)&timeBetweenProactiveVehicleDetection nextFireDelay];
        if (v10 == 1.79769313e308)
        {
          sub_101A1F180(buf, "ProactiveVehicleDetectionDurationSeconds", &qword_101D21A88, 0);
          [*(id *)&self->_timeBetweenProactiveVehicleDetection setNextFireDelay:*(double *)&v25[4]];
          [*((id *)self->_vehicleStateProvider + 2) register:*((void *)self->_vehicleStateProvider + 1) forNotification:0 registrationInfo:0];
          if (qword_102419240 != -1) {
            dispatch_once(&qword_102419240, &stru_1022B6F58);
          }
          v11 = qword_102419248;
          if (os_log_type_enabled((os_log_t)qword_102419248, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Provider, Starting proactive vehicle detection", buf, 2u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419240 != -1) {
              dispatch_once(&qword_102419240, &stru_1022B6F58);
            }
            LOWORD(v20) = 0;
LABEL_42:
            v16 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDistributedSensingService(Provider) toggleProactiveVehicleDetection:]", "%s\n", v16);
            if (v16 != (char *)buf) {
              free(v16);
            }
          }
        }
      }
    }
    else
    {
      [*((id *)self->_vehicleStateProvider + 2) unregister:*((void *)self->_vehicleStateProvider + 1) forNotification:0];
      double v13 = self->_timeBetweenProactiveVehicleDetection;
      if (v13 != 0.0) {
        [*(id *)&v13 setNextFireDelay:1.79769313e308];
      }
      if (qword_102419240 != -1) {
        dispatch_once(&qword_102419240, &stru_1022B6F58);
      }
      v14 = qword_102419248;
      if (os_log_type_enabled((os_log_t)qword_102419248, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Provider, Stopping proactive vehicle detection", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419240 != -1) {
          dispatch_once(&qword_102419240, &stru_1022B6F58);
        }
        LOWORD(v20) = 0;
        goto LABEL_42;
      }
    }
  }
  else
  {
    if (qword_102419240 != -1) {
      dispatch_once(&qword_102419240, &stru_1022B6F58);
    }
    v12 = qword_102419248;
    if (os_log_type_enabled((os_log_t)qword_102419248, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Proactive vehicle detection is DISABLED", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419240 != -1) {
        dispatch_once(&qword_102419240, &stru_1022B6F58);
      }
      LOWORD(v20) = 0;
      goto LABEL_42;
    }
  }
}

- (void)sendVehicleState
{
  uint64_t v3 = +[NSData dataWithBytes:&self->_mostRecentVehicleState length:16];
  objc_super v4 = *(void **)&self->_isConnectedToStationaryWifi;

  _[v4 sendMotionData:v3];
}

- (void)toggleVehicleStateProvider:(BOOL)a3
{
  objc_super v4 = *(void **)&self->_isConnectedToStationaryWifi;
  if (v4)
  {
    if (a3)
    {
      id v5 = (id)objc_opt_new();
      [v5 setDeviceType:1];
      [v5 setDataSubType:1];
      uint64_t v6 = *(void **)&self->_isConnectedToStationaryWifi;
      _[v6 startMotionDataProviderWithOptions:v5];
    }
    else
    {
      [v4 stopMotionDataProvider];
    }
  }
}

- (void)dsmotionDidStartProvider:(id)a3
{
  if (qword_102419240 != -1) {
    dispatch_once(&qword_102419240, &stru_1022B6F58);
  }
  uint64_t v3 = qword_102419248;
  if (os_log_type_enabled((os_log_t)qword_102419248, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Provider, started", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419240 != -1) {
      dispatch_once(&qword_102419240, &stru_1022B6F58);
    }
    objc_super v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDistributedSensingService(Provider) dsmotionDidStartProvider:]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

- (void)dsmotion:(id)a3 didFailToStartProviderWithError:(id)a4
{
  if (qword_102419240 != -1) {
    dispatch_once(&qword_102419240, &stru_1022B6F58);
  }
  id v5 = qword_102419248;
  if (os_log_type_enabled((os_log_t)qword_102419248, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Provider, failed to start with error, %@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419240 != -1) {
      dispatch_once(&qword_102419240, &stru_1022B6F58);
    }
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLDistributedSensingService(Provider) dsmotion:didFailToStartProviderWithError:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

- (void)dsmotionDidExpireMotionDataSubscription:(id)a3
{
  if (qword_102419240 != -1) {
    dispatch_once(&qword_102419240, &stru_1022B6F58);
  }
  objc_super v4 = qword_102419248;
  if (os_log_type_enabled((os_log_t)qword_102419248, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Provider, subscription expired", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419240 != -1) {
      dispatch_once(&qword_102419240, &stru_1022B6F58);
    }
    id v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDistributedSensingService(Provider) dsmotionDidExpireMotionDataSubscription:]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  [objc_msgSend(-[CLDistributedSensingService vendor](self, "vendor"), "proxyForService:", @"CLDistributedSensingService") providerUnsubscribeToMotionDataType:1];
}

- (void)dsmotionDidUnsubscribeToMotionData:(id)a3
{
  if (qword_102419240 != -1) {
    dispatch_once(&qword_102419240, &stru_1022B6F58);
  }
  objc_super v4 = qword_102419248;
  if (os_log_type_enabled((os_log_t)qword_102419248, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Provider, un-subscribed", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419240 != -1) {
      dispatch_once(&qword_102419240, &stru_1022B6F58);
    }
    id v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDistributedSensingService(Provider) dsmotionDidUnsubscribeToMotionData:]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  [objc_msgSend(-[CLDistributedSensingService vendor](self, "vendor"), "proxyForService:", @"CLDistributedSensingService") providerUnsubscribeToMotionDataType:1];
}

- (void)dsmotion:(id)a3 didSubscribeToMotionDataWithOptions:(id)a4
{
  if (qword_102419240 != -1) {
    dispatch_once(&qword_102419240, &stru_1022B6F58);
  }
  uint64_t v6 = qword_102419248;
  if (os_log_type_enabled((os_log_t)qword_102419248, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67174913;
    unsigned int v9 = [a4 deviceType];
    __int16 v10 = 1025;
    unsigned int v11 = [a4 dataSubType];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Provider, subscribed with options, %{private}u, %{private}u", buf, 0xEu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419240 != -1) {
      dispatch_once(&qword_102419240, &stru_1022B6F58);
    }
    [a4 deviceType];
    [a4 dataSubType];
    uint64_t v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDistributedSensingService(Provider) dsmotion:didSubscribeToMotionDataWithOptions:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  [objc_msgSend(-[CLDistributedSensingService vendor](self, "vendor"), "proxyForService:", @"CLDistributedSensingService") providerSubscribeToMotionDataType:[a4 dataSubType]];
}

- (void)dsmotion:(id)a3 didRequestMotionDataWithOptions:(id)a4
{
  if (qword_102419240 != -1) {
    dispatch_once(&qword_102419240, &stru_1022B6F58);
  }
  uint64_t v6 = qword_102419248;
  if (os_log_type_enabled((os_log_t)qword_102419248, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67174913;
    unsigned int v9 = [a4 deviceType];
    __int16 v10 = 1025;
    unsigned int v11 = [a4 dataSubType];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Provider, queried with options, %{private}u, %{private}u", buf, 0xEu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419240 != -1) {
      dispatch_once(&qword_102419240, &stru_1022B6F58);
    }
    [a4 deviceType];
    [a4 dataSubType];
    uint64_t v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDistributedSensingService(Provider) dsmotion:didRequestMotionDataWithOptions:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  [objc_msgSend(-[CLDistributedSensingService vendor](self, "vendor"), "proxyForService:", @"CLDistributedSensingService") providerQueryMotionDataType:[a4 dataSubType]];
}

- (void)providerInit
{
  *(void *)&self->_isConnectedToStationaryWifi = 0;
  vehicleStateProvider = self->_vehicleStateProvider;
  self->_vehicleStateProvider = 0;
  if (vehicleStateProvider) {
    (*(void (**)(DSMotionProvider *, SEL))(*(void *)vehicleStateProvider + 8))(vehicleStateProvider, a2);
  }
  self->_mostRecentVehicleState.version = 0;
  *(void *)(&self->_mostRecentVehicleState.version + 1) = -1;
  *(_DWORD *)((char *)&self->_mostRecentVehicleState.timestamp + 1) = 0;
  BYTE5(self->_mostRecentVehicleState.timestamp) = 0;
  HIWORD(self->_mostRecentVehicleState.timestamp) = 0;
  self->_vehicleStateClient.__ptr_.__value_ = (Client *)0x7FEFFFFFFFFFFFFFLL;
  self->_double timeBetweenProactiveVehicleDetection = 0.0;
  LOBYTE(self->_proactiveVehicleDetectionTimer) = 0;
}

- (void)providerDealloc
{
  double timeBetweenProactiveVehicleDetection = self->_timeBetweenProactiveVehicleDetection;
  if (timeBetweenProactiveVehicleDetection != 0.0)
  {

    self->_double timeBetweenProactiveVehicleDetection = 0.0;
  }
  objc_super v4 = *(void **)&self->_isConnectedToStationaryWifi;
  if (v4)
  {

    *(void *)&self->_isConnectedToStationaryWifi = 0;
  }
}

- (void)providerBeginService
{
  if ((sub_1000A16E8() & 0x800000000) != 0)
  {
    *(void *)&self->_isConnectedToStationaryWifi = [objc_alloc((Class)DSMotionProvider) initWithDelegate:self queue:0];
    [(CLDistributedSensingService *)self toggleVehicleStateProvider:1];
    [(CLDistributedSensingService *)self universe];
    sub_1015429B4();
  }
}

- (void)providerEndService
{
  double timeBetweenProactiveVehicleDetection = self->_timeBetweenProactiveVehicleDetection;
  if (timeBetweenProactiveVehicleDetection != 0.0) {
    [*(id *)&timeBetweenProactiveVehicleDetection invalidate];
  }
  objc_super v4 = *(void **)&self->_isConnectedToStationaryWifi;
  if (v4) {
    [v4 stopMotionDataProvider];
  }
  vehicleStateProvider = self->_vehicleStateProvider;
  if (vehicleStateProvider)
  {
    self->_vehicleStateProvider = 0;
    uint64_t v6 = *(void (**)(void))(*(void *)vehicleStateProvider + 8);
    v6();
  }
}

- (void)providerSubscribeToMotionDataType:(unsigned int)a3
{
  if (a3)
  {
    [(CLDistributedSensingService *)self toggleProactiveVehicleDetection:1];
    [(CLDistributedSensingService *)self sendVehicleState];
  }
  else
  {
    if (qword_102419240 != -1) {
      dispatch_once(&qword_102419240, &stru_1022B6F58);
    }
    objc_super v4 = qword_102419248;
    if (os_log_type_enabled((os_log_t)qword_102419248, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67174657;
      unsigned int v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Provider, Unsupported subscription request for data type, %{private}u", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419240 != -1) {
        dispatch_once(&qword_102419240, &stru_1022B6F58);
      }
      uint64_t v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLDistributedSensingService(Provider) providerSubscribeToMotionDataType:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
}

- (void)providerUnsubscribeToMotionDataType:(unsigned int)a3
{
  if (a3)
  {
    [(CLDistributedSensingService *)self toggleProactiveVehicleDetection:0];
  }
  else
  {
    if (qword_102419240 != -1) {
      dispatch_once(&qword_102419240, &stru_1022B6F58);
    }
    objc_super v4 = qword_102419248;
    if (os_log_type_enabled((os_log_t)qword_102419248, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67174657;
      unsigned int v7 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Provider, Unsupported un-subscribe request for data type, %{private}u", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419240 != -1) {
        dispatch_once(&qword_102419240, &stru_1022B6F58);
      }
      id v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLDistributedSensingService(Provider) providerUnsubscribeToMotionDataType:]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
  }
}

- (void)providerQueryMotionDataType:(unsigned int)a3
{
  if (a3)
  {
    [(CLDistributedSensingService *)self sendVehicleState];
  }
  else
  {
    if (qword_102419240 != -1) {
      dispatch_once(&qword_102419240, &stru_1022B6F58);
    }
    objc_super v4 = qword_102419248;
    if (os_log_type_enabled((os_log_t)qword_102419248, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67174657;
      unsigned int v7 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Provider, Unsupported query for data type, %{private}u", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419240 != -1) {
        dispatch_once(&qword_102419240, &stru_1022B6F58);
      }
      id v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLDistributedSensingService(Provider) providerQueryMotionDataType:]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
  }
}

- (void)providerOnVehicleStateNotification:(VehicleStateData *)a3
{
  if (*(void *)&self->_isConnectedToStationaryWifi)
  {
    unint64_t var0 = a3->var0;
    unint64_t var1 = a3->var1;
    char v7 = (var1 & 0x12) != 0 ? 2 : (a3->var1 & 9) != 0;
    p_mostRecentVehicleState = &self->_mostRecentVehicleState;
    if (*(void *)(&self->_mostRecentVehicleState.version + 1) == -1
      || *(_DWORD *)((char *)&self->_mostRecentVehicleState.timestamp + 1) != (unsigned __int16)var0
      || HIWORD(self->_mostRecentVehicleState.timestamp) != (unsigned __int16)var1)
    {
      if (var0 == 2) {
        [(CLDistributedSensingService *)self toggleProactiveVehicleDetection:0];
      }
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      unint64_t v10 = a3->var0;
      unint64_t v11 = a3->var1;
      p_mostRecentVehicleState->version = 1;
      *(void *)(&p_mostRecentVehicleState->version + 1) = (unint64_t)Current;
      *(_DWORD *)((char *)&p_mostRecentVehicleState->timestamp + 1) = v10;
      BYTE5(p_mostRecentVehicleState->timestamp) = v7;
      HIWORD(p_mostRecentVehicleState->timestamp) = v11;
      [(CLDistributedSensingService *)self sendVehicleState];
      if (qword_102419240 != -1) {
        dispatch_once(&qword_102419240, &stru_1022B6F58);
      }
      v12 = qword_102419248;
      if (os_log_type_enabled((os_log_t)qword_102419248, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = *(_DWORD *)((char *)&p_mostRecentVehicleState->timestamp + 1);
        int timestamp_high = HIWORD(p_mostRecentVehicleState->timestamp);
        *(_DWORD *)buf = 67174913;
        int v17 = v13;
        __int16 v18 = 1025;
        int v19 = timestamp_high;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Provider, Vehicle State update, state, %{private}d, hints, 0x%{private}x", buf, 0xEu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419240 != -1) {
          dispatch_once(&qword_102419240, &stru_1022B6F58);
        }
        v15 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDistributedSensingService(Provider) providerOnVehicleStateNotification:]", "%s\n", v15);
        if (v15 != (char *)buf) {
          free(v15);
        }
      }
    }
  }
}

- (void)providerFitnessTrackingNotification:(BOOL)a3
{
  if (a3)
  {
    [(CLDistributedSensingService *)self toggleVehicleStateProvider:1];
    if (![*(id *)&self->_isConnectedToStationaryWifi isSubscriptionActive]) {
      return;
    }
    objc_super v4 = self;
    uint64_t v5 = 1;
  }
  else
  {
    [(CLDistributedSensingService *)self toggleVehicleStateProvider:0];
    objc_super v4 = self;
    uint64_t v5 = 0;
  }

  [(CLDistributedSensingService *)v4 toggleProactiveVehicleDetection:v5];
}

- (void)listenerInit
{
  self->_vehicleStateListener = 0;
  self->_vehicleStateListenerKeepAliveTimer = 0;
  LOBYTE(self->_wifiServiceClient.__ptr_.__value_) = 0;
  self->_mostRecentVehicleState.version = 0;
  *(void *)(&self->_mostRecentVehicleState.version + 1) = -1;
  *(_DWORD *)((char *)&self->_mostRecentVehicleState.timestamp + 1) = 0;
  BYTE5(self->_mostRecentVehicleState.timestamp) = 0;
  HIWORD(self->_mostRecentVehicleState.timestamp) = 0;
}

- (void)listenerDealloc
{
  vehicleStateListenerKeepAliveTimer = self->_vehicleStateListenerKeepAliveTimer;
  if (vehicleStateListenerKeepAliveTimer)
  {

    self->_vehicleStateListenerKeepAliveTimer = 0;
  }
  vehicleStateListener = self->_vehicleStateListener;
  if (vehicleStateListener)
  {

    self->_vehicleStateListener = 0;
  }
  uint64_t v5 = *(void *)&self->_mostRecentVehicleState.state;
  *(void *)&self->_mostRecentVehicleState.state = 0;
  if (v5)
  {
    uint64_t v6 = *(void (**)(void))(*(void *)v5 + 8);
    v6();
  }
}

- (void)listenerBeginService
{
  self->_clients[0] = (NSMutableSet *)objc_opt_new();
  [(CLDistributedSensingService *)self universe];
  sub_1001AE6FC();
}

- (void)listenerEndService
{
  vehicleStateListenerKeepAliveTimer = self->_vehicleStateListenerKeepAliveTimer;
  if (vehicleStateListenerKeepAliveTimer) {
    [(CLTimer *)vehicleStateListenerKeepAliveTimer invalidate];
  }
  vehicleStateListener = self->_vehicleStateListener;
  if (vehicleStateListener)
  {
    [(DSMotionListener *)vehicleStateListener stopMotionDataListener];
  }
}

- (void)dsmotionDidStartListener:(id)a3
{
  if (qword_102419240 != -1) {
    dispatch_once(&qword_102419240, &stru_1022D6DC0);
  }
  uint64_t v3 = qword_102419248;
  if (os_log_type_enabled((os_log_t)qword_102419248, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Listener, started", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419240 != -1) {
      dispatch_once(&qword_102419240, &stru_1022D6DC0);
    }
    objc_super v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDistributedSensingService(Listener) dsmotionDidStartListener:]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

- (void)dsmotion:(id)a3 didFailToStartListenerWithError:(id)a4
{
  if (qword_102419240 != -1) {
    dispatch_once(&qword_102419240, &stru_1022D6DC0);
  }
  uint64_t v5 = qword_102419248;
  if (os_log_type_enabled((os_log_t)qword_102419248, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Listener, failed to start with error, %@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419240 != -1) {
      dispatch_once(&qword_102419240, &stru_1022D6DC0);
    }
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLDistributedSensingService(Listener) dsmotion:didFailToStartListenerWithError:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

- (void)dsmotion:(id)a3 didReceiveMotionData:(id)a4 fromProvider:(id)a5
{
  id v6 = [[-[CLDistributedSensingService vendor](self, "vendor", a3, a4, a5) proxyForService:@"CLDistributedSensingService"];

  _[v6 listenerVehicleStateUpdate:a4];
}

- (void)toggleVehicleStateListener:(BOOL)a3
{
  if (!a3 || LOBYTE(self->_wifiServiceClient.__ptr_.__value_))
  {
    vehicleStateListener = self->_vehicleStateListener;
    if (vehicleStateListener)
    {
      [(DSMotionListener *)vehicleStateListener stopMotionDataListener];

      self->_vehicleStateListener = 0;
    }
    vehicleStateListenerKeepAliveTimer = self->_vehicleStateListenerKeepAliveTimer;
    if (vehicleStateListenerKeepAliveTimer) {
      [(CLTimer *)vehicleStateListenerKeepAliveTimer setNextFireDelay:1.79769313e308 interval:1.79769313e308];
    }
    self->_mostRecentVehicleState.version = 0;
    *(void *)(&self->_mostRecentVehicleState.version + 1) = -1;
    *(_DWORD *)((char *)&self->_mostRecentVehicleState.timestamp + 1) = 0;
    BYTE5(self->_mostRecentVehicleState.timestamp) = 0;
    HIWORD(self->_mostRecentVehicleState.timestamp) = 0;
    if (qword_102419240 != -1) {
      dispatch_once(&qword_102419240, &stru_1022D6DC0);
    }
    id v6 = qword_102419248;
    if (os_log_type_enabled((os_log_t)qword_102419248, OS_LOG_TYPE_INFO))
    {
      int value_low = LOBYTE(self->_wifiServiceClient.__ptr_.__value_);
      *(_DWORD *)buf = 67174657;
      LODWORD(v20[0]) = value_low;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Listener, Keep alive timer expired / connected to Stationary Wifi, %{private}d, un-subscribed to Vehicle State", buf, 8u);
    }
    if (!sub_10013D1A0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419240 != -1) {
      dispatch_once(&qword_102419240, &stru_1022D6DC0);
    }
    int v14 = LOBYTE(self->_wifiServiceClient.__ptr_.__value_);
    int v17 = 67174657;
    LODWORD(v18) = v14;
LABEL_28:
    v15 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDistributedSensingService(Listener) toggleVehicleStateListener:]", "%s\n", v15);
    if (v15 != (char *)buf) {
      free(v15);
    }
    return;
  }
  id v8 = self->_vehicleStateListenerKeepAliveTimer;
  if (!v8)
  {
    unsigned int v9 = (CLTimer *)[[-[CLDistributedSensingService silo](self, "silo") newTimer];
    self->_vehicleStateListenerKeepAliveTimer = v9;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1009B6E4C;
    v16[3] = &unk_10229FED8;
    v16[4] = self;
    [(CLTimer *)v9 setHandler:v16];
    id v8 = self->_vehicleStateListenerKeepAliveTimer;
  }
  [(CLTimer *)v8 fireInterval];
  if (v10 == 1.79769313e308)
  {
    self->_vehicleStateListener = (DSMotionListener *)[objc_alloc((Class)DSMotionListener) initWithDelegate:self queue:0];
    unint64_t v11 = objc_opt_new();
    [v11 setDeviceType:1];
    [v11 setDataSubType:1];
    [(DSMotionListener *)self->_vehicleStateListener startMotionDataListenerWithOptions:v11];
  }
  sub_101A1F180(buf, "kVehicleStateListenerKeepAliveTimerDurationSeconds", &qword_101D559D8, 0);
  uint64_t v12 = *(void *)((char *)v20 + 4);
  [(CLTimer *)self->_vehicleStateListenerKeepAliveTimer setNextFireDelay:*(double *)((char *)v20 + 4) interval:*(double *)((char *)v20 + 4)];
  if (qword_102419240 != -1) {
    dispatch_once(&qword_102419240, &stru_1022D6DC0);
  }
  int v13 = qword_102419248;
  if (os_log_type_enabled((os_log_t)qword_102419248, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v20[0] = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Listener, Subscribed to Vehicle State, starting keep alive timer, duration, %.3f", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419240 != -1) {
      dispatch_once(&qword_102419240, &stru_1022D6DC0);
    }
    int v17 = 134217984;
    uint64_t v18 = v12;
    goto LABEL_28;
  }
}

- (void)registerClient:(id)a3 forNotification:(int)a4
{
  char v7 = self->_clients[a4];
  -[NSMutableSet addObject:](v7, "addObject:");
  if (!a4)
  {
    if (qword_102419240 != -1) {
      dispatch_once(&qword_102419240, &stru_1022D6DC0);
    }
    id v8 = qword_102419248;
    if (os_log_type_enabled((os_log_t)qword_102419248, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v12 = [(NSMutableSet *)v7 count];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Listener, Client register for Vehicle State, num client, %lu", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419240 != -1) {
        dispatch_once(&qword_102419240, &stru_1022D6DC0);
      }
      [(NSMutableSet *)v7 count];
      double v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDistributedSensingService(Listener) registerClient:forNotification:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    [(CLDistributedSensingService *)self toggleVehicleStateListener:1];
    unsigned int v9 = [[CMVehicleStateData alloc] initWithTimestamp:+[NSDate dateWithTimeIntervalSinceReferenceDate:(double)*(unint64_t *)(&self->_mostRecentVehicleState.version + 1)] state:*(unsigned int *)((char *)&self->_mostRecentVehicleState.timestamp + 1) hints:HIWORD(self->_mostRecentVehicleState.timestamp)];
    [a3 onVehicleStateUpdate:v9];
  }
}

- (void)unregisterClient:(id)a3 forNotification:(int)a4
{
  uint64_t v5 = self->_clients[a4];
  [(NSMutableSet *)v5 removeObject:a3];
  if (!a4)
  {
    if (qword_102419240 != -1) {
      dispatch_once(&qword_102419240, &stru_1022D6DC0);
    }
    id v6 = qword_102419248;
    if (os_log_type_enabled((os_log_t)qword_102419248, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v9 = [(NSMutableSet *)v5 count];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Listener, Client de-register for Vehicle State, num client, %lu", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419240 != -1) {
        dispatch_once(&qword_102419240, &stru_1022D6DC0);
      }
      [(NSMutableSet *)v5 count];
      char v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDistributedSensingService(Listener) unregisterClient:forNotification:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
}

- (void)listenerVehicleStateUpdate:(id)a3
{
  p_mostRecentVehicleState = &self->_mostRecentVehicleState;
  [a3 getBytes:&self->_mostRecentVehicleState length:16];
  if (qword_102419240 != -1) {
    dispatch_once(&qword_102419240, &stru_1022D6DC0);
  }
  uint64_t v5 = qword_102419248;
  if (os_log_type_enabled((os_log_t)qword_102419248, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(_DWORD *)((char *)&p_mostRecentVehicleState->timestamp + 1);
    int timestamp_high = HIWORD(p_mostRecentVehicleState->timestamp);
    *(_DWORD *)buf = 67174913;
    int v27 = v6;
    __int16 v28 = 1025;
    int v29 = timestamp_high;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Listener, Vehicle State update, state, %{private}d, hints, 0x%{private}x", buf, 0xEu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419240 != -1) {
      dispatch_once(&qword_102419240, &stru_1022D6DC0);
    }
    int v14 = *(_DWORD *)((char *)&p_mostRecentVehicleState->timestamp + 1);
    int v15 = HIWORD(p_mostRecentVehicleState->timestamp);
    int v22 = 67174913;
    int v23 = v14;
    __int16 v24 = 1025;
    int v25 = v15;
    v16 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDistributedSensingService(Listener) listenerVehicleStateUpdate:]", "%s\n", v16);
    if (v16 != (char *)buf) {
      free(v16);
    }
  }
  id v8 = [[CMVehicleStateData alloc] initWithTimestamp:+[NSDate dateWithTimeIntervalSinceReferenceDate:(double)*(unint64_t *)(&p_mostRecentVehicleState->version + 1)] state:*(unsigned int *)((char *)&p_mostRecentVehicleState->timestamp + 1) hints:HIWORD(p_mostRecentVehicleState->timestamp)];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = self->_clients[0];
  id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * i) onVehicleStateUpdate:v8];
      }
      id v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)listenerOnWifiServiceNotification:(int)a3 data:(id)a4
{
  if (a3 <= 0xE)
  {
    if (((1 << a3) & 0x7F3F) != 0)
    {
      if (qword_102419240 != -1) {
        dispatch_once(&qword_102419240, &stru_1022D6DC0);
      }
      uint64_t v5 = qword_102419248;
      if (os_log_type_enabled((os_log_t)qword_102419248, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v12 = a3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "Listener, Unhandled WiFi Service notification, %d", buf, 8u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419240 != -1) {
          dispatch_once(&qword_102419240, &stru_1022D6DC0);
        }
        id v10 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLDistributedSensingService(Listener) listenerOnWifiServiceNotification:data:]", "%s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
      }
    }
    else
    {
      char v7 = (int *)sub_100588F70(a4);
      if (v7)
      {
        char v8 = *((unsigned char *)v7 + 96);
        if (v8) {
          char v8 = v7[12] >= 1 && *((unsigned char *)v7 + 73) == 0;
        }
        LOBYTE(self->_wifiServiceClient.__ptr_.__value_) = v8;
        if ([(NSMutableSet *)self->_clients[0] count]) {
          BOOL v9 = LOBYTE(self->_wifiServiceClient.__ptr_.__value_) == 0;
        }
        else {
          BOOL v9 = 0;
        }
        [(CLDistributedSensingService *)self toggleVehicleStateListener:v9];
      }
    }
  }
}

@end