@interface CARBluetoothLEService
- (CARBluetoothLEChannel)activeChannel;
- (CARBluetoothLEConnectionState)currentConnectionState;
- (CARBluetoothLEService)initWithPeripheral:(id)a3 serviceUUID:(id)a4 psmCharacteristicUUID:(id)a5;
- (CARBluetoothLEServiceDelegate)serviceDelegate;
- (CBPeripheral)peripheral;
- (CBPeripheralManager)peripheralManager;
- (CBUUID)psmCharacteristicUUID;
- (CBUUID)serviceUUID;
- (OS_dispatch_queue)queue;
- (void)_discoverService;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)setCurrentConnectionState:(id)a3;
- (void)setServiceDelegate:(id)a3;
@end

@implementation CARBluetoothLEService

- (CARBluetoothLEService)initWithPeripheral:(id)a3 serviceUUID:(id)a4 psmCharacteristicUUID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CARBluetoothLEService;
  v12 = [(CARBluetoothLEService *)&v18 init];
  if (v12)
  {
    v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.carkit.BLE_service", v13);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v12->_peripheral, a3);
    [v9 setDelegate:v12];
    objc_storeStrong((id *)&v12->_serviceUUID, a4);
    objc_storeStrong((id *)&v12->_psmCharacteristicUUID, a5);
    currentConnectionState = v12->_currentConnectionState;
    v12->_currentConnectionState = 0;

    [(CARBluetoothLEService *)v12 _discoverService];
  }

  return v12;
}

- (void)_discoverService
{
  v3 = [(CARBluetoothLEService *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7C8;
  block[3] = &unk_1000BD1B0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (CARBluetoothLEChannel)activeChannel
{
  v2 = [(CARBluetoothLEService *)self currentConnectionState];
  v3 = [v2 serviceChannel];

  return (CARBluetoothLEChannel *)v3;
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CARBluetoothLEService *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DA38;
  block[3] = &unk_1000BD3D0;
  id v12 = v7;
  v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(CARBluetoothLEService *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DE3C;
  block[3] = &unk_1000BD3D0;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, block);
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(CARBluetoothLEService *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E244;
  block[3] = &unk_1000BD3D0;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(CARBluetoothLEService *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E61C;
  block[3] = &unk_1000BD3D0;
  id v13 = v7;
  id v14 = v8;
  v15 = self;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (CBUUID)serviceUUID
{
  return self->_serviceUUID;
}

- (CBUUID)psmCharacteristicUUID
{
  return self->_psmCharacteristicUUID;
}

- (CARBluetoothLEServiceDelegate)serviceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceDelegate);

  return (CARBluetoothLEServiceDelegate *)WeakRetained;
}

- (void)setServiceDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CBPeripheralManager)peripheralManager
{
  return self->_peripheralManager;
}

- (CARBluetoothLEConnectionState)currentConnectionState
{
  return self->_currentConnectionState;
}

- (void)setCurrentConnectionState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConnectionState, 0);
  objc_storeStrong((id *)&self->_peripheralManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_serviceDelegate);
  objc_storeStrong((id *)&self->_psmCharacteristicUUID, 0);
  objc_storeStrong((id *)&self->_serviceUUID, 0);

  objc_storeStrong((id *)&self->_peripheral, 0);
}

@end