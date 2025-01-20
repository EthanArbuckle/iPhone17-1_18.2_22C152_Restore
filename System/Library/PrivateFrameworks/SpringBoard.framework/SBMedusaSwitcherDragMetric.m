@interface SBMedusaSwitcherDragMetric
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
@end

@implementation SBMedusaSwitcherDragMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  if (a3 == 50)
  {
    id v5 = a4;
    v6 = [v5 eventPayload];
    v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA7678]];
    v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA7680]];
    v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA7688]];
    uint64_t v10 = [v9 unsignedIntegerValue];

    v11 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA7670]];
    uint64_t v12 = [v11 unsignedIntegerValue];

    char v13 = [(id)SBApp isHardwareKeyboardAttached];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54__SBMedusaSwitcherDragMetric_handleEvent_withContext___block_invoke;
    v17[3] = &unk_1E6B07278;
    id v18 = v7;
    id v19 = v8;
    uint64_t v20 = v10;
    uint64_t v21 = v12;
    char v22 = v13;
    id v14 = v8;
    id v15 = v7;
    [v5 stateForQueryName:5 completion:v17];
  }
  return a3 == 50;
}

void __54__SBMedusaSwitcherDragMetric_handleEvent_withContext___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FA7490]];
  [v3 BOOLValue];

  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  AnalyticsSendEventLazy();
}

id __54__SBMedusaSwitcherDragMetric_handleEvent_withContext___block_invoke_2(uint64_t a1)
{
  v12[6] = *MEMORY[0x1E4F143B8];
  v11[0] = @"DraggingBundleID";
  v11[1] = @"IntersectingBundleID";
  v2 = *(__CFString **)(a1 + 40);
  if (!v2) {
    v2 = @"none";
  }
  v12[0] = *(void *)(a1 + 32);
  v12[1] = v2;
  v11[2] = @"DropRegion";
  unint64_t v3 = *(void *)(a1 + 48) - 1;
  if (v3 > 6) {
    id v4 = @"None";
  }
  else {
    id v4 = off_1E6B07298[v3];
  }
  v12[2] = v4;
  v11[3] = @"DropAction";
  unint64_t v5 = *(void *)(a1 + 56) - 1;
  if (v5 > 8) {
    v6 = @"None";
  }
  else {
    v6 = off_1E6B072D0[v5];
  }
  v12[3] = v6;
  v11[4] = @"IsDoNotDisturbActive";
  v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  v12[4] = v7;
  v11[5] = @"IsHardwareKeyboardAttached";
  v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 65)];
  v12[5] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:6];

  return v9;
}

@end