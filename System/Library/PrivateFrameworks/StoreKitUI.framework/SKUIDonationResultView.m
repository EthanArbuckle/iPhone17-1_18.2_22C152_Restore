@interface SKUIDonationResultView
- (NSString)message;
- (NSString)title;
- (UIImage)image;
- (void)image;
- (void)layoutSubviews;
- (void)message;
- (void)setImage:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
- (void)title;
@end

@implementation SKUIDonationResultView

- (UIImage)image
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIDonationResultView *)v3 image];
      }
    }
  }
  v11 = [(UIImageView *)self->_imageView image];

  return (UIImage *)v11;
}

- (NSString)message
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIDonationResultView *)v3 message];
      }
    }
  }
  v11 = [(UILabel *)self->_messageLabel text];

  return (NSString *)v11;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIDonationResultView setImage:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = [(UIImageView *)self->_imageView image];

  if (v13 != v4)
  {
    imageView = self->_imageView;
    if (v4)
    {
      if (!imageView)
      {
        v15 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
        v16 = self->_imageView;
        self->_imageView = v15;

        v17 = self->_imageView;
        v18 = [(SKUIDonationResultView *)self backgroundColor];
        [(UIImageView *)v17 setBackgroundColor:v18];

        [(SKUIDonationResultView *)self addSubview:self->_imageView];
        imageView = self->_imageView;
      }
      [(UIImageView *)imageView setImage:v4];
      [(UIImageView *)self->_imageView sizeToFit];
    }
    else
    {
      [(UIImageView *)imageView removeFromSuperview];
      v19 = self->_imageView;
      self->_imageView = 0;
    }
    [(SKUIDonationResultView *)self setNeedsLayout];
  }
}

- (void)setMessage:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIDonationResultView setMessage:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = [(SKUIDonationResultView *)self message];
  if (v13 != v4 && ([v4 isEqualToString:v13] & 1) == 0)
  {
    messageLabel = self->_messageLabel;
    if (v4)
    {
      if (!messageLabel)
      {
        v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v16 = self->_messageLabel;
        self->_messageLabel = v15;

        v17 = self->_messageLabel;
        v18 = [(SKUIDonationResultView *)self backgroundColor];
        [(UILabel *)v17 setBackgroundColor:v18];

        v19 = self->_messageLabel;
        v20 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
        [(UILabel *)v19 setFont:v20];

        [(UILabel *)self->_messageLabel setNumberOfLines:0];
        [(UILabel *)self->_messageLabel setTextAlignment:1];
        v21 = self->_messageLabel;
        v22 = [MEMORY[0x1E4FB1618] _secondaryLabelColor];
        [(UILabel *)v21 setTextColor:v22];

        [(SKUIDonationResultView *)self addSubview:self->_messageLabel];
        messageLabel = self->_messageLabel;
      }
      [(UILabel *)messageLabel setText:v4];
    }
    else
    {
      [(UILabel *)messageLabel removeFromSuperview];
      v23 = self->_messageLabel;
      self->_messageLabel = 0;
    }
    [(SKUIDonationResultView *)self setNeedsLayout];
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
        -[SKUIDonationResultView setTitle:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = [(SKUIDonationResultView *)self title];
  if (v13 != v4 && ([v4 isEqualToString:v13] & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v4)
    {
      if (!titleLabel)
      {
        v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v16 = self->_titleLabel;
        self->_titleLabel = v15;

        v17 = self->_titleLabel;
        v18 = [(SKUIDonationResultView *)self backgroundColor];
        [(UILabel *)v17 setBackgroundColor:v18];

        v19 = self->_titleLabel;
        v20 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:17.0];
        [(UILabel *)v19 setFont:v20];

        [(UILabel *)self->_titleLabel setNumberOfLines:0];
        [(UILabel *)self->_titleLabel setTextAlignment:1];
        v21 = self->_titleLabel;
        v22 = [MEMORY[0x1E4FB1618] _labelColor];
        [(UILabel *)v21 setTextColor:v22];

        [(SKUIDonationResultView *)self addSubview:self->_titleLabel];
        titleLabel = self->_titleLabel;
      }
      [(UILabel *)titleLabel setText:v4];
    }
    else
    {
      [(UILabel *)titleLabel removeFromSuperview];
      v23 = self->_titleLabel;
      self->_titleLabel = 0;
    }
    [(SKUIDonationResultView *)self setNeedsLayout];
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
        [(SKUIDonationResultView *)v3 title];
      }
    }
  }
  uint64_t v11 = [(UILabel *)self->_titleLabel text];

  return (NSString *)v11;
}

- (void)layoutSubviews
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

- (void)image
{
}

- (void)message
{
}

- (void)setImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setMessage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setTitle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)title
{
}

@end