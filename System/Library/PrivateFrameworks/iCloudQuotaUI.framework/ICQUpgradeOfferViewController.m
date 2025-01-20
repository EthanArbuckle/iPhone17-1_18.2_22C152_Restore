@interface ICQUpgradeOfferViewController
+ (BOOL)supportsPageClassIdentifier:(id)a3;
- (BOOL)isCancelEnabled;
- (ICQUpgradeOfferViewController)initWithPageSpecification:(id)a3;
- (ICQUpgradeOfferViewController)initWithUpgradeOfferPageSpecification:(id)a3;
- (void)cancel:(id)a3;
- (void)loadView;
- (void)setCancelEnabled:(BOOL)a3;
@end

@implementation ICQUpgradeOfferViewController

- (ICQUpgradeOfferViewController)initWithPageSpecification:(id)a3
{
  id v4 = a3;
  v5 = [v4 pageClassIdentifier];
  v6 = [(ICQUpgradeOfferViewController *)self initWithUpgradeOfferPageSpecification:v4];

  return v6;
}

- (ICQUpgradeOfferViewController)initWithUpgradeOfferPageSpecification:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICQUpgradeOfferViewController;
  v3 = [(ICQViewController *)&v7 initWithPageSpecification:a3];
  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v3 action:sel_cancel_];
    v5 = [(ICQUpgradeOfferViewController *)v3 navigationItem];
    [v5 setLeftBarButtonItem:v4];
  }
  return v3;
}

- (BOOL)isCancelEnabled
{
  v2 = [(ICQUpgradeOfferViewController *)self navigationItem];
  v3 = [v2 leftBarButtonItem];
  char v4 = [v3 isEnabled];

  return v4;
}

- (void)setCancelEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ICQUpgradeOfferViewController *)self navigationItem];
  char v4 = [v5 leftBarButtonItem];
  [v4 setEnabled:v3];
}

+ (BOOL)supportsPageClassIdentifier:(id)a3
{
  return [a3 isEqualToString:@"_ICQUpgradeOfferPageSpecification"];
}

- (void)loadView
{
  BOOL v3 = [ICQUpgradeOfferView alloc];
  v6 = -[ICQUpgradeOfferView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  char v4 = [(ICQUpgradeOfferViewController *)self upgradeOfferPageSpecification];
  [(ICQUpgradeOfferView *)v6 setUpgradeOfferPageSpecification:v4];

  id v5 = [(ICQViewController *)self buttonTintColor];
  [(ICQUpgradeOfferView *)v6 setButtonTintColor:v5];

  [(ICQUpgradeOfferViewController *)self setView:v6];
  [(ICQUpgradeOfferView *)v6 setDelegate:self];
}

- (void)cancel:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  char v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "user canceled upgrade offer", (uint8_t *)&v15, 2u);
  }

  id v5 = [(ICQViewController *)self pageDelegate];
  char v6 = objc_opt_respondsToSelector();

  objc_super v7 = _ICQGetLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = MEMORY[0x263EFFA78];
      v10 = [(ICQViewController *)self pageDelegate];
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v13 = _ICQStringForAction();
      int v15 = 138412802;
      v16 = v12;
      __int16 v17 = 2112;
      v18 = v13;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "delegate %@ being sent action:%@ parameters:%@", (uint8_t *)&v15, 0x20u);
    }
    objc_super v7 = [(ICQViewController *)self pageDelegate];
    [v7 sender:self action:1 parameters:MEMORY[0x263EFFA78]];
  }
  else if (v8)
  {
    v14 = [(ICQViewController *)self pageDelegate];
    int v15 = 138412290;
    v16 = v14;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "page delegate %@ does not respond to selector sender:action:paramters", (uint8_t *)&v15, 0xCu);
  }
}

@end