@interface SFScoreboardCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFScoreboardCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end