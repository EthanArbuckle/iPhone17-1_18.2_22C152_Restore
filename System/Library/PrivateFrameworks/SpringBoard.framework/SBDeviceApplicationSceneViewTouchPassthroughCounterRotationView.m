@interface SBDeviceApplicationSceneViewTouchPassthroughCounterRotationView
- (BOOL)shouldAllowTouchPassthroughIfTransparent;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setShouldAllowTouchPassthroughIfTransparent:(BOOL)a3;
@end

@implementation SBDeviceApplicationSceneViewTouchPassthroughCounterRotationView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SBDeviceApplicationSceneViewTouchPassthroughCounterRotationView;
  -[SBDeviceApplicationSceneViewTouchPassthroughCounterRotationView hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBDeviceApplicationSceneViewTouchPassthroughCounterRotationView *)objc_claimAutoreleasedReturnValue();
  if ([(SBDeviceApplicationSceneViewTouchPassthroughCounterRotationView *)self shouldAllowTouchPassthroughIfTransparent]&& v5 == self)
  {
    v6 = 0;
  }
  else
  {
    v6 = v5;
  }

  return v6;
}

- (BOOL)shouldAllowTouchPassthroughIfTransparent
{
  return self->_shouldAllowTouchPassthroughIfTransparent;
}

- (void)setShouldAllowTouchPassthroughIfTransparent:(BOOL)a3
{
  self->_shouldAllowTouchPassthroughIfTransparent = a3;
}

@end