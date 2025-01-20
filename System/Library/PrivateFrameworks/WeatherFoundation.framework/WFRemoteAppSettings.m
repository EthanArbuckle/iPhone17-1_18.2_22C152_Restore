@interface WFRemoteAppSettings
+ (BOOL)useInternalBundleID;
+ (BOOL)wfInternalBuild;
+ (BOOL)wfSeedBuild;
+ (id)bundleIDsListFor:(id)a3 useInternalBundleID:(BOOL)a4 useSeedBundleID:(BOOL)a5;
+ (id)configurationWithData:(id)a3 bundleIDs:(id)a4 country:(id)a5 userID:(id)a6 error:(id *)a7;
+ (id)configurationWithData:(id)a3 userID:(id)a4 error:(id *)a5;
+ (id)defaultSettings;
- (BOOL)aqiEnabledForCountryCode:(id)a3;
- (BOOL)disableForecastRequestCancelation;
- (BOOL)disableLimitReverseGeocoding;
- (BOOL)disablePriorityForecastRequestQueue;
- (BOOL)isExpired;
- (BOOL)loadSavedCitiesFromKVSOnly;
- (BOOL)shouldUseAPIVersionFromDictionary:(id)a3 userID:(id)a4;
- (NSDate)lastModificationDate;
- (NSDictionary)config;
- (NSDictionary)widgetRefreshPolicy;
- (NSSet)aqiEnabledCountryCodes;
- (NSString)apiVersion;
- (NSString)apiVersionFallback;
- (NSString)bundleID;
- (NSString)countryCode;
- (NSString)description;
- (NSURL)appAnalyticsEndpointUrl;
- (WFRemoteAppSettings)initWithConfigDictionary:(id)a3 bundleIDs:(id)a4 country:(id)a5 userID:(id)a6;
- (WFWeatherEventsConfig)weatherEventsConfig;
- (double)cachedGeocodeLocationExpirationTimeInterval;
- (double)locationUpdateMinDistance;
- (double)locationUpdateMinTimeInterval;
- (double)privateUserIdentifierResetTimeInterval;
- (double)userIdentifierResetTimeInterval;
- (float)dataSamplingRate;
- (float)locationGeocodingSamplingRate;
- (float)telemetrySamplingRate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getAPIVersionFromDictionary:(id)a3 userID:(id)a4;
- (id)getEnvironmentSpecificConfigDictionaryFromDictionary:(id)a3 bundleIDs:(id)a4 country:(id)a5;
- (id)getSpecificConfigFromConfigs:(id)a3 configSpecifiers:(id)a4 specifierKey:(id)a5;
- (int64_t)appConfigRefreshRate;
- (unint64_t)apiConfigMaxRange;
- (unint64_t)apiConfigMinRange;
- (unint64_t)apiConfigModdedHash;
- (unint64_t)locationNumDecimalsOfPrecision;
- (unint64_t)networkFailedAttemptsLimit;
- (unint64_t)networkSwitchExpirationTimeInSeconds;
- (void)isExpired;
@end

@implementation WFRemoteAppSettings

+ (id)configurationWithData:(id)a3 userID:(id)a4 error:(id *)a5
{
  v7 = (void *)MEMORY[0x263F086E0];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 mainBundle];
  v11 = [v10 bundleIdentifier];

  v12 = [MEMORY[0x263EFF960] currentLocale];
  v13 = [v12 countryCode];

  uint64_t v14 = [(id)objc_opt_class() useInternalBundleID];
  uint64_t v15 = [(id)objc_opt_class() wfSeedBuild];
  if (v11)
  {
    v16 = [(id)objc_opt_class() bundleIDsListFor:v11 useInternalBundleID:v14 useSeedBundleID:v15];
  }
  else
  {
    v16 = (void *)MEMORY[0x263EFFA68];
  }
  v17 = [(id)objc_opt_class() configurationWithData:v9 bundleIDs:v16 country:v13 userID:v8 error:a5];

  return v17;
}

+ (id)configurationWithData:(id)a3 bundleIDs:(id)a4 country:(id)a5 userID:(id)a6 error:(id *)a7
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v21 = 0;
  uint64_t v14 = [MEMORY[0x263F08900] JSONObjectWithData:v10 options:0 error:&v21];
  id v15 = v21;
  uint64_t v16 = +[WFRemoteAppSettings defaultSettings];
  v17 = (void *)v16;
  if (v15)
  {
    v18 = (WFRemoteAppSettings *)v16;
  }
  else
  {
    v18 = [[WFRemoteAppSettings alloc] initWithConfigDictionary:v14 bundleIDs:v11 country:v12 userID:v13];

    v19 = WFLogForCategory(9uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v18;
      _os_log_impl(&dword_21C988000, v19, OS_LOG_TYPE_DEFAULT, "[WFRemoteAppSettings] initialized new remote app settings instance: %@", buf, 0xCu);
    }
  }
  return v18;
}

+ (id)defaultSettings
{
  v2 = [[WFRemoteAppSettings alloc] initWithConfigDictionary:0 bundleIDs:0 country:0 userID:0];
  return v2;
}

+ (id)bundleIDsListFor:(id)a3 useInternalBundleID:(BOOL)a4 useSeedBundleID:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  if (v6)
  {
    id v9 = [NSString stringWithFormat:@"%@.%@", v7, @"internal"];
    [v8 addObject:v9];
  }
  id v10 = [MEMORY[0x263F08AB0] processInfo];
  id v11 = v10;
  if (v10) {
    [v10 operatingSystemVersion];
  }

  id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%li_%li", 0, 0);
  if (v5)
  {
    id v13 = [NSString stringWithFormat:@"%@.%@.seed", v7, v12];
    [v8 addObject:v13];
  }
  uint64_t v14 = [NSString stringWithFormat:@"%@.%@", v7, v12];
  [v8 addObject:v14];

  [v8 addObject:v7];
  return v8;
}

+ (BOOL)useInternalBundleID
{
  v2 = WeatherFoundationInternalUserDefaults();
  char v3 = [v2 BOOLForKey:@"use_non_internal_bundleid"];

  return [(id)objc_opt_class() wfInternalBuild] & (v3 ^ 1);
}

+ (BOOL)wfInternalBuild
{
  if (wfInternalBuild_onceToken != -1) {
    dispatch_once(&wfInternalBuild_onceToken, &__block_literal_global_8);
  }
  return wfInternalBuild_internalBuild;
}

uint64_t __38__WFRemoteAppSettings_wfInternalBuild__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  wfInternalBuild_internalBuild = result;
  return result;
}

+ (BOOL)wfSeedBuild
{
  return 0;
}

- (WFRemoteAppSettings)initWithConfigDictionary:(id)a3 bundleIDs:(id)a4 country:(id)a5 userID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v39.receiver = self;
  v39.super_class = (Class)WFRemoteAppSettings;
  uint64_t v14 = [(WFRemoteAppSettings *)&v39 init];
  if (v14)
  {
    id v15 = WeatherFoundationInternalUserDefaults();
    uint64_t v16 = [v15 objectForKey:@"cachedAppConfigLastSavedDate"];
    uint64_t v17 = [v16 copy];
    lastModificationDate = v14->_lastModificationDate;
    v14->_lastModificationDate = (NSDate *)v17;

    if (!v14->_lastModificationDate)
    {
      uint64_t v19 = [MEMORY[0x263EFF910] distantPast];
      v20 = v14->_lastModificationDate;
      v14->_lastModificationDate = (NSDate *)v19;
    }
    id v21 = [(WFRemoteAppSettings *)v14 getEnvironmentSpecificConfigDictionaryFromDictionary:v10 bundleIDs:v11 country:v12];
    objc_storeStrong((id *)&v14->_config, v21);
    if (v21)
    {
      v22 = (void *)MEMORY[0x263EFFA08];
      v23 = [v21 objectForKeyedSubscript:@"aqiEnabledCountries"];
      uint64_t v24 = [v22 setWithArray:v23];
      aqiEnabledCountryCodes = v14->_aqiEnabledCountryCodes;
      v14->_aqiEnabledCountryCodes = (NSSet *)v24;
    }
    else
    {
      v23 = v14->_aqiEnabledCountryCodes;
      v14->_aqiEnabledCountryCodes = 0;
    }

    v14->_appConfigRefreshRate = [NSDictionary integerValueFromDictionary:v21 forKey:@"configRefreshRate" defaultValue:86400];
    v14->_networkFailedAttemptsLimit = [NSDictionary integerValueFromDictionary:v21 forKey:@"networkFailedAttemptsLimit" defaultValue:3];
    v14->_networkSwitchExpirationTimeInSeconds = [NSDictionary integerValueFromDictionary:v21 forKey:@"networkSwitchExpirationTime" defaultValue:3600];
    uint64_t v26 = [(WFRemoteAppSettings *)v14 getAPIVersionFromDictionary:v21 userID:v13];
    apiVersion = v14->_apiVersion;
    v14->_apiVersion = (NSString *)v26;

    uint64_t v28 = [NSDictionary stringValueFromDictionary:v21 forKey:@"apiVersionFallback" defaultValue:@"twc_v2"];
    apiVersionFallback = v14->_apiVersionFallback;
    v14->_apiVersionFallback = (NSString *)v28;

    v14->_locationNumDecimalsOfPrecision = [NSDictionary integerValueFromDictionary:v21 forKey:@"locationDecimalPrecision" defaultValue:3];
    uint64_t v30 = [v21 dictionaryForKey:@"widgetRefresh"];
    widgetRefreshPolicy = v14->_widgetRefreshPolicy;
    v14->_widgetRefreshPolicy = (NSDictionary *)v30;

    v32 = [v21 dictionaryForKey:@"WeatherEventConfig"];
    v33 = [[WFWeatherEventsConfig alloc] initWithDictionary:v32];
    weatherEventsConfig = v14->_weatherEventsConfig;
    v14->_weatherEventsConfig = v33;

    [NSDictionary timeIntervalValueFromDictionary:v21 forKey:@"cachedGeocodeLocationExpirationTimeInterval" defaultValue:86400.0];
    v14->_cachedGeocodeLocationExpirationTimeInterval = v35;
    [NSDictionary timeIntervalValueFromDictionary:v21 forKey:@"locationUpdateMinTimeInterval" defaultValue:1800.0];
    v14->_locationUpdateMinTimeInterval = v36;
    [NSDictionary doubleValueFromDictionary:v21 forKey:@"locationUpdateMinDistance" defaultValue:1500.0];
    v14->_locationUpdateMinDistance = v37;
    v14->_disableForecastRequestCancelation = [v21 BOOLForKey:@"disableForecastRequestCancelation" defaultValue:0];
    v14->_disablePriorityForecastRequestQueue = [v21 BOOLForKey:@"disablePriorityForecastRequestQueue" defaultValue:0];
    v14->_loadSavedCitiesFromKVSOnly = [v21 BOOLForKey:@"loadSavedCitiesFromKVSOnly" defaultValue:0];
    v14->_disableLimitReverseGeocoding = [v21 BOOLForKey:@"disableLimitReverseGeocoding" defaultValue:0];
  }
  return v14;
}

- (id)getEnvironmentSpecificConfigDictionaryFromDictionary:(id)a3 bundleIDs:(id)a4 country:(id)a5
{
  v49[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v48 = [v10 stringForKey:@"fallbackBundleId"];
  id v11 = (void *)[v9 mutableCopy];

  v47 = v11;
  objc_msgSend(v11, "wf_safelyAddObject:", v48);
  v46 = [v10 arrayForKey:@"weatherBundleConfigs"];
  id v12 = [(WFRemoteAppSettings *)self getSpecificConfigFromConfigs:v46 configSpecifiers:v11 specifierKey:@"bundleId"];
  id v13 = [v12 stringForKey:@"bundleId"];
  bundleID = self->_bundleID;
  self->_bundleID = v13;

  uint64_t v15 = [v10 arrayForKey:@"endpointConfigs"];
  v45 = (void *)v15;
  uint64_t v16 = WeatherFoundationInternalUserDefaults();
  uint64_t v17 = [v16 stringForKey:@"AppAnalyticsEnvironment"];
  v18 = (void *)v17;
  uint64_t v19 = @"PRODUCTION";
  if (v17) {
    uint64_t v19 = (__CFString *)v17;
  }
  v20 = v19;

  v49[0] = v20;
  v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:1];
  id v21 = [(WFRemoteAppSettings *)self getSpecificConfigFromConfigs:v15 configSpecifiers:v44 specifierKey:@"environment"];
  uint64_t v22 = [v21 objectForKeyedSubscript:@"appAnalyticsEndpointUrl"];
  v23 = (void *)v22;
  uint64_t v24 = @"https://weather-analytics-events.apple.com/analyticseventsv2/async";
  if (v22) {
    uint64_t v24 = (__CFString *)v22;
  }
  v25 = v24;

  uint64_t v26 = [NSURL URLWithString:v25];

  appAnalyticsEndpointUrl = self->_appAnalyticsEndpointUrl;
  self->_appAnalyticsEndpointUrl = v26;

  uint64_t v28 = [v10 objectForKey:@"privacyConfiguration"];

  LODWORD(v29) = 1045220557;
  [NSDictionary floatValueFromDictionary:v28 forKey:@"dataSamplingRate" defaultValue:v29];
  self->_dataSamplingRate = v30;
  LODWORD(v31) = 0.25;
  [NSDictionary floatValueFromDictionary:v28 forKey:@"telemetrySamplingRate" defaultValue:v31];
  self->_telemetrySamplingRate = v32;
  LODWORD(v33) = 1045220557;
  [NSDictionary floatValueFromDictionary:v28 forKey:@"locationGeocodingSamplingRate" defaultValue:v33];
  self->_locationGeocodingSamplingRate = v34;
  [NSDictionary timeIntervalValueFromDictionary:v28 forKey:@"userIdentifierResetTimeInterval" defaultValue:2592000.0];
  self->_userIdentifierResetTimeInterval = v35;
  [NSDictionary timeIntervalValueFromDictionary:v28 forKey:@"privateUserIdentifierResetTimeInterval" defaultValue:33696000.0];
  self->_privateUserIdentifierResetTimeInterval = v36;
  double v37 = [v12 stringForKey:@"fallbackCountryCode"];
  v38 = objc_opt_new();
  objc_msgSend(v38, "wf_safelyAddObject:", v8);

  objc_msgSend(v38, "wf_safelyAddObject:", v37);
  objc_super v39 = [v12 arrayForKey:@"weatherCountryConfigs"];
  v40 = [(WFRemoteAppSettings *)self getSpecificConfigFromConfigs:v39 configSpecifiers:v38 specifierKey:@"countryCode"];
  v41 = [v40 stringForKey:@"countryCode"];
  countryCode = self->_countryCode;
  self->_countryCode = v41;

  return v40;
}

- (id)getSpecificConfigFromConfigs:(id)a3 configSpecifiers:(id)a4 specifierKey:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v10 = v8;
  uint64_t v24 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v24)
  {
    uint64_t v11 = *(void *)v31;
    id v25 = v7;
    uint64_t v23 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v10);
        }
        id v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v14 = v7;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v27;
          while (2)
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v27 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void **)(*((void *)&v26 + 1) + 8 * j);
              v20 = [v19 stringForKey:v9];
              if ([v20 length] && (objc_msgSend(v13, "isEqualToString:", v20) & 1) != 0)
              {
                id v21 = v19;

                id v7 = v25;
                goto LABEL_20;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }

        id v7 = v25;
        uint64_t v11 = v23;
      }
      id v21 = 0;
      uint64_t v24 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v24);
  }
  else
  {
    id v21 = 0;
  }
LABEL_20:

  return v21;
}

- (id)getAPIVersionFromDictionary:(id)a3 userID:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a3)
  {
    [a3 arrayForKey:@"weatherApiVersionConfigs"];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (-[WFRemoteAppSettings shouldUseAPIVersionFromDictionary:userID:](self, "shouldUseAPIVersionFromDictionary:userID:", v12, v6, (void)v18))
          {
            id v14 = [NSDictionary stringValueFromDictionary:v12 forKey:@"apiVersion" defaultValue:@"wds_v1"];
            uint64_t v15 = WFLogForCategory(9uLL);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
              -[WFRemoteAppSettings getAPIVersionFromDictionary:userID:](v12, (uint64_t)v14, v15);
            }

            goto LABEL_16;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v13 = WFLogForCategory(9uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[WFRemoteAppSettings getAPIVersionFromDictionary:userID:](@"wds_v1", v13);
    }

    id v14 = @"wds_v1";
LABEL_16:
  }
  else
  {
    uint64_t v16 = WFLogForCategory(9uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[WFRemoteAppSettings getAPIVersionFromDictionary:userID:](@"wds_v1", v16);
    }

    id v14 = @"wds_v1";
  }

  return v14;
}

- (BOOL)shouldUseAPIVersionFromDictionary:(id)a3 userID:(id)a4
{
  id v6 = NSDictionary;
  id v7 = a4;
  id v8 = a3;
  unint64_t v9 = [v6 integerValueFromDictionary:v8 forKey:@"modMax" defaultValue:1000];
  unint64_t v10 = [v7 hash];

  self->_unint64_t apiConfigModdedHash = v10 % v9;
  uint64_t v11 = WeatherFoundationInternalUserDefaults();
  id v12 = [v11 objectForKey:@"api_version_bucket_hash"];

  if (v12) {
    self->_unint64_t apiConfigModdedHash = [v12 unsignedIntegerValue] % v9;
  }
  self->_apiConfigMinRange = [NSDictionary integerValueFromDictionary:v8 forKey:@"minRange" defaultValue:0];
  unint64_t v13 = [NSDictionary integerValueFromDictionary:v8 forKey:@"maxRange" defaultValue:0];

  self->_apiConfigMaxRange = v13;
  unint64_t apiConfigModdedHash = self->_apiConfigModdedHash;
  BOOL v16 = self->_apiConfigMinRange <= apiConfigModdedHash && apiConfigModdedHash < v13;

  return v16;
}

- (NSString)description
{
  uint64_t v17 = NSString;
  char v3 = [(WFRemoteAppSettings *)self aqiEnabledCountryCodes];
  int64_t v16 = [(WFRemoteAppSettings *)self appConfigRefreshRate];
  unint64_t v4 = [(WFRemoteAppSettings *)self networkFailedAttemptsLimit];
  unint64_t v5 = [(WFRemoteAppSettings *)self networkSwitchExpirationTimeInSeconds];
  id v6 = [(WFRemoteAppSettings *)self apiVersion];
  id v7 = [(WFRemoteAppSettings *)self apiVersionFallback];
  unint64_t v8 = [(WFRemoteAppSettings *)self locationNumDecimalsOfPrecision];
  [(WFRemoteAppSettings *)self cachedGeocodeLocationExpirationTimeInterval];
  uint64_t v10 = v9;
  [(WFRemoteAppSettings *)self locationUpdateMinTimeInterval];
  uint64_t v12 = v11;
  [(WFRemoteAppSettings *)self locationUpdateMinDistance];
  id v14 = [v17 stringWithFormat:@"AQI countries = %@, refresh rate = %lld, network fail limit = %lu, network switch expiration = %lu, API version = %@, API version fallback = %@, location precision = %ld, _cachedGeocodeLocationExpirationTimeInterval: %f, locationUpdateMinTimeInterval: %f, locationUpdateMinDistance: %f, disableForecastRequestCancelation: %d, disablePriorityForecastRequestQueue: %d, loadSavedCitiesFromKVSOnly: %d, disableLimitReverseGeocoding: %d", v3, v16, v4, v5, v6, v7, v8, v10, v12, v13, -[WFRemoteAppSettings disableForecastRequestCancelation](self, "disableForecastRequestCancelation"), -[WFRemoteAppSettings disablePriorityForecastRequestQueue](self, "disablePriorityForecastRequestQueue"), -[WFRemoteAppSettings loadSavedCitiesFromKVSOnly](self, "loadSavedCitiesFromKVSOnly"), -[WFRemoteAppSettings disableLimitReverseGeocoding](self, "disableLimitReverseGeocoding")];

  return (NSString *)v14;
}

- (BOOL)isExpired
{
  char v3 = [MEMORY[0x263EFF910] date];
  unint64_t v4 = [(WFRemoteAppSettings *)self lastModificationDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  double v7 = (double)[(WFRemoteAppSettings *)self appConfigRefreshRate];
  unint64_t v8 = WFLogForCategory(9uLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v6 < v7)
  {
    if (v9) {
      -[WFRemoteAppSettings isExpired](self);
    }
  }
  else if (v9)
  {
    -[WFRemoteAppSettings isExpired](self);
  }

  return v6 >= v7;
}

- (BOOL)aqiEnabledForCountryCode:(id)a3
{
  id v4 = a3;
  double v5 = [(WFRemoteAppSettings *)self aqiEnabledCountryCodes];
  if (v5)
  {
    double v6 = [(WFRemoteAppSettings *)self aqiEnabledCountryCodes];
    char v7 = [v6 containsObject:v4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_apiVersion copyWithZone:a3];
  char v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSDictionary *)self->_widgetRefreshPolicy copyWithZone:a3];
  BOOL v9 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v8;

  uint64_t v10 = [(NSString *)self->_apiVersionFallback copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSSet *)self->_aqiEnabledCountryCodes copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  *(void *)(v5 + 144) = self->_appConfigRefreshRate;
  uint64_t v14 = [(NSDate *)self->_lastModificationDate copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v14;

  *(void *)(v5 + 48) = self->_networkFailedAttemptsLimit;
  *(void *)(v5 + 56) = self->_networkSwitchExpirationTimeInSeconds;
  *(void *)(v5 + 64) = self->_locationNumDecimalsOfPrecision;
  id v16 = [(WFWeatherEventsConfig *)self->_weatherEventsConfig copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v16;

  uint64_t v18 = [(NSString *)self->_bundleID copyWithZone:a3];
  long long v19 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v18;

  uint64_t v20 = [(NSString *)self->_countryCode copyWithZone:a3];
  long long v21 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v20;

  *(void *)(v5 + 176) = self->_apiConfigModdedHash;
  *(void *)(v5 + 184) = self->_apiConfigMinRange;
  *(void *)(v5 + 192) = self->_apiConfigMaxRange;
  uint64_t v22 = [(NSURL *)self->_appAnalyticsEndpointUrl copyWithZone:a3];
  uint64_t v23 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v22;

  *(float *)(v5 + 12) = self->_dataSamplingRate;
  *(float *)(v5 + 16) = self->_telemetrySamplingRate;
  *(float *)(v5 + 20) = self->_locationGeocodingSamplingRate;
  *(double *)(v5 + 96) = self->_userIdentifierResetTimeInterval;
  *(double *)(v5 + 104) = self->_privateUserIdentifierResetTimeInterval;
  *(double *)(v5 + 112) = self->_cachedGeocodeLocationExpirationTimeInterval;
  *(double *)(v5 + 120) = self->_locationUpdateMinTimeInterval;
  *(double *)(v5 + 128) = self->_locationUpdateMinDistance;
  return (id)v5;
}

- (NSString)apiVersion
{
  return self->_apiVersion;
}

- (NSString)apiVersionFallback
{
  return self->_apiVersionFallback;
}

- (NSSet)aqiEnabledCountryCodes
{
  return self->_aqiEnabledCountryCodes;
}

- (unint64_t)networkFailedAttemptsLimit
{
  return self->_networkFailedAttemptsLimit;
}

- (unint64_t)networkSwitchExpirationTimeInSeconds
{
  return self->_networkSwitchExpirationTimeInSeconds;
}

- (unint64_t)locationNumDecimalsOfPrecision
{
  return self->_locationNumDecimalsOfPrecision;
}

- (WFWeatherEventsConfig)weatherEventsConfig
{
  return self->_weatherEventsConfig;
}

- (NSDictionary)widgetRefreshPolicy
{
  return self->_widgetRefreshPolicy;
}

- (NSURL)appAnalyticsEndpointUrl
{
  return self->_appAnalyticsEndpointUrl;
}

- (float)dataSamplingRate
{
  return self->_dataSamplingRate;
}

- (float)telemetrySamplingRate
{
  return self->_telemetrySamplingRate;
}

- (float)locationGeocodingSamplingRate
{
  return self->_locationGeocodingSamplingRate;
}

- (double)userIdentifierResetTimeInterval
{
  return self->_userIdentifierResetTimeInterval;
}

- (double)privateUserIdentifierResetTimeInterval
{
  return self->_privateUserIdentifierResetTimeInterval;
}

- (double)cachedGeocodeLocationExpirationTimeInterval
{
  return self->_cachedGeocodeLocationExpirationTimeInterval;
}

- (double)locationUpdateMinTimeInterval
{
  return self->_locationUpdateMinTimeInterval;
}

- (double)locationUpdateMinDistance
{
  return self->_locationUpdateMinDistance;
}

- (BOOL)disableForecastRequestCancelation
{
  return self->_disableForecastRequestCancelation;
}

- (BOOL)disablePriorityForecastRequestQueue
{
  return self->_disablePriorityForecastRequestQueue;
}

- (BOOL)loadSavedCitiesFromKVSOnly
{
  return self->_loadSavedCitiesFromKVSOnly;
}

- (BOOL)disableLimitReverseGeocoding
{
  return self->_disableLimitReverseGeocoding;
}

- (NSDictionary)config
{
  return self->_config;
}

- (int64_t)appConfigRefreshRate
{
  return self->_appConfigRefreshRate;
}

- (NSDate)lastModificationDate
{
  return self->_lastModificationDate;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (unint64_t)apiConfigModdedHash
{
  return self->_apiConfigModdedHash;
}

- (unint64_t)apiConfigMinRange
{
  return self->_apiConfigMinRange;
}

- (unint64_t)apiConfigMaxRange
{
  return self->_apiConfigMaxRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_lastModificationDate, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_appAnalyticsEndpointUrl, 0);
  objc_storeStrong((id *)&self->_widgetRefreshPolicy, 0);
  objc_storeStrong((id *)&self->_weatherEventsConfig, 0);
  objc_storeStrong((id *)&self->_aqiEnabledCountryCodes, 0);
  objc_storeStrong((id *)&self->_apiVersionFallback, 0);
  objc_storeStrong((id *)&self->_apiVersion, 0);
}

- (void)getAPIVersionFromDictionary:(uint64_t)a1 userID:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21C988000, a2, OS_LOG_TYPE_DEBUG, "no apiVersion dictionary to parse, use default source: %@", (uint8_t *)&v2, 0xCu);
}

- (void)getAPIVersionFromDictionary:(uint64_t)a1 userID:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21C988000, a2, OS_LOG_TYPE_DEBUG, "user did not fall in any range, use default source: %@", (uint8_t *)&v2, 0xCu);
}

- (void)getAPIVersionFromDictionary:(NSObject *)a3 userID:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 numberForKey:@"minRange"];
  char v7 = [a1 numberForKey:@"maxRange"];
  int v8 = 138412802;
  BOOL v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_debug_impl(&dword_21C988000, a3, OS_LOG_TYPE_DEBUG, "user fell in range [%@,%@), use data source: %@", (uint8_t *)&v8, 0x20u);
}

- (void)isExpired
{
  [a1 appConfigRefreshRate];
  OUTLINED_FUNCTION_1(&dword_21C988000, v1, v2, "The app config is still valid, seconds remaining: %f, refresh rate: %lld", v3, v4, v5, v6, 0);
}

@end