@interface MSDLocalization
+ (BOOL)getChannelWarningKeys:(id *)a3 andPlaceHolderWarnings:(id *)a4 forDeviceClass:(id)a5;
+ (BOOL)getRetailWarningKeys:(id *)a3 andPlaceHolderWarnings:(id *)a4 forDeviceClass:(id)a5;
+ (BOOL)getWarningKeys:(id *)a3 andPlaceHolderWarnings:(id *)a4 forOwnershipWarningFlag:(id)a5;
+ (id)getLocalizedOwnershipWarnings:(id)a3;
+ (id)sharedInstance;
+ (void)fillInMissingLocales:(id)a3 withOwnershipWarningMsg:(id)a4;
- (MSDLocalization)init;
- (NSDictionary)localizationTable;
- (id)localizedStringWithKey:(id)a3 defaultString:(id)a4;
- (void)init;
- (void)setLocalizationTable:(id)a3;
@end

@implementation MSDLocalization

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance_shared_2;
  return v2;
}

uint64_t __33__MSDLocalization_sharedInstance__block_invoke()
{
  sharedInstance_shared_2 = objc_alloc_init(MSDLocalization);
  return MEMORY[0x270F9A758]();
}

- (MSDLocalization)init
{
  v16.receiver = self;
  v16.super_class = (Class)MSDLocalization;
  v2 = [(MSDLocalization *)&v16 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/StoreDemoViewService.app"];
    v4 = v3;
    if (v3)
    {
      v5 = (void *)MEMORY[0x263F086E0];
      v6 = [v3 localizations];
      v7 = [MEMORY[0x263EFF960] preferredLanguages];
      v8 = [v5 preferredLocalizationsFromArray:v6 forPreferences:v7];

      v9 = [v8 objectAtIndexedSubscript:0];
      v10 = [v4 pathForResource:@"Localizable" ofType:@"strings" inDirectory:@"." forLocalization:v9];

      uint64_t v11 = [objc_alloc(NSDictionary) initWithContentsOfFile:v10];
      localizationTable = v2->_localizationTable;
      v2->_localizationTable = (NSDictionary *)v11;
    }
    else
    {
      v13 = defaultLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[MSDLocalization init](v13);
      }

      v8 = v2->_localizationTable;
      v2->_localizationTable = 0;
    }

    v14 = v2;
  }

  return v2;
}

- (id)localizedStringWithKey:(id)a3 defaultString:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(MSDLocalization *)self localizationTable];

  if (v8)
  {
    v9 = [(MSDLocalization *)self localizationTable];
    v10 = [v9 objectForKey:v6];

    uint64_t v11 = v10;
    if (!v10)
    {
      v12 = defaultLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [MEMORY[0x263EFF960] preferredLanguages];
        int v16 = 138543618;
        id v17 = v6;
        __int16 v18 = 2114;
        v19 = v13;
        _os_log_impl(&dword_21EF08000, v12, OS_LOG_TYPE_DEFAULT, "Localization lookup failed for key %{public}@, preferred languages %{public}@", (uint8_t *)&v16, 0x16u);
      }
      uint64_t v11 = v7;
    }
    id v14 = v11;
  }
  else
  {
    id v14 = v7;
  }

  return v14;
}

+ (id)getLocalizedOwnershipWarnings:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = defaultLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "+[MSDLocalization getLocalizedOwnershipWarnings:]";
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_21EF08000, v4, OS_LOG_TYPE_DEFAULT, "%s - ownershipWarningFlag:  %{public}@", buf, 0x16u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__MSDLocalization_getLocalizedOwnershipWarnings___block_invoke;
  block[3] = &unk_2644FC938;
  id v10 = v3;
  uint64_t v5 = getLocalizedOwnershipWarnings__onceToken;
  id v6 = v3;
  if (v5 != -1) {
    dispatch_once(&getLocalizedOwnershipWarnings__onceToken, block);
  }
  id v7 = (id)getLocalizedOwnershipWarnings__localizedOwnershipWarnings;

  return v7;
}

void __49__MSDLocalization_getLocalizedOwnershipWarnings___block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/MobileStoreDemoKit.framework"];
  v42 = [MEMORY[0x263EFF9A0] dictionary];
  unint64_t v3 = 0x26B575000uLL;
  id v50 = 0;
  id v51 = 0;
  BOOL v4 = +[MSDLocalization getWarningKeys:&v51 andPlaceHolderWarnings:&v50 forOwnershipWarningFlag:*(void *)(a1 + 32)];
  id v5 = v51;
  id v6 = v50;
  if (v2) {
    BOOL v7 = !v4;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = defaultLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __49__MSDLocalization_getLocalizedOwnershipWarnings___block_invoke_cold_3(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    uint64_t v16 = [v2 localizations];
    v8 = v16;
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v17 = defaultLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        __49__MSDLocalization_getLocalizedOwnershipWarnings___block_invoke_cold_2();
      }
      v41 = v6;

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v8 = v8;
      uint64_t v45 = [v8 countByEnumeratingWithState:&v46 objects:v56 count:16];
      if (v45)
      {
        uint64_t v44 = *(void *)v47;
        *(void *)&long long v18 = 138543362;
        long long v40 = v18;
        obj = v8;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v47 != v44) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = *(void **)(*((void *)&v46 + 1) + 8 * v19);
            v21 = objc_msgSend(v5, "objectForKey:", @"Title", v40);
            v22 = [v2 localizedStringForKey:v21 value:0 table:0 localization:v20];

            v23 = [v5 objectForKey:@"Body"];
            v24 = [v2 localizedStringForKey:v23 value:0 table:0 localization:v20];

            v25 = [v5 objectForKey:@"Link"];
            v26 = [v2 localizedStringForKey:v25 value:0 table:0 localization:v20];

            if (!v26
              || ([v5 objectForKey:@"Link"],
                  v27 = objc_claimAutoreleasedReturnValue(),
                  int v28 = [(__CFString *)v26 isEqualToString:v27],
                  v27,
                  v28))
            {

              v26 = &stru_26D08A1B8;
            }
            if (v22 && v24)
            {
              v54[0] = @"Title";
              v54[1] = @"Body";
              v55[0] = v22;
              v55[1] = v24;
              v54[2] = @"Link";
              v55[2] = v26;
              v29 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:3];
              [v42 setObject:v29 forKey:v20];
              if ([v20 isEqualToString:@"en"])
              {
                v29 = v29;

                v41 = v29;
              }
            }
            else
            {
              v29 = defaultLogHandle();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v40;
                v53 = v20;
                _os_log_error_impl(&dword_21EF08000, v29, OS_LOG_TYPE_ERROR, "ERROR - Either title, body or link localized text is missing for locale:  %{public}@", buf, 0xCu);
              }
            }

            ++v19;
          }
          while (v45 != v19);
          v8 = obj;
          uint64_t v45 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
        }
        while (v45);
      }

      unint64_t v3 = 0x26B575000;
      id v6 = v41;
    }
    else
    {
      v30 = defaultLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        __49__MSDLocalization_getLocalizedOwnershipWarnings___block_invoke_cold_1(v30, v31, v32, v33, v34, v35, v36, v37);
      }
    }
  }

  [(id)(v3 + 2200) fillInMissingLocales:v42 withOwnershipWarningMsg:v6];
  uint64_t v38 = [NSDictionary dictionaryWithDictionary:v42];
  v39 = (void *)getLocalizedOwnershipWarnings__localizedOwnershipWarnings;
  getLocalizedOwnershipWarnings__localizedOwnershipWarnings = v38;
}

+ (void)fillInMissingLocales:(id)a3 withOwnershipWarningMsg:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (fillInMissingLocales_withOwnershipWarningMsg__onceToken != -1) {
    dispatch_once(&fillInMissingLocales_withOwnershipWarningMsg__onceToken, &__block_literal_global_26);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = (id)fillInMissingLocales_withOwnershipWarningMsg__defaultLocales;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v5, "objectForKey:", v12, (void)v14);

        if (!v13) {
          [v5 setObject:v6 forKey:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

void __64__MSDLocalization_fillInMissingLocales_withOwnershipWarningMsg___block_invoke()
{
  v0 = (void *)fillInMissingLocales_withOwnershipWarningMsg__defaultLocales;
  fillInMissingLocales_withOwnershipWarningMsg__defaultLocales = (uint64_t)&unk_26D092268;
}

+ (BOOL)getWarningKeys:(id *)a3 andPlaceHolderWarnings:(id *)a4 forOwnershipWarningFlag:(id)a5
{
  id v7 = a5;
  *a3 = 0;
  *a4 = 0;
  uint64_t v8 = (void *)MGGetStringAnswer();
  uint64_t v9 = v8;
  if (!v8)
  {
    uint64_t v13 = defaultLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[MSDLocalization getWarningKeys:andPlaceHolderWarnings:forOwnershipWarningFlag:](v13);
    }
    goto LABEL_19;
  }
  if (([v8 isEqualToString:@"iPhone"] & 1) == 0
    && ([v9 isEqualToString:@"iPad"] & 1) == 0
    && ([v9 isEqualToString:@"iPod"] & 1) == 0
    && ([v9 isEqualToString:@"Watch"] & 1) == 0)
  {
    uint64_t v13 = defaultLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[MSDLocalization getWarningKeys:andPlaceHolderWarnings:forOwnershipWarningFlag:]();
    }
    goto LABEL_19;
  }
  if (([v7 isEqualToString:@"2"] & 1) == 0
    && ([v7 isEqualToString:@"1"] & 1) == 0)
  {
    uint64_t v13 = defaultLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[MSDLocalization getWarningKeys:andPlaceHolderWarnings:forOwnershipWarningFlag:]();
    }
LABEL_19:

    BOOL v11 = 0;
    goto LABEL_12;
  }
  if ([v7 isEqualToString:@"2"]) {
    BOOL v10 = +[MSDLocalization getChannelWarningKeys:a3 andPlaceHolderWarnings:a4 forDeviceClass:v9];
  }
  else {
    BOOL v10 = +[MSDLocalization getRetailWarningKeys:a3 andPlaceHolderWarnings:a4 forDeviceClass:v9];
  }
  BOOL v11 = v10;
LABEL_12:

  return v11;
}

+ (BOOL)getChannelWarningKeys:(id *)a3 andPlaceHolderWarnings:(id *)a4 forDeviceClass:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
  [v8 setObject:@"PropertyClaimTitle_Channel" forKey:@"Title"];
  [v8 setObject:@"PropertyClaimLink_Channel" forKey:@"Link"];
  uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
  [v9 setObject:@"Property of Apple Authorized Reseller" forKey:@"Title"];
  [v9 setObject:&stru_26D08A1B8 forKey:@"Link"];
  if ([v7 isEqualToString:@"iPhone"])
  {
    [v8 setObject:@"PropertyClaimBody_iPhone_Channel" forKey:@"Body"];
    BOOL v10 = @"This iPhone cannot be used and is not for sale.";
LABEL_9:
    [v9 setObject:v10 forKey:@"Body"];
    goto LABEL_10;
  }
  if ([v7 isEqualToString:@"iPad"])
  {
    [v8 setObject:@"PropertyClaimBody_iPad_Channel" forKey:@"Body"];
    BOOL v10 = @"This iPad cannot be used and is not for sale.";
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"iPod"])
  {
    [v8 setObject:@"PropertyClaimBody_iPod_Channel" forKey:@"Body"];
    BOOL v10 = @"This iPod cannot be used and is not for sale.";
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"Watch"])
  {
    [v8 setObject:@"PropertyClaimBody_AppleWatch_Channel" forKey:@"Body"];
    BOOL v10 = @"This Apple Watch cannot be used and is not for sale.";
    goto LABEL_9;
  }
LABEL_10:
  *a3 = [NSDictionary dictionaryWithDictionary:v8];
  *a4 = [NSDictionary dictionaryWithDictionary:v9];

  return 1;
}

+ (BOOL)getRetailWarningKeys:(id *)a3 andPlaceHolderWarnings:(id *)a4 forDeviceClass:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
  [v8 setObject:@"PropertyClaimTitle_Retail" forKey:@"Title"];
  [v8 setObject:@"PropertyClaimLink_Retail" forKey:@"Link"];
  uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
  [v9 setObject:@"Property of Apple" forKey:@"Title"];
  [v9 setObject:@"apple.com/retail" forKey:@"Link"];
  if ([v7 isEqualToString:@"iPhone"])
  {
    [v8 setObject:@"PropertyClaimBody_iPhone_Retail" forKey:@"Body"];
    BOOL v10 = @"This iPhone cannot be used and is not for sale.  Return it to a nearby Apple retail location.";
LABEL_9:
    [v9 setObject:v10 forKey:@"Body"];
    goto LABEL_10;
  }
  if ([v7 isEqualToString:@"iPad"])
  {
    [v8 setObject:@"PropertyClaimBody_iPad_Retail" forKey:@"Body"];
    BOOL v10 = @"This iPad cannot be used and is not for sale.  Return it to a nearby Apple retail location.";
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"iPod"])
  {
    [v8 setObject:@"PropertyClaimBody_iPod_Retail" forKey:@"Body"];
    BOOL v10 = @"This iPod cannot be used and is not for sale.  Return it to a nearby Apple retail location.";
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"Watch"])
  {
    [v8 setObject:@"PropertyClaimBody_AppleWatch_Retail" forKey:@"Body"];
    BOOL v10 = @"This Apple Watch cannot be used and is not for sale.  Return it to a nearby Apple retail location.";
    goto LABEL_9;
  }
LABEL_10:
  *a3 = [NSDictionary dictionaryWithDictionary:v8];
  *a4 = [NSDictionary dictionaryWithDictionary:v9];

  return 1;
}

- (NSDictionary)localizationTable
{
  return self->_localizationTable;
}

- (void)setLocalizationTable:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)init
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138543362;
  v2 = @"/Applications/StoreDemoViewService.app";
  _os_log_error_impl(&dword_21EF08000, log, OS_LOG_TYPE_ERROR, "Could not load localization bundle at %{public}@", (uint8_t *)&v1, 0xCu);
}

void __49__MSDLocalization_getLocalizedOwnershipWarnings___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __49__MSDLocalization_getLocalizedOwnershipWarnings___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_21EF08000, v0, OS_LOG_TYPE_DEBUG, "%s - allLocalizations = %{public}@", (uint8_t *)v1, 0x16u);
}

void __49__MSDLocalization_getLocalizedOwnershipWarnings___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)getWarningKeys:(os_log_t)log andPlaceHolderWarnings:forOwnershipWarningFlag:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "+[MSDLocalization getWarningKeys:andPlaceHolderWarnings:forOwnershipWarningFlag:]";
  _os_log_error_impl(&dword_21EF08000, log, OS_LOG_TYPE_ERROR, "%s - ERROR - Failed to get device class.", (uint8_t *)&v1, 0xCu);
}

+ (void)getWarningKeys:andPlaceHolderWarnings:forOwnershipWarningFlag:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s - ERROR - Invalid ownershipWarningFlag value:  %{public}@", v2, v3, v4, v5, 2u);
}

+ (void)getWarningKeys:andPlaceHolderWarnings:forOwnershipWarningFlag:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s - ERROR - Unsupported device class:  %{public}@", v2, v3, v4, v5, 2u);
}

@end