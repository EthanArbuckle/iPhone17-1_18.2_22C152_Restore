@interface ACMiTunesSignInDialog_Modern
- (BOOL)isPresented;
- (BOOL)shouldPasswordTextFieldReturnOnSignInDisallowed;
- (BOOL)textFieldShouldReturn:(id)a3;
- (void)alertView:(id)a3 clickedButtonAtIndex:(int64_t)a4;
- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4;
- (void)didPresentAlertView:(id)a3;
- (void)loadView;
- (void)setIsPresented:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ACMiTunesSignInDialog_Modern

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)ACMiTunesSignInDialog_Modern;
  [(ACMiTunesSignInDialog *)&v8 loadView];
  id v3 = [(ACMiTunesSignInDialog *)self dialogTitle];
  id v4 = objc_alloc(MEMORY[0x263F1C400]);
  if ([(ACMiTunesSignInDialog *)self isUserNameEditable]
    || ![(NSString *)[(ACMSignInDialog *)self requestedUserName] length])
  {
    v5 = 0;
  }
  else
  {
    v5 = [(ACMSignInDialog *)self requestedUserName];
  }
  id v6 = (id)[v4 initWithTitle:v3 message:v5 delegate:self cancelButtonTitle:[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", @"Cancel") otherButtonTitles:[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", @"Sign In")];
  if ([(ACMiTunesSignInDialog *)self isUserNameEditable]) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 1;
  }
  [v6 setAlertViewStyle:v7];
  [(ACMiTunesSignInDialog_Modern *)self setView:v6];
}

- (void)viewDidLoad
{
  id v3 = (void *)[(ACMiTunesSignInDialog_Modern *)self view];
  -[ACMSignInDialog setPasswordField:](self, "setPasswordField:", [v3 textFieldAtIndex:[v3 alertViewStyle]]);
  [(UITextField *)[(ACMSignInDialog *)self passwordField] setDelegate:self];
  [(UITextField *)[(ACMSignInDialog *)self passwordField] setPlaceholder:+[ACMBaseLocale localizedString:@"Password"]];
  if ([ACMAppleConnectImplComponents components].systemInfo.isPreRelease) {
    [[ACMSignInDialog passwordField].placeholder stringByAppendingString:@" (PRE-RELEASE)"]
}
  [(UITextField *)[(ACMSignInDialog *)self passwordField] setClearButtonMode:1];
  }
  [(UITextField *)[(ACMSignInDialog *)self passwordField] setReturnKeyType:1];
  [(UITextField *)[(ACMSignInDialog *)self passwordField] setKeyboardAppearance:0];
  if ([v3 alertViewStyle] == 3)
  {
    -[ACMSignInDialog setAccountNameField:](self, "setAccountNameField:", [v3 textFieldAtIndex:0]);
    [(UITextField *)[(ACMSignInDialog *)self accountNameField] setPlaceholder:+[ACMBaseLocale localizedString:@"Apple ID"]];
    if ([ACMAppleConnectImplComponents components].systemInfo.isPreRelease) {
    [[ACMSignInDialog accountNameField].placeholder stringByAppendingString:@" (PRE-RELEASE)"]
}
    [(UITextField *)[(ACMSignInDialog *)self accountNameField] setDelegate:self];
    }
    [(UITextField *)[(ACMSignInDialog *)self accountNameField] setClearButtonMode:1];
    [(UITextField *)[(ACMSignInDialog *)self accountNameField] setKeyboardAppearance:0];
    [(UITextField *)[(ACMSignInDialog *)self accountNameField] setKeyboardType:7];
    [(UITextField *)[(ACMSignInDialog *)self accountNameField] setReturnKeyType:4];
    [(UITextField *)[(ACMSignInDialog *)self accountNameField] setText:[(ACMSignInDialog *)self requestedUserName]];
  }
  v4.receiver = self;
  v4.super_class = (Class)ACMiTunesSignInDialog_Modern;
  [(ACMiTunesSignInDialog *)&v4 viewDidLoad];
}

- (BOOL)shouldPasswordTextFieldReturnOnSignInDisallowed
{
  return 0;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  if ([(ACMSignInDialog *)self passwordField] != a3)
  {
    [(ACMiTunesSignInDialog *)self handleTextFieldShouldReturnOnNonPasswordField];
    return 1;
  }
  if ([(ACMSignInDialog *)self canSignIn])
  {
    [(UIAlertView *)[(ACMiTunesSignInDialog *)self signInDialog] dismissWithClickedButtonIndex:1 animated:1];
    return 1;
  }

  return [(ACMiTunesSignInDialog_Modern *)self shouldPasswordTextFieldReturnOnSignInDisallowed];
}

- (void)alertView:(id)a3 clickedButtonAtIndex:(int64_t)a4
{
  uint64_t v7 = [(ACMiTunesSignInDialog *)self signInDialog];
  if (!a4 && v7 == a3)
  {
    [(ACMSignInDialog *)self controlsWillChangeState:1];
    [(ACMSignInDialog *)self controlsDidChangeState:1];
    objc_super v8 = [(ACMSignInDialog *)self delegate];
    [(ACMSignInDialogDelegate *)v8 onSignInCancel:a3];
  }
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  uint64_t v7 = [(ACMiTunesSignInDialog *)self signInDialog];
  if (a4 == 1 && v7 == a3)
  {
    if ([(ACMiTunesSignInDialog *)self isUserNameEditable]) {
      [(ACMSignInDialog *)self setRequestedUserName:[(UITextField *)[(ACMSignInDialog *)self accountNameField] text]];
    }
    [(ACMSignInDialogDelegate *)[(ACMSignInDialog *)self delegate] onSignIn:a3];
  }
  [(ACMiTunesSignInDialog_Modern *)self setView:0];

  [(ACMiTunesSignInDialog_Modern *)self setIsPresented:0];
}

- (void)didPresentAlertView:(id)a3
{
  if ([(ACMiTunesSignInDialog *)self signInDialog] == a3
    && ![(ACMiTunesSignInDialog_Modern *)self isPresented])
  {
    [(ACMiTunesSignInDialog_Modern *)self setIsPresented:1];
    objc_super v4 = [(ACMSignInDialog *)self passwordField];
    if ([(ACMSignInDialog *)self accountNameField]
      && ![(NSString *)[(UITextField *)[(ACMSignInDialog *)self accountNameField] text] length])
    {
      objc_super v4 = [(ACMSignInDialog *)self accountNameField];
    }
    if (v4 == [(ACMSignInDialog *)self passwordField])
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __52__ACMiTunesSignInDialog_Modern_didPresentAlertView___block_invoke;
      v5[3] = &unk_265043B90;
      v5[4] = v4;
      dispatch_async_on_main_thread((uint64_t)v5);
    }
  }
}

- (BOOL)isPresented
{
  return self->_isPresented;
}

- (void)setIsPresented:(BOOL)a3
{
  self->_isPresented = a3;
}

@end