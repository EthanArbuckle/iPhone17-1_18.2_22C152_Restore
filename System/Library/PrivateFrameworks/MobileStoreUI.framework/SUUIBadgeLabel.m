@interface SUUIBadgeLabel
+ (id)defaultBackgroundColor;
+ (id)defaultTextColor;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIBadgeLabel)initWithFrame:(CGRect)a3;
- (void)drawTextInRect:(CGRect)a3;
@end

@implementation SUUIBadgeLabel

- (SUUIBadgeLabel)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SUUIBadgeLabel;
  v3 = -[SUUIBadgeLabel initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SUUIBadgeLabel *)v3 layer];
    [v5 setCornerRadius:6.0];

    v6 = [MEMORY[0x263F81708] systemFontOfSize:10.0];
    [(SUUIBadgeLabel *)v4 setFont:v6];

    [(SUUIBadgeLabel *)v4 setTextAlignment:1];
    [(SUUIBadgeLabel *)v4 setClipsToBounds:1];
    v7 = [(id)objc_opt_class() defaultBackgroundColor];
    [(SUUIBadgeLabel *)v4 setBackgroundColor:v7];

    v8 = [(id)objc_opt_class() defaultTextColor];
    [(SUUIBadgeLabel *)v4 setTextColor:v8];
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIBadgeLabel;
  -[SUUIBadgeLabel sizeThatFits:](&v7, sel_sizeThatFits_, a3.width, a3.height);
  double v4 = v3 + 9.0;
  double v6 = v5 + 0.0;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(SUUIBadgeLabel *)self superview];

  if (!v8)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    objc_super v10 = [(SUUIBadgeLabel *)self backgroundColor];
    [v10 set];

    v11 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, 6.0);
    [v11 fill];

    CGContextRestoreGState(CurrentContext);
  }
  v12.receiver = self;
  v12.super_class = (Class)SUUIBadgeLabel;
  -[SUUIBadgeLabel drawTextInRect:](&v12, sel_drawTextInRect_, x, y, width, height);
}

+ (id)defaultBackgroundColor
{
  return (id)[MEMORY[0x263F825C8] colorWithWhite:0.517647059 alpha:1.0];
}

+ (id)defaultTextColor
{
  return (id)[MEMORY[0x263F825C8] whiteColor];
}

@end