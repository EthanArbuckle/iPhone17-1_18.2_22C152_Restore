@interface ACMSignInWidget
- (ACMSignInWidgetDelegate)delegate;
- (BOOL)shouldAuthenticateOnUserInput;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CGPoint)position;
- (NSDictionary)placeholderAttributes;
- (NSString)accountLabelText;
- (UIColor)backgroundColor;
- (UILabel)accountLabel;
- (UILabel)passwordLabel;
- (UITableView)table;
- (UITableViewCell)accountEditCell;
- (UITableViewCell)passwordEditCell;
- (UITextField)accountField;
- (UITextField)passwordField;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)disableControls:(BOOL)a3;
- (void)onSignIn:(id)a3;
- (void)setAccountField:(id)a3;
- (void)setAccountLabelText:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPasswordField:(id)a3;
- (void)setPlaceholderAttributes:(id)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setShouldAuthenticateOnUserInput:(BOOL)a3;
@end

@implementation ACMSignInWidget

- (void)dealloc
{
  [(UITableView *)self->_table setDelegate:0];
  [(UITableView *)self->_table setDataSource:0];
  [(UITableView *)self->_table removeFromSuperview];

  self->_table = 0;
  self->_accountLabel = 0;
  [(UITextField *)[(ACMSignInWidget *)self accountField] setDelegate:0];
  [(UITextField *)[(ACMSignInWidget *)self passwordField] setDelegate:0];
  [(ACMSignInWidget *)self setAccountField:0];
  [(ACMSignInWidget *)self setPasswordField:0];
  [(ACMSignInWidget *)self setBackgroundColor:0];
  [(ACMSignInWidget *)self setPlaceholderAttributes:0];
  v3.receiver = self;
  v3.super_class = (Class)ACMSignInWidget;
  [(ACMSignInWidget *)&v3 dealloc];
}

- (CGPoint)position
{
  v2 = [(ACMSignInWidget *)self table];

  [(UITableView *)v2 frame];
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UITableView *)[(ACMSignInWidget *)self table] frame];
  double v7 = v6;
  double v9 = v8;
  v10 = [(ACMSignInWidget *)self table];

  -[UITableView setFrame:](v10, "setFrame:", x, y, v7, v9);
}

- (UITableView)table
{
  CGPoint result = self->_table;
  if (!result)
  {
    double v4 = (UITableView *)[objc_alloc(MEMORY[0x263F1CA40]) initWithFrame:1, 0.0, 0.0, 320.0, 112.0];
    self->_table = v4;
    [(UITableView *)v4 setDelegate:self];
    [(UITableView *)self->_table setDataSource:self];
    [(UITableView *)self->_table setScrollEnabled:0];
    [(UITableView *)self->_table setShowsHorizontalScrollIndicator:0];
    [(UITableView *)self->_table setShowsVerticalScrollIndicator:0];
    -[UITableView setBackgroundColor:](self->_table, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
    char v5 = objc_opt_respondsToSelector();
    CGPoint result = self->_table;
    if (v5)
    {
      [(UITableView *)result setBackgroundView:0];
      return self->_table;
    }
  }
  return result;
}

- (NSString)accountLabelText
{
  v2 = [(ACMSignInWidget *)self accountLabel];

  return [(UILabel *)v2 text];
}

- (void)setAccountLabelText:(id)a3
{
  double v4 = [(ACMSignInWidget *)self accountLabel];

  [(UILabel *)v4 setText:a3];
}

- (UITextField)accountField
{
  CGPoint result = self->_accountField;
  if (!result)
  {
    [(ACMSignInWidget *)self accountEditCell];
    return self->_accountField;
  }
  return result;
}

- (void)setAccountField:(id)a3
{
  accountField = self->_accountField;
  if (accountField != a3)
  {
    double v6 = accountField;
    self->_accountField = (UITextField *)a3;
  }
}

- (UITextField)passwordField
{
  CGPoint result = self->_passwordField;
  if (!result)
  {
    [(ACMSignInWidget *)self passwordEditCell];
    return self->_passwordField;
  }
  return result;
}

- (void)setPasswordField:(id)a3
{
  passwordField = self->_passwordField;
  if (passwordField != a3)
  {
    double v6 = passwordField;
    self->_passwordField = (UITextField *)a3;
  }
}

- (UILabel)accountLabel
{
  CGPoint result = self->_accountLabel;
  if (!result)
  {
    self->_accountLabel = (UILabel *)[objc_alloc(MEMORY[0x263F1C768]) initWithFrame:8.0, 7.0, 120.0, 30.0];
    [(UILabel *)self->_accountLabel setText:+[ACMBaseLocale localizedString:@"Apple ID"]];
    [(UILabel *)self->_accountLabel setTextAlignment:0];
    -[UILabel setTextColor:](self->_accountLabel, "setTextColor:", [MEMORY[0x263F1C550] blackColor]);
    [(UILabel *)self->_accountLabel setUserInteractionEnabled:0];
    -[UILabel setBackgroundColor:](self->_accountLabel, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
    return self->_accountLabel;
  }
  return result;
}

- (UILabel)passwordLabel
{
  v2 = (UILabel *)[objc_alloc(MEMORY[0x263F1C768]) initWithFrame:8.0, 7.0, 120.0, 30.0];
  [(UILabel *)v2 setText:+[ACMBaseLocale localizedString:@"Password"]];
  [(UILabel *)v2 setTextAlignment:0];
  -[UILabel setTextColor:](v2, "setTextColor:", [MEMORY[0x263F1C550] blackColor]);
  -[UILabel setFont:](v2, "setFont:", [MEMORY[0x263F1C658] boldSystemFontOfSize:16.0]);
  [(UILabel *)v2 setUserInteractionEnabled:0];
  -[UILabel setBackgroundColor:](v2, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
  [(UILabel *)v2 setTag:130];
  return v2;
}

- (UITableViewCell)accountEditCell
{
  CGPoint result = self->_accountEditCell;
  if (!result)
  {
    double v4 = (UITableViewCell *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"ACMAccountCell"];
    self->_accountEditCell = v4;
    -[UITableViewCell setFrame:](v4, "setFrame:", 0.0, 0.0, 320.0, 40.0);
    char v5 = [(ACMSignInWidget *)self accountLabel];
    id v6 = objc_alloc(MEMORY[0x263F1CA98]);
    double v7 = 128.0;
    if (!v5) {
      double v7 = 8.0;
    }
    double v8 = 304.0;
    if (v5) {
      double v8 = 168.0;
    }
    double v9 = [v6 initWithFrame:v7, 6.0, v8, 31.0];
    [v9 setPlaceholder:[+[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", @"john.appleseed")]];
    if ([ACMAppleConnectImplComponents components].systemInfo.isPreRelease) {
    [v9 setTextAlignment:0];
    }
    [v9 setBorderStyle:0];
    [v9 setTextColor:[MEMORY[0x263F1C550] blackColor]];
    [v9 setReturnKeyType:4];
    [v9 setContentVerticalAlignment:0];
    [v9 setAutocapitalizationType:0];
    [v9 setAutocorrectionType:1];
    [v9 setClearButtonMode:1];
    [v9 setTag:128];
    [v9 setDelegate:self];
    [(ACMSignInWidget *)self setAccountField:v9];
    [(UITextField *)[(ACMSignInWidget *)self accountField] setKeyboardType:7];
    if (v5) {
      [(UIView *)[(UITableViewCell *)self->_accountEditCell contentView] addSubview:v5];
    }
    [(UIView *)[(UITableViewCell *)self->_accountEditCell contentView] addSubview:v9];
    [(UITableViewCell *)self->_accountEditCell setSelectionStyle:0];
    return self->_accountEditCell;
  }
  return result;
}

- (UITableViewCell)passwordEditCell
{
  CGPoint result = self->_passwordEditCell;
  if (!result)
  {
    double v4 = (UITableViewCell *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"ACMPasswordCell"];
    self->_passwordEditCell = v4;
    -[UITableViewCell setFrame:](v4, "setFrame:", 0.0, 0.0, 320.0, 40.0);
    char v5 = [(ACMSignInWidget *)self passwordLabel];
    id v6 = objc_alloc(MEMORY[0x263F1CA98]);
    double v7 = 128.0;
    if (!v5) {
      double v7 = 8.0;
    }
    double v8 = 304.0;
    if (v5) {
      double v8 = 168.0;
    }
    double v9 = [v6 initWithFrame:v7, 6.0, v8, 31.0];
    [v9 setPlaceholder:[+[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", @"Required")]];
    if ([ACMAppleConnectImplComponents components].systemInfo.isPreRelease) {
    [v9 setPlaceholder:[v9 placeholder].stringByAppendingString:@" (PRE-RELEASE)"]
}
    [v9 setTextAlignment:0];
    }
    [v9 setBorderStyle:0];
    [v9 setTextColor:[MEMORY[0x263F1C550] blackColor]];
    [v9 setSecureTextEntry:1];
    [v9 setReturnKeyType:1];
    [v9 setContentVerticalAlignment:0];
    [v9 setEnablesReturnKeyAutomatically:0];
    [v9 setClearButtonMode:1];
    [v9 setTag:129];
    [v9 setDelegate:self];
    [(ACMSignInWidget *)self setPasswordField:v9];
    if (v5) {
      [(UIView *)[(UITableViewCell *)self->_passwordEditCell contentView] addSubview:v5];
    }
    [(UIView *)[(UITableViewCell *)self->_passwordEditCell contentView] addSubview:v9];
    [(UITableViewCell *)self->_passwordEditCell setSelectionStyle:0];
    return self->_passwordEditCell;
  }
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  if (objc_msgSend(a4, "row", a3))
  {
    return [(ACMSignInWidget *)self passwordEditCell];
  }
  else
  {
    return [(ACMSignInWidget *)self accountEditCell];
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  if ([(ACMSignInWidget *)self accountField] == a3)
  {
    [(UITextField *)[(ACMSignInWidget *)self accountField] resignFirstResponder];
    [(UITextField *)[(ACMSignInWidget *)self passwordField] becomeFirstResponder];
  }
  if ([(ACMSignInWidget *)self passwordField] == a3
    && ![(ACMSignInWidget *)self shouldAuthenticateOnUserInput])
  {
    [(UITextField *)[(ACMSignInWidget *)self passwordField] resignFirstResponder];
  }
  else if ([(ACMSignInWidget *)self passwordField] == a3 {
         && [(NSString *)[(UITextField *)[(ACMSignInWidget *)self passwordField] text] length]&& [(NSString *)[(UITextField *)[(ACMSignInWidget *)self accountField] text] length])
  }
  {
    [(UITextField *)[(ACMSignInWidget *)self passwordField] resignFirstResponder];
    [(ACMSignInWidget *)self onSignIn:[(ACMSignInWidget *)self passwordField]];
  }
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  uint64_t v9 = 32 * ([(ACMSignInWidget *)self passwordField] == a3);
  if ([(ACMSignInWidget *)self accountField] == a3) {
    unint64_t v10 = 128;
  }
  else {
    unint64_t v10 = v9;
  }
  NSUInteger v11 = [[(id)objc_msgSend(a3, "text") length] - length];
  return v11 + [a5 length] <= v10;
}

- (void)disableControls:(BOOL)a3
{
  if (a3)
  {
    if ([(UITextField *)[(ACMSignInWidget *)self passwordField] isFirstResponder])[(UITextField *)[(ACMSignInWidget *)self passwordField] resignFirstResponder]; {
    if ([(UITextField *)[(ACMSignInWidget *)self accountField] isFirstResponder])[(UITextField *)[(ACMSignInWidget *)self accountField] resignFirstResponder];
    }
    [(UITextField *)[(ACMSignInWidget *)self accountField] setEnabled:0];
    double v4 = [(ACMSignInWidget *)self passwordField];
    [(UITextField *)v4 setEnabled:0];
  }
  else
  {
    [(UITextField *)[(ACMSignInWidget *)self accountField] setEnabled:1];
    [(UITextField *)[(ACMSignInWidget *)self passwordField] setEnabled:1];
    char v5 = [(ACMSignInWidget *)self accountField];
    id v6 = [(ACMSignInWidget *)self passwordField];
    if ([(NSString *)[(UITextField *)[(ACMSignInWidget *)self accountField] text] length])
    {
      char v5 = [(ACMSignInWidget *)self passwordField];
      id v6 = [(ACMSignInWidget *)self accountField];
    }
    if (([(UITextField *)v5 isFirstResponder] & 1) == 0)
    {
      [(UITextField *)v6 resignFirstResponder];
      [(UITextField *)v5 becomeFirstResponder];
    }
  }
}

- (void)onSignIn:(id)a3
{
  double v4 = [(ACMSignInWidget *)self delegate];

  [(ACMSignInWidgetDelegate *)v4 onSignIn:self];
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

- (NSDictionary)placeholderAttributes
{
  return self->_placeholderAttributes;
}

- (void)setPlaceholderAttributes:(id)a3
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

uint64_t __56__ACMSignInWidget_Modern_createClearButtonForEditField___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) textColor];
  double v3 = *(void **)(a1 + 32);

  return [v3 setTintColor:v2];
}

@end