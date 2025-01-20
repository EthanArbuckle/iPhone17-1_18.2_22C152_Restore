@interface SFKeyValueDataCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFKeyValueDataCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end