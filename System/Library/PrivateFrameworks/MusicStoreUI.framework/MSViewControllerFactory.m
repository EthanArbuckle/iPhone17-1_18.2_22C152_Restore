@interface MSViewControllerFactory
- (id)newDownloadManagerOptions;
- (id)newDownloadsViewController;
- (id)newNetworkLockoutViewControllerWithSection:(id)a3;
- (id)newPlaceholderViewController;
- (id)newViewControllerForPage:(id)a3 ofType:(int64_t)a4;
- (id)newViewControllerForTrackList:(id)a3;
- (id)newVolumeViewController;
@end

@implementation MSViewControllerFactory

- (id)newDownloadManagerOptions
{
  id v2 = objc_alloc_init(MEMORY[0x263F7B180]);
  objc_msgSend(v2, "setDownloadKinds:", objc_msgSend(MEMORY[0x263F7B178], "ITunesDownloadKinds"));
  objc_msgSend(v2, "setPrefetchedDownloadExternalProperties:", objc_msgSend(MEMORY[0x263F895A8], "downloadExternalProperties"));
  objc_msgSend(v2, "setPrefetchedDownloadProperties:", objc_msgSend(MEMORY[0x263F895A8], "downloadProperties"));
  return v2;
}

- (id)newDownloadsViewController
{
  return 0;
}

- (id)newNetworkLockoutViewControllerWithSection:(id)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F89658]) initWithSection:a3];
  objc_msgSend(v3, "setLocalizationBundle:", objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()));
  return v3;
}

- (id)newPlaceholderViewController
{
  v4.receiver = self;
  v4.super_class = (Class)MSViewControllerFactory;
  id v2 = [(SUViewControllerFactory *)&v4 newPlaceholderViewController];
  objc_msgSend(v2, "setDefaultBackgroundGradient:", objc_msgSend(MEMORY[0x263F895F8], "gradientWithColor:", objc_msgSend(MEMORY[0x263F1C550], "systemBackgroundColor")));
  return v2;
}

- (id)newViewControllerForPage:(id)a3 ofType:(int64_t)a4
{
  if (a4)
  {
    v8.receiver = self;
    v8.super_class = (Class)MSViewControllerFactory;
    return -[SUViewControllerFactory newViewControllerForPage:ofType:](&v8, sel_newViewControllerForPage_ofType_, a3);
  }
  uint64_t v6 = [a3 type];
  if (v6 == 2)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F89688]);
    [v4 setDataSourceClass:objc_opt_class()];
    return v4;
  }
  if (v6 == 1) {
    v7 = MSTrackListViewController;
  }
  else {
    v7 = MSStructuredPageViewController;
  }
  return objc_alloc_init(v7);
}

- (id)newViewControllerForTrackList:(id)a3
{
  id v4 = objc_alloc_init(MSTrackListViewController);
  [(MSStructuredPageViewController *)v4 reloadWithStorePage:a3 forURL:0];
  return v4;
}

- (id)newVolumeViewController
{
  return objc_alloc_init(MSVolumeViewController);
}

@end