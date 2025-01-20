@interface TUIElementComponentDynamicState
+ (BOOL)instantiateChildren;
+ (id)attributesToIgnoreWhenResolving;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementComponentDynamicState

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2DF598 != -1) {
    dispatch_once(&qword_2DF598, &stru_254920);
  }
  v2 = (void *)qword_2DF590;

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
  id v14 = [v9 stringForAttribute:116 node:var0];
  v11 = [v9 objectForAttribute:113 node:var0];
  v12 = [v9 objectForAttribute:150 node:var0];

  v13 = [v8 dynamicStateForKind:v14 instance:v11 parameters:v12];
  [v8 defineComponentBindingWithName:v10 value:v13];
}

@end