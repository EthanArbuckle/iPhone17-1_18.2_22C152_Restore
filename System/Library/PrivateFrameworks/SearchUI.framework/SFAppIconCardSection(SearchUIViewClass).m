@interface SFAppIconCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFAppIconCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end