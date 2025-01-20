@interface SXArticleTitleComponentClassification
+ (id)roleString;
+ (int)role;
@end

@implementation SXArticleTitleComponentClassification

+ (int)role
{
  return 38;
}

+ (id)roleString
{
  return @"article_title";
}

@end