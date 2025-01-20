@interface TUIElementViewState
+ (BOOL)resolveAttributes;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementViewState

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
  unsigned int v8 = [a5 bindingNameForAttribute:36 node:a4.var0];
  uint64_t v9 = v8;
  if (TUINameIsValid(v8))
  {
    v10 = [v11 viewStateForNode:a4.var0 binding:v9];
    [v11 defineBindingWithName:v9 value:v10];
  }
}

@end