@interface PKPeerPaymentMessagesContentEnableViewController
- (void)_openSettings;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentMessagesContentEnableViewController

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)PKPeerPaymentMessagesContentEnableViewController;
  [(PKPeerPaymentMessagesContentEnableViewController *)&v19 viewDidLoad];
  v3 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  [v3 setVerticalPadding:18.0];

  v4 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v5 = [v4 imageView];
  double v6 = PKUIScreenScale();
  v7 = +[PKPeerPaymentTheme primaryTextColor];
  v8 = PKUIApplePayLogo(v7, 90.0, 25.0, v6);
  [v5 setImage:v8];

  LODWORD(v7) = PKUserHasDisabledPeerPayment();
  v9 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v10 = [v9 label];
  if (v7)
  {
    v11 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentMes_20.isa);
    [v10 setText:v11];

    v12 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
    v13 = [v12 button];
    v14 = @"PEER_PAYMENT_MESSAGES_REENABLEMENT_REQUIRED_ACTION";
  }
  else
  {
    v15 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentMes_22.isa);
    [v10 setText:v15];

    v12 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
    v13 = [v12 button];
    v14 = @"PEER_PAYMENT_MESSAGES_ENABLEMENT_REQUIRED_ACTION";
  }
  v16 = PKLocalizedPeerPaymentString(&v14->isa);
  [v13 setTitle:v16 forState:0];

  v17 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v18 = [v17 button];
  [v18 addTarget:self action:sel__openSettings forControlEvents:0x2000];
}

- (void)_openSettings
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=PASSBOOK"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

@end