@interface SXDefaultVideoComponentClassification
+ (id)roleString;
+ (id)typeString;
+ (int)role;
- (Class)componentModelClass;
- (id)layoutRules;
@end

@implementation SXDefaultVideoComponentClassification

+ (id)typeString
{
  return @"video";
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
  return +[SXComponentLayoutRules twoColumnLayoutRules];
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

@end