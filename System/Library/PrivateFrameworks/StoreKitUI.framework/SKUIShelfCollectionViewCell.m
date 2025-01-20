@interface SKUIShelfCollectionViewCell
+ (double)maximumPerspectiveHeightForSize:(CGSize)a3;
- (BOOL)rendersWithParallax;
- (BOOL)rendersWithPerspective;
- (UICollectionView)collectionView;
- (UIEdgeInsets)contentInset;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setPerspectiveTargetView:(id)a3;
- (void)setRendersWithParallax:(BOOL)a3;
- (void)setRendersWithPerspective:(BOOL)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setVanishingPoint:(CGPoint)a3;
- (void)updateForChangedDistanceFromVanishingPoint;
@end

@implementation SKUIShelfCollectionViewCell

- (void)setCollectionView:(id)a3
{
  v5 = (UICollectionView *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIShelfCollectionViewCell setCollectionView:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  p_collectionView = &self->_collectionView;
  v15 = v5;
  if (self->_collectionView != v5)
  {
    if ([(UICollectionView *)self->_collectionView isDescendantOfView:self]) {
      [(UICollectionView *)*p_collectionView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_collectionView, a3);
    [(UICollectionView *)*p_collectionView setSemanticContentAttribute:[(SKUIShelfCollectionViewCell *)self semanticContentAttribute]];
    [(SKUIShelfCollectionViewCell *)self setNeedsLayout];
    v15 = *p_collectionView;
  }
  if (v15 && ([(UICollectionView *)v15 isDescendantOfView:self] & 1) == 0)
  {
    v16 = [(SKUIShelfCollectionViewCell *)self contentView];
    v17 = *p_collectionView;
    v18 = [(SKUIShelfCollectionViewCell *)self backgroundColor];
    [(UICollectionView *)v17 setBackgroundColor:v18];

    [v16 addSubview:*p_collectionView];
    [(SKUIShelfCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIShelfCollectionViewCell setSemanticContentAttribute:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIShelfCollectionViewCell;
  [(SKUIShelfCollectionViewCell *)&v13 setSemanticContentAttribute:a3];
  [(UICollectionView *)self->_collectionView setSemanticContentAttribute:a3];
}

- (void)setContentInset:(UIEdgeInsets)a3
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
        -[SKUIShelfCollectionViewCell setContentInset:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  double v16 = self->_contentInset.top;
  if (self->_contentInset.left != left
    || v16 != top
    || self->_contentInset.right != right
    || self->_contentInset.bottom != bottom)
  {
    self->_contentInset.double top = top;
    self->_contentInset.double left = left;
    self->_contentInset.double bottom = bottom;
    self->_contentInset.double right = right;
    [(SKUIShelfCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setRendersWithPerspective:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIShelfCollectionViewCell setRendersWithPerspective:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_rendersWithPerspective != v3)
  {
    self->_rendersWithPerspective = v3;
    [(SKUIShelfCollectionViewCell *)self updateForChangedDistanceFromVanishingPoint];
  }
}

- (void)setRendersWithParallax:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIShelfCollectionViewCell setRendersWithParallax:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_rendersWithParallax != v3)
  {
    self->_rendersWithParallax = v3;
    [(SKUIShelfCollectionViewCell *)self updateForChangedDistanceFromVanishingPoint];
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
        -[SKUIShelfCollectionViewCell applyLayoutAttributes:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [v4 backgroundColor];
  [(SKUIShelfCollectionViewCell *)self setBackgroundColor:v13];

  v14.receiver = self;
  v14.super_class = (Class)SKUIShelfCollectionViewCell;
  [(SKUICollectionViewCell *)&v14 applyLayoutAttributes:v4];
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
        -[SKUIShelfCollectionViewCell setBackgroundColor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(UICollectionView *)self->_collectionView setBackgroundColor:v4];
  v13.receiver = self;
  v13.super_class = (Class)SKUIShelfCollectionViewCell;
  [(SKUICollectionViewCell *)&v13 setBackgroundColor:v4];
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIShelfCollectionViewCell maximumPerspectiveHeightForSize:](v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
  }
  return 0.0;
}

- (void)setPerspectiveTargetView:(id)a3
{
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v3) {
      -[SKUIShelfCollectionViewCell setPerspectiveTargetView:](v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

- (void)setVanishingPoint:(CGPoint)a3
{
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v3) {
      -[SKUIShelfCollectionViewCell setVanishingPoint:](v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

- (void)updateForChangedDistanceFromVanishingPoint
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)rendersWithPerspective
{
  return self->_rendersWithPerspective;
}

- (BOOL)rendersWithParallax
{
  return self->_rendersWithParallax;
}

- (void).cxx_destruct
{
}

- (void)setCollectionView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setSemanticContentAttribute:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setContentInset:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setRendersWithPerspective:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setRendersWithParallax:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)applyLayoutAttributes:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)maximumPerspectiveHeightForSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setPerspectiveTargetView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setVanishingPoint:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end