@interface SFSuggestionCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFSuggestionCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end