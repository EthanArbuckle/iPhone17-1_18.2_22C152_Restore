@interface SBTestingDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBTestingDefaults

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"testRunnerRecoveryApplicationBundleIdentifier"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBTestRunnerRecoveryApplicationBundleIdentifier" toDefaultValue:0 options:1];
}

@end