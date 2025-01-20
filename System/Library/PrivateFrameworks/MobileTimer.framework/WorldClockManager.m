@interface WorldClockManager
+ (id)sharedManager;
- (BOOL)canAddCity;
- (BOOL)checkIfCitiesModified;
- (NSArray)cities;
- (NSDate)lastModified;
- (WorldClockManager)initWithPreferences:(id)a3;
- (id)allCities;
- (id)citiesMatchingIdentifiers:(id)a3;
- (id)citiesMatchingName:(id)a3;
- (id)cityWithIdUrl:(id)a3;
- (id)closestCityToLocation:(id)a3 matchingTimeZone:(id)a4;
- (id)closestCityToLocation:(id)a3 matchingTimeZone:(id)a4 requireTimeZoneEquivalence:(BOOL)a5;
- (id)fixUpCityProperties:(id)a3;
- (id)updateALDataWithCity:(id)a3;
- (id)updatedDataForCityWithID:(id)a3;
- (id)updatedTimezoneForCityWithID:(id)a3;
- (id)worldClockCityFromPersistenceArray:(id)a3;
- (id)worldClockCityFromPersistenceDictionary:(id)a3;
- (id)worldClockCityFromPersistenceRepresentation:(id)a3;
- (unint64_t)addCity:(id)a3;
- (void)_notifyNano;
- (void)addDefaultCitiesIfNeeded;
- (void)loadCities;
- (void)moveCityFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)pushCityPropertiesToPreferences;
- (void)removeAllCities;
- (void)removeCity:(id)a3;
- (void)removeCityAtIndex:(unint64_t)a3;
- (void)saveCities;
- (void)setLastModified:(id)a3;
@end

@implementation WorldClockManager

- (id)worldClockCityFromPersistenceDictionary:(id)a3
{
  v3 = [(WorldClockManager *)self fixUpCityProperties:a3];
  if (+[WorldClockCity isWorldClockCityProperties:v3])
  {
    v4 = [[WorldClockCity alloc] initWithProperties:v3];
  }
  else
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F4BE30]) initWithProperties:v3];
    v4 = [[WorldClockCity alloc] initWithALCity:v5];
  }
  return v4;
}

- (id)fixUpCityProperties:(id)a3
{
  id v4 = a3;
  if (+[WorldClockCity isCachedLanguageStaleForProperties:v4])
  {
    self->_dirty = 1;
    v5 = [v4 objectForKey:@"city"];
    v6 = (void *)[v5 mutableCopy];
    [v6 removeObjectForKey:@"name"];
    [v6 removeObjectForKey:@"countryName"];
    id v7 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v4];
    [v7 setObject:v6 forKey:@"city"];
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

- (NSArray)cities
{
  return &self->_cities->super;
}

- (void)loadCities
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(WorldClockPreferences *)self->_defaults lastModified];
  [(WorldClockManager *)self setLastModified:v3];

  id v4 = [(WorldClockPreferences *)self->_defaults cities];
  v5 = v4;
  if (v4) {
    v6 = (NSMutableArray *)[v4 mutableCopy];
  }
  else {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  p_cities = (id *)&self->_cities;
  cities = self->_cities;
  self->_cities = v6;

  BOOL v9 = [(WorldClockPreferences *)self->_defaults cityDataNeedsUpdate];
  v10 = MTLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543618;
    v19 = self;
    __int16 v20 = 1024;
    BOOL v21 = v9;
    _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ loading cities, needs city data update: %d", (uint8_t *)&v18, 0x12u);
  }

  if ([*p_cities count])
  {
    if ((int)[*p_cities count] >= 1)
    {
      int v11 = 0;
      do
      {
        v12 = [(NSMutableArray *)self->_cities objectAtIndex:v11];
        v13 = [(WorldClockManager *)self worldClockCityFromPersistenceRepresentation:v12];
        if (v9)
        {
          uint64_t v14 = [(WorldClockManager *)self updateALDataWithCity:v13];

          v13 = (void *)v14;
        }
        id v15 = *p_cities;
        if (v13) {
          [v15 replaceObjectAtIndex:v11 withObject:v13];
        }
        else {
          [v15 removeObjectAtIndex:v11--];
        }

        ++v11;
      }
      while (v11 < (int)[*p_cities count]);
    }
  }
  else
  {
    [(WorldClockManager *)self addDefaultCitiesIfNeeded];
  }
  int v16 = self->_dirty || v9;
  if (v16 == 1)
  {
    [(WorldClockManager *)self pushCityPropertiesToPreferences];
    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 postNotificationName:@"com.apple.mobiletimer.user-preferences-dirty" object:0];

    self->_dirty = 0;
    [(WorldClockPreferences *)self->_defaults cityDataUpdated];
  }
}

- (id)worldClockCityFromPersistenceRepresentation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(WorldClockManager *)self worldClockCityFromPersistenceDictionary:v4];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(WorldClockManager *)self worldClockCityFromPersistenceArray:v4];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (void)setLastModified:(id)a3
{
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)sharedManager__sharedManager;
  return v2;
}

void __34__WorldClockManager_sharedManager__block_invoke()
{
  v2 = objc_alloc_init(WorldClockPreferences);
  v0 = [[WorldClockManager alloc] initWithPreferences:v2];
  v1 = (void *)sharedManager__sharedManager;
  sharedManager__sharedManager = (uint64_t)v0;
}

- (WorldClockManager)initWithPreferences:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WorldClockManager;
  v6 = [(WorldClockManager *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_defaults, a3);
    v8 = v7;
  }

  return v7;
}

- (id)updateALDataWithCity:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = [a3 alCityId];
  v6 = [v5 stringValue];
  id v7 = objc_msgSend(v4, "arrayWithObjects:", v6, 0);
  v8 = [(WorldClockManager *)self citiesMatchingIdentifiers:v7];
  BOOL v9 = [v8 firstObject];

  return v9;
}

- (id)updatedTimezoneForCityWithID:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", a3, 0);
  id v5 = [(WorldClockManager *)self citiesMatchingIdentifiers:v4];
  v6 = [v5 firstObject];
  id v7 = [v6 timeZone];

  return v7;
}

- (id)updatedDataForCityWithID:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", a3, 0);
  id v5 = [(WorldClockManager *)self citiesMatchingIdentifiers:v4];
  v6 = [v5 firstObject];

  id v7 = +[MTUtilities mtCityFromWorldClockCity:v6];

  return v7;
}

- (void)saveCities
{
  v3 = [(WorldClockManager *)self cities];

  if (v3)
  {
    [(WorldClockManager *)self pushCityPropertiesToPreferences];
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [(WorldClockManager *)self setLastModified:v4];

    defaults = self->_defaults;
    v6 = [(WorldClockManager *)self lastModified];
    [(WorldClockPreferences *)defaults setLastModified:v6];

    [(WorldClockPreferences *)self->_defaults synchronize];
    [(WorldClockManager *)self _notifyNano];
    +[ClockManager saveAndNotifyForUserPreferences:1 localNotifications:1];
    self->_dirty = 0;
  }
}

- (id)allCities
{
  v2 = [MEMORY[0x1E4F4BE38] sharedManager];
  v3 = [v2 allCities];

  id v4 = objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __30__WorldClockManager_allCities__block_invoke;
  v8[3] = &unk_1E5916638;
  id v9 = v4;
  id v5 = v4;
  [v3 enumerateObjectsUsingBlock:v8];
  v6 = (void *)[v5 copy];

  return v6;
}

void __30__WorldClockManager_allCities__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [[WorldClockCity alloc] initWithALCity:v3];

  [v2 addObject:v4];
}

- (id)worldClockCityFromPersistenceArray:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F4BE38];
  id v4 = a3;
  id v5 = [v3 sharedManager];
  v6 = [v5 bestCityForLegacyCity:v4];

  if (v6) {
    id v7 = [[WorldClockCity alloc] initWithALCity:v6];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (void)addDefaultCitiesIfNeeded
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (![(WorldClockPreferences *)self->_defaults defaultCitiesAdded])
  {
    id v3 = [MEMORY[0x1E4F4BE38] sharedManager];
    CFStringRef v4 = (const __CFString *)MGGetStringAnswer();
    if (CFStringCompare(v4, @"iPad", 0))
    {
      id v5 = [MEMORY[0x1E4F1CA20] currentLocale];
      v6 = [v5 localeIdentifier];
      id v7 = [v3 defaultCitiesForLocaleCode:v6 options:3];
    }
    else
    {
      id v7 = [v3 defaultCitiesShownInWorldClock];
    }
    CFRelease(v4);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
          uint64_t v14 = [WorldClockCity alloc];
          id v15 = -[WorldClockCity initWithALCity:](v14, "initWithALCity:", v13, (void)v16);
          [(NSMutableArray *)self->_cities addObject:v15];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [(WorldClockPreferences *)self->_defaults setDefaultCitiesAdded:1];
    [(WorldClockManager *)self saveCities];
  }
}

- (void)pushCityPropertiesToPreferences
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  CFStringRef v4 = [(WorldClockManager *)self cities];
  id v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = [(WorldClockManager *)self cities];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v12 + 1) + 8 * v10) properties];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(WorldClockPreferences *)self->_defaults setCities:v5];
}

- (BOOL)checkIfCitiesModified
{
  id v3 = [(WorldClockPreferences *)self->_defaults lastModified];
  CFStringRef v4 = [(WorldClockManager *)self lastModified];
  if (v4 == v3)
  {
    BOOL v9 = 0;
  }
  else
  {
    id v5 = [(WorldClockManager *)self lastModified];
    [v5 timeIntervalSinceReferenceDate];
    double v7 = round(v6);
    [v3 timeIntervalSinceReferenceDate];
    BOOL v9 = v7 != round(v8);
  }
  return v9;
}

- (id)cityWithIdUrl:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_cities;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        BOOL v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "idUrl", (void)v13);
        int v11 = [v4 isEqual:v10];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)canAddCity
{
  v2 = [(WorldClockManager *)self cities];
  BOOL v3 = (unint64_t)[v2 count] < 0x18;

  return v3;
}

- (unint64_t)addCity:(id)a3
{
  id v4 = a3;
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if ([(WorldClockManager *)self canAddCity])
  {
    unint64_t v5 = [(NSMutableArray *)self->_cities indexOfObject:v4];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(NSMutableArray *)self->_cities addObject:v4];
      self->_dirty = 1;
      unint64_t v5 = [(NSMutableArray *)self->_cities count] - 1;
    }
  }

  return v5;
}

- (void)removeCity:(id)a3
{
  self->_dirty = 1;
}

- (void)removeCityAtIndex:(unint64_t)a3
{
  self->_dirty = 1;
}

- (void)removeAllCities
{
  self->_dirty = 1;
}

- (void)moveCityFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  -[NSMutableArray objectAtIndex:](self->_cities, "objectAtIndex:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)self->_cities removeObjectAtIndex:a3];
  [(NSMutableArray *)self->_cities insertObject:v7 atIndex:a4];
  self->_dirty = 1;
}

- (void)_notifyNano
{
  v20[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v4 = [v3 BOOLForKey:@"PerformanceTestingEnabled"];

  if (v4)
  {
    unint64_t v5 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:@"/tmp/WorldClock-performance_test.plist"];
    if (!v5) {
      unint64_t v5 = objc_opt_new();
    }
    id v6 = [v5 objectForKeyedSubscript:@"cityAddTest"];
    if (!v6) {
      id v6 = objc_opt_new();
    }
    CFAbsoluteTime v7 = CFAbsoluteTimeGetCurrent() + *MEMORY[0x1E4F1CF78];
    long long v19 = @"timestamp";
    double v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:v7];
    v20[0] = v8;
    BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    [v6 setObject:v9 forKeyedSubscript:@"citySent"];

    [v5 setObject:v6 forKeyedSubscript:@"cityAddTest"];
    [v5 writeToFile:@"/tmp/WorldClock-performance_test.plist" atomically:1];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__WorldClockManager__notifyNano__block_invoke;
  block[3] = &unk_1E59150A8;
  block[4] = self;
  if (_notifyNano_onceToken != -1) {
    dispatch_once(&_notifyNano_onceToken, block);
  }
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2050000000;
  uint64_t v10 = (void *)getNPSManagerClass_softClass;
  uint64_t v18 = getNPSManagerClass_softClass;
  if (!getNPSManagerClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getNPSManagerClass_block_invoke;
    v14[3] = &unk_1E5914EC0;
    v14[4] = &v15;
    __getNPSManagerClass_block_invoke((uint64_t)v14);
    uint64_t v10 = (void *)v16[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v15, 8);
  long long v12 = objc_opt_new();
  [v12 synchronizeUserDefaultsDomain:@"com.apple.mobiletimer" keys:_notifyNano_keys];
}

void __32__WorldClockManager__notifyNano__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v5 = [*(id *)(*(void *)(a1 + 32) + 24) defaultsKeys];
  uint64_t v3 = [v2 initWithArray:v5];
  int v4 = (void *)_notifyNano_keys;
  _notifyNano_keys = v3;
}

- (id)citiesMatchingIdentifiers:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = [MEMORY[0x1E4F4BE38] sharedManager];
  id v5 = [v4 citiesWithIdentifiers:v3];
  id v6 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        long long v13 = [WorldClockCity alloc];
        long long v14 = -[WorldClockCity initWithALCity:](v13, "initWithALCity:", v12, (void)v17);
        if (v14) {
          [v6 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  uint64_t v15 = (void *)[v6 copy];
  return v15;
}

- (id)citiesMatchingName:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = [MEMORY[0x1E4F4BE38] sharedManager];
  id v5 = [v4 citiesMatchingName:v3];

  id v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_39];
  id v7 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        long long v14 = [WorldClockCity alloc];
        uint64_t v15 = -[WorldClockCity initWithALCity:](v14, "initWithALCity:", v13, (void)v18);
        if (v15) {
          [v7 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  long long v16 = (void *)[v7 copy];
  return v16;
}

uint64_t __40__WorldClockManager_citiesMatchingName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)closestCityToLocation:(id)a3 matchingTimeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WorldClockManager *)self closestCityToLocation:v6 matchingTimeZone:v7 requireTimeZoneEquivalence:1];
  if (!v8)
  {
    id v8 = [(WorldClockManager *)self closestCityToLocation:v6 matchingTimeZone:v7 requireTimeZoneEquivalence:0];
  }

  return v8;
}

- (id)closestCityToLocation:(id)a3 matchingTimeZone:(id)a4 requireTimeZoneEquivalence:(BOOL)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [(WorldClockManager *)self allCities];
  uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v33;
    double v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v16 = (void *)MEMORY[0x1E4F1CAF0];
        long long v17 = [v15 timeZone];
        long long v18 = [v16 timeZoneWithName:v17];

        if (([v18 isEquivalentTo:v8] & 1) != 0
          || !a5 && (uint64_t v28 = [v18 secondsFromGMT], v28 == objc_msgSend(v8, "secondsFromGMT")))
        {
          long long v19 = [v15 alCity];
          id v20 = objc_alloc(MEMORY[0x1E4F1E5F0]);
          [v19 latitude];
          double v22 = v21;
          [v19 longitude];
          v24 = (void *)[v20 initWithLatitude:v22 longitude:v23];
          [v24 distanceFromLocation:v7];
          double v26 = v25;
          if (!v11 || v25 < v13)
          {
            id v27 = v15;

            double v13 = v26;
            uint64_t v11 = v27;
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (NSDate)lastModified
{
  return self->lastModified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->lastModified, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_cities, 0);
}

@end