@interface SBStatusBarDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBStatusBarDefaults

- (void)_bindAndRegisterDefaults
{
  v4 = [NSString stringWithUTF8String:"countryCodesShowingEmergencyOnlyStatus"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v4 withDefaultKey:@"SBCountryCodesShowingEmergencyOnly" toDefaultValue:0 options:1];

  v5 = [NSString stringWithUTF8String:"suppressStatusBarOverrideForScreenSharing"];
  uint64_t v6 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBSuppressScreenSharingStatusBarOverridePreferenceKey" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v7 = [NSString stringWithUTF8String:"showBatteryLevel"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"SBShowBatteryLevel" toDefaultValue:v6 options:1];

  v8 = [NSString stringWithUTF8String:"showBatteryPercentage"];
  v9 = NSNumber;
  int v10 = __sb__runningInSpringBoard();
  char v11 = v10;
  if (v10)
  {
    BOOL v12 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v12 = [v2 userInterfaceIdiom] == 1;
  }
  v13 = [v9 numberWithInt:v12];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"SBShowBatteryPercentage" toDefaultValue:v13 options:1];

  if ((v11 & 1) == 0) {
  v14 = [NSString stringWithUTF8String:"showOptimalCellDataForCarPlay"];
  }
  uint64_t v15 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v14 withDefaultKey:@"SBCarPlayShowOptimalCellData" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v16 = [NSString stringWithUTF8String:"showOverridesForRecording"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v16 withDefaultKey:@"SBShowStatusBarOverridesForRecording" toDefaultValue:v15 options:1];

  v17 = [NSString stringWithUTF8String:"showRSSI"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v17 withDefaultKey:@"SBShowRSSI" toDefaultValue:v15 options:1];

  v18 = [NSString stringWithUTF8String:"statusBarLogLevel"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v18 withDefaultKey:@"SBStatusBarishLogOptions" toDefaultValue:&unk_1ED89E548 options:1];

  v19 = [NSString stringWithUTF8String:"showThermalWarning"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v19 withDefaultKey:@"SBShowThermalWarning" toDefaultValue:v15 options:1];

  v20 = [NSString stringWithUTF8String:"showRingerState"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v20 withDefaultKey:@"SBShowRingerState" toDefaultValue:MEMORY[0x1E4F1CC38] options:1];

  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2) {
      return;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v22 = [v21 userInterfaceIdiom];

    if (v22 != 1) {
      return;
    }
  }
  id v23 = [(BSAbstractDefaultDomain *)self _store];
  if ((objc_msgSend(v23, "bs_defaultExists:", @"SBShowBatteryPercentage") & 1) == 0) {
    [v23 setBool:1 forKey:@"SBShowBatteryPercentage"];
  }
}

@end