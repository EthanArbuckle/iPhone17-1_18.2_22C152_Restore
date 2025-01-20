@interface PSUICarrierServicesSpecifierCache
+ (id)sharedInstance;
- (CoreTelephonyClient)client;
- (NSMutableDictionary)mmsInfoSpecifiersDict;
- (NSMutableDictionary)specifiersDict;
- (PSUICarrierServicesSpecifierCache)init;
- (id)getLogger;
- (id)initPrivate;
- (id)mmsInfoSpecifierWithTarget:(id)a3 context:(id)a4;
- (id)newMMSInfoSpecifierWithTarget:(id)a3 context:(id)a4;
- (id)readPreference:(id)a3;
- (id)specifiers:(id)a3;
- (void)carrierBundleChange:(id)a3;
- (void)clearCache;
- (void)dealloc;
- (void)dialCarrierServiceNumber:(id)a3;
- (void)fetchSpecifiers;
- (void)openURLWithSpecifier:(id)a3;
- (void)setClient:(id)a3;
- (void)setMmsInfoSpecifiersDict:(id)a3;
- (void)setSpecifiersDict:(id)a3;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
@end

@implementation PSUICarrierServicesSpecifierCache

+ (id)sharedInstance
{
  if (qword_26AC32218 != -1) {
    dispatch_once(&qword_26AC32218, &__block_literal_global_1);
  }
  v2 = (void *)_MergedGlobals_55;
  return v2;
}

uint64_t __51__PSUICarrierServicesSpecifierCache_sharedInstance__block_invoke()
{
  _MergedGlobals_55 = [[PSUICarrierServicesSpecifierCache alloc] initPrivate];
  return MEMORY[0x270F9A758]();
}

- (id)initPrivate
{
  v11.receiver = self;
  v11.super_class = (Class)PSUICarrierServicesSpecifierCache;
  v2 = [(PSUICarrierServicesSpecifierCache *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F02D30]);
    v4 = [MEMORY[0x263F67F00] createCTClientSerialQueue:@"carrier_services_cache"];
    uint64_t v5 = [v3 initWithQueue:v4];
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v5;

    [(CoreTelephonyClient *)v2->_client setDelegate:v2];
    [(PSUICarrierServicesSpecifierCache *)v2 clearCache];
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v2 selector:sel_clearCache name:*MEMORY[0x263F833B8] object:0];

    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v2 selector:sel_clearCache name:0x26D414D60 object:0];

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v2 selector:sel_clearCache name:@"PSNewCarrierNotification" object:0];
  }
  return v2;
}

- (PSUICarrierServicesSpecifierCache)init
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = [(PSUICarrierServicesSpecifierCache *)self getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    v4 = "-[PSUICarrierServicesSpecifierCache init]";
    _os_log_error_impl(&dword_221B17000, v2, OS_LOG_TYPE_ERROR, "Error: unsupported initializer called: %s", (uint8_t *)&v3, 0xCu);
  }

  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer" reason:@"Unsupported initializer called" userInfo:0]);
}

- (void)dealloc
{
  int v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
  v4.receiver = self;
  v4.super_class = (Class)PSUICarrierServicesSpecifierCache;
  [(PSUICarrierServicesSpecifierCache *)&v4 dealloc];
}

- (void)clearCache
{
  int v3 = [(PSUICarrierServicesSpecifierCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Clearing carrier services cache", v6, 2u);
  }

  specifiersDict = self->_specifiersDict;
  self->_specifiersDict = 0;

  mmsInfoSpecifiersDict = self->_mmsInfoSpecifiersDict;
  self->_mmsInfoSpecifiersDict = 0;
}

- (id)mmsInfoSpecifierWithTarget:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  mmsInfoSpecifiersDict = self->_mmsInfoSpecifiersDict;
  if (!mmsInfoSpecifiersDict)
  {
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v15 = self->_mmsInfoSpecifiersDict;
    self->_mmsInfoSpecifiersDict = v14;

    objc_super v11 = 0;
LABEL_6:
    id v13 = [(PSUICarrierServicesSpecifierCache *)self newMMSInfoSpecifierWithTarget:v6 context:v8];

    v16 = self->_mmsInfoSpecifiersDict;
    v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "slotID"));
    [(NSMutableDictionary *)v16 setObject:v13 forKeyedSubscript:v17];

    goto LABEL_7;
  }
  v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "slotID"));
  objc_super v11 = [(NSMutableDictionary *)mmsInfoSpecifiersDict objectForKeyedSubscript:v10];

  if (!v11) {
    goto LABEL_6;
  }
  id v12 = [v11 target];

  id v13 = v11;
  if (v12 != v6) {
    goto LABEL_6;
  }
LABEL_7:

  return v13;
}

- (id)newMMSInfoSpecifierWithTarget:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
  v8 = [v7 mmsInfoUrl:v6];

  if ([v8 length])
  {
    v9 = (char *)objc_alloc_init(MEMORY[0x263F5FC40]);
    [v9 setButtonAction:sel_openURLWithSpecifier_];
    *(void *)&v9[*MEMORY[0x263F5FE10]] = 13;
    objc_storeWeak((id *)&v9[*MEMORY[0x263F5FE40]], v5);
    [v9 setIdentifier:@"MMS_INFO"];
    v10 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
    objc_super v11 = [v10 mmsInfoTitle:v6];
    [v9 setName:v11];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)fetchSpecifiers
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  v2 = [(PSUICarrierServicesSpecifierCache *)self getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v57 = "-[PSUICarrierServicesSpecifierCache fetchSpecifiers]";
    _os_log_impl(&dword_221B17000, v2, OS_LOG_TYPE_DEFAULT, "%s executing fetch", buf, 0xCu);
  }

  int v3 = [MEMORY[0x263F67EF0] sharedInstance];
  objc_super v4 = [v3 subscriptionContexts];

  v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v4;
  uint64_t v40 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (v40)
  {
    uint64_t v38 = *(void *)v53;
    uint64_t v43 = *MEMORY[0x263F60290];
    uint64_t v44 = *MEMORY[0x263F60308];
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v53 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = v5;
        id v6 = *(void **)(*((void *)&v52 + 1) + 8 * v5);
        id v7 = objc_alloc(MEMORY[0x263EFF980]);
        v8 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
        v9 = objc_msgSend(v7, "initWithObjects:", v8, 0);

        v10 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
        objc_super v11 = [v10 carrierServices:v6];

        id v12 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
        int v46 = [v12 showServiceCodes:v6];

        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v42 = v11;
        uint64_t v13 = [v42 countByEnumeratingWithState:&v48 objects:v62 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v45 = *(void *)v49;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v49 != v45) {
                objc_enumerationMutation(v42);
              }
              v16 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              v17 = (char *)objc_alloc_init(MEMORY[0x263F5FC40]);
              [v17 setButtonAction:sel_dialCarrierServiceNumber_];
              *(void *)&v17[*MEMORY[0x263F5FE10]] = 4;
              v18 = sel_readPreference_;
              if (!v46) {
                v18 = 0;
              }
              *(void *)&v17[*MEMORY[0x263F5FE28]] = v18;
              objc_storeWeak((id *)&v17[*MEMORY[0x263F5FE40]], self);
              v19 = [v16 objectForKey:@"ServiceName"];
              if (v19)
              {
                v20 = v9;
                v21 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
                v22 = v6;
                v23 = [v21 carrierServiceNameForServiceName:v19 context:v6];

                if ([v23 length])
                {
                  id v24 = v23;

                  v19 = v24;
                }
                v9 = v20;

                id v6 = v22;
              }
              [v17 setName:v19];
              v25 = [v16 objectForKey:@"ServiceCode"];
              [v17 setProperty:v25 forKey:v44];

              [v17 setProperty:v6 forKey:v43];
              [v9 addObject:v17];
            }
            uint64_t v14 = [v42 countByEnumeratingWithState:&v48 objects:v62 count:16];
          }
          while (v14);
        }

        if ([v42 count])
        {
          v26 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
          [v9 addObject:v26];
        }
        v27 = [PSUIMyAccountSpecifier alloc];
        v28 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
        v29 = [(PSUIMyAccountSpecifier *)v27 initWithContext:v6 cbCache:v28];

        if (v29) {
          [v9 addObject:v29];
        }
        v30 = [(PSUICarrierServicesSpecifierCache *)self mmsInfoSpecifierWithTarget:self context:v6];
        if (v30)
        {
          if (v29)
          {
            v31 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
            [v9 addObject:v31];
          }
          [v9 addObject:v30];
        }
        v32 = [(PSUICarrierServicesSpecifierCache *)self getLogger];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = [v9 count];
          *(_DWORD *)buf = 136315650;
          v57 = "-[PSUICarrierServicesSpecifierCache fetchSpecifiers]";
          __int16 v58 = 2112;
          v59 = v6;
          __int16 v60 = 2048;
          uint64_t v61 = v33;
          _os_log_impl(&dword_221B17000, v32, OS_LOG_TYPE_DEFAULT, "%s fetch succeeded: %@, %lu", buf, 0x20u);
        }

        v34 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "slotID"));
        [(NSMutableDictionary *)v39 setObject:v9 forKeyedSubscript:v34];

        uint64_t v5 = v41 + 1;
      }
      while (v41 + 1 != v40);
      uint64_t v40 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
    }
    while (v40);
  }

  v35 = self;
  objc_sync_enter(v35);
  specifiersDict = v35->_specifiersDict;
  v35->_specifiersDict = v39;

  objc_sync_exit(v35);
}

- (id)specifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSUICarrierServicesSpecifierCache *)self specifiersDict];

  if (!v5) {
    [(PSUICarrierServicesSpecifierCache *)self fetchSpecifiers];
  }
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = [(PSUICarrierServicesSpecifierCache *)v6 specifiersDict];
  v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID"));
  v9 = [v7 objectForKeyedSubscript:v8];

  objc_sync_exit(v6);
  return v9;
}

- (id)readPreference:(id)a3
{
  return (id)[a3 propertyForKey:*MEMORY[0x263F60308]];
}

- (void)dialCarrierServiceNumber:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F60290];
  id v5 = a3;
  id v6 = [v5 propertyForKey:v4];
  id v7 = [v5 propertyForKey:*MEMORY[0x263F60308]];

  v8 = [(PSUICarrierServicesSpecifierCache *)self getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v7;
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "Dialing carrier service number %@", buf, 0xCu);
  }

  id v9 = objc_alloc_init(MEMORY[0x263F7E1B0]);
  id v10 = objc_alloc(MEMORY[0x263F7E230]);
  objc_super v11 = [v9 telephonyProvider];
  id v12 = (void *)[v10 initWithProvider:v11];

  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F7E248]) initWithType:2 value:v7];
  [v12 setHandle:v13];

  uint64_t v14 = [v6 uuid];
  [v12 setLocalSenderIdentityUUID:v14];

  [v12 setPerformDialAssist:0];
  [v12 setPerformLocalDialAssist:0];
  [v12 setPreferDefaultApp:0];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__PSUICarrierServicesSpecifierCache_dialCarrierServiceNumber___block_invoke;
  v16[3] = &unk_2645E0D20;
  v16[4] = self;
  id v17 = v12;
  id v15 = v12;
  [v9 launchAppForDialRequest:v15 completion:v16];
}

void __62__PSUICarrierServicesSpecifierCache_dialCarrierServiceNumber___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl(&dword_221B17000, v4, OS_LOG_TYPE_ERROR, "Error launching app for service number dial request %@: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)openURLWithSpecifier:(id)a3
{
  id v3 = NSURL;
  uint64_t v4 = [a3 propertyForKey:@"url"];
  id v7 = [v3 URLWithString:v4];

  uint64_t v5 = (void *)*MEMORY[0x263F83300];
  int v6 = objc_opt_new();
  [v5 openURL:v7 options:v6 completionHandler:0];
}

- (void)carrierBundleChange:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [(PSUICarrierServicesSpecifierCache *)v4 clearCache];
  objc_sync_exit(v4);
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  [(PSUICarrierServicesSpecifierCache *)v7 clearCache];
  objc_sync_exit(v7);
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CarrierServicesSpecifierCache"];
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSMutableDictionary)specifiersDict
{
  return self->_specifiersDict;
}

- (void)setSpecifiersDict:(id)a3
{
}

- (NSMutableDictionary)mmsInfoSpecifiersDict
{
  return self->_mmsInfoSpecifiersDict;
}

- (void)setMmsInfoSpecifiersDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mmsInfoSpecifiersDict, 0);
  objc_storeStrong((id *)&self->_specifiersDict, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end