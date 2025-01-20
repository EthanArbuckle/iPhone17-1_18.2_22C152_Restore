@interface IMPassthroughView
- (BOOL)acceptsHits;
- (IMPassthroughViewDelegate)delegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setAcceptsHits:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation IMPassthroughView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IMPassthroughView;
  -[IMPassthroughView hitTest:withEvent:](&v15, "hitTest:withEvent:", v7, x, y);
  v8 = (IMPassthroughView *)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained passthroughView:self shouldAcceptHitAtPoint:v8 onView:v7 withEvent:x, y])v11 = v8; {
    else
    }
      v11 = 0;
  }
  else if (v8 == self && !self->_acceptsHits)
  {
    v11 = 0;
  }
  else
  {
    v11 = v8;
  }
  v13 = v11;

  return v13;
}

- (BOOL)acceptsHits
{
  return self->_acceptsHits;
}

- (void)setAcceptsHits:(BOOL)a3
{
  self->_acceptsHits = a3;
}

- (IMPassthroughViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IMPassthroughViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end