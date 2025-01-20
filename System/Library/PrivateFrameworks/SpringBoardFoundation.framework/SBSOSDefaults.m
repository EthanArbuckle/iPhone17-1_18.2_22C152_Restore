@interface SBSOSDefaults
- (BOOL)clawCanTriggerSOS;
- (BOOL)isAutomaticCallCountdownEnabled;
- (int64_t)lockButtonSOSTriggerCount;
- (void)_bindAndRegisterDefaults;
- (void)lockButtonSOSTriggerCount;
@end

@implementation SBSOSDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"disablesForAccessibility"];
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBDisablesSOSForAccessibility" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  id v5 = [NSString stringWithUTF8String:"performedCheckForTripleClickSOSMigrationAlert"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBPerformedCheckForTripleClickSOSMigrationAlert" toDefaultValue:v4 options:1];
}

- (int64_t)lockButtonSOSTriggerCount
{
  unint64_t v2 = [getSOSUtilitiesClass() SOSTriggerClickCount];
  if (v2 > 5 || ((1 << v2) & 0x29) == 0)
  {
    uint64_t v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(SBSOSDefaults *)v2 lockButtonSOSTriggerCount];
    }

    return -1;
  }
  return v2;
}

- (BOOL)clawCanTriggerSOS
{
  id SOSUtilitiesClass = getSOSUtilitiesClass();
  return [SOSUtilitiesClass canTriggerSOSWithVolumeLockHold];
}

- (BOOL)isAutomaticCallCountdownEnabled
{
  id SOSUtilitiesClass = getSOSUtilitiesClass();
  return [SOSUtilitiesClass isAutomaticCallCountdownEnabled];
}

- (void)lockButtonSOSTriggerCount
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18B52E000, a2, OS_LOG_TYPE_ERROR, "SBSOSDefaults - Unsupported Lock Button Trigger Click Count: %d.", (uint8_t *)v2, 8u);
}

@end