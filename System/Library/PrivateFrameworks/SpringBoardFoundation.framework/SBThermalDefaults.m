@interface SBThermalDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBThermalDefaults

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"wasConnectedToWiFiWhenBrickedForThermalConditions"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"ThermalLockoutWiFiWasEnabled" toDefaultValue:MEMORY[0x1E4F1CC28] options:4];
}

@end