@interface SFCommand(SearchUIButtonItem)
- (uint64_t)_searchUIButtonItemGeneratorClass;
@end

@implementation SFCommand(SearchUIButtonItem)

- (uint64_t)_searchUIButtonItemGeneratorClass
{
  return objc_opt_class();
}

@end