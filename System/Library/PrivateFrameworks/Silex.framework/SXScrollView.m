@interface SXScrollView
- (BOOL)_accessibilityScrollingEnabled;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canBecomeFocused;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isBouncing;
- (BOOL)shouldOccludeAccessibilityElement:(id)a3;
- (SXAXCustomRotorProvider)customRotorProvider;
- (SXScrollView)initWithFrame:(CGRect)a3;
- (SXScrollViewDelegate)scrollViewDelegate;
- (id)accessibilityCustomRotors;
- (void)setCustomRotorProvider:(id)a3;
- (void)setScrollViewDelegate:(id)a3;
@end

@implementation SXScrollView

- (SXScrollView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SXScrollView;
  v3 = -[SXScrollView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (SXAXCustomRotorProvider *)-[SXAXCustomRotorProvider initWithRootElement:]([SXAXCustomRotorProvider alloc], v3);
    customRotorProvider = v3->_customRotorProvider;
    v3->_customRotorProvider = v4;

    [(SXScrollView *)v3 setScrollsToTop:0];
  }
  return v3;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(SXScrollView *)self panGestureRecognizer];
  if (v5 != v4)
  {

LABEL_5:
    v10.receiver = self;
    v10.super_class = (Class)SXScrollView;
    BOOL v8 = [(SXScrollView *)&v10 gestureRecognizerShouldBegin:v4];
    goto LABEL_6;
  }
  v6 = [(SXScrollView *)self scrollViewDelegate];
  char v7 = [v6 shouldPreventDraggingForScrollView:self];

  if ((v7 & 1) == 0) {
    goto LABEL_5;
  }
  BOOL v8 = 0;
LABEL_6:

  return v8;
}

- (BOOL)isBouncing
{
  [(SXScrollView *)self contentOffset];
  if (round(v3) < 0.0) {
    return 1;
  }
  [(SXScrollView *)self contentOffset];
  double v6 = v5;
  [(SXScrollView *)self bounds];
  double v7 = round(v6 + CGRectGetHeight(v9));
  [(SXScrollView *)self contentSize];
  return v7 > round(v8);
}

- (id)accessibilityCustomRotors
{
  v2 = -[SXAXCustomRotorProvider graphSearchForAvailableCustomRotorsAndUpdateCache]((uint64_t)self->_customRotorProvider);
  double v3 = [v2 allObjects];

  return v3;
}

- (BOOL)shouldOccludeAccessibilityElement:(id)a3
{
  id v4 = a3;
  double v5 = [(SXScrollView *)self scrollViewDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(SXScrollView *)self scrollViewDelegate];
    char v8 = [v7 scrollView:self shouldOccludeAccessibilityElement:v4];
LABEL_9:
    BOOL v11 = v8;

    goto LABEL_10;
  }
  uint64_t v9 = [(SXScrollView *)self accessibilityContainer];
  if (v9)
  {
    double v7 = (void *)v9;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      uint64_t v10 = [v7 accessibilityContainer];

      double v7 = (void *)v10;
      if (!v10) {
        goto LABEL_7;
      }
    }
    char v8 = [v7 shouldOccludeAccessibilityElement:v4];
    goto LABEL_9;
  }
LABEL_7:
  BOOL v11 = 0;
LABEL_10:

  return v11;
}

- (BOOL)_accessibilityScrollingEnabled
{
  v11.receiver = self;
  v11.super_class = (Class)SXScrollView;
  BOOL v3 = [(SXScrollView *)&v11 _accessibilityScrollingEnabled];
  id v4 = [(SXScrollView *)self scrollViewDelegate];
  char v5 = objc_opt_respondsToSelector();

  char v6 = [(SXScrollView *)self scrollViewDelegate];
  double v7 = v6;
  if (v5)
  {
    char v8 = [v6 accessibilityShouldScrollForScrollView:self defaultValue:v3];
LABEL_5:
    LOBYTE(v3) = v8;

    return v3;
  }
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    double v7 = [(SXScrollView *)self scrollViewDelegate];
    char v8 = [v7 accessibilityShouldScrollForScrollView:self];
    goto LABEL_5;
  }
  return v3;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (SXScrollViewDelegate)scrollViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegate);
  return (SXScrollViewDelegate *)WeakRetained;
}

- (void)setScrollViewDelegate:(id)a3
{
}

- (SXAXCustomRotorProvider)customRotorProvider
{
  return self->_customRotorProvider;
}

- (void)setCustomRotorProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customRotorProvider, 0);
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
}

@end