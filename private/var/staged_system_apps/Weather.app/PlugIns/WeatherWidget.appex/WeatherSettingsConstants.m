@interface WeatherSettingsConstants
+ (NSString)PrivacyHomeWorkShowLabelsNavigationUrl;
+ (NSString)PrivacyResetNavigationUrl;
+ (NSString)RootNavigationUrl;
+ (NSString)TemperatureNavigationUrl;
- (_TtC13WeatherWidget24WeatherSettingsConstants)init;
@end

@implementation WeatherSettingsConstants

+ (NSString)RootNavigationUrl
{
  return (NSString *)sub_1000A6444((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_1000A6364);
}

+ (NSString)TemperatureNavigationUrl
{
  return (NSString *)sub_1000A6444((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_1000A639C);
}

+ (NSString)PrivacyResetNavigationUrl
{
  return (NSString *)sub_1000A6444((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_1000A63D4);
}

+ (NSString)PrivacyHomeWorkShowLabelsNavigationUrl
{
  return (NSString *)sub_1000A6444((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_1000A640C);
}

- (_TtC13WeatherWidget24WeatherSettingsConstants)init
{
  return (_TtC13WeatherWidget24WeatherSettingsConstants *)sub_1000A6498();
}

@end