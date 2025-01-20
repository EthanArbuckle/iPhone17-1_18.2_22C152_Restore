@interface WeatherCloudPreferences
- (BOOL)areCloudCities:(id)a3 equalToLocalCities:(id)a4;
- (BOOL)shouldWriteCitiesToCloud:(id)a3;
- (SynchronizedDefaultsDelegate)syncDelegate;
- (WeatherCloudPreferences)initWithLocalPreferences:(id)a3;
- (WeatherCloudPreferences)initWithLocalPreferences:(id)a3 persistence:(id)a4;
- (WeatherPreferences)localPreferences;
- (WeatherPreferencesPersistence)cloudStore;
- (id)citiesByEnforcingSizeLimitOnResults:(id)a3;
- (id)cloudRepresentationFromCities:(id)a3;
- (id)prepareLocalCitiesForReconciliation:(id)a3 isInitialSync:(BOOL)a4;
- (id)reconcileCloudCities:(id)a3 withLocal:(id)a4 isInitialSync:(BOOL)a5;
- (void)_synchronize:(BOOL)a3;
- (void)cloudCitiesChangedExternally:(id)a3;
- (void)cloudPersistenceDidSynchronize:(id)a3;
- (void)forceSync;
- (void)purgeLegacyCloudCities;
- (void)saveCitiesToCloud:(id)a3;
- (void)setCloudStore:(id)a3;
- (void)setCloudStoreCities:(id)a3;
- (void)setLocalPreferences:(id)a3;
- (void)setSyncDelegate:(id)a3;
- (void)updateLocalStoreWithRemoteChanges:(id)a3;
@end

@implementation WeatherCloudPreferences

- (WeatherCloudPreferences)initWithLocalPreferences:(id)a3
{
  id v4 = a3;
  v5 = +[WeatherCloudPersistence cloudPersistenceWithDelegate:self];
  v6 = [(WeatherCloudPreferences *)self initWithLocalPreferences:v4 persistence:v5];

  return v6;
}

- (WeatherCloudPreferences)initWithLocalPreferences:(id)a3 persistence:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[WeatherCloudPersistence processIsWhitelistedForSync])
  {
    [(WeatherCloudPreferences *)v8 setLocalPreferences:v6];
    [(WeatherCloudPreferences *)self setCloudStore:v7];
    [(WeatherCloudPreferences *)self purgeLegacyCloudCities];
    objc_opt_class();
    id v9 = v7;
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;

    [v11 setDelegate:self];
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    v13 = [(WeatherCloudPreferences *)self cloudStore];
    [v12 addObserver:self selector:sel_cloudCitiesChangedExternally_ name:@"WeatherCloudStoreChangedExternally" object:v13];

    self = self;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)purgeLegacyCloudCities
{
  v3 = [(WeatherCloudPreferences *)self cloudStore];
  id v6 = [v3 objectForKey:@"CloudCities"];

  if ([v6 count])
  {
    id v4 = [(WeatherCloudPreferences *)self cloudStore];
    [v4 removeObjectForKey:@"CloudCities"];

    v5 = [(WeatherCloudPreferences *)self cloudStore];
    [v5 synchronize];
  }
}

- (void)setSyncDelegate:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_syncDelegate = &self->_syncDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_syncDelegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)p_syncDelegate, v4);
    id v7 = WALogForCategory(5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_226D1D000, v7, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] CloudPreferences setting syncDelegate to %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (id)cloudRepresentationFromCities:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_11);
}

id __57__WeatherCloudPreferences_cloudRepresentationFromCities___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CityPersistenceConversions cloudDictionaryRepresentationOfCity:a2];
}

- (id)citiesByEnforcingSizeLimitOnResults:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ((unint64_t)[v3 count] <= 0x14)
  {
    id v6 = v3;
  }
  else
  {
    id v4 = objc_msgSend(v3, "subarrayWithRange:", 20, objc_msgSend(v3, "count") - 20);
    v5 = WALogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_226D1D000, v5, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] City list exceeds size limit after sync, dropping %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(v3, "subarrayWithRange:", 0, 20);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)areCloudCities:(id)a3 equalToLocalCities:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_msgSend(a4, "na_filter:", &__block_literal_global_7_0);
  id v7 = (void *)[v6 copy];

  int v8 = objc_msgSend(v5, "na_map:", &__block_literal_global_10);
  id v9 = (void *)[v8 copy];

  uint64_t v10 = [v9 count];
  if (v10 == [v7 count])
  {
    if ([v7 count])
    {
      unint64_t v11 = 0;
      do
      {
        v12 = [v7 objectAtIndexedSubscript:v11];
        v13 = [v9 objectAtIndexedSubscript:v11];
        char v14 = [v12 isDuplicateOfCity:v13];

        if ((v14 & 1) == 0) {
          break;
        }
        ++v11;
      }
      while (v11 < [v7 count]);
    }
    else
    {
      char v14 = 1;
    }
  }
  else
  {
    v15 = WALogForCategory(5);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      v18 = v9;
      __int16 v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_226D1D000, v15, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] Cloud and local cities arrays are different lengths.\nConverted cloud cities: %@\nConverted local cities: %@\n", (uint8_t *)&v17, 0x16u);
    }

    char v14 = 0;
  }

  return v14;
}

uint64_t __61__WeatherCloudPreferences_areCloudCities_equalToLocalCities___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isLocalWeatherCity] ^ 1;
}

id __61__WeatherCloudPreferences_areCloudCities_equalToLocalCities___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[CityPersistenceConversions cityFromCloudDictionary:a2];
}

- (void)cloudCitiesChangedExternally:(id)a3
{
  id v4 = a3;
  id v5 = WALogForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226D1D000, v5, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] CloudCitiesChangedExternally received", buf, 2u);
  }

  id v6 = (void *)MEMORY[0x263EFF980];
  id v7 = [(WeatherCloudPreferences *)self localPreferences];
  int v8 = [v7 loadSavedCities];
  id v9 = [v6 arrayWithArray:v8];

  uint64_t v10 = [(WeatherCloudPreferences *)self cloudStore];
  unint64_t v11 = [v10 objectForKey:@"CloudCities_v2.0"];

  v12 = [v4 userInfo];

  v13 = [v12 objectForKey:@"WeatherCloudStoreIsInitialSyncKey"];
  uint64_t v14 = [v13 BOOLValue];

  v15 = [(WeatherCloudPreferences *)self reconcileCloudCities:v11 withLocal:v9 isInitialSync:v14];
  if (![(WeatherCloudPreferences *)self areCloudCities:v11 equalToLocalCities:v9]|| v14)
  {
    [(WeatherCloudPreferences *)self updateLocalStoreWithRemoteChanges:v15];
    if (v14) {
      [(WeatherCloudPreferences *)self saveCitiesToCloud:v15];
    }
  }
  else
  {
    objc_super v16 = WALogForCategory(5);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v17 = 0;
      _os_log_impl(&dword_226D1D000, v16, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] No changes after reconciling cloud with local", v17, 2u);
    }
  }
}

- (void)updateLocalStoreWithRemoteChanges:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WALogForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_226D1D000, v5, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] Updating local store with reconciled changes: %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(WeatherCloudPreferences *)self localPreferences];
  [v6 saveToDiskWithCities:v4 activeCity:0];

  id v7 = [(WeatherCloudPreferences *)self syncDelegate];
  [v7 ubiquitousDefaultsDidChange:v4];
}

- (id)reconcileCloudCities:(id)a3 withLocal:(id)a4 isInitialSync:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = WALogForCategory(5);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v11 = objc_msgSend(v8, "na_map:", &__block_literal_global_13_0);
    *(_DWORD *)buf = 138412290;
    v36 = v11;
    _os_log_impl(&dword_226D1D000, v10, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] Preparing to reconcile local data with cities from cloud: %@", buf, 0xCu);
  }
  v12 = +[WeatherInternalPreferences sharedInternalPreferences];
  int v13 = [v12 BOOLForKey:@"AlwaysUseLocallyAvailableSavedCities"];

  if (v13)
  {
    uint64_t v14 = WALogForCategory(5);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "[WeatherKVS] AlwaysUseLocallyAvailableSavedCities = 1, drop cloud cities and use saved cities.";
LABEL_10:
      _os_log_impl(&dword_226D1D000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (!v8 && v5)
  {
    uint64_t v14 = WALogForCategory(5);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "[WeatherKVS] No cities present in cloud on initial sync. Keeping local cities.";
      goto LABEL_10;
    }
LABEL_11:

    id v16 = v9;
    goto LABEL_28;
  }
  if (v8 || v5)
  {
    v18 = [MEMORY[0x263EFF980] array];
    __int16 v19 = objc_msgSend(v8, "na_map:", &__block_literal_global_18);
    if (v5)
    {
      v20 = [(WeatherCloudPreferences *)self prepareLocalCitiesForReconciliation:v9 isInitialSync:1];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __72__WeatherCloudPreferences_reconcileCloudCities_withLocal_isInitialSync___block_invoke_19;
      v33[3] = &unk_2647E09B8;
      id v21 = v19;
      id v34 = v21;
      objc_msgSend(v20, "na_each:", v33);
      v22 = WALogForCategory(5);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v20;
        _os_log_impl(&dword_226D1D000, v22, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] Initial sync - merging data from cloud with local cities: %@", buf, 0xCu);
      }

      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      v30 = __72__WeatherCloudPreferences_reconcileCloudCities_withLocal_isInitialSync___block_invoke_21;
      v31 = &unk_2647E0990;
      id v23 = v20;
      id v32 = v23;
      v24 = objc_msgSend(v21, "na_filter:", &v28);
      objc_msgSend(v18, "addObjectsFromArray:", v23, v28, v29, v30, v31);
      [v18 addObjectsFromArray:v24];
      v25 = WALogForCategory(5);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v18;
        _os_log_impl(&dword_226D1D000, v25, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] Initial sync - merge results: %@", buf, 0xCu);
      }

      id v16 = [(WeatherCloudPreferences *)self citiesByEnforcingSizeLimitOnResults:v18];
    }
    else
    {
      v26 = WALogForCategory(5);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226D1D000, v26, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] Not initial sync, so replacing local cities with list from cloud", buf, 2u);
      }

      [v18 addObjectsFromArray:v19];
      id v16 = [(WeatherCloudPreferences *)self citiesByEnforcingSizeLimitOnResults:v18];
    }
  }
  else
  {
    int v17 = WALogForCategory(5);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226D1D000, v17, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] All cities deleted from cloud. Resetting local store to the default city list", buf, 2u);
    }

    v18 = [(WeatherCloudPreferences *)self localPreferences];
    id v16 = [v18 _defaultCities];
  }

LABEL_28:
  return v16;
}

uint64_t __72__WeatherCloudPreferences_reconcileCloudCities_withLocal_isInitialSync___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectForKey:*MEMORY[0x263F85E78]];
}

id __72__WeatherCloudPreferences_reconcileCloudCities_withLocal_isInitialSync___block_invoke_16(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 count])
  {
    id v3 = +[CityPersistenceConversions cityFromCloudDictionary:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void __72__WeatherCloudPreferences_reconcileCloudCities_withLocal_isInitialSync___block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 searchTitle];

  if (!v4)
  {
    BOOL v5 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __72__WeatherCloudPreferences_reconcileCloudCities_withLocal_isInitialSync___block_invoke_2;
    v11[3] = &unk_2647E0990;
    id v6 = v3;
    id v12 = v6;
    id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v11);
    id v8 = v7;
    if (v7)
    {
      id v9 = [v7 searchTitle];
      [v6 setSearchTitle:v9];

      uint64_t v10 = [v8 searchSubtitle];
      [v6 setSearchSubtitle:v10];
    }
  }
}

BOOL __72__WeatherCloudPreferences_reconcileCloudCities_withLocal_isInitialSync___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isDuplicateOfCity:*(void *)(a1 + 32)])
  {
    id v4 = [v3 searchTitle];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t __72__WeatherCloudPreferences_reconcileCloudCities_withLocal_isInitialSync___block_invoke_21(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__WeatherCloudPreferences_reconcileCloudCities_withLocal_isInitialSync___block_invoke_2_22;
  v8[3] = &unk_2647E0990;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8) ^ 1;

  return v6;
}

uint64_t __72__WeatherCloudPreferences_reconcileCloudCities_withLocal_isInitialSync___block_invoke_2_22(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isDuplicateOfCity:a2];
}

- (id)prepareLocalCitiesForReconciliation:(id)a3 isInitialSync:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4
    && ([(WeatherCloudPreferences *)self localPreferences],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [(WeatherCloudPreferences *)self cloudRepresentationFromCities:v6],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v7 areCitiesDefault:v8],
        v8,
        v7,
        (v9 & 1) != 0))
  {
    id v10 = (id)MEMORY[0x263EFFA68];
  }
  else
  {
    id v10 = v6;
  }

  return v10;
}

- (void)forceSync
{
}

- (void)cloudPersistenceDidSynchronize:(id)a3
{
}

- (void)_synchronize:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = [(WeatherCloudPreferences *)self cloudStore];
  id v6 = [v5 objectForKey:@"CloudCities_v2.0"];

  id v7 = [(WeatherCloudPreferences *)self localPreferences];
  id v8 = [v7 loadSavedCities];

  char v9 = WALogForCategory(5);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [v6 valueForKeyPath:*MEMORY[0x263F85E78]];
    int v16 = 136315394;
    int v17 = "-[WeatherCloudPreferences _synchronize:]";
    __int16 v18 = 2112;
    __int16 v19 = v10;
    _os_log_impl(&dword_226D1D000, v9, OS_LOG_TYPE_INFO, "%s Cloud cities: %@", (uint8_t *)&v16, 0x16u);
  }
  unint64_t v11 = WALogForCategory(5);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [v8 valueForKeyPath:@"name"];
    int v16 = 136315394;
    int v17 = "-[WeatherCloudPreferences _synchronize:]";
    __int16 v18 = 2112;
    __int16 v19 = v12;
    _os_log_impl(&dword_226D1D000, v11, OS_LOG_TYPE_INFO, "%s Local cities: %@", (uint8_t *)&v16, 0x16u);
  }
  if (![(WeatherCloudPreferences *)self areCloudCities:v6 equalToLocalCities:v8])
  {
    int v13 = WALogForCategory(5);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_226D1D000, v13, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] New cloud data detected after synchronizing", (uint8_t *)&v16, 2u);
    }

    uint64_t v14 = [(WeatherCloudPreferences *)self prepareLocalCitiesForReconciliation:v8 isInitialSync:v3];
    v15 = [(WeatherCloudPreferences *)self reconcileCloudCities:v6 withLocal:v14 isInitialSync:v3];
    [(WeatherCloudPreferences *)self updateLocalStoreWithRemoteChanges:v15];
  }
}

- (void)setCloudStoreCities:(id)a3
{
  objc_msgSend(a3, "na_filter:", &__block_literal_global_28);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v4 = [(WeatherCloudPreferences *)self cloudStore];
  [v4 setObject:v5 forKey:@"CloudCities_v2.0"];
}

BOOL __47__WeatherCloudPreferences_setCloudStoreCities___block_invoke(uint64_t a1, void *a2)
{
  return [a2 count] != 0;
}

- (void)saveCitiesToCloud:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v4 = objc_msgSend(a3, "na_filter:", &__block_literal_global_30);
  if ([(WeatherCloudPreferences *)self shouldWriteCitiesToCloud:v4])
  {
    id v5 = [(WeatherCloudPreferences *)self cloudRepresentationFromCities:v4];
    [(WeatherCloudPreferences *)self setCloudStoreCities:v5];

    id v6 = [(WeatherCloudPreferences *)self cloudStore];
    [v6 synchronize];

    id v7 = WALogForCategory(5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      id v8 = "[WeatherKVS] Saved cities to cloud store: %@";
      char v9 = v7;
      uint32_t v10 = 12;
LABEL_6:
      _os_log_impl(&dword_226D1D000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v10);
    }
  }
  else
  {
    id v7 = WALogForCategory(5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      id v8 = "[WeatherKVS] Skipping cloud save request - cloud already matches local.";
      char v9 = v7;
      uint32_t v10 = 2;
      goto LABEL_6;
    }
  }
}

uint64_t __45__WeatherCloudPreferences_saveCitiesToCloud___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isLocalWeatherCity] ^ 1;
}

- (BOOL)shouldWriteCitiesToCloud:(id)a3
{
  id v4 = a3;
  id v5 = [(WeatherCloudPreferences *)self localPreferences];
  id v6 = [(WeatherCloudPreferences *)self cloudRepresentationFromCities:v4];
  char v7 = [v5 areCitiesDefault:v6];

  if (v7)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    char v9 = [(WeatherCloudPreferences *)self cloudStore];
    uint32_t v10 = [v9 objectForKey:@"CloudCities_v2.0"];
    BOOL v8 = ![(WeatherCloudPreferences *)self areCloudCities:v10 equalToLocalCities:v4];
  }
  return v8;
}

- (WeatherPreferencesPersistence)cloudStore
{
  return self->_cloudStore;
}

- (void)setCloudStore:(id)a3
{
}

- (SynchronizedDefaultsDelegate)syncDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_syncDelegate);
  return (SynchronizedDefaultsDelegate *)WeakRetained;
}

- (WeatherPreferences)localPreferences
{
  return (WeatherPreferences *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalPreferences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localPreferences, 0);
  objc_destroyWeak((id *)&self->_syncDelegate);
  objc_storeStrong((id *)&self->_cloudStore, 0);
}

@end