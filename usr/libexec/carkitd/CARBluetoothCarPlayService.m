@interface CARBluetoothCarPlayService
- (BOOL)isActive;
- (CARBluetoothCarPlayService)initWithPeripheral:(id)a3;
- (CARBluetoothCarPlayServiceDelegate)serviceDelegate;
- (CARBluetoothLEService)service;
- (CARPropertyListMessenger)plistMessenger;
- (CBPeripheral)peripheral;
- (NSDictionary)messageClassesForIdentifiers;
- (NSMutableDictionary)activeMessagesForDatas;
- (OS_dispatch_queue)queue;
- (id)_queue_popMessageForData:(id)a3;
- (void)_queue_handleFailedToSendMessage:(id)a3;
- (void)bluetoothLEChannel:(id)a3 didFailToSendData:(id)a4;
- (void)bluetoothLEChannel:(id)a3 didReceiveData:(id)a4;
- (void)bluetoothLEChannel:(id)a3 didSendData:(id)a4;
- (void)bluetoothLEService:(id)a3 didCloseChannel:(id)a4;
- (void)bluetoothLEService:(id)a3 didOpenChannel:(id)a4;
- (void)propertyListMessenger:(id)a3 didReceiveMessageWithIdentifier:(unsigned __int16)a4 contents:(id)a5;
- (void)sendMessage:(id)a3;
- (void)setServiceDelegate:(id)a3;
@end

@implementation CARBluetoothCarPlayService

- (CARBluetoothCarPlayService)initWithPeripheral:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CARBluetoothCarPlayService;
  v6 = [(CARBluetoothCarPlayService *)&v22 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_peripheral, a3);
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.carkit.BLE_service", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    v11 = +[CBUUID UUIDWithString:CBUUIDLECarPlayServiceString];
    v12 = +[CBUUID UUIDWithString:CBUUIDLECarPlayL2CAPPSMCharacteristicString];
    v13 = [[CARBluetoothLEService alloc] initWithPeripheral:v5 serviceUUID:v11 psmCharacteristicUUID:v12];
    service = v7->_service;
    v7->_service = v13;

    [(CARBluetoothLEService *)v7->_service setServiceDelegate:v7];
    v15 = objc_alloc_init(CARPropertyListMessenger);
    plistMessenger = v7->_plistMessenger;
    v7->_plistMessenger = v15;

    [(CARPropertyListMessenger *)v7->_plistMessenger setMessageReceiver:v7];
    uint64_t v17 = sub_100031B94();
    messageClassesForIdentifiers = v7->_messageClassesForIdentifiers;
    v7->_messageClassesForIdentifiers = (NSDictionary *)v17;

    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    activeMessagesForDatas = v7->_activeMessagesForDatas;
    v7->_activeMessagesForDatas = v19;
  }
  return v7;
}

- (BOOL)isActive
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(CARBluetoothCarPlayService *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005D4D0;
  v5[3] = &unk_1000BD768;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)sendMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(CARBluetoothCarPlayService *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005D5F0;
  v7[3] = &unk_1000BD3A8;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)_queue_popMessageForData:(id)a3
{
  id v4 = a3;
  id v5 = [(CARBluetoothCarPlayService *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CARBluetoothCarPlayService *)self activeMessagesForDatas];
  v7 = [v6 objectForKey:v4];

  if (v7)
  {
    id v8 = [(CARBluetoothCarPlayService *)self activeMessagesForDatas];
    [v8 removeObjectForKey:v4];
  }

  return v7;
}

- (void)_queue_handleFailedToSendMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(CARBluetoothCarPlayService *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100075B60((uint64_t)v4, v6);
  }

  v7 = [(CARBluetoothCarPlayService *)self serviceDelegate];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 carPlayService:self didFailToSendMessage:v4];
  }
}

- (void)propertyListMessenger:(id)a3 didReceiveMessageWithIdentifier:(unsigned __int16)a4 contents:(id)a5
{
  id v7 = a5;
  id v8 = [(CARBluetoothCarPlayService *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005D9E0;
  block[3] = &unk_1000BF570;
  unsigned __int16 v12 = a4;
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (void)bluetoothLEService:(id)a3 didOpenChannel:(id)a4
{
  id v5 = a4;
  id v6 = [(CARBluetoothCarPlayService *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005DC3C;
  v8[3] = &unk_1000BD3A8;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)bluetoothLEService:(id)a3 didCloseChannel:(id)a4
{
  id v5 = a4;
  id v6 = [(CARBluetoothCarPlayService *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005DDDC;
  v8[3] = &unk_1000BD3A8;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)bluetoothLEChannel:(id)a3 didSendData:(id)a4
{
  id v5 = a4;
  id v6 = [(CARBluetoothCarPlayService *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005E050;
  v8[3] = &unk_1000BD3A8;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)bluetoothLEChannel:(id)a3 didFailToSendData:(id)a4
{
  id v5 = a4;
  id v6 = [(CARBluetoothCarPlayService *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005E194;
  v8[3] = &unk_1000BD3A8;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)bluetoothLEChannel:(id)a3 didReceiveData:(id)a4
{
  id v5 = a4;
  id v6 = [(CARBluetoothCarPlayService *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005E2AC;
  v8[3] = &unk_1000BD3A8;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (CARBluetoothCarPlayServiceDelegate)serviceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceDelegate);

  return (CARBluetoothCarPlayServiceDelegate *)WeakRetained;
}

- (void)setServiceDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CARBluetoothLEService)service
{
  return self->_service;
}

- (CARPropertyListMessenger)plistMessenger
{
  return self->_plistMessenger;
}

- (NSDictionary)messageClassesForIdentifiers
{
  return self->_messageClassesForIdentifiers;
}

- (NSMutableDictionary)activeMessagesForDatas
{
  return self->_activeMessagesForDatas;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeMessagesForDatas, 0);
  objc_storeStrong((id *)&self->_messageClassesForIdentifiers, 0);
  objc_storeStrong((id *)&self->_plistMessenger, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_serviceDelegate);

  objc_storeStrong((id *)&self->_peripheral, 0);
}

@end