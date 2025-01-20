@interface UIImmediateEdgeSwipeGestureRecognizer
- (void)_processTouches:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
@end

@implementation UIImmediateEdgeSwipeGestureRecognizer

- (void)_processTouches:(id)a3 withEvent:(id)a4
{
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
  {
    if (_UIEventHasEdgePendingOrLocked(a4)) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 5;
    }
    [(UIGestureRecognizer *)self setState:v6];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

@end