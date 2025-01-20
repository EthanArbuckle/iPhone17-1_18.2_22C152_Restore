@interface TUIElementSmartGridContent
+ (BOOL)allowEmptyEnumerator;
+ (BOOL)shouldAutoEnumerateNode;
+ (BOOL)supportOnlyImmediateChildrenForContainedBuilding;
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementSmartGridContent

+ (unint64_t)definesScopes
{
  return 0;
}

+ (BOOL)supportOnlyImmediateChildrenForContainedBuilding
{
  return 1;
}

+ (BOOL)shouldAutoEnumerateNode
{
  return 1;
}

+ (BOOL)allowEmptyEnumerator
{
  return 1;
}

+ (Class)builderClass
{
  return (Class)objc_opt_class();
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL____TUIElementSmartGridCellConsuming;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a3;
  id v9 = [a6 identifierWithNode:var0];
  [v8 setIdentifier:v9];
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  [v8 configureCell:v9];
  [v8 finalizeModelsWithParent:v9 context:v7];
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
}

@end