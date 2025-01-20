@interface SBExternalSetupDefaults
- (SBExternalSetupDefaults)init;
- (void)_bindAndRegisterDefaults;
@end

@implementation SBExternalSetupDefaults

- (SBExternalSetupDefaults)init
{
  return (SBExternalSetupDefaults *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.purplebuddy"];
}

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"deviceSetup"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SetupDone" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  id v4 = [NSString stringWithUTF8String:"setupState"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v4 withDefaultKey:@"SetupState" toDefaultValue:0 options:1];
}

@end