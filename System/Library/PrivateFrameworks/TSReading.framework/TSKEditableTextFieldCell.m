@interface TSKEditableTextFieldCell
- (TSKEditableTextFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UITextField)textField;
- (void)beginEditing;
- (void)dealloc;
- (void)endEditing;
- (void)layoutSubviews;
- (void)setTextField:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation TSKEditableTextFieldCell

- (TSKEditableTextFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TSKEditableTextFieldCell;
  v4 = [(TSKEditableTextFieldCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F1CA98]);
    v6 = (UITextField *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    v4->mTextField = v6;
    [(UITextField *)v6 setContentVerticalAlignment:0];
    [(UITextField *)v4->mTextField setTextAlignment:1];
    -[UITextField setFont:](v4->mTextField, "setFont:", [MEMORY[0x263F1C658] systemFontOfSize:17.0]);
    [(UITextField *)v4->mTextField setReturnKeyType:9];
    [(UITextField *)v4->mTextField setUserInteractionEnabled:0];
    v7 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v4 selector:sel_textFieldDidEndEditing_ name:*MEMORY[0x263F1D780] object:v4->mTextField];
  }
  return v4;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)TSKEditableTextFieldCell;
  [(TSKEditableTextFieldCell *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)TSKEditableTextFieldCell;
  [(TSKEditableTextFieldCell *)&v15 layoutSubviews];
  objc_msgSend((id)-[TSKEditableTextFieldCell contentView](self, "contentView"), "bounds");
  CGRect v17 = CGRectInset(v16, 10.0, 0.0);
  CGRect v18 = CGRectIntegral(v17);
  double x = v18.origin.x;
  double y = v18.origin.y;
  double width = v18.size.width;
  double height = v18.size.height;
  uint64_t v7 = [(UITextField *)self->mTextField contentVerticalAlignment];
  double v8 = height + 1.0;
  if ((uint64_t)height) {
    double v8 = height;
  }
  if (!v7) {
    double height = v8;
  }
  objc_super v9 = (void *)[(TSKEditableTextFieldCell *)self textLabel];
  v10 = (void *)[v9 text];
  if (v10 && [v10 length])
  {
    objc_msgSend(v9, "textRectForBounds:limitedToNumberOfLines:", 1, x, y, width, height);
    *(float *)&double v11 = v11 + v12;
    double v13 = *(float *)&v11;
    double x = x + v13;
    double width = width - v13;
  }
  if ([(TSKEditableTextFieldCell *)self showsReorderControl]) {
    double v14 = width + -40.0;
  }
  else {
    double v14 = width;
  }
  -[UITextField setFrame:](self->mTextField, "setFrame:", x, y, v14, height);
  objc_msgSend((id)-[TSKEditableTextFieldCell contentView](self, "contentView"), "addSubview:", self->mTextField);
}

- (void)beginEditing
{
  [(UITextField *)self->mTextField setUserInteractionEnabled:1];
  mTextField = self->mTextField;

  [(UITextField *)mTextField becomeFirstResponder];
}

- (void)endEditing
{
}

- (void)textFieldDidEndEditing:(id)a3
{
}

- (UITextField)textField
{
  return self->mTextField;
}

- (void)setTextField:(id)a3
{
}

@end