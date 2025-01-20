@interface PKPeerPaymentMessagesContentIMessageDisabledViewController
- (void)_openSettings;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentMessagesContentIMessageDisabledViewController

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)PKPeerPaymentMessagesContentIMessageDisabledViewController;
  [(PKPeerPaymentMessagesContentIMessageDisabledViewController *)&v17 viewDidLoad];
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
  v11 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentMes_18.isa);
  [v10 setText:v11];

  v12 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v13 = [v12 button];
  v14 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentMes_19.isa);
  [v13 setTitle:v14 forState:0];

  v15 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v16 = [v15 button];
  [v16 addTarget:self action:sel__openSettings forControlEvents:0x2000];
}

- (void)_openSettings
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=MESSAGES"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

@end