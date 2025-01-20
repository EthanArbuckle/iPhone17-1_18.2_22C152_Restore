@interface WPDConnection
- (BOOL)connectablePacket;
- (BOOL)didConnectSent;
- (CBCentral)central;
- (CBCharacteristic)centralCharacteristic;
- (CBPeripheral)peripheral;
- (CBPeripheralManager)sendDataManager;
- (CBService)centralService;
- (NSDictionary)charsAndServicesToDiscover;
- (NSMutableSet)subscribedCharacteristics;
- (NSString)characteristicService;
- (NSString)description;
- (OS_voucher)voucher;
- (WPCharacteristic)characteristicToSend;
- (WPDClient)client;
- (WPDConnection)init;
- (WPDConnection)initWithCentral:(id)a3 characteristic:(id)a4;
- (WPDConnection)initWithPeripheral:(id)a3;
- (id)getCentral;
- (id)getCharacteristicWithUUID:(id)a3 inService:(id)a4 forPeripheral:(id)a5;
- (id)getPeripheral;
- (id)getPeripheralUUID;
- (id)sendDataToCharacteristic:(id)a3 inService:(id)a4 forPeer:(id)a5;
- (id)subscribe:(BOOL)a3 toPeer:(id)a4 withCharacteristic:(id)a5 inService:(id)a6;
- (int64_t)connectionType;
- (int64_t)fetchConnectionType;
- (int64_t)recentRole;
- (unint64_t)dataLeftToSend;
- (void)dealloc;
- (void)discoverCharacteristicsAndServices:(id)a3 forPeripheral:(id)a4;
- (void)holdVoucher;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didModifyServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)readyForDataTransfer;
- (void)resetData;
- (void)sendDataToCentral;
- (void)sendDataToPeripheral;
- (void)setCentral:(id)a3;
- (void)setCentralCharacteristic:(id)a3;
- (void)setCentralService:(id)a3;
- (void)setCharacteristicService:(id)a3;
- (void)setCharacteristicToSend:(id)a3;
- (void)setCharsAndServicesToDiscover:(id)a3;
- (void)setClient:(id)a3;
- (void)setConnectablePacket:(BOOL)a3;
- (void)setConnectionType:(int64_t)a3;
- (void)setDataLeftToSend:(unint64_t)a3;
- (void)setDidConnectSent:(BOOL)a3;
- (void)setPeripheral:(id)a3;
- (void)setRecentRole:(int64_t)a3;
- (void)setSendDataManager:(id)a3;
- (void)setSubscribedCharacteristics:(id)a3;
- (void)setVoucher:(id)a3;
- (void)updateWithCentral:(id)a3 characteristic:(id)a4;
- (void)updateWithPeripheral:(id)a3;
@end

@implementation WPDConnection

- (WPDConnection)init
{
  v15.receiver = self;
  v15.super_class = (Class)WPDConnection;
  v2 = [(WPDConnection *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v2->_dataLeftToSend = 0;
    characteristicToSend = v2->_characteristicToSend;
    v2->_characteristicToSend = 0;

    v3->_didConnectSent = 0;
    peripheral = v3->_peripheral;
    v3->_recentRole = 3;
    v3->_peripheral = 0;

    [(CBPeripheral *)v3->_peripheral setDelegate:v3];
    uint64_t v6 = [NSDictionary dictionary];
    charsAndServicesToDiscover = v3->_charsAndServicesToDiscover;
    v3->_charsAndServicesToDiscover = (NSDictionary *)v6;

    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    subscribedCharacteristics = v3->_subscribedCharacteristics;
    v3->_subscribedCharacteristics = (NSMutableSet *)v8;

    central = v3->_central;
    v3->_central = 0;

    centralCharacteristic = v3->_centralCharacteristic;
    v3->_centralCharacteristic = 0;

    centralService = v3->_centralService;
    v3->_centralService = 0;

    v13 = v3;
  }

  return v3;
}

- (WPDConnection)initWithPeripheral:(id)a3
{
  id v4 = a3;
  v5 = [(WPDConnection *)self init];
  uint64_t v6 = v5;
  if (v5) {
    [(WPDConnection *)v5 updateWithPeripheral:v4];
  }

  return v6;
}

- (WPDConnection)initWithCentral:(id)a3 characteristic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WPDConnection *)self init];
  v9 = v8;
  if (v8) {
    [(WPDConnection *)v8 updateWithCentral:v6 characteristic:v7];
  }

  return v9;
}

- (void)updateWithPeripheral:(id)a3
{
  id v4 = a3;
  [(WPDConnection *)self setRecentRole:1];
  [(WPDConnection *)self setPeripheral:v4];

  v5 = [(WPDConnection *)self peripheral];
  [v5 setDelegate:self];

  id v6 = [NSDictionary dictionary];
  [(WPDConnection *)self setCharsAndServicesToDiscover:v6];

  id v7 = [MEMORY[0x263EFF9C0] set];
  [(WPDConnection *)self setSubscribedCharacteristics:v7];
}

- (void)updateWithCentral:(id)a3 characteristic:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(WPDConnection *)self setRecentRole:0];
  [(WPDConnection *)self setCentral:v7];

  [(WPDConnection *)self setCentralCharacteristic:v6];
  id v8 = [v6 service];

  [(WPDConnection *)self setCentralService:v8];
}

- (id)getPeripheral
{
  v3 = [(WPDConnection *)self peripheral];

  if (v3)
  {
    id v4 = [(WPDConnection *)self peripheral];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)getCentral
{
  v3 = [(WPDConnection *)self central];

  if (v3)
  {
    id v4 = [(WPDConnection *)self central];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)holdVoucher
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = (void *)voucher_copy();
  [(WPDConnection *)self setVoucher:v3];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_13);
  }
  id v4 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    id v6 = [(WPDConnection *)self voucher];
    id v7 = [(WPDConnection *)self getPeripheralUUID];
    int v8 = 138543618;
    v9 = v6;
    __int16 v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_22316D000, v5, OS_LOG_TYPE_DEFAULT, "Holding voucher %{public}@ for connection to peer %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_115);
  }
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22316D000, v3, OS_LOG_TYPE_DEFAULT, "WPDConnection deallocating", buf, 2u);
  }
  id v4 = [(WPDConnection *)self peripheral];

  if (v4)
  {
    v5 = [(WPDConnection *)self peripheral];
    [v5 setDelegate:0];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_118);
    }
    id v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22316D000, v6, OS_LOG_TYPE_DEFAULT, "WPDConnection set peripheral delegate to nil", buf, 2u);
    }
  }
  id v7 = [(WPDConnection *)self voucher];

  if (v7)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_121);
    }
    int v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      __int16 v10 = [(WPDConnection *)self getPeripheralUUID];
      *(_DWORD *)buf = 138543362;
      v13 = v10;
      _os_log_impl(&dword_22316D000, v9, OS_LOG_TYPE_DEFAULT, "Removing voucher for connection to peer %{public}@", buf, 0xCu);
    }
    [(WPDConnection *)self setVoucher:0];
  }
  v11.receiver = self;
  v11.super_class = (Class)WPDConnection;
  [(WPDConnection *)&v11 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(WPDConnection *)self peripheral];
  v5 = [v4 identifier];
  id v6 = [(WPDConnection *)self central];
  id v7 = [v6 identifier];
  int v8 = [v3 stringWithFormat:@"WPDConnection - Peripheral UUID: %@, Central UUID: %@", v5, v7];

  return (NSString *)v8;
}

- (int64_t)connectionType
{
  uint64_t v3 = [(WPDConnection *)self peripheral];
  if (v3)
  {
    id v4 = (void *)v3;
    v5 = [(WPDConnection *)self central];

    if (v5) {
      return 2;
    }
  }
  id v7 = [(WPDConnection *)self peripheral];

  if (v7) {
    return 1;
  }
  int v8 = [(WPDConnection *)self central];

  if (!v8) {
    objc_exception_throw( (id) [objc_alloc(MEMORY[0x263EFF940]) initWithName:@"No connection type" reason:@"No peripheral or central connection type" userInfo:0]);
  }
  return 0;
}

- (void)discoverCharacteristicsAndServices:(id)a3 forPeripheral:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(WPDConnection *)self peripheral];
  v9 = [v8 identifier];
  char v10 = [v7 isEqual:v9];

  if (v10)
  {
    objc_super v11 = [MEMORY[0x263EFF980] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v12 = objc_msgSend(v6, "allKeys", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [MEMORY[0x263EFEF88] UUIDWithString:*(void *)(*((void *)&v24 + 1) + 8 * i)];
          [v11 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v14);
    }

    [(WPDConnection *)self setCharsAndServicesToDiscover:v6];
    v18 = [(WPDConnection *)self peripheral];
    [v18 discoverServices:v11];

    goto LABEL_14;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_136);
  }
  v19 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    objc_super v11 = v19;
    v20 = [v7 UUIDString];
    v21 = [(WPDConnection *)self peripheral];
    v22 = [v21 identifier];
    v23 = [v22 UUIDString];
    *(_DWORD *)buf = 138412546;
    v30 = v20;
    __int16 v31 = 2112;
    v32 = v23;
    _os_log_impl(&dword_22316D000, v11, OS_LOG_TYPE_INFO, "Being asked to discover characteristics and services on a peripheral %@ that isn't this one %@", buf, 0x16u);

LABEL_14:
  }
}

- (id)getPeripheralUUID
{
  uint64_t v3 = [(WPDConnection *)self peripheral];

  if (v3) {
    [(WPDConnection *)self peripheral];
  }
  else {
  id v4 = [(WPDConnection *)self central];
  }
  v5 = [v4 identifier];

  return v5;
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 services];
  v9 = [v6 identifier];
  if (v7 || ![v8 count])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_140);
    }
    char v10 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      v22 = v10;
      v23 = [v7 localizedDescription];
      *(_DWORD *)buf = 138412802;
      __int16 v31 = v23;
      __int16 v32 = 2112;
      uint64_t v33 = v8;
      __int16 v34 = 2112;
      v35 = v9;
      _os_log_error_impl(&dword_22316D000, v22, OS_LOG_TYPE_ERROR, "Error %@ retrieving services %@ on peripheral %@. Disconnecting...", buf, 0x20u);
    }
    objc_super v11 = [v7 localizedDescription];
    if (v11)
    {
      uint64_t v12 = [v7 localizedDescription];
    }
    else
    {
      uint64_t v12 = @"No services were found";
    }

    v17 = [NSString stringWithFormat:@"Couldn't discover services on peripheral %@ with error %@", v9, v12];
    v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F08320];
    v29 = v17;
    v19 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v20 = [v18 errorWithDomain:@"WPErrorDomain" code:19 userInfo:v19];

    v21 = [(WPDConnection *)self client];
    [v21 connectedDevice:v9 withError:v20 shouldDiscover:0];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F089D8] string];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __48__WPDConnection_peripheral_didDiscoverServices___block_invoke_149;
    v26[3] = &unk_26469B5D8;
    uint64_t v12 = v13;
    long long v27 = v12;
    [v8 enumerateObjectsUsingBlock:v26];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_155_0);
    }
    uint64_t v14 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = v14;
      v16 = [v6 identifier];
      *(_DWORD *)buf = 138543618;
      __int16 v31 = v12;
      __int16 v32 = 2114;
      uint64_t v33 = v16;
      _os_log_impl(&dword_22316D000, v15, OS_LOG_TYPE_DEFAULT, "Discovered services %{public}@ on peripheral %{public}@", buf, 0x16u);
    }
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __48__WPDConnection_peripheral_didDiscoverServices___block_invoke_156;
    v24[3] = &unk_26469B600;
    v24[4] = self;
    id v25 = v6;
    [v8 enumerateObjectsUsingBlock:v24];

    v17 = v27;
  }
}

void __48__WPDConnection_peripheral_didDiscoverServices___block_invoke_149(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 UUID];
  [v2 appendFormat:@"%@, ", v3];
}

void __48__WPDConnection_peripheral_didDiscoverServices___block_invoke_156(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) charsAndServicesToDiscover];
  v5 = [v3 UUID];
  id v6 = [v5 UUIDString];
  id v7 = [v4 objectForKeyedSubscript:v6];

  if ([v7 count])
  {
    int v8 = [MEMORY[0x263EFF980] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v9 = objc_msgSend(v7, "allObjects", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [MEMORY[0x263EFEF88] UUIDWithString:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_159);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      __48__WPDConnection_peripheral_didDiscoverServices___block_invoke_156_cold_1();
    }
    [*(id *)(a1 + 40) discoverCharacteristics:v8 forService:v3];
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_161_0);
  }
  uint64_t v11 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDConnection peripheral:didDiscoverCharacteristicsForService:error:](v11, v9);
  }
  uint64_t v12 = [MEMORY[0x263EFF9C0] set];
  uint64_t v13 = [v9 characteristics];
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  __int16 v31 = __71__WPDConnection_peripheral_didDiscoverCharacteristicsForService_error___block_invoke_162;
  __int16 v32 = &unk_26469B628;
  id v14 = v12;
  id v33 = v14;
  [v13 enumerateObjectsUsingBlock:&v29];

  long long v15 = [v8 identifier];
  uint64_t v28 = v9;
  if (v10 || ![v14 count])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_165_0);
    }
    long long v16 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      long long v26 = v16;
      long long v27 = [v10 localizedDescription];
      *(_DWORD *)buf = 138412802;
      v39 = v27;
      __int16 v40 = 2112;
      id v41 = v14;
      __int16 v42 = 2112;
      v43 = v15;
      _os_log_error_impl(&dword_22316D000, v26, OS_LOG_TYPE_ERROR, "Error %@ retrieving characteristics %@ on peripheral %@. Disconnecting...", buf, 0x20u);
    }
    long long v17 = [v10 localizedDescription];
    long long v18 = v8;
    if (v17)
    {
      v19 = [v10 localizedDescription];
    }
    else
    {
      v19 = @"No characteristics were found";
    }

    uint64_t v20 = [NSString stringWithFormat:@"Couldn't discover characteristics on peripheral %@ with error %@", v15, v19, v28, v29, v30, v31, v32];
    long long v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    v37 = v20;
    id v25 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    v21 = [v24 errorWithDomain:@"WPErrorDomain" code:20 userInfo:v25];

    v22 = [(WPDConnection *)self client];
    [v22 connectedDevice:v15 withError:v21 shouldDiscover:0];
  }
  else
  {
    v19 = [(WPDConnection *)self client];
    uint64_t v20 = [v9 UUID];
    v21 = [v20 UUIDString];
    __int16 v34 = v21;
    id v35 = v14;
    v22 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    long long v18 = v8;
    v23 = [v8 identifier];
    [(__CFString *)v19 discoveredCharacteristicsAndServices:v22 forPeripheral:v23];
  }
}

void __71__WPDConnection_peripheral_didDiscoverCharacteristicsForService_error___block_invoke_162(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 UUID];
  id v3 = [v4 UUIDString];
  [v2 addObject:v3];
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  v39[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = NSString;
    uint64_t v12 = [v9 UUID];
    uint64_t v13 = [v12 UUIDString];
    id v14 = [v8 identifier];
    long long v15 = [v10 localizedDescription];
    long long v16 = [v11 stringWithFormat:@"Couldn't update notification state for characteristic %@ on peripheral %@ with error %@", v13, v14, v15];

    long long v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v38 = *MEMORY[0x263F08320];
    v39[0] = v16;
    long long v18 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
    v19 = [v17 errorWithDomain:@"WPErrorDomain" code:22 userInfo:v18];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_176_2);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDConnection peripheral:didUpdateNotificationStateForCharacteristic:error:]();
    }
    uint64_t v20 = [(WPDConnection *)self client];
    v21 = [v8 identifier];
    [v20 connectedDevice:v21 withError:v19 shouldDiscover:0];
  }
  else
  {
    v22 = [v9 UUID];
    long long v16 = [v22 UUIDString];

    v23 = [v9 service];
    long long v24 = [v23 UUID];
    v19 = [v24 UUIDString];

    uint64_t v20 = [v8 identifier];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_179_1);
    }
    id v25 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      log = v25;
      int v26 = [v9 isNotifying];
      long long v27 = [v9 UUID];
      [v9 service];
      v28 = __int16 v31 = self;
      uint64_t v29 = [v28 UUID];
      *(_DWORD *)buf = 67109634;
      int v33 = v26;
      __int16 v34 = 2114;
      id v35 = v27;
      __int16 v36 = 2114;
      v37 = v29;
      _os_log_impl(&dword_22316D000, log, OS_LOG_TYPE_DEFAULT, "Changed notification state %d for characteristic %{public}@ in service %{public}@", buf, 0x1Cu);

      self = v31;
    }
    v21 = [(WPDConnection *)self client];
    objc_msgSend(v21, "updatedNotificationState:forCharacteristic:inService:withPeripheral:", objc_msgSend(v9, "isNotifying"), v16, v19, v20);
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_181_1);
    }
    uint64_t v11 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDConnection peripheral:didUpdateValueForCharacteristic:error:](v11, v10, v8);
    }
    [v8 setNotifyValue:0 forCharacteristic:v9];
    uint64_t v12 = [(WPDConnection *)self client];
    uint64_t v13 = [v8 identifier];
    [v12 disconnectFromPeer:v13];
  }
  else
  {
    id v14 = [v9 UUID];
    uint64_t v12 = [v14 UUIDString];

    long long v15 = [v9 service];
    long long v16 = [v15 UUID];
    uint64_t v13 = [v16 UUIDString];

    long long v17 = [v8 identifier];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_184_2);
    }
    long long v18 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDConnection peripheral:didUpdateValueForCharacteristic:error:](v18, v9, v8);
    }
    v19 = [(WPDConnection *)self client];
    uint64_t v20 = [v9 value];
    [v19 receivedData:v20 fromCharacteristic:v12 inService:v13 forPeripheral:v17];
  }
}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_186_2);
  }
  id v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v7;
    _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "Services have been modified. %@ have been invalidated", (uint8_t *)&v21, 0xCu);
  }
  id v9 = [v6 identifier];
  id v10 = [(WPDConnection *)self peripheral];
  uint64_t v11 = [v10 identifier];
  char v12 = [v9 isEqual:v11];

  if (v12)
  {
    if (v7 && [v7 count])
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_195_0);
      }
      uint64_t v13 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = v13;
        long long v15 = [(WPDConnection *)self charsAndServicesToDiscover];
        long long v16 = [v6 identifier];
        long long v17 = [v16 UUIDString];
        int v21 = 138412546;
        id v22 = v15;
        __int16 v23 = 2112;
        long long v24 = v17;
        _os_log_impl(&dword_22316D000, v14, OS_LOG_TYPE_DEFAULT, "Re-discovering services and characteristics %@ on peripheral %@", (uint8_t *)&v21, 0x16u);
      }
      long long v18 = [(WPDConnection *)self charsAndServicesToDiscover];
      v19 = [(WPDConnection *)self peripheral];
      uint64_t v20 = [v19 identifier];
      [(WPDConnection *)self discoverCharacteristicsAndServices:v18 forPeripheral:v20];
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_192_0);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        -[WPDConnection peripheral:didModifyServices:]();
      }
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_189_5);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDConnection peripheral:didModifyServices:]();
    }
  }
}

- (id)subscribe:(BOOL)a3 toPeer:(id)a4 withCharacteristic:(id)a5 inService:(id)a6
{
  BOOL v8 = a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(WPDConnection *)self getCharacteristicWithUUID:v11 inService:v12 forPeripheral:v10];
  id v14 = @"Unsubscribing";
  if (v8) {
    id v14 = @"Subscribing";
  }
  long long v15 = v14;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_203);
  }
  long long v16 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    long long v17 = v16;
    long long v18 = [v10 UUIDString];
    int v24 = 138544130;
    uint64_t v25 = v15;
    __int16 v26 = 2114;
    id v27 = v11;
    __int16 v28 = 2114;
    id v29 = v12;
    __int16 v30 = 2114;
    __int16 v31 = v18;
    _os_log_impl(&dword_22316D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ to characteristic %{public}@ in service %{public}@ to peer %{public}@", (uint8_t *)&v24, 0x2Au);
  }
  v19 = [(WPDConnection *)self peripheral];
  [v19 setNotifyValue:v8 forCharacteristic:v13];

  uint64_t v20 = [(WPDConnection *)self subscribedCharacteristics];
  int v21 = v20;
  if (v8)
  {
    [v20 addObject:v11];
LABEL_11:

    goto LABEL_12;
  }
  int v22 = [v20 containsObject:v11];

  if (v22)
  {
    int v21 = [(WPDConnection *)self subscribedCharacteristics];
    [v21 removeObject:v11];
    goto LABEL_11;
  }
LABEL_12:

  return 0;
}

- (id)sendDataToCharacteristic:(id)a3 inService:(id)a4 forPeer:(id)a5
{
  v48[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WPDConnection *)self characteristicToSend];

  if (v11)
  {
    id v12 = [NSString stringWithFormat:@"Sending in progress, wait for didSend callback to send next chunk of data"];
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v47 = *MEMORY[0x263F08320];
    v48[0] = v12;
    id v14 = [NSDictionary dictionaryWithObjects:v48 forKeys:&v47 count:1];
    long long v15 = [v13 errorWithDomain:@"WPErrorDomain" code:21 userInfo:v14];
    goto LABEL_34;
  }
  id v12 = [(WPDConnection *)self peripheral];
  id v14 = [(WPDConnection *)self central];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_208_0);
  }
  long long v16 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v42 = v10;
    __int16 v43 = 2112;
    uint64_t v44 = v12;
    __int16 v45 = 2112;
    v46 = v14;
    _os_log_debug_impl(&dword_22316D000, v16, OS_LOG_TYPE_DEBUG, "Sending data to %@. Current peripheral: %@, current central: %@", buf, 0x20u);
  }
  long long v17 = [v12 identifier];
  if ([v17 isEqual:v10])
  {
  }
  else
  {
    long long v18 = [v14 identifier];
    char v19 = [v18 isEqual:v10];

    if ((v19 & 1) == 0)
    {
      int v22 = NSString;
      __int16 v36 = [v12 identifier];
      __int16 v23 = [v36 UUIDString];
      int v24 = [v14 identifier];
      uint64_t v25 = [v24 UUIDString];
      __int16 v26 = [v10 UUIDString];
      id v27 = [v22 stringWithFormat:@"CoreBluetooth couldn't find the peripheral %@ or central %@ to send data with requested peer %@", v23, v25, v26];

      __int16 v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v39 = *MEMORY[0x263F08320];
      __int16 v40 = v27;
      id v29 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      long long v15 = [v28 errorWithDomain:@"WPErrorDomain" code:6 userInfo:v29];

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_214_0);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDClient disconnectedPeer:error:]();
      }

      goto LABEL_34;
    }
  }
  uint64_t v20 = [v8 data];
  -[WPDConnection setDataLeftToSend:](self, "setDataLeftToSend:", [v20 length]);

  [(WPDConnection *)self setCharacteristicToSend:v8];
  [(WPDConnection *)self setCharacteristicService:v9];
  if (v14)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_217_2);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDConnection sendDataToCharacteristic:inService:forPeer:]();
    }
    [(WPDConnection *)self sendDataToCentral];
LABEL_16:
    long long v15 = 0;
    goto LABEL_34;
  }
  if (v12)
  {
    int v21 = [v12 services];

    if (v21)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_220_1);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        -[WPDConnection sendDataToCharacteristic:inService:forPeer:]();
      }
      [(WPDConnection *)self sendDataToPeripheral];
      goto LABEL_16;
    }
  }
  [(WPDConnection *)self setCharacteristicToSend:0];
  __int16 v30 = NSString;
  __int16 v31 = [v10 UUIDString];
  uint64_t v32 = [v30 stringWithFormat:@"No peripheral or central to send data with requested peer %@", v31];

  int v33 = (void *)MEMORY[0x263F087E8];
  uint64_t v37 = *MEMORY[0x263F08320];
  uint64_t v38 = v32;
  __int16 v34 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  long long v15 = [v33 errorWithDomain:@"WPErrorDomain" code:6 userInfo:v34];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_226_2);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPDClient disconnectedPeer:error:]();
  }

LABEL_34:
  return v15;
}

- (int64_t)fetchConnectionType
{
  uint64_t v3 = [(WPDConnection *)self peripheral];
  if (v3)
  {
    id v4 = (void *)v3;
    v5 = [(WPDConnection *)self central];

    if (v5) {
      return 2;
    }
  }
  id v7 = [(WPDConnection *)self peripheral];

  if (v7) {
    return 1;
  }
  id v8 = [(WPDConnection *)self central];

  if (v8) {
    return 0;
  }
  else {
    return 3;
  }
}

- (void)sendDataToCentral
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_22316D000, log, OS_LOG_TYPE_DEBUG, "Sent packet okay", buf, 2u);
}

- (void)sendDataToPeripheral
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_22316D000, v0, OS_LOG_TYPE_DEBUG, "iOS MTU: %lu", v1, 0xCu);
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 UUID];
  id v12 = [v11 UUIDString];

  uint64_t v13 = [v9 service];
  id v14 = [v13 UUID];
  long long v15 = [v14 UUIDString];

  long long v16 = [(WPDConnection *)self characteristicToSend];
  long long v17 = [v16 data];

  long long v18 = [v8 identifier];
  if (v10)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_263_0);
    }
    char v19 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      log = v19;
      id v27 = [v9 UUID];
      id v29 = [v8 identifier];
      __int16 v26 = [v29 UUIDString];
      [v10 localizedDescription];
      *(_DWORD *)buf = 138412802;
      __int16 v31 = v27;
      __int16 v32 = 2112;
      int v33 = v26;
      v35 = __int16 v34 = 2112;
      uint64_t v25 = (void *)v35;
      _os_log_error_impl(&dword_22316D000, log, OS_LOG_TYPE_ERROR, "Failed writing to characteristic %@ of peer %@ with error: %@. Forcing disconnection", buf, 0x20u);
    }
    uint64_t v20 = [(WPDConnection *)self client];
    [v20 sentData:v17 forCharacteristic:v12 inService:v15 forPeripheral:v18 withError:v10];

    [v8 setNotifyValue:0 forCharacteristic:v9];
    int v21 = [(WPDConnection *)self client];
    int v22 = [v8 identifier];
    [v21 disconnectFromPeer:v22];
  }
  else if ([(WPDConnection *)self dataLeftToSend])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_266_1);
    }
    __int16 v23 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDConnection peripheral:didWriteValueForCharacteristic:error:](v23);
    }
    [(WPDConnection *)self sendDataToPeripheral];
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_269_2);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDConnection peripheral:didWriteValueForCharacteristic:error:]();
    }
    int v24 = [(WPDConnection *)self client];
    [v24 sentData:v17 forCharacteristic:v12 inService:v15 forPeripheral:v18 withError:0];

    [(WPDConnection *)self resetData];
  }
}

- (id)getCharacteristicWithUUID:(id)a3 inService:(id)a4 forPeripheral:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WPDConnection *)self peripheral];

  if (v11)
  {
    id v12 = [(WPDConnection *)self peripheral];
    uint64_t v13 = [v12 services];

    uint64_t v28 = 0;
    id v29 = &v28;
    uint64_t v30 = 0x3032000000;
    __int16 v31 = __Block_byref_object_copy__3;
    __int16 v32 = __Block_byref_object_dispose__3;
    id v33 = 0;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __67__WPDConnection_getCharacteristicWithUUID_inService_forPeripheral___block_invoke_272;
    v25[3] = &unk_26469B650;
    id v14 = v9;
    id v26 = v14;
    id v27 = &v28;
    [v13 enumerateObjectsUsingBlock:v25];
    long long v15 = (void *)v29[5];
    if (v15)
    {
      long long v16 = [v15 characteristics];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      uint64_t v35 = __Block_byref_object_copy__3;
      uint64_t v36 = __Block_byref_object_dispose__3;
      id v37 = 0;
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __67__WPDConnection_getCharacteristicWithUUID_inService_forPeripheral___block_invoke_275;
      v22[3] = &unk_26469B678;
      id v23 = v8;
      int v24 = buf;
      [v16 enumerateObjectsUsingBlock:v22];
      long long v17 = *(void **)(*(void *)&buf[8] + 40);
      if (v17)
      {
        id v18 = v17;
      }
      else
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_278_0);
        }
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
          -[WPDConnection getCharacteristicWithUUID:inService:forPeripheral:]();
        }
      }

      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_274_1);
      }
      long long v16 = (id)WiProxLog;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v21 = [(WPDConnection *)self peripheral];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v21;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t))v13;
        _os_log_error_impl(&dword_22316D000, v16, OS_LOG_TYPE_ERROR, "Wireless Proximity can't retrieve the service %@ for peripheral %@. Services found = %@", buf, 0x20u);
      }
      long long v17 = 0;
    }

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_271_0);
    }
    char v19 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDConnection getCharacteristicWithUUID:inService:forPeripheral:]((uint64_t)v10, v19, self);
    }
    long long v17 = 0;
  }

  return v17;
}

void __67__WPDConnection_getCharacteristicWithUUID_inService_forPeripheral___block_invoke_272(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = [v10 UUID];
  id v8 = [v7 UUIDString];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __67__WPDConnection_getCharacteristicWithUUID_inService_forPeripheral___block_invoke_275(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = [v10 UUID];
  id v8 = [v7 UUIDString];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)readyForDataTransfer
{
  uint64_t v3 = [(WPDConnection *)self characteristicToSend];
  if (v3)
  {
    id v4 = (void *)v3;
    v5 = [(WPDConnection *)self central];

    if (v5)
    {
      [(WPDConnection *)self sendDataToCentral];
    }
  }
}

- (void)resetData
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "Resetting data", v2, v3, v4, v5, v6);
}

- (WPDClient)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  return (WPDClient *)WeakRetained;
}

- (void)setClient:(id)a3
{
}

- (NSMutableSet)subscribedCharacteristics
{
  return self->_subscribedCharacteristics;
}

- (void)setSubscribedCharacteristics:(id)a3
{
}

- (void)setConnectionType:(int64_t)a3
{
  self->_connectionType = a3;
}

- (BOOL)didConnectSent
{
  return self->_didConnectSent;
}

- (void)setDidConnectSent:(BOOL)a3
{
  self->_didConnectSent = a3;
}

- (int64_t)recentRole
{
  return self->_recentRole;
}

- (void)setRecentRole:(int64_t)a3
{
  self->_recentRole = a3;
}

- (CBPeripheral)peripheral
{
  return (CBPeripheral *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPeripheral:(id)a3
{
}

- (CBCentral)central
{
  return (CBCentral *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCentral:(id)a3
{
}

- (NSDictionary)charsAndServicesToDiscover
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCharsAndServicesToDiscover:(id)a3
{
}

- (WPCharacteristic)characteristicToSend
{
  return (WPCharacteristic *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCharacteristicToSend:(id)a3
{
}

- (NSString)characteristicService
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCharacteristicService:(id)a3
{
}

- (unint64_t)dataLeftToSend
{
  return self->_dataLeftToSend;
}

- (void)setDataLeftToSend:(unint64_t)a3
{
  self->_dataLeftToSend = a3;
}

- (CBCharacteristic)centralCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCentralCharacteristic:(id)a3
{
}

- (CBService)centralService
{
  return (CBService *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCentralService:(id)a3
{
}

- (CBPeripheralManager)sendDataManager
{
  return (CBPeripheralManager *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSendDataManager:(id)a3
{
}

- (BOOL)connectablePacket
{
  return self->_connectablePacket;
}

- (void)setConnectablePacket:(BOOL)a3
{
  self->_connectablePacket = a3;
}

- (OS_voucher)voucher
{
  return (OS_voucher *)objc_getProperty(self, a2, 120, 1);
}

- (void)setVoucher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_sendDataManager, 0);
  objc_storeStrong((id *)&self->_centralService, 0);
  objc_storeStrong((id *)&self->_centralCharacteristic, 0);
  objc_storeStrong((id *)&self->_characteristicService, 0);
  objc_storeStrong((id *)&self->_characteristicToSend, 0);
  objc_storeStrong((id *)&self->_charsAndServicesToDiscover, 0);
  objc_storeStrong((id *)&self->_central, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_subscribedCharacteristics, 0);
  objc_destroyWeak((id *)&self->_client);
}

void __48__WPDConnection_peripheral_didDiscoverServices___block_invoke_156_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_22316D000, v0, OS_LOG_TYPE_DEBUG, "Discovering characteristics %@", v1, 0xCu);
}

- (void)peripheral:(void *)a1 didDiscoverCharacteristicsForService:(void *)a2 error:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 UUID];
  objc_claimAutoreleasedReturnValue();
  id v10 = [(id)OUTLINED_FUNCTION_15() identifier];
  OUTLINED_FUNCTION_20(&dword_22316D000, v4, v5, "Discovered characteristics for service %@ on peripheral for %@", v6, v7, v8, v9, 2u);
}

- (void)peripheral:didUpdateNotificationStateForCharacteristic:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_22316D000, v0, v1, "%@. Disconnecting...", v2, v3, v4, v5, v6);
}

- (void)peripheral:(void *)a1 didUpdateValueForCharacteristic:(void *)a2 error:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  uint8_t v6 = [a2 UUID];
  uint64_t v7 = [a3 identifier];
  uint64_t v8 = [v7 UUIDString];
  OUTLINED_FUNCTION_1_3();
  _os_log_debug_impl(&dword_22316D000, v5, OS_LOG_TYPE_DEBUG, "Received Value Update for characteristic %{public}@ for peripheral %@. Notifying daemon client.", v9, 0x16u);
}

- (void)peripheral:(void *)a1 didUpdateValueForCharacteristic:(void *)a2 error:(void *)a3 .cold.2(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint8_t v6 = [a2 localizedDescription];
  uint64_t v7 = [a3 identifier];
  uint64_t v8 = [v7 UUIDString];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_3(&dword_22316D000, v9, v10, "Error updating characteristic value %@ on peripheral %@, disconnecting", v11, v12, v13, v14, v15);
}

- (void)peripheral:didModifyServices:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "No services to rediscover, ignoring.", v2, v3, v4, v5, v6);
}

- (void)peripheral:didModifyServices:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "Not our peripheral, ignoring", v2, v3, v4, v5, v6);
}

- (void)sendDataToCharacteristic:inService:forPeer:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "Sending data to peripheral", v2, v3, v4, v5, v6);
}

- (void)sendDataToCharacteristic:inService:forPeer:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "Sending data to central", v2, v3, v4, v5, v6);
}

- (void)peripheral:didWriteValueForCharacteristic:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "Sent all the data succesfully", v2, v3, v4, v5, v6);
}

- (void)peripheral:(void *)a1 didWriteValueForCharacteristic:error:.cold.2(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  id v2 = a1;
  [(id)OUTLINED_FUNCTION_15() dataLeftToSend];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_22316D000, v1, OS_LOG_TYPE_DEBUG, "Still have %ld bytes to send", v3, 0xCu);
}

- (void)getCharacteristicWithUUID:(uint64_t)a1 inService:(void *)a2 forPeripheral:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 peripheral];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_3(&dword_22316D000, v6, v7, "Wireless Proximity can't retrieve the peripheral %@. Connected peripheral: %@", v8, v9, v10, v11, v12);
}

- (void)getCharacteristicWithUUID:inService:forPeripheral:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_22316D000, v0, v1, "Wireless Proximity can't retrieve the characteristic %@", v2, v3, v4, v5, v6);
}

@end