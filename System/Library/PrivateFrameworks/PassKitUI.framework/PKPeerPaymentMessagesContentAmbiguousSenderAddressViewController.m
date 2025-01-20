@interface PKPeerPaymentMessagesContentAmbiguousSenderAddressViewController
- (void)_openSettings;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentMessagesContentAmbiguousSenderAddressViewController

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)PKPeerPaymentMessagesContentAmbiguousSenderAddressViewController;
  [(PKPeerPaymentMessagesContentAmbiguousSenderAddressViewController *)&v18 viewDidLoad];
  v3 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  [v3 setVerticalPadding:18.0];

  v4 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v5 = [v4 imageView];
  double v6 = PKUIScreenScale();
  v7 = +[PKPeerPaymentTheme primaryTextColor];
  v8 = PKUIApplePayLogo(v7, 90.0, 25.0, v6);
  [v5 setImage:v8];

  v9 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v10 = [v9 label];
  v11 = PKPrimaryAppleAccountFormattedUsername();
  v12 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentMes_26.isa, &stru_1EF1B4C70.isa, v11);
  [v10 setText:v12];

  v13 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v14 = [v13 button];
  v15 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentMes_27.isa);
  [v14 setTitle:v15 forState:0];

  v16 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v17 = [v16 button];
  [v17 addTarget:self action:sel__openSettings forControlEvents:0x2000];
}

- (void)_openSettings
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=MESSAGES&path=MADRID_ACCOUNTS_BUTTON"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

@end