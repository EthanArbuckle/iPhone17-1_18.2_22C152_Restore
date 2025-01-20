@interface PKPeerPaymentMessagesContentAccountLockedViewController
- (void)_openWallet;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentMessagesContentAccountLockedViewController

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)PKPeerPaymentMessagesContentAccountLockedViewController;
  [(PKPeerPaymentMessagesContentAccountLockedViewController *)&v19 viewDidLoad];
  v3 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  [v3 setVerticalPadding:18.0];

  v4 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v5 = [v4 imageView];
  double v6 = PKUIScreenScale();
  v7 = +[PKPeerPaymentTheme primaryTextColor];
  v8 = PKUIApplePayLogo(v7, 90.0, 25.0, v6);
  [v5 setImage:v8];

  PKDeviceSpecificLocalizedStringKeyForKey(@"PEER_PAYMENT_MESSAGES_ACCOUNT_LOCKED_ACTION", 0);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = PKLocalizedPeerPaymentString(v9);

  PKDeviceSpecificLocalizedStringKeyForKey(@"PEER_PAYMENT_MESSAGES_ACCOUNT_LOCKED_TITLE", 0);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  v12 = PKLocalizedPeerPaymentString(v11);

  v13 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v14 = [v13 label];
  [v14 setText:v12];

  v15 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v16 = [v15 button];
  [v16 setTitle:v10 forState:0];

  v17 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v18 = [v17 button];
  [v18 addTarget:self action:sel__openWallet forControlEvents:0x2000];
}

- (void)_openWallet
{
  [MEMORY[0x1E4F843E0] reportAppleCashSenderErrorPage:*MEMORY[0x1E4F869C0] buttonTag:*MEMORY[0x1E4F869F8]];
  id v3 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  [v3 handleAction:5 sender:self completion:0];
}

@end