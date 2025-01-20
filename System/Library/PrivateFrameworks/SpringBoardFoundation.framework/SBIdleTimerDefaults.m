@interface SBIdleTimerDefaults
- (BOOL)disableAutoDim;
- (BOOL)disableAutoDimExists;
- (void)_bindAndRegisterDefaults;
@end

@implementation SBIdleTimerDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"minimumLockscreenIdleTime"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBMinimumLockscreenIdleTime" toDefaultValue:&unk_1ED89E8C0 options:1];

  v4 = [NSString stringWithUTF8String:"disableAutoDim"];
  uint64_t v5 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v4 withDefaultKey:@"SBDisableAutoDim" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v6 = [NSString stringWithUTF8String:"dontDimOrLockWhileConnectedToPower"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"SBDontDimOrLockOnAC" toDefaultValue:v5 options:1];

  v7 = [NSString stringWithUTF8String:"supportLiftToWake"];
  uint64_t v8 = MEMORY[0x1E4F1CC38];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"SBSupportLiftToWake" toDefaultValue:MEMORY[0x1E4F1CC38] options:1];

  v9 = [NSString stringWithUTF8String:"supportTapToWake"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"SBSupportTapToWake" toDefaultValue:v8 options:1];

  v10 = [NSString stringWithUTF8String:"disableAttentionAwareness"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v10 withDefaultKey:@"SBDisableAttentionAwareness" toDefaultValue:v5 options:1];

  id v11 = [NSString stringWithUTF8String:"backlightLoggingEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v11 withDefaultKey:@"SBEnableExtraBacklightLogging" toDefaultValue:v5 options:1];
}

- (BOOL)disableAutoDim
{
  BOOL v3 = [(SBIdleTimerDefaults *)self disableAutoDimExists];
  if (v3)
  {
    v4 = [(BSAbstractDefaultDomain *)self _store];
    char v5 = [v4 BOOLForKey:@"SBDisableAutoDim"];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)disableAutoDimExists
{
  v2 = [(BSAbstractDefaultDomain *)self _store];
  char v3 = objc_msgSend(v2, "bs_defaultExists:", @"SBDisableAutoDim");

  return v3;
}

@end