@interface SFFlightCardSection(SearchUIViewClass)
- (uint64_t)_searchUIViewClass;
@end

@implementation SFFlightCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

@end