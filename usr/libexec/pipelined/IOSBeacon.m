@interface IOSBeacon
- (BOOL)sensorPresent;
- (IOSBeacon)init;
- (id).cxx_construct;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)getSensor;
- (void)start;
- (void)stop;
@end

@implementation IOSBeacon

- (BOOL)sensorPresent
{
  if (qword_10047BED8 != -1) {
    dispatch_once(&qword_10047BED8, &stru_100468C10);
  }
  v3 = (id)qword_10047BEE0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v4 = [(CBCentralManager *)self->_bluetoothManager state];
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Checking bluetooth sensor presence, state=%d", (uint8_t *)v6, 8u);
  }

  return 1;
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  if (qword_10047BED8 != -1) {
    dispatch_once(&qword_10047BED8, &stru_100468C10);
  }
  v5 = (id)qword_10047BEE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v4 state];
    id v7 = [(CBCentralManager *)self->_bluetoothManager state];
    int v8 = 134218240;
    id v9 = v6;
    __int16 v10 = 2048;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Central manager state=%ld, Bluetooth Manager state=%ld", (uint8_t *)&v8, 0x16u);
  }
}

- (IOSBeacon)init
{
  v3.receiver = self;
  v3.super_class = (Class)IOSBeacon;
  if ([(IOSBeacon *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)getSensor
{
  return self->_beaconSensor.__ptr_.__value_;
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

- (void)dealloc
{
  scanResultQueue = self->_scanResultQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_100342970;
  block[3] = &unk_100468BE0;
  id v6 = self;
  objc_super v3 = v6;
  dispatch_sync(scanResultQueue, block);

  v4.receiver = v3;
  v4.super_class = (Class)IOSBeacon;
  [(IOSBeacon *)&v4 dealloc];
}

- (void)start
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [0 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    do
    {
      v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(0);
        }
        id v6 = +[CBUUID UUIDWithString:*(void *)(*((void *)&v9 + 1) + 8 * (void)v5)];
        [0 addObject:v6];

        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [0 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v3);
  }
  bluetoothManager = self->_bluetoothManager;
  v13[0] = CBCentralManagerScanOptionAllowDuplicatesKey;
  v13[1] = CBCentralManagerScanOptionIsPrivilegedDaemonKey;
  v14[0] = &__kCFBooleanTrue;
  v14[1] = &__kCFBooleanTrue;
  v13[2] = CBCentralManagerScanOptionScanInterval;
  v13[3] = CBCentralManagerScanOptionScanWindow;
  v14[2] = &off_10046F1C0;
  v14[3] = &off_10046F1C0;
  int v8 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  [(CBCentralManager *)bluetoothManager scanForPeripheralsWithServices:0 options:v8];
}

- (void)stop
{
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
}

- (void).cxx_destruct
{
  value = self->_beaconSensor.__ptr_.__value_;
  self->_beaconSensor.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(BeaconSensor *, SEL))(*(void *)value + 8))(value, a2);
  }
  objc_storeStrong((id *)&self->_scanResultQueue, 0);

  objc_storeStrong((id *)&self->_bluetoothManager, 0);
}

@end