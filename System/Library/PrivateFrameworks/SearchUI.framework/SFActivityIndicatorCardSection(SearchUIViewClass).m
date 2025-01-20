@interface SFActivityIndicatorCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFActivityIndicatorCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end