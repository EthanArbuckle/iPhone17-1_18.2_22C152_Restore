@interface SKUIProductPageTableHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (UIEdgeInsets)contentInsets;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setTitle:(id)a3;
- (void)title;
@end

@implementation SKUIProductPageTableHeaderView

- (void)setContentInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIProductPageTableHeaderView setContentInsets:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  double v16 = self->_contentInsets.top;
  if (self->_contentInsets.left != left
    || v16 != top
    || self->_contentInsets.right != right
    || self->_contentInsets.bottom != bottom)
  {
    self->_contentInsets.double top = top;
    self->_contentInsets.double left = left;
    self->_contentInsets.double bottom = bottom;
    self->_contentInsets.double right = right;
    [(SKUIProductPageTableHeaderView *)self setNeedsLayout];
  }
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIProductPageTableHeaderView setTitle:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = [(SKUIProductPageTableHeaderView *)self title];
  uint64_t v14 = v13;
  if (v13 != v4 && ([v13 isEqualToString:v4] & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v4)
    {
      if (!titleLabel)
      {
        double v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v17 = self->_titleLabel;
        self->_titleLabel = v16;

        v18 = self->_titleLabel;
        v19 = [(SKUIProductPageTableHeaderView *)self backgroundColor];
        [(UILabel *)v18 setBackgroundColor:v19];

        v20 = self->_titleLabel;
        v21 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
        [(UILabel *)v20 setFont:v21];

        v22 = self->_titleLabel;
        v23 = [MEMORY[0x1E4FB1618] blackColor];
        [(UILabel *)v22 setTextColor:v23];

        [(SKUIProductPageTableHeaderView *)self addSubview:self->_titleLabel];
        titleLabel = self->_titleLabel;
      }
      [(UILabel *)titleLabel setHidden:0];
      [(UILabel *)self->_titleLabel setText:v4];
      [(UILabel *)self->_titleLabel sizeToFit];
      [(SKUIProductPageTableHeaderView *)self setNeedsLayout];
    }
    else
    {
      [(UILabel *)titleLabel setHidden:1];
    }
  }
}

- (NSString)title
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIProductPageTableHeaderView *)v3 title];
      }
    }
  }
  uint64_t v11 = [(UILabel *)self->_titleLabel text];

  return (NSString *)v11;
}

- (void)layoutSubviews
{
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIProductPageTableHeaderView setBackgroundColor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(UILabel *)self->_titleLabel setBackgroundColor:v4];
  v13.receiver = self;
  v13.super_class = (Class)SKUIProductPageTableHeaderView;
  [(SKUIProductPageTableHeaderView *)&v13 setBackgroundColor:v4];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUIProductPageTableHeaderView sizeThatFits:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  [(UILabel *)self->_titleLabel frame];
  double v13 = v12 + self->_contentInsets.bottom + self->_contentInsets.top;
  double v15 = v14 + self->_contentInsets.left + self->_contentInsets.right;
  result.height = v13;
  result.width = v15;
  return result;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
}

- (void)setContentInsets:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setTitle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)title
{
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sizeThatFits:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end