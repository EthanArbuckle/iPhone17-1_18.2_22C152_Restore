@interface WPDeviceScanner
- (BOOL)anyScanResultsRequested;
- (BOOL)parseType:(unsigned __int8)a3 atOffset:(char *)a4 withSize:(int)a5 intoDictionary:(id)a6;
- (NSMutableArray)liveDevices;
- (NSMutableDictionary)activeScans;
- (WPDeviceScanner)initWithDelegate:(id)a3;
- (WPDeviceScanner)initWithDelegate:(id)a3 queue:(id)a4;
- (WPDeviceScannerDelegate)delegate;
- (id)clientAsString;
- (id)description;
- (void)addPuckType:(id)a3 toDictionary:(id)a4;
- (void)anyDiscoveredDevice:(id)a3;
- (void)deviceDiscovered:(id)a3;
- (void)invalidate;
- (void)parseAirPrint:(char *)a3 forSize:(int)a4 intoDictionary:(id)a5;
- (void)parseCompanyData:(char *)a3 forSize:(int)a4 intoDictionary:(id)a5;
- (void)postDevice:(id)a3;
- (void)postDevices:(id)a3;
- (void)registerForAnyScanResults:(BOOL)a3;
- (void)registerForDevicesMatching:(id)a3 options:(id)a4;
- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4;
- (void)setActiveScans:(id)a3;
- (void)setAnyScanResultsRequested:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setLiveDevices:(id)a3;
- (void)stateDidChange:(int64_t)a3;
- (void)timerFinished:(id)a3;
- (void)unregisterAllDeviceChanges;
- (void)unregisterForDevices:(id)a3;
@end

@implementation WPDeviceScanner

- (WPDeviceScanner)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WPDeviceScanner;
  v7 = [(WPClient *)&v14 initWithQueue:a4 machName:0];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    uint64_t v9 = [MEMORY[0x263EFF980] array];
    liveDevices = v8->_liveDevices;
    v8->_liveDevices = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    activeScans = v8->_activeScans;
    v8->_activeScans = (NSMutableDictionary *)v11;

    v8->_anyScanResultsRequested = 0;
  }

  return v8;
}

- (WPDeviceScanner)initWithDelegate:(id)a3
{
  return [(WPDeviceScanner *)self initWithDelegate:a3 queue:0];
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  v9.receiver = self;
  v9.super_class = (Class)WPDeviceScanner;
  v4 = [(WPClient *)&v9 description];
  v5 = [v3 stringWithString:v4];

  id v6 = [(WPDeviceScanner *)self liveDevices];
  v7 = [(WPDeviceScanner *)self activeScans];
  [v5 appendFormat:@". LiveDevices = %@, Scans = %@", v6, v7];

  return v5;
}

- (id)clientAsString
{
  return @"WPDeviceScanner";
}

- (void)invalidate
{
  [(WPDeviceScanner *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)WPDeviceScanner;
  [(WPClient *)&v3 invalidate];
}

- (void)registerForAnyScanResults:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_12);
  }
  v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    *(_DWORD *)buf = 67109376;
    BOOL v9 = [(WPDeviceScanner *)self anyScanResultsRequested];
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_2144AA000, v6, OS_LOG_TYPE_DEFAULT, "Device Scanner registering for spy scan results: current %d, new %d", buf, 0xEu);
  }
  if ([(WPDeviceScanner *)self anyScanResultsRequested] != v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)WPDeviceScanner;
    [(WPClient *)&v7 registerForAnyScanResults:v3];
  }
}

- (void)registerForDevicesMatching:(id)a3 options:(id)a4
{
  v56[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  objc_super v7 = [a3 objectForKeyedSubscript:@"kPuckTypes"];
  v8 = [v6 allKeys];
  int v9 = [v8 containsObject:@"kScanDuration"];

  v34 = v6;
  if (v9)
  {
    id v10 = [v6 objectForKeyedSubscript:@"kScanDuration"];
    BOOL v11 = (void *)MEMORY[0x263EFFA20];
    [v10 floatValue];
    v13 = [v11 scheduledTimerWithTimeInterval:self target:sel_timerFinished_ selector:0 userInfo:0 repeats:v12];
    objc_super v14 = [(WPDeviceScanner *)self activeScans];
    v55[0] = @"kPuckTypes";
    v55[1] = @"kFoundDevices";
    v56[0] = v7;
    id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
    v56[1] = v15;
    v16 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
    v17 = [v13 description];
    [v14 setValue:v16 forKey:v17];
  }
  else
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v10 = v7;
    uint64_t v18 = [v10 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v50 != v20) {
            objc_enumerationMutation(v10);
          }
          uint64_t v22 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          v23 = [(WPDeviceScanner *)self liveDevices];
          char v24 = [v23 containsObject:v10];

          if ((v24 & 1) == 0)
          {
            v25 = [(WPDeviceScanner *)self liveDevices];
            [v25 addObject:v22];
          }
        }
        uint64_t v19 = [v10 countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v19);
    }
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = v7;
  uint64_t v26 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v46;
    int64x2_t v35 = vdupq_n_s64(0x12CuLL);
    int64x2_t v36 = vdupq_n_s64(0x17uLL);
    while (2)
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v46 != v28) {
          objc_enumerationMutation(obj);
        }
        v30 = *(void **)(*((void *)&v45 + 1) + 8 * j);
        v31 = objc_opt_new();
        if ([v30 isEqualToString:@"WPPuckCompany"])
        {
          [v31 setActiveScanning:1];
          int64x2_t v43 = v36;
          uint64_t v44 = 23;
          uint64_t v32 = 2;
          v33 = (long long *)&v43;
        }
        else if ([v30 isEqualToString:@"WPPuckBeaconNoRanging"])
        {
          int64x2_t v41 = v35;
          uint64_t v42 = 30;
          uint64_t v32 = 2;
          v33 = (long long *)&v41;
        }
        else
        {
          if (![v30 isEqualToString:@"WPPuckAirPrint"])
          {

            goto LABEL_27;
          }
          long long v39 = xmmword_2144DEB00;
          uint64_t v40 = 30;
          uint64_t v32 = 3;
          v33 = &v39;
        }
        [v31 setScanningRates:v33];
        [v31 setAllowDuplicates:1];
        [v31 setClientType:v32];
        v38.receiver = self;
        v38.super_class = (Class)WPDeviceScanner;
        [(WPClient *)&v38 startScanning:v31];
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v27) {
        continue;
      }
      break;
    }
  }
LABEL_27:
}

- (void)unregisterForDevices:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v4 = [a3 objectForKey:@"kPuckTypes"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        if (([v9 isEqualToString:@"WPPuckCompany"] & 1) != 0
          || [v9 isEqualToString:@"WPPuckBeaconNoRanging"])
        {
          id v10 = objc_opt_new();
          [v10 setClientType:2];
          -[WPClient stopScanning:](&v14, sel_stopScanning_, v10, v13.receiver, v13.super_class, self, WPDeviceScanner);
LABEL_9:

          goto LABEL_10;
        }
        if ([v9 isEqualToString:@"WPPuckAirPrint"])
        {
          id v10 = objc_opt_new();
          [v10 setClientType:3];
          -[WPClient stopScanning:](&v13, sel_stopScanning_, v10, self, WPDeviceScanner, v14.receiver, v14.super_class);
          goto LABEL_9;
        }
LABEL_10:
        ++v8;
      }
      while (v6 != v8);
      uint64_t v11 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v6 = v11;
    }
    while (v11);
  }
  float v12 = [(WPDeviceScanner *)self liveDevices];
  [v12 removeObjectsInArray:v4];
}

- (void)unregisterAllDeviceChanges
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = @"kPuckTypes";
  BOOL v3 = [(WPDeviceScanner *)self liveDevices];
  v6[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [(WPDeviceScanner *)self unregisterForDevices:v4];
}

- (void)stateDidChange:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WPDeviceScanner;
  [(WPClient *)&v7 stateDidChange:a3];
  v4 = [(WPDeviceScanner *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(WPDeviceScanner *)self delegate];
    [v6 deviceScannerDidUpdateState:self];
  }
}

- (void)anyDiscoveredDevice:(id)a3
{
  v28[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 objectForKeyedSubscript:@"kDeviceRSSI"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"kDevicePeripheralUUID"];
  objc_super v7 = [v4 objectForKeyedSubscript:@"kDeviceAdvertisingData"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"kDeviceChannel"];
  int v9 = [v4 objectForKeyedSubscript:@"kDeviceAdvertisingPacket"];
  id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263EFECC8]];
  uint64_t v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263EFECF0]];
  float v12 = [v4 objectForKeyedSubscript:@"kDeviceTime"];

  if (v7)
  {
    if ((unint64_t)[v7 length] > 3)
    {
      char v24 = self;
      id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v25 = v7;
      uint64_t v16 = *(unsigned __int8 *)([v25 bytes] + 2);
      uint64_t v26 = v5;
      [v15 setObject:v5 forKeyedSubscript:@"kPuckRSSI"];
      uint64_t v27 = v6;
      [v15 setObject:v6 forKeyedSubscript:@"kPuckID"];
      [v15 setObject:v10 forKeyedSubscript:@"kPuckSaturated"];
      [v15 setObject:v11 forKeyedSubscript:@"kPuckWlanOn"];
      [v15 setObject:v8 forKeyedSubscript:@"kPuckAdvertisingChannel"];
      long long v17 = [NSNumber numberWithUnsignedChar:v16];
      v28[0] = v17;
      long long v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
      [v15 setObject:v18 forKeyedSubscript:@"kPuckTypes"];

      uint64_t v19 = (void *)MEMORY[0x263EFF8F8];
      id v20 = v25;
      v21 = objc_msgSend(v19, "dataWithBytes:length:", objc_msgSend(v20, "bytes") + 4, (int)(objc_msgSend(v20, "length") - 4));
      [v15 setObject:v21 forKeyedSubscript:@"kPuckAdvertisingData"];

      [v15 setObject:v12 forKeyedSubscript:@"kPuckDeviceTime"];
      uint64_t v22 = [(WPDeviceScanner *)v24 delegate];
      LOBYTE(v20) = objc_opt_respondsToSelector();

      if (v20)
      {
        v23 = [(WPDeviceScanner *)v24 delegate];
        [v23 scanner:v24 foundAnyDevice:v27 withData:v15];
      }
      char v5 = v26;
      uint64_t v6 = v27;
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_162_0);
      }
      objc_super v13 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDeviceScanner anyDiscoveredDevice:](v13, v7);
      }
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_159_1);
    }
    objc_super v14 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDeviceScanner anyDiscoveredDevice:](v14);
    }
  }
}

- (void)deviceDiscovered:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 objectForKeyedSubscript:@"kDeviceRSSI"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"kDevicePeripheralUUID"];
  objc_super v7 = [v4 objectForKeyedSubscript:@"kDeviceAdvertisingData"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"kDeviceChannel"];
  int v9 = [v4 objectForKeyedSubscript:@"kDeviceAdvertisingPacket"];
  id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263EFECC8]];
  uint64_t v44 = [v9 objectForKeyedSubscript:*MEMORY[0x263EFECF0]];
  int64x2_t v43 = [v4 objectForKeyedSubscript:@"kDeviceTime"];
  if (!v7)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_190_1);
    }
    float v12 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDeviceScanner anyDiscoveredDevice:](v12);
    }
    goto LABEL_40;
  }
  if ((unint64_t)[v7 length] <= 3)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_193_0);
    }
    uint64_t v11 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDeviceScanner anyDiscoveredDevice:](v11, v7);
    }
    goto LABEL_40;
  }
  uint64_t v42 = v9;
  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v14 = v7;
  uint64_t v15 = [v14 bytes];
  unsigned int v50 = *(unsigned __int8 *)(v15 + 2);
  [v13 setObject:v5 forKeyedSubscript:@"kPuckRSSI"];
  [v13 setObject:v6 forKeyedSubscript:@"kPuckID"];
  int64x2_t v41 = v10;
  [v13 setObject:v10 forKeyedSubscript:@"kPuckSaturated"];
  [v13 setObject:v44 forKeyedSubscript:@"kPuckWlanOn"];
  [v13 setObject:v8 forKeyedSubscript:@"kPuckAdvertisingChannel"];
  [v13 setObject:v43 forKeyedSubscript:@"kPuckDeviceTime"];
  if (!-[WPDeviceScanner parseType:atOffset:withSize:intoDictionary:](self, "parseType:atOffset:withSize:intoDictionary:", v50, v15 + 4, [v14 length] - 4, v13))goto LABEL_39; {
  v37 = v7;
  }
  objc_super v38 = v6;
  long long v39 = v5;
  id v40 = v4;
  long long v49 = [v13 objectForKeyedSubscript:@"kPuckTypes"];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v16 = [(WPDeviceScanner *)self activeScans];
  long long v17 = [v16 allKeys];

  obuint64_t j = v17;
  uint64_t v51 = [v17 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (!v51) {
    goto LABEL_29;
  }
  long long v47 = self;
  uint64_t v48 = *(void *)v61;
  id v46 = v13;
  do
  {
    for (uint64_t i = 0; i != v51; ++i)
    {
      if (*(void *)v61 != v48) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void *)(*((void *)&v60 + 1) + 8 * i);
      id v20 = [(WPDeviceScanner *)self activeScans];
      v21 = [v20 objectForKeyedSubscript:v19];

      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v22 = v49;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v56 objects:v65 count:16];
      if (!v23) {
        goto LABEL_26;
      }
      uint64_t v24 = v23;
      char v25 = 0;
      uint64_t v26 = *(void *)v57;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v57 != v26) {
            objc_enumerationMutation(v22);
          }
          uint64_t v28 = *(void *)(*((void *)&v56 + 1) + 8 * j);
          v29 = [v21 objectForKeyedSubscript:@"kPuckTypes"];
          LOBYTE(v28) = [v29 containsObject:v28];

          v25 |= v28;
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v56 objects:v65 count:16];
      }
      while (v24);

      id v13 = v46;
      self = v47;
      if (v25)
      {
        id v22 = [v21 objectForKeyedSubscript:@"kFoundDevices"];
        [v22 addObject:v46];
LABEL_26:
      }
    }
    uint64_t v51 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
  }
  while (v51);
LABEL_29:

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v30 = v49;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v52 objects:v64 count:16];
  objc_super v7 = v37;
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v53;
    do
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v53 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void *)(*((void *)&v52 + 1) + 8 * k);
        int64x2_t v36 = [(WPDeviceScanner *)self liveDevices];
        LODWORD(v35) = [v36 containsObject:v35];

        if (v35) {
          [(WPDeviceScanner *)self postDevice:v13];
        }
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v52 objects:v64 count:16];
    }
    while (v32);
  }

  char v5 = v39;
  id v4 = v40;
  uint64_t v6 = v38;
LABEL_39:

  id v10 = v41;
  int v9 = v42;
LABEL_40:
}

- (BOOL)parseType:(unsigned __int8)a3 atOffset:(char *)a4 withSize:(int)a5 intoDictionary:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  int v8 = a3;
  id v10 = a6;
  if (v8 == 3)
  {
    [(WPDeviceScanner *)self parseAirPrint:a4 forSize:v6 intoDictionary:v10];
  }
  else
  {
    if (v8 != 2)
    {
      BOOL v11 = 0;
      goto LABEL_7;
    }
    [(WPDeviceScanner *)self parseCompanyData:a4 forSize:v6 intoDictionary:v10];
  }
  BOOL v11 = 1;
LABEL_7:

  return v11;
}

- (void)parseCompanyData:(char *)a3 forSize:(int)a4 intoDictionary:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a5;
  long long v20 = 0uLL;
  if (a4 < 16 || (long long v20 = *(_OWORD *)a3, a4 < 0x12))
  {
    char v11 = 0;
    unsigned int v9 = 0;
LABEL_7:
    uint64_t v10 = 0;
    goto LABEL_8;
  }
  unsigned int v9 = __rev16(*((unsigned __int16 *)a3 + 8));
  if (a4 < 0x14)
  {
    char v11 = 0;
    goto LABEL_7;
  }
  uint64_t v10 = __rev16(*((unsigned __int16 *)a3 + 9));
  if (a4 == 20)
  {
    char v11 = 0;
LABEL_8:
    float v12 = 0;
    goto LABEL_9;
  }
  char v11 = a3[20];
  if (a4 < 0x16) {
    goto LABEL_8;
  }
  float v12 = [NSNumber numberWithUnsignedChar:a3[21]];
LABEL_9:
  id v13 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v20];
  if (v13)
  {
    [v8 setObject:v13 forKeyedSubscript:@"kPuckCompanyUUID"];
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_199);
    }
    id v14 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2144AA000, v14, OS_LOG_TYPE_DEFAULT, "Company UUID was nil", buf, 2u);
    }
  }
  uint64_t v15 = [NSNumber numberWithChar:v11];
  [v8 setObject:v15 forKeyedSubscript:@"kPuckTx"];

  uint64_t v16 = [NSNumber numberWithInteger:v9];
  [v8 setObject:v16 forKeyedSubscript:@"kPuckCompanyMajor"];

  long long v17 = [NSNumber numberWithInteger:v10];
  [v8 setObject:v17 forKeyedSubscript:@"kPuckCompanyMinor"];

  if (v12)
  {
    [v8 setObject:v12 forKeyedSubscript:@"kPuckConfig"];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_214_0);
    }
    long long v18 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDeviceScanner parseCompanyData:forSize:intoDictionary:](v12, v18);
    }
  }
  [(WPDeviceScanner *)self addPuckType:@"WPPuckBeaconNoRanging" toDictionary:v8];
  [(WPDeviceScanner *)self addPuckType:@"WPPuckCompany" toDictionary:v8];
}

- (void)parseAirPrint:(char *)a3 forSize:(int)a4 intoDictionary:(id)a5
{
  if (a3 && a4)
  {
    objc_super v7 = (void *)MEMORY[0x263EFF8F8];
    uint64_t v8 = a4;
    id v10 = a5;
    unsigned int v9 = [v7 dataWithBytes:a3 length:v8];
    [v10 setObject:v9 forKeyedSubscript:@"kPuckAirPrintData"];

    [(WPDeviceScanner *)self addPuckType:@"WPPuckAirPrint" toDictionary:v10];
  }
}

- (void)addPuckType:(id)a3 toDictionary:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = [v5 objectForKey:@"kPuckTypes"];
  if (v7)
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:@"kPuckTypes"];
    [v8 addObject:v6];
  }
  else
  {
    unsigned int v9 = (void *)MEMORY[0x263EFF980];
    v12[0] = v6;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    char v11 = [v9 arrayWithArray:v10];

    [v5 setObject:v11 forKey:@"kPuckTypes"];
  }
}

- (void)postDevice:(id)a3
{
  id v8 = a3;
  id v4 = [(WPDeviceScanner *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPDeviceScanner *)self delegate];
    objc_super v7 = [v8 objectForKeyedSubscript:@"kPuckID"];
    [v6 scanner:self foundDevice:v7 withData:v8];
  }
}

- (void)postDevices:(id)a3
{
  id v7 = a3;
  id v4 = [(WPDeviceScanner *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPDeviceScanner *)self delegate];
    [v6 scanner:self foundRequestedDevices:v7];
  }
}

- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  id v8 = a3;
  char v5 = [(WPDeviceScanner *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WPDeviceScanner *)self delegate];
    [v7 scanner:self didFailToRegisterDevices:0 withError:v8];
  }
}

- (void)timerFinished:(id)a3
{
  id v4 = a3;
  char v5 = [(WPDeviceScanner *)self activeScans];
  char v6 = [v4 description];
  id v10 = [v5 objectForKeyedSubscript:v6];

  id v7 = [v10 objectForKeyedSubscript:@"kFoundDevices"];
  [(WPDeviceScanner *)self postDevices:v7];

  id v8 = [(WPDeviceScanner *)self activeScans];
  unsigned int v9 = [v4 description];

  [v8 removeObjectForKey:v9];
}

- (WPDeviceScannerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WPDeviceScannerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)liveDevices
{
  return self->_liveDevices;
}

- (void)setLiveDevices:(id)a3
{
}

- (NSMutableDictionary)activeScans
{
  return self->_activeScans;
}

- (void)setActiveScans:(id)a3
{
}

- (BOOL)anyScanResultsRequested
{
  return self->_anyScanResultsRequested;
}

- (void)setAnyScanResultsRequested:(BOOL)a3
{
  self->_anyScanResultsRequested = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeScans, 0);
  objc_storeStrong((id *)&self->_liveDevices, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)anyDiscoveredDevice:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2144AA000, log, OS_LOG_TYPE_ERROR, "Discovered a puck with no MFR data, ignoring", v1, 2u);
}

- (void)anyDiscoveredDevice:(void *)a1 .cold.2(void *a1, void *a2)
{
  id v3 = a1;
  [a2 length];
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "Device Scanner: Minimum advertisement data length expected: 4, received: %lu", v6, v7, v8, v9, 0);
}

- (void)parseCompanyData:(unsigned __int8)a1 forSize:(NSObject *)a2 intoDictionary:.cold.1(unsigned __int8 a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  id v3 = @"kPuckConfig";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_debug_impl(&dword_2144AA000, a2, OS_LOG_TYPE_DEBUG, "%@: %02x", (uint8_t *)&v2, 0x12u);
}

@end