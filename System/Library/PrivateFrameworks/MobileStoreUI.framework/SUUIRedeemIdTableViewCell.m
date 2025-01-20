@interface SUUIRedeemIdTableViewCell
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (SUUIRedeemIdTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (SUUIRedeemIdTableViewCellDelegate)delegate;
- (UITextField)textField;
- (void)_initializeTextField;
- (void)layoutSubviews;
- (void)setAutoCapitalizationType:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setPlaceholderText:(id)a3;
- (void)setReturnKeyType:(int64_t)a3;
- (void)setTextField:(id)a3;
- (void)textFieldDidChange:(id)a3;
@end

@implementation SUUIRedeemIdTableViewCell

- (SUUIRedeemIdTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIRedeemIdTableViewCell;
  v4 = [(SUUIRedeemIdTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(SUUIRedeemIdTableViewCell *)v4 setSelectionStyle:0];
    [(SUUIRedeemIdTableViewCell *)v5 _initializeTextField];
  }
  return v5;
}

- (void)layoutSubviews
{
  v3 = [(SUUIRedeemIdTableViewCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(SUUIRedeemIdTableViewCell *)self separatorInset];
  CGFloat v13 = v12;
  v20.origin.double x = v5;
  v20.origin.double y = v7;
  v20.size.double width = v9;
  v20.size.double height = v11;
  CGRect v21 = CGRectInset(v20, v13, 0.0);
  double x = v21.origin.x;
  double y = v21.origin.y;
  double width = v21.size.width;
  double height = v21.size.height;

  v18 = [(SUUIRedeemIdTableViewCell *)self textField];
  objc_msgSend(v18, "setFrame:", x, y, width, height);

  v19.receiver = self;
  v19.super_class = (Class)SUUIRedeemIdTableViewCell;
  [(SUUIRedeemIdTableViewCell *)&v19 layoutSubviews];
}

- (BOOL)becomeFirstResponder
{
  v3 = [(SUUIRedeemIdTableViewCell *)self textField];
  [v3 setUserInteractionEnabled:1];

  double v4 = [(SUUIRedeemIdTableViewCell *)self textField];
  [v4 becomeFirstResponder];

  return 1;
}

- (BOOL)resignFirstResponder
{
  v3 = [(SUUIRedeemIdTableViewCell *)self textField];
  [v3 setUserInteractionEnabled:0];

  double v4 = [(SUUIRedeemIdTableViewCell *)self textField];
  [v4 resignFirstResponder];

  return 1;
}

- (void)setPlaceholderText:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIRedeemIdTableViewCell *)self textField];
  [v5 setPlaceholder:v4];
}

- (void)setKeyboardType:(int64_t)a3
{
  id v4 = [(SUUIRedeemIdTableViewCell *)self textField];
  [v4 setKeyboardType:a3];
}

- (void)setReturnKeyType:(int64_t)a3
{
  id v4 = [(SUUIRedeemIdTableViewCell *)self textField];
  [v4 setReturnKeyType:a3];
}

- (void)setAutoCapitalizationType:(int64_t)a3
{
  id v4 = [(SUUIRedeemIdTableViewCell *)self textField];
  [v4 setAutocapitalizationType:a3];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIRedeemIdTableViewCell *)self delegate];
  double v6 = [v4 text];

  [v5 redeemIdCell:self didReturnWithText:v6];
  return 1;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  return 1;
}

- (void)textFieldDidChange:(id)a3
{
  id v4 = a3;
  id v6 = [(SUUIRedeemIdTableViewCell *)self delegate];
  id v5 = [v4 text];

  [v6 redeemIdCell:self didChangeToText:v5];
}

- (void)_initializeTextField
{
  id v3 = objc_alloc(MEMORY[0x263F82CF0]);
  id v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(SUUIRedeemIdTableViewCell *)self setTextField:v4];

  id v5 = [(SUUIRedeemIdTableViewCell *)self textField];
  [v5 setDelegate:self];

  id v6 = [(SUUIRedeemIdTableViewCell *)self textField];
  [v6 setUserInteractionEnabled:0];

  CGFloat v7 = [(SUUIRedeemIdTableViewCell *)self textField];
  [v7 setClearButtonMode:1];

  double v8 = [(SUUIRedeemIdTableViewCell *)self textField];
  CGFloat v9 = [MEMORY[0x263F825C8] clearColor];
  [v8 setBackgroundColor:v9];

  double v10 = [(SUUIRedeemIdTableViewCell *)self textField];
  [v10 addTarget:self action:sel_textFieldDidChange_ forControlEvents:0x20000];

  id v12 = [(SUUIRedeemIdTableViewCell *)self contentView];
  CGFloat v11 = [(SUUIRedeemIdTableViewCell *)self textField];
  [v12 addSubview:v11];
}

- (SUUIRedeemIdTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIRedeemIdTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end