@interface WeatherSettingsState
+ (_TtC13WeatherWidget20WeatherSettingsState)defaultState;
- (BOOL)resetIdentifier;
- (BOOL)showHomeWorkLabels;
- (_TtC13WeatherWidget20WeatherSettingsState)init;
- (_TtC13WeatherWidget20WeatherSettingsUnits)units;
- (void)setResetIdentifier:(BOOL)a3;
- (void)setShowHomeWorkLabels:(BOOL)a3;
@end

@implementation WeatherSettingsState

+ (_TtC13WeatherWidget20WeatherSettingsState)defaultState
{
  id v2 = sub_100063B20();

  return (_TtC13WeatherWidget20WeatherSettingsState *)v2;
}

- (_TtC13WeatherWidget20WeatherSettingsUnits)units
{
  id v2 = sub_100063BD8();

  return (_TtC13WeatherWidget20WeatherSettingsUnits *)v2;
}

- (BOOL)resetIdentifier
{
  id v2 = self;
  unsigned __int8 v3 = sub_100063D10(0x8000000100139D60, 0);

  return v3 & 1;
}

- (void)setResetIdentifier:(BOOL)a3
{
  unsigned __int8 v3 = self;
  sub_100063DEC();
}

- (BOOL)showHomeWorkLabels
{
  id v2 = self;
  unsigned __int8 v3 = sub_100063D10(0x8000000100139D30, 1);

  return v3 & 1;
}

- (void)setShowHomeWorkLabels:(BOOL)a3
{
  unsigned __int8 v3 = self;
  sub_100063DEC();
}

- (_TtC13WeatherWidget20WeatherSettingsState)init
{
  return (_TtC13WeatherWidget20WeatherSettingsState *)sub_100063E80();
}

- (void).cxx_destruct
{
}

@end