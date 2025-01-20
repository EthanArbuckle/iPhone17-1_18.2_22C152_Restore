@interface TUIElementShelf
+ (BOOL)supportOnlyImmediateChildrenForContainedBuilding;
+ (Class)builderClass;
+ (Class)objectClass;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
@end

@implementation TUIElementShelf

+ (unint64_t)definesScopes
{
  return 0;
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

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v10 = a3;
  id v8 = [a5 lengthForAttribute:58 node:var0];
  [v10 setContentWidth:v8, v9];
}

@end