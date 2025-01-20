@interface TUIElementComponentViewState
+ (BOOL)resolveAttributes;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementComponentViewState

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

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v11 = a6;
  unsigned int v8 = [a5 bindingNameForAttribute:137 node:a4.var0];
  uint64_t v9 = v8;
  if (TUINameIsValid(v8))
  {
    v10 = [v11 componentViewStateWithName:v9];
    [v11 defineComponentBindingWithName:v9 value:v10];
  }
}

@end