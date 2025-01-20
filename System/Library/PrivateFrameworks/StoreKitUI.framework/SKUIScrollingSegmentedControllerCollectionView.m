@interface SKUIScrollingSegmentedControllerCollectionView
- (BOOL)isPerformingLayout;
- (void)layoutSubviews;
@end

@implementation SKUIScrollingSegmentedControllerCollectionView

- (void)layoutSubviews
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIScrollingSegmentedControllerCollectionView layoutSubviews]";
}

- (BOOL)isPerformingLayout
{
  return self->_performingLayout;
}

@end