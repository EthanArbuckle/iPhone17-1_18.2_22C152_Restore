@interface SXDefaultEmbedVideoComponentClassification
+ (id)roleString;
+ (id)typeString;
+ (int)role;
- (Class)componentModelClass;
- (id)layoutRules;
@end

@implementation SXDefaultEmbedVideoComponentClassification

+ (id)typeString
{
  return @"embed_video";
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