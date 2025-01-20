@interface SKUIRedeemTextField
- (BOOL)backdropBackground;
- (BOOL)suppressBorder;
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)placeholderRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
- (SKUIRedeemTextField)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackdropBackground:(BOOL)a3;
- (void)setSuppressBorder:(BOOL)a3;
@end

@implementation SKUIRedeemTextField

- (SKUIRedeemTextField)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemTextField initWithFrame:]();
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIRedeemTextField;
  v8 = -[SKUIRedeemTextField initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:10060];
    backdropView = v8->_backdropView;
    v8->_backdropView = (UIView *)v9;

    [(UIView *)v8->_backdropView setHidden:1];
    [(SKUIRedeemTextField *)v8 insertSubview:v8->_backdropView atIndex:0];
    v11 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    bottomBorderView = v8->_bottomBorderView;
    v8->_bottomBorderView = v11;

    v13 = v8->_bottomBorderView;
    v14 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v13 setBackgroundColor:v14];

    [(SKUIRedeemTextField *)v8 addSubview:v8->_bottomBorderView];
    v15 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    topBorderView = v8->_topBorderView;
    v8->_topBorderView = v15;

    v17 = v8->_topBorderView;
    v18 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v17 setBackgroundColor:v18];

    [(SKUIRedeemTextField *)v8 addSubview:v8->_topBorderView];
    v8->_backdropBackground = 0;
    v19 = [MEMORY[0x1E4FB1618] whiteColor];
    [(SKUIRedeemTextField *)v8 setBackgroundColor:v19];

    [(SKUIRedeemTextField *)v8 setOpaque:1];
  }
  return v8;
}

- (void)setBackdropBackground:(BOOL)a3
{
  if (self->_backdropBackground != a3)
  {
    BOOL v3 = a3;
    self->_backdropBackground = a3;
    backdropView = self->_backdropView;
    if (a3)
    {
      [(UIView *)backdropView setHidden:0];
      [MEMORY[0x1E4FB1618] clearColor];
    }
    else
    {
      [(UIView *)backdropView setHidden:1];
      [MEMORY[0x1E4FB1618] whiteColor];
    v6 = };
    [(SKUIRedeemTextField *)self setBackgroundColor:v6];

    [(SKUIRedeemTextField *)self setOpaque:!v3];
  }
}

- (void)setSuppressBorder:(BOOL)a3
{
  BOOL v3 = a3;
  self->_suppressBorder = a3;
  -[UIView setHidden:](self->_bottomBorderView, "setHidden:");
  topBorderView = self->_topBorderView;

  [(UIView *)topBorderView setHidden:v3];
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)SKUIRedeemTextField;
  -[SKUIRedeemTextField editingRectForBounds:](&v8, sel_editingRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = width + -30.0;
  double v7 = 15.0;
  result.size.double height = v5;
  result.size.double width = v6;
  result.origin.double y = v4;
  result.origin.double x = v7;
  return result;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)SKUIRedeemTextField;
  -[SKUIRedeemTextField placeholderRectForBounds:](&v8, sel_placeholderRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = width + -30.0;
  double v7 = 15.0;
  result.size.double height = v5;
  result.size.double width = v6;
  result.origin.double y = v4;
  result.origin.double x = v7;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)SKUIRedeemTextField;
  -[SKUIRedeemTextField textRectForBounds:](&v8, sel_textRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = width + -30.0;
  double v7 = 15.0;
  result.size.double height = v5;
  result.size.double width = v6;
  result.origin.double y = v4;
  result.origin.double x = v7;
  return result;
}

- (void)layoutSubviews
{
  [(SKUIRedeemTextField *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 scale];
  double v9 = 1.0 / v8;

  -[UIView setFrame:](self->_bottomBorderView, "setFrame:", 0.0, v6 - v9, v4, v9);
  -[UIView setFrame:](self->_topBorderView, "setFrame:", 0.0, 0.0, v4, v9);
  v10.receiver = self;
  v10.super_class = (Class)SKUIRedeemTextField;
  [(SKUIRedeemTextField *)&v10 layoutSubviews];
}

- (BOOL)backdropBackground
{
  return self->_backdropBackground;
}

- (BOOL)suppressBorder
{
  return self->_suppressBorder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_topBorderView, 0);

  objc_storeStrong((id *)&self->_bottomBorderView, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRedeemTextField initWithFrame:]";
}

@end