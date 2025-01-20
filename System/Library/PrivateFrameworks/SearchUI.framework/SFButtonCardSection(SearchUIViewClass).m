@interface SFButtonCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFButtonCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end