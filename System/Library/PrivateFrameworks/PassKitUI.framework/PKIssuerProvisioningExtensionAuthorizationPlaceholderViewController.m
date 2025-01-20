@interface PKIssuerProvisioningExtensionAuthorizationPlaceholderViewController
- (void)loadView;
- (void)viewWillLayoutSubviews;
@end

@implementation PKIssuerProvisioningExtensionAuthorizationPlaceholderViewController

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)PKIssuerProvisioningExtensionAuthorizationPlaceholderViewController;
  [(PKIssuerProvisioningExtensionAuthorizationPlaceholderViewController *)&v7 loadView];
  v3 = [(PKIssuerProvisioningExtensionAuthorizationPlaceholderViewController *)self view];
  [v3 setAutoresizesSubviews:0];
  v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  v5 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:101];
  indicator = self->_indicator;
  self->_indicator = v5;

  [v3 addSubview:self->_indicator];
  [(UIActivityIndicatorView *)self->_indicator startAnimating];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKIssuerProvisioningExtensionAuthorizationPlaceholderViewController;
  [(PKIssuerProvisioningExtensionAuthorizationPlaceholderViewController *)&v5 viewWillLayoutSubviews];
  v3 = [(PKIssuerProvisioningExtensionAuthorizationPlaceholderViewController *)self view];
  [v3 bounds];
  [v3 safeAreaInsets];
  indicator = self->_indicator;
  [(UIActivityIndicatorView *)indicator frame];
  PKSizeAlignedInRect();
  -[UIActivityIndicatorView setFrame:](indicator, "setFrame:");
}

- (void).cxx_destruct
{
}

@end