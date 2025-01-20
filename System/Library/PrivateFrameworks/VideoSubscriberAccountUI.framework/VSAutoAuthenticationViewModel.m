@interface VSAutoAuthenticationViewModel
- (NSString)accountName;
- (NSString)manualSignInButtonText;
- (NSString)manualSignInTitle;
- (NSString)messageTitle;
- (VSAutoAuthenticationViewModel)init;
- (VSAutoAuthenticationViewModelDelegate)delegate;
- (void)configureWithRequest:(id)a3;
- (void)didSelectManualSignInButton;
- (void)setAccountName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setManualSignInButtonText:(id)a3;
- (void)setManualSignInTitle:(id)a3;
- (void)setMessageTitle:(id)a3;
@end

@implementation VSAutoAuthenticationViewModel

- (VSAutoAuthenticationViewModel)init
{
  v7.receiver = self;
  v7.super_class = (Class)VSAutoAuthenticationViewModel;
  v2 = [(VSCuratedViewModel *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(VSCuratedViewModel *)v2 setBeginValidationButtonEnabled:1];
    v4 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    v5 = [v4 localizedStringForKey:@"CONTINUE" value:0 table:0];
    [(VSCuratedViewModel *)v3 setBeginValidationButtonTitle:v5];
  }
  return v3;
}

- (void)didSelectManualSignInButton
{
  id v3 = [(VSAutoAuthenticationViewModel *)self delegate];
  [v3 autoAuthenticationViewModelDidManualSignInButton:self];
}

- (void)configureWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [(VSViewModel *)self identityProvider];
  v6 = [v5 displayName];
  objc_super v7 = [v6 forceUnwrapObject];
  [(VSViewModel *)self setTitle:v7];

  v8.receiver = self;
  v8.super_class = (Class)VSAutoAuthenticationViewModel;
  [(VSCuratedViewModel *)&v8 configureWithRequest:v4];
}

- (VSAutoAuthenticationViewModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSAutoAuthenticationViewModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)messageTitle
{
  return self->_messageTitle;
}

- (void)setMessageTitle:(id)a3
{
}

- (NSString)accountName
{
  return self->_accountName;
}

- (void)setAccountName:(id)a3
{
}

- (NSString)manualSignInTitle
{
  return self->_manualSignInTitle;
}

- (void)setManualSignInTitle:(id)a3
{
}

- (NSString)manualSignInButtonText
{
  return self->_manualSignInButtonText;
}

- (void)setManualSignInButtonText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manualSignInButtonText, 0);
  objc_storeStrong((id *)&self->_manualSignInTitle, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_messageTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end