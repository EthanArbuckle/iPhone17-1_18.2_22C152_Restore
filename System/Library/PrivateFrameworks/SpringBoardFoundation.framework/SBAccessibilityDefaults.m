@interface SBAccessibilityDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBAccessibilityDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"reallyDisableReachability"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBReallyDisableReachability" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  id v4 = [NSString stringWithUTF8String:"allowReachability"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v4 withDefaultKey:@"SBReachabilityEnabled" toDefaultValue:MEMORY[0x1E4F1CC38] options:1];
}

@end