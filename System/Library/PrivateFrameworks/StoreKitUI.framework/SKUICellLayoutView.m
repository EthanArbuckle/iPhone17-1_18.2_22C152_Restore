@interface SKUICellLayoutView
- (SKUICellLayout)layout;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setLayout:(id)a3;
@end

@implementation SKUICellLayoutView

- (void)layoutSubviews
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICellLayoutView layoutSubviews]";
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICellLayoutView setBackgroundColor:]();
  }
  [(SKUICellLayout *)self->_layout setBackgroundColor:v4];
  v5.receiver = self;
  v5.super_class = (Class)SKUICellLayoutView;
  [(SKUICellLayoutView *)&v5 setBackgroundColor:v4];
}

- (SKUICellLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)setBackgroundColor:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICellLayoutView setBackgroundColor:]";
}

@end