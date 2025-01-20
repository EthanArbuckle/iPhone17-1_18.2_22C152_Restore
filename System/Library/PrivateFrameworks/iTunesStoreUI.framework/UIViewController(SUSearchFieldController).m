@interface UIViewController(SUSearchFieldController)
- (uint64_t)iTunesStoreUI_searchFieldController;
@end

@implementation UIViewController(SUSearchFieldController)

- (uint64_t)iTunesStoreUI_searchFieldController
{
  v1 = (void *)[a1 parentViewController];

  return objc_msgSend(v1, "iTunesStoreUI_searchFieldController");
}

@end