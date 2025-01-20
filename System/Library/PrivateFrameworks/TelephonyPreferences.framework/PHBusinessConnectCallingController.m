@interface PHBusinessConnectCallingController
- (BOOL)supportsBusinessConnectCallingForSubscriptionContext:(id)a3;
- (PHBusinessConnectCallingController)init;
- (TPSCarrierBundleController)carrierBundleController;
- (TUConfigurationProvider)configurationProvider;
- (TUFeatureFlags)featureFlags;
- (id)getBooleanFromUserDefaults:(id)a3 default:(id)a4;
- (id)getBusinessConnectCallingEnabled;
- (id)objectForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5;
- (id)specifiers;
- (id)stringForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5;
- (void)setBusinessConnectCallingEnabled:(id)a3;
- (void)setValueInUserDefaults:(id)a3 forKey:(id)a4;
@end

@implementation PHBusinessConnectCallingController

- (PHBusinessConnectCallingController)init
{
  v10.receiver = self;
  v10.super_class = (Class)PHBusinessConnectCallingController;
  v2 = [(PHBusinessConnectCallingController *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(TPSCarrierBundleController);
    carrierBundleController = v2->_carrierBundleController;
    v2->_carrierBundleController = v3;

    v5 = (TUFeatureFlags *)objc_alloc_init(MEMORY[0x1E4FADBD0]);
    featureFlags = v2->_featureFlags;
    v2->_featureFlags = v5;

    if ([(TUFeatureFlags *)v2->_featureFlags deviceExpertMigrationEnabled])
    {
      v7 = (TUConfigurationProvider *)objc_alloc_init(MEMORY[0x1E4FADAF8]);
      configurationProvider = v2->_configurationProvider;
      v2->_configurationProvider = v7;

      [(TUConfigurationProvider *)v2->_configurationProvider setDelegate:v2];
    }
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!_os_feature_enabled_impl()) {
    goto LABEL_4;
  }
  if ([(TUFeatureFlags *)self->_featureFlags deviceExpertMigrationEnabled])
  {
    v3 = [(PHBusinessConnectCallingController *)self configurationProvider];
    char v4 = [v3 isBusinessConnectCallingAvailable];

    if ((v4 & 1) == 0)
    {
LABEL_4:
      v5 = 0;
      goto LABEL_17;
    }
LABEL_15:
    v12 = (void *)MEMORY[0x1E4F92E70];
    v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"BUSINESS_CONNECT_CALLING_GROUP_HEADER" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
    v7 = [v12 groupSpecifierWithID:@"BusinessConnectCallingGroup" name:v14];

    id v15 = objc_alloc(MEMORY[0x1E4F92E70]);
    v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"BUSINESS_CONNECT_CALLING_SPECIFIER_TITLE" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
    v18 = (void *)[v15 initWithName:v17 target:self set:sel_setBusinessConnectCallingEnabled_ get:sel_getBusinessConnectCallingEnabled detail:0 cell:6 edit:0];

    v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v20 = [v19 localizedStringForKey:@"BUSINESS_CONNECT_CALLING_FOOTER_TEXT" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
    [v7 setProperty:v20 forKey:*MEMORY[0x1E4F93170]];

    v26[0] = v7;
    v26[1] = v18;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v6 = [(PHBusinessConnectCallingController *)self carrierBundleController];
    v7 = [v6 activeSubscriptions];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          if ([(PHBusinessConnectCallingController *)self supportsBusinessConnectCallingForSubscriptionContext:*(void *)(*((void *)&v22 + 1) + 8 * i)])
          {

            goto LABEL_15;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    v5 = 0;
  }

LABEL_17:
  return v5;
}

- (BOOL)supportsBusinessConnectCallingForSubscriptionContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v12 = 0;
  v5 = [(PHBusinessConnectCallingController *)self stringForKeyHierarchy:&unk_1F40C93A0 subscriptionContext:v4 error:&v12];
  id v6 = v12;
  v7 = v6;
  if (v5)
  {
    uint64_t v8 = TPSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1E4DD4000, v8, OS_LOG_TYPE_DEFAULT, "Retrieved verstat feature capability value '%@' for subscription %@", buf, 0x16u);
    }

    int v9 = [v5 isEqualToIgnoringCase:@"Disabled"] ^ 1;
  }
  else
  {
    if (v6)
    {
      uint64_t v10 = TPSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v14 = v4;
        __int16 v15 = 2112;
        id v16 = v7;
        _os_log_impl(&dword_1E4DD4000, v10, OS_LOG_TYPE_DEFAULT, "Retrieving verstat feature capability value for subscription %@ failed with error %@", buf, 0x16u);
      }
    }
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)objectForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5
{
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F23938];
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[v8 alloc] initWithBundleType:1];
  id v12 = [(PHBusinessConnectCallingController *)self carrierBundleController];
  v13 = [v12 telephonyClient];
  id v14 = (void *)[v13 copyCarrierBundleValue:v9 keyHierarchy:v10 bundleType:v11 error:a5];

  return v14;
}

- (id)stringForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5
{
  v5 = [(PHBusinessConnectCallingController *)self objectForKeyHierarchy:a3 subscriptionContext:a4 error:a5];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)getBusinessConnectCallingEnabled
{
  int v3 = [(TUFeatureFlags *)self->_featureFlags deviceExpertMigrationEnabled];
  id v4 = NSNumber;
  if (v3)
  {
    v5 = [(PHBusinessConnectCallingController *)self configurationProvider];
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "isBusinessConnectCallingEnabled"));
  }
  else
  {
    v5 = [(PHBusinessConnectCallingController *)self getBooleanFromUserDefaults:*MEMORY[0x1E4FADD50] default:&unk_1F40C9400];
    objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "BOOLValue") ^ 1);
  id v6 = };

  return v6;
}

- (void)setBusinessConnectCallingEnabled:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = TPSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "User toggled business connect calling switch to %@", (uint8_t *)&v8, 0xCu);
  }

  if ([(TUFeatureFlags *)self->_featureFlags deviceExpertMigrationEnabled])
  {
    uint64_t v6 = [v4 BOOLValue];
    v7 = [(PHBusinessConnectCallingController *)self configurationProvider];
    [v7 setBusinessConnectCallingEnabled:v6];
  }
  else
  {
    v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "BOOLValue") ^ 1);
    [(PHBusinessConnectCallingController *)self setValueInUserDefaults:v7 forKey:*MEMORY[0x1E4FADD50]];
  }
}

- (id)getBooleanFromUserDefaults:(id)a3 default:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  id v9 = (void *)[v8 initWithSuiteName:*MEMORY[0x1E4FADD48]];
  uint64_t v10 = [v9 objectForKey:v7];

  if (v10) {
    v11 = v10;
  }
  else {
    v11 = v6;
  }
  id v12 = v11;

  return v12;
}

- (void)setValueInUserDefaults:(id)a3 forKey:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  id v9 = (id)[v8 initWithSuiteName:*MEMORY[0x1E4FADD48]];
  [v9 setValue:v7 forKey:v6];
}

- (TPSCarrierBundleController)carrierBundleController
{
  return self->_carrierBundleController;
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
  objc_storeStrong((id *)&self->_carrierBundleController, 0);
}

@end