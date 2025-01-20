@interface WFAppInFocusTrigger
@end

@implementation WFAppInFocusTrigger

uint64_t __77__WFAppInFocusTrigger_CoreDuetContext__shouldFireTriggerWithEventInfo_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x1E4F5B6B8] appBundleIdKey];
  v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    v6 = [MEMORY[0x1E4F5B6B8] appBundleIdKey];
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];
    v8 = (void *)v7;
    v9 = &stru_1F225E938;
    if (v7) {
      v9 = (__CFString *)v7;
    }
    v10 = v9;

    v11 = *(void **)(a1 + 40);
    v12 = [MEMORY[0x1E4F5B6B8] appLaunchReasonKey];
    v13 = [v11 objectForKeyedSubscript:v12];
    v14 = v13;
    if (v13 == @"SBFullScreenSwitcherSceneLiveContentOverlay"
      || v13
      && (int v15 = [(__CFString *)v13 isEqualToString:@"SBFullScreenSwitcherSceneLiveContentOverlay"], v14, v15))
    {
      v16 = v10;
      if (v16 == @"com.apple.CoreAuthUI")
      {
        uint64_t v19 = 0;
        goto LABEL_16;
      }
      v17 = v16;
      char v18 = [(__CFString *)v16 isEqualToString:@"com.apple.CoreAuthUI"];

      if (v18)
      {
        uint64_t v19 = 0;
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
    }
    v12 = [*(id *)(a1 + 48) selectedBundleIdentifiers];
    if (![v12 containsObject:v4])
    {
      uint64_t v19 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v14 = [*(id *)(a1 + 48) selectedBundleIdentifiers];
    uint64_t v19 = [v14 containsObject:v10] ^ 1;
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v19 = 0;
LABEL_19:

  return v19;
}

uint64_t __77__WFAppInFocusTrigger_CoreDuetContext__shouldFireTriggerWithEventInfo_error___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x1E4F5B6B8] appBundleIdKey];
  v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    v6 = [MEMORY[0x1E4F5B6B8] appBundleIdKey];
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];
    v8 = (void *)v7;
    v9 = &stru_1F225E938;
    if (v7) {
      v9 = (__CFString *)v7;
    }
    v10 = v9;

    v11 = *(void **)(a1 + 40);
    v12 = [MEMORY[0x1E4F5B6B8] appLaunchReasonKey];
    v13 = [v11 objectForKeyedSubscript:v12];
    v14 = v13;
    if (v13 == @"SBFullScreenSwitcherSceneLiveContentOverlay"
      || v13
      && (int v15 = [(__CFString *)v13 isEqualToString:@"SBFullScreenSwitcherSceneLiveContentOverlay"], v14, v15))
    {
      v16 = v10;
      if (v16 == @"com.apple.CoreAuthUI")
      {
        uint64_t v19 = 0;
        goto LABEL_16;
      }
      v17 = v16;
      char v18 = [(__CFString *)v16 isEqualToString:@"com.apple.CoreAuthUI"];

      if (v18)
      {
        uint64_t v19 = 0;
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
    }
    v12 = [*(id *)(a1 + 48) selectedBundleIdentifiers];
    if (![v12 containsObject:v4])
    {
      uint64_t v19 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v14 = [*(id *)(a1 + 48) selectedBundleIdentifiers];
    uint64_t v19 = [v14 containsObject:v10] ^ 1;
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v19 = 0;
LABEL_19:

  return v19;
}

@end