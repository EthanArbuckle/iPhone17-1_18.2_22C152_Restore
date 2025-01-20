@interface SFCallCommand(SearchUIButtonItem)
- (uint64_t)_searchUIButtonItemGeneratorClass;
@end

@implementation SFCallCommand(SearchUIButtonItem)

- (uint64_t)_searchUIButtonItemGeneratorClass
{
  return objc_opt_class();
}

@end