@interface DBSDisplayNameLabel
- (CGSize)intrinsicContentSize;
- (DBSDisplayNameLabel)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)textMargins;
- (void)drawTextInRect:(CGRect)a3;
- (void)setTextMargins:(UIEdgeInsets)a3;
@end

@implementation DBSDisplayNameLabel

- (DBSDisplayNameLabel)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)DBSDisplayNameLabel;
  v3 = -[DBSDisplayNameLabel initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[DBSDisplayNameLabel setTextMargins:](v3, "setTextMargins:", 3.0, 10.0, 3.0, 10.0);
    v5 = [(DBSDisplayNameLabel *)v4 layer];
    [v5 setMasksToBounds:1];

    v6 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.4];
    [(DBSDisplayNameLabel *)v4 setBackgroundColor:v6];

    v7 = [MEMORY[0x263F825C8] whiteColor];
    [(DBSDisplayNameLabel *)v4 setTextColor:v7];

    v8 = (void *)MEMORY[0x263F81708];
    [MEMORY[0x263F81708] systemFontSize];
    v9 = objc_msgSend(v8, "systemFontOfSize:");
    [(DBSDisplayNameLabel *)v4 setFont:v9];

    [(DBSDisplayNameLabel *)v4 intrinsicContentSize];
    double v11 = v10 * 0.5;
    v12 = [(DBSDisplayNameLabel *)v4 layer];
    [v12 setCornerRadius:v11];
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  v3 = [(DBSDisplayNameLabel *)self text];

  if (!v3) {
    [(DBSDisplayNameLabel *)self setText:@"Sizing"];
  }
  v17.receiver = self;
  v17.super_class = (Class)DBSDisplayNameLabel;
  [(DBSDisplayNameLabel *)&v17 intrinsicContentSize];
  double v5 = v4;
  double v7 = v6;
  if (!v3) {
    [(DBSDisplayNameLabel *)self setText:0];
  }
  [(DBSDisplayNameLabel *)self textMargins];
  double v9 = v7 + v8;
  [(DBSDisplayNameLabel *)self textMargins];
  double v11 = v9 + v10;
  [(DBSDisplayNameLabel *)self textMargins];
  double v13 = v5 + v12;
  [(DBSDisplayNameLabel *)self textMargins];
  double v15 = v13 + v14;
  double v16 = v11;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(DBSDisplayNameLabel *)self textMargins];
  v12.receiver = self;
  v12.super_class = (Class)DBSDisplayNameLabel;
  -[DBSDisplayNameLabel drawTextInRect:](&v12, sel_drawTextInRect_, x + v11, y + v8, width - (v11 + v9), height - (v8 + v10));
}

- (UIEdgeInsets)textMargins
{
  double top = self->_textMargins.top;
  double left = self->_textMargins.left;
  double bottom = self->_textMargins.bottom;
  double right = self->_textMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTextMargins:(UIEdgeInsets)a3
{
  self->_textMargins = a3;
}

@end