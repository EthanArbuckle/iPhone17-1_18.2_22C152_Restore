@interface PKPeerPaymentMessagesContentRecipientGroupViewController
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentMessagesContentRecipientGroupViewController

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentMessagesContentRecipientGroupViewController;
  [(PKPeerPaymentMessagesContentRecipientGroupViewController *)&v12 viewDidLoad];
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
  v11 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentMes_32.isa);
  [v10 setText:v11];
}

@end