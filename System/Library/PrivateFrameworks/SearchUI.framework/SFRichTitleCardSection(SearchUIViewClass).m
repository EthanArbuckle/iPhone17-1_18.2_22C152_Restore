@interface SFRichTitleCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFRichTitleCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end