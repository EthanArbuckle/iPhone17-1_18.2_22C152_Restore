@interface SBExternalDemoDefaults
- (SBExternalDemoDefaults)init;
- (void)_bindAndRegisterDefaults;
@end

@implementation SBExternalDemoDefaults

- (SBExternalDemoDefaults)init
{
  return (SBExternalDemoDefaults *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.demo-settings"];
}

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"shouldLockIconsInStoreDemoMode"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"LockIcons" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];
}

@end