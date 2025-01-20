@interface SFAppColor(SearchUIColors)
- (uint64_t)searchUI_colorGeneratorClass;
@end

@implementation SFAppColor(SearchUIColors)

- (uint64_t)searchUI_colorGeneratorClass
{
  return objc_opt_class();
}

@end