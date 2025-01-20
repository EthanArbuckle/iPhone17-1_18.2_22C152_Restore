@interface PSAppDataUsagePolicyCache
+ (id)sharedInstance;
- (CoreTelephonyClient)ctClient;
- (NSCache)policyCache;
- (PSAppDataUsagePolicyCache)init;
- (__CTServerConnection)ctServerConnection;
- (id)getLogger;
- (id)initPrivate;
- (id)policiesFor:(id)a3;
- (void)addPoliciesToCache:(id)a3;
- (void)clearCache;
- (void)dealloc;
- (void)fetchUsagePoliciesFor:(id)a3;
- (void)fetchUsagePolicyFor:(id)a3;
- (void)handlePolicyChangedNotification;
- (void)managedConfigurationProfileListDidChange;
- (void)managedConfigurationSettingsDidChange;
- (void)setCtClient:(id)a3;
- (void)setCtServerConnection:(__CTServerConnection *)a3;
- (void)setPolicies:(id)a3 completion:(id)a4;
- (void)setPolicyCache:(id)a3;
- (void)willEnterForeground;
@end

@implementation PSAppDataUsagePolicyCache

+ (id)sharedInstance
{
  if (qword_26AC328E8 != -1) {
    dispatch_once(&qword_26AC328E8, &__block_literal_global_4);
  }
  v2 = (void *)_MergedGlobals_7;
  return v2;
}

uint64_t __43__PSAppDataUsagePolicyCache_sharedInstance__block_invoke()
{
  _MergedGlobals_7 = [[PSAppDataUsagePolicyCache alloc] initPrivate];
  return MEMORY[0x270F9A758]();
}

- (id)initPrivate
{
  v22.receiver = self;
  v22.super_class = (Class)PSAppDataUsagePolicyCache;
  v2 = [(PSAppDataUsagePolicyCache *)&v22 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    policyCache = v2->_policyCache;
    v2->_policyCache = (NSCache *)v3;

    [(NSCache *)v2->_policyCache setCountLimit:1000];
    id v5 = objc_alloc(MEMORY[0x263F02D30]);
    v6 = +[SettingsCellularSharedUtils createCTClientSerialQueue:@"app_data_policy_usage_cache"];
    uint64_t v7 = [v5 initWithQueue:v6];
    ctClient = v2->_ctClient;
    v2->_ctClient = (CoreTelephonyClient *)v7;

    [(CoreTelephonyClient *)v2->_ctClient setDelegate:v2];
    id location = 0;
    objc_initWeak(&location, v2);
    id v9 = MEMORY[0x263EF83A0];
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __40__PSAppDataUsagePolicyCache_initPrivate__block_invoke;
    v19 = &unk_2646DECC8;
    objc_copyWeak(&v20, &location);
    v2->_ctServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();

    if (!v2->_ctServerConnection)
    {
      v14 = [(PSAppDataUsagePolicyCache *)v2 getLogger];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_error_impl(&dword_2247E9000, v14, OS_LOG_TYPE_ERROR, "Failed to create CT server connection", v15, 2u);
      }

      objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"CT server connection error" reason:@"Failed to create CT server connection" userInfo:0]);
    }
    _CTServerConnectionRegisterForNotification();
    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v2 selector:sel_willEnterForeground name:*MEMORY[0x263F1D0D0] object:0];

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v2 selector:sel_managedConfigurationSettingsDidChange name:*MEMORY[0x263F536E0] object:0];

    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v2 selector:sel_managedConfigurationProfileListDidChange name:*MEMORY[0x263F53B18] object:0];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __40__PSAppDataUsagePolicyCache_initPrivate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handlePolicyChangedNotification];
}

- (void)dealloc
{
  ctServerConnection = self->_ctServerConnection;
  if (ctServerConnection) {
    CFRelease(ctServerConnection);
  }
  v4.receiver = self;
  v4.super_class = (Class)PSAppDataUsagePolicyCache;
  [(PSAppDataUsagePolicyCache *)&v4 dealloc];
}

- (void)clearCache
{
  uint64_t v3 = [(PSAppDataUsagePolicyCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_2247E9000, v3, OS_LOG_TYPE_DEFAULT, "Clearing policy cache", v4, 2u);
  }

  [(NSCache *)self->_policyCache removeAllObjects];
}

- (void)handlePolicyChangedNotification
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(PSAppDataUsagePolicyCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = (const char *)*MEMORY[0x263F02E80];
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_2247E9000, v3, OS_LOG_TYPE_DEFAULT, "Received notification %@", (uint8_t *)&v8, 0xCu);
  }

  [(PSAppDataUsagePolicyCache *)self clearCache];
  id v5 = [MEMORY[0x263F089F8] notificationWithName:@"PSPerAppNetworkDataAccessPolicyChangedNotification" object:0];
  v6 = [(PSAppDataUsagePolicyCache *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[PSAppDataUsagePolicyCache handlePolicyChangedNotification]";
    __int16 v10 = 2112;
    v11 = @"PSPerAppNetworkDataAccessPolicyChangedNotification";
    _os_log_impl(&dword_2247E9000, v6, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 performSelectorOnMainThread:sel_postNotification_ withObject:v5 waitUntilDone:0];
}

- (void)willEnterForeground
{
  uint64_t v3 = [(PSAppDataUsagePolicyCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_2247E9000, v3, OS_LOG_TYPE_DEFAULT, "Received willEnterForeground notification", v4, 2u);
  }

  [(PSAppDataUsagePolicyCache *)self clearCache];
}

- (void)managedConfigurationSettingsDidChange
{
  uint64_t v3 = [(PSAppDataUsagePolicyCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_2247E9000, v3, OS_LOG_TYPE_DEFAULT, "Received managedConfigurationSettingsDidChange notification", v4, 2u);
  }

  [(PSAppDataUsagePolicyCache *)self clearCache];
}

- (void)managedConfigurationProfileListDidChange
{
  uint64_t v3 = [(PSAppDataUsagePolicyCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_2247E9000, v3, OS_LOG_TYPE_DEFAULT, "Received managedConfigurationProfileListDidChange notification", v4, 2u);
  }

  [(PSAppDataUsagePolicyCache *)self clearCache];
}

- (PSAppDataUsagePolicyCache)init
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = [(PSAppDataUsagePolicyCache *)self getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    objc_super v4 = "-[PSAppDataUsagePolicyCache init]";
    _os_log_error_impl(&dword_2247E9000, v2, OS_LOG_TYPE_ERROR, "Unsupported initializer called: %s", (uint8_t *)&v3, 0xCu);
  }

  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer" reason:@"Unsupported initializer called" userInfo:0]);
}

- (void)addPoliciesToCache:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__PSAppDataUsagePolicyCache_addPoliciesToCache___block_invoke;
  v5[3] = &unk_2646DECF0;
  objc_copyWeak(&v6, &location);
  [v4 enumerateObjectsUsingBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __48__PSAppDataUsagePolicyCache_addPoliciesToCache___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  uint64_t v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained(v5);
    int v8 = [v7 policyCache];
    id v9 = [v10 bundleId];
    [v8 setObject:v10 forKey:v9];
  }
  else
  {
    *a3 = 1;
  }
}

- (void)fetchUsagePoliciesFor:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(PSAppDataUsagePolicyCache *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = [v4 count];
    _os_log_impl(&dword_2247E9000, v5, OS_LOG_TYPE_DEFAULT, "Fetching usage policies for %lu apps.", buf, 0xCu);
  }

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  ctClient = self->_ctClient;
  id v7 = [MEMORY[0x263EFFA08] setWithArray:v4];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__PSAppDataUsagePolicyCache_fetchUsagePoliciesFor___block_invoke;
  v9[3] = &unk_2646DED18;
  v9[4] = self;
  id v8 = v4;
  id v10 = v8;
  objc_copyWeak(&v11, (id *)buf);
  [(CoreTelephonyClient *)ctClient getLocalPolicies:v7 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __51__PSAppDataUsagePolicyCache_fetchUsagePoliciesFor___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] getLogger];
  id WeakRetained = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      uint64_t v11 = (uint64_t)v6;
      _os_log_error_impl(&dword_2247E9000, WeakRetained, OS_LOG_TYPE_ERROR, "Failed to fetch policies, error: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [a1[5] count];
      int v10 = 134217984;
      uint64_t v11 = v9;
      _os_log_impl(&dword_2247E9000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Policies fetch success for %lu apps.", (uint8_t *)&v10, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    [WeakRetained addPoliciesToCache:v5];
  }
}

- (void)fetchUsagePolicyFor:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PSAppDataUsagePolicyCache *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v4;
    _os_log_impl(&dword_2247E9000, v5, OS_LOG_TYPE_DEFAULT, "Fetching usage policies for %{public}@", buf, 0xCu);
  }

  ctClient = self->_ctClient;
  id v7 = [MEMORY[0x263EFFA08] setWithObject:v4];
  id v12 = 0;
  id v8 = [(CoreTelephonyClient *)ctClient getLocalPolicies:v7 error:&v12];
  id v9 = v12;

  int v10 = [(PSAppDataUsagePolicyCache *)self getLogger];
  uint64_t v11 = v10;
  if (v9 || !v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_error_impl(&dword_2247E9000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch policies for %{public}@, error: %@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v4;
      _os_log_impl(&dword_2247E9000, v11, OS_LOG_TYPE_DEFAULT, "Policies fetch success for %{public}@", buf, 0xCu);
    }

    [(PSAppDataUsagePolicyCache *)self addPoliciesToCache:v8];
  }
}

- (id)policiesFor:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PSAppDataUsagePolicyCache *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_2247E9000, v5, OS_LOG_TYPE_INFO, "Requested usage policies for %{public}@", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [(NSCache *)self->_policyCache objectForKey:v4];

  if (!v6)
  {
    id v7 = [(PSAppDataUsagePolicyCache *)self getLogger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 138543362;
      id v11 = v4;
      _os_log_impl(&dword_2247E9000, v7, OS_LOG_TYPE_INFO, "Cache did not have usage policies for %{public}@", (uint8_t *)&v10, 0xCu);
    }

    [(PSAppDataUsagePolicyCache *)self fetchUsagePolicyFor:v4];
  }
  id v8 = [(NSCache *)self->_policyCache objectForKey:v4];

  return v8;
}

- (void)setPolicies:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    location[0] = 0;
    objc_initWeak(location, self);
    ctClient = self->_ctClient;
    id v9 = [MEMORY[0x263EFFA08] setWithObject:v6];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __52__PSAppDataUsagePolicyCache_setPolicies_completion___block_invoke;
    v12[3] = &unk_2646DED40;
    objc_copyWeak(&v15, location);
    id v13 = v6;
    id v14 = v7;
    [(CoreTelephonyClient *)ctClient setLocalPolicies:v9 completion:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
  }
  else
  {
    int v10 = [(PSAppDataUsagePolicyCache *)self getLogger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_2247E9000, v10, OS_LOG_TYPE_ERROR, "Attempted to set nil policies", (uint8_t *)location, 2u);
    }

    id v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:103 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

void __52__PSAppDataUsagePolicyCache_setPolicies_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (v3)
  {
    if (WeakRetained)
    {
      id v5 = objc_loadWeakRetained((id *)(a1 + 48));
      id v6 = [v5 getLogger];

      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
LABEL_10:

        goto LABEL_11;
      }
      id v7 = [*(id *)(a1 + 32) bundleId];
      int v13 = 138543618;
      id v14 = v7;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_error_impl(&dword_2247E9000, v6, OS_LOG_TYPE_ERROR, "Set policy failed for %{public}@, error: %@", (uint8_t *)&v13, 0x16u);
LABEL_9:

      goto LABEL_10;
    }
  }
  else if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 48));
    id v9 = [v8 getLogger];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [*(id *)(a1 + 32) bundleId];
      int v13 = 138543362;
      id v14 = v10;
      _os_log_impl(&dword_2247E9000, v9, OS_LOG_TYPE_DEFAULT, "Set policy success for %{public}@", (uint8_t *)&v13, 0xCu);
    }
    id v6 = objc_loadWeakRetained((id *)(a1 + 48));
    id v7 = [v6 policyCache];
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = [v11 bundleId];
    [v7 setObject:v11 forKey:v12];

    goto LABEL_9;
  }
LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)getLogger
{
  return +[Logger loggerWithCategory:@"AppDataUsagePolicy"];
}

- (NSCache)policyCache
{
  return self->_policyCache;
}

- (void)setPolicyCache:(id)a3
{
}

- (__CTServerConnection)ctServerConnection
{
  return self->_ctServerConnection;
}

- (void)setCtServerConnection:(__CTServerConnection *)a3
{
}

- (CoreTelephonyClient)ctClient
{
  return self->_ctClient;
}

- (void)setCtClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_policyCache, 0);
}

@end