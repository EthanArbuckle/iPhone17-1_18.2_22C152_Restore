@interface PassthruSearchBar
- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged;
- (BOOL)keyboardInputChanged:(id)a3;
- (BOOL)keyboardInputShouldDelete:(id)a3;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CGSize)intrinsicContentSize;
- (PassthruSearchBar)init;
- (PassthruSearchBar)initWithStyle:(int64_t)a3;
- (UIColor)textColor;
- (UIFocusGuide)focusGuide;
- (UITextFieldDelegate)textFieldDelegate;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setFocusGuide:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTextFieldDelegate:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PassthruSearchBar

- (CGSize)intrinsicContentSize
{
  if (sub_1000BBB44(self) == 5)
  {
    v3 = [(PassthruSearchBar *)self searchTextField];
    [v3 intrinsicContentSize];
    double v5 = v4;

    [(PassthruSearchBar *)self contentInset];
    double v7 = v5 + v6;
    [(PassthruSearchBar *)self contentInset];
    double v9 = v7 + v8;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PassthruSearchBar;
    [(PassthruSearchBar *)&v11 intrinsicContentSize];
  }
  double v10 = UIViewNoIntrinsicMetric;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PassthruSearchBar;
  -[PassthruSearchBar setContentInset:](&v4, "setContentInset:", a3.top, a3.left, a3.bottom, a3.right);
  [(PassthruSearchBar *)self invalidateIntrinsicContentSize];
}

- (PassthruSearchBar)initWithStyle:(int64_t)a3
{
  v44.receiver = self;
  v44.super_class = (Class)PassthruSearchBar;
  objc_super v4 = -[PassthruSearchBar initWithFrame:](&v44, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  double v5 = v4;
  if (!v4) {
    return v5;
  }
  [(PassthruSearchBar *)v4 setAccessibilityIdentifier:@"MapsSearchBar"];
  double v6 = [(PassthruSearchBar *)v5 searchField];
  [v6 setDelegate:v5];

  [(PassthruSearchBar *)v5 setTranslucent:1];
  [(PassthruSearchBar *)v5 setOpaque:0];
  double v7 = objc_opt_new();
  [(PassthruSearchBar *)v5 setBackgroundImage:v7];

  double v8 = +[UIColor clearColor];
  [(PassthruSearchBar *)v5 setBackgroundColor:v8];

  [(PassthruSearchBar *)v5 _setBackdropStyle:2005];
  [(PassthruSearchBar *)v5 _setAutoDisableCancelButton:0];
  [(PassthruSearchBar *)v5 setCenterPlaceholder:0];
  if (!a3)
  {
    double v9 = (double *)&qword_100F71C88;
    goto LABEL_6;
  }
  if (a3 == 1)
  {
    double v9 = (double *)&qword_100F71C90;
LABEL_6:
    -[PassthruSearchBar setContentInset:](v5, "setContentInset:", *v9, 16.0, *v9, 16.0);
  }
  double v10 = [(PassthruSearchBar *)v5 searchTextField];
  [v10 _setRoundedRectBackgroundCornerRadius:10.0];

  objc_super v11 = [(PassthruSearchBar *)v5 searchTextField];
  [v11 setBecomesFirstResponderOnClearButtonTap:0];

  v12 = [(PassthruSearchBar *)v5 searchTextField];
  [v12 setAutocorrectionType:1];

  v13 = [(PassthruSearchBar *)v5 searchTextField];
  [v13 setSpellCheckingType:1];

  v14 = [(PassthruSearchBar *)v5 searchTextField];
  [v14 setTextLoupeVisibility:3];

  v15 = [(PassthruSearchBar *)v5 searchTextField];
  [v15 setReturnKeyType:6];

  v16 = [(PassthruSearchBar *)v5 searchTextField];
  [v16 setEnablesReturnKeyAutomatically:1];

  v17 = [(PassthruSearchBar *)v5 searchTextField];
  [v17 setEnablesReturnKeyOnNonWhiteSpaceContent:1];

  v18 = [(PassthruSearchBar *)v5 searchTextField];
  [v18 setClipsToBounds:1];

  v19 = [(PassthruSearchBar *)v5 searchTextField];
  [v19 setAccessibilityIdentifier:@"MapsSearchTextField"];

  if (sub_1000BBB44(v5) != 5)
  {
    v20 = [(PassthruSearchBar *)v5 searchTextField];
    [v20 setClearButtonMode:1];
  }
  id v21 = objc_alloc_init((Class)UIFocusGuide);
  [(PassthruSearchBar *)v5 setFocusGuide:v21];

  v22 = [(PassthruSearchBar *)v5 searchTextField];
  v46 = v22;
  v23 = +[NSArray arrayWithObjects:&v46 count:1];
  v24 = [(PassthruSearchBar *)v5 focusGuide];
  [v24 setPreferredFocusEnvironments:v23];

  v25 = [(PassthruSearchBar *)v5 focusGuide];
  [(PassthruSearchBar *)v5 addLayoutGuide:v25];

  v43 = [(PassthruSearchBar *)v5 focusGuide];
  v42 = [v43 topAnchor];
  v41 = [(PassthruSearchBar *)v5 topAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v45[0] = v40;
  v39 = [(PassthruSearchBar *)v5 focusGuide];
  v38 = [v39 bottomAnchor];
  v37 = [(PassthruSearchBar *)v5 bottomAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v45[1] = v36;
  v26 = [(PassthruSearchBar *)v5 focusGuide];
  v27 = [v26 leadingAnchor];
  v28 = [(PassthruSearchBar *)v5 leadingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  v45[2] = v29;
  v30 = [(PassthruSearchBar *)v5 focusGuide];
  v31 = [v30 trailingAnchor];
  v32 = [(PassthruSearchBar *)v5 trailingAnchor];
  v33 = [v31 constraintEqualToAnchor:v32];
  v45[3] = v33;
  v34 = +[NSArray arrayWithObjects:v45 count:4];
  +[NSLayoutConstraint activateConstraints:v34];

  return v5;
}

- (UIFocusGuide)focusGuide
{
  return self->_focusGuide;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PassthruSearchBar;
  id v4 = a3;
  [(PassthruSearchBar *)&v9 traitCollectionDidChange:v4];
  double v5 = [(PassthruSearchBar *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  double v7 = [v4 preferredContentSizeCategory];

  uint64_t v8 = sub_1000E93B0(v6, v7);
  if (v8) {
    [(PassthruSearchBar *)self invalidateIntrinsicContentSize];
  }
}

- (void)setTextFieldDelegate:(id)a3
{
}

- (void)setFocusGuide:(id)a3
{
}

- (PassthruSearchBar)init
{
  return [(PassthruSearchBar *)self initWithStyle:0];
}

- (void)setTextColor:(id)a3
{
  double v6 = (UIColor *)a3;
  if (self->_textColor != v6)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    double v5 = [(PassthruSearchBar *)self searchField];
    [v5 setTextColor:v6];
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  double v5 = [(PassthruSearchBar *)self textFieldDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(PassthruSearchBar *)self textFieldDelegate];
    unsigned __int8 v8 = [v7 textFieldShouldReturn:v4];
  }
  else
  {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  objc_super v11 = [(PassthruSearchBar *)self textFieldDelegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [(PassthruSearchBar *)self textFieldDelegate];
    unsigned __int8 v14 = [v13 textField:v9 shouldChangeCharactersInRange:location length:length replacementString:v10];
  }
  else
  {
    unsigned __int8 v14 = 1;
  }

  return v14;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  id v4 = a3;
  double v5 = [(PassthruSearchBar *)self textFieldDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(PassthruSearchBar *)self textFieldDelegate];
    unsigned __int8 v8 = [v7 textFieldShouldClear:v4];
  }
  else
  {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4 = a3;
  double v5 = sub_100018584();
  uint64_t v6 = [v5 oneInsights];
  [(id)v6 preload];

  double v7 = [(PassthruSearchBar *)self textFieldDelegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    unsigned __int8 v8 = [(PassthruSearchBar *)self textFieldDelegate];
    unsigned __int8 v9 = [v8 textFieldShouldBeginEditing:v4];
  }
  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v7 = a3;
  id v4 = [(PassthruSearchBar *)self textFieldDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(PassthruSearchBar *)self textFieldDelegate];
    [v6 textFieldDidBeginEditing:v7];
  }
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  id v4 = a3;
  char v5 = [(PassthruSearchBar *)self textFieldDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(PassthruSearchBar *)self textFieldDelegate];
    unsigned __int8 v8 = [v7 textFieldShouldEndEditing:v4];
  }
  else
  {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v7 = a3;
  id v4 = [(PassthruSearchBar *)self textFieldDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(PassthruSearchBar *)self textFieldDelegate];
    [v6 textFieldDidEndEditing:v7];
  }
}

- (BOOL)keyboardInputShouldDelete:(id)a3
{
  id v4 = a3;
  char v5 = [(PassthruSearchBar *)self textFieldDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(PassthruSearchBar *)self textFieldDelegate];
    unsigned __int8 v8 = [v7 keyboardInputShouldDelete:v4];
  }
  else
  {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 1;
}

- (BOOL)keyboardInputChanged:(id)a3
{
  id v4 = +[UIApplication sharedApplication];
  unsigned int v5 = [v4 isRunningTest];

  if (v5)
  {
    char v6 = +[NSNotificationCenter defaultCenter];
    id v7 = [(PassthruSearchBar *)self searchField];
    [v6 postNotificationName:@"PPTShouldSendTextChangeNotification" object:v7];
  }
  return 1;
}

- (UITextFieldDelegate)textFieldDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textFieldDelegate);

  return (UITextFieldDelegate *)WeakRetained;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusGuide, 0);
  objc_storeStrong((id *)&self->_textColor, 0);

  objc_destroyWeak((id *)&self->_textFieldDelegate);
}

@end