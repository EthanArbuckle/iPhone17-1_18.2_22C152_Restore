@interface SXDefaultSectionComponentClassification
+ (id)roleString;
+ (id)typeString;
+ (int)role;
- (Class)componentModelClass;
- (id)layoutRules;
@end

@implementation SXDefaultSectionComponentClassification

+ (id)typeString
{
  return @"section";
}

+ (int)role
{
  return 0;
}

+ (id)roleString
{
  return SXComponentClassificationUnknownRoleString;
}

- (id)layoutRules
{
  return +[SXComponentLayoutRules fullWidthLayoutRules];
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

@end