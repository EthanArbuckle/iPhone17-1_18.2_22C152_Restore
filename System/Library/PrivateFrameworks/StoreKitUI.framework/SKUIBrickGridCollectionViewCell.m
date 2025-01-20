@interface SKUIBrickGridCollectionViewCell
- (NSString)accessibilityLabel;
- (UIEdgeInsets)contentInsets;
- (UIImage)brickImage;
- (void)applyEditorialLayout:(id)a3 orientation:(int64_t)a4;
- (void)brickImage;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBrickImage:(id)a3;
- (void)setColoringWithColorScheme:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
@end

@implementation SKUIBrickGridCollectionViewCell

- (void)applyEditorialLayout:(id)a3 orientation:(int64_t)a4
{
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIBrickGridCollectionViewCell applyEditorialLayout:orientation:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  editorialContainerView = self->_editorialContainerView;
  if (v6)
  {
    if (!editorialContainerView)
    {
      v16 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      v17 = self->_editorialContainerView;
      self->_editorialContainerView = v16;

      v18 = self->_editorialContainerView;
      v19 = [(SKUIBrickGridCollectionViewCell *)self backgroundColor];
      [(UIView *)v18 setBackgroundColor:v19];

      v20 = [(SKUIBrickGridCollectionViewCell *)self contentView];
      [v20 addSubview:self->_editorialContainerView];

      [(SKUIBrickGridCollectionViewCell *)self setNeedsLayout];
    }
    if (!self->_editorialCellLayout)
    {
      v21 = [[SKUIEditorialCellLayout alloc] initWithParentView:self->_editorialContainerView];
      editorialCellLayout = self->_editorialCellLayout;
      self->_editorialCellLayout = v21;

      -[SKUIEditorialCellLayout setContentInset:](self->_editorialCellLayout, "setContentInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    }
    [(UIView *)self->_editorialContainerView setHidden:0];
  }
  else
  {
    [(UIView *)editorialContainerView setHidden:1];
  }
  [(SKUIEditorialCellLayout *)self->_editorialCellLayout applyEditorialLayout:v6 withOrientation:a4 expanded:1];
}

- (UIImage)brickImage
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIBrickGridCollectionViewCell *)v3 brickImage];
      }
    }
  }
  uint64_t v11 = [(UIImageView *)self->_brickImageView image];

  return (UIImage *)v11;
}

- (void)setAccessibilityLabel:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIBrickGridCollectionViewCell setAccessibilityLabel:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_accessibilityLabel != v4)
  {
    uint64_t v13 = (NSString *)[(NSString *)v4 copy];
    accessibilityLabel = self->_accessibilityLabel;
    self->_accessibilityLabel = v13;

    [(UIImageView *)self->_brickImageView setAccessibilityLabel:v4];
  }
}

- (void)setBrickImage:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIBrickGridCollectionViewCell setBrickImage:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = [(SKUIBrickGridCollectionViewCell *)self brickImage];

  if (v13 != v4)
  {
    brickImageView = self->_brickImageView;
    if (v4)
    {
      if (!brickImageView)
      {
        v15 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
        v16 = self->_brickImageView;
        self->_brickImageView = v15;

        [(UIImageView *)self->_brickImageView setAccessibilityLabel:self->_accessibilityLabel];
        v17 = self->_brickImageView;
        v18 = [(SKUIBrickGridCollectionViewCell *)self backgroundColor];
        [(UIImageView *)v17 setBackgroundColor:v18];

        v19 = [(SKUIBrickGridCollectionViewCell *)self contentView];
        [v19 addSubview:self->_brickImageView];

        [(SKUIBrickGridCollectionViewCell *)self setNeedsLayout];
        brickImageView = self->_brickImageView;
      }
      [(UIImageView *)brickImageView setImage:v4];
      [(UIImageView *)self->_brickImageView sizeToFit];
    }
    else
    {
      [(UIImageView *)brickImageView removeFromSuperview];
      v20 = self->_brickImageView;
      self->_brickImageView = 0;
    }
  }
}

- (void)setColoringWithColorScheme:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIBrickGridCollectionViewCell setColoringWithColorScheme:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(SKUIEditorialCellLayout *)self->_editorialCellLayout setColoringWithColorScheme:v4];
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
        -[SKUIBrickGridCollectionViewCell setContentInsets:](v8, v9, v10, v11, v12, v13, v14, v15);
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
    [(SKUIBrickGridCollectionViewCell *)self setNeedsLayout];
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
        -[SKUIBrickGridCollectionViewCell setBackgroundColor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(UIImageView *)self->_brickImageView setBackgroundColor:v4];
  [(SKUIEditorialCellLayout *)self->_editorialCellLayout setBackgroundColor:v4];
  [(UIView *)self->_editorialContainerView setBackgroundColor:v4];
  v13.receiver = self;
  v13.super_class = (Class)SKUIBrickGridCollectionViewCell;
  [(SKUIBrickGridCollectionViewCell *)&v13 setBackgroundColor:v4];
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
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
  objc_storeStrong((id *)&self->_editorialContainerView, 0);
  objc_storeStrong((id *)&self->_editorialCellLayout, 0);
  objc_storeStrong((id *)&self->_brickImageView, 0);

  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
}

- (void)applyEditorialLayout:(uint64_t)a3 orientation:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)brickImage
{
}

- (void)setAccessibilityLabel:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setBrickImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setColoringWithColorScheme:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setContentInsets:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end