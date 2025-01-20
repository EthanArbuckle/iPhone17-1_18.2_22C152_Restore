@interface TUIElementMenuItem
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5;
@end

@implementation TUIElementMenuItem

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

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIMenuItemBuilding;
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v7 = a5;
  v8 = objc_alloc_init(_TUIElementMenuItemBuilder);
  -[_TUIElementMenuItemBuilder setIsEnabled:](v8, "setIsEnabled:", [v7 BOOLForAttribute:74 withDefault:1 node:a3.var0]);
  id v9 = [v7 BOOLForAttribute:145 node:a3.var0];

  [(_TUIElementMenuItemBuilder *)v8 setIsOn:v9];
  return v8;
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v6 = a4;
  id v7 = [a3 finalizeMenuItem];
  [v6 addModel:v7];
}

@end