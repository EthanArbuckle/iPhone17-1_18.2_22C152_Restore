@interface SFSectionHeaderCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFSectionHeaderCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end