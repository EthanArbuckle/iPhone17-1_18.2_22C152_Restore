@interface SUUIGiftThemeCollectionView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_visibleBounds;
- (UIEdgeInsets)visibleBoundsInsets;
- (void)setVisibleBoundsInsets:(UIEdgeInsets)a3;
@end

@implementation SUUIGiftThemeCollectionView

- (CGRect)_visibleBounds
{
  v13.receiver = self;
  v13.super_class = (Class)SUUIGiftThemeCollectionView;
  [(SUUIGiftThemeCollectionView *)&v13 _visibleBounds];
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
  double v7 = [(SUUIGiftThemeCollectionView *)self superview];
  -[SUUIGiftThemeCollectionView convertPoint:toView:](self, "convertPoint:toView:", v7, x, y);
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  double v12 = [(SUUIGiftThemeCollectionView *)self superview];
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

@end