@interface PKTextFieldTableViewCell
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKTextFieldTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UITextField)textField;
- (void)layoutSubviews;
@end

@implementation PKTextFieldTableViewCell

- (PKTextFieldTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PKTextFieldTableViewCell;
  v4 = [(PKTextFieldTableViewCell *)&v10 initWithStyle:1 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB1D70]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    textField = v4->_textField;
    v4->_textField = (UITextField *)v6;

    [(UITextField *)v4->_textField setAdjustsFontSizeToFitWidth:1];
    v8 = [(PKTextFieldTableViewCell *)v4 contentView];
    [v8 addSubview:v4->_textField];
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_isTemplateLayout = 1;
  -[PKTextFieldTableViewCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PKTextFieldTableViewCell;
  [(PKTextFieldTableViewCell *)&v12 layoutSubviews];
  v3 = [(PKTextFieldTableViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[PKTextFieldTableViewCell _layoutWithBounds:](self, "_layoutWithBounds:", v5, v7, v9, v11);
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(PKTextFieldTableViewCell *)self _shouldReverseLayoutDirection]) {
    CGRectEdge v8 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v8 = CGRectMinXEdge;
  }
  [(UITableViewCell *)self pkui_effectiveLayoutMargins];
  double v10 = v9;
  double v12 = v11;
  CGFloat v14 = x + v13;
  remainder.origin.double x = x + v13;
  remainder.origin.double y = y + v9;
  remainder.size.double width = width - (v13 + v15);
  remainder.size.double height = height - (v9 + v11);
  memset(&slice, 0, sizeof(slice));
  v16 = [(PKTextFieldTableViewCell *)self textLabel];
  objc_msgSend(v16, "pkui_sizeThatFits:", remainder.size.width, remainder.size.height);
  CGFloat v18 = v17;
  uint64_t v25 = v19;
  v30.origin.double x = v14;
  v30.origin.double y = remainder.origin.y;
  v30.size.double width = remainder.size.width;
  v30.size.double height = remainder.size.height;
  CGRectDivide(v30, &slice, &remainder, v18, v8);
  if (!self->_isTemplateLayout) {
    objc_msgSend(v16, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  if (v18 > 0.0) {
    CGRectDivide(remainder, &slice, &remainder, 8.0, v8);
  }
  -[UITextField sizeThatFits:](self->_textField, "sizeThatFits:", remainder.size.width, remainder.size.height, v25);
  double v21 = v20;
  if (!self->_isTemplateLayout) {
    -[UITextField setFrame:](self->_textField, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
  }
  v31.origin.double y = y;
  v31.origin.double x = x;
  v31.size.double width = width;
  v31.size.double height = height;
  CGFloat v22 = CGRectGetWidth(v31);

  double v23 = v22;
  double v24 = v12 + v10 + fmax(v26, v21);
  result.double height = v24;
  result.double width = v23;
  return result;
}

- (UITextField)textField
{
  return self->_textField;
}

- (void).cxx_destruct
{
}

@end