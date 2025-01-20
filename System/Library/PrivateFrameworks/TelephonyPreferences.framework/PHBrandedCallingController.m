@interface PHBrandedCallingController
- (BOOL)featureEnabledForAtLeastOneContext;
- (BOOL)getBrandedCallingCapabilityEnabledForContext:(id)a3;
- (BOOL)getBrandedCallingStateForContext:(id)a3;
- (CoreTelephonyClient)ctClient;
- (NSArray)contexts;
- (PHBrandedCallingController)initWithCoreTelephonyClient:(id)a3 parentListController:(id)a4;
- (PSListController)parentListController;
- (TUConfigurationProvider)configurationProvider;
- (TUFeatureFlags)featureFlags;
- (id)activeContextsSupportingBrandedCalling;
- (id)fetchCarrierBundleValue:(id)a3 context:(id)a4;
- (id)fetchSubscriptionsInUse;
- (id)getBrandedCallingEnabled;
- (void)configurationChanged;
- (void)getBrandedCallingEnabled;
- (void)setBrandedCallingEnabled:(id)a3;
- (void)setContexts:(id)a3;
- (void)setCtClient:(id)a3;
- (void)setParentListController:(id)a3;
- (void)updateBrandedCallingState;
@end

@implementation PHBrandedCallingController

- (PHBrandedCallingController)initWithCoreTelephonyClient:(id)a3 parentListController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHBrandedCallingController;
  v9 = [(PHBrandedCallingController *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ctClient, a3);
    v11 = (TUFeatureFlags *)objc_alloc_init(MEMORY[0x1E4FADBD0]);
    featureFlags = v10->_featureFlags;
    v10->_featureFlags = v11;

    if ([(TUFeatureFlags *)v10->_featureFlags deviceExpertMigrationEnabled])
    {
      v13 = (TUConfigurationProvider *)objc_alloc_init(MEMORY[0x1E4FADAF8]);
      configurationProvider = v10->_configurationProvider;
      v10->_configurationProvider = v13;

      [(TUConfigurationProvider *)v10->_configurationProvider setDelegate:v10];
    }
    objc_storeWeak((id *)&v10->_parentListController, v8);
    [(PHBrandedCallingController *)v10 updateBrandedCallingState];
  }

  return v10;
}

- (id)getBrandedCallingEnabled
{
  ctClient = self->_ctClient;
  uint64_t v8 = 0;
  v3 = [(CoreTelephonyClient *)ctClient shouldShowBrandedCallingInfo:&v8];
  v4 = v3;
  if (v8)
  {
    v5 = TPSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[PHBrandedCallingController getBrandedCallingEnabled](v5);
    }

    id v6 = (id)MEMORY[0x1E4F1CC28];
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (BOOL)getBrandedCallingStateForContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(TUFeatureFlags *)self->_featureFlags deviceExpertMigrationEnabled])
  {
    BOOL v5 = [v4 slotID] == 1;
    id v6 = [(PHBrandedCallingController *)self configurationProvider];
    char v7 = [v6 isBrandedCallingEnabled:v5];
  }
  else
  {
    char v17 = 0;
    ctClient = self->_ctClient;
    uint64_t v9 = *MEMORY[0x1E4F23B70];
    id v16 = 0;
    v10 = [(CoreTelephonyClient *)ctClient context:v4 getCapability:v9 status:&v17 with:&v16];
    id v11 = v16;
    v12 = TPSLog();
    v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[PHBrandedCallingController getBrandedCallingStateForContext:]((uint64_t)v4, v13);
      }

      char v7 = 0;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = @"On";
        if (!v17) {
          v14 = @"Off";
        }
        *(_DWORD *)buf = 138412546;
        id v19 = v4;
        __int16 v20 = 2112;
        v21 = v14;
        _os_log_impl(&dword_1E4DD4000, v13, OS_LOG_TYPE_DEFAULT, "Fetched state of branded calling for context: %@, state: %@", buf, 0x16u);
      }

      char v7 = v17 != 0;
    }
  }
  return v7;
}

- (BOOL)featureEnabledForAtLeastOneContext
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(PHBrandedCallingController *)self fetchSubscriptionsInUse];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= [(PHBrandedCallingController *)self getBrandedCallingStateForContext:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6 & 1;
}

- (void)setBrandedCallingEnabled:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TPSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 BOOLValue];
    uint64_t v7 = @"Disabled";
    if (v6) {
      uint64_t v7 = @"Enabled";
    }
    int v9 = 138412290;
    long long v10 = v7;
    _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "User set branded calling to: %@", (uint8_t *)&v9, 0xCu);
  }

  id v8 = (id)-[CoreTelephonyClient setShouldShowBrandedCallingInfo:](self->_ctClient, "setShouldShowBrandedCallingInfo:", [v4 BOOLValue]);
}

- (id)fetchSubscriptionsInUse
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v3 = (void *)getPSSimStatusCacheClass_softClass;
  uint64_t v24 = getPSSimStatusCacheClass_softClass;
  if (!getPSSimStatusCacheClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v27 = __getPSSimStatusCacheClass_block_invoke;
    v28 = &unk_1E6EB21F8;
    v29 = &v21;
    __getPSSimStatusCacheClass_block_invoke((uint64_t)&buf);
    v3 = (void *)v22[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v21, 8);
  uint64_t v5 = [v4 sharedInstance];
  int v6 = [v5 subscriptionsInUse];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v18;
    *(void *)&long long v8 = 138412290;
    long long v16 = v8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "isSimHidden", v16, (void)v17))
        {
          long long v12 = TPSLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            long long v13 = [v11 uuid];
            LODWORD(buf) = v16;
            *(void *)((char *)&buf + 4) = v13;
            _os_log_impl(&dword_1E4DD4000, v12, OS_LOG_TYPE_DEFAULT, "Subscription: %@ is hidden", (uint8_t *)&buf, 0xCu);
          }
        }
        else
        {
          [v2 addObject:v11];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v7);
  }

  v14 = (void *)[v2 copy];
  return v14;
}

- (BOOL)getBrandedCallingCapabilityEnabledForContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v15 = 0;
  ctClient = self->_ctClient;
  uint64_t v6 = *MEMORY[0x1E4F23B70];
  id v14 = 0;
  uint64_t v7 = [(CoreTelephonyClient *)ctClient context:v4 canSetCapability:v6 allowed:&v15 with:&v14];
  id v8 = v14;
  uint64_t v9 = TPSLog();
  long long v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PHBrandedCallingController getBrandedCallingCapabilityEnabledForContext:]();
    }

    BOOL v11 = 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = @"Yes";
      if (!v15) {
        long long v12 = @"No";
      }
      *(_DWORD *)long long buf = 138412546;
      id v17 = v4;
      __int16 v18 = 2112;
      long long v19 = v12;
      _os_log_impl(&dword_1E4DD4000, v10, OS_LOG_TYPE_DEFAULT, "kCTCapabilityBrandedCallingInfo fetched for context: %@, capability enabled: %@", buf, 0x16u);
    }

    BOOL v11 = v15 != 0;
  }

  return v11;
}

- (id)fetchCarrierBundleValue:(id)a3 context:(id)a4
{
  id v6 = a3;
  ctClient = self->_ctClient;
  id v12 = 0;
  id v8 = [(CoreTelephonyClient *)ctClient context:a4 getCarrierBundleValue:v6 error:&v12];
  id v9 = v12;
  if (v9)
  {
    long long v10 = TPSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PHBrandedCallingController fetchCarrierBundleValue:context:]();
    }

    id v8 = 0;
  }

  return v8;
}

- (void)updateBrandedCallingState
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(PHBrandedCallingController *)self fetchSubscriptionsInUse];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (-[PHBrandedCallingController getBrandedCallingCapabilityEnabledForContext:](self, "getBrandedCallingCapabilityEnabledForContext:", v10, (void)v17))
        {
          BOOL v11 = objc_alloc_init(PHBrandedCallingContext);
          [(PHBrandedCallingContext *)v11 setContext:v10];
          id v12 = [(PHBrandedCallingController *)self fetchCarrierBundleValue:&unk_1F40C9358 context:v10];
          [(PHBrandedCallingContext *)v11 setCarrierName:v12];

          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
  }

  p_contexts = &self->_contexts;
  objc_storeStrong((id *)&self->_contexts, v4);
  id v14 = TPSLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [(NSArray *)*p_contexts count];
    long long v16 = @"Yes";
    if (!v15) {
      long long v16 = @"No";
    }
    *(_DWORD *)long long buf = 138412290;
    uint64_t v22 = v16;
    _os_log_impl(&dword_1E4DD4000, v14, OS_LOG_TYPE_DEFAULT, "Should show branded calling switch(es) to user: %@", buf, 0xCu);
  }
}

- (id)activeContextsSupportingBrandedCalling
{
  return self->_contexts;
}

- (void)configurationChanged
{
  id v2 = [(PHBrandedCallingController *)self parentListController];
  [v2 reloadSpecifiers];
}

- (PSListController)parentListController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentListController);
  return (PSListController *)WeakRetained;
}

- (void)setParentListController:(id)a3
{
}

- (CoreTelephonyClient)ctClient
{
  return self->_ctClient;
}

- (void)setCtClient:(id)a3
{
}

- (NSArray)contexts
{
  return self->_contexts;
}

- (void)setContexts:(id)a3
{
}

- (TUConfigurationProvider)configurationProvider
{
  return self->_configurationProvider;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_configurationProvider, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_destroyWeak((id *)&self->_parentListController);
}

- (void)getBrandedCallingEnabled
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E4DD4000, log, OS_LOG_TYPE_ERROR, "Failed to fetch state of branded calling.", v1, 2u);
}

- (void)getBrandedCallingStateForContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4DD4000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch state of branded calling for context: %@", (uint8_t *)&v2, 0xCu);
}

- (void)getBrandedCallingCapabilityEnabledForContext:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E4DD4000, v0, v1, "Failed to fetch kCTCapabilityBrandedCallingInfo for context:%@ , error: %@");
}

- (void)fetchCarrierBundleValue:context:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E4DD4000, v0, v1, "Failed to fetch carrier bundle value for key hierarchy: %@, error: %@");
}

@end