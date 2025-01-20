@interface VSAppSettingsFacade
- (BOOL)hasChannelApps;
- (BOOL)needsPresentationOfMVPDAppInstallPromptIfAvailable;
- (BOOL)needsUpdateApps;
- (BOOL)shouldShowMVPDAppInstallPrompt;
- (BOOL)shouldShowMVPDAppInstallPromptFromViewController:(id)a3;
- (Class)appsOperationClass;
- (NSArray)knownAppBundles;
- (NSArray)unredeemedVouchers;
- (NSDictionary)appSections;
- (NSOperationQueue)privateQueue;
- (UIViewController)mvpdInstallPromptPresentingViewController;
- (VSAccountChannels)accountChannels;
- (VSAccountChannelsCenter)accountChannelsCenter;
- (VSAppSettingsFacade)init;
- (VSAppSettingsFacade)initWithStorage:(id)a3 restrictionsCenter:(id)a4;
- (VSAppSettingsFacade)initWithStorage:(id)a3 restrictionsCenter:(id)a4 accountChannelsCenter:(id)a5 appsOperationClass:(Class)a6;
- (VSAppSettingsViewModel)mvpdAppSettingsViewModel;
- (VSIdentityProvider)identityProvider;
- (VSPersistentStorage)storage;
- (VSRestrictionsCenter)restrictionsCenter;
- (id)viewModelsForAppDescriptions:(id)a3 bundleByBundleID:(id)a4 vouchersForProvider:(id)a5 restrictionsCenter:(id)a6 privacyFacade:(id)a7;
- (id)viewModelsForAvailableAppDescriptions:(id)a3 subscribedAppDescriptions:(id)a4 andNonChannelAppDescriptions:(id)a5;
- (int)registrationToken;
- (void)_updateApps;
- (void)dealloc;
- (void)presentMVPDAppInstallPromptFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setAccountChannels:(id)a3;
- (void)setAccountChannelsCenter:(id)a3;
- (void)setAppSections:(id)a3;
- (void)setAppsOperationClass:(Class)a3;
- (void)setHasChannelApps:(BOOL)a3;
- (void)setIdentityProvider:(id)a3;
- (void)setKnownAppBundles:(id)a3;
- (void)setMvpdAppSettingsViewModel:(id)a3;
- (void)setMvpdInstallPromptPresentingViewController:(id)a3;
- (void)setNeedsPresentationOfMVPDAppInstallPromptIfAvailable:(BOOL)a3;
- (void)setNeedsUpdateApps;
- (void)setNeedsUpdateApps:(BOOL)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setRegistrationToken:(int)a3;
- (void)setRestrictionsCenter:(id)a3;
- (void)setStorage:(id)a3;
- (void)setUnredeemedVouchers:(id)a3;
- (void)shouldShowMVPDAppInstallPrompt;
- (void)updateDecidedApps;
@end

@implementation VSAppSettingsFacade

- (VSAppSettingsFacade)initWithStorage:(id)a3 restrictionsCenter:(id)a4 accountChannelsCenter:(id)a5 appsOperationClass:(Class)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  VSRequireMainThread();
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The storage parameter must not be nil."];
    if (v12) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The restrictionsCenter parameter must not be nil."];
LABEL_3:
  v35.receiver = self;
  v35.super_class = (Class)VSAppSettingsFacade;
  v14 = [(VSAppSettingsFacade *)&v35 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_storage, a3);
    objc_storeStrong((id *)&v15->_restrictionsCenter, a4);
    v16 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    privateQueue = v15->_privateQueue;
    v15->_privateQueue = v16;

    [(NSOperationQueue *)v15->_privateQueue setName:@"VSAppSettingsFacade"];
    [(NSOperationQueue *)v15->_privateQueue setMaxConcurrentOperationCount:1];
    objc_initWeak(&location, v15);
    v18 = MEMORY[0x263EF83A0];
    id v19 = MEMORY[0x263EF83A0];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __99__VSAppSettingsFacade_initWithStorage_restrictionsCenter_accountChannelsCenter_appsOperationClass___block_invoke;
    handler[3] = &unk_265077EC8;
    objc_copyWeak(&v33, &location);
    id v20 = v11;
    id v32 = v20;
    uint32_t v21 = notify_register_dispatch("com.apple.tcc.access.changed", &v15->_registrationToken, v18, handler);

    if (v21)
    {
      v22 = VSErrorLogObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[VSAppSettingsViewModel initWithApplicationWorkspace:](v22);
      }
    }
    v23 = [v20 privacyFacade];
    uint64_t v24 = [v23 knownAppBundles];
    knownAppBundles = v15->_knownAppBundles;
    v15->_knownAppBundles = (NSArray *)v24;

    objc_storeStrong((id *)&v15->_accountChannelsCenter, a5);
    objc_storeStrong((id *)&v15->_appsOperationClass, a6);
    v26 = [v20 voucherLockbox];
    v27 = VSMainConcurrencyBindingOptions();
    [(VSAppSettingsFacade *)v15 vs_bind:@"unredeemedVouchers" toObject:v26 withKeyPath:@"unredeemedVouchers" options:v27];

    v28 = (NSDictionary *)objc_alloc_init(NSDictionary);
    appSections = v15->_appSections;
    v15->_appSections = v28;

    [(VSAppSettingsFacade *)v15 updateDecidedApps];
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __99__VSAppSettingsFacade_initWithStorage_restrictionsCenter_accountChannelsCenter_appsOperationClass___block_invoke(uint64_t a1)
{
  v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_23F9AB000, v2, OS_LOG_TYPE_DEFAULT, "TCC access changed notification received.", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [*(id *)(a1 + 32) privacyFacade];
  v5 = [v4 knownAppBundles];
  [WeakRetained setKnownAppBundles:v5];
}

- (VSAppSettingsFacade)initWithStorage:(id)a3 restrictionsCenter:(id)a4
{
  v6 = (void *)MEMORY[0x263F1E180];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 sharedCenter];
  v10 = [(VSAppSettingsFacade *)self initWithStorage:v8 restrictionsCenter:v7 accountChannelsCenter:v9 appsOperationClass:objc_opt_class()];

  return v10;
}

- (VSAppSettingsFacade)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (void)dealloc
{
  VSRequireMainThread();
  if (notify_is_valid_token(self->_registrationToken)) {
    notify_cancel(self->_registrationToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)VSAppSettingsFacade;
  [(VSAppSettingsFacade *)&v3 dealloc];
}

- (void)updateDecidedApps
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  objc_super v3 = [(VSAppSettingsFacade *)self appSections];
  v17 = (void *)[v3 mutableCopy];

  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(VSAppSettingsFacade *)self knownAppBundles];
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * v8);
        v10 = [VSAppSettingsViewModel alloc];
        id v11 = [(VSAppSettingsFacade *)self restrictionsCenter];
        id v12 = [(VSAppSettingsFacade *)self storage];
        id v13 = [v12 privacyFacade];
        v14 = [(VSAppSettingsViewModel *)v10 initWithBundle:v9 restrictionsCenter:v11 privacyFacade:v13];

        [v4 addObject:v14];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  v15 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"displayName" ascending:1 selector:sel_localizedStandardCompare_];
  v23 = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
  [v4 sortUsingDescriptors:v16];

  [v17 setObject:v4 forKeyedSubscript:@"decided"];
  [(VSAppSettingsFacade *)self setAppSections:v17];
}

- (void)_updateApps
{
  VSRequireMainThread();
  [(VSAppSettingsFacade *)self setNeedsUpdateApps:0];
  [(VSAppSettingsFacade *)self updateDecidedApps];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__5;
  v26[4] = __Block_byref_object_dispose__5;
  id v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__5;
  v24[4] = __Block_byref_object_dispose__5;
  id v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  objc_initWeak(&location, self);
  objc_super v3 = (void *)MEMORY[0x263F086D0];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __34__VSAppSettingsFacade__updateApps__block_invoke;
  v19[3] = &unk_265077EF0;
  objc_copyWeak(&v20, &location);
  v19[4] = v22;
  v19[5] = v26;
  v19[6] = v24;
  id v4 = [v3 blockOperationWithBlock:v19];
  uint64_t v5 = [(VSAppSettingsFacade *)self identityProvider];

  if (v5)
  {
    uint64_t v6 = [(VSAppSettingsFacade *)self identityProvider];

    if (!v6) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [self identityProvider] parameter must not be nil."];
    }
    uint64_t v7 = [(VSAppSettingsFacade *)self identityProvider];
    uint64_t v8 = [(VSAppSettingsFacade *)self privateQueue];
    id v9 = objc_alloc([(VSAppSettingsFacade *)self appsOperationClass]);
    v10 = [(VSAppSettingsFacade *)self accountChannels];
    id v11 = (void *)[v9 initWithIdentityProvider:v7 accountChannels:v10];

    objc_initWeak(&from, v11);
    uint64_t v14 = MEMORY[0x263EF8330];
    objc_copyWeak(&v16, &location);
    objc_copyWeak(&v17, &from);
    id v15 = v7;
    id v12 = VSMainThreadOperationWithBlock();
    objc_msgSend(v4, "addDependency:", v12, v14, 3221225472, __34__VSAppSettingsFacade__updateApps__block_invoke_2, &unk_265077F18);
    [v8 addOperation:v11];
    [v8 addOperation:v12];
    [v12 addDependency:v11];
    [v4 addDependency:v12];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&from);
  }
  id v13 = [MEMORY[0x263F08A48] mainQueue];
  [v13 addOperation:v4];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v26, 8);
}

void __34__VSAppSettingsFacade__updateApps__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    objc_super v3 = [WeakRetained appSections];
    id v4 = [v3 objectForKeyedSubscript:@"decided"];
    [v2 setObject:v4 forKeyedSubscript:@"decided"];

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      uint64_t v5 = @"upgrade";
    }
    else {
      uint64_t v5 = @"available";
    }
    [v2 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKeyedSubscript:v5];
    [v2 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKeyedSubscript:@"subscribed"];
    [WeakRetained setAppSections:v2];
    uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"VSAppSettingsFacadeAppsDidChangeNotification" object:WeakRetained];
  }
}

void __34__VSAppSettingsFacade__updateApps__block_invoke_2(uint64_t a1)
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained((id *)(a1 + 72));
    id v4 = [WeakRetained identityProvider];

    if (v4)
    {
      v64 = v3;
      uint64_t v5 = [v3 result];
      objc_msgSend(WeakRetained, "setHasChannelApps:", objc_msgSend(v5, "hasChannelApps"));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 hasUserChannelList];
      uint64_t v6 = [WeakRetained storage];
      uint64_t v7 = [v5 nonChannelApps];
      uint64_t v8 = [v5 availableApps];
      uint64_t v9 = [v5 subscribedApps];
      v63 = v6;
      v10 = [v6 accountStore];
      id v11 = [v10 firstAccount];

      v60 = v11;
      uint64_t v12 = [v11 preferredAppID];
      id v13 = [MEMORY[0x263F1E1F0] currentDevice];
      uint64_t v14 = [v13 stringForAMSDeviceFamilies];

      id v15 = objc_alloc_init(VSNonChannelAppDecider);
      [(VSNonChannelAppDecider *)v15 setAppDescriptions:v7];
      v59 = (void *)v12;
      [(VSNonChannelAppDecider *)v15 setPreferredAppBundleOrAdamID:v12];
      v58 = (void *)v14;
      [(VSNonChannelAppDecider *)v15 setPreferredDeviceFamily:v14];
      uint64_t v16 = [(VSNonChannelAppDecider *)v15 decidedNonChannelApps];

      v61 = (void *)v9;
      v62 = (void *)v8;
      v57 = (void *)v16;
      v65 = [WeakRetained viewModelsForAvailableAppDescriptions:v8 subscribedAppDescriptions:v9 andNonChannelAppDescriptions:v16];
      id v17 = [v65 nonChannelAppViewModels];
      v18 = [MEMORY[0x263F1E150] sharedInstance];
      if ([v18 hasAccount])
      {
      }
      else
      {
        int v19 = [*(id *)(a1 + 32) isSetTopBoxSupported];

        if (v19)
        {
          long long v80 = 0u;
          long long v81 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          id v20 = v17;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v78 objects:v87 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v79;
            do
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v79 != v23) {
                  objc_enumerationMutation(v20);
                }
                [*(id *)(*((void *)&v78 + 1) + 8 * i) setForceDSIDlessInstall:1];
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v78 objects:v87 count:16];
            }
            while (v22);
          }
        }
      }
      id v25 = objc_msgSend(v17, "firstObject", v17);
      [WeakRetained setMvpdAppSettingsViewModel:v25];

      id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
      v28 = *(void **)(v27 + 40);
      *(void *)(v27 + 40) = v26;

      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      v29 = [v65 availableAppViewModels];
      uint64_t v30 = [v29 countByEnumeratingWithState:&v74 objects:v86 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v75;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v75 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = *(void **)(*((void *)&v74 + 1) + 8 * j);
            if (([v34 isDecided] & 1) == 0) {
              [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v34];
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v74 objects:v86 count:16];
        }
        while (v31);
      }

      id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v36 = *(void *)(*(void *)(a1 + 56) + 8);
      v37 = *(void **)(v36 + 40);
      *(void *)(v36 + 40) = v35;

      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      v38 = [v65 subscribedAppViewModels];
      uint64_t v39 = [v38 countByEnumeratingWithState:&v70 objects:v85 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v71;
        do
        {
          for (uint64_t k = 0; k != v40; ++k)
          {
            if (*(void *)v71 != v41) {
              objc_enumerationMutation(v38);
            }
            v43 = *(void **)(*((void *)&v70 + 1) + 8 * k);
            if (([v43 isDecided] & 1) == 0) {
              [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v43];
            }
          }
          uint64_t v40 = [v38 countByEnumeratingWithState:&v70 objects:v85 count:16];
        }
        while (v40);
      }

      v44 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"displayName" ascending:1 selector:sel_localizedStandardCompare_];
      v45 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v84 = v44;
      v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v84 count:1];
      [v45 sortUsingDescriptors:v46];

      v47 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      v83 = v44;
      v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v83 count:1];
      [v47 sortUsingDescriptors:v48];

      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v49 = v56;
      uint64_t v50 = [v49 countByEnumeratingWithState:&v66 objects:v82 count:16];
      if (v50)
      {
        uint64_t v51 = v50;
        uint64_t v52 = *(void *)v67;
        do
        {
          for (uint64_t m = 0; m != v51; ++m)
          {
            if (*(void *)v67 != v52) {
              objc_enumerationMutation(v49);
            }
            v54 = *(void **)(*((void *)&v66 + 1) + 8 * m);
            if (([v54 isDecided] & 1) == 0)
            {
              if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
                uint64_t v55 = *(void *)(a1 + 56);
              }
              else {
                uint64_t v55 = *(void *)(a1 + 48);
              }
              [*(id *)(*(void *)(v55 + 8) + 40) insertObject:v54 atIndex:0];
            }
          }
          uint64_t v51 = [v49 countByEnumeratingWithState:&v66 objects:v82 count:16];
        }
        while (v51);
      }
    }
    else
    {
    }
  }
}

- (id)viewModelsForAvailableAppDescriptions:(id)a3 subscribedAppDescriptions:(id)a4 andNonChannelAppDescriptions:(id)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v42 = a3;
  id v41 = a4;
  id v40 = a5;
  uint64_t v8 = objc_alloc_init(VSAppSettingsViewModelResult);
  v38 = [(VSAppSettingsFacade *)self restrictionsCenter];
  v37 = [(VSAppSettingsFacade *)self storage];
  uint64_t v36 = [v37 privacyFacade];
  uint64_t v9 = [(VSAppSettingsFacade *)self identityProvider];

  if (!v9) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [self identityProvider] parameter must not be nil."];
  }
  uint64_t v39 = v8;
  v10 = [(VSAppSettingsFacade *)self identityProvider];
  id v11 = [v10 providerID];
  uint64_t v12 = [v11 forceUnwrapObject];

  id v13 = [(VSAppSettingsFacade *)self unredeemedVouchers];
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v21 = [v20 providerID];
        int v22 = [v21 isEqualToString:v12];

        if (v22) {
          [v14 addObject:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v17);
  }

  id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v35 = self;
  uint64_t v24 = [(VSAppSettingsFacade *)self knownAppBundles];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v44 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v43 + 1) + 8 * j);
        uint64_t v30 = [v29 bundleIdentifier];
        if (v30) {
          [v23 setObject:v29 forKey:v30];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v26);
  }

  uint64_t v31 = [(VSAppSettingsFacade *)v35 viewModelsForAppDescriptions:v40 bundleByBundleID:v23 vouchersForProvider:v14 restrictionsCenter:v38 privacyFacade:v36];
  uint64_t v32 = [(VSAppSettingsFacade *)v35 viewModelsForAppDescriptions:v42 bundleByBundleID:v23 vouchersForProvider:v14 restrictionsCenter:v38 privacyFacade:v36];
  id v33 = [(VSAppSettingsFacade *)v35 viewModelsForAppDescriptions:v41 bundleByBundleID:v23 vouchersForProvider:v14 restrictionsCenter:v38 privacyFacade:v36];
  [(VSAppSettingsViewModelResult *)v39 setNonChannelAppViewModels:v31];
  [(VSAppSettingsViewModelResult *)v39 setSubscribedAppViewModels:v33];
  [(VSAppSettingsViewModelResult *)v39 setAvailableAppViewModels:v32];

  return v39;
}

- (id)viewModelsForAppDescriptions:(id)a3 bundleByBundleID:(id)a4 vouchersForProvider:(id)a5 restrictionsCenter:(id)a6 privacyFacade:(id)a7
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v40 = a5;
  id v45 = a6;
  id v13 = a7;
  id v44 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v11;
  uint64_t v47 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v53;
    id v38 = v13;
    id v39 = v12;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v53 != v46) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v16 = [v15 bundleID];
        if (v16)
        {
          uint64_t v17 = [v12 objectForKey:v16];
          if (v17)
          {
            uint64_t v18 = [VSAppSettingsViewModel alloc];
            uint64_t v19 = i;
            id v20 = v17;
            [v15 adamID];
            v22 = uint64_t v21 = v16;
            id v23 = [v22 stringValue];
            uint64_t v24 = [(VSAppSettingsViewModel *)v18 initWithBundle:v20 restrictionsCenter:v45 privacyFacade:v13 adamID:v23];

            uint64_t i = v19;
            uint64_t v16 = v21;
            [v44 addObject:v24];
            [v12 removeObjectForKey:v21];
          }
          else
          {
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            id v25 = v40;
            uint64_t v24 = (VSAppSettingsViewModel *)[v25 countByEnumeratingWithState:&v48 objects:v56 count:16];
            if (v24)
            {
              id v41 = v16;
              uint64_t v42 = i;
              uint64_t v26 = *(void *)v49;
              while (2)
              {
                for (uint64_t j = 0; j != v24; uint64_t j = (VSAppSettingsViewModel *)((char *)j + 1))
                {
                  if (*(void *)v49 != v26) {
                    objc_enumerationMutation(v25);
                  }
                  v28 = *(void **)(*((void *)&v48 + 1) + 8 * (void)j);
                  v29 = [v15 adamID];
                  uint64_t v30 = [v29 stringValue];

                  if (v30)
                  {
                    id v31 = v30;
                    uint64_t v32 = [v28 appAdamID];
                    char v33 = [v32 isEqualToString:v31];

                    if (v33)
                    {
                      uint64_t v24 = v28;

                      goto LABEL_21;
                    }
                  }
                }
                uint64_t v24 = (VSAppSettingsViewModel *)[v25 countByEnumeratingWithState:&v48 objects:v56 count:16];
                if (v24) {
                  continue;
                }
                break;
              }
LABEL_21:
              id v13 = v38;
              id v12 = v39;
              id v34 = v45;
              uint64_t v16 = v41;
              uint64_t i = v42;
              uint64_t v17 = 0;
            }
            else
            {
              id v34 = v45;
            }

            id v35 = [[VSAppSettingsViewModel alloc] initWithAppDescription:v15 privacyVoucher:v24 restrictionsCenter:v34 privacyFacade:v13];
            [v44 addObject:v35];
          }
        }
      }
      uint64_t v47 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v47);
  }

  uint64_t v36 = (void *)[v44 copy];
  return v36;
}

- (void)setNeedsUpdateApps
{
  VSRequireMainThread();
  if (![(VSAppSettingsFacade *)self needsUpdateApps])
  {
    [(VSAppSettingsFacade *)self setNeedsUpdateApps:1];
    objc_initWeak(&location, self);
    id v3 = [(VSAppSettingsFacade *)self accountChannelsCenter];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __41__VSAppSettingsFacade_setNeedsUpdateApps__block_invoke;
    v4[3] = &unk_265077E20;
    objc_copyWeak(&v5, &location);
    [v3 fetchAccountChannelsWithCompletionHandler:v4];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __41__VSAppSettingsFacade_setNeedsUpdateApps__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__VSAppSettingsFacade_setNeedsUpdateApps__block_invoke_2;
  v5[3] = &unk_265076DA0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __41__VSAppSettingsFacade_setNeedsUpdateApps__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setAccountChannels:*(void *)(a1 + 32)];
    [v3 _updateApps];
    id WeakRetained = v3;
  }
}

- (void)setKnownAppBundles:(id)a3
{
  id v7 = (NSArray *)a3;
  VSRequireMainThread();
  id v4 = v7;
  if (self->_knownAppBundles != v7)
  {
    id v5 = (NSArray *)[(NSArray *)v7 copy];
    knownAppBundles = self->_knownAppBundles;
    self->_knownAppBundles = v5;

    [(VSAppSettingsFacade *)self setNeedsUpdateApps];
    id v4 = v7;
  }
}

- (void)setUnredeemedVouchers:(id)a3
{
  id v7 = (NSArray *)a3;
  VSRequireMainThread();
  id v4 = v7;
  if (self->_unredeemedVouchers != v7)
  {
    id v5 = (NSArray *)[(NSArray *)v7 copy];
    unredeemedVouchers = self->_unredeemedVouchers;
    self->_unredeemedVouchers = v5;

    [(VSAppSettingsFacade *)self setNeedsUpdateApps];
    id v4 = v7;
  }
}

- (void)setIdentityProvider:(id)a3
{
  id v5 = (VSIdentityProvider *)a3;
  VSRequireMainThread();
  if (self->_identityProvider != v5)
  {
    objc_storeStrong((id *)&self->_identityProvider, a3);
    [(VSAppSettingsFacade *)self setNeedsUpdateApps];
  }
}

- (BOOL)shouldShowMVPDAppInstallPromptFromViewController:(id)a3
{
  [(VSAppSettingsFacade *)self setMvpdInstallPromptPresentingViewController:a3];
  return [(VSAppSettingsFacade *)self shouldShowMVPDAppInstallPrompt];
}

- (BOOL)shouldShowMVPDAppInstallPrompt
{
  id v3 = [(VSAppSettingsFacade *)self mvpdAppSettingsViewModel];
  id v4 = [v3 bundleID];

  if (v4)
  {
    id v5 = [(VSAppSettingsFacade *)self identityProvider];
    char v6 = [v5 isSetTopBoxSupported];

    id v7 = v4;
    id v14 = 0;
    uint64_t v8 = [MEMORY[0x263F01890] bundleRecordWithBundleIdentifier:v7 allowPlaceholder:0 error:&v14];
    id v9 = v14;
    v10 = v9;
    BOOL v11 = 0;
    if (!v8)
    {
      if (v9)
      {
        id v12 = VSErrorLogObject();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          [(VSAppSettingsFacade *)(uint64_t)v7 shouldShowMVPDAppInstallPrompt];
        }
      }
      BOOL v11 = v6;
    }
  }
  else
  {
    [(VSAppSettingsFacade *)self setNeedsPresentationOfMVPDAppInstallPromptIfAvailable:1];
    BOOL v11 = 0;
  }

  return v11;
}

- (void)presentMVPDAppInstallPromptFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = [(VSAppSettingsFacade *)self mvpdAppSettingsViewModel];
  BOOL v11 = v10;
  if (v10)
  {
    id v12 = v10;
    id v13 = [v12 name];
    uint64_t v14 = [v13 copy];

    id v41 = self;
    id v15 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    uint64_t v16 = [v15 localizedStringForKey:@"INSTALL_APP_TITLE_PROMPT_FORMAT" value:0 table:0];

    BOOL v40 = v6;
    v37 = (void *)v16;
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", v16, v14);
    uint64_t v18 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    uint64_t v19 = [v18 localizedStringForKey:@"INSTALL_APP_TITLE_FORMAT" value:0 table:0];

    id v35 = (void *)v19;
    uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", v19, v14);
    uint64_t v21 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    uint64_t v22 = [v21 localizedStringForKey:@"INSTALL_APP_MESSAGE_FORMAT" value:0 table:0];

    id v38 = (void *)v14;
    char v33 = (void *)v22;
    uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", v22, v14);
    id v34 = (void *)v20;
    id v23 = [NSString stringWithFormat:@"%@\n%@", v20, v32];
    id v39 = v12;
    uint64_t v24 = [v12 adamID];
    id v25 = [MEMORY[0x263F25378] tvProviderLockupRequestWithAdamID:v24];
    uint64_t v36 = (void *)v17;
    uint64_t v26 = [MEMORY[0x263F84780] ascAppInstallerViewControllerWithTitle:v17 subtitle:v23 request:v25 forceDSIDlessInstall:1 onFlowCompletion:0];
    [v26 setModalPresentationStyle:2];
    uint64_t v27 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v26];
    [v27 view];
    v29 = v28 = v8;
    [MEMORY[0x263F1C550] systemBackgroundColor];
    v31 = id v30 = v9;
    [v29 setBackgroundColor:v31];

    id v9 = v30;
    [v27 setModalPresentationStyle:2];
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = __Block_byref_object_copy__112;
    v43[4] = __Block_byref_object_dispose__113;
    id v44 = (id)MEMORY[0x2455D84D0](v30);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __89__VSAppSettingsFacade_presentMVPDAppInstallPromptFromViewController_animated_completion___block_invoke;
    v42[3] = &unk_265077F40;
    v42[5] = v43;
    id v8 = v28;
    v42[4] = v41;
    [v28 presentViewController:v27 animated:v40 completion:v42];
    _Block_object_dispose(v43, 8);
  }
}

uint64_t __89__VSAppSettingsFacade_presentMVPDAppInstallPromptFromViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2) {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  }
  [*(id *)(a1 + 32) setNeedsPresentationOfMVPDAppInstallPromptIfAvailable:0];
  id v3 = *(void **)(a1 + 32);
  return [v3 setMvpdInstallPromptPresentingViewController:0];
}

- (void)setMvpdAppSettingsViewModel:(id)a3
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_mvpdAppSettingsViewModel, a3);
  if (v10)
  {
    if ([(VSAppSettingsFacade *)self needsPresentationOfMVPDAppInstallPromptIfAvailable])
    {
      uint64_t v5 = [(VSAppSettingsFacade *)self mvpdInstallPromptPresentingViewController];
      if (v5)
      {
        BOOL v6 = (void *)v5;
        BOOL v7 = [(VSAppSettingsFacade *)self shouldShowMVPDAppInstallPrompt];

        if (v7)
        {
          id v8 = [(VSAppSettingsFacade *)self mvpdInstallPromptPresentingViewController];

          if (!v8) {
            [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [self mvpdInstallPromptPresentingViewController] parameter must not be nil."];
          }
          id v9 = [(VSAppSettingsFacade *)self mvpdInstallPromptPresentingViewController];
          [(VSAppSettingsFacade *)self presentMVPDAppInstallPromptFromViewController:v9 animated:1 completion:0];
        }
      }
    }
  }
}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (NSDictionary)appSections
{
  return self->_appSections;
}

- (void)setAppSections:(id)a3
{
}

- (BOOL)hasChannelApps
{
  return self->_hasChannelApps;
}

- (void)setHasChannelApps:(BOOL)a3
{
  self->_hasChannelApps = a3;
}

- (VSAccountChannelsCenter)accountChannelsCenter
{
  return self->_accountChannelsCenter;
}

- (void)setAccountChannelsCenter:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (VSPersistentStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (VSRestrictionsCenter)restrictionsCenter
{
  return self->_restrictionsCenter;
}

- (void)setRestrictionsCenter:(id)a3
{
}

- (VSAccountChannels)accountChannels
{
  return self->_accountChannels;
}

- (void)setAccountChannels:(id)a3
{
}

- (NSArray)knownAppBundles
{
  return self->_knownAppBundles;
}

- (NSArray)unredeemedVouchers
{
  return self->_unredeemedVouchers;
}

- (BOOL)needsUpdateApps
{
  return self->_needsUpdateApps;
}

- (void)setNeedsUpdateApps:(BOOL)a3
{
  self->_needsUpdateApps = a3;
}

- (int)registrationToken
{
  return self->_registrationToken;
}

- (void)setRegistrationToken:(int)a3
{
  self->_registrationToken = a3;
}

- (VSAppSettingsViewModel)mvpdAppSettingsViewModel
{
  return self->_mvpdAppSettingsViewModel;
}

- (BOOL)needsPresentationOfMVPDAppInstallPromptIfAvailable
{
  return self->_needsPresentationOfMVPDAppInstallPromptIfAvailable;
}

- (void)setNeedsPresentationOfMVPDAppInstallPromptIfAvailable:(BOOL)a3
{
  self->_needsPresentationOfMVPDAppInstallPromptIfAvailable = a3;
}

- (UIViewController)mvpdInstallPromptPresentingViewController
{
  return self->_mvpdInstallPromptPresentingViewController;
}

- (void)setMvpdInstallPromptPresentingViewController:(id)a3
{
}

- (Class)appsOperationClass
{
  return self->_appsOperationClass;
}

- (void)setAppsOperationClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsOperationClass, 0);
  objc_storeStrong((id *)&self->_mvpdInstallPromptPresentingViewController, 0);
  objc_storeStrong((id *)&self->_mvpdAppSettingsViewModel, 0);
  objc_storeStrong((id *)&self->_unredeemedVouchers, 0);
  objc_storeStrong((id *)&self->_knownAppBundles, 0);
  objc_storeStrong((id *)&self->_accountChannels, 0);
  objc_storeStrong((id *)&self->_restrictionsCenter, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_accountChannelsCenter, 0);
  objc_storeStrong((id *)&self->_appSections, 0);
  objc_storeStrong((id *)&self->_identityProvider, 0);
}

- (void)shouldShowMVPDAppInstallPrompt
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_23F9AB000, a3, OS_LOG_TYPE_ERROR, "shouldShowMVPDAppInstallPrompt - Error finding bundle record for bundleID %@ : %@", (uint8_t *)&v6, 0x16u);
}

@end