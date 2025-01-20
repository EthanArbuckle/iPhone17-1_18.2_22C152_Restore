@interface ACMiTunesSignInDialog_Legacy
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (CGRect)passwordFrame;
- (CGRect)userNameFrame;
- (UITextField)editingTextField;
- (void)acmAlertViewWillBecomeInvisible;
- (void)acmAlertViewWillBecomeVisible;
- (void)alertView:(id)a3 clickedButtonAtIndex:(int64_t)a4;
- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4;
- (void)dealloc;
- (void)handleRotation;
- (void)handleTextFieldShouldReturnOnNonPasswordField;
- (void)loadView;
- (void)setEditingTextField:(id)a3;
- (void)viewDidLoad;
- (void)willPresentAlertView:(id)a3;
@end

@implementation ACMiTunesSignInDialog_Legacy

- (void)dealloc
{
  [(UIAlertView *)[(ACMiTunesSignInDialog *)self signInDialog] setAcmAlertViewDelegate:0];
  [(ACMiTunesSignInDialog_Legacy *)self setEditingTextField:0];
  v3.receiver = self;
  v3.super_class = (Class)ACMiTunesSignInDialog_Legacy;
  [(ACMiTunesSignInDialog *)&v3 dealloc];
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return 1;
}

- (void)loadView
{
  id v3 = [(ACMiTunesSignInDialog *)self dialogTitle];
  v4 = (void *)MEMORY[0x263F1C658];
  [MEMORY[0x263F1C658] systemFontSize];
  [v3 sizeWithFont:[v4 systemFontOfSize:]];
  -[ACMiTunesSignInDialog setTitleStringSize:](self, "setTitleStringSize:");
  -[ACMiTunesSignInDialog setPreviousInterfaceOrientation:](self, [objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "statusBarOrientation"));
  -[ACMiTunesSignInDialog setTitleField:](self, "setTitleField:", [v3 stringByAppendingString:@"\n\n\n\n"]);
  [MEMORY[0x263F1C5C0] currentDevice];
  if (((objc_opt_respondsToSelector() & 1) == 0
     || !objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    && ![(ACMiTunesSignInDialog *)self isPortraitMode])
  {
    [(ACMiTunesSignInDialog *)self titleStringSize];
    if (v5 > 190.0 && (unint64_t)[v3 length] >= 0x15)
    {
      id v3 = [[(id)objc_msgSend(v3, "substringToIndex:", 19) stringByAppendingString:@"…"];
      v6 = (void *)MEMORY[0x263F1C658];
      [MEMORY[0x263F1C658] systemFontSize];
      [v3 sizeWithFont:[v6 systemFontOfSize:x0]];
      -[ACMiTunesSignInDialog setTitleStringSize:](self, "setTitleStringSize:");
    }
  }
  [MEMORY[0x263F1C5C0] currentDevice];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
  {
    v7 = @"\n\n\n\n";
  }
  else if ([(ACMiTunesSignInDialog *)self isPortraitMode])
  {
    v7 = @"\n\n\n\n";
  }
  else
  {
    v7 = @"\n\n\n";
  }
  -[ACMiTunesSignInDialog_Legacy setView:](self, "setView:", -[ACMAlertView initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:]([ACMAlertView alloc], "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", [v3 stringByAppendingString:v7], 0, self, +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", @"Cancel"), +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", @"Sign In"), 0));
  v8.receiver = self;
  v8.super_class = (Class)ACMiTunesSignInDialog_Legacy;
  [(ACMiTunesSignInDialog *)&v8 loadView];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ACMiTunesSignInDialog_Legacy;
  [(ACMiTunesSignInDialog *)&v3 viewDidLoad];
  [[-[UITextField undoManager](-[ACMSignInDialog accountNameField](self, "accountNameField"), "undoManager") disableUndoRegistration];
  [(-[UITextField undoManager](-[ACMSignInDialog passwordField](self, "passwordField"), "undoManager")) disableUndoRegistration];
}

- (void)handleRotation
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (![(ACMiTunesSignInDialog *)self changeTitleStringIfNeeded])
  {
    [(ACMiTunesSignInDialog_Legacy *)self userNameFrame];
    -[UITextField setFrame:]([(ACMSignInDialog *)self accountNameField], "setFrame:", v3, v4, v5, v6);
    [(ACMiTunesSignInDialog_Legacy *)self passwordFrame];
    -[UITextField setFrame:]([(ACMSignInDialog *)self passwordField], "setFrame:", v7, v8, v9, v10);
  }
  [(UIAlertView *)[(ACMiTunesSignInDialog *)self signInDialog] bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [(ACMiTunesSignInDialog *)self titleStringSize];
  double v18 = v17;
  if ([(ACMiTunesSignInDialog *)self isPortraitMode]) {
    double v19 = dbl_23EC32580[floor(v18 / 190.0) > 0.0];
  }
  else {
    double v19 = 158.0;
  }
  v20 = (void *)[(UIAlertView *)[(ACMiTunesSignInDialog *)self signInDialog] subviews];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v27;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v26 + 1) + 8 * v24);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v25 frame];
          [v25 setFrame:];
        }
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v22);
  }
  -[UIAlertView setBounds:]([(ACMiTunesSignInDialog *)self signInDialog], "setBounds:", v12, v14, v16, v19);
}

- (void)handleTextFieldShouldReturnOnNonPasswordField
{
  v2 = [(ACMSignInDialog *)self passwordField];

  [(UITextField *)v2 becomeFirstResponder];
}

- (CGRect)passwordFrame
{
  [(ACMiTunesSignInDialog *)self titleStringSize];
  double v4 = v3;
  [MEMORY[0x263F1C5C0] currentDevice];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
  {
    double v5 = 78.0;
  }
  else
  {
    BOOL v6 = [(ACMiTunesSignInDialog *)self isPortraitMode];
    double v5 = 64.0;
    if (v6) {
      double v5 = 78.0;
    }
  }
  double v7 = floor(v4 / 190.0) * 20.0 + v5;
  double v8 = 260.0;
  double v9 = 12.0;
  double v10 = 30.0;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v9;
  return result;
}

- (CGRect)userNameFrame
{
  [(ACMiTunesSignInDialog *)self titleStringSize];
  double v4 = v3;
  [MEMORY[0x263F1C5C0] currentDevice];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
  {
    double v5 = 48.0;
  }
  else
  {
    BOOL v6 = [(ACMiTunesSignInDialog *)self isPortraitMode];
    double v5 = 34.0;
    if (v6) {
      double v5 = 48.0;
    }
  }
  double v7 = floor(v4 / 190.0) * 20.0 + v5;
  double v8 = 260.0;
  double v9 = 12.0;
  double v10 = 30.0;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v9;
  return result;
}

- (void)willPresentAlertView:(id)a3
{
  if (![(UIAlertView *)[(ACMiTunesSignInDialog *)self signInDialog] acmAlertViewDelegate])
  {
    BOOL v4 = [(ACMiTunesSignInDialog *)self changeTitleStringIfNeeded];
    [(UIAlertView *)[(ACMiTunesSignInDialog *)self signInDialog] setAcmAlertViewDelegate:self];
    if (![(UITextField *)[(ACMSignInDialog *)self passwordField] superview])
    {
      if (v4) {
        [(UITextField *)[(ACMSignInDialog *)self passwordField] frame];
      }
      else {
        [(ACMiTunesSignInDialog_Legacy *)self passwordFrame];
      }
      double v9 = v5;
      double v10 = v6;
      double v11 = v7;
      double v12 = v8;
      [MEMORY[0x263F1C5C0] currentDevice];
      if (((objc_opt_respondsToSelector() & 1) == 0
         || !objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
        && ![(ACMiTunesSignInDialog *)self isPortraitMode])
      {
        double v10 = v10 + 4.0;
      }
      -[UITextField setFrame:]([(ACMSignInDialog *)self passwordField], "setFrame:", v9, v10, v11, v12);
      [(UIAlertView *)[(ACMiTunesSignInDialog *)self signInDialog] addSubview:[(ACMSignInDialog *)self passwordField]];
    }
    if ([(ACMSignInDialog *)self accountNameField]
      && ![(UITextField *)[(ACMSignInDialog *)self accountNameField] superview])
    {
      if (v4) {
        [(UITextField *)[(ACMSignInDialog *)self accountNameField] frame];
      }
      else {
        [(ACMiTunesSignInDialog_Legacy *)self userNameFrame];
      }
      double v17 = v13;
      double v18 = v14;
      double v19 = v15;
      double v20 = v16;
      [MEMORY[0x263F1C5C0] currentDevice];
      if (((objc_opt_respondsToSelector() & 1) == 0
         || !objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
        && ![(ACMiTunesSignInDialog *)self isPortraitMode])
      {
        double v18 = v18 + 4.0;
      }
      -[UITextField setFrame:]([(ACMSignInDialog *)self accountNameField], "setFrame:", v17, v18, v19, v20);
      [(UIAlertView *)[(ACMiTunesSignInDialog *)self signInDialog] addSubview:[(ACMSignInDialog *)self accountNameField]];
    }
    [(UIAlertView *)[(ACMiTunesSignInDialog *)self signInDialog] center];
    double v22 = v21;
    [MEMORY[0x263F1C5C0] currentDevice];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      BOOL v23 = ![(ACMiTunesSignInDialog *)self isPortraitMode];
      double v24 = 208.0;
      double v25 = 380.0;
    }
    else
    {
      BOOL v23 = ![(ACMiTunesSignInDialog *)self isPortraitMode];
      double v24 = 82.0;
      double v25 = 140.0;
    }
    if (v23) {
      double v26 = v24;
    }
    else {
      double v26 = v25;
    }
    [(UIAlertView *)[(ACMiTunesSignInDialog *)self signInDialog] bounds];
    float v28 = v27;
    if ((llroundf(v28) & 0x8000000000000001) == 1) {
      double v26 = v26 + 0.5;
    }
    -[UIAlertView setCenter:]([(ACMiTunesSignInDialog *)self signInDialog], "setCenter:", v22, v26);
    if ([(ACMiTunesSignInDialog_Legacy *)self editingTextField])
    {
      long long v29 = [(ACMiTunesSignInDialog_Legacy *)self editingTextField];
    }
    else if ([(NSString *)[(UITextField *)[(ACMSignInDialog *)self accountNameField] text] length])
    {
      long long v29 = [(ACMSignInDialog *)self passwordField];
    }
    else
    {
      long long v29 = [(ACMSignInDialog *)self accountNameField];
    }
    [(UITextField *)v29 becomeFirstResponder];
  }
}

- (void)acmAlertViewWillBecomeInvisible
{
  v2 = [(ACMiTunesSignInDialog_Legacy *)self editingTextField];

  [(UITextField *)v2 resignFirstResponder];
}

- (void)acmAlertViewWillBecomeVisible
{
  v2 = [(ACMiTunesSignInDialog_Legacy *)self editingTextField];

  [(UITextField *)v2 becomeFirstResponder];
}

- (void)alertView:(id)a3 clickedButtonAtIndex:(int64_t)a4
{
  if ([(ACMiTunesSignInDialog *)self signInDialog] == a3)
  {
    [(UIAlertView *)[(ACMiTunesSignInDialog *)self signInDialog] setAcmAlertViewDelegate:0];
    [(UITextField *)[(ACMSignInDialog *)self passwordField] resignFirstResponder];
    if (a4 == 1)
    {
      if ([(ACMSignInDialog *)self canSignIn])
      {
        [(ACMSignInDialogDelegate *)[(ACMSignInDialog *)self delegate] onSignIn:a3];
        double v7 = [(ACMiTunesSignInDialog *)self signInDialog];
        [(UIAlertView *)v7 dismissWithClickedButtonIndex:0 animated:0];
      }
      else
      {
        double v8 = [(UITextField *)[(ACMSignInDialog *)self accountNameField] text];
        double v9 = [(UITextField *)[(ACMSignInDialog *)self passwordField] text];
        double v10 = [(ACMSignInDialog *)self accountNameField];
        double v11 = [(ACMiTunesSignInDialog_Legacy *)self editingTextField];
        [(UIAlertView *)[(ACMiTunesSignInDialog *)self signInDialog] dismissWithClickedButtonIndex:1 animated:0];
        [(UIAlertView *)[(ACMiTunesSignInDialog *)self signInDialog] show];
        if ([(NSString *)v8 length]) {
          [(UITextField *)[(ACMSignInDialog *)self accountNameField] setText:v8];
        }
        [(UITextField *)[(ACMSignInDialog *)self passwordField] setText:v9];
        if (v10 == v11) {
          double v12 = [(ACMSignInDialog *)self accountNameField];
        }
        else {
          double v12 = [(ACMSignInDialog *)self passwordField];
        }
        [(UITextField *)v12 becomeFirstResponder];
      }
    }
    else if (!a4)
    {
      [(ACMSignInDialog *)self controlsWillChangeState:1];
      [(ACMSignInDialog *)self controlsDidChangeState:1];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __63__ACMiTunesSignInDialog_Legacy_alertView_clickedButtonAtIndex___block_invoke;
      v13[3] = &unk_265043CC8;
      v13[4] = self;
      v13[5] = a3;
      dispatch_async_on_main_thread((uint64_t)v13);
    }
  }
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  double v7 = [(ACMiTunesSignInDialog *)self signInDialog];
  if (a4 == 1 && v7 == a3)
  {
    [(ACMiTunesSignInDialog_Legacy *)self setView:0];
    [(UITextField *)[(ACMSignInDialog *)self accountNameField] setDelegate:0];
    [(ACMSignInDialog *)self setAccountNameField:0];
    [(UITextField *)[(ACMSignInDialog *)self passwordField] setDelegate:0];
    [(ACMSignInDialog *)self setPasswordField:0];
    [(ACMiTunesSignInDialog_Legacy *)self setEditingTextField:0];
  }
}

- (UITextField)editingTextField
{
  return self->_editingTextField;
}

- (void)setEditingTextField:(id)a3
{
}

@end