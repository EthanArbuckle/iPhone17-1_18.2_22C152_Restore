@interface SFRowCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFRowCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end