@interface SBExternalDuetDefaults
- (SBExternalDuetDefaults)init;
- (void)_bindAndRegisterDefaults;
@end

@implementation SBExternalDuetDefaults

- (SBExternalDuetDefaults)init
{
  return (SBExternalDuetDefaults *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.Duet"];
}

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"duetAllowedApps"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"DuetWhitelistedApps" toDefaultValue:0 options:1];
}

@end