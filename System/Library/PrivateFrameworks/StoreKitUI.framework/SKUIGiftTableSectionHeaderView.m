@interface SKUIGiftTableSectionHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)label;
- (UIEdgeInsets)contentInsets;
- (void)label;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setLabel:(id)a3;
@end

@implementation SKUIGiftTableSectionHeaderView

- (NSString)label
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIGiftTableSectionHeaderView *)v3 label];
      }
    }
  }
  v11 = [(UILabel *)self->_label text];

  return (NSString *)v11;
}

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
        -[SKUIGiftTableSectionHeaderView setContentInsets:](v8, v9, v10, v11, v12, v13, v14, v15);
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
    [(SKUIGiftTableSectionHeaderView *)self setNeedsLayout];
  }
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIGiftTableSectionHeaderView setLabel:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = [(SKUIGiftTableSectionHeaderView *)self label];
  if (v13 != v4 && ([v4 isEqualToString:v13] & 1) == 0)
  {
    label = self->_label;
    if (v4)
    {
      if (!label)
      {
        uint64_t v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        double v16 = self->_label;
        self->_label = v15;

        v17 = self->_label;
        v18 = [(SKUIGiftTableSectionHeaderView *)self backgroundColor];
        [(UILabel *)v17 setBackgroundColor:v18];

        v19 = self->_label;
        v20 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:15.0];
        [(UILabel *)v19 setFont:v20];

        v21 = self->_label;
        v22 = [MEMORY[0x1E4FB1618] _secondaryLabelColor];
        [(UILabel *)v21 setTextColor:v22];

        [(UILabel *)self->_label setTextAlignment:4];
        [(SKUIGiftTableSectionHeaderView *)self addSubview:self->_label];
        label = self->_label;
      }
      [(UILabel *)label setText:v4];
      [(UILabel *)self->_label sizeToFit];
    }
    else
    {
      [(UILabel *)label removeFromSuperview];
      v23 = self->_label;
      self->_label = 0;
    }
    [(SKUIGiftTableSectionHeaderView *)self setNeedsLayout];
  }
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
        -[SKUIGiftTableSectionHeaderView setBackgroundColor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(UILabel *)self->_label setBackgroundColor:v4];
  v13.receiver = self;
  v13.super_class = (Class)SKUIGiftTableSectionHeaderView;
  [(SKUIGiftTableSectionHeaderView *)&v13 setBackgroundColor:v4];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIGiftTableSectionHeaderView sizeThatFits:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  objc_super v13 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v14 = [v13 userInterfaceIdiom];

  double v15 = 22.0;
  if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v15 = 24.0;
  }
  double v16 = v15 + self->_contentInsets.top + self->_contentInsets.bottom;
  double v17 = width;
  result.height = v16;
  result.CGFloat width = v17;
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

- (void)label
{
}

- (void)setContentInsets:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setLabel:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sizeThatFits:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end