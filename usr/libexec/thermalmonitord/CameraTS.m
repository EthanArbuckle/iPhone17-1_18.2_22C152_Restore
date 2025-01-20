@interface CameraTS
- (CameraTS)initWithFrontCameraSensorIdx:(int)a3 rearCameraSensorIdx:(int)a4;
- (OS_dispatch_queue)cameraQueue;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)frontCameraSensorIdx;
- (int)frontCameraStateToken;
- (int)frontCameraTemperatureToken;
- (int)frontIRCameraSensorIdx;
- (int)frontIRCameraSensorTemperatureToken;
- (int)frontRigelDieSensorIdx;
- (int)frontRigelDieTemperatureActiveToken;
- (int)frontRomeoNTCSensorIdx;
- (int)frontRomeoNTCTemperatureActiveToken;
- (int)numberOfFields;
- (int)rearCameraJasperSensorIdx;
- (int)rearCameraJasperStateToken;
- (int)rearCameraJasperTemperatureToken;
- (int)rearCameraSensorIdx;
- (int)rearCameraStateToken;
- (int)rearCameraSuperWideSensorIdx;
- (int)rearCameraSuperWideStateToken;
- (int)rearCameraSuperWideTemperatureToken;
- (int)rearCameraTeleSensorIdx;
- (int)rearCameraTeleStateToken;
- (int)rearCameraTeleTemperatureToken;
- (int)rearCameraTemperatureToken;
- (int)torchState;
- (int)torchStateToken;
- (void)dealloc;
- (void)enableFrontIRCameraNotifications:(int)a3;
- (void)enableFrontRigelDieNotifications:(int)a3;
- (void)enableFrontRomeoNTCNotifications:(int)a3;
- (void)enableRearCameraJasperNotifications:(int)a3;
- (void)enableRearCameraSuperWideNotifications:(int)a3;
- (void)enableRearCameraTeleNotifications:(int)a3;
- (void)handleStateChangeNotification:(int)a3 temperatureSensorIndex:(int)a4;
- (void)handleTemperatureChangeNotification:(int)a3 temperatureSensorIndex:(int)a4;
- (void)setCameraQueue:(id)a3;
- (void)setFrontCameraSensorIdx:(int)a3;
- (void)setFrontCameraStateToken:(int)a3;
- (void)setFrontCameraTemperatureToken:(int)a3;
- (void)setFrontIRCameraSensorIdx:(int)a3;
- (void)setFrontIRCameraSensorTemperatureToken:(int)a3;
- (void)setFrontRigelDieSensorIdx:(int)a3;
- (void)setFrontRigelDieTemperatureActiveToken:(int)a3;
- (void)setFrontRomeoNTCSensorIdx:(int)a3;
- (void)setFrontRomeoNTCTemperatureActiveToken:(int)a3;
- (void)setRearCameraJasperSensorIdx:(int)a3;
- (void)setRearCameraJasperStateToken:(int)a3;
- (void)setRearCameraJasperTemperatureToken:(int)a3;
- (void)setRearCameraSensorIdx:(int)a3;
- (void)setRearCameraStateToken:(int)a3;
- (void)setRearCameraSuperWideSensorIdx:(int)a3;
- (void)setRearCameraSuperWideStateToken:(int)a3;
- (void)setRearCameraSuperWideTemperatureToken:(int)a3;
- (void)setRearCameraTeleSensorIdx:(int)a3;
- (void)setRearCameraTeleStateToken:(int)a3;
- (void)setRearCameraTeleTemperatureToken:(int)a3;
- (void)setRearCameraTemperatureToken:(int)a3;
- (void)setTorchState:(int)a3;
- (void)setTorchStateToken:(int)a3;
- (void)updateSensor:(int)a3 temperature:(unint64_t)a4;
@end

@implementation CameraTS

- (int)numberOfFields
{
  return 1;
}

- (int)torchState
{
  return self->_torchState;
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  if (a3) {
    return 0;
  }
  else {
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", [(CameraTS *)self torchState]);
  }
}

- (CameraTS)initWithFrontCameraSensorIdx:(int)a3 rearCameraSensorIdx:(int)a4
{
  v29.receiver = self;
  v29.super_class = (Class)CameraTS;
  v6 = [(CameraTS *)&v29 init];
  v7 = v6;
  if (v6)
  {
    v6->_torchState = -1;
    v6->_rearCameraSensorIdx = a4;
    v6->_frontCameraSensorIdx = a3;
    v6->_rearCameraTeleSensorIdx = -1;
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7->_cameraQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ThermalMonitor.cameraQueue", v8);
    if (byte_1000AB0E0)
    {
      [+[SensorExchangeHelper sharedInstance] registerCLTMSensorIndex:8 forSMCKey:@"zETM" atSMCIndex:8];
      [+[SensorExchangeHelper sharedInstance] registerCLTMSensorIndex:19 forSMCKey:@"zETM" atSMCIndex:19];
      [+[SensorExchangeHelper sharedInstance] registerCLTMSensorIndex:20 forSMCKey:@"zETM" atSMCIndex:20];
      [+[SensorExchangeHelper sharedInstance] registerCLTMSensorIndex:21 forSMCKey:@"zETM" atSMCIndex:21];
      [+[SensorExchangeHelper sharedInstance] registerCLTMSensorIndex:23 forSMCKey:@"zETM" atSMCIndex:23];
      [+[SensorExchangeHelper sharedInstance] registerCLTMSensorIndex:22 forSMCKey:@"zETM" atSMCIndex:22];
    }
    objc_initWeak(&location, v7);
    cameraQueue = v7->_cameraQueue;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000F9BC;
    v26[3] = &unk_1000850E8;
    objc_copyWeak(&v27, &location);
    sub_1000395F0("com.apple.isp.backcamerapower", &v7->_rearCameraStateToken, cameraQueue, v26);
    v10 = v7->_cameraQueue;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10000FA2C;
    v24[3] = &unk_1000850E8;
    objc_copyWeak(&v25, &location);
    sub_1000395F0("com.apple.isp.backsensortemperature", &v7->_rearCameraTemperatureToken, v10, v24);
    v11 = v7->_cameraQueue;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000FA78;
    v22[3] = &unk_1000850E8;
    objc_copyWeak(&v23, &location);
    sub_1000395F0("com.apple.isp.frontcamerapower", &v7->_frontCameraStateToken, v11, v22);
    v12 = v7->_cameraQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000FAE8;
    v20[3] = &unk_1000850E8;
    objc_copyWeak(&v21, &location);
    sub_1000395F0("com.apple.isp.frontsensortemperature", &v7->_frontCameraTemperatureToken, v12, v20);
    v13 = v7->_cameraQueue;
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_10000FB34;
    v18 = &unk_1000850E8;
    objc_copyWeak(&v19, &location);
    sub_1000395F0("com.apple.isp.cameratorch", &v7->_torchStateToken, v13, &v15);
    [+[TGraphSampler sharedInstance] addtGraphDataSource:v7];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return v7;
}

- (void)enableRearCameraTeleNotifications:(int)a3
{
  [(CameraTS *)self setRearCameraTeleSensorIdx:*(void *)&a3];
  objc_initWeak(&location, self);
  cameraQueue = self->_cameraQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000FD2C;
  v8[3] = &unk_1000850E8;
  objc_copyWeak(&v9, &location);
  sub_1000395F0("com.apple.isp.backtelecamerapower", &self->_rearCameraTeleStateToken, cameraQueue, v8);
  v5 = self->_cameraQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000FD9C;
  v6[3] = &unk_1000850E8;
  objc_copyWeak(&v7, &location);
  sub_1000395F0("com.apple.isp.backtelesensortemperature", &self->_rearCameraTeleTemperatureToken, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)enableRearCameraSuperWideNotifications:(int)a3
{
  [(CameraTS *)self setRearCameraSuperWideSensorIdx:*(void *)&a3];
  objc_initWeak(&location, self);
  cameraQueue = self->_cameraQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000FF54;
  v8[3] = &unk_1000850E8;
  objc_copyWeak(&v9, &location);
  sub_1000395F0("com.apple.isp.backsuperwidecamerapower", &self->_rearCameraSuperWideStateToken, cameraQueue, v8);
  v5 = self->_cameraQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000FFC4;
  v6[3] = &unk_1000850E8;
  objc_copyWeak(&v7, &location);
  sub_1000395F0("com.apple.isp.backsuperwidetemperature", &self->_rearCameraSuperWideTemperatureToken, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)enableRearCameraJasperNotifications:(int)a3
{
  [(CameraTS *)self setRearCameraJasperSensorIdx:*(void *)&a3];
  objc_initWeak(&location, self);
  cameraQueue = self->_cameraQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001017C;
  v8[3] = &unk_1000850E8;
  objc_copyWeak(&v9, &location);
  sub_1000395F0("com.apple.isp.backtofsensorpower", &self->_rearCameraJasperStateToken, cameraQueue, v8);
  v5 = self->_cameraQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000101EC;
  v6[3] = &unk_1000850E8;
  objc_copyWeak(&v7, &location);
  sub_1000395F0("com.apple.isp.backtofsensortemperature", &self->_rearCameraJasperTemperatureToken, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)enableFrontIRCameraNotifications:(int)a3
{
  [(CameraTS *)self setFrontIRCameraSensorIdx:*(void *)&a3];
  objc_initWeak(&location, self);
  cameraQueue = self->_cameraQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000103A4;
  v8[3] = &unk_1000850E8;
  objc_copyWeak(&v9, &location);
  sub_1000395F0("com.apple.isp.frontirsensortemperature", &self->_frontIRCameraSensorTemperatureToken, cameraQueue, v8);
  v5 = self->_cameraQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000103F0;
  v6[3] = &unk_1000850E8;
  objc_copyWeak(&v7, &location);
  sub_1000395F0("com.apple.isp.frontirsensorpower", &self->_frontCameraStateToken, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)enableFrontRomeoNTCNotifications:(int)a3
{
  [(CameraTS *)self setFrontRomeoNTCSensorIdx:*(void *)&a3];
  objc_initWeak(&location, self);
  cameraQueue = self->_cameraQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000105A8;
  v8[3] = &unk_1000850E8;
  objc_copyWeak(&v9, &location);
  sub_1000395F0("com.apple.isp.frontirprojector.ntctempactive", &self->_frontRomeoNTCTemperatureActiveToken, cameraQueue, v8);
  v5 = self->_cameraQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000105F4;
  v6[3] = &unk_1000850E8;
  objc_copyWeak(&v7, &location);
  sub_1000395F0("com.apple.isp.frontirsensorpower", &self->_frontCameraStateToken, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)enableFrontRigelDieNotifications:(int)a3
{
  [(CameraTS *)self setFrontRigelDieSensorIdx:*(void *)&a3];
  objc_initWeak(&location, self);
  cameraQueue = self->_cameraQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000107AC;
  v8[3] = &unk_1000850E8;
  objc_copyWeak(&v9, &location);
  sub_1000395F0("com.apple.isp.frontirprojector.dietempactive", &self->_frontRigelDieTemperatureActiveToken, cameraQueue, v8);
  v5 = self->_cameraQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000107F8;
  v6[3] = &unk_1000850E8;
  objc_copyWeak(&v7, &location);
  sub_1000395F0("com.apple.isp.frontcamerapower", &self->_frontCameraStateToken, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  notify_cancel(self->_rearCameraTeleStateToken);
  notify_cancel(self->_rearCameraTeleTemperatureToken);
  notify_cancel(self->_torchStateToken);
  notify_cancel(self->_frontCameraTemperatureToken);
  notify_cancel(self->_frontCameraStateToken);
  notify_cancel(self->_rearCameraTemperatureToken);
  notify_cancel(self->_rearCameraStateToken);
  v3.receiver = self;
  v3.super_class = (Class)CameraTS;
  [(CameraTS *)&v3 dealloc];
}

- (void)updateSensor:(int)a3 temperature:(unint64_t)a4
{
  if (a3 < 0)
  {
    v6 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100054260(a3, v6);
    }
  }
  else
  {
    if (100 * (int)a4 <= -12800) {
      uint64_t v5 = 4294954496;
    }
    else {
      uint64_t v5 = (100 * a4);
    }
    sub_100031714(*(uint64_t *)&a3, v5);
  }
}

- (void)handleStateChangeNotification:(int)a3 temperatureSensorIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t state64 = 0;
  if (!notify_get_state(a3, &state64) && !state64) {
    [(CameraTS *)self updateSensor:v4 temperature:0];
  }
}

- (void)handleTemperatureChangeNotification:(int)a3 temperatureSensorIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t state64 = 0;
  if (!notify_get_state(a3, &state64)) {
    [(CameraTS *)self updateSensor:v4 temperature:(int)state64];
  }
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3) {
    return 0;
  }
  else {
    return @"Torch state";
  }
}

- (void)setTorchState:(int)a3
{
  self->_torchState = a3;
}

- (int)rearCameraSensorIdx
{
  return self->_rearCameraSensorIdx;
}

- (void)setRearCameraSensorIdx:(int)a3
{
  self->_rearCameraSensorIdx = a3;
}

- (int)frontCameraSensorIdx
{
  return self->_frontCameraSensorIdx;
}

- (void)setFrontCameraSensorIdx:(int)a3
{
  self->_frontCameraSensorIdx = a3;
}

- (int)rearCameraTeleSensorIdx
{
  return self->_rearCameraTeleSensorIdx;
}

- (void)setRearCameraTeleSensorIdx:(int)a3
{
  self->_rearCameraTeleSensorIdx = a3;
}

- (int)rearCameraSuperWideSensorIdx
{
  return self->_rearCameraSuperWideSensorIdx;
}

- (void)setRearCameraSuperWideSensorIdx:(int)a3
{
  self->_rearCameraSuperWideSensorIdx = a3;
}

- (int)rearCameraJasperSensorIdx
{
  return self->_rearCameraJasperSensorIdx;
}

- (void)setRearCameraJasperSensorIdx:(int)a3
{
  self->_rearCameraJasperSensorIdx = a3;
}

- (int)frontIRCameraSensorIdx
{
  return self->_frontIRCameraSensorIdx;
}

- (void)setFrontIRCameraSensorIdx:(int)a3
{
  self->_frontIRCameraSensorIdx = a3;
}

- (int)frontRomeoNTCSensorIdx
{
  return self->_frontRomeoNTCSensorIdx;
}

- (void)setFrontRomeoNTCSensorIdx:(int)a3
{
  self->_frontRomeoNTCSensorIdx = a3;
}

- (int)frontRigelDieSensorIdx
{
  return self->_frontRigelDieSensorIdx;
}

- (void)setFrontRigelDieSensorIdx:(int)a3
{
  self->_frontRigelDieSensorIdx = a3;
}

- (int)torchStateToken
{
  return self->_torchStateToken;
}

- (void)setTorchStateToken:(int)a3
{
  self->_torchStateToken = a3;
}

- (int)rearCameraStateToken
{
  return self->_rearCameraStateToken;
}

- (void)setRearCameraStateToken:(int)a3
{
  self->_rearCameraStateToken = a3;
}

- (int)rearCameraTemperatureToken
{
  return self->_rearCameraTemperatureToken;
}

- (void)setRearCameraTemperatureToken:(int)a3
{
  self->_rearCameraTemperatureToken = a3;
}

- (int)frontCameraStateToken
{
  return self->_frontCameraStateToken;
}

- (void)setFrontCameraStateToken:(int)a3
{
  self->_frontCameraStateToken = a3;
}

- (int)frontCameraTemperatureToken
{
  return self->_frontCameraTemperatureToken;
}

- (void)setFrontCameraTemperatureToken:(int)a3
{
  self->_frontCameraTemperatureToken = a3;
}

- (int)rearCameraTeleStateToken
{
  return self->_rearCameraTeleStateToken;
}

- (void)setRearCameraTeleStateToken:(int)a3
{
  self->_rearCameraTeleStateToken = a3;
}

- (int)rearCameraTeleTemperatureToken
{
  return self->_rearCameraTeleTemperatureToken;
}

- (void)setRearCameraTeleTemperatureToken:(int)a3
{
  self->_rearCameraTeleTemperatureToken = a3;
}

- (int)rearCameraSuperWideStateToken
{
  return self->_rearCameraSuperWideStateToken;
}

- (void)setRearCameraSuperWideStateToken:(int)a3
{
  self->_rearCameraSuperWideStateToken = a3;
}

- (int)rearCameraSuperWideTemperatureToken
{
  return self->_rearCameraSuperWideTemperatureToken;
}

- (void)setRearCameraSuperWideTemperatureToken:(int)a3
{
  self->_rearCameraSuperWideTemperatureToken = a3;
}

- (int)rearCameraJasperStateToken
{
  return self->_rearCameraJasperStateToken;
}

- (void)setRearCameraJasperStateToken:(int)a3
{
  self->_rearCameraJasperStateToken = a3;
}

- (int)rearCameraJasperTemperatureToken
{
  return self->_rearCameraJasperTemperatureToken;
}

- (void)setRearCameraJasperTemperatureToken:(int)a3
{
  self->_rearCameraJasperTemperatureToken = a3;
}

- (int)frontIRCameraSensorTemperatureToken
{
  return self->_frontIRCameraSensorTemperatureToken;
}

- (void)setFrontIRCameraSensorTemperatureToken:(int)a3
{
  self->_frontIRCameraSensorTemperatureToken = a3;
}

- (int)frontRomeoNTCTemperatureActiveToken
{
  return self->_frontRomeoNTCTemperatureActiveToken;
}

- (void)setFrontRomeoNTCTemperatureActiveToken:(int)a3
{
  self->_frontRomeoNTCTemperatureActiveToken = a3;
}

- (int)frontRigelDieTemperatureActiveToken
{
  return self->_frontRigelDieTemperatureActiveToken;
}

- (void)setFrontRigelDieTemperatureActiveToken:(int)a3
{
  self->_frontRigelDieTemperatureActiveToken = a3;
}

- (OS_dispatch_queue)cameraQueue
{
  return self->_cameraQueue;
}

- (void)setCameraQueue:(id)a3
{
  self->_cameraQueue = (OS_dispatch_queue *)a3;
}

@end