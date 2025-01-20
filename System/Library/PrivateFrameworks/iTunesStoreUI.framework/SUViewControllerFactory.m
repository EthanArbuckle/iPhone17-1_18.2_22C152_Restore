@interface SUViewControllerFactory
- (id)newComposeReviewViewControllerWithCompositionURL:(id)a3;
- (id)newDownloadsViewController;
- (id)newNetworkLockoutViewControllerWithSection:(id)a3;
- (id)newPlaceholderViewController;
- (id)newStorePageViewControllerWithSection:(id)a3;
- (id)newViewControllerForPage:(id)a3 ofType:(int64_t)a4;
- (id)newViewControllerForTrackList:(id)a3;
- (id)newVolumeViewController;
@end

@implementation SUViewControllerFactory

- (id)newComposeReviewViewControllerWithCompositionURL:(id)a3
{
  v4 = [SUComposeReviewViewController alloc];

  return [(SUComposeReviewViewController *)v4 initWithCompositionURL:a3];
}

- (id)newDownloadsViewController
{
  return 0;
}

- (id)newNetworkLockoutViewControllerWithSection:(id)a3
{
  v4 = [SUNetworkLockoutViewController alloc];

  return [(SUViewController *)v4 initWithSection:a3];
}

- (id)newPlaceholderViewController
{
  return objc_alloc_init(SUPlaceholderViewController);
}

- (id)newStorePageViewControllerWithSection:(id)a3
{
  v4 = [SUStorePageViewController alloc];

  return [(SUViewController *)v4 initWithSection:a3];
}

- (id)newViewControllerForPage:(id)a3 ofType:(int64_t)a4
{
  if ((unint64_t)a4 > 4) {
    return 0;
  }
  else {
    return objc_alloc_init(*off_264812E18[a4]);
  }
}

- (id)newViewControllerForTrackList:(id)a3
{
  return objc_alloc_init(SUTableViewController);
}

- (id)newVolumeViewController
{
  return 0;
}

@end