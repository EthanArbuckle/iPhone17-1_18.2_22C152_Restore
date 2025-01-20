@interface WPHomeKit
- ($2825F4736939C4A6D3AD43837233062D)homeKitScanTypeToCBDiscoveryScanRates:(int64_t)a3;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)dutyCycleToScanningRates:(SEL)a3;
- (BOOL)discoveryFlagsContains:(int64_t)a3;
- (BOOL)isHomeKitScanActive:(unint64_t)a3;
- (BOOL)isWHBSupported;
- (WPHomeKit)initWithDelegate:(id)a3 queue:(id)a4;
- (WPHomeKitDelegate)delegate;
- (id)clientAsString;
- (id)homeKitCBDiscovery;
- (id)startCBDiscoveryScan:(id)a3 forType:(int64_t)a4;
- (int64_t)homeKitTypeFromCBDiscoveryFlag:(unint64_t)a3;
- (int64_t)homeKitTypeFromClientType:(unsigned __int8)a3;
- (unint64_t)homeKitTypeToCBDiscoveryFlag:(int64_t)a3;
- (unsigned)clientTypeFromHomeKitType:(int64_t)a3;
- (void)checkAllowDuplicate;
- (void)deviceDiscovered:(id)a3;
- (void)deviceFoundHandler:(id)a3 cached:(BOOL)a4;
- (void)deviceLostHandler:(id)a3;
- (void)invalidate;
- (void)invalidateWHBScanSession;
- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4;
- (void)scanningStartedOfType:(unsigned __int8)a3;
- (void)scanningStoppedOfType:(unsigned __int8)a3;
- (void)setDelegate:(id)a3;
- (void)setHomeKitCBDiscovery:(id)a3;
- (void)setStartScanParametersfor:(id)a3 withValues:(id)a4 forType:(int64_t)a5;
- (void)setStopScanParametersforType:(int64_t)a3;
- (void)startScanningWithData:(id)a3 forType:(int64_t)a4;
- (void)stateDidChange:(int64_t)a3;
- (void)stopCBDiscoveryScan:(int64_t)a3;
- (void)stopScanningForType:(int64_t)a3;
- (void)tearDownCBDiscovery;
@end

@implementation WPHomeKit

- (WPHomeKit)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WPHomeKit;
  v7 = [(WPClient *)&v10 initWithQueue:a4 machName:0];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  return v8;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)dutyCycleToScanningRates:(SEL)a3
{
  retstr->var2 = 30;
  *(_OWORD *)&retstr->var0 = xmmword_2144DEAC0;
  switch(a4)
  {
    case 2:
LABEL_7:
      int64_t v5 = 60;
      goto LABEL_8;
    case 1:
      self = ($9FE6E10C8CE45DBC9A88DFDEA39A390D *)_os_feature_enabled_impl();
      if (self)
      {
        *(int64x2_t *)&retstr->var0 = vdupq_n_s64(0x1EuLL);
        return self;
      }
      goto LABEL_7;
    case 0:
      int64_t v5 = 300;
LABEL_8:
      retstr->var0 = v5;
      return self;
  }
  v7 = self;
  id v8 = [MEMORY[0x263F08690] currentHandler];
  [v8 handleFailureInMethod:a3 object:v7 file:@"WPHomeKit.m" lineNumber:86 description:@"Unknown duty cycle type"];

  return self;
}

- (unsigned)clientTypeFromHomeKitType:(int64_t)a3
{
  if (!a3) {
    return 6;
  }
  if (a3 != 1)
  {
    objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", @"UnknownHomeKitType", @"The HomeKit type isn't valid", 0, v3, v4);
    id v6 = objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return 17;
}

- (int64_t)homeKitTypeFromClientType:(unsigned __int8)a3
{
  if (a3 == 6) {
    return 0;
  }
  if (a3 != 17)
  {
    uint64_t v4 = (void *)MEMORY[0x263EFF940];
    int64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"The client type %ld isn't valid", a3);
    id v6 = [v4 exceptionWithName:@"UnknownClientType" reason:v5 userInfo:0];

    objc_exception_throw(v6);
  }
  return 1;
}

- (id)clientAsString
{
  return @"WPHomeKit";
}

- (void)invalidate
{
  [(WPHomeKit *)self setDelegate:0];
  if (self->_homeKitCBDiscovery) {
    [(WPHomeKit *)self tearDownCBDiscovery];
  }
  v3.receiver = self;
  v3.super_class = (Class)WPHomeKit;
  [(WPClient *)&v3 invalidate];
}

- (void)startScanningWithData:(id)a3 forType:(int64_t)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global);
  }
  id v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v55 = v7;
    __int16 v56 = 2048;
    int64_t v57 = a4;
    _os_log_impl(&dword_2144AA000, v8, OS_LOG_TYPE_DEFAULT, "HomeKit startScanningWithData %@, type %ld", buf, 0x16u);
  }
  int64_t v38 = a4;
  v9 = [v7 objectForKeyedSubscript:@"WPHomeKitScanBlobData"];
  objc_super v10 = [v7 objectForKeyedSubscript:@"WPHomeKitScanMaskData"];
  v11 = [v7 objectForKeyedSubscript:@"WPHomeKitScanDutyCycle"];
  uint64_t v12 = [v7 objectForKeyedSubscript:@"WPHomeKitScanOptionRange"];
  v13 = [v7 objectForKeyedSubscript:@"WPHomeKitScanOptionWHB"];
  if (v13)
  {
    v14 = [v7 objectForKeyedSubscript:@"WPHomeKitScanOptionWHB"];
    char v15 = [v14 BOOLValue] ^ 1;
  }
  else
  {
    char v15 = 1;
  }

  [v7 objectForKeyedSubscript:@"WPHomeKitScanOptionRetainDuplicates"];
  v40 = v39 = (void *)v12;
  if (!v9 && v10)
  {
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v52 = *MEMORY[0x263F08320];
    v17 = [NSString stringWithFormat:@"Invalid blob data provided, Blob Data: %@ is null but Mask data: %@ is not null", 0, v10];
    v53 = v17;
    v18 = [NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    v19 = [v16 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v18];

    goto LABEL_22;
  }
  if (v9 && v10)
  {
    unint64_t v20 = [v10 length];
    if (v20 > [v9 length])
    {
      v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v50 = *MEMORY[0x263F08320];
      v17 = [NSString stringWithFormat:@"Invalid mask data provided, Mask data length: %lu > Blob data length: %lu", objc_msgSend(v10, "length"), objc_msgSend(v9, "length")];
      v51 = v17;
      v22 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      v19 = [v21 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v22];

      goto LABEL_22;
    }
  }
  else if (!v9)
  {
    goto LABEL_17;
  }
  if ((unint64_t)[v9 length] > 0x16)
  {
LABEL_21:
    v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v48 = *MEMORY[0x263F08320];
    v17 = [NSString stringWithFormat:@"Invalid data provided, Blob data: %@, Mask data: %@, Duty Cycle: %@", v9, v10, v11];
    v49 = v17;
    v24 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    v19 = [v23 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v24];

    goto LABEL_22;
  }
LABEL_17:
  if (v10 && (unint64_t)[v10 length] > 0x16
    || [v11 integerValue] < 0
    || [v11 integerValue] >= 3)
  {
    goto LABEL_21;
  }
  if (v15) {
    goto LABEL_27;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_174);
  }
  v33 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2144AA000, v33, OS_LOG_TYPE_DEFAULT, "HomeKit WHB scan requested", buf, 2u);
  }
  if (![(WPHomeKit *)self isWHBSupported])
  {
    v34 = [MEMORY[0x263F08690] currentHandler];
    [v34 handleFailureInMethod:a2 object:self file:@"WPHomeKit.m" lineNumber:185 description:@"WHB Scan is only allowed on tvOS"];
  }
  v28 = v39;
  if (_os_feature_enabled_impl())
  {
    id v35 = [(WPHomeKit *)self startCBDiscoveryScan:v7 forType:v38];
LABEL_42:
    v19 = 0;
    goto LABEL_43;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_184);
  }
  v36 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPHomeKit startScanningWithData:forType:](v36);
  }
  v37 = (void *)MEMORY[0x263F087E8];
  uint64_t v46 = *MEMORY[0x263F08320];
  v47 = @"WHB scan is not enabled.";
  v17 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
  v19 = [v37 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v17];
LABEL_22:

  if (!v19)
  {
LABEL_27:
    v29 = objc_opt_new();
    -[WPHomeKit dutyCycleToScanningRates:](self, "dutyCycleToScanningRates:", [v11 integerValue]);
    long long v42 = v44;
    uint64_t v43 = v45;
    [v29 setScanningRates:&v42];
    [v29 setAllowDuplicates:0];
    objc_msgSend(v29, "setClientType:", -[WPHomeKit clientTypeFromHomeKitType:](self, "clientTypeFromHomeKitType:", v38));
    objc_msgSend(v29, "setActiveScanning:", objc_msgSend(v11, "integerValue") == 2);
    [v29 setBlobValue:v9];
    [v29 setMaskValue:v10];
    v28 = v39;
    if (v39) {
      uint64_t v30 = [v39 BOOLValue];
    }
    else {
      uint64_t v30 = 0;
    }
    [v29 setRange:v30];
    if (v40)
    {
      if (_os_feature_enabled_impl())
      {
        objc_msgSend(v29, "setRetainDuplicates:", objc_msgSend(v40, "BOOLValue"));
      }
      else
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_190);
        }
        v31 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2144AA000, v31, OS_LOG_TYPE_DEFAULT, "HomeKit scan option retain duplicates is not enabled.", buf, 2u);
        }
      }
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_193);
    }
    v32 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v55 = v29;
      _os_log_impl(&dword_2144AA000, v32, OS_LOG_TYPE_DEFAULT, "HomeKit start scan with %@", buf, 0xCu);
    }
    v41.receiver = self;
    v41.super_class = (Class)WPHomeKit;
    [(WPClient *)&v41 startScanning:v29];

    goto LABEL_42;
  }
  v25 = [(WPHomeKit *)self delegate];
  char v26 = objc_opt_respondsToSelector();

  if (v26)
  {
    v27 = [(WPHomeKit *)self delegate];
    [v27 homeKit:self failedToStartScanningWithError:v19 forType:v38];
  }
  v28 = v39;
LABEL_43:
}

- (void)stopScanningForType:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_197);
  }
  int64_t v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v11 = a3;
    _os_log_impl(&dword_2144AA000, v5, OS_LOG_TYPE_DEFAULT, "HomeKit stopScanning type %ld", buf, 0xCu);
  }
  if (self->_homeKitCBDiscovery && [(WPHomeKit *)self discoveryFlagsContains:a3])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_200);
    }
    id v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v11 = a3;
      _os_log_impl(&dword_2144AA000, v6, OS_LOG_TYPE_DEFAULT, "HomeKit CBDiscovery stopScanning type %ld", buf, 0xCu);
    }
    [(WPHomeKit *)self stopCBDiscoveryScan:a3];
  }
  else
  {
    id v7 = objc_opt_new();
    objc_msgSend(v7, "setClientType:", -[WPHomeKit clientTypeFromHomeKitType:](self, "clientTypeFromHomeKitType:", a3));
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_203);
    }
    id v8 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v11 = (int64_t)v7;
      _os_log_impl(&dword_2144AA000, v8, OS_LOG_TYPE_DEFAULT, "HomeKit stop scan with %@", buf, 0xCu);
    }
    v9.receiver = self;
    v9.super_class = (Class)WPHomeKit;
    [(WPClient *)&v9 stopScanning:v7];
  }
}

- (void)stateDidChange:(int64_t)a3
{
  int64_t v5 = [(WPClient *)self state];
  v9.receiver = self;
  v9.super_class = (Class)WPHomeKit;
  [(WPClient *)&v9 stateDidChange:a3];
  if ([(WPClient *)self state] != v5)
  {
    id v6 = [(WPHomeKit *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(WPHomeKit *)self delegate];
      [v8 homeKitDidUpdateState:self];
    }
  }
}

- (void)checkAllowDuplicate
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __32__WPHomeKit_checkAllowDuplicate__block_invoke;
  v3[3] = &unk_26420E658;
  v3[4] = self;
  v2.receiver = self;
  v2.super_class = (Class)WPHomeKit;
  [(WPClient *)&v2 checkAllowDuplicates:v3];
}

void __32__WPHomeKit_checkAllowDuplicate__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 homeKit:*(void *)(a1 + 32) allowDuplicate:a2];
  }
}

- (void)deviceDiscovered:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [v12 objectForKeyedSubscript:@"kDevicePeripheralUUID"];
  char v5 = [v12 objectForKeyedSubscript:@"kDeviceAdvertisingPacket"];
  id v6 = [v12 objectForKeyedSubscript:@"kDeviceType"];
  unsigned __int8 v7 = [v6 integerValue];

  id v8 = [(WPHomeKit *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    objc_super v10 = [v12 objectForKeyedSubscript:@"kDeviceRSSI"];
    int64_t v11 = [(WPHomeKit *)self delegate];
    objc_msgSend(v11, "homeKit:foundDevice:withData:RSSI:type:", self, v4, v5, v10, -[WPHomeKit homeKitTypeFromClientType:](self, "homeKitTypeFromClientType:", v7));
  }
}

- (void)scanningStartedOfType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  char v5 = [(WPHomeKit *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WPHomeKit *)self delegate];
    objc_msgSend(v7, "homeKitStartedScanning:forType:", self, -[WPHomeKit homeKitTypeFromClientType:](self, "homeKitTypeFromClientType:", v3));
  }
}

- (void)scanningStoppedOfType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  char v5 = [(WPHomeKit *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WPHomeKit *)self delegate];
    objc_msgSend(v7, "homeKitStoppedScanning:forType:", self, -[WPHomeKit homeKitTypeFromClientType:](self, "homeKitTypeFromClientType:", v3));
  }
}

- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v9 = a3;
  char v6 = [(WPHomeKit *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(WPHomeKit *)self delegate];
    objc_msgSend(v8, "homeKit:failedToStartScanningWithError:forType:", self, v9, -[WPHomeKit homeKitTypeFromClientType:](self, "homeKitTypeFromClientType:", v4));
  }
}

- (void)setStartScanParametersfor:(id)a3 withValues:(id)a4 forType:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v17 = [v8 objectForKeyedSubscript:@"WPHomeKitScanDutyCycle"];
  objc_super v10 = [v8 objectForKeyedSubscript:@"WPHomeKitScanOptionRange"];

  $2825F4736939C4A6D3AD43837233062D v11 = -[WPHomeKit homeKitScanTypeToCBDiscoveryScanRates:](self, "homeKitScanTypeToCBDiscoveryScanRates:", [v17 integerValue]);
  uint64_t v12 = [v9 discoveryFlags];
  unint64_t v13 = [(WPHomeKit *)self homeKitTypeToCBDiscoveryFlag:a5] | v12;
  uint64_t v14 = 0x400002000000;
  if (!v11.var1) {
    uint64_t v14 = 0x400000000000;
  }
  unint64_t v15 = v13 | v14;
  if ([v10 BOOLValue]) {
    uint64_t v16 = v15 | 0x10000000000;
  }
  else {
    uint64_t v16 = v15;
  }
  [v9 setDiscoveryFlags:v16];
  [v9 setBleScanRate:v11];
  [v9 setBleScanRateScreenOff:HIDWORD(*(unint64_t *)&v11)];
  [v9 setBleRSSIThresholdHint:4294967206];
}

- (void)setStopScanParametersforType:(int64_t)a3
{
  uint64_t v5 = [self->_homeKitCBDiscovery discoveryFlags];
  unint64_t v6 = v5 & ~[(WPHomeKit *)self homeKitTypeToCBDiscoveryFlag:a3];
  if ([(WPHomeKit *)self isHomeKitScanActive:v6]) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = 0;
  }
  homeKitCBDiscovery = self->_homeKitCBDiscovery;

  [homeKitCBDiscovery setDiscoveryFlags:v7];
}

- (void)deviceFoundHandler:(id)a3 cached:(BOOL)a4
{
  BOOL v4 = a4;
  v29[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_222);
  }
  unint64_t v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPHomeKit deviceFoundHandler:cached:]((uint64_t)v6, v7);
  }
  id v8 = objc_alloc(MEMORY[0x263F08C38]);
  id v9 = [v6 identifier];
  v25 = (void *)[v8 initWithUUIDString:v9];

  v24 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "bleRSSI"));
  int64_t v23 = -[WPHomeKit homeKitTypeFromCBDiscoveryFlag:](self, "homeKitTypeFromCBDiscoveryFlag:", [v6 discoveryFlags]);
  objc_super v10 = [v6 btAddressData];
  v28[0] = *MEMORY[0x263EFECB8];
  $2825F4736939C4A6D3AD43837233062D v11 = [v6 bleAppleManufacturerData];
  v29[0] = v11;
  v28[1] = *MEMORY[0x263EFECB0];
  uint64_t v12 = [v6 name];
  unint64_t v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  else {
    uint64_t v14 = &stru_26C5381C8;
  }
  v29[1] = v14;
  v28[2] = @"kDeviceStableIdentifier";
  uint64_t v15 = [v6 stableIdentifier];
  uint64_t v16 = (void *)v15;
  if (v15) {
    id v17 = (__CFString *)v15;
  }
  else {
    id v17 = &stru_26C5381C8;
  }
  v29[2] = v17;
  v28[3] = *MEMORY[0x263EFEC88];
  v18 = v10;
  if (!v10)
  {
    v18 = [MEMORY[0x263EFF8F8] data];
  }
  v29[3] = v18;
  v28[4] = @"kCachedAdvertisement";
  v19 = [NSNumber numberWithBool:v4];
  v29[4] = v19;
  unint64_t v20 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:5];

  if (!v10) {
  v26[0] = @"kDeviceAdvertisingPacket";
  }
  v26[1] = @"kDevicePeripheralUUID";
  v27[0] = v20;
  v27[1] = v25;
  v27[2] = v24;
  v26[2] = @"kDeviceRSSI";
  v26[3] = @"kDeviceType";
  v21 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[WPHomeKit clientTypeFromHomeKitType:](self, "clientTypeFromHomeKitType:", v23));
  v27[3] = v21;
  v22 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];

  [(WPHomeKit *)self deviceDiscovered:v22];
}

- (void)deviceLostHandler:(id)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_230);
  }
  uint64_t v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPHomeKit deviceLostHandler:]((uint64_t)v4, v5);
  }
  id v6 = objc_alloc(MEMORY[0x263F08C38]);
  unint64_t v7 = [v4 identifier];
  id v8 = (void *)[v6 initWithUUIDString:v7];

  id v9 = [v4 btAddressData];
  v18[0] = @"kDeviceStableIdentifier";
  uint64_t v10 = [v4 stableIdentifier];
  $2825F4736939C4A6D3AD43837233062D v11 = (void *)v10;
  uint64_t v12 = &stru_26C5381C8;
  if (v10) {
    uint64_t v12 = (__CFString *)v10;
  }
  v19[0] = v12;
  v18[1] = *MEMORY[0x263EFEC88];
  unint64_t v13 = v9;
  if (!v9)
  {
    unint64_t v13 = [MEMORY[0x263EFF8F8] data];
  }
  v19[1] = v13;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  if (!v9) {

  }
  uint64_t v15 = [(WPHomeKit *)self delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    id v17 = [(WPHomeKit *)self delegate];
    [v17 homeKit:self lostDevice:v8 withData:v14];
  }
}

- (id)startCBDiscoveryScan:(id)a3 forType:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_234);
  }
  unint64_t v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v6;
    __int16 v27 = 2048;
    int64_t v28 = a4;
    _os_log_impl(&dword_2144AA000, v7, OS_LOG_TYPE_DEFAULT, "HomeKit CBDiscovery startCBDiscoveryScan %@, type %ld", buf, 0x16u);
  }
  p_homeKitCBDiscovery = &self->_homeKitCBDiscovery;
  homeKitCBDiscovery = self->_homeKitCBDiscovery;
  if (homeKitCBDiscovery)
  {
    [(WPHomeKit *)self setStartScanParametersfor:homeKitCBDiscovery withValues:v6 forType:a4];
    uint64_t v10 = [*p_homeKitCBDiscovery dispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__WPHomeKit_startCBDiscoveryScan_forType___block_invoke_247;
    block[3] = &unk_26420E6D0;
    block[4] = self;
    block[5] = a4;
    dispatch_async(v10, block);

    id v11 = 0;
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFEF30]);
    uint64_t v13 = [(WPClient *)self clientQueue];
    uint64_t v14 = (void *)v13;
    if (v13) {
      uint64_t v15 = v13;
    }
    else {
      uint64_t v15 = MEMORY[0x263EF83A0];
    }
    [v12 setDispatchQueue:v15];
    [(WPHomeKit *)self setStartScanParametersfor:v12 withValues:v6 forType:a4];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __42__WPHomeKit_startCBDiscoveryScan_forType___block_invoke_236;
    v24[3] = &unk_26420E680;
    v24[4] = self;
    [v12 setDeviceFoundHandler:v24];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __42__WPHomeKit_startCBDiscoveryScan_forType___block_invoke_2;
    v23[3] = &unk_26420E680;
    v23[4] = self;
    [v12 setDeviceLostHandler:v23];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __42__WPHomeKit_startCBDiscoveryScan_forType___block_invoke_3;
    void v19[3] = &unk_26420E6A8;
    id v11 = v12;
    id v20 = v11;
    v21 = self;
    int64_t v22 = a4;
    [v11 activateWithCompletion:v19];
    objc_storeStrong((id *)&self->_homeKitCBDiscovery, v12);
  }
  [(WPHomeKit *)self scanningStartedOfType:[(WPHomeKit *)self clientTypeFromHomeKitType:a4]];
  char v16 = *p_homeKitCBDiscovery;

  return v16;
}

uint64_t __42__WPHomeKit_startCBDiscoveryScan_forType___block_invoke_236(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deviceFoundHandler:a2 cached:0];
}

uint64_t __42__WPHomeKit_startCBDiscoveryScan_forType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deviceLostHandler:a2];
}

void __42__WPHomeKit_startCBDiscoveryScan_forType___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_239);
    }
    id v4 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v3;
      _os_log_impl(&dword_2144AA000, v4, OS_LOG_TYPE_DEFAULT, "### HomeKit CBDiscovery activation failed : %@", buf, 0xCu);
    }
    [*(id *)(a1 + 32) invalidate];
    [*(id *)(a1 + 40) setHomeKitCBDiscovery:0];
    uint64_t v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F08320];
    id v11 = @"HomeKit WHB scan via CBDiscovery failed";
    id v6 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    unint64_t v7 = [v5 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v6];

    objc_msgSend(*(id *)(a1 + 40), "scanningFailedToStart:ofType:", v7, objc_msgSend(*(id *)(a1 + 40), "clientTypeFromHomeKitType:", *(void *)(a1 + 48)));
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_245);
    }
    id v8 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      id v13 = v9;
      _os_log_impl(&dword_2144AA000, v8, OS_LOG_TYPE_DEFAULT, "HomeKit CBDiscovery activatied: %@", buf, 0xCu);
    }
  }
}

void __42__WPHomeKit_startCBDiscoveryScan_forType___block_invoke_247(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  objc_super v2 = [*(id *)(a1 + 32) homeKitCBDiscovery];
  id v3 = [v2 discoveredDevices];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v15;
    *(void *)&long long v6 = 138412290;
    long long v13 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        uint64_t v11 = objc_msgSend(v10, "discoveryFlags", v13, (void)v14);
        if (([*(id *)(a1 + 32) homeKitTypeToCBDiscoveryFlag:*(void *)(a1 + 40)] & v11) != 0)
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_250);
          }
          id v12 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v13;
            v19 = v10;
            _os_log_debug_impl(&dword_2144AA000, v12, OS_LOG_TYPE_DEBUG, "HomeKit CBDiscovery reporting cached device: %@", buf, 0xCu);
          }
          [*(id *)(a1 + 32) deviceFoundHandler:v10 cached:1];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v7);
  }
}

- (void)stopCBDiscoveryScan:(int64_t)a3
{
  -[WPHomeKit setStopScanParametersforType:](self, "setStopScanParametersforType:");
  uint64_t v5 = [(WPHomeKit *)self clientTypeFromHomeKitType:a3];

  [(WPHomeKit *)self scanningStoppedOfType:v5];
}

- (void)tearDownCBDiscovery
{
  homeKitCBDiscovery = self->_homeKitCBDiscovery;
  if (homeKitCBDiscovery)
  {
    [homeKitCBDiscovery invalidate];
    id v4 = self->_homeKitCBDiscovery;
    self->_homeKitCBDiscovery = 0;
  }
}

- (unint64_t)homeKitTypeToCBDiscoveryFlag:(int64_t)a3
{
  if (!a3) {
    return 0x400000;
  }
  if (a3 != 1)
  {
    id v4 = (void *)MEMORY[0x263EFF940];
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"The homeKit type %ld isn't valid. Cannot Convert to CBDiscoveryFlags", a3);
    long long v6 = [v4 exceptionWithName:@"UnknownClientType" reason:v5 userInfo:0];

    objc_exception_throw(v6);
  }
  return 0x1000000;
}

- (BOOL)discoveryFlagsContains:(int64_t)a3
{
  uint64_t v5 = [self->_homeKitCBDiscovery discoveryFlags];
  return ([(WPHomeKit *)self homeKitTypeToCBDiscoveryFlag:a3] & v5) != 0;
}

- (BOOL)isHomeKitScanActive:(unint64_t)a3
{
  return (a3 & 0x1400000) != 0;
}

- (int64_t)homeKitTypeFromCBDiscoveryFlag:(unint64_t)a3
{
  if ((a3 & 0x400000) != 0) {
    return 0;
  }
  if ((a3 & 0x1000000) == 0)
  {
    id v4 = (void *)MEMORY[0x263EFF940];
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"The CBDiscoveryFlag %llu isn't valid. Cannot Convert to homeKit type", a3);
    long long v6 = [v4 exceptionWithName:@"UnknownClientType" reason:v5 userInfo:0];

    objc_exception_throw(v6);
  }
  return 1;
}

- ($2825F4736939C4A6D3AD43837233062D)homeKitScanTypeToCBDiscoveryScanRates:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v5 = _os_feature_enabled_impl();
      uint64_t v3 = 0x1400000000;
      if (v5) {
        uint64_t v3 = 0x3C00000000;
      }
      uint64_t v4 = 40;
      if (v5) {
        uint64_t v4 = 60;
      }
    }
    else if (a3 == 2)
    {
      uint64_t v3 = 0x1400000000;
      uint64_t v4 = 40;
    }
    else
    {
      uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"WPHomeKit.m" lineNumber:514 description:@"Unknown duty cycle type"];

      uint64_t v4 = 0;
      uint64_t v3 = 0x1400000000;
    }
  }
  else
  {
    uint64_t v3 = 0x1400000000;
    uint64_t v4 = 30;
  }
  return ($2825F4736939C4A6D3AD43837233062D)(v4 | v3);
}

- (void)setHomeKitCBDiscovery:(id)a3
{
}

- (id)homeKitCBDiscovery
{
  return self->_homeKitCBDiscovery;
}

- (BOOL)isWHBSupported
{
  return 0;
}

- (void)invalidateWHBScanSession
{
  if (self->_homeKitCBDiscovery) {
    [(WPHomeKit *)self tearDownCBDiscovery];
  }
}

- (WPHomeKitDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WPHomeKitDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_homeKitCBDiscovery, 0);
}

- (void)startScanningWithData:(os_log_t)log forType:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  objc_super v2 = @"WHB scan is not enabled.";
  _os_log_error_impl(&dword_2144AA000, log, OS_LOG_TYPE_ERROR, "HomeKit %@", (uint8_t *)&v1, 0xCu);
}

- (void)deviceFoundHandler:(uint64_t)a1 cached:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2144AA000, a2, OS_LOG_TYPE_DEBUG, "HomeKit CBDiscovery Device found or updated: %@", (uint8_t *)&v2, 0xCu);
}

- (void)deviceLostHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2144AA000, a2, OS_LOG_TYPE_DEBUG, "HomeKit CBDiscovery Device lost: %@", (uint8_t *)&v2, 0xCu);
}

@end