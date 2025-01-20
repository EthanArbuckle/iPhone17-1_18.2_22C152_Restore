@interface SiriBluetoothDeviceSource
+ (id)bluetoothDeviceForIdentifier:(int64_t)a3 bluetoothDevice:(id)a4;
- (SiriBluetoothContext)context;
- (double)longPressInterval;
- (int64_t)buttonIdentifier;
- (void)activate;
- (void)deactivate;
- (void)setButtonIdentifier:(int64_t)a3;
- (void)setContext:(id)a3;
- (void)setLongPressInterval:(double)a3;
@end

@implementation SiriBluetoothDeviceSource

+ (id)bluetoothDeviceForIdentifier:(int64_t)a3 bluetoothDevice:(id)a4
{
  id v5 = a4;
  id v6 = [(SiriLongPressButtonSource *)[SiriBluetoothDeviceSource alloc] _initWithButtonIdentifier:a3];
  v7 = [[SiriBluetoothContext alloc] initWithBluetoothDevice:v5];

  [v6 setContext:v7];
  [v6 setLongPressInterval:0.4];
  return v6;
}

- (void)activate
{
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock(&self->super.super._lock);
  v4 = [(BSServiceConnection *)self->super.super._connection remoteTarget];
  id v5 = [[SASButtonIdentifierTransport alloc] initWithSiriButtonIdentifier:[(SiriBluetoothDeviceSource *)self buttonIdentifier]];
  id v6 = [(SiriBluetoothDeviceSource *)self context];
  [v4 activationRequestFromButtonIdentifier:v5 context:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)deactivate
{
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock(&self->super.super._lock);
  v7 = [[SiriDismissalOptions alloc] initWithDeactivationOptions:0 animated:1 dismissalReason:18];
  v4 = [(BSServiceConnection *)self->super.super._connection remoteTarget];
  id v5 = [[SASButtonIdentifierTransport alloc] initWithSiriButtonIdentifier:[(SiriBluetoothDeviceSource *)self buttonIdentifier]];
  id v6 = [(SiriBluetoothDeviceSource *)self context];
  [v4 deactivationRequestFromButtonIdentifier:v5 context:v6 options:v7];

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)buttonIdentifier
{
  return self->_buttonIdentifier;
}

- (void)setButtonIdentifier:(int64_t)a3
{
  self->_buttonIdentifier = a3;
}

- (double)longPressInterval
{
  return self->_longPressInterval;
}

- (void)setLongPressInterval:(double)a3
{
  self->_longPressInterval = a3;
}

- (SiriBluetoothContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end