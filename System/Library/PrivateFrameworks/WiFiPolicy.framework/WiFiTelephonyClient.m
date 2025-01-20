@interface WiFiTelephonyClient
+ (id)sharedInstance;
- (BOOL)isCellular5GActive;
- (BOOL)isCellular5GSupported;
- (BOOL)isCellularDataInRoaming;
- (BOOL)isCellularFallbackEnabled;
- (BOOL)isCellularLTEActive;
- (BOOL)isIMSRegistrationActiveAndOnWiFi;
- (CTDataConnectionStatus)connectionStatus;
- (CTDataStatus)dataStatus;
- (CTMobileEquipmentInfo)mobileEquipmentInfo;
- (CoreTelephonyClient)coreTelephonyClient;
- (NSString)carrierName;
- (NSString)cellularDataIndicator;
- (NSString)cellularICCID;
- (NSString)cellularInterfaceName;
- (NSString)description;
- (NSString)radioAccessTechnology;
- (NSString)registrationStatus;
- (OS_dispatch_queue)internalQueue;
- (WiFiTelephonyClient)init;
- (id)_dataIndicatorToString:(int)a3;
- (id)_getCurrentDataServiceContext;
- (id)cellularDataStatusChangedHandler;
- (id)cellularFallbackStatusChangedHandler;
- (id)imsRegistrationStatusChangedHandler;
- (void)_getCurrentDataServiceContext;
- (void)_updateCellularMEIAndDataStatus;
- (void)carrierBundleChange:(id)a3;
- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5;
- (void)displayStatusChanged:(id)a3 status:(id)a4;
- (void)imsRegistrationChanged:(id)a3 info:(id)a4;
- (void)reliableNetworkFallbackChanged:(BOOL)a3 userEnabled:(BOOL)a4;
- (void)setCarrierName:(id)a3;
- (void)setCellular5GSupported:(BOOL)a3;
- (void)setCellularDataStatusChangedHandler:(id)a3;
- (void)setCellularFallbackEnabled:(BOOL)a3;
- (void)setCellularFallbackStatusChangedHandler:(id)a3;
- (void)setConnectionStatus:(id)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setDataStatus:(id)a3;
- (void)setImsRegistrationActiveAndOnWiFi:(BOOL)a3;
- (void)setImsRegistrationStatusChangedHandler:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setMobileEquipmentInfo:(id)a3;
- (void)setRadioAccessTechnology:(id)a3;
- (void)setRegistrationStatus:(id)a3;
@end

@implementation WiFiTelephonyClient

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_11);
  }
  v2 = (void *)sharedInstance_sharedClient;

  return v2;
}

uint64_t __37__WiFiTelephonyClient_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(WiFiTelephonyClient);
  uint64_t v2 = sharedInstance_sharedClient;
  sharedInstance_sharedClient = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v2, v1);
}

- (WiFiTelephonyClient)init
{
  v13.receiver = self;
  v13.super_class = (Class)WiFiTelephonyClient;
  uint64_t v2 = [(WiFiTelephonyClient *)&v13 init];
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.wifi.telephony-client", v3);
  internalQueue = v2->_internalQueue;
  v2->_internalQueue = (OS_dispatch_queue *)v4;

  uint64_t v6 = [objc_alloc(MEMORY[0x1E4F23A78]) initWithQueue:v2->_internalQueue];
  coreTelephonyClient = v2->_coreTelephonyClient;
  v2->_coreTelephonyClient = (CoreTelephonyClient *)v6;

  [(CoreTelephonyClient *)v2->_coreTelephonyClient setDelegate:v2];
  v8 = v2->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__WiFiTelephonyClient_init__block_invoke;
  block[3] = &unk_1E69BC8D8;
  v9 = v2;
  v12 = v9;
  dispatch_async(v8, block);

  return v9;
}

void __27__WiFiTelephonyClient_init__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateCellularMEIAndDataStatus];
  uint64_t v2 = [*(id *)(a1 + 32) cellularDataStatusChangedHandler];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) cellularDataStatusChangedHandler];
    v3[2]();
  }
}

- (id)_getCurrentDataServiceContext
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(WiFiTelephonyClient *)self coreTelephonyClient];

  if (v3)
  {
    dispatch_queue_t v4 = [(WiFiTelephonyClient *)self coreTelephonyClient];
    id v23 = 0;
    v5 = [v4 getSubscriptionInfoWithError:&v23];
    id v6 = v23;
    v7 = [v5 subscriptions];

    v8 = [(WiFiTelephonyClient *)self coreTelephonyClient];
    id v22 = v6;
    id v9 = [v8 getCurrentDataSubscriptionContextSync:&v22];
    id v10 = v22;

    if (!v9)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v11 = v7;
      id v9 = (id)[v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v9)
      {
        uint64_t v12 = *(void *)v19;
        while (2)
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v11);
            }
            v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            v15 = objc_msgSend(v14, "userDataPreferred", (void)v18);
            int v16 = [v15 intValue];

            if (v16)
            {
              id v9 = v14;
              goto LABEL_16;
            }
          }
          id v9 = (id)[v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
LABEL_16:
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[WiFiTelephonyClient _getCurrentDataServiceContext]();
    }
    id v9 = 0;
  }

  return v9;
}

- (void)_updateCellularMEIAndDataStatus
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_8(&dword_1D3CCD000, MEMORY[0x1E4F14500], v0, "%s: getMobileEquipmentInfo with subscription failed: %{public}@", v1, v2, v3, v4, 2u);
}

void __54__WiFiTelephonyClient__updateCellularMEIAndDataStatus__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) internalQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__WiFiTelephonyClient__updateCellularMEIAndDataStatus__block_invoke_2;
  v7[3] = &unk_1E69BC8B0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __54__WiFiTelephonyClient__updateCellularMEIAndDataStatus__block_invoke_2(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) isRegistered]
    && [*(id *)(a1 + 32) contextType] == 1;
  id v3 = *(void **)(a1 + 40);

  return [v3 setImsRegistrationActiveAndOnWiFi:v2];
}

- (void)reliableNetworkFallbackChanged:(BOOL)a3 userEnabled:(BOOL)a4
{
  id v6 = [(WiFiTelephonyClient *)self internalQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__WiFiTelephonyClient_reliableNetworkFallbackChanged_userEnabled___block_invoke;
  v7[3] = &unk_1E69BC930;
  void v7[4] = self;
  BOOL v8 = a4;
  dispatch_async(v6, v7);
}

void __66__WiFiTelephonyClient_reliableNetworkFallbackChanged_userEnabled___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCellularFallbackEnabled:*(unsigned __int8 *)(a1 + 40)];
  BOOL v2 = [*(id *)(a1 + 32) cellularFallbackStatusChangedHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) cellularFallbackStatusChangedHandler];
    v3[2]();
  }
}

- (void)imsRegistrationChanged:(id)a3 info:(id)a4
{
  id v5 = a4;
  id v6 = [(WiFiTelephonyClient *)self internalQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__WiFiTelephonyClient_imsRegistrationChanged_info___block_invoke;
  v8[3] = &unk_1E69BC8B0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __51__WiFiTelephonyClient_imsRegistrationChanged_info___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) isRegistered]
    && [*(id *)(a1 + 32) contextType] == 1;
  [*(id *)(a1 + 40) setImsRegistrationActiveAndOnWiFi:v2];
  id v3 = [*(id *)(a1 + 40) imsRegistrationStatusChangedHandler];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 40) imsRegistrationStatusChangedHandler];
    v4[2]();
  }
}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  id v6 = [(WiFiTelephonyClient *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__WiFiTelephonyClient_connectionStateChanged_connection_dataConnectionStatusInfo___block_invoke;
  block[3] = &unk_1E69BC8D8;
  void block[4] = self;
  dispatch_async(v6, block);
}

void __82__WiFiTelephonyClient_connectionStateChanged_connection_dataConnectionStatusInfo___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateCellularMEIAndDataStatus];
  BOOL v2 = [*(id *)(a1 + 32) cellularDataStatusChangedHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) cellularDataStatusChangedHandler];
    v3[2]();
  }
}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  id v5 = [(WiFiTelephonyClient *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__WiFiTelephonyClient_displayStatusChanged_status___block_invoke;
  block[3] = &unk_1E69BC8D8;
  void block[4] = self;
  dispatch_async(v5, block);
}

void __51__WiFiTelephonyClient_displayStatusChanged_status___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateCellularMEIAndDataStatus];
  BOOL v2 = [*(id *)(a1 + 32) cellularDataStatusChangedHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) cellularDataStatusChangedHandler];
    v3[2]();
  }
}

- (void)carrierBundleChange:(id)a3
{
  uint64_t v4 = [(WiFiTelephonyClient *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__WiFiTelephonyClient_carrierBundleChange___block_invoke;
  block[3] = &unk_1E69BC8D8;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __43__WiFiTelephonyClient_carrierBundleChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateCellularMEIAndDataStatus];
  BOOL v2 = [*(id *)(a1 + 32) cellularDataStatusChangedHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) cellularDataStatusChangedHandler];
    v3[2]();
  }
}

- (id)_dataIndicatorToString:(int)a3
{
  if (a3 > 0x12) {
    return @"unknown";
  }
  else {
    return off_1E69BDF80[a3];
  }
}

- (BOOL)isCellular5GActive
{
  BOOL v2 = [(WiFiTelephonyClient *)self dataStatus];
  [v2 indicator];

  return 0;
}

- (BOOL)isCellularLTEActive
{
  BOOL v2 = [(WiFiTelephonyClient *)self dataStatus];
  id v3 = v2;
  if (v2) {
    BOOL v4 = [v2 indicator] > 6;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)isCellularDataInRoaming
{
  BOOL v2 = [(WiFiTelephonyClient *)self registrationStatus];
  char v3 = [v2 isEqualToString:*MEMORY[0x1E4F24198]];

  return v3;
}

- (NSString)cellularICCID
{
  BOOL v2 = [(WiFiTelephonyClient *)self mobileEquipmentInfo];
  char v3 = [v2 ICCID];

  return (NSString *)v3;
}

- (NSString)cellularInterfaceName
{
  BOOL v2 = [(WiFiTelephonyClient *)self connectionStatus];
  char v3 = [v2 interfaceName];

  return (NSString *)v3;
}

- (NSString)cellularDataIndicator
{
  char v3 = [(WiFiTelephonyClient *)self dataStatus];
  -[WiFiTelephonyClient _dataIndicatorToString:](self, "_dataIndicatorToString:", [v3 indicator]);
  BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = @"undefined";
  }
  id v6 = v5;

  return v6;
}

- (NSString)description
{
  char v3 = (void *)MEMORY[0x1E4F28E78];
  BOOL v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@:%p ", v5, self];

  id v7 = [(WiFiTelephonyClient *)self cellularDataIndicator];
  [v6 appendFormat:@"Indicator:%@ ", v7];

  BOOL v8 = [(WiFiTelephonyClient *)self radioAccessTechnology];
  [v6 appendFormat:@"RAT:%@ ", v8];

  id v9 = [(WiFiTelephonyClient *)self registrationStatus];
  [v6 appendFormat:@"Reg:%@ ", v9];

  id v10 = [(WiFiTelephonyClient *)self cellularInterfaceName];
  [v6 appendFormat:@"IfName:%@ ", v10];

  id v11 = [(WiFiTelephonyClient *)self carrierName];
  [v6 appendFormat:@"Carrier:%@ ", v11];

  if ([(WiFiTelephonyClient *)self isCellular5GSupported]) {
    uint64_t v12 = @"Y";
  }
  else {
    uint64_t v12 = @"N";
  }
  [v6 appendFormat:@"5GSupported:%@ ", v12];
  if ([(WiFiTelephonyClient *)self isCellularFallbackEnabled]) {
    objc_super v13 = @"Y";
  }
  else {
    objc_super v13 = @"N";
  }
  [v6 appendFormat:@"RNFEnabled:%@ ", v13];
  if ([(WiFiTelephonyClient *)self isIMSRegistrationActiveAndOnWiFi]) {
    v14 = @"Y";
  }
  else {
    v14 = @"N";
  }
  [v6 appendFormat:@"IMSOnWiFi:%@", v14];
  [v6 appendString:@">"];

  return (NSString *)v6;
}

- (id)cellularFallbackStatusChangedHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCellularFallbackStatusChangedHandler:(id)a3
{
}

- (id)imsRegistrationStatusChangedHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setImsRegistrationStatusChangedHandler:(id)a3
{
}

- (id)cellularDataStatusChangedHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setCellularDataStatusChangedHandler:(id)a3
{
}

- (BOOL)isCellularFallbackEnabled
{
  return self->_cellularFallbackEnabled;
}

- (BOOL)isIMSRegistrationActiveAndOnWiFi
{
  return self->_imsRegistrationActiveAndOnWiFi;
}

- (BOOL)isCellular5GSupported
{
  return self->_cellular5GSupported;
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInternalQueue:(id)a3
{
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (CTMobileEquipmentInfo)mobileEquipmentInfo
{
  return (CTMobileEquipmentInfo *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMobileEquipmentInfo:(id)a3
{
}

- (CTDataStatus)dataStatus
{
  return (CTDataStatus *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDataStatus:(id)a3
{
}

- (CTDataConnectionStatus)connectionStatus
{
  return (CTDataConnectionStatus *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConnectionStatus:(id)a3
{
}

- (NSString)radioAccessTechnology
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRadioAccessTechnology:(id)a3
{
}

- (NSString)registrationStatus
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRegistrationStatus:(id)a3
{
}

- (NSString)carrierName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCarrierName:(id)a3
{
}

- (void)setCellular5GSupported:(BOOL)a3
{
  self->_cellular5GSupported = a3;
}

- (void)setCellularFallbackEnabled:(BOOL)a3
{
  self->_cellularFallbackEnabled = a3;
}

- (void)setImsRegistrationActiveAndOnWiFi:(BOOL)a3
{
  self->_imsRegistrationActiveAndOnWiFi = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_registrationStatus, 0);
  objc_storeStrong((id *)&self->_radioAccessTechnology, 0);
  objc_storeStrong((id *)&self->_connectionStatus, 0);
  objc_storeStrong((id *)&self->_dataStatus, 0);
  objc_storeStrong((id *)&self->_mobileEquipmentInfo, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong(&self->_cellularDataStatusChangedHandler, 0);
  objc_storeStrong(&self->_imsRegistrationStatusChangedHandler, 0);

  objc_storeStrong(&self->_cellularFallbackStatusChangedHandler, 0);
}

- (void)_getCurrentDataServiceContext
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136315138;
  uint64_t v1 = "-[WiFiTelephonyClient _getCurrentDataServiceContext]";
  _os_log_error_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s: nil coreTelephonyClient", (uint8_t *)&v0, 0xCu);
}

@end