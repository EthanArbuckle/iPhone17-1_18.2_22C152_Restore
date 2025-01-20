@interface WeatherPreferences
+ (BOOL)performUpgradeOfPersistence:(id)a3 fileManager:(id)a4 error:(id *)a5;
+ (WeatherPreferences)preferencesWithPersistence:(id)a3;
+ (id)readInternalDefaultValueForKey:(id)a3;
+ (id)serviceDebuggingPath;
+ (id)sharedPreferences;
+ (id)userDefaultsPersistence;
- (BOOL)_defaultsAreValid;
- (BOOL)_defaultsCurrent;
- (BOOL)areCitiesDefault:(id)a3;
- (BOOL)ensureValidSelectedCityID;
- (BOOL)isCelsius;
- (BOOL)isLocalWeatherEnabled;
- (BOOL)readTemperatureUnits;
- (BOOL)serviceDebugging;
- (BOOL)userGroupPrefsLockedWhenInit;
- (City)localWeatherCity;
- (NSDate)lastUpdated;
- (SynchronizedDefaultsDelegate)syncDelegate;
- (WeatherCloudPreferences)cloudPreferences;
- (WeatherPreferences)init;
- (WeatherPreferences)initWithPersistence:(id)a3;
- (id)UUID;
- (id)_cacheDirectoryPath;
- (id)_defaultCities;
- (id)citiesByConsolidatingDuplicates:(id)a3 originalOrder:(id)a4;
- (id)citiesByConsolidatingDuplicatesInBucket:(id)a3;
- (id)cityFromPreferencesDictionary:(id)a3;
- (id)loadDefaultSelectedCityID;
- (id)loadSavedCities;
- (id)preferencesDictionaryForCity:(id)a3;
- (id)readDefaultValueForKey:(id)a3;
- (id)readInternalDefaultValueForKey:(id)a3;
- (id)twcLogoURL;
- (id)twcLogoURL:(id)a3;
- (int)loadActiveCity;
- (int)loadDefaultSelectedCity;
- (int)userTemperatureUnit;
- (void)_clearCachedObjects;
- (void)adjustPrefsForLocalWeatherEnabled:(BOOL)a3;
- (void)forceSyncCloudPreferences;
- (void)registerTemperatureUnits;
- (void)resetLocale;
- (void)saveToDiskWithCities:(id)a3;
- (void)saveToDiskWithCities:(id)a3 activeCity:(unint64_t)a4;
- (void)saveToDiskWithCity:(id)a3 forActiveIndex:(unint64_t)a4;
- (void)saveToDiskWithLocalWeatherCity:(id)a3;
- (void)saveToUbiquitousStore;
- (void)setActiveCity:(unint64_t)a3;
- (void)setCelsius:(BOOL)a3;
- (void)setCloudPreferences:(id)a3;
- (void)setDefaultCities:(id)a3;
- (void)setDefaultSelectedCity:(unint64_t)a3;
- (void)setDefaultSelectedCityID:(id)a3;
- (void)setLocalWeatherEnabled:(BOOL)a3;
- (void)setSyncDelegate:(id)a3;
- (void)setUserGroupPrefsLockedWhenInit:(BOOL)a3;
- (void)setupUbiquitousStoreIfNeeded;
- (void)synchronizeStateToDisk;
- (void)synchronizeStateToDiskDoNotify:(BOOL)a3;
- (void)temperatureUnitObserver:(id)a3 didChangeTemperatureUnitTo:(int)a4;
- (void)writeDefaultValue:(id)a3 forKey:(id)a4;
@end

@implementation WeatherPreferences

+ (id)sharedPreferences
{
  if (MKBDeviceUnlockedSinceBoot() || (int v2 = MKBGetDeviceLockState(), v3 = 0, v2 == 3))
  {
    if (sharedPreferences_onceToken != -1) {
      dispatch_once(&sharedPreferences_onceToken, &__block_literal_global_16);
    }
    id v3 = (id)sharedPreferences___sharedPreferences;
  }
  return v3;
}

void __39__WeatherPreferences_sharedPreferences__block_invoke()
{
  if (!sharedPreferences___sharedPreferences)
  {
    v0 = objc_alloc_init(WeatherPreferences);
    v1 = (void *)sharedPreferences___sharedPreferences;
    sharedPreferences___sharedPreferences = (uint64_t)v0;

    int v2 = (void *)sharedPreferences___sharedPreferences;
    [v2 setupUbiquitousStoreIfNeeded];
  }
}

+ (id)userDefaultsPersistence
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v2 = [MEMORY[0x263F08850] defaultManager];
  id v3 = [v2 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.weather"];

  v4 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) _initWithSuiteName:@"group.com.apple.weather" container:v3];
  v5 = WALogForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [v4 dictionaryRepresentation];
    v7 = [v6 valueForKey:@"Cities"];
    v8 = [v7 valueForKeyPath:@"Name"];
    int v11 = 136315650;
    v12 = "+[WeatherPreferences userDefaultsPersistence]";
    __int16 v13 = 2112;
    v14 = v3;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_226D1D000, v5, OS_LOG_TYPE_INFO, "%s tempGroupUrl? %@, Cities: %@", (uint8_t *)&v11, 0x20u);
  }
  v9 = [[WeatherUserDefaults alloc] initWithUserDefaults:v4];

  return v9;
}

+ (WeatherPreferences)preferencesWithPersistence:(id)a3
{
  id v3 = a3;
  v4 = [[WeatherPreferences alloc] initWithPersistence:v3];

  return v4;
}

- (WeatherPreferences)init
{
  id v3 = [(id)objc_opt_class() userDefaultsPersistence];
  v4 = [(WeatherPreferences *)self initWithPersistence:v3];

  return v4;
}

- (WeatherPreferences)initWithPersistence:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WeatherPreferences;
  v6 = [(WeatherPreferences *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_persistence, a3);
    v8 = +[WeatherInternalPreferences sharedInternalPreferences];
    v9 = [v8 objectForKey:@"ServiceDebugging"];
    v7->_serviceDebugging = [v9 BOOLValue];

    v10 = +[WeatherInternalPreferences sharedInternalPreferences];
    int v11 = [v10 objectForKey:@"LogLocaleAndUnits"];
    v7->_logUnitsAndLocale = [v11 BOOLValue];

    v12 = [MEMORY[0x263F85F88] sharedObserver];
    [v12 addObserver:v7];
  }
  return v7;
}

- (void)setSyncDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(WeatherPreferences *)self cloudPreferences];
  [v5 setSyncDelegate:v4];
}

- (void)setupUbiquitousStoreIfNeeded
{
  id v3 = [(WeatherPreferences *)self cloudPreferences];

  if (!v3)
  {
    id v4 = [[WeatherCloudPreferences alloc] initWithLocalPreferences:self];
    [(WeatherPreferences *)self setCloudPreferences:v4];
  }
}

- (BOOL)ensureValidSelectedCityID
{
  id v3 = [(WeatherPreferences *)self loadSavedCities];
  id v4 = [(WeatherPreferencesPersistence *)self->_persistence objectForKey:@"DefaultSelectedCity"];
  id v5 = v4;
  if (v4)
  {
    int v6 = [v4 intValue];
    if ([v3 count] > (unint64_t)v6)
    {
      v7 = objc_msgSend(v3, "objectAtIndexedSubscript:", (int)objc_msgSend(v5, "intValue"));
      if ([v7 isLocalWeatherCity])
      {
        v8 = @"_localCity_";
      }
      else
      {
        v8 = [v7 locationID];
      }
      v9 = v8;
      [(WeatherPreferences *)self setDefaultSelectedCityID:v8];
    }
    [(WeatherPreferencesPersistence *)self->_persistence setObject:0 forKey:@"DefaultSelectedCity"];
    [(WeatherPreferences *)self synchronizeStateToDiskDoNotify:0];
  }

  return v5 != 0;
}

- (void)adjustPrefsForLocalWeatherEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WeatherPreferences *)self isLocalWeatherEnabled] != a3)
  {
    [(WeatherPreferences *)self setLocalWeatherEnabled:v3];
    [(WeatherPreferences *)self synchronizeStateToDiskDoNotify:1];
  }
}

- (void)registerTemperatureUnits
{
}

- (BOOL)readTemperatureUnits
{
  return 1;
}

- (void)setCelsius:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_logUnitsAndLocale)
  {
    id v5 = WALogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      [(WeatherPreferences *)self userTemperatureUnit];
      uint64_t v6 = NSStringFromWFTemperatureUnit();
      v7 = (void *)v6;
      v8 = @"FAHRENHEIT";
      if (v3) {
        v8 = @"CELSIUS";
      }
      int v12 = 138412546;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      __int16 v15 = v8;
      _os_log_impl(&dword_226D1D000, v5, OS_LOG_TYPE_DEFAULT, "Changing temperature units from %@ to %@", (uint8_t *)&v12, 0x16u);
    }
  }
  v9 = (void *)[objc_alloc(MEMORY[0x263F85F80]) initWithResultHandler:0];
  v10 = v9;
  if (v3) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 1;
  }
  [v9 setTemperatureUnit:v11];
  [v10 start];
}

- (BOOL)isCelsius
{
  return [(WeatherPreferences *)self userTemperatureUnit] == 2;
}

- (int)userTemperatureUnit
{
  int v2 = [MEMORY[0x263F85F88] sharedObserver];
  int v3 = [v2 temperatureUnit];

  return v3;
}

- (BOOL)_defaultsAreValid
{
  int v2 = [(WeatherPreferencesPersistence *)self->_persistence stringForKey:@"PrefsVersion"];
  uint64_t v3 = 0;
  do
  {
    char v4 = [v2 isEqualToString:SupportedPrefsVersions[v3]];
    if (v4) {
      break;
    }
  }
  while (v3++ != 7);

  return v4;
}

- (BOOL)_defaultsCurrent
{
  int v2 = [(WeatherPreferencesPersistence *)self->_persistence stringForKey:@"PrefsVersion"];
  uint64_t v3 = v2;
  BOOL v4 = !v2 || [v2 isEqualToString:@"2.1"];

  return v4;
}

- (id)preferencesDictionaryForCity:(id)a3
{
  return +[CityPersistenceConversions dictionaryRepresentationOfCity:a3];
}

- (id)cityFromPreferencesDictionary:(id)a3
{
  v12[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(WeatherPreferences *)self _defaultsCurrent])
  {
    v12[0] = 0x26DAE1210;
    v12[1] = 0x26DAE1230;
    v12[2] = 0x26DAE1250;
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:3];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __52__WeatherPreferences_cityFromPreferencesDictionary___block_invoke;
    v10[3] = &unk_2647E0FC8;
    id v11 = v5;
    id v6 = v5;
    uint64_t v7 = objc_msgSend(v4, "na_filter:", v10);

    id v4 = (id)v7;
  }
  v8 = +[CityPersistenceConversions cityFromDictionary:v4];

  return v8;
}

uint64_t __52__WeatherPreferences_cityFromPreferencesDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (City)localWeatherCity
{
  uint64_t v3 = [(WeatherPreferencesPersistence *)self->_persistence dictionaryForKey:@"LocalWeather"];
  if (v3)
  {
    id v4 = [(WeatherPreferences *)self cityFromPreferencesDictionary:v3];
    [v4 setIsLocalWeatherCity:1];
  }
  else
  {
    id v4 = 0;
  }

  return (City *)v4;
}

- (void)saveToDiskWithLocalWeatherCity:(id)a3
{
  persistence = self->_persistence;
  id v5 = [(WeatherPreferences *)self preferencesDictionaryForCity:a3];
  [(WeatherPreferencesPersistence *)persistence setObject:v5 forKey:@"LocalWeather"];

  [(WeatherPreferences *)self synchronizeStateToDiskDoNotify:1];
}

- (void)saveToDiskWithCity:(id)a3 forActiveIndex:(unint64_t)a4
{
  persistence = self->_persistence;
  id v7 = a3;
  v8 = [(WeatherPreferencesPersistence *)persistence arrayForKey:@"Cities"];
  id v12 = (id)[v8 mutableCopy];

  v9 = [(WeatherPreferences *)self preferencesDictionaryForCity:v7];

  if (v9 && [v12 count] > a4) {
    [v12 replaceObjectAtIndex:a4 withObject:v9];
  }
  [(WeatherPreferencesPersistence *)self->_persistence setObject:v12 forKey:@"Cities"];
  v10 = self->_persistence;
  id v11 = [MEMORY[0x263EFF910] date];
  [(WeatherPreferencesPersistence *)v10 setObject:v11 forKey:@"LastUpdated"];

  [(WeatherPreferences *)self synchronizeStateToDiskDoNotify:1];
}

- (void)saveToDiskWithCities:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[WeatherInternalPreferences sharedInternalPreferences];
  int v6 = [v5 BOOLForKey:@"AlwaysUseLocallyAvailableSavedCities"];

  id v7 = WALogForCategory(5);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_226D1D000, v7, OS_LOG_TYPE_DEFAULT, "[WeatherPreferences] AlwaysUseLocallyAvailableSavedCities = 1, do not save new cities to disk.", (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    if (v8)
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_impl(&dword_226D1D000, v7, OS_LOG_TYPE_DEFAULT, "Saving cities to disk: %@", (uint8_t *)&v16, 0xCu);
    }

    id v7 = [MEMORY[0x263EFF980] array];
    uint64_t v9 = [v4 count];
    if (v9)
    {
      uint64_t v10 = v9;
      for (uint64_t i = 0; i != v10; ++i)
      {
        id v12 = [v4 objectAtIndex:i];
        if (([v12 isLocalWeatherCity] & 1) == 0 && (objc_msgSend(v12, "isTransient") & 1) == 0)
        {
          uint64_t v13 = [(WeatherPreferences *)self preferencesDictionaryForCity:v12];
          [v7 na_safeAddObject:v13];
        }
      }
    }
    [(WeatherPreferencesPersistence *)self->_persistence setObject:v7 forKey:@"Cities"];
    persistence = self->_persistence;
    __int16 v15 = [MEMORY[0x263EFF910] date];
    [(WeatherPreferencesPersistence *)persistence setObject:v15 forKey:@"LastUpdated"];

    [(WeatherPreferencesPersistence *)self->_persistence setObject:@"The Weather Channel" forKey:@"ServiceProvider"];
    [(WeatherPreferencesPersistence *)self->_persistence setObject:@"2.1" forKey:@"PrefsVersion"];
    [(WeatherPreferences *)self synchronizeStateToDiskDoNotify:1];
  }
}

- (void)saveToDiskWithCities:(id)a3 activeCity:(unint64_t)a4
{
  [(WeatherPreferences *)self saveToDiskWithCities:a3];
  persistence = self->_persistence;
  id v7 = [NSNumber numberWithUnsignedInteger:a4];
  [(WeatherPreferencesPersistence *)persistence setObject:v7 forKey:@"ActiveCity"];

  [(WeatherPreferences *)self synchronizeStateToDiskDoNotify:1];
}

- (id)_defaultCities
{
  int v2 = (void *)__defaultCities;
  if (!__defaultCities)
  {
    if (_defaultCities_onceToken != -1) {
      dispatch_once(&_defaultCities_onceToken, &__block_literal_global_106);
    }
    dispatch_sync((dispatch_queue_t)_defaultCities_ALCityManagerDispatchQueue, &__block_literal_global_109);
    int v2 = (void *)__defaultCities;
  }
  return v2;
}

uint64_t __36__WeatherPreferences__defaultCities__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.weather.ALCityManagerDispatchQueue", 0);
  uint64_t v1 = _defaultCities_ALCityManagerDispatchQueue;
  _defaultCities_ALCityManagerDispatchQueue = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void __36__WeatherPreferences__defaultCities__block_invoke_2()
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v0 = objc_alloc_init(MEMORY[0x263EFF980]);
  CFLocaleRef v1 = CFLocaleCopyCurrent();
  CFTypeRef Value = CFLocaleGetValue(v1, (CFLocaleKey)*MEMORY[0x263EFFCB0]);
  CFTypeRef v3 = CFLocaleGetValue(v1, (CFLocaleKey)*MEMORY[0x263EFFCE8]);
  id v4 = [MEMORY[0x263F25598] sharedManager];
  id v5 = [v4 defaultCitiesForLocaleCode:v3];

  if (v5
    || ([MEMORY[0x263F25598] sharedManager],
        int v6 = objc_claimAutoreleasedReturnValue(),
        [v6 defaultCitiesForLocaleCode:Value],
        id v5 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        v5))
  {
    if ([v5 count])
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v5 = v5;
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v14;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v14 != v9) {
              objc_enumerationMutation(v5);
            }
            id v11 = +[CityPersistenceConversions cityFromALCity:](CityPersistenceConversions, "cityFromALCity:", *(void *)(*((void *)&v13 + 1) + 8 * v10), (void)v13);
            objc_msgSend(v0, "na_safeAddObject:", v11);

            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v8);
      }
    }
  }
  CFRelease(v1);
  id v12 = (void *)__defaultCities;
  __defaultCities = (uint64_t)v0;
}

- (void)setDefaultCities:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = WALogForCategory(5);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [v3 valueForKeyPath:@"name"];
    *(_DWORD *)buf = 136315394;
    v23 = "-[WeatherPreferences setDefaultCities:]";
    __int16 v24 = 2112;
    v25 = v5;
    _os_log_impl(&dword_226D1D000, v4, OS_LOG_TYPE_INFO, "%s cities: %@", buf, 0x16u);
  }
  if (v3)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v16 = v3;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = v12;
            long long v14 = +[CityPersistenceConversions cityFromALCity:v13];
            objc_msgSend(v6, "na_safeAddObject:", v14);
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              objc_msgSend(v6, "na_safeAddObject:", v12);
            }
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    long long v15 = (void *)__defaultCities;
    __defaultCities = (uint64_t)v6;

    id v3 = v16;
  }
}

- (id)loadSavedCities
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v3 = WALogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v53 = "-[WeatherPreferences loadSavedCities]";
    _os_log_impl(&dword_226D1D000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v4 = [MEMORY[0x263EFF980] array];
  id v5 = [MEMORY[0x263EFF980] array];
  id v6 = @"Cities";
  id v7 = +[WeatherInternalPreferences sharedInternalPreferences];
  int v8 = [v7 BOOLForKey:@"AlwaysUseLocallyAvailableSavedCities"];

  if (v8)
  {
    uint64_t v9 = WALogForCategory(5);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226D1D000, v9, OS_LOG_TYPE_DEFAULT, "[WeatherPreferences] AlwaysUseLocallyAvailableSavedCities = 1, load cities using perf cities key.", buf, 2u);
    }

    id v6 = @"PerfCities";
  }
  uint64_t v10 = [(WeatherPreferencesPersistence *)self->_persistence arrayForKey:v6];
  uint64_t v11 = objc_msgSend(v10, "na_filter:", &__block_literal_global_121);
  [v5 addObjectsFromArray:v11];

  BOOL v12 = [(WeatherPreferences *)self isLocalWeatherEnabled];
  id v13 = WALogForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    long long v14 = [NSNumber numberWithBool:v12];
    *(_DWORD *)buf = 138412290;
    v53 = v14;
    _os_log_impl(&dword_226D1D000, v13, OS_LOG_TYPE_DEFAULT, "in loadSavedCities, localWeatherEnabled=%@", buf, 0xCu);
  }
  if (v12)
  {
    long long v15 = [(WeatherPreferencesPersistence *)self->_persistence objectForKey:@"LocalWeather"];
    if (v15)
    {
      id v16 = [(WeatherPreferences *)self cityFromPreferencesDictionary:v15];
    }
    else
    {
      id v16 = (char *)objc_opt_new();
    }
    long long v17 = v16;
    [v16 setIsLocalWeatherCity:1];
    long long v18 = WALogForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v17;
      _os_log_impl(&dword_226D1D000, v18, OS_LOG_TYPE_DEFAULT, "in loadSavedCities, local weather city = %@", buf, 0xCu);
    }

    objc_msgSend(v4, "na_safeAddObject:", v17);
  }
  long long v19 = [MEMORY[0x263EFF980] array];
  if (v5 && [(WeatherPreferences *)self _defaultsAreValid])
  {
    v43 = v6;
    v45 = v4;
    long long v20 = [MEMORY[0x263EFF9A0] dictionary];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v44 = v5;
    id obj = v5;
    uint64_t v21 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = 20 - v12;
      uint64_t v24 = *(void *)v48;
LABEL_20:
      uint64_t v25 = 0;
      while (1)
      {
        if (*(void *)v48 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = self;
        v27 = [(WeatherPreferences *)self cityFromPreferencesDictionary:*(void *)(*((void *)&v47 + 1) + 8 * v25)];
        objc_msgSend(v19, "na_safeAddObject:", v27);
        v28 = [v27 name];
        v29 = [v20 objectForKey:v28];

        if (!v29)
        {
          v29 = [MEMORY[0x263EFF980] array];
        }
        [v29 addObject:v27];
        v30 = [v27 name];
        [v20 setObject:v29 forKey:v30];

        uint64_t v31 = [v19 count];
        self = v26;
        if (v31 == v23) {
          break;
        }
        if (v22 == ++v25)
        {
          uint64_t v22 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
          if (v22) {
            goto LABEL_20;
          }
          break;
        }
      }
    }

    v32 = WALogForCategory(5);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = (const char *)obj;
      _os_log_impl(&dword_226D1D000, v32, OS_LOG_TYPE_DEFAULT, "Retrieved stored cities: %@", buf, 0xCu);
    }

    v33 = WALogForCategory(5);
    id v4 = v45;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = (const char *)v19;
      _os_log_impl(&dword_226D1D000, v33, OS_LOG_TYPE_DEFAULT, "Safely add stored cities: %@", buf, 0xCu);
    }

    uint64_t v34 = [(WeatherPreferences *)self citiesByConsolidatingDuplicates:v20 originalOrder:v19];

    [v45 addObjectsFromArray:v34];
    int v35 = [(WeatherPreferences *)self loadActiveCity];
    if ([v45 count] <= (unint64_t)v35) {
      -[WeatherPreferences setActiveCity:](self, "setActiveCity:", [v45 count] - 1);
    }
    v36 = WALogForCategory(5);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = (const char *)v34;
      _os_log_impl(&dword_226D1D000, v36, OS_LOG_TYPE_DEFAULT, "Return loaded cities: %@", buf, 0xCu);
    }

    id v37 = v45;
    long long v19 = (void *)v34;
    id v6 = v43;
    id v5 = v44;
  }
  else
  {
    v38 = [(WeatherPreferences *)self _defaultCities];
    [v19 addObjectsFromArray:v38];

    if (![v4 count] && !objc_msgSend(v19, "count"))
    {
      v39 = objc_alloc_init(City);
      [(City *)v39 setLatitude:37.3175];
      [(City *)v39 setLongitude:-122.041944];
      [(City *)v39 setName:@"Cupertino"];
      [v4 addObject:v39];
    }
    [v4 addObjectsFromArray:v19];
    v40 = WALogForCategory(5);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = (const char *)v4;
      _os_log_impl(&dword_226D1D000, v40, OS_LOG_TYPE_DEFAULT, "No saved cities, and defaults are not valid. Laod new default cities: %@", buf, 0xCu);
    }

    id v41 = v4;
  }

  return v4;
}

BOOL __37__WeatherPreferences_loadSavedCities__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CityPersistenceConversions cityDictionaryHasValidCoordinates:a2];
}

- (id)citiesByConsolidatingDuplicates:(id)a3 originalOrder:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v16 = a4;
  id v6 = [MEMORY[0x263EFF980] array];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __68__WeatherPreferences_citiesByConsolidatingDuplicates_originalOrder___block_invoke;
  v23[3] = &unk_2647E0FF0;
  id v7 = v6;
  id v24 = v7;
  uint64_t v25 = self;
  uint64_t v26 = &v27;
  [v17 enumerateKeysAndObjectsUsingBlock:v23];
  if (*((unsigned char *)v28 + 24))
  {
    int v8 = [MEMORY[0x263EFF980] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v16;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v18[2] = __68__WeatherPreferences_citiesByConsolidatingDuplicates_originalOrder___block_invoke_2;
          v18[3] = &unk_2647E0990;
          v18[4] = v13;
          long long v14 = objc_msgSend(v7, "na_firstObjectPassingTest:", v18);
          if (v14)
          {
            [v8 addObject:v14];
            [v7 removeObject:v14];
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v31 count:16];
      }
      while (v10);
    }
  }
  else
  {
    int v8 = [MEMORY[0x263EFF980] arrayWithArray:v16];
  }

  _Block_object_dispose(&v27, 8);
  return v8;
}

void __68__WeatherPreferences_citiesByConsolidatingDuplicates_originalOrder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if ([v7 count] == 1)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v7 firstObject];
    [v4 addObject:v5];
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) citiesByConsolidatingDuplicatesInBucket:v7];
    [*(id *)(a1 + 32) addObjectsFromArray:v5];
    uint64_t v6 = [v5 count];
    if (v6 != [v7 count]) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
}

uint64_t __68__WeatherPreferences_citiesByConsolidatingDuplicates_originalOrder___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isDuplicateOfCity:a2];
}

- (id)citiesByConsolidatingDuplicatesInBucket:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  id v5 = [v3 firstObject];
  [v4 addObject:v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __62__WeatherPreferences_citiesByConsolidatingDuplicatesInBucket___block_invoke;
        v13[3] = &unk_2647E0990;
        v13[4] = v11;
        if ((objc_msgSend(v4, "na_all:", v13) & 1) == 0) {
          [v4 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v4;
}

uint64_t __62__WeatherPreferences_citiesByConsolidatingDuplicatesInBucket___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isDuplicateOfCity:*(void *)(a1 + 32)];
}

- (int)loadActiveCity
{
  if ([MEMORY[0x263F1C408] shouldMakeUIForDefaultPNG]) {
    return 0;
  }
  id v3 = [(WeatherPreferencesPersistence *)self->_persistence objectForKey:@"ActiveCity"];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  int v5 = [v3 intValue];

  return v5;
}

- (void)setActiveCity:(unint64_t)a3
{
  persistence = self->_persistence;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(WeatherPreferencesPersistence *)persistence setObject:v4 forKey:@"ActiveCity"];
}

- (int)loadDefaultSelectedCity
{
  int v2 = [(WeatherPreferencesPersistence *)self->_persistence objectForKey:@"DefaultSelectedCity"];
  id v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (id)loadDefaultSelectedCityID
{
  return (id)[(WeatherPreferencesPersistence *)self->_persistence objectForKey:@"userSelectedCityID"];
}

- (void)setDefaultSelectedCity:(unint64_t)a3
{
  persistence = self->_persistence;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(WeatherPreferencesPersistence *)persistence setObject:v4 forKey:@"DefaultSelectedCity"];
}

- (void)setDefaultSelectedCityID:(id)a3
{
}

- (void)synchronizeStateToDiskDoNotify:(BOOL)a3
{
  BOOL v3 = a3;
  [(WeatherPreferencesPersistence *)self->_persistence synchronize];
  [(WeatherPreferences *)self saveToUbiquitousStore];
  if (v3)
  {
    int v5 = WALogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[WeatherPreferences synchronizeStateToDiskDoNotify:](v5);
    }

    id v6 = [MEMORY[0x263F087C8] defaultCenter];
    uint64_t v7 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v8 = [v7 processName];
    [v6 postNotificationName:@"WeatherGroupPrefsDidUpdateNotification" object:v8 userInfo:0 deliverImmediately:1];
  }
}

- (void)synchronizeStateToDisk
{
}

- (void)forceSyncCloudPreferences
{
  id v2 = [(WeatherPreferences *)self cloudPreferences];
  [v2 forceSync];
}

- (id)UUID
{
  p_UUID = (id *)&self->_UUID;
  UUID = self->_UUID;
  if (UUID)
  {
    id v4 = UUID;
    goto LABEL_9;
  }
  id v6 = [(WeatherPreferencesPersistence *)self->_persistence stringForKey:@"UUID"];
  if (v6)
  {
    uint64_t v7 = [(WeatherPreferencesPersistence *)self->_persistence objectForKey:@"UUIDTimestamp"];
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-1209600.0];
      uint64_t v9 = [v7 laterDate:v8];

      if (v9 == v7)
      {
        uint64_t v15 = [v6 copy];
        id v16 = *p_UUID;
        id *p_UUID = (id)v15;

        id v4 = (NSString *)*p_UUID;
        goto LABEL_8;
      }
    }
  }
  CFUUIDRef v10 = CFUUIDCreate(0);
  uint64_t v11 = (__CFString *)CFUUIDCreateString(0, v10);

  CFRelease(v10);
  objc_storeStrong(p_UUID, v11);
  [(WeatherPreferencesPersistence *)self->_persistence setObject:self->_UUID forKey:@"UUID"];
  persistence = self->_persistence;
  uint64_t v13 = [MEMORY[0x263EFF910] date];
  [(WeatherPreferencesPersistence *)persistence setObject:v13 forKey:@"UUIDTimestamp"];

  id v4 = self->_UUID;
  id v6 = v11;
LABEL_8:

LABEL_9:
  return v4;
}

- (id)twcLogoURL
{
  return TWCAttributionURLForTrafficParameter(@"TWC");
}

- (id)twcLogoURL:(id)a3
{
  return TWCAttributionURLForTrafficParameter(a3);
}

- (id)_cacheDirectoryPath
{
  cacheDirectoryPath = self->_cacheDirectoryPath;
  if (!cacheDirectoryPath)
  {
    id v4 = [MEMORY[0x263F1C408] sharedApplication];
    int v5 = [v4 userLibraryDirectory];
    id v6 = [v5 stringByAppendingPathComponent:@"Caches/Weather"];
    uint64_t v7 = self->_cacheDirectoryPath;
    self->_cacheDirectoryPath = v6;

    cacheDirectoryPath = self->_cacheDirectoryPath;
  }
  return cacheDirectoryPath;
}

- (void)writeDefaultValue:(id)a3 forKey:(id)a4
{
}

- (id)readDefaultValueForKey:(id)a3
{
  return (id)[(WeatherPreferencesPersistence *)self->_persistence objectForKey:a3];
}

+ (id)readInternalDefaultValueForKey:(id)a3
{
  id v3 = a3;
  id v4 = +[WeatherInternalPreferences sharedInternalPreferences];
  int v5 = [v4 objectForKey:v3];

  return v5;
}

- (id)readInternalDefaultValueForKey:(id)a3
{
  id v3 = a3;
  id v4 = +[WeatherInternalPreferences sharedInternalPreferences];
  int v5 = [v4 objectForKey:v3];

  return v5;
}

- (void)setLocalWeatherEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = WALogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [NSNumber numberWithBool:v3];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_226D1D000, v5, OS_LOG_TYPE_DEFAULT, "setLocalWeatherEnabled=%@", (uint8_t *)&v7, 0xCu);
  }
  [(WeatherPreferencesPersistence *)self->_persistence setBool:v3 forKey:@"LocalWeatherEnabledKey"];
}

- (BOOL)isLocalWeatherEnabled
{
  id v2 = [(WeatherPreferencesPersistence *)self->_persistence objectForKey:@"LocalWeatherEnabledKey"];
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)serviceDebugging
{
  return self->_serviceDebugging;
}

+ (id)serviceDebuggingPath
{
  if (serviceDebuggingPath_onceToken != -1) {
    dispatch_once(&serviceDebuggingPath_onceToken, &__block_literal_global_138);
  }
  id v2 = (void *)serviceDebuggingPath_debuggingPath;
  return v2;
}

void __42__WeatherPreferences_serviceDebuggingPath__block_invoke()
{
  id v0 = [(id)*MEMORY[0x263F1D020] userLibraryDirectory];
  id v6 = [v0 stringByAppendingPathComponent:@"Weather"];

  CFLocaleRef v1 = [MEMORY[0x263F08850] defaultManager];
  objc_msgSend(v1, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v6, 0);

  id v2 = [v6 stringByAppendingPathComponent:@"ServiceDebugging"];
  BOOL v3 = [v2 stringByResolvingSymlinksInPath];
  uint64_t v4 = [v3 copy];
  int v5 = (void *)serviceDebuggingPath_debuggingPath;
  serviceDebuggingPath_debuggingPath = v4;
}

- (void)resetLocale
{
  id v2 = (void *)__defaultCities;
  __defaultCities = 0;
}

- (void)_clearCachedObjects
{
  cacheDirectoryPath = self->_cacheDirectoryPath;
  self->_cacheDirectoryPath = 0;

  [(WeatherPreferences *)self resetLocale];
}

- (void)saveToUbiquitousStore
{
  BOOL v3 = +[WeatherInternalPreferences sharedInternalPreferences];
  int v4 = [v3 BOOLForKey:@"AlwaysUseLocallyAvailableSavedCities"];

  if (v4)
  {
    int v5 = WALogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226D1D000, v5, OS_LOG_TYPE_DEFAULT, "[WeatherPreferences] AlwaysUseLocallyAvailableSavedCities = 1, do not save new cities to ubiquitous store.", buf, 2u);
    }
  }
  else
  {
    id v7 = [(WeatherPreferences *)self cloudPreferences];
    id v6 = [(WeatherPreferences *)self loadSavedCities];
    [v7 saveCitiesToCloud:v6];
  }
}

- (BOOL)areCitiesDefault:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(WeatherPreferences *)self _defaultCities];
  uint64_t v6 = [v4 count];
  uint64_t v27 = v5;
  if (v6 == [v5 count])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v25 = v4;
      int v9 = 0;
      uint64_t v10 = *(void *)v29;
      uint64_t v11 = *MEMORY[0x263F85E68];
      uint64_t v12 = *MEMORY[0x263F85E70];
      while (2)
      {
        uint64_t v13 = 0;
        uint64_t v14 = v9;
        do
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v28 + 1) + 8 * v13);
          id v16 = [v27 objectAtIndex:v14 + v13];
          long long v17 = [v15 objectForKeyedSubscript:v11];
          [v17 floatValue];
          double v19 = v18;
          long long v20 = [v15 objectForKeyedSubscript:v12];
          [v20 floatValue];
          int v22 = [v16 containsLatitude:v19 longitude:v21];

          if (!v22)
          {
            BOOL v23 = 0;
            goto LABEL_13;
          }
          ++v13;
        }
        while (v8 != v13);
        uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
        int v9 = v14 + v13;
        if (v8) {
          continue;
        }
        break;
      }
      BOOL v23 = 1;
LABEL_13:
      id v4 = v25;
    }
    else
    {
      BOOL v23 = 1;
    }
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (void)temperatureUnitObserver:(id)a3 didChangeTemperatureUnitTo:(int)a4
{
  v9[1] = *MEMORY[0x263EF8340];
  int v5 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  uint64_t v8 = @"kWeatherPrefsUpdateNotificationKey";
  uint64_t v6 = NSStringFromWFTemperatureUnit();
  v9[0] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v5 postNotificationName:@"kWeatherPrefsDidUpdateUserTemperatureUnit" object:self userInfo:v7];
}

+ (BOOL)performUpgradeOfPersistence:(id)a3 fileManager:(id)a4 error:(id *)a5
{
  v33[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (!v8) {
      id v9 = (id)objc_opt_new();
    }
    if (performUpgradeOfPersistence_fileManager_error__onceToken != -1) {
      dispatch_once(&performUpgradeOfPersistence_fileManager_error__onceToken, &__block_literal_global_148);
    }
    *(void *)uint64_t v26 = 0;
    uint64_t v27 = v26;
    uint64_t v28 = 0x3032000000;
    long long v29 = __Block_byref_object_copy__3;
    long long v30 = __Block_byref_object_dispose__3;
    id v31 = 0;
    uint64_t v22 = 0;
    BOOL v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    uint64_t v10 = WALogForCategory(14);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226D1D000, v10, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - Performing Weather migration from the WeatherPreferences...if needed", buf, 2u);
    }

    uint64_t v11 = performUpgradeOfPersistence_fileManager_error__migrationQueue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_150;
    v16[3] = &unk_2647E1088;
    id v9 = v9;
    id v17 = v9;
    double v19 = v26;
    long long v20 = &v22;
    id v18 = v7;
    dispatch_sync(v11, v16);
    if (a5)
    {
      uint64_t v12 = (void *)*((void *)v27 + 5);
      if (v12) {
        *a5 = v12;
      }
    }
    LOBYTE(a5) = *((unsigned char *)v23 + 24) != 0;

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(v26, 8);
  }
  else
  {
    uint64_t v13 = WALogForCategory(14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_226D1D000, v13, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - failed to update persistence.", v26, 2u);
    }

    if (a5)
    {
      uint64_t v32 = *MEMORY[0x263F08320];
      v33[0] = @"persistence was nil; can't upgrade it";
      uint64_t v14 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
      *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.weather.errorDomain" code:3 userInfo:v14];

      LOBYTE(a5) = 0;
    }
  }

  return (char)a5;
}

uint64_t __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.WeatherApp.migrationQueue", 0);
  uint64_t v1 = performUpgradeOfPersistence_fileManager_error__migrationQueue;
  performUpgradeOfPersistence_fileManager_error__migrationQueue = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_150(uint64_t a1)
{
  v85[1] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F08850] defaultManager];
  BOOL v3 = [v2 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.weather"];

  id v4 = WALogForCategory(14);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      v77 = v3;
      _os_log_impl(&dword_226D1D000, v4, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - groupContainers: %@", buf, 0xCu);
    }

    id v4 = [NSURL fileURLWithPath:@"/var/mobile/Library/Preferences/com.apple.weather.plist"];
    uint64_t v6 = [(__CFString *)v3 URLByAppendingPathComponent:@"Library/Preferences/"];
    id v7 = [(__CFString *)v3 URLByAppendingPathComponent:@"Library/Preferences/group.com.apple.weather.plist"];
    id v8 = WALogForCategory(14);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v77 = (__CFString *)v4;
      _os_log_impl(&dword_226D1D000, v8, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - source: %@", buf, 0xCu);
    }

    id v9 = WALogForCategory(14);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v77 = v7;
      _os_log_impl(&dword_226D1D000, v9, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - destination: %@", buf, 0xCu);
    }

    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v4 path];
    LODWORD(v10) = [v10 fileExistsAtPath:v11];

    if (v10)
    {
      uint64_t v12 = *(void **)(a1 + 32);
      uint64_t v13 = [(__CFString *)v7 path];
      LOBYTE(v12) = [v12 fileExistsAtPath:v13];

      if (v12)
      {
        uint64_t v14 = WALogForCategory(14);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_226D1D000, v14, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - destination file is already present, don't overwrite", buf, 2u);
        }

        uint64_t v15 = 0;
      }
      else
      {
        id v16 = *(void **)(a1 + 32);
        id v75 = 0;
        int v17 = [v16 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v75];
        id v18 = v75;
        double v19 = WALogForCategory(14);
        long long v20 = v19;
        if (v17)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v77 = v6;
            _os_log_impl(&dword_226D1D000, v20, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - succeeded to create destination folder %@", buf, 0xCu);
          }

          float v21 = *(void **)(a1 + 32);
          id v74 = v18;
          char v22 = [v21 copyItemAtURL:v4 toURL:v7 error:&v74];
          uint64_t v15 = v74;

          BOOL v23 = WALogForCategory(14);
          uint64_t v24 = v23;
          if (v22)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_226D1D000, v24, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - succeeded to copyItemAtURL", buf, 2u);
            }

            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
          }
          else
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_150_cold_1((uint64_t)v15, v24);
            }

            uint64_t v84 = *MEMORY[0x263F08320];
            v85[0] = @"failed copyItemAtURL";
            id v31 = [NSDictionary dictionaryWithObjects:v85 forKeys:&v84 count:1];
            uint64_t v15 = v15;
            uint64_t v32 = v31;
            if (v15)
            {
              if (v31) {
                uint64_t v33 = v31;
              }
              else {
                uint64_t v33 = (void *)MEMORY[0x263EFFA78];
              }
              uint64_t v32 = (void *)[v33 mutableCopy];
              [v32 setObject:v15 forKeyedSubscript:*MEMORY[0x263F08608]];
            }
            uint64_t v34 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.weather.errorDomain" code:2 userInfo:v32];

            uint64_t v35 = *(void *)(*(void *)(a1 + 48) + 8);
            v36 = *(void **)(v35 + 40);
            *(void *)(v35 + 40) = v34;
          }
        }
        else
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_150_cold_2((uint64_t)v18, v20);
          }

          uint64_t v82 = *MEMORY[0x263F08320];
          v83 = @"failed to create destination folder";
          id v25 = [NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
          uint64_t v15 = v18;
          uint64_t v26 = v25;
          if (v15)
          {
            if (v25) {
              uint64_t v27 = v25;
            }
            else {
              uint64_t v27 = (void *)MEMORY[0x263EFFA78];
            }
            uint64_t v26 = (void *)[v27 mutableCopy];
            [v26 setObject:v15 forKeyedSubscript:*MEMORY[0x263F08608]];
          }
          uint64_t v28 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.weather.errorDomain" code:2 userInfo:v26];

          uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 8);
          long long v30 = *(void **)(v29 + 40);
          *(void *)(v29 + 40) = v28;
        }
      }
      id v37 = WALogForCategory(14);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226D1D000, v37, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - removing source file", buf, 2u);
      }

      [*(id *)(a1 + 32) removeItemAtURL:v4 error:0];
    }
    else
    {
      uint64_t v15 = WALogForCategory(14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226D1D000, v15, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - source file does not exist, nothing to do", buf, 2u);
      }
    }
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226D1D000, v4, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - no groupContainers", buf, 2u);
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    v38 = WALogForCategory(14);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v77 = @"Celsius";
      _os_log_impl(&dword_226D1D000, v38, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - Moving Prefs key '%@' (representing BOOL of whether user temperature unit is celsius or fahrenheit) to new NSLocale API", buf, 0xCu);
    }

    v39 = [*(id *)(a1 + 40) objectForKey:@"Celsius"];
    v40 = v39;
    if (v39)
    {
      int v41 = [v39 BOOLValue];
      v42 = (id *)MEMORY[0x263EFF550];
      if (!v41) {
        v42 = (id *)MEMORY[0x263EFF558];
      }
      v43 = *v42;
      [MEMORY[0x263EFF960] _setPreferredTemperatureUnit:v43];
      CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x263EFFE48]);
      [*(id *)(a1 + 40) removeObjectForKey:@"Celsius"];
      v44 = WALogForCategory(14);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v77 = @"Celsius";
        __int16 v78 = 2112;
        v79 = v40;
        __int16 v80 = 2112;
        v81 = v43;
        _os_log_impl(&dword_226D1D000, v44, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - Migrated key '%@' (%@) NSLocale API value (%@).", buf, 0x20u);
      }
    }
    else
    {
      v43 = WALogForCategory(14);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v77 = @"Celsius";
        _os_log_impl(&dword_226D1D000, v43, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - Skipping key '%@' migration to NSLocale API -- must have already been migrated or doesn't exist.", buf, 0xCu);
      }
    }

    v45 = [*(id *)(a1 + 40) stringForKey:@"PrefsVersion"];
    v46 = v45;
    if (v45)
    {
      [v45 doubleValue];
      double v48 = v47;
      [@"2.1" doubleValue];
      double v50 = v49;
      v51 = WALogForCategory(14);
      BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);
      if (v48 < v50)
      {
        if (v52)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_226D1D000, v51, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - Updating to 2.1..", buf, 2u);
        }

        v51 = [MEMORY[0x263EFF980] array];
        v53 = [*(id *)(a1 + 40) arrayForKey:@"Cities"];
        uint64_t v54 = objc_msgSend(v53, "na_filter:", &__block_literal_global_170);
        [v51 addObjectsFromArray:v54];

        id v55 = [v51 mutableCopy];
        v56 = [*(id *)(a1 + 40) objectForKey:@"LocalWeather"];
        if (v56
          && +[CityPersistenceConversions cityDictionaryHasValidCoordinates:v56])
        {
          [v55 addObject:v56];
        }
        v57 = (void *)[v55 copy];
        v70[0] = MEMORY[0x263EF8330];
        v70[1] = 3221225472;
        v70[2] = __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_3;
        v70[3] = &unk_2647E1060;
        uint64_t v58 = *(void *)(a1 + 48);
        id v72 = &__block_literal_global_173;
        uint64_t v73 = v58;
        id v59 = v55;
        id v71 = v59;
        [v57 enumerateObjectsUsingBlock:v70];

        if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
        {
          id v60 = v59;
          v61 = v60;
          if (v56 && [v60 count])
          {
            uint64_t v69 = [v61 lastObject];

            uint64_t v68 = objc_msgSend(v61, "subarrayWithRange:", 0, objc_msgSend(v61, "count") - 1);

            v56 = (void *)v69;
            [*(id *)(a1 + 40) setObject:v69 forKey:@"LocalWeather"];
            v61 = (void *)v68;
          }
          [*(id *)(a1 + 40) setObject:v61 forKey:@"Cities"];
          v62 = *(void **)(a1 + 40);
          v63 = [MEMORY[0x263EFF910] date];
          [v62 setObject:v63 forKey:@"LastUpdated"];

          [*(id *)(a1 + 40) setObject:@"2.1" forKey:@"PrefsVersion"];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        }
        v64 = WALogForCategory(14);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          v65 = [*(id *)(a1 + 40) stringForKey:@"PrefsVersion"];
          [v65 doubleValue];
          *(_DWORD *)buf = 134217984;
          v77 = v66;
          _os_log_impl(&dword_226D1D000, v64, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - finished persistence upgrade from version: %f", buf, 0xCu);
        }
        goto LABEL_75;
      }
      if (v52)
      {
        *(_WORD *)buf = 0;
        v67 = "WeatherPreferences _performMigration - Prefs are more up to date than this migrator knows how to handle.  Bailing.";
        goto LABEL_74;
      }
    }
    else
    {
      v51 = WALogForCategory(14);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v67 = "WeatherPreferences _performMigration - First boot scenario; bailing from migration.";
LABEL_74:
        _os_log_impl(&dword_226D1D000, v51, OS_LOG_TYPE_DEFAULT, v67, buf, 2u);
      }
    }
LABEL_75:
  }
}

BOOL __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_168(uint64_t a1, uint64_t a2)
{
  return +[CityPersistenceConversions cityDictionaryHasValidCoordinates:a2];
}

uint64_t __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  v17[3] = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = [v6 objectForKey:v7];
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (objc_opt_respondsToSelector())
        {
          [v8 doubleValue];
          uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F85F70]) initWithTemperatureUnit:2 value:v9];
          uint64_t v11 = +[CityPersistenceConversions dictionaryRepresentationOfTemperature:v10];
          [v6 setObject:v11 forKeyedSubscript:v7];

          uint64_t v12 = 1;
LABEL_12:

          goto LABEL_13;
        }
        if (a4)
        {
          v16[0] = @"key";
          v16[1] = @"value";
          v17[0] = v7;
          v17[1] = v8;
          v16[2] = @"container";
          uint64_t v13 = (void *)[v6 copy];
          v17[2] = v13;
          uint64_t v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
          *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.weather.errorDomain" code:4 userInfo:v14];
        }
      }
    }
    uint64_t v12 = 0;
    goto LABEL_12;
  }
  if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.weather.errorDomain" code:4 userInfo:0];
    uint64_t v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v12 = 0;
  }
LABEL_13:

  return v12;
}

void __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v67[4] = *MEMORY[0x263EF8340];
  id v38 = a2;
  BOOL v5 = (void *)[v38 mutableCopy];
  id v6 = (void *)MEMORY[0x263EFFA08];
  v67[0] = 0x26DAE1850;
  v67[1] = 0x26DAE13D0;
  v67[2] = 0x26DAE19B0;
  v67[3] = 0x26DAE19D0;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:4];
  id v8 = [v6 setWithArray:v7];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v9 = v8;
  char v10 = 0;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v58;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v58 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(a1 + 40);
        uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
        id obj = *(id *)(v15 + 40);
        char v16 = (*(uint64_t (**)(void))(v14 + 16))();
        objc_storeStrong((id *)(v15 + 40), obj);
        if (v16)
        {
          char v10 = 1;
        }
        else if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
        {
          *a4 = 1;

          goto LABEL_32;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v57 objects:v66 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 0;
  int v17 = (void *)MEMORY[0x263EFFA08];
  v65[0] = 0x26DAE1A50;
  v65[1] = 0x26DAE1990;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:2];
  double v19 = [v17 setWithArray:v18];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v39 = v19;
  uint64_t v20 = [v39 countByEnumeratingWithState:&v48 objects:v64 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v49;
    while (2)
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v49 != v21) {
          objc_enumerationMutation(v39);
        }
        uint64_t v23 = *(void *)(*((void *)&v48 + 1) + 8 * j);
        uint64_t v24 = [v5 objectForKeyedSubscript:v23];
        id v25 = (void *)[v24 mutableCopy];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v30 = WALogForCategory(14);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            id v31 = (objc_class *)objc_opt_class();
            uint64_t v32 = NSStringFromClass(v31);
            __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_3_cold_1(v32, buf, v30);
          }

          uint64_t v61 = *MEMORY[0x263F08338];
          v62 = @"Container class was of incorrect class type";
          id v33 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
          uint64_t v34 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.weather.errorDomain" code:3 userInfo:v33];

          uint64_t v35 = *(void *)(*(void *)(a1 + 48) + 8);
          v36 = *(void **)(v35 + 40);
          *(void *)(v35 + 40) = v34;

          *a4 = 1;
          goto LABEL_31;
        }
        uint64_t v26 = (void *)[v25 copy];
        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 3221225472;
        v41[2] = __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_190;
        v41[3] = &unk_2647E1038;
        id v42 = v9;
        id v27 = *(id *)(a1 + 40);
        uint64_t v28 = *(void *)(a1 + 48);
        id v44 = v27;
        uint64_t v45 = v28;
        id v29 = v25;
        id v43 = v29;
        v46 = &v52;
        double v47 = a4;
        [v26 enumerateObjectsUsingBlock:v41];

        if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
        {

          goto LABEL_28;
        }
        if (*((unsigned char *)v53 + 24)) {
          [v5 setObject:v29 forKeyedSubscript:v23];
        }
      }
      uint64_t v20 = [v39 countByEnumeratingWithState:&v48 objects:v64 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
LABEL_28:

  if ((v10 & 1) != 0 || *((unsigned char *)v53 + 24)) {
    [*(id *)(a1 + 32) setObject:v5 atIndexedSubscript:a3];
  }
LABEL_31:

  _Block_object_dispose(&v52, 8);
LABEL_32:
}

void __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_190(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = (void *)[a2 mutableCopy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
        id obj = *(id *)(v12 + 40);
        int v13 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
        objc_storeStrong((id *)(v12 + 40), obj);
        if (v13)
        {
          [*(id *)(a1 + 40) setObject:v6 atIndexedSubscript:a3];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
        }
        if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
        {
          **(unsigned char **)(a1 + 72) = 1;
          *a4 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (NSDate)lastUpdated
{
  return (NSDate *)[(WeatherPreferencesPersistence *)self->_persistence objectForKey:@"LastUpdated"];
}

- (SynchronizedDefaultsDelegate)syncDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_syncDelegate);
  return (SynchronizedDefaultsDelegate *)WeakRetained;
}

- (BOOL)userGroupPrefsLockedWhenInit
{
  return self->_userGroupPrefsLockedWhenInit;
}

- (void)setUserGroupPrefsLockedWhenInit:(BOOL)a3
{
  self->_userGroupPrefsLockedWhenInit = a3;
}

- (WeatherCloudPreferences)cloudPreferences
{
  return (WeatherCloudPreferences *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCloudPreferences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudPreferences, 0);
  objc_destroyWeak((id *)&self->_syncDelegate);
  objc_storeStrong((id *)&self->_cacheDirectoryPath, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_lastUbiquitousWrittenDefaults, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)synchronizeStateToDiskDoNotify:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_226D1D000, log, OS_LOG_TYPE_DEBUG, "WeatherPreferences: posting kWeatherPrefGroupPrefsDidUpdate", v1, 2u);
}

void __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_150_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226D1D000, a2, OS_LOG_TYPE_ERROR, "WeatherPreferences _performMigration - failed copyItemAtURL %@", (uint8_t *)&v2, 0xCu);
}

void __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_150_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226D1D000, a2, OS_LOG_TYPE_ERROR, "WeatherPreferences _performMigration - failed to create destination folder %@", (uint8_t *)&v2, 0xCu);
}

void __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_3_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_226D1D000, log, OS_LOG_TYPE_ERROR, "WeatherPreferences migration observed an unexpected class while upgrading temperature; should've received an NSArray"
    ", instead encountered a %@",
    buf,
    0xCu);
}

@end