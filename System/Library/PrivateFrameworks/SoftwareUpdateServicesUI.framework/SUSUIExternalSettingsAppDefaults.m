@interface SUSUIExternalSettingsAppDefaults
+ (BOOL)__useDynamicMethodResolution;
- (BOOL)isBadgedForSoftwareUpdate;
- (SUSUIExternalSettingsAppDefaults)init;
- (void)setBadgedForSoftwareUpdate:(BOOL)a3;
@end

@implementation SUSUIExternalSettingsAppDefaults

- (SUSUIExternalSettingsAppDefaults)init
{
  id v4 = 0;
  id v4 = [(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.Preferences"];
  v3 = (SUSUIExternalSettingsAppDefaults *)v4;
  objc_storeStrong(&v4, 0);
  return v3;
}

+ (BOOL)__useDynamicMethodResolution
{
  return 0;
}

- (BOOL)isBadgedForSoftwareUpdate
{
  id v3 = [(BSAbstractDefaultDomain *)self _store];
  char v4 = [v3 BOOLForKey:@"kBadgedForSoftwareUpdateKey"];

  return v4 & 1;
}

- (void)setBadgedForSoftwareUpdate:(BOOL)a3
{
  BOOL v5 = a3;
  id v3 = [(BSAbstractDefaultDomain *)self _store];
  objc_msgSend(v3, "setBool:forKey:", v5);

  id v4 = [(BSAbstractDefaultDomain *)self _store];
  [v4 synchronize];

  GSSendAppPreferencesChanged();
}

@end