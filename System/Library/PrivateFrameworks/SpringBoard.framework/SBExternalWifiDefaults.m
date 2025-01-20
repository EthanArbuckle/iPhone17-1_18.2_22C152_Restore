@interface SBExternalWifiDefaults
- (SBExternalWifiDefaults)init;
- (void)_bindAndRegisterDefaults;
@end

@implementation SBExternalWifiDefaults

- (SBExternalWifiDefaults)init
{
  return (SBExternalWifiDefaults *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.preferences.network"];
}

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"wifiEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"wifi-network" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];
}

@end