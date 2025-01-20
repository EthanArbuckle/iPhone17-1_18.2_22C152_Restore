@interface SKUIIPadSearchSeparatorView
- (SKUIIPadSearchSeparatorView)initWithFrame:(CGRect)a3;
@end

@implementation SKUIIPadSearchSeparatorView

- (SKUIIPadSearchSeparatorView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIPadSearchSeparatorView initWithFrame:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIIPadSearchSeparatorView;
  v8 = -[SKUIIPadSearchSeparatorView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.8 alpha:1.0];
    [(SKUIIPadSearchSeparatorView *)v8 setBackgroundColor:v9];
  }
  return v8;
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIIPadSearchSeparatorView initWithFrame:]";
}

@end