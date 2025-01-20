@interface TUIElementInstantiate
+ (BOOL)instantiateChildren;
+ (BOOL)resolveAttributes;
+ (id)containerAttributes;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementInstantiate

+ (id)containerAttributes
{
  if (qword_2DF240 != -1) {
    dispatch_once(&qword_2DF240, &stru_252370);
  }
  v2 = (void *)qword_2DF238;

  return v2;
}

+ (unint64_t)definesScopes
{
  return 63;
}

+ (id)requiredBuilderProtocol
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

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v13 = a3;
  id v9 = a5;
  id v10 = a6;
  unsigned int v11 = [v9 nameReferenceForAttribute:137 node:a4.var0];
  [v10 instantiateElementReference:v11 withChildrenOfNode:a4.var0];
}

@end