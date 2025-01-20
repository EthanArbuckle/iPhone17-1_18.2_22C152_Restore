@interface SBSystemApertureTelemetryEmitter
+ (id)stringBySanitizingNil:(id)a3;
+ (void)_emitCoreAnalyticsTelemetryIfNecessaryWithUpdatedContext:(id)a3 previousContext:(id)a4;
+ (void)_emitPowerLogIfNecessaryWithUpdatedContext:(id)a3 previousContext:(id)a4;
+ (void)logTelemetryForInteractionLongPress:(BOOL)a3 clientIdentifier:(id)a4 elementIdentifier:(id)a5;
+ (void)logTelemetryForInteractionPanGesture:(int64_t)a3 handled:(BOOL)a4 clientIdentifier:(id)a5 elementIdentifier:(id)a6;
+ (void)logTelemetryForInteractionTap:(BOOL)a3 clientIdentifier:(id)a4 elementIdentifier:(id)a5;
+ (void)logTelemetryForUpdatedContext:(id)a3;
@end

@implementation SBSystemApertureTelemetryEmitter

+ (void)logTelemetryForUpdatedContext:(id)a3
{
  id v4 = a3;
  [a1 _emitPowerLogIfNecessaryWithUpdatedContext:v4 previousContext:logTelemetryForUpdatedContext____previousContext];
  [a1 _emitCoreAnalyticsTelemetryIfNecessaryWithUpdatedContext:v4 previousContext:logTelemetryForUpdatedContext____previousContext];
  v5 = (void *)logTelemetryForUpdatedContext____previousContext;
  logTelemetryForUpdatedContext____previousContext = (uint64_t)v4;
}

+ (void)_emitCoreAnalyticsTelemetryIfNecessaryWithUpdatedContext:(id)a3 previousContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((BSEqualObjects() & 1) == 0)
  {
    v7 = [v5 elementContexts];
    uint64_t v8 = [v7 count];
    if (v8)
    {
      uint64_t v9 = v8;
      v10 = [v7 objectAtIndexedSubscript:0];
      if (v9 == 1)
      {
        v11 = 0;
      }
      else
      {
        v11 = [v7 objectAtIndexedSubscript:1];
      }
    }
    else
    {
      v11 = 0;
      v10 = 0;
    }
    v12 = [v6 elementContexts];
    uint64_t v13 = [v12 count];
    if (v13)
    {
      uint64_t v14 = v13;
      v15 = [v12 objectAtIndexedSubscript:0];
      if (v14 == 1)
      {
        v16 = 0;
      }
      else
      {
        v16 = [v12 objectAtIndexedSubscript:1];
      }
    }
    else
    {
      v16 = 0;
      v15 = 0;
    }
    if (!_SBElementContextsMatchIdentityAndLayoutState(v10, v15)
      || !_SBElementContextsMatchIdentityAndLayoutState(v11, v16))
    {
      id v17 = v10;
      id v18 = v15;
      id v19 = v11;
      id v20 = v16;
      AnalyticsSendEventLazy();
    }
  }
}

+ (void)_emitPowerLogIfNecessaryWithUpdatedContext:(id)a3 previousContext:(id)a4
{
  id v28 = a3;
  id v5 = a4;
  if ((BSEqualObjects() & 1) == 0)
  {
    id v6 = [v28 elementContexts];
    uint64_t v7 = [v6 count];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = [v6 objectAtIndexedSubscript:0];
      if (v8 == 1)
      {
        v10 = 0;
      }
      else
      {
        v10 = [v6 objectAtIndexedSubscript:1];
      }
    }
    else
    {
      v10 = 0;
      uint64_t v9 = 0;
    }
    v11 = [v5 elementContexts];
    uint64_t v12 = [v11 count];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = [v11 objectAtIndexedSubscript:0];
      if (v13 == 1)
      {
        v15 = 0;
      }
      else
      {
        v15 = [v11 objectAtIndexedSubscript:1];
      }
    }
    else
    {
      v15 = 0;
      uint64_t v14 = 0;
    }
    if (!_SBElementContextsMatchIdentityAndLayoutState(v9, v14)
      || !_SBElementContextsMatchIdentityAndLayoutState(v10, v15))
    {
      v16 = [v9 clientIdentifier];
      id v17 = [v9 elementIdentifier];
      uint64_t v18 = [v9 layoutMode];
      [v10 clientIdentifier];
      v26 = v9;
      id v27 = v5;
      id v19 = v11;
      id v20 = v14;
      v22 = v21 = v6;
      [v10 elementIdentifier];
      v23 = v15;
      v25 = v24 = v10;
      SBSystemAperturePowerLogEvent(v16, v17, v18, v22, v25);

      v10 = v24;
      v15 = v23;

      id v6 = v21;
      uint64_t v14 = v20;
      v11 = v19;
      uint64_t v9 = v26;
      id v5 = v27;
    }
  }
}

id __109__SBSystemApertureTelemetryEmitter__emitCoreAnalyticsTelemetryIfNecessaryWithUpdatedContext_previousContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) layoutMode];
  uint64_t v3 = [*(id *)(a1 + 40) layoutMode];
  BOOL v4 = [*(id *)(a1 + 48) layoutMode] < 1;
  uint64_t v5 = [*(id *)(a1 + 56) layoutMode];
  int v6 = v5 > 0 || v4;
  BOOL v7 = v5 > 0 && v4;
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v9 = *(void **)(a1 + 64);
  v10 = [*(id *)(a1 + 32) clientIdentifier];
  v11 = [v9 stringBySanitizingNil:v10];
  [v8 setObject:v11 forKeyedSubscript:@"ClientID"];

  uint64_t v12 = *(void **)(a1 + 64);
  uint64_t v13 = [*(id *)(a1 + 32) elementIdentifier];
  uint64_t v14 = [v12 stringBySanitizingNil:v13];
  [v8 setObject:v14 forKeyedSubscript:@"ElementID"];

  v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "layoutMode"));
  [v8 setObject:v15 forKeyedSubscript:@"LayoutMode"];

  v16 = *(void **)(a1 + 64);
  id v17 = [*(id *)(a1 + 48) clientIdentifier];
  uint64_t v18 = [v16 stringBySanitizingNil:v17];
  [v8 setObject:v18 forKeyedSubscript:@"SecondaryClientID"];

  id v19 = *(void **)(a1 + 64);
  id v20 = [*(id *)(a1 + 48) elementIdentifier];
  v21 = [v19 stringBySanitizingNil:v20];
  [v8 setObject:v21 forKeyedSubscript:@"SecondaryElementID"];

  v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "layoutMode"));
  [v8 setObject:v22 forKeyedSubscript:@"SecondaryLayoutMode"];

  if (v2 < 1 || v3 >= 1)
  {
    if (v2 > 0 || v3 <= 0)
    {
      v24 = @"none";
      if (v7) {
        v24 = @"SecondarySessionEnded";
      }
      if (v6) {
        v23 = v24;
      }
      else {
        v23 = @"SecondarySessionBegan";
      }
    }
    else
    {
      v23 = @"SessionEnded";
    }
  }
  else
  {
    v23 = @"SessionBegan";
  }
  [v8 setObject:v23 forKeyedSubscript:@"Subevent"];
  return v8;
}

+ (void)logTelemetryForInteractionTap:(BOOL)a3 clientIdentifier:(id)a4 elementIdentifier:(id)a5
{
  id v6 = a4;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  AnalyticsSendEventLazy();
}

id __101__SBSystemApertureTelemetryEmitter_logTelemetryForInteractionTap_clientIdentifier_elementIdentifier___block_invoke(uint64_t a1)
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v7[0] = @"ClientID";
  uint64_t v2 = [*(id *)(a1 + 48) stringBySanitizingNil:*(void *)(a1 + 32)];
  v8[0] = v2;
  v7[1] = @"ElementID";
  uint64_t v3 = [*(id *)(a1 + 48) stringBySanitizingNil:*(void *)(a1 + 40)];
  v8[1] = v3;
  v7[2] = @"Handled";
  BOOL v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v7[3] = @"InteractionType";
  v8[2] = v4;
  v8[3] = @"tap";
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];

  return v5;
}

+ (void)logTelemetryForInteractionLongPress:(BOOL)a3 clientIdentifier:(id)a4 elementIdentifier:(id)a5
{
  id v6 = a4;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  AnalyticsSendEventLazy();
}

id __107__SBSystemApertureTelemetryEmitter_logTelemetryForInteractionLongPress_clientIdentifier_elementIdentifier___block_invoke(uint64_t a1)
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v7[0] = @"ClientID";
  uint64_t v2 = [*(id *)(a1 + 48) stringBySanitizingNil:*(void *)(a1 + 32)];
  v8[0] = v2;
  v7[1] = @"ElementID";
  uint64_t v3 = [*(id *)(a1 + 48) stringBySanitizingNil:*(void *)(a1 + 40)];
  v8[1] = v3;
  v7[2] = @"Handled";
  BOOL v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v7[3] = @"InteractionType";
  v8[2] = v4;
  v8[3] = @"longPress";
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];

  return v5;
}

+ (void)logTelemetryForInteractionPanGesture:(int64_t)a3 handled:(BOOL)a4 clientIdentifier:(id)a5 elementIdentifier:(id)a6
{
  id v7 = a5;
  id v10 = a6;
  id v8 = v10;
  id v9 = v7;
  AnalyticsSendEventLazy();
}

id __116__SBSystemApertureTelemetryEmitter_logTelemetryForInteractionPanGesture_handled_clientIdentifier_elementIdentifier___block_invoke(uint64_t a1)
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"ClientID";
  uint64_t v2 = [*(id *)(a1 + 48) stringBySanitizingNil:*(void *)(a1 + 32)];
  v9[0] = v2;
  v8[1] = @"ElementID";
  uint64_t v3 = [*(id *)(a1 + 48) stringBySanitizingNil:*(void *)(a1 + 40)];
  v9[1] = v3;
  v8[2] = @"LayoutMode";
  BOOL v4 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  v9[2] = v4;
  v8[3] = @"Handled";
  uint64_t v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  v8[4] = @"InteractionType";
  v9[3] = v5;
  v9[4] = @"pan";
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];

  return v6;
}

+ (id)stringBySanitizingNil:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3) {
    uint64_t v5 = (__CFString *)v3;
  }
  else {
    uint64_t v5 = @"none";
  }

  return v5;
}

@end