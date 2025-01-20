@interface TPSURLActivityItemSource
- (TPSTip)tip;
- (TPSUIAppController)appController;
- (TPSURLActivityItemSource)initWithTip:(id)a3 appController:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)cacheImage;
- (int64_t)userInterfaceStyle;
- (void)setAppController:(id)a3;
- (void)setTip:(id)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
@end

@implementation TPSURLActivityItemSource

- (TPSURLActivityItemSource)initWithTip:(id)a3 appController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TPSURLActivityItemSource;
  v8 = [(TPSURLActivityItemSource *)&v17 init];
  v9 = v8;
  if (v8)
  {
    [(TPSURLActivityItemSource *)v8 setTip:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_tip);
    v11 = [WeakRetained webURLPath];

    if (v11)
    {
      v9->_userInterfaceStyle = 1;
      id v12 = objc_loadWeakRetained((id *)&v9->_tip);
      v13 = [v12 webURLPath];
      uint64_t v14 = +[NSURL URLWithString:v13];
      url = v9->_url;
      v9->_url = (NSURL *)v14;

      objc_storeWeak((id *)&v9->_appController, v7);
    }
  }

  return v9;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return self->_url;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return self->_url;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  if (UIActivityTypeAirDrop == a4)
  {
    id v6 = +[TPSCommonDefines clientBundleIdentifier];
    id v7 = +[UIScreen mainScreen];
    [v7 scale];
    v5 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v6, 1);
  }
  else
  {
    v5 = [(TPSURLActivityItemSource *)self cacheImage];
  }

  return v5;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  v4 = [(TPSURLActivityItemSource *)self cacheImage];
  id v5 = objc_alloc_init((Class)LPLinkMetadata);
  p_tip = &self->_tip;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tip);
  v8 = [WeakRetained shortTitle];
  if (v8)
  {
    [v5 setTitle:v8];
  }
  else
  {
    id v9 = objc_loadWeakRetained((id *)p_tip);
    v10 = [v9 title];
    [v5 setTitle:v10];
  }
  if (v4)
  {
    id v11 = [objc_alloc((Class)LPImage) initWithPlatformImage:v4];
    [v5 setImage:v11];
  }

  return v5;
}

- (id)cacheImage
{
  v3 = [(TPSURLActivityItemSource *)self tip];
  v4 = [(TPSURLActivityItemSource *)self appController];
  id v5 = [v3 fullContentAssets];
  id v6 = [v3 language];
  int64_t userInterfaceStyle = self->_userInterfaceStyle;
  v8 = [(TPSURLActivityItemSource *)self tip];
  id v9 = [v8 assetFileInfoManager];
  v10 = [v4 assetConfigurationForAssets:v5 language:v6 sizeClass:1 style:userInterfaceStyle assetFileInfoManager:v9];

  id v11 = [v10 cacheIdentifierForType:0];
  id v12 = +[TPSImageAssetController getImageForIdentifier:v11];

  return v12;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_int64_t userInterfaceStyle = a3;
}

- (TPSUIAppController)appController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appController);

  return (TPSUIAppController *)WeakRetained;
}

- (void)setAppController:(id)a3
{
}

- (TPSTip)tip
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tip);

  return (TPSTip *)WeakRetained;
}

- (void)setTip:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tip);
  objc_destroyWeak((id *)&self->_appController);

  objc_storeStrong((id *)&self->_url, 0);
}

@end