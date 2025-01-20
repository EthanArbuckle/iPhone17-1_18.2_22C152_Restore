@interface MTEditableTextFieldCell
+ (id)textFont;
- (BOOL)canBecomeFirstResponder;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (UITextField)textField;
- (UITextFieldDelegate)delegate;
- (id)textChanged;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setTextChanged:(id)a3;
- (void)setTextField:(id)a3;
- (void)setupCell;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateFonts;
@end

@implementation MTEditableTextFieldCell

+ (id)textFont
{
  return +[UIFont mt_preferredFontForTextStyle:UIFontTextStyleBody];
}

- (void)updateFonts
{
  id v4 = [(id)objc_opt_class() textFont];
  v3 = [(MTEditableTextFieldCell *)self textField];
  [v3 setFont:v4];
}

- (void)setupCell
{
  id v3 = objc_alloc((Class)UITextField);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  textField = self->_textField;
  self->_textField = v7;

  [(UITextField *)self->_textField setContentVerticalAlignment:0];
  [(UITextField *)self->_textField setClearButtonMode:3];
  v9 = self->_textField;
  id v10 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(UITextField *)v9 setLeftView:v10];

  [(UITextField *)self->_textField setLeftViewMode:3];
  v11 = self->_textField;
  v12 = +[UIColor colorWithRed:0.556862745 green:0.556862745 blue:0.576470588 alpha:1.0];
  [(UITextField *)v11 setTextColor:v12];

  [(UITextField *)self->_textField setDelegate:self];
  v13 = [(MTEditableTextFieldCell *)self contentView];
  [v13 addSubview:self->_textField];

  [(MTEditableTextFieldCell *)self updateFonts];
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)MTEditableTextFieldCell;
  [(MTTableViewCell *)&v15 layoutSubviews];
  [(MTEditableTextFieldCell *)self updateFonts];
  id v3 = [(MTEditableTextFieldCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  [(MTEditableTextFieldCell *)self layoutMargins];
  double v11 = v10;
  [(MTEditableTextFieldCell *)self layoutMargins];
  double v13 = v12;
  [(MTEditableTextFieldCell *)self layoutMargins];
  -[UITextField setFrame:](self->_textField, "setFrame:", v11, v5, v7 - (v13 + v14), v9);
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
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
  id v8 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 textFieldDidBeginEditing:v8];
  }
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  id v4 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    unsigned __int8 v9 = [v8 textFieldShouldEndEditing:v4];
  }
  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v10 = a3;
  id v4 = [(MTEditableTextFieldCell *)self textChanged];
  double v5 = [v10 text];
  ((void (**)(void, void *))v4)[2](v4, v5);

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    [v9 textFieldDidEndEditing:v10];
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v14 = objc_loadWeakRetained((id *)p_delegate);
    unsigned __int8 v15 = [v14 textField:v9 shouldChangeCharactersInRange:location length:length replacementString:v10];
  }
  else
  {
    unsigned __int8 v15 = 1;
  }

  return v15;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  id v4 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    unsigned __int8 v9 = [v8 textFieldShouldClear:v4];
  }
  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    unsigned __int8 v9 = [v8 textFieldShouldReturn:v4];
  }
  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
}

- (id)textChanged
{
  return self->_textChanged;
}

- (void)setTextChanged:(id)a3
{
}

- (UITextFieldDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UITextFieldDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_textChanged, 0);

  objc_storeStrong((id *)&self->_textField, 0);
}

@end