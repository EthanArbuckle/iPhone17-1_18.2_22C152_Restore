@interface PHBrandedCallingSwitchSpecifier
- (CTXPCServiceSubscriptionContext)context;
- (CoreTelephonyClient)ctClient;
- (PHBrandedCallingSwitchSpecifier)initWithCoreTelephonyClient:(id)a3 context:(id)a4;
- (PHBrandedCallingSwitchSpecifier)initWithCoreTelephonyClient:(id)a3 context:(id)a4 carrierName:(id)a5;
- (TUConfigurationProvider)configurationProvider;
- (TUFeatureFlags)featureFlags;
- (id)getBrandedCallingEnabled;
- (void)getBrandedCallingEnabled;
- (void)setBrandedCallingEnabled:(id)a3;
- (void)setContext:(id)a3;
- (void)setCtClient:(id)a3;
@end

@implementation PHBrandedCallingSwitchSpecifier

- (PHBrandedCallingSwitchSpecifier)initWithCoreTelephonyClient:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"BRANDED_CALLING_SPECIFIER_TITLE" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
  v17.receiver = self;
  v17.super_class = (Class)PHBrandedCallingSwitchSpecifier;
  v11 = [(PHBrandedCallingSwitchSpecifier *)&v17 initWithName:v10 target:self set:sel_setBrandedCallingEnabled_ get:sel_getBrandedCallingEnabled detail:0 cell:6 edit:0];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_ctClient, a3);
    objc_storeStrong((id *)&v11->_context, a4);
    v12 = (TUFeatureFlags *)objc_alloc_init(MEMORY[0x1E4FADBD0]);
    featureFlags = v11->_featureFlags;
    v11->_featureFlags = v12;

    if ([(TUFeatureFlags *)v11->_featureFlags deviceExpertMigrationEnabled])
    {
      v14 = (TUConfigurationProvider *)objc_alloc_init(MEMORY[0x1E4FADAF8]);
      configurationProvider = v11->_configurationProvider;
      v11->_configurationProvider = v14;
    }
  }

  return v11;
}

- (PHBrandedCallingSwitchSpecifier)initWithCoreTelephonyClient:(id)a3 context:(id)a4 carrierName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v10 label];
  v19.receiver = self;
  v19.super_class = (Class)PHBrandedCallingSwitchSpecifier;
  v13 = [(PHBrandedCallingSwitchSpecifier *)&v19 initWithName:v12 target:self set:sel_setBrandedCallingEnabled_ get:sel_getBrandedCallingEnabled detail:0 cell:6 edit:0];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_ctClient, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    [(PHBrandedCallingSwitchSpecifier *)v13 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
    [(PHBrandedCallingSwitchSpecifier *)v13 setProperty:v11 forKey:*MEMORY[0x1E4F93230]];
    v14 = (TUFeatureFlags *)objc_alloc_init(MEMORY[0x1E4FADBD0]);
    featureFlags = v13->_featureFlags;
    v13->_featureFlags = v14;

    if ([(TUFeatureFlags *)v13->_featureFlags deviceExpertMigrationEnabled])
    {
      v16 = (TUConfigurationProvider *)objc_alloc_init(MEMORY[0x1E4FADAF8]);
      configurationProvider = v13->_configurationProvider;
      v13->_configurationProvider = v16;
    }
  }

  return v13;
}

- (id)getBrandedCallingEnabled
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(PHBrandedCallingSwitchSpecifier *)self featureFlags];
  int v4 = [v3 deviceExpertMigrationEnabled];

  if (v4)
  {
    BOOL v5 = [(CTXPCServiceSubscriptionContext *)self->_context slotID] == 1;
    v6 = NSNumber;
    id v7 = [(PHBrandedCallingSwitchSpecifier *)self configurationProvider];
    id v8 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "isBrandedCallingEnabled:", v5));
  }
  else
  {
    unsigned __int8 v21 = 0;
    ctClient = self->_ctClient;
    p_context = (uint64_t *)&self->_context;
    context = self->_context;
    uint64_t v12 = *MEMORY[0x1E4F23B70];
    id v20 = 0;
    v13 = [(CoreTelephonyClient *)ctClient context:context getCapability:v12 status:&v21 with:&v20];
    id v14 = v20;
    v15 = TPSLog();
    v16 = v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        [(PHBrandedCallingSwitchSpecifier *)p_context getBrandedCallingEnabled];
      }

      id v8 = (void *)MEMORY[0x1E4F1CC28];
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *p_context;
        v18 = @"On";
        if (!v21) {
          v18 = @"Off";
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v23 = v17;
        __int16 v24 = 2112;
        v25 = v18;
        _os_log_impl(&dword_1E4DD4000, v16, OS_LOG_TYPE_DEFAULT, "Fetched state of branded calling for context: %@, state: %@", buf, 0x16u);
      }

      id v8 = [NSNumber numberWithBool:v21];
    }
  }
  return v8;
}

- (void)setBrandedCallingEnabled:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(TUFeatureFlags *)self->_featureFlags deviceExpertMigrationEnabled])
  {
    BOOL v5 = [(CTXPCServiceSubscriptionContext *)self->_context slotID] == 1;
    v6 = [(PHBrandedCallingSwitchSpecifier *)self configurationProvider];
    objc_msgSend(v6, "setBrandedCallingEnabled:primary:", objc_msgSend(v4, "BOOLValue"), v5);
  }
  else
  {
    p_context = (uint64_t *)&self->_context;
    v6 = -[CoreTelephonyClient context:setCapability:enabled:with:](self->_ctClient, "context:setCapability:enabled:with:", self->_context, *MEMORY[0x1E4F23B70], [v4 BOOLValue], 0);
    id v8 = TPSLog();
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[PHBrandedCallingSwitchSpecifier setBrandedCallingEnabled:](p_context, v9);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *p_context;
      int v11 = [v4 BOOLValue];
      uint64_t v12 = @"Off";
      if (v11) {
        uint64_t v12 = @"On";
      }
      int v13 = 138412546;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_1E4DD4000, v9, OS_LOG_TYPE_DEFAULT, "Set state of branded calling for context: %@, state: %@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (CoreTelephonyClient)ctClient
{
  return self->_ctClient;
}

- (void)setCtClient:(id)a3
{
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (TUConfigurationProvider)configurationProvider
{
  return self->_configurationProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationProvider, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
}

- (void)getBrandedCallingEnabled
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1E4DD4000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch state of branded calling for context: %@", (uint8_t *)&v3, 0xCu);
}

- (void)setBrandedCallingEnabled:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1E4DD4000, a2, OS_LOG_TYPE_ERROR, "Failed to set state of branded calling for context: %@", (uint8_t *)&v3, 0xCu);
}

@end