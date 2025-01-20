@interface WPContinuity
+ (int64_t)continuityTypeFromClientType:(unsigned __int8)a3;
+ (unsigned)clientTypeFromContinuityType:(int64_t)a3;
- (NSMutableDictionary)transfers;
- (WPContinuity)init;
- (WPContinuity)initWithDelegate:(id)a3 queue:(id)a4;
- (WPContinuityDelegate)delegate;
- (id)clientAsString;
- (int64_t)btBandwidthState;
- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4;
- (void)advertisingPendingOfType:(unsigned __int8)a3;
- (void)advertisingStartedOfType:(unsigned __int8)a3;
- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4;
- (void)bandwidthStateUpdated:(id)a3;
- (void)central:(id)a3 subscribed:(BOOL)a4 toCharacteristic:(id)a5 inService:(id)a6;
- (void)connectToPeer:(id)a3;
- (void)connectedDevice:(id)a3 withError:(id)a4 shouldDiscover:(BOOL)a5;
- (void)connectedDeviceOverLEPipe:(id)a3;
- (void)deviceDiscovered:(id)a3;
- (void)disconnectFromPeer:(id)a3;
- (void)disconnectedDevice:(id)a3 withError:(id)a4;
- (void)disconnectedDeviceOverLEPipe:(id)a3 withError:(id)a4;
- (void)discoveredCharacteristicsAndServices:(id)a3 forPeripheral:(id)a4;
- (void)failedToStartTrackingPeer:(id)a3 error:(id)a4;
- (void)foundPeer:(id)a3 ofType:(unsigned __int8)a4;
- (void)invalidate;
- (void)lostPeer:(id)a3 ofType:(unsigned __int8)a4;
- (void)peerTrackingAvailable;
- (void)peerTrackingFull;
- (void)populateClientGATT:(id)a3;
- (void)receivedData:(id)a3 forCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6;
- (void)receivedData:(id)a3 fromEndpoint:(id)a4 forPeripheral:(id)a5;
- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4;
- (void)scanningStartedOfType:(unsigned __int8)a3;
- (void)scanningStoppedOfType:(unsigned __int8)a3;
- (void)sendData:(id)a3 toPeer:(id)a4;
- (void)sentData:(id)a3 forCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6 withError:(id)a7;
- (void)sentData:(id)a3 toEndpoint:(id)a4 forPeripheral:(id)a5 withError:(id)a6;
- (void)setBtBandwidthState:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setTransfers:(id)a3;
- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 boostedScan:(BOOL)a7;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 boostedScan:(BOOL)a7 duplicates:(BOOL)a8;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 peers:(id)a5;
- (void)startTrackingPeer:(id)a3 forType:(int64_t)a4;
- (void)startedTrackingPeer:(id)a3 ofType:(unsigned __int8)a4;
- (void)stateDidChange:(int64_t)a3;
- (void)stopAdvertisingOfType:(int64_t)a3;
- (void)stopScanningForType:(int64_t)a3;
- (void)stopTrackingPeer:(id)a3 forType:(int64_t)a4;
- (void)stoppedTrackingPeer:(id)a3 ofType:(unsigned __int8)a4;
- (void)updateAdvertisingRequest:(id)a3 withUpdate:(id)a4;
- (void)updateScanningRequest:(id)a3 withUpdate:(id)a4;
- (void)updatedNotificationState:(BOOL)a3 forCharacteristic:(id)a4 inService:(id)a5 withPeripheral:(id)a6;
@end

@implementation WPContinuity

- (WPContinuity)initWithDelegate:(id)a3 queue:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (+[WPClient isHomePod])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_145);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPContinuity initWithDelegate:queue:]();
    }
    v8 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)WPContinuity;
    v9 = [(WPClient *)&v18 initWithQueue:v7 machName:0];
    v10 = v9;
    if (v9)
    {
      objc_storeWeak((id *)&v9->_delegate, v6);
      v10->_btBandwidthState = -1;
      uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
      transfers = v10->_transfers;
      v10->_transfers = (NSMutableDictionary *)v11;

      [(WPClient *)v10 setConnectionUseCase:6];
      v17.receiver = v10;
      v17.super_class = (Class)WPContinuity;
      [(WPClient *)&v17 listenToBandwidthNotifications];
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_7);
    }
    v13 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = [(WPContinuity *)v10 delegate];
      *(_DWORD *)buf = 134218240;
      v20 = v10;
      __int16 v21 = 2048;
      v22 = v15;
      _os_log_impl(&dword_2144AA000, v14, OS_LOG_TYPE_DEFAULT, "Continuity initWithDelegate self: %p, delegate: %p", buf, 0x16u);
    }
    self = v10;
    v8 = self;
  }

  return v8;
}

- (WPContinuity)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF488];
  v5 = NSStringFromSelector(a2);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v3 raise:v4, @"%@ is not a valid initializer for %@", v5, v7 format];

  return 0;
}

- (id)clientAsString
{
  return @"WPContinuity";
}

- (void)invalidate
{
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_154);
  }
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2144AA000, v3, OS_LOG_TYPE_DEFAULT, "Continuity invalidate by client", buf, 2u);
  }
  [(WPContinuity *)self setDelegate:0];
  v5.receiver = self;
  v5.super_class = (Class)WPContinuity;
  [(WPClient *)&v5 unregisterEndpoint:@"wp.continuity"];
  v4.receiver = self;
  v4.super_class = (Class)WPContinuity;
  [(WPClient *)&v4 invalidate];
}

+ (unsigned)clientTypeFromContinuityType:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", @"UnknownContinuityType", @"The continuity type isn't valid", 0, v3, v4);
    id v6 = objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return a3 + 12;
}

+ (int64_t)continuityTypeFromClientType:(unsigned __int8)a3
{
  if ((a3 - 12) >= 3)
  {
    uint64_t v4 = (void *)MEMORY[0x263EFF940];
    objc_super v5 = objc_msgSend(NSString, "stringWithFormat:", @"The client type %ld isn't valid", a3);
    id v6 = [v4 exceptionWithName:@"UnknownClientType" reason:v5 userInfo:0];

    objc_exception_throw(v6);
  }
  return (a3 - 12);
}

- (void)populateClientGATT:(id)a3
{
  uint64_t v3 = (void (**)(id, id, void *))a3;
  id v6 = (id)objc_opt_new();
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"8667556C-9A37-4C91-84ED-54EE27D90049"];
  [v6 setUuid:v4];

  [v6 setProperties:264];
  [v6 setPermissions:8];
  objc_super v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"D0611E78-BBB4-4591-A5F8-487910AE4366"];
  v3[2](v3, v6, v5);
}

- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = v6;
  if (v6 && [v6 length] && (unint64_t)objc_msgSend(v7, "length") < 0x17)
  {
    uint64_t v11 = +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", +[WPContinuity clientTypeFromContinuityType:a3]);
    [v11 setAdvertisingRate:48];
    [v11 setConnectable:1];
    [v11 setStopOnAdvertisingAddressChange:1];
    [v11 setAdvertisingData:v7];
    [v11 setUpdateTime:2.0];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_184_0);
    }
    v14 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      objc_super v17 = v11;
      _os_log_impl(&dword_2144AA000, v14, OS_LOG_TYPE_DEFAULT, "Continuity start advertising with data: %{public}@", buf, 0xCu);
    }
    v15.receiver = self;
    v15.super_class = (Class)WPContinuity;
    [(WPClient *)&v15 startAdvertising:v11];
  }
  else
  {
    v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F08320];
    uint64_t v9 = [NSString stringWithFormat:@"Bad data was provided: %@", v7];
    v19[0] = v9;
    v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    uint64_t v11 = [v8 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v10];

    v12 = [(WPContinuity *)self delegate];
    LOBYTE(v9) = objc_opt_respondsToSelector();

    if (v9)
    {
      v13 = [(WPContinuity *)self delegate];
      [v13 continuity:self didFailToStartAdvertisingOfType:a3 withError:v11];
    }
  }
}

- (void)updateAdvertisingRequest:(id)a3 withUpdate:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  [v5 setUpdateTime:0.0];
  [v5 setAdvertisingRate:290];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_188);
  }
  id v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_2144AA000, v7, OS_LOG_TYPE_DEFAULT, "Continuity update advertising with data: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  v6[2](v6, v5);
}

- (void)stopAdvertisingOfType:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = +[WPContinuity clientTypeFromContinuityType:a3];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_190_0);
  }
  id v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v9 = v4;
    _os_log_impl(&dword_2144AA000, v5, OS_LOG_TYPE_DEFAULT, "Continuity stop advertising of type: %d", buf, 8u);
  }
  id v6 = +[WPAdvertisingRequest requestForClientType:v4];
  v7.receiver = self;
  v7.super_class = (Class)WPContinuity;
  [(WPClient *)&v7 stopAdvertising:v6];
}

- (void)advertisingPendingOfType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [(WPContinuity *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_196);
    }
    objc_super v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_2144AA000, v7, OS_LOG_TYPE_INFO, "Continuity advertising pending of type: %d", (uint8_t *)v9, 8u);
    }
    int v8 = [(WPContinuity *)self delegate];
    objc_msgSend(v8, "continuityPendingAdvertisingOfType:advertisingType:", self, +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", v3));
  }
}

- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  objc_super v7 = [(WPContinuity *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_198);
    }
    int v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPContinuity advertisingFailedToStart:ofType:](v4, v9, v6);
    }
    uint64_t v10 = [(WPContinuity *)self delegate];
    objc_msgSend(v10, "continuity:didFailToStartAdvertisingOfType:withError:", self, +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", v4), v6);
  }
}

- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_200_0);
  }
  objc_super v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134218242;
    uint64_t v17 = v4;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_2144AA000, v7, OS_LOG_TYPE_DEFAULT, "Continuity advertising stopped of type: %ld with error: %@", (uint8_t *)&v16, 0x16u);
  }
  if (v6)
  {
    if ([v6 code] == 28)
    {
      char v8 = [(WPContinuity *)self delegate];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_205);
        }
        uint64_t v10 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = v10;
          v12 = [v6 localizedDescription];
          int v16 = 134218242;
          uint64_t v17 = v4;
          __int16 v18 = 2112;
          id v19 = v12;
          _os_log_impl(&dword_2144AA000, v11, OS_LOG_TYPE_DEFAULT, "[Privacy] Continuity advertising stopped of type: %ld with error: %@", (uint8_t *)&v16, 0x16u);
        }
        v13 = [(WPContinuity *)self delegate];
        objc_msgSend(v13, "continuityDidStopAdvertisingOfType:advertisingType:withError:", self, +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", v4), v6);
        goto LABEL_15;
      }
    }
  }
  else
  {
    v14 = [(WPContinuity *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      v13 = [(WPContinuity *)self delegate];
      objc_msgSend(v13, "continuityDidStopAdvertisingOfType:advertisingType:", self, +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", v4));
LABEL_15:
    }
  }
}

- (void)advertisingStartedOfType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v5 = [(WPContinuity *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_211);
    }
    objc_super v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPContinuity advertisingStartedOfType:](v3, v7);
    }
    char v8 = [(WPContinuity *)self delegate];
    objc_msgSend(v8, "continuityDidStartAdvertisingOfType:advertisingType:", self, +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", v3));
  }
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4
{
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 peers:(id)a5
{
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6
{
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 boostedScan:(BOOL)a7
{
  BOOL v7 = a7;
  id v21 = a4;
  id v12 = a5;
  id v13 = a6;
  if (a3 == 2)
  {
    v14 = self;
    uint64_t v15 = 2;
LABEL_7:
    id v16 = v21;
    id v17 = v12;
    id v18 = v13;
    BOOL v19 = v7;
    uint64_t v20 = 0;
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    v14 = self;
    uint64_t v15 = 1;
    goto LABEL_7;
  }
  if (a3) {
    goto LABEL_9;
  }
  v14 = self;
  uint64_t v15 = 0;
  id v16 = v21;
  id v17 = v12;
  id v18 = v13;
  BOOL v19 = v7;
  uint64_t v20 = 1;
LABEL_8:
  [(WPContinuity *)v14 startScanningForType:v15 withData:v16 mask:v17 peers:v18 boostedScan:v19 duplicates:v20];
LABEL_9:
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 boostedScan:(BOOL)a7 duplicates:(BOOL)a8
{
  BOOL v8 = a8;
  v36[1] = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = [v14 length];
  uint64_t v18 = [v15 length];
  if (v17 > 22 || v18 >= 23)
  {
    uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"Continuity data (%ld bytes) or mask (%ld bytes) length is larger than the max length (22 bytes) for type: %ld", v17, v18, a3);
    v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v35 = *MEMORY[0x263F08320];
    v36[0] = v20;
    uint64_t v25 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
    v26 = [v24 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v25];

    v27 = [(WPContinuity *)self delegate];
    LOBYTE(v25) = objc_opt_respondsToSelector();

    if (v25)
    {
      v28 = [(WPContinuity *)self delegate];
      [v28 continuity:self didFailToStartScanningForType:a3 WithError:v26];
    }
  }
  else
  {
    BOOL v19 = objc_opt_new();
    uint64_t v20 = v19;
    switch(a3)
    {
      case 2:
        uint64_t v21 = 14;
        if (a7) {
          goto LABEL_7;
        }
LABEL_13:
        uint64_t v22 = 0xFFFFLL;
        goto LABEL_14;
      case 1:
        uint64_t v21 = 13;
        uint64_t v22 = 966;
LABEL_14:
        uint64_t v23 = 300;
        goto LABEL_15;
      case 0:
        uint64_t v21 = 12;
        if (a7)
        {
LABEL_7:
          [v19 setUpdateTime:4.0];
          uint64_t v22 = 0xFFFFLL;
          uint64_t v23 = 60;
LABEL_15:
          [v20 setClientType:v21];
          [v20 setAllowDuplicates:v8];
          v32[0] = v23;
          v32[1] = v22;
          v32[2] = 30;
          [v20 setScanningRates:v32];
          if (v14) {
            [v20 setBlobValue:v14];
          }
          if (v15) {
            [v20 setMaskValue:v15];
          }
          if (v16) {
            [v20 setPeers:v16];
          }
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_225);
          }
          v29 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v34 = v20;
            _os_log_impl(&dword_2144AA000, v29, OS_LOG_TYPE_DEFAULT, "Continuity start scanning with data: %{public}@", buf, 0xCu);
          }
          v31.receiver = self;
          v31.super_class = (Class)WPContinuity;
          [(WPClient *)&v31 startScanning:v20];
          goto LABEL_31;
        }
        goto LABEL_13;
    }
    v30 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown continuity client type %ld", a3);
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_222_0);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTest startAdvertisingOfType:data:priority:mode:options:]();
    }
  }
LABEL_31:
}

- (void)updateScanningRequest:(id)a3 withUpdate:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char v6 = (void (**)(id, id))a4;
  [v5 setUpdateTime:0.0];
  long long v8 = xmmword_2144DEB00;
  uint64_t v9 = 30;
  [v5 setScanningRates:&v8];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_229);
  }
  BOOL v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v5;
    _os_log_impl(&dword_2144AA000, v7, OS_LOG_TYPE_DEFAULT, "Continuity update scanning request with data: %{public}@", buf, 0xCu);
  }
  v6[2](v6, v5);
}

- (void)stopScanningForType:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = objc_opt_new();
  objc_msgSend(v5, "setClientType:", +[WPContinuity clientTypeFromContinuityType:](WPContinuity, "clientTypeFromContinuityType:", a3));
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_231);
  }
  char v6 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v5;
    _os_log_impl(&dword_2144AA000, v6, OS_LOG_TYPE_DEFAULT, "Continuity stop scanning: %{public}@", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)WPContinuity;
  [(WPClient *)&v7 stopScanning:v5];
}

- (void)scanningStartedOfType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v5 = [(WPContinuity *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WPContinuity *)self delegate];
    objc_msgSend(v7, "continuityDidStartScanningForType:scanningType:", self, +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", v3));
  }
}

- (void)scanningStoppedOfType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v5 = [(WPContinuity *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WPContinuity *)self delegate];
    objc_msgSend(v7, "continuityDidStopScanningForType:scanningType:", self, +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", v3));
  }
}

- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [(WPContinuity *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_239_0);
    }
    uint64_t v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPContinuity scanningFailedToStart:ofType:](v4, v9, v6);
    }
    uint64_t v10 = [(WPContinuity *)self delegate];
    objc_msgSend(v10, "continuity:didFailToStartScanningForType:WithError:", self, +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", v4), v6);
  }
}

- (void)startTrackingPeer:(id)a3 forType:(int64_t)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263F087E8];
  uint64_t v12 = *MEMORY[0x263F08320];
  v13[0] = @"Continuity peer traking is unsupported";
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v9 = [v7 errorWithDomain:@"WPErrorDomain" code:17 userInfo:v8];

  uint64_t v10 = [(WPContinuity *)self delegate];
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if (v8)
  {
    id v11 = [(WPContinuity *)self delegate];
    [v11 continuityDidStartTrackingPeer:self peer:v6 type:a4 error:v9];
  }
}

- (void)startedTrackingPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v10 = a3;
  id v6 = [(WPContinuity *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int64_t v8 = +[WPContinuity continuityTypeFromClientType:v4];
    uint64_t v9 = [(WPContinuity *)self delegate];
    [v9 continuityDidStartTrackingPeer:self peer:v10 type:v8 error:0];
  }
}

- (void)failedToStartTrackingPeer:(id)a3 error:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(WPContinuity *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    int64_t v10 = +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", [v6 clientType]);
    id v11 = [v6 peerUUID];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_246);
    }
    uint64_t v12 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      id v14 = v12;
      id v15 = [v11 UUIDString];
      int v16 = [v6 clientType];
      uint64_t v17 = [v7 localizedDescription];
      int v18 = 138412802;
      BOOL v19 = v15;
      __int16 v20 = 1024;
      int v21 = v16;
      __int16 v22 = 2112;
      uint64_t v23 = v17;
      _os_log_error_impl(&dword_2144AA000, v14, OS_LOG_TYPE_ERROR, "Continuity failed to start tracking peer: %@ of type: %d with error: %@", (uint8_t *)&v18, 0x1Cu);
    }
    id v13 = [(WPContinuity *)self delegate];
    [v13 continuityDidStartTrackingPeer:self peer:v11 type:v10 error:v7];
  }
}

- (void)stopTrackingPeer:(id)a3 forType:(int64_t)a4
{
  id v9 = a3;
  id v6 = [(WPContinuity *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int64_t v8 = [(WPContinuity *)self delegate];
    [v8 continuityDidStopTrackingPeer:self peer:v9 type:a4];
  }
}

- (void)stoppedTrackingPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v10 = a3;
  id v6 = [(WPContinuity *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int64_t v8 = +[WPContinuity continuityTypeFromClientType:v4];
    id v9 = [(WPContinuity *)self delegate];
    [v9 continuityDidStopTrackingPeer:self peer:v10 type:v8];
  }
}

- (void)foundPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v10 = a3;
  id v6 = [(WPContinuity *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int64_t v8 = +[WPContinuity continuityTypeFromClientType:v4];
    id v9 = [(WPContinuity *)self delegate];
    [v9 continuity:self didFindPeer:v10 type:v8];
  }
}

- (void)lostPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v10 = a3;
  id v6 = [(WPContinuity *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int64_t v8 = +[WPContinuity continuityTypeFromClientType:v4];
    id v9 = [(WPContinuity *)self delegate];
    [v9 continuity:self didLosePeer:v10 type:v8];
  }
}

- (void)deviceDiscovered:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"kDevicePeripheralUUID"];
  id v6 = [v4 objectForKeyedSubscript:@"kDeviceType"];
  unsigned __int8 v7 = [v6 integerValue];

  int64_t v8 = [v4 objectForKeyedSubscript:@"kDeviceAdvertisingData"];

  id v9 = objc_msgSend(v8, "subdataWithRange:", 4, objc_msgSend(v8, "length") - 4);

  int64_t v10 = +[WPContinuity continuityTypeFromClientType:v7];
  if (v5)
  {
    int64_t v11 = v10;
    uint64_t v12 = [(WPContinuity *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = [(WPContinuity *)self delegate];
      [v14 continuity:self didDiscoverType:v11 withData:v9 fromPeer:v5];
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_254);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPContinuity deviceDiscovered:]();
    }
  }
}

- (void)connectToPeer:(id)a3
{
  v34[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_261_0);
    }
    int64_t v8 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPContinuity connectToPeer:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
    int v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F08320];
    v34[0] = @"Continuity no peer was provided!";
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
    int v18 = [v16 errorWithDomain:@"WPErrorDomain" code:5 userInfo:v17];

    BOOL v19 = [(WPContinuity *)self delegate];
    LOBYTE(v17) = objc_opt_respondsToSelector();

    if ((v17 & 1) == 0) {
      goto LABEL_21;
    }
    __int16 v20 = [(WPContinuity *)self delegate];
    [v20 continuity:self didConnectToPeer:0 error:v18];
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  if ([(WPClient *)self state] != 3)
  {
    int v21 = NSString;
    __int16 v22 = [v4 UUIDString];
    uint64_t v23 = +[WPClient stateAsString:[(WPClient *)self state]];
    int v18 = [v21 stringWithFormat:@"Can't connect to peer %@ when state is %@", v22, v23];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_269);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTest startAdvertisingOfType:data:priority:mode:options:]();
    }
    uint64_t v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v31 = *MEMORY[0x263F08320];
    v32 = v18;
    uint64_t v25 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    __int16 v20 = [v24 errorWithDomain:@"WPErrorDomain" code:1 userInfo:v25];

    v26 = [(WPContinuity *)self delegate];
    LOBYTE(v25) = objc_opt_respondsToSelector();

    if (v25)
    {
      v27 = [(WPContinuity *)self delegate];
      [v27 continuity:self didConnectToPeer:v4 error:v20];
    }
    goto LABEL_20;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_272);
  }
  id v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    unsigned __int8 v7 = [v4 UUIDString];
    *(_DWORD *)buf = 138543362;
    v30 = v7;
    _os_log_impl(&dword_2144AA000, v6, OS_LOG_TYPE_DEFAULT, "Continuity connect to peer: %{public}@", buf, 0xCu);
  }
  v28.receiver = self;
  v28.super_class = (Class)WPContinuity;
  [(WPClient *)&v28 connectToPeer:v4];
LABEL_22:
}

- (void)connectedDevice:(id)a3 withError:(id)a4 shouldDiscover:(BOOL)a5
{
  BOOL v5 = a5;
  v24[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_276);
    }
    uint64_t v10 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v10;
      uint64_t v12 = [v8 UUIDString];
      *(_DWORD *)buf = 138543362;
      id v20 = v12;
      _os_log_impl(&dword_2144AA000, v11, OS_LOG_TYPE_DEFAULT, "Continuity connected to device: %{public}@", buf, 0xCu);
    }
    uint64_t v23 = @"D0611E78-BBB4-4591-A5F8-487910AE4366";
    uint64_t v13 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"8667556C-9A37-4C91-84ED-54EE27D90049", 0);
    v24[0] = v13;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];

    v18.receiver = self;
    v18.super_class = (Class)WPContinuity;
    [(WPClient *)&v18 discoverCharacteristicsAndServices:v14 forPeripheral:v8];
    goto LABEL_13;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_282);
  }
  uint64_t v15 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v8;
    __int16 v21 = 2114;
    id v22 = v9;
    _os_log_impl(&dword_2144AA000, v15, OS_LOG_TYPE_DEFAULT, "Continuity sending didConnectToPeer %@ with error %{public}@", buf, 0x16u);
  }
  int v16 = [(WPContinuity *)self delegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    uint64_t v14 = [(WPContinuity *)self delegate];
    [v14 continuity:self didConnectToPeer:v8 error:v9];
LABEL_13:
  }
}

- (void)connectedDeviceOverLEPipe:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_284);
  }
  BOOL v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_2144AA000, v5, OS_LOG_TYPE_DEFAULT, "Continuity sending didConnectToPeer %@ over LEPipe", (uint8_t *)&v9, 0xCu);
  }
  id v6 = [(WPContinuity *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(WPContinuity *)self delegate];
    [v8 continuity:self didConnectToPeer:v4 error:0];
  }
}

- (void)discoveredCharacteristicsAndServices:(id)a3 forPeripheral:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"D0611E78-BBB4-4591-A5F8-487910AE4366"];
  if (v8)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_291);
    }
    int v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      uint64_t v11 = [v7 UUIDString];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v11;
      _os_log_impl(&dword_2144AA000, v10, OS_LOG_TYPE_DEFAULT, "Continuity discovered characteristics and services: %{public}@ for peripheral: %{public}@", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    char v19 = 0;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __67__WPContinuity_discoveredCharacteristicsAndServices_forPeripheral___block_invoke_292;
    v16[3] = &unk_26420E870;
    v16[4] = buf;
    [v8 enumerateObjectsUsingBlock:v16];
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_298_0);
      }
      uint64_t v12 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl(&dword_2144AA000, v12, OS_LOG_TYPE_DEFAULT, "Continuity subscribing to characteristic", v15, 2u);
      }
      v14.receiver = self;
      v14.super_class = (Class)WPContinuity;
      [(WPClient *)&v14 shouldSubscribe:1 toPeer:v7 withCharacteristic:@"8667556C-9A37-4C91-84ED-54EE27D90049" inService:@"D0611E78-BBB4-4591-A5F8-487910AE4366"];
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_303);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPContinuity discoveredCharacteristicsAndServices:forPeripheral:]();
      }
      v13.receiver = self;
      v13.super_class = (Class)WPContinuity;
      [(WPClient *)&v13 disconnectFromPeer:v7];
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_286_0);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPContinuity discoveredCharacteristicsAndServices:forPeripheral:]();
    }
    v17.receiver = self;
    v17.super_class = (Class)WPContinuity;
    [(WPClient *)&v17 disconnectFromPeer:v7];
  }
}

void __67__WPContinuity_discoveredCharacteristicsAndServices_forPeripheral___block_invoke_292(uint64_t a1, void *a2, unsigned char *a3)
{
  if ([a2 isEqualToString:@"8667556C-9A37-4C91-84ED-54EE27D90049"])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_294);
    }
    BOOL v5 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_2144AA000, v5, OS_LOG_TYPE_INFO, "Continuity found our characteristic", v6, 2u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)updatedNotificationState:(BOOL)a3 forCharacteristic:(id)a4 inService:(id)a5 withPeripheral:(id)a6
{
  BOOL v8 = a3;
  v37[1] = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v8)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_317);
    }
    objc_super v17 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPContinuity updatedNotificationState:forCharacteristic:inService:withPeripheral:](v17, v18, v19, v20, v21, v22, v23, v24);
    }
    uint64_t v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v34 = *MEMORY[0x263F08320];
    uint64_t v35 = @"Continuity notification is disabled";
    uint64_t v26 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    int v16 = [v25 errorWithDomain:@"WPErrorDomain" code:22 userInfo:v26];

    v27 = [(WPContinuity *)self delegate];
    LOBYTE(v26) = objc_opt_respondsToSelector();

    if ((v26 & 1) == 0) {
      goto LABEL_23;
    }
    objc_super v28 = [(WPContinuity *)self delegate];
    [v28 continuity:self didConnectToPeer:v12 error:v16];
    goto LABEL_22;
  }
  if (![v10 isEqualToString:@"8667556C-9A37-4C91-84ED-54EE27D90049"]
    || ![v11 isEqualToString:@"D0611E78-BBB4-4591-A5F8-487910AE4366"])
  {
    int v16 = [NSString stringWithFormat:@"Continuity service or characteristic is not found, received notification for characteristic: %@, service: %@", v10, v11];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_311_0);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPContinuity updatedNotificationState:forCharacteristic:inService:withPeripheral:]();
    }
    v29 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    v37[0] = v16;
    uint64_t v30 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
    objc_super v28 = [v29 errorWithDomain:@"WPErrorDomain" code:20 userInfo:v30];

    uint64_t v31 = [(WPContinuity *)self delegate];
    LOBYTE(v30) = objc_opt_respondsToSelector();

    if (v30)
    {
      v32 = [(WPContinuity *)self delegate];
      [v32 continuity:self didConnectToPeer:v12 error:v28];
    }
LABEL_22:

LABEL_23:
    goto LABEL_24;
  }
  objc_super v13 = [(WPContinuity *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_305_0);
    }
    uint64_t v15 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2144AA000, v15, OS_LOG_TYPE_DEFAULT, "Continuity notification is enabled, send Central didConnect", buf, 2u);
    }
    int v16 = [(WPContinuity *)self delegate];
    [v16 continuity:self didConnectToPeer:v12 error:0];
    goto LABEL_23;
  }
LABEL_24:
}

- (void)disconnectFromPeer:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_327);
    }
    BOOL v5 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      id v7 = [v4 UUIDString];
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v7;
      _os_log_impl(&dword_2144AA000, v6, OS_LOG_TYPE_DEFAULT, "Continuity disconnect from peer: %{public}@", buf, 0xCu);
    }
    v21.receiver = self;
    v21.super_class = (Class)WPContinuity;
    [(WPClient *)&v21 disconnectFromPeer:v4];
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_322);
    }
    BOOL v8 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPContinuity disconnectFromPeer:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
    int v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F08320];
    v25[0] = @"Continuity peer is null";
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    uint64_t v18 = [v16 errorWithDomain:@"WPErrorDomain" code:7 userInfo:v17];

    uint64_t v19 = [(WPContinuity *)self delegate];
    LOBYTE(v17) = objc_opt_respondsToSelector();

    if (v17)
    {
      uint64_t v20 = [(WPContinuity *)self delegate];
      [v20 continuity:self didDisconnectFromPeer:0 error:v18];
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
    BOOL v8 = NSString;
    uint64_t v9 = [v6 UUIDString];
    uint64_t v10 = [v7 localizedDescription];
    uint64_t v11 = [v8 stringWithFormat:@"Continuity peer: %@ is disconnected with error: %@", v9, v10];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_332);
    }
    uint64_t v12 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v11;
      _os_log_impl(&dword_2144AA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - send didDisconnect", buf, 0xCu);
    }
  }
  uint64_t v13 = [(WPContinuity *)self transfers];
  uint64_t v14 = [v13 objectForKeyedSubscript:v6];

  if (v14) {
    [v14 resetTransfer];
  }
  uint64_t v15 = [(WPContinuity *)self delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_335);
    }
    uint64_t v17 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_2144AA000, v17, OS_LOG_TYPE_DEFAULT, "Continuity sending didDisconnectFromPeer %@ with error %@", buf, 0x16u);
    }
    uint64_t v18 = [(WPContinuity *)self delegate];
    [v18 continuity:self didDisconnectFromPeer:v6 error:v7];
  }
}

- (void)disconnectedDeviceOverLEPipe:(id)a3 withError:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_337);
  }
  BOOL v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_2144AA000, v8, OS_LOG_TYPE_DEFAULT, "Continuity disconnected %@ over LE pipe with error %@", (uint8_t *)&v9, 0x16u);
  }
  [(WPContinuity *)self disconnectedDevice:v6 withError:v7];
}

- (void)sendData:(id)a3 toPeer:(id)a4
{
  v59[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (!v6)
  {
    uint64_t v23 = NSString;
    uint64_t v24 = [v7 UUIDString];
    uint64_t v14 = [v23 stringWithFormat:@"Continuity no data was provided for peer: %@", v24];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_342);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTest startAdvertisingOfType:data:priority:mode:options:]();
    }
    uint64_t v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v58 = *MEMORY[0x263F08320];
    v59[0] = v14;
    uint64_t v26 = [NSDictionary dictionaryWithObjects:v59 forKeys:&v58 count:1];
    uint64_t v17 = [v25 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v26];

    v27 = [(WPContinuity *)self delegate];
    LOBYTE(v26) = objc_opt_respondsToSelector();

    if ((v26 & 1) == 0) {
      goto LABEL_32;
    }
    uint64_t v19 = [(WPContinuity *)self delegate];
    id v20 = v19;
    __int16 v21 = self;
    id v22 = 0;
    goto LABEL_20;
  }
  if (v7)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_353);
    }
    int v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      uint64_t v11 = [v6 length];
      id v12 = [v8 UUIDString];
      *(_DWORD *)buf = 134218498;
      uint64_t v51 = v11;
      __int16 v52 = 2112;
      id v53 = v6;
      __int16 v54 = 2112;
      v55 = v12;
      _os_log_impl(&dword_2144AA000, v10, OS_LOG_TYPE_DEFAULT, "Continuity send data: (%lu) %@ to peer: %@", buf, 0x20u);
    }
    uint64_t v13 = [v6 length];
    if ((unint64_t)(v13 - 60001) > 0xFFFFFFFFFFFF159FLL)
    {
      __int16 v47 = v13;
      uint64_t v14 = [MEMORY[0x263EFF990] dataWithBytes:&v47 length:2];
      [v14 appendData:v6];
      uint64_t v17 = objc_opt_new();
      [v17 setData:v14];
      v39 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"8667556C-9A37-4C91-84ED-54EE27D90049"];
      [v17 setUuid:v39];

      [v17 setWriteType:0];
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_363);
      }
      v40 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v41 = v40;
        v42 = [v17 data];
        uint64_t v43 = [v42 length];
        v44 = [v17 data];
        v45 = [v8 UUIDString];
        *(_DWORD *)buf = 134218498;
        uint64_t v51 = v43;
        __int16 v52 = 2112;
        id v53 = v44;
        __int16 v54 = 2112;
        v55 = v45;
        _os_log_impl(&dword_2144AA000, v41, OS_LOG_TYPE_DEFAULT, "Continuity send data to characteristic: (%lu) %@ to peer: %@", buf, 0x20u);
      }
      v46.receiver = self;
      v46.super_class = (Class)WPContinuity;
      [(WPClient *)&v46 sendDataToCharacteristic:v17 inService:@"D0611E78-BBB4-4591-A5F8-487910AE4366" forPeer:v8];
      goto LABEL_32;
    }
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"Continuity data length is invalid %ld (max: %lu)", v13, 60000);
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_359);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTest startAdvertisingOfType:data:priority:mode:options:]();
    }
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v48 = *MEMORY[0x263F08320];
    v49 = v14;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    uint64_t v17 = [v15 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v16];

    uint64_t v18 = [(WPContinuity *)self delegate];
    LOBYTE(v16) = objc_opt_respondsToSelector();

    if ((v16 & 1) == 0)
    {
LABEL_32:

      goto LABEL_33;
    }
    uint64_t v19 = [(WPContinuity *)self delegate];
    id v20 = v19;
    __int16 v21 = self;
    id v22 = v6;
LABEL_20:
    [v19 continuity:v21 didSendData:v22 toPeer:v8 error:v17];

    goto LABEL_32;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_350);
  }
  objc_super v28 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPContinuity sendData:toPeer:](v28, v29, v30, v31, v32, v33, v34, v35);
  }
  uint64_t v36 = (void *)MEMORY[0x263F087E8];
  uint64_t v56 = *MEMORY[0x263F08320];
  v57 = @"Continuity no peer was provided";
  uint64_t v37 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
  uint64_t v14 = [v36 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v37];

  v38 = [(WPContinuity *)self delegate];
  LOBYTE(v37) = objc_opt_respondsToSelector();

  if (v37)
  {
    uint64_t v17 = [(WPContinuity *)self delegate];
    [v17 continuity:self didSendData:v6 toPeer:0 error:v14];
    goto LABEL_32;
  }
LABEL_33:
}

- (void)sentData:(id)a3 forCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6 withError:(id)a7
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([v13 isEqualToString:@"8667556C-9A37-4C91-84ED-54EE27D90049"]
    && [v14 isEqualToString:@"D0611E78-BBB4-4591-A5F8-487910AE4366"])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_367);
    }
    uint64_t v17 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = v17;
      uint64_t v19 = [v16 localizedDescription];
      int v28 = 138412290;
      id v29 = v19;
      _os_log_impl(&dword_2144AA000, v18, OS_LOG_TYPE_DEFAULT, "Continuity didSendData over GATT with error %@", (uint8_t *)&v28, 0xCu);
    }
    id v20 = [(WPContinuity *)self delegate];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      if ((unint64_t)[v12 length] >= 2)
      {
        uint64_t v22 = objc_msgSend(v12, "subdataWithRange:", 2, objc_msgSend(v12, "length") - 2);

        id v12 = (id)v22;
      }
      uint64_t v23 = [(WPContinuity *)self delegate];
      [v23 continuity:self didSendData:v12 toPeer:v15 error:v16];
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_370);
    }
    uint64_t v24 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = v24;
      uint64_t v26 = [v15 UUIDString];
      v27 = [v16 localizedDescription];
      int v28 = 138413058;
      id v29 = v13;
      __int16 v30 = 2112;
      id v31 = v14;
      __int16 v32 = 2112;
      uint64_t v33 = v26;
      __int16 v34 = 2112;
      uint64_t v35 = v27;
      _os_log_error_impl(&dword_2144AA000, v25, OS_LOG_TYPE_ERROR, "Continuity sent data to a characteristic: %@ or service: %@ to peer: %@ with error: %@ that isn't of type Continuity", (uint8_t *)&v28, 0x2Au);
    }
  }
}

- (void)sentData:(id)a3 toEndpoint:(id)a4 forPeripheral:(id)a5 withError:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v11 || [v11 isEqualToString:@"wp.continuity"])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_372);
    }
    id v14 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      uint64_t v16 = [v10 length];
      uint64_t v17 = [v13 localizedDescription];
      int v22 = 134218242;
      uint64_t v23 = v16;
      __int16 v24 = 2112;
      uint64_t v25 = v17;
      _os_log_impl(&dword_2144AA000, v15, OS_LOG_TYPE_DEFAULT, "WPPM: Continuity didSendData %lu over LE pipe with error %@", (uint8_t *)&v22, 0x16u);
    }
    uint64_t v18 = [(WPContinuity *)self delegate];
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      if ((unint64_t)[v10 length] >= 2)
      {
        uint64_t v20 = objc_msgSend(v10, "subdataWithRange:", 2, objc_msgSend(v10, "length") - 2);

        id v10 = (id)v20;
      }
      char v21 = [(WPContinuity *)self delegate];
      [v21 continuity:self didSendData:v10 toPeer:v12 error:v13];
    }
  }
}

- (void)receivedData:(id)a3 forCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  unint64_t v11 = (unint64_t)a4;
  unint64_t v12 = (unint64_t)a5;
  id v13 = a6;
  if (!(v11 | v12)
    || [(id)v11 isEqualToString:@"8667556C-9A37-4C91-84ED-54EE27D90049"]
    && [(id)v12 isEqualToString:@"D0611E78-BBB4-4591-A5F8-487910AE4366"])
  {
    id v14 = [(WPContinuity *)self transfers];
    id v15 = [v14 objectForKeyedSubscript:v13];

    if (!v15)
    {
      id v16 = [[WPDataTransfer alloc] initDataTransferForPeer:v13];
      uint64_t v17 = [(WPContinuity *)self transfers];
      [v17 setObject:v16 forKeyedSubscript:v13];

      uint64_t v18 = [(WPContinuity *)self transfers];
      id v15 = [v18 objectForKeyedSubscript:v13];
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_375);
    }
    char v19 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = v19;
      uint64_t v21 = [v10 length];
      int v22 = [v13 UUIDString];
      int v32 = 134218498;
      uint64_t v33 = v21;
      __int16 v34 = 2112;
      id v35 = v10;
      __int16 v36 = 2112;
      uint64_t v37 = v22;
      _os_log_impl(&dword_2144AA000, v20, OS_LOG_TYPE_DEFAULT, "Continuity received data (%ld) %@ from peer %@", (uint8_t *)&v32, 0x20u);
    }
    if ([v15 addNewData:v10])
    {
      kdebug_trace();
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_378);
      }
      uint64_t v23 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v24 = v23;
        uint64_t v25 = [v15 currentReceivedData];
        uint64_t v26 = [v25 length];
        int v32 = 134217984;
        uint64_t v33 = v26;
        _os_log_impl(&dword_2144AA000, v24, OS_LOG_TYPE_DEFAULT, "WPPM: Continuity didReceiveData data of length %ld", (uint8_t *)&v32, 0xCu);
      }
      v27 = [(WPContinuity *)self delegate];
      char v28 = objc_opt_respondsToSelector();

      if (v28)
      {
        id v29 = [(WPContinuity *)self delegate];
        __int16 v30 = [v15 currentReceivedData];
        id v31 = (void *)[v30 copy];
        [v29 continuity:self didReceiveData:v31 fromPeer:v13];
      }
      [v15 resetTransfer];
    }
  }
}

- (void)receivedData:(id)a3 fromEndpoint:(id)a4 forPeripheral:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if ([a4 isEqualToString:@"wp.continuity"])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_382);
    }
    id v10 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v11 = v10;
      int v12 = 134217984;
      uint64_t v13 = [v8 length];
      _os_log_impl(&dword_2144AA000, v11, OS_LOG_TYPE_DEFAULT, "Continuity received data over LE pipe %ld", (uint8_t *)&v12, 0xCu);
    }
    [(WPContinuity *)self receivedData:v8 forCharacteristic:0 inService:0 forPeripheral:v9];
  }
}

- (void)central:(id)a3 subscribed:(BOOL)a4 toCharacteristic:(id)a5 inService:(id)a6
{
  BOOL v8 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([v11 isEqualToString:@"8667556C-9A37-4C91-84ED-54EE27D90049"]
    && ([v12 isEqualToString:@"D0611E78-BBB4-4591-A5F8-487910AE4366"] & 1) != 0)
  {
    if (v8)
    {
      uint64_t v13 = [(WPContinuity *)self delegate];
      char v14 = objc_opt_respondsToSelector();

      if (v14)
      {
        id v15 = [(WPContinuity *)self delegate];
        [v15 continuity:self didConnectToPeer:v10 error:0];

        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_387);
        }
        uint64_t v16 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 138543362;
          id v22 = v10;
          uint64_t v17 = "Continuity central connected to our device %{public}@, send Peripheral didConnect";
          uint64_t v18 = v16;
          uint32_t v19 = 12;
LABEL_18:
          _os_log_impl(&dword_2144AA000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v21, v19);
        }
      }
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_390);
      }
      uint64_t v20 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        uint64_t v17 = "Saw unsubscribe...disconnection pending";
        uint64_t v18 = v20;
        uint32_t v19 = 2;
        goto LABEL_18;
      }
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_384);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPContinuity central:subscribed:toCharacteristic:inService:]();
    }
  }
}

- (void)bandwidthStateUpdated:(id)a3
{
  BOOL v4 = [a3 integerValue] < 2;
  int64_t v5 = [(WPContinuity *)self btBandwidthState];
  [(WPContinuity *)self setBtBandwidthState:v4];
  if ([(WPContinuity *)self btBandwidthState] != v5)
  {
    id v6 = [(WPContinuity *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(WPContinuity *)self delegate];
      [v8 continuityDidChangeBluetoothBandwidthState:self];
    }
  }
}

- (void)stateDidChange:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int64_t v5 = [(WPClient *)self state];
  v14.receiver = self;
  v14.super_class = (Class)WPContinuity;
  [(WPClient *)&v14 stateDidChange:a3];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_396);
  }
  id v6 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = v6;
    int64_t v8 = [(WPClient *)self state];
    *(_DWORD *)buf = 134218496;
    int64_t v16 = a3;
    __int16 v17 = 2048;
    int64_t v18 = v5;
    __int16 v19 = 2048;
    int64_t v20 = v8;
    _os_log_impl(&dword_2144AA000, v7, OS_LOG_TYPE_DEFAULT, "Continuity stateDidChange: %ld, old %ld, pipe state %ld", buf, 0x20u);
  }
  if ([(WPClient *)self state] != v5)
  {
    if ([(WPClient *)self state] == 3)
    {
      v13.receiver = self;
      v13.super_class = (Class)WPContinuity;
      [(WPClient *)&v13 registerEndpoint:@"wp.continuity" requireAck:1 requireEncryption:1];
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)WPContinuity;
      [(WPClient *)&v12 unregisterEndpoint:@"wp.continuity"];
    }
    id v9 = [(WPContinuity *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(WPContinuity *)self delegate];
      [v11 continuityDidUpdateState:self];
    }
  }
}

- (void)peerTrackingFull
{
  v8.receiver = self;
  v8.super_class = (Class)WPContinuity;
  [(WPClient *)&v8 peerTrackingFull];
  uint64_t v3 = [(WPContinuity *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    int64_t v5 = [(WPContinuity *)self delegate];
    [v5 continuity:self peerTrackingAvailable:0];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_406);
    }
    id v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v7 = 0;
      _os_log_impl(&dword_2144AA000, v6, OS_LOG_TYPE_INFO, "Continuity peer tracking is full", v7, 2u);
    }
  }
}

- (void)peerTrackingAvailable
{
  v6.receiver = self;
  v6.super_class = (Class)WPContinuity;
  [(WPClient *)&v6 peerTrackingAvailable];
  uint64_t v3 = [(WPContinuity *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    int64_t v5 = [(WPContinuity *)self delegate];
    [v5 continuity:self peerTrackingAvailable:1];
  }
}

- (int64_t)btBandwidthState
{
  return self->_btBandwidthState;
}

- (void)setBtBandwidthState:(int64_t)a3
{
  self->_btBandwidthState = a3;
}

- (WPContinuityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WPContinuityDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)transfers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setTransfers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transfers, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:queue:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_0(&dword_2144AA000, v0, v1, "Continuity is not supported on this product", v2, v3, v4, v5, v6);
}

- (void)advertisingFailedToStart:(void *)a3 ofType:.cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_2144AA000, v6, v7, "Continuity advertising failed to start of type: %d with error: %@", v8, v9, v10, v11, v12);
}

- (void)advertisingStartedOfType:(unsigned __int8)a1 .cold.1(unsigned __int8 a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_2144AA000, a2, OS_LOG_TYPE_DEBUG, "Continuity advertising started of type: %d", (uint8_t *)v2, 8u);
}

- (void)scanningFailedToStart:(void *)a3 ofType:.cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_2144AA000, v6, v7, "Continuity failed to start scanning of type: %d with error: %@", v8, v9, v10, v11, v12);
}

- (void)deviceDiscovered:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_0(&dword_2144AA000, v0, v1, "Continuity Advert UUID not available", v2, v3, v4, v5, v6);
}

- (void)connectToPeer:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)discoveredCharacteristicsAndServices:forPeripheral:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_0(&dword_2144AA000, v0, v1, "Continuity can't find the continuity service. Disconnecting", v2, v3, v4, v5, v6);
}

- (void)discoveredCharacteristicsAndServices:forPeripheral:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_0(&dword_2144AA000, v0, v1, "Continuity characteristic wasn't found, disconnecting", v2, v3, v4, v5, v6);
}

- (void)updatedNotificationState:forCharacteristic:inService:withPeripheral:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2144AA000, v0, v1, "Continuity send Central didConnect with error: %@", v2, v3, v4, v5, v6);
}

- (void)updatedNotificationState:(uint64_t)a3 forCharacteristic:(uint64_t)a4 inService:(uint64_t)a5 withPeripheral:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)disconnectFromPeer:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendData:(uint64_t)a3 toPeer:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)central:subscribed:toCharacteristic:inService:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_2144AA000, v1, OS_LOG_TYPE_ERROR, "Continuity received subscription notification of characteristic: %@, service: %@ is not of type Continuity", v2, 0x16u);
}

@end