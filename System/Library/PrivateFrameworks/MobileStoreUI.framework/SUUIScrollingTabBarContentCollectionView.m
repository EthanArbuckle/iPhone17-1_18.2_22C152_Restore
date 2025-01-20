@interface SUUIScrollingTabBarContentCollectionView
- (BOOL)isPerformingLayout;
- (void)_reuseCell:(id)a3;
- (void)layoutSubviews;
@end

@implementation SUUIScrollingTabBarContentCollectionView

- (void)layoutSubviews
{
  if (self->_performingLayout)
  {
    v4.receiver = self;
    v4.super_class = (Class)SUUIScrollingTabBarContentCollectionView;
    [(SUUIScrollingTabBarContentCollectionView *)&v4 layoutSubviews];
  }
  else
  {
    self->_performingLayout = 1;
    v4.receiver = self;
    v4.super_class = (Class)SUUIScrollingTabBarContentCollectionView;
    [(SUUIScrollingTabBarContentCollectionView *)&v4 layoutSubviews];
    self->_performingLayout = 0;
  }
  v3 = [(SUUIScrollingTabBarContentCollectionView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 scrollingTabBarContentCollectionViewDidLayoutSubviews:self];
  }
}

- (void)_reuseCell:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SUUIScrollingTabBarContentCollectionView.m", 36, @"%@ only supports cells of type SUUIViewControllerContainerCollectionViewCell.", self object file lineNumber description];
  }
  [v8 removeFromSuperview];
  v5 = [(SUUIScrollingTabBarContentCollectionView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v6 = [v8 indexPath];
    [v5 collectionView:self didEndDisplayingCell:v8 forItemAtIndexPath:v6];
  }
}

- (BOOL)isPerformingLayout
{
  return self->_performingLayout;
}

@end