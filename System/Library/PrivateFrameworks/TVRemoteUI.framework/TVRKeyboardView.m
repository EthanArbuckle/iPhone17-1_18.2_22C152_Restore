@interface TVRKeyboardView
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (NSString)title;
- (RTIInputSystemSourceSession)currentSourceSession;
- (TVRCKeyboardAttributes)attributes;
- (TVRKeyboardView)initWithFrame:(CGRect)a3;
- (TVRKeyboardViewDelegate)delegate;
- (UIButton)dictationButton;
- (UINavigationBar)navigationBar;
- (UIView)separator;
- (UIView)textFieldWrapper;
- (UIVisualEffectView)effectView;
- (_TVRTextField)textField;
- (double)_separatorHeight;
- (void)_cancelButton:(id)a3;
- (void)_dictationButtonReleased:(id)a3;
- (void)_dictationButtonTapped:(id)a3;
- (void)_textDidChange:(id)a3;
- (void)enableDictationButton:(BOOL)a3;
- (void)handleTextActionPayload:(id)a3;
- (void)layoutSubviews;
- (void)setAttributes:(id)a3;
- (void)setCurrentSourceSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDictationButton:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setNavigationBar:(id)a3;
- (void)setSeparator:(id)a3;
- (void)setText:(id)a3;
- (void)setTextField:(id)a3;
- (void)setTextFieldWrapper:(id)a3;
- (void)setTitle:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
@end

@implementation TVRKeyboardView

- (TVRKeyboardView)initWithFrame:(CGRect)a3
{
  v62[1] = *MEMORY[0x263EF8340];
  v60.receiver = self;
  v60.super_class = (Class)TVRKeyboardView;
  v3 = -[TVRKeyboardView initWithFrame:](&v60, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v56 = [MEMORY[0x263F824D8] effectWithStyle:2];
    uint64_t v4 = [objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v56];
    effectView = v3->_effectView;
    v3->_effectView = (UIVisualEffectView *)v4;

    [(UIVisualEffectView *)v3->_effectView _setContinuousCornerRadius:12.0];
    v6 = [(UIVisualEffectView *)v3->_effectView layer];
    [v6 setCornerCurve:*MEMORY[0x263F15A20]];

    [(TVRKeyboardView *)v3 addSubview:v3->_effectView];
    v7 = [(UIVisualEffectView *)v3->_effectView contentView];
    [v7 setClipsToBounds:1];
    id v8 = objc_alloc_init(MEMORY[0x263F829C8]);
    id v9 = objc_alloc(MEMORY[0x263F824A8]);
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"TVRemoteUIPairingCancelString" value:&stru_26DB4CAE0 table:@"Localizable"];
    v55 = (void *)[v9 initWithTitle:v11 style:0 target:v3 action:sel__cancelButton_];

    [v8 setLeftBarButtonItem:v55];
    v12 = (void *)MEMORY[0x263F827E8];
    v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v14 = [v12 imageNamed:@"IconSiri" inBundle:v13 compatibleWithTraitCollection:0];

    uint64_t v15 = [MEMORY[0x263F824E8] buttonWithType:1];
    dictationButton = v3->_dictationButton;
    v3->_dictationButton = (UIButton *)v15;

    [(UIButton *)v3->_dictationButton setImage:v14 forState:0];
    [(UIButton *)v3->_dictationButton addTarget:v3 action:sel__dictationButtonTapped_ forControlEvents:1];
    [(UIButton *)v3->_dictationButton addTarget:v3 action:sel__dictationButtonReleased_ forControlEvents:448];
    -[UIButton setBounds:](v3->_dictationButton, "setBounds:", 0.0, 0.0, 44.0, 44.0);
    [(UIButton *)v3->_dictationButton setContentHorizontalAlignment:5];
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __33__TVRKeyboardView_initWithFrame___block_invoke;
    v57[3] = &unk_264800148;
    id v58 = v14;
    v17 = v3;
    v59 = v17;
    v18 = v3->_dictationButton;
    id v54 = v14;
    [(UIButton *)v18 setPointerStyleProvider:v57];
    v53 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v3->_dictationButton];
    [v8 setRightBarButtonItem:v53];
    id v19 = objc_alloc_init(MEMORY[0x263F829A0]);
    id v20 = v17[53];
    v17[53] = v19;

    [v17[53] pushNavigationItem:v8 animated:0];
    id v21 = v17[53];
    v22 = objc_opt_new();
    [v21 setBackgroundImage:v22 forBarMetrics:0];

    id v23 = v17[53];
    v24 = objc_opt_new();
    [v23 setShadowImage:v24];

    [v17[53] setTranslucent:1];
    id v25 = v17[53];
    v26 = [MEMORY[0x263F825C8] colorWithDisplayP3Red:0.17254902 green:0.17254902 blue:0.180392157 alpha:1.0];
    [v25 setBackgroundColor:v26];

    id v27 = v17[53];
    v28 = [MEMORY[0x263F825C8] systemTealColor];
    [v27 setTintColor:v28];

    id v29 = v17[53];
    uint64_t v61 = *MEMORY[0x263F81500];
    v30 = [MEMORY[0x263F825C8] whiteColor];
    v62[0] = v30;
    v31 = [NSDictionary dictionaryWithObjects:v62 forKeys:&v61 count:1];
    [v29 setTitleTextAttributes:v31];

    [v7 addSubview:v17[53]];
    id v32 = objc_alloc_init(MEMORY[0x263F82E00]);
    id v33 = v17[56];
    v17[56] = v32;

    id v34 = v17[56];
    v35 = [MEMORY[0x263F825C8] whiteColor];
    [v34 setBackgroundColor:v35];

    [v17[56] setAlpha:0.4];
    [v7 addSubview:v17[56]];
    id v36 = objc_alloc_init(MEMORY[0x263F82E00]);
    id v37 = v17[54];
    v17[54] = v36;

    id v38 = v17[54];
    v39 = [v17[53] backgroundColor];
    [v38 setBackgroundColor:v39];

    [v7 addSubview:v17[54]];
    v40 = objc_alloc_init(_TVRTextField);
    id v41 = v17[55];
    v17[55] = v40;

    id v42 = v17[55];
    v43 = [MEMORY[0x263F825C8] colorWithDisplayP3Red:0.647058824 green:0.647058824 blue:0.647058824 alpha:1.0];
    [v42 setBackgroundColor:v43];

    id v44 = v17[55];
    v45 = [v17[53] backgroundColor];
    [v44 setTextColor:v45];

    [v17[55] setDelegate:v17];
    id v46 = v17[55];
    v47 = [v17[53] tintColor];
    [v46 setInsertionPointColor:v47];

    [v17[55] setBorderStyle:3];
    [v17[55] addTarget:v17 action:sel__textDidChange_ forControlEvents:0x20000];
    [v17[55] setClearButtonMode:1];
    [v17[55] setAutocorrectionType:1];
    [v17[55] setKeyboardAppearance:1];
    [v17[55] setForceDisableDictation:1];
    id v48 = v17[55];
    v49 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83618]];
    [v48 setFont:v49];

    [v17[55] _setForcesClearButtonHighContrastAppearance:1];
    [v17[54] addSubview:v17[55]];
    id v50 = objc_alloc_init(MEMORY[0x263F63750]);
    id v51 = v17[59];
    v17[59] = v50;

    [v17[59] setPayloadDelegate:v17];
    objc_msgSend(v17[55], "set_rtiSourceSession:", v17[59]);
  }
  return v3;
}

id __33__TVRKeyboardView_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 size];
  double v9 = v8 + 30.0;
  [v7 bounds];
  CGFloat v10 = CGRectGetHeight(v25) + -6.0;
  v11 = *(void **)(a1 + 40);
  v12 = [v7 superview];

  objc_msgSend(v11, "convertRect:fromView:", v12, 15.0, 3.0, v9, v10);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  id v21 = objc_msgSend(MEMORY[0x263F82A88], "shapeWithRoundedRect:", v14, v16, v18, v20);
  v22 = [MEMORY[0x263F82A90] styleWithEffect:v6 shape:v21];

  return v22;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3.width, a3.height);
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 1)
  {
    double v6 = 320.0;
  }
  else
  {
    id v7 = [MEMORY[0x263F82B60] mainScreen];
    [v7 bounds];
    double v6 = CGRectGetWidth(v12) + -32.0;
  }
  [(TVRKeyboardView *)self _separatorHeight];
  double v9 = v8 + 48.0 + 64.5;
  double v10 = v6;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)TVRKeyboardView;
  [(TVRKeyboardView *)&v10 layoutSubviews];
  [(TVRKeyboardView *)self bounds];
  double x = v11.origin.x;
  double y = v11.origin.y;
  double width = v11.size.width;
  double height = v11.size.height;
  double v7 = CGRectGetWidth(v11);
  [(TVRKeyboardView *)self _separatorHeight];
  double v9 = v8;
  -[UIVisualEffectView setFrame:](self->_effectView, "setFrame:", x, y, width, height);
  -[UINavigationBar setFrame:](self->_navigationBar, "setFrame:", 0.0, 0.0, v7, 48.0);
  -[UIView setFrame:](self->_separator, "setFrame:", 0.0, 48.0, v7, v9);
  -[UIView setFrame:](self->_textFieldWrapper, "setFrame:", 0.0, v9 + 48.0, v7, 64.5);
  -[_TVRTextField setFrame:](self->_textField, "setFrame:", 8.0, 8.0, v7 + -16.0, 48.5);
}

- (void)textFieldDidBeginEditing:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = _TVRUIKeyboardLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    textField = self->_textField;
    int v6 = [(_TVRTextField *)textField canBecomeFirstResponder];
    int v7 = [(_TVRTextField *)self->_textField isFirstResponder];
    int v8 = 136315906;
    double v9 = "-[TVRKeyboardView textFieldDidBeginEditing:]";
    __int16 v10 = 2112;
    CGRect v11 = textField;
    __int16 v12 = 1024;
    int v13 = v6;
    __int16 v14 = 1024;
    int v15 = v7;
    _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "%s %@ canBecomeFirstResponder, %d, isFirstresponder:%d", (uint8_t *)&v8, 0x22u);
  }
}

- (BOOL)becomeFirstResponder
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v3 = [(_TVRTextField *)self->_textField becomeFirstResponder];
  uint64_t v4 = _TVRUIKeyboardLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    textField = self->_textField;
    int v6 = [(_TVRTextField *)textField canBecomeFirstResponder];
    int v7 = [(_TVRTextField *)self->_textField isFirstResponder];
    int v9 = 136316162;
    __int16 v10 = "-[TVRKeyboardView becomeFirstResponder]";
    __int16 v11 = 2112;
    __int16 v12 = textField;
    __int16 v13 = 1024;
    int v14 = v3;
    __int16 v15 = 1024;
    int v16 = v6;
    __int16 v17 = 1024;
    int v18 = v7;
    _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "%s %@ result:%d canBecomeFirstResponder, %d, isFirstresponder:%d", (uint8_t *)&v9, 0x28u);
  }

  return v3;
}

- (BOOL)resignFirstResponder
{
  v4.receiver = self;
  v4.super_class = (Class)TVRKeyboardView;
  [(TVRKeyboardView *)&v4 resignFirstResponder];
  return [(_TVRTextField *)self->_textField becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained keyboardViewDidHitReturnKey:self];

  return 1;
}

- (void)setText:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _TVRUIKeyboardLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    __int16 v12 = "-[TVRKeyboardView setText:]";
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "%s text:%{public}@", (uint8_t *)&v11, 0x16u);
  }

  [(_TVRTextField *)self->_textField setText:v4];
  int v6 = [(_TVRTextField *)self->_textField markedTextRange];
  int v7 = v6;
  if (!v6 || [v6 isEmpty])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 keyboardView:self didUpdateText:v4];
    }
  }
}

- (NSString)text
{
  return (NSString *)[(_TVRTextField *)self->_textField text];
}

- (void)setTitle:(id)a3
{
  if (a3)
  {
    navigationBar = self->_navigationBar;
    id v4 = a3;
    id v5 = [(UINavigationBar *)navigationBar topItem];
    [v5 setTitle:v4];
  }
}

- (NSString)title
{
  v2 = [(UINavigationBar *)self->_navigationBar topItem];
  int v3 = [v2 title];

  return (NSString *)v3;
}

- (void)setAttributes:(id)a3
{
  int v6 = (TVRCKeyboardAttributes *)a3;
  if (self->_attributes != v6)
  {
    objc_storeStrong((id *)&self->_attributes, a3);
    id v5 = [(TVRCKeyboardAttributes *)v6 title];
    [(TVRKeyboardView *)self setTitle:v5];

    [(TVRCKeyboardAttributes *)v6 applyToTextField:self->_textField];
  }
}

- (void)enableDictationButton:(BOOL)a3
{
}

- (void)handleTextActionPayload:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 keyboardView:self generatedTextInputPayload:v7];
  }
}

- (void)_cancelButton:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 keyboardViewDidCancel:self];
  }
}

- (void)_dictationButtonTapped:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 keyboardViewPressedDictationButton:self];
  }
}

- (void)_dictationButtonReleased:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 keyboardViewReleasedDictationButton:self];
  }
}

- (void)_textDidChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = _TVRUIKeyboardLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = [v4 text];
    int v13 = 136315394;
    id v14 = "-[TVRKeyboardView _textDidChange:]";
    __int16 v15 = 2114;
    int v16 = v6;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "%s text:%{public}@", (uint8_t *)&v13, 0x16u);
  }
  id v7 = [v4 markedTextRange];
  int v8 = v7;
  if (!v7 || [v7 isEmpty])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      __int16 v12 = [v4 text];
      [v11 keyboardView:self didUpdateText:v12];
    }
  }
}

- (double)_separatorHeight
{
  v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 scale];
  double v4 = 1.0 / v3;

  return v4;
}

- (TVRCKeyboardAttributes)attributes
{
  return self->_attributes;
}

- (TVRKeyboardViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TVRKeyboardViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UINavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (void)setNavigationBar:(id)a3
{
}

- (UIView)textFieldWrapper
{
  return self->_textFieldWrapper;
}

- (void)setTextFieldWrapper:(id)a3
{
}

- (_TVRTextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
}

- (UIButton)dictationButton
{
  return self->_dictationButton;
}

- (void)setDictationButton:(id)a3
{
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (RTIInputSystemSourceSession)currentSourceSession
{
  return self->_currentSourceSession;
}

- (void)setCurrentSourceSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSourceSession, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_dictationButton, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_textFieldWrapper, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end