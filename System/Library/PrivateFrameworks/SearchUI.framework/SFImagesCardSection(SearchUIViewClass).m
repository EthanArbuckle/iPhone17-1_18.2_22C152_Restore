@interface SFImagesCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFImagesCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end