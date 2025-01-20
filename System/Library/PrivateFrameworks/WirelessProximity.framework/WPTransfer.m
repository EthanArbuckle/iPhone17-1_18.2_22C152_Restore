@interface WPTransfer
- (BOOL)advertiserConnected;
- (BOOL)advertising;
- (BOOL)connectedToPeripheral;
- (BOOL)scanning;
- (BOOL)sendingTransferComplete;
- (BOOL)sentEOM;
- (BOOL)unsubscribeComing;
- (NSMutableData)notificationData;
- (NSMutableSet)ignoredDevices;
- (NSUUID)currentPeripheralUUID;
- (NSUUID)currentlySubscribedCentral;
- (WPTransfer)initWithDelegate:(id)a3 queue:(id)a4;
- (WPTransfer)initWithDelegate:(id)a3 queue:(id)a4 machName:(id)a5;
- (WPTransfer)initWithDelegate:(id)a3 queue:(id)a4 machName:(id)a5 options:(id)a6;
- (WPTransferDelegate)delegate;
- (id)clientAsString;
- (int64_t)lockScanTimer;
- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4;
- (void)central:(id)a3 subscribed:(BOOL)a4 toCharacteristic:(id)a5 inService:(id)a6;
- (void)connectedDevice:(id)a3 withError:(id)a4 shouldDiscover:(BOOL)a5;
- (void)dealloc;
- (void)deviceDiscovered:(id)a3;
- (void)disconnectedDevice:(id)a3 withError:(id)a4;
- (void)discoveredCharacteristicsAndServices:(id)a3 forPeripheral:(id)a4;
- (void)ignoreDevice;
- (void)invalidate;
- (void)populateClientGATT:(id)a3;
- (void)receivedData:(id)a3;
- (void)receivedData:(id)a3 forCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6;
- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4;
- (void)sentData:(id)a3 forCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6 withError:(id)a7;
- (void)setAdvertiserConnected:(BOOL)a3;
- (void)setAdvertising:(BOOL)a3;
- (void)setConnectedToPeripheral:(BOOL)a3;
- (void)setCurrentPeripheralUUID:(id)a3;
- (void)setCurrentlySubscribedCentral:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIgnoredDevices:(id)a3;
- (void)setLockScanTimer:(int64_t)a3;
- (void)setNotificationData:(id)a3;
- (void)setScanning:(BOOL)a3;
- (void)setSendingTransferComplete:(BOOL)a3;
- (void)setSentEOM:(BOOL)a3;
- (void)setUnsubscribeComing:(BOOL)a3;
- (void)startAdvertising;
- (void)startScan;
- (void)stateDidChange:(int64_t)a3;
- (void)stopAdvertising;
- (void)stopScan;
- (void)transferFailed:(id)a3;
- (void)updatedNotificationState:(BOOL)a3 forCharacteristic:(id)a4 inService:(id)a5 withPeripheral:(id)a6;
@end

@implementation WPTransfer

- (WPTransfer)initWithDelegate:(id)a3 queue:(id)a4 machName:(id)a5 options:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v25.receiver = self;
  v25.super_class = (Class)WPTransfer;
  v13 = [(WPClient *)&v25 initWithQueue:a4 machName:v11];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v10);
    v14->_advertising = 0;
    v14->_scanning = 0;
    v14->_connectedToPeripheral = 0;
    uint64_t v15 = [MEMORY[0x263EFF9C0] set];
    ignoredDevices = v14->_ignoredDevices;
    v14->_ignoredDevices = (NSMutableSet *)v15;

    uint64_t v17 = [MEMORY[0x263EFF990] data];
    notificationData = v14->_notificationData;
    v14->_notificationData = (NSMutableData *)v17;

    v14->_sentEOM = 0;
    v14->_sendingTransferComplete = 0;
    v19 = [v12 objectForKeyedSubscript:@"WPTimeAfterUnlock"];
    v20 = v19;
    if (v19) {
      v19 = (void *)[v19 integerValue];
    }
    v14->_lockScanTimer = (int64_t)v19;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_10);
  }
  v21 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    v23 = [(WPTransfer *)v14 delegate];
    *(_DWORD *)buf = 134218498;
    v27 = v14;
    __int16 v28 = 2114;
    id v29 = v11;
    __int16 v30 = 2048;
    v31 = v23;
    _os_log_impl(&dword_2144AA000, v22, OS_LOG_TYPE_DEFAULT, "ATVSetup initWithDelegate self: %p with machName: %{public}@, delegate: %p", buf, 0x20u);
  }
  return v14;
}

- (WPTransfer)initWithDelegate:(id)a3 queue:(id)a4 machName:(id)a5
{
  return [(WPTransfer *)self initWithDelegate:a3 queue:a4 machName:a5 options:0];
}

- (WPTransfer)initWithDelegate:(id)a3 queue:(id)a4
{
  return [(WPTransfer *)self initWithDelegate:a3 queue:a4 machName:0 options:0];
}

- (id)clientAsString
{
  return @"WPATVSetup";
}

- (void)invalidate
{
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_139);
  }
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2144AA000, v3, OS_LOG_TYPE_DEFAULT, "ATVSetup invalidate", buf, 2u);
  }
  [(WPTransfer *)self setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)WPTransfer;
  [(WPClient *)&v4 invalidate];
}

- (void)dealloc
{
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_143_0);
  }
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2144AA000, v3, OS_LOG_TYPE_DEFAULT, "ATVSetup dealloc", buf, 2u);
  }
  [(WPTransfer *)self invalidate];
  v4.receiver = self;
  v4.super_class = (Class)WPTransfer;
  [(WPClient *)&v4 dealloc];
}

- (void)startScan
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2144AA000, v0, v1, "Using custom ATVSetup RSSI cutoff value of %@ dBm", v2, v3, v4, v5, v6);
}

- (void)stopScan
{
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_169_0);
  }
  uint64_t v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2144AA000, v3, OS_LOG_TYPE_DEFAULT, "ATVSetup stop scanning for ATV Setup", buf, 2u);
  }
  uint64_t v4 = objc_opt_new();
  [v4 setClientType:4];
  v5.receiver = self;
  v5.super_class = (Class)WPTransfer;
  [(WPClient *)&v5 stopScanning:v4];
  [(WPTransfer *)self setScanning:0];
}

- (void)populateClientGATT:(id)a3
{
}

- (void)startAdvertising
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = @"ATVSetup advertising is not supported on this platform";
  _os_log_error_impl(&dword_2144AA000, log, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v1, 0xCu);
}

- (void)stopAdvertising
{
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_173_0);
  }
  uint64_t v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2144AA000, v3, OS_LOG_TYPE_DEFAULT, "ATVSetup stop advertising for ATV Setup", buf, 2u);
  }
  uint64_t v4 = +[WPAdvertisingRequest requestForClientType:4];
  v5.receiver = self;
  v5.super_class = (Class)WPTransfer;
  [(WPClient *)&v5 stopAdvertising:v4];
  [(WPTransfer *)self setAdvertising:0];
}

- (void)ignoreDevice
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(WPTransfer *)self currentPeripheralUUID];

  if (v3)
  {
    uint64_t v4 = [(WPTransfer *)self ignoredDevices];
    objc_super v5 = [(WPTransfer *)self currentPeripheralUUID];
    [v4 addObject:v5];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_178);
    }
    uint8_t v6 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = [(WPTransfer *)self currentPeripheralUUID];
      int v9 = 138543362;
      id v10 = v8;
      _os_log_impl(&dword_2144AA000, v7, OS_LOG_TYPE_DEFAULT, "ATVSetup Ignoring device %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  id v5 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_180_0);
  }
  uint8_t v6 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPTransfer advertisingFailedToStart:ofType:](v6);
  }
  [(WPTransfer *)self setAdvertising:0];
  v7 = [(WPTransfer *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v9 = [(WPTransfer *)self delegate];
    [v9 transferDidFailToStartAdvertising:v5];
  }
}

- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  id v5 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_184_1);
  }
  uint8_t v6 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPTransfer scanningFailedToStart:ofType:](v6);
  }
  [(WPTransfer *)self setScanning:0];
  v7 = [(WPTransfer *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v9 = [(WPTransfer *)self delegate];
    [v9 transferDidFailToStartScanning:v5];
  }
}

- (void)deviceDiscovered:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"kDeviceRSSI"];
  id v5 = [v3 objectForKeyedSubscript:@"kDevicePeripheralUUID"];
  uint8_t v6 = [v3 objectForKeyedSubscript:@"kDeviceName"];
  v7 = [v3 objectForKeyedSubscript:@"kDeviceAdvertisingData"];
  char v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v9 = [v8 persistentDomainForName:@"com.apple.MobileBluetooth.debug"];
  id v10 = [v9 objectForKeyedSubscript:@"WIPROX"];

  uint64_t v11 = [v10 objectForKeyedSubscript:@"ATVCutoff"];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_188_0);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPTransfer startScan]();
    }
  }
  else
  {
    id v13 = &unk_26C53DFE0;
  }
  uint64_t v14 = [v4 integerValue];
  if (v14 >= [v13 integerValue] && objc_msgSend(v4, "integerValue") <= 0)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_191);
    }
    uint64_t v15 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    {
      v24 = v15;
      objc_super v25 = [(WPTransfer *)self clientAsString];
      *(_DWORD *)buf = 138412802;
      uint64_t v32 = v25;
      __int16 v33 = 2112;
      v34 = v6;
      __int16 v35 = 2112;
      id v36 = v7;
      _os_log_debug_impl(&dword_2144AA000, v24, OS_LOG_TYPE_DEBUG, "ATVSetup %@ evaluating %@ (data: %@)", buf, 0x20u);
    }
    if ([v7 length])
    {
      id v16 = v7;
      if (*(unsigned char *)([v16 bytes] + 4))
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_194);
        }
        uint64_t v17 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v32 = v6;
          __int16 v33 = 2112;
          v34 = v4;
          __int16 v35 = 2112;
          id v36 = v16;
          _os_log_debug_impl(&dword_2144AA000, v17, OS_LOG_TYPE_DEBUG, "ATVSetup Discovered %@ (%@), but advertising packet (%@) indicates it will use nearby info. Discontinuing legacy setup.", buf, 0x20u);
        }
        goto LABEL_9;
      }
    }
    v18 = [(WPTransfer *)self ignoredDevices];
    int v19 = [v18 containsObject:v5];

    if (v19)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_197_1);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        -[WPTransfer deviceDiscovered:]();
      }
      goto LABEL_9;
    }
    id obj = [(WPTransfer *)self currentPeripheralUUID];
    objc_sync_enter(obj);
    v20 = [(WPTransfer *)self currentPeripheralUUID];
    BOOL v21 = v20 == 0;

    if (v21)
    {
      v22 = [(WPTransfer *)self currentPeripheralUUID];
      int v23 = [v22 isEqual:v5];

      if (!v23)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_206);
        }
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
          -[WPTransfer deviceDiscovered:]();
        }
        -[WPTransfer setCurrentPeripheralUUID:](self, "setCurrentPeripheralUUID:", v5, obj);
        objc_sync_exit(obja);

        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_209);
        }
        v26 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v32 = v6;
          __int16 v33 = 2114;
          v34 = v4;
          _os_log_impl(&dword_2144AA000, v26, OS_LOG_TYPE_DEFAULT, "ATVSetup trying to connect to %{public}@ (%{public}@)", buf, 0x16u);
        }
        v30.receiver = self;
        v30.super_class = (Class)WPTransfer;
        [(WPClient *)&v30 connectToPeer:v5];
        goto LABEL_9;
      }
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_203_0);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPTransfer deviceDiscovered:]();
      }
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_200_1);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        -[WPTransfer deviceDiscovered:].cold.4();
      }
    }
    objc_sync_exit(obj);
  }
LABEL_9:
}

- (void)connectedDevice:(id)a3 withError:(id)a4 shouldDiscover:(BOOL)a5
{
  BOOL v5 = a5;
  v24[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(WPTransfer *)self currentPeripheralUUID];
  char v11 = [v8 isEqual:v10];

  if (v11)
  {
    if (v5)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_216_0);
      }
      id v12 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v8;
        _os_log_impl(&dword_2144AA000, v12, OS_LOG_TYPE_DEFAULT, "ATVSetup connected to device: %{public}@", buf, 0xCu);
      }
      int v23 = @"2AE5F669-81BB-435F-961C-EADD8A30AF07";
      id v13 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"6C251515-F290-4F91-808C-5123A0CD02E9", 0);
      v24[0] = v13;
      uint64_t v14 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];

      v18.receiver = self;
      v18.super_class = (Class)WPTransfer;
      [(WPClient *)&v18 discoverCharacteristicsAndServices:v14 forPeripheral:v8];
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_222_1);
      }
      uint64_t v15 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = v15;
        uint64_t v17 = [v9 localizedDescription];
        *(_DWORD *)buf = 138543618;
        id v20 = v8;
        __int16 v21 = 2114;
        v22 = v17;
        _os_log_impl(&dword_2144AA000, v16, OS_LOG_TYPE_DEFAULT, "ATVSetup connected to device: %{public}@ with error %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_213);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTransfer connectedDevice:withError:shouldDiscover:]();
    }
  }
}

- (void)disconnectedDevice:(id)a3 withError:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_224_0);
  }
  id v8 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = [v7 localizedDescription];
    int v15 = 138543618;
    id v16 = v6;
    __int16 v17 = 2114;
    objc_super v18 = v10;
    _os_log_impl(&dword_2144AA000, v9, OS_LOG_TYPE_DEFAULT, "ATVSetup disconnected from device: %{public}@ with error: %{public}@", (uint8_t *)&v15, 0x16u);
  }
  if (v7)
  {
    char v11 = [(WPTransfer *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = [(WPTransfer *)self delegate];
      [v13 transferDidFailWithError:v7];
    }
  }
  [(WPTransfer *)self setCurrentPeripheralUUID:0];
  [(WPTransfer *)self setConnectedToPeripheral:0];
  uint64_t v14 = [(WPTransfer *)self notificationData];
  [v14 setLength:0];
}

- (void)discoveredCharacteristicsAndServices:(id)a3 forPeripheral:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WPTransfer *)self currentPeripheralUUID];
  char v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = [v6 objectForKeyedSubscript:@"2AE5F669-81BB-435F-961C-EADD8A30AF07"];
    if (v10)
    {
      [(WPTransfer *)self setConnectedToPeripheral:1];
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_236);
      }
      char v11 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v6;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v7;
        _os_log_impl(&dword_2144AA000, v11, OS_LOG_TYPE_DEFAULT, "ATVSetup discovered characteristics and services: %{public}@ for peripheral: %{public}@", buf, 0x16u);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000;
      char v20 = 0;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __65__WPTransfer_discoveredCharacteristicsAndServices_forPeripheral___block_invoke_237;
      v17[3] = &unk_26420E870;
      v17[4] = buf;
      [v10 enumerateObjectsUsingBlock:v17];
      if (*(unsigned char *)(*(void *)&buf[8] + 24))
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_243);
        }
        char v12 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v16 = 0;
          _os_log_impl(&dword_2144AA000, v12, OS_LOG_TYPE_DEFAULT, "ATVSetup subscribing to ATV setup characteristic", v16, 2u);
        }
        v15.receiver = self;
        v15.super_class = (Class)WPTransfer;
        [(WPClient *)&v15 shouldSubscribe:1 toPeer:v7 withCharacteristic:@"6C251515-F290-4F91-808C-5123A0CD02E9" inService:@"2AE5F669-81BB-435F-961C-EADD8A30AF07"];
      }
      else
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_248_0);
        }
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
          -[WPTransfer discoveredCharacteristicsAndServices:forPeripheral:]();
        }
        v14.receiver = self;
        v14.super_class = (Class)WPTransfer;
        [(WPClient *)&v14 disconnectFromPeer:v7];
      }
      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_231_0);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPTransfer discoveredCharacteristicsAndServices:forPeripheral:]();
      }
      v18.receiver = self;
      v18.super_class = (Class)WPTransfer;
      [(WPClient *)&v18 disconnectFromPeer:v7];
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_228);
    }
    id v13 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTransfer discoveredCharacteristicsAndServices:forPeripheral:](v13, v7, self);
    }
  }
}

void __65__WPTransfer_discoveredCharacteristicsAndServices_forPeripheral___block_invoke_237(uint64_t a1, void *a2, unsigned char *a3)
{
  if ([a2 isEqualToString:@"6C251515-F290-4F91-808C-5123A0CD02E9"])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_239_2);
    }
    BOOL v5 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_2144AA000, v5, OS_LOG_TYPE_DEFAULT, "ATVSetup found our characteristic, subsribe to it.", v6, 2u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)receivedData:(id)a3 forCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_super v14 = [v13 UUIDString];
  objc_super v15 = [(WPTransfer *)self currentPeripheralUUID];
  id v16 = [v15 UUIDString];
  if ([v14 isEqualToString:v16])
  {
  }
  else
  {
    BOOL v17 = [(WPTransfer *)self scanning];

    if (v17)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_250_0);
      }
      objc_super v18 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPTransfer receivedData:forCharacteristic:inService:forPeripheral:]((uint64_t)v13, v18, self);
      }
      goto LABEL_46;
    }
  }
  if ([v11 isEqualToString:@"6C251515-F290-4F91-808C-5123A0CD02E9"])
  {
    if ([v12 isEqualToString:@"2AE5F669-81BB-435F-961C-EADD8A30AF07"])
    {
      uint64_t v19 = (void *)[[NSString alloc] initWithData:v10 encoding:4];
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_260_0);
      }
      char v20 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = v20;
        v22 = [(WPTransfer *)self notificationData];
        *(_DWORD *)buf = 138543874;
        id v40 = v10;
        __int16 v41 = 2114;
        id v42 = v13;
        __int16 v43 = 2114;
        v44 = v22;
        _os_log_impl(&dword_2144AA000, v21, OS_LOG_TYPE_DEFAULT, "ATVSetup received data: %{public}@ from device: %{public}@, existing data: %{public}@", buf, 0x20u);
      }
      if ([v19 isEqualToString:@"EOM"])
      {
        int v23 = [(WPTransfer *)self notificationData];
        uint64_t v24 = [v23 length];

        if (v24)
        {
          objc_super v25 = [(WPTransfer *)self notificationData];
          [(WPTransfer *)self receivedData:v25];
        }
        v26 = [(WPTransfer *)self notificationData];
        [v26 setLength:0];
      }
      else if ([v19 isEqualToString:@"COMPLETE"])
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_263);
        }
        v27 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2144AA000, v27, OS_LOG_TYPE_DEFAULT, "ATVSetup COMPLETE", buf, 2u);
        }
        __int16 v28 = [(WPTransfer *)self notificationData];
        [v28 setLength:0];

        if ([(WPTransfer *)self scanning])
        {
          v36.receiver = self;
          v36.super_class = (Class)WPTransfer;
          [(WPClient *)&v36 disconnectFromPeer:v13];
        }
        else
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_266_0);
          }
          uint64_t v32 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2144AA000, v32, OS_LOG_TYPE_DEFAULT, "ATVSetup - We are peripheral, wait for central to get disconnected", buf, 2u);
          }
          [(WPTransfer *)self setUnsubscribeComing:1];
        }
      }
      else
      {
        if ([v19 isEqualToString:@"FAIL"])
        {
          uint64_t v37 = *MEMORY[0x263F08320];
          v38 = @"Received transfer fail message from the other side";
          id v29 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
          objc_super v30 = [MEMORY[0x263F087E8] errorWithDomain:@"WPErrorDomain" code:23 userInfo:v29];
          [(WPTransfer *)self transferFailed:v30];
          v31 = [(WPTransfer *)self notificationData];
          [v31 setLength:0];
        }
        else
        {
          __int16 v33 = [(WPTransfer *)self notificationData];
          [v33 appendData:v10];

          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_272_0);
          }
          v34 = (void *)WiProxLog;
          if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_45;
          }
          id v29 = v34;
          __int16 v35 = [(WPTransfer *)self notificationData];
          *(_DWORD *)buf = 138543618;
          id v40 = v10;
          __int16 v41 = 2114;
          id v42 = v35;
          _os_log_impl(&dword_2144AA000, v29, OS_LOG_TYPE_DEFAULT, "ATVSetup got new data %{public}@, data is now %{public}@", buf, 0x16u);
        }
      }
LABEL_45:

      goto LABEL_46;
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_256);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTransfer receivedData:forCharacteristic:inService:forPeripheral:]();
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_253);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTransfer receivedData:forCharacteristic:inService:forPeripheral:]();
    }
  }
LABEL_46:
}

- (void)receivedData:(id)a3
{
  v45[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(WPTransfer *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WPTransfer *)self delegate];
    id v8 = [v7 transferDidReceiveData:v4];

    if (v8)
    {
      if ((unint64_t)[v8 length] < 0xEA61)
      {
        if (![v8 length])
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_282_0);
          }
          __int16 v33 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
            -[WPTransfer receivedData:].cold.5(v33, v8);
          }
          id v12 = (void *)MEMORY[0x263F087E8];
          uint64_t v42 = *MEMORY[0x263F08320];
          __int16 v43 = @"Data too short to send";
          id v13 = NSDictionary;
          objc_super v14 = &v43;
          objc_super v15 = &v42;
          goto LABEL_50;
        }
      }
      else
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_276_1);
        }
        char v9 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
          -[WPTransfer receivedData:].cold.4(v9, v4);
        }
        id v10 = [(WPTransfer *)self delegate];
        char v11 = objc_opt_respondsToSelector();

        if (v11)
        {
          id v12 = (void *)MEMORY[0x263F087E8];
          uint64_t v44 = *MEMORY[0x263F08320];
          v45[0] = @"Data too long to send";
          id v13 = NSDictionary;
          objc_super v14 = (__CFString **)v45;
          objc_super v15 = &v44;
LABEL_50:
          v34 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:1];
          BOOL v17 = [v12 errorWithDomain:@"WPErrorDomain" code:23 userInfo:v34];

          __int16 v35 = [(WPTransfer *)self delegate];
          [v35 transferDidFailWithError:v17];

          goto LABEL_51;
        }
      }
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_288);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        -[WPTransfer receivedData:]();
      }
      [(WPTransfer *)self setSentEOM:0];
      BOOL v17 = objc_opt_new();
      objc_super v25 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"6C251515-F290-4F91-808C-5123A0CD02E9"];
      [v17 setUuid:v25];

      [v17 setData:v8];
      v26 = [(WPTransfer *)self currentPeripheralUUID];

      if (v26)
      {
        uint64_t v24 = [(WPTransfer *)self currentPeripheralUUID];
        [(WPClient *)&v39 sendDataToCharacteristic:v17, @"2AE5F669-81BB-435F-961C-EADD8A30AF07", v24, v36.receiver, v36.super_class, v37.receiver, v37.super_class, v38.receiver, v38.super_class, self, WPTransfer inService forPeer];
      }
      else
      {
        uint64_t v24 = [(WPTransfer *)self currentlySubscribedCentral];
        [(WPClient *)&v38 sendDataToCharacteristic:v17, @"2AE5F669-81BB-435F-961C-EADD8A30AF07", v24, v36.receiver, v36.super_class, v37.receiver, v37.super_class, self, WPTransfer, v39.receiver, v39.super_class inService forPeer];
      }
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_295_0);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPTransfer receivedData:]();
      }
      BOOL v17 = objc_opt_new();
      objc_super v18 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"6C251515-F290-4F91-808C-5123A0CD02E9"];
      [v17 setUuid:v18];

      uint64_t v19 = [@"COMPLETE" dataUsingEncoding:4];
      [v17 setData:v19];

      if ([(WPTransfer *)self advertiserConnected]
        && ([(WPTransfer *)self currentlySubscribedCentral],
            char v20 = objc_claimAutoreleasedReturnValue(),
            v20,
            v20))
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_298_2);
        }
        uint64_t v21 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          v22 = v21;
          int v23 = [(WPTransfer *)self currentlySubscribedCentral];
          *(_DWORD *)buf = 138543362;
          __int16 v41 = v23;
          _os_log_impl(&dword_2144AA000, v22, OS_LOG_TYPE_DEFAULT, "ATVSetup Peripheral sending transfer complete to Central: %{public}@", buf, 0xCu);
        }
        [v17 setProperties:1];
        uint64_t v24 = [(WPTransfer *)self currentlySubscribedCentral];
        [(WPClient *)&v37 sendDataToCharacteristic:v17, @"2AE5F669-81BB-435F-961C-EADD8A30AF07", v24, v36.receiver, v36.super_class, self, WPTransfer, v38.receiver, v38.super_class, v39.receiver, v39.super_class inService forPeer];
      }
      else
      {
        if (![(WPTransfer *)self connectedToPeripheral]
          || ([(WPTransfer *)self currentPeripheralUUID],
              v27 = objc_claimAutoreleasedReturnValue(),
              v27,
              !v27))
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_304);
          }
          uint64_t v32 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
            -[WPTransfer receivedData:](v32, self);
          }
          goto LABEL_51;
        }
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_301);
        }
        __int16 v28 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          id v29 = v28;
          objc_super v30 = [(WPTransfer *)self currentPeripheralUUID];
          v31 = [v30 UUIDString];
          *(_DWORD *)buf = 138543362;
          __int16 v41 = v31;
          _os_log_impl(&dword_2144AA000, v29, OS_LOG_TYPE_DEFAULT, "ATVSetup Central sending transfer complete to Peripheral: %{public}@", buf, 0xCu);
        }
        [v17 setProperties:0];
        [(WPTransfer *)self setSendingTransferComplete:1];
        uint64_t v24 = [(WPTransfer *)self currentPeripheralUUID];
        [(WPClient *)&v36 sendDataToCharacteristic:v17, @"2AE5F669-81BB-435F-961C-EADD8A30AF07", v24, self, WPTransfer, v37.receiver, v37.super_class, v38.receiver, v38.super_class, v39.receiver, v39.super_class inService forPeer];
      }
    }

LABEL_51:
    goto LABEL_52;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_307);
  }
  id v16 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPTransfer receivedData:].cold.6(v16, (uint64_t)self);
  }
LABEL_52:
}

- (void)sentData:(id)a3 forCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6 withError:(id)a7
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  if ([a4 isEqualToString:@"6C251515-F290-4F91-808C-5123A0CD02E9"])
  {
    if ([v10 isEqualToString:@"2AE5F669-81BB-435F-961C-EADD8A30AF07"])
    {
      if ([(WPTransfer *)self sendingTransferComplete])
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_315_0);
        }
        id v12 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2144AA000, v12, OS_LOG_TYPE_DEFAULT, "ATVSetup transfer is completed, disconnect", buf, 2u);
        }
        [(WPTransfer *)self setSendingTransferComplete:0];
        v28.receiver = self;
        v28.super_class = (Class)WPTransfer;
        [(WPClient *)&v28 shouldSubscribe:0 toPeer:v11 withCharacteristic:@"6C251515-F290-4F91-808C-5123A0CD02E9" inService:@"2AE5F669-81BB-435F-961C-EADD8A30AF07"];
        v27.receiver = self;
        v27.super_class = (Class)WPTransfer;
        [(WPClient *)&v27 disconnectFromPeer:v11];
      }
      else if ([(WPTransfer *)self sentEOM])
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_318_0);
        }
        id v13 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2144AA000, v13, OS_LOG_TYPE_DEFAULT, "ATVSetup already sent EOM, return", buf, 2u);
        }
      }
      else
      {
        [(WPTransfer *)self setSentEOM:1];
        objc_super v14 = objc_opt_new();
        objc_super v15 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"6C251515-F290-4F91-808C-5123A0CD02E9"];
        [v14 setUuid:v15];

        id v16 = [@"EOM" dataUsingEncoding:4];
        [v14 setData:v16];

        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_321_1);
        }
        BOOL v17 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v18 = v17;
          uint64_t v19 = [v14 data];
          char v20 = [(WPTransfer *)self currentPeripheralUUID];
          uint64_t v21 = [v20 UUIDString];
          v22 = [(WPTransfer *)self currentlySubscribedCentral];
          *(_DWORD *)buf = 138544130;
          objc_super v30 = v19;
          __int16 v31 = 2114;
          uint64_t v32 = v21;
          __int16 v33 = 2114;
          v34 = v22;
          __int16 v35 = 2048;
          objc_super v36 = self;
          _os_log_impl(&dword_2144AA000, v18, OS_LOG_TYPE_DEFAULT, "ATVSetup send data: %{public}@, peripheral: %{public}@, central: %{public}@, self: %p", buf, 0x2Au);
        }
        int v23 = [(WPTransfer *)self currentPeripheralUUID];

        if (v23)
        {
          uint64_t v24 = [(WPTransfer *)self currentPeripheralUUID];
          [(WPClient *)&v26 sendDataToCharacteristic:v14, @"2AE5F669-81BB-435F-961C-EADD8A30AF07", v24, v25.receiver, v25.super_class, self, WPTransfer inService forPeer];
        }
        else
        {
          uint64_t v24 = [(WPTransfer *)self currentlySubscribedCentral];
          [(WPClient *)&v25 sendDataToCharacteristic:v14, @"2AE5F669-81BB-435F-961C-EADD8A30AF07", v24, self, WPTransfer, v26.receiver, v26.super_class inService forPeer];
        }
      }
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_312_0);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPTransfer receivedData:forCharacteristic:inService:forPeripheral:]();
      }
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_309);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTransfer receivedData:forCharacteristic:inService:forPeripheral:]();
    }
  }
}

- (void)updatedNotificationState:(BOOL)a3 forCharacteristic:(id)a4 inService:(id)a5 withPeripheral:(id)a6
{
  BOOL v8 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v8)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_323);
    }
    id v13 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543618;
      id v15 = v10;
      __int16 v16 = 2114;
      id v17 = v11;
      _os_log_impl(&dword_2144AA000, v13, OS_LOG_TYPE_DEFAULT, "ATVSetup subscribed to characteristic %{public}@ for service %{public}@", (uint8_t *)&v14, 0x16u);
    }
    [(WPTransfer *)self receivedData:0];
  }
}

- (void)transferFailed:(id)a3
{
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_325);
  }
  BOOL v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPTransfer transferFailed:](v5);
  }
  uint64_t v6 = [(WPTransfer *)self delegate];
  if (v6)
  {
    id v7 = (void *)v6;
    BOOL v8 = [(WPTransfer *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(WPTransfer *)self delegate];
      [v10 transferDidFailWithError:v4];
    }
  }
}

- (void)central:(id)a3 subscribed:(BOOL)a4 toCharacteristic:(id)a5 inService:(id)a6
{
  BOOL v8 = a4;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v8)
  {
    uint64_t v13 = [(WPTransfer *)self currentlySubscribedCentral];
    if ((id)v13 == v10)
    {
    }
    else
    {
      int v14 = (void *)v13;
      id v15 = [(WPTransfer *)self currentlySubscribedCentral];

      if (v15)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_327_0);
        }
        __int16 v16 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = v16;
          uint64_t v18 = [(WPTransfer *)self currentlySubscribedCentral];
          *(_DWORD *)buf = 138543618;
          id v43 = v10;
          __int16 v44 = 2114;
          uint64_t v45 = v18;
          _os_log_impl(&dword_2144AA000, v17, OS_LOG_TYPE_DEFAULT, "ATVSetup central %{public}@ has subscribed, but %{public}@ is already subscribed.  Sending back invalid connection message", buf, 0x16u);
        }
        uint64_t v19 = objc_alloc_init(WPCharacteristic);
        char v20 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v11];
        [(WPCharacteristic *)v19 setUuid:v20];

        uint64_t v21 = [@"INV_CONNECTION" dataUsingEncoding:4];
        [(WPCharacteristic *)v19 setData:v21];

        v22 = [(WPTransfer *)self currentlySubscribedCentral];
        [(WPClient *)self sendDataToCharacteristic:v19 inService:v12 forPeer:v22];

        goto LABEL_45;
      }
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_330);
    }
    uint64_t v32 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v43 = v10;
      _os_log_impl(&dword_2144AA000, v32, OS_LOG_TYPE_DEFAULT, "ATVSetup Central %{public}@ subscribed to ATVSetup characteristic", buf, 0xCu);
    }
    [(WPTransfer *)self setCurrentlySubscribedCentral:v10];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_333);
    }
    __int16 v33 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2144AA000, v33, OS_LOG_TYPE_DEFAULT, "ATVSetup Client subscribed - transfer beginning", buf, 2u);
    }
    v34 = self;
    uint64_t v35 = 1;
LABEL_44:
    [(WPTransfer *)v34 setAdvertiserConnected:v35];
    goto LABEL_45;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_336);
  }
  int v23 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v43 = v10;
    _os_log_impl(&dword_2144AA000, v23, OS_LOG_TYPE_DEFAULT, "ATVSetup Central %{public}@ unsubscribed from ATVSetup characteristic", buf, 0xCu);
  }
  uint64_t v24 = [(WPTransfer *)self currentlySubscribedCentral];
  char v25 = [v24 isEqual:v10];

  if (v25)
  {
    [(WPTransfer *)self setCurrentlySubscribedCentral:0];
    objc_super v26 = [(WPTransfer *)self notificationData];
    [v26 setLength:0];

    if ([(WPTransfer *)self advertising])
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_342_0);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        -[WPTransfer central:subscribed:toCharacteristic:inService:]();
      }
      [(WPTransfer *)self startAdvertising];
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_345_0);
    }
    objc_super v27 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2144AA000, v27, OS_LOG_TYPE_DEFAULT, "ATVSetup client unsubscribed - we're done with this transaction", buf, 2u);
    }
    if ([(WPTransfer *)self unsubscribeComing])
    {
      objc_super v28 = [(WPTransfer *)self delegate];
      char v29 = objc_opt_respondsToSelector();

      if (v29)
      {
        objc_super v30 = [(WPTransfer *)self delegate];
        [v30 transferComplete];
      }
      [(WPTransfer *)self setUnsubscribeComing:0];
    }
    else
    {
      objc_super v36 = (void *)MEMORY[0x263F087E8];
      uint64_t v40 = *MEMORY[0x263F08320];
      __int16 v41 = @"Client unsubscribed before the transfer was complete";
      uint64_t v37 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      objc_super v38 = [v36 errorWithDomain:@"WPErrorDomain" code:23 userInfo:v37];

      objc_super v39 = [(WPTransfer *)self delegate];
      [v39 transferDidFailWithError:v38];
    }
    v34 = self;
    uint64_t v35 = 0;
    goto LABEL_44;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_339);
  }
  __int16 v31 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPTransfer central:subscribed:toCharacteristic:inService:]((uint64_t)v10, v31, self);
  }
LABEL_45:
}

- (void)stateDidChange:(int64_t)a3
{
  int64_t v5 = [(WPClient *)self state];
  v12.receiver = self;
  v12.super_class = (Class)WPTransfer;
  [(WPClient *)&v12 stateDidChange:a3];
  if (v5 != a3)
  {
    uint64_t v6 = [(WPTransfer *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      BOOL v8 = [(WPTransfer *)self delegate];
      [v8 transferDidUpdateAdvertiserState:self];
    }
    char v9 = [(WPTransfer *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(WPTransfer *)self delegate];
      [v11 transferDidUpdateScannerState:self];
    }
  }
}

- (WPTransferDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WPTransferDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)advertising
{
  return self->_advertising;
}

- (void)setAdvertising:(BOOL)a3
{
  self->_advertising = a3;
}

- (BOOL)scanning
{
  return self->_scanning;
}

- (void)setScanning:(BOOL)a3
{
  self->_scanning = a3;
}

- (BOOL)connectedToPeripheral
{
  return self->_connectedToPeripheral;
}

- (void)setConnectedToPeripheral:(BOOL)a3
{
  self->_connectedToPeripheral = a3;
}

- (BOOL)unsubscribeComing
{
  return self->_unsubscribeComing;
}

- (void)setUnsubscribeComing:(BOOL)a3
{
  self->_unsubscribeComing = a3;
}

- (BOOL)advertiserConnected
{
  return self->_advertiserConnected;
}

- (void)setAdvertiserConnected:(BOOL)a3
{
  self->_advertiserConnected = a3;
}

- (BOOL)sentEOM
{
  return self->_sentEOM;
}

- (void)setSentEOM:(BOOL)a3
{
  self->_sentEOM = a3;
}

- (NSUUID)currentPeripheralUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCurrentPeripheralUUID:(id)a3
{
}

- (NSMutableSet)ignoredDevices
{
  return (NSMutableSet *)objc_getProperty(self, a2, 136, 1);
}

- (void)setIgnoredDevices:(id)a3
{
}

- (NSMutableData)notificationData
{
  return (NSMutableData *)objc_getProperty(self, a2, 144, 1);
}

- (void)setNotificationData:(id)a3
{
}

- (NSUUID)currentlySubscribedCentral
{
  return (NSUUID *)objc_getProperty(self, a2, 152, 1);
}

- (void)setCurrentlySubscribedCentral:(id)a3
{
}

- (int64_t)lockScanTimer
{
  return self->_lockScanTimer;
}

- (void)setLockScanTimer:(int64_t)a3
{
  self->_lockScanTimer = a3;
}

- (BOOL)sendingTransferComplete
{
  return self->_sendingTransferComplete;
}

- (void)setSendingTransferComplete:(BOOL)a3
{
  self->_sendingTransferComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlySubscribedCentral, 0);
  objc_storeStrong((id *)&self->_notificationData, 0);
  objc_storeStrong((id *)&self->_ignoredDevices, 0);
  objc_storeStrong((id *)&self->_currentPeripheralUUID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)advertisingFailedToStart:(void *)a1 ofType:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "ATVSetup failed to start ATV Setup advertising with error:%@", v6, v7, v8, v9, v10);
}

- (void)scanningFailedToStart:(void *)a1 ofType:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "ATVSetup failed to start ATV Setup scanning with error:%@", v6, v7, v8, v9, v10);
}

- (void)deviceDiscovered:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_2144AA000, v0, OS_LOG_TYPE_DEBUG, "ATVSetup Discovered %@ (%@) but it's in the list of ignored devices", v1, 0x16u);
}

- (void)deviceDiscovered:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_0(&dword_2144AA000, v0, (uint64_t)v0, "ATVSetup redundant code hit. Discovered %@ (%@) but already trying to connect to it", v1);
}

- (void)deviceDiscovered:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2144AA000, v0, v1, "ATVSetup Setting current peripheral to %@", v2, v3, v4, v5, v6);
}

- (void)deviceDiscovered:.cold.4()
{
  OUTLINED_FUNCTION_5_0();
  _os_log_debug_impl(&dword_2144AA000, v0, OS_LOG_TYPE_DEBUG, "ATVSetup We've already sent a connection request, ignoring", v1, 2u);
}

- (void)connectedDevice:withError:shouldDiscover:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_0(&dword_2144AA000, v0, v1, "ATVSetup Being told we've connected to a device that we didn't request to connect to, ignoring", v2, v3, v4, v5, v6);
}

- (void)discoveredCharacteristicsAndServices:forPeripheral:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_0(&dword_2144AA000, v0, v1, "ATVSetup can't find the ATV Setup service. Disconnecting", v2, v3, v4, v5, v6);
}

- (void)discoveredCharacteristicsAndServices:forPeripheral:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_0(&dword_2144AA000, v0, v1, "ATVSetup characteristic wasn't found, disconnecting", v2, v3, v4, v5, v6);
}

- (void)discoveredCharacteristicsAndServices:(void *)a3 forPeripheral:.cold.3(void *a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  uint8_t v6 = [a2 UUIDString];
  uint64_t v7 = [a3 currentPeripheralUUID];
  uint64_t v8 = [v7 UUIDString];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_0(&dword_2144AA000, v5, v9, "ATVSetup being told we've connected to a device %@ that we didn't request to connect to, ignoring - current peripheral %@", v10);
}

- (void)receivedData:forCharacteristic:inService:forPeripheral:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_0(&dword_2144AA000, v0, v1, "ATVSetup data updated for a service we're not interested in", v2, v3, v4, v5, v6);
}

- (void)receivedData:forCharacteristic:inService:forPeripheral:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_0(&dword_2144AA000, v0, v1, "ATVSetup data updated for a characteristic we're not interested in", v2, v3, v4, v5, v6);
}

- (void)receivedData:(void *)a3 forCharacteristic:inService:forPeripheral:.cold.3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = a2;
  uint64_t v5 = [a3 currentPeripheralUUID];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_0(&dword_2144AA000, v4, v6, "ATVSetup data updated for a peripheral %@ we're not interested in %@", v7);
}

- (void)receivedData:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 currentlySubscribedCentral];
  uint64_t v5 = [a2 currentPeripheralUUID];
  int v6 = 138413058;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  __int16 v10 = 1024;
  int v11 = [a2 connectedToPeripheral];
  __int16 v12 = 1024;
  int v13 = [a2 advertiserConnected];
  _os_log_error_impl(&dword_2144AA000, v3, OS_LOG_TYPE_ERROR, "ATVSetup Error: Trying to close a transfer on a WPTransfer object that is neither advertising:%@ or scanning:%@ or connected:%d, advconnected: %d", (uint8_t *)&v6, 0x22u);
}

- (void)receivedData:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_0(&dword_2144AA000, v0, v1, "ATVSetup got a nil response from app, sending complete message and tearing down connection", v2, v3, v4, v5, v6);
}

- (void)receivedData:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2144AA000, v0, v1, "ATVSetup data received from app: %@", v2, v3, v4, v5, v6);
}

- (void)receivedData:(void *)a1 .cold.4(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  [a2 length];
  OUTLINED_FUNCTION_8();
  uint64_t v6 = 60000;
  OUTLINED_FUNCTION_6_0(&dword_2144AA000, v3, v4, "ATVSetup data length is too long %lu (Max: %ld", v5);
}

- (void)receivedData:(void *)a1 .cold.5(void *a1, void *a2)
{
  id v3 = a1;
  [a2 length];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "ATVSetup data length is too short %ld", v6, v7, v8, v9, v10);
}

- (void)receivedData:(void *)a1 .cold.6(void *a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a1;
  uint64_t v5 = [(id)OUTLINED_FUNCTION_9() delegate];
  OUTLINED_FUNCTION_8();
  uint64_t v8 = a2;
  OUTLINED_FUNCTION_6_0(&dword_2144AA000, v2, v6, "ATVSetup delegate: %p doesn't exist, self: %p", v7);
}

- (void)transferFailed:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "ATVSetup transfer failed with error: %@", v6, v7, v8, v9, v10);
}

- (void)central:subscribed:toCharacteristic:inService:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  _os_log_debug_impl(&dword_2144AA000, v0, OS_LOG_TYPE_DEBUG, "ATVSetup restart ATV advertisement", v1, 2u);
}

- (void)central:(void *)a3 subscribed:toCharacteristic:inService:.cold.2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = a2;
  uint64_t v5 = [a3 currentlySubscribedCentral];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_2144AA000, v4, OS_LOG_TYPE_DEBUG, "ATVSetup Warning: Central %@ did unsubscribe.  currentlySubscribedCentral is %@", v6, 0x16u);
}

@end