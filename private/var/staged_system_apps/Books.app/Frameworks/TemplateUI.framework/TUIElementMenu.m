@interface TUIElementMenu
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5;
@end

@implementation TUIElementMenu

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
  return &OBJC_PROTOCOL___TUIMenuConsuming;
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v7 = a5;
  v8 = objc_alloc_init(_TUIElementMenuBuilder);
  v9 = [v7 stringForAttribute:204 node:a3.var0];
  [(_TUIElementMenuBuilder *)v8 setTitle:v9];

  id v10 = [v7 BOOLForAttribute:107 node:a3.var0];
  [(_TUIElementMenuBuilder *)v8 setIsInline:v10];
  return v8;
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v6 = a4;
  id v7 = [a3 finalizeMenuItem];
  [v6 addMenuContainer:v7];
}

@end