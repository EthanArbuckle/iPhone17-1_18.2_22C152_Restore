@interface SFMapsDetailedRowCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFMapsDetailedRowCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end