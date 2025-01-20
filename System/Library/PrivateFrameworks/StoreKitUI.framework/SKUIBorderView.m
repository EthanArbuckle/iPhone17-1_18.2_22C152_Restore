@interface SKUIBorderView
- (UIColor)color;
- (void)color;
- (void)setBackgroundColor:(id)a3;
- (void)setColor:(id)a3;
@end

@implementation SKUIBorderView

- (void)setColor:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIBorderView setColor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIBorderView;
  [(SKUIBorderView *)&v13 setBackgroundColor:v4];
}

- (UIColor)color
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIBorderView *)v3 color];
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIBorderView;
  uint64_t v11 = [(SKUIBorderView *)&v13 backgroundColor];

  return (UIColor *)v11;
}

- (void)setBackgroundColor:(id)a3
{
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v3) {
      -[SKUIBorderView setBackgroundColor:](v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

- (void)setColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)color
{
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end