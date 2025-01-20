@interface SKUIEmptyContentPlaceholderView
- (BOOL)showsSignInButton;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)placeholderMessage;
- (UIButton)signInButton;
- (UIEdgeInsets)placeholderImageInsets;
- (UIImage)placeholderImage;
- (UILabel)placeholderMessageLabel;
- (void)layoutSubviews;
- (void)maskPlaceholdersInBackdropView:(id)a3;
- (void)placeholderImage;
- (void)placeholderMessage;
- (void)placeholderMessageLabel;
- (void)setBackgroundColor:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPlaceholderImageInsets:(UIEdgeInsets)a3;
- (void)setPlaceholderMessage:(id)a3;
- (void)setShowsSignInButton:(BOOL)a3;
- (void)showsSignInButton;
- (void)signInButton;
@end

@implementation SKUIEmptyContentPlaceholderView

- (void)maskPlaceholdersInBackdropView:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5)
      {
        -[SKUIEmptyContentPlaceholderView maskPlaceholdersInBackdropView:](v5, v6, v7, v8, v9, v10, v11, v12);
        if (!v4) {
          goto LABEL_6;
        }
        goto LABEL_5;
      }
    }
  }
  if (v4)
  {
LABEL_5:
    [v4 removeMaskViews];
    label = self->_label;
    v14 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)label setBackgroundColor:v14];

    [(UILabel *)self->_label setOpaque:0];
    v15 = self->_label;
    v16 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [(UILabel *)v15 setTextColor:v16];

    [(UILabel *)self->_label _setBackdropMaskViewFlags:2];
    [v4 updateMaskViewsForView:self->_label];
    [(UIImageView *)self->_imageView setAlpha:0.2];
    imageView = self->_imageView;
    v18 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIImageView *)imageView setBackgroundColor:v18];

    [(UIImageView *)self->_imageView setOpaque:0];
    [(UIImageView *)self->_imageView _setBackdropMaskViewFlags:2];
    [v4 updateMaskViewsForView:self->_imageView];
  }
LABEL_6:
}

- (UIImage)placeholderImage
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIEmptyContentPlaceholderView *)v3 placeholderImage];
      }
    }
  }
  uint64_t v11 = [(UIImageView *)self->_imageView image];

  return (UIImage *)v11;
}

- (NSString)placeholderMessage
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIEmptyContentPlaceholderView *)v3 placeholderMessage];
      }
    }
  }
  uint64_t v11 = [(UILabel *)self->_label text];

  return (NSString *)v11;
}

- (UILabel)placeholderMessageLabel
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIEmptyContentPlaceholderView *)v3 placeholderMessageLabel];
      }
    }
  }
  label = self->_label;
  if (!label)
  {
    uint64_t v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    v13 = self->_label;
    self->_label = v12;

    v14 = self->_label;
    v15 = [(SKUIEmptyContentPlaceholderView *)self backgroundColor];
    [(UILabel *)v14 setBackgroundColor:v15];

    v16 = self->_label;
    v17 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
    [(UILabel *)v16 setFont:v17];

    [(UILabel *)self->_label setHidden:1];
    [(UILabel *)self->_label setNumberOfLines:0];
    [(UILabel *)self->_label setTextAlignment:1];
    v18 = self->_label;
    v19 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
    [(UILabel *)v18 setTextColor:v19];

    [(SKUIEmptyContentPlaceholderView *)self addSubview:self->_label];
    label = self->_label;
  }

  return label;
}

- (void)setPlaceholderImage:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEmptyContentPlaceholderView setPlaceholderImage:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  imageView = self->_imageView;
  if (v4)
  {
    if (!imageView)
    {
      v14 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      v15 = self->_imageView;
      self->_imageView = v14;

      [(SKUIEmptyContentPlaceholderView *)self addSubview:self->_imageView];
      imageView = self->_imageView;
    }
    [(UIImageView *)imageView setImage:v4];
    [(UIImageView *)self->_imageView sizeToFit];
    [(SKUIEmptyContentPlaceholderView *)self setNeedsLayout];
  }
  else
  {
    [(UIImageView *)imageView removeFromSuperview];
    v16 = self->_imageView;
    self->_imageView = 0;
  }
}

- (void)setPlaceholderImageInsets:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIEmptyContentPlaceholderView setPlaceholderImageInsets:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  self->_imageInsets.CGFloat top = top;
  self->_imageInsets.CGFloat left = left;
  self->_imageInsets.CGFloat bottom = bottom;
  self->_imageInsets.CGFloat right = right;
  [(SKUIEmptyContentPlaceholderView *)self setNeedsLayout];
}

- (void)setPlaceholderMessage:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5)
      {
        -[SKUIEmptyContentPlaceholderView setPlaceholderMessage:](v5, v6, v7, v8, v9, v10, v11, v12);
        if (v4) {
          goto LABEL_5;
        }
LABEL_7:
        [(UILabel *)self->_label setHidden:1];
        [(UILabel *)self->_label setText:0];
        goto LABEL_8;
      }
    }
  }
  if (!v4) {
    goto LABEL_7;
  }
LABEL_5:
  uint64_t v13 = [(SKUIEmptyContentPlaceholderView *)self placeholderMessageLabel];
  [v13 setHidden:0];
  [v13 setText:v4];
  [(SKUIEmptyContentPlaceholderView *)self setNeedsLayout];

LABEL_8:
}

- (void)setShowsSignInButton:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEmptyContentPlaceholderView setShowsSignInButton:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [(SKUIEmptyContentPlaceholderView *)self signInButton];
  [v13 setHidden:!v3];
}

- (UIButton)signInButton
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIEmptyContentPlaceholderView *)v3 signInButton];
      }
    }
  }
  signInButton = self->_signInButton;
  if (!signInButton)
  {
    uint64_t v12 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    uint64_t v13 = self->_signInButton;
    self->_signInButton = v12;

    [(UIButton *)self->_signInButton setHidden:1];
    uint64_t v14 = [(UIButton *)self->_signInButton titleLabel];
    uint64_t v15 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
    [v14 setFont:v15];

    [(SKUIEmptyContentPlaceholderView *)self addSubview:self->_signInButton];
    signInButton = self->_signInButton;
  }

  return signInButton;
}

- (BOOL)showsSignInButton
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIEmptyContentPlaceholderView *)v3 showsSignInButton];
      }
    }
  }
  signInButton = self->_signInButton;
  if (signInButton) {
    LOBYTE(signInButton) = [(UIButton *)signInButton isHidden] ^ 1;
  }
  return (char)signInButton;
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
        -[SKUIEmptyContentPlaceholderView setBackgroundColor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(UIImageView *)self->_imageView setBackgroundColor:v4];
  [(UILabel *)self->_label setBackgroundColor:v4];
  v13.receiver = self;
  v13.super_class = (Class)SKUIEmptyContentPlaceholderView;
  [(SKUIEmptyContentPlaceholderView *)&v13 setBackgroundColor:v4];
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
        -[SKUIEmptyContentPlaceholderView sizeThatFits:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(UIImageView *)self->_imageView frame];
  double v14 = v13;
  double v16 = v15;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", width + -30.0, 1.79769313e308);
  double v18 = v17;
  double v20 = v19;
  if ([(UIButton *)self->_signInButton isHidden])
  {
    double v21 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    [(UIButton *)self->_signInButton sizeToFit];
    [(UIButton *)self->_signInButton frame];
  }
  double v22 = v21 + 20.0;
  if (v21 <= 0.00000011920929) {
    double v22 = -0.0;
  }
  double v23 = v22 + v20 + v16 + self->_imageInsets.bottom + self->_imageInsets.top;
  if (v14 >= v18) {
    double v24 = v14;
  }
  else {
    double v24 = v18;
  }
  double v25 = v24 + 30.0;
  result.height = v23;
  result.double width = v25;
  return result;
}

- (UIEdgeInsets)placeholderImageInsets
{
  double top = self->_imageInsets.top;
  double left = self->_imageInsets.left;
  double bottom = self->_imageInsets.bottom;
  double right = self->_imageInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signInButton, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

- (void)maskPlaceholdersInBackdropView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)placeholderImage
{
}

- (void)placeholderMessage
{
}

- (void)placeholderMessageLabel
{
}

- (void)setPlaceholderImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setPlaceholderImageInsets:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setPlaceholderMessage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setShowsSignInButton:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)signInButton
{
}

- (void)showsSignInButton
{
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sizeThatFits:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end