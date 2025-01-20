@interface SFMiniCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFMiniCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end