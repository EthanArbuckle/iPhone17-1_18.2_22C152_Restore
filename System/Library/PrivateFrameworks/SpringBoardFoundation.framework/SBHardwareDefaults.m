@interface SBHardwareDefaults
- (BOOL)_deviceRequiresNaturalVolumeButtonArrangement;
- (BOOL)isNaturalVolumeButtonOrientationEnabled;
- (void)_bindAndRegisterDefaults;
@end

@implementation SBHardwareDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [(BSAbstractDefaultDomain *)self _store];
  char v4 = objc_msgSend(v3, "bs_defaultExists:", @"SBButtonForceFeel");

  if ((v4 & 1) == 0)
  {
    v5 = [(BSAbstractDefaultDomain *)self _store];
    [v5 setObject:&unk_1ED89E8D8 forKey:@"SBButtonForceFeel"];
  }
  v6 = [NSString stringWithUTF8String:"hasSeenACaseLatchCoverOnce"];
  uint64_t v7 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"SBHasSeenACaseLatchCoverOnce" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v8 = [NSString stringWithUTF8String:"disableHomeButton"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"SBDisableHomeButton" toDefaultValue:v7 options:1];

  v9 = [NSString stringWithUTF8String:"disableProximitySensor"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"SBDisableProximity" toDefaultValue:v7 options:1];

  v10 = [NSString stringWithUTF8String:"disableHomeButtonDoublePress"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v10 withDefaultKey:@"SBDisableHomeButtonDoublePress" toDefaultValue:v7 options:1];

  v11 = [NSString stringWithUTF8String:"homeButtonHapticType"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v11 withDefaultKey:@"SBButtonForceFeel" toDefaultValue:&unk_1ED89E8D8 options:1];

  id v12 = [NSString stringWithUTF8String:"disableNaturalVolumeButtonOrientation"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v12 withDefaultKey:@"SBDisableNaturalVolumeButtonArrangement" toDefaultValue:v7 options:1];
}

- (BOOL)_deviceRequiresNaturalVolumeButtonArrangement
{
  if (_deviceRequiresNaturalVolumeButtonArrangement_onceToken != -1) {
    dispatch_once(&_deviceRequiresNaturalVolumeButtonArrangement_onceToken, &__block_literal_global_30);
  }
  return _deviceRequiresNaturalVolumeButtonArrangement_sRequiredByThisHardware;
}

uint64_t __67__SBHardwareDefaults__deviceRequiresNaturalVolumeButtonArrangement__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _deviceRequiresNaturalVolumeButtonArrangement_sRequiredByThisHardware = result;
  return result;
}

- (BOOL)isNaturalVolumeButtonOrientationEnabled
{
  if ([(SBHardwareDefaults *)self _deviceRequiresNaturalVolumeButtonArrangement])
  {
    return 1;
  }
  else
  {
    return [(SBHardwareDefaults *)self disableNaturalVolumeButtonOrientation] ^ 1;
  }
}

@end