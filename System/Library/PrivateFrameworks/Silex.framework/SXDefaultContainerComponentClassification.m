@interface SXDefaultContainerComponentClassification
+ (id)roleString;
+ (id)typeString;
+ (int)role;
- (Class)componentModelClass;
@end

@implementation SXDefaultContainerComponentClassification

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

+ (id)typeString
{
  return @"container";
}

+ (int)role
{
  return 0;
}

+ (id)roleString
{
  return SXComponentClassificationUnknownRoleString;
}

@end