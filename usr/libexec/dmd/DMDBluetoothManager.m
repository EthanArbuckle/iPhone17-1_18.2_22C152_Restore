@interface DMDBluetoothManager
+ (DMDBluetoothManager)sharedManager;
- (BOOL)enabled;
- (BOOL)stillNeedsUpdate;
- (BluetoothManager)bluetoothManager;
- (DMDBluetoothManager)init;
- (void)availabilityChanged:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setStillNeedsUpdate:(BOOL)a3;
@end

@implementation DMDBluetoothManager

+ (DMDBluetoothManager)sharedManager
{
  if (qword_1000FB9E8 != -1) {
    dispatch_once(&qword_1000FB9E8, &stru_1000CA610);
  }
  v2 = (void *)qword_1000FB9E0;

  return (DMDBluetoothManager *)v2;
}

- (DMDBluetoothManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)DMDBluetoothManager;
  v2 = [(DMDBluetoothManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[BluetoothManager sharedInstance];
    bluetoothManager = v2->_bluetoothManager;
    v2->_bluetoothManager = (BluetoothManager *)v3;
  }
  return v2;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_enabled = a3;
  v5 = [(DMDBluetoothManager *)self bluetoothManager];
  unsigned int v6 = [v5 available];

  if (v6)
  {
    v7 = [(DMDBluetoothManager *)self bluetoothManager];
    [v7 setEnabled:v3];

    v8 = [(DMDBluetoothManager *)self bluetoothManager];
    [v8 setPowered:v3];
  }
  else
  {
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:self selector:"availabilityChanged:" name:BluetoothAvailabilityChangedNotification object:0];
  }

  [(DMDBluetoothManager *)self setStillNeedsUpdate:v6 ^ 1];
}

- (void)availabilityChanged:(id)a3
{
  id v9 = [(DMDBluetoothManager *)self bluetoothManager];
  if ([v9 available])
  {
    unsigned int v4 = [(DMDBluetoothManager *)self stillNeedsUpdate];

    if (!v4) {
      return;
    }
    BOOL v5 = [(DMDBluetoothManager *)self enabled];
    unsigned int v6 = [(DMDBluetoothManager *)self bluetoothManager];
    [v6 setEnabled:v5];

    BOOL v7 = [(DMDBluetoothManager *)self enabled];
    v8 = [(DMDBluetoothManager *)self bluetoothManager];
    [v8 setPowered:v7];

    [(DMDBluetoothManager *)self setStillNeedsUpdate:0];
    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 removeObserver:self name:BluetoothAvailabilityChangedNotification object:0];
  }
}

- (BluetoothManager)bluetoothManager
{
  return self->_bluetoothManager;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)stillNeedsUpdate
{
  return self->_stillNeedsUpdate;
}

- (void)setStillNeedsUpdate:(BOOL)a3
{
  self->_stillNeedsUpdate = a3;
}

- (void).cxx_destruct
{
}

@end