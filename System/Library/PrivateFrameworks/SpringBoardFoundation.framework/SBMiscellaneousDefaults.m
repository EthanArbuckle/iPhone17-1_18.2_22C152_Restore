@interface SBMiscellaneousDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBMiscellaneousDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"dataPlanActivationPromptCount"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBDataPlanActivationPromptCount" toDefaultValue:&unk_1ED89E590 options:1];

  v4 = [NSString stringWithUTF8String:"suppressNoSimAlert"];
  uint64_t v5 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v4 withDefaultKey:@"SBSuppressNoSimAlert" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v6 = [NSString stringWithUTF8String:"walletPreArmForceLockButton"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"SBWalletPreArmForceLockButton" toDefaultValue:v5 options:1];

  v7 = [NSString stringWithUTF8String:"backlightLevel"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"SBBacklightLevel2" toDefaultValue:&unk_1ED89ECB8 options:1];

  v8 = [NSString stringWithUTF8String:"suppressAlertsForKeynote"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"SBSupressAlertsForKeynote" toDefaultValue:v5 options:4];

  v9 = [NSString stringWithUTF8String:"sensitiveUIEnabled"];
  uint64_t v10 = MEMORY[0x1E4F1CC38];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"SBSensitiveUIEnabled" toDefaultValue:MEMORY[0x1E4F1CC38] options:4];

  v11 = [NSString stringWithUTF8String:"disableAsyncRenderingSurfaceRetention"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v11 withDefaultKey:@"SBDisableAsyncRenderingSurfaceRetention" toDefaultValue:v5 options:4];

  v12 = [NSString stringWithUTF8String:"launchWithMallocStackLogging"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v12 withDefaultKey:@"SBShouldLaunchWithMallocStackLogging" toDefaultValue:v5 options:1];

  v13 = [NSString stringWithUTF8String:"disableAutomaticMallocStackLogging"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v13 withDefaultKey:@"SBDisableAutomaticMallocStackLogging" toDefaultValue:v5 options:1];

  id v14 = [NSString stringWithUTF8String:"enableDynamicJetsamLimits"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v14 withDefaultKey:@"SBEnableDynamicJetsamLimits" toDefaultValue:v10 options:1];
}

@end