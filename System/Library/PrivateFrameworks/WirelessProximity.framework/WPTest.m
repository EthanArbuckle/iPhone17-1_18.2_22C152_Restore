@interface WPTest
+ (int64_t)holdVouchers;
- (NSMutableDictionary)transfers;
- (WPTest)init;
- (WPTest)initWithDelegate:(id)a3 queue:(id)a4;
- (WPTestDelegate)delegate;
- (id)clientAsString;
- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4;
- (void)advertisingPendingOfType:(unsigned __int8)a3;
- (void)advertisingStartedOfType:(unsigned __int8)a3;
- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4;
- (void)central:(id)a3 subscribed:(BOOL)a4 toCharacteristic:(id)a5 inService:(id)a6;
- (void)connectToPeer:(id)a3 withOptions:(id)a4;
- (void)connectedDevice:(id)a3 withError:(id)a4 shouldDiscover:(BOOL)a5;
- (void)connectedDeviceOverLEPipe:(id)a3;
- (void)deviceDiscovered:(id)a3;
- (void)disconnectFromPeer:(id)a3;
- (void)disconnectedDevice:(id)a3 withError:(id)a4;
- (void)disconnectedDeviceOverLEPipe:(id)a3 withError:(id)a4;
- (void)invalidate;
- (void)receivedData:(id)a3 forCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6;
- (void)receivedData:(id)a3 fromEndpoint:(id)a4 forPeripheral:(id)a5;
- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4;
- (void)scanningStartedOfType:(unsigned __int8)a3;
- (void)scanningStoppedOfType:(unsigned __int8)a3;
- (void)sendData:(id)a3 toPeer:(id)a4;
- (void)sentData:(id)a3 toEndpoint:(id)a4 forPeripheral:(id)a5 withError:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setTransfers:(id)a3;
- (void)startAdvertisingOfType:(unsigned __int8)a3 data:(id)a4 priority:(int64_t)a5 mode:(int64_t)a6 options:(id)a7;
- (void)startScanningForType:(unsigned __int8)a3 data:(id)a4 mask:(id)a5 peers:(id)a6 scanMode:(int64_t)a7 rssi:(id)a8 duplicates:(BOOL)a9 scanCache:(BOOL)a10;
- (void)stateDidChange:(int64_t)a3;
- (void)stopAdvertisingOfType:(unsigned __int8)a3;
- (void)stopScanningForType:(unsigned __int8)a3;
@end

@implementation WPTest

- (WPTest)initWithDelegate:(id)a3 queue:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WPTest;
  v7 = [(WPClient *)&v15 initWithQueue:a4 machName:0];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    transfers = v8->_transfers;
    v8->_transfers = (NSMutableDictionary *)v9;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_5);
  }
  v11 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = [(WPTest *)v8 delegate];
    *(_DWORD *)buf = 134218240;
    v17 = v8;
    __int16 v18 = 2048;
    v19 = v13;
    _os_log_impl(&dword_2144AA000, v12, OS_LOG_TYPE_DEFAULT, "test initWithDelegate self: %p, delegate: %p", buf, 0x16u);
  }
  return v8;
}

- (WPTest)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF488];
  v5 = NSStringFromSelector(a2);
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v3 raise:v4, @"%@ is not a valid initializer for %@", v5, v7 format];

  return 0;
}

+ (int64_t)holdVouchers
{
  return 2;
}

- (id)clientAsString
{
  return @"WPTest";
}

- (void)invalidate
{
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_151_0);
  }
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2144AA000, v3, OS_LOG_TYPE_DEFAULT, "test invalidate by client", buf, 2u);
  }
  [(WPTest *)self setDelegate:0];
  v5.receiver = self;
  v5.super_class = (Class)WPTest;
  [(WPClient *)&v5 unregisterEndpoint:@"wp.test"];
  v4.receiver = self;
  v4.super_class = (Class)WPTest;
  [(WPClient *)&v4 invalidate];
}

- (void)startAdvertisingOfType:(unsigned __int8)a3 data:(id)a4 priority:(int64_t)a5 mode:(int64_t)a6 options:(id)a7
{
  uint64_t v10 = a3;
  v31[1] = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a7;
  if (v12 && (unint64_t)[v12 length] < 0x17)
  {
    v14 = +[WPAdvertisingRequest requestForClientType:v10];
    [v14 setAdvertisingRate:a6];
    [v14 setConnectable:1];
    [v14 setAdvertisingData:v12];
    if (a5 == 1) {
      [v14 changePriorityValue:1];
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_169);
    }
    uint64_t v20 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v23 = v14;
      __int16 v24 = 2048;
      int64_t v25 = a5;
      __int16 v26 = 2048;
      int64_t v27 = a6;
      __int16 v28 = 2112;
      id v29 = v13;
      _os_log_impl(&dword_2144AA000, v20, OS_LOG_TYPE_DEFAULT, "test start advertising with data: %{public}@ priority %ld mode %ld options %@", buf, 0x2Au);
    }
    v21.receiver = self;
    v21.super_class = (Class)WPTest;
    [(WPClient *)&v21 startAdvertising:v14];
  }
  else
  {
    v14 = [NSString stringWithFormat:@"test can't start advertising of type: %ld because bad data: %@ was provided", v10, v12];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_161);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTest startAdvertisingOfType:data:priority:mode:options:]();
    }
    objc_super v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08320];
    v31[0] = v14;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    v17 = [v15 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v16];

    __int16 v18 = [(WPTest *)self delegate];
    LOBYTE(v16) = objc_opt_respondsToSelector();

    if (v16)
    {
      v19 = [(WPTest *)self delegate];
      [v19 test:self didFailToStartAdvertisingOfType:v10 withError:v17];
    }
  }
}

- (void)advertisingPendingOfType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_super v5 = [(WPTest *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_175);
    }
    v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_2144AA000, v7, OS_LOG_TYPE_INFO, "test advertising pending of type: %d", (uint8_t *)v9, 8u);
    }
    v8 = [(WPTest *)self delegate];
    [v8 test:self didDeferAdvertisingType:v3];
  }
}

- (void)advertisingStartedOfType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  objc_super v5 = [(WPTest *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_179_1);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPTest advertisingStartedOfType:]();
    }
    v7 = [(WPTest *)self delegate];
    [v7 test:self didStartAdvertisingType:v3];
  }
}

- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  v7 = [(WPTest *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_181);
    }
    uint64_t v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTest advertisingFailedToStart:ofType:](v4, v9, v6);
    }
    uint64_t v10 = [(WPTest *)self delegate];
    [v10 test:self didFailToStartAdvertisingOfType:v4 withError:v6];
  }
}

- (void)stopAdvertisingOfType:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_super v5 = +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:");
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_183);
  }
  id v6 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v9 = v3;
    _os_log_impl(&dword_2144AA000, v6, OS_LOG_TYPE_DEFAULT, "test stop advertising of type: %d", buf, 8u);
  }
  v7.receiver = self;
  v7.super_class = (Class)WPTest;
  [(WPClient *)&v7 stopAdvertising:v5];
}

- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_187);
  }
  objc_super v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    char v8 = v7;
    int v9 = [v6 localizedDescription];
    int v19 = 134218242;
    uint64_t v20 = v4;
    __int16 v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_2144AA000, v8, OS_LOG_TYPE_DEFAULT, "test advertising stopped of type: %ld with error: %@", (uint8_t *)&v19, 0x16u);
  }
  if (v6)
  {
    if ([v6 code] == 28)
    {
      uint64_t v10 = [(WPTest *)self delegate];
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_192);
        }
        id v12 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = v12;
          v14 = [v6 localizedDescription];
          int v19 = 134218242;
          uint64_t v20 = v4;
          __int16 v21 = 2112;
          v22 = v14;
          _os_log_impl(&dword_2144AA000, v13, OS_LOG_TYPE_DEFAULT, "[Privacy] test advertising stopped of type: %ld with error: %@", (uint8_t *)&v19, 0x16u);
        }
        objc_super v15 = [(WPTest *)self delegate];
        [v15 test:self didStopAdvertisingType:v4 withError:v6];
LABEL_19:
      }
    }
  }
  else
  {
    uint64_t v16 = [(WPTest *)self delegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_197_0);
      }
      __int16 v18 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        -[WPTest advertisingStoppedOfType:withError:](v4, v18);
      }
      objc_super v15 = [(WPTest *)self delegate];
      [v15 test:self didStopAdvertisingType:v4];
      goto LABEL_19;
    }
  }
}

- (void)startScanningForType:(unsigned __int8)a3 data:(id)a4 mask:(id)a5 peers:(id)a6 scanMode:(int64_t)a7 rssi:(id)a8 duplicates:(BOOL)a9 scanCache:(BOOL)a10
{
  uint64_t v14 = a3;
  v36[1] = *MEMORY[0x263EF8340];
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  uint64_t v20 = [v16 length];
  uint64_t v21 = [v17 length];
  if (v20 > 22 || v21 >= 23)
  {
    uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"test data (%ld bytes) or mask (%ld bytes) length is larger than the max length (22 bytes) for type: %ld", v20, v21, v14);
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_202);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTest startAdvertisingOfType:data:priority:mode:options:]();
    }
    __int16 v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v35 = *MEMORY[0x263F08320];
    v36[0] = v23;
    uint64_t v25 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
    __int16 v26 = [v24 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v25];

    int64_t v27 = [(WPTest *)self delegate];
    LOBYTE(v25) = objc_opt_respondsToSelector();

    if (v25)
    {
      __int16 v28 = [(WPTest *)self delegate];
      [v28 test:self didFailToStartScanningForType:v14 withError:v26];
    }
  }
  else
  {
    switch(a7)
    {
      case 5:
        uint64_t v22 = 966;
        break;
      case 40:
        uint64_t v22 = 30;
        break;
      case 30:
        uint64_t v22 = 40;
        break;
      default:
        uint64_t v22 = 300;
        break;
    }
    __int16 v26 = objc_opt_new();
    [v26 setClientType:v14];
    uint64_t v31 = v22;
    long long v32 = xmmword_2144DEB60;
    [v26 setScanningRates:&v31];
    if (v16) {
      [v26 setBlobValue:v16];
    }
    if (v17) {
      [v26 setMaskValue:v17];
    }
    if (v18) {
      [v26 setPeers:v18];
    }
    if (v19) {
      [v26 setRssiThreshold:v19];
    }
    [v26 setScanCache:a10];
    [v26 setAllowDuplicates:a9];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_208);
    }
    id v29 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v26;
      _os_log_impl(&dword_2144AA000, v29, OS_LOG_TYPE_DEFAULT, "test start scanning with data: %{public}@", buf, 0xCu);
    }
    v30.receiver = self;
    v30.super_class = (Class)WPTest;
    [(WPClient *)&v30 startScanning:v26];
  }
}

- (void)scanningStartedOfType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  objc_super v5 = [(WPTest *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_214);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPTest scanningStartedOfType:]();
    }
    objc_super v7 = [(WPTest *)self delegate];
    [v7 test:self didStartScanningForType:v3];
  }
}

- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  objc_super v7 = [(WPTest *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_216);
    }
    int v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTest scanningFailedToStart:ofType:](v4, v9, v6);
    }
    uint64_t v10 = [(WPTest *)self delegate];
    [v10 test:self didFailToStartScanningForType:v4 withError:v6];
  }
}

- (void)stopScanningForType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_super v5 = objc_opt_new();
  [v5 setClientType:v3];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_218);
  }
  id v6 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    int v9 = v5;
    _os_log_impl(&dword_2144AA000, v6, OS_LOG_TYPE_DEFAULT, "test stop scanning: %{public}@", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)WPTest;
  [(WPClient *)&v7 stopScanning:v5];
}

- (void)scanningStoppedOfType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  objc_super v5 = [(WPTest *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_224);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPTest scanningStoppedOfType:]();
    }
    objc_super v7 = [(WPTest *)self delegate];
    [v7 test:self didStopScanningForType:v3];
  }
}

- (void)deviceDiscovered:(id)a3
{
  v27[6] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [v4 objectForKeyedSubscript:@"kDevicePeripheralUUID"];
  char v6 = [v4 objectForKeyedSubscript:@"kDeviceType"];
  unsigned __int8 v7 = [v6 integerValue];

  char v8 = [v4 objectForKeyedSubscript:@"kDeviceAdvertisingData"];
  int v9 = objc_msgSend(v8, "subdataWithRange:", 4, objc_msgSend(v8, "length") - 4);

  if (v5)
  {
    uint64_t v10 = [(WPTest *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      unsigned __int8 v25 = v7;
      id v12 = [v4 objectForKeyedSubscript:@"kDeviceAddress"];
      uint64_t v13 = [v4 objectForKeyedSubscript:@"kDeviceManufacturerData"];
      uint64_t v14 = [v4 objectForKeyedSubscript:@"kDevicePaired"];
      v26[0] = @"address";
      uint64_t v15 = (uint64_t)v12;
      if (!v12)
      {
        uint64_t v15 = [MEMORY[0x263EFF8F8] data];
      }
      v27[0] = v15;
      v27[1] = v13;
      v26[1] = @"data";
      v26[2] = @"paired";
      id v16 = (void *)MEMORY[0x263EFFA80];
      if (v14) {
        id v16 = v14;
      }
      v27[2] = v16;
      v26[3] = @"rssi";
      id v17 = objc_msgSend(v4, "objectForKeyedSubscript:", @"kDeviceRSSI", v15);
      v27[3] = v17;
      v26[4] = @"channel";
      [v4 objectForKeyedSubscript:@"kDeviceChannel"];
      id v18 = v24 = (void *)v13;
      v27[4] = v18;
      v26[5] = @"time";
      id v19 = [v4 objectForKeyedSubscript:@"kDeviceTime"];
      v27[5] = v19;
      uint64_t v20 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:6];

      if (!v12) {
      uint64_t v21 = [(WPTest *)self delegate];
      }
      [v21 test:self didDiscoverType:v25 withData:v9 fromPeer:v5 peerInfo:v20];
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_226);
    }
    uint64_t v22 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTest deviceDiscovered:](v22);
    }
  }
}

- (void)connectToPeer:(id)a3 withOptions:(id)a4
{
  v37[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_252);
    }
    int v9 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTest connectToPeer:withOptions:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
    id v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    v37[0] = @"test no peer was provided!";
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
    id v19 = [v17 errorWithDomain:@"WPErrorDomain" code:6 userInfo:v18];

    uint64_t v20 = [(WPTest *)self delegate];
    LOBYTE(v18) = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0) {
      goto LABEL_21;
    }
    uint64_t v21 = [(WPTest *)self delegate];
    [v21 test:self didConnectToPeer:0 transport:0 error:v19];
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  if ([(WPClient *)self state] != 3)
  {
    uint64_t v22 = NSString;
    uint64_t v23 = [v6 UUIDString];
    __int16 v24 = +[WPClient stateAsString:[(WPClient *)self state]];
    id v19 = [v22 stringWithFormat:@"Can't connect to peer %@ when state is %@", v23, v24];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_261);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTest startAdvertisingOfType:data:priority:mode:options:]();
    }
    unsigned __int8 v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v34 = *MEMORY[0x263F08320];
    uint64_t v35 = v19;
    uint64_t v26 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    uint64_t v21 = [v25 errorWithDomain:@"WPErrorDomain" code:1 userInfo:v26];

    int64_t v27 = [(WPTest *)self delegate];
    LOBYTE(v26) = objc_opt_respondsToSelector();

    if (v26)
    {
      __int16 v28 = [(WPTest *)self delegate];
      [v28 test:self didConnectToPeer:v6 transport:0 error:v21];
    }
    goto LABEL_20;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_264);
  }
  char v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v31 = v6;
    __int16 v32 = 2112;
    id v33 = v7;
    _os_log_impl(&dword_2144AA000, v8, OS_LOG_TYPE_DEFAULT, "test connect to peer  %{public}@ with options %@", buf, 0x16u);
  }
  v29.receiver = self;
  v29.super_class = (Class)WPTest;
  [(WPClient *)&v29 connectToPeer:v6 withOptions:v7];
LABEL_22:
}

- (void)connectedDevice:(id)a3 withError:(id)a4 shouldDiscover:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_268);
    }
    uint64_t v10 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = v8;
      _os_log_impl(&dword_2144AA000, v10, OS_LOG_TYPE_DEFAULT, "Test connected to device: %{public}@ over GATT", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_271);
    }
    uint64_t v11 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v8;
      __int16 v17 = 2114;
      id v18 = v9;
      _os_log_impl(&dword_2144AA000, v11, OS_LOG_TYPE_DEFAULT, "Test sending didConnectToPeer %@ with error %{public}@", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v12 = [(WPTest *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      uint64_t v14 = [(WPTest *)self delegate];
      [v14 test:self didConnectToPeer:v8 transport:1 error:v9];
    }
  }
}

- (void)connectedDeviceOverLEPipe:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_273);
  }
  BOOL v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_2144AA000, v5, OS_LOG_TYPE_DEFAULT, "test sending didConnectToPeer %@ over LEPipe", (uint8_t *)&v9, 0xCu);
  }
  id v6 = [(WPTest *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(WPTest *)self delegate];
    [v8 test:self didConnectToPeer:v4 transport:2 error:0];
  }
}

- (void)sendData:(id)a3 toPeer:(id)a4
{
  v44[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    uint64_t v19 = NSString;
    uint64_t v20 = [v7 UUIDString];
    id v10 = [v19 stringWithFormat:@"test no data was provided for peer: %@", v20];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_278);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTest startAdvertisingOfType:data:priority:mode:options:]();
    }
    uint64_t v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v43 = *MEMORY[0x263F08320];
    v44[0] = v10;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];
    char v13 = [v21 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v22];

    uint64_t v23 = [(WPTest *)self delegate];
    LOBYTE(v22) = objc_opt_respondsToSelector();

    if ((v22 & 1) == 0) {
      goto LABEL_28;
    }
    int v15 = [(WPTest *)self delegate];
    id v16 = v15;
    __int16 v17 = self;
    id v18 = 0;
    goto LABEL_16;
  }
  if (v7)
  {
    uint64_t v9 = [v6 length];
    if ((unint64_t)(v9 - 60001) > 0xFFFFFFFFFFFF159FLL)
    {
      __int16 v38 = v9;
      id v10 = [MEMORY[0x263EFF990] dataWithBytes:&v38 length:2];
      [v10 appendData:v6];
      char v13 = objc_opt_new();
      [v13 setData:v10];
      uint64_t v35 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"AF0BADB1-5B99-43CD-917A-A77BC549E3CC"];
      [v13 setUuid:v35];

      [v13 setWriteType:0];
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_298);
      }
      uint64_t v36 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        -[WPTest sendData:toPeer:].cold.4(v36, v10, v8);
      }
      v37.receiver = self;
      v37.super_class = (Class)WPTest;
      [(WPClient *)&v37 sendDataToCharacteristic:v13 inService:@"9FA480E0-4967-4542-9390-D343DC5D04AE" forPeer:v8];
      goto LABEL_28;
    }
    id v10 = objc_msgSend(NSString, "stringWithFormat:", @"test data length is invalid %ld (max: %lu)", v9, 60000);
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_292);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTest startAdvertisingOfType:data:priority:mode:options:]();
    }
    uint64_t v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F08320];
    v40 = v10;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    char v13 = [v11 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v12];

    uint64_t v14 = [(WPTest *)self delegate];
    LOBYTE(v12) = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0)
    {
LABEL_28:

      goto LABEL_29;
    }
    int v15 = [(WPTest *)self delegate];
    id v16 = v15;
    __int16 v17 = self;
    id v18 = v6;
LABEL_16:
    [v15 test:v17 didSendData:v18 toPeer:v8 error:v13];

    goto LABEL_28;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_286);
  }
  __int16 v24 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPTest sendData:toPeer:](v24, v25, v26, v27, v28, v29, v30, v31);
  }
  __int16 v32 = (void *)MEMORY[0x263F087E8];
  uint64_t v41 = *MEMORY[0x263F08320];
  v42 = @"test no peer was provided";
  uint64_t v33 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  id v10 = [v32 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v33];

  uint64_t v34 = [(WPTest *)self delegate];
  LOBYTE(v33) = objc_opt_respondsToSelector();

  if (v33)
  {
    char v13 = [(WPTest *)self delegate];
    [v13 test:self didSendData:v6 toPeer:0 error:v10];
    goto LABEL_28;
  }
LABEL_29:
}

- (void)sentData:(id)a3 toEndpoint:(id)a4 forPeripheral:(id)a5 withError:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11 && ![v11 isEqualToString:@"wp.test"])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_305);
    }
    uint64_t v19 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = v19;
      uint64_t v21 = [v12 UUIDString];
      uint64_t v22 = [v13 localizedDescription];
      int v23 = 138412802;
      id v24 = v11;
      __int16 v25 = 2112;
      uint64_t v26 = v21;
      __int16 v27 = 2112;
      uint64_t v28 = v22;
      _os_log_error_impl(&dword_2144AA000, v20, OS_LOG_TYPE_ERROR, "test Sent data to a endpoint: %@ to peer: %@ with error: %@ that isn't of type test", (uint8_t *)&v23, 0x20u);
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_302);
    }
    uint64_t v14 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_2144AA000, v14, OS_LOG_TYPE_DEFAULT, "test didSendData over LE pipe", (uint8_t *)&v23, 2u);
    }
    int v15 = [(WPTest *)self delegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      if ((unint64_t)[v10 length] >= 2)
      {
        uint64_t v17 = objc_msgSend(v10, "subdataWithRange:", 2, objc_msgSend(v10, "length") - 2);

        id v10 = (id)v17;
      }
      id v18 = [(WPTest *)self delegate];
      [v18 test:self didSendData:v10 toPeer:v12 error:v13];
    }
  }
}

- (void)receivedData:(id)a3 forCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  if (!((unint64_t)a4 | (unint64_t)a5))
  {
    id v12 = [(WPTest *)self transfers];
    id v13 = [v12 objectForKeyedSubscript:v11];

    if (!v13)
    {
      id v14 = [[WPDataTransfer alloc] initDataTransferForPeer:v11];
      int v15 = [(WPTest *)self transfers];
      [v15 setObject:v14 forKeyedSubscript:v11];

      char v16 = [(WPTest *)self transfers];
      id v13 = [v16 objectForKeyedSubscript:v11];
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_308);
    }
    uint64_t v17 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPTest receivedData:forCharacteristic:inService:forPeripheral:](v10, v17);
    }
    if ([v13 addNewData:v10])
    {
      kdebug_trace();
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_311);
      }
      id v18 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = v18;
        uint64_t v20 = [v13 currentReceivedData];
        int v26 = 134217984;
        uint64_t v27 = [v20 length];
        _os_log_impl(&dword_2144AA000, v19, OS_LOG_TYPE_INFO, "Test END receiving data of length %ld", (uint8_t *)&v26, 0xCu);
      }
      uint64_t v21 = [(WPTest *)self delegate];
      char v22 = objc_opt_respondsToSelector();

      if (v22)
      {
        int v23 = [(WPTest *)self delegate];
        id v24 = [v13 currentReceivedData];
        __int16 v25 = (void *)[v24 copy];
        [v23 test:self didReceiveData:v25 fromPeer:v11];
      }
      [v13 resetTransfer];
    }
  }
}

- (void)receivedData:(id)a3 fromEndpoint:(id)a4 forPeripheral:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  if ([a4 isEqualToString:@"wp.test"]) {
    [(WPTest *)self receivedData:v9 forCharacteristic:0 inService:0 forPeripheral:v8];
  }
}

- (void)central:(id)a3 subscribed:(BOOL)a4 toCharacteristic:(id)a5 inService:(id)a6
{
  BOOL v8 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([v11 isEqualToString:@"AF0BADB1-5B99-43CD-917A-A77BC549E3CC"]
    && ([v12 isEqualToString:@"9FA480E0-4967-4542-9390-D343DC5D04AE"] & 1) != 0)
  {
    if (v8)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_318);
      }
      id v13 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138543362;
        id v19 = v10;
        _os_log_impl(&dword_2144AA000, v13, OS_LOG_TYPE_DEFAULT, "test central connected to our device %{public}@, send Peripheral didConnect", (uint8_t *)&v18, 0xCu);
      }
      id v14 = [(WPTest *)self delegate];
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        char v16 = [(WPTest *)self delegate];
        [v16 test:self didConnectToPeer:v10 transport:1 error:0];
      }
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_321);
      }
      uint64_t v17 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_2144AA000, v17, OS_LOG_TYPE_DEFAULT, "Saw unsubscribe...disconnection pending", (uint8_t *)&v18, 2u);
      }
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_315);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTest central:subscribed:toCharacteristic:inService:]();
    }
  }
}

- (void)disconnectFromPeer:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_331);
    }
    BOOL v5 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v4;
      _os_log_impl(&dword_2144AA000, v5, OS_LOG_TYPE_DEFAULT, "test disconnect from peer: %{public}@", buf, 0xCu);
    }
    v19.receiver = self;
    v19.super_class = (Class)WPTest;
    [(WPClient *)&v19 disconnectFromPeer:v4];
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_326);
    }
    id v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTest disconnectFromPeer:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
    id v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263F08320];
    v23[0] = @"test peer is null";
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    char v16 = [v14 errorWithDomain:@"WPErrorDomain" code:7 userInfo:v15];

    uint64_t v17 = [(WPTest *)self delegate];
    LOBYTE(v15) = objc_opt_respondsToSelector();

    if (v15)
    {
      int v18 = [(WPTest *)self delegate];
      [v18 test:self didDisconnectFromPeer:0 error:v16];
    }
  }
}

- (void)disconnectedDevice:(id)a3 withError:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = NSString;
    uint64_t v9 = [v6 UUIDString];
    uint64_t v10 = [v7 localizedDescription];
    uint64_t v11 = [v8 stringWithFormat:@"test peer: %@ is disconnected with error: %@", v9, v10];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_338);
    }
    uint64_t v12 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v11;
      _os_log_impl(&dword_2144AA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - send didDisconnect", buf, 0xCu);
    }
  }
  uint64_t v13 = [(WPTest *)self transfers];
  id v14 = [v13 objectForKeyedSubscript:v6];

  if (v14) {
    [v14 resetTransfer];
  }
  uint64_t v15 = [(WPTest *)self delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_341);
    }
    uint64_t v17 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_2144AA000, v17, OS_LOG_TYPE_DEFAULT, "test sending didDisconnectFromPeer %@ with error %@", buf, 0x16u);
    }
    int v18 = [(WPTest *)self delegate];
    [v18 test:self didDisconnectFromPeer:v6 error:v7];
  }
}

- (void)disconnectedDeviceOverLEPipe:(id)a3 withError:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_343);
  }
  uint64_t v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_2144AA000, v8, OS_LOG_TYPE_DEFAULT, "test disconnected %@ over LE pipe with error %@", (uint8_t *)&v9, 0x16u);
  }
  [(WPTest *)self disconnectedDevice:v6 withError:v7];
}

- (void)stateDidChange:(int64_t)a3
{
  int64_t v5 = [(WPClient *)self state];
  v11.receiver = self;
  v11.super_class = (Class)WPTest;
  [(WPClient *)&v11 stateDidChange:a3];
  if ([(WPClient *)self state] != v5)
  {
    if ([(WPClient *)self state] == 3)
    {
      v10.receiver = self;
      v10.super_class = (Class)WPTest;
      [(WPClient *)&v10 registerEndpoint:@"wp.test" requireAck:1 requireEncryption:0];
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)WPTest;
      [(WPClient *)&v9 unregisterEndpoint:@"wp.test"];
    }
    id v6 = [(WPTest *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      uint64_t v8 = [(WPTest *)self delegate];
      [v8 testDidUpdateState:self];
    }
  }
}

- (WPTestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WPTestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)transfers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTransfers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transfers, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)startAdvertisingOfType:data:priority:mode:options:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2144AA000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

- (void)advertisingStartedOfType:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2144AA000, v0, v1, "test advertising started of type: %d", v2, v3, v4, v5, v6);
}

- (void)advertisingFailedToStart:(void *)a3 ofType:.cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_2144AA000, v6, v7, "test advertising failed to start of type: %d with error: %@", v8, v9, v10, v11, v12);
}

- (void)advertisingStoppedOfType:(unsigned __int8)a1 withError:(NSObject *)a2 .cold.1(unsigned __int8 a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2144AA000, a2, OS_LOG_TYPE_DEBUG, "test advertising stopped of type: %ld", (uint8_t *)&v2, 0xCu);
}

- (void)scanningStartedOfType:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2144AA000, v0, v1, "test started scanning of type: %d", v2, v3, v4, v5, v6);
}

- (void)scanningFailedToStart:(void *)a3 ofType:.cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_2144AA000, v6, v7, "test failed to start scanning of type: %d with error: %@", v8, v9, v10, v11, v12);
}

- (void)scanningStoppedOfType:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2144AA000, v0, v1, "test scanning stopped of type: %d", v2, v3, v4, v5, v6);
}

- (void)deviceDiscovered:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2144AA000, log, OS_LOG_TYPE_ERROR, "test Advert UUID not available", v1, 2u);
}

- (void)connectToPeer:(uint64_t)a3 withOptions:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendData:(uint64_t)a3 toPeer:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendData:(void *)a3 toPeer:.cold.4(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  [a2 length];
  uint8_t v12 = [a3 UUIDString];
  OUTLINED_FUNCTION_5(&dword_2144AA000, v6, v7, "test send data size %lu: %@ peer: %@", v8, v9, v10, v11, 2u);
}

- (void)receivedData:(void *)a1 forCharacteristic:(void *)a2 inService:forPeripheral:.cold.1(void *a1, void *a2)
{
  id v3 = a2;
  [a1 length];
  OUTLINED_FUNCTION_5(&dword_2144AA000, v4, v5, "Test received data %@ of length %ld from peer %@", v6, v7, v8, v9, 2u);
}

- (void)central:subscribed:toCharacteristic:inService:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_2144AA000, v1, OS_LOG_TYPE_ERROR, "test received subscription notification of characteristic: %@, service: %@ is not of type test", v2, 0x16u);
}

- (void)disconnectFromPeer:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end