@interface PKPeerPaymentMessagesContentRecipientInvalidViewController
- (void)reloadContent;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentMessagesContentRecipientInvalidViewController

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentMessagesContentRecipientInvalidViewController;
  [(PKPeerPaymentMessagesContentRecipientInvalidViewController *)&v9 viewDidLoad];
  v3 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  [v3 setVerticalPadding:18.0];

  v4 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v5 = [v4 imageView];
  double v6 = PKUIScreenScale();
  v7 = +[PKPeerPaymentTheme primaryTextColor];
  v8 = PKUIApplePayLogo(v7, 90.0, 25.0, v6);
  [v5 setImage:v8];
}

- (void)reloadContent
{
  v3 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  id v8 = [v3 recipientDisplayName];

  if (v8 && [v8 length])
  {
    v4 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
    v5 = [v4 label];
    uint64_t v6 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentMes_28.isa, &stru_1EF1B4C70.isa, v8);
  }
  else
  {
    v4 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
    v5 = [v4 label];
    uint64_t v6 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentMes_29.isa);
  }
  v7 = (void *)v6;
  [v5 setText:v6];
}

@end