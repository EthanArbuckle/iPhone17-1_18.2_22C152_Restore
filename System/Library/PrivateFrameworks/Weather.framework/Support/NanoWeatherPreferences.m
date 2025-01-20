@interface NanoWeatherPreferences
+ (NanoWeatherPreferences)sharedPreferences;
- (NSDate)lastUpdated;
- (NSMutableSet)keysToSync;
- (NSString)userIdentifier;
- (NSUserDefaults)sharedDefaults;
- (NanoWeatherPreferences)init;
- (id)cityList;
- (id)cityObjectsListFromNanoPreferences;
- (id)nanoPreferencesDictionaryForCity:(id)a3;
- (void)setCity:(id)a3 atIndex:(unint64_t)a4 lastUpdated:(id)a5;
- (void)setCityList:(id)a3 lastUpdated:(id)a4;
- (void)setCityListFromCityObjs:(id)a3 lastUpdated:(id)a4;
- (void)setKeysToSync:(id)a3;
- (void)setSharedDefaults:(id)a3;
- (void)setUserIdentifier:(id)a3;
- (void)syncPreferencesToNano;
- (void)syncPreferencesWithDisk;
@end

@implementation NanoWeatherPreferences

+ (NanoWeatherPreferences)sharedPreferences
{
  if (qword_1000118C8 != -1) {
    dispatch_once(&qword_1000118C8, &stru_10000C758);
  }
  v2 = (void *)qword_1000118C0;
  return (NanoWeatherPreferences *)v2;
}

- (NanoWeatherPreferences)init
{
  v8.receiver = self;
  v8.super_class = (Class)NanoWeatherPreferences;
  v2 = [(NanoWeatherPreferences *)&v8 init];
  if (v2)
  {
    v3 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.nanoweatherprefs"];
    sharedDefaults = v2->_sharedDefaults;
    v2->_sharedDefaults = v3;

    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    keysToSync = v2->_keysToSync;
    v2->_keysToSync = v5;
  }
  return v2;
}

- (void)syncPreferencesToNano
{
  if ([(NSMutableSet *)self->_keysToSync count])
  {
    v3 = objc_opt_new();
    v4 = sub_100002174(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [(NSMutableSet *)self->_keysToSync allObjects];
      v6 = [v5 componentsJoinedByString:@", "];
      int v8 = 138543362;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Synchronizing %{public}@ to watch.", (uint8_t *)&v8, 0xCu);
    }
    v7 = [(NanoWeatherPreferences *)self sharedDefaults];
    [v7 synchronize];

    [v3 synchronizeUserDefaultsDomain:@"com.apple.nanoweatherprefs" keys:self->_keysToSync];
    [(NSMutableSet *)self->_keysToSync removeAllObjects];
  }
}

- (void)syncPreferencesWithDisk
{
  id v2 = [(NanoWeatherPreferences *)self sharedDefaults];
  [v2 synchronize];
}

- (void)setCityListFromCityObjs:(id)a3 lastUpdated:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isLocalWeatherCity", (void)v16) & 1) == 0)
        {
          v15 = [(NanoWeatherPreferences *)self nanoPreferencesDictionaryForCity:v14];
          [v8 addObject:v15];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [(NanoWeatherPreferences *)self setCityList:v8 lastUpdated:v7];
}

- (void)setCityList:(id)a3 lastUpdated:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (v14)
  {
    id v7 = [(NanoWeatherPreferences *)self cityList];
    if (([v14 isEqualToArray:v7] & 1) == 0)
    {
      int v8 = [(NanoWeatherPreferences *)self sharedDefaults];
      [v8 setObject:v14 forKey:@"Cities"];

      id v9 = [(NanoWeatherPreferences *)self keysToSync];
      [v9 addObject:@"Cities"];

      id v10 = [(NanoWeatherPreferences *)self sharedDefaults];
      id v11 = v10;
      if (v6)
      {
        [v10 setObject:v6 forKey:@"LastUpdated"];
      }
      else
      {
        uint64_t v12 = +[NSDate date];
        [v11 setObject:v12 forKey:@"LastUpdated"];
      }
      v13 = [(NanoWeatherPreferences *)self keysToSync];
      [v13 addObject:@"LastUpdated"];
    }
  }
}

- (void)setCity:(id)a3 atIndex:(unint64_t)a4 lastUpdated:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(NanoWeatherPreferences *)self cityList];
  id v11 = +[NSMutableArray arrayWithArray:v10];

  [v11 setObject:v9 atIndexedSubscript:a4];
  [(NanoWeatherPreferences *)self setCityList:v11 lastUpdated:v8];
}

- (id)cityList
{
  id v2 = [(NanoWeatherPreferences *)self sharedDefaults];
  v3 = [v2 arrayForKey:@"Cities"];

  return v3;
}

- (id)cityObjectsListFromNanoPreferences
{
  id v2 = [(NanoWeatherPreferences *)self cityList];
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v2;
  id v4 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v26;
    *(void *)&long long v5 = 138543362;
    long long v23 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v10 = [objc_alloc((Class)City) initWithDictionaryRepresentation:v9];
        if (v10)
        {
          id v11 = objc_opt_new();
          uint64_t v12 = [v9 objectForKeyedSubscript:@"Name"];
          [v11 setDisplayName:v12];

          id v13 = objc_alloc((Class)CLLocation);
          [v10 latitude];
          double v15 = v14;
          [v10 longitude];
          id v17 = [v13 initWithLatitude:v15 longitude:v16];
          [v11 setGeoLocation:v17];

          long long v18 = [v9 objectForKeyedSubscript:@"CountryAbbreviation"];

          if (v18)
          {
            long long v19 = [v9 objectForKeyedSubscript:@"CountryAbbreviation"];
            [v11 setCountryAbbreviation:v19];
          }
          objc_msgSend(v10, "setWfLocation:", v11, v23);
          [v3 addObject:v10];
        }
        else
        {
          id v11 = sub_100002174(0);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v20 = [v9 allKeys];
            *(_DWORD *)buf = v23;
            v30 = v20;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Couldn't create a City object from the city dictionary. The dictionary may be missing required values. Keys present in the dictionary: %{public}@", buf, 0xCu);
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v6);
  }

  id v21 = [v3 copy];
  return v21;
}

- (id)nanoPreferencesDictionaryForCity:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    double v15 = 0;
    goto LABEL_23;
  }
  uint64_t v5 = [v3 locationID];
  id v6 = (void *)v5;
  CFStringRef v7 = &stru_10000CA38;
  if (v5) {
    id v8 = (__CFString *)v5;
  }
  else {
    id v8 = &stru_10000CA38;
  }
  id v9 = v8;

  if ([v4 isLocalWeatherCity])
  {
    id v10 = (__CFString *)kLocalWeatherCityID;

    id v9 = v10;
  }
  uint64_t v11 = [v4 name];
  uint64_t v12 = (void *)v11;
  if (v11) {
    CFStringRef v7 = (const __CFString *)v11;
  }
  [v4 latitude];
  id v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 longitude];
  double v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  double v15 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v7, @"Name", v13, @"Lat", v14, @"Lon", v9, @"UUID", 0];

  double v16 = [v4 wfLocation];
  id v17 = [v16 countryAbbreviation];

  if (v17)
  {
    long long v18 = [v4 wfLocation];
    long long v19 = [v18 countryAbbreviation];
    [v15 setObject:v19 forKey:@"CountryAbbreviation"];
  }
  else
  {
    v20 = [v4 ISO3166CountryAbbreviation];

    if (v20)
    {
      long long v18 = [v4 ISO3166CountryAbbreviation];
      [v15 setObject:v18 forKey:@"CountryAbbreviation"];
      goto LABEL_17;
    }
    long long v18 = sub_100002174(0);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    long long v19 = [v4 name];
    *(_DWORD *)buf = 138412290;
    long long v28 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Unable to find country abbreviation for %@.", buf, 0xCu);
  }

LABEL_17:
  id v21 = [v4 timeZone];

  if (v21)
  {
    v22 = [v4 timeZone];
    long long v23 = [v22 name];
    [v15 setObject:v23 forKey:@"TimeZone"];

    v24 = [v4 timeZoneUpdateDate];

    if (v24) {
      [v4 timeZoneUpdateDate];
    }
    else {
    long long v25 = +[NSDate distantPast];
    }
    [v15 setObject:v25 forKey:@"TimeZoneLastUpdated"];
  }
LABEL_23:

  return v15;
}

- (NSDate)lastUpdated
{
  id v2 = [(NanoWeatherPreferences *)self sharedDefaults];
  id v3 = [v2 objectForKey:@"LastUpdated"];

  return (NSDate *)v3;
}

- (void)setUserIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NanoWeatherPreferences *)self sharedDefaults];
  [v5 setObject:v4 forKey:@"UserIdentifier"];

  id v6 = [(NanoWeatherPreferences *)self keysToSync];
  [v6 addObject:@"UserIdentifier"];
}

- (NSString)userIdentifier
{
  id v2 = [(NanoWeatherPreferences *)self sharedDefaults];
  id v3 = [v2 stringForKey:@"UserIdentifier"];

  return (NSString *)v3;
}

- (NSUserDefaults)sharedDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSharedDefaults:(id)a3
{
}

- (NSMutableSet)keysToSync
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKeysToSync:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysToSync, 0);
  objc_storeStrong((id *)&self->_sharedDefaults, 0);
}

@end