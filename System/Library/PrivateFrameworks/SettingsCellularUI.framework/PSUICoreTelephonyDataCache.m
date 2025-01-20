@interface PSUICoreTelephonyDataCache
+ (PSUICoreTelephonyDataCache)sharedInstance;
- ($96EE1C12479E9B303E9C2794B92A11A2)privacyProxySetting;
- (BOOL)cellularDataSetting;
- (BOOL)cellularDataSettingInitialized;
- (BOOL)cellularStatisticsSetting;
- (BOOL)cellularStatisticsSettingFetched;
- (BOOL)getInternationalDataAccessStatus;
- (BOOL)getInternationalDataAccessStatus:(id)a3;
- (BOOL)hideDataRoaming:(id)a3;
- (BOOL)isAirplaneModeEnabled;
- (BOOL)isCellularDataEnabled;
- (BOOL)isCellularUsageStatisticsEnabled;
- (BOOL)isDataFallbackEnabled;
- (BOOL)isPrivacyProxyEnabled:(id)a3;
- (BOOL)isPrivateNetworkSIM:(id)a3;
- (BOOL)isUserSubscribedToPrivacyProxy:(id)a3;
- (BOOL)privacyProxySettingsFetched;
- (CoreTelephonyClient)client;
- (NSMutableDictionary)dataStatusDict;
- (NSMutableDictionary)intlDataAccessStatus;
- (NSMutableDictionary)privateNetworkCapabilities;
- (PSUICoreTelephonyDataCache)init;
- (RadiosPreferences)radioPreferences;
- (__CTServerConnection)ctConnection;
- (id)copyStartDateOfCellularDataUsageRecords;
- (id)getDataStatus:(id)a3;
- (id)getLogger;
- (id)initPrivate;
- (void)airplaneModeChanged;
- (void)dataRoamingSettingsChanged:(id)a3 status:(BOOL)a4;
- (void)dataSettingsChanged:(id)a3;
- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4;
- (void)dealloc;
- (void)eraseCellularDataUsageRecords;
- (void)fetchCellularDataEnabled;
- (void)fetchCellularUsageStatisticsSetting;
- (void)fetchDataStatus;
- (void)fetchInternationalDataAccessStatus:(id)a3;
- (void)fetchPrivacyProxyStatus:(id)a3;
- (void)fetchPrivateNetworkCapabilities:(id)a3;
- (void)preferPrivateNetworkCellularOverWiFiDidChange;
- (void)setCellularDataEnabled:(BOOL)a3;
- (void)setCellularDataSetting:(BOOL)a3;
- (void)setCellularDataSettingInitialized:(BOOL)a3;
- (void)setCellularStatisticsSetting:(BOOL)a3;
- (void)setCellularStatisticsSettingFetched:(BOOL)a3;
- (void)setCellularUsageStatisticsEnabled:(BOOL)a3 completion:(id)a4;
- (void)setClient:(id)a3;
- (void)setCtConnection:(__CTServerConnection *)a3;
- (void)setDataFallbackEnabled:(BOOL)a3;
- (void)setDataStatusDict:(id)a3;
- (void)setInternationalDataAccessStatus:(BOOL)a3;
- (void)setInternationalDataAccessStatus:(id)a3 status:(BOOL)a4;
- (void)setIntlDataAccessStatus:(id)a3;
- (void)setPrivacyProxy:(id)a3 enabled:(BOOL)a4;
- (void)setPrivacyProxySetting:(id)a3;
- (void)setPrivacyProxySettingsFetched:(BOOL)a3;
- (void)setPrivateNetworkCapabilities:(id)a3;
- (void)setRadioPreferences:(id)a3;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
- (void)willEnterForeground;
@end

@implementation PSUICoreTelephonyDataCache

+ (PSUICoreTelephonyDataCache)sharedInstance
{
  if (qword_26AC32348 != -1) {
    dispatch_once(&qword_26AC32348, &__block_literal_global_21);
  }
  v2 = (void *)_MergedGlobals_72;
  return (PSUICoreTelephonyDataCache *)v2;
}

uint64_t __44__PSUICoreTelephonyDataCache_sharedInstance__block_invoke()
{
  _MergedGlobals_72 = [[PSUICoreTelephonyDataCache alloc] initPrivate];
  return MEMORY[0x270F9A758]();
}

- (id)initPrivate
{
  v14.receiver = self;
  v14.super_class = (Class)PSUICoreTelephonyDataCache;
  v2 = [(PSUICoreTelephonyDataCache *)&v14 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F02D30]);
    v4 = [MEMORY[0x263F67F00] createCTClientSerialQueue:@"data_cache"];
    uint64_t v5 = [v3 initWithQueue:v4];
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v5;

    [(CoreTelephonyClient *)v2->_client setDelegate:v2];
    [(PSUICoreTelephonyDataCache *)v2 setCtConnection:_CTServerConnectionCreateOnTargetQueue()];
    [(PSUICoreTelephonyDataCache *)v2 setCellularDataSettingInitialized:0];
    [(PSUICoreTelephonyDataCache *)v2 setCellularDataSetting:0];
    [(PSUICoreTelephonyDataCache *)v2 setDataStatusDict:0];
    v7 = objc_opt_new();
    [(PSUICoreTelephonyDataCache *)v2 setIntlDataAccessStatus:v7];

    v8 = (RadiosPreferences *)objc_alloc_init(MEMORY[0x263F255D8]);
    radioPreferences = v2->_radioPreferences;
    v2->_radioPreferences = v8;

    [(RadiosPreferences *)v2->_radioPreferences setNotifyForExternalChangeOnly:1];
    [(RadiosPreferences *)v2->_radioPreferences setDelegate:v2];
    [(PSUICoreTelephonyDataCache *)v2 setPrivacyProxySettingsFetched:0];
    [(PSUICoreTelephonyDataCache *)v2 privacyProxySetting];
    [(PSUICoreTelephonyDataCache *)v2 setPrivacyProxySetting:0];
    uint64_t v10 = objc_opt_new();
    privateNetworkCapabilities = v2->_privateNetworkCapabilities;
    v2->_privateNetworkCapabilities = (NSMutableDictionary *)v10;

    [(PSUICoreTelephonyDataCache *)v2 setCellularStatisticsSetting:0];
    [(PSUICoreTelephonyDataCache *)v2 setCellularStatisticsSettingFetched:0];
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v2 selector:sel_willEnterForeground name:*MEMORY[0x263F833B8] object:0];
  }
  return v2;
}

- (PSUICoreTelephonyDataCache)init
{
  v2 = [(PSUICoreTelephonyDataCache *)self getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v3 = 0;
    _os_log_error_impl(&dword_221B17000, v2, OS_LOG_TYPE_ERROR, "Unsupported initializer called", v3, 2u);
  }

  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer" reason:@"Unsupported initializer called" userInfo:0]);
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PSUICoreTelephonyDataCache;
  [(PSUICoreTelephonyDataCache *)&v4 dealloc];
}

- (void)willEnterForeground
{
  [(PSUICoreTelephonyDataCache *)self setCellularDataSettingInitialized:0];
  [(PSUICoreTelephonyDataCache *)self setCellularStatisticsSettingFetched:0];
  id v3 = [(PSUICoreTelephonyDataCache *)self intlDataAccessStatus];
  [v3 removeAllObjects];

  [(PSUICoreTelephonyDataCache *)self setDataStatusDict:0];
}

- (void)fetchDataStatus
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = [(PSUICoreTelephonyDataCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Executing fetch for data status", buf, 2u);
  }

  objc_super v4 = [MEMORY[0x263F67EF0] sharedInstance];
  uint64_t v5 = [v4 subscriptionContexts];

  id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v22;
    *(void *)&long long v8 = 138412546;
    long long v18 = v8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        client = self->_client;
        id v20 = 0;
        v13 = -[CoreTelephonyClient getDataStatus:error:](client, "getDataStatus:error:", v11, &v20, v18);
        id v14 = v20;
        v15 = [(PSUICoreTelephonyDataCache *)self getLogger];
        v16 = v15;
        if (v14)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            v26 = v11;
            __int16 v27 = 2112;
            id v28 = v14;
            _os_log_error_impl(&dword_221B17000, v16, OS_LOG_TYPE_ERROR, "Data status fetch failed: %@, %@", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            v26 = v11;
            __int16 v27 = 2112;
            id v28 = v13;
            _os_log_impl(&dword_221B17000, v16, OS_LOG_TYPE_DEFAULT, "Data status fetched succeeded: %@, %@", buf, 0x16u);
          }

          v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "slotID"));
          [v19 setObject:v13 forKeyedSubscript:v16];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v7);
  }

  v17 = self;
  objc_sync_enter(v17);
  [(PSUICoreTelephonyDataCache *)v17 setDataStatusDict:v19];
  objc_sync_exit(v17);
}

- (id)getDataStatus:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSUICoreTelephonyDataCache *)self dataStatusDict];

  if (!v5) {
    [(PSUICoreTelephonyDataCache *)self fetchDataStatus];
  }
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(PSUICoreTelephonyDataCache *)v6 dataStatusDict];
  long long v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID"));
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  objc_sync_exit(v6);
  return v9;
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(PSUICoreTelephonyDataCache *)self getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "Updating data status: %@, %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v9 = self;
  objc_sync_enter(v9);
  uint64_t v10 = [(PSUICoreTelephonyDataCache *)v9 dataStatusDict];
  [v10 setObject:v7 forKeyedSubscript:v6];

  objc_sync_exit(v9);
}

- (void)dataSettingsChanged:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (__CFString *)a3;
  uint64_t v5 = [(PSUICoreTelephonyDataCache *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v4;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Updating data settings: %@", buf, 0xCu);
  }

  id v6 = self;
  objc_sync_enter(v6);
  int v7 = [(PSUICoreTelephonyDataCache *)v6 cellularDataSetting];
  if (v7 != [(__CFString *)v4 isCellularDataEnabled])
  {
    long long v8 = [(PSUICoreTelephonyDataCache *)v6 getLogger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [(PSUICoreTelephonyDataCache *)v6 cellularDataSetting];
      int v10 = [(__CFString *)v4 isCellularDataEnabled];
      int v11 = @"NO";
      if (v9) {
        id v12 = @"YES";
      }
      else {
        id v12 = @"NO";
      }
      if (v10) {
        int v11 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v12;
      __int16 v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "Cellular data changing from %@ to %@", buf, 0x16u);
    }
  }
  [(PSUICoreTelephonyDataCache *)v6 setCellularDataSettingInitialized:0];
  objc_sync_exit(v6);

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__PSUICoreTelephonyDataCache_dataSettingsChanged___block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __50__PSUICoreTelephonyDataCache_dataSettingsChanged___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315394;
    id v4 = "-[PSUICoreTelephonyDataCache dataSettingsChanged:]_block_invoke";
    __int16 v5 = 2112;
    id v6 = @"PSCellularDataSettingChangedNotification";
    _os_log_impl(&dword_221B17000, v1, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v3, 0x16u);
  }

  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"PSCellularDataSettingChangedNotification" object:0];
}

- (void)fetchInternationalDataAccessStatus:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  __int16 v5 = self;
  objc_sync_enter(v5);
  id v6 = [(PSUICoreTelephonyDataCache *)v5 intlDataAccessStatus];
  uint64_t v7 = [v4 instance];
  long long v8 = [v6 objectForKey:v7];

  objc_sync_exit(v5);
  if (!v8)
  {
    BOOL v9 = [(PSUICoreTelephonyDataCache *)v5 getLogger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221B17000, v9, OS_LOG_TYPE_DEFAULT, "Executing fetch for international data access status", buf, 2u);
    }

    client = v5->_client;
    id v18 = 0;
    uint64_t v11 = [(CoreTelephonyClient *)client getInternationalDataAccessSync:v4 error:&v18];
    id v12 = (__CFString *)v18;
    __int16 v13 = [(PSUICoreTelephonyDataCache *)v5 getLogger];
    id v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v12;
        _os_log_error_impl(&dword_221B17000, v14, OS_LOG_TYPE_ERROR, "International data access status fetch failed: %@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = @"NO";
        if (v11) {
          uint64_t v15 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        id v20 = v15;
        _os_log_impl(&dword_221B17000, v14, OS_LOG_TYPE_DEFAULT, "Fetch for international data access status succeeded: %@", buf, 0xCu);
      }

      id v14 = [(PSUICoreTelephonyDataCache *)v5 intlDataAccessStatus];
      __int16 v16 = [NSNumber numberWithBool:v11];
      v17 = [v4 instance];
      [v14 setObject:v16 forKey:v17];
    }
  }
}

- (BOOL)getInternationalDataAccessStatus
{
  if (+[SettingsCellularUtils isUIDualSIM])
  {
    int v3 = [(PSUICoreTelephonyDataCache *)self getLogger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_error_impl(&dword_221B17000, v3, OS_LOG_TYPE_ERROR, "Need a service descriptor, use getInternationalDataAccessStatus:", v7, 2u);
    }
  }
  id v4 = +[SettingsCellularUtils singleSIMUIServiceDescriptor];
  BOOL v5 = [(PSUICoreTelephonyDataCache *)self getInternationalDataAccessStatus:v4];

  return v5;
}

- (BOOL)getInternationalDataAccessStatus:(id)a3
{
  id v4 = a3;
  [(PSUICoreTelephonyDataCache *)self fetchInternationalDataAccessStatus:v4];
  BOOL v5 = [(PSUICoreTelephonyDataCache *)self intlDataAccessStatus];
  id v6 = [v4 instance];

  uint64_t v7 = [v5 objectForKey:v6];
  char v8 = [v7 BOOLValue];

  return v8;
}

- (void)setInternationalDataAccessStatus:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[SettingsCellularUtils isUIDualSIM])
  {
    BOOL v5 = [(PSUICoreTelephonyDataCache *)self getLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_error_impl(&dword_221B17000, v5, OS_LOG_TYPE_ERROR, "Need a service descriptor, use setInternationalDataAccessStatus:status:", v7, 2u);
    }
  }
  id v6 = +[SettingsCellularUtils singleSIMUIServiceDescriptor];
  [(PSUICoreTelephonyDataCache *)self setInternationalDataAccessStatus:v6 status:v3];
}

- (void)setInternationalDataAccessStatus:(id)a3 status:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(PSUICoreTelephonyDataCache *)self getLogger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    char v8 = @"NO";
    if (v4) {
      char v8 = @"YES";
    }
    int v14 = 138412290;
    uint64_t v15 = v8;
    _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "Setting international data access status to %@", (uint8_t *)&v14, 0xCu);
  }

  BOOL v9 = [(CoreTelephonyClient *)self->_client setInternationalDataAccessSync:v6 status:v4];
  int v10 = [(PSUICoreTelephonyDataCache *)self getLogger];
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      uint64_t v15 = v9;
      _os_log_error_impl(&dword_221B17000, v11, OS_LOG_TYPE_ERROR, "Setting international data access status failed: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_221B17000, v11, OS_LOG_TYPE_DEFAULT, "Setting international data access status successful", (uint8_t *)&v14, 2u);
    }

    uint64_t v11 = [(PSUICoreTelephonyDataCache *)self intlDataAccessStatus];
    id v12 = [NSNumber numberWithBool:v4];
    __int16 v13 = [v6 instance];
    [v11 setObject:v12 forKey:v13];
  }
}

- (void)dataRoamingSettingsChanged:(id)a3 status:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(PSUICoreTelephonyDataCache *)self getLogger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    char v8 = @"NO";
    if (v4) {
      char v8 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v8;
    _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "Changing international data access status: %@", buf, 0xCu);
  }

  BOOL v9 = self;
  objc_sync_enter(v9);
  int v10 = [(PSUICoreTelephonyDataCache *)v9 intlDataAccessStatus];
  uint64_t v11 = [NSNumber numberWithBool:v4];
  id v12 = [v6 instance];
  [v10 setObject:v11 forKey:v12];

  objc_sync_exit(v9);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__PSUICoreTelephonyDataCache_dataRoamingSettingsChanged_status___block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __64__PSUICoreTelephonyDataCache_dataRoamingSettingsChanged_status___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315394;
    BOOL v4 = "-[PSUICoreTelephonyDataCache dataRoamingSettingsChanged:status:]_block_invoke";
    __int16 v5 = 2112;
    id v6 = @"PSCellularDataSettingChangedNotification";
    _os_log_impl(&dword_221B17000, v1, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v3, 0x16u);
  }

  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"PSCellularDataSettingChangedNotification" object:0];
}

- (void)fetchCellularDataEnabled
{
  *(void *)&v9[5] = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(PSUICoreTelephonyDataCache *)v2 cellularDataSettingInitialized];
  objc_sync_exit(v2);

  if (!v3)
  {
    BOOL v7 = [(PSUICoreTelephonyDataCache *)v2 cellularDataSetting];
    [(PSUICoreTelephonyDataCache *)v2 ctConnection];
    uint64_t IsEnabled = _CTServerConnectionGetCellularDataIsEnabled();
    if (IsEnabled)
    {
      __int16 v5 = [(PSUICoreTelephonyDataCache *)v2 getLogger];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        v9[0] = IsEnabled;
        LOWORD(v9[1]) = 1024;
        *(_DWORD *)((char *)&v9[1] + 2) = HIDWORD(IsEnabled);
        _os_log_error_impl(&dword_221B17000, v5, OS_LOG_TYPE_ERROR, "Querying cellular data is enabled setting failed %d (%d)", buf, 0xEu);
      }
    }
    else
    {
      [(PSUICoreTelephonyDataCache *)v2 setCellularDataSetting:v7];
      [(PSUICoreTelephonyDataCache *)v2 setCellularDataSettingInitialized:1];
      __int16 v5 = [(PSUICoreTelephonyDataCache *)v2 getLogger];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        if (v7) {
          id v6 = @"YES";
        }
        else {
          id v6 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        *(void *)BOOL v9 = v6;
        _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Cellular data is enabled is %@", buf, 0xCu);
      }
    }
  }
}

- (BOOL)isCellularDataEnabled
{
  [(PSUICoreTelephonyDataCache *)self fetchCellularDataEnabled];
  return [(PSUICoreTelephonyDataCache *)self cellularDataSetting];
}

- (void)setCellularDataEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(PSUICoreTelephonyDataCache *)self ctConnection];
  MEMORY[0x270EE8890](v4, v3);
}

- (BOOL)isAirplaneModeEnabled
{
  v2 = [(PSUICoreTelephonyDataCache *)self radioPreferences];
  char v3 = [v2 airplaneMode];

  return v3;
}

- (BOOL)isDataFallbackEnabled
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  char v3 = [(PSUICoreTelephonyDataCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Fetching dynamic data SIM switching support", buf, 2u);
  }

  client = self->_client;
  id v11 = 0;
  int v5 = [(CoreTelephonyClient *)client getSupportDynamicDataSimSwitchSync:&v11];
  id v6 = (__CFString *)v11;
  BOOL v7 = [(PSUICoreTelephonyDataCache *)self getLogger];
  char v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v13 = v6;
      _os_log_error_impl(&dword_221B17000, v8, OS_LOG_TYPE_ERROR, "Fetch dynamic data SIM switching failed: %@", buf, 0xCu);
    }
    LOBYTE(v5) = 0;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = @"NO";
    if (v5) {
      BOOL v9 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    __int16 v13 = v9;
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "Fetching dynamic data SIM switching succeeded: %@", buf, 0xCu);
  }

  return v5;
}

- (void)setDataFallbackEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v5 = [(PSUICoreTelephonyDataCache *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"NO";
    if (v3) {
      id v6 = @"YES";
    }
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Setting dynamic data SIM switching to %@", (uint8_t *)&v10, 0xCu);
  }

  BOOL v7 = [(CoreTelephonyClient *)self->_client setSupportDynamicDataSimSwitch:v3];
  char v8 = [(PSUICoreTelephonyDataCache *)self getLogger];
  BOOL v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_error_impl(&dword_221B17000, v9, OS_LOG_TYPE_ERROR, "Setting dynamic data SIM switching failed: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_221B17000, v9, OS_LOG_TYPE_DEFAULT, "Setting dynamic data SIM switching successful", (uint8_t *)&v10, 2u);
  }
}

- (void)airplaneModeChanged
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v3 = [(PSUICoreTelephonyDataCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(PSUICoreTelephonyDataCache *)self radioPreferences];
    int v5 = [v4 airplaneMode];
    id v6 = @"NO";
    if (v5) {
      id v6 = @"YES";
    }
    int v8 = 138412290;
    BOOL v9 = v6;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Airplane mode changed to %@", (uint8_t *)&v8, 0xCu);
  }
  BOOL v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 postNotificationName:@"PSCellularAirplaneModeChangedNotification" object:0];
}

- (void)fetchPrivacyProxyStatus:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  client = self->_client;
  id v6 = [MEMORY[0x263F02CD8] descriptorWithSubscriptionContext:v4];
  id v15 = 0;
  LOWORD(v7) = [(CoreTelephonyClient *)client getPrivacyProxyState:v6 error:&v15];
  int v8 = (__CFString *)v15;

  BOOL v9 = [(PSUICoreTelephonyDataCache *)self getLogger];
  uint64_t v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_error_impl(&dword_221B17000, v10, OS_LOG_TYPE_ERROR, "Fetch PrivacyProxy status failed: %@", buf, 0xCu);
    }

    uint64_t v11 = 0;
    uint64_t v7 = 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = @"YES";
      if (v7) {
        __int16 v13 = @"YES";
      }
      else {
        __int16 v13 = @"NO";
      }
      if ((v7 & 0x100) == 0) {
        uint64_t v12 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      v17 = v13;
      __int16 v18 = 2112;
      id v19 = v12;
      _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "Fetch PrivacyProxy status success, feature enabled: %@, user enabled: %@", buf, 0x16u);
    }

    uint64_t v11 = (unsigned __int16)v7 & 0xFF00;
    uint64_t v7 = v7;
  }
  uint64_t v14 = self;
  objc_sync_enter(v14);
  [(PSUICoreTelephonyDataCache *)v14 setPrivacyProxySetting:v7 | v11];
  objc_sync_exit(v14);
}

- (BOOL)isUserSubscribedToPrivacyProxy:(id)a3
{
  id v4 = a3;
  if (![(PSUICoreTelephonyDataCache *)self privacyProxySettingsFetched]) {
    [(PSUICoreTelephonyDataCache *)self fetchPrivacyProxyStatus:v4];
  }
  char v5 = (char)[(PSUICoreTelephonyDataCache *)self privacyProxySetting];

  return v5 & 1;
}

- (BOOL)isPrivacyProxyEnabled:(id)a3
{
  id v4 = a3;
  if (![(PSUICoreTelephonyDataCache *)self privacyProxySettingsFetched]) {
    [(PSUICoreTelephonyDataCache *)self fetchPrivacyProxyStatus:v4];
  }
  unsigned int v5 = ([(PSUICoreTelephonyDataCache *)self privacyProxySetting] >> 8) & 1;

  return v5;
}

- (void)setPrivacyProxy:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  client = self->_client;
  uint64_t v7 = [MEMORY[0x263F02CD8] descriptorWithSubscriptionContext:a3];
  int v8 = [(CoreTelephonyClient *)client setPrivacyProxyState:v7 enabled:v4];

  if (v8)
  {
    BOOL v9 = [(PSUICoreTelephonyDataCache *)self getLogger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_error_impl(&dword_221B17000, v9, OS_LOG_TYPE_ERROR, "Set PrivacyProxy state failed: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)fetchPrivateNetworkCapabilities:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned int v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID"));
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(PSUICoreTelephonyDataCache *)v6 privateNetworkCapabilities];
  int v8 = [v7 objectForKeyedSubscript:v5];

  if (!v8)
  {
    client = v6->_client;
    id v14 = 0;
    int v10 = [(CoreTelephonyClient *)client getPrivateNetworkCapabilitiesForContext:v4 error:&v14];
    id v11 = v14;
    if (v11)
    {
      uint64_t v12 = [(PSUICoreTelephonyDataCache *)v6 getLogger];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v11;
        _os_log_error_impl(&dword_221B17000, v12, OS_LOG_TYPE_ERROR, "Checking Private Network capabilities failed: %@", buf, 0xCu);
      }
    }
    else
    {
      __int16 v13 = [(PSUICoreTelephonyDataCache *)v6 getLogger];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v16 = v5;
        __int16 v17 = 2112;
        __int16 v18 = v10;
        _os_log_impl(&dword_221B17000, v13, OS_LOG_TYPE_DEFAULT, "Private Network Capabilities for context slot id [%@]: %@", buf, 0x16u);
      }

      uint64_t v12 = [(PSUICoreTelephonyDataCache *)v6 privateNetworkCapabilities];
      [v12 setObject:v10 forKeyedSubscript:v5];
    }
  }
  objc_sync_exit(v6);
}

- (BOOL)isPrivateNetworkSIM:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [MEMORY[0x263F02D20] contextWithServiceDescriptor:v4];
  [(PSUICoreTelephonyDataCache *)self fetchPrivateNetworkCapabilities:v5];
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(PSUICoreTelephonyDataCache *)v6 privateNetworkCapabilities];
  int v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "slotID"));
  BOOL v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    int v10 = [(PSUICoreTelephonyDataCache *)v6 privateNetworkCapabilities];
    id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "slotID"));
    uint64_t v12 = [v10 objectForKeyedSubscript:v11];
    char v13 = [v12 isPrivateNetworkSIM];
  }
  else
  {
    char v13 = 0;
  }
  objc_sync_exit(v6);

  return v13;
}

- (BOOL)hideDataRoaming:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [MEMORY[0x263F02D20] contextWithServiceDescriptor:v4];
  [(PSUICoreTelephonyDataCache *)self fetchPrivateNetworkCapabilities:v5];
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(PSUICoreTelephonyDataCache *)v6 privateNetworkCapabilities];
  int v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "slotID"));
  BOOL v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    int v10 = [(PSUICoreTelephonyDataCache *)v6 privateNetworkCapabilities];
    id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "slotID"));
    uint64_t v12 = [v10 objectForKeyedSubscript:v11];
    char v13 = [v12 hideDataRoaming];
  }
  else
  {
    char v13 = 0;
  }
  objc_sync_exit(v6);

  return v13;
}

- (id)copyStartDateOfCellularDataUsageRecords
{
  return 0;
}

- (void)eraseCellularDataUsageRecords
{
  v2 = [(PSUICoreTelephonyDataCache *)self ctConnection];
  MEMORY[0x270EE87F0](v2);
}

- (void)fetchCellularUsageStatisticsSetting
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(PSUICoreTelephonyDataCache *)v2 cellularStatisticsSettingFetched];
  objc_sync_exit(v2);

  if (!v3)
  {
    client = v2->_client;
    id v12 = 0;
    unsigned int v5 = [(CoreTelephonyClient *)client usageCollectionEnabledSync:&v12];
    id v6 = v12;
    if (v6)
    {
      uint64_t v7 = [(PSUICoreTelephonyDataCache *)v2 getLogger];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v11 = [v6 domain];
        *(_DWORD *)buf = 138412546;
        id v14 = v11;
        __int16 v15 = 2112;
        id v16 = v6;
        _os_log_error_impl(&dword_221B17000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch cellular usage statistics setting %@ (%@)", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v8 = [v5 BOOLValue];
      BOOL v9 = [(PSUICoreTelephonyDataCache *)v2 getLogger];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = @"NO";
        if (v8) {
          int v10 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        id v14 = v10;
        _os_log_impl(&dword_221B17000, v9, OS_LOG_TYPE_DEFAULT, "Cellular usage statistics enabled: %@", buf, 0xCu);
      }

      [(PSUICoreTelephonyDataCache *)v2 setCellularStatisticsSetting:v8];
      [(PSUICoreTelephonyDataCache *)v2 setCellularStatisticsSettingFetched:1];
    }
  }
}

- (BOOL)isCellularUsageStatisticsEnabled
{
  [(PSUICoreTelephonyDataCache *)self fetchCellularUsageStatisticsSetting];
  return [(PSUICoreTelephonyDataCache *)self cellularStatisticsSetting];
}

- (void)setCellularUsageStatisticsEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id location = 0;
  objc_initWeak(&location, self);
  client = self->_client;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__PSUICoreTelephonyDataCache_setCellularUsageStatisticsEnabled_completion___block_invoke;
  v9[3] = &unk_2645E18B0;
  objc_copyWeak(&v11, &location);
  BOOL v12 = v4;
  id v8 = v6;
  id v10 = v8;
  [(CoreTelephonyClient *)client setUsageCollectionEnabled:v4 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __75__PSUICoreTelephonyDataCache_setCellularUsageStatisticsEnabled_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [WeakRetained getLogger];

  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      if (*(unsigned char *)(a1 + 48)) {
        BOOL v12 = @"ENABLED";
      }
      else {
        BOOL v12 = @"DISABLED";
      }
      char v13 = [v3 domain];
      int v14 = 138412802;
      __int16 v15 = v12;
      __int16 v16 = 2112;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_error_impl(&dword_221B17000, v6, OS_LOG_TYPE_ERROR, "Failed to set cellular usage statistics to %@, error: %@ (%@)", (uint8_t *)&v14, 0x20u);
    }
    id v7 = objc_loadWeakRetained(v4);
    [v7 setCellularStatisticsSettingFetched:0];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 48)) {
        id v8 = @"ENABLED";
      }
      else {
        id v8 = @"DISABLED";
      }
      int v14 = 138412290;
      __int16 v15 = v8;
      _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "Successfully set cellular usage statistics to %@", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v9 = *(unsigned __int8 *)(a1 + 48);
    id v10 = objc_loadWeakRetained((id *)(a1 + 40));
    [v10 setCellularStatisticsSetting:v9];

    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      (*(void (**)(void))(v11 + 16))();
    }
  }
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PSUICoreTelephonyDataCache *)self getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "Clearing Private network SIM info for context %@", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "slotID"));
  id v10 = self;
  objc_sync_enter(v10);
  uint64_t v11 = [(PSUICoreTelephonyDataCache *)v10 privateNetworkCapabilities];
  [v11 setObject:0 forKeyedSubscript:v9];

  objc_sync_exit(v10);
}

- (void)preferPrivateNetworkCellularOverWiFiDidChange
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(PSUICoreTelephonyDataCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Clearing Private network SIM infos due to profile update", buf, 2u);
  }

  BOOL v4 = [MEMORY[0x263F67EF0] sharedInstance];
  unsigned int v5 = [v4 subscriptionContexts];

  id v6 = self;
  objc_sync_enter(v6);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "slotID", (void)v13));
        int v12 = [(PSUICoreTelephonyDataCache *)v6 privateNetworkCapabilities];
        [v12 setObject:0 forKeyedSubscript:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v6);
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"DataCache"];
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (__CTServerConnection)ctConnection
{
  return self->_ctConnection;
}

- (void)setCtConnection:(__CTServerConnection *)a3
{
  self->_ctConnection = a3;
}

- (NSMutableDictionary)dataStatusDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDataStatusDict:(id)a3
{
}

- (NSMutableDictionary)intlDataAccessStatus
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIntlDataAccessStatus:(id)a3
{
}

- (RadiosPreferences)radioPreferences
{
  return self->_radioPreferences;
}

- (void)setRadioPreferences:(id)a3
{
}

- (BOOL)cellularDataSetting
{
  return self->_cellularDataSetting;
}

- (void)setCellularDataSetting:(BOOL)a3
{
  self->_cellularDataSetting = a3;
}

- (BOOL)cellularDataSettingInitialized
{
  return self->_cellularDataSettingInitialized;
}

- (void)setCellularDataSettingInitialized:(BOOL)a3
{
  self->_cellularDataSettingInitialized = a3;
}

- ($96EE1C12479E9B303E9C2794B92A11A2)privacyProxySetting
{
  objc_copyStruct(&dest, &self->_privacyProxySetting, 2, 1, 0);
  return dest;
}

- (void)setPrivacyProxySetting:(id)a3
{
  $96EE1C12479E9B303E9C2794B92A11A2 src = a3;
  objc_copyStruct(&self->_privacyProxySetting, &src, 2, 1, 0);
}

- (BOOL)privacyProxySettingsFetched
{
  return self->_privacyProxySettingsFetched;
}

- (void)setPrivacyProxySettingsFetched:(BOOL)a3
{
  self->_privacyProxySettingsFetched = a3;
}

- (NSMutableDictionary)privateNetworkCapabilities
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPrivateNetworkCapabilities:(id)a3
{
}

- (BOOL)cellularStatisticsSetting
{
  return self->_cellularStatisticsSetting;
}

- (void)setCellularStatisticsSetting:(BOOL)a3
{
  self->_cellularStatisticsSetting = a3;
}

- (BOOL)cellularStatisticsSettingFetched
{
  return self->_cellularStatisticsSettingFetched;
}

- (void)setCellularStatisticsSettingFetched:(BOOL)a3
{
  self->_cellularStatisticsSettingFetched = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateNetworkCapabilities, 0);
  objc_storeStrong((id *)&self->_radioPreferences, 0);
  objc_storeStrong((id *)&self->_intlDataAccessStatus, 0);
  objc_storeStrong((id *)&self->_dataStatusDict, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end