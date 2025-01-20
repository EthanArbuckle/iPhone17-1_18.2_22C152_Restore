@interface SBExternalSettingsDefaults
+ (BOOL)__useDynamicMethodResolution;
- (BOOL)isBadgedForSoftwareUpdate;
- (SBExternalSettingsDefaults)init;
- (void)setBadgedForSoftwareUpdate:(BOOL)a3;
@end

@implementation SBExternalSettingsDefaults

- (SBExternalSettingsDefaults)init
{
  return (SBExternalSettingsDefaults *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.Preferences"];
}

+ (BOOL)__useDynamicMethodResolution
{
  return 0;
}

- (BOOL)isBadgedForSoftwareUpdate
{
  v2 = [(BSAbstractDefaultDomain *)self _store];
  char v3 = [v2 BOOLForKey:@"kBadgedForSoftwareUpdateKey"];

  return v3;
}

- (void)setBadgedForSoftwareUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(BSAbstractDefaultDomain *)self _store];
  [v5 setBool:v3 forKey:@"kBadgedForSoftwareUpdateKey"];

  v6 = [(BSAbstractDefaultDomain *)self _store];
  [v6 synchronize];

  MEMORY[0x1F411CA08](@"com.apple.Preferences", @"kBadgedForSoftwareUpdateKey");
}

@end