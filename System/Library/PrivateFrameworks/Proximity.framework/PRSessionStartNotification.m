@interface PRSessionStartNotification
+ (id)createWithBluetoothConnectionEventCounterValue:(id)a3;
- (NSNumber)bluetoothConnectionEventCounterValue;
- (PRSessionStartNotification)init;
- (int64_t)notificationType;
- (void)_setBluetoothConnectionEventCounterValue:(id)a3;
- (void)_setType:(int64_t)a3;
@end

@implementation PRSessionStartNotification

- (PRSessionStartNotification)init
{
  v3.receiver = self;
  v3.super_class = (Class)PRSessionStartNotification;
  return [(PRSessionStartNotification *)&v3 init];
}

- (void)_setType:(int64_t)a3
{
  self->_notificationType = a3;
}

- (void)_setBluetoothConnectionEventCounterValue:(id)a3
{
}

+ (id)createWithBluetoothConnectionEventCounterValue:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(PRSessionStartNotification);
    [(PRSessionStartNotification *)v4 _setType:0];
    [(PRSessionStartNotification *)v4 _setBluetoothConnectionEventCounterValue:v3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (int64_t)notificationType
{
  return self->_notificationType;
}

- (NSNumber)bluetoothConnectionEventCounterValue
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end