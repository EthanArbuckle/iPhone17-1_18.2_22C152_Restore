@interface SUUIScrollingSegmentedControllerCollectionView
- (BOOL)isPerformingLayout;
- (void)layoutSubviews;
@end

@implementation SUUIScrollingSegmentedControllerCollectionView

- (void)layoutSubviews
{
  if (self->_performingLayout)
  {
    v4.receiver = self;
    v4.super_class = (Class)SUUIScrollingSegmentedControllerCollectionView;
    [(SUUIScrollingSegmentedControllerCollectionView *)&v4 layoutSubviews];
  }
  else
  {
    self->_performingLayout = 1;
    v4.receiver = self;
    v4.super_class = (Class)SUUIScrollingSegmentedControllerCollectionView;
    [(SUUIScrollingSegmentedControllerCollectionView *)&v4 layoutSubviews];
    self->_performingLayout = 0;
  }
  v3 = [(SUUIScrollingSegmentedControllerCollectionView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 scrollingSegmentedControllerCollectionViewDidLayoutSubviews:self];
  }
}

- (BOOL)isPerformingLayout
{
  return self->_performingLayout;
}

@end