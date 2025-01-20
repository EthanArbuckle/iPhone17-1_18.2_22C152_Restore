@interface SFWatchListCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFWatchListCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end