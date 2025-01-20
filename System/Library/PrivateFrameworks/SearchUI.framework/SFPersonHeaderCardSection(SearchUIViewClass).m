@interface SFPersonHeaderCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFPersonHeaderCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end