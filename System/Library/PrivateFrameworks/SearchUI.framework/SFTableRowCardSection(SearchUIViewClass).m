@interface SFTableRowCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFTableRowCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end