@interface SFSelectableGridCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFSelectableGridCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end