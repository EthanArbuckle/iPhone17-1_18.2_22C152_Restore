@interface WorldClockPreferences
- (BOOL)cityDataNeedsUpdate;
- (BOOL)defaultCitiesAdded;
- (BOOL)synchronize;
- (id)cities;
- (id)defaultsKeys;
- (id)lastModified;
- (void)cityDataUpdated;
- (void)clearOutCityUpdatePref;
- (void)setCities:(id)a3;
- (void)setDefaultCitiesAdded:(BOOL)a3;
- (void)setLastModified:(id)a3;
@end

@implementation WorldClockPreferences

- (id)lastModified
{
  v2 = (void *)CFPreferencesCopyAppValue((CFStringRef)CitiesLastModifiedKey, @"com.apple.mobiletimer");
  return v2;
}

- (BOOL)cityDataNeedsUpdate
{
  v2 = (void *)CFPreferencesCopyAppValue((CFStringRef)LatestUpdateVersion, @"com.apple.mobiletimer");
  v3 = [MEMORY[0x1E4F28F80] processInfo];
  v4 = [v3 operatingSystemVersionString];
  char v5 = [v2 isEqualToString:v4] ^ 1;

  return v5;
}

- (id)cities
{
  v2 = (void *)CFPreferencesCopyAppValue((CFStringRef)CitiesKey, @"com.apple.mobiletimer");
  return v2;
}

- (BOOL)defaultCitiesAdded
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)DefaultCityAddedKey, @"com.apple.mobiletimer", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (id)defaultsKeys
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = CitiesKey;
  v4[1] = CitiesLastModifiedKey;
  v4[2] = DefaultCityAddedKey;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

- (void)setLastModified:(id)a3
{
}

- (void)setCities:(id)a3
{
}

- (void)setDefaultCitiesAdded:(BOOL)a3
{
}

- (BOOL)synchronize
{
  return CFPreferencesAppSynchronize(@"com.apple.mobiletimer") != 0;
}

- (void)cityDataUpdated
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  value = [v2 operatingSystemVersionString];

  CFPreferencesSetAppValue((CFStringRef)LatestUpdateVersion, value, @"com.apple.mobiletimer");
}

- (void)clearOutCityUpdatePref
{
}

@end