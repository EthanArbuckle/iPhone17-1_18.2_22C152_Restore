@interface TUIElementTemplate
+ (Class)builderClass;
+ (Class)objectClass;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 builder:(id)a5 context:(id)a6 block:(id)a7;
@end

@implementation TUIElementTemplate

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (Class)builderClass
{
  return (Class)objc_opt_class();
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v7 = a3;
  id v8 = [a6 entry];
  [v7 setEntry:v8];
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v5 = [a4 finalizeModelsWithParent:a3 box:a3 context:a5];
}

+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 builder:(id)a5 context:(id)a6 block:(id)a7
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v13 = [v11 entry];
  id v12 = [v9 updateWithEntry:v13 withBuilder:v10 environmentContainer:v11];

  [v11 setDirectEnvironmentUseMask:v12];
}

@end