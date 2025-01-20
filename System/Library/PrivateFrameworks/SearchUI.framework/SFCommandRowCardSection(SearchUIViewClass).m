@interface SFCommandRowCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFCommandRowCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end