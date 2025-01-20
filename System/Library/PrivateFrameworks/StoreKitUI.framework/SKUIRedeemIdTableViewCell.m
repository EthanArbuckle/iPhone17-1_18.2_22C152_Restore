@interface SKUIRedeemIdTableViewCell
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (SKUIRedeemIdTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (SKUIRedeemIdTableViewCellDelegate)delegate;
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

@implementation SKUIRedeemIdTableViewCell

- (SKUIRedeemIdTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemIdTableViewCell initWithStyle:reuseIdentifier:]();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIRedeemIdTableViewCell;
  v7 = [(SKUIRedeemIdTableViewCell *)&v10 initWithStyle:a3 reuseIdentifier:v6];
  v8 = v7;
  if (v7)
  {
    [(SKUIRedeemIdTableViewCell *)v7 setSelectionStyle:0];
    [(SKUIRedeemIdTableViewCell *)v8 _initializeTextField];
  }

  return v8;
}

- (void)layoutSubviews
{
  v3 = [(SKUIRedeemIdTableViewCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(SKUIRedeemIdTableViewCell *)self separatorInset];
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

  v18 = [(SKUIRedeemIdTableViewCell *)self textField];
  objc_msgSend(v18, "setFrame:", x, y, width, height);

  v19.receiver = self;
  v19.super_class = (Class)SKUIRedeemIdTableViewCell;
  [(SKUIRedeemIdTableViewCell *)&v19 layoutSubviews];
}

- (BOOL)becomeFirstResponder
{
  v3 = [(SKUIRedeemIdTableViewCell *)self textField];
  [v3 setUserInteractionEnabled:1];

  double v4 = [(SKUIRedeemIdTableViewCell *)self textField];
  [v4 becomeFirstResponder];

  return 1;
}

- (BOOL)resignFirstResponder
{
  v3 = [(SKUIRedeemIdTableViewCell *)self textField];
  [v3 setUserInteractionEnabled:0];

  double v4 = [(SKUIRedeemIdTableViewCell *)self textField];
  [v4 resignFirstResponder];

  return 1;
}

- (void)setPlaceholderText:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIRedeemIdTableViewCell *)self textField];
  [v5 setPlaceholder:v4];
}

- (void)setKeyboardType:(int64_t)a3
{
  id v4 = [(SKUIRedeemIdTableViewCell *)self textField];
  [v4 setKeyboardType:a3];
}

- (void)setReturnKeyType:(int64_t)a3
{
  id v4 = [(SKUIRedeemIdTableViewCell *)self textField];
  [v4 setReturnKeyType:a3];
}

- (void)setAutoCapitalizationType:(int64_t)a3
{
  id v4 = [(SKUIRedeemIdTableViewCell *)self textField];
  [v4 setAutocapitalizationType:a3];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIRedeemIdTableViewCell *)self delegate];
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
  id v6 = [(SKUIRedeemIdTableViewCell *)self delegate];
  id v5 = [v4 text];

  [v6 redeemIdCell:self didChangeToText:v5];
}

- (void)_initializeTextField
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D70]);
  id v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(SKUIRedeemIdTableViewCell *)self setTextField:v4];

  id v5 = [(SKUIRedeemIdTableViewCell *)self textField];
  [v5 setDelegate:self];

  id v6 = [(SKUIRedeemIdTableViewCell *)self textField];
  [v6 setUserInteractionEnabled:0];

  CGFloat v7 = [(SKUIRedeemIdTableViewCell *)self textField];
  [v7 setClearButtonMode:1];

  double v8 = [(SKUIRedeemIdTableViewCell *)self textField];
  CGFloat v9 = [MEMORY[0x1E4FB1618] clearColor];
  [v8 setBackgroundColor:v9];

  double v10 = [(SKUIRedeemIdTableViewCell *)self textField];
  [v10 addTarget:self action:sel_textFieldDidChange_ forControlEvents:0x20000];

  id v12 = [(SKUIRedeemIdTableViewCell *)self contentView];
  CGFloat v11 = [(SKUIRedeemIdTableViewCell *)self textField];
  [v12 addSubview:v11];
}

- (SKUIRedeemIdTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIRedeemIdTableViewCellDelegate *)WeakRetained;
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

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRedeemIdTableViewCell initWithStyle:reuseIdentifier:]";
}

@end