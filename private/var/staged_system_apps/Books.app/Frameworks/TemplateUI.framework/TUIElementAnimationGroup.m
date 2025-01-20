@interface TUIElementAnimationGroup
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)requiredBuilderProtocol;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5;
+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementAnimationGroup

+ (id)supportedAttributes
{
  if (qword_2DF6D0 != -1) {
    dispatch_once(&qword_2DF6D0, &stru_255538);
  }
  v2 = (void *)qword_2DF6C8;

  return v2;
}

+ (unint64_t)definesScopes
{
  return 63;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIAnimationGroupBuilding;
}

+ (Class)builderClass
{
  return (Class)objc_opt_class();
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v11 = a3;
  v8 = [a5 stringForAttribute:138 node:a4.var0];
  [v11 setGroupName:v8];

  v9 = [v11 groupName];
  id v10 = [v9 length];

  if (!v10) {
    [v11 setGroupName:@"default"];
  }
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [v7 finalizeAnimationGroup];
  v8 = [v7 groupName];

  [v6 addAnimationGroup:v9 withName:v8];
}

@end