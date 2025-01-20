@interface WeatherInternalPreferences
+ (id)sharedInternalPreferences;
- (BOOL)isInternalInstall;
- (BOOL)isV3Enabled;
- (BOOL)shouldShowUpdateTimestamp;
- (WeatherPreferencesPersistence)persistence;
- (unint64_t)deviceInactivityThreshold;
- (void)setPersistence:(id)a3;
@end

@implementation WeatherInternalPreferences

+ (id)sharedInternalPreferences
{
  if (sharedInternalPreferences_onceToken != -1) {
    dispatch_once(&sharedInternalPreferences_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)sharedInternalPreferences_sharedInternalPreferences;
  return v2;
}

uint64_t __55__WeatherInternalPreferences_sharedInternalPreferences__block_invoke()
{
  v0 = [[WeatherInternalPreferences alloc] initWithSuiteName:@"com.apple.weather.internal"];
  uint64_t v1 = sharedInternalPreferences_sharedInternalPreferences;
  sharedInternalPreferences_sharedInternalPreferences = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1) {
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global_2);
  }
  return isInternalInstall___isInternalInstall;
}

uint64_t __47__WeatherInternalPreferences_isInternalInstall__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isInternalInstall___isInternalInstall = result;
  return result;
}

- (BOOL)isV3Enabled
{
  v2 = +[WeatherInternalPreferences sharedInternalPreferences];
  v3 = [v2 objectForKey:@"apiVersion"];

  LOBYTE(v2) = [v3 isEqualToString:@"twc_v3"];
  return (char)v2;
}

- (BOOL)shouldShowUpdateTimestamp
{
  v2 = +[WeatherInternalPreferences sharedInternalPreferences];
  char v3 = [v2 BOOLForKey:@"forceUpdateTimeShown"];

  return v3;
}

- (unint64_t)deviceInactivityThreshold
{
  v2 = +[WeatherInternalPreferences sharedInternalPreferences];
  unint64_t v3 = [v2 integerForKey:@"feature.manateeMigration.deviceInactivityThreshold"];

  return v3;
}

- (WeatherPreferencesPersistence)persistence
{
  return (WeatherPreferencesPersistence *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPersistence:(id)a3
{
}

- (void).cxx_destruct
{
}

@end