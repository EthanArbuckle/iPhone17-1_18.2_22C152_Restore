@interface NPKBluetoothConnectivityCoordinator
- (BOOL)isBluetoothEnabled;
- (NPKBluetoothConnectivityCoordinator)init;
- (NPKBluetoothConnectivityCoordinatorDelegate)delegate;
- (unint64_t)bluetoothAvailableAndEnabled;
- (void)setBluetoothAvailableAndEnabled:(unint64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NPKBluetoothConnectivityCoordinator

- (NPKBluetoothConnectivityCoordinator)init
{
  v3.receiver = self;
  v3.super_class = (Class)NPKBluetoothConnectivityCoordinator;
  result = [(NPKBluetoothConnectivityCoordinator *)&v3 init];
  if (result) {
    result->_bluetoothAvailableAndEnabled = 0;
  }
  return result;
}

- (BOOL)isBluetoothEnabled
{
  return 1;
}

- (NPKBluetoothConnectivityCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKBluetoothConnectivityCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)bluetoothAvailableAndEnabled
{
  return self->_bluetoothAvailableAndEnabled;
}

- (void)setBluetoothAvailableAndEnabled:(unint64_t)a3
{
  self->_bluetoothAvailableAndEnabled = a3;
}

- (void).cxx_destruct
{
}

@end