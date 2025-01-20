@interface WCDefaultCityManager
- (NSArray)defaultCities;
- (OS_dispatch_queue)reloadQueue;
- (WCDefaultCityManager)init;
- (id)defaultCityForLocalTimeZone;
- (id)initDeferLoading:(BOOL)a3;
- (id)reloadDefaultCities;
- (os_unfair_lock_s)dataSynchronizationLock;
- (void)setDefaultCities:(id)a3;
- (void)setReloadQueue:(id)a3;
@end

@implementation WCDefaultCityManager

id __41__WCDefaultCityManager_initDeferLoading___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) reloadDefaultCities];
}

- (id)initDeferLoading:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)WCDefaultCityManager;
  v4 = [(WCDefaultCityManager *)&v14 init];
  v5 = v4;
  if (v4)
  {
    v4->_dataSynchronizationLock._os_unfair_lock_opaque = 0;
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.weathercore.defaultcitymanager", v6);
    reloadQueue = v5->_reloadQueue;
    v5->_reloadQueue = (OS_dispatch_queue *)v7;

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v5 selector:sel_reloadDefaultCities name:*MEMORY[0x1E4F1C370] object:0];

    if (!a3)
    {
      v10 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__WCDefaultCityManager_initDeferLoading___block_invoke;
      block[3] = &unk_1E60A2020;
      v13 = v5;
      dispatch_async(v10, block);
    }
  }
  return v5;
}

- (id)reloadDefaultCities
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  v5 = [v4 countryCode];
  v6 = [v4 localeIdentifier];
  if (isChineseSKU())
  {
    dispatch_queue_t v7 = WCLogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v6;
      _os_log_impl(&dword_1B4900000, v7, OS_LOG_TYPE_DEFAULT, "Previous localeCode=%@, overriding localeCode to the countryCode CN", buf, 0xCu);
    }

    v6 = @"CN";
  }
  if (isJapaneseSKU())
  {
    v8 = WCLogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v6;
      _os_log_impl(&dword_1B4900000, v8, OS_LOG_TYPE_DEFAULT, "Previous localeCode=%@, overriding localeCode to the countryCode JP", buf, 0xCu);
    }

    v6 = @"JP";
  }
  v9 = WCLogForCategory(1uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v38 = v6;
    __int16 v39 = 2112;
    v40 = v5;
    __int16 v41 = 2112;
    v42 = v4;
    _os_log_impl(&dword_1B4900000, v9, OS_LOG_TYPE_DEFAULT, "About to ask the ALCityManager for our default cities. LocaleCode=%@, countryCode=%@, currentLocale=%@", buf, 0x20u);
  }

  v10 = [MEMORY[0x1E4F4BE38] sharedManager];
  v11 = [v10 defaultCitiesForLocaleCode:v6];

  uint64_t v12 = [(__CFString *)v11 count];
  v13 = WCLogForCategory(1uLL);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412546;
      v38 = v6;
      __int16 v39 = 2112;
      v40 = v11;
      _os_log_impl(&dword_1B4900000, v13, OS_LOG_TYPE_DEFAULT, "[ALCityManager.defaultCitiesForLocaleCode:%@] returned the following cities:%@", buf, 0x16u);
    }
    v15 = v11;
  }
  else
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412546;
      v38 = v6;
      __int16 v39 = 2112;
      v40 = v5;
      _os_log_impl(&dword_1B4900000, v13, OS_LOG_TYPE_DEFAULT, "[ALCityManager.defaultCitiesForLocaleCode:%@] returned NO cities.  Trying [ALCityManager.defaultCitiesForLocaleCode:%@]", buf, 0x16u);
    }

    v16 = [MEMORY[0x1E4F4BE38] sharedManager];
    v15 = [v16 defaultCitiesForLocaleCode:v5];

    uint64_t v17 = [(__CFString *)v15 count];
    v13 = WCLogForCategory(1uLL);
    BOOL v18 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (!v18) {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 138412546;
      v38 = v5;
      __int16 v39 = 2112;
      v40 = v15;
      v19 = "[ALCityManager.defaultCitiesForLocaleCode:%@] returned the following cities:%@";
      v20 = v13;
      uint32_t v21 = 22;
    }
    else
    {
      if (!v18) {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 138412290;
      v38 = v5;
      v19 = "[ALCityManager.defaultCitiesForLocaleCode:%@] returned NO cities.  We are out of luck";
      v20 = v13;
      uint32_t v21 = 12;
    }
    _os_log_impl(&dword_1B4900000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
  }
LABEL_23:

  if ([(__CFString *)v15 count])
  {
    v30 = v5;
    v31 = v4;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v22 = v15;
    uint64_t v23 = [(__CFString *)v22 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v33 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = +[WCDefaultCity cityFromAlCity:](WCDefaultCity, "cityFromAlCity:", *(void *)(*((void *)&v32 + 1) + 8 * i), v30, v31, (void)v32);
          if (v27) {
            [(__CFString *)v3 addObject:v27];
          }
        }
        uint64_t v24 = [(__CFString *)v22 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v24);
    }

    v5 = v30;
    v4 = v31;
  }
  v28 = WCLogForCategory(1uLL);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v3;
    _os_log_impl(&dword_1B4900000, v28, OS_LOG_TYPE_DEFAULT, "Built and returning the following WCDefaultCities:%@", buf, 0xCu);
  }

  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)&self->_defaultCities, v3);
  os_unfair_lock_unlock(&self->_dataSynchronizationLock);

  return v3;
}

- (WCDefaultCityManager)init
{
  return (WCDefaultCityManager *)[(WCDefaultCityManager *)self initDeferLoading:0];
}

- (NSArray)defaultCities
{
  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)[(NSArray *)self->_defaultCities copy];
  os_unfair_lock_unlock(p_dataSynchronizationLock);
  if (!v4)
  {
    v4 = [(WCDefaultCityManager *)self reloadDefaultCities];
  }
  return (NSArray *)v4;
}

- (id)defaultCityForLocalTimeZone
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = WCLogForCategory(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1B4900000, v2, OS_LOG_TYPE_DEFAULT, "About to ask the ALCityManager for our defaultCityForTimeZone:localTimeZone", (uint8_t *)&v9, 2u);
  }

  v3 = [MEMORY[0x1E4F4BE38] sharedManager];
  v4 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  v5 = [v3 defaultCityForTimeZone:v4];

  v6 = WCLogForCategory(1uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1B4900000, v6, OS_LOG_TYPE_DEFAULT, "Obtained default ALCity for local timezone=%@", (uint8_t *)&v9, 0xCu);
  }

  dispatch_queue_t v7 = +[WCDefaultCity cityFromAlCity:v5];

  return v7;
}

- (void)setDefaultCities:(id)a3
{
}

- (os_unfair_lock_s)dataSynchronizationLock
{
  return self->_dataSynchronizationLock;
}

- (OS_dispatch_queue)reloadQueue
{
  return self->_reloadQueue;
}

- (void)setReloadQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadQueue, 0);
  objc_storeStrong((id *)&self->_defaultCities, 0);
}

@end