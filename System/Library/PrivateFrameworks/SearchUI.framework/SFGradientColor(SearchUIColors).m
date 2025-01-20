@interface SFGradientColor(SearchUIColors)
- (uint64_t)searchUI_colorGeneratorClass;
@end

@implementation SFGradientColor(SearchUIColors)

- (uint64_t)searchUI_colorGeneratorClass
{
  return objc_opt_class();
}

@end