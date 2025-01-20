@interface SBDemoDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBDemoDefaults

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"storeDemoApplicationLockEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBStoreDemoAppLock" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];
}

@end