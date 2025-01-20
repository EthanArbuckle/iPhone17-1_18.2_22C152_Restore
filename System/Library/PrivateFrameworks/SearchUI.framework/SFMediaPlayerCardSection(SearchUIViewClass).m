@interface SFMediaPlayerCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFMediaPlayerCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end