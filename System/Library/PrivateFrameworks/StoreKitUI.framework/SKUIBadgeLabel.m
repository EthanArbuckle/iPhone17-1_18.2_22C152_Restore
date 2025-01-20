@interface SKUIBadgeLabel
+ (id)defaultBackgroundColor;
+ (id)defaultTextColor;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SKUIBadgeLabel)initWithFrame:(CGRect)a3;
- (void)drawTextInRect:(CGRect)a3;
@end

@implementation SKUIBadgeLabel

- (SKUIBadgeLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBadgeLabel initWithFrame:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIBadgeLabel;
  v8 = -[SKUIBadgeLabel initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    v10 = [(SKUIBadgeLabel *)v8 layer];
    [v10 setCornerRadius:6.0];

    v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:10.0];
    [(SKUIBadgeLabel *)v9 setFont:v11];

    [(SKUIBadgeLabel *)v9 setTextAlignment:1];
    [(SKUIBadgeLabel *)v9 setClipsToBounds:1];
    v12 = [(id)objc_opt_class() defaultBackgroundColor];
    [(SKUIBadgeLabel *)v9 setBackgroundColor:v12];

    v13 = [(id)objc_opt_class() defaultTextColor];
    [(SKUIBadgeLabel *)v9 setTextColor:v13];
  }
  return v9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKUIBadgeLabel;
  -[SKUIBadgeLabel sizeThatFits:](&v7, sel_sizeThatFits_, a3.width, a3.height);
  double v4 = v3 + 9.0;
  double v6 = v5 + 0.0;
  result.double height = v6;
  result.double width = v4;
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(SKUIBadgeLabel *)self superview];

  if (!v8)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    v10 = [(SKUIBadgeLabel *)self backgroundColor];
    [v10 set];

    v11 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, 6.0);
    [v11 fill];

    CGContextRestoreGState(CurrentContext);
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIBadgeLabel;
  -[SKUIBadgeLabel drawTextInRect:](&v12, sel_drawTextInRect_, x, y, width, height);
}

+ (id)defaultBackgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithWhite:0.517647059 alpha:1.0];
}

+ (id)defaultTextColor
{
  return (id)[MEMORY[0x1E4FB1618] whiteColor];
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIBadgeLabel initWithFrame:]";
}

@end