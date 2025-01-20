@interface SFImageDerivedColor(SearchUIColors)
- (uint64_t)searchUI_colorGeneratorClass;
@end

@implementation SFImageDerivedColor(SearchUIColors)

- (uint64_t)searchUI_colorGeneratorClass
{
  return objc_opt_class();
}

@end