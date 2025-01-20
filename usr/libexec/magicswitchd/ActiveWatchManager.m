@interface ActiveWatchManager
- (ActiveWatchManager)initWithDelegate:(id)a3 activeDevice:(id)a4;
- (ActiveWatchManagerDelegate)delegate;
- (BOOL)hasReceivedWristState;
- (BOOL)invalidated;
- (BOOL)isConnected;
- (BOOL)isConnecting;
- (BTPipeManager)pipeManager;
- (CBCentralManager)centralManager;
- (CBPeripheral)peripheral;
- (MessageManager)messageManager;
- (NSUUID)deviceID;
- (unsigned)wristState;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)connect;
- (void)dealloc;
- (void)disconnect;
- (void)invalidate;
- (void)pipe:(id)a3 didConnectToPeer:(id)a4;
- (void)pipe:(id)a3 didDisconnectFromPeer:(id)a4;
- (void)setCentralManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasReceivedWristState:(BOOL)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setMessageManager:(id)a3;
- (void)setPeripheral:(id)a3;
- (void)setPipeManager:(id)a3;
- (void)setWristState:(unsigned __int8)a3;
- (void)watchDidChangeWristState:(unsigned __int8)a3;
@end

@implementation ActiveWatchManager

- (ActiveWatchManager)initWithDelegate:(id)a3 activeDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ActiveWatchManager;
  v8 = [(ActiveWatchManager *)&v20 init];
  if (v8)
  {
    v9 = (void *)qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = [v7 UUIDString];
      *(_DWORD *)buf = 134218242;
      v22 = v8;
      __int16 v23 = 2112;
      v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Initializing (%p); Active device: (%@)",
        buf,
        0x16u);
    }
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v8->_deviceID, a4);
    id v12 = objc_alloc((Class)CBCentralManager);
    v13 = +[MagicSwitchEnabler sharedInstance];
    v14 = [v13 workQueue];
    v15 = (CBCentralManager *)[v12 initWithDelegate:v8 queue:v14];
    centralManager = v8->_centralManager;
    v8->_centralManager = v15;

    v17 = [[BTPipeManager alloc] initWithDelegate:v8 isServer:0];
    pipeManager = v8->_pipeManager;
    v8->_pipeManager = v17;
  }
  return v8;
}

- (void)dealloc
{
  if (!self->_invalidated) {
    [(ActiveWatchManager *)self invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)ActiveWatchManager;
  [(ActiveWatchManager *)&v3 dealloc];
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    objc_super v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Invalidating (%p)", (uint8_t *)&v7, 0xCu);
    }
    self->_invalidated = 1;
    objc_storeWeak((id *)&self->_delegate, 0);
    if ([(ActiveWatchManager *)self isConnecting]
      || [(ActiveWatchManager *)self isConnected])
    {
      [(ActiveWatchManager *)self disconnect];
    }
    [(MessageManager *)self->_messageManager invalidate];
    messageManager = self->_messageManager;
    self->_messageManager = 0;

    [(BTPipeManager *)self->_pipeManager invalidate];
    pipeManager = self->_pipeManager;
    self->_pipeManager = 0;

    [(CBCentralManager *)self->_centralManager setDelegate:0];
    centralManager = self->_centralManager;
    self->_centralManager = 0;
  }
}

- (BOOL)isConnected
{
  peripheral = self->_peripheral;
  if (peripheral) {
    LOBYTE(peripheral) = (id)[(CBPeripheral *)peripheral state] == (id)2;
  }
  return (char)peripheral;
}

- (unsigned)wristState
{
  unsigned int v3 = [(ActiveWatchManager *)self isConnected];
  if (v3) {
    LOBYTE(v3) = self->_wristState;
  }
  return v3;
}

- (BOOL)isConnecting
{
  peripheral = self->_peripheral;
  if (peripheral) {
    LOBYTE(peripheral) = (id)[(CBPeripheral *)peripheral state] == (id)1;
  }
  return (char)peripheral;
}

- (void)connect
{
  if ([(ActiveWatchManager *)self isConnecting])
  {
    unsigned int v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Already connecting", (uint8_t *)&v19, 2u);
    }
  }
  if ([(ActiveWatchManager *)self isConnected])
  {
    v4 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Already connected", (uint8_t *)&v19, 2u);
    }
  }
  if ([(CBCentralManager *)self->_centralManager state] == (id)5)
  {
    if (self->_peripheral) {
      goto LABEL_13;
    }
    centralManager = self->_centralManager;
    deviceID = self->_deviceID;
    id v6 = +[NSArray arrayWithObjects:&deviceID count:1];
    int v7 = [(CBCentralManager *)centralManager retrievePeripheralsWithIdentifiers:v6];

    v8 = [v7 firstObject];
    peripheral = self->_peripheral;
    self->_peripheral = v8;

    if (self->_peripheral)
    {
      v10 = (void *)qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_deviceID;
        id v12 = v10;
        v13 = [(NSUUID *)v11 UUIDString];
        int v19 = 138412290;
        objc_super v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Successfully resolved active peripheral with identifier: (%@)", (uint8_t *)&v19, 0xCu);
      }
    }

    if (self->_peripheral)
    {
LABEL_13:
      v14 = (void *)qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        v15 = self->_deviceID;
        v16 = v14;
        v17 = [(NSUUID *)v15 UUIDString];
        int v19 = 138412290;
        objc_super v20 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Telling CoreBluetooth to connect to peripheral: (%@)", (uint8_t *)&v19, 0xCu);
      }
      [(CBCentralManager *)self->_centralManager connectPeripheral:self->_peripheral options:0];
    }
    else
    {
      v18 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Failed connecting for now: could not lookup peripheral", (uint8_t *)&v19, 2u);
      }
    }
  }
}

- (void)disconnect
{
  if (![(ActiveWatchManager *)self isConnecting]
    && ![(ActiveWatchManager *)self isConnected])
  {
    unsigned int v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not connected or connecting", (uint8_t *)&v16, 2u);
    }
  }
  if (!self->_peripheral)
  {
    v4 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No peripheral", (uint8_t *)&v16, 2u);
    }
  }
  v5 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    deviceID = self->_deviceID;
    int v7 = v5;
    v8 = [(NSUUID *)deviceID UUIDString];
    int v16 = 138412290;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Disconnecting from %@", (uint8_t *)&v16, 0xCu);
  }
  unsigned int v9 = [(ActiveWatchManager *)self isConnected];
  if (self->_peripheral)
  {
    v10 = (void *)qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      peripheral = self->_peripheral;
      id v12 = v10;
      v13 = [(CBPeripheral *)peripheral identifier];
      v14 = [v13 UUIDString];
      int v16 = 138412290;
      v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Telling CoreBluetooth to cancel connection to peripheral %@", (uint8_t *)&v16, 0xCu);
    }
    [(CBCentralManager *)self->_centralManager cancelPeripheralConnection:self->_peripheral];
  }
  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained activeWatchDidChangeConnectionState];
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  v4 = (CBCentralManager *)a3;
  if (self->_centralManager != v4)
  {
    v5 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unknown central", (uint8_t *)&v12, 2u);
    }
  }
  int64_t v6 = (int64_t)[(CBCentralManager *)v4 state];
  int v7 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    unsigned int v9 = sub_100003A04(v6);
    int v12 = 138412290;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Central state changed (%@)", (uint8_t *)&v12, 0xCu);
  }
  if (v6 == 5)
  {
    if (![(ActiveWatchManager *)self isConnecting]
      && ![(ActiveWatchManager *)self isConnected])
    {
      [(ActiveWatchManager *)self connect];
    }
  }
  else
  {
    if (v6 <= 3)
    {
      peripheral = self->_peripheral;
      self->_peripheral = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained activeWatchDidChangeConnectionState];
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  int64_t v6 = (CBCentralManager *)a3;
  int v7 = (CBPeripheral *)a4;
  if (self->_centralManager != v6)
  {
    v8 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unknown central", (uint8_t *)&v15, 2u);
    }
  }
  if (self->_peripheral != v7)
  {
    unsigned int v9 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unknown peripheral", (uint8_t *)&v15, 2u);
    }
  }
  v10 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    int v12 = [(CBPeripheral *)v7 identifier];
    v13 = [v12 UUIDString];
    int v15 = 138412290;
    int v16 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Central did connect peripheral (%@)", (uint8_t *)&v15, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained activeWatchDidChangeConnectionState];
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  v8 = (CBCentralManager *)a3;
  unsigned int v9 = (CBPeripheral *)a4;
  id v10 = a5;
  if (self->_centralManager != v8)
  {
    v11 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unknown central", (uint8_t *)&v18, 2u);
    }
  }
  if (self->_peripheral != v9)
  {
    int v12 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unknown peripheral", (uint8_t *)&v18, 2u);
    }
  }
  v13 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    int v15 = [(CBPeripheral *)v9 identifier];
    int v16 = [v15 UUIDString];
    v17 = [v10 localizedDescription];
    int v18 = 138412546;
    int v19 = v16;
    __int16 v20 = 2112;
    v21 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Central did fail to connect peripheral (%@) with error (%@)", (uint8_t *)&v18, 0x16u);
  }
  if (![(ActiveWatchManager *)self isConnecting]
    && ![(ActiveWatchManager *)self isConnected])
  {
    [(ActiveWatchManager *)self connect];
  }
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  v8 = (CBCentralManager *)a3;
  unsigned int v9 = (CBPeripheral *)a4;
  id v10 = a5;
  if (self->_centralManager != v8)
  {
    v11 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unknown central", (uint8_t *)&v19, 2u);
    }
  }
  if (self->_peripheral != v9)
  {
    int v12 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unknown peripheral", (uint8_t *)&v19, 2u);
    }
  }
  v13 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    int v15 = [(CBPeripheral *)v9 identifier];
    int v16 = [v15 UUIDString];
    v17 = [v10 localizedDescription];
    int v19 = 138412546;
    __int16 v20 = v16;
    __int16 v21 = 2112;
    v22 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Central manager did disconnect peripheral (%@) error (%@)", (uint8_t *)&v19, 0x16u);
  }
  if (![(ActiveWatchManager *)self isConnecting]
    && ![(ActiveWatchManager *)self isConnected])
  {
    [(ActiveWatchManager *)self connect];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained activeWatchDidChangeConnectionState];
}

- (void)pipe:(id)a3 didConnectToPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqual:self->_deviceID])
  {
    if (self->_messageManager)
    {
      v8 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Already has a message manager", (uint8_t *)&v14, 2u);
      }
    }
    unsigned int v9 = (void *)qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      v11 = [v7 UUIDString];
      int v14 = 138412290;
      int v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Pipe did connect active Watch: (%@)", (uint8_t *)&v14, 0xCu);
    }
    int v12 = [[MessageManager alloc] initWithDelegate:self pipe:v6];
    messageManager = self->_messageManager;
    self->_messageManager = v12;
  }
}

- (void)pipe:(id)a3 didDisconnectFromPeer:(id)a4
{
  id v5 = a4;
  if ([v5 isEqual:self->_deviceID])
  {
    id v6 = (void *)qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      v8 = [v5 UUIDString];
      int v10 = 138412290;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Pipe did disconnect peer: (%@)", (uint8_t *)&v10, 0xCu);
    }
    [(MessageManager *)self->_messageManager invalidate];
    messageManager = self->_messageManager;
    self->_messageManager = 0;
  }
}

- (void)watchDidChangeWristState:(unsigned __int8)a3
{
  int v3 = a3;
  id v5 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Active device has new wrist state: (%d)", (uint8_t *)v9, 8u);
  }
  uint64_t wristState = self->_wristState;
  if (!self->_hasReceivedWristState || wristState != v3)
  {
    self->_uint64_t wristState = v3;
    self->_hasReceivedWristState = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained activeWatchDidChangeWristStateWithPreviousWristState:wristState];
  }
}

- (NSUUID)deviceID
{
  return self->_deviceID;
}

- (void)setWristState:(unsigned __int8)a3
{
  self->_uint64_t wristState = a3;
}

- (ActiveWatchManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ActiveWatchManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasReceivedWristState
{
  return self->_hasReceivedWristState;
}

- (void)setHasReceivedWristState:(BOOL)a3
{
  self->_hasReceivedWristState = a3;
}

- (BTPipeManager)pipeManager
{
  return self->_pipeManager;
}

- (void)setPipeManager:(id)a3
{
}

- (MessageManager)messageManager
{
  return self->_messageManager;
}

- (void)setMessageManager:(id)a3
{
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_messageManager, 0);
  objc_storeStrong((id *)&self->_pipeManager, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end