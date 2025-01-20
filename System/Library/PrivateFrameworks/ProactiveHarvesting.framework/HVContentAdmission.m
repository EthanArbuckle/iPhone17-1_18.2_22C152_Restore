@interface HVContentAdmission
+ (BOOL)shouldAdmitContentFromBundleIdentifier:(id)a3;
+ (BOOL)suggestionsShouldShowPastEvents;
+ (id)sharedInstance;
+ (void)addContentAdmissionObserver:(id)a3;
+ (void)clearTestSettings;
+ (void)disableBundleIdentifier:(id)a3;
+ (void)initialize;
+ (void)migrateForTests;
+ (void)registerConfigurationAsset:(id)a3;
+ (void)updateConfigurableBundleIdentifierDenyList:(id)a3;
- (HVContentAdmission)init;
- (uint64_t)_refreshPastEventsSetting;
- (uint64_t)_shouldAdmitContentFromBundleIdentifier:(uint64_t)a1;
- (void)_disableBundleIdentifier:(uint64_t)a1;
- (void)_migrateIfNeededWithCompletion:(uint64_t)a1;
- (void)_refreshBundleIdentifierDenyListsWithLearnFromDenyList:(void *)a3 configurableDenyList:;
- (void)_refreshDisabledBundleIds;
@end

@implementation HVContentAdmission

uint64_t __54__HVContentAdmission__suggestionsShouldShowPastEvents__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 40);
  return result;
}

+ (BOOL)suggestionsShouldShowPastEvents
{
  uint64_t v2 = +[HVContentAdmission sharedInstance]();
  v3 = (void *)v2;
  if (v2)
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    v4 = *(void **)(v2 + 8);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __54__HVContentAdmission__suggestionsShouldShowPastEvents__block_invoke;
    v7[3] = &unk_2647D4E20;
    v7[4] = &v8;
    [v4 runWithLockAcquired:v7];
    BOOL v5 = *((unsigned char *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)sharedInstance
{
  self;
  if (sharedInstance__pasOnceToken3 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken3, &__block_literal_global_342);
  }
  v0 = (void *)sharedInstance__pasExprOnceResult;

  return v0;
}

void __62__HVContentAdmission__shouldAdmitContentFromBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v4 = a2;
  if ([v4[1] containsObject:*(void *)(a1 + 32)]) {
    char v3 = 0;
  }
  else {
    char v3 = [v4[2] containsObject:*(void *)(a1 + 32)] ^ 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

+ (BOOL)shouldAdmitContentFromBundleIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = +[HVContentAdmission sharedInstance]();
    v7 = (void *)v6;
    uint64_t v8 = v5;
  }
  else
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"HVContentAdmission.m", 306, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    uint64_t v6 = +[HVContentAdmission sharedInstance]();
    v7 = (void *)v6;
    uint64_t v8 = 0;
  }
  int v9 = -[HVContentAdmission _shouldAdmitContentFromBundleIdentifier:](v6, v8);

  uint64_t v10 = hv_default_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    char v11 = @"Blocking";
    if (v9) {
      char v11 = @"Admitting";
    }
    *(_DWORD *)buf = 138412546;
    v15 = v11;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_226C41000, v10, OS_LOG_TYPE_INFO, "HVContentAdmission: %@ content from bundleIdentifier: %@", buf, 0x16u);
  }

  return v9;
}

- (uint64_t)_shouldAdmitContentFromBundleIdentifier:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    uint64_t v10 = 0;
    char v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    id v5 = *(void **)(a1 + 8);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__HVContentAdmission__shouldAdmitContentFromBundleIdentifier___block_invoke;
    v7[3] = &unk_2647D4DF8;
    int v9 = &v10;
    id v8 = v3;
    [v5 runWithLockAcquired:v7];
    a1 = *((unsigned char *)v11 + 24) != 0;

    _Block_object_dispose(&v10, 8);
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pastEventsObserver, 0);
  objc_storeStrong((id *)&self->_kvoObserver, 0);
  objc_storeStrong((id *)&self->_defaults, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

- (HVContentAdmission)init
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)HVContentAdmission;
  uint64_t v2 = [(HVContentAdmission *)&v29 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:5 capacity:1];
    id v5 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = v4;

    uint64_t v6 = objc_opt_new();
    v7 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = v6;

    uint64_t v8 = objc_opt_new();
    int v9 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v8;

    *(unsigned char *)(v3 + 40) = 0;
    uint64_t v10 = [objc_alloc(MEMORY[0x263F61E70]) initWithGuardedData:v3];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.suggestions"];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v12;

    if (v2->_defaults)
    {
      *(void *)location = 0;
      objc_initWeak((id *)location, v2);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __26__HVContentAdmission_init__block_invoke;
      v27[3] = &unk_2647D56C8;
      objc_copyWeak(&v28, (id *)location);
      v14 = (void *)MEMORY[0x22A6669E0](v27);
      uint64_t v15 = +[HVContentAdmissionKVOObserver observeObject:v2->_defaults key:@"SiriCanLearnFromAppBlacklist" handler:v14];
      kvoObserver = v2->_kvoObserver;
      v2->_kvoObserver = (HVContentAdmissionKVOObserver *)v15;

      -[HVContentAdmission _refreshDisabledBundleIds]((uint64_t)v2);
      uint64_t v22 = MEMORY[0x263EF8330];
      uint64_t v23 = 3221225472;
      v24 = __26__HVContentAdmission_init__block_invoke_2;
      v25 = &unk_2647D56C8;
      objc_copyWeak(&v26, (id *)location);
      id v17 = (void *)MEMORY[0x22A6669E0](&v22);
      uint64_t v18 = +[HVContentAdmissionKVOObserver observeObject:v2->_defaults, @"SuggestionsShowPastEvents", v17, v22, v23, v24, v25 key handler];
      pastEventsObserver = v2->_pastEventsObserver;
      v2->_pastEventsObserver = (HVContentAdmissionKVOObserver *)v18;

      -[HVContentAdmission _refreshPastEventsSetting]((uint64_t)v2);
      -[HVContentAdmission _migrateIfNeededWithCompletion:]((uint64_t)v2, 0);

      objc_destroyWeak(&v26);
      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v20 = hv_default_log_handle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 138412290;
        *(void *)&location[4] = @"com.apple.suggestions";
        _os_log_error_impl(&dword_226C41000, v20, OS_LOG_TYPE_ERROR, "HVContentAdmission failed to get NSUserDefaults for suite %@.", location, 0xCu);
      }
    }
  }
  return v2;
}

void __26__HVContentAdmission_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HVContentAdmission _refreshDisabledBundleIds]((uint64_t)WeakRetained);
}

- (void)_refreshDisabledBundleIds
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 16);
    if (v2)
    {
      uint64_t v3 = [v2 objectForKey:@"SiriCanLearnFromAppBlacklist"];
      uint64_t v4 = (void *)v3;
      id v5 = (void *)MEMORY[0x263EFFA68];
      if (v3) {
        id v5 = (void *)v3;
      }
      id v6 = v5;

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v6];
        uint64_t v8 = hv_default_log_handle();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 134217984;
          uint64_t v10 = [v7 count];
          _os_log_impl(&dword_226C41000, v8, OS_LOG_TYPE_DEFAULT, "HVContentAdmission loaded %tu disabled bundleIds from prefs", (uint8_t *)&v9, 0xCu);
        }

        -[HVContentAdmission _refreshBundleIdentifierDenyListsWithLearnFromDenyList:configurableDenyList:](a1, v7, 0);
      }
      else
      {
        v7 = hv_default_log_handle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v9) = 0;
          _os_log_error_impl(&dword_226C41000, v7, OS_LOG_TYPE_ERROR, "HVContentAdmission found unexpected value type for disabled bundleIds.", (uint8_t *)&v9, 2u);
        }
      }
    }
  }
}

void __26__HVContentAdmission_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HVContentAdmission _refreshPastEventsSetting]((uint64_t)WeakRetained);
}

- (uint64_t)_refreshPastEventsSetting
{
  if (result)
  {
    v1 = *(void **)(result + 8);
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __47__HVContentAdmission__refreshPastEventsSetting__block_invoke;
    v2[3] = &unk_2647D4D30;
    v2[4] = result;
    return [v1 runWithLockAcquired:v2];
  }
  return result;
}

- (void)_migrateIfNeededWithCompletion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if (_migrateIfNeededWithCompletion___pasOnceToken12 != -1) {
      dispatch_once(&_migrateIfNeededWithCompletion___pasOnceToken12, &__block_literal_global_79);
    }
    uint64_t v4 = (void *)_migrateIfNeededWithCompletion___pasExprOnceResult;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __53__HVContentAdmission__migrateIfNeededWithCompletion___block_invoke_2;
    v6[3] = &unk_2647D4E58;
    v6[4] = a1;
    id v7 = v3;
    id v5 = v4;
    dispatch_async(v5, v6);
  }
}

uint64_t __53__HVContentAdmission__migrateIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t v2 = hv_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_226C41000, v2, OS_LOG_TYPE_DEBUG, "HVContentAdmission: migrateIfNeeded", buf, 2u);
  }

  if ([*(id *)(*(void *)(a1 + 32) + 16) BOOLForKey:@"spToLearnMigrationPerformed"])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_226C41000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "HVContentAdmission: spToLearnMigrationPerformed was YES.", buf, 2u);
    }
  }
  else
  {
    id v3 = hv_default_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226C41000, v3, OS_LOG_TYPE_DEFAULT, "HVContentAdmission: spToLearnMigrationPerformed was NO.", buf, 2u);
    }

    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2020000000;
    uint64_t v4 = (void (*)(uint64_t))getSPGetDisabledBundleSetSymbolLoc_ptr;
    v45 = getSPGetDisabledBundleSetSymbolLoc_ptr;
    if (!getSPGetDisabledBundleSetSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v38 = 3221225472;
      v39 = __getSPGetDisabledBundleSetSymbolLoc_block_invoke;
      v40 = &unk_2647D4E80;
      v41 = &v42;
      __getSPGetDisabledBundleSetSymbolLoc_block_invoke(buf);
      uint64_t v4 = (void (*)(uint64_t))v43[3];
    }
    _Block_object_dispose(&v42, 8);
    if (!v4)
    {
      v27 = [MEMORY[0x263F08690] currentHandler];
      id v28 = [NSString stringWithUTF8String:"NSMutableSet * _Nonnull HVSPGetDisabledBundleSet(BOOL)"];
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, @"HVContentAdmission.m", 349, @"%s", dlerror());

      __break(1u);
    }
    id v5 = v4(1);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v47 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v34 != v7) {
            objc_enumerationMutation(v5);
          }
          int v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            -[HVContentAdmission _disableBundleIdentifier:](*(void *)(a1 + 32), v9);
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v47 count:16];
      }
      while (v6);
    }
    [*(id *)(*(void *)(a1 + 32) + 16) setBool:1 forKey:@"spToLearnMigrationPerformed"];
    uint64_t v10 = hv_default_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226C41000, v10, OS_LOG_TYPE_DEFAULT, "HVContentAdmission: spToLearnMigration has been performed.", buf, 2u);
    }
  }
  if ([*(id *)(*(void *)(a1 + 32) + 16) BOOLForKey:@"findToShowMigrationPerformed"])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_226C41000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "HVContentAdmission: findToShowMigrationPerformed was YES.", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226C41000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "HVContentAdmission: findToShowMigrationPerformed was NO.", buf, 2u);
    }
    uint64_t v11 = objc_opt_new();
    uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:@"SuggestionsShowContactsFoundInMail"];
    char v13 = v12;
    if (v12 && ([v12 BOOLValue] & 1) == 0) {
      [v11 addObject:@"com.apple.MobileAddressBook"];
    }
    v14 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:@"SuggestionsShowEventsFoundInMail"];
    uint64_t v15 = v14;
    if (v14 && ([v14 BOOLValue] & 1) == 0) {
      [v11 addObject:@"com.apple.mobilecal"];
    }
    __int16 v16 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:@"SuggestionsShowLocationsFoundInApps"];
    id v17 = v16;
    if (v16 && ([v16 BOOLValue] & 1) == 0) {
      [v11 addObject:@"com.apple.Maps"];
    }
    uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:@"SuggestionsShowTopicsFoundInApps"];
    v19 = v18;
    if (v18 && ([v18 BOOLValue] & 1) == 0) {
      [v11 addObject:@"com.apple.news"];
    }
    v20 = [*(id *)(*(void *)(a1 + 32) + 16) arrayForKey:@"SuggestionsPortraitTopicsAppUsageBlacklist"];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v46 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(v20);
          }
          [v11 addObject:*(void *)(*((void *)&v29 + 1) + 8 * j)];
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v46 count:16];
      }
      while (v21);
    }
    v24 = *(void **)(*(void *)(a1 + 32) + 16);
    v25 = [v11 allObjects];
    [v24 setObject:v25 forKey:@"AppCanShowSiriSuggestionsBlacklist"];

    [*(id *)(*(void *)(a1 + 32) + 16) setBool:1 forKey:@"findToShowMigrationPerformed"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226C41000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "HVContentAdmission: findToShowMigration has been performed.", buf, 2u);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_disableBundleIdentifier:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 8);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __47__HVContentAdmission__disableBundleIdentifier___block_invoke;
    v6[3] = &unk_2647D4DD0;
    id v7 = v3;
    uint64_t v8 = a1;
    [v5 runWithLockAcquired:v6];
  }
}

void __47__HVContentAdmission__disableBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a2 + 8) allObjects];
  id v4 = (id)[v3 mutableCopy];

  [v4 addObject:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 16) setObject:v4 forKey:@"SiriCanLearnFromAppBlacklist"];
}

void __53__HVContentAdmission__migrateIfNeededWithCompletion___block_invoke()
{
  v0 = (void *)MEMORY[0x22A6667F0]();
  uint64_t v1 = [MEMORY[0x263F61E38] autoreleasingSerialQueueWithLabel:"HVContentAdmission-migrateIfNeeded" qosClass:5];
  uint64_t v2 = (void *)_migrateIfNeededWithCompletion___pasExprOnceResult;
  _migrateIfNeededWithCompletion___pasExprOnceResult = v1;
}

uint64_t __47__HVContentAdmission__refreshPastEventsSetting__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  v4[40] = [v2 BOOLForKey:@"SuggestionsShowPastEvents"];

  return MEMORY[0x270F9A758]();
}

- (void)_refreshBundleIdentifierDenyListsWithLearnFromDenyList:(void *)a3 configurableDenyList:
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  id v7 = (void *)v6;
  if (a1 && v5 | v6)
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    long long v29 = __Block_byref_object_copy__335;
    long long v30 = __Block_byref_object_dispose__336;
    id v31 = 0;
    uint64_t v8 = *(void **)(a1 + 8);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __98__HVContentAdmission__refreshBundleIdentifierDenyListsWithLearnFromDenyList_configurableDenyList___block_invoke;
    v22[3] = &unk_2647D4DA8;
    unint64_t v17 = v5;
    id v23 = (id)v5;
    id v24 = v7;
    v25 = &v26;
    [v8 runWithLockAcquired:v22];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = (id)v27[5];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
          v14 = (void *)MEMORY[0x22A6667F0]();
          uint64_t v15 = [[HVSpotlightDeletionRequest alloc] initWithBundleIdentifier:v13];
          __int16 v16 = +[HVDonationReceiver defaultReceiver];
          [v16 deleteContentWithRequest:v15 error:0];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v32 count:16];
      }
      while (v10);
    }

    _Block_object_dispose(&v26, 8);
    unint64_t v5 = v17;
  }
}

void __98__HVContentAdmission__refreshBundleIdentifierDenyListsWithLearnFromDenyList_configurableDenyList___block_invoke(void *a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)a1[4];
  if (!v4) {
    id v4 = (void *)*((void *)v3 + 1);
  }
  unint64_t v5 = (void *)[v4 mutableCopy];
  unint64_t v6 = v5;
  uint64_t v7 = a1[5];
  if (!v7) {
    uint64_t v7 = *((void *)v3 + 2);
  }
  [v5 unionSet:v7];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = *((id *)v3 + 3);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v12++), "contentAdmissionBlocklistDidChange:", v6, (void)v24);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v10);
  }

  uint64_t v13 = [v6 mutableCopy];
  uint64_t v14 = *(void *)(a1[6] + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  [*(id *)(*(void *)(a1[6] + 8) + 40) minusSet:*((void *)v3 + 1)];
  [*(id *)(*(void *)(a1[6] + 8) + 40) minusSet:*((void *)v3 + 2)];
  __int16 v16 = hv_default_log_handle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = *(void *)(*(void *)(a1[6] + 8) + 40);
    *(_DWORD *)buf = 138412546;
    long long v29 = v6;
    __int16 v30 = 2112;
    uint64_t v31 = v23;
    _os_log_debug_impl(&dword_226C41000, v16, OS_LOG_TYPE_DEBUG, "HVContentAdmission disabled bundles: %@ newly disabled: %@", buf, 0x16u);
  }

  unint64_t v17 = (void *)a1[4];
  if (v17)
  {
    uint64_t v18 = [v17 copy];
    long long v19 = (void *)*((void *)v3 + 1);
    *((void *)v3 + 1) = v18;
  }
  long long v20 = (void *)a1[5];
  if (v20)
  {
    uint64_t v21 = [v20 copy];
    uint64_t v22 = (void *)*((void *)v3 + 2);
    *((void *)v3 + 2) = v21;
  }
}

+ (void)migrateForTests
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = +[HVContentAdmission sharedInstance]();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__HVContentAdmission_migrateForTests__block_invoke;
  v5[3] = &unk_2647D5D40;
  dispatch_semaphore_t v6 = v2;
  id v4 = v2;
  -[HVContentAdmission _migrateIfNeededWithCompletion:]((uint64_t)v3, v5);

  [MEMORY[0x263F61E38] waitForSemaphore:v4];
}

intptr_t __37__HVContentAdmission_migrateForTests__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __36__HVContentAdmission_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x22A6667F0]();
  uint64_t v1 = objc_opt_new();
  dispatch_semaphore_t v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;
}

+ (void)clearTestSettings
{
  uint64_t v2 = +[HVContentAdmission sharedInstance]();
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = *(void **)(v2 + 8);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __40__HVContentAdmission__clearTestSettings__block_invoke;
    v5[3] = &unk_2647D4D30;
    void v5[4] = v3;
    [v4 runWithLockAcquired:v5];
  }

  MEMORY[0x270F9A758]();
}

void __40__HVContentAdmission__clearTestSettings__block_invoke(uint64_t a1, void *a2)
{
  v18[9] = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  v18[0] = @"SiriCanLearnFromAppBlacklist";
  v18[1] = @"spToLearnMigrationPerformed";
  v18[2] = @"findToShowMigrationPerformed";
  v18[3] = @"SuggestionsShowContactsFoundInMail";
  v18[4] = @"SuggestionsShowEventsFoundInMail";
  v18[5] = @"SuggestionsShowLocationsFoundInApps";
  v18[6] = @"SuggestionsShowTopicsFoundInApps";
  v18[7] = @"SuggestionsPortraitTopicsAppUsageBlacklist";
  v18[8] = @"AppCanShowSiriSuggestionsBlacklist";
  [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:9];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "removeObjectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * v8++), (void)v13);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  uint64_t v9 = objc_opt_new();
  uint64_t v10 = (void *)v3[1];
  v3[1] = v9;

  uint64_t v11 = objc_opt_new();
  uint64_t v12 = (void *)v3[2];
  v3[2] = v11;
}

+ (void)disableBundleIdentifier:(id)a3
{
  id v3 = a3;
  +[HVContentAdmission sharedInstance]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HVContentAdmission _disableBundleIdentifier:]((uint64_t)v4, v3);
}

+ (void)updateConfigurableBundleIdentifierDenyList:(id)a3
{
  id v3 = a3;
  +[HVContentAdmission sharedInstance]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HVContentAdmission _refreshBundleIdentifierDenyListsWithLearnFromDenyList:configurableDenyList:]((uint64_t)v4, 0, v3);
}

+ (void)registerConfigurationAsset:(id)a3
{
  id v3 = a3;
  val = +[HVContentAdmission sharedInstance]();
  id v4 = v3;
  if (val)
  {
    id location = 0;
    objc_initWeak(&location, val);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __50__HVContentAdmission__registerConfigurationAsset___block_invoke;
    v15[3] = &unk_2647D4D58;
    objc_copyWeak(&v16, &location);
    uint64_t v5 = (void *)MEMORY[0x22A6669E0](v15);
    uint64_t v6 = (void *)val[1];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __50__HVContentAdmission__registerConfigurationAsset___block_invoke_52;
    v13[3] = &unk_2647D4D30;
    id v7 = v4;
    id v14 = v7;
    [v6 runWithLockAcquired:v13];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __50__HVContentAdmission__registerConfigurationAsset___block_invoke_2;
    v11[3] = &unk_2647D4D80;
    id v8 = v5;
    id v12 = v8;
    id v9 = (id)[v7 registerUpdateHandler:v11];
    (*((void (**)(id, id))v8 + 2))(v8, v7);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __50__HVContentAdmission__registerConfigurationAsset___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = [v3 filesystemPathForAssetDataRelativePath:@"ProactiveHarvestingConfig.plist"];
    if (v5)
    {
      id v16 = 0;
      uint64_t v6 = (__CFString *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v5 options:0 error:&v16];
      id v7 = v16;
      if (v6)
      {
        id v15 = 0;
        id v8 = [MEMORY[0x263F08AC0] propertyListWithData:v6 options:0 format:0 error:&v15];
        id v9 = v15;

        if (v9)
        {
          uint64_t v10 = hv_default_log_handle();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v18 = v6;
            __int16 v19 = 2112;
            long long v20 = v9;
            _os_log_error_impl(&dword_226C41000, v10, OS_LOG_TYPE_ERROR, "HVContentAdmission Error deserializing ProactiveHarvesting config plist %@: %@", buf, 0x16u);
          }
        }
        else
        {
          id v11 = objc_alloc(MEMORY[0x263EFFA08]);
          id v12 = [v8 objectForKeyedSubscript:@"BundleIdentifierDenyList"];
          uint64_t v10 = [v11 initWithArray:v12];

          long long v13 = hv_default_log_handle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v14 = [v10 count];
            *(_DWORD *)buf = 134217984;
            uint64_t v18 = (__CFString *)v14;
            _os_log_impl(&dword_226C41000, v13, OS_LOG_TYPE_DEFAULT, "HVContentAdmission received %tu disabled bundleIds from mobile asset", buf, 0xCu);
          }

          -[HVContentAdmission _refreshBundleIdentifierDenyListsWithLearnFromDenyList:configurableDenyList:]((uint64_t)WeakRetained, 0, v10);
        }
      }
      else
      {
        id v8 = hv_default_log_handle();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v18 = v5;
          __int16 v19 = 2112;
          long long v20 = v7;
          _os_log_error_impl(&dword_226C41000, v8, OS_LOG_TYPE_ERROR, "HVContentAdmission Error obtaining data for ProactiveHarvesting config plist %@: %@", buf, 0x16u);
        }
        id v9 = v7;
      }
    }
    else
    {
      id v9 = hv_default_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = @"ProactiveHarvestingConfig.plist";
        _os_log_error_impl(&dword_226C41000, v9, OS_LOG_TYPE_ERROR, "HVContentAdmission Error finding ProactiveHarvesting config plist (path: %@)", buf, 0xCu);
      }
    }
  }
}

void __50__HVContentAdmission__registerConfigurationAsset___block_invoke_52(uint64_t a1, uint64_t a2)
{
}

uint64_t __50__HVContentAdmission__registerConfigurationAsset___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)addContentAdmissionObserver:(id)a3
{
  id v3 = a3;
  uint64_t v6 = +[HVContentAdmission sharedInstance]();
  id v4 = v3;
  if (v6)
  {
    uint64_t v5 = (void *)v6[1];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__HVContentAdmission_addContentAdmissionObserver___block_invoke;
    v7[3] = &unk_2647D4D30;
    id v8 = v4;
    [v5 runWithLockAcquired:v7];
  }
}

uint64_t __50__HVContentAdmission_addContentAdmissionObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 24) addObject:*(void *)(a1 + 32)];
}

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1) {
    id v4 = +[HVContentAdmission sharedInstance]();
  }
}

@end