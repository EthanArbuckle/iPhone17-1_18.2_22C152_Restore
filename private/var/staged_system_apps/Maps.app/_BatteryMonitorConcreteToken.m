@interface _BatteryMonitorConcreteToken
- (BOOL)batteryIsChargingOrFull;
- (BatteryMonitorTokenDelegate)delegate;
- (_BatteryMonitorConcreteToken)init;
- (_BatteryMonitorConcreteTokenDelegate)concreteTokenDelegate;
- (float)currentBatteryLevel;
- (int64_t)currentBatteryState;
- (void)_batteryLevelDidChange:(id)a3;
- (void)_batteryStateDidChange:(id)a3;
- (void)dealloc;
- (void)setConcreteTokenDelegate:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _BatteryMonitorConcreteToken

- (_BatteryMonitorConcreteToken)init
{
  v6.receiver = self;
  v6.super_class = (Class)_BatteryMonitorConcreteToken;
  v2 = [(_BatteryMonitorConcreteToken *)&v6 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_batteryStateDidChange:" name:UIDeviceBatteryStateDidChangeNotification object:0];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"_batteryLevelDidChange:" name:UIDeviceBatteryLevelDidChangeNotification object:0];
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
}

- (void)setConcreteTokenDelegate:(id)a3
{
}

- (void)_batteryStateDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100108530;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_concreteTokenDelegate);
  [WeakRetained batteryMonitorConcreteTokenWillInvalidate:self];

  v4.receiver = self;
  v4.super_class = (Class)_BatteryMonitorConcreteToken;
  [(_BatteryMonitorConcreteToken *)&v4 dealloc];
}

- (int64_t)currentBatteryState
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 batteryState];

  return (int64_t)v3;
}

- (float)currentBatteryLevel
{
  v2 = +[UIDevice currentDevice];
  [v2 batteryLevel];
  float v4 = v3;

  return v4;
}

- (BOOL)batteryIsChargingOrFull
{
  return ([(_BatteryMonitorConcreteToken *)self currentBatteryState] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)_batteryLevelDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B86FF8;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BatteryMonitorTokenDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BatteryMonitorTokenDelegate *)WeakRetained;
}

- (_BatteryMonitorConcreteTokenDelegate)concreteTokenDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_concreteTokenDelegate);

  return (_BatteryMonitorConcreteTokenDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_concreteTokenDelegate);

  objc_destroyWeak((id *)&self->_delegate);
}

@end