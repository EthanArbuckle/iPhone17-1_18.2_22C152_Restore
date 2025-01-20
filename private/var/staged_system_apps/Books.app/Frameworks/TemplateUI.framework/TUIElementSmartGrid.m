@interface TUIElementSmartGrid
+ (Class)builderClass;
+ (Class)objectClass;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
@end

@implementation TUIElementSmartGrid

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (Class)builderClass
{
  return (Class)objc_opt_class();
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v9 = a6;
  id v10 = a5;
  id v27 = a3;
  v11 = [v9 modelIdentifierByAppendingString:@"scrollable" node:var0];
  [v27 setModelIdentifierForScrollable:v11];

  [v27 setAcceptsDrop:[v10 BOOLForAttribute:2 withDefault:0 node:var0]];
  v12 = [v10 stringForAttribute:65 node:var0];
  [v27 setDecelerationRate:TUIBoxDecelerationRateFromString(v12)];

  [v10 insetsForAttribute:112 node:var0];
  [v27 setInsets:];
  v13 = [v10 objectForAttribute:52 node:var0];
  [v27 setColumns:v13];

  [v27 setMaxColumns:[v10 unsignedIntegerForAttribute:128 withDefault:0x7FFFFFFFFFFFFFFFLL node:var0]];
  id v14 = [v10 lengthForAttribute:56 node:var0];
  [v27 setColumnWidth:v14, v15];
  id v16 = [v10 lengthForAttribute:54 node:var0];
  [v27 setColumnSpacing:v16, v17];
  [v27 setColumnMultiple:[v10 unsignedIntegerForAttribute:53 withDefault:1 node:var0]];
  v18 = [v10 stringForAttribute:120 node:var0];
  [v27 setLayoutMode:[TUISmartGridBox layoutModeFromString:v18]];

  if ([v27 layoutMode]) {
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v19 = 1;
  }
  [v27 setRows:[v10 unsignedIntegerForAttribute:177 withDefault:v19 node:var0]];
  id v20 = [v10 lengthForAttribute:178 node:var0];
  [v27 setRowSpacing:v20, v21];
  v22 = [v9 environment];

  BOOL v23 = [v22 deviceClass] == (char *)&dword_4 + 2;
  [v27 setPaginated:[v10 BOOLForAttribute:148 withDefault:v23 node:var0]];
  [v27 setMaxPages:[v10 unsignedIntegerForAttribute:130 withDefault:0x7FFFFFFFFFFFFFFFLL node:var0]];
  v24 = [v10 stringForAttribute:220 node:var0];
  [v27 setVerticalPlacement:[TUISmartGridBox verticalPlacementFromString:v24]];

  v25 = [v10 snapForAttribute:224 node:var0];
  [v27 setWidthSnap:v25];

  [v10 insetsForAttribute:91 node:var0];
  [v27 setGradientInsets:];
  [v10 insetsForAttribute:92 withDefault:var0 node:1.0, 1.0, 1.0, 1.0];
  [v27 setGradientFraction:];
  [v27 setBalanceSections:[v10 BOOLForAttribute:31 node:var0]];
  id v26 = [v10 BOOLForAttribute:211 node:var0];

  [v27 setTruncate:v26];
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v17 = a3;
  id v7 = a4;
  id v8 = a5;
  if ([v17 acceptsDrop])
  {
    id v9 = [v7 finalizeTriggers];
    id v10 = [v9 behaviorDataForTrigger:@"drop"];

    if (v10)
    {
      v11 = [TUIElementActionTriggerHandler alloc];
      v12 = [v8 actionObject];
      v13 = [v8 actionDelegate];
      id v14 = [(TUIElementActionTriggerHandler *)v11 initWithActionsData:v9 actionObject:v12 actionDelegate:v13];
      [v17 setDropHandler:v14];
    }
  }
  uint64_t v15 = [v7 finalizeContentsWithContext:v8];
  [v17 updateWithContents:v15];

  id v16 = [v7 configuration];
  [v17 setConfiguration:v16];
}

@end