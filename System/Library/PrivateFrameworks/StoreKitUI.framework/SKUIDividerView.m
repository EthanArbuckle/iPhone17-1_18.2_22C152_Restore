@interface SKUIDividerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)dividerColor;
- (double)dividerSize;
- (int64_t)dividerOrientation;
- (void)dividerColor;
- (void)setBackgroundColor:(id)a3;
- (void)setDividerColor:(id)a3;
- (void)setDividerOrientation:(int64_t)a3;
- (void)setDividerSize:(double)a3;
@end

@implementation SKUIDividerView

- (UIColor)dividerColor
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDividerView dividerColor]();
  }
  v3 = [(SKUIDividerView *)self backgroundColor];

  return (UIColor *)v3;
}

- (void)setDividerColor:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIDividerView setDividerColor:]();
  }
  v5.receiver = self;
  v5.super_class = (Class)SKUIDividerView;
  [(SKUIDividerView *)&v5 setBackgroundColor:v4];
}

- (void)setBackgroundColor:(id)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIDividerView setBackgroundColor:]();
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDividerView sizeThatFits:]();
  }
  int64_t dividerOrientation = self->_dividerOrientation;
  double dividerSize = self->_dividerSize;
  v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v8 scale];
  double v10 = 1.0 / v9;

  if (dividerSize >= 0.00000011920929) {
    double v11 = dividerSize;
  }
  else {
    double v11 = width;
  }
  if (dividerSize >= 0.00000011920929) {
    double v12 = dividerSize;
  }
  else {
    double v12 = height;
  }
  if (dividerOrientation) {
    double v11 = v10;
  }
  else {
    double v12 = v10;
  }
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (int64_t)dividerOrientation
{
  return self->_dividerOrientation;
}

- (void)setDividerOrientation:(int64_t)a3
{
  self->_int64_t dividerOrientation = a3;
}

- (double)dividerSize
{
  return self->_dividerSize;
}

- (void)setDividerSize:(double)a3
{
  self->_double dividerSize = a3;
}

- (void)dividerColor
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDividerView dividerColor]";
}

- (void)setDividerColor:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDividerView setDividerColor:]";
}

- (void)setBackgroundColor:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDividerView setBackgroundColor:]";
}

- (void)sizeThatFits:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDividerView sizeThatFits:]";
}

@end