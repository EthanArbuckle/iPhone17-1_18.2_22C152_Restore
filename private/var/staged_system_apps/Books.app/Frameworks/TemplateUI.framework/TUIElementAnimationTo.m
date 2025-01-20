@interface TUIElementAnimationTo
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
@end

@implementation TUIElementAnimationTo

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIAnimationBuilding;
}

+ (Class)builderClass
{
  return (Class)objc_opt_class();
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v6 = a4;
  [v8 setDuration:1.0];
  v7 = [v6 finalizeAnimationValues];
  [v8 setValues:v7];
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
}

@end