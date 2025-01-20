@interface SXArticleThumbnailComponent
+ (id)typeString;
- (BOOL)requiresLinkedContent;
@end

@implementation SXArticleThumbnailComponent

+ (id)typeString
{
  return @"article_thumbnail";
}

- (BOOL)requiresLinkedContent
{
  return 1;
}

@end