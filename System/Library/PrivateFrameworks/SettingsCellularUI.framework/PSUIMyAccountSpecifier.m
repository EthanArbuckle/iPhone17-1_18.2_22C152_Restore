@interface PSUIMyAccountSpecifier
- (CTXPCServiceSubscriptionContext)context;
- (Logger)logger;
- (PSListController)hostController;
- (PSUICarrierSpaceMyAccountWebViewController)myAccountWebViewController;
- (PSUIMyAccountSpecifier)initWithContext:(id)a3 cbCache:(id)a4;
- (UINavigationController)navCon;
- (id)getLogger;
- (void)launchMyAccountInSafari:(id)a3;
- (void)launchMyAccountInWebView:(id)a3;
- (void)setContext:(id)a3;
- (void)setHostController:(id)a3;
- (void)setLogger:(id)a3;
- (void)setMyAccountWebViewController:(id)a3;
- (void)setNavCon:(id)a3;
@end

@implementation PSUIMyAccountSpecifier

- (PSUIMyAccountSpecifier)initWithContext:(id)a3 cbCache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 carrierServicesWebViewAccountUrl:v7];
  v10 = [v8 carrierServicesAccountUrl:v7];
  if (v9 && [v9 length] || v10 && objc_msgSend(v10, "length"))
  {
    v11 = [v8 carrierServicesMyAccountUrlTitle:v7];
    v12 = [(PSUIMyAccountSpecifier *)self initWithName:v11 target:self set:0 get:0 detail:0 cell:13 edit:0];

    if (v12)
    {
      [(PSUIMyAccountSpecifier *)v12 setIdentifier:@"MY_ACCOUNT"];
      objc_storeStrong((id *)&v12->_context, a3);
      if (v9 && [v9 length])
      {
        [(PSUIMyAccountSpecifier *)v12 setProperty:v9 forKey:@"MY_ACCOUNT_URL"];
        v13 = &selRef_launchMyAccountInWebView_;
      }
      else
      {
        [(PSUIMyAccountSpecifier *)v12 setProperty:v10 forKey:@"MY_ACCOUNT_URL"];
        v13 = &selRef_launchMyAccountInSafari_;
      }
      [(PSUIMyAccountSpecifier *)v12 setButtonAction:*v13];
    }
    self = v12;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)launchMyAccountInWebView:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v4 = [a3 propertyForKey:@"MY_ACCOUNT_URL"];
  v5 = [(PSUIMyAccountSpecifier *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Launch my account in web view pressed: %@", (uint8_t *)&v12, 0xCu);
  }

  v6 = [[PSUICarrierSpaceMyAccountWebViewController alloc] initWithURLString:v4];
  myAccountWebViewController = self->_myAccountWebViewController;
  self->_myAccountWebViewController = v6;

  id v8 = (UINavigationController *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:self->_myAccountWebViewController];
  navCon = self->_navCon;
  self->_navCon = v8;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  if (WeakRetained)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_hostController);
    [v11 presentViewController:self->_navCon animated:1 completion:0];
  }
}

- (void)launchMyAccountInSafari:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = NSURL;
  v5 = [a3 propertyForKey:@"MY_ACCOUNT_URL"];
  v6 = [v4 URLWithString:v5];

  id v7 = [(PSUIMyAccountSpecifier *)self getLogger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "Launch my account in safari pressed: %@", (uint8_t *)&v10, 0xCu);
  }

  id v8 = (void *)*MEMORY[0x263F83300];
  v9 = objc_opt_new();
  [v8 openURL:v6 options:v9 completionHandler:0];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"MyAccountSpecifier"];
}

- (PSListController)hostController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  return (PSListController *)WeakRetained;
}

- (void)setHostController:(id)a3
{
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (PSUICarrierSpaceMyAccountWebViewController)myAccountWebViewController
{
  return self->_myAccountWebViewController;
}

- (void)setMyAccountWebViewController:(id)a3
{
}

- (UINavigationController)navCon
{
  return self->_navCon;
}

- (void)setNavCon:(id)a3
{
}

- (Logger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_navCon, 0);
  objc_storeStrong((id *)&self->_myAccountWebViewController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_hostController);
}

@end