@interface BCCardViewControllerScrollView
- (BCCardViewControllerScrollViewAccessibilityDelegate)accessibilityDelegate;
- (BOOL)touchesShouldCancelInContentView:(id)a3;
- (UIEdgeInsets)_accessibilityVisibleContentInset;
- (UIScrollView)contentScrollView;
- (void)accessibilityApplyScrollContent:(CGPoint)a3 sendScrollStatus:(BOOL)a4 animated:(BOOL)a5;
- (void)setAccessibilityDelegate:(id)a3;
- (void)setContentScrollView:(id)a3;
@end

@implementation BCCardViewControllerScrollView

- (UIEdgeInsets)_accessibilityVisibleContentInset
{
  v3 = [(BCCardViewControllerScrollView *)self accessibilityDelegate];
  [v3 accessibilityVisibleContentInsetForCardViewControllerScrollView:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)accessibilityApplyScrollContent:(CGPoint)a3 sendScrollStatus:(BOOL)a4 animated:(BOOL)a5
{
  double x = a3.x;
  float y = a3.y;
  double v8 = fmaxf(y, 0.0);
  id v9 = [(BCCardViewControllerScrollView *)self accessibilityDelegate];
  [v9 cardViewControllerScrollView:self accessibilityWantsToScrollToOffset:x v8];
}

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  id v4 = a3;
  double v5 = [(BCCardViewControllerScrollView *)self contentScrollView];
  unsigned __int8 v6 = [v5 touchesShouldCancelInContentView:v4];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BCCardViewControllerScrollView;
    BOOL v7 = [(BCCardViewControllerScrollView *)&v9 touchesShouldCancelInContentView:v4];
  }

  return v7;
}

- (UIScrollView)contentScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentScrollView);

  return (UIScrollView *)WeakRetained;
}

- (void)setContentScrollView:(id)a3
{
}

- (BCCardViewControllerScrollViewAccessibilityDelegate)accessibilityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessibilityDelegate);

  return (BCCardViewControllerScrollViewAccessibilityDelegate *)WeakRetained;
}

- (void)setAccessibilityDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessibilityDelegate);

  objc_destroyWeak((id *)&self->_contentScrollView);
}

@end