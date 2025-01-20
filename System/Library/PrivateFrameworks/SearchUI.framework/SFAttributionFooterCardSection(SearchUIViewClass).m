@interface SFAttributionFooterCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFAttributionFooterCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end