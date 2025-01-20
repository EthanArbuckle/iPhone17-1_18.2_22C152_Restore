@interface SFHeroCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFHeroCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end