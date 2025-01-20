@interface ACMSignInDialogSimple
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (NSString)accountNameFieldPlaceholder;
- (NSString)passwordString;
- (NSString)userNameString;
- (UIButton)cancelButton;
- (UIButton)loginButton;
- (UIColor)backgroundColor;
- (UIColor)licenseTextColor;
- (UIImage)logo;
- (UIView)backgroudView;
- (int64_t)statusBarStyle;
- (unint64_t)verticalShift;
- (void)checkFields;
- (void)dealloc;
- (void)disableControls:(BOOL)a3;
- (void)focus;
- (void)loadView;
- (void)setAccountNameFieldPlaceholder:(id)a3;
- (void)setBackgroudView:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setLicenseTextColor:(id)a3;
- (void)setLogo:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ACMSignInDialogSimple

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(ACMSignInDialog *)self controlsWillChangeState:1];
  v5.receiver = self;
  v5.super_class = (Class)ACMSignInDialogSimple;
  [(ACMSignInDialog *)&v5 viewWillDisappear:v3];
  [(ACMSignInDialog *)self controlsDidChangeState:1];
}

- (void)dealloc
{
  [(UIButton *)self->_cancelButton removeTarget:0 action:0 forControlEvents:64];
  [(UIButton *)self->_loginButton removeTarget:0 action:0 forControlEvents:64];

  self->_cancelButton = 0;
  self->_loginButton = 0;

  self->_licenseTextField = 0;
  [(ACMSignInDialogSimple *)self setLogo:0];
  [(ACMSignInDialogSimple *)self setBackgroundColor:0];
  [(ACMSignInDialogSimple *)self setAccountNameFieldPlaceholder:0];
  v3.receiver = self;
  v3.super_class = (Class)ACMSignInDialogSimple;
  [(ACMSignInDialog *)&v3 dealloc];
}

- (int64_t)statusBarStyle
{
  return 0;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  [[MEMORY[0x263F1C920] mainScreen] bounds];
  id v4 = (id)[v3 initWithFrame:x0];

  [(ACMSignInDialogSimple *)self setView:v4];
}

- (void)checkFields
{
  BOOL v3 = [(ACMSignInDialog *)self canSignIn];
  id v4 = [(ACMSignInDialogSimple *)self loginButton];

  [(UIButton *)v4 setEnabled:v3];
}

- (void)focus
{
  if ([(NSString *)[(UITextField *)[(ACMSignInDialog *)self accountNameField] text] length])
  {
    BOOL v3 = [(ACMSignInDialog *)self passwordField];
  }
  else
  {
    BOOL v3 = [(ACMSignInDialog *)self accountNameField];
  }
  [(UITextField *)v3 becomeFirstResponder];

  [(ACMSignInDialogSimple *)self checkFields];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ACMSignInDialogSimple;
  [(ACMSignInDialog *)&v4 viewWillAppear:a3];
  [(ACMSignInDialogSimple *)self focus];
}

- (void)disableControls:(BOOL)a3
{
  BOOL v3 = a3;
  -[ACMSignInDialog controlsWillChangeState:](self, "controlsWillChangeState:");
  v5.receiver = self;
  v5.super_class = (Class)ACMSignInDialogSimple;
  [(ACMSignInDialog *)&v5 disableControls:v3];
  [(UIButton *)[(ACMSignInDialogSimple *)self loginButton] setEnabled:v3 ^ 1];
  [(UIButton *)[(ACMSignInDialogSimple *)self cancelButton] setEnabled:v3 ^ 1];
  [(UITextField *)[(ACMSignInDialog *)self accountNameField] setEnabled:v3 ^ 1];
  [(UITextField *)[(ACMSignInDialog *)self passwordField] setEnabled:v3 ^ 1];
  if (!v3) {
    [(ACMSignInDialogSimple *)self focus];
  }
  [(ACMSignInDialog *)self controlsDidChangeState:v3];
}

- (unint64_t)verticalShift
{
  if (![(ACMSignInDialogSimple *)self logo]) {
    return 10;
  }
  [(UIImage *)[(ACMSignInDialogSimple *)self logo] size];
  return (unint64_t)(v3 + 10.0);
}

- (NSString)passwordString
{
  v2 = [(ACMSignInDialog *)self passwordField];

  return [(UITextField *)v2 text];
}

- (NSString)userNameString
{
  v2 = [(ACMSignInDialog *)self accountNameField];

  return [(UITextField *)v2 text];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return (objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom")
      || (unint64_t)(a3 - 1) < 2;
}

- (UIImage)logo
{
  return self->_logo;
}

- (void)setLogo:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIView)backgroudView
{
  return self->_backgroudView;
}

- (void)setBackgroudView:(id)a3
{
}

- (NSString)accountNameFieldPlaceholder
{
  return self->_accountNameFieldPlaceholder;
}

- (void)setAccountNameFieldPlaceholder:(id)a3
{
}

- (UIColor)licenseTextColor
{
  return (UIColor *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setLicenseTextColor:(id)a3
{
}

- (UIButton)loginButton
{
  return self->_loginButton;
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

@end