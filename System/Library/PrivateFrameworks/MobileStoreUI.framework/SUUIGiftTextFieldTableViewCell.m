@interface SUUIGiftTextFieldTableViewCell
- (BOOL)isEnabled;
- (BOOL)leftToRight;
- (NSAttributedString)attributedPlaceholder;
- (NSString)label;
- (NSString)value;
- (SUUIGiftTextFieldTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIControl)textField;
- (UITextFieldDelegate)textFieldDelegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)keyboardType;
- (void)layoutSubviews;
- (void)setAttributedPlaceholder:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setLabel:(id)a3;
- (void)setLeftToRight:(BOOL)a3;
- (void)setTextFieldDelegate:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SUUIGiftTextFieldTableViewCell

- (SUUIGiftTextFieldTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)SUUIGiftTextFieldTableViewCell;
  v4 = [(SUUIGiftTextFieldTableViewCell *)&v21 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(SUUIGiftTextFieldTableViewCell *)v4 contentView];
    v7 = (UITextField *)objc_alloc_init(MEMORY[0x263F82CF0]);
    textField = v5->_textField;
    v5->_textField = v7;

    v9 = v5->_textField;
    v10 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(UITextField *)v9 setBackgroundColor:v10];

    v11 = v5->_textField;
    v12 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
    [(UITextField *)v11 setFont:v12];

    v13 = v5->_textField;
    v14 = [MEMORY[0x263F825C8] labelColor];
    [(UITextField *)v13 setTextColor:v14];

    [(UITextField *)v5->_textField sizeToFit];
    [v6 addSubview:v5->_textField];
    v15 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    topBorderView = v5->_topBorderView;
    v5->_topBorderView = v15;

    v17 = v5->_topBorderView;
    v18 = [MEMORY[0x263F825C8] separatorColor];
    [(UIView *)v17 setBackgroundColor:v18];

    [v6 addSubview:v5->_topBorderView];
    v19 = [MEMORY[0x263F82438] sharedApplication];
    v5->_leftToRight = [v19 userInterfaceLayoutDirection] == 0;
  }
  return v5;
}

- (NSAttributedString)attributedPlaceholder
{
  return [(UITextField *)self->_textField attributedPlaceholder];
}

- (BOOL)isEnabled
{
  return [(UITextField *)self->_textField isEnabled];
}

- (int64_t)keyboardType
{
  return [(UITextField *)self->_textField keyboardType];
}

- (NSString)label
{
  return [(UILabel *)self->_label text];
}

- (void)setAttributedPlaceholder:(id)a3
{
}

- (void)setEnabled:(BOOL)a3
{
  -[UITextField setEnabled:](self->_textField, "setEnabled:");
  textField = self->_textField;
  v6 = [MEMORY[0x263F825C8] labelColor];
  id v8 = v6;
  if (a3)
  {
    [(UITextField *)textField setTextColor:v6];
  }
  else
  {
    v7 = [v6 colorWithAlphaComponent:0.3];
    [(UITextField *)textField setTextColor:v7];
  }
}

- (void)setKeyboardType:(int64_t)a3
{
  [(UITextField *)self->_textField setAutocapitalizationType:a3 != 7];
  textField = self->_textField;
  [(UITextField *)textField setKeyboardType:a3];
}

- (void)setLabel:(id)a3
{
  id v16 = a3;
  id v4 = [(SUUIGiftTextFieldTableViewCell *)self label];
  if (v4 != v16 && ([v16 isEqualToString:v4] & 1) == 0)
  {
    label = self->_label;
    if (v16)
    {
      if (!label)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v7 = self->_label;
        self->_label = v6;

        id v8 = self->_label;
        v9 = [MEMORY[0x263F825C8] systemBackgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        v10 = self->_label;
        v11 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
        [(UILabel *)v10 setFont:v11];

        v12 = self->_label;
        v13 = [MEMORY[0x263F825C8] secondaryLabelColor];
        [(UILabel *)v12 setTextColor:v13];

        v14 = [(SUUIGiftTextFieldTableViewCell *)self contentView];
        [v14 addSubview:self->_label];

        label = self->_label;
      }
      -[UILabel setText:](label, "setText:");
      [(UILabel *)self->_label sizeToFit];
    }
    else
    {
      [(UILabel *)label removeFromSuperview];
      v15 = self->_label;
      self->_label = 0;
    }
    [(SUUIGiftTextFieldTableViewCell *)self setNeedsLayout];
  }
}

- (void)setTextFieldDelegate:(id)a3
{
}

- (void)setValue:(id)a3
{
}

- (UITextFieldDelegate)textFieldDelegate
{
  return (UITextFieldDelegate *)[(UITextField *)self->_textField delegate];
}

- (NSString)value
{
  return [(UITextField *)self->_textField text];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIGiftTextFieldTableViewCell;
  v5 = -[SUUIGiftTextFieldTableViewCell hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  if ([v5 isDescendantOfView:self])
  {
    v6 = self->_textField;

    v5 = v6;
  }
  return v5;
}

- (void)layoutSubviews
{
  v43.receiver = self;
  v43.super_class = (Class)SUUIGiftTextFieldTableViewCell;
  [(SUUIGiftTextFieldTableViewCell *)&v43 layoutSubviews];
  v3 = [(SUUIGiftTextFieldTableViewCell *)self contentView];
  [v3 bounds];
  double v39 = v5;
  double v41 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v7 + -15.0;
  label = self->_label;
  if (label)
  {
    [(UILabel *)label frame];
    double width = v44.size.width;
    double height = v44.size.height;
    double v14 = 15.0;
    v44.origin.x = 15.0;
    double MaxX = CGRectGetMaxX(v44);
    float v16 = (v9 - height) * 0.5;
    double v17 = floorf(v16);
    -[UILabel setFrame:](self->_label, "setFrame:", 15.0, v17, width, height);
    BOOL v18 = [(SUUIGiftTextFieldTableViewCell *)self leftToRight];
    v19 = self->_label;
    if (!v18)
    {
      +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", 15.0, v17, width, height, v41, v39, v7, v9);
      double v14 = v20;
      double v17 = v21;
      double width = v22;
      double height = v23;
    }
    double v24 = MaxX + 5.0;
    -[UILabel setFrame:](v19, "setFrame:", v14, v17, width, height, *(void *)&v39, *(void *)&v41);
  }
  else
  {
    double v24 = 15.0;
  }
  [(UITextField *)self->_textField frame];
  double v26 = v25;
  double v27 = v10 - v24;
  float v28 = (v9 - v25) * 0.5;
  double v29 = floorf(v28);
  BOOL v30 = [(SUUIGiftTextFieldTableViewCell *)self leftToRight];
  textField = self->_textField;
  if (!v30)
  {
    +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v24, v29, v10 - v24, v26, v42, v40, v7, v9);
    double v24 = v32;
    double v29 = v33;
    double v27 = v34;
    double v26 = v35;
  }
  -[UITextField setFrame:](textField, "setFrame:", v24, v29, v27, v26);
  topBorderView = self->_topBorderView;
  v37 = [MEMORY[0x263F82B60] mainScreen];
  [v37 scale];
  -[UIView setFrame:](topBorderView, "setFrame:", 15.0, 0.0, v7 + -15.0, 1.0 / v38);
}

- (UIControl)textField
{
  return &self->_textField->super;
}

- (BOOL)leftToRight
{
  return self->_leftToRight;
}

- (void)setLeftToRight:(BOOL)a3
{
  self->_leftToRight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end