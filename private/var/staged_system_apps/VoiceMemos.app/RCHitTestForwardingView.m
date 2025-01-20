@interface RCHitTestForwardingView
- (UIView)targetView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setTargetView:(id)a3;
@end

@implementation RCHitTestForwardingView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return [(RCHitTestForwardingView *)self targetView];
}

- (UIView)targetView
{
  return self->_targetView;
}

- (void)setTargetView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end