@interface NCNotificationTextInputView
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)isFirstResponder;
- (BOOL)resignFirstResponder;
- (CGSize)intrinsicContentSize;
- (NCNotificationAction)action;
- (NCNotificationTextInputView)initWithFrame:(CGRect)a3;
- (NCNotificationTextInputViewDelegate)delegate;
- (UIButton)button;
- (UIInputContextHistory)inputContextHistory;
- (UIScribbleInteraction)scribbleInteraction;
- (UIStackView)horizontalStack;
- (UITextView)textView;
- (double)_maximumTextViewHeight;
- (double)_pencilModeHeight;
- (double)_textViewHeight;
- (double)_textViewWidth;
- (void)_buttonPressed:(id)a3;
- (void)_updateForTextChange;
- (void)layoutSubviews;
- (void)safeAreaInsetsDidChange;
- (void)setAction:(id)a3;
- (void)setButton:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHorizontalStack:(id)a3;
- (void)setInputContextHistory:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setScribbleInteraction:(id)a3;
- (void)setTextView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NCNotificationTextInputView

- (NCNotificationTextInputView)initWithFrame:(CGRect)a3
{
  v39.receiver = self;
  v39.super_class = (Class)NCNotificationTextInputView;
  v3 = -[NCNotificationTextInputView initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(NCNotificationTextInputView *)v3 setBackgroundColor:v4];

    [(NCNotificationTextInputView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [(NCNotificationTextInputView *)v3 traitCollection];
    v6 = [v5 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

    double v8 = 1.0;
    if (!IsAccessibilityCategory)
    {
      v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v9 scale];
      double v8 = v10;
    }
    id v11 = objc_alloc(MEMORY[0x1E4FB1DD8]);
    double v12 = *MEMORY[0x1E4F1DB28];
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v16 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], v13, v14, v15);
    textView = v3->_textView;
    v3->_textView = (UITextView *)v16;

    [(UITextView *)v3->_textView setAcceptsEmoji:1];
    [(UITextView *)v3->_textView setAutoresizingMask:18];
    [(UITextView *)v3->_textView setDelegate:v3];
    v18 = v3->_textView;
    uint64_t v19 = *MEMORY[0x1E4FB28C8];
    v20 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UITextView *)v18 setFont:v20];

    -[UITextView setTextContainerInset:](v3->_textView, "setTextContainerInset:", 8.0, 0.0, 8.0, 0.0);
    v21 = [(UITextView *)v3->_textView layer];
    [v21 setBorderWidth:1.0 / v8];

    v22 = [(UITextView *)v3->_textView layer];
    [v22 setCornerRadius:5.0];

    objc_opt_class();
    if (objc_opt_respondsToSelector())
    {
      v23 = v3->_textView;
      v24 = [MEMORY[0x1E4FB1618] _textFieldBackgroundColor];
      [(UITextView *)v23 setBackgroundColor:v24];
    }
    [(NCNotificationTextInputView *)v3 addSubview:v3->_textView];
    uint64_t v25 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    button = v3->_button;
    v3->_button = (UIButton *)v25;

    LODWORD(v27) = 1148846080;
    [(UIButton *)v3->_button setContentHuggingPriority:0 forAxis:v27];
    v28 = [(UIButton *)v3->_button titleLabel];
    v29 = objc_msgSend(MEMORY[0x1E4FB08E0], "bsui_preferredFontForTextStyle:hiFontStyle:", v19, 4);
    [v28 setFont:v29];

    v30 = v3->_button;
    v31 = NCUserNotificationsUIKitFrameworkBundle();
    v32 = [v31 localizedStringForKey:@"QUICK_REPLY_SEND_BUTTON_TITLE" value:&stru_1F2F516F8 table:0];
    [(UIButton *)v30 setTitle:v32 forState:0];

    [(UIButton *)v3->_button addTarget:v3 action:sel__buttonPressed_ forControlEvents:64];
    uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1C60]), "initWithFrame:", v12, v13, v14, v15);
    horizontalStack = v3->_horizontalStack;
    v3->_horizontalStack = (UIStackView *)v33;

    [(UIStackView *)v3->_horizontalStack addArrangedSubview:v3->_textView];
    [(UIStackView *)v3->_horizontalStack addArrangedSubview:v3->_button];
    [(UIStackView *)v3->_horizontalStack setDistribution:0];
    [(UIStackView *)v3->_horizontalStack setAxis:0];
    [(UIStackView *)v3->_horizontalStack setSpacing:8.0];
    [(NCNotificationTextInputView *)v3 addSubview:v3->_horizontalStack];
    uint64_t v35 = [objc_alloc(MEMORY[0x1E4FB1BB8]) initWithDelegate:v3];
    scribbleInteraction = v3->_scribbleInteraction;
    v3->_scribbleInteraction = (UIScribbleInteraction *)v35;

    v37 = [(NCNotificationTextInputView *)v3 textView];
    [v37 addInteraction:v3->_scribbleInteraction];

    [(NCNotificationTextInputView *)v3 _updateForTextChange];
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  [(NCNotificationTextInputView *)self directionalLayoutMargins];
  double v4 = v3;
  double v5 = *MEMORY[0x1E4FB30D8];
  [(NCNotificationTextInputView *)self _textViewHeight];
  double v7 = v6;
  [(NCNotificationTextInputView *)self _maximumTextViewHeight];
  if (v7 < v8) {
    double v8 = v7;
  }
  double v9 = v4 + v8 + 12.0;
  double v10 = v5;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationTextInputView;
  [(NCNotificationTextInputView *)&v3 safeAreaInsetsDidChange];
  [(NCNotificationTextInputView *)self invalidateIntrinsicContentSize];
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)NCNotificationTextInputView;
  [(NCNotificationTextInputView *)&v19 layoutSubviews];
  [(NCNotificationTextInputView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(NCNotificationTextInputView *)self directionalLayoutMargins];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  horizontalStack = self->_horizontalStack;
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  CGFloat v18 = CGRectGetWidth(v20) - v12 - v16;
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  -[UIStackView setFrame:](horizontalStack, "setFrame:", v12, 6.0, v18, CGRectGetHeight(v21) + -12.0 - v14);
}

- (void)setAction:(id)a3
{
  double v9 = (NCNotificationAction *)a3;
  if (self->_action != v9)
  {
    objc_storeStrong((id *)&self->_action, a3);
    double v5 = [(NCNotificationAction *)v9 behaviorParameters];
    CGFloat v6 = [v5 objectForKey:*MEMORY[0x1E4F446A0]];

    [(NCNotificationTextInputView *)self setButtonTitle:v6];
    double v7 = [(NCNotificationAction *)v9 behaviorParameters];
    CGFloat v8 = [v7 objectForKey:*MEMORY[0x1E4F446A8]];

    [(NCNotificationTextInputView *)self setPlaceholder:v8];
  }
}

- (void)setButtonTitle:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [v9 length];
  double v5 = [(NCNotificationTextInputView *)self button];
  CGFloat v6 = v5;
  if (v4)
  {
    [v5 setTitle:v9 forState:0];
  }
  else
  {
    double v7 = NCUserNotificationsUIKitFrameworkBundle();
    CGFloat v8 = [v7 localizedStringForKey:@"QUICK_REPLY_SEND_BUTTON_TITLE" value:&stru_1F2F516F8 table:0];
    [v6 setTitle:v8 forState:0];
  }
}

- (void)setPlaceholder:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B18], "nc_safeAttributedStringWithString:", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(NCNotificationTextInputView *)self textView];
  [v4 setAttributedPlaceholder:v5];
}

- (void)setInputContextHistory:(id)a3
{
  id v5 = (UIInputContextHistory *)a3;
  if (self->_inputContextHistory != v5)
  {
    objc_storeStrong((id *)&self->_inputContextHistory, a3);
    [(UITextView *)self->_textView setInputContextHistory:v5];
  }
}

- (BOOL)canBecomeFirstResponder
{
  v2 = [(NCNotificationTextInputView *)self textView];
  char v3 = [v2 canBecomeFirstResponder];

  return v3;
}

- (BOOL)becomeFirstResponder
{
  v2 = [(NCNotificationTextInputView *)self textView];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (BOOL)canResignFirstResponder
{
  v2 = [(NCNotificationTextInputView *)self textView];
  char v3 = [v2 canResignFirstResponder];

  return v3;
}

- (BOOL)resignFirstResponder
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationTextInputView;
  if ([(NCNotificationTextInputView *)&v6 resignFirstResponder]) {
    return 1;
  }
  uint64_t v4 = [(NCNotificationTextInputView *)self textView];
  char v3 = [v4 resignFirstResponder];

  return v3;
}

- (BOOL)isFirstResponder
{
  v2 = [(NCNotificationTextInputView *)self textView];
  char v3 = [v2 isFirstResponder];

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationTextInputView;
  id v4 = a3;
  [(NCNotificationTextInputView *)&v11 traitCollectionDidChange:v4];
  id v5 = [(NCNotificationTextInputView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    CGFloat v8 = [(UITextView *)self->_textView layer];
    id v9 = [MEMORY[0x1E4FB1618] _textFieldBorderColor];
    id v10 = [v9 resolvedColorWithTraitCollection:v5];
    objc_msgSend(v8, "setBorderColor:", objc_msgSend(v10, "CGColor"));
  }
}

- (double)_textViewWidth
{
  char v3 = [(NCNotificationTextInputView *)self button];
  objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v5 = v4;

  [(NCNotificationTextInputView *)self directionalLayoutMargins];
  double v7 = v6;
  double v9 = v8;
  [(NCNotificationTextInputView *)self bounds];
  double result = CGRectGetWidth(v11) + -24.0 - v7 - v9 - v5;
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (double)_textViewHeight
{
  char v3 = [(NCNotificationTextInputView *)self button];
  objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v5 = v4;

  double v6 = [(NCNotificationTextInputView *)self textView];
  [(NCNotificationTextInputView *)self _textViewWidth];
  objc_msgSend(v6, "sizeThatFits:");
  double v8 = v7;

  if ([MEMORY[0x1E4FB1BB8] isPencilInputExpected])
  {
    [(NCNotificationTextInputView *)self _pencilModeHeight];
  }
  else if (v5 >= v8)
  {
    return v5;
  }
  else
  {
    return v8;
  }
  return result;
}

- (double)_maximumTextViewHeight
{
  v2 = [(UITextView *)self->_textView font];
  [v2 lineHeight];
  double v4 = v3 * 4.0;

  return v4;
}

- (double)_pencilModeHeight
{
  v2 = [(UITextView *)self->_textView font];
  [v2 lineHeight];
  double v4 = v3;
  [MEMORY[0x1E4FB1BB8] _recommendedBlankSpaceHeight];
  double v6 = v4 + v5;

  return v6;
}

- (void)_buttonPressed:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  double v5 = [MEMORY[0x1E4FB18E0] activeKeyboard];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__NCNotificationTextInputView__buttonPressed___block_invoke;
  v6[3] = &unk_1E6A93870;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  [v5 acceptAutocorrectionWithCompletionHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __46__NCNotificationTextInputView__buttonPressed___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained textView];
  double v3 = [v2 text];

  if ([v3 length])
  {
    id v4 = [WeakRetained delegate];
    uint64_t v5 = *(void *)(a1 + 32);
    double v6 = [WeakRetained action];
    [v4 notificationTextInputView:v5 didConfirmText:v3 forAction:v6];

    id v7 = [WeakRetained textView];
    [v7 setText:0];
  }
}

- (void)_updateForTextChange
{
  [(NCNotificationTextInputView *)self invalidateIntrinsicContentSize];
  double v3 = [(UITextView *)self->_textView text];
  BOOL v4 = [v3 length] != 0;

  [(UIButton *)self->_button setEnabled:v4];
  [(NCNotificationTextInputView *)self _textViewHeight];
  double v6 = v5;
  [(NCNotificationTextInputView *)self _maximumTextViewHeight];
  textView = self->_textView;

  [(UITextView *)textView setScrollEnabled:v6 >= v7];
}

- (NCNotificationTextInputViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationTextInputViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NCNotificationAction)action
{
  return self->_action;
}

- (UIInputContextHistory)inputContextHistory
{
  return self->_inputContextHistory;
}

- (UIStackView)horizontalStack
{
  return self->_horizontalStack;
}

- (void)setHorizontalStack:(id)a3
{
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (UIScribbleInteraction)scribbleInteraction
{
  return self->_scribbleInteraction;
}

- (void)setScribbleInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scribbleInteraction, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_horizontalStack, 0);
  objc_storeStrong((id *)&self->_inputContextHistory, 0);
  objc_storeStrong((id *)&self->_action, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end