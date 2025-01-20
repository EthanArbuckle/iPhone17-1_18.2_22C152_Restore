@interface SKUISeparatorView
- (UIColor)color1;
- (UIColor)color2;
- (int64_t)separatorStyle;
- (void)drawRect:(CGRect)a3;
- (void)setColor1:(id)a3;
- (void)setColor2:(id)a3;
- (void)setSeparatorStyle:(int64_t)a3;
@end

@implementation SKUISeparatorView

- (void)setColor1:(id)a3
{
  v4 = (UIColor *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUISeparatorView setColor1:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_color1 != v4)
  {
    v13 = (UIColor *)[(UIColor *)v4 copy];
    color1 = self->_color1;
    self->_color1 = v13;

    [(SKUISeparatorView *)self setNeedsDisplay];
  }
}

- (void)setColor2:(id)a3
{
  v4 = (UIColor *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUISeparatorView setColor2:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_color2 != v4)
  {
    v13 = (UIColor *)[(UIColor *)v4 copy];
    color2 = self->_color2;
    self->_color2 = v13;

    [(SKUISeparatorView *)self setNeedsDisplay];
  }
}

- (void)setSeparatorStyle:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUISeparatorView setSeparatorStyle:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_separatorStyle != a3)
  {
    self->_separatorStyle = a3;
    [(SKUISeparatorView *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v4) {
      -[SKUISeparatorView drawRect:](v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  [(SKUISeparatorView *)self bounds];
  CGFloat v14 = v12;
  CGFloat v15 = v13;
  int64_t separatorStyle = self->_separatorStyle;
  if (separatorStyle == 1)
  {
    float v20 = v12 * 0.5;
    double v19 = floorf(v20);
    [(UIColor *)self->_color1 set];
    double v18 = 0.0;
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    v22.size.width = v19;
    v22.size.height = v15;
    UIRectFill(v22);
    [(UIColor *)self->_color2 set];
    CGFloat v14 = v19;
  }
  else
  {
    if (separatorStyle) {
      return;
    }
    float v17 = v13 * 0.5;
    double v18 = floorf(v17);
    [(UIColor *)self->_color1 set];
    double v19 = 0.0;
    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v21.size.width = v14;
    v21.size.height = v18;
    UIRectFill(v21);
    [(UIColor *)self->_color2 set];
    CGFloat v15 = v18;
  }
  v23.origin.x = v19;
  v23.origin.y = v18;
  v23.size.width = v14;
  v23.size.height = v15;
  UIRectFill(v23);
}

- (UIColor)color1
{
  return self->_color1;
}

- (UIColor)color2
{
  return self->_color2;
}

- (int64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color2, 0);

  objc_storeStrong((id *)&self->_color1, 0);
}

- (void)setColor1:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setColor2:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setSeparatorStyle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)drawRect:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end