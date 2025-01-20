@interface PKPeerPaymentMessagesContentInstallViewController
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentMessagesContentInstallViewController

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)PKPeerPaymentMessagesContentInstallViewController;
  [(PKPeerPaymentMessagesContentInstallViewController *)&v17 viewDidLoad];
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
  v11 = PKLocalizedDeletableString(&cfstr_WalletUninstal_0.isa);
  [v10 setText:v11];

  v12 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v13 = [v12 button];
  v14 = PKLocalizedDeletableString(&cfstr_WalletUninstal_2.isa);
  [v13 setTitle:v14 forState:0];

  v15 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v16 = [v15 button];
  [v16 addTarget:self action:sel__openInstallWallet forControlEvents:0x2000];
}

@end