@interface SFStoreButtonItem(SearchUIButtonItem)
- (uint64_t)_searchUIButtonItemGeneratorClass;
@end

@implementation SFStoreButtonItem(SearchUIButtonItem)

- (uint64_t)_searchUIButtonItemGeneratorClass
{
  return objc_opt_class();
}

@end