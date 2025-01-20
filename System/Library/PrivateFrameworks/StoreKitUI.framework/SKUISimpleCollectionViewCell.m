@interface SKUISimpleCollectionViewCell
- (UIEdgeInsets)contentInsets;
- (UIView)contentChildView;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setContentChildView:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
@end

@implementation SKUISimpleCollectionViewCell

- (void)setContentChildView:(id)a3
{
  v5 = (UIView *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUISimpleCollectionViewCell setContentChildView:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  p_contentChildView = &self->_contentChildView;
  v15 = v5;
  if (self->_contentChildView != v5)
  {
    if ([(UIView *)self->_contentChildView isDescendantOfView:self]) {
      [(UIView *)*p_contentChildView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_contentChildView, a3);
    [(SKUISimpleCollectionViewCell *)self setNeedsLayout];
    v15 = *p_contentChildView;
  }
  if (v15 && ![(UIView *)v15 isDescendantOfView:self])
  {
    v16 = [(SKUISimpleCollectionViewCell *)self contentView];
    v17 = *p_contentChildView;
    v18 = [(SKUISimpleCollectionViewCell *)self backgroundColor];
    [(UIView *)v17 setBackgroundColor:v18];

    [v16 addSubview:*p_contentChildView];
    [(SKUISimpleCollectionViewCell *)self setNeedsLayout];
  }
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
        -[SKUISimpleCollectionViewCell setContentInsets:](v8, v9, v10, v11, v12, v13, v14, v15);
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
    [(SKUISimpleCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUISimpleCollectionViewCell applyLayoutAttributes:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [v4 backgroundColor];
  [(SKUISimpleCollectionViewCell *)self setBackgroundColor:v13];

  v14.receiver = self;
  v14.super_class = (Class)SKUISimpleCollectionViewCell;
  [(SKUISimpleCollectionViewCell *)&v14 applyLayoutAttributes:v4];
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
        -[SKUISimpleCollectionViewCell setBackgroundColor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(UIView *)self->_contentChildView setBackgroundColor:v4];
  v13.receiver = self;
  v13.super_class = (Class)SKUISimpleCollectionViewCell;
  [(SKUISimpleCollectionViewCell *)&v13 setBackgroundColor:v4];
}

- (UIView)contentChildView
{
  return self->_contentChildView;
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

- (void)setContentChildView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setContentInsets:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)applyLayoutAttributes:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end