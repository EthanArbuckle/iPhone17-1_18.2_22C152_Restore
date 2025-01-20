@interface SXArticleThumbnailComponentClassification
+ (id)roleString;
+ (id)typeString;
- (Class)componentModelClass;
- (id)accessibilityContextualLabel;
@end

@implementation SXArticleThumbnailComponentClassification

+ (id)roleString
{
  return @"article_thumbnail";
}

+ (id)typeString
{
  return @"article_thumbnail";
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityContextualLabel
{
  v2 = SXBundle();
  v3 = [v2 localizedStringForKey:@"Article Thumbnail" value:&stru_26D5311C0 table:0];

  return v3;
}

@end