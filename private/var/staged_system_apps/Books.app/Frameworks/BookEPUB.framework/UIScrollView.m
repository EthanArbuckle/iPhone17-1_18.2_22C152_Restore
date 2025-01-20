@interface UIScrollView
- (BOOL)be_isAnimatingScroll;
- (void)be_configureForBooks;
@end

@implementation UIScrollView

- (BOOL)be_isAnimatingScroll
{
  return [(UIScrollView *)self _isAnimatingScroll];
}

- (void)be_configureForBooks
{
  [(UIScrollView *)self setContentInsetAdjustmentBehavior:2];
  [(UIScrollView *)self setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)self setShowsVerticalScrollIndicator:0];
  [(UIScrollView *)self setPagingEnabled:0];
  [(UIScrollView *)self setScrollEnabled:0];
  [(UIScrollView *)self setBounces:0];
  [(UIScrollView *)self _setAutoScrollEnabled:0];
  [(UIScrollView *)self setZoomEnabled:0];

  [(UIScrollView *)self _setShowsBackgroundShadow:0];
}

@end