@interface SFContactButtonItem(SearchUIButtonItem)
- (uint64_t)_searchUIButtonItemGeneratorClass;
@end

@implementation SFContactButtonItem(SearchUIButtonItem)

- (uint64_t)_searchUIButtonItemGeneratorClass
{
  return objc_opt_class();
}

@end