@interface _UIScrollsToTopInitiatorView
- (BOOL)_shouldSeekHigherPriorityTouchTarget;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation _UIScrollsToTopInitiatorView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_UIScrollsToTopInitiatorView;
  v8 = -[UIView hitTest:withEvent:](&v17, sel_hitTest_withEvent_, v7, x, y);
  v9 = [(UIView *)self window];
  v10 = (void *)UIApp;
  v11 = [(UIView *)self _screen];
  v12 = [v10 _keyWindowForScreen:v11];

  if (v8
    && [(_UIScrollsToTopInitiatorView *)self _shouldSeekHigherPriorityTouchTarget]&& v9 != v12)
  {
    objc_msgSend(v12, "convertPoint:fromView:", self, x, y);
    v13 = objc_msgSend(v12, "_targetForStolenStatusBarTouchesAtPoint:withEvent:excludingWindow:", v7, v9);
    v14 = v13;
    if (v13)
    {
      id v15 = v13;

      v8 = v15;
    }
  }
  return v8;
}

- (BOOL)_shouldSeekHigherPriorityTouchTarget
{
  return 1;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  id v7 = [v6 allTouches];
  uint64_t v8 = [v7 count];

  if (v8 == 1)
  {
    v9 = [v24 anyObject];
    [v9 timestamp];
    double v11 = v10;
    [v9 initialTouchTimestamp];
    if (v11 - v12 <= 0.75)
    {
      v13 = [(UIView *)self window];
      v14 = [v24 anyObject];
      [v14 locationInView:0];
      objc_msgSend(v13, "convertPoint:toWindow:", 0);
      CGFloat v16 = v15;
      objc_super v17 = [(UIView *)self window];
      double v18 = _UIAdjustedLocationForScreenTouchLocation(v17, v16);
      double v20 = v19;

      v21 = (void *)UIApp;
      v22 = [(UIView *)self _screen];
      v23 = [v21 _keyWindowForScreen:v22];
      objc_msgSend(v23, "_scrollToTopViewsUnderScreenPointIfNecessary:resultHandler:", 0, v18, v20);

      [(id)UIApp _scrollsToTopInitiatorView:self touchesEnded:v24 withEvent:v6];
    }
  }
}

@end