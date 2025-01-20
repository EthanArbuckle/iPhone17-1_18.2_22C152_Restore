@interface NUPageViewControllerScrollView
- (BOOL)accessibilityScroll:(int64_t)a3;
- (NUPageViewControllerScrollViewAccessibilityDelegate)accessibilityDelegate;
- (void)setAccessibilityDelegate:(id)a3;
@end

@implementation NUPageViewControllerScrollView

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if (a3 == 2)
  {
    v4 = [(NUPageViewControllerScrollView *)self accessibilityDelegate];
    [v4 accessibilityHandleRequestToGoForewardForPageViewControllerScrollView:self];
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v4 = [(NUPageViewControllerScrollView *)self accessibilityDelegate];
    [v4 accessibilityHandleRequestToGoBackForPageViewControllerScrollView:self];
LABEL_5:

    return 1;
  }
  return 0;
}

- (NUPageViewControllerScrollViewAccessibilityDelegate)accessibilityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessibilityDelegate);

  return (NUPageViewControllerScrollViewAccessibilityDelegate *)WeakRetained;
}

- (void)setAccessibilityDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end