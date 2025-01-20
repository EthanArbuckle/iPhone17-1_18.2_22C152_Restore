@interface PKPeerPaymentMessagesContentRecipientRestrictedOutsideFamilyViewController
- (void)reloadContent;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentMessagesContentRecipientRestrictedOutsideFamilyViewController

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentMessagesContentRecipientRestrictedOutsideFamilyViewController;
  [(PKPeerPaymentMessagesContentRecipientRestrictedOutsideFamilyViewController *)&v9 viewDidLoad];
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
  id v4 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  v2 = [v4 label];
  v3 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentMes_31.isa);
  [v2 setText:v3];
}

@end