@interface SBTopAffordanceMenuInteractionMetric
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
@end

@implementation SBTopAffordanceMenuInteractionMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  if (a3 == 52)
  {
    id v5 = a4;
    v6 = [v5 eventPayload];
    v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA76B8]];
    v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA76C0]];
    uint64_t v9 = [v8 integerValue];

    char v10 = [(id)SBApp isHardwareKeyboardAttached];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__SBTopAffordanceMenuInteractionMetric_handleEvent_withContext___block_invoke;
    v13[3] = &unk_1E6B08998;
    id v14 = v7;
    uint64_t v15 = v9;
    char v16 = v10;
    id v11 = v7;
    [v5 stateForQueryName:5 completion:v13];
  }
  return a3 == 52;
}

void __64__SBTopAffordanceMenuInteractionMetric_handleEvent_withContext___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FA7490]];
  [v3 BOOLValue];

  id v4 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();
}

id __64__SBTopAffordanceMenuInteractionMetric_handleEvent_withContext___block_invoke_2(uint64_t a1)
{
  v9[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  v9[0] = *(void *)(a1 + 32);
  v8[0] = @"BundleID";
  v8[1] = @"Result";
  if ((unint64_t)(v2 - 1) > 0x12) {
    v3 = @"Unknown";
  }
  else {
    v3 = off_1E6B089B8[v2 - 1];
  }
  v9[1] = v3;
  v8[2] = @"IsDoNotDisturbActive";
  id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v9[2] = v4;
  v8[3] = @"IsHardwareKeyboardAttached";
  id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 49)];
  v9[3] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

@end