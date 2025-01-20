@interface TUIElementActionData
+ (Class)objectClass;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5;
+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementActionData

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIActionDataBuilding;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a5;
  id v9 = a3;
  v10 = [v8 stringForAttribute:137 node:var0];
  [v9 setKey:v10];

  id v11 = [v8 objectForAttribute:215 node:var0];

  [v9 setValue:v11];
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v10 = a3;
  id v6 = a4;
  v7 = [v10 key];

  if (v7)
  {
    id v8 = [v10 value];
    id v9 = [v10 key];
    [v6 setActionData:v8 forKey:v9];
  }
}

@end