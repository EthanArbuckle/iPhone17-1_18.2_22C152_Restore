@interface ICSUbiquityAccessManager
+ (ICSUbiquityAccessManager)sharedInstance;
- (BOOL)isAccessGrantedForBundleID:(id)a3;
- (ICSUbiquityAccessManager)init;
- (NSArray)allBundleIDs;
- (__CFBundle)_bundleForBundleID:(id)a3;
- (id)_serviceNamesForBundleID:(id)a3;
- (id)_servicesForBundleID:(id)a3;
- (void)_addAccessInfo:(id)a3 forServiceName:(id)a4;
- (void)_updateCacheGranted:(BOOL)a3 forBundleID:(id)a4;
- (void)reloadAccessInfo;
- (void)setAppAccessGranted:(BOOL)a3 forBundleID:(id)a4;
@end

@implementation ICSUbiquityAccessManager

+ (ICSUbiquityAccessManager)sharedInstance
{
  if (sharedInstance_onceToken[0] != -1) {
    dispatch_once(sharedInstance_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance__accessManager;

  return (ICSUbiquityAccessManager *)v2;
}

uint64_t __42__ICSUbiquityAccessManager_sharedInstance__block_invoke()
{
  sharedInstance__accessManager = objc_alloc_init(ICSUbiquityAccessManager);

  return MEMORY[0x270F9A758]();
}

- (ICSUbiquityAccessManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICSUbiquityAccessManager;
  v2 = [(ICSUbiquityAccessManager *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ICSUbiquityAccessManager *)v2 reloadAccessInfo];
  }
  return v3;
}

- (void)reloadAccessInfo
{
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  accessInfoCacheByBundleID = self->_accessInfoCacheByBundleID;
  self->_accessInfoCacheByBundleID = v3;

  objc_super v5 = (void *)MEMORY[0x263F7C658];
  id v8 = (id)TCCAccessCopyInformation();
  v6 = (void *)MEMORY[0x263F7C580];
  v7 = (void *)TCCAccessCopyInformation();
  [(ICSUbiquityAccessManager *)self _addAccessInfo:v8 forServiceName:*v5];
  [(ICSUbiquityAccessManager *)self _addAccessInfo:v7 forServiceName:*v6];
}

- (void)_addAccessInfo:(id)a3 forServiceName:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v25 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = (void *)MEMORY[0x263F7C4C8];
    v10 = (void *)MEMORY[0x263F7C4D8];
    uint64_t v28 = *(void *)v30;
    do
    {
      uint64_t v11 = 0;
      uint64_t v26 = v8;
      do
      {
        if (*(void *)v30 != v28) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
        v13 = [v12 objectForKeyedSubscript:*v9];
        v14 = CFBundleGetIdentifier(v13);
        uint64_t v15 = [v12 objectForKeyedSubscript:*v10];
        v16 = (void *)v15;
        if (v14)
        {
          if (!v15)
          {
            v16 = [NSNumber numberWithBool:0];
          }
          v17 = [(NSMutableDictionary *)self->_accessInfoCacheByBundleID objectForKey:v14];
          if (v17)
          {
            id v18 = v17;
            id v19 = [v17 objectForKey:@"services"];
            if (v19) {
              goto LABEL_11;
            }
          }
          else
          {
            id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
            [v18 setObject:v19 forKey:@"services"];
            [v18 setObject:v13 forKey:@"bundle"];
            [(NSMutableDictionary *)self->_accessInfoCacheByBundleID setObject:v18 forKey:v14];
            if (v19)
            {
LABEL_11:
              v20 = v10;
              v21 = self;
              v22 = v9;
              id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              [v23 setObject:v16 forKey:@"granted"];
              [v23 setObject:v25 forKey:@"serviceName"];
              [v19 addObject:v23];

              v9 = v22;
              self = v21;
              v10 = v20;
              uint64_t v8 = v26;
            }
          }
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v24 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      uint64_t v8 = v24;
    }
    while (v24);
  }
}

- (NSArray)allBundleIDs
{
  return (NSArray *)[(NSMutableDictionary *)self->_accessInfoCacheByBundleID allKeys];
}

- (__CFBundle)_bundleForBundleID:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_accessInfoCacheByBundleID objectForKeyedSubscript:a3];
  v4 = (__CFBundle *)[v3 objectForKey:@"bundle"];

  return v4;
}

- (id)_servicesForBundleID:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_accessInfoCacheByBundleID objectForKeyedSubscript:a3];
  v4 = [v3 objectForKey:@"services"];

  return v4;
}

- (id)_serviceNamesForBundleID:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_accessInfoCacheByBundleID objectForKeyedSubscript:a3];
  v4 = [v3 objectForKey:@"services"];
  objc_super v5 = [v4 valueForKey:@"serviceName"];

  return v5;
}

- (BOOL)isAccessGrantedForBundleID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(ICSUbiquityAccessManager *)self _servicesForBundleID:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "objectForKey:", @"granted", (void)v12);
        char v9 = [v8 BOOLValue];

        if (v9)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)setAppAccessGranted:(BOOL)a3 forBundleID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (![(ICSUbiquityAccessManager *)self _bundleForBundleID:v6])
  {
    uint64_t v7 = LogSubsystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v6;
      _os_log_impl(&dword_262993000, v7, OS_LOG_TYPE_DEFAULT, "Error! No bundle for bundle ID: %@. Maybe iCloud Drive is turned off?", buf, 0xCu);
    }
  }
  uint64_t v8 = [(ICSUbiquityAccessManager *)self _serviceNamesForBundleID:v6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        TCCAccessSetForBundle();
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  [(ICSUbiquityAccessManager *)self _updateCacheGranted:v4 forBundleID:v6];
  long long v13 = [(ICSUbiquityAccessManager *)self _serviceNamesForBundleID:v6];
  int v14 = [v13 containsObject:*MEMORY[0x263F7C658]];

  if (v14)
  {
    long long v15 = [MEMORY[0x263F3F808] sharedService];
    [v15 terminateApplication:v6 forReason:3 andReport:0 withDescription:0];
  }
}

- (void)_updateCacheGranted:(BOOL)a3 forBundleID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(ICSUbiquityAccessManager *)self _servicesForBundleID:a4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        uint64_t v11 = [NSNumber numberWithBool:v4];
        [v10 setObject:v11 forKey:@"granted"];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
}

@end