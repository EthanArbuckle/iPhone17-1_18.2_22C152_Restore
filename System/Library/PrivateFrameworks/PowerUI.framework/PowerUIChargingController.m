@interface PowerUIChargingController
+ (id)sharedInstance;
- (BOOL)setChargeLimitTo:(int64_t)a3 forLimitType:(unint64_t)a4;
- (NSLock)chargeLimitLock;
- (NSMutableDictionary)tokenDict;
- (OS_os_log)log;
- (PowerUIChargingController)init;
- (__CFString)loadChargeLimitTokenForPreferenceKey:(id)a3 forReason:(id)a4;
- (__CFString)registerNewTokenForPreferenceKey:(id)a3 forReason:(id)a4;
- (id)readNumberForPreferenceKey:(id)a3;
- (void)clearAllChargeLimits;
- (void)clearChargeLimitForLimitType:(unint64_t)a3;
- (void)setChargeLimitLock:(id)a3;
- (void)setLog:(id)a3;
- (void)setNumber:(id)a3 forPreferenceKey:(id)a4;
- (void)setTokenDict:(id)a3;
@end

@implementation PowerUIChargingController

- (void)setNumber:(id)a3 forPreferenceKey:(id)a4
{
}

- (id)readNumberForPreferenceKey:(id)a3
{
  v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.smartcharging.topoffprotection");
  return v3;
}

- (PowerUIChargingController)init
{
  v10.receiver = self;
  v10.super_class = (Class)PowerUIChargingController;
  v2 = [(PowerUIChargingController *)&v10 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.powerui.smartcharging", "chargingcontroller");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    tokenDict = v2->_tokenDict;
    v2->_tokenDict = (NSMutableDictionary *)v5;

    v7 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    chargeLimitLock = v2->_chargeLimitLock;
    v2->_chargeLimitLock = v7;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_once_0 != -1) {
    dispatch_once(&sharedInstance_once_0, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance_instance_0;
  return v2;
}

void __43__PowerUIChargingController_sharedInstance__block_invoke()
{
  if (!sharedInstance_instance_0)
  {
    sharedInstance_instance_0 = objc_alloc_init(PowerUIChargingController);
    MEMORY[0x270F9A758]();
  }
}

- (__CFString)loadChargeLimitTokenForPreferenceKey:(id)a3 forReason:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v6 = (__CFString *)a3;
  id v7 = a4;
  v8 = [(NSMutableDictionary *)self->_tokenDict objectForKeyedSubscript:v7];

  if (v8)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v8;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Charge limit token already exists: %@", buf, 0xCu);
    }
  }
  else
  {
    v8 = +[PowerUISmartChargeUtilities readStringForPreferenceKey:v6 inDomain:@"com.apple.smartcharging.topoffprotection"];
    if (v8)
    {
      v21 = v6;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v10 = (id)IOPSCopyBatteryLevelLimits();
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = [*(id *)(*((void *)&v22 + 1) + 8 * i) objectForKeyedSubscript:@"chargeSocLimitReason"];
            char v16 = [v15 isEqualToString:v7];

            if (v16)
            {

              [(NSMutableDictionary *)self->_tokenDict setObject:v8 forKeyedSubscript:v7];
              v18 = self->_log;
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v28 = v8;
                _os_log_impl(&dword_22135E000, v18, OS_LOG_TYPE_DEFAULT, "Loaded charge limit token from defaults: %@", buf, 0xCu);
              }

              v6 = v21;
              goto LABEL_22;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      v17 = self->_log;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v8;
        _os_log_impl(&dword_22135E000, v17, OS_LOG_TYPE_DEFAULT, "Token %@ does not seem to exist anymore", buf, 0xCu);
      }

      v6 = v21;
    }
    else
    {
      v19 = self->_log;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v6;
        _os_log_impl(&dword_22135E000, v19, OS_LOG_TYPE_DEFAULT, "Did not get string value for key %@", buf, 0xCu);
      }
    }

    v8 = 0;
  }
LABEL_22:

  return v8;
}

- (__CFString)registerNewTokenForPreferenceKey:(id)a3 forReason:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = IOPSLimitBatteryLevelRegister();
  if (v8)
  {
    int v9 = v8;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[PowerUIChargingController registerNewTokenForPreferenceKey:forReason:](v9, log);
    }
    uint64_t v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PowerUIChargingController registerNewTokenForPreferenceKey:forReason:](v11, v9);
    }
  }
  else
  {
    [(NSMutableDictionary *)self->_tokenDict setObject:0 forKeyedSubscript:v7];

    +[PowerUISmartChargeUtilities setString:0 forPreferenceKey:v6 inDomain:@"com.apple.smartcharging.topoffprotection"];
    uint64_t v12 = self->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = 0;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_22135E000, v12, OS_LOG_TYPE_DEFAULT, "Created new charge limit token: %@ for reason: %@", buf, 0x16u);
    }
  }

  return 0;
}

- (void)clearChargeLimitForLimitType:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [(NSLock *)self->_chargeLimitLock lock];
  unint64_t v5 = a3 - 1;
  if (a3 - 1 >= 5)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[PowerUIChargingController clearChargeLimitForLimitType:]();
    }
  }
  else
  {
    id v6 = off_2645A61E0[v5];
    id v7 = off_2645A6208[v5];
    [(PowerUIChargingController *)self loadChargeLimitTokenForPreferenceKey:v7 forReason:v6];
    int v8 = [(NSMutableDictionary *)self->_tokenDict objectForKeyedSubscript:v6];

    log = self->_log;
    BOOL v10 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        tokenDict = self->_tokenDict;
        uint64_t v12 = log;
        uint64_t v13 = [(NSMutableDictionary *)tokenDict objectForKeyedSubscript:v6];
        int v14 = 138412290;
        uint64_t v15 = v13;
        _os_log_impl(&dword_22135E000, v12, OS_LOG_TYPE_DEFAULT, "Clearing current charge limit token for (%@)", (uint8_t *)&v14, 0xCu);
      }
      [(NSMutableDictionary *)self->_tokenDict objectForKeyedSubscript:v6];
      objc_claimAutoreleasedReturnValue();
      IOPSLimitBatteryLevelCancel();
      [(NSMutableDictionary *)self->_tokenDict setObject:0 forKeyedSubscript:v6];
    }
    else if (v10)
    {
      int v14 = 138412546;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "No token to clear for preferencekey %@, reason %@", (uint8_t *)&v14, 0x16u);
    }
    +[PowerUISmartChargeUtilities setString:0 forPreferenceKey:v7 inDomain:@"com.apple.smartcharging.topoffprotection"];
  }
  [(NSLock *)self->_chargeLimitLock unlock];
}

- (void)clearAllChargeLimits
{
  [(PowerUIChargingController *)self clearChargeLimitForLimitType:1];
  [(PowerUIChargingController *)self clearChargeLimitForLimitType:2];
  [(PowerUIChargingController *)self clearChargeLimitForLimitType:3];
  [(PowerUIChargingController *)self clearChargeLimitForLimitType:4];
  [(PowerUIChargingController *)self clearChargeLimitForLimitType:5];
}

- (BOOL)setChargeLimitTo:(int64_t)a3 forLimitType:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  [(NSLock *)self->_chargeLimitLock lock];
  unint64_t v7 = a4 - 1;
  if (a4 - 1 >= 5)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[PowerUIChargingController setChargeLimitTo:forLimitType:]();
    }
    goto LABEL_10;
  }
  int v8 = off_2645A61E0[v7];
  int v9 = off_2645A6208[v7];
  BOOL v10 = [(PowerUIChargingController *)self loadChargeLimitTokenForPreferenceKey:v9 forReason:v8];
  BOOL v11 = v10 == 0;
  if (!v10
    && ![(PowerUIChargingController *)self registerNewTokenForPreferenceKey:v9 forReason:v8])
  {
LABEL_10:
    [(NSLock *)self->_chargeLimitLock unlock];
    return 0;
  }
  mach_error_t v12 = IOPSLimitBatteryLevel();
  log = self->_log;
  if (v12)
  {
    mach_error_t v14 = v12;
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[PowerUIChargingController setChargeLimitTo:forLimitType:](log, v14);
    }
    [(NSLock *)self->_chargeLimitLock unlock];
    [(PowerUIChargingController *)self clearChargeLimitForLimitType:a4];
    return 0;
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134218242;
    int64_t v17 = a3;
    __int16 v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Limited charging to %lu for reason '%@'", (uint8_t *)&v16, 0x16u);
  }
  [(NSLock *)self->_chargeLimitLock unlock];
  return v11;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSMutableDictionary)tokenDict
{
  return self->_tokenDict;
}

- (void)setTokenDict:(id)a3
{
}

- (NSLock)chargeLimitLock
{
  return self->_chargeLimitLock;
}

- (void)setChargeLimitLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chargeLimitLock, 0);
  objc_storeStrong((id *)&self->_tokenDict, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)registerNewTokenForPreferenceKey:(void *)a1 forReason:(mach_error_t)a2 .cold.1(void *a1, mach_error_t a2)
{
  id v3 = a1;
  mach_error_string(a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_22135E000, v4, v5, "Error code string value: %s", v6, v7, v8, v9, v10);
}

- (void)registerNewTokenForPreferenceKey:(int)a1 forReason:(NSObject *)a2 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_22135E000, a2, OS_LOG_TYPE_ERROR, "Could not get charge limit token, error code: %d", (uint8_t *)v2, 8u);
}

- (void)clearChargeLimitForLimitType:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_22135E000, v0, OS_LOG_TYPE_ERROR, "trying to clear invalid charge token: %lu", v1, 0xCu);
}

- (void)setChargeLimitTo:(void *)a1 forLimitType:(mach_error_t)a2 .cold.1(void *a1, mach_error_t a2)
{
  id v3 = a1;
  mach_error_string(a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_22135E000, v4, v5, "Error trying to limit the battery level: %s", v6, v7, v8, v9, v10);
}

- (void)setChargeLimitTo:forLimitType:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_22135E000, v0, OS_LOG_TYPE_ERROR, "trying to set invalid charge token: %lu", v1, 0xCu);
}

@end