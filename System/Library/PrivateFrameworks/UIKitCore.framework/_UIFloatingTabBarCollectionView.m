@interface _UIFloatingTabBarCollectionView
- (id)layoutSubviewHandler;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
- (void)setLayoutSubviewHandler:(id)a3;
@end

@implementation _UIFloatingTabBarCollectionView

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)_UIFloatingTabBarCollectionView;
  [(UICollectionView *)&v4 layoutSubviews];
  layoutSubviewHandler = (void (**)(void))self->_layoutSubviewHandler;
  if (layoutSubviewHandler) {
    layoutSubviewHandler[2]();
  }
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFloatingTabBarCollectionView;
  return [&v3 accessibilityTraits] | 0x8000;
}

- (id)layoutSubviewHandler
{
  return self->_layoutSubviewHandler;
}

- (void)setLayoutSubviewHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end