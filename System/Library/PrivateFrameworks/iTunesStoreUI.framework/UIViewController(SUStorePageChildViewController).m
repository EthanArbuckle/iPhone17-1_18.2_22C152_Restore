@interface UIViewController(SUStorePageChildViewController)
- (double)documentBounds;
- (uint64_t)displayedURL;
- (uint64_t)storePageProtocol;
- (uint64_t)storePageProtocolDidChange;
- (uint64_t)viewIsReady;
@end

@implementation UIViewController(SUStorePageChildViewController)

- (uint64_t)displayedURL
{
  return 0;
}

- (double)documentBounds
{
  if (![a1 isViewLoaded]) {
    return *MEMORY[0x263F001A0];
  }
  objc_msgSend((id)objc_msgSend(a1, "view"), "bounds");
  return result;
}

- (uint64_t)storePageProtocol
{
  return 0;
}

- (uint64_t)storePageProtocolDidChange
{
  v1 = (void *)[a1 parentViewController];

  return [v1 storePageProtocolDidChange];
}

- (uint64_t)viewIsReady
{
  return 1;
}

@end