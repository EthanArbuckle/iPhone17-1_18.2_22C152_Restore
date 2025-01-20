@interface CLGatheringBluetoothScanner
- (CLGatheringBluetoothScanner)initWithQueue:(id)a3 withSettings:(id)a4 withPolicy:(BOOL)a5;
- (CLGatheringBluetoothScannerDelegate)delegate;
- (CLGatheringSettings)settings;
- (OS_dispatch_queue)queue;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSettings:(id)a3;
- (void)startDeviceDiscovery;
- (void)startDeviceDiscoveryCommon;
- (void)startPermanentDeviceDiscovery;
- (void)stopDeviceDiscovery;
@end

@implementation CLGatheringBluetoothScanner

- (CLGatheringBluetoothScanner)initWithQueue:(id)a3 withSettings:(id)a4 withPolicy:(BOOL)a5
{
  v17.receiver = self;
  v17.super_class = (Class)CLGatheringBluetoothScanner;
  v8 = [(CLGatheringBluetoothScanner *)&v17 init];
  v9 = v8;
  if (v8)
  {
    [(CLGatheringBluetoothScanner *)v8 setQueue:a3];
    [(CLGatheringBluetoothScanner *)v9 setSettings:a4];
    v9->_discovery = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
    [(CBDiscovery *)v9->_discovery setDispatchQueue:[(CLGatheringBluetoothScanner *)v9 queue]];
    [(CBDiscovery *)v9->_discovery setLabel:@"CLGathering"];
    [(CBDiscovery *)v9->_discovery setBleRSSIThresholdHint:4294967216];
    [(CBDiscovery *)v9->_discovery setBleScanRate:10];
    [(CBDiscovery *)v9->_discovery setBleScanRateScreenOff:20];
    v9->_leechNearbyInfoV2Discovery = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
    [(CBDiscovery *)v9->_leechNearbyInfoV2Discovery setDispatchQueue:[(CLGatheringBluetoothScanner *)v9 queue]];
    [(CBDiscovery *)v9->_leechNearbyInfoV2Discovery setLabel:@"CLGatheringLeech"];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100CF9910;
    v16[3] = &unk_1022F2228;
    v16[4] = v9;
    if (a5)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100CF9C64;
      v15[3] = &unk_1022F2250;
      v15[4] = v9;
      v15[5] = v16;
      [(CBDiscovery *)v9->_leechNearbyInfoV2Discovery setDevicesBufferedHandler:v15];
    }
    else
    {
      [(CBDiscovery *)v9->_leechNearbyInfoV2Discovery setDeviceFoundHandler:v16];
    }
    discovery = v9->_discovery;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100CF9FCC;
    v14[3] = &unk_1022B8750;
    v14[4] = v9;
    [(CBDiscovery *)discovery activateWithCompletion:v14];
    leechNearbyInfoV2Discovery = v9->_leechNearbyInfoV2Discovery;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100CFA1B4;
    v13[3] = &unk_1022B8750;
    v13[4] = v9;
    [(CBDiscovery *)leechNearbyInfoV2Discovery activateWithCompletion:v13];
  }
  return v9;
}

- (void)dealloc
{
  [(CLGatheringBluetoothScanner *)self setQueue:0];
  [(CLGatheringBluetoothScanner *)self setSettings:0];
  [(CLGatheringBluetoothScanner *)self setDelegate:0];
  [(CBDiscovery *)self->_discovery invalidate];

  self->_discovery = 0;
  [(CBDiscovery *)self->_leechNearbyInfoV2Discovery invalidate];

  self->_leechNearbyInfoV2Discovery = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLGatheringBluetoothScanner;
  [(CLGatheringBluetoothScanner *)&v3 dealloc];
}

- (void)startDeviceDiscoveryCommon
{
  if ([(CLGatheringSettings *)[(CLGatheringBluetoothScanner *)self settings] scanWithDuplicates])
  {
    uint64_t v3 = 0x202000000;
  }
  else
  {
    uint64_t v3 = 0x2000000;
  }
  [(CBDiscovery *)self->_discovery setDiscoveryFlags:v3];
  [(CBDiscovery *)self->_leechNearbyInfoV2Discovery setDiscoveryFlags:v3 | 0x100000000000];
  leechNearbyInfoV2Discovery = self->_leechNearbyInfoV2Discovery;

  [(CBDiscovery *)leechNearbyInfoV2Discovery addDiscoveryType:4];
}

- (void)startPermanentDeviceDiscovery
{
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022F2270);
  }
  uint64_t v3 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "startPermanentDeviceDiscovery", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F2270);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothScanner startPermanentDeviceDiscovery]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLGatheringBluetoothScanner *)self startDeviceDiscoveryCommon];
  [(CBDiscovery *)self->_discovery addDiscoveryType:11];
  [(CBDiscovery *)self->_discovery setUseCase:524289];
  [(CBDiscovery *)self->_discovery setBleScanRateScreenOff:[(CLGatheringSettings *)[(CLGatheringBluetoothScanner *)self settings] scanAonDutyCycle]];
}

- (void)startDeviceDiscovery
{
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022F2270);
  }
  uint64_t v3 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "startDeviceDiscovery", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F2270);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothScanner startDeviceDiscovery]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLGatheringBluetoothScanner *)self startDeviceDiscoveryCommon];
  [(CBDiscovery *)self->_discovery addDiscoveryType:18];
  [(CBDiscovery *)self->_discovery setUseCase:0x80000];
  [(CBDiscovery *)self->_discovery setBleScanRateScreenOff:[(CLGatheringSettings *)[(CLGatheringBluetoothScanner *)self settings] scanDutyCycle]];
}

- (void)stopDeviceDiscovery
{
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022F2270);
  }
  uint64_t v3 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "stopDeviceDiscovery", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F2270);
    }
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothScanner stopDeviceDiscovery]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  [(CBDiscovery *)self->_discovery setUseCase:0];
  [(CBDiscovery *)self->_discovery setDiscoveryFlags:0];
  [(CBDiscovery *)self->_discovery removeAllDiscoveryTypes];
  [(CBDiscovery *)self->_leechNearbyInfoV2Discovery setDiscoveryFlags:0];
  [(CBDiscovery *)self->_leechNearbyInfoV2Discovery removeAllDiscoveryTypes];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CLLocationManagerGatheringBufferedDevicesReceived, 0, 0, 0);
}

- (CLGatheringBluetoothScannerDelegate)delegate
{
  return (CLGatheringBluetoothScannerDelegate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
}

- (CLGatheringSettings)settings
{
  return (CLGatheringSettings *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSettings:(id)a3
{
}

@end