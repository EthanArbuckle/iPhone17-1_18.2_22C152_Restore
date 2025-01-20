@interface TUIElementComponentBind
+ (BOOL)instantiateChildren;
+ (id)attributesToIgnoreWhenResolving;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementComponentBind

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2DF588 != -1) {
    dispatch_once(&qword_2DF588, &stru_254900);
  }
  v2 = (void *)qword_2DF580;

  return v2;
}

+ (unint64_t)definesScopes
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
  id v8 = a6;
  id v9 = a5;
  unsigned int v10 = [v9 bindingNameForAttribute:137 node:var0];
  id v11 = [v9 objectForAttribute:215 node:var0];

  [v8 defineComponentBindingWithName:v10 value:v11];
}

@end