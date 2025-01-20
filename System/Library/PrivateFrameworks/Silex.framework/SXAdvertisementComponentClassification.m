@interface SXAdvertisementComponentClassification
+ (id)roleString;
+ (id)typeString;
+ (int)role;
- (BOOL)isCollapsible;
- (Class)componentModelClass;
- (id)layoutRules;
@end

@implementation SXAdvertisementComponentClassification

+ (id)typeString
{
  return @"advertisement";
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

- (BOOL)isCollapsible
{
  return 1;
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

@end