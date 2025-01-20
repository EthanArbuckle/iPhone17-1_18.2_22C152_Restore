@interface ACMSignInDialog
- (ACMSignInDialogDelegate)delegate;
- (BOOL)canSignIn;
- (BOOL)shouldAuthenticateOnUserInput;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)userHasBegunEditingText;
- (NSString)passwordString;
- (NSString)requestedUserName;
- (NSString)userNameString;
- (UITextField)accountNameField;
- (UITextField)passwordField;
- (int64_t)signInDialogState;
- (unint64_t)stateChangeCounter;
- (void)controlsDidChangeState:(BOOL)a3;
- (void)controlsWillChangeState:(BOOL)a3;
- (void)dealloc;
- (void)onIForgot:(id)a3;
- (void)onSignIn:(id)a3;
- (void)onSignInCancel:(id)a3;
- (void)setAccountNameField:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPasswordField:(id)a3;
- (void)setPasswordString:(id)a3;
- (void)setRequestedUserName:(id)a3;
- (void)setSignInDialogState:(int64_t)a3;
- (void)setStateChangeCounter:(unint64_t)a3;
- (void)setUserHasBegunEditingText:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ACMSignInDialog

- (void)dealloc
{
  [(UITextField *)self->_accountNameField setDelegate:0];
  [(UITextField *)self->_passwordField setDelegate:0];

  self->_accountNameField = 0;
  self->_passwordField = 0;
  v3.receiver = self;
  v3.super_class = (Class)ACMSignInDialog;
  [(ACMDialog *)&v3 dealloc];
}

- (NSString)passwordString
{
  v2 = [(ACMSignInDialog *)self passwordField];

  return [(UITextField *)v2 text];
}

- (void)setPasswordString:(id)a3
{
  v4 = [(ACMSignInDialog *)self passwordField];

  [(UITextField *)v4 setText:a3];
}

- (NSString)userNameString
{
  v2 = [(ACMSignInDialog *)self accountNameField];

  return [(UITextField *)v2 text];
}

- (BOOL)canSignIn
{
  NSUInteger v3 = [(NSString *)[(UITextField *)[(ACMSignInDialog *)self passwordField] text] length];
  if (v3)
  {
    if ([(ACMSignInDialog *)self accountNameField]) {
      LOBYTE(v3) = [(NSString *)[(UITextField *)[(ACMSignInDialog *)self accountNameField] text] length] != 0;
    }
    else {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)controlsWillChangeState:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(ACMSignInDialog *)self stateChangeCounter])
  {
    uint64_t v5 = v3 ? 4 : 3;
    if ([(ACMSignInDialog *)self signInDialogState] != v5
      && ([(ACMSignInDialog *)self signInDialogState] != 2 || !v3)
      && ([(ACMSignInDialog *)self signInDialogState] != 1 || v3))
    {
      v6 = &selRef_signInDialogWillBecomeDisabled;
      if (!v3) {
        v6 = &selRef_signInDialogWillBecomeEnabled;
      }
      [(ACMSignInDialogDelegate *)[(ACMSignInDialog *)self delegate] performSelector:*v6];
      [(ACMSignInDialog *)self setSignInDialogState:v5];
    }
  }
  unint64_t v7 = [(ACMSignInDialog *)self stateChangeCounter] + 1;

  [(ACMSignInDialog *)self setStateChangeCounter:v7];
}

- (void)controlsDidChangeState:(BOOL)a3
{
  BOOL v3 = a3;
  [(ACMSignInDialog *)self setStateChangeCounter:[(ACMSignInDialog *)self stateChangeCounter] - 1];
  if (![(ACMSignInDialog *)self stateChangeCounter])
  {
    uint64_t v5 = v3 ? 2 : 1;
    if ([(ACMSignInDialog *)self signInDialogState] != v5)
    {
      v6 = &selRef_signInDialogDidBecomeDisabled;
      if (!v3) {
        v6 = &selRef_signInDialogDidBecomeEnabled;
      }
      [(ACMSignInDialogDelegate *)[(ACMSignInDialog *)self delegate] performSelector:*v6];
      [(ACMSignInDialog *)self setSignInDialogState:v5];
    }
  }
}

- (BOOL)shouldAuthenticateOnUserInput
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(ACMSignInDialog *)self controlsWillChangeState:0];
  v5.receiver = self;
  v5.super_class = (Class)ACMSignInDialog;
  [(ACMDialog *)&v5 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ACMSignInDialog;
  [(ACMDialog *)&v4 viewDidAppear:a3];
  [(ACMSignInDialog *)self controlsDidChangeState:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(ACMSignInDialog *)self controlsWillChangeState:1];
  v5.receiver = self;
  v5.super_class = (Class)ACMSignInDialog;
  [(ACMDialog *)&v5 viewWillDisappear:v3];
  [(ACMSignInDialog *)self controlsDidChangeState:1];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  if ([(ACMSignInDialog *)self accountNameField] == a3)
  {
    [(UITextField *)[(ACMSignInDialog *)self accountNameField] resignFirstResponder];
    [(UITextField *)[(ACMSignInDialog *)self passwordField] becomeFirstResponder];
  }
  BOOL v5 = [(ACMSignInDialog *)self shouldAuthenticateOnUserInput];
  v6 = [(ACMSignInDialog *)self passwordField];
  unint64_t v7 = [(ACMSignInDialog *)self passwordField];
  if (v6 != a3 || v5)
  {
    if (v7 == a3 && [(ACMSignInDialog *)self canSignIn])
    {
      [(UITextField *)[(ACMSignInDialog *)self passwordField] resignFirstResponder];
      [(ACMSignInDialogDelegate *)[(ACMSignInDialog *)self delegate] onSignIn:[(ACMSignInDialog *)self passwordField]];
    }
  }
  else
  {
    [(UITextField *)v7 resignFirstResponder];
  }
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  if ([(ACMSignInDialog *)self passwordField] == a3) {
    uint64_t v9 = 32;
  }
  else {
    uint64_t v9 = 0;
  }
  if ([(ACMSignInDialog *)self accountNameField] == a3) {
    unint64_t v10 = 128;
  }
  else {
    unint64_t v10 = v9;
  }
  NSUInteger v11 = [[(id)objc_msgSend(a3, "text") length] - length];
  return v11 + [a5 length] <= v10;
}

- (void)onIForgot:(id)a3
{
  if ([(ACMSignInDialog *)self delegate])
  {
    BOOL v5 = [(ACMSignInDialog *)self delegate];
    [(ACMSignInDialogDelegate *)v5 onSignIn:a3];
  }
}

- (void)onSignIn:(id)a3
{
  if ([(ACMSignInDialog *)self delegate])
  {
    BOOL v5 = [(ACMSignInDialog *)self delegate];
    [(ACMSignInDialogDelegate *)v5 onSignIn:a3];
  }
}

- (void)onSignInCancel:(id)a3
{
  if ([(ACMSignInDialog *)self delegate])
  {
    BOOL v5 = [(ACMSignInDialog *)self delegate];
    [(ACMSignInDialogDelegate *)v5 onSignInCancel:a3];
  }
}

- (ACMSignInDialogDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ACMSignInDialogDelegate *)a3;
}

- (NSString)requestedUserName
{
  return self->_requestedUserName;
}

- (void)setRequestedUserName:(id)a3
{
}

- (int64_t)signInDialogState
{
  return self->_signInDialogState;
}

- (void)setSignInDialogState:(int64_t)a3
{
  self->_signInDialogState = a3;
}

- (UITextField)accountNameField
{
  return self->_accountNameField;
}

- (void)setAccountNameField:(id)a3
{
}

- (UITextField)passwordField
{
  return self->_passwordField;
}

- (void)setPasswordField:(id)a3
{
}

- (BOOL)userHasBegunEditingText
{
  return self->_userHasBegunEditingText;
}

- (void)setUserHasBegunEditingText:(BOOL)a3
{
  self->_userHasBegunEditingText = a3;
}

- (unint64_t)stateChangeCounter
{
  return self->_stateChangeCounter;
}

- (void)setStateChangeCounter:(unint64_t)a3
{
  self->_stateChangeCounter = a3;
}

@end