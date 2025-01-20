@interface SUUIScrollingTabNavigationBar
- (UIOffset)positionOffset;
- (void)setCenter:(CGPoint)a3;
- (void)setFrame:(CGRect)a3;
- (void)setPositionOffset:(UIOffset)a3;
@end

@implementation SUUIScrollingTabNavigationBar

- (void)setCenter:(CGPoint)a3
{
  CGFloat v3 = a3.x + self->_positionOffset.horizontal;
  CGFloat v4 = a3.y + self->_positionOffset.vertical;
  v5.receiver = self;
  v5.super_class = (Class)SUUIScrollingTabNavigationBar;
  -[SUUIScrollingTabNavigationBar setCenter:](&v5, sel_setCenter_, v3, v4);
}

- (void)setFrame:(CGRect)a3
{
  CGFloat v3 = a3.origin.x + self->_positionOffset.horizontal;
  CGFloat v4 = a3.origin.y + self->_positionOffset.vertical;
  v5.receiver = self;
  v5.super_class = (Class)SUUIScrollingTabNavigationBar;
  -[SUUIScrollingTabNavigationBar setFrame:](&v5, sel_setFrame_, v3, v4, a3.size.width, a3.size.height);
}

- (UIOffset)positionOffset
{
  double horizontal = self->_positionOffset.horizontal;
  double vertical = self->_positionOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (void)setPositionOffset:(UIOffset)a3
{
  double vertical = a3.vertical;
  double horizontal = a3.horizontal;
  p_positionOffset = &self->_positionOffset;
  if (self->_positionOffset.horizontal != a3.horizontal || self->_positionOffset.vertical != a3.vertical)
  {
    [(SUUIScrollingTabNavigationBar *)self center];
    double v8 = p_positionOffset->vertical;
    double v10 = v9 - p_positionOffset->horizontal;
    p_positionOffset->double horizontal = horizontal;
    p_positionOffset->double vertical = vertical;
    v12.receiver = self;
    v12.super_class = (Class)SUUIScrollingTabNavigationBar;
    -[SUUIScrollingTabNavigationBar setCenter:](&v12, sel_setCenter_, horizontal + v10, v11 - v8 + vertical);
  }
}

@end