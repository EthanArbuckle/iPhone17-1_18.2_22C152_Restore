@interface SKUIGiftThemeCollectionView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_visibleBounds;
- (UIEdgeInsets)visibleBoundsInsets;
- (void)_visibleBounds;
- (void)setVisibleBoundsInsets:(UIEdgeInsets)a3;
@end

@implementation SKUIGiftThemeCollectionView

- (CGRect)_visibleBounds
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftThemeCollectionView _visibleBounds]();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIGiftThemeCollectionView;
  [(SKUIGiftThemeCollectionView *)&v13 _visibleBounds];
  double top = self->_visibleBoundsInsets.top;
  double left = self->_visibleBoundsInsets.left;
  double v6 = v5 + left;
  double v8 = v7 + top;
  double v10 = v9 - (left + self->_visibleBoundsInsets.right);
  double v12 = v11 - (top + self->_visibleBoundsInsets.bottom);
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftThemeCollectionView pointInside:withEvent:]();
  }
  double v7 = [(SKUIGiftThemeCollectionView *)self superview];
  -[SKUIGiftThemeCollectionView convertPoint:toView:](self, "convertPoint:toView:", v7, x, y);
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  double v12 = [(SKUIGiftThemeCollectionView *)self superview];
  [v12 bounds];
  v14.double x = v9;
  v14.double y = v11;
  LOBYTE(v7) = CGRectContainsPoint(v15, v14);

  return (char)v7;
}

- (UIEdgeInsets)visibleBoundsInsets
{
  double top = self->_visibleBoundsInsets.top;
  double left = self->_visibleBoundsInsets.left;
  double bottom = self->_visibleBoundsInsets.bottom;
  double right = self->_visibleBoundsInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setVisibleBoundsInsets:(UIEdgeInsets)a3
{
  self->_visibleBoundsInsets = a3;
}

- (void)_visibleBounds
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGiftThemeCollectionView _visibleBounds]";
}

- (void)pointInside:withEvent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGiftThemeCollectionView pointInside:withEvent:]";
}

@end