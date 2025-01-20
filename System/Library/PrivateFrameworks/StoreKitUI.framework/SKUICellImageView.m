@interface SKUICellImageView
- (void)setHighlighted:(BOOL)a3;
@end

@implementation SKUICellImageView

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICellImageView setHighlighted:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUICellImageView;
  if ([(SKUICellImageView *)&v9 isHighlighted] != v3)
  {
    if (v3)
    {
      v5 = [(SKUICellImageView *)self backgroundColor];
      cachedBackgroundColor = self->_cachedBackgroundColor;
      self->_cachedBackgroundColor = v5;

      v7 = [MEMORY[0x1E4FB1618] clearColor];
      [(SKUICellImageView *)self setBackgroundColor:v7];
    }
    else
    {
      [(SKUICellImageView *)self setBackgroundColor:self->_cachedBackgroundColor];
      v7 = self->_cachedBackgroundColor;
      self->_cachedBackgroundColor = 0;
    }

    v8.receiver = self;
    v8.super_class = (Class)SKUICellImageView;
    [(SKUICellImageView *)&v8 setHighlighted:v3];
  }
}

- (void).cxx_destruct
{
}

- (void)setHighlighted:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICellImageView setHighlighted:]";
}

@end