@interface WFAirQualityProviderAttributionManager
+ (WFAirQualityProviderAttributionManager)sharedManager;
- (NSMutableDictionary)attributionCache;
- (WFAirQualityProviderAttribution)defaultProviderAttribution;
- (WFAirQualityProviderAttributionManager)init;
- (id)cachedAttributionForProvider:(id)a3;
- (id)p_archivedDataForProviderAttribution:(id)a3;
- (os_unfair_lock_s)dataSynchronizationLock;
- (void)loadAttributionForProvider:(id)a3 completion:(id)a4;
- (void)p_updateCacheWithProviderAttribution:(id)a3;
- (void)registerProviderAttribution:(id)a3;
- (void)setAttributionCache:(id)a3;
- (void)setDataSynchronizationLock:(os_unfair_lock_s)a3;
@end

@implementation WFAirQualityProviderAttributionManager

+ (WFAirQualityProviderAttributionManager)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedManager_attributionManager;
  return (WFAirQualityProviderAttributionManager *)v2;
}

uint64_t __55__WFAirQualityProviderAttributionManager_sharedManager__block_invoke()
{
  sharedManager_attributionManager = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (WFAirQualityProviderAttributionManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)WFAirQualityProviderAttributionManager;
  v2 = [(WFAirQualityProviderAttributionManager *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_dataSynchronizationLock._os_unfair_lock_opaque = 0;
    v4 = WeatherFoundationInternalUserDefaults();
    v5 = [v4 objectForKey:@"providerAttributionPrimitives"];

    if (v5) {
      [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v5];
    }
    else {
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    }
    attributionCache = v3->_attributionCache;
    v3->_attributionCache = (NSMutableDictionary *)v6;
  }
  return v3;
}

- (void)registerProviderAttribution:(id)a3
{
  id v4 = a3;
  v5 = [v4 name];

  if (v5)
  {
    uint64_t v6 = [(WFAirQualityProviderAttributionManager *)self p_archivedDataForProviderAttribution:v4];
    if (v6)
    {
      os_unfair_lock_lock_with_options();
      v7 = [(WFAirQualityProviderAttributionManager *)self attributionCache];
      v8 = [v4 name];
      [v7 setObject:v6 forKeyedSubscript:v8];

      os_unfair_lock_unlock(&self->_dataSynchronizationLock);
    }
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __70__WFAirQualityProviderAttributionManager_registerProviderAttribution___block_invoke;
    v9[3] = &unk_264431300;
    v9[4] = self;
    id v10 = v4;
    [v10 loadLogoImageWithCompletion:v9];
  }
}

uint64_t __70__WFAirQualityProviderAttributionManager_registerProviderAttribution___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_updateCacheWithProviderAttribution:", *(void *)(a1 + 40));
}

- (id)cachedAttributionForProvider:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_dataSynchronizationLock = &self->_dataSynchronizationLock;
    os_unfair_lock_lock_with_options();
    uint64_t v6 = [(WFAirQualityProviderAttributionManager *)self attributionCache];
    v7 = [v6 objectForKeyedSubscript:v4];

    if (v7)
    {
      id v12 = 0;
      v8 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v12];
      id v9 = v12;
      if (v9)
      {
        id v10 = WFLogForCategory(5uLL);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[WFAirQualityProviderAttributionManager cachedAttributionForProvider:]();
        }
      }
    }
    else
    {
      v8 = 0;
    }
    os_unfair_lock_unlock(p_dataSynchronizationLock);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)loadAttributionForProvider:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [(WFAirQualityProviderAttributionManager *)self cachedAttributionForProvider:a3];
  v8 = v7;
  if (v7)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __80__WFAirQualityProviderAttributionManager_loadAttributionForProvider_completion___block_invoke;
    v10[3] = &unk_264431328;
    id v11 = v7;
    id v12 = self;
    id v13 = v6;
    [v11 loadLogoImageWithCompletion:v10];
  }
  else
  {
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.weather.foundation.airQuality.provider.attribution.manager.errorDomain" code:6667 userInfo:0];
    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v9);
  }
}

void __80__WFAirQualityProviderAttributionManager_loadAttributionForProvider_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) cachedLogoImage];

  if (v7 && !v6)
  {
    [*(id *)(a1 + 32) setCachedLogoImage:v7];
    objc_msgSend(*(id *)(a1 + 40), "p_updateCacheWithProviderAttribution:", *(void *)(a1 + 32));
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (WFAirQualityProviderAttribution)defaultProviderAttribution
{
  return +[WFAirQualityProviderAttribution defaultProviderAttribution];
}

- (id)p_archivedDataForProviderAttribution:(id)a3
{
  id v3 = a3;
  id v8 = 0;
  id v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v8];
  id v5 = v8;
  if (v5)
  {
    id v6 = WFLogForCategory(5uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(WFAirQualityProviderAttributionManager *)v3 p_archivedDataForProviderAttribution:v6];
    }
  }
  return v4;
}

- (void)p_updateCacheWithProviderAttribution:(id)a3
{
  id v11 = a3;
  id v4 = -[WFAirQualityProviderAttributionManager p_archivedDataForProviderAttribution:](self, "p_archivedDataForProviderAttribution:");
  if (v4)
  {
    p_dataSynchronizationLock = &self->_dataSynchronizationLock;
    os_unfair_lock_lock_with_options();
    id v6 = [(WFAirQualityProviderAttributionManager *)self attributionCache];
    id v7 = [v11 name];
    [v6 setObject:v4 forKeyedSubscript:v7];

    id v8 = [(WFAirQualityProviderAttributionManager *)self attributionCache];
    id v9 = (void *)[v8 copy];

    os_unfair_lock_unlock(p_dataSynchronizationLock);
    id v10 = WeatherFoundationInternalUserDefaults();
    [v10 setObject:v9 forKey:@"providerAttributionPrimitives"];
  }
}

- (os_unfair_lock_s)dataSynchronizationLock
{
  return self->_dataSynchronizationLock;
}

- (void)setDataSynchronizationLock:(os_unfair_lock_s)a3
{
  self->_dataSynchronizationLock = a3;
}

- (NSMutableDictionary)attributionCache
{
  return self->_attributionCache;
}

- (void)setAttributionCache:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)cachedAttributionForProvider:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_21C988000, v1, OS_LOG_TYPE_ERROR, "Error retrieving provider from cache %{public}@: %{public}@", v2, 0x16u);
}

- (void)p_archivedDataForProviderAttribution:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v5 = [a1 name];
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_21C988000, a3, OS_LOG_TYPE_ERROR, "Error generating archived data from attribution %{public}@: %{public}@", v6, 0x16u);
}

@end