@interface TUIElementVScroll
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
@end

@implementation TUIElementVScroll

+ (id)supportedAttributes
{
  if (qword_2DF198 != -1) {
    dispatch_once(&qword_2DF198, &stru_251B28);
  }
  v2 = (void *)qword_2DF190;

  return v2;
}

+ (unint64_t)definesScopes
{
  return 63;
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
  id v11 = a3;
  [v10 floatForAttribute:9 node:var0];
  [v11 setAnchorOffset:];
  [v11 setAcceptsDrop:[v10 BOOLForAttribute:2 withDefault:0 node:var0]];
  v12 = [v10 stringForAttribute:65 node:var0];

  [v11 setDecelerationRate:TUIBoxDecelerationRateFromString(v12)];
  id v13 = [v9 modelIdentifierWithNode:var0];

  [v11 setModelIdentifierForScrollable:v13];
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v16 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 finalizeModelsWithParent:v16 box:v16 context:v8];
  if ([v16 acceptsDrop])
  {
    id v10 = [v7 finalizeTriggers];
    id v11 = [v10 behaviorDataForTrigger:@"drop"];

    if (v11)
    {
      v12 = [TUIElementActionTriggerHandler alloc];
      id v13 = [v8 actionObject];
      v14 = [v8 actionDelegate];
      v15 = [(TUIElementActionTriggerHandler *)v12 initWithActionsData:v10 actionObject:v13 actionDelegate:v14];
      [v16 setDropHandler:v15];
    }
  }
}

@end