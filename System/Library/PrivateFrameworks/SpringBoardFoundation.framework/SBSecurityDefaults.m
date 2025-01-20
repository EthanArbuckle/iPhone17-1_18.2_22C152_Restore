@interface SBSecurityDefaults
- (id)deviceLockDefaultForKey:(id)a3;
- (void)_bindAndRegisterDefaults;
- (void)setDeviceLockDefault:(id)a3 forKey:(id)a4;
@end

@implementation SBSecurityDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"blockedForThermal"];
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"ThermalLockoutEnabledBrickMode" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v5 = [NSString stringWithUTF8String:"pendingDeviceWipe"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBFDeviceLockPendingWipe" toDefaultValue:0 options:1];

  v6 = [NSString stringWithUTF8String:"blockedForPasscode"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"SBDeviceLockBlocked" toDefaultValue:0 options:1];

  v7 = [NSString stringWithUTF8String:"numberOfFailedPasscodeAttempts"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"SBDeviceLockFailedAttempts" toDefaultValue:0 options:1];

  v8 = [NSString stringWithUTF8String:"unblockTimeFromReferenceDate"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"SBDeviceLockBlockTimeIntervalSinceReferenceDate" toDefaultValue:0 options:1];

  v9 = [NSString stringWithUTF8String:"blockStateGeneration"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"SBDeviceLockBlockStateGeneration" toDefaultValue:0 options:1];

  v10 = [NSString stringWithUTF8String:"deviceWipeEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v10 withDefaultKey:@"SBDeviceWipeEnabled" toDefaultValue:v4 options:1];

  v11 = [NSString stringWithUTF8String:"dontLockEver"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v11 withDefaultKey:@"SBDontLockEver" toDefaultValue:v4 options:1];

  v12 = [NSString stringWithUTF8String:"allowLockAndUnlockWithCase"];
  uint64_t v13 = MEMORY[0x1E4F1CC38];
  [(BSAbstractDefaultDomain *)self _bindProperty:v12 withDefaultKey:@"SBLockAndUnlockWithCase" toDefaultValue:MEMORY[0x1E4F1CC38] options:1];

  v14 = [NSString stringWithUTF8String:"enableLayerBasedViewSecurity"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v14 withDefaultKey:@"SBEnableLayerBasedViewSecurity" toDefaultValue:v13 options:1];

  id v15 = [NSString stringWithUTF8String:"reportSecureDrawViolations"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v15 withDefaultKey:@"SBEnableSecureDrawViolationAlerts" toDefaultValue:v13 options:1];
}

- (id)deviceLockDefaultForKey:(id)a3
{
  id v4 = a3;
  v5 = [(BSAbstractDefaultDomain *)self _store];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setDeviceLockDefault:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(BSAbstractDefaultDomain *)self _store];
  v8 = v7;
  if (v9) {
    [v7 setObject:v9 forKey:v6];
  }
  else {
    [v7 removeObjectForKey:v6];
  }
}

@end