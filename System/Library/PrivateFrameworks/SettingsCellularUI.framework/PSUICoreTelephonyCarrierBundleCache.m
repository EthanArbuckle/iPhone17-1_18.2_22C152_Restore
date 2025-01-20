@interface PSUICoreTelephonyCarrierBundleCache
+ (PSUICoreTelephonyCarrierBundleCache)sharedInstance;
- (BOOL)getCarrierBundleFlagForKey:(id)a3 context:(id)a4;
- (BOOL)is5GSAEnabledByDefault:(id)a3;
- (BOOL)isMMSOnWhileRoamingForActiveDataPlan;
- (BOOL)shouldOverride3Gto4G:(id)a3;
- (BOOL)shouldOverrideLTEto4G:(id)a3;
- (BOOL)shouldShowVoiceRoamingSwitchForDefaultVoicePlan;
- (BOOL)shouldShowWifiAssistForActiveDataPlan;
- (BOOL)show5GSACoverageExtension:(id)a3;
- (BOOL)show5GWarningUnsupportedCarrier:(id)a3;
- (BOOL)showServiceCodes:(id)a3;
- (BOOL)showVoNRWarningUnsupportedCarrier:(id)a3;
- (BOOL)showVolteWarningUnsupportedCarrier:(id)a3;
- (CoreTelephonyClient)client;
- (NSArray)defaultValues;
- (NSArray)keys;
- (NSMutableDictionary)carrierBundleVersionDict;
- (NSMutableDictionary)dictionariesBySlot;
- (PSSimStatusCache)simCache;
- (PSUICoreTelephonyCarrierBundleCache)init;
- (PSUICoreTelephonyCarrierBundleCache)initWithCoreTelephonyClient:(id)a3 simStatusCache:(id)a4;
- (id)activeDataCarrierName;
- (id)carrierBundleVersion:(id)a3;
- (id)carrierName:(id)a3;
- (id)carrierServiceNameForServiceName:(id)a3 context:(id)a4;
- (id)carrierServices:(id)a3;
- (id)carrierServicesAccountUrl:(id)a3;
- (id)carrierServicesMyAccountUrlTitle:(id)a3;
- (id)carrierServicesWebViewAccountUrl:(id)a3;
- (id)fetchCarrierBundleValue:(id)a3 context:(id)a4;
- (id)getCarrierBundleArrayForKey:(id)a3 context:(id)a4;
- (id)getCarrierBundleDictForKey:(id)a3 context:(id)a4;
- (id)getCarrierBundleStringForKey:(id)a3 context:(id)a4;
- (id)getCarrierBundleValueForKey:(id)a3 context:(id)a4;
- (id)getDictionaryForSlotID:(int64_t)a3;
- (id)getLogger;
- (id)initPrivate;
- (id)mmsInfoTitle:(id)a3;
- (id)mmsInfoUrl:(id)a3;
- (id)volteCustomerCareWebsite:(id)a3;
- (void)_clearCache;
- (void)bulkFetch;
- (void)bulkFetchCarrierServicesNamesForServices:(id)a3 context:(id)a4;
- (void)bulkFetchForKeys:(id)a3 defaultValues:(id)a4;
- (void)carrierBundleChange:(id)a3;
- (void)createKeysAndDefaultValues;
- (void)fetchCarrierBundleVersion;
- (void)resetDictionariesBySlot;
- (void)setCarrierBundleVersionDict:(id)a3;
- (void)setClient:(id)a3;
- (void)setDefaultValues:(id)a3;
- (void)setDictionariesBySlot:(id)a3;
- (void)setKeys:(id)a3;
- (void)setSimCache:(id)a3;
- (void)willEnterForeground;
@end

@implementation PSUICoreTelephonyCarrierBundleCache

+ (PSUICoreTelephonyCarrierBundleCache)sharedInstance
{
  if (qword_26AC32328 != -1) {
    dispatch_once(&qword_26AC32328, &__block_literal_global_18);
  }
  v2 = (void *)_MergedGlobals_70;
  return (PSUICoreTelephonyCarrierBundleCache *)v2;
}

uint64_t __53__PSUICoreTelephonyCarrierBundleCache_sharedInstance__block_invoke()
{
  _MergedGlobals_70 = [[PSUICoreTelephonyCarrierBundleCache alloc] initPrivate];
  return MEMORY[0x270F9A758]();
}

- (id)initPrivate
{
  id v3 = objc_alloc(MEMORY[0x263F02D30]);
  v4 = [MEMORY[0x263F67F00] createCTClientSerialQueue:@"carrier_bundle"];
  v5 = (void *)[v3 initWithQueue:v4];
  v6 = [MEMORY[0x263F67EF0] sharedInstance];
  v7 = [(PSUICoreTelephonyCarrierBundleCache *)self initWithCoreTelephonyClient:v5 simStatusCache:v6];

  return v7;
}

- (PSUICoreTelephonyCarrierBundleCache)initWithCoreTelephonyClient:(id)a3 simStatusCache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PSUICoreTelephonyCarrierBundleCache;
  v9 = [(PSUICoreTelephonyCarrierBundleCache *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    [(CoreTelephonyClient *)v10->_client setDelegate:v10];
    objc_storeStrong((id *)&v10->_simCache, a4);
    [(PSUICoreTelephonyCarrierBundleCache *)v10 resetDictionariesBySlot];
    [(PSUICoreTelephonyCarrierBundleCache *)v10 createKeysAndDefaultValues];
    [(PSUICoreTelephonyCarrierBundleCache *)v10 _clearCache];
    [(PSUICoreTelephonyCarrierBundleCache *)v10 bulkFetch];
    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v10 selector:sel_willEnterForeground name:*MEMORY[0x263F833B8] object:0];
  }
  return v10;
}

- (PSUICoreTelephonyCarrierBundleCache)init
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = [(PSUICoreTelephonyCarrierBundleCache *)self getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    v4 = "-[PSUICoreTelephonyCarrierBundleCache init]";
    _os_log_error_impl(&dword_221B17000, v2, OS_LOG_TYPE_ERROR, "Error: unsupported initializer called: %s", (uint8_t *)&v3, 0xCu);
  }

  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer" reason:@"Unsupported initializer called" userInfo:0]);
}

- (void)resetDictionariesBySlot
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v3 = [(PSSimStatusCache *)self->_simCache subscriptionContexts];
  os_unfair_lock_lock((os_unfair_lock_t)&cacheLock);
  v4 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v3, "count"));
  dictionariesBySlot = self->_dictionariesBySlot;
  self->_dictionariesBySlot = v4;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(PSSimStatusCache *)self->_simCache subscriptionContexts];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = self->_dictionariesBySlot;
        id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "slotID"));
        [(NSMutableDictionary *)v12 setObject:v13 forKey:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
}

- (void)createKeysAndDefaultValues
{
  int v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(&unk_26D426038, "count"));
  v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(&unk_26D426038, "count"));
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__PSUICoreTelephonyCarrierBundleCache_createKeysAndDefaultValues__block_invoke;
  v11[3] = &unk_2645E1690;
  uint64_t v5 = v3;
  v12 = v5;
  v6 = v4;
  id v13 = v6;
  [&unk_26D426038 enumerateKeysAndObjectsUsingBlock:v11];
  keys = self->_keys;
  self->_keys = v5;
  uint64_t v8 = v5;

  defaultValues = self->_defaultValues;
  self->_defaultValues = v6;
  v10 = v6;
}

void __65__PSUICoreTelephonyCarrierBundleCache_createKeysAndDefaultValues__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 addObject:a2];
  [*(id *)(a1 + 40) addObject:v6];
}

- (void)_clearCache
{
  int v3 = [(PSUICoreTelephonyCarrierBundleCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Clearing carrier bundle cache", v4, 2u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&cacheLock);
  [(PSUICoreTelephonyCarrierBundleCache *)self setCarrierBundleVersionDict:0];
  os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
  [(PSUICoreTelephonyCarrierBundleCache *)self resetDictionariesBySlot];
}

- (void)willEnterForeground
{
  [(PSUICoreTelephonyCarrierBundleCache *)self _clearCache];
  [(PSUICoreTelephonyCarrierBundleCache *)self bulkFetch];
}

- (id)getDictionaryForSlotID:(int64_t)a3
{
  dictionariesBySlot = self->_dictionariesBySlot;
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  id v7 = [(NSMutableDictionary *)dictionariesBySlot objectForKey:v6];

  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v8 = self->_dictionariesBySlot;
    uint64_t v9 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v8 setObject:v7 forKey:v9];
  }
  return v7;
}

- (void)bulkFetch
{
}

- (void)bulkFetchForKeys:(id)a3 defaultValues:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(PSSimStatusCache *)self->_simCache subscriptionContexts];
  uint64_t v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
        client = self->_client;
        v14 = (void *)[objc_alloc(MEMORY[0x263F02C20]) initWithBundleType:1];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __70__PSUICoreTelephonyCarrierBundleCache_bulkFetchForKeys_defaultValues___block_invoke;
        v16[3] = &unk_2645E16B8;
        v16[4] = self;
        v16[5] = v12;
        id v17 = v6;
        [(CoreTelephonyClient *)client copyCarrierBundleValues:v12 keys:v17 defaultValues:v7 bundleType:v14 withFallbackBundleCheck:1 completion:v16];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
}

void __70__PSUICoreTelephonyCarrierBundleCache_bulkFetchForKeys_defaultValues___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v8 = [a1[4] getLogger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v12 = a1[5];
      id v13 = [v12 uuid];
      int v14 = 136316162;
      long long v15 = "-[PSUICoreTelephonyCarrierBundleCache bulkFetchForKeys:defaultValues:]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v12;
      __int16 v18 = 2114;
      long long v19 = v13;
      __int16 v20 = 2114;
      uint64_t v21 = MEMORY[0x263EFFA68];
      __int16 v22 = 2114;
      uint64_t v23 = v7;
      _os_log_error_impl(&dword_221B17000, v8, OS_LOG_TYPE_ERROR, "%s bulk fetch from: %@ with UUID:%{public}@ for keys: %{public}@ failed. Error: %{public}@", (uint8_t *)&v14, 0x34u);
    }
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&cacheLock);
    uint64_t v8 = objc_msgSend(a1[4], "getDictionaryForSlotID:", objc_msgSend(a1[5], "slotID"));
    if ([a1[6] count])
    {
      unint64_t v9 = 0;
      do
      {
        uint64_t v10 = [v5 objectAtIndexedSubscript:v9];
        uint64_t v11 = [a1[6] objectAtIndexedSubscript:v9];
        [v8 setObject:v10 forKey:v11];

        ++v9;
      }
      while ([a1[6] count] > v9);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
  }
}

- (id)fetchCarrierBundleValue:(id)a3 context:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PSUICoreTelephonyCarrierBundleCache *)self getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    long long v19 = "-[PSUICoreTelephonyCarrierBundleCache fetchCarrierBundleValue:context:]";
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "%s executing fetch %@ %@", buf, 0x20u);
  }

  client = self->_client;
  id v17 = 0;
  uint64_t v10 = [(CoreTelephonyClient *)client context:v7 getCarrierBundleValue:v6 error:&v17];
  uint64_t v11 = v17;
  id v12 = [(PSUICoreTelephonyCarrierBundleCache *)self getLogger];
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = [v7 uuid];
      *(_DWORD *)buf = 136316162;
      long long v19 = "-[PSUICoreTelephonyCarrierBundleCache fetchCarrierBundleValue:context:]";
      __int16 v20 = 2112;
      id v21 = v7;
      __int16 v22 = 2114;
      id v23 = v16;
      __int16 v24 = 2114;
      id v25 = v6;
      __int16 v26 = 2114;
      v27 = v11;
      _os_log_error_impl(&dword_221B17000, v13, OS_LOG_TYPE_ERROR, "%s fetch from: %@ with UUID:%{public}@ for key hierarchy: %{public}@ failed. Error: %{public}@", buf, 0x34u);
    }
    id v13 = v10;
    uint64_t v10 = 0;
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = [v7 uuid];
    *(_DWORD *)buf = 136316162;
    long long v19 = "-[PSUICoreTelephonyCarrierBundleCache fetchCarrierBundleValue:context:]";
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2114;
    id v23 = v14;
    __int16 v24 = 2114;
    id v25 = v6;
    __int16 v26 = 2114;
    v27 = v10;
    _os_log_impl(&dword_221B17000, v13, OS_LOG_TYPE_DEFAULT, "%s fetch from: %@ with UUID:%{public}@ for key hierarchy: %{public}@ successful. Value:%{public}@", buf, 0x34u);
  }
  return v10;
}

- (id)getCarrierBundleValueForKey:(id)a3 context:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&cacheLock);
  uint64_t v8 = -[PSUICoreTelephonyCarrierBundleCache getDictionaryForSlotID:](self, "getDictionaryForSlotID:", [v7 slotID]);
  unint64_t v9 = [v8 objectForKey:v6];
  if (!v9)
  {
    v12[0] = v6;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    unint64_t v9 = [(PSUICoreTelephonyCarrierBundleCache *)self fetchCarrierBundleValue:v10 context:v7];

    if (v9) {
      [v8 setObject:v9 forKey:v6];
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);

  return v9;
}

- (id)getCarrierBundleStringForKey:(id)a3 context:(id)a4
{
  v4 = [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleValueForKey:a3 context:a4];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)getCarrierBundleFlagForKey:(id)a3 context:(id)a4
{
  v4 = [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleValueForKey:a3 context:a4];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)getCarrierBundleArrayForKey:(id)a3 context:(id)a4
{
  v4 = [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleValueForKey:a3 context:a4];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)getCarrierBundleDictForKey:(id)a3 context:(id)a4
{
  v4 = [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleValueForKey:a3 context:a4];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)carrierName:(id)a3
{
  return [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleStringForKey:@"CarrierName" context:a3];
}

- (id)activeDataCarrierName
{
  int v3 = [(PSSimStatusCache *)self->_simCache activeDataSubscriptionContext];
  v4 = [(PSUICoreTelephonyCarrierBundleCache *)self carrierName:v3];

  return v4;
}

- (void)fetchCarrierBundleVersion
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  int v3 = [(PSUICoreTelephonyCarrierBundleCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v25 = "-[PSUICoreTelephonyCarrierBundleCache fetchCarrierBundleVersion]";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s executing fetch", buf, 0xCu);
  }

  v4 = [(PSSimStatusCache *)self->_simCache subscriptionContexts];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v21;
    *(void *)&long long v8 = 136315650;
    long long v18 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
        client = self->_client;
        id v19 = 0;
        int v14 = (void *)-[CoreTelephonyClient copyCarrierBundleVersion:error:](client, "copyCarrierBundleVersion:error:", v12, &v19, v18);
        id v15 = v19;
        __int16 v16 = [(PSUICoreTelephonyCarrierBundleCache *)self getLogger];
        id v17 = v16;
        if (v15)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            id v25 = "-[PSUICoreTelephonyCarrierBundleCache fetchCarrierBundleVersion]";
            __int16 v26 = 2112;
            v27 = v12;
            __int16 v28 = 2112;
            id v29 = v15;
            _os_log_error_impl(&dword_221B17000, v17, OS_LOG_TYPE_ERROR, "%s fetch failed: %@, %@", buf, 0x20u);
          }
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            id v25 = "-[PSUICoreTelephonyCarrierBundleCache fetchCarrierBundleVersion]";
            __int16 v26 = 2112;
            v27 = v12;
            __int16 v28 = 2112;
            id v29 = v14;
            _os_log_impl(&dword_221B17000, v17, OS_LOG_TYPE_DEFAULT, "%s fetched succeeded: %@, %@", buf, 0x20u);
          }

          id v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "slotID"));
          [v5 setObject:v14 forKeyedSubscript:v17];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v9);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&cacheLock);
  [(PSUICoreTelephonyCarrierBundleCache *)self setCarrierBundleVersionDict:v5];
  os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
}

- (id)carrierBundleVersion:(id)a3
{
  id v4 = a3;
  id v5 = [(PSUICoreTelephonyCarrierBundleCache *)self carrierBundleVersionDict];

  if (!v5) {
    [(PSUICoreTelephonyCarrierBundleCache *)self fetchCarrierBundleVersion];
  }
  os_unfair_lock_lock((os_unfair_lock_t)&cacheLock);
  id v6 = [(PSUICoreTelephonyCarrierBundleCache *)self carrierBundleVersionDict];
  uint64_t v7 = NSNumber;
  uint64_t v8 = [v4 slotID];

  uint64_t v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 objectForKeyedSubscript:v9];

  os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
  return v10;
}

- (BOOL)shouldOverride3Gto4G:(id)a3
{
  int v3 = [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleStringForKey:@"DataIndicatorOverride" context:a3];
  char v4 = [v3 isEqualToString:@"4G"];

  return v4;
}

- (BOOL)shouldOverrideLTEto4G:(id)a3
{
  int v3 = [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleStringForKey:@"DataIndicatorOverrideForLTE" context:a3];
  char v4 = [v3 isEqualToString:@"4G"];

  return v4;
}

- (id)volteCustomerCareWebsite:(id)a3
{
  return [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleStringForKey:@"VoLTECustomerCareWebsite" context:a3];
}

- (BOOL)showVolteWarningUnsupportedCarrier:(id)a3
{
  return [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleFlagForKey:@"ShowVolteWarningUnsupportedCarrier" context:a3];
}

- (BOOL)showVoNRWarningUnsupportedCarrier:(id)a3
{
  return [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleFlagForKey:@"ShowVoNRWarningUnsupportedCarrier" context:a3];
}

- (BOOL)show5GWarningUnsupportedCarrier:(id)a3
{
  return [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleFlagForKey:@"Show5GWarningUnsupportedCarrier" context:a3];
}

- (BOOL)is5GSAEnabledByDefault:(id)a3
{
  return [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleFlagForKey:@"Enable5GStandaloneByDefault" context:a3];
}

- (BOOL)show5GSACoverageExtension:(id)a3
{
  return [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleFlagForKey:@"Supports5GSACoverageExtension" context:a3];
}

- (void)bulkFetchCarrierServicesNamesForServices:(id)a3 context:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
  os_unfair_lock_lock((os_unfair_lock_t)&cacheLock);
  long long v18 = v7;
  id v17 = self;
  uint64_t v8 = -[PSUICoreTelephonyCarrierBundleCache getDictionaryForSlotID:](self, "getDictionaryForSlotID:", [v7 slotID]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = [*(id *)(*((void *)&v21 + 1) + 8 * i) objectForKey:@"ServiceName"];
        if (v14)
        {
          id v15 = (void *)[[NSString alloc] initWithFormat:@"%@_SERVICE_NAME", v14];
          __int16 v16 = [v8 objectForKey:v15];
          if (!v16)
          {
            [v20 addObject:v15];
            [v19 addObject:&stru_26D410CA0];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
  if ([v20 count]) {
    [(PSUICoreTelephonyCarrierBundleCache *)v17 bulkFetchForKeys:v20 defaultValues:v19];
  }
}

- (id)carrierServices:(id)a3
{
  id v4 = a3;
  id v5 = [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleArrayForKey:@"Services" context:v4];
  [(PSUICoreTelephonyCarrierBundleCache *)self bulkFetchCarrierServicesNamesForServices:v5 context:v4];

  return v5;
}

- (BOOL)showServiceCodes:(id)a3
{
  return [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleFlagForKey:@"ShowServiceCodes" context:a3];
}

- (id)carrierServiceNameForServiceName:(id)a3 context:(id)a4
{
  id v6 = (objc_class *)NSString;
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)[[v6 alloc] initWithFormat:@"%@_SERVICE_NAME", v8];

  uint64_t v10 = [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleStringForKey:v9 context:v7];

  return v10;
}

- (id)carrierServicesAccountUrl:(id)a3
{
  return [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleStringForKey:@"MyAccountURL" context:a3];
}

- (id)carrierServicesWebViewAccountUrl:(id)a3
{
  return [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleStringForKey:@"MyAccountURLInWebViewer" context:a3];
}

- (id)carrierServicesMyAccountUrlTitle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleStringForKey:@"MyAccountURLTitle" context:v4];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = (void *)[[NSString alloc] initWithFormat:@"%@_MYACCOUNTURLTITLE", v5];
    if (v7)
    {
      id v8 = [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleStringForKey:v7 context:v4];
      if (v8 && ([v7 isEqualToString:v8] & 1) == 0)
      {
        id v9 = v8;

        id v6 = v9;
      }
    }
  }
  else
  {
    id v6 = [(PSUICoreTelephonyCarrierBundleCache *)self carrierName:v4];
  }

  return v6;
}

- (id)mmsInfoUrl:(id)a3
{
  return [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleStringForKey:@"MMSInformationURL" context:a3];
}

- (id)mmsInfoTitle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleStringForKey:@"MMSInformationURLTitle" context:v4];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = (void *)[[NSString alloc] initWithFormat:@"%@_MMSINFORMATIONURLTITLE", v5];
    if (v7)
    {
      id v8 = [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleStringForKey:v7 context:v4];
      if (v8 && ([v7 isEqualToString:v8] & 1) == 0)
      {
        id v9 = v8;

        id v6 = v9;
      }
    }
  }
  else
  {
    id v6 = [(PSUICoreTelephonyCarrierBundleCache *)self carrierName:v4];
  }

  return v6;
}

- (BOOL)shouldShowVoiceRoamingSwitchForDefaultVoicePlan
{
  int v3 = [(PSSimStatusCache *)self->_simCache defaultVoiceSubscriptionContext];
  if (v3) {
    BOOL v4 = [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleFlagForKey:@"ShowVoiceRoamingSwitch" context:v3];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isMMSOnWhileRoamingForActiveDataPlan
{
  int v3 = [(PSSimStatusCache *)self->_simCache activeDataSubscriptionContext];
  if (v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&cacheLock);
    BOOL v4 = -[PSUICoreTelephonyCarrierBundleCache getDictionaryForSlotID:](self, "getDictionaryForSlotID:", [v3 slotID]);
    id v5 = [v4 objectForKey:@"OnWhileRoaming"];
    if (!v5)
    {
      id v6 = [(PSUICoreTelephonyCarrierBundleCache *)self fetchCarrierBundleValue:&unk_26D426008 context:v3];
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        id v5 = v6;
      }
      else {
        id v5 = (id)MEMORY[0x263EFFA80];
      }
      [v4 setObject:v5 forKey:@"OnWhileRoaming"];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v7 = [v5 BOOLValue];
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)shouldShowWifiAssistForActiveDataPlan
{
  int v3 = [(PSSimStatusCache *)self->_simCache activeDataSubscriptionContext];
  if (v3)
  {
    BOOL v4 = [(PSUICoreTelephonyCarrierBundleCache *)self getCarrierBundleDictForKey:@"ReliableNetworkFallback" context:v3];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 objectForKeyedSubscript:@"UserCanEdit"];
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        char v7 = [v6 BOOLValue];
      }
      else {
        char v7 = 1;
      }
    }
    else
    {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void)carrierBundleChange:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PSUICoreTelephonyCarrierBundleCache *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    char v7 = "-[PSUICoreTelephonyCarrierBundleCache carrierBundleChange:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s updating cached values for: %@", (uint8_t *)&v6, 0x16u);
  }

  [(PSUICoreTelephonyCarrierBundleCache *)self _clearCache];
  [(PSUICoreTelephonyCarrierBundleCache *)self bulkFetch];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CarrierBundleCache"];
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (PSSimStatusCache)simCache
{
  return self->_simCache;
}

- (void)setSimCache:(id)a3
{
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (NSArray)defaultValues
{
  return self->_defaultValues;
}

- (void)setDefaultValues:(id)a3
{
}

- (NSMutableDictionary)dictionariesBySlot
{
  return self->_dictionariesBySlot;
}

- (void)setDictionariesBySlot:(id)a3
{
}

- (NSMutableDictionary)carrierBundleVersionDict
{
  return self->_carrierBundleVersionDict;
}

- (void)setCarrierBundleVersionDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierBundleVersionDict, 0);
  objc_storeStrong((id *)&self->_dictionariesBySlot, 0);
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_simCache, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end