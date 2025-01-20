@interface SFVerticalLayoutCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFVerticalLayoutCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end