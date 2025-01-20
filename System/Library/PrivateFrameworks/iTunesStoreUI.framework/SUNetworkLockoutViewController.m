@interface SUNetworkLockoutViewController
- (SUNetworkLockoutViewController)init;
- (void)_reloadUserInterface;
- (void)loadView;
- (void)setLocalizationBundle:(id)a3;
- (void)setSection:(id)a3;
@end

@implementation SUNetworkLockoutViewController

- (SUNetworkLockoutViewController)init
{
  [(SUNetworkLockoutViewController *)self setSection:0];
  v4.receiver = self;
  v4.super_class = (Class)SUNetworkLockoutViewController;
  return [(SULockoutViewController *)&v4 init];
}

- (void)setLocalizationBundle:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUNetworkLockoutViewController;
  [(SULockoutViewController *)&v4 setLocalizationBundle:a3];
  [(SUNetworkLockoutViewController *)self _reloadUserInterface];
}

- (void)setSection:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUNetworkLockoutViewController;
  [(SUViewController *)&v4 setSection:a3];
  [(SUNetworkLockoutViewController *)self _reloadUserInterface];
}

- (void)loadView
{
  v2.receiver = self;
  v2.super_class = (Class)SUNetworkLockoutViewController;
  [(SULockoutViewController *)&v2 loadView];
}

- (void)_reloadUserInterface
{
  v3 = [(SULockoutViewController *)self localizationBundle];
  if (v3)
  {
    objc_super v4 = v3;
    id v5 = [(UIViewController *)self section];
    uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom");
    v7 = [(SULockoutViewController *)self localizationBundle];
    if (v6 == 1) {
      v8 = @"NO_STORE_MAIN_K48";
    }
    else {
      v8 = @"NO_STORE_MAIN";
    }
    [(SULockoutViewController *)self setMessageTitle:[(NSBundle *)v7 localizedStringForKey:v8 value:&stru_26DB8C5F8 table:0]];
    -[SULockoutViewController setImage:](self, "setImage:", [MEMORY[0x263F1C6B0] imageNamed:@"StoreOfflineGraphic" inBundle:v4]);
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B148], "currentDevice"), "supportsDeviceCapability:", 0))
    {
      if (v5 && [v5 minimumNetworkType] > 999 || (MGGetBoolAnswer() & 1) == 0)
      {
        int v12 = MGGetBoolAnswer();
        v10 = [(SULockoutViewController *)self localizationBundle];
        if (v12) {
          v11 = @"NO_STORE_SUB_WLAN";
        }
        else {
          v11 = @"NO_STORE_SUB";
        }
      }
      else
      {
        int v9 = MGGetBoolAnswer();
        v10 = [(SULockoutViewController *)self localizationBundle];
        if (v9) {
          v11 = @"NO_STORE_SUB_CELLULAR_WLAN";
        }
        else {
          v11 = @"NO_STORE_SUB_CELLULAR";
        }
      }
    }
    else
    {
      v10 = [(SULockoutViewController *)self localizationBundle];
      v11 = @"NO_STORE_SUB_NO_WIFI";
    }
    uint64_t v13 = [(NSBundle *)v10 localizedStringForKey:v11 value:&stru_26DB8C5F8 table:0];
    [(SULockoutViewController *)self setMessageBody:v13];
  }
}

@end