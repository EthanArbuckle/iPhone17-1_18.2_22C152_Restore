@interface PSUICoreTelephonySubscriberCache
+ (id)sharedInstance;
- (CoreTelephonyClient)client;
- (NSMutableDictionary)isoCountryCodesDict;
- (NSMutableDictionary)mobileEquipmentInfoDict;
- (NSMutableDictionary)shortLabelDict;
- (PSUICoreTelephonySubscriberCache)init;
- (PSUICoreTelephonySubscriberCache)initWithCoreTelephonyClient:(id)a3 simStatusCache:(id)a4;
- (id)getLogger;
- (id)initPrivate;
- (id)isoCountryCode:(id)a3;
- (id)mobileEquipmentInfo:(id)a3;
- (id)shortLabel:(id)a3;
- (unint64_t)mobileEquipmentInfoLength;
- (void)fetchCountryCodes;
- (void)fetchMobileEquipmentInfo;
- (void)fetchShortLabels;
- (void)prlVersionDidChange:(id)a3 version:(id)a4;
- (void)setClient:(id)a3;
- (void)setIsoCountryCodesDict:(id)a3;
- (void)setMobileEquipmentInfoDict:(id)a3;
- (void)setShortLabelDict:(id)a3;
- (void)shortLabelsDidChange;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
- (void)willEnterForeground;
@end

@implementation PSUICoreTelephonySubscriberCache

+ (id)sharedInstance
{
  if (qword_26AC32278 != -1) {
    dispatch_once(&qword_26AC32278, &__block_literal_global_9);
  }
  v2 = (void *)_MergedGlobals_60;
  return v2;
}

uint64_t __50__PSUICoreTelephonySubscriberCache_sharedInstance__block_invoke()
{
  _MergedGlobals_60 = [[PSUICoreTelephonySubscriberCache alloc] initPrivate];
  return MEMORY[0x270F9A758]();
}

- (id)initPrivate
{
  id v3 = objc_alloc(MEMORY[0x263F02D30]);
  v4 = [MEMORY[0x263F67F00] createCTClientSerialQueue:@"subscriber_cache"];
  v5 = (void *)[v3 initWithQueue:v4];
  v6 = [MEMORY[0x263F67EF0] sharedInstance];
  v7 = [(PSUICoreTelephonySubscriberCache *)self initWithCoreTelephonyClient:v5 simStatusCache:v6];

  return v7;
}

- (PSUICoreTelephonySubscriberCache)initWithCoreTelephonyClient:(id)a3 simStatusCache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PSUICoreTelephonySubscriberCache;
  v9 = [(PSUICoreTelephonySubscriberCache *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    [(CoreTelephonyClient *)v10->_client setDelegate:v10];
    objc_storeStrong((id *)&v10->_simStatusCache, a4);
    [(PSUICoreTelephonySubscriberCache *)v10 setMobileEquipmentInfoDict:0];
    [(PSUICoreTelephonySubscriberCache *)v10 setIsoCountryCodesDict:0];
    [(PSUICoreTelephonySubscriberCache *)v10 setShortLabelDict:0];
    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v10 selector:sel_willEnterForeground name:*MEMORY[0x263F833B8] object:0];
  }
  return v10;
}

- (PSUICoreTelephonySubscriberCache)init
{
  v2 = [(PSUICoreTelephonySubscriberCache *)self getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v3 = 0;
    _os_log_error_impl(&dword_221B17000, v2, OS_LOG_TYPE_ERROR, "Error: unsupported initializer called", v3, 2u);
  }

  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer" reason:@"Unsupported initializer called" userInfo:0]);
}

- (void)willEnterForeground
{
  [(PSUICoreTelephonySubscriberCache *)self setMobileEquipmentInfoDict:0];
  [(PSUICoreTelephonySubscriberCache *)self setIsoCountryCodesDict:0];
  [(PSUICoreTelephonySubscriberCache *)self setShortLabelDict:0];
}

- (void)fetchMobileEquipmentInfo
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [(PSUICoreTelephonySubscriberCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "fetchMobileEquipmentInfo executing", buf, 2u);
  }

  client = self->_client;
  id v20 = 0;
  v15 = [(CoreTelephonyClient *)client getMobileEquipmentInfo:&v20];
  id v5 = v20;
  v6 = [(PSUICoreTelephonySubscriberCache *)self getLogger];
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v5;
      _os_log_error_impl(&dword_221B17000, v7, OS_LOG_TYPE_ERROR, "fetchMobileEquipmentInfo failed: %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v15;
      _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "fetchMobileEquipmentInfo succeeded: %@", buf, 0xCu);
    }

    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = [v15 meInfoList];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          objc_super v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "slotId"));
          [v7 setObject:v12 forKeyedSubscript:v13];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v9);
    }

    v14 = self;
    objc_sync_enter(v14);
    [(PSUICoreTelephonySubscriberCache *)v14 setMobileEquipmentInfoDict:v7];
    objc_sync_exit(v14);
  }
}

- (id)mobileEquipmentInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(PSUICoreTelephonySubscriberCache *)self mobileEquipmentInfoDict];

  if (!v5) {
    [(PSUICoreTelephonySubscriberCache *)self fetchMobileEquipmentInfo];
  }
  v6 = self;
  objc_sync_enter(v6);
  id v7 = [(PSUICoreTelephonySubscriberCache *)v6 mobileEquipmentInfoDict];
  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID"));
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  objc_sync_exit(v6);
  return v9;
}

- (unint64_t)mobileEquipmentInfoLength
{
  id v3 = [(PSUICoreTelephonySubscriberCache *)self mobileEquipmentInfoDict];

  if (!v3) {
    [(PSUICoreTelephonySubscriberCache *)self fetchMobileEquipmentInfo];
  }
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(PSUICoreTelephonySubscriberCache *)v4 mobileEquipmentInfoDict];
  unint64_t v6 = [v5 count];

  objc_sync_exit(v4);
  return v6;
}

- (void)fetchCountryCodes
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = [(PSUICoreTelephonySubscriberCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "fetchCountryCodes executing", buf, 2u);
  }

  id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [(PSSimStatusCache *)self->_simStatusCache subscriptionContexts];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v21;
    *(void *)&long long v6 = 138412546;
    long long v17 = v6;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        client = self->_client;
        id v19 = 0;
        v11 = -[CoreTelephonyClient getMobileSubscriberHomeCountryList:error:](client, "getMobileSubscriberHomeCountryList:error:", v9, &v19, v17);
        id v12 = v19;
        objc_super v13 = [(PSUICoreTelephonySubscriberCache *)self getLogger];
        v14 = v13;
        if (v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v25 = v9;
            __int16 v26 = 2112;
            id v27 = v12;
            _os_log_error_impl(&dword_221B17000, v14, OS_LOG_TYPE_ERROR, "fetchCountryCodes failed: %@, %@", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            v25 = v9;
            __int16 v26 = 2112;
            id v27 = v11;
            _os_log_impl(&dword_221B17000, v14, OS_LOG_TYPE_DEFAULT, "fetchCountryCodes succeeded: %@, %@", buf, 0x16u);
          }

          v14 = [v11 firstObject];
          v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "slotID"));
          [v18 setObject:v14 forKeyedSubscript:v15];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v5);
  }

  long long v16 = self;
  objc_sync_enter(v16);
  [(PSUICoreTelephonySubscriberCache *)v16 setIsoCountryCodesDict:v18];
  objc_sync_exit(v16);
}

- (id)isoCountryCode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSUICoreTelephonySubscriberCache *)self isoCountryCodesDict];

  if (!v5) {
    [(PSUICoreTelephonySubscriberCache *)self fetchCountryCodes];
  }
  long long v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(PSUICoreTelephonySubscriberCache *)v6 isoCountryCodesDict];
  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID"));
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  objc_sync_exit(v6);
  return v9;
}

- (id)shortLabel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSUICoreTelephonySubscriberCache *)self shortLabelDict];

  if (!v5) {
    [(PSUICoreTelephonySubscriberCache *)self fetchShortLabels];
  }
  long long v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(PSUICoreTelephonySubscriberCache *)v6 shortLabelDict];
  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID"));
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  objc_sync_exit(v6);
  return v9;
}

- (void)fetchShortLabels
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = [(PSUICoreTelephonySubscriberCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "fetchShortLabels executing", buf, 2u);
  }

  id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [(PSSimStatusCache *)self->_simStatusCache subscriptionContexts];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v20;
    *(void *)&long long v6 = 138412546;
    long long v16 = v6;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        client = self->_client;
        id v18 = 0;
        v11 = -[CoreTelephonyClient getShortLabel:error:](client, "getShortLabel:error:", v9, &v18, v16);
        id v12 = v18;
        objc_super v13 = [(PSUICoreTelephonySubscriberCache *)self getLogger];
        v14 = v13;
        if (v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            uint64_t v24 = v9;
            __int16 v25 = 2112;
            id v26 = v12;
            _os_log_error_impl(&dword_221B17000, v14, OS_LOG_TYPE_ERROR, "fetchShortLabels failed: %@, %@", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            uint64_t v24 = v9;
            __int16 v25 = 2112;
            id v26 = v11;
            _os_log_impl(&dword_221B17000, v14, OS_LOG_TYPE_DEFAULT, "fetchShortLabels succeeded: %@, %@", buf, 0x16u);
          }

          v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "slotID"));
          [v17 setObject:v11 forKeyedSubscript:v14];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v5);
  }

  v15 = self;
  objc_sync_enter(v15);
  [(PSUICoreTelephonySubscriberCache *)v15 setShortLabelDict:v17];
  objc_sync_exit(v15);
}

- (void)shortLabelsDidChange
{
  id v3 = [(PSUICoreTelephonySubscriberCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Short labels did change, clearing short label cache", v4, 2u);
  }

  [(PSUICoreTelephonySubscriberCache *)self setShortLabelDict:0];
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  -[PSUICoreTelephonySubscriberCache setMobileEquipmentInfoDict:](self, "setMobileEquipmentInfoDict:", 0, a4);
  [(PSUICoreTelephonySubscriberCache *)self setIsoCountryCodesDict:0];
}

- (void)prlVersionDidChange:(id)a3 version:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [(PSUICoreTelephonySubscriberCache *)self setMobileEquipmentInfoDict:0];
  long long v6 = [(PSUICoreTelephonySubscriberCache *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[PSUICoreTelephonySubscriberCache prlVersionDidChange:version:]";
    __int16 v13 = 2112;
    v14 = @"PSUIPRLVersionChanged";
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "%s posting notification %@", buf, 0x16u);
  }

  uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v9 = @"SubscriptionContext";
  id v10 = v5;
  id v8 = [NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

  [v7 postNotificationName:@"PSUIPRLVersionChanged" object:0 userInfo:v8];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"SubscriberCache"];
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSMutableDictionary)mobileEquipmentInfoDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMobileEquipmentInfoDict:(id)a3
{
}

- (NSMutableDictionary)isoCountryCodesDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIsoCountryCodesDict:(id)a3
{
}

- (NSMutableDictionary)shortLabelDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setShortLabelDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortLabelDict, 0);
  objc_storeStrong((id *)&self->_isoCountryCodesDict, 0);
  objc_storeStrong((id *)&self->_mobileEquipmentInfoDict, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_simStatusCache, 0);
}

@end