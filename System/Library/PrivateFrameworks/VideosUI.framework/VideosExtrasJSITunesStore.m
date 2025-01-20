@interface VideosExtrasJSITunesStore
- (UIViewController)formPresentationViewController;
- (void)loadStoreURL:(id)a3 playOnLaunch:(id)a4;
- (void)setFormPresentationViewController:(id)a3;
@end

@implementation VideosExtrasJSITunesStore

- (void)loadStoreURL:(id)a3 playOnLaunch:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v4 = +[VUIInterfaceFactory sharedInstance];
    v5 = [v4 openURLHandler];

    [v5 processItunesExtrasStoreLink:v6];
  }
}

- (UIViewController)formPresentationViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_formPresentationViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setFormPresentationViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end