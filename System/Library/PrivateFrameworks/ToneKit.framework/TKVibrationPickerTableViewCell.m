@interface TKVibrationPickerTableViewCell
- (BOOL)_isDisplayingRemovableTextField;
- (BOOL)isChecked;
- (BOOL)isEditable;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSString)labelText;
- (NSString)placeholderText;
- (TKVibrationPickerTableViewCell)initWithReuseIdentifier:(id)a3;
- (TKVibrationPickerTableViewCellDelegate)delegate;
- (UIColor)highlightedTextColor;
- (UIColor)regularTextColor;
- (UIFont)regularTextFont;
- (void)_layoutRemovableTextField;
- (void)_makeRemovableTextFieldEditable:(BOOL)a3;
- (void)didTransitionToState:(unint64_t)a3;
- (void)layoutSubviews;
- (void)makeTextFieldResignFirstResponderIfNeeded;
- (void)setChecked:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)setHighlightedTextColor:(id)a3;
- (void)setLabelText:(id)a3;
- (void)setPlaceholderText:(id)a3;
- (void)setRegularTextColor:(id)a3;
- (void)setRegularTextFont:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)willTransitionToState:(unint64_t)a3;
@end

@implementation TKVibrationPickerTableViewCell

- (TKVibrationPickerTableViewCell)initWithReuseIdentifier:(id)a3
{
  v3 = [(TKVibrationPickerTableViewCell *)self initWithStyle:1 reuseIdentifier:a3];
  if (v3)
  {
    v4 = (UITextField *)objc_alloc_init(MEMORY[0x263F1CA98]);
    removableTextField = v3->_removableTextField;
    v3->_removableTextField = v4;

    +[TKVibrationInterfaceUtilities configureVibrationNameTextField:v3->_removableTextField];
    v6 = [(TKVibrationPickerTableViewCell *)v3 textLabel];
    v7 = v3->_removableTextField;
    v8 = [v6 textColor];
    [(UITextField *)v7 setTextColor:v8];

    v9 = v3->_removableTextField;
    v10 = [v6 backgroundColor];
    [(UITextField *)v9 setBackgroundColor:v10];

    [(UITextField *)v3->_removableTextField setDelegate:v3];
    v11 = +[TKUIKitConstants defaultTableViewCellTextColor];
    [(TKVibrationPickerTableViewCell *)v3 setRegularTextColor:v11];
  }
  return v3;
}

- (void)setEditable:(BOOL)a3
{
  if (self->_editable != a3)
  {
    self->_editable = a3;
    if (!a3) {
      [(TKVibrationPickerTableViewCell *)self _makeRemovableTextFieldEditable:0];
    }
  }
}

- (NSString)labelText
{
  if ([(TKVibrationPickerTableViewCell *)self _isDisplayingRemovableTextField])
  {
    v3 = [(UITextField *)self->_removableTextField text];
  }
  else
  {
    v4 = [(TKVibrationPickerTableViewCell *)self textLabel];
    v3 = [v4 text];
  }

  return (NSString *)v3;
}

- (void)setLabelText:(id)a3
{
  id v5 = a3;
  if ([(TKVibrationPickerTableViewCell *)self _isDisplayingRemovableTextField])
  {
    [(UITextField *)self->_removableTextField setText:v5];
  }
  else
  {
    v4 = [(TKVibrationPickerTableViewCell *)self textLabel];
    [v4 setText:v5];
  }
}

- (NSString)placeholderText
{
  return [(UITextField *)self->_removableTextField placeholder];
}

- (void)setPlaceholderText:(id)a3
{
}

- (UIFont)regularTextFont
{
  v2 = [(TKVibrationPickerTableViewCell *)self textLabel];
  v3 = [v2 font];

  return (UIFont *)v3;
}

- (void)setRegularTextFont:(id)a3
{
  id v7 = a3;
  v4 = [(TKVibrationPickerTableViewCell *)self textLabel];
  id v5 = [v4 font];

  if (v5 != v7)
  {
    v6 = [(TKVibrationPickerTableViewCell *)self textLabel];
    [v6 setFont:v7];

    [(UITextField *)self->_removableTextField setFont:v7];
  }
}

- (void)setRegularTextColor:(id)a3
{
  v6 = (UIColor *)a3;
  if (self->_regularTextColor != v6)
  {
    objc_storeStrong((id *)&self->_regularTextColor, a3);
    id v5 = [(TKVibrationPickerTableViewCell *)self textLabel];
    [v5 setTextColor:v6];

    [(UITextField *)self->_removableTextField setTextColor:v6];
  }
}

- (UIColor)highlightedTextColor
{
  v2 = [(TKVibrationPickerTableViewCell *)self textLabel];
  v3 = [v2 highlightedTextColor];

  return (UIColor *)v3;
}

- (void)setHighlightedTextColor:(id)a3
{
  id v4 = a3;
  id v5 = [(TKVibrationPickerTableViewCell *)self textLabel];
  [v5 setHighlightedTextColor:v4];
}

- (BOOL)isChecked
{
  return [(TKVibrationPickerTableViewCell *)self accessoryType] == 3;
}

- (void)setChecked:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(TKVibrationPickerTableViewCell *)self accessoryType];
  if (v3 || !v5)
  {
    if (!v3 || v5 == 3) {
      return;
    }
    v6 = self;
    uint64_t v7 = 3;
  }
  else
  {
    v6 = self;
    uint64_t v7 = 0;
  }
  [(TKVibrationPickerTableViewCell *)v6 setAccessoryType:v7];
  id v9 = [(TKVibrationPickerTableViewCell *)self textLabel];
  v8 = [(TKVibrationPickerTableViewCell *)self regularTextColor];
  [v9 setTextColor:v8];
}

- (BOOL)_isDisplayingRemovableTextField
{
  v2 = [(UITextField *)self->_removableTextField superview];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)makeTextFieldResignFirstResponderIfNeeded
{
  if ([(UITextField *)self->_removableTextField isFirstResponder])
  {
    removableTextField = self->_removableTextField;
    [(UITextField *)removableTextField resignFirstResponder];
  }
}

- (void)_layoutRemovableTextField
{
  if (self->_removableTextField)
  {
    id v15 = [(TKVibrationPickerTableViewCell *)self textLabel];
    BOOL v3 = [v15 font];
    [(UITextField *)self->_removableTextField setFont:v3];
    id v4 = [(TKVibrationPickerTableViewCell *)self contentView];
    [v4 bounds];
    CGRect v18 = CGRectInset(v17, 10.0, 0.0);
    double x = v18.origin.x;
    CGFloat y = v18.origin.y;
    double width = v18.size.width;
    double height = v18.size.height;
    double v9 = (double)[(TKVibrationPickerTableViewCell *)self indentationLevel];
    [(TKVibrationPickerTableViewCell *)self indentationWidth];
    double v11 = v10 * v9;
    v19.origin.double x = x + v10 * v9;
    v19.size.double width = width - v11;
    CGFloat v12 = v19.origin.x + 5.0;
    v19.origin.CGFloat y = y;
    v19.size.double height = height;
    CGFloat v13 = CGRectGetMaxX(v19) + -10.0;
    [v3 descender];
    -[UITextField setFrame:](self->_removableTextField, "setFrame:", v12, 0.0, v13, height + fabs(ceil(v14)));
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TKVibrationPickerTableViewCell;
  [(TKVibrationPickerTableViewCell *)&v3 layoutSubviews];
  [(TKVibrationPickerTableViewCell *)self _layoutRemovableTextField];
}

- (void)didTransitionToState:(unint64_t)a3
{
  char v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TKVibrationPickerTableViewCell;
  -[TKVibrationPickerTableViewCell didTransitionToState:](&v5, sel_didTransitionToState_);
  if (v3) {
    [(TKVibrationPickerTableViewCell *)self _makeRemovableTextFieldEditable:[(TKVibrationPickerTableViewCell *)self isEditable]];
  }
}

- (void)willTransitionToState:(unint64_t)a3
{
  char v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TKVibrationPickerTableViewCell;
  -[TKVibrationPickerTableViewCell willTransitionToState:](&v5, sel_willTransitionToState_);
  if ((v3 & 1) == 0) {
    [(TKVibrationPickerTableViewCell *)self _makeRemovableTextFieldEditable:0];
  }
}

- (void)_makeRemovableTextFieldEditable:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(TKVibrationPickerTableViewCell *)self _isDisplayingRemovableTextField] != a3)
  {
    id v10 = [(TKVibrationPickerTableViewCell *)self textLabel];
    removableTextField = self->_removableTextField;
    if (v3)
    {
      v6 = [v10 text];
      [(UITextField *)removableTextField setText:v6];

      [v10 setText:0];
      uint64_t v7 = [(TKVibrationPickerTableViewCell *)self contentView];
      [v7 addSubview:self->_removableTextField];
    }
    else
    {
      v8 = [(UITextField *)self->_removableTextField text];
      [v10 setText:v8];

      uint64_t v9 = [MEMORY[0x263F1CB60] areAnimationsEnabled];
      [MEMORY[0x263F1CB60] setAnimationsEnabled:1];
      [(UITextField *)self->_removableTextField resignFirstResponder];
      [MEMORY[0x263F1CB60] setAnimationsEnabled:v9];
      [(UITextField *)self->_removableTextField setText:0];
      [(UITextField *)self->_removableTextField removeFromSuperview];
    }
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  return +[TKVibrationInterfaceUtilities vibrationNameTextField:shouldChangeCharactersInRange:replacementString:](TKVibrationInterfaceUtilities, "vibrationNameTextField:shouldChangeCharactersInRange:replacementString:", a3, a4.location, a4.length, a5);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  if ((UIKeyboardIsAutomaticAppearanceEnabled() & 1) == 0 && (UIKeyboardAutomaticIsOnScreen() & 1) == 0)
  {
    MEMORY[0x270F060A8]();
  }
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v6 = a3;
  id v4 = [(TKVibrationPickerTableViewCell *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_super v5 = [v6 text];
    [v4 vibrationPickerTableViewCell:self endedEditingWithText:v5];
  }
  if ((UIKeyboardIsAutomaticAppearanceEnabled() & 1) == 0) {
    UIKeyboardForceOrderOutAutomatic();
  }
}

- (TKVibrationPickerTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TKVibrationPickerTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIColor)regularTextColor
{
  return self->_regularTextColor;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regularTextColor, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_removableTextField, 0);
}

@end