@interface TSRecommendedCarrierAppsFlow
- (CoreTelephonyClient)client;
- (TSRecommendedCarrierAppsFlow)init;
- (id)_createFirstViewController;
- (id)_getValueFromCountryBunbleByKey:(id)a3;
- (id)firstViewController;
- (void)_requestCarrierAppsWithCompletion:(id)a3;
- (void)firstViewController;
- (void)firstViewController:(id)a3;
- (void)setClient:(id)a3;
@end

@implementation TSRecommendedCarrierAppsFlow

- (TSRecommendedCarrierAppsFlow)init
{
  v9.receiver = self;
  v9.super_class = (Class)TSRecommendedCarrierAppsFlow;
  v2 = [(TSSIMSetupFlow *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    carrierApps = v2->_carrierApps;
    v2->_carrierApps = v3;

    id v5 = objc_alloc(MEMORY[0x263F02D30]);
    uint64_t v6 = [v5 initWithQueue:MEMORY[0x263EF83A0]];
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v6;

    [(CoreTelephonyClient *)v2->_client setDelegate:v2];
  }
  return v2;
}

- (id)firstViewController
{
  v2 = _TSLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    [(TSRecommendedCarrierAppsFlow *)v2 firstViewController];
  }

  return 0;
}

- (void)firstViewController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __52__TSRecommendedCarrierAppsFlow_firstViewController___block_invoke;
    v10[3] = &unk_264827F70;
    id v11 = v4;
    uint64_t v5 = (void *)MEMORY[0x22A683B20](v10);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __52__TSRecommendedCarrierAppsFlow_firstViewController___block_invoke_2;
    v7[3] = &unk_264827F98;
    objc_copyWeak(&v9, &location);
    id v6 = v5;
    id v8 = v6;
    [(TSRecommendedCarrierAppsFlow *)self _requestCarrierAppsWithCompletion:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

uint64_t __52__TSRecommendedCarrierAppsFlow_firstViewController___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __52__TSRecommendedCarrierAppsFlow_firstViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained _createFirstViewController];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v5 = _TSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __52__TSRecommendedCarrierAppsFlow_firstViewController___block_invoke_2_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_requestCarrierAppsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = (void *)MEMORY[0x22A683B20](v4);
    if (_requestCarrierAppsWithCompletion__onceToken != -1) {
      dispatch_once(&_requestCarrierAppsWithCompletion__onceToken, &__block_literal_global_2);
    }
    id v6 = objc_alloc(MEMORY[0x263F25360]);
    uint64_t v7 = [(TSRecommendedCarrierAppsFlow *)self _getValueFromCountryBunbleByKey:@"AppStoreCollectionCountryID"];
    uint64_t v8 = (void *)[v6 initWithID:v7 kind:*MEMORY[0x263F25330] context:*MEMORY[0x263F25320] limit:0x7FFFFFFFFFFFFFFFLL];

    uint64_t v9 = (void *)_requestCarrierAppsWithCompletion__sLockupViewGroup;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __66__TSRecommendedCarrierAppsFlow__requestCarrierAppsWithCompletion___block_invoke_2;
    v19[3] = &unk_264827FC0;
    objc_copyWeak(&v21, &location);
    id v10 = v5;
    id v20 = v10;
    [v9 _cacheLockupsWithCollectionRequest:v8 withCompletionBlock:v19];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v11 = _TSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[TSRecommendedCarrierAppsFlow _requestCarrierAppsWithCompletion:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

uint64_t __66__TSRecommendedCarrierAppsFlow__requestCarrierAppsWithCompletion___block_invoke()
{
  _requestCarrierAppsWithCompletion__sLockupViewGroup = (uint64_t)objc_alloc_init(MEMORY[0x263F25388]);
  return MEMORY[0x270F9A758]();
}

void __66__TSRecommendedCarrierAppsFlow__requestCarrierAppsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    uint64_t v8 = _TSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __66__TSRecommendedCarrierAppsFlow__requestCarrierAppsWithCompletion___block_invoke_2_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    goto LABEL_7;
  }
  if (v6)
  {
    uint64_t v8 = _TSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __66__TSRecommendedCarrierAppsFlow__requestCarrierAppsWithCompletion___block_invoke_2_cold_2();
    }
LABEL_7:

    goto LABEL_8;
  }
  if ([v5 count])
  {
    [WeakRetained[11] removeAllObjects];
    uint64_t v16 = [v5 mutableCopy];
    id v17 = WeakRetained[11];
    WeakRetained[11] = (id)v16;
  }
LABEL_8:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_createFirstViewController
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_carrierApps count])
  {
    uint64_t v3 = [SSCellularPlanCarrierAppsViewController alloc];
    carrierApps = self->_carrierApps;
    id v5 = [(TSRecommendedCarrierAppsFlow *)self _getValueFromCountryBunbleByKey:@"CountryName"];
    id v6 = [(SSCellularPlanCarrierAppsViewController *)v3 initWithCarrierApps:carrierApps country:v5];
  }
  else
  {
    uint64_t v7 = _TSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[TSRecommendedCarrierAppsFlow _createFirstViewController]";
      _os_log_impl(&dword_227A17000, v7, OS_LOG_TYPE_DEFAULT, "Empty carrier apps list @%s", (uint8_t *)&v11, 0xCu);
    }

    id v6 = 0;
  }
  [(TSSIMSetupFlow *)self setTopViewController:v6];
  [(SSCellularPlanCarrierAppsViewController *)v6 setDelegate:self];
  uint64_t v8 = _TSLogDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    int v11 = 138412546;
    uint64_t v12 = (const char *)v9;
    __int16 v13 = 2080;
    uint64_t v14 = "-[TSRecommendedCarrierAppsFlow _createFirstViewController]";
    _os_log_impl(&dword_227A17000, v8, OS_LOG_TYPE_DEFAULT, "first view: %@ @%s", (uint8_t *)&v11, 0x16u);
  }

  return v6;
}

- (id)_getValueFromCountryBunbleByKey:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  client = self->_client;
  id v25 = 0;
  id v6 = [(CoreTelephonyClient *)client getSubscriptionInfoWithError:&v25];
  id v7 = v25;
  if (!v7)
  {
    uint64_t v9 = [v6 subscriptions];
    if (v9)
    {
      int v11 = [objc_alloc(MEMORY[0x263F02C20]) initWithBundleType:6];
      memset(v24, 0, sizeof(v24));
      if ([v9 countByEnumeratingWithState:v24 objects:v26 count:16])
      {
        uint64_t v12 = **((void **)&v24[0] + 1);
        __int16 v13 = self->_client;
        id v23 = 0;
        uint64_t v14 = (void *)[(CoreTelephonyClient *)v13 copyCarrierBundleValue:v12 key:v4 bundleType:v11 error:&v23];
        id v8 = v23;
        id v10 = v14;

LABEL_11:
        goto LABEL_12;
      }
    }
    else
    {
      int v11 = _TSLogDomain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[TSRecommendedCarrierAppsFlow _getValueFromCountryBunbleByKey:](v11, v15, v16, v17, v18, v19, v20, v21);
      }
    }
    id v8 = 0;
    id v10 = 0;
    goto LABEL_11;
  }
  id v8 = v7;
  uint64_t v9 = _TSLogDomain();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[TSRecommendedCarrierAppsFlow _getValueFromCountryBunbleByKey:](v8, v9);
  }
  id v10 = 0;
LABEL_12:

  return v10;
}

- (CoreTelephonyClient)client
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 96, 1);
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_carrierApps, 0);
}

- (void)firstViewController
{
}

void __52__TSRecommendedCarrierAppsFlow_firstViewController___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_requestCarrierAppsWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66__TSRecommendedCarrierAppsFlow__requestCarrierAppsWithCompletion___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66__TSRecommendedCarrierAppsFlow__requestCarrierAppsWithCompletion___block_invoke_2_cold_2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  v2 = "-[TSRecommendedCarrierAppsFlow _requestCarrierAppsWithCompletion:]_block_invoke";
  _os_log_error_impl(&dword_227A17000, v0, OS_LOG_TYPE_ERROR, "[E]_cacheLockupsWithCollectionRequest returned error: %@ @%s", v1, 0x16u);
}

- (void)_getValueFromCountryBunbleByKey:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_getValueFromCountryBunbleByKey:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0();
  id v5 = "-[TSRecommendedCarrierAppsFlow _getValueFromCountryBunbleByKey:]";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]Failed to get subcription info,  %@ @%s", v4, 0x16u);
}

@end