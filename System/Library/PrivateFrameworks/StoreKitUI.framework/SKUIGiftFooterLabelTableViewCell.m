@interface SKUIGiftFooterLabelTableViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)footerLabel;
- (void)footerLabel;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setFooterLabel:(id)a3;
@end

@implementation SKUIGiftFooterLabelTableViewCell

- (NSString)footerLabel
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIGiftFooterLabelTableViewCell *)v3 footerLabel];
      }
    }
  }
  v11 = [(UILabel *)self->_footerLabel text];

  return (NSString *)v11;
}

- (void)setFooterLabel:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIGiftFooterLabelTableViewCell setFooterLabel:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = [(SKUIGiftFooterLabelTableViewCell *)self footerLabel];
  if (v13 != v4 && ([v4 isEqualToString:v13] & 1) == 0)
  {
    footerLabel = self->_footerLabel;
    if (v4)
    {
      if (!footerLabel)
      {
        v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v16 = self->_footerLabel;
        self->_footerLabel = v15;

        v17 = self->_footerLabel;
        v18 = [(SKUIGiftFooterLabelTableViewCell *)self backgroundColor];
        [(UILabel *)v17 setBackgroundColor:v18];

        v19 = self->_footerLabel;
        v20 = [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0];
        [(UILabel *)v19 setFont:v20];

        [(UILabel *)self->_footerLabel setNumberOfLines:2];
        [(UILabel *)self->_footerLabel setTextAlignment:1];
        v21 = self->_footerLabel;
        v22 = [MEMORY[0x1E4FB1618] _secondaryLabelColor];
        [(UILabel *)v21 setTextColor:v22];

        v23 = [(SKUIGiftFooterLabelTableViewCell *)self contentView];
        [v23 addSubview:self->_footerLabel];

        footerLabel = self->_footerLabel;
      }
      [(UILabel *)footerLabel setText:v4];
    }
    else
    {
      [(UILabel *)footerLabel removeFromSuperview];
      v24 = self->_footerLabel;
      self->_footerLabel = 0;
    }
    [(SKUIGiftFooterLabelTableViewCell *)self setNeedsLayout];
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
        -[SKUIGiftFooterLabelTableViewCell setBackgroundColor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(UILabel *)self->_footerLabel setBackgroundColor:v4];
  v13.receiver = self;
  v13.super_class = (Class)SKUIGiftFooterLabelTableViewCell;
  [(SKUIGiftFooterLabelTableViewCell *)&v13 setBackgroundColor:v4];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIGiftFooterLabelTableViewCell sizeThatFits:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  -[UILabel sizeThatFits:](self->_footerLabel, "sizeThatFits:", width + -30.0, 1.79769313e308);
  double v15 = v14 + 6.0;
  result.height = v15;
  result.double width = v13;
  return result;
}

- (void).cxx_destruct
{
}

- (void)footerLabel
{
}

- (void)setFooterLabel:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sizeThatFits:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end