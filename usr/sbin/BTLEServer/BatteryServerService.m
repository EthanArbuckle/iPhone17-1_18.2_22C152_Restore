@interface BatteryServerService
- (BatteryServerService)init;
- (CBMutableCharacteristic)batteryLevelCharacteristic;
- (id)batteryLevelValue;
- (int)iopsNotifyPercentChangeToken;
- (void)batteryLevelDidChange;
- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5;
- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5;
- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4;
- (void)setBatteryLevelCharacteristic:(id)a3;
- (void)setIopsNotifyPercentChangeToken:(int)a3;
- (void)startNotifications;
- (void)stop;
- (void)stopNotifications;
- (void)updateBatterylevel;
@end

@implementation BatteryServerService

- (BatteryServerService)init
{
  v13.receiver = self;
  v13.super_class = (Class)BatteryServerService;
  v2 = [(BatteryServerService *)&v13 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)CBMutableCharacteristic);
    v4 = +[CBUUID UUIDWithString:CBUUIDBatteryLevelCharacteristicString];
    v5 = (CBMutableCharacteristic *)[v3 initWithType:v4 properties:1042 value:0 permissions:17];
    batteryLevelCharacteristic = v2->_batteryLevelCharacteristic;
    v2->_batteryLevelCharacteristic = v5;

    id v7 = objc_alloc((Class)CBMutableService);
    v8 = +[CBUUID UUIDWithString:CBUUIDBatteryServiceString];
    id v9 = [v7 initWithType:v8 primary:1];
    [(ServerService *)v2 setService:v9];

    v14 = v2->_batteryLevelCharacteristic;
    v10 = +[NSArray arrayWithObjects:&v14 count:1];
    v11 = [(ServerService *)v2 service];
    [v11 setCharacteristics:v10];

    v2->_iopsNotifyPercentChangeToken = -1;
  }
  return v2;
}

- (void)stop
{
  if ([(BatteryServerService *)self iopsNotifyPercentChangeToken] != -1) {
    [(BatteryServerService *)self stopNotifications];
  }
  v3.receiver = self;
  v3.super_class = (Class)BatteryServerService;
  [(ServerService *)&v3 stop];
}

- (id)batteryLevelValue
{
  v2 = +[DataOutputStream outputStream];
  IOPSGetPercentRemaining();
  [v2 writeUint8:0];
  objc_super v3 = [v2 data];

  return v3;
}

- (void)updateBatterylevel
{
  id v4 = [(BatteryServerService *)self batteryLevelValue];
  objc_super v3 = [(BatteryServerService *)self batteryLevelCharacteristic];
  [(ServerService *)self updateValue:v4 forCharacteristic:v3 onSubscribedCentrals:0];
}

- (void)startNotifications
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10006251C;
  handler[3] = &unk_1000B2578;
  handler[4] = self;
  notify_register_dispatch("com.apple.system.powersources.percent", &self->_iopsNotifyPercentChangeToken, (dispatch_queue_t)&_dispatch_main_q, handler);
}

- (void)stopNotifications
{
  objc_super v3 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    v5[0] = 67109120;
    v5[1] = [(ServerService *)self restrictedMode];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "restrictedMode : %d", (uint8_t *)v5, 8u);
  }
  notify_cancel([(BatteryServerService *)self iopsNotifyPercentChangeToken]);
  [(BatteryServerService *)self setIopsNotifyPercentChangeToken:0xFFFFFFFFLL];
}

- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4
{
  id v9 = a4;
  v5 = [v9 characteristic];
  v6 = [(BatteryServerService *)self batteryLevelCharacteristic];

  if (v5 == v6)
  {
    v8 = [(BatteryServerService *)self batteryLevelValue];
    [v9 setValue:v8];

    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 10;
  }
  [(ServerService *)self respondToRequest:v9 withResult:v7];
}

- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5
{
  id v6 = a5;
  id v7 = [(BatteryServerService *)self batteryLevelCharacteristic];

  if (v7 == v6)
  {
    v8 = [(BatteryServerService *)self batteryLevelCharacteristic];
    id v9 = [v8 subscribedCentrals];
    id v10 = [v9 count];

    if (v10 == (id)1)
    {
      [(BatteryServerService *)self startNotifications];
    }
  }
}

- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5
{
  id v6 = a5;
  id v7 = [(BatteryServerService *)self batteryLevelCharacteristic];

  if (v7 == v6)
  {
    v8 = [(BatteryServerService *)self batteryLevelCharacteristic];
    id v9 = [v8 subscribedCentrals];
    id v10 = [v9 count];

    if (!v10)
    {
      [(BatteryServerService *)self stopNotifications];
    }
  }
}

- (void)batteryLevelDidChange
{
}

- (CBMutableCharacteristic)batteryLevelCharacteristic
{
  return self->_batteryLevelCharacteristic;
}

- (void)setBatteryLevelCharacteristic:(id)a3
{
}

- (int)iopsNotifyPercentChangeToken
{
  return self->_iopsNotifyPercentChangeToken;
}

- (void)setIopsNotifyPercentChangeToken:(int)a3
{
  self->_iopsNotifyPercentChangeToken = a3;
}

- (void).cxx_destruct
{
}

@end