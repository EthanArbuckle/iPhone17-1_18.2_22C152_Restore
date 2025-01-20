@interface SXDefaultLineComponentClassification
+ (id)roleString;
+ (id)typeString;
+ (int)role;
- (Class)componentModelClass;
@end

@implementation SXDefaultLineComponentClassification

+ (id)typeString
{
  return @"line";
}

+ (int)role
{
  return 0;
}

+ (id)roleString
{
  return SXComponentClassificationUnknownRoleString;
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

@end