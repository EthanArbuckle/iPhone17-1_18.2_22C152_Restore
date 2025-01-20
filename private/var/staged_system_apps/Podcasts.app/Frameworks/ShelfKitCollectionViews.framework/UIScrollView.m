@interface UIScrollView
- (void)scrollToTopAnimated:(BOOL)a3;
@end

@implementation UIScrollView

- (void)scrollToTopAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIScrollView *)self contentOffset];
  double v6 = v5;
  [(UIScrollView *)self adjustedContentInset];

  -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", v3, v6, -v7);
}

@end