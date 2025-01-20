@interface WFAppInFocusTrigger(CoreDuetContext)
- (id)contextStorePredicate;
- (id)onBackgroundIgnoredLaunchReasons;
- (uint64_t)contextStoreKeyPathForCurrentState;
- (uint64_t)contextStoreQualityOfService;
- (uint64_t)shouldFireTriggerWithEventInfo:()CoreDuetContext error:;
- (void)onFocusIgnoredLaunchReasons;
@end

@implementation WFAppInFocusTrigger(CoreDuetContext)

- (uint64_t)contextStoreQualityOfService
{
  return 21;
}

- (uint64_t)shouldFireTriggerWithEventInfo:()CoreDuetContext error:
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"NewValue"];
  v6 = [v4 objectForKeyedSubscript:@"OldValue"];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__WFAppInFocusTrigger_CoreDuetContext__shouldFireTriggerWithEventInfo_error___block_invoke;
  aBlock[3] = &unk_1E65408E8;
  id v7 = v5;
  id v23 = v7;
  id v8 = v6;
  id v24 = v8;
  v25 = a1;
  v9 = (uint64_t (**)(void))_Block_copy(aBlock);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __77__WFAppInFocusTrigger_CoreDuetContext__shouldFireTriggerWithEventInfo_error___block_invoke_2;
  v18 = &unk_1E65408E8;
  id v19 = v8;
  id v20 = v7;
  v21 = a1;
  id v10 = v7;
  id v11 = v8;
  v12 = (uint64_t (**)(void))_Block_copy(&v15);
  if objc_msgSend(a1, "onFocus", v15, v16, v17, v18) && (v9[2](v9))
  {
    uint64_t v13 = 1;
  }
  else if ([a1 onBackground])
  {
    uint64_t v13 = v12[2](v12);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)onFocusIgnoredLaunchReasons
{
  return &unk_1F22707C0;
}

- (id)onBackgroundIgnoredLaunchReasons
{
  v0 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", @"com.apple.SpringBoard.backlight.transitionReason.lockButton", @"com.apple.SpringBoard.backlight.transitionReason.idleTimer", 0);
  v1 = [MEMORY[0x1E4FB46B8] currentDevice];
  char v2 = [v1 hasCapability:*MEMORY[0x1E4FB4C80]];

  if ((v2 & 1) == 0) {
    [v0 addObject:&stru_1F225E938];
  }
  return v0;
}

- (id)contextStorePredicate
{
  v34[2] = *MEMORY[0x1E4F143B8];
  char v2 = [a1 selectedBundleIdentifiers];
  uint64_t v3 = [a1 contextStoreKeyPathForCurrentState];
  v32 = (void *)MEMORY[0x1E4F5B6E8];
  id v4 = (void *)MEMORY[0x1E4F28F60];
  v29 = [MEMORY[0x1E4F5B6B8] appBundleIdKey];
  v5 = [MEMORY[0x1E4F5B6B8] appLaunchReasonKey];
  v6 = [a1 onFocusIgnoredLaunchReasons];
  id v7 = [v4 predicateWithFormat:@"SELF.%@.value.%K IN %@ AND NOT (SELF.%@.value.%K IN %@)", v3, v29, v2, v3, v5, v6];
  id v8 = (void *)MEMORY[0x1E4F28F60];
  v9 = [MEMORY[0x1E4F5B6B8] appBundleIdKey];
  id v10 = [MEMORY[0x1E4F5B6B8] appBundleIdKey];
  id v11 = [v8 predicateWithFormat:@"NOT (SELF.value.%K IN %@) AND NOT (SELF.value.%K IN %@)", v9, v2, v10, v2];
  v33 = [v32 predicateForKeyPath:v3 withPredicate:v7 withPredicateForPreviousState:v11 withMinimumDurationInPreviousState:0.0];

  v30 = (void *)MEMORY[0x1E4F5B6E8];
  v12 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v13 = [MEMORY[0x1E4F5B6B8] appBundleIdKey];
  v14 = [MEMORY[0x1E4F5B6B8] appLaunchReasonKey];
  uint64_t v15 = [a1 onBackgroundIgnoredLaunchReasons];
  uint64_t v16 = [v12 predicateWithFormat:@"NOT (SELF.%@.value.%K IN %@) AND NOT (SELF.%@.value.%K IN %@)", v3, v13, v2, v3, v14, v15];
  v17 = (void *)MEMORY[0x1E4F28F60];
  v18 = [MEMORY[0x1E4F5B6B8] appBundleIdKey];
  id v19 = [MEMORY[0x1E4F5B6B8] appBundleIdKey];
  id v20 = [v17 predicateWithFormat:@"SELF.value.%K IN %@ AND SELF.value.%K IN %@", v18, v2, v19, v2];
  v21 = v30;
  v31 = (void *)v3;
  v22 = [v21 predicateForKeyPath:v3 withPredicate:v16 withPredicateForPreviousState:v20 withMinimumDurationInPreviousState:0.0];

  if ([a1 onFocus] && objc_msgSend(a1, "onBackground"))
  {
    id v23 = (void *)MEMORY[0x1E4F5B6E8];
    id v24 = v33;
    v34[0] = v33;
    v34[1] = v22;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    v26 = [v23 orPredicateWithSubpredicates:v25];

    goto LABEL_10;
  }
  if ([a1 onFocus])
  {
    id v24 = v33;
    id v27 = v33;
LABEL_8:
    v26 = v27;
    goto LABEL_10;
  }
  id v24 = v33;
  if ([a1 onBackground])
  {
    id v27 = v22;
    goto LABEL_8;
  }
  v26 = 0;
LABEL_10:

  return v26;
}

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return [MEMORY[0x1E4F5B6B8] keyPathForAppDataDictionary];
}

@end