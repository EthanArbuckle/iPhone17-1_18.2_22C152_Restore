@interface NUSettings
- (BOOL)shouldShowArticlesInExcerptMode;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation NUSettings

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(NUSettings);
}

- (BOOL)shouldShowArticlesInExcerptMode
{
  return 0;
}

@end