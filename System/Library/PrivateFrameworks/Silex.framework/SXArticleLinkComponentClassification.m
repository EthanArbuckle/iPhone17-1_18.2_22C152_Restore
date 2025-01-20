@interface SXArticleLinkComponentClassification
+ (id)roleString;
+ (id)typeString;
+ (int)role;
- (Class)componentModelClass;
- (id)accessibilityContextualLabel;
@end

@implementation SXArticleLinkComponentClassification

+ (int)role
{
  return 0;
}

+ (id)roleString
{
  return @"article_link";
}

+ (id)typeString
{
  return @"article_link";
}

- (id)accessibilityContextualLabel
{
  v2 = SXBundle();
  v3 = [v2 localizedStringForKey:@"Article Link" value:&stru_26D5311C0 table:0];

  return v3;
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

@end