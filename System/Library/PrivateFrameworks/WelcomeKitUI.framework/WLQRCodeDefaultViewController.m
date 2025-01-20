@interface WLQRCodeDefaultViewController
- (NSArray)codes;
- (WLQRCodeDefaultViewController)initWithDefaultQRCode;
- (void)_listButtonTapped:(id)a3;
- (void)providerDidProvide:(id)a3;
- (void)pushListViewController;
- (void)requestCodes;
- (void)setCodes:(id)a3;
- (void)setIndicatorHidden:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WLQRCodeDefaultViewController

- (WLQRCodeDefaultViewController)initWithDefaultQRCode
{
  v3 = [MEMORY[0x263EFF960] currentLocale];
  v4 = [v3 countryCode];
  char v5 = [v4 isEqualToString:@"CN"];
  v6 = [WLQRCode alloc];
  v7 = WLLocalizedString();
  v8 = WLLocalizedString();
  if (v5)
  {
    v9 = @"https://support.apple.com/HT201196";
    v10 = @"apple_support";
  }
  else
  {
    v9 = @"https://play.google.com/store/apps/details?id=com.apple.movetoios";
    v10 = @"google_play";
  }
  v11 = [(WLQRCode *)v6 initWithName:v7 title:v8 URL:v9 code:v10];

  v12 = [MEMORY[0x263F862E0] sharedInstance];
  [v12 didLoadAndroidStore:v10 selected:0 canceled:0 inAttempts:0];

  v13 = NSString;
  v14 = WLLocalizedString();
  v15 = [(WLQRCode *)v11 name];
  v16 = objc_msgSend(v13, "stringWithFormat:", v14, v15);

  v17 = [(WLQRCode *)v11 title];
  v20.receiver = self;
  v20.super_class = (Class)WLQRCodeDefaultViewController;
  v18 = [(WLQRCodeDefaultViewController *)&v20 initWithTitle:v17 detailText:v16 symbolName:@"qrcode"];

  if (v18)
  {
    v18->_useGooglePlayStore = v5 ^ 1;
    [(WLQRCodeViewController *)v18 setQrcode:v11];
  }

  return v18;
}

- (void)viewDidLoad
{
  v18[2] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)WLQRCodeDefaultViewController;
  [(WLOnboardingViewController *)&v17 viewDidLoad];
  v16 = WLLocalizedString();
  v3 = [MEMORY[0x263F5B8D0] linkButton];
  continueButton = self->_continueButton;
  self->_continueButton = v3;

  [(OBLinkTrayButton *)self->_continueButton setTitle:v16 forState:0];
  [(OBLinkTrayButton *)self->_continueButton addTarget:self action:sel__listButtonTapped_ forControlEvents:64];
  char v5 = [(WLQRCodeDefaultViewController *)self buttonTray];
  [v5 addButton:self->_continueButton];

  v6 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  indicatorView = self->_indicatorView;
  self->_indicatorView = v6;

  [(UIActivityIndicatorView *)self->_indicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(OBLinkTrayButton *)self->_continueButton addSubview:self->_indicatorView];
  v8 = (void *)MEMORY[0x263F08938];
  v9 = [(UIActivityIndicatorView *)self->_indicatorView centerXAnchor];
  v10 = [(OBLinkTrayButton *)self->_continueButton centerXAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v18[0] = v11;
  v12 = [(UIActivityIndicatorView *)self->_indicatorView centerYAnchor];
  v13 = [(OBLinkTrayButton *)self->_continueButton centerYAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v18[1] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  [v8 activateConstraints:v15];

  [(UIActivityIndicatorView *)self->_indicatorView stopAnimating];
  [(WLQRCodeDefaultViewController *)self requestCodes];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WLQRCodeDefaultViewController;
  [(WLQRCodeViewController *)&v4 viewWillAppear:a3];
  [(WLQRCodeDefaultViewController *)self setIndicatorHidden:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WLQRCodeDefaultViewController;
  [(WLQRCodeDefaultViewController *)&v5 viewWillDisappear:a3];
  [(WLQRCodeProvider *)self->_provider setDelegate:0];
  provider = self->_provider;
  self->_provider = 0;
}

- (void)_listButtonTapped:(id)a3
{
  if (self->_codes)
  {
    [(WLQRCodeDefaultViewController *)self pushListViewController];
  }
  else
  {
    [(WLQRCodeDefaultViewController *)self setIndicatorHidden:0];
    [(WLQRCodeDefaultViewController *)self requestCodes];
  }
}

- (void)requestCodes
{
  [(WLQRCodeProvider *)self->_provider setDelegate:0];
  v3 = objc_alloc_init(WLQRCodeProvider);
  provider = self->_provider;
  self->_provider = v3;

  [(WLQRCodeProvider *)self->_provider setUseGooglePlayStore:self->_useGooglePlayStore];
  [(WLQRCodeProvider *)self->_provider setDelegate:self];
  objc_super v5 = self->_provider;
  [(WLQRCodeProvider *)v5 request];
}

- (void)setIndicatorHidden:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(OBLinkTrayButton *)self->_continueButton titleLabel];
  BOOL v6 = !v3;
  [v5 setHidden:v6];

  indicatorView = self->_indicatorView;
  if (v6)
  {
    [(UIActivityIndicatorView *)indicatorView startAnimating];
  }
  else
  {
    [(UIActivityIndicatorView *)indicatorView stopAnimating];
  }
}

- (void)providerDidProvide:(id)a3
{
  [(WLQRCodeDefaultViewController *)self setCodes:a3];
  if ([(UIActivityIndicatorView *)self->_indicatorView isAnimating]) {
    [(WLQRCodeDefaultViewController *)self pushListViewController];
  }
  provider = self->_provider;
  self->_provider = 0;
}

- (void)pushListViewController
{
  WLLocalizedString();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v3 = WLLocalizedString();
  objc_super v4 = [(OBTableWelcomeController *)[WLQRCodeListViewController alloc] initWithTitle:v6 detailText:v3 symbolName:@"qrcode" adoptTableViewScrollView:1];
  [(WLQRCodeListViewController *)v4 setQrcodes:self->_codes];
  objc_super v5 = [(WLQRCodeDefaultViewController *)self navigationController];
  [v5 pushViewController:v4 animated:1];
}

- (NSArray)codes
{
  return self->_codes;
}

- (void)setCodes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codes, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
}

@end