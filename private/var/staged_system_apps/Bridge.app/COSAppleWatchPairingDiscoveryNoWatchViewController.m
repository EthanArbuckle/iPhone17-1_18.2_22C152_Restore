@interface COSAppleWatchPairingDiscoveryNoWatchViewController
- (COSAppleWatchPairingDiscoveryNoWatchViewController)init;
- (UIActivityIndicatorView)spinner;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)titleString;
- (void)alternateButtonPressed:(id)a3;
- (void)setSpinner:(id)a3;
- (void)viewDidLoad;
@end

@implementation COSAppleWatchPairingDiscoveryNoWatchViewController

- (COSAppleWatchPairingDiscoveryNoWatchViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSAppleWatchPairingDiscoveryNoWatchViewController;
  v2 = [(COSAppleWatchPairingDiscoveryNoWatchViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(COSAppleWatchPairingDiscoveryNoWatchViewController *)v2 setStyle:8];
  }
  return v3;
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)COSAppleWatchPairingDiscoveryNoWatchViewController;
  [(COSAppleWatchPairingDiscoveryNoWatchViewController *)&v20 viewDidLoad];
  v3 = [(COSAppleWatchPairingDiscoveryNoWatchViewController *)self view];
  v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];

  objc_super v5 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  spinner = self->_spinner;
  self->_spinner = v5;

  [(UIActivityIndicatorView *)self->_spinner setHidesWhenStopped:1];
  v7 = [(COSAppleWatchPairingDiscoveryNoWatchViewController *)self contentView];
  [v7 addSubview:self->_spinner];

  [(UIActivityIndicatorView *)self->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [(UIActivityIndicatorView *)self->_spinner bottomAnchor];
  v9 = [(COSAppleWatchPairingDiscoveryNoWatchViewController *)self contentView];
  v10 = [v9 bottomAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  v12 = [(UIActivityIndicatorView *)self->_spinner centerXAnchor];
  v13 = [(COSAppleWatchPairingDiscoveryNoWatchViewController *)self contentView];
  v14 = [v13 centerXAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  v16 = [(UIActivityIndicatorView *)self->_spinner topAnchor];
  v17 = [(COSAppleWatchPairingDiscoveryNoWatchViewController *)self contentView];
  v18 = [v17 topAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  [v19 setActive:1];

  [(UIActivityIndicatorView *)self->_spinner startAnimating];
}

- (id)alternateButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"HAVING_TROUBLE_MAGIC_CODE_LEARN_MORE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (void)alternateButtonPressed:(id)a3
{
  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  v3 = +[NSURL URLWithString:@"https://support.apple.com/HT204505"];
  [v4 openURL:v3 configuration:0 completionHandler:0];
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"HAVING_TROUBLE_MAGIC_CODE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"HAVING_TROUBLE_MAGIC_CODE_DETAIL_TEXT" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
}

@end