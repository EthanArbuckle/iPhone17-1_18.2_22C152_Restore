@interface PSUICoreTelephonyRegistrationCache
+ (PSUICoreTelephonyRegistrationCache)sharedInstance;
- (BOOL)IMSStatusSMS:(id)a3;
- (BOOL)IMSStatusVoice:(id)a3;
- (BOOL)RCSStatus:(id)a3;
- (CoreTelephonyClient)client;
- (NSMutableDictionary)imsStatusSMSDict;
- (NSMutableDictionary)imsStatusVoiceDict;
- (NSMutableDictionary)maxDataRateDict;
- (NSMutableDictionary)operatorNameDict;
- (NSMutableDictionary)rcsStatusDict;
- (NSMutableDictionary)rejectCauseCodeDict;
- (NSMutableDictionary)supportedDataRatesDict;
- (PSUICoreTelephonyRegistrationCache)init;
- (id)getLogger;
- (id)initPrivate;
- (id)localizedOperatorName:(id)a3;
- (id)rejectCauseCode:(id)a3;
- (id)supportedDataRates:(id)a3;
- (int64_t)maxDataRate:(id)a3;
- (void)clearCache;
- (void)dataRatesChanged;
- (void)fetchIMSStatus;
- (void)fetchLocalizedOperatorName;
- (void)fetchMaxDataRate;
- (void)fetchRCSStatus;
- (void)fetchRejectCauseCode;
- (void)fetchSupportedDataRates;
- (void)handleDataUsageChanged;
- (void)imsRegistrationChanged:(id)a3 info:(id)a4;
- (void)operatorNameChanged:(id)a3 name:(id)a4;
- (void)setClient:(id)a3;
- (void)setImsStatusSMSDict:(id)a3;
- (void)setImsStatusVoiceDict:(id)a3;
- (void)setMaxDataRate:(id)a3 dataRate:(int64_t)a4;
- (void)setMaxDataRateDict:(id)a3;
- (void)setOperatorNameDict:(id)a3;
- (void)setRcsStatusDict:(id)a3;
- (void)setRejectCauseCodeDict:(id)a3;
- (void)setSupportedDataRatesDict:(id)a3;
@end

@implementation PSUICoreTelephonyRegistrationCache

+ (PSUICoreTelephonyRegistrationCache)sharedInstance
{
  if (qword_26AC32318 != -1) {
    dispatch_once(&qword_26AC32318, &__block_literal_global_17);
  }
  v2 = (void *)_MergedGlobals_69;
  return (PSUICoreTelephonyRegistrationCache *)v2;
}

uint64_t __52__PSUICoreTelephonyRegistrationCache_sharedInstance__block_invoke()
{
  _MergedGlobals_69 = [[PSUICoreTelephonyRegistrationCache alloc] initPrivate];
  return MEMORY[0x270F9A758]();
}

- (id)initPrivate
{
  v11.receiver = self;
  v11.super_class = (Class)PSUICoreTelephonyRegistrationCache;
  v2 = [(PSUICoreTelephonyRegistrationCache *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F02D30]);
    v4 = [MEMORY[0x263F67F00] createCTClientSerialQueue:@"registration_cache"];
    uint64_t v5 = [v3 initWithQueue:v4];
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v5;

    [(CoreTelephonyClient *)v2->_client setDelegate:v2];
    [(PSUICoreTelephonyRegistrationCache *)v2 setImsStatusVoiceDict:0];
    [(PSUICoreTelephonyRegistrationCache *)v2 setImsStatusSMSDict:0];
    [(PSUICoreTelephonyRegistrationCache *)v2 setRcsStatusDict:0];
    [(PSUICoreTelephonyRegistrationCache *)v2 setRejectCauseCodeDict:0];
    [(PSUICoreTelephonyRegistrationCache *)v2 setSupportedDataRatesDict:0];
    [(PSUICoreTelephonyRegistrationCache *)v2 setMaxDataRateDict:0];
    [(PSUICoreTelephonyRegistrationCache *)v2 setOperatorNameDict:0];
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v2 selector:sel_clearCache name:*MEMORY[0x263F833B8] object:0];

    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v2 selector:sel_clearCache name:*MEMORY[0x263F67F10] object:0];

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v2 selector:sel_handleDataUsageChanged name:*MEMORY[0x263F67F20] object:0];
  }
  return v2;
}

- (PSUICoreTelephonyRegistrationCache)init
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    v4 = "-[PSUICoreTelephonyRegistrationCache init]";
    _os_log_error_impl(&dword_221B17000, v2, OS_LOG_TYPE_ERROR, "Error: unsupported initializer called: %s", (uint8_t *)&v3, 0xCu);
  }

  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer" reason:@"Unsupported initializer called" userInfo:0]);
}

- (void)clearCache
{
  int v3 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Clearing registration cache", v5, 2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  [(PSUICoreTelephonyRegistrationCache *)v4 setImsStatusVoiceDict:0];
  [(PSUICoreTelephonyRegistrationCache *)v4 setImsStatusSMSDict:0];
  [(PSUICoreTelephonyRegistrationCache *)v4 setRcsStatusDict:0];
  [(PSUICoreTelephonyRegistrationCache *)v4 setRejectCauseCodeDict:0];
  [(PSUICoreTelephonyRegistrationCache *)v4 setSupportedDataRatesDict:0];
  [(PSUICoreTelephonyRegistrationCache *)v4 setMaxDataRateDict:0];
  [(PSUICoreTelephonyRegistrationCache *)v4 setOperatorNameDict:0];
  objc_sync_exit(v4);
}

- (void)handleDataUsageChanged
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  [(PSUICoreTelephonyRegistrationCache *)v2 setMaxDataRateDict:0];
  int v3 = [MEMORY[0x263F089F8] notificationWithName:@"PSMaxDataRateChangedNotification" object:0];
  v4 = [(PSUICoreTelephonyRegistrationCache *)v2 getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[PSUICoreTelephonyRegistrationCache handleDataUsageChanged]";
    __int16 v8 = 2112;
    v9 = @"PSMaxDataRateChangedNotification";
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v6, 0x16u);
  }

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 performSelectorOnMainThread:sel_postNotification_ withObject:v3 waitUntilDone:0];

  objc_sync_exit(v2);
}

- (void)fetchIMSStatus
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  int v3 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[PSUICoreTelephonyRegistrationCache fetchIMSStatus]";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s executing fetch", buf, 0xCu);
  }

  v4 = [MEMORY[0x263F67EF0] sharedInstance];
  uint64_t v5 = [v4 subscriptionContexts];

  id v25 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v24 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v29;
    *(void *)&long long v7 = 136315906;
    long long v23 = v7;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(__CFString **)(*((void *)&v28 + 1) + 8 * i);
        client = self->_client;
        id v27 = 0;
        v12 = -[CoreTelephonyClient getIMSRegistrationStatus:error:](client, "getIMSRegistrationStatus:error:", v10, &v27, v23);
        v13 = (__CFString *)v27;
        v14 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v15)
          {
            *(_DWORD *)buf = 136315650;
            v33 = "-[PSUICoreTelephonyRegistrationCache fetchIMSStatus]";
            __int16 v34 = 2112;
            v35 = v13;
            __int16 v36 = 2112;
            v37 = v10;
            _os_log_impl(&dword_221B17000, v14, OS_LOG_TYPE_DEFAULT, "%s fetch failed: %@, %@", buf, 0x20u);
          }
        }
        else
        {
          if (v15)
          {
            if ([v12 isRegisteredForVoice]) {
              v16 = @"YES";
            }
            else {
              v16 = @"NO";
            }
            int v17 = [v12 isRegisteredForSMS];
            *(_DWORD *)buf = v23;
            v18 = @"NO";
            if (v17) {
              v18 = @"YES";
            }
            v33 = "-[PSUICoreTelephonyRegistrationCache fetchIMSStatus]";
            __int16 v34 = 2112;
            v35 = v16;
            __int16 v36 = 2112;
            v37 = v18;
            __int16 v38 = 2112;
            v39 = v10;
            _os_log_impl(&dword_221B17000, v14, OS_LOG_TYPE_DEFAULT, "%s fetch succeeded: %@, %@, %@", buf, 0x2Au);
          }

          v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "isRegisteredForVoice"));
          v20 = objc_msgSend(NSNumber, "numberWithInteger:", -[__CFString slotID](v10, "slotID"));
          [v25 setObject:v19 forKeyedSubscript:v20];

          v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "isRegisteredForSMS"));
          v21 = objc_msgSend(NSNumber, "numberWithInteger:", -[__CFString slotID](v10, "slotID"));
          [v24 setObject:v14 forKeyedSubscript:v21];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v6);
  }

  v22 = self;
  objc_sync_enter(v22);
  [(PSUICoreTelephonyRegistrationCache *)v22 setImsStatusVoiceDict:v25];
  [(PSUICoreTelephonyRegistrationCache *)v22 setImsStatusSMSDict:v24];
  objc_sync_exit(v22);
}

- (BOOL)IMSStatusVoice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSUICoreTelephonyRegistrationCache *)self imsStatusVoiceDict];

  if (!v5) {
    [(PSUICoreTelephonyRegistrationCache *)self fetchIMSStatus];
  }
  uint64_t v6 = self;
  objc_sync_enter(v6);
  long long v7 = [(PSUICoreTelephonyRegistrationCache *)v6 imsStatusVoiceDict];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID"));
  v9 = [v7 objectForKeyedSubscript:v8];

  if (v9) {
    char v10 = [v9 BOOLValue];
  }
  else {
    char v10 = 0;
  }

  objc_sync_exit(v6);
  return v10;
}

- (BOOL)IMSStatusSMS:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSUICoreTelephonyRegistrationCache *)self imsStatusSMSDict];

  if (!v5) {
    [(PSUICoreTelephonyRegistrationCache *)self fetchIMSStatus];
  }
  uint64_t v6 = self;
  objc_sync_enter(v6);
  long long v7 = [(PSUICoreTelephonyRegistrationCache *)v6 imsStatusSMSDict];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID"));
  v9 = [v7 objectForKeyedSubscript:v8];

  if (v9) {
    char v10 = [v9 BOOLValue];
  }
  else {
    char v10 = 0;
  }

  objc_sync_exit(v6);
  return v10;
}

- (void)fetchRCSStatus
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  int v3 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Fetching RCS status", buf, 2u);
  }

  id v4 = [MEMORY[0x263F67EF0] sharedInstance];
  uint64_t v5 = [v4 subscriptionContexts];

  id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v25;
    *(void *)&long long v8 = 138412546;
    long long v21 = v8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        client = self->_client;
        id v23 = 0;
        v13 = -[CoreTelephonyClient getSystemConfiguration:withError:](client, "getSystemConfiguration:withError:", v11, &v23, v21);
        id v14 = v23;
        if (v14)
        {
          BOOL v15 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v21;
            id v29 = v14;
            __int16 v30 = 2112;
            uint64_t v31 = (uint64_t)v11;
            _os_log_error_impl(&dword_221B17000, v15, OS_LOG_TYPE_ERROR, "RCS status fetch failed: %@, %@", buf, 0x16u);
          }
        }
        else
        {
          v16 = [v13 operationStatus];
          uint64_t v17 = [v16 registrationState];

          v18 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            id v29 = v11;
            __int16 v30 = 2048;
            uint64_t v31 = v17;
            _os_log_impl(&dword_221B17000, v18, OS_LOG_TYPE_DEFAULT, "RCS status fetch succeeded, context: %@, registration state: %ld", buf, 0x16u);
          }

          if (v17 == 1) {
            [NSNumber numberWithBool:1];
          }
          else {
          BOOL v15 = [NSNumber numberWithBool:0];
          }
          v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "slotID"));
          [v22 setObject:v15 forKeyedSubscript:v19];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v7);
  }

  v20 = self;
  objc_sync_enter(v20);
  [(PSUICoreTelephonyRegistrationCache *)v20 setRcsStatusDict:v22];
  objc_sync_exit(v20);
}

- (BOOL)RCSStatus:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSUICoreTelephonyRegistrationCache *)self rcsStatusDict];

  if (!v5) {
    [(PSUICoreTelephonyRegistrationCache *)self fetchRCSStatus];
  }
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(PSUICoreTelephonyRegistrationCache *)v6 rcsStatusDict];
  long long v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID"));
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (v9) {
    char v10 = [v9 BOOLValue];
  }
  else {
    char v10 = 0;
  }

  objc_sync_exit(v6);
  return v10;
}

- (void)imsRegistrationChanged:(id)a3 info:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    objc_super v11 = "-[PSUICoreTelephonyRegistrationCache imsRegistrationChanged:info:]";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "%s updating: %@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v9 = self;
  objc_sync_enter(v9);
  [(PSUICoreTelephonyRegistrationCache *)v9 setImsStatusVoiceDict:0];
  [(PSUICoreTelephonyRegistrationCache *)v9 setImsStatusSMSDict:0];
  objc_sync_exit(v9);
}

- (void)fetchRejectCauseCode
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int v3 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v26 = "-[PSUICoreTelephonyRegistrationCache fetchRejectCauseCode]";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s executing fetch", buf, 0xCu);
  }

  id v4 = [MEMORY[0x263F67EF0] sharedInstance];
  uint64_t v5 = [v4 subscriptionContexts];

  id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v22;
    *(void *)&long long v7 = 136315650;
    long long v17 = v7;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        client = self->_client;
        id v20 = 0;
        __int16 v12 = -[CoreTelephonyClient getRejectCauseCode:error:](client, "getRejectCauseCode:error:", v10, &v20, v17);
        id v13 = v20;
        uint64_t v14 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v15)
          {
            *(_DWORD *)buf = 136315394;
            long long v26 = "-[PSUICoreTelephonyRegistrationCache fetchRejectCauseCode]";
            __int16 v27 = 2112;
            id v28 = v13;
            _os_log_impl(&dword_221B17000, v14, OS_LOG_TYPE_DEFAULT, "%s fetch failed: %@", buf, 0x16u);
          }
        }
        else
        {
          if (v15)
          {
            *(_DWORD *)buf = v17;
            long long v26 = "-[PSUICoreTelephonyRegistrationCache fetchRejectCauseCode]";
            __int16 v27 = 2112;
            id v28 = v12;
            __int16 v29 = 2112;
            __int16 v30 = v10;
            _os_log_impl(&dword_221B17000, v14, OS_LOG_TYPE_DEFAULT, "%s fetch succeeded: %@, %@", buf, 0x20u);
          }

          uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "slotID"));
          [v18 setObject:v12 forKeyedSubscript:v14];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v6);
  }

  v16 = self;
  objc_sync_enter(v16);
  [(PSUICoreTelephonyRegistrationCache *)v16 setRejectCauseCodeDict:v18];
  objc_sync_exit(v16);
}

- (id)rejectCauseCode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSUICoreTelephonyRegistrationCache *)self rejectCauseCodeDict];

  if (!v5) {
    [(PSUICoreTelephonyRegistrationCache *)self fetchRejectCauseCode];
  }
  uint64_t v6 = self;
  objc_sync_enter(v6);
  long long v7 = [(PSUICoreTelephonyRegistrationCache *)v6 rejectCauseCodeDict];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID"));
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  objc_sync_exit(v6);
  return v9;
}

- (void)fetchSupportedDataRates
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  int v3 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v29 = "-[PSUICoreTelephonyRegistrationCache fetchSupportedDataRates]";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s executing fetch", buf, 0xCu);
  }

  id v4 = [MEMORY[0x263F67EF0] sharedInstance];
  uint64_t v5 = [v4 subscriptionContexts];

  id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v25;
    *(void *)&long long v7 = 136315650;
    long long v20 = v7;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        client = self->_client;
        id v23 = 0;
        __int16 v12 = -[CoreTelephonyClient getSupportedDataRates:error:](client, "getSupportedDataRates:error:", v10, &v23, v20);
        id v13 = v23;
        uint64_t v14 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v15)
          {
            *(_DWORD *)buf = 136315394;
            __int16 v29 = "-[PSUICoreTelephonyRegistrationCache fetchSupportedDataRates]";
            __int16 v30 = 2112;
            id v31 = v13;
            _os_log_impl(&dword_221B17000, v14, OS_LOG_TYPE_DEFAULT, "%s fetch failed: %@", buf, 0x16u);
          }
        }
        else
        {
          if (v15)
          {
            v16 = [v12 rates];
            *(_DWORD *)buf = v20;
            __int16 v29 = "-[PSUICoreTelephonyRegistrationCache fetchSupportedDataRates]";
            __int16 v30 = 2112;
            id v31 = v16;
            __int16 v32 = 2112;
            uint64_t v33 = v10;
            _os_log_impl(&dword_221B17000, v14, OS_LOG_TYPE_DEFAULT, "%s fetch succeeded: %@, %@", buf, 0x20u);
          }
          uint64_t v14 = [v12 rates];
          id v17 = [v14 copy];
          id v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "slotID"));
          [v21 setObject:v17 forKeyedSubscript:v18];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v6);
  }

  v19 = self;
  objc_sync_enter(v19);
  [(PSUICoreTelephonyRegistrationCache *)v19 setSupportedDataRatesDict:v21];
  objc_sync_exit(v19);
}

- (id)supportedDataRates:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSUICoreTelephonyRegistrationCache *)self supportedDataRatesDict];

  if (!v5) {
    [(PSUICoreTelephonyRegistrationCache *)self fetchSupportedDataRates];
  }
  uint64_t v6 = self;
  objc_sync_enter(v6);
  long long v7 = [(PSUICoreTelephonyRegistrationCache *)v6 supportedDataRatesDict];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID"));
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  objc_sync_exit(v6);
  return v9;
}

- (void)fetchMaxDataRate
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  int v3 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v28 = "-[PSUICoreTelephonyRegistrationCache fetchMaxDataRate]";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s executing fetch", buf, 0xCu);
  }

  id v4 = [MEMORY[0x263F67EF0] sharedInstance];
  uint64_t v5 = [v4 subscriptionContexts];

  id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v24;
    *(void *)&long long v8 = 136315650;
    long long v20 = v8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        client = self->_client;
        id v22 = 0;
        uint64_t v13 = -[CoreTelephonyClient getMaxDataRate:error:](client, "getMaxDataRate:error:", v11, &v22, v20);
        id v14 = v22;
        BOOL v15 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          if (v16)
          {
            *(_DWORD *)buf = 136315394;
            id v28 = "-[PSUICoreTelephonyRegistrationCache fetchMaxDataRate]";
            __int16 v29 = 2112;
            uint64_t v30 = (uint64_t)v14;
            _os_log_impl(&dword_221B17000, v15, OS_LOG_TYPE_DEFAULT, "%s fetch failed: %@", buf, 0x16u);
          }
        }
        else
        {
          if (v16)
          {
            uint64_t v17 = CTDataRateAsString();
            *(_DWORD *)buf = v20;
            id v28 = "-[PSUICoreTelephonyRegistrationCache fetchMaxDataRate]";
            __int16 v29 = 2080;
            uint64_t v30 = v17;
            __int16 v31 = 2112;
            __int16 v32 = v11;
            _os_log_impl(&dword_221B17000, v15, OS_LOG_TYPE_DEFAULT, "%s fetch succeeded: %s, %@", buf, 0x20u);
          }

          BOOL v15 = [NSNumber numberWithInteger:v13];
          id v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "slotID"));
          [v21 setObject:v15 forKeyedSubscript:v18];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v7);
  }

  v19 = self;
  objc_sync_enter(v19);
  [(PSUICoreTelephonyRegistrationCache *)v19 setMaxDataRateDict:v21];
  objc_sync_exit(v19);
}

- (int64_t)maxDataRate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSUICoreTelephonyRegistrationCache *)self maxDataRateDict];

  if (!v5) {
    [(PSUICoreTelephonyRegistrationCache *)self fetchMaxDataRate];
  }
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(PSUICoreTelephonyRegistrationCache *)v6 maxDataRateDict];
  long long v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID"));
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  objc_sync_exit(v6);
  int64_t v10 = [v9 integerValue];

  return v10;
}

- (void)setMaxDataRate:(id)a3 dataRate:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v17 = "-[PSUICoreTelephonyRegistrationCache setMaxDataRate:dataRate:]";
    __int16 v18 = 2048;
    int64_t v19 = a4;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "%s setting: %li, %@", buf, 0x20u);
  }

  id location = 0;
  objc_initWeak(&location, self);
  long long v8 = [(CoreTelephonyClient *)self->_client setMaxDataRate:v6 rate:a4];
  if (v8)
  {
    uint64_t v9 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "-[PSUICoreTelephonyRegistrationCache setMaxDataRate:dataRate:]";
      __int16 v18 = 2112;
      int64_t v19 = (int64_t)v8;
      _os_log_error_impl(&dword_221B17000, v9, OS_LOG_TYPE_ERROR, "%s set failed: %@", buf, 0x16u);
    }
  }
  else
  {
    int64_t v10 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v17 = "-[PSUICoreTelephonyRegistrationCache setMaxDataRate:dataRate:]";
      __int16 v18 = 2048;
      int64_t v19 = a4;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "%s set succeeded: %li, %@", buf, 0x20u);
    }

    uint64_t v9 = objc_loadWeakRetained(&location);
    objc_sync_enter(v9);
    objc_super v11 = [NSNumber numberWithInteger:a4];
    id v12 = objc_loadWeakRetained(&location);
    uint64_t v13 = [v12 maxDataRateDict];
    id v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "slotID"));
    [v13 setObject:v11 forKeyedSubscript:v14];

    objc_sync_exit(v9);
  }

  objc_destroyWeak(&location);
}

- (void)dataRatesChanged
{
  int v3 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Data Rates Changed. Clearing maxDataRate & supportedDataRates cache.", v6, 2u);
  }

  id v4 = self;
  objc_sync_enter(v4);
  [(PSUICoreTelephonyRegistrationCache *)v4 setMaxDataRateDict:0];
  [(PSUICoreTelephonyRegistrationCache *)v4 setSupportedDataRatesDict:0];
  objc_sync_exit(v4);

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"PSMaxDataRateChangedNotification" object:0];
}

- (void)fetchLocalizedOperatorName
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int v3 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v26 = "-[PSUICoreTelephonyRegistrationCache fetchLocalizedOperatorName]";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s executing fetch", buf, 0xCu);
  }

  id v4 = [MEMORY[0x263F67EF0] sharedInstance];
  uint64_t v5 = [v4 subscriptionContexts];

  id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v22;
    *(void *)&long long v8 = 136315650;
    long long v18 = v8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        client = self->_client;
        id v20 = 0;
        uint64_t v13 = -[CoreTelephonyClient getLocalizedOperatorName:error:](client, "getLocalizedOperatorName:error:", v11, &v20, v18);
        id v14 = v20;
        BOOL v15 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          if (v16)
          {
            *(_DWORD *)buf = 136315394;
            long long v26 = "-[PSUICoreTelephonyRegistrationCache fetchLocalizedOperatorName]";
            __int16 v27 = 2112;
            id v28 = v14;
            _os_log_impl(&dword_221B17000, v15, OS_LOG_TYPE_DEFAULT, "%s fetch failed: %@", buf, 0x16u);
          }
        }
        else
        {
          if (v16)
          {
            *(_DWORD *)buf = v18;
            long long v26 = "-[PSUICoreTelephonyRegistrationCache fetchLocalizedOperatorName]";
            __int16 v27 = 2114;
            id v28 = v13;
            __int16 v29 = 2112;
            uint64_t v30 = v11;
            _os_log_impl(&dword_221B17000, v15, OS_LOG_TYPE_DEFAULT, "%s fetch succeeded: %{public}@, %@", buf, 0x20u);
          }

          BOOL v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "slotID"));
          [v19 setObject:v13 forKeyedSubscript:v15];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v7);
  }

  uint64_t v17 = self;
  objc_sync_enter(v17);
  [(PSUICoreTelephonyRegistrationCache *)v17 setOperatorNameDict:v19];
  objc_sync_exit(v17);
}

- (id)localizedOperatorName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSUICoreTelephonyRegistrationCache *)self operatorNameDict];

  if (!v5) {
    [(PSUICoreTelephonyRegistrationCache *)self fetchLocalizedOperatorName];
  }
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(PSUICoreTelephonyRegistrationCache *)v6 operatorNameDict];
  long long v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID"));
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  objc_sync_exit(v6);
  return v9;
}

- (void)operatorNameChanged:(id)a3 name:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    long long v18 = "-[PSUICoreTelephonyRegistrationCache operatorNameChanged:name:]";
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", buf, 0x20u);
  }

  client = self->_client;
  id v16 = 0;
  int64_t v10 = [(CoreTelephonyClient *)client getLocalizedOperatorName:v6 error:&v16];
  id v11 = v16;

  id v12 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    long long v18 = "-[PSUICoreTelephonyRegistrationCache operatorNameChanged:name:]";
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_221B17000, v12, OS_LOG_TYPE_DEFAULT, "%s localized name: %@, %@", buf, 0x20u);
  }

  if (!v10 || v11)
  {
    uint64_t v13 = [(PSUICoreTelephonyRegistrationCache *)self getLogger];
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      long long v18 = "-[PSUICoreTelephonyRegistrationCache operatorNameChanged:name:]";
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v10;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_error_impl(&dword_221B17000, &v13->super, OS_LOG_TYPE_ERROR, "%s failed to localize operator name: %@, %@, %@", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v13 = self;
    objc_sync_enter(v13);
    id v14 = [(PSUICoreTelephonyRegistrationCache *)v13 operatorNameDict];
    BOOL v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "slotID"));
    [v14 setObject:v10 forKeyedSubscript:v15];

    objc_sync_exit(v13);
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"RegistrationCache"];
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSMutableDictionary)imsStatusVoiceDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setImsStatusVoiceDict:(id)a3
{
}

- (NSMutableDictionary)imsStatusSMSDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setImsStatusSMSDict:(id)a3
{
}

- (NSMutableDictionary)rcsStatusDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRcsStatusDict:(id)a3
{
}

- (NSMutableDictionary)rejectCauseCodeDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRejectCauseCodeDict:(id)a3
{
}

- (NSMutableDictionary)supportedDataRatesDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSupportedDataRatesDict:(id)a3
{
}

- (NSMutableDictionary)maxDataRateDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMaxDataRateDict:(id)a3
{
}

- (NSMutableDictionary)operatorNameDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setOperatorNameDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operatorNameDict, 0);
  objc_storeStrong((id *)&self->_maxDataRateDict, 0);
  objc_storeStrong((id *)&self->_supportedDataRatesDict, 0);
  objc_storeStrong((id *)&self->_rejectCauseCodeDict, 0);
  objc_storeStrong((id *)&self->_rcsStatusDict, 0);
  objc_storeStrong((id *)&self->_imsStatusSMSDict, 0);
  objc_storeStrong((id *)&self->_imsStatusVoiceDict, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end