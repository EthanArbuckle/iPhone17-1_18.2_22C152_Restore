@interface WeatherSettingsManager
+ (id)settingsUpdatedNotification;
+ (id)sharedManager;
- (BOOL)shouldShowAirQualityConditions;
- (BOOL)shouldShowWeatherConditions;
- (WeatherSettingsManager)init;
- (id)initSharedManager;
- (void)_postWeatherConditionsSettingsUpdatedNotification;
- (void)countryConfigurationDidChange:(id)a3;
- (void)setShouldShowAirQualityConditions:(BOOL)a3;
- (void)setShouldShowWeatherConditions:(BOOL)a3;
@end

@implementation WeatherSettingsManager

+ (id)sharedManager
{
  if (qword_10160FD58 != -1) {
    dispatch_once(&qword_10160FD58, &stru_1012FF0B0);
  }
  v2 = (void *)qword_10160FD50;

  return v2;
}

- (id)initSharedManager
{
  v7.receiver = self;
  v7.super_class = (Class)WeatherSettingsManager;
  v2 = [(WeatherSettingsManager *)&v7 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"countryConfigurationDidChange:" name:GEOCountryConfigurationCountryCodeDidChangeNotification object:0];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"countryConfigurationDidChange:" name:GEOCountryConfigurationProvidersDidChangeNotification object:0];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"countryConfigurationDidChange:" name:UIApplicationWillEnterForegroundNotification object:0];
  }
  return v2;
}

- (BOOL)shouldShowWeatherConditions
{
  return GEOConfigGetBOOL();
}

- (BOOL)shouldShowAirQualityConditions
{
  return GEOConfigGetBOOL();
}

+ (id)settingsUpdatedNotification
{
  return @"WeatherConditionsNeedsUpdatedNotification";
}

- (WeatherSettingsManager)init
{
  return 0;
}

- (void)countryConfigurationDidChange:(id)a3
{
}

- (void)setShouldShowAirQualityConditions:(BOOL)a3
{
  GEOConfigSetBOOL();

  [(WeatherSettingsManager *)self _postWeatherConditionsSettingsUpdatedNotification];
}

- (void)setShouldShowWeatherConditions:(BOOL)a3
{
  GEOConfigSetBOOL();

  [(WeatherSettingsManager *)self _postWeatherConditionsSettingsUpdatedNotification];
}

- (void)_postWeatherConditionsSettingsUpdatedNotification
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"WeatherConditionsNeedsUpdatedNotification" object:self];
}

@end