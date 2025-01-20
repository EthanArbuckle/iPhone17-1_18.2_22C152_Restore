@interface SBIconScrollView
- (BOOL)_scrollsToMakeFirstResponderVisible;
- (BOOL)cancelTouchTracking;
- (CGPoint)_roundedProposedContentOffset:(CGPoint)a3;
- (CGPoint)lastAnimatedScrollContentOffset;
- (void)_autoScrollAssistantUpdateContentOffset:(CGPoint)a3;
- (void)_setContentOffsetWithDecelerationAnimation:(CGPoint)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setLastAnimatedScrollContentOffset:(CGPoint)a3;
@end

@implementation SBIconScrollView

- (CGPoint)_roundedProposedContentOffset:(CGPoint)a3
{
  MEMORY[0x1F4166E00](self, a2, (__n128)a3, *(__n128 *)&a3.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  CGPoint v11 = a3;
  v8 = [(BSUIScrollView *)self delegate];
  v9 = v8;
  if (v8)
  {
    if (![v8 iconScrollView:self shouldSetContentOffset:&v11 animated:v4]) {
      goto LABEL_7;
    }
    double x = v11.x;
    double y = v11.y;
  }
  if (v4)
  {
    -[SBIconScrollView setLastAnimatedScrollContentOffset:](self, "setLastAnimatedScrollContentOffset:", x, y);
    double x = v11.x;
    double y = v11.y;
  }
  v10.receiver = self;
  v10.super_class = (Class)SBIconScrollView;
  -[BSUIScrollView setContentOffset:animated:](&v10, sel_setContentOffset_animated_, v4, x, y);
LABEL_7:
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(BSUIScrollView *)self delegate];
  v7 = v6;
  double v9 = x;
  double v10 = y;
  if (!v6) {
    goto LABEL_4;
  }
  if ([v6 iconScrollView:self shouldSetContentOffset:&v9 animated:0])
  {
    double x = v9;
    double y = v10;
LABEL_4:
    v8.receiver = self;
    v8.super_class = (Class)SBIconScrollView;
    -[BSUIScrollView setContentOffset:](&v8, sel_setContentOffset_, x, y);
  }
}

- (BOOL)cancelTouchTracking
{
  double v3 = [(BSUIScrollView *)self delegate];
  if ([(SBIconScrollView *)self isTracking])
  {
    [v3 iconScrollViewWillCancelTouchTracking:self];
    [(SBIconScrollView *)self _forcePanGestureToEndImmediately];
    [v3 iconScrollViewDidCancelTouchTracking:self];
  }
  else
  {
    [(SBIconScrollView *)self _forcePanGestureToEndImmediately];
  }

  return 1;
}

- (BOOL)_scrollsToMakeFirstResponderVisible
{
  return 0;
}

- (void)_setContentOffsetWithDecelerationAnimation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[SBIconScrollView setLastAnimatedScrollContentOffset:](self, "setLastAnimatedScrollContentOffset:");
  v6.receiver = self;
  v6.super_class = (Class)SBIconScrollView;
  -[SBIconScrollView _setContentOffsetWithDecelerationAnimation:](&v6, sel__setContentOffsetWithDecelerationAnimation_, x, y);
}

- (void)_autoScrollAssistantUpdateContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  objc_super v6 = [(BSUIScrollView *)self delegate];
  v7 = v6;
  if (!v6 || objc_msgSend(v6, "iconScrollView:shouldSetAutoscrollContentOffset:", self, x, y))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBIconScrollView;
    -[SBIconScrollView _autoScrollAssistantUpdateContentOffset:](&v8, sel__autoScrollAssistantUpdateContentOffset_, x, y);
  }
}

- (CGPoint)lastAnimatedScrollContentOffset
{
  double x = self->_lastAnimatedScrollContentOffset.x;
  double y = self->_lastAnimatedScrollContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastAnimatedScrollContentOffset:(CGPoint)a3
{
  self->_lastAnimatedScrollContentOffset = a3;
}

@end