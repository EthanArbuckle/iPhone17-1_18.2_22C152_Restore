@interface TUIElementSmartGridSection
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

@implementation TUIElementSmartGridSection

+ (unint64_t)definesScopes
{
  return 0;
}

+ (BOOL)shouldAutoEnumerateNode
{
  return 1;
}

+ (BOOL)allowEmptyEnumerator
{
  return 1;
}

+ (BOOL)supportOnlyImmediateChildrenForContainedBuilding
{
  return 1;
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
  return &OBJC_PROTOCOL____TUIElementSmartGridSectionConsuming;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a5;
  id v10 = a3;
  [v10 setColumns:[v8 unsignedIntegerForAttribute:52 withDefault:0x7FFFFFFFFFFFFFFFLL node:var0]];
  id v9 = [v8 unsignedIntegerForAttribute:177 withDefault:0x7FFFFFFFFFFFFFFFLL node:var0];

  [v10 setRows:v9];
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
}

@end