@interface TUIElementYield
+ (BOOL)instantiateChildren;
+ (BOOL)resolveAttributes;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementYield

+ (unint64_t)definesScopes
{
  return 0;
}

+ (BOOL)resolveAttributes
{
  return 0;
}

+ (BOOL)instantiateChildren
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return 0;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v13 = a3;
  id v9 = a5;
  id v10 = a6;
  unsigned int v11 = [v9 elementReferenceForAttribute:149 node:a4.var0];
  [v10 instantiateNamedElementReference:v11];
}

@end