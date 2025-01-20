@interface TUIElementDefine
+ (BOOL)instantiateChildren;
+ (BOOL)resolveAttributes;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementDefine

+ (unint64_t)definesScopes
{
  return 0;
}

+ (BOOL)resolveAttributes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return 0;
}

+ (BOOL)instantiateChildren
{
  return 0;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v10 = a6;
  id v8 = a5;
  id v9 = [v8 elementDefinitionWithNameAttribute:137 node:var0];
  LODWORD(var0) = [v8 closureForNode:var0];

  [v10 defineElement:v9 closure:var0];
}

@end