@interface SXFlexibleSpacerComponentClassification
+ (id)roleString;
+ (id)typeString;
+ (int)role;
- (Class)componentModelClass;
@end

@implementation SXFlexibleSpacerComponentClassification

+ (id)typeString
{
  return @"flexible_spacer";
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