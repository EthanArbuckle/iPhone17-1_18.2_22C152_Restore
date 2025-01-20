@interface PSUICoreTelephonyCapabilitiesCache
+ (id)sharedInstance;
- (BOOL)canSetCapabilityForContext:(id)a3 cache:(id)a4;
- (BOOL)canSetCapabilityVoLTE:(id)a3;
- (BOOL)canSetCapabilityVoNR:(id)a3;
- (BOOL)canSetNetworkSlicing:(id)a3;
- (BOOL)canSetSatelliteCapability:(id)a3;
- (BOOL)canSetTurnOffCellular:(id)a3;
- (BOOL)cannotChangeVoLTESettingCallCarrier:(id)a3;
- (BOOL)capabilityEnabledForContext:(id)a3 cache:(id)a4;
- (BOOL)capabilityEnabledVoLTE:(id)a3;
- (BOOL)capabilityEnabledVoNR:(id)a3;
- (BOOL)fetchDeviceAndPlan5GSupport:(id)a3;
- (BOOL)getCapabilityInfo:(id)a3 forContext:(id)a4 cache:(id)a5;
- (BOOL)getNetworkSlicing:(id)a3;
- (BOOL)getSatelliteCapability:(id)a3;
- (BOOL)getTurnOffCellular:(id)a3;
- (BOOL)isVoLTEStillProvisioningForContext:(id)a3;
- (CTCapability)networkSlicingCapability;
- (CTCapability)satelliteCapability;
- (CTCapability)turnOffCellularCapability;
- (CTCapability)volteCapability;
- (CTCapability)vonrCapability;
- (CoreTelephonyClient)client;
- (PSSimStatusCache)simStatusCache;
- (PSUICoreTelephonyCapabilitiesCache)init;
- (id)getCapabilityInfoObject:(id)a3 forContext:(id)a4 cache:(id)a5;
- (id)getLogger;
- (id)initPrivate;
- (id)networkSlicingCategories:(id)a3;
- (void)clearCache;
- (void)context:(id)a3 capabilitiesChanged:(id)a4;
- (void)fetchCanSetCapabilityWithCache:(id)a3 forContext:(id)a4;
- (void)fetchCapabilityEnabledWithCache:(id)a3 forContext:(id)a4;
- (void)setCapabilityEnabledForContext:(id)a3 cache:(id)a4 enabled:(BOOL)a5 info:(id)a6;
- (void)setCapabilityInfoObject:(id)a3 forKey:(id)a4 forContext:(id)a5 cache:(id)a6;
- (void)setCapabilityVoLTE:(id)a3 enabled:(BOOL)a4;
- (void)setCapabilityVoNR:(id)a3 enabled:(BOOL)a4;
- (void)setClient:(id)a3;
- (void)setNetworkSlicing:(id)a3 enabled:(BOOL)a4 category:(id)a5;
- (void)setNetworkSlicingCapability:(id)a3;
- (void)setNetworkSlicingCategories:(id)a3 forContext:(id)a4;
- (void)setSatelliteCapability:(id)a3;
- (void)setSatelliteCapability:(id)a3 enabled:(BOOL)a4;
- (void)setSimStatusCache:(id)a3;
- (void)setTurnOffCellular:(id)a3 enabled:(BOOL)a4;
- (void)setTurnOffCellularCapability:(id)a3;
- (void)setVolteCapability:(id)a3;
- (void)setVonrCapability:(id)a3;
@end

@implementation PSUICoreTelephonyCapabilitiesCache

+ (id)sharedInstance
{
  if (qword_26AC32208 != -1) {
    dispatch_once(&qword_26AC32208, &__block_literal_global_0);
  }
  v2 = (void *)_MergedGlobals_54;
  return v2;
}

uint64_t __52__PSUICoreTelephonyCapabilitiesCache_sharedInstance__block_invoke()
{
  _MergedGlobals_54 = [[PSUICoreTelephonyCapabilitiesCache alloc] initPrivate];
  return MEMORY[0x270F9A758]();
}

- (id)initPrivate
{
  v21.receiver = self;
  v21.super_class = (Class)PSUICoreTelephonyCapabilitiesCache;
  v2 = [(PSUICoreTelephonyCapabilitiesCache *)&v21 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F02D30]);
    v4 = [MEMORY[0x263F67F00] createCTClientSerialQueue:@"capabilities_cache"];
    uint64_t v5 = [v3 initWithQueue:v4];
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v5;

    [(CoreTelephonyClient *)v2->_client setDelegate:v2];
    uint64_t v7 = [MEMORY[0x263F67EF0] sharedInstance];
    simStatusCache = v2->_simStatusCache;
    v2->_simStatusCache = (PSSimStatusCache *)v7;

    v9 = [CTCapability alloc];
    v10 = [(CTCapability *)v9 initWithCapabilityName:*MEMORY[0x263F02D58]];
    [(PSUICoreTelephonyCapabilitiesCache *)v2 setVolteCapability:v10];

    v11 = [CTCapability alloc];
    v12 = [(CTCapability *)v11 initWithCapabilityName:*MEMORY[0x263F02D60]];
    [(PSUICoreTelephonyCapabilitiesCache *)v2 setVonrCapability:v12];

    v13 = [CTCapability alloc];
    v14 = [(CTCapability *)v13 initWithCapabilityName:*MEMORY[0x263F02D98]];
    [(PSUICoreTelephonyCapabilitiesCache *)v2 setTurnOffCellularCapability:v14];

    v15 = [CTCapability alloc];
    v16 = [(CTCapability *)v15 initWithCapabilityName:*MEMORY[0x263F02D80]];
    [(PSUICoreTelephonyCapabilitiesCache *)v2 setNetworkSlicingCapability:v16];

    v17 = [CTCapability alloc];
    v18 = [(CTCapability *)v17 initWithCapabilityName:*MEMORY[0x263F02D88]];
    [(PSUICoreTelephonyCapabilitiesCache *)v2 setSatelliteCapability:v18];

    v19 = [MEMORY[0x263F08A00] defaultCenter];
    [v19 addObserver:v2 selector:sel_willEnterForeground name:*MEMORY[0x263F833B8] object:0];
  }
  return v2;
}

- (PSUICoreTelephonyCapabilitiesCache)init
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    int v2 = 136315138;
    id v3 = "-[PSUICoreTelephonyCapabilitiesCache init]";
    _os_log_error_impl(&dword_221B17000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unsupported initializer called: %s", (uint8_t *)&v2, 0xCu);
  }
  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer" reason:@"Unsupported initializer called" userInfo:0]);
}

- (void)fetchCanSetCapabilityWithCache:(id)a3 forContext:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PSUICoreTelephonyCapabilitiesCache *)self getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v7;
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "Executing can set capability fetch for %@", buf, 0xCu);
  }

  unsigned __int8 v21 = 0;
  client = self->_client;
  v10 = [v6 capabilityName];
  id v20 = 0;
  v11 = [(CoreTelephonyClient *)client context:v7 canSetCapability:v10 allowed:&v21 with:&v20];
  id v12 = v20;

  if (v11)
  {
    v13 = [(PSUICoreTelephonyCapabilitiesCache *)self getLogger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v7;
      __int16 v24 = 2112;
      v25 = v11;
      _os_log_error_impl(&dword_221B17000, v13, OS_LOG_TYPE_ERROR, "Can set fetch for %@ failed: %@", buf, 0x16u);
    }
    uint64_t v14 = 0;
  }
  else
  {
    v15 = [v12 objectForKey:*MEMORY[0x263F02D90]];
    uint64_t v14 = [v15 BOOLValue];

    v13 = [(PSUICoreTelephonyCapabilitiesCache *)self getLogger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = @"YES";
      *(_DWORD *)buf = 138413058;
      if (v21) {
        v17 = @"YES";
      }
      else {
        v17 = @"NO";
      }
      id v23 = v7;
      if (!v14) {
        v16 = @"NO";
      }
      __int16 v24 = 2112;
      v25 = v17;
      __int16 v26 = 2112;
      v27 = v16;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_impl(&dword_221B17000, v13, OS_LOG_TYPE_DEFAULT, "Can set fetch for %@, Allowed: %@, Enabled: %@, %@", buf, 0x2Au);
    }
  }

  v18 = self;
  objc_sync_enter(v18);
  uint64_t v19 = [v7 slotID];
  [v6 acceptCapabilityforSlotID:v19 status:v14 canSet:v21 info:v12];
  objc_sync_exit(v18);
}

- (BOOL)canSetCapabilityForContext:(id)a3 cache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "slotID"));
  v9 = [v7 capabilityFetched];
  v10 = [v9 objectForKeyedSubscript:v8];
  char v11 = [v10 isEqual:MEMORY[0x263EFFA88]];

  if ((v11 & 1) == 0) {
    [(PSUICoreTelephonyCapabilitiesCache *)self fetchCanSetCapabilityWithCache:v7 forContext:v6];
  }
  id v12 = self;
  objc_sync_enter(v12);
  char v13 = objc_msgSend(v7, "getCapabilityForSlotID:", objc_msgSend(v6, "slotID"));
  objc_sync_exit(v12);

  return v13;
}

- (BOOL)getCapabilityInfo:(id)a3 forContext:(id)a4 cache:(id)a5
{
  uint64_t v5 = [(PSUICoreTelephonyCapabilitiesCache *)self getCapabilityInfoObject:a3 forContext:a4 cache:a5];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (id)getCapabilityInfoObject:(id)a3 forContext:(id)a4 cache:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "slotID"));
  id v12 = [v10 capabilityFetched];
  char v13 = [v12 objectForKeyedSubscript:v11];
  char v14 = [v13 isEqual:MEMORY[0x263EFFA88]];

  if ((v14 & 1) == 0) {
    [(PSUICoreTelephonyCapabilitiesCache *)self fetchCanSetCapabilityWithCache:v10 forContext:v9];
  }
  v15 = self;
  objc_sync_enter(v15);
  v16 = objc_msgSend(v10, "getCapabilityInfoObject:forSlotID:", v8, objc_msgSend(v9, "slotID"));
  objc_sync_exit(v15);

  return v16;
}

- (void)setCapabilityInfoObject:(id)a3 forKey:(id)a4 forContext:(id)a5 cache:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  char v13 = self;
  objc_sync_enter(v13);
  objc_msgSend(v12, "setCapabilityInfoObject:forKey:forSlotID:", v14, v10, objc_msgSend(v11, "slotID"));
  objc_sync_exit(v13);
}

- (void)fetchCapabilityEnabledWithCache:(id)a3 forContext:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PSUICoreTelephonyCapabilitiesCache *)self getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "Executing capability enabled fetch", buf, 2u);
  }

  unsigned __int8 v21 = 0;
  client = self->_client;
  id v10 = [v6 capabilityName];
  id v20 = 0;
  id v11 = [(CoreTelephonyClient *)client context:v7 getCapability:v10 status:&v21 with:&v20];
  id v12 = v20;

  if (v11)
  {
    char v13 = [(PSUICoreTelephonyCapabilitiesCache *)self getLogger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v7;
      __int16 v24 = 2112;
      v25 = v11;
      _os_log_error_impl(&dword_221B17000, v13, OS_LOG_TYPE_ERROR, "Capability enabled fetch failed for %@: %@", buf, 0x16u);
    }
    uint64_t v14 = 0;
  }
  else
  {
    v15 = [v12 objectForKey:*MEMORY[0x263F02D70]];
    uint64_t v14 = [v15 BOOLValue];

    char v13 = [(PSUICoreTelephonyCapabilitiesCache *)self getLogger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = @"NO";
      *(_DWORD *)buf = 138413058;
      if (v14) {
        v17 = @"YES";
      }
      else {
        v17 = @"NO";
      }
      id v23 = v7;
      __int16 v24 = 2112;
      if (v21) {
        v16 = @"YES";
      }
      v25 = v17;
      __int16 v26 = 2112;
      v27 = v16;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_impl(&dword_221B17000, v13, OS_LOG_TYPE_DEFAULT, "Fetch for capability for %@, Allowed: %@, Enabled: %@, %@", buf, 0x2Au);
    }
  }

  v18 = self;
  objc_sync_enter(v18);
  uint64_t v19 = [v7 slotID];
  [v6 acceptCapabilityforSlotID:v19 status:v21 canSet:v14 info:v12];
  objc_sync_exit(v18);
}

- (BOOL)capabilityEnabledForContext:(id)a3 cache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "slotID"));
  id v9 = [v7 enabledFetched];
  id v10 = [v9 objectForKeyedSubscript:v8];
  char v11 = [v10 isEqual:MEMORY[0x263EFFA88]];

  if ((v11 & 1) == 0) {
    [(PSUICoreTelephonyCapabilitiesCache *)self fetchCapabilityEnabledWithCache:v7 forContext:v6];
  }
  id v12 = self;
  objc_sync_enter(v12);
  char v13 = objc_msgSend(v7, "getEnabledForSlotID:", objc_msgSend(v6, "slotID"));
  objc_sync_exit(v12);

  return v13;
}

- (void)setCapabilityEnabledForContext:(id)a3 cache:(id)a4 enabled:(BOOL)a5 info:(id)a6
{
  BOOL v7 = a5;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  char v13 = [(PSUICoreTelephonyCapabilitiesCache *)self getLogger];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = @"NO";
    if (v7) {
      uint64_t v14 = @"YES";
    }
    int v20 = 138412546;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v14;
    _os_log_impl(&dword_221B17000, v13, OS_LOG_TYPE_DEFAULT, "Setting capability for %@ to %@", (uint8_t *)&v20, 0x16u);
  }

  client = self->_client;
  v16 = [v11 capabilityName];
  v17 = [(CoreTelephonyClient *)client context:v10 setCapability:v16 enabled:v7 with:v12];

  v18 = [(PSUICoreTelephonyCapabilitiesCache *)self getLogger];
  uint64_t v19 = (PSUICoreTelephonyCapabilitiesCache *)v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138412546;
      id v21 = v10;
      __int16 v22 = 2112;
      id v23 = v17;
      _os_log_error_impl(&dword_221B17000, &v19->super, OS_LOG_TYPE_ERROR, "Set capability for context %@ failed: %@", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_221B17000, &v19->super, OS_LOG_TYPE_DEFAULT, "Set succeeded", (uint8_t *)&v20, 2u);
    }

    uint64_t v19 = self;
    objc_sync_enter(v19);
    objc_msgSend(v11, "setEnabled:forSlotID:", v7, objc_msgSend(v10, "slotID"));
    objc_sync_exit(v19);
  }
}

- (BOOL)canSetCapabilityVoLTE:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSUICoreTelephonyCapabilitiesCache *)self volteCapability];
  LOBYTE(self) = [(PSUICoreTelephonyCapabilitiesCache *)self canSetCapabilityForContext:v4 cache:v5];

  return (char)self;
}

- (BOOL)cannotChangeVoLTESettingCallCarrier:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F02D78];
  id v5 = a3;
  id v6 = [(PSUICoreTelephonyCapabilitiesCache *)self volteCapability];
  LOBYTE(self) = [(PSUICoreTelephonyCapabilitiesCache *)self getCapabilityInfo:v4 forContext:v5 cache:v6];

  return (char)self;
}

- (BOOL)isVoLTEStillProvisioningForContext:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F02D68];
  id v5 = a3;
  id v6 = [(PSUICoreTelephonyCapabilitiesCache *)self volteCapability];
  LOBYTE(self) = [(PSUICoreTelephonyCapabilitiesCache *)self getCapabilityInfo:v4 forContext:v5 cache:v6];

  return (char)self;
}

- (BOOL)capabilityEnabledVoLTE:(id)a3
{
  id v4 = a3;
  id v5 = [(PSUICoreTelephonyCapabilitiesCache *)self volteCapability];
  LOBYTE(self) = [(PSUICoreTelephonyCapabilitiesCache *)self capabilityEnabledForContext:v4 cache:v5];

  return (char)self;
}

- (void)setCapabilityVoLTE:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PSUICoreTelephonyCapabilitiesCache *)self volteCapability];
  [(PSUICoreTelephonyCapabilitiesCache *)self setCapabilityEnabledForContext:v6 cache:v7 enabled:v4 info:0];
}

- (BOOL)fetchDeviceAndPlan5GSupport:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  client = self->_client;
  id v14 = 0;
  id v6 = [(CoreTelephonyClient *)client getSupports5G:v4 error:&v14];
  id v7 = v14;
  id v8 = [(PSUICoreTelephonyCapabilitiesCache *)self getLogger];
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v7;
      _os_log_error_impl(&dword_221B17000, v9, OS_LOG_TYPE_ERROR, "Fetch failed: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [v6 BOOLValue];
    id v11 = @"NO";
    if (v10) {
      id v11 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    id v16 = v4;
    __int16 v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_221B17000, v9, OS_LOG_TYPE_DEFAULT, "Fetch succeeded: %@, %@", buf, 0x16u);
  }

  char v12 = [v6 BOOLValue];
  return v12;
}

- (BOOL)canSetCapabilityVoNR:(id)a3
{
  id v4 = a3;
  id v5 = [(PSUICoreTelephonyCapabilitiesCache *)self vonrCapability];
  LOBYTE(self) = [(PSUICoreTelephonyCapabilitiesCache *)self canSetCapabilityForContext:v4 cache:v5];

  return (char)self;
}

- (BOOL)capabilityEnabledVoNR:(id)a3
{
  id v4 = a3;
  id v5 = [(PSUICoreTelephonyCapabilitiesCache *)self vonrCapability];
  LOBYTE(self) = [(PSUICoreTelephonyCapabilitiesCache *)self capabilityEnabledForContext:v4 cache:v5];

  return (char)self;
}

- (void)setCapabilityVoNR:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PSUICoreTelephonyCapabilitiesCache *)self vonrCapability];
  [(PSUICoreTelephonyCapabilitiesCache *)self setCapabilityEnabledForContext:v6 cache:v7 enabled:v4 info:0];
}

- (BOOL)canSetTurnOffCellular:(id)a3
{
  id v4 = a3;
  id v5 = [(PSUICoreTelephonyCapabilitiesCache *)self turnOffCellularCapability];
  LOBYTE(self) = [(PSUICoreTelephonyCapabilitiesCache *)self canSetCapabilityForContext:v4 cache:v5];

  return (char)self;
}

- (BOOL)getTurnOffCellular:(id)a3
{
  id v4 = a3;
  id v5 = [(PSUICoreTelephonyCapabilitiesCache *)self turnOffCellularCapability];
  LOBYTE(self) = [(PSUICoreTelephonyCapabilitiesCache *)self capabilityEnabledForContext:v4 cache:v5];

  return (char)self;
}

- (void)setTurnOffCellular:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PSUICoreTelephonyCapabilitiesCache *)self turnOffCellularCapability];
  [(PSUICoreTelephonyCapabilitiesCache *)self setCapabilityEnabledForContext:v6 cache:v7 enabled:v4 info:0];
}

- (BOOL)canSetNetworkSlicing:(id)a3
{
  id v4 = a3;
  id v5 = [(PSUICoreTelephonyCapabilitiesCache *)self networkSlicingCapability];
  LOBYTE(self) = [(PSUICoreTelephonyCapabilitiesCache *)self canSetCapabilityForContext:v4 cache:v5];

  return (char)self;
}

- (BOOL)getNetworkSlicing:(id)a3
{
  id v4 = a3;
  id v5 = [(PSUICoreTelephonyCapabilitiesCache *)self networkSlicingCapability];
  LOBYTE(self) = [(PSUICoreTelephonyCapabilitiesCache *)self capabilityEnabledForContext:v4 cache:v5];

  return (char)self;
}

- (void)setNetworkSlicing:(id)a3 enabled:(BOOL)a4 category:(id)a5
{
  BOOL v5 = a4;
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v13 = *MEMORY[0x263F02E68];
  v14[0] = a5;
  id v8 = NSDictionary;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 dictionaryWithObjects:v14 forKeys:&v13 count:1];

  char v12 = [(PSUICoreTelephonyCapabilitiesCache *)self networkSlicingCapability];
  [(PSUICoreTelephonyCapabilitiesCache *)self setCapabilityEnabledForContext:v10 cache:v12 enabled:v5 info:v11];
}

- (id)networkSlicingCategories:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F02E60];
  id v5 = a3;
  id v6 = [(PSUICoreTelephonyCapabilitiesCache *)self networkSlicingCapability];
  id v7 = [(PSUICoreTelephonyCapabilitiesCache *)self getCapabilityInfoObject:v4 forContext:v5 cache:v6];

  return v7;
}

- (void)setNetworkSlicingCategories:(id)a3 forContext:(id)a4
{
  uint64_t v6 = *MEMORY[0x263F02E60];
  id v7 = a4;
  id v8 = a3;
  id v9 = [(PSUICoreTelephonyCapabilitiesCache *)self networkSlicingCapability];
  [(PSUICoreTelephonyCapabilitiesCache *)self setCapabilityInfoObject:v8 forKey:v6 forContext:v7 cache:v9];
}

- (BOOL)canSetSatelliteCapability:(id)a3
{
  id v4 = a3;
  id v5 = [(PSUICoreTelephonyCapabilitiesCache *)self satelliteCapability];
  LOBYTE(self) = [(PSUICoreTelephonyCapabilitiesCache *)self canSetCapabilityForContext:v4 cache:v5];

  return (char)self;
}

- (BOOL)getSatelliteCapability:(id)a3
{
  id v4 = a3;
  id v5 = [(PSUICoreTelephonyCapabilitiesCache *)self satelliteCapability];
  LOBYTE(self) = [(PSUICoreTelephonyCapabilitiesCache *)self capabilityEnabledForContext:v4 cache:v5];

  return (char)self;
}

- (void)setSatelliteCapability:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PSUICoreTelephonyCapabilitiesCache *)self satelliteCapability];
  [(PSUICoreTelephonyCapabilitiesCache *)self setCapabilityEnabledForContext:v6 cache:v7 enabled:v4 info:0];
}

- (void)context:(id)a3 capabilitiesChanged:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PSUICoreTelephonyCapabilitiesCache *)self getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v46 = 138412546;
    id v47 = v6;
    __int16 v48 = 2112;
    id v49 = v7;
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "capabilitiesChanged: %@, %@", (uint8_t *)&v46, 0x16u);
  }

  id v9 = [v7 objectForKey:*MEMORY[0x263F02D58]];
  id v10 = v9;
  id v11 = (void *)MEMORY[0x263F02D70];
  char v12 = (void *)MEMORY[0x263F02D90];
  if (v9)
  {
    uint64_t v13 = [v9 objectForKey:*MEMORY[0x263F02D70]];
    uint64_t v14 = [v13 BOOLValue];

    v15 = [v10 objectForKey:*v12];
    uint64_t v16 = [v15 BOOLValue];

    __int16 v17 = [(PSUICoreTelephonyCapabilitiesCache *)self volteCapability];
    objc_msgSend(v17, "acceptCapabilityforSlotID:status:canSet:info:", objc_msgSend(v6, "slotID"), v16, v14, v10);
  }
  v18 = [v7 objectForKey:*MEMORY[0x263F02D60]];
  uint64_t v19 = v18;
  if (v18)
  {
    int v20 = [v18 objectForKey:*v11];
    uint64_t v21 = [v20 BOOLValue];

    __int16 v22 = [v19 objectForKey:*v12];
    uint64_t v23 = [v22 BOOLValue];

    uint64_t v24 = [(PSUICoreTelephonyCapabilitiesCache *)self vonrCapability];
    objc_msgSend(v24, "acceptCapabilityforSlotID:status:canSet:info:", objc_msgSend(v6, "slotID"), v23, v21, v19);
  }
  v25 = [v7 objectForKey:*MEMORY[0x263F02D98]];
  __int16 v26 = v25;
  if (v25)
  {
    v27 = [v25 objectForKey:*v11];
    uint64_t v28 = [v27 BOOLValue];

    id v29 = [v26 objectForKey:*v12];
    uint64_t v30 = [v29 BOOLValue];

    v31 = [(PSUICoreTelephonyCapabilitiesCache *)self turnOffCellularCapability];
    objc_msgSend(v31, "acceptCapabilityforSlotID:status:canSet:info:", objc_msgSend(v6, "slotID"), v30, v28, v26);
  }
  v32 = [v7 objectForKey:*MEMORY[0x263F02D80]];
  v33 = v32;
  if (v32)
  {
    v34 = [v32 objectForKey:*v11];
    uint64_t v35 = [v34 BOOLValue];

    v36 = [v33 objectForKey:*v12];
    uint64_t v37 = [v36 BOOLValue];

    v38 = [(PSUICoreTelephonyCapabilitiesCache *)self networkSlicingCapability];
    objc_msgSend(v38, "acceptCapabilityforSlotID:status:canSet:info:", objc_msgSend(v6, "slotID"), v37, v35, v33);
  }
  v39 = [v7 objectForKey:*MEMORY[0x263F02D88]];
  v40 = v39;
  if (v39)
  {
    v41 = [v39 objectForKey:*v11];
    uint64_t v42 = [v41 BOOLValue];

    v43 = [v40 objectForKey:*v12];
    uint64_t v44 = [v43 BOOLValue];

    v45 = [(PSUICoreTelephonyCapabilitiesCache *)self satelliteCapability];
    objc_msgSend(v45, "acceptCapabilityforSlotID:status:canSet:info:", objc_msgSend(v6, "slotID"), v44, v42, v40);
  }
}

- (void)clearCache
{
  id v3 = [(PSUICoreTelephonyCapabilitiesCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Clearing capabilities cache", v9, 2u);
  }

  BOOL v4 = [(PSUICoreTelephonyCapabilitiesCache *)self volteCapability];
  [v4 reset];

  id v5 = [(PSUICoreTelephonyCapabilitiesCache *)self vonrCapability];
  [v5 reset];

  id v6 = [(PSUICoreTelephonyCapabilitiesCache *)self turnOffCellularCapability];
  [v6 reset];

  id v7 = [(PSUICoreTelephonyCapabilitiesCache *)self networkSlicingCapability];
  [v7 reset];

  id v8 = [(PSUICoreTelephonyCapabilitiesCache *)self satelliteCapability];
  [v8 reset];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"Capabilities"];
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (PSSimStatusCache)simStatusCache
{
  return self->_simStatusCache;
}

- (void)setSimStatusCache:(id)a3
{
}

- (CTCapability)volteCapability
{
  return (CTCapability *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVolteCapability:(id)a3
{
}

- (CTCapability)vonrCapability
{
  return (CTCapability *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVonrCapability:(id)a3
{
}

- (CTCapability)turnOffCellularCapability
{
  return (CTCapability *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTurnOffCellularCapability:(id)a3
{
}

- (CTCapability)networkSlicingCapability
{
  return (CTCapability *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNetworkSlicingCapability:(id)a3
{
}

- (CTCapability)satelliteCapability
{
  return (CTCapability *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSatelliteCapability:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_satelliteCapability, 0);
  objc_storeStrong((id *)&self->_networkSlicingCapability, 0);
  objc_storeStrong((id *)&self->_turnOffCellularCapability, 0);
  objc_storeStrong((id *)&self->_vonrCapability, 0);
  objc_storeStrong((id *)&self->_volteCapability, 0);
  objc_storeStrong((id *)&self->_simStatusCache, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end