@interface WeatherSettingsUnits
- (NSUnitTemperature)preferredTemperatureUnit;
- (_TtC13WeatherWidget20WeatherSettingsUnits)init;
- (void)refreshUnits;
- (void)refreshUnitsWithCompletionHandler:(id)a3;
- (void)setPreferredTemperatureUnit:(id)a3;
@end

@implementation WeatherSettingsUnits

- (_TtC13WeatherWidget20WeatherSettingsUnits)init
{
  return (_TtC13WeatherWidget20WeatherSettingsUnits *)sub_100110B34();
}

- (void)refreshUnits
{
  v2 = self;
  sub_100110C48();
}

- (void)refreshUnitsWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  v6 = self;

  sub_10011108C((uint64_t)&unk_100171A10, v5);
}

- (void)setPreferredTemperatureUnit:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100111190(a3);
}

- (NSUnitTemperature)preferredTemperatureUnit
{
  v2 = self;
  v3 = (void *)sub_100111328();

  return (NSUnitTemperature *)v3;
}

@end