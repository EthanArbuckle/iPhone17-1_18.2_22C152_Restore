@interface SBBiometricAuthenticationDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBBiometricAuthenticationDefaults

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"logTimestampsEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBLogMesaTimestamps" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];
}

@end