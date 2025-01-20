@interface PHSilenceJunkCallingController
- (BOOL)hasSpamEnabledSim;
- (BOOL)supportsCallBlockingForSubscriptionContext:(id)a3;
- (CoreTelephonyClient)ctClient;
- (NSArray)specifiers;
- (PHCallBlockingServiceProviderController)serviceProviderController;
- (PHSilenceJunkCallingController)initWithCoreTelephonyClient:(id)a3 queue:(id)a4;
- (TPSCarrierBundleController)carrierBundleController;
- (TUConfigurationProvider)configurationProvider;
- (TUFeatureFlags)featureFlags;
- (id)getSilenceJunkCallingEnabled:(id)a3;
- (id)informationalUrlForSubscriptionContext:(id)a3;
- (id)objectForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5;
- (id)specifiers:(BOOL)a3;
- (id)stringForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5;
- (void)setHasSpamEnabledSim:(BOOL)a3;
- (void)setSilenceJunkCallingEnabled:(id)a3 specifier:(id)a4;
- (void)setSpecifiers:(id)a3;
@end

@implementation PHSilenceJunkCallingController

- (PHSilenceJunkCallingController)initWithCoreTelephonyClient:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PHSilenceJunkCallingController;
  v9 = [(PHSilenceJunkCallingController *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ctClient, a3);
    v11 = (TUFeatureFlags *)objc_alloc_init(MEMORY[0x1E4FADBD0]);
    featureFlags = v10->_featureFlags;
    v10->_featureFlags = v11;

    v13 = (TUConfigurationProvider *)objc_alloc_init(MEMORY[0x1E4FADAF8]);
    configurationProvider = v10->_configurationProvider;
    v10->_configurationProvider = v13;

    v15 = objc_alloc_init(PHCallBlockingServiceProviderController);
    serviceProviderController = v10->_serviceProviderController;
    v10->_serviceProviderController = v15;

    v17 = objc_alloc_init(TPSCarrierBundleController);
    carrierBundleController = v10->_carrierBundleController;
    v10->_carrierBundleController = v17;

    [(TPSController *)v10->_carrierBundleController addDelegate:v10 queue:v8];
  }

  return v10;
}

- (id)specifiers:(BOOL)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  p_specifiers = &self->_specifiers;
  specifiers = self->_specifiers;
  if (specifiers)
  {
    v5 = specifiers;
    goto LABEL_48;
  }
  BOOL v6 = a3;
  v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = [(PHSilenceJunkCallingController *)self serviceProviderController];
  v9 = [v8 serviceProviders];
  uint64_t v10 = [v9 count];

  v11 = [(PHSilenceJunkCallingController *)self serviceProviderController];
  v12 = [v11 serviceProvidersSupportingSpamBlocking];

  v13 = TPSLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v95 = v12;
    __int16 v96 = 2048;
    uint64_t v97 = v10;
    _os_log_impl(&dword_1E4DD4000, v13, OS_LOG_TYPE_DEFAULT, "addSpamBlockingSpecifiersIfNecessary service providers %@ allServiceProviderCount=%ld", buf, 0x16u);
  }

  if (![v12 count] || !objc_msgSend(MEMORY[0x1E4FADA88], "supportsPrimaryCalling")) {
    goto LABEL_47;
  }
  v14 = (void *)MEMORY[0x1E4F92E70];
  if (v6)
  {
    v15 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"SpamEnabledSettingsGroup"];
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"SPAM_SIMS_LIST_HEADER" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
    v15 = [v14 groupSpecifierWithID:@"SpamEnabledSettingsGroup" name:v17];
  }
  v80 = v12;
  v81 = v15;
  if (v10 == 2)
  {
    uint64_t v18 = [v12 count];
    v19 = [v12 firstObject];
    objc_super v20 = [v19 localizedName];
    if (v18 == 2)
    {
      v21 = [v12 lastObject];
      v22 = [v21 localizedName];
      v23 = v12;
      int v24 = [v20 isEqualToString:v22];

      v25 = NSString;
      v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      objc_super v20 = v26;
      if (v24)
      {
        v27 = [v26 localizedStringForKey:@"SPAM_SIMS_EXTENSIONS_LIST_FOOTER_%@" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
        v28 = [v23 firstObject];
        v29 = [v28 localizedName];
        v30 = objc_msgSend(v25, "stringWithFormat:", v27, v29);
      }
      else
      {
        v27 = [v26 localizedStringForKey:@"SPAM_SIMS_EXTENSIONS_LIST_FOOTER_%@_%@_DS_BOTH" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
        v28 = [v23 firstObject];
        v29 = [v28 localizedName];
        [v23 lastObject];
        v35 = v34 = p_specifiers;
        v36 = [v35 localizedName];
        v30 = objc_msgSend(v25, "stringWithFormat:", v27, v29, v36);

        p_specifiers = v34;
      }

      v15 = v81;
    }
    else
    {

      v33 = NSString;
      v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v28 = [v27 localizedStringForKey:@"SPAM_SIMS_EXTENSIONS_LIST_FOOTER_%@_%@_DS_SINGLE" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
      v30 = objc_msgSend(v33, "stringWithFormat:", v28, v20, v20);
    }
  }
  else
  {
    v31 = NSString;
    objc_super v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v27 = [v20 localizedStringForKey:@"SPAM_SIMS_EXTENSIONS_LIST_FOOTER_%@" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
    v28 = [v12 firstObject];
    v32 = [v28 localizedName];
    v30 = objc_msgSend(v31, "stringWithFormat:", v27, v32);
  }
  [v15 setProperty:v30 forKey:*MEMORY[0x1E4F93170]];
  [(NSArray *)v5 addObject:v15];
  v37 = (void *)MEMORY[0x1E4F92E70];
  v38 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v39 = [v38 localizedStringForKey:@"SPAM_TOGGLE_TITLE" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
  uint64_t v40 = [v37 preferenceSpecifierNamed:v39 target:self set:sel_setSilenceJunkCallingEnabled_specifier_ get:sel_getSilenceJunkCallingEnabled_ detail:0 cell:6 edit:0];

  v79 = (void *)v40;
  [(NSArray *)v5 addObject:v40];
  [(PHSilenceJunkCallingController *)self setHasSpamEnabledSim:1];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  v41 = [(PHSilenceJunkCallingController *)self carrierBundleController];
  v42 = [v41 activeSubscriptions];

  uint64_t v88 = [v42 countByEnumeratingWithState:&v89 objects:v93 count:16];
  if (!v88)
  {
    v44 = 0;
    v43 = v42;
    v74 = v79;
    v12 = v80;
    goto LABEL_45;
  }
  v76 = v30;
  v77 = p_specifiers;
  v78 = v5;
  v43 = 0;
  v44 = 0;
  uint64_t v87 = *(void *)v90;
  uint64_t v85 = *MEMORY[0x1E4F93160];
  uint64_t v84 = *MEMORY[0x1E4F93150];
  uint64_t v82 = *MEMORY[0x1E4F93168];
  uint64_t v83 = *MEMORY[0x1E4F93140];
  v86 = v42;
  do
  {
    for (uint64_t i = 0; i != v88; ++i)
    {
      if (*(void *)v90 != v87) {
        objc_enumerationMutation(v42);
      }
      uint64_t v46 = *(void *)(*((void *)&v89 + 1) + 8 * i);
      v47 = [(PHSilenceJunkCallingController *)self carrierBundleController];
      v48 = [v47 localizedCarrierNameForSubscriptionContext:v46];

      v49 = [(PHSilenceJunkCallingController *)self informationalUrlForSubscriptionContext:v46];
      if ([(PHSilenceJunkCallingController *)self supportsCallBlockingForSubscriptionContext:v46])
      {
        BOOL v50 = v49 == 0;
      }
      else
      {
        BOOL v50 = 1;
      }
      if (!v50)
      {
        if (v44)
        {
          if (v43) {
            goto LABEL_32;
          }
          v51 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"SpamEnabledSettingsGroupSecondary" name:&stru_1F40BEF98];
          v52 = NSString;
          v53 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v54 = [v53 localizedStringForKey:@"SPAM_SIMS_EXTENSIONS_MORE_INFORMATION_%@" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
          v55 = objc_msgSend(v52, "stringWithFormat:", v54, v48);

          v43 = v51;
          [v51 setProperty:v55 forKey:v85];
          v100.location = [v55 rangeOfString:v55];
          v56 = NSStringFromRange(v100);
          [v51 setProperty:v56 forKey:v84];

          v57 = (objc_class *)objc_opt_class();
          v58 = NSStringFromClass(v57);
          [v51 setProperty:v58 forKey:v83];

          v59 = [MEMORY[0x1E4F1CB10] URLWithString:v49];
          v60 = v51;
        }
        else
        {
          v44 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"SpamEnabledSettingsGroupPrimary" name:&stru_1F40BEF98];
          v61 = NSString;
          [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v63 = v62 = v43;
          v64 = [v63 localizedStringForKey:@"SPAM_SIMS_EXTENSIONS_MORE_INFORMATION_%@" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
          v55 = objc_msgSend(v61, "stringWithFormat:", v64, v48);

          v43 = v62;
          [v44 setProperty:v55 forKey:v85];
          v101.location = [v55 rangeOfString:v55];
          v65 = NSStringFromRange(v101);
          [v44 setProperty:v65 forKey:v84];

          v66 = (objc_class *)objc_opt_class();
          v67 = NSStringFromClass(v66);
          [v44 setProperty:v67 forKey:v83];

          v59 = [MEMORY[0x1E4F1CB10] URLWithString:v49];
          v60 = v44;
        }
        [v60 setProperty:v59 forKey:v82];

        v42 = v86;
      }
LABEL_32:
    }
    uint64_t v88 = [v42 countByEnumeratingWithState:&v89 objects:v93 count:16];
  }
  while (v88);

  if (!v44 || !v43)
  {
    p_specifiers = v77;
    v5 = v78;
    v12 = v80;
    if (v44)
    {
      [(NSArray *)v78 addObject:v44];
      v74 = v79;
      if (v43) {
        goto LABEL_43;
      }
    }
    else
    {
      v74 = v79;
      if (v43) {
        goto LABEL_43;
      }
      v44 = 0;
    }
    v30 = v76;
    goto LABEL_46;
  }
  v12 = v80;
  v68 = [v80 firstObject];
  v69 = [v68 localizedName];
  [v80 lastObject];
  v71 = v70 = v43;
  v72 = [v71 localizedName];
  char v73 = [v69 isEqualToString:v72];

  v43 = v70;
  v5 = v78;
  [(NSArray *)v78 addObject:v44];
  p_specifiers = v77;
  v74 = v79;
  if ((v73 & 1) == 0) {
LABEL_43:
  }
    [(NSArray *)v5 addObject:v43];
  v30 = v76;
LABEL_45:

LABEL_46:
LABEL_47:
  objc_storeStrong((id *)p_specifiers, v5);

LABEL_48:
  return v5;
}

- (id)getSilenceJunkCallingEnabled:(id)a3
{
  v4 = [(PHSilenceJunkCallingController *)self featureFlags];
  int v5 = [v4 deviceExpertMigrationEnabled];

  if (v5)
  {
    BOOL v6 = NSNumber;
    id v7 = [(PHSilenceJunkCallingController *)self configurationProvider];
    uint64_t v8 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "isSilenceJunkCallingEnabled"));
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4FADA80] acceptableJunkConfidence];
    id v10 = objc_alloc(MEMORY[0x1E4F1CB18]);
    v11 = (void *)[v10 initWithSuiteName:*MEMORY[0x1E4FADD48]];
    id v7 = [v11 objectForKey:*MEMORY[0x1E4FADDF8]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = [v7 integerValue];
    }
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(MEMORY[0x1E4FADA80], "isJunkConfidenceLevelJunk:", v9) ^ 1);
  }
  v12 = (void *)v8;

  return v12;
}

- (void)setSilenceJunkCallingEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = TPSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_1E4DD4000, v6, OS_LOG_TYPE_DEFAULT, "User toggled silence junk calling enabled switch to %@", (uint8_t *)&v13, 0xCu);
  }

  id v7 = [(PHSilenceJunkCallingController *)self featureFlags];
  int v8 = [v7 deviceExpertMigrationEnabled];

  if (v8)
  {
    uint64_t v9 = [v5 BOOLValue];
    id v10 = [(PHSilenceJunkCallingController *)self configurationProvider];
    [v10 setSilenceJunkCallingEnabled:v9];
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1CB18]);
    id v10 = (void *)[v11 initWithSuiteName:*MEMORY[0x1E4FADD48]];
    if ([v5 integerValue]) {
      uint64_t v12 = [MEMORY[0x1E4FADA80] acceptableJunkConfidence];
    }
    else {
      uint64_t v12 = [MEMORY[0x1E4FADA80] maxJunkConfidence];
    }
    [v10 setInteger:v12 forKey:*MEMORY[0x1E4FADDF8]];
  }
}

- (id)objectForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5
{
  int v8 = (objc_class *)MEMORY[0x1E4F23938];
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[[v8 alloc] initWithBundleType:1];
  uint64_t v12 = [(PHSilenceJunkCallingController *)self carrierBundleController];
  int v13 = [v12 telephonyClient];
  id v14 = (void *)[v13 copyCarrierBundleValue:v9 keyHierarchy:v10 bundleType:v11 error:a5];

  return v14;
}

- (id)stringForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5
{
  id v5 = [(PHSilenceJunkCallingController *)self objectForKeyHierarchy:a3 subscriptionContext:a4 error:a5];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)supportsCallBlockingForSubscriptionContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v12 = 0;
  id v5 = [(PHSilenceJunkCallingController *)self stringForKeyHierarchy:&unk_1F40C9370 subscriptionContext:v4 error:&v12];
  id v6 = v12;
  id v7 = v6;
  if (v5)
  {
    int v8 = TPSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v4;
      id v9 = "Retrieved call blocking value '%@' for subscription %@";
LABEL_7:
      _os_log_impl(&dword_1E4DD4000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0x16u);
    }
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    int v8 = TPSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v7;
      id v9 = "Retrieving call blocking value for subscription %@ failed with error %@";
      goto LABEL_7;
    }
  }

LABEL_9:
  if ([v5 isEqualToIgnoringCase:@"Enabled"]) {
    char v10 = 1;
  }
  else {
    char v10 = [v5 isEqualToIgnoringCase:@"Dynamic"];
  }

  return v10;
}

- (id)informationalUrlForSubscriptionContext:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v11 = 0;
  id v5 = [(PHSilenceJunkCallingController *)self stringForKeyHierarchy:&unk_1F40C9388 subscriptionContext:v4 error:&v11];
  id v6 = v11;
  id v7 = v6;
  if (v5)
  {
    int v8 = TPSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v4;
      id v9 = "Retrieved informational url value '%@' for subscription %@";
LABEL_7:
      _os_log_impl(&dword_1E4DD4000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0x16u);
    }
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    int v8 = TPSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      id v15 = v7;
      id v9 = "Retrieving informational url value for subscription %@ failed with error %@";
      goto LABEL_7;
    }
  }

LABEL_9:
  return v5;
}

- (BOOL)hasSpamEnabledSim
{
  return self->_hasSpamEnabledSim;
}

- (void)setHasSpamEnabledSim:(BOOL)a3
{
  self->_hasSpamEnabledSim = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (TUConfigurationProvider)configurationProvider
{
  return self->_configurationProvider;
}

- (CoreTelephonyClient)ctClient
{
  return self->_ctClient;
}

- (PHCallBlockingServiceProviderController)serviceProviderController
{
  return self->_serviceProviderController;
}

- (TPSCarrierBundleController)carrierBundleController
{
  return self->_carrierBundleController;
}

- (NSArray)specifiers
{
  return self->_specifiers;
}

- (void)setSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_storeStrong((id *)&self->_carrierBundleController, 0);
  objc_storeStrong((id *)&self->_serviceProviderController, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_configurationProvider, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
}

@end