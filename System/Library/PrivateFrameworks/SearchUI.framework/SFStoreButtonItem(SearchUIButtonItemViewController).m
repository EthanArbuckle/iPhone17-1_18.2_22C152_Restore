@interface SFStoreButtonItem(SearchUIButtonItemViewController)
- (uint64_t)searchUI_viewControllerClass;
@end

@implementation SFStoreButtonItem(SearchUIButtonItemViewController)

- (uint64_t)searchUI_viewControllerClass
{
  return objc_opt_class();
}

@end