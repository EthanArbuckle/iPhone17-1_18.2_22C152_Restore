@interface TUIElementFocusItem
+ (Class)builderClass;
+ (Class)objectClass;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
@end

@implementation TUIElementFocusItem

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)builderClass
{
  return (Class)objc_opt_class();
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a5;
  id v9 = a3;
  [v9 setGrouped:[v8 BOOLForAttribute:93 node:var0]];
  id v10 = [v8 focusStyleForAttribute:88 node:var0];

  [v9 setFocusStyle:v10];
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v8 finalizeModelsWithParent:v9 box:v9 context:v7];
  v11 = [TUIElementActionTriggerHandler alloc];
  v12 = [v8 finalizeTriggers];
  v13 = [v7 actionObject];
  v14 = [v7 actionDelegate];

  v15 = [(TUIElementActionTriggerHandler *)v11 initWithActionsData:v12 actionObject:v13 actionDelegate:v14];
  [v9 setActionHandler:v15];

  id v16 = [v8 finalizeLinkEntities];

  [v9 setLinkEntities:v16];
}

@end