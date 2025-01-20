@interface NSUserDefaults(WeatherCore)
+ (id)wc_userDefaultsWithSuiteName:()WeatherCore backupDisabled:;
@end

@implementation NSUserDefaults(WeatherCore)

+ (id)wc_userDefaultsWithSuiteName:()WeatherCore backupDisabled:
{
  v3 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithSuiteName:v4];
  _CFPreferencesSetBackupDisabled();

  return v5;
}

@end