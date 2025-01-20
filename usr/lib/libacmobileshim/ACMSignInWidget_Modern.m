@interface ACMSignInWidget_Modern
- (ACMSignInWidgetDelegate)delegate;
- (BOOL)hideMargin;
- (BOOL)hideTopSeparator;
- (BOOL)shouldAuthenticateOnUserInput;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CGPoint)position;
- (NSDictionary)placeholderAttributes;
- (NSString)accountLabelText;
- (UIButton)accountClearButton;
- (UIButton)passwordClearButton;
- (UIColor)backgroundColor;
- (UITextField)accountField;
- (UITextField)passwordField;
- (UIView)view;
- (double)leftMargin;
- (id)clearButtonImage;
- (id)createClearButtonForEditField:(id)a3;
- (id)textFieldFont;
- (void)applyPlaceholderAttributes;
- (void)clearTextField:(id)a3;
- (void)dealloc;
- (void)disableControls:(BOOL)a3;
- (void)setAccountClearButton:(id)a3;
- (void)setAccountLabelText:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHideMargin:(BOOL)a3;
- (void)setHideTopSeparator:(BOOL)a3;
- (void)setPasswordClearButton:(id)a3;
- (void)setPlaceholderAttributes:(id)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setShouldAuthenticateOnUserInput:(BOOL)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)touchIn:(id)a3;
- (void)touchOut:(id)a3;
@end

@implementation ACMSignInWidget_Modern

- (void)dealloc
{
  [objc_msgSend(MEMORY[0x263F08A00], "defaultCenter") removeObserver:self];
  [(UITextField *)[(ACMSignInWidget_Modern *)self accountField] setDelegate:0];

  self->_accountField = 0;
  [(UITextField *)[(ACMSignInWidget_Modern *)self passwordField] setDelegate:0];

  self->_passwordField = 0;
  self->_view = 0;
  [(ACMSignInWidget_Modern *)self setAccountLabelText:0];
  [(ACMSignInWidget_Modern *)self setBackgroundColor:0];
  [(ACMSignInWidget_Modern *)self setPlaceholderAttributes:0];
  [(UIButton *)[(ACMSignInWidget_Modern *)self accountClearButton] removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  [(UIButton *)[(ACMSignInWidget_Modern *)self passwordClearButton] removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  [(ACMSignInWidget_Modern *)self setAccountClearButton:0];
  [(ACMSignInWidget_Modern *)self setPasswordClearButton:0];
  v3.receiver = self;
  v3.super_class = (Class)ACMSignInWidget_Modern;
  [(ACMSignInWidget_Modern *)&v3 dealloc];
}

- (double)leftMargin
{
  BOOL v2 = [(ACMSignInWidget_Modern *)self hideMargin];
  double result = 15.0;
  if (v2) {
    return 0.0;
  }
  return result;
}

- (UIView)view
{
  double result = self->_view;
  if (!result)
  {
    uint64_t v4 = [MEMORY[0x263F1C550] colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.46];
    id v5 = objc_alloc(MEMORY[0x263F1CB60]);
    [(ACMSignInWidget_Modern *)self position];
    double v7 = v6;
    [(ACMSignInWidget_Modern *)self position];
    double v9 = v8;
    [[(id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen") scale];
    v11 = (UIView *)[v5 initWithFrame:v7, v9, 320.0, dbl_23EC324D0[v10 > 1.0] * 2.0 + 0.0];
    self->_view = v11;
    [(UIView *)v11 setAutoresizingMask:34];
    [(UITextField *)[(ACMSignInWidget_Modern *)self accountField] setAutoresizingMask:34];
    [(UITextField *)[(ACMSignInWidget_Modern *)self accountField] frame];
    double v13 = v12;
    double v15 = v14;
    [((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen")) scale];
    if (v16 <= 1.0) {
      double v17 = 1.0;
    }
    else {
      double v17 = 0.5;
    }
    if (![(ACMSignInWidget_Modern *)self hideTopSeparator])
    {
      id v18 = objc_alloc(MEMORY[0x263F1CB60]);
      [(UIView *)[(ACMSignInWidget_Modern *)self view] frame];
      id v19 = (id)[v18 initWithFrame:0.0, v13];
      [v19 setAutoresizingMask:34];
      [v19 setBackgroundColor:v4];
      [(UIView *)self->_view addSubview:v19];
    }
    [(UIView *)self->_view addSubview:[(ACMSignInWidget_Modern *)self accountField]];
    id v20 = objc_alloc(MEMORY[0x263F1CB60]);
    [(ACMSignInWidget_Modern *)self leftMargin];
    double v22 = v21;
    double v23 = v13 + v15;
    [(UIView *)[(ACMSignInWidget_Modern *)self view] frame];
    double v25 = v24;
    [(ACMSignInWidget_Modern *)self leftMargin];
    id v27 = (id)[v20 initWithFrame:v22, v23, v25 - v26, v17];
    [v27 setAutoresizingMask:34];
    [v27 setBackgroundColor:v4];
    [(UIView *)self->_view addSubview:v27];
    [(UITextField *)[(ACMSignInWidget_Modern *)self passwordField] setAutoresizingMask:34];
    [(UIView *)self->_view addSubview:[(ACMSignInWidget_Modern *)self passwordField]];
    [(UITextField *)[(ACMSignInWidget_Modern *)self passwordField] frame];
    double v29 = v28;
    double v31 = v30;
    id v32 = objc_alloc(MEMORY[0x263F1CB60]);
    [(UIView *)[(ACMSignInWidget_Modern *)self view] frame];
    id v33 = (id)[v32 initWithFrame:0.0, v29 + v31];
    [v33 setAutoresizingMask:34];
    [v33 setBackgroundColor:v4];
    [(UIView *)self->_view addSubview:v33];
    [(ACMSignInWidget_Modern *)self applyPlaceholderAttributes];
    if ([(ACMSignInWidget_Modern *)self backgroundColor]) {
      v34 = [(ACMSignInWidget_Modern *)self backgroundColor];
    }
    else {
      v34 = (UIColor *)[MEMORY[0x263F1C550] whiteColor];
    }
    [(UIView *)self->_view setBackgroundColor:v34];
    return self->_view;
  }
  return result;
}

- (id)textFieldFont
{
  return (id)[MEMORY[0x263F1C658] fontWithName:@"Helvetica Neue" size:17.0];
}

- (void)applyPlaceholderAttributes
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = *MEMORY[0x263F1C238];
  v9[0] = [(ACMSignInWidget_Modern *)self textFieldFont];
  id v3 = (id)[NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  if ([(ACMSignInWidget_Modern *)self placeholderAttributes])
  {
    id v4 = (id)[v3 mutableCopy];
    [v4 addEntriesFromDictionary:-[ACMSignInWidget_Modern placeholderAttributes](self, "placeholderAttributes")];
    id v3 = (id)[v4 copy];
  }
  if ([(ACMSignInWidget_Modern *)self accountLabelText]) {
    id v5 = [(ACMSignInWidget_Modern *)self accountLabelText];
  }
  else {
    id v5 = +[ACMBaseLocale localizedString:@"Apple ID"];
  }
  double v6 = v5;
  if ([[[ACMAppleConnectImplComponents components] systemInfo] isPreRelease])double v6 = [v6 stringByAppendingString:@" (PRE-RELEASE)"]; {
  -[UITextField setAttributedPlaceholder:](-[ACMSignInWidget_Modern accountField](self, "accountField"), "setAttributedPlaceholder:", (id)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v6 attributes:v3]);
  }
  id v7 = +[ACMBaseLocale localizedString:@"Password"];
  if ([[[ACMAppleConnectImplComponents components] systemInfo] isPreRelease])id v7 = (id)[[v7 stringByAppendingString:@" (PRE-RELEASE)"]
  -[UITextField setAttributedPlaceholder:](-[ACMSignInWidget_Modern passwordField](self, "passwordField"), "setAttributedPlaceholder:", (id)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v7 attributes:v3]);
  }
}

- (void)setPlaceholderAttributes:(id)a3
{
  placeholderAttributes = self->_placeholderAttributes;
  if (placeholderAttributes != a3)
  {

    double v6 = (NSDictionary *)a3;
    self->_placeholderAttributes = v6;
    if (v6)
    {
      [(ACMSignInWidget_Modern *)self applyPlaceholderAttributes];
    }
  }
}

- (id)clearButtonImage
{
  BOOL v2 = (void *)ACMImageWithName(@"buttonClear_iphone.png");

  return (id)[v2 imageWithRenderingMode:2];
}

- (id)createClearButtonForEditField:(id)a3
{
  [a3 setRightViewMode:0];
  [a3 setClearButtonMode:0];
  id v5 = (void *)[MEMORY[0x263F1C488] buttonWithType:0];
  [v5 setImage:-[ACMSignInWidget_Modern clearButtonImage](self, "clearButtonImage") forState:0];
  [v5 addTarget:self action:sel_clearTextField_ forControlEvents:64];
  [v5 addTarget:self action:sel_touchIn_ forControlEvents:17];
  [v5 addTarget:self action:sel_touchOut_ forControlEvents:160];
  [v5 frame];
  [v5 setFrame:];
  [v5 setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, 8.0)];
  dispatch_time_t v6 = dispatch_time(0, 100000000);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__ACMSignInWidget_Modern_createClearButtonForEditField___block_invoke;
  v8[3] = &unk_265043CC8;
  v8[4] = v5;
  v8[5] = a3;
  dispatch_after(v6, MEMORY[0x263EF83A0], v8);
  [a3 setRightView:v5];
  return v5;
}

- (UITextField)accountField
{
  accountField = self->_accountField;
  if (!accountField)
  {
    id v4 = [(ACMSignInWidget_Modern *)self textFieldFont];
    id v5 = objc_alloc(MEMORY[0x263F1CA98]);
    [(ACMSignInWidget_Modern *)self leftMargin];
    double v7 = v6;
    [(ACMSignInWidget_Modern *)self leftMargin];
    double v9 = 320.0 - v8;
    [((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen")) scale];
    accountField = (UITextField *)[v5 initWithFrame:v7, 0.0, v9, dbl_23EC324D0[v10 > 1.0]];
    [(UITextField *)accountField setTextAlignment:0];
    [(UITextField *)accountField setBorderStyle:0];
    [(UITextField *)accountField setReturnKeyType:4];
    [(UITextField *)accountField setContentVerticalAlignment:0];
    [(UITextField *)accountField setAutocapitalizationType:0];
    [(UITextField *)accountField setAutocorrectionType:1];
    [(UITextField *)accountField setClearButtonMode:1];
    [(UITextField *)accountField setTag:128];
    [(UITextField *)accountField setKeyboardType:7];
    [(UITextField *)accountField setDelegate:self];
    [(UITextField *)accountField setFont:v4];
    [(ACMSignInWidget_Modern *)self setAccountClearButton:[(ACMSignInWidget_Modern *)self createClearButtonForEditField:accountField]];
    self->_accountField = accountField;
  }
  return accountField;
}

- (UITextField)passwordField
{
  passwordField = self->_passwordField;
  if (!passwordField)
  {
    id v4 = [(ACMSignInWidget_Modern *)self textFieldFont];
    id v5 = objc_alloc(MEMORY[0x263F1CA98]);
    [(ACMSignInWidget_Modern *)self leftMargin];
    double v7 = v6;
    [(UITextField *)[(ACMSignInWidget_Modern *)self accountField] frame];
    double v9 = v8;
    [(UITextField *)[(ACMSignInWidget_Modern *)self accountField] frame];
    double v11 = v9 + v10 + 0.0;
    [(ACMSignInWidget_Modern *)self leftMargin];
    double v13 = 320.0 - v12;
    [((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen")) scale];
    passwordField = (UITextField *)[v5 initWithFrame:v7, v11, v13, dbl_23EC324D0[v14 > 1.0]];
    [(UITextField *)passwordField setTextAlignment:0];
    [(UITextField *)passwordField setBorderStyle:0];
    [(UITextField *)passwordField setSecureTextEntry:1];
    [(UITextField *)passwordField setReturnKeyType:1];
    [(UITextField *)passwordField setContentVerticalAlignment:0];
    [(UITextField *)passwordField setEnablesReturnKeyAutomatically:0];
    [(UITextField *)passwordField setClearButtonMode:1];
    [(UITextField *)passwordField setTag:129];
    [(UITextField *)passwordField setDelegate:self];
    [(UITextField *)passwordField setFont:v4];
    [(ACMSignInWidget_Modern *)self setPasswordClearButton:[(ACMSignInWidget_Modern *)self createClearButtonForEditField:passwordField]];
    self->_passwordField = passwordField;
  }
  return passwordField;
}

- (void)touchIn:(id)a3
{
  if ([(ACMSignInWidget_Modern *)self accountClearButton] == a3)
  {
    id v5 = [(ACMSignInWidget_Modern *)self accountClearButton];
    double v6 = [(ACMSignInWidget_Modern *)self accountField];
  }
  else if ([(ACMSignInWidget_Modern *)self passwordClearButton] == a3)
  {
    id v5 = [(ACMSignInWidget_Modern *)self passwordClearButton];
    double v6 = [(ACMSignInWidget_Modern *)self passwordField];
  }
  else
  {
    id v5 = 0;
    double v6 = 0;
  }
  uint64_t v7 = [(UIColor *)[(UITextField *)v6 textColor] colorWithAlphaComponent:0.5];

  [(UIButton *)v5 setTintColor:v7];
}

- (void)touchOut:(id)a3
{
  if ([(ACMSignInWidget_Modern *)self accountClearButton] == a3)
  {
    id v5 = [(ACMSignInWidget_Modern *)self accountClearButton];
    double v6 = [(ACMSignInWidget_Modern *)self accountField];
  }
  else if ([(ACMSignInWidget_Modern *)self passwordClearButton] == a3)
  {
    id v5 = [(ACMSignInWidget_Modern *)self passwordClearButton];
    double v6 = [(ACMSignInWidget_Modern *)self passwordField];
  }
  else
  {
    id v5 = 0;
    double v6 = 0;
  }
  uint64_t v7 = [(UITextField *)v6 textColor];

  [(UIButton *)v5 setTintColor:v7];
}

- (void)clearTextField:(id)a3
{
  if ([(ACMSignInWidget_Modern *)self accountClearButton] == a3)
  {
    id v5 = [(ACMSignInWidget_Modern *)self accountClearButton];
    uint64_t v7 = [(ACMSignInWidget_Modern *)self accountField];
  }
  else
  {
    if ([(ACMSignInWidget_Modern *)self passwordClearButton] != a3)
    {
      id v5 = 0;
      double v6 = 0;
      goto LABEL_7;
    }
    id v5 = [(ACMSignInWidget_Modern *)self passwordClearButton];
    uint64_t v7 = [(ACMSignInWidget_Modern *)self passwordField];
  }
  double v6 = v7;
LABEL_7:
  if ([(ACMSignInWidget_Modern *)self textFieldShouldClear:v6])
  {
    [(UITextField *)v6 replaceRange:[(UITextField *)v6 textRangeFromPosition:[(UITextField *)v6 beginningOfDocument] toPosition:[(UITextField *)v6 endOfDocument]] withText:&stru_26F261788];
    [(UITextField *)v6 setRightViewMode:0];
    uint64_t v8 = [(UITextField *)v6 textColor];
    [(UIButton *)v5 setTintColor:v8];
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  if ([(ACMSignInWidget_Modern *)self accountField] == a3)
  {
    [(UITextField *)[(ACMSignInWidget_Modern *)self accountField] resignFirstResponder];
    [(UITextField *)[(ACMSignInWidget_Modern *)self passwordField] becomeFirstResponder];
  }
  if ([(ACMSignInWidget_Modern *)self passwordField] == a3
    && ![(ACMSignInWidget_Modern *)self shouldAuthenticateOnUserInput])
  {
    [(UITextField *)[(ACMSignInWidget_Modern *)self passwordField] resignFirstResponder];
  }
  else if ([(ACMSignInWidget_Modern *)self passwordField] == a3 {
         && [(NSString *)[(UITextField *)[(ACMSignInWidget_Modern *)self passwordField] text] length]&& [(NSString *)[(UITextField *)[(ACMSignInWidget_Modern *)self accountField] text] length])
  }
  {
    [(UITextField *)[(ACMSignInWidget_Modern *)self passwordField] resignFirstResponder];
    [(ACMSignInWidgetDelegate *)[(ACMSignInWidget_Modern *)self delegate] onSignIn:self];
  }
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(a3, "text"), "length")) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 0;
  }

  [a3 setRightViewMode:v4];
}

- (void)textFieldDidEndEditing:(id)a3
{
}

- (BOOL)textFieldShouldClear:(id)a3
{
  uint64_t v5 = [[a3 text] length];

  return -[ACMSignInWidget_Modern textField:shouldChangeCharactersInRange:replacementString:](self, "textField:shouldChangeCharactersInRange:replacementString:", a3, 0, v5, &stru_26F261788);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ([(ACMSignInWidget_Modern *)self passwordField] == a3) {
    uint64_t v10 = 32;
  }
  else {
    uint64_t v10 = 0;
  }
  if ([(ACMSignInWidget_Modern *)self accountField] == a3) {
    unint64_t v11 = 128;
  }
  else {
    unint64_t v11 = v10;
  }
  NSUInteger v12 = [[(id)objc_msgSend(a3, "text") length] - length];
  unint64_t v13 = v12 + [a5 length];
  if (v13 <= v11)
  {
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "text"), "stringByReplacingCharactersInRange:withString:", location, length, a5), "length"))
    {
      uint64_t v14 = 3;
    }
    else
    {
      uint64_t v14 = 0;
    }
    [a3 setRightViewMode:v14];
  }
  return v13 <= v11;
}

- (void)disableControls:(BOOL)a3
{
  if (a3)
  {
    if ([(UITextField *)[(ACMSignInWidget_Modern *)self passwordField] isFirstResponder])[(UITextField *)[(ACMSignInWidget_Modern *)self passwordField] resignFirstResponder]; {
    if ([(UITextField *)[(ACMSignInWidget_Modern *)self accountField] isFirstResponder])[(UITextField *)[(ACMSignInWidget_Modern *)self accountField] resignFirstResponder];
    }
    [(UITextField *)[(ACMSignInWidget_Modern *)self accountField] setEnabled:0];
    uint64_t v4 = [(ACMSignInWidget_Modern *)self passwordField];
    [(UITextField *)v4 setEnabled:0];
  }
  else
  {
    [(UITextField *)[(ACMSignInWidget_Modern *)self accountField] setEnabled:1];
    [(UITextField *)[(ACMSignInWidget_Modern *)self passwordField] setEnabled:1];
    uint64_t v5 = [(ACMSignInWidget_Modern *)self accountField];
    double v6 = [(ACMSignInWidget_Modern *)self passwordField];
    if ([(NSString *)[(UITextField *)[(ACMSignInWidget_Modern *)self accountField] text] length])
    {
      uint64_t v5 = [(ACMSignInWidget_Modern *)self passwordField];
      double v6 = [(ACMSignInWidget_Modern *)self accountField];
    }
    if (([(UITextField *)v5 isFirstResponder] & 1) == 0)
    {
      [(UITextField *)v6 resignFirstResponder];
      [(UITextField *)v5 becomeFirstResponder];
    }
  }
}

- (ACMSignInWidgetDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ACMSignInWidgetDelegate *)a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (NSString)accountLabelText
{
  return self->_accountLabelText;
}

- (void)setAccountLabelText:(id)a3
{
}

- (BOOL)shouldAuthenticateOnUserInput
{
  return self->_shouldAuthenticateOnUserInput;
}

- (void)setShouldAuthenticateOnUserInput:(BOOL)a3
{
  self->_shouldAuthenticateOnUserInput = a3;
}

- (CGPoint)position
{
  double x = self->_position.x;
  double y = self->_position.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->_position = a3;
}

- (NSDictionary)placeholderAttributes
{
  return self->_placeholderAttributes;
}

- (UIButton)accountClearButton
{
  return self->_accountClearButton;
}

- (void)setAccountClearButton:(id)a3
{
}

- (UIButton)passwordClearButton
{
  return self->_passwordClearButton;
}

- (void)setPasswordClearButton:(id)a3
{
}

- (BOOL)hideTopSeparator
{
  return self->_hideTopSeparator;
}

- (void)setHideTopSeparator:(BOOL)a3
{
  self->_hideTopSeparator = a3;
}

- (BOOL)hideMargin
{
  return self->_hideMargin;
}

- (void)setHideMargin:(BOOL)a3
{
  self->_hideMargin = a3;
}

@end