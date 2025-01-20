@interface SFCompactRowCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFCompactRowCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end