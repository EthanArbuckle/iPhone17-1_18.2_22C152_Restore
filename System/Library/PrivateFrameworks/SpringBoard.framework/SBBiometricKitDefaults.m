@interface SBBiometricKitDefaults
- (SBBiometricKitDefaults)init;
- (void)_bindAndRegisterDefaults;
@end

@implementation SBBiometricKitDefaults

- (SBBiometricKitDefaults)init
{
  return (SBBiometricKitDefaults *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.biometrickitd"];
}

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"coachingHintsEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"coachingHintsEnabled" toDefaultValue:MEMORY[0x1E4F1CC38] options:1];
}

@end