@interface PKBluetoothMonitorer
- (PKBluetoothMonitorer)initWithManagerOptions:(id)a3;
- (PKBluetoothMonitorerDelegate)delegate;
- (int64_t)state;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation PKBluetoothMonitorer

- (PKBluetoothMonitorer)initWithManagerOptions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKBluetoothMonitorer;
  v5 = [(PKBluetoothMonitorer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1BD18]) initWithDelegate:v5 queue:0 options:v4];
    bluetoothManager = v5->_bluetoothManager;
    v5->_bluetoothManager = (CBCentralManager *)v6;
  }
  return v5;
}

- (int64_t)state
{
  int64_t result = [(CBCentralManager *)self->_bluetoothManager state];
  if ((unint64_t)(result - 1) >= 5) {
    return 0;
  }
  return result;
}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v4 = [a3 state];
  if ((unint64_t)(v4 - 1) >= 5) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v4;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained bluetoothMonitorerRecievedUpdatedBluetoothState:v5];
}

- (PKBluetoothMonitorerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKBluetoothMonitorerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bluetoothManager, 0);
}

@end