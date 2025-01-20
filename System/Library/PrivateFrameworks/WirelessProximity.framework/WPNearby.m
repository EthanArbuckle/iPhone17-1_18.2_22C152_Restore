@interface WPNearby
+ (int64_t)holdVouchers;
+ (int64_t)nearbyTypeFromClientType:(unsigned __int8)a3;
+ (unsigned)clientTypeFromNearbyType:(int64_t)a3;
- (NSArray)leCapablePeers;
- (NSMutableDictionary)transfers;
- (WPNearby)init;
- (WPNearby)initWithDelegate:(id)a3 queue:(id)a4;
- (WPNearbyDelegate)delegate;
- (id)clientAsString;
- (int64_t)btBandwidthState;
- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4;
- (void)advertisingPendingOfType:(unsigned __int8)a3;
- (void)advertisingStartedOfType:(unsigned __int8)a3;
- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4;
- (void)bandwidthStateUpdated:(id)a3;
- (void)central:(id)a3 subscribed:(BOOL)a4 toCharacteristic:(id)a5 inService:(id)a6;
- (void)clearDuplicatesForType:(int64_t)a3;
- (void)connectToPeer:(id)a3;
- (void)connectToPeer:(id)a3 withOptions:(id)a4;
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
- (void)setLeCapablePeers:(id)a3;
- (void)setTransfers:(id)a3;
- (void)startAdvertisingOfType:(int64_t)a3 data:(id)a4 priority:(int64_t)a5 mode:(int64_t)a6;
- (void)startAdvertisingOfType:(int64_t)a3 data:(id)a4 priority:(int64_t)a5 mode:(int64_t)a6 options:(id)a7;
- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4;
- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4 priority:(int64_t)a5;
- (void)startScanningForType:(int64_t)a3 data:(id)a4 mask:(id)a5 peers:(id)a6 scanMode:(int64_t)a7;
- (void)startScanningForType:(int64_t)a3 data:(id)a4 mask:(id)a5 peers:(id)a6 scanMode:(int64_t)a7 rssi:(id)a8 duplicates:(BOOL)a9;
- (void)startScanningForType:(int64_t)a3 data:(id)a4 mask:(id)a5 peers:(id)a6 scanMode:(int64_t)a7 rssi:(id)a8 duplicates:(BOOL)a9 scanCache:(BOOL)a10;
- (void)startScanningForType:(int64_t)a3 data:(id)a4 mask:(id)a5 peers:(id)a6 scanMode:(int64_t)a7 rssi:(id)a8 duplicates:(BOOL)a9 scanCache:(BOOL)a10 useCaseList:(id)a11;
- (void)startTrackingPeer:(id)a3 forType:(int64_t)a4;
- (void)startedTrackingPeer:(id)a3 ofType:(unsigned __int8)a4;
- (void)stateDidChange:(int64_t)a3;
- (void)stopAdvertisingOfType:(int64_t)a3;
- (void)stopScanningForType:(int64_t)a3;
- (void)stopTrackingPeer:(id)a3 forType:(int64_t)a4;
- (void)stoppedTrackingPeer:(id)a3 ofType:(unsigned __int8)a4;
- (void)updateAdvertisingRequest:(id)a3 withUpdate:(id)a4;
- (void)updatedNotificationState:(BOOL)a3 forCharacteristic:(id)a4 inService:(id)a5 withPeripheral:(id)a6;
@end

@implementation WPNearby

- (void)startAdvertisingOfType:(int64_t)a3 data:(id)a4 priority:(int64_t)a5 mode:(int64_t)a6
{
}

- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_227);
  }
  v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134218242;
    uint64_t v17 = v4;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_2144AA000, v7, OS_LOG_TYPE_DEFAULT, "Nearby advertising stopped of type: %ld with error: %@", (uint8_t *)&v16, 0x16u);
  }
  if (v6)
  {
    if ([v6 code] == 28)
    {
      v8 = [(WPNearby *)self delegate];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_232);
        }
        v10 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          v11 = v10;
          v12 = [v6 localizedDescription];
          int v16 = 134218242;
          uint64_t v17 = v4;
          __int16 v18 = 2112;
          id v19 = v12;
          _os_log_impl(&dword_2144AA000, v11, OS_LOG_TYPE_DEFAULT, "[Privacy] Nearby advertising stopped of type: %ld with error: %@", (uint8_t *)&v16, 0x16u);
        }
        v13 = [(WPNearby *)self delegate];
        objc_msgSend(v13, "nearby:didStopAdvertisingType:withError:", self, +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v4), v6);
        goto LABEL_15;
      }
    }
  }
  else
  {
    v14 = [(WPNearby *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      v13 = [(WPNearby *)self delegate];
      objc_msgSend(v13, "nearby:didStopAdvertisingType:", self, +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v4));
LABEL_15:
    }
  }
}

- (void)startScanningForType:(int64_t)a3 data:(id)a4 mask:(id)a5 peers:(id)a6 scanMode:(int64_t)a7 rssi:(id)a8 duplicates:(BOOL)a9 scanCache:(BOOL)a10 useCaseList:(id)a11
{
  v61[1] = *MEMORY[0x263EF8340];
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a11;
  if (a7)
  {
    if (a7 == 1)
    {
      int64_t v22 = 30;
    }
    else if (a7 == 2)
    {
      int64_t v22 = 40;
    }
    else
    {
      int64_t v22 = a7;
    }
  }
  else
  {
    int64_t v22 = 10;
  }
  uint64_t v23 = [v17 length];
  uint64_t v24 = [v18 length];
  if (v23 <= 22 && v24 < 23)
  {
    v25 = objc_opt_new();
    v26 = v25;
    if (a3 != 1)
    {
      if (a3)
      {
        id v52 = [MEMORY[0x263EFF940] exceptionWithName:@"UnknownNearbyType" reason:@"The nearby type isn't valid" userInfo:0];
        objc_exception_throw(v52);
      }
      id v27 = v19;
      switch(v22)
      {
        case 40:
          uint64_t v28 = 30;
          break;
        case 5:
          uint64_t v28 = 966;
          break;
        case 30:
          uint64_t v28 = 40;
          break;
        case 20:
          uint64_t v28 = 60;
          break;
        default:
          uint64_t v28 = 300;
          break;
      }
      [v25 setClientType:15];
      [v26 setNearbyScanMode:v22];
      BOOL v47 = [(WPClient *)self isBubbleTestClient];
      int64x2_t v45 = vdupq_n_s64(0x3C6uLL);
      v45.i64[0] = v28;
      v46 = v27;
      if (v22 == 40 && v47)
      {
        objc_msgSend(v26, "setNearbyScanMode:", 40, *(double *)v45.i64);
        int64x2_t v45 = vdupq_n_s64(0x1EuLL);
      }
LABEL_49:
      int64x2_t v56 = v45;
      uint64_t v57 = 30;
      [v26 setScanningRates:&v56];
      if (v17) {
        [v26 setBlobValue:v17];
      }
      if (v18) {
        [v26 setMaskValue:v18];
      }
      if (v46) {
        [v26 setPeers:v46];
      }
      v34 = v46;
      if (v20) {
        [v26 setRssiThreshold:v20];
      }
      [v26 setScanCache:a10];
      [v26 setAllowDuplicates:a9];
      if ([v21 count])
      {
        v48 = (void *)MEMORY[0x263EFF8C0];
        v49 = [v21 allObjects];
        v50 = [v48 arrayWithArray:v49];
        [v26 setUseCaseList:v50];
      }
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_252_0);
      }
      v51 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v59 = v26;
        _os_log_impl(&dword_2144AA000, v51, OS_LOG_TYPE_DEFAULT, "Nearby start scanning with data: %{public}@", buf, 0xCu);
      }
      v55.receiver = self;
      v55.super_class = (Class)WPNearby;
      [(WPClient *)&v55 startScanning:v26];
      goto LABEL_64;
    }
    id v40 = v20;
    id v41 = v19;
    if (v22 > 29)
    {
      if (v22 != 40)
      {
        if (v22 == 30)
        {
          uint64_t v42 = 40;
          goto LABEL_35;
        }
        goto LABEL_32;
      }
      uint64_t v42 = 30;
    }
    else
    {
      if (v22 != 5)
      {
        if (v22 == 20)
        {
          uint64_t v42 = 60;
          goto LABEL_35;
        }
LABEL_32:
        uint64_t v42 = 300;
        goto LABEL_35;
      }
      uint64_t v42 = 966;
    }
LABEL_35:
    [v25 setClientType:16];
    [v26 setNearbyScanMode:v22];
    if (([v21 containsObject:&unk_26C53DF98] & 1) != 0
      || [v21 containsObject:&unk_26C53DFB0])
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_248);
      }
      v43 = WiProxLog;
      BOOL v44 = os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT);
      int64x2_t v45 = vdupq_n_s64(0x3CuLL);
      v45.i64[0] = v42;
      if (v44)
      {
        int64x2_t v54 = v45;
        *(_DWORD *)buf = 138412290;
        id v59 = v21;
        _os_log_impl(&dword_2144AA000, v43, OS_LOG_TYPE_DEFAULT, "Nearby is asking for NearbyInfo EDT default camera or stream start scan %@", buf, 0xCu);
        int64x2_t v45 = v54;
      }
    }
    else
    {
      int64x2_t v45 = vdupq_n_s64(0x3C6uLL);
      v45.i64[0] = v42;
    }
    v46 = v41;
    id v20 = v40;
    goto LABEL_49;
  }
  id v53 = v18;
  id v29 = v17;
  id v30 = v21;
  v31 = objc_msgSend(NSString, "stringWithFormat:", @"Nearby data (%ld bytes) or mask (%ld bytes) length is larger than the max length (22 bytes) for type: %ld", v23, v24, a3);
  v32 = self;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_239_1);
  }
  id v33 = v20;
  v34 = v19;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPTest startAdvertisingOfType:data:priority:mode:options:]();
  }
  v35 = (void *)MEMORY[0x263F087E8];
  uint64_t v60 = *MEMORY[0x263F08320];
  v61[0] = v31;
  v36 = [NSDictionary dictionaryWithObjects:v61 forKeys:&v60 count:1];
  v26 = [v35 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v36];

  v37 = [(WPNearby *)v32 delegate];
  char v38 = objc_opt_respondsToSelector();

  if (v38)
  {
    v39 = [(WPNearby *)v32 delegate];
    [v39 nearby:v32 didFailToStartScanningForType:a3 withError:v26];
  }
  id v20 = v33;
  id v21 = v30;
  id v17 = v29;
  id v18 = v53;
LABEL_64:
}

- (void)startAdvertisingOfType:(int64_t)a3 data:(id)a4 priority:(int64_t)a5 mode:(int64_t)a6 options:(id)a7
{
  v31[1] = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a7;
  if (v12 && (unint64_t)[v12 length] < 0x17)
  {
    v14 = +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", +[WPNearby clientTypeFromNearbyType:a3]);
    [v14 setAdvertisingRate:a6];
    [v14 setConnectable:1];
    [v14 setStopOnAdvertisingAddressChange:1];
    [v14 setAdvertisingData:v12];
    if (a3 == 1 && a5 == 1)
    {
      [v14 changePriorityValue:1];
      [v14 setUpdateTime:5.0];
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_207);
    }
    id v20 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v23 = v14;
      __int16 v24 = 2048;
      int64_t v25 = a5;
      __int16 v26 = 2048;
      int64_t v27 = a6;
      __int16 v28 = 2112;
      id v29 = v13;
      _os_log_impl(&dword_2144AA000, v20, OS_LOG_TYPE_DEFAULT, "Nearby start advertising with data: %{public}@ priority %ld mode %ld options %@", buf, 0x2Au);
    }
    v21.receiver = self;
    v21.super_class = (Class)WPNearby;
    [(WPClient *)&v21 startAdvertising:v14];
  }
  else
  {
    v14 = [NSString stringWithFormat:@"Nearby can't start advertising of type: %ld because bad data: %@ was provided", a3, v12];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_198_0);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTest startAdvertisingOfType:data:priority:mode:options:]();
    }
    char v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08320];
    v31[0] = v14;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    id v17 = [v15 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v16];

    id v18 = [(WPNearby *)self delegate];
    LOBYTE(v16) = objc_opt_respondsToSelector();

    if (v16)
    {
      id v19 = [(WPNearby *)self delegate];
      [v19 nearby:self didFailToStartAdvertisingOfType:a3 withError:v17];
    }
  }
}

- (void)stopAdvertisingOfType:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = +[WPNearby clientTypeFromNearbyType:a3];
  v5 = +[WPAdvertisingRequest requestForClientType:v4];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_223);
  }
  id v6 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v9 = v4;
    _os_log_impl(&dword_2144AA000, v6, OS_LOG_TYPE_DEFAULT, "Nearby stop advertising of type: %d", buf, 8u);
  }
  v7.receiver = self;
  v7.super_class = (Class)WPNearby;
  [(WPClient *)&v7 stopAdvertising:v5];
}

+ (unsigned)clientTypeFromNearbyType:(int64_t)a3
{
  if (a3 == 1) {
    return 16;
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", @"UnknownNearbyType", @"The nearby type isn't valid", 0, v3, v4);
    id v6 = objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return 15;
}

- (void)advertisingStartedOfType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v5 = [(WPNearby *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_219);
    }
    objc_super v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPNearby advertisingStartedOfType:](v3, v7);
    }
    v8 = [(WPNearby *)self delegate];
    objc_msgSend(v8, "nearby:didStartAdvertisingType:", self, +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v3));
  }
}

- (void)scanningStartedOfType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v5 = [(WPNearby *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WPNearby *)self delegate];
    objc_msgSend(v7, "nearby:didStartScanningForType:", self, +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v3));
  }
}

- (void)deviceDiscovered:(id)a3
{
  v47[6] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"kDevicePeripheralUUID"];
  char v6 = [v4 objectForKeyedSubscript:@"kDeviceType"];
  unsigned __int8 v7 = [v6 integerValue];

  v8 = [v4 objectForKeyedSubscript:@"kDeviceAdvertisingData"];
  int v9 = objc_msgSend(v8, "subdataWithRange:", 4, objc_msgSend(v8, "length") - 4);

  int64_t v10 = +[WPNearby nearbyTypeFromClientType:v7];
  if (v5)
  {
    int64_t v11 = v10;
    id v12 = [(WPNearby *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      char v38 = v9;
      int64_t v39 = v11;
      v14 = [v4 objectForKeyedSubscript:@"kDeviceAddress"];
      uint64_t v15 = [v4 objectForKeyedSubscript:@"kDeviceManufacturerData"];
      uint64_t v16 = [v4 objectForKeyedSubscript:@"kDevicePaired"];
      v46[0] = @"WPNearbyKeyDeviceAddress";
      id v17 = v14;
      if (!v14)
      {
        id v17 = [MEMORY[0x263EFF8F8] data];
      }
      v47[0] = v17;
      v47[1] = v15;
      v37 = (void *)v15;
      v46[1] = @"WPNearbyKeyManufacturerData";
      v46[2] = @"WPNearbyKeyPaired";
      id v18 = (void *)MEMORY[0x263EFFA80];
      if (v16) {
        id v18 = v16;
      }
      v47[2] = v18;
      v46[3] = @"WPNearbyKeyRSSI";
      id v19 = [v4 objectForKeyedSubscript:@"kDeviceRSSI"];
      v47[3] = v19;
      v46[4] = @"kDeviceChannel";
      id v20 = objc_msgSend(v4, "objectForKeyedSubscript:");
      v47[4] = v20;
      v46[5] = @"WPNearbyKeyDeviceTime";
      objc_super v21 = [v4 objectForKeyedSubscript:@"kDeviceTime"];
      v47[5] = v21;
      int64_t v22 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:6];

      if (!v14) {
      if (WPLogInitOnce != -1)
      }
        dispatch_once(&WPLogInitOnce, &__block_literal_global_276_0);
      uint64_t v23 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218498;
        int64_t v41 = v39;
        __int16 v42 = 2112;
        v43 = v5;
        __int16 v44 = 2112;
        int64x2_t v45 = v22;
        _os_log_impl(&dword_2144AA000, v23, OS_LOG_TYPE_INFO, "Nearby didDiscoverType %ld UUID %@ info %@", buf, 0x20u);
      }
      __int16 v24 = [(WPNearby *)self delegate];
      int v9 = v38;
      [v24 nearby:self didDiscoverType:v39 withData:v38 fromPeer:v5 peerInfo:v22];
    }
    else
    {
      id v33 = [(WPNearby *)self delegate];
      char v34 = objc_opt_respondsToSelector();

      if (v34)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_281);
        }
        v35 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218242;
          int64_t v41 = v11;
          __int16 v42 = 2112;
          v43 = v5;
          _os_log_impl(&dword_2144AA000, v35, OS_LOG_TYPE_INFO, "Nearby didDiscoverType %ld UUID %@", buf, 0x16u);
        }
        v36 = [(WPNearby *)self delegate];
        [v36 nearby:self didDiscoverType:v11 withData:v9 fromPeer:v5];
      }
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_270);
    }
    int64_t v25 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPNearby deviceDiscovered:](v25, v26, v27, v28, v29, v30, v31, v32);
    }
  }
}

- (WPNearbyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WPNearbyDelegate *)WeakRetained;
}

+ (int64_t)nearbyTypeFromClientType:(unsigned __int8)a3
{
  if (a3 == 16) {
    return 1;
  }
  if (a3 != 15)
  {
    objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", @"UnknownClientType", @"The client type isn't valid", 0, v3, v4);
    id v6 = objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return 0;
}

- (void)stopScanningForType:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5 = objc_opt_new();
  objc_msgSend(v5, "setClientType:", +[WPNearby clientTypeFromNearbyType:](WPNearby, "clientTypeFromNearbyType:", a3));
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_260);
  }
  id v6 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    int v9 = v5;
    _os_log_impl(&dword_2144AA000, v6, OS_LOG_TYPE_DEFAULT, "Nearby stop scanning: %{public}@", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)WPNearby;
  [(WPClient *)&v7 stopScanning:v5];
}

- (void)scanningStoppedOfType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v5 = [(WPNearby *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WPNearby *)self delegate];
    objc_msgSend(v7, "nearby:didStopScanningForType:", self, +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v3));
  }
}

- (WPNearby)initWithDelegate:(id)a3 queue:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WPNearby;
  id v7 = [(WPClient *)&v17 initWithQueue:a4 machName:0];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_btBandwidthState = -1;
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    transfers = v8->_transfers;
    v8->_transfers = (NSMutableDictionary *)v9;

    leCapablePeers = v8->_leCapablePeers;
    v8->_leCapablePeers = 0;

    [(WPClient *)v8 setConnectionUseCase:8];
    v16.receiver = v8;
    v16.super_class = (Class)WPNearby;
    [(WPClient *)&v16 listenToBandwidthNotifications];
    v8->_nearbySignPostID = os_signpost_id_make_with_pointer((os_log_t)WiProxLog, v8);
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_8);
  }
  id v12 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    char v13 = v12;
    v14 = [(WPNearby *)v8 delegate];
    *(_DWORD *)buf = 134218240;
    id v19 = v8;
    __int16 v20 = 2048;
    objc_super v21 = v14;
    _os_log_impl(&dword_2144AA000, v13, OS_LOG_TYPE_DEFAULT, "Nearby initWithDelegate self: %p, delegate: %p", buf, 0x16u);
  }
  return v8;
}

- (WPNearby)init
{
  uint64_t v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF488];
  v5 = NSStringFromSelector(a2);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v3 raise:v4, @"%@ is not a valid initializer for %@", v5, v7 format];

  return 0;
}

+ (int64_t)holdVouchers
{
  return 2;
}

- (id)clientAsString
{
  return @"WPNearby";
}

- (void)invalidate
{
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_186);
  }
  uint64_t v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2144AA000, v3, OS_LOG_TYPE_DEFAULT, "Nearby invalidate by client", buf, 2u);
  }
  [(WPNearby *)self setDelegate:0];
  v5.receiver = self;
  v5.super_class = (Class)WPNearby;
  [(WPClient *)&v5 unregisterEndpoint:@"wp.nearby"];
  v4.receiver = self;
  v4.super_class = (Class)WPNearby;
  [(WPClient *)&v4 invalidate];
}

- (void)populateClientGATT:(id)a3
{
  uint64_t v3 = (void (**)(id, id, void *))a3;
  id v6 = (id)objc_opt_new();
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"AF0BADB1-5B99-43CD-917A-A77BC549E3CC"];
  [v6 setUuid:v4];

  [v6 setProperties:24];
  [v6 setPermissions:2];
  objc_super v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"9FA480E0-4967-4542-9390-D343DC5D04AE"];
  v3[2](v3, v6, v5);
}

- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4 priority:(int64_t)a5
{
}

- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4
{
}

- (void)updateAdvertisingRequest:(id)a3 withUpdate:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  [v5 setUpdateTime:0.0];
  if ([v5 advertisingRate] == 432) {
    uint64_t v7 = 432;
  }
  else {
    uint64_t v7 = 290;
  }
  [v5 setAdvertisingRate:v7];
  if ([v5 clientType] == 16) {
    [v5 changePriorityValue:0];
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_211_0);
  }
  v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v5;
    _os_log_impl(&dword_2144AA000, v8, OS_LOG_TYPE_DEFAULT, "Nearby update advertising with data: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  v6[2](v6, v5);
}

- (void)advertisingPendingOfType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [(WPNearby *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_215);
    }
    uint64_t v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_2144AA000, v7, OS_LOG_TYPE_INFO, "Nearby advertising pending of type: %d", (uint8_t *)v9, 8u);
    }
    v8 = [(WPNearby *)self delegate];
    objc_msgSend(v8, "nearby:didDeferAdvertisingType:", self, +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v3));
  }
}

- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(WPNearby *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_221);
    }
    int v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPNearby advertisingFailedToStart:ofType:](v4, v9, v6);
    }
    uint64_t v10 = [(WPNearby *)self delegate];
    objc_msgSend(v10, "nearby:didFailToStartAdvertisingOfType:withError:", self, +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v4), v6);
  }
}

- (void)startScanningForType:(int64_t)a3 data:(id)a4 mask:(id)a5 peers:(id)a6 scanMode:(int64_t)a7
{
  LOBYTE(v7) = a3 == 1;
  -[WPNearby startScanningForType:data:mask:peers:scanMode:rssi:duplicates:](self, "startScanningForType:data:mask:peers:scanMode:rssi:duplicates:", v7);
}

- (void)startScanningForType:(int64_t)a3 data:(id)a4 mask:(id)a5 peers:(id)a6 scanMode:(int64_t)a7 rssi:(id)a8 duplicates:(BOOL)a9
{
  LOWORD(v9) = a9;
  -[WPNearby startScanningForType:data:mask:peers:scanMode:rssi:duplicates:scanCache:](self, "startScanningForType:data:mask:peers:scanMode:rssi:duplicates:scanCache:", a3, a4, a5, a6, a7, a8, v9);
}

- (void)startScanningForType:(int64_t)a3 data:(id)a4 mask:(id)a5 peers:(id)a6 scanMode:(int64_t)a7 rssi:(id)a8 duplicates:(BOOL)a9 scanCache:(BOOL)a10
{
  LOWORD(v10) = __PAIR16__(a10, a9);
  -[WPNearby startScanningForType:data:mask:peers:scanMode:rssi:duplicates:scanCache:useCaseList:](self, "startScanningForType:data:mask:peers:scanMode:rssi:duplicates:scanCache:useCaseList:", a3, a4, a5, a6, a7, a8, v10, 0);
}

- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(WPNearby *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_258);
    }
    uint64_t v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPNearby scanningFailedToStart:ofType:](v4, v9, v6);
    }
    uint64_t v10 = [(WPNearby *)self delegate];
    objc_msgSend(v10, "nearby:didFailToStartScanningForType:withError:", self, +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v4), v6);
  }
}

- (void)clearDuplicatesForType:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = objc_opt_new();
  objc_msgSend(v5, "setClientType:", +[WPNearby clientTypeFromNearbyType:](WPNearby, "clientTypeFromNearbyType:", a3));
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_266);
  }
  id v6 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v9 = a3;
    _os_log_impl(&dword_2144AA000, v6, OS_LOG_TYPE_DEFAULT, "Nearby clear duplicate filter cache type %ld", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)WPNearby;
  [(WPClient *)&v7 clearDuplicateFilterCache:v5];
}

- (void)connectToPeer:(id)a3
{
}

- (void)connectToPeer:(id)a3 withOptions:(id)a4
{
  v37[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_286_1);
    }
    int64_t v9 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPNearby connectToPeer:withOptions:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
    objc_super v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    v37[0] = @"Nearby no peer was provided!";
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
    id v19 = [v17 errorWithDomain:@"WPErrorDomain" code:6 userInfo:v18];

    __int16 v20 = [(WPNearby *)self delegate];
    LOBYTE(v18) = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0) {
      goto LABEL_21;
    }
    objc_super v21 = [(WPNearby *)self delegate];
    [v21 nearby:self didConnectToPeer:0 transport:0 error:v19];
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
      dispatch_once(&WPLogInitOnce, &__block_literal_global_295);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTest startAdvertisingOfType:data:priority:mode:options:]();
    }
    int64_t v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v34 = *MEMORY[0x263F08320];
    v35 = v19;
    uint64_t v26 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    objc_super v21 = [v25 errorWithDomain:@"WPErrorDomain" code:1 userInfo:v26];

    uint64_t v27 = [(WPNearby *)self delegate];
    LOBYTE(v26) = objc_opt_respondsToSelector();

    if (v26)
    {
      uint64_t v28 = [(WPNearby *)self delegate];
      [v28 nearby:self didConnectToPeer:v6 transport:0 error:v21];
    }
    goto LABEL_20;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_298_1);
  }
  char v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v31 = v6;
    __int16 v32 = 2112;
    id v33 = v7;
    _os_log_impl(&dword_2144AA000, v8, OS_LOG_TYPE_DEFAULT, "Nearby connect to peer  %{public}@ with options %@", buf, 0x16u);
  }
  v29.receiver = self;
  v29.super_class = (Class)WPNearby;
  [(WPClient *)&v29 connectToPeer:v6 withOptions:v7];
LABEL_22:
}

- (void)connectedDevice:(id)a3 withError:(id)a4 shouldDiscover:(BOOL)a5
{
  BOOL v5 = a5;
  v22[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_302_0);
    }
    uint64_t v10 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v8;
      _os_log_impl(&dword_2144AA000, v10, OS_LOG_TYPE_DEFAULT, "Nearby connected to device: %{public}@ over GATT", buf, 0xCu);
    }
    objc_super v21 = @"9FA480E0-4967-4542-9390-D343DC5D04AE";
    uint64_t v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"AF0BADB1-5B99-43CD-917A-A77BC549E3CC", 0);
    v22[0] = v11;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];

    v16.receiver = self;
    v16.super_class = (Class)WPNearby;
    [(WPClient *)&v16 discoverCharacteristicsAndServices:v12 forPeripheral:v8];
    goto LABEL_13;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_308_0);
  }
  uint64_t v13 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v8;
    __int16 v19 = 2114;
    id v20 = v9;
    _os_log_impl(&dword_2144AA000, v13, OS_LOG_TYPE_DEFAULT, "Nearby sending didConnectToPeer %@ with error %{public}@", buf, 0x16u);
  }
  uint64_t v14 = [(WPNearby *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    uint64_t v12 = [(WPNearby *)self delegate];
    [v12 nearby:self didConnectToPeer:v8 transport:1 error:v9];
LABEL_13:
  }
}

- (void)connectedDeviceOverLEPipe:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_310);
  }
  BOOL v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_2144AA000, v5, OS_LOG_TYPE_DEFAULT, "Nearby sending didConnectToPeer %@ over LEPipe", (uint8_t *)&v9, 0xCu);
  }
  id v6 = [(WPNearby *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(WPNearby *)self delegate];
    [v8 nearby:self didConnectToPeer:v4 transport:2 error:0];
  }
}

- (void)discoveredCharacteristicsAndServices:(id)a3 forPeripheral:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"9FA480E0-4967-4542-9390-D343DC5D04AE"];
  if (v8)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_317_0);
    }
    int v9 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_2144AA000, v9, OS_LOG_TYPE_DEFAULT, "Nearby discovered characteristics and services: %{public}@ for peripheral: %{public}@", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    char v33 = 0;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __63__WPNearby_discoveredCharacteristicsAndServices_forPeripheral___block_invoke_318;
    v30[3] = &unk_26420E870;
    v30[4] = buf;
    [v8 enumerateObjectsUsingBlock:v30];
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_321_0);
      }
      id v10 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)objc_super v29 = 0;
        _os_log_impl(&dword_2144AA000, v10, OS_LOG_TYPE_DEFAULT, "Nearby subscribing to characteristic", v29, 2u);
      }
      v28.receiver = self;
      v28.super_class = (Class)WPNearby;
      [(WPClient *)&v28 shouldSubscribe:1 toPeer:v7 withCharacteristic:@"AF0BADB1-5B99-43CD-917A-A77BC549E3CC" inService:@"9FA480E0-4967-4542-9390-D343DC5D04AE"];
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_326_0);
      }
      __int16 v19 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPNearby discoveredCharacteristicsAndServices:forPeripheral:](v19, v20, v21, v22, v23, v24, v25, v26);
      }
      v27.receiver = self;
      v27.super_class = (Class)WPNearby;
      [(WPClient *)&v27 disconnectFromPeer:v7];
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_312);
    }
    uint64_t v11 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPNearby discoveredCharacteristicsAndServices:forPeripheral:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
    v31.receiver = self;
    v31.super_class = (Class)WPNearby;
    [(WPClient *)&v31 disconnectFromPeer:v7];
  }
}

uint64_t __63__WPNearby_discoveredCharacteristicsAndServices_forPeripheral___block_invoke_318(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isEqualToString:@"AF0BADB1-5B99-43CD-917A-A77BC549E3CC"];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
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
      dispatch_once(&WPLogInitOnce, &__block_literal_global_340);
    }
    uint64_t v17 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPNearby updatedNotificationState:forCharacteristic:inService:withPeripheral:](v17, v18, v19, v20, v21, v22, v23, v24);
    }
    uint64_t v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v34 = *MEMORY[0x263F08320];
    v35 = @"Nearby notification is disabled";
    uint64_t v26 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    uint64_t v16 = [v25 errorWithDomain:@"WPErrorDomain" code:22 userInfo:v26];

    objc_super v27 = [(WPNearby *)self delegate];
    LOBYTE(v26) = objc_opt_respondsToSelector();

    if ((v26 & 1) == 0) {
      goto LABEL_23;
    }
    objc_super v28 = [(WPNearby *)self delegate];
    [v28 nearby:self didConnectToPeer:v12 transport:1 error:v16];
    goto LABEL_22;
  }
  if (![v10 isEqualToString:@"AF0BADB1-5B99-43CD-917A-A77BC549E3CC"]
    || ![v11 isEqualToString:@"9FA480E0-4967-4542-9390-D343DC5D04AE"])
  {
    uint64_t v16 = [NSString stringWithFormat:@"Nearby service or characteristic is not found, received notification for characteristic: %@, service: %@", v10, v11];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_334);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPNearby updatedNotificationState:forCharacteristic:inService:withPeripheral:]();
    }
    objc_super v29 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    v37[0] = v16;
    uint64_t v30 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
    objc_super v28 = [v29 errorWithDomain:@"WPErrorDomain" code:20 userInfo:v30];

    objc_super v31 = [(WPNearby *)self delegate];
    LOBYTE(v30) = objc_opt_respondsToSelector();

    if (v30)
    {
      __int16 v32 = [(WPNearby *)self delegate];
      [v32 nearby:self didConnectToPeer:v12 transport:1 error:v28];
    }
LABEL_22:

    goto LABEL_23;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_328);
  }
  uint64_t v13 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2144AA000, v13, OS_LOG_TYPE_DEFAULT, "Nearby notification is enabled, send Central didConnect", buf, 2u);
  }
  uint64_t v14 = [(WPNearby *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    uint64_t v16 = [(WPNearby *)self delegate];
    [v16 nearby:self didConnectToPeer:v12 transport:1 error:0];
LABEL_23:
  }
}

- (void)sendData:(id)a3 toPeer:(id)a4
{
  v44[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (!v6)
  {
    uint64_t v19 = NSString;
    uint64_t v20 = [v7 UUIDString];
    id v10 = [v19 stringWithFormat:@"Nearby no data was provided for peer: %@", v20];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_345);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTest startAdvertisingOfType:data:priority:mode:options:]();
    }
    uint64_t v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v43 = *MEMORY[0x263F08320];
    v44[0] = v10;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];
    uint64_t v13 = [v21 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v22];

    uint64_t v23 = [(WPNearby *)self delegate];
    LOBYTE(v22) = objc_opt_respondsToSelector();

    if ((v22 & 1) == 0) {
      goto LABEL_28;
    }
    char v15 = [(WPNearby *)self delegate];
    uint64_t v16 = v15;
    uint64_t v17 = self;
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
      uint64_t v13 = objc_opt_new();
      [v13 setData:v10];
      v35 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"AF0BADB1-5B99-43CD-917A-A77BC549E3CC"];
      [v13 setUuid:v35];

      [v13 setWriteType:0];
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_363_0);
      }
      uint64_t v36 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        -[WPNearby sendData:toPeer:].cold.4(v36, v10, v8);
      }
      v37.receiver = self;
      v37.super_class = (Class)WPNearby;
      [(WPClient *)&v37 sendDataToCharacteristic:v13 inService:@"9FA480E0-4967-4542-9390-D343DC5D04AE" forPeer:v8];
      goto LABEL_28;
    }
    id v10 = objc_msgSend(NSString, "stringWithFormat:", @"Nearby data length is invalid %ld (max: %lu)", v9, 60000);
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_359_0);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTest startAdvertisingOfType:data:priority:mode:options:]();
    }
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F08320];
    id v40 = v10;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    uint64_t v13 = [v11 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v12];

    uint64_t v14 = [(WPNearby *)self delegate];
    LOBYTE(v12) = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0)
    {
LABEL_28:

      goto LABEL_29;
    }
    char v15 = [(WPNearby *)self delegate];
    uint64_t v16 = v15;
    uint64_t v17 = self;
    id v18 = v6;
LABEL_16:
    [v15 nearby:v17 didSendData:v18 toPeer:v8 error:v13];

    goto LABEL_28;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_353_0);
  }
  uint64_t v24 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPNearby sendData:toPeer:](v24, v25, v26, v27, v28, v29, v30, v31);
  }
  __int16 v32 = (void *)MEMORY[0x263F087E8];
  uint64_t v41 = *MEMORY[0x263F08320];
  __int16 v42 = @"Nearby no peer was provided";
  uint64_t v33 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  id v10 = [v32 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v33];

  uint64_t v34 = [(WPNearby *)self delegate];
  LOBYTE(v33) = objc_opt_respondsToSelector();

  if (v33)
  {
    uint64_t v13 = [(WPNearby *)self delegate];
    [v13 nearby:self didSendData:v6 toPeer:0 error:v10];
    goto LABEL_28;
  }
LABEL_29:
}

- (void)sentData:(id)a3 forCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6 withError:(id)a7
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([v13 isEqualToString:@"AF0BADB1-5B99-43CD-917A-A77BC549E3CC"]
    && [v14 isEqualToString:@"9FA480E0-4967-4542-9390-D343DC5D04AE"])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_367_0);
    }
    uint64_t v17 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v17;
      uint64_t v19 = [v16 localizedDescription];
      int v28 = 138412290;
      id v29 = v19;
      _os_log_impl(&dword_2144AA000, v18, OS_LOG_TYPE_DEFAULT, "Nearby didSendData over GATT with error %@", (uint8_t *)&v28, 0xCu);
    }
    uint64_t v20 = [(WPNearby *)self delegate];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      if ((unint64_t)[v12 length] >= 2)
      {
        uint64_t v22 = objc_msgSend(v12, "subdataWithRange:", 2, objc_msgSend(v12, "length") - 2);

        id v12 = (id)v22;
      }
      uint64_t v23 = [(WPNearby *)self delegate];
      [v23 nearby:self didSendData:v12 toPeer:v15 error:v16];
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_370_0);
    }
    uint64_t v24 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = v24;
      uint64_t v26 = [v15 UUIDString];
      uint64_t v27 = [v16 localizedDescription];
      int v28 = 138413058;
      id v29 = v13;
      __int16 v30 = 2112;
      id v31 = v14;
      __int16 v32 = 2112;
      uint64_t v33 = v26;
      __int16 v34 = 2112;
      v35 = v27;
      _os_log_error_impl(&dword_2144AA000, v25, OS_LOG_TYPE_ERROR, "Nearby Sent data to a characteristic: %@ or service: %@ to peer: %@ with error: %@ that isn't of type Nearby", (uint8_t *)&v28, 0x2Au);
    }
  }
}

- (void)sentData:(id)a3 toEndpoint:(id)a4 forPeripheral:(id)a5 withError:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v11
    || ([v11 isEqualToString:@"nearby"] & 1) != 0
    || [v11 isEqualToString:@"wp.nearby"])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_372_0);
    }
    id v14 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      int v24 = 134217984;
      uint64_t v25 = [v10 length];
      _os_log_impl(&dword_2144AA000, v15, OS_LOG_TYPE_DEFAULT, "WPPM: Nearby didSendData over LE pipe: %lu", (uint8_t *)&v24, 0xCu);
    }
    id v16 = [(WPNearby *)self delegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      if ((unint64_t)[v10 length] >= 2)
      {
        uint64_t v18 = objc_msgSend(v10, "subdataWithRange:", 2, objc_msgSend(v10, "length") - 2);

        id v10 = (id)v18;
      }
      uint64_t v19 = [(WPNearby *)self delegate];
      [v19 nearby:self didSendData:v10 toPeer:v12 error:v13];
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_375_0);
    }
    uint64_t v20 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      char v21 = v20;
      uint64_t v22 = [v12 UUIDString];
      uint64_t v23 = [v13 localizedDescription];
      int v24 = 138412802;
      uint64_t v25 = (uint64_t)v11;
      __int16 v26 = 2112;
      uint64_t v27 = v22;
      __int16 v28 = 2112;
      id v29 = v23;
      _os_log_error_impl(&dword_2144AA000, v21, OS_LOG_TYPE_ERROR, "Nearby Sent data to a endpoint: %@ to peer: %@ with error: %@ that isn't of type Nearby", (uint8_t *)&v24, 0x20u);
    }
  }
}

- (void)receivedData:(id)a3 forCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  unint64_t v11 = (unint64_t)a4;
  unint64_t v12 = (unint64_t)a5;
  id v13 = a6;
  if (!(v11 | v12)
    || [(id)v11 isEqualToString:@"AF0BADB1-5B99-43CD-917A-A77BC549E3CC"]
    && [(id)v12 isEqualToString:@"9FA480E0-4967-4542-9390-D343DC5D04AE"])
  {
    id v14 = [(WPNearby *)self transfers];
    id v15 = [v14 objectForKeyedSubscript:v13];

    if (!v15)
    {
      id v16 = [[WPDataTransfer alloc] initDataTransferForPeer:v13];
      char v17 = [(WPNearby *)self transfers];
      [v17 setObject:v16 forKeyedSubscript:v13];

      uint64_t v18 = [(WPNearby *)self transfers];
      id v15 = [v18 objectForKeyedSubscript:v13];
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_378_0);
    }
    uint64_t v19 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPNearby receivedData:forCharacteristic:inService:forPeripheral:](v10, v19);
    }
    if ([v15 addNewData:v10])
    {
      kdebug_trace();
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_381);
      }
      uint64_t v20 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        char v21 = v20;
        uint64_t v22 = [v15 currentReceivedData];
        int v28 = 134217984;
        uint64_t v29 = [v22 length];
        _os_log_impl(&dword_2144AA000, v21, OS_LOG_TYPE_DEFAULT, "WPPM: Nearby didReceiveData data of length %ld", (uint8_t *)&v28, 0xCu);
      }
      uint64_t v23 = [(WPNearby *)self delegate];
      char v24 = objc_opt_respondsToSelector();

      if (v24)
      {
        uint64_t v25 = [(WPNearby *)self delegate];
        __int16 v26 = [v15 currentReceivedData];
        uint64_t v27 = (void *)[v26 copy];
        [v25 nearby:self didReceiveData:v27 fromPeer:v13];
      }
      [v15 resetTransfer];
    }
  }
}

- (void)receivedData:(id)a3 fromEndpoint:(id)a4 forPeripheral:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = (id)WiProxLog;
  unint64_t v12 = v11;
  os_signpost_id_t nearbySignPostID = self->_nearbySignPostID;
  if (nearbySignPostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)id v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_2144AA000, v12, OS_SIGNPOST_EVENT, nearbySignPostID, "WPNearby receivedData:fromEndpoint:forPeripheral", (const char *)&unk_2144E3F21, v14, 2u);
  }

  if (([v9 isEqualToString:@"wp.nearby"] & 1) != 0
    || [v9 isEqualToString:@"nearby"])
  {
    [(WPNearby *)self receivedData:v8 forCharacteristic:0 inService:0 forPeripheral:v10];
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
        dispatch_once(&WPLogInitOnce, &__block_literal_global_388);
      }
      id v13 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138543362;
        id v19 = v10;
        _os_log_impl(&dword_2144AA000, v13, OS_LOG_TYPE_DEFAULT, "Nearby central connected to our device %{public}@, send Peripheral didConnect", (uint8_t *)&v18, 0xCu);
      }
      id v14 = [(WPNearby *)self delegate];
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        id v16 = [(WPNearby *)self delegate];
        [v16 nearby:self didConnectToPeer:v10 transport:1 error:0];
      }
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_391);
      }
      char v17 = WiProxLog;
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
      dispatch_once(&WPLogInitOnce, &__block_literal_global_385);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPNearby central:subscribed:toCharacteristic:inService:]();
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
      dispatch_once(&WPLogInitOnce, &__block_literal_global_401);
    }
    BOOL v5 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v4;
      _os_log_impl(&dword_2144AA000, v5, OS_LOG_TYPE_DEFAULT, "Nearby disconnect from peer: %{public}@", buf, 0xCu);
    }
    v19.receiver = self;
    v19.super_class = (Class)WPNearby;
    [(WPClient *)&v19 disconnectFromPeer:v4];
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_396_0);
    }
    id v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPNearby disconnectFromPeer:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
    id v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263F08320];
    v23[0] = @"Nearby peer is null";
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v16 = [v14 errorWithDomain:@"WPErrorDomain" code:7 userInfo:v15];

    char v17 = [(WPNearby *)self delegate];
    LOBYTE(v15) = objc_opt_respondsToSelector();

    if (v15)
    {
      int v18 = [(WPNearby *)self delegate];
      [v18 nearby:self didDisconnectFromPeer:0 error:v16];
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
    uint64_t v11 = [v8 stringWithFormat:@"Nearby peer: %@ is disconnected with error: %@", v9, v10];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_406_0);
    }
    uint64_t v12 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v11;
      _os_log_impl(&dword_2144AA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - send didDisconnect", buf, 0xCu);
    }
  }
  uint64_t v13 = [(WPNearby *)self transfers];
  id v14 = [v13 objectForKeyedSubscript:v6];

  if (v14) {
    [v14 resetTransfer];
  }
  uint64_t v15 = [(WPNearby *)self delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_409);
    }
    char v17 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_2144AA000, v17, OS_LOG_TYPE_DEFAULT, "Nearby sending didDisconnectFromPeer %@ with error %@", buf, 0x16u);
    }
    int v18 = [(WPNearby *)self delegate];
    [v18 nearby:self didDisconnectFromPeer:v6 error:v7];
  }
}

- (void)disconnectedDeviceOverLEPipe:(id)a3 withError:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_411);
  }
  uint64_t v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_2144AA000, v8, OS_LOG_TYPE_DEFAULT, "Nearby disconnected %@ over LE pipe with error %@", (uint8_t *)&v9, 0x16u);
  }
  [(WPNearby *)self disconnectedDevice:v6 withError:v7];
}

- (void)startTrackingPeer:(id)a3 forType:(int64_t)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263F087E8];
  uint64_t v12 = *MEMORY[0x263F08320];
  v13[0] = @"Nearby peer traking is unsupported";
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  int v9 = [v7 errorWithDomain:@"WPErrorDomain" code:17 userInfo:v8];

  id v10 = [(WPNearby *)self delegate];
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if (v8)
  {
    __int16 v11 = [(WPNearby *)self delegate];
    [v11 nearby:self didStartTrackingPeer:v6 type:a4 error:v9];
  }
}

- (void)startedTrackingPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v9 = a3;
  id v6 = [(WPNearby *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(WPNearby *)self delegate];
    objc_msgSend(v8, "nearby:didStartTrackingPeer:type:error:", self, v9, +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v4), 0);
  }
}

- (void)failedToStartTrackingPeer:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_418);
  }
  uint64_t v8 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPNearby failedToStartTrackingPeer:error:]((uint64_t)v6, v8, v7);
  }
  id v9 = [(WPNearby *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    int64_t v11 = +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", [v6 clientType]);
    uint64_t v12 = [v6 peerUUID];
    uint64_t v13 = [(WPNearby *)self delegate];
    [v13 nearby:self didStartTrackingPeer:v12 type:v11 error:v7];
  }
}

- (void)stopTrackingPeer:(id)a3 forType:(int64_t)a4
{
  id v9 = a3;
  id v6 = [(WPNearby *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(WPNearby *)self delegate];
    [v8 nearby:self didStopTrackingPeer:v9 type:a4];
  }
}

- (void)stoppedTrackingPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v9 = a3;
  id v6 = [(WPNearby *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(WPNearby *)self delegate];
    objc_msgSend(v8, "nearby:didStopTrackingPeer:type:", self, v9, +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v4));
  }
}

- (void)foundPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v10 = a3;
  id v6 = [(WPNearby *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int64_t v8 = +[WPNearby nearbyTypeFromClientType:v4];
    id v9 = [(WPNearby *)self delegate];
    [v9 nearby:self didFindPeer:v10 type:v8];
  }
}

- (void)lostPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v10 = a3;
  id v6 = [(WPNearby *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int64_t v8 = +[WPNearby nearbyTypeFromClientType:v4];
    id v9 = [(WPNearby *)self delegate];
    [v9 nearby:self didLosePeer:v10 type:v8];
  }
}

- (void)bandwidthStateUpdated:(id)a3
{
  BOOL v4 = [a3 integerValue] < 2;
  int64_t v5 = [(WPNearby *)self btBandwidthState];
  [(WPNearby *)self setBtBandwidthState:v4];
  if ([(WPNearby *)self btBandwidthState] != v5)
  {
    id v6 = [(WPNearby *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(WPNearby *)self delegate];
      [v8 nearbyDidChangeBluetoothBandwidthState:self];
    }
  }
}

- (void)stateDidChange:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int64_t v5 = [(WPClient *)self state];
  v14.receiver = self;
  v14.super_class = (Class)WPNearby;
  [(WPClient *)&v14 stateDidChange:a3];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_430);
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
    _os_log_impl(&dword_2144AA000, v7, OS_LOG_TYPE_DEFAULT, "Nearby stateDidChange: %ld, old %ld, pipe state %ld", buf, 0x20u);
  }
  if ([(WPClient *)self state] != v5)
  {
    if ([(WPClient *)self state] == 3)
    {
      v13.receiver = self;
      v13.super_class = (Class)WPNearby;
      [(WPClient *)&v13 registerEndpoint:@"wp.nearby" requireAck:1 requireEncryption:0];
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)WPNearby;
      [(WPClient *)&v12 unregisterEndpoint:@"wp.nearby"];
    }
    id v9 = [(WPNearby *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      int64_t v11 = [(WPNearby *)self delegate];
      [v11 nearbyDidUpdateState:self];
    }
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

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)transfers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTransfers:(id)a3
{
}

- (NSArray)leCapablePeers
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLeCapablePeers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leCapablePeers, 0);
  objc_storeStrong((id *)&self->_transfers, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)advertisingStartedOfType:(unsigned __int8)a1 .cold.1(unsigned __int8 a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_2144AA000, a2, OS_LOG_TYPE_DEBUG, "Nearby advertising started of type: %d", (uint8_t *)v2, 8u);
}

- (void)advertisingFailedToStart:(void *)a3 ofType:.cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  int64_t v5 = [a3 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_2144AA000, v6, v7, "Nearby advertising failed to start of type: %d with error: %@", v8, v9, v10, v11, v12);
}

- (void)scanningFailedToStart:(void *)a3 ofType:.cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  int64_t v5 = [a3 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_2144AA000, v6, v7, "Nearby failed to start scanning of type: %d with error: %@", v8, v9, v10, v11, v12);
}

- (void)deviceDiscovered:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)connectToPeer:(uint64_t)a3 withOptions:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)discoveredCharacteristicsAndServices:(uint64_t)a3 forPeripheral:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)discoveredCharacteristicsAndServices:(uint64_t)a3 forPeripheral:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updatedNotificationState:forCharacteristic:inService:withPeripheral:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2144AA000, v0, v1, "Nearby send Central didConnect with error: %@", v2, v3, v4, v5, v6);
}

- (void)updatedNotificationState:(uint64_t)a3 forCharacteristic:(uint64_t)a4 inService:(uint64_t)a5 withPeripheral:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
  OUTLINED_FUNCTION_5(&dword_2144AA000, v6, v7, "Nearby send data size %lu: %@ peer: %@", v8, v9, v10, v11, 2u);
}

- (void)receivedData:(void *)a1 forCharacteristic:(void *)a2 inService:forPeripheral:.cold.1(void *a1, void *a2)
{
  id v3 = a2;
  [a1 length];
  OUTLINED_FUNCTION_5(&dword_2144AA000, v4, v5, "Nearby received data %@ of length %ld from peer %@", v6, v7, v8, v9, 2u);
}

- (void)central:subscribed:toCharacteristic:inService:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_2144AA000, v1, OS_LOG_TYPE_ERROR, "Nearby received subscription notification of characteristic: %@, service: %@ is not of type Nearby", v2, 0x16u);
}

- (void)disconnectFromPeer:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)failedToStartTrackingPeer:(void *)a3 error:.cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  uint64_t v6 = [a3 localizedDescription];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_2144AA000, v5, OS_LOG_TYPE_ERROR, "Nearby failed to start tracking peer: %@ with error: %@", (uint8_t *)&v7, 0x16u);
}

@end