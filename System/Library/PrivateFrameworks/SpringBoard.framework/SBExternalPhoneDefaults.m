@interface SBExternalPhoneDefaults
- (SBExternalPhoneDefaults)init;
- (void)_bindAndRegisterDefaults;
@end

@implementation SBExternalPhoneDefaults

- (SBExternalPhoneDefaults)init
{
  return (SBExternalPhoneDefaults *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.mobilephone"];
}

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"hideMyPhoneNumber"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"HideMyNumber" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];
}

@end