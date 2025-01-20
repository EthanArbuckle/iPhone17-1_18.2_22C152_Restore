@interface SFMediaInfoCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFMediaInfoCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end