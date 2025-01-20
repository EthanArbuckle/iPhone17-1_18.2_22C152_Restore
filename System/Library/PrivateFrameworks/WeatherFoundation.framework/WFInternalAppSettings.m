@interface WFInternalAppSettings
- (BOOL)disableForecastRequestCancelation;
- (BOOL)disableLimitReverseGeocoding;
- (BOOL)disablePriorityForecastRequestQueue;
- (BOOL)loadSavedCitiesFromKVSOnly;
- (NSSet)aqiEnabledCountryCodes;
- (NSString)apiVersion;
- (NSString)apiVersionFallback;
- (NSString)description;
- (NSURL)appAnalyticsEndpointUrl;
- (WFWeatherEventsConfig)weatherEventsConfig;
- (double)cachedGeocodeLocationExpirationTimeInterval;
- (double)locationUpdateMinDistance;
- (double)locationUpdateMinTimeInterval;
- (double)privateUserIdentifierResetTimeInterval;
- (double)userIdentifierResetTimeInterval;
- (float)dataSamplingRate;
- (float)locationGeocodingSamplingRate;
- (float)telemetrySamplingRate;
- (unint64_t)locationNumDecimalsOfPrecision;
- (unint64_t)networkFailedAttemptsLimit;
- (unint64_t)networkSwitchExpirationTimeInSeconds;
@end

@implementation WFInternalAppSettings

- (NSString)description
{
  v3 = NSString;
  v4 = [(WFInternalAppSettings *)self apiVersion];
  v5 = [(WFInternalAppSettings *)self apiVersionFallback];
  v6 = [v3 stringWithFormat:@"API version = %@, API Fallback version = %@, Network Failed Attempts Limit = %lu, Network Switch Expiration Time In Seconds = %lu, location precision = %ld", v4, v5, -[WFInternalAppSettings networkFailedAttemptsLimit](self, "networkFailedAttemptsLimit"), -[WFInternalAppSettings networkFailedAttemptsLimit](self, "networkFailedAttemptsLimit"), -[WFInternalAppSettings locationNumDecimalsOfPrecision](self, "locationNumDecimalsOfPrecision")];

  return (NSString *)v6;
}

- (NSString)apiVersion
{
  v2 = WeatherFoundationInternalUserDefaults();
  v3 = [v2 stringForKey:@"apiVersion"];
  v4 = v3;
  if (!v3) {
    v3 = @"twc_v2";
  }
  v5 = v3;

  return v5;
}

- (NSSet)aqiEnabledCountryCodes
{
  v2 = WeatherFoundationInternalUserDefaults();
  char v3 = [v2 BOOLForKey:@"aqiEnabled"];

  if (v3)
  {
    v4 = WeatherFoundationInternalUserDefaults();
    v5 = [v4 arrayForKey:@"aqiEnabledCountries"];

    if (v5) {
      [MEMORY[0x263EFFA08] setWithArray:v5];
    }
    else {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"CN", @"US", @"DE", @"IN", @"MX", @"GB", 0);
    }
  }
  else
  {
    v6 = objc_opt_new();
  }
  return (NSSet *)v6;
}

- (NSString)apiVersionFallback
{
  v2 = WeatherFoundationInternalUserDefaults();
  char v3 = [v2 stringForKey:@"apiVersionFallback"];
  v4 = v3;
  if (!v3) {
    char v3 = @"twc_v2";
  }
  v5 = v3;

  return v5;
}

- (unint64_t)networkFailedAttemptsLimit
{
  v2 = WeatherFoundationInternalUserDefaults();
  char v3 = [v2 objectForKey:@"networkFailedAttemptsLimit"];

  if (v3) {
    unint64_t v4 = [v3 integerValue];
  }
  else {
    unint64_t v4 = 2;
  }

  return v4;
}

- (unint64_t)networkSwitchExpirationTimeInSeconds
{
  v2 = WeatherFoundationInternalUserDefaults();
  char v3 = [v2 objectForKey:@"networkSwitchExpirationTime"];

  if (v3) {
    unint64_t v4 = [v3 integerValue];
  }
  else {
    unint64_t v4 = 60;
  }

  return v4;
}

- (unint64_t)locationNumDecimalsOfPrecision
{
  v2 = WeatherFoundationInternalUserDefaults();
  char v3 = [v2 objectForKey:@"locationDecimalPrecision"];

  if (v3) {
    unint64_t v4 = [v3 integerValue];
  }
  else {
    unint64_t v4 = 3;
  }

  return v4;
}

- (NSURL)appAnalyticsEndpointUrl
{
  return (NSURL *)[NSURL URLWithString:@"https://weather-analytics-events.apple.com/analyticseventsv2/async"];
}

- (float)dataSamplingRate
{
  return 0.2;
}

- (float)telemetrySamplingRate
{
  return 0.25;
}

- (float)locationGeocodingSamplingRate
{
  return 0.2;
}

- (double)userIdentifierResetTimeInterval
{
  return 33696000.0;
}

- (double)privateUserIdentifierResetTimeInterval
{
  return 2592000.0;
}

- (double)cachedGeocodeLocationExpirationTimeInterval
{
  return 86400.0;
}

- (double)locationUpdateMinTimeInterval
{
  return 1800.0;
}

- (double)locationUpdateMinDistance
{
  return 500.0;
}

- (WFWeatherEventsConfig)weatherEventsConfig
{
  v2 = [[WFWeatherEventsConfig alloc] initWithDictionary:0];
  return v2;
}

- (BOOL)disableForecastRequestCancelation
{
  return 0;
}

- (BOOL)disablePriorityForecastRequestQueue
{
  return 0;
}

- (BOOL)loadSavedCitiesFromKVSOnly
{
  return 0;
}

- (BOOL)disableLimitReverseGeocoding
{
  return 0;
}

@end