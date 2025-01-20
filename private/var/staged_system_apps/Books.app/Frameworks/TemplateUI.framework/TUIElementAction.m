@interface TUIElementAction
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5;
+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementAction

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIActionBuilding;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (Class)builderClass
{
  return (Class)objc_opt_class();
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a5;
  id v9 = a3;
  v10 = [v8 stringForAttribute:209 node:var0];
  [v9 setTrigger:v10];

  v11 = [v8 stringForAttribute:35 node:var0];
  [v9 setBehavior:v11];

  id v12 = [v8 stringForAttribute:164 node:var0];

  [v9 setRefId:v12];
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v21 = a3;
  id v6 = a4;
  uint64_t v7 = [v21 trigger];
  if (v7
    && (id v8 = (void *)v7,
        [v21 behavior],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    v10 = [TUIElementBehaviorArgumentsMap alloc];
    v11 = [v21 behavior];
    uint64_t v12 = [v21 arguments];
    v13 = (void *)v12;
    if (v12) {
      v14 = (void *)v12;
    }
    else {
      v14 = &__NSDictionary0__struct;
    }
    v15 = [(TUIElementBehaviorArgumentsMap *)v10 initWithBehavior:v11 arguments:v14];

    v16 = [v21 trigger];
    [v6 addTrigger:v16 withBehavior:v15];
  }
  else
  {
    uint64_t v17 = [v21 trigger];
    if (!v17) {
      goto LABEL_13;
    }
    v15 = (TUIElementBehaviorArgumentsMap *)v17;
    uint64_t v18 = [v21 refId];
    if (!v18) {
      goto LABEL_12;
    }
    v19 = (void *)v18;
    char v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) == 0) {
      goto LABEL_13;
    }
    v15 = [v21 trigger];
    v16 = [v21 refId];
    [v6 addTrigger:v15 withRefId:v16];
  }

LABEL_12:
LABEL_13:
}

@end