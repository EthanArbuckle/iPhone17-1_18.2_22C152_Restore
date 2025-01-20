@interface SBMedusaWindowDragMetric
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
@end

@implementation SBMedusaWindowDragMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (a3 == 51)
  {
    v7 = [v5 eventPayload];
    v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FA76C8]];
    v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FA76D0]];
    uint64_t v10 = [v9 unsignedIntegerValue];

    v11 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FA76D8]];
    uint64_t v12 = [v11 integerValue];

    char v13 = [(id)SBApp isHardwareKeyboardAttached];
    if (v12 == 2)
    {
      v14 = @"PeekPrimary";
    }
    else if (v12 == 3)
    {
      v14 = @"PeekSide";
    }
    else
    {
      SBStringForWindowDragGestureDestination(v10);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __52__SBMedusaWindowDragMetric_handleEvent_withContext___block_invoke;
    v18[3] = &unk_1E6B00C68;
    id v19 = v8;
    v20 = v14;
    char v21 = v13;
    v15 = v14;
    id v16 = v8;
    [v6 stateForQueryName:5 completion:v18];
  }
  return a3 == 51;
}

void __52__SBMedusaWindowDragMetric_handleEvent_withContext___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FA7490]];
  [v3 BOOLValue];

  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  AnalyticsSendEventLazy();
}

id __52__SBMedusaWindowDragMetric_handleEvent_withContext___block_invoke_2(uint64_t a1)
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v7[0] = @"BundleID";
  v7[1] = @"Result";
  uint64_t v2 = *(void *)(a1 + 40);
  v8[0] = *(void *)(a1 + 32);
  v8[1] = v2;
  v7[2] = @"IsDoNotDisturbActive";
  v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v8[2] = v3;
  v7[3] = @"IsHardwareKeyboardAttached";
  id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 49)];
  v8[3] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];

  return v5;
}

@end