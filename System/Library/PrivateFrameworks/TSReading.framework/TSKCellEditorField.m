@interface TSKCellEditorField
- (NSString)leftSymbol;
- (NSString)rightSymbol;
- (NSString)text;
- (TSKCellEditorField)initWithFrame:(CGRect)a3;
- (UILabel)leftSymbolView;
- (UILabel)rightSymbolView;
- (UITextView)textView;
- (id)p_symbolContainerBackgroundColor;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setLeftSymbol:(id)a3;
- (void)setLeftSymbolView:(id)a3;
- (void)setRightSymbol:(id)a3;
- (void)setRightSymbolView:(id)a3;
- (void)setText:(id)a3;
- (void)setTextView:(id)a3;
@end

@implementation TSKCellEditorField

- (TSKCellEditorField)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)TSKCellEditorField;
  v7 = -[TSKCellEditorField initWithFrame:](&v9, sel_initWithFrame_);
  if (v7)
  {
    v7->mTextView = (UITextView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CAC8]), "initWithFrame:", x, y, width, height);
    v7->mLeftSymbolView = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", x, y, width, height);
    v7->mRightSymbolView = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", x, y, width, height);
    [(UILabel *)v7->mLeftSymbolView setBackgroundColor:[(TSKCellEditorField *)v7 p_symbolContainerBackgroundColor]];
    [(UILabel *)v7->mRightSymbolView setBackgroundColor:[(TSKCellEditorField *)v7 p_symbolContainerBackgroundColor]];
    objc_msgSend((id)-[UILabel layer](v7->mLeftSymbolView, "layer"), "setCornerRadius:", 4.0);
    objc_msgSend((id)-[UILabel layer](v7->mRightSymbolView, "layer"), "setCornerRadius:", 4.0);
    -[TSKCellEditorField setBackgroundColor:](v7, "setBackgroundColor:", [MEMORY[0x263F1C550] colorWithRed:0.678431373 green:0.745098039 blue:0.678431373 alpha:1.0]);
    -[UITextView setBackgroundColor:](v7->mTextView, "setBackgroundColor:", [MEMORY[0x263F1C550] colorWithRed:0.678431373 green:0.745098039 blue:0.678431373 alpha:1.0]);
    -[UITextView setFont:](v7->mTextView, "setFont:", [MEMORY[0x263F1C658] systemFontOfSize:36.0]);
    [(TSKCellEditorField *)v7 addSubview:v7->mTextView];
    [(TSKCellEditorField *)v7 addSubview:v7->mLeftSymbolView];
    [(TSKCellEditorField *)v7 addSubview:v7->mRightSymbolView];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKCellEditorField;
  [(TSKCellEditorField *)&v3 dealloc];
}

- (id)p_symbolContainerBackgroundColor
{
  return (id)[MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.2];
}

- (NSString)text
{
  return [(UITextView *)self->mTextView text];
}

- (void)setText:(id)a3
{
  [(UITextView *)self->mTextView setText:a3];

  [(TSKCellEditorField *)self setNeedsLayout];
}

- (NSString)leftSymbol
{
  return [(UILabel *)self->mLeftSymbolView text];
}

- (void)setLeftSymbol:(id)a3
{
  [(UILabel *)self->mLeftSymbolView setText:a3];

  [(TSKCellEditorField *)self setNeedsLayout];
}

- (NSString)rightSymbol
{
  return [(UILabel *)self->mRightSymbolView text];
}

- (void)setRightSymbol:(id)a3
{
  [(UILabel *)self->mRightSymbolView setText:a3];

  [(TSKCellEditorField *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  [(TSKCellEditorField *)self frame];
  double v4 = v3;
  v5 = [(UILabel *)[(TSKCellEditorField *)self leftSymbolView] text];
  v6 = [(TSKCellEditorField *)self leftSymbolView];
  if (v5)
  {
    [(UILabel *)v6 setHidden:0];
    [(UILabel *)[(TSKCellEditorField *)self leftSymbolView] sizeToFit];
    [(UILabel *)[(TSKCellEditorField *)self leftSymbolView] frame];
    -[UILabel setFrame:]([(TSKCellEditorField *)self leftSymbolView], "setFrame:", 0.0, v7, v8, v9);
    [(UILabel *)[(TSKCellEditorField *)self leftSymbolView] bounds];
    double v11 = v10;
  }
  else
  {
    [(UILabel *)v6 setHidden:1];
    double v11 = 0.0;
  }
  v12 = [(UILabel *)[(TSKCellEditorField *)self rightSymbolView] text];
  v13 = [(TSKCellEditorField *)self rightSymbolView];
  if (v12)
  {
    [(UILabel *)v13 setHidden:0];
    [(UILabel *)[(TSKCellEditorField *)self rightSymbolView] sizeToFit];
    [(UILabel *)[(TSKCellEditorField *)self rightSymbolView] frame];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    [(TSKCellEditorField *)self frame];
    double v21 = v20;
    [(UILabel *)[(TSKCellEditorField *)self rightSymbolView] frame];
    double v4 = v21 - v22;
    -[UILabel setFrame:]([(TSKCellEditorField *)self rightSymbolView], "setFrame:", v4, v15, v17, v19);
  }
  else
  {
    [(UILabel *)v13 setHidden:1];
  }
  [(TSKCellEditorField *)self frame];
  double v24 = v23;
  v25 = [(TSKCellEditorField *)self textView];

  -[UITextView setFrame:](v25, "setFrame:", v11, 0.0, v4 - v11, v24);
}

- (UITextView)textView
{
  return self->mTextView;
}

- (void)setTextView:(id)a3
{
}

- (UILabel)leftSymbolView
{
  return self->mLeftSymbolView;
}

- (void)setLeftSymbolView:(id)a3
{
}

- (UILabel)rightSymbolView
{
  return self->mRightSymbolView;
}

- (void)setRightSymbolView:(id)a3
{
}

@end