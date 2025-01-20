@interface SFInfoCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFInfoCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end