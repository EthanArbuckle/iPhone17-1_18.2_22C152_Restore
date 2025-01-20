@interface TUIElementConfiguration
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
@end

@implementation TUIElementConfiguration

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIConfigurationConsuming;
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
  id v6 = a3;
  id v7 = [a4 finalizeConfiguration];
  [v6 setData:v7];
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
}

@end