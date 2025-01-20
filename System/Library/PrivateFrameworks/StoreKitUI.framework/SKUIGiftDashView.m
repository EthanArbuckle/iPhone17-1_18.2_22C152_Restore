@interface SKUIGiftDashView
- (CGSize)dashSize;
- (UIColor)dashColor;
- (double)dashSpacing;
- (void)drawRect:(CGRect)a3;
- (void)setDashColor:(id)a3;
- (void)setDashSize:(CGSize)a3;
- (void)setDashSpacing:(double)a3;
@end

@implementation SKUIGiftDashView

- (void)drawRect:(CGRect)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftDashView drawRect:]();
  }
  [(SKUIGiftDashView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  p_dashSize = &self->_dashSize;
  double height = self->_dashSize.height;
  [(UIColor *)self->_dashColor set];
  if (v5 > 0.0)
  {
    float v10 = (v7 - height) * 0.5;
    double v11 = floorf(v10);
    double v12 = 0.0;
    do
    {
      if (p_dashSize->width >= v5 - v12) {
        double width = v5 - v12;
      }
      else {
        double width = p_dashSize->width;
      }
      double v15 = v12;
      double v16 = v11;
      CGFloat v13 = self->_dashSize.height;
      UIRectFill(*(CGRect *)(&width - 2));
      double v12 = v12 + self->_dashSpacing;
    }
    while (v12 < v5);
  }
}

- (UIColor)dashColor
{
  return self->_dashColor;
}

- (void)setDashColor:(id)a3
{
}

- (CGSize)dashSize
{
  double width = self->_dashSize.width;
  double height = self->_dashSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDashSize:(CGSize)a3
{
  self->_dashSize = a3;
}

- (double)dashSpacing
{
  return self->_dashSpacing;
}

- (void)setDashSpacing:(double)a3
{
  self->_dashSpacing = a3;
}

- (void).cxx_destruct
{
}

- (void)drawRect:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGiftDashView drawRect:]";
}

@end