@interface TSWPassThroughView
- (BOOL)acceptsHits;
- (TSWPassThroughViewDelegate)delegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setAcceptsHits:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation TSWPassThroughView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)TSWPassThroughView;
  v8 = -[TSWPassThroughView hitTest:withEvent:](&v12, "hitTest:withEvent:");
  mDelegate = self->mDelegate;
  if (mDelegate)
  {
    if (-[TSWPassThroughViewDelegate passthroughView:shouldAcceptHitAtPoint:onView:withEvent:](mDelegate, "passthroughView:shouldAcceptHitAtPoint:onView:withEvent:", self, v8, a4, x, y))return v8; {
    else
    }
      return 0;
  }
  else if (v8 == self && !self->mAcceptsHits)
  {
    return 0;
  }
  else
  {
    return v8;
  }
}

- (BOOL)acceptsHits
{
  return self->mAcceptsHits;
}

- (void)setAcceptsHits:(BOOL)a3
{
  self->mAcceptsHits = a3;
}

- (TSWPassThroughViewDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (TSWPassThroughViewDelegate *)a3;
}

@end