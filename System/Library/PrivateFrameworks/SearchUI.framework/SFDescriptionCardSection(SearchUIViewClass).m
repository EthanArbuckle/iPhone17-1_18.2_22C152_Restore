@interface SFDescriptionCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFDescriptionCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end