@interface TUIElementHScroll
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
@end

@implementation TUIElementHScroll

+ (unint64_t)definesScopes
{
  return 63;
}

+ (id)supportedAttributes
{
  if (qword_2DF210 != -1) {
    dispatch_once(&qword_2DF210, &stru_251D78);
  }
  v2 = (void *)qword_2DF208;

  return v2;
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
  id v15 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 finalizeModelsWithParent:v15 box:v15 context:v8];
  if ([v15 acceptsDrop])
  {
    id v10 = [v7 finalizeTriggers];
    id v11 = [v10 behaviorDataForTrigger:@"drop"];

    if (v11)
    {
      v12 = [TUIElementActionTriggerHandler alloc];
      id v13 = [v8 actionObject];
      v14 = [(TUIElementActionTriggerHandler *)v12 initWithActionsData:v10 actionObject:v13 actionDelegate:0];
      [v15 setDropHandler:v14];
    }
  }
}

@end