@interface ACMSignInDialogSimple_Legacy
- (ACMSignInDialogSimple_Legacy)initWithNibName:(id)a3 bundle:(id)a4;
- (id)accountNameField;
- (id)cancelButton;
- (id)loginButton;
- (id)passwordField;
- (void)cancelButton;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)loadView;
- (void)loginButton;
@end

@implementation ACMSignInDialogSimple_Legacy

- (ACMSignInDialogSimple_Legacy)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ACMSignInDialogSimple_Legacy;
  return [(ACMSignInDialogSimple_Legacy *)&v5 initWithNibName:a3 bundle:a4];
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F1D778];
  [v3 removeObserver:self name:*MEMORY[0x263F1D778] object:[self passwordField]];
  [objc_msgSend(MEMORY[0x263F08A00], "defaultCenter") removeObserver:self name:v4 object:-[ACMSignInDialogSimple_Legacy accountNameField](self, "accountNameField")];
  v5.receiver = self;
  v5.super_class = (Class)ACMSignInDialogSimple_Legacy;
  [(ACMSignInDialogSimple *)&v5 dealloc];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)ACMSignInDialogSimple_Legacy;
  [(ACMSignInDialogSimple_Legacy *)&v2 didReceiveMemoryWarning];
}

- (void)loadView
{
  __assert_rtn("-[ACMSignInDialogSimple_Legacy loadView]", "ACMSignInDialogSimple_Legacy.m", 46, "nil != self.delegate");
}

- (id)accountNameField
{
  id result = self->super.super._accountNameField;
  if (!result)
  {
    uint64_t v4 = [ACMSimpleTextField alloc];
    [[MEMORY[0x263F1C920] mainScreen] bounds];
    double v6 = v5;
    [MEMORY[0x263F1C5C0] currentDevice];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      double v7 = 348.0;
    }
    else
    {
      double v7 = 280.0;
    }
    double v8 = v6 - v7;
    [MEMORY[0x263F1C5C0] currentDevice];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      double v9 = 118.0;
    }
    else
    {
      double v9 = 75.0;
    }
    double v10 = v8 * 0.5;
    [MEMORY[0x263F1C5C0] currentDevice];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      double v11 = 348.0;
    }
    else
    {
      double v11 = 280.0;
    }
    double v12 = floor(v10);
    [MEMORY[0x263F1C5C0] currentDevice];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      double v13 = 43.0;
    }
    else
    {
      double v13 = 33.0;
    }
    self->super.super._accountNameField = (UITextField *)-[ACMSimpleTextField initWithFrame:](v4, "initWithFrame:", v12, v9, v11, v13);
    if ([(ACMSignInDialogSimple *)self accountNameFieldPlaceholder]) {
      v14 = [(ACMSignInDialogSimple *)self accountNameFieldPlaceholder];
    }
    else {
      v14 = +[ACMBaseLocale localizedString:@"Apple ID"];
    }
    [(UITextField *)self->super.super._accountNameField setPlaceholder:v14];
    if ([ACMAppleConnectImplComponents components].systemInfo.isPreRelease) {
    [self.super.super._accountNameField setPlaceholder:[self.super.super._accountNameField.placeholder stringByAppendingString:@" (PRE-RELEASE)"]];
}
    [(UITextField *)self->super.super._accountNameField setTextAlignment:0];
    }
    -[UITextField setTextColor:](self->super.super._accountNameField, "setTextColor:", [MEMORY[0x263F1C550] blackColor]);
    [(UITextField *)self->super.super._accountNameField setReturnKeyType:4];
    [(UITextField *)self->super.super._accountNameField setContentVerticalAlignment:0];
    [(UITextField *)self->super.super._accountNameField setAutocapitalizationType:0];
    [(UITextField *)self->super.super._accountNameField setAutocorrectionType:1];
    [(UITextField *)self->super.super._accountNameField setClearButtonMode:1];
    v15 = (void *)MEMORY[0x263F1C658];
    [MEMORY[0x263F1C5C0] currentDevice];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (uint64_t v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"),
          double v17 = 22.0,
          !v16))
    {
      double v17 = 18.0;
    }
    -[UITextField setFont:](self->super.super._accountNameField, "setFont:", [v15 systemFontOfSize:v17]);
    [(UITextField *)self->super.super._accountNameField setAutoresizingMask:37];
    [(UITextField *)self->super.super._accountNameField setDelegate:self];
    [(UITextField *)self->super.super._accountNameField setKeyboardType:7];
    [(UITextField *)self->super.super._accountNameField setExclusiveTouch:1];
    return self->super.super._accountNameField;
  }
  return result;
}

- (id)passwordField
{
  id result = self->super.super._passwordField;
  if (!result)
  {
    uint64_t v4 = [ACMSimpleTextField alloc];
    [[(id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen") bounds];
    double v6 = v5;
    [MEMORY[0x263F1C5C0] currentDevice];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      double v7 = 348.0;
    }
    else
    {
      double v7 = 280.0;
    }
    [MEMORY[0x263F1C5C0] currentDevice];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      *(float *)&int v8 = 118.0;
    }
    else
    {
      *(float *)&int v8 = 75.0;
    }
    float v9 = *(float *)&v8;
    [MEMORY[0x263F1C5C0] currentDevice];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      float v10 = 43.0;
    }
    else
    {
      float v10 = 33.0;
    }
    double v11 = v6 - v7;
    float v12 = v9 + v10;
    [MEMORY[0x263F1C5C0] currentDevice];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      float v13 = 34.0;
    }
    else
    {
      float v13 = 25.0;
    }
    double v14 = v11 * 0.5;
    float v15 = v12 + v13;
    [MEMORY[0x263F1C5C0] currentDevice];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      double v16 = 348.0;
    }
    else
    {
      double v16 = 280.0;
    }
    double v17 = floor(v14);
    [MEMORY[0x263F1C5C0] currentDevice];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      double v18 = 43.0;
    }
    else
    {
      double v18 = 33.0;
    }
    self->super.super._passwordField = (UITextField *)-[ACMSimpleTextField initWithFrame:](v4, "initWithFrame:", v17, v15, v16, v18);
    [(UITextField *)self->super.super._passwordField setPlaceholder:+[ACMBaseLocale localizedString:@"Password"]];
    if ([ACMAppleConnectImplComponents components].systemInfo.isPreRelease) {
    [self.super.super._passwordField setPlaceholder:[self.super.super._passwordField.placeholder stringByAppendingString:@" (PRE-RELEASE)"]];
}
    [(UITextField *)self->super.super._passwordField setTextAlignment:0];
    }
    -[UITextField setTextColor:](self->super.super._passwordField, "setTextColor:", [MEMORY[0x263F1C550] blackColor]);
    [(UITextField *)self->super.super._passwordField setSecureTextEntry:1];
    [(UITextField *)self->super.super._passwordField setReturnKeyType:1];
    [(UITextField *)self->super.super._passwordField setContentVerticalAlignment:0];
    [(UITextField *)self->super.super._passwordField setEnablesReturnKeyAutomatically:0];
    [(UITextField *)self->super.super._passwordField setClearButtonMode:1];
    v19 = (void *)MEMORY[0x263F1C658];
    [MEMORY[0x263F1C5C0] currentDevice];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (uint64_t v20 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"),
          double v21 = 22.0,
          !v20))
    {
      double v21 = 18.0;
    }
    -[UITextField setFont:](self->super.super._passwordField, "setFont:", [v19 systemFontOfSize:v21]);
    [(UITextField *)self->super.super._passwordField setAutoresizingMask:37];
    [(UITextField *)self->super.super._passwordField setDelegate:self];
    return self->super.super._passwordField;
  }
  return result;
}

- (id)loginButton
{
  if (![(ACMSignInDialog *)self delegate]) {
    -[ACMSignInDialogSimple_Legacy loginButton]();
  }
  id result = self->super._loginButton;
  if (!result)
  {
    [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v4 = @"blueButton.png";
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      uint64_t v4 = @"blueButton_iPad.png";
    }
    double v5 = (void *)ACMImageWithName((uint64_t)v4);
    [MEMORY[0x263F1C5C0] currentDevice];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      uint64_t v6 = 8;
    }
    else
    {
      uint64_t v6 = 6;
    }
    uint64_t v7 = [v5 stretchableImageWithLeftCapWidth:v6 topCapHeight:0];
    [MEMORY[0x263F1C5C0] currentDevice];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      double v8 = 101.0;
    }
    else
    {
      double v8 = 78.0;
    }
    [MEMORY[0x263F1C5C0] currentDevice];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      double v9 = 38.0;
    }
    else
    {
      double v9 = 30.0;
    }
    float v10 = (UIButton *)(id)[MEMORY[0x263F1C488] buttonWithType:0];
    self->super._loginButton = v10;
    -[UIButton setFrame:](v10, "setFrame:", 0.0, 0.0, v8, v9);
    [(UIButton *)self->super._loginButton setTitle:+[ACMBaseLocale localizedString:@"Sign In"] forState:0];
    [(UIButton *)self->super._loginButton setBackgroundImage:v7 forState:0];
    -[UIButton setTitleColor:forState:](self->super._loginButton, "setTitleColor:forState:", [MEMORY[0x263F1C550] whiteColor], 0);
    double v11 = (void *)MEMORY[0x263F1C658];
    [MEMORY[0x263F1C5C0] currentDevice];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (uint64_t v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"),
          double v13 = 15.0,
          !v12))
    {
      double v13 = 13.0;
    }
    -[UILabel setFont:](-[UIButton titleLabel](self->super._loginButton, "titleLabel"), "setFont:", [v11 systemFontOfSize:v13]);
    -[UILabel setShadowColor:](-[UIButton titleLabel](self->super._loginButton, "titleLabel"), "setShadowColor:", [MEMORY[0x263F1C550] blackColor]);
    -[UILabel setShadowOffset:]([(UIButton *)self->super._loginButton titleLabel], "setShadowOffset:", 0.0, -1.0);
    [(UIButton *)self->super._loginButton setContentMode:0];
    [(UIButton *)self->super._loginButton setAutoresizingMask:37];
    [(UIButton *)self->super._loginButton addTarget:self action:sel_onSignIn_ forControlEvents:64];
    [(UIButton *)self->super._loginButton setExclusiveTouch:1];
    return self->super._loginButton;
  }
  return result;
}

- (id)cancelButton
{
  if (![(ACMSignInDialog *)self delegate]) {
    -[ACMSignInDialogSimple_Legacy cancelButton]();
  }
  id result = self->super._cancelButton;
  if (!result)
  {
    [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v4 = @"greyButton.png";
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      uint64_t v4 = @"greyButton_iPad.png";
    }
    double v5 = (void *)ACMImageWithName((uint64_t)v4);
    [MEMORY[0x263F1C5C0] currentDevice];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      uint64_t v6 = 8;
    }
    else
    {
      uint64_t v6 = 6;
    }
    uint64_t v7 = [v5 stretchableImageWithLeftCapWidth:v6 topCapHeight:0];
    [MEMORY[0x263F1C5C0] currentDevice];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      double v8 = 101.0;
    }
    else
    {
      double v8 = 78.0;
    }
    [MEMORY[0x263F1C5C0] currentDevice];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      double v9 = 38.0;
    }
    else
    {
      double v9 = 30.0;
    }
    float v10 = (UIButton *)(id)[MEMORY[0x263F1C488] buttonWithType:0];
    self->super._cancelButton = v10;
    -[UIButton setFrame:](v10, "setFrame:", 0.0, 0.0, v8, v9);
    [(UIButton *)self->super._cancelButton setTitle:+[ACMBaseLocale localizedString:@"Cancel"] forState:0];
    [(UIButton *)self->super._cancelButton addTarget:self action:sel_onSignInCancel_ forControlEvents:64];
    [(UIButton *)self->super._cancelButton setBackgroundImage:v7 forState:0];
    -[UIButton setTitleColor:forState:](self->super._cancelButton, "setTitleColor:forState:", [MEMORY[0x263F1C550] whiteColor], 0);
    double v11 = (void *)MEMORY[0x263F1C658];
    [MEMORY[0x263F1C5C0] currentDevice];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (uint64_t v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"),
          double v13 = 15.0,
          !v12))
    {
      double v13 = 13.0;
    }
    -[UILabel setFont:](-[UIButton titleLabel](self->super._cancelButton, "titleLabel"), "setFont:", [v11 systemFontOfSize:v13]);
    -[UILabel setShadowColor:](-[UIButton titleLabel](self->super._cancelButton, "titleLabel"), "setShadowColor:", [MEMORY[0x263F1C550] blackColor]);
    -[UILabel setShadowOffset:]([(UIButton *)self->super._cancelButton titleLabel], "setShadowOffset:", 0.0, -1.0);
    [(UIButton *)self->super._cancelButton setContentMode:0];
    [(UIButton *)self->super._cancelButton setAutoresizingMask:37];
    [(UIButton *)self->super._cancelButton setExclusiveTouch:1];
    return self->super._cancelButton;
  }
  return result;
}

- (void)loginButton
{
  __assert_rtn("-[ACMSignInDialogSimple_Legacy loginButton]", "ACMSignInDialogSimple_Legacy.m", 163, "nil != self.delegate");
}

- (void)cancelButton
{
  __assert_rtn("-[ACMSignInDialogSimple_Legacy cancelButton]", "ACMSignInDialogSimple_Legacy.m", 191, "nil != self.delegate");
}

@end