@interface SBPowerDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBPowerDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"disableIdleSleep"];
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBDisableIdleSleep" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v5 = [NSString stringWithUTF8String:"hideACPower"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBHideACPower" toDefaultValue:v4 options:1];

  v6 = [NSString stringWithUTF8String:"hideLowPowerAlerts"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"SBHideLowPowerAlerts" toDefaultValue:v4 options:1];

  v7 = [NSString stringWithUTF8String:"lowBatteryLevel"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"SBLowBatteryLevel" toDefaultValue:&unk_1ED89E4D0 options:1];

  id v8 = [NSString stringWithUTF8String:"trackPowerEvents"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"SBTrackPowerEvents" toDefaultValue:v4 options:1];
}

@end